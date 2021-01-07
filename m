Return-Path: virtio-comment-return-1625-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BF8E39864E7
	for <virtio-comment@lists.oasis-open.org>; Thu,  7 Jan 2021 17:39:53 +0000 (UTC)
From: Vitaly Mireyno <vmireyno@marvell.com>
Date: Thu, 7 Jan 2021 17:39:48 +0000
Message-ID: <CY4PR1801MB207233E0BCF16A0820EA51A9C5AF9@CY4PR1801MB2072.namprd18.prod.outlook.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH v3] virtio-net: fix Driver Notification description related to
 VIRTIO_F_NOTIF_CONFIG_DATA
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
To: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Ariel Elior <aelior@marvell.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Incorporated comments for the "[PATCH v9] virtio-net: Add support for the f=
lexible driver notification structure".
Made Driver Notifications description more consistent throughout the docume=
nt wrt VIRTIO_F_NOTIF_CONFIG_DATA.

Changes from v2:
 * Reworked 'vqn' name and definition


Signed-off-by: Vitaly Mireyno <vmireyno@marvell.com>
---
 content.tex        | 30 ++++++++++++++----------------
 notifications-be.c |  2 +-
 notifications-le.c |  2 +-
 3 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/content.tex b/content.tex
index 00bc050..19f09d9 100644
--- a/content.tex
+++ b/content.tex
@@ -337,8 +337,12 @@ \section{Driver Notifications} \label{sec:Virtqueues /=
 Driver notifications}
 notification to the device.
=20
 When VIRTIO_F_NOTIFICATION_DATA has not been negotiated,
-this notification involves sending the
-virtqueue number to the device (method depending on the transport).
+this notification involves sending to the device the virtqueue token
+(method depending on the transport).
+if VIRTIO_F_NOTIF_CONFIG_DATA has not been negotiated, the virtqueue token=
 is
+the virtqueue number to be notified.
+if VIRTIO_F_NOTIF_CONFIG_DATA has been negotiated, the virtqueue token is
+the queue notification data of the virtqueue to be notified.
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
+\item [vq_tok] Virtqueue token
 \item [next_off] Offset
       within the ring where the next available ring entry
       will be written.
@@ -906,14 +910,14 @@ \subsubsection{Common configuration structure layout}=
\label{sec:Virtio Transport
=20
 \item[\field{queue_notify_data}]
         This field exists only if VIRTIO_F_NOTIF_CONFIG_DATA has been nego=
tiated.
-        The driver will use this value to put it in the 'virtqueue number'=
 field
+        The driver will use this value to put it in the 'virtqueue token' =
field
         in the available buffer notification structure.
         See section \ref{sec:Virtio Transport Options / Virtio Over PCI Bu=
s / PCI-specific Initialization And Device Operation / Available Buffer Not=
ifications}.
         \begin{note}
         This field provides the device with flexibility to determine how v=
irtqueues
         will be referred to in available buffer notifications.
-        In a trivial case the device can set \field{queue_notify_data}=3Dv=
qn. Some devices
-        may benefit from providing another value, for example an internal =
virtqueue
+        In a trivial case the device can set \field{queue_notify_data}=3Dv=
irtqueue number.
+        Some devices may benefit from providing another value, for example=
 an internal virtqueue
         identifier, or an internal offset related to the virtqueue number.
         \end{note}
 \end{description}
@@ -1531,8 +1535,7 @@ \subsubsection{Available Buffer Notifications}\label{=
sec:Virtio Transport Option
=20
 When VIRTIO_F_NOTIFICATION_DATA has not been negotiated,
 the driver sends an available buffer notification to the device by writing
-the 16-bit virtqueue index
-of this virtqueue to the Queue Notify address.
+the 16-bit virtqueue token to the Queue Notify address.
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
@@ -6579,7 +6577,7 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Fe=
ature Bits}
   See \ref{sec:Virtqueues / Driver notifications}~\nameref{sec:Virtqueues =
/ Driver notifications}.
=20
   \item[VIRTIO_F_NOTIF_CONFIG_DATA(39)] This feature indicates that the dr=
iver
-  uses the data provided by the device as a virtqueue identifier in availa=
ble
+  uses the data provided by the device as a virtqueue token in available
   buffer notifications.
   As mentioned in section \ref{sec:Virtqueues / Driver notifications}, whe=
n the
   driver is required to send an available buffer notification to the devic=
e, it
diff --git a/notifications-be.c b/notifications-be.c
index 5be947e..6d36ee5 100644
--- a/notifications-be.c
+++ b/notifications-be.c
@@ -1,5 +1,5 @@
 be32 {
-=09vqn : 16;
+=09vq_tok : 16;
 =09next_off : 15;
 =09next_wrap : 1;
 };
diff --git a/notifications-le.c b/notifications-le.c
index fe51267..b3fc284 100644
--- a/notifications-le.c
+++ b/notifications-le.c
@@ -1,5 +1,5 @@
 le32 {
-=09vqn : 16;
+=09vq_tok : 16;
 =09next_off : 15;
 =09next_wrap : 1;
 };
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

