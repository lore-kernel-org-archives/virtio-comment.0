Return-Path: virtio-comment-return-1456-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E961D985EDC
	for <virtio-comment@lists.oasis-open.org>; Tue, 15 Sep 2020 08:26:42 +0000 (UTC)
References: <BN6PR1801MB20673C85E4585FCB53C17927C5500@BN6PR1801MB2067.namprd18.prod.outlook.com>
 <0d675bfe-0f94-9c81-5dd3-b5a0406c1d97@redhat.com>
 <BN6PR1801MB20674293D815A142A4E3F581C5230@BN6PR1801MB2067.namprd18.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <34e8b6cb-e824-9177-9c3d-0c243770d4b5@redhat.com>
Date: Tue, 15 Sep 2020 16:26:31 +0800
MIME-Version: 1.0
In-Reply-To: <BN6PR1801MB20674293D815A142A4E3F581C5230@BN6PR1801MB2067.namprd18.prod.outlook.com>
Subject: [virtio-comment] Re: [EXT] Re: [PATCH v8] virtio-net: Add support for the flexible
 driver notification structure.
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
To: Vitaly Mireyno <vmireyno@marvell.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Ariel Elior <aelior@marvell.com>
List-ID: <virtio-comment.lists.oasis-open.org>


On 2020/9/14 =E4=B8=8B=E5=8D=8811:45, Vitaly Mireyno wrote:
>> On 2020/8/31 =E4=B8=8A=E5=8D=885:16, Vitaly Mireyno wrote:
>>> When the driver is required to send an available buffer notification to=
 the device, it sends the
