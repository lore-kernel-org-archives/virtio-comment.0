Return-Path: virtio-comment-return-1700-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 602DD98610E
	for <virtio-comment@lists.oasis-open.org>; Mon,  1 Feb 2021 04:09:28 +0000 (UTC)
References: <20210125055202.29001-1-jasowang@redhat.com>
 <20210129234812.395b42ec.pasic@linux.ibm.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <917eac0a-1773-bd38-82fa-440b9641a381@redhat.com>
Date: Mon, 1 Feb 2021 12:09:15 +0800
MIME-Version: 1.0
In-Reply-To: <20210129234812.395b42ec.pasic@linux.ibm.com>
Subject: Re: [virtio-comment] [PATCH V2] virtio-net: introduce admin control
 virtqueue
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: Halil Pasic <pasic@linux.ibm.com>
Cc: virtio-comment@lists.oasis-open.org, mst@redhat.com, cohuck@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>


On 2021/1/30 =E4=B8=8A=E5=8D=886:48, Halil Pasic wrote:
> On Mon, 25 Jan 2021 13:52:02 +0800
> Jason Wang <jasowang@redhat.com> wrote:
>
>> When implementing virtual devices like SR-IOV or sub-function. We're
>> suffering from several issues:
>>
>> - There's no management interface for management device to
>>    configure features, attributes for a virtual device
>> - Per virtual device control virtqueue could be very expensive as the
>>    number of virtual devices could be very large
>> - Virtualize per virtual device's control virtqueue could be very
>>    challenge as we need the support of DMA isolation at queue level
>>
>> So this patch introduces the feature of VIRTIO_NET_CTRL_ADMIN_VQ. This
>> allows the device to implement a single admin control virtqueue to
>> manage the features and attributes for a specific virtual device.
>>
>> The idea is simple, a new virtual device id is introduced on top of
>> the existing virtio_net_ctrl structure. This id is transport or device
>> specific to uniquely identify a management or virtual device.
>>
>> With this, we get a way of using management device (PF) to configure
>> per virtual device features and attributes. And since the admin
>> control virtqueue belongs to management device (PF), the DMA is
>> naturally isolated at device level instead of the queue level for per
>> virtual device control vq.
>>
>> When the admin cvq is offered by management device and normal cvq is
>> offered by virtual device. A new command class is introduced decide
>> whether or not to accept commands from normal cvq for a virtual
>> device.
>>
> First, sorry for being late. Second, I'm still struggling with putting
> my mental model together. I will ask my questions at the correspondig
> paragraphs.


Your feedback is high appreciated.


>
>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>> ---
>> Changes from V1:
>> - use 'virtual device' instead of 'function'
>> - introuce trust command
>> - clairfy that the admin cvq could be used to configure management
>>    device itself
>> ---
>>   content.tex | 59 ++++++++++++++++++++++++++++++++++++++++++++++++++---
>>   1 file changed, 56 insertions(+), 3 deletions(-)
>>
>> diff --git a/content.tex b/content.tex
>> index 620c0e2..989b4f6 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -2940,6 +2940,9 @@ \subsection{Feature bits}\label{sec:Device Types /=
 Network Device / Feature bits
>>   \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
>>       channel.
>>  =20
>> +\item[VIRTIO_NET_F_ADMIN_CTRL_VQ(56)] Admin control channel is
>> +    available.
>> +
>>   \item[VIRTIO_NET_F_HASH_REPORT(57)] Device can report per-packet hash
>>       value and a type of calculated hash.
>>  =20
>> @@ -3840,11 +3843,12 @@ \subsubsection{Processing of Incoming Packets}\l=
abel{sec:Device Types / Network
>>   \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Dev=
ice / Device Operation / Control Virtqueue}
>>  =20
>>   The driver uses the control virtqueue (if VIRTIO_NET_F_CTRL_VQ is
>> -negotiated) to send commands to manipulate various features of
>> -the device which would not easily map into the configuration
>> -space.
>> +negotiated but VIRTIO_NET_F_ADMIN_CTRL_VQ is not negotiated) to send
>> +commands to manipulate various features of the device which would not
>> +easily map into the configuration space.
> Let's assume device offers both VIRTIO_NET_F_ADMIN_CTRL_VQ and
> VIRTIO_NET_F_CTRL_VQ, but driver accepts only VIRTIO_NET_F_CTRL_VQ,
> because it is an old driver that only knows about VIRTIO_NET_F_CTRL_VQ.
> What happens then? Do we expect the control queue virtqueue to just
> work?


