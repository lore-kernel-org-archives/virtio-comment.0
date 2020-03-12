Return-Path: virtio-comment-return-1139-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 85FE5985FDE
	for <virtio-comment@lists.oasis-open.org>; Thu, 12 Mar 2020 14:05:20 +0000 (UTC)
From: Vitaly Mireyno <vmireyno@marvell.com>
Date: Thu, 12 Mar 2020 14:05:14 +0000
Message-ID: <BN6PR1801MB206743517371303EDB992738C5FD0@BN6PR1801MB2067.namprd18.prod.outlook.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: [virtio-comment] Re: [PATCH v5] virtio-net: Add support for the flexible driver
 notification structure
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Jason Wang <jasowang@redhat.com>, Ariel Elior <aelior@marvell.com>
List-ID: <virtio-comment.lists.oasis-open.org>



>-----Original Message-----
>From: Michael S. Tsirkin <mst@redhat.com>
>Sent: Wednesday, 11 March, 2020 23:04
>To: Vitaly Mireyno <vmireyno@marvell.com>
>Cc: virtio-comment@lists.oasis-open.org; Jason Wang <jasowang@redhat.com>;=
 Ariel Elior
><aelior@marvell.com>
>Subject: [EXT] Re: [PATCH v5] virtio-net: Add support for the flexible dri=
ver notification structure
>
>External Email
>
>----------------------------------------------------------------------
>On Tue, Mar 10, 2020 at 08:42:14AM +0000, Vitaly Mireyno wrote:
>> Currently, the driver notification (available buffer notification) has a=
 fixed structure.
>> If VIRTIO_F_NOTIFICATION_DATA has been negotiated, it includes: vqn, nex=
t_off and next_wrap.
>> If notify_off_multiplier > 0, the VQ number can be derived by the device=
 from the Queue Notify