>> virtqueue number to be notified.
>>> With this new feature, the device can optionally provide a per-virtqueu=
e value for the driver to use in
>> driver notifications, instead of the virtqueue number.
>>> Some devices may benefit from this flexibility by providing, for exampl=
e, an internal virtqueue
>> identifier, or an internal offset related to the virtqueue number.
>>> Changes from v6:
>>>    * Changed the feature definition such that the value, that the
>>> driver sets in the vqn field, is per-virtqueue
>>>
>>> Signed-off-by: Vitaly Mireyno <vmireyno@marvell.com>
>>> ---
>>>    content.tex | 45 ++++++++++++++++++++++++++++++++++++++++++++-
>>>    1 file changed, 44 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/content.tex b/content.tex index 91735e3..09043e6 100644
>>> --- a/content.tex
>>> +++ b/content.tex
>>> @@ -824,6 +824,8 @@ \subsubsection{Common configuration structure layou=
t}\label{sec:Virtio
>> Transport
>>>            le64 queue_desc;                /* read-write */
>>>            le64 queue_driver;              /* read-write */
>>>            le64 queue_device;              /* read-write */
>>> +        le16 queue_notify_data;         /* read-only for driver */
>>
>> Do we need to mention this field only exists when VIRTIO_NET_F_NOTIF_CON=
FIG_DATA is
>> negotiated?
>>
> Will add.
>
>>> +        le16 padding;
>>
>> Any reason for intruding the padding here?
>>
> I thought of a dword alignment, but reading again the spec seems that it'=
s not required. Will remove.
>
>>>    };
>>>    \end{lstlisting}
>>>
>>> @@ -890,6 +892,18 @@ \subsubsection{Common configuration structure layo=
ut}\label{sec:Virtio
>> Transport
>>>    \item[\field{queue_device}]
>>>            The driver writes the physical address of Device Area here. =
 See section \ref{sec:Basic Facilities
>> of a Virtio Device / Virtqueues}.
>>> +
>>> +\item[\field{queue_notify_data}]
>>> +        If VIRTIO_NET_F_NOTIF_CONFIG_DATA has been negotiated, the dri=
ver will use this value
>>
>> The feature should work for other types of devices, so there's probably
>> no need for "NET" prefix.
>>
> Ok. Will move it to the device independent features section ("6 Reserved =
Feature Bits")
>
>>> +        to put it in the 'virtqueue number' field in the available buf=
fer notification structure.
>>> +        See section \ref{sec:Virtio Transport Options / Virtio Over PC=
I Bus / PCI-specific Initialization And
>> Device Operation / Available Buffer Notifications}.
>>> +        \begin{note}
>>> +        This field provides the device with flexibility to determine h=
ow virtqueues
>>> +        will be referred to in available buffer notifications.
>>> +        In a trivial case the device can set \field{queue_notify_data}=
=3Dvqn. Some devices
>>> +        may benefit from providing another value, for example an inter=
nal virtqueue
>>> +        identifier, or an internal offset related to the virtqueue num=
ber.
>>> +        \end{note}
>>>    \end{description}
>>>
>>>    \devicenormative{\paragraph}{Common configuration structure layout}{=
Virtio Transport Options /
>> Virtio Over PCI Bus / PCI Device Layout / Common configuration structure=
 layout}
>>> @@ -940,7 +954,7 @@ \subsubsection{Common configuration structure layou=
t}\label{sec:Virtio
>> Transport
>>>    \drivernormative{\paragraph}{Common configuration structure layout}{=
Virtio Transport Options /
>> Virtio Over PCI Bus / PCI Device Layout / Common configuration structure=
 layout}
>>> -The driver MUST NOT write to \field{device_feature}, \field{num_queues=
},
>> \field{config_generation} or \field{queue_notify_off}.
>>> +The driver MUST NOT write to \field{device_feature}, \field{num_queues=
},
>> \field{config_generation}, \field{queue_notify_off} or \field{queue_noti=
fy_data}.
>>>    If VIRTIO_F_RING_PACKED has been negotiated,
>>>    the driver MUST NOT write the value 0 to \field{queue_size}.
>>> @@ -1519,6 +1533,10 @@ \subsubsection{Available Buffer Notifications}\l=
abel{sec:Virtio Transport
>> Option
>>>    See \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI De=
vice Layout / Notification
>> capability}
>>>    for how to calculate the Queue Notify address.
>>>
>>> +\drivernormative{\paragraph}{Available Buffer Notifications}{Virtio Tr=
ansport Options / Virtio Over
>> PCI Bus / PCI-specific Initialization And Device Operation / Available B=
uffer Notifications}
>>> +If VIRTIO_NET_F_NOTIF_CONFIG_DATA has been negotiated, the driver MUST=
 set the 'virtqueue
>> number'
>>> +field of the available buffer notification structure to the \field{que=
ue_notify_data} value.
>>> +
>>>    \subsubsection{Used Buffer Notifications}\label{sec:Virtio Transport=
 Options / Virtio Over PCI Bus /
>> PCI-specific Initialization And Device Operation / Used Buffer Notificat=
ions}
>>>    If a used buffer notification is necessary for a virtqueue, the devi=
ce would typically act as follows:
>>> @@ -2895,6 +2913,9 @@ \subsection{Feature bits}\label{sec:Device Types =
/ Network Device /
>> Feature bits
>>>    \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through contro=
l
>>>        channel.
>>>
>>> +\item[VIRTIO_NET_F_NOTIF_CONFIG_DATA(57)] Driver uses the data provide=
d by the
>>> +    device as a virtqueue identifier in available buffer notifications=
.
>>> +
>>>    \item[VIRTIO_NET_F_GUEST_HDRLEN(59)] Driver can provide the exact \f=
ield{hdr_len}
>>>        value. Device benefits from knowing the exact header length.
>>>
>>> @@ -4180,6 +4201,28 @@ \subsubsection{Legacy Interface: Framing Require=
ments}\label{sec:Device
>>>    See \ref{sec:Basic
>>>    Facilities of a Virtio Device / Virtqueues / Message Framing}.
>>>
>>> +\subsubsection{Driver Notifications}\label{sec:Device Types / Network =
Device / Device Operation /
>> Driver Notifications}
>>> +As mentioned in section \ref{sec:Virtqueues / Driver notifications}, w=
hen the
>>> +driver is required to send an available buffer notification to the dev=
ice, it
>>> +sends the virtqueue number to be notified. The method of delivering no=
tifications
>>> +is transport specific.
>>> +With the PCI transport, the device can optionally provide a per-virtqu=
eue value
>>> +for the driver to use in driver notifications, instead of the virtqueu=
e number.
>>> +Some devices may benefit from this flexibility by providing, for examp=
le,
>>> +an internal virtqueue identifier, or an internal offset related to the=
 virtqueue number.
>>> +
>>> +The VIRTIO_NET_F_NOTIF_CONFIG_DATA feature indicates the availability =
of such value.
>>> +The definition of the data to be provided by the driver in driver noti=
fication and
>>> +the method for delivering it is transport specific.
>>> +
>>> +For more details about driver notifications over PCI see \ref{sec:Virt=
io Transport Options / Virtio
>> Over PCI Bus / PCI-specific Initialization And Device Operation / Availa=
ble Buffer Notifications}.
>>> +
>>> +\drivernormative{\paragraph}{Driver Notifications}{Device Types / Netw=
ork Device / Device
>> Operation / Driver Notifications}
>>> +The driver SHOULD accept the VIRTIO_NET_F_NOTIF_CONFIG_DATA feature if=
 it has
>>> +been offered.
>>> +
>>> +If the VIRTIO_NET_F_NOTIF_CONFIG_DATA feature has been negotiated, the=
 driver MUST provide
>> the transport-specific value for the virtqueue number with driver notifi=
cations.
>>> +
>>
>> Do we need to clarify that the NOTIFICATION_DATA and NOTIF_CONFIG_DATA
>> is mutually exclusive?
>>
> I don=E2=80=99t see them as mutually exclusive.
> NOTIF_CONFIG_DATA means that instead of the vq number, the driver will us=
e other per-vq value in driver notifications.
> If NOTIFICATION_DATA has not been negotiated,  it will be just that value=
.
> If NOTIFICATION_DATA has been negotiated, it will be vqn field in the not=
ification struct.
> (according to "4.1.5.2 Available Buffer Notifications")
> Does this make sense?


I think is works.

Btw, the above description:

"
If the VIRTIO_NET_F_NOTIF_CONFIG_DATA feature has been negotiated, the=20
driver MUST provide
the transport-specific value for the virtqueue number with driver=20
notifications.
"

The "transport-specific" value seems not accurate, I think it should be=20
"device specific"?

Thanks


>
>> Thanks
>>
>>
>>>    \section{Block Device}\label{sec:Device Types / Block Device}
>>>
>>>    The virtio block device is a simple virtual block device (ie.
>>> --
>>>


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

