Return-Path: virtio-comment-return-1703-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EC11D9865E1
	for <virtio-comment@lists.oasis-open.org>; Tue,  2 Feb 2021 03:28:26 +0000 (UTC)
References: <20210125055202.29001-1-jasowang@redhat.com>
 <20210129234812.395b42ec.pasic@linux.ibm.com>
 <917eac0a-1773-bd38-82fa-440b9641a381@redhat.com>
 <20210201164909.004f8202.cohuck@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <fa5e5ee7-ec6e-e19c-505f-7402de1d1782@redhat.com>
Date: Tue, 2 Feb 2021 11:28:13 +0800
MIME-Version: 1.0
In-Reply-To: <20210201164909.004f8202.cohuck@redhat.com>
Subject: Re: [virtio-comment] [PATCH V2] virtio-net: introduce admin control
 virtqueue
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: Cornelia Huck <cohuck@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>, virtio-comment@lists.oasis-open.org, mst@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>


On 2021/2/1 =E4=B8=8B=E5=8D=8811:49, Cornelia Huck wrote:
> On Mon, 1 Feb 2021 12:09:15 +0800
> Jason Wang <jasowang@redhat.com> wrote:
>
>> On 2021/1/30 =E4=B8=8A=E5=8D=886:48, Halil Pasic wrote:
>>> On Mon, 25 Jan 2021 13:52:02 +0800
>>> Jason Wang <jasowang@redhat.com> wrote:
>>>> @@ -3840,11 +3843,12 @@ \subsubsection{Processing of Incoming Packets}=
\label{sec:Device Types / Network
>>>>    \subsubsection{Control Virtqueue}\label{sec:Device Types / Network =
Device / Device Operation / Control Virtqueue}
>>>>   =20
>>>>    The driver uses the control virtqueue (if VIRTIO_NET_F_CTRL_VQ is
>>>> -negotiated) to send commands to manipulate various features of
>>>> -the device which would not easily map into the configuration
>>>> -space.
>>>> +negotiated but VIRTIO_NET_F_ADMIN_CTRL_VQ is not negotiated) to send
>>>> +commands to manipulate various features of the device which would not
>>>> +easily map into the configuration space.
>>> Let's assume device offers both VIRTIO_NET_F_ADMIN_CTRL_VQ and
>>> VIRTIO_NET_F_CTRL_VQ, but driver accepts only VIRTIO_NET_F_CTRL_VQ,
>>> because it is an old driver that only knows about VIRTIO_NET_F_CTRL_VQ.
>>> What happens then? Do we expect the control queue virtqueue to just
>>> work?
>>
>> I think the answer is yes, my understanding is that it's better to
>> provide backward compatibility for the old drivers.
> I agree, I'd expect the device to just use the CTRL_VQ semantics, or
> fail feature negotiation.
>
>>
>>> I read the proposal like VIRTIO_NET_F_ADMIN_CTRL_VQ and
>>> VIRTIO_NET_F_CTRL_VQ are mutually exclusive features, and not stacking
>>> features, but my confidence in this regard is very low. If they are
>>> mutually exclusive, we should make the feature bits mutually exclusive
>>> as well.
>>
>> It works like:
>>
>> If VIRTIO_NET_F_CTRL_VQ is negotiated but not
>> VIRTIO_NET_F_ADMIN_CTRL_VQ, the control virtqueue will use the old
>> command format.
>>
>> If both are negotiated, the control virtqueue will use the new format.
> What if ADMIN_CTRL_VQ is negotiated, but not CTRL_VQ? I assume that
> this is an invalid combination that should not be accepted?


Yes, I will clarify this in the next version.


>
> (...)
>
>>>> +All commands are of the following form:
>>>> +
>>>> +\begin{lstlisting}
>>>> +struct virtio_net_admin_ctrl {
>>>> +        u32 virtual_device_id;
>>>> +        struct virtio_net_ctrl ctrl;
>>>> +};
>>>> +\end{lstlisting}
>>>> +
>>>> +The \field{virtual_device_id} is an unique transport or device specif=
ic
>>>> +identifier for a virtual device or management device. E.g for the cas=
e
>>>> +of PCI SR-IOV, it's the PCI function id. Management device MUST
>>>> +reserve 0 for \field{virtual_device_id} to identify itself.
>>>> +
>>> How is a portable driver supposed to obtain this transport or device
>>> specific ID?
>>
>> Good question. The idea is:
>>
>> 1) if we had transport specific feature like VIRTIO_F_SR_IOV, the id is
>> simply PCI function id
>> 2) if virtio support it's own IOV feature (that is mutually exclusive
>> with the transport specific one), the id must be obtained via a virtio
>> method.
>>
>> For 2) I plan to introduce a general admin virtqueue that is used for
>> virtio specific device IOV. In that implementation, the virtual device
>> must be created and destroyed via admin virtqueue. During device
>> creation a unique ID is needed then the driver should know/allocate the
>> id in advance.
>>
>>
>>> Let me elaborate. Let's say I'm a guest and I happen to have a virtio-n=
et
>>> device, which ain't capable doing the usual controlq stuff via the usua=
l
>>> controlq, so I have to use this new mechanism (if I, for example, want =
to
>>> set the MAC address for it. To do so, I need to know the
>>> virtual_device_id of my virtual virtio-net device, to be able to put it
>>> in my virtio_net_admin_ctl command, and that command I need to put into
>>> some admin control virtqueue.
>>>
>>> The paragraph above suggests, that this virtqueue is not the controlq o=
f
>>> my virtual virtio-net device I'm trying to control, but a virtqueue tha=
t
>>> belongs to the management device.
>>>
>>> Obviously for a non-PCI device, it ain't making no sense to define this
>>> device id as the PCI function id. I guess, this is where the 'transport
>>> specific' comes from. But then shouldn't we define the transport specif=
ic
>>> part in a transport specific section?
>>
>> I think we need keep the general format here but maybe we can add a
>> reference to the transport specific part that describe the id in detail.
>>
>>
>>> Also please notice, that the structure virtio_net_admin_ctrl is defined
>>> in the transport agnostic part, that is it has to work for any
>>> transport. Which implies that any other transport must use ids that fit
>>> 32 bits.
>>
>> Yes, if it's not sufficient, I will increase it to 64 bits.
> Should we maybe use the generic uuid format to identify the device in
> the commands?


Right, will do.

Thanks


>
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
>


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

