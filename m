Return-Path: virtio-comment-return-1603-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 62C9198630D
	for <virtio-comment@lists.oasis-open.org>; Mon, 28 Dec 2020 11:22:30 +0000 (UTC)
From: Vitaly Mireyno <vmireyno@marvell.com>
Date: Mon, 28 Dec 2020 11:22:10 +0000
Message-ID: <BN6PR1801MB2067CD1555DDB8692FC9FB96C5D91@BN6PR1801MB2067.namprd18.prod.outlook.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH v2] virtio-net: fix Driver Notification description related to
 VIRTIO_F_NOTIF_CONFIG_DATA
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
To: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>, Ariel Elior <aelior@marvell.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Incorporated comments for the "[PATCH v9] virtio-net: Add support for the f=
lexible driver notification structure".
Made Driver Notifications description more consistent throughout the docume=
nt wrt VIRTIO_F_NOTIF_CONFIG_DATA.

Changes from v1:
 * Rephrased "Driver Notifications" and "Available Buffer Notifications" se=
ctions to avoid repetitions.


Signed-off-by: Vitaly Mireyno <vmireyno@marvell.com>
---
 content.tex | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/content.tex b/content.tex
index 00bc050..4fb6702 100644
--- a/content.tex
+++ b/content.tex
@@ -337,8 +337,12 @@ \section{Driver Notifications} \label{sec:Virtqueues /=
 Driver notifications}
 notification to the device.
=20
 When VIRTIO_F_NOTIFICATION_DATA has not been negotiated,
-this notification involves sending the
-virtqueue number to the device (method depending on the transport).
+this notification involves sending to the device the vqn
+(method depending on the transport).
+\begin{description}
+\item [vqn] Either the virtqueue number to be notified or, if VIRTIO_F_NOT=
IF_CONFIG_DATA
+      has been negotiated, the queue notification data.
+\end{description}
=20
 However, some devices benefit from the ability to find out the
 amount of available data in the queue without accessing the virtqueue in m=
emory:
@@ -349,7 +353,7 @@ \section{Driver Notifications} \label{sec:Virtqueues / =
Driver notifications}
 the following information:
=20
 \begin{description}
-\item [vqn] VQ number to be notified.
+\item [vqn]
 \item [next_off] Offset
       within the ring where the next available ring entry
       will be written.
@@ -1531,8 +1535,7 @@ \subsubsection{Available Buffer Notifications}\label{=
sec:Virtio Transport Option
=20
 When VIRTIO_F_NOTIFICATION_DATA has not been negotiated,
 the driver sends an available buffer notification to the device by writing
-the 16-bit virtqueue index
-of this virtqueue to the Queue Notify address.
+the 16-bit vqn to the Queue Notify address.
=20
 When VIRTIO_F_NOTIFICATION_DATA has been negotiated,
 the driver sends an available buffer notification to the device by writing
@@ -1546,13 +1549,8 @@ \subsubsection{Available Buffer Notifications}\label=
{sec:Virtio Transport Option
 for how to calculate the Queue Notify address.
=20
 \drivernormative{\paragraph}{Available Buffer Notifications}{Virtio Transp=
ort Options / Virtio Over PCI Bus / PCI-specific Initialization And Device =
Operation / Available Buffer Notifications}
-If VIRTIO_F_NOTIF_CONFIG_DATA has been negotiated:
-\begin{itemize}
-\item If VIRTIO_F_NOTIFICATION_DATA has not been negotiated, the driver MU=
ST use the
-\field{queue_notify_data} value instead of the virtqueue index.
-\item If VIRTIO_F_NOTIFICATION_DATA has been negotiated, the driver MUST s=
et the
-\field{vqn} field to the \field{queue_notify_data} value.
-\end{itemize}
+If VIRTIO_F_NOTIF_CONFIG_DATA has been negotiated, the driver MUST use the
+\field{queue_notify_data} value as a queue notification data.
=20
 \subsubsection{Used Buffer Notifications}\label{sec:Virtio Transport Optio=
ns / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation=
 / Used Buffer Notifications}
=20
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

