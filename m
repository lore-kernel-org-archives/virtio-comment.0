Return-Path: virtio-comment-return-1099-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 938A4985D55
	for <virtio-comment@lists.oasis-open.org>; Tue, 25 Feb 2020 09:57:25 +0000 (UTC)
References: <BN6PR1801MB2067146B24BB2E7E558BDE30C5ED0@BN6PR1801MB2067.namprd18.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <767276ba-f356-ec4f-d508-c0487060e7b3@redhat.com>
Date: Tue, 25 Feb 2020 17:57:11 +0800
MIME-Version: 1.0
In-Reply-To: <BN6PR1801MB2067146B24BB2E7E558BDE30C5ED0@BN6PR1801MB2067.namprd18.prod.outlook.com>
Content-Language: en-US
Subject: Re: [virtio-comment] [PATCH v2] virtio-net: Add support for the
 flexible driver notification
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
To: Vitaly Mireyno <vmireyno@marvell.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Ariel Elior <aelior@marvell.com>
List-ID: <virtio-comment.lists.oasis-open.org>


On 2020/2/25 =E4=B8=8B=E5=8D=885:50, Vitaly Mireyno wrote:
>> -----Original Message-----
>> From: Jason Wang <jasowang@redhat.com>
>> Sent: Tuesday, 25 February, 2020 5:56
>> To: Vitaly Mireyno <vmireyno@marvell.com>; virtio-comment@lists.oasis-op=
en.org
>> Cc: Michael S. Tsirkin <mst@redhat.com>; Ariel Elior <aelior@marvell.com=
>
>> Subject: Re: [virtio-comment] [PATCH v2] virtio-net: Add support for the=
 flexible driver
