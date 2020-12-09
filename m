Return-Path: virtio-comment-return-1553-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C14729865DD
	for <virtio-comment@lists.oasis-open.org>; Wed,  9 Dec 2020 14:27:03 +0000 (UTC)
From: Vitaly Mireyno <vmireyno@marvell.com>
Date: Wed, 9 Dec 2020 14:26:56 +0000
Message-ID: <BN6PR1801MB2067218BCAAEF334BC47BBD7C5CC0@BN6PR1801MB2067.namprd18.prod.outlook.com>
References: <BN6PR1801MB20670DDDBD0D873920276E1CC5CC0@BN6PR1801MB2067.namprd18.prod.outlook.com>
 <20201209081031-mutt-send-email-mst@kernel.org>
In-Reply-To: <20201209081031-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Subject: [virtio-comment] RE: [EXT] Re: [PATCH] virtio-net: fix Driver Notification description
 related to VIRTIO_F_NOTIF_CONFIG_DATA
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Ariel Elior <aelior@marvell.com>, Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>


>-----Original Message-----
>From: Michael S. Tsirkin <mst@redhat.com>
>Sent: Wednesday, 9 December, 2020 15:17
>To: Vitaly Mireyno <vmireyno@marvell.com>
>Cc: virtio-comment@lists.oasis-open.org; Ariel Elior <aelior@marvell.com>;=
 Halil Pasic
><pasic@linux.ibm.com>; Cornelia Huck <cohuck@redhat.com>
>Subject: [EXT] Re: [PATCH] virtio-net: fix Driver Notification description=
 related to
>VIRTIO_F_NOTIF_CONFIG_DATA
>
>External Email
>
>----------------------------------------------------------------------
>On Wed, Dec 09, 2020 at 12:57:08PM +0000, Vitaly Mireyno wrote:
>> Incorporated comments for the "[PATCH v9] virtio-net: Add support for th=
e flexible driver notification
>structure".
>> Made Driver Notifications description more consistent throughout the doc=
ument wrt
>VIRTIO_F_NOTIF_CONFIG_DATA.
>>
>> Signed-off-by: Vitaly Mireyno <vmireyno@marvell.com>
>
>
>This is a bit repetitive.
>
>How about we replace "vqn" with "vqid", call it "virt queue identifier"
>and explain that it is either hardcoded to the virt queue index or read fr=
om config space.
>
>In config space replace queue_notify_data with queue_identifier.
>
>And maybe VIRTIO_F_NOTIF_CONFIG_DATA -> VIRTIO_F_NOTIF_CONFIG_QUEUE_ID
>

I think such definition is a little more restrictive as it suggests that th=
e notification data is necessarily queue identifier, whereas the current de=
finition allows a broader interpretation.

How about rephrasing "Driver Notifications" and "Available Buffer Notificat=
ions" sections to avoid repetitions? Something like:

@@ -337,9 +337,12 @@ \section{Driver Notifications} \label{sec:Virtqueues /=
 Driver notifications}
 notification to the device.
=20
 When VIRTIO_F_NOTIFICATION_DATA has not been negotiated,
-this notification involves sending to the device either the virtqueue numb=
er
-or, if VIRTIO_F_NOTIF_CONFIG_DATA has been negotiated,
-the queue notification data (method depending on the transport).
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
@@ -350,8 +353,7 @@ \section{Driver Notifications} \label{sec:Virtqueues / =
Driver notifications}
 the following information:
=20
 \begin{description}
-\item [vqn] Either the virtqueue number to be notified or, if VIRTIO_F_NOT=
IF_CONFIG_DATA
-      has been negotiated, the queue notification data.
+\item [vqn]
 \item [next_off] Offset
       within the ring where the next available ring entry
       will be written.