I think the answer is yes, my understanding is that it's better to=20
provide backward compatibility for the old drivers.


>
> I read the proposal like VIRTIO_NET_F_ADMIN_CTRL_VQ and
> VIRTIO_NET_F_CTRL_VQ are mutually exclusive features, and not stacking
> features, but my confidence in this regard is very low. If they are
> mutually exclusive, we should make the feature bits mutually exclusive
> as well.


It works like:

If VIRTIO_NET_F_CTRL_VQ is negotiated but not=20
VIRTIO_NET_F_ADMIN_CTRL_VQ, the control virtqueue will use the old=20
command format.

If both are negotiated, the control virtqueue will use the new format.


>
>>  =20
>>   All commands are of the following form:
>> +is not negotiated:
>>  =20
>>   \begin{lstlisting}
>>   struct virtio_net_ctrl {
>> @@ -3864,6 +3868,29 @@ \subsubsection{Control Virtqueue}\label{sec:Devic=
e Types / Network Device / Devi
>>   do except issue a diagnostic if \field{ack} is not
>>   VIRTIO_NET_OK.
>>  =20
>> +When both VIRTIO_NET_F_CTRL_VQ and VIRTIO_NET_F_ADMIN_CTRL_VQ are
>> +negotiated, the driver can use the admin control virtqueue of the
> There is no such thing defined in the spec like 'admin control
> virtqueue'. This is the first and only mention. Do you mean the
> controlq (as defined in 5.1.2 a.k.a 'control virtqueue')?


Kind of, it means the cvq that could be used for manage virtual devices.


>
>> +management device to manipulate features of individual virtual devices
>> +where the control virtqueue is not easily implemented. The definition
>> +of management device and virtual device is transport or device
>> +specific.
> Is the management device a virtio network device that offered the
> VIRTIO_NET_F_ADMIN_CTRL_VQ feature bit? If the answer is yes, does
> that device otherwise work like any other virtio network device.


Good question, I think the answer is yes. This patch basically extends=20
the virtio-net cvq API, so the management device should be a virtio-net=20
device as well.


>
>> E.g in the case of PCI SR-IOV, the management device is
>> +implemented via the physical function (PF), then the virtual device is
>> +the virtual function (VF) in this case.
>> +
> I'm very superficially acquainted with PCI SR-IOV, maybe that's why I
> don't understand everything right away. Please bear with me.


I agree things will easily be complicated if we talk too much about the=20
virtual devices or do you have any suggestions?


>
>> +All commands are of the following form:
>> +
>> +\begin{lstlisting}
>> +struct virtio_net_admin_ctrl {
>> +        u32 virtual_device_id;
>> +        struct virtio_net_ctrl ctrl;
>> +};
>> +\end{lstlisting}
>> +
>> +The \field{virtual_device_id} is an unique transport or device specific
>> +identifier for a virtual device or management device. E.g for the case
>> +of PCI SR-IOV, it's the PCI function id. Management device MUST
>> +reserve 0 for \field{virtual_device_id} to identify itself.
>> +
> How is a portable driver supposed to obtain this transport or device
> specific ID?


Good question. The idea is:

1) if we had transport specific feature like VIRTIO_F_SR_IOV, the id is=20
simply PCI function id
2) if virtio support it's own IOV feature (that is mutually exclusive=20
with the transport specific one), the id must be obtained via a virtio=20
method.

For 2) I plan to introduce a general admin virtqueue that is used for=20
virtio specific device IOV. In that implementation, the virtual device=20
must be created and destroyed via admin virtqueue. During device=20
creation a unique ID is needed then the driver should know/allocate the=20
id in advance.


