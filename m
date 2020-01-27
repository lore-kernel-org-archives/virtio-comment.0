Return-Path: virtio-comment-return-1031-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 66C5E985BDE
	for <virtio-comment@lists.oasis-open.org>; Mon, 27 Jan 2020 12:49:54 +0000 (UTC)
From: Vitaly Mireyno <vmireyno@marvell.com>
Date: Mon, 27 Jan 2020 12:49:48 +0000
Message-ID: <BN6PR1801MB206783A6B3CB70E63FEFF837C50B0@BN6PR1801MB2067.namprd18.prod.outlook.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH] virtio-net: Add support for the flexible
 driver notification
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>


>-----Original Message-----
>From: Stefan Hajnoczi <stefanha@redhat.com>
>Sent: Monday, 27 January, 2020 11:50
>To: Vitaly Mireyno <vmireyno@marvell.com>
>Cc: virtio-comment@lists.oasis-open.org; Michael S. Tsirkin=20
><mst@redhat.com>; Jason Wang <jasowang@redhat.com>
>Subject: [EXT] Re: [virtio-comment] [PATCH] virtio-net: Add support for=20
>the flexible driver notification
>
>On Sun, Jan 26, 2020 at 12:10:28PM +0000, Vitaly Mireyno wrote:
>> Currently, the driver notification (available buffer notification)=20
>> has a fixed
>structure.
>> If VIRTIO_F_NOTIFICATION_DATA has been negotiated, it includes: vqn,
>next_off and next_wrap.
>> If notify_off_multiplier > 0, the VQ number can be derived by the=20
>> device
>from the Queue Notify address, so vqn may be redundant.
>>
>> Some devices benefit from receiving an additional data with driver
>notifications (because of the specific hardware implementation). This=20
>data can optionally replace the vqn field in the driver notification struc=
ture.
>> In its simplest form, it would be sufficient for this data to be a=20
>> per-device
>constant value.
>>
>>
>> Signed-off-by: Vitaly Mireyno <vmireyno@marvell.com>
>> ---
>>  content.tex | 24 ++++++++++++++++++++++++
>>  1 file changed, 24 insertions(+)
>
>Hi Vitaly,
>Can you give a concrete example of how devices can use this feature?
>
>The reason I'm a little unsure is that the PCI capability only provides=20
>a single notify_data value per device.  That same value is then passed=20
>back to the device in the notify write.
>
>If there is just a single constant value per device, why is it=20
>necessary to involve the driver at all?  Doesn't the device already=20
>know its own magic value and it doesn't really need the driver to pass the=
 value back to it?
>
>Stefan
>

This will help HW devices that share the same memory space between virtqueu=
e notifications and other types of notifications. The virtio driver will al=
ways use the value that will tell the HW that it's a virtqueue notification=
.
Of course, the feature can be extended, such that there will be a value con=
figurable per virtqueue (which is a generalization of the vqn field). I jus=
t didn't want to complicate it further, without a real-life justification.


>> diff --git a/content.tex b/content.tex index 06bb4ca..265dc12 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -965,6 +965,9 @@ \subsubsection{Notification structure=20
>> layout}\label{sec:Virtio Transport Options  struct virtio_pci_notify_cap=
 {
>>          struct virtio_pci_cap cap;
>>          le32 notify_off_multiplier; /* Multiplier for=20
>> queue_notify_off. */
>> +        le16 notify_data; /* The data to be placed in the vqn field */
>> +        u8 notify_data_valid;
>> +        u8 padding; /* Pad to a dword */
>>  };
>>  \end{lstlisting}
>>
>> @@ -984,6 +987,9 @@ \subsubsection{Notification structure=20
>> layout}\label{sec:Virtio Transport Options  the same Queue Notify=20
>> address
>for all queues.
>>  \end{note}
>>
>> +If \field{notify_data_valid} !=3D 0, the driver will set the=20
>> +\field{vqn} field in the available buffer notification structure to=20
>> +the
>\field{notify_data} value.
>> +
>>  \devicenormative{\paragraph}{Notification capability}{Virtio=20
>> Transport Options / Virtio Over PCI Bus / PCI Device Layout /=20
>> Notification
>capability}  The device MUST present at least one notification capability.
>>
>> @@ -1020,6 +1026,12 @@ \subsubsection{Notification structure=20
>> layout}\label{sec:Virtio Transport Options  cap.length >=3D=20
>> queue_notify_off * notify_off_multiplier + 4  \end{lstlisting}
>>
>> +The device MAY set \field{notify_data_valid} to any non-zero value,=20
>> +to request the driver to set the \field{vqn} to the \field{notify_data}=
 value.
>> +If the device sets \field{notify_data_valid} to a non-zero value, it=20
>> +MUST set \field{notify_data} to a valid value.
>> +For a normal operation, the device MUST set=20
>> +\field{notify_data_valid} to
>zero.
>> +
>>  \subsubsection{ISR status capability}\label{sec:Virtio Transport=20
>> Options / Virtio Over PCI Bus / PCI Device Layout / ISR status=20
>> capability}
>>
>>  The VIRTIO_PCI_CAP_ISR_CFG capability @@ -1519,6 +1531,18 @@=20
>> \subsubsection{Available Buffer Notifications}\label{sec:Virtio=20
>> Transport Option  See \ref{sec:Virtio Transport Options / Virtio Over=20
>> PCI Bus / PCI Device Layout / Notification capability}  for how to=20
>> calculate the
>Queue Notify address.
>>
>> +\drivernormative{\paragraph}{Available Buffer Notifications}{Virtio=20
>> +Transport Options / Virtio Over PCI Bus / PCI-specific=20
>> +Initialization And Device Operation / Available Buffer=20
>> +Notifications} If VIRTIO_F_NOTIFICATION_DATA has been negotiated,=20
>> +and if
>\field{notify_data_valid} !=3D 0, the driver MUST set the \field{vqn}=20
>field of the available buffer notification structure to the \field{notify_=
data} value.
>> +
>> +\begin{note}
>> +If \field{notify_off_multiplier} > 0, the virtqueue number can=20
>> +potentially be derived by the device from the Queue Notify address,=20
>> +so \field{vqn} may be redundant. Some devices benefit from receiving=20
>> +the additional data with driver notifications (because of the=20
>> +specific
>hardware implementation).
>> +\end{note}
>> +
>>  \subsubsection{Used Buffer Notifications}\label{sec:Virtio Transport=20
>> Options / Virtio Over PCI Bus / PCI-specific Initialization And=20
>> Device Operation / Used Buffer Notifications}
>>
>>  If a used buffer notification is necessary for a virtqueue, the=20
>> device would
>typically act as follows:
>> --
>>
>> This publicly archived list offers a means to provide input to the=20
>> OASIS Virtual I/O Device (VIRTIO) TC.
>>
>> In order to verify user consent to the Feedback License terms and to=20
>> minimize spam in the list archive, subscription is required before=20
>> posting.
>>
>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>> List help: virtio-comment-help@lists.oasis-open.org
>> List archive: https://lists.oasis-open.org/archives/virtio-comment/
>> Feedback License:
>> https://www.oasis-open.org/who/ipr/feedback_license.pdf
>> List Guidelines:
>> https://www.oasis-open.org/policies-guidelines/mailing-lists
>> Committee: https://www.oasis-open.org/committees/virtio/
>> Join OASIS: https://www.oasis-open.org/join/
>>

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

