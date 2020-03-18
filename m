Return-Path: virtio-comment-return-1146-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DADC3985DAB
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Mar 2020 18:29:24 +0000 (UTC)
From: Vitaly Mireyno <vmireyno@marvell.com>
Date: Wed, 18 Mar 2020 18:29:19 +0000
Message-ID: <BN6PR1801MB206759357571FC19A34A1673C5F70@BN6PR1801MB2067.namprd18.prod.outlook.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH v7] virtio-net: Add support for the flexible driver
 notification structure.
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
To: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Ariel Elior <aelior@marvell.com>, Cornelia Huck <cohuck@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Currently, the driver notification (available buffer notification) has a fi=
xed structure, which includes the virtqueue number.
For PCI transport, if notify_off_multiplier > 0, the VQ number can potentia=
lly be derived by the device from the Queue Notify address, so providing vi=
rtqueue number as part of the data may be redundant.
Some devices benefit from receiving an additional data with driver notifica=
tions. This data can optionally replace the vqn field in the driver notific=
ation structure.
In its simplest form, it would be sufficient for this data to be a per-devi=
ce constant value.

Changes from v6:
 * The feature definition is moved to a generic section, referring to PCI-s=
pecific details.

Signed-off-by: Vitaly Mireyno <vmireyno@marvell.com>
---
 content.tex | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/content.tex b/content.tex
index b91a132..163c47e 100644
--- a/content.tex
+++ b/content.tex
@@ -965,6 +965,8 @@ \subsubsection{Notification structure layout}\label{sec=
:Virtio Transport Options
 struct virtio_pci_notify_cap {
         struct virtio_pci_cap cap;
         le32 notify_off_multiplier; /* Multiplier for queue_notify_off. */
+        le16 notify_data; /* Data to be placed in the vqn field */
+        le16 padding; /* Pad to a dword */
 };
 \end{lstlisting}
=20
@@ -984,6 +986,16 @@ \subsubsection{Notification structure layout}\label{se=
c:Virtio Transport Options
 the same Queue Notify address for all queues.
 \end{note}
=20
+\field{notify_data} is the data that the driver will set in the available
+buffer notification (instead of the virtqueue number), if
+VIRTIO_NET_F_NOTIF_CONFIG_DATA has been negotiated.
+
+\begin{note}
+If \field{notify_off_multiplier} > 0, the virtqueue number can potentially=
 be
+derived by the device from the Queue Notify address, so \field{vqn} may be
+redundant.
+\end{note}
+
 \devicenormative{\paragraph}{Notification capability}{Virtio Transport Opt=
ions / Virtio Over PCI Bus / PCI Device Layout / Notification capability}
 The device MUST present at least one notification capability.
=20
@@ -1020,6 +1032,9 @@ \subsubsection{Notification structure layout}\label{s=
ec:Virtio Transport Options
 cap.length >=3D queue_notify_off * notify_off_multiplier + 4
 \end{lstlisting}
=20
+If the device offers VIRTIO_NET_F_NOTIF_CONFIG_DATA, it MUST set
+\field{notify_off_multiplier} > 0 in at least one capability.
+
 \subsubsection{ISR status capability}\label{sec:Virtio Transport Options /=
 Virtio Over PCI Bus / PCI Device Layout / ISR status capability}
=20
 The VIRTIO_PCI_CAP_ISR_CFG capability
@@ -1519,6 +1534,12 @@ \subsubsection{Available Buffer Notifications}\label=
{sec:Virtio Transport Option
 See \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device L=
ayout / Notification capability}
 for how to calculate the Queue Notify address.
=20
+\drivernormative{\paragraph}{Available Buffer Notifications}{Virtio Transp=
ort Options / Virtio Over PCI Bus / PCI-specific Initialization And Device =
Operation / Available Buffer Notifications}
+If VIRTIO_NET_F_NOTIF_CONFIG_DATA has been negotiated and
+\field{notify_off_multiplier} > 0, the driver MUST set the 'virtqueue numb=
er'
+field of the available buffer notification structure to the \field{notify_=
data}
+value.
+
 \subsubsection{Used Buffer Notifications}\label{sec:Virtio Transport Optio=
ns / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation=
 / Used Buffer Notifications}
=20
 If a used buffer notification is necessary for a virtqueue, the device wou=
ld typically act as follows:
@@ -2895,6 +2916,10 @@ \subsection{Feature bits}\label{sec:Device Types / N=
etwork Device / Feature bits
 \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
     channel.
=20
+\item[VIRTIO_NET_F_NOTIF_CONFIG_DATA(57)] Driver provides extra data with
+    available buffer notifications, to aid in notification processing by t=
he
+    device.
+
 \item[VIRTIO_NET_F_GUEST_HDRLEN(59)] Driver can provide the exact \field{h=
dr_len}
     value. Device benefits from knowing the exact header length.
=20
@@ -4180,6 +4205,33 @@ \subsubsection{Legacy Interface: Framing Requirement=
s}\label{sec:Device
 See \ref{sec:Basic
 Facilities of a Virtio Device / Virtqueues / Message Framing}.
=20
+\subsubsection{Driver Notifications}\label{sec:Device Types / Network Devi=
ce / Device Operation / Driver Notifications}
+As mentioned in section \ref{sec:Virtqueues / Driver notifications}, when =
the
+driver is required to send an available buffer notification to the device,=
 it
+always sends the virtqueue number to be notified. The method of delivering
+notifications is transport specific. With the PCI transport, the device ca=
n
+optionally provide a distinct per-virtqueue address for driver notificatio=
ns
+(Queue Notify address). In this case, the virtqueue number can potentially=
 be
+derived by the device from the Queue Notify address. For devices, that pro=
vide
+per-virtqueue Queue Notify addresses and are able to derive the virtqueue =
number
+from that address, the virtqueue number in the notification data is redund=
ant.
+On the other hand, some devices can benefit from receiving additional data=
 with
+driver notifications. An example could be a hardware device implementing m=
ultiple
+protocols (with virtio being one of them), so the extra notification data =
could
+serve as a notification type indication or a protocol indication.
+
+VIRTIO_NET_F_NOTIF_CONFIG_DATA feature can be used with transports that su=
pport
+a similar driver notifications delivery method, and it allows providing ex=
tra
+data by the driver to the device. The definition of the data, that the dri=
ver
+provides to the device instead of the virtqueue number, is transport speci=
fic.
+
+For more details about driver notifications over PCI see \ref{sec:Virtio
+Transport Options / Virtio Over PCI Bus / PCI Device Layout / Notification=
 capability}.
+
+\drivernormative{\paragraph}{Driver Notifications}{Device Types / Network =
Device / Device Operation / Driver Notifications}
+The driver SHOULD accept the VIRTIO_NET_F_NOTIF_CONFIG_DATA feature if it =
has
+been offered.
+
 \section{Block Device}\label{sec:Device Types / Block Device}
=20
 The virtio block device is a simple virtual block device (ie.
--

This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=
=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