>address, so vqn may be redundant.
>>
>> Some devices benefit from receiving an additional data with driver notif=
ications. This data can
>optionally replace the vqn field in the driver notification structure.
>> In its simplest form, it would be sufficient for this data to be a per-d=
evice constant value.
>>
>> Changes from v4 - articles fix-up.
>>
>> Signed-off-by: Vitaly Mireyno <vmireyno@marvell.com>
>> ---
>>  content.tex | 33 +++++++++++++++++++++++++++++++++
>>  1 file changed, 33 insertions(+)
>>
>> diff --git a/content.tex b/content.tex index b91a132..08e6111 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -965,6 +965,8 @@ \subsubsection{Notification structure
>> layout}\label{sec:Virtio Transport Options  struct virtio_pci_notify_cap=
 {
>>          struct virtio_pci_cap cap;
>>          le32 notify_off_multiplier; /* Multiplier for
>> queue_notify_off. */
>> +        le16 notify_data; /* Data to be placed in the vqn field */
>> +        le16 padding; /* Pad to a dword */
>>  };
>>  \end{lstlisting}
>>
>> @@ -984,6 +986,21 @@ \subsubsection{Notification structure
>> layout}\label{sec:Virtio Transport Options  the same Queue Notify addres=
s for all queues.
>>  \end{note}
>>
>> +\field{notify_data} is the data that the driver will set in the
>> +\field{vqn} field in the available buffer notification, if
>> +VIRTIO_NET_F_NOTIF_EXTRA_DATA has been negotiated.
>> +
>> +\begin{note}
>> +If \field{notify_off_multiplier} > 0, the virtqueue number can
>> +potentially be derived by the device from the Queue Notify address,
>> +so \field{vqn} may be redundant. Some devices benefit from receiving
>> +additional data with driver notifications. An example could be a
>> +hardware device implementing multiple protocols (with virtio being
>> +one of them), so the extra notification data could serve as a notificat=
ion type indication or a protocol
>indication.
>> +Another example could be using shared hardware memory space for
>> +driver notifications for multiple virtio devices in a trusted environme=
nt.
>
>Actually I missed this "in a trusted environment".  This only works if all=
 drivers can trust each other.  I
>don't think we should give examples with security problems like this.
>

OK

>
>> +\end{note}
>> +
>>  \devicenormative{\paragraph}{Notification capability}{Virtio
>> Transport Options / Virtio Over PCI Bus / PCI Device Layout / Notificati=
on capability}  The device MUST
>present at least one notification capability.
>>
>> @@ -1020,6 +1037,9 @@ \subsubsection{Notification structure
>> layout}\label{sec:Virtio Transport Options  cap.length >=3D
>> queue_notify_off * notify_off_multiplier + 4  \end{lstlisting}
>>
>> +If the device offers VIRTIO_NET_F_NOTIF_EXTRA_DATA, it MUST set
>> +\field{notify_off_multiplier} > 0 in at least one capability.
>> +
>>  \subsubsection{ISR status capability}\label{sec:Virtio Transport
>> Options / Virtio Over PCI Bus / PCI Device Layout / ISR status
>> capability}
>>
>>  The VIRTIO_PCI_CAP_ISR_CFG capability @@ -1519,6 +1539,14 @@
>> \subsubsection{Available Buffer Notifications}\label{sec:Virtio
>> Transport Option  See \ref{sec:Virtio Transport Options / Virtio Over
>> PCI Bus / PCI Device Layout / Notification capability}  for how to calcu=
late the Queue Notify address.
>>
>> +\drivernormative{\paragraph}{Available Buffer Notifications}{Virtio
>> +Transport Options / Virtio Over PCI Bus / PCI-specific Initialization
>> +And Device Operation / Available Buffer Notifications} The driver SHOUL=
D accept the
>VIRTIO_NET_F_NOTIF_EXTRA_DATA feature if it has been offered.
>> +
>> +If VIRTIO_NET_F_NOTIF_EXTRA_DATA has been negotiated and
>> +\field{notify_off_multiplier} > 0, the driver MUST set the
>> +\field{vqn} field of the available buffer notification structure to the=
 \field{notify_data} value.
>> +
>>  \subsubsection{Used Buffer Notifications}\label{sec:Virtio Transport
>> Options / Virtio Over PCI Bus / PCI-specific Initialization And Device
>> Operation / Used Buffer Notifications}
>>
>>  If a used buffer notification is necessary for a virtqueue, the device =
would typically act as follows:
>> @@ -2895,6 +2923,10 @@ \subsection{Feature bits}\label{sec:Device
>> Types / Network Device / Feature bits  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(=
23)] Set MAC
>address through control
>>      channel.
>>
>> +\item[VIRTIO_NET_F_NOTIF_EXTRA_DATA(57)] Driver provides extra data wit=
h
>> +    available buffer notifications, to aid in notification processing b=
y the
>> +    device.
>> +
>
>It's not a big deal but maybe "config data" would have been a better name =
(since it's from config
>space).
>

OK

>>  \item[VIRTIO_NET_F_GUEST_HDRLEN(59)] Driver can provide the exact \fiel=
d{hdr_len}
>>      value. Device benefits from knowing the exact header length.
>>
>> @@ -2934,6 +2966,7 @@ \subsubsection{Feature bit
>> requirements}\label{sec:Device Types / Network Device  \item[VIRTIO_NET_=
F_CTRL_MAC_ADDR]
>Requires VIRTIO_NET_F_CTRL_VQ.
>>  \item[VIRTIO_NET_F_RSC_EXT] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_N=
ET_F_HOST_TSO6.
>>  \item[VIRTIO_NET_F_RSS] Requires VIRTIO_NET_F_CTRL_VQ.
>> +\item[VIRTIO_NET_F_NOTIF_EXTRA_DATA] Requires VIRTIO_F_NOTIFICATION_DAT=
A.
>
>Hmm I missed this too. Could you explain why is this dependency there?
>

Conceptually it's not required, but it simplifies the implementation.
I can remove it for a more generic definition.


>>  \end{description}
>>
>>  \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types
>> / Network Device / Feature bits / Legacy Interface: Feature bits}
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