>> notification
>>
>> ----------------------------------------------------------------------
>>
>> On 2020/2/25 =E4=B8=8A=E5=8D=881:32, Vitaly Mireyno wrote:
>>> Currently, the driver notification (available buffer notification) has =
a fixed structure.
>>> If VIRTIO_F_NOTIFICATION_DATA has been negotiated, it includes: vqn, ne=
xt_off and next_wrap.
>>> If notify_off_multiplier > 0, the VQ number can be derived by the devic=
e from the Queue Notify
>> address, so vqn may be redundant.
>>> Some devices benefit from receiving an additional data with driver noti=
fications. This data can
>> optionally replace the vqn field in the driver notification structure.
>>> In its simplest form, it would be sufficient for this data to be a per-=
device constant value.
>>>
>>> Changes from v1 - added more details about motivation and usage example=
s.
>>>
>>> Signed-off-by: Vitaly Mireyno <vmireyno@marvell.com>
>>> ---
>>>    content.tex | 28 ++++++++++++++++++++++++++++
>>>    1 file changed, 28 insertions(+)
>>>
>>> diff --git a/content.tex b/content.tex index b91a132..5abff30 100644
>>> --- a/content.tex
>>> +++ b/content.tex
>>> @@ -965,6 +965,9 @@ \subsubsection{Notification structure layout}\label=
{sec:Virtio Transport
>> Options
>>>    struct virtio_pci_notify_cap {
>>>            struct virtio_pci_cap cap;
>>>            le32 notify_off_multiplier; /* Multiplier for
>>> queue_notify_off. */
>>> +        le16 notify_data; /* Data to be placed in the vqn field */
>>> +        u8 notify_data_valid;
>>> +        u8 padding; /* Pad to a dword */
>>
>> I wonder whether we need a new feature flag then we can make it use for =
transport other than PCI.
>>
>> E.g using MMIO transport for vDPA seems attractive anyhow.
>>
> I didn't define a feature flag because driver notifications delivery meth=
od is transport-specific, and looks like not all transports support per-vir=
tqueue notification address. According to the spec, MMIO supports a single =
notification address for all virtqueues. Or am I missing something?


No, it's not implemented right now. But it's not hard to extend MMIO to=20
support what PCI did right now.


>
>>>    };
>>>    \end{lstlisting}
>>>
>>> @@ -984,6 +987,20 @@ \subsubsection{Notification structure layout}\labe=
l{sec:Virtio Transport
>> Options
>>>    the same Queue Notify address for all queues.
>>>    \end{note}
>>>
>>> +If \field{notify_data_valid} !=3D 0, the driver will set the
>>> +\field{vqn} field in the available buffer notification structure to th=
e \field{notify_data} value.
>>> +
>>> +\begin{note}
>>> +If \field{notify_off_multiplier} > 0, the virtqueue number can
>>> +potentially be derived by the device from the Queue Notify address,
>>> +so \field{vqn} may be redundant. Some devices benefit from receiving
>>> +the additional data with driver notifications. An example could be a
>>> +hardware device implementing multiple protocols (with virtio being
>>> +one of them), so extra notification data could serve as a notification=
 type indication or a protocol
>> indication.
>>
>>
>> A silly question. If virtqueue number can be derived by the device, devi=
ce should already know itself a
>> virtio device. Then the type indication seems redundant?
>>
> It's the other way around - the device can derive the virtqueue number *b=
ecause* it knows that this is a virtio notification type.


Ok, I get here. But it looks to me the device should know the protocols=20
before its datapath is started. Or does the device support changing=20
protocol dynamically (or what happen when driver write the vqn as a=20
indication of other protocol?)

Thanks


>
>> Thanks
>>
>>
>>> +Another example could be using shared hardware memory space for
>>> +driver notifications for multiple virtio devices in a trusted environm=
ent.
>>> +\end{note}
>>> +
>>>    \devicenormative{\paragraph}{Notification capability}{Virtio Transpo=
rt Options / Virtio Over PCI Bus
>> / PCI Device Layout / Notification capability}
>>>    The device MUST present at least one notification capability.
>>>
>>> @@ -1020,6 +1037,12 @@ \subsubsection{Notification structure layout}\la=
bel{sec:Virtio Transport
>> Options
>>>    cap.length >=3D queue_notify_off * notify_off_multiplier + 4
>>>    \end{lstlisting}
>>>
>>> +The device MAY set \field{notify_data_valid} to any non-zero value,
>>> +to request the driver to set the \field{vqn} to the \field{notify_data=
} value.
>>> +If the device sets \field{notify_data_valid} to a non-zero value, it
>>> +MUST set \field{notify_data} to a valid value.
>>> +For a normal operation, the device MUST set \field{notify_data_valid} =
to zero.
>>> +
>>>    \subsubsection{ISR status capability}\label{sec:Virtio Transport
>>> Options / Virtio Over PCI Bus / PCI Device Layout / ISR status
>>> capability}
>>>
>>>    The VIRTIO_PCI_CAP_ISR_CFG capability @@ -1519,6 +1542,11 @@
>>> \subsubsection{Available Buffer Notifications}\label{sec:Virtio Transpo=
rt Option
>>>    See \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI De=
vice Layout / Notification
>> capability}
>>>    for how to calculate the Queue Notify address.
>>>
>>> +\drivernormative{\paragraph}{Available Buffer Notifications}{Virtio
>>> +Transport Options / Virtio Over PCI Bus / PCI-specific Initialization
>>> +And Device Operation / Available Buffer Notifications} If
>>> +VIRTIO_F_NOTIFICATION_DATA has been negotiated, and if \field{notify_d=
ata_valid} !=3D 0, the
>> driver MUST set the \field{vqn} field of the available buffer notificati=
on structure to the
>> \field{notify_data} value.
>>> +
>>>    \subsubsection{Used Buffer Notifications}\label{sec:Virtio Transport
>>> Options / Virtio Over PCI Bus / PCI-specific Initialization And Device
>>> Operation / Used Buffer Notifications}
>>>
>>>    If a used buffer notification is necessary for a virtqueue, the devi=
ce would typically act as follows:
>>> --
>>>
>>> This publicly archived list offers a means to provide input to the
>>> OASIS Virtual I/O Device (VIRTIO) TC.
>>>
>>> In order to verify user consent to the Feedback License terms and to
>>> minimize spam in the list archive, subscription is required before
>>> posting.
>>>
>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>>> List help: virtio-comment-help@lists.oasis-open.org
>>> List archive:
>>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.oasis-2Dop=
e
>>> n.org_archives_virtio-2Dcomment_&d=3DDwIFaQ&c=3DnKjWec2b6R0mOyPaz7xtfQ&=
r=3Dl
>>> DHJ2FW52oJ3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3DnDdtxAy8Qznyvn6eq1lEP3O8=
5
>>> a_hVYSZJf3U0pmhgaU&s=3D7amNB2nX03xQEMxgpPK7BmhHosQBVr6HJpuEUnhn1E4&e=3D
>>> Feedback License:
>>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasis-2Dopen=
.
>>> org_who_ipr_feedback-5Flicense.pdf&d=3DDwIFaQ&c=3DnKjWec2b6R0mOyPaz7xtf=
Q&r
>>> =3DlDHJ2FW52oJ3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3DnDdtxAy8Qznyvn6eq1lE=
P3O
>>> 85a_hVYSZJf3U0pmhgaU&s=3DPRasEhPUaotk0G2EgWYkXmZ908KA_72aHaZeflXvUW8&e=
=3D
>>> List Guidelines:
>>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasis-2Dopen=
.
>>> org_policies-2Dguidelines_mailing-2Dlists&d=3DDwIFaQ&c=3DnKjWec2b6R0mOy=
Paz
>>> 7xtfQ&r=3DlDHJ2FW52oJ3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3DnDdtxAy8Qznyv=
n6e
>>> q1lEP3O85a_hVYSZJf3U0pmhgaU&s=3DaeDJlcDhDKq8zdJDrQbWJxMe7M5I46bMgY65-LM=
2
>>> TJ0&e=3D
>>> Committee:
>>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasis-2Dopen=
.
>>> org_committees_virtio_&d=3DDwIFaQ&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDHJ2F=
W52oJ
>>> 3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3DnDdtxAy8Qznyvn6eq1lEP3O85a_hVYSZJf=
3
>>> U0pmhgaU&s=3DmUqbxBUIdH8VtDtV-PKgzs5F9ROtm8ONLCb-ydDqtUo&e=3D
>>> Join OASIS:
>>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasis-2Dopen=
.
>>> org_join_&d=3DDwIFaQ&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDHJ2FW52oJ3lqqsArg=
FRdce
>>> vq01tbLQAw4A_NO7xgI&m=3DnDdtxAy8Qznyvn6eq1lEP3O85a_hVYSZJf3U0pmhgaU&s=
=3Dfs
>>> H_p1KFJVckuBq7Nem9HTLqDp7HTPxwTgHrTs4DJJE&e=3D
>>>


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