>
> Let me elaborate. Let's say I'm a guest and I happen to have a virtio-net
> device, which ain't capable doing the usual controlq stuff via the usual
> controlq, so I have to use this new mechanism (if I, for example, want to
> set the MAC address for it. To do so, I need to know the
> virtual_device_id of my virtual virtio-net device, to be able to put it
> in my virtio_net_admin_ctl command, and that command I need to put into
> some admin control virtqueue.
>
> The paragraph above suggests, that this virtqueue is not the controlq of
> my virtual virtio-net device I'm trying to control, but a virtqueue that
> belongs to the management device.
>
> Obviously for a non-PCI device, it ain't making no sense to define this
> device id as the PCI function id. I guess, this is where the 'transport
> specific' comes from. But then shouldn't we define the transport specific
> part in a transport specific section?


I think we need keep the general format here but maybe we can add a=20
reference to the transport specific part that describe the id in detail.


>
> Also please notice, that the structure virtio_net_admin_ctrl is defined
> in the transport agnostic part, that is it has to work for any
> transport. Which implies that any other transport must use ids that fit
> 32 bits.


Yes, if it's not sufficient, I will increase it to 64 bits.


>
>
>
>>   \paragraph{Packet Receive Filtering}\label{sec:Device Types / Network =
Device / Device Operation / Control Virtqueue / Packet Receive Filtering}
>>   \label{sec:Device Types / Network Device / Device Operation / Control =
Virtqueue / Setting Promiscuous Mode}%old label for latexdiff
>>  =20
>> @@ -4308,6 +4335,32 @@ \subsubsection{Control Virtqueue}\label{sec:Devic=
e Types / Network Device / Devi
>>   according to the native endian of the guest rather than
>>   (necessarily when not using the legacy interface) little-endian.
>>  =20
>> +\paragraph{Setting Trust for Virtual Device}\label{sec:Device Types / N=
etwork Device / Device Operation / Control Virtqueue / Setting Trust for Vi=
rtual Device}
>> +
>> +If the VIRTIO_NET_F_ADMIN_CTRL_VQ is negotiated, the management device
>> +can accept operations via the control vq from the trusted virtual
>> +device.
>> +
>> +\begin{lstlisting}
>> +#define VIRTIO_NET_ADMIN_CTRL_TRUST 0
>> + #define VIRTIO_NET_ADMIN_CTRL_TRUST_ENABLE 0
>> +\end{lstlisting}
>> +
>> +\devicenormative{\subparagraph}{Setting Trust for Virtual Device}{Devic=
e Types / Network Device / Device Operation / Control Virtqueue / Setting T=
rust for Virtual Device}
>> +
>> +If the VIRTIO_NET_F_ADMIN_CTRL_VQ has been negotiated, the device MUST
>> +support VIRTIO_NET_ADMIN_CTRL_TRUST class
>> +command.
> What does it mean to support the class? I guess it is still allowed
> to post VIRTIO_NET_ERR in the ack field, because the device may be
> untrusted.


It's basically a way to allow or deny the commands that is sent via=20
control virtqueue belong to a virtual device.


>
> What should the device do when it encounters a not supported class?


Just fail the command.


>
>> VIRTIO_NET_ADMIN_CTRL_TRUST_ENABLE turns trust for the
>> +control virtqueue of a specific virtual device on and off. The command
>> +specific data is one byte containing 0(off) or 1(on).  When trust is
>> +off the device MUST fail any operations from the control virtqueue of
>> +the virtual device. The management device MUST NOT trust any virtual
>> +devices after reset.
> This reads like, the famous admin control virtqueue may actually be the
> controlq of the device, that one wants to control, if that device was
> previously made trusted by a VIRTIO_NET_ADMIN_CTRL_TRUST_ENABLE command.
>
>  From the rest of the thread, it appears that we are going to drop the
> trust stuff. That makes the question can a trusted virtual device control
> another virtual device (by putting not its own id, but the other devices
> id into the command) moot.


It looks like a nesting somehow, but I think we should not allow to=20
export admin control virtqueue for a non management device and there=20
will be a single management device for a specific virtual device.


>
> But it also makes the question how is a guest going to control it's
> virtual virtio-net device a more relevant one, because that virtual
> device being trusted, and using its controlq is not an option any more.


So in an ideal case, when we had admin cvq, it's better not offer a cvq=20
for a virtual device. In this case, the cvq of this virtual device is=20
mediated by management device(drivers). So we don't need command like=20
trust since the command could be failed by the driver of management=20
device easily.

But I'm not sure how hard (or whether or not it's too late to forbid cvq=20
of a virtual device if admin cvq is offered by the device). So the trust=20
stuffs is basically for this case: virtual device has cvq, mgmt device=20
has admin cvq.

Thanks


>
> Regards,
> Halil
>
>
>> +
>> +\drivernormative{\subparagraph}{Setting Trust for Virtual Device}{Devic=
e Types / Network Device / Device Operation / Control Virtqueue / Setting T=
rust for Virtual Device}
>> +
>> +A driver SHOULD negotiate VIRTIO_NET_F_ADMIN_CTRL_VQ if the device
>> +offers it.
>>  =20
>>   \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Devic=
e
>>   Types / Network Device / Legacy Interface: Framing Requirements}


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

