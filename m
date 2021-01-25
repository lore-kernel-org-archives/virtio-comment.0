Return-Path: virtio-comment-return-1663-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 511AC9861BF
	for <virtio-comment@lists.oasis-open.org>; Mon, 25 Jan 2021 03:58:08 +0000 (UTC)
References: <20210122082325.17298-1-jasowang@redhat.com>
 <20210122032907-mutt-send-email-mst@kernel.org>
 <1877911059.48448087.1611304883835.JavaMail.zimbra@redhat.com>
 <20210122040148-mutt-send-email-mst@kernel.org>
 <509090502.48705605.1611306859192.JavaMail.zimbra@redhat.com>
 <20210122071131-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <e9436d14-f716-b912-5cc0-6228b0e6d3d5@redhat.com>
Date: Mon, 25 Jan 2021 11:57:57 +0800
MIME-Version: 1.0
In-Reply-To: <20210122071131-mutt-send-email-mst@kernel.org>
Subject: Re: [virtio-comment] Re: [PATCH] virtio-net: introduce admin control
 virtqueue
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>


On 2021/1/22 =E4=B8=8B=E5=8D=888:14, Michael S. Tsirkin wrote:
> On Fri, Jan 22, 2021 at 04:14:19AM -0500, Jason Wang wrote:
>> ----- Original Message -----
>>> On Fri, Jan 22, 2021 at 03:41:23AM -0500, Jason Wang wrote:
>>>> ----- Original Message -----
>>>>> On Fri, Jan 22, 2021 at 04:23:25PM +0800, Jason Wang wrote:
>>>>>> When implementing multiple (sub)functions virtio device like SRIOV o=
r
>>>>>> sub-function. We're suffering from several issues:
>>>>>>
>>>>>> - There's no management interface for management function (PF) to
>>>>>>    configure features, attributes for a (sub)function
>>>>>> - Per (sub)function control virtqueue could be too expensive as the
>>>>>>    number of (sub)functions could be very large
>>>>>> - Virtualize per (sub)function control virtqueue could be very
>>>>>>    challenge as we need the support of DMA isolation at queue level
>>>>>>
>>>>>> So this patch introduces the feature of VIRTIO_NET_CTRL_ADMIN_VQ. Th=
is
>>>>>> allows the device to implement a single admin control virtqueue to
>>>>>> manage per (sub)function features and attributes.
>>>>>>
>>>>>> The idea is simple, a new function id is introduced on top of the
>>>>>> exist virtio_net_ctrl structure. This id is transport or device
>>>>>> specific to uniquely identify a (sub)function.
>>>>>>
>>>>>> With this, we get a way of using management function (PF) to configu=
re
>>>>>> per (sub)function features and attributes. And since the admin contr=
ol
>>>>>> virtqueue belongs to management function (PF), the DMA is naturally
>>>>>> isolated at (sub)function level instead of the queue level for per
>>>>>> (sub)function control vq.
>>>>>>
>>>>>> Signed-off-by: Jason Wang<jasowang@redhat.com>
>>>>> Let's specify how this works at least for PCI? What about sub-functio=
ns
>>>>> under VF level? How are these specified?
>>>> Ok, will do.
>>>>
>>>>>> ---
>>>>>>   content.tex | 23 +++++++++++++++++++++++
>>>>>>   1 file changed, 23 insertions(+)
>>>>>>
>>>>>> diff --git a/content.tex b/content.tex
>>>>>> index 620c0e2..98592a4 100644
>>>>>> --- a/content.tex
>>>>>> +++ b/content.tex
>>>>>> @@ -2940,6 +2940,9 @@ \subsection{Feature bits}\label{sec:Device Typ=
es
>>>>>> /
>>>>>> Network Device / Feature bits
>>>>>>   \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through cont=
rol
>>>>>>       channel.
>>>>>>  =20
>>>>>> +\item[VIRTIO_NET_F_ADMIN_CTRL_VQ(56)] Admin control channel is
>>>>>> +    available.
>>>>>> +
>>>>>>   \item[VIRTIO_NET_F_HASH_REPORT(57)] Device can report per-packet h=
ash
>>>>>>       value and a type of calculated hash.
>>>>>>  =20
>>>>>> @@ -3864,6 +3867,26 @@ \subsubsection{Control
>>>>>> Virtqueue}\label{sec:Device
>>>>>> Types / Network Device / Devi
>>>>>>   do except issue a diagnostic if \field{ack} is not
>>>>>>   VIRTIO_NET_OK.
>>>>>>  =20
>>>>>> +\subsubsection{Admin Control Virtqueue}\label{sec:Device Types /
>>>>>> Network
>>>>>> Device / Device Operation / Control Virtqueue}
>>>>>> +
>>>>>> +When VIRTIO_NET_F_ADMIN_CTRL_VQ is negotiated, the driver can use t=
he
>>>>>> +control virtqueue to manipulate features of individual function whe=
re
>>>>> manipulate features? You don't mean feature bits, do you?
>>>> I copy from the control virtqueue paragraph above:
>>>>
>>>> """
>>>> The driver uses the control virtqueue (if VIRTIO_NET_F_CTRL_VQ is
>>>> negotiated) to send commands to manipulate various features of
>>>> the device which would not easily map into the configuration
>>>> space.
>>>> """
>>>>
>>>> Do we need to tweak that part as well?
>>>>
>>>> Thanks
>>> Maybe, but let's be a bit more specific. For example,
>>> is it legal to manipulate the MAC of a VF?
>> Right, so we can clarify that the admin control virtqueue should be
>> only used/advertised for the management function like PF. When
>> neogiated, it's always legal to manipulte the MAC of VF through it.
>>
>>> When is it legal?
>> Or do you mean some like "trust" command for iproute2 that allows VF
>> to change its own mac?
>>
>> When PF has admin cvq and VF has normal cvq, management software needs
>> to synrhonize the setting of mac address. E.g management won't set mac
>> address after VM is launched.
>>
>> Thanks
> Consider.
> VF has VIRTIO_NET_F_CTRL_MAC_ADDR. This means guest can set mac address.
> This is something PF needs ability to control. How is this done?


This requires a new command to allow/deny the mac address setting from=20
the VF.


>
> Also, does PF allow setting guest MAC?


I think the answer is yes.


> when?


It will work as how ip set vf mac work. Usually, it should be done=20
before launching the guest. Management should make sure there's no=20
conflict in mac address updating.


>   when PF has
> VIRTIO_NET_F_CTRL_MAC_ADDR?


Yes, without this feature. We can't set mac address through admin=20
control virtqueue.


> Do we differentiate between
> that and ability to set MAC for pf?


I think not. E.g PF should have a dedicated function_id (or virtual=20
device id) like 0. Then we can set mac address of PF through admin cvq.

Thanks

>
>
>
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

