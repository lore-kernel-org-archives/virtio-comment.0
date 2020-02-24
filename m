Return-Path: virtio-comment-return-1096-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B2B53985CD3
	for <virtio-comment@lists.oasis-open.org>; Mon, 24 Feb 2020 17:32:58 +0000 (UTC)
From: Vitaly Mireyno <vmireyno@marvell.com>
Date: Mon, 24 Feb 2020 17:32:53 +0000
Message-ID: <BN6PR1801MB20676FB0CE1EE794D81B177EC5EC0@BN6PR1801MB2067.namprd18.prod.outlook.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH v2] virtio-net: Add support for the flexible driver
 notification
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
To: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Ariel Elior <aelior@marvell.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Currently, the driver notification (available buffer notification) has a fi=
xed structure.
If VIRTIO_F_NOTIFICATION_DATA has been negotiated, it includes: vqn, next_o=
ff and next_wrap.
If notify_off_multiplier > 0, the VQ number can be derived by the device fr=
om the Queue Notify address, so vqn may be redundant.

Some devices benefit from receiving an additional data with driver notifica=
tions. This data can optionally replace the vqn field in the driver notific=
ation structure.
In its simplest form, it would be sufficient for this data to be a per-devi=
ce constant value.

Changes from v1 - added more details about motivation and usage examples.

Signed-off-by: Vitaly Mireyno <vmireyno@marvell.com>
---
 content.tex | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/content.tex b/content.tex
index b91a132..5abff30 100644
--- a/content.tex
+++ b/content.tex
@@ -965,6 +965,9 @@ \subsubsection{Notification structure layout}\label{sec=
:Virtio Transport Options
 struct virtio_pci_notify_cap {
         struct virtio_pci_cap cap;
         le32 notify_off_multiplier; /* Multiplier for queue_notify_off. */
+        le16 notify_data; /* Data to be placed in the vqn field */
+        u8 notify_data_valid;
+        u8 padding; /* Pad to a dword */
 };
 \end{lstlisting}
=20
@@ -984,6 +987,20 @@ \subsubsection{Notification structure layout}\label{se=
c:Virtio Transport Options
 the same Queue Notify address for all queues.
 \end{note}
=20
+If \field{notify_data_valid} !=3D 0, the driver will set the \field{vqn} f=
ield
+in the available buffer notification structure to the \field{notify_data} =
value.
+
+\begin{note}
+If \field{notify_off_multiplier} > 0, the virtqueue number can potentially=
 be
+derived by the device from the Queue Notify address, so \field{vqn} may be
+redundant. Some devices benefit from receiving the additional data with dr=
iver
+notifications. An example could be a hardware device implementing multiple
+protocols (with virtio being one of them), so extra notification data coul=
d serve as
+a notification type indication or a protocol indication.
+Another example could be using shared hardware memory space for driver not=
ifications
+for multiple virtio devices in a trusted environment.
+\end{note}
+
 \devicenormative{\paragraph}{Notification capability}{Virtio Transport Opt=
ions / Virtio Over PCI Bus / PCI Device Layout / Notification capability}
 The device MUST present at least one notification capability.
=20
@@ -1020,6 +1037,12 @@ \subsubsection{Notification structure layout}\label{=
sec:Virtio Transport Options
 cap.length >=3D queue_notify_off * notify_off_multiplier + 4
 \end{lstlisting}
=20
+The device MAY set \field{notify_data_valid} to any non-zero value, to req=
uest
+the driver to set the \field{vqn} to the \field{notify_data} value.
+If the device sets \field{notify_data_valid} to a non-zero value, it MUST =
set
+\field{notify_data} to a valid value.
+For a normal operation, the device MUST set \field{notify_data_valid} to z=
ero.
+
 \subsubsection{ISR status capability}\label{sec:Virtio Transport Options /=
 Virtio Over PCI Bus / PCI Device Layout / ISR status capability}
=20
 The VIRTIO_PCI_CAP_ISR_CFG capability
@@ -1519,6 +1542,11 @@ \subsubsection{Available Buffer Notifications}\label=
{sec:Virtio Transport Option
 See \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device L=
ayout / Notification capability}
 for how to calculate the Queue Notify address.
=20
+\drivernormative{\paragraph}{Available Buffer Notifications}{Virtio Transp=
ort Options / Virtio Over PCI Bus / PCI-specific Initialization And Device =
Operation / Available Buffer Notifications}
+If VIRTIO_F_NOTIFICATION_DATA has been negotiated, and if
+\field{notify_data_valid} !=3D 0, the driver MUST set the \field{vqn} fiel=
d of
+the available buffer notification structure to the \field{notify_data} val=
ue.
+
 \subsubsection{Used Buffer Notifications}\label{sec:Virtio Transport Optio=
ns / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation=
 / Used Buffer Notifications}
=20
 If a used buffer notification is necessary for a virtqueue, the device wou=
ld typically act as follows:
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