@@ -1533,8 +1535,7 @@ \subsubsection{Available Buffer Notifications}\label{=
sec:Virtio Transport Option
=20
 When VIRTIO_F_NOTIFICATION_DATA has not been negotiated,
 the driver sends an available buffer notification to the device by writing
-either the 16-bit virtqueue index of this virtqueue or, if VIRTIO_F_NOTIF_=
CONFIG_DATA
-has been negotiated, the 16-bit queue notification data to the Queue Notif=
y address.
+the 16-bit vqn to the Queue Notify address.
=20
 When VIRTIO_F_NOTIFICATION_DATA has been negotiated,
 the driver sends an available buffer notification to the device by writing


>> ---
>>  content.tex | 21 +++++++++------------
>>  1 file changed, 9 insertions(+), 12 deletions(-)
>>
>> diff --git a/content.tex b/content.tex index 00bc050..9514b2d 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -337,8 +337,9 @@ \section{Driver Notifications}
>> \label{sec:Virtqueues / Driver notifications}  notification to the devic=
e.
>>
>>  When VIRTIO_F_NOTIFICATION_DATA has not been negotiated, -this
>> notification involves sending the -virtqueue number to the device
>> (method depending on the transport).
>> +this notification involves sending to the device either the virtqueue
>> +number or, if VIRTIO_F_NOTIF_CONFIG_DATA has been negotiated, the
>> +queue notification data (method depending on the transport).
>>
>>  However, some devices benefit from the ability to find out the
>> amount of available data in the queue without accessing the virtqueue in=
 memory:
>> @@ -349,7 +350,8 @@ \section{Driver Notifications}
>> \label{sec:Virtqueues / Driver notifications}  the following information=
:
>>
>>  \begin{description}
>> -\item [vqn] VQ number to be notified.
>> +\item [vqn] Either the virtqueue number to be notified or, if VIRTIO_F_=
NOTIF_CONFIG_DATA
>> +      has been negotiated, the queue notification data.
>>  \item [next_off] Offset
>>        within the ring where the next available ring entry
>>        will be written.
>> @@ -1531,8 +1533,8 @@ \subsubsection{Available Buffer
>> Notifications}\label{sec:Virtio Transport Option
>>
>>  When VIRTIO_F_NOTIFICATION_DATA has not been negotiated,  the driver
>> sends an available buffer notification to the device by writing -the
>> 16-bit virtqueue index -of this virtqueue to the Queue Notify address.
>> +either the 16-bit virtqueue index of this virtqueue or, if
>> +VIRTIO_F_NOTIF_CONFIG_DATA has been negotiated, the 16-bit queue notifi=
cation data to the
>Queue Notify address.
>>
>>  When VIRTIO_F_NOTIFICATION_DATA has been negotiated,  the driver
>> sends an available buffer notification to the device by writing @@
>> -1546,13 +1548,8 @@ \subsubsection{Available Buffer
>> Notifications}\label{sec:Virtio Transport Option  for how to calculate t=
he Queue Notify address.
>>
>>  \drivernormative{\paragraph}{Available Buffer Notifications}{Virtio
>> Transport Options / Virtio Over PCI Bus / PCI-specific Initialization An=
d Device Operation / Available
>Buffer Notifications} -If VIRTIO_F_NOTIF_CONFIG_DATA has been negotiated:
>> -\begin{itemize}
>> -\item If VIRTIO_F_NOTIFICATION_DATA has not been negotiated, the
>> driver MUST use the -\field{queue_notify_data} value instead of the virt=
queue index.
>> -\item If VIRTIO_F_NOTIFICATION_DATA has been negotiated, the driver
>> MUST set the -\field{vqn} field to the \field{queue_notify_data} value.
>> -\end{itemize}
>> +If VIRTIO_F_NOTIF_CONFIG_DATA has been negotiated, the driver MUST
>> +use the \field{queue_notify_data} value as a queue notification data.
>>
>>  \subsubsection{Used Buffer Notifications}\label{sec:Virtio Transport
>> Options / Virtio Over PCI Bus / PCI-specific Initialization And Device
>> Operation / Used Buffer Notifications}
>>
>> --


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

