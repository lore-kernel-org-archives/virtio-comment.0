Return-Path: virtio-comment-return-1436-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A6D019842AE
	for <virtio-comment@lists.oasis-open.org>; Sun, 30 Aug 2020 21:16:18 +0000 (UTC)
From: Vitaly Mireyno <vmireyno@marvell.com>
Date: Sun, 30 Aug 2020 21:16:12 +0000
Message-ID: <BN6PR1801MB20673C85E4585FCB53C17927C5500@BN6PR1801MB2067.namprd18.prod.outlook.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH v8] virtio-net: Add support for the flexible driver
 notification structure.
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
To: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Ariel Elior <aelior@marvell.com>
List-ID: <virtio-comment.lists.oasis-open.org>

When the driver is required to send an available buffer notification to the=
 device, it sends the virtqueue number to be notified.
With this new feature, the device can optionally provide a per-virtqueue va=
lue for the driver to use in driver notifications, instead of the virtqueue=
 number.
Some devices may benefit from this flexibility by providing, for example, a=
n internal virtqueue identifier, or an internal offset related to the virtq=
ueue number.

Changes from v6:
 * Changed the feature definition such that the value, that the driver sets=
 in the vqn field, is per-virtqueue

Signed-off-by: Vitaly Mireyno <vmireyno@marvell.com>
---
 content.tex | 45 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/content.tex b/content.tex
index 91735e3..09043e6 100644
--- a/content.tex
+++ b/content.tex
@@ -824,6 +824,8 @@ \subsubsection{Common configuration structure layout}\l=
abel{sec:Virtio Transport
         le64 queue_desc;                /* read-write */
         le64 queue_driver;              /* read-write */
         le64 queue_device;              /* read-write */
+        le16 queue_notify_data;         /* read-only for driver */
+        le16 padding;
 };
 \end{lstlisting}
=20
@@ -890,6 +892,18 @@ \subsubsection{Common configuration structure layout}\=
label{sec:Virtio Transport
=20
 \item[\field{queue_device}]
         The driver writes the physical address of Device Area here.  See s=
ection \ref{sec:Basic Facilities of a Virtio Device / Virtqueues}.
+
+\item[\field{queue_notify_data}]
+        If VIRTIO_NET_F_NOTIF_CONFIG_DATA has been negotiated, the driver =
will use this value
+        to put it in the 'virtqueue number' field in the available buffer =
notification structure.
+        See section \ref{sec:Virtio Transport Options / Virtio Over PCI Bu=
s / PCI-specific Initialization And Device Operation / Available Buffer Not=
ifications}.
+        \begin{note}
+        This field provides the device with flexibility to determine how v=
irtqueues
+        will be referred to in available buffer notifications.
+        In a trivial case the device can set \field{queue_notify_data}=3Dv=
qn. Some devices
+        may benefit from providing another value, for example an internal =
virtqueue
+        identifier, or an internal offset related to the virtqueue number.
+        \end{note}
 \end{description}
=20
 \devicenormative{\paragraph}{Common configuration structure layout}{Virtio=
 Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common confi=
guration structure layout}
@@ -940,7 +954,7 @@ \subsubsection{Common configuration structure layout}\l=
abel{sec:Virtio Transport
=20
 \drivernormative{\paragraph}{Common configuration structure layout}{Virtio=
 Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common confi=
guration structure layout}
=20
-The driver MUST NOT write to \field{device_feature}, \field{num_queues}, \=
field{config_generation} or \field{queue_notify_off}.
+The driver MUST NOT write to \field{device_feature}, \field{num_queues}, \=
field{config_generation}, \field{queue_notify_off} or \field{queue_notify_d=
ata}.
=20
 If VIRTIO_F_RING_PACKED has been negotiated,
 the driver MUST NOT write the value 0 to \field{queue_size}.
@@ -1519,6 +1533,10 @@ \subsubsection{Available Buffer Notifications}\label=
{sec:Virtio Transport Option
 See \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device L=
ayout / Notification capability}
 for how to calculate the Queue Notify address.
=20
+\drivernormative{\paragraph}{Available Buffer Notifications}{Virtio Transp=
ort Options / Virtio Over PCI Bus / PCI-specific Initialization And Device =
Operation / Available Buffer Notifications}
+If VIRTIO_NET_F_NOTIF_CONFIG_DATA has been negotiated, the driver MUST set=
 the 'virtqueue number'
+field of the available buffer notification structure to the \field{queue_n=
otify_data} value.
+
 \subsubsection{Used Buffer Notifications}\label{sec:Virtio Transport Optio=
ns / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation=
 / Used Buffer Notifications}
=20
 If a used buffer notification is necessary for a virtqueue, the device wou=
ld typically act as follows:
@@ -2895,6 +2913,9 @@ \subsection{Feature bits}\label{sec:Device Types / Ne=
twork Device / Feature bits
 \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
     channel.
=20
+\item[VIRTIO_NET_F_NOTIF_CONFIG_DATA(57)] Driver uses the data provided by=
 the
+    device as a virtqueue identifier in available buffer notifications.
+
 \item[VIRTIO_NET_F_GUEST_HDRLEN(59)] Driver can provide the exact \field{h=
dr_len}
     value. Device benefits from knowing the exact header length.
=20
@@ -4180,6 +4201,28 @@ \subsubsection{Legacy Interface: Framing Requirement=
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
+sends the virtqueue number to be notified. The method of delivering notifi=
cations
+is transport specific.
+With the PCI transport, the device can optionally provide a per-virtqueue =
value
+for the driver to use in driver notifications, instead of the virtqueue nu=
mber.
+Some devices may benefit from this flexibility by providing, for example,
+an internal virtqueue identifier, or an internal offset related to the vir=
tqueue number.
+
+The VIRTIO_NET_F_NOTIF_CONFIG_DATA feature indicates the availability of s=
uch value.
+The definition of the data to be provided by the driver in driver notifica=
tion and
+the method for delivering it is transport specific.
+
+For more details about driver notifications over PCI see \ref{sec:Virtio T=
ransport Options / Virtio Over PCI Bus / PCI-specific Initialization And De=
vice Operation / Available Buffer Notifications}.
+
+\drivernormative{\paragraph}{Driver Notifications}{Device Types / Network =
Device / Device Operation / Driver Notifications}
+The driver SHOULD accept the VIRTIO_NET_F_NOTIF_CONFIG_DATA feature if it =
has
+been offered.
+
+If the VIRTIO_NET_F_NOTIF_CONFIG_DATA feature has been negotiated, the dri=
ver MUST provide the transport-specific value for the virtqueue number with=
 driver notifications.
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

