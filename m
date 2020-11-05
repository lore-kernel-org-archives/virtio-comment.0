Return-Path: virtio-comment-return-1499-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 03322986168
	for <virtio-comment@lists.oasis-open.org>; Thu,  5 Nov 2020 22:41:48 +0000 (UTC)
From: Vitaly Mireyno <vmireyno@marvell.com>
Date: Thu, 5 Nov 2020 22:41:42 +0000
Message-ID: <BN6PR1801MB20674853EEEB69E982B02C8BC5EE0@BN6PR1801MB2067.namprd18.prod.outlook.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH v9] virtio-net: Add support for the flexible driver
 notification structure.
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
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

Changes from v8:
 * Incorporated comments for v8:
     - moved the feature from a network device to a global section
     - few minor changes

Signed-off-by: Vitaly Mireyno <vmireyno@marvell.com>
---
 content.tex | 46 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/content.tex b/content.tex
index 91735e3..bf50bfd 100644
--- a/content.tex
+++ b/content.tex
@@ -824,6 +824,7 @@ \subsubsection{Common configuration structure layout}\l=
abel{sec:Virtio Transport
         le64 queue_desc;                /* read-write */
         le64 queue_driver;              /* read-write */
         le64 queue_device;              /* read-write */
+        le16 queue_notify_data;         /* read-only for driver */
 };
 \end{lstlisting}
=20
@@ -890,6 +891,19 @@ \subsubsection{Common configuration structure layout}\=
label{sec:Virtio Transport
=20
 \item[\field{queue_device}]
         The driver writes the physical address of Device Area here.  See s=
ection \ref{sec:Basic Facilities of a Virtio Device / Virtqueues}.
+
+\item[\field{queue_notify_data}]
+        This field exists only if VIRTIO_F_NOTIF_CONFIG_DATA has been nego=
tiated.
+        The driver will use this value to put it in the 'virtqueue number'=
 field
+        in the available buffer notification structure.
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
@@ -1519,6 +1533,15 @@ \subsubsection{Available Buffer Notifications}\label=
{sec:Virtio Transport Option
 See \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device L=
ayout / Notification capability}
 for how to calculate the Queue Notify address.
=20
+\drivernormative{\paragraph}{Available Buffer Notifications}{Virtio Transp=
ort Options / Virtio Over PCI Bus / PCI-specific Initialization And Device =
Operation / Available Buffer Notifications}
+If VIRTIO_F_NOTIF_CONFIG_DATA has been negotiated:
+\begin{itemize}
+\item If VIRTIO_F_NOTIFICATION_DATA has not been negotiated, the driver MU=
ST use the
+\field{queue_notify_data} value instead of the virtqueue index.
+\item If VIRTIO_F_NOTIFICATION_DATA has been negotiated, the driver MUST s=
et the
+\field{vqn} field to the \field{queue_notify_data} value.
+\end{itemize}
+
 \subsubsection{Used Buffer Notifications}\label{sec:Virtio Transport Optio=
ns / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation=
 / Used Buffer Notifications}
=20
 If a used buffer notification is necessary for a virtqueue, the device wou=
ld typically act as follows:
@@ -6132,6 +6155,25 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved F=
eature Bits}
   that the driver passes extra data (besides identifying the virtqueue)
   in its device notifications.
   See \ref{sec:Virtqueues / Driver notifications}~\nameref{sec:Virtqueues =
/ Driver notifications}.
+
+  \item[VIRTIO_F_NOTIF_CONFIG_DATA(39)] This feature indicates that the dr=
iver
+  uses the data provided by the device as a virtqueue identifier in availa=
ble
+  buffer notifications.
+  As mentioned in section \ref{sec:Virtqueues / Driver notifications}, whe=
n the
+  driver is required to send an available buffer notification to the devic=
e, it
+  sends the virtqueue number to be notified. The method of delivering
+  notifications is transport specific.
+  With the PCI transport, the device can optionally provide a per-virtqueu=
e value
+  for the driver to use in driver notifications, instead of the virtqueue =
number.
+  Some devices may benefit from this flexibility by providing, for example=
,
+  an internal virtqueue identifier, or an internal offset related to the
+  virtqueue number.
+
+  This feature indicates the availability of such value. The definition of=
 the
+  data to be provided in driver notification and the delivery method is
+  transport specific.
+  For more details about driver notifications over PCI see \ref{sec:Virtio=
 Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And =
Device Operation / Available Buffer Notifications}.
+
 \end{description}
=20
 \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
@@ -6166,6 +6208,8 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Fe=
ature Bits}
 or partially reset, and even without re-negotiating
 VIRTIO_F_SR_IOV after the reset.
=20
+A driver SHOULD accept VIRTIO_F_NOTIF_CONFIG_DATA if it is offered.
+
 \devicenormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
=20
 A device MUST offer VIRTIO_F_VERSION_1.  A device MAY fail to operate furt=
her
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

