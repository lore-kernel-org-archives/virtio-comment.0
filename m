Return-Path: virtio-comment-return-1665-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 55FA79861BF
	for <virtio-comment@lists.oasis-open.org>; Mon, 25 Jan 2021 05:52:13 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 25 Jan 2021 13:52:02 +0800
Message-Id: <20210125055202.29001-1-jasowang@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH V2] virtio-net: introduce admin control virtqueue
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: mst@redhat.com, cohuck@redhat.com, Jason Wang <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

When implementing virtual devices like SR-IOV or sub-function. We're
suffering from several issues:

- There's no management interface for management device to
  configure features, attributes for a virtual device
- Per virtual device control virtqueue could be very expensive as the
  number of virtual devices could be very large
- Virtualize per virtual device's control virtqueue could be very
  challenge as we need the support of DMA isolation at queue level

So this patch introduces the feature of VIRTIO_NET_CTRL_ADMIN_VQ. This
allows the device to implement a single admin control virtqueue to
manage the features and attributes for a specific virtual device.

The idea is simple, a new virtual device id is introduced on top of
the existing virtio_net_ctrl structure. This id is transport or device
specific to uniquely identify a management or virtual device.

With this, we get a way of using management device (PF) to configure
per virtual device features and attributes. And since the admin
control virtqueue belongs to management device (PF), the DMA is
naturally isolated at device level instead of the queue level for per
virtual device control vq.

When the admin cvq is offered by management device and normal cvq is
offered by virtual device. A new command class is introduced decide
whether or not to accept commands from normal cvq for a virtual
device.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
Changes from V1:
- use 'virtual device' instead of 'function'
- introuce trust command
- clairfy that the admin cvq could be used to configure management
  device itself
---
 content.tex | 59 ++++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 56 insertions(+), 3 deletions(-)

diff --git a/content.tex b/content.tex
index 620c0e2..989b4f6 100644
--- a/content.tex
+++ b/content.tex
@@ -2940,6 +2940,9 @@ \subsection{Feature bits}\label{sec:Device Types / Ne=
twork Device / Feature bits
 \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
     channel.
=20
+\item[VIRTIO_NET_F_ADMIN_CTRL_VQ(56)] Admin control channel is
+    available.
+
 \item[VIRTIO_NET_F_HASH_REPORT(57)] Device can report per-packet hash
     value and a type of calculated hash.
=20
@@ -3840,11 +3843,12 @@ \subsubsection{Processing of Incoming Packets}\labe=
l{sec:Device Types / Network
 \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device =
/ Device Operation / Control Virtqueue}
=20
 The driver uses the control virtqueue (if VIRTIO_NET_F_CTRL_VQ is
-negotiated) to send commands to manipulate various features of
-the device which would not easily map into the configuration
-space.
+negotiated but VIRTIO_NET_F_ADMIN_CTRL_VQ is not negotiated) to send
+commands to manipulate various features of the device which would not
+easily map into the configuration space.
=20
 All commands are of the following form:
+is not negotiated:
=20
 \begin{lstlisting}
 struct virtio_net_ctrl {
@@ -3864,6 +3868,29 @@ \subsubsection{Control Virtqueue}\label{sec:Device T=
ypes / Network Device / Devi
 do except issue a diagnostic if \field{ack} is not
 VIRTIO_NET_OK.
=20
+When both VIRTIO_NET_F_CTRL_VQ and VIRTIO_NET_F_ADMIN_CTRL_VQ are
+negotiated, the driver can use the admin control virtqueue of the
+management device to manipulate features of individual virtual devices
+where the control virtqueue is not easily implemented. The definition
+of management device and virtual device is transport or device
+specific. E.g in the case of PCI SR-IOV, the management device is
+implemented via the physical function (PF), then the virtual device is
+the virtual function (VF) in this case.
+
+All commands are of the following form:
+
+\begin{lstlisting}
+struct virtio_net_admin_ctrl {
+        u32 virtual_device_id;
+        struct virtio_net_ctrl ctrl;
+};
+\end{lstlisting}
+
+The \field{virtual_device_id} is an unique transport or device specific
+identifier for a virtual device or management device. E.g for the case
+of PCI SR-IOV, it's the PCI function id. Management device MUST
+reserve 0 for \field{virtual_device_id} to identify itself.
+
 \paragraph{Packet Receive Filtering}\label{sec:Device Types / Network Devi=
ce / Device Operation / Control Virtqueue / Packet Receive Filtering}
 \label{sec:Device Types / Network Device / Device Operation / Control Virt=
queue / Setting Promiscuous Mode}%old label for latexdiff
=20
@@ -4308,6 +4335,32 @@ \subsubsection{Control Virtqueue}\label{sec:Device T=
ypes / Network Device / Devi
 according to the native endian of the guest rather than
 (necessarily when not using the legacy interface) little-endian.
=20
+\paragraph{Setting Trust for Virtual Device}\label{sec:Device Types / Netw=
ork Device / Device Operation / Control Virtqueue / Setting Trust for Virtu=
al Device}
+
+If the VIRTIO_NET_F_ADMIN_CTRL_VQ is negotiated, the management device
+can accept operations via the control vq from the trusted virtual
+device.
+
+\begin{lstlisting}
+#define VIRTIO_NET_ADMIN_CTRL_TRUST 0
+ #define VIRTIO_NET_ADMIN_CTRL_TRUST_ENABLE 0
+\end{lstlisting}
+
+\devicenormative{\subparagraph}{Setting Trust for Virtual Device}{Device T=
ypes / Network Device / Device Operation / Control Virtqueue / Setting Trus=
t for Virtual Device}
+
+If the VIRTIO_NET_F_ADMIN_CTRL_VQ has been negotiated, the device MUST
+support VIRTIO_NET_ADMIN_CTRL_TRUST class
+command. VIRTIO_NET_ADMIN_CTRL_TRUST_ENABLE turns trust for the
+control virtqueue of a specific virtual device on and off. The command
+specific data is one byte containing 0(off) or 1(on).  When trust is
+off the device MUST fail any operations from the control virtqueue of
+the virtual device. The management device MUST NOT trust any virtual
+devices after reset.
+
+\drivernormative{\subparagraph}{Setting Trust for Virtual Device}{Device T=
ypes / Network Device / Device Operation / Control Virtqueue / Setting Trus=
t for Virtual Device}
+
+A driver SHOULD negotiate VIRTIO_NET_F_ADMIN_CTRL_VQ if the device
+offers it.
=20
 \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
 Types / Network Device / Legacy Interface: Framing Requirements}
--=20
2.25.1


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

