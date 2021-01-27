Return-Path: virtio-comment-return-1681-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 355FC985E55
	for <virtio-comment@lists.oasis-open.org>; Wed, 27 Jan 2021 03:30:30 +0000 (UTC)
References: <20210125055202.29001-1-jasowang@redhat.com>
 <20210125135456.514bca2b.cohuck@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <7cba572c-0dcd-1b35-616b-a80629f2d4a8@redhat.com>
Date: Wed, 27 Jan 2021 11:30:14 +0800
MIME-Version: 1.0
In-Reply-To: <20210125135456.514bca2b.cohuck@redhat.com>
Subject: [virtio-comment] Re: [PATCH V2] virtio-net: introduce admin control virtqueue
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: Cornelia Huck <cohuck@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, mst@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>


On 2021/1/25 =E4=B8=8B=E5=8D=888:54, Cornelia Huck wrote:
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
>>  =20
>>   All commands are of the following form:
>> +is not negotiated:
> Stray hunk.


Will fix.


>
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
>> +management device to manipulate features of individual virtual devices
>> +where the control virtqueue is not easily implemented. The definition
>> +of management device and virtual device is transport or device
>> +specific. E.g in the case of PCI SR-IOV, the management device is
>> +implemented via the physical function (PF), then the virtual device is
>> +the virtual function (VF) in this case.
> "...if the management device is implemented via the physical function
> (PF), the virtual device is implemented via the virtual function (VF)."
> ?


Yes, looks better.


>
>> +
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
> "...it is the PCI function id of the virtual function." ?
>
> s/Management device/The management device/


Will fix.


>
>> +reserve 0 for \field{virtual_device_id} to identify itself.
> "reserve", or rather "use"?


Fine.


>
> That also implies that virtual_device_id must be !=3D 0 for virtual
> devices, doesn't it?


Yes, that's for simplicity. I'm not sure how useful it we had multiple=20
management device and in that case we need a transport specific way to=20
know the id of management device itself.


>
>> +
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
> "can accept the following operations" ?
>
> (in addition to existing control commands?)


Fine.


>
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
> s/If the/If/
>
>> +support VIRTIO_NET_ADMIN_CTRL_TRUST class
> s/support/support the/


Will fix.


>
>> +command. VIRTIO_NET_ADMIN_CTRL_TRUST_ENABLE turns trust for the
>> +control virtqueue of a specific virtual device on and off. The command
>> +specific data is one byte containing 0(off) or 1(on).  When trust is
>> +off the device MUST fail any operations from the control virtqueue of
>> +the virtual device. The management device MUST NOT trust any virtual
>> +devices after reset.
> A bit further up, it is stated that the management device can accept
> operations from a "trusted virtual device". From this statement here, I
> get that the trust state can be turned on and off by the virtual device.


There's some misunderstanding that needs to be clarified in the next=20
version.

Firstly, for the virtual device, it's not expected to expose an admin=20
cvq and the trust state could not be turned on and off by virtual device=20
then.

The only want to turn on/off is the admin control vq belongs to=20
management device.


>
> Does the management device get to choose if it wants to trust a virtual
> device, i.e. can it fail enabling the trust?


Yes, the idea is to let management device to choose which virtual device=20
is trust. For the possible failure, I think we should allow the device=20
to fail the enabling, e.g when the device is lacking resources for=20
virtual devices (e.g mac address tables etc).

Thanks


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

