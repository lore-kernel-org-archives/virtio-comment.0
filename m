Return-Path: virtio-comment-return-1588-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AE4AA9860DA
	for <virtio-comment@lists.oasis-open.org>; Wed, 23 Dec 2020 02:49:16 +0000 (UTC)
References: <20201218042302.8884-1-jasowang@redhat.com>
 <20201221223338.7b5a21e6.pasic@linux.ibm.com>
 <bbd75f21-4a17-f3df-3c0e-3633a93d0599@redhat.com>
 <20201222075005.69d1cc6e.pasic@linux.ibm.com>
 <ed5c4298-cdd4-55d7-20c6-e57d4f92f752@redhat.com>
 <20201222131404.61e4a136.cohuck@redhat.com>
 <7da54d5b-0787-c78f-4b35-6a4f7ed2f5bf@redhat.com>
 <20201222165431.3f49de29.cohuck@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <3cf88dc9-4053-0f24-854f-6cc6df2aaac4@redhat.com>
Date: Wed, 23 Dec 2020 10:48:45 +0800
MIME-Version: 1.0
In-Reply-To: <20201222165431.3f49de29.cohuck@redhat.com>
Subject: Re: [virtio-comment] [PATCH RFC] virtio: introduce
 VIRTIO_F_DEVICE_STOP
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: Cornelia Huck <cohuck@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>, stefanha@redhat.com, virtio-comment@lists.oasis-open.org, mst@redhat.com, eperezma@redhat.com, sgarzare@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>


On 2020/12/22 =E4=B8=8B=E5=8D=8811:54, Cornelia Huck wrote:
> On Tue, 22 Dec 2020 20:51:04 +0800
> Jason Wang <jasowang@redhat.com> wrote:
>
>> On 2020/12/22 =E4=B8=8B=E5=8D=888:14, Cornelia Huck wrote:
>>> On Tue, 22 Dec 2020 15:30:31 +0800
>>> Jason Wang <jasowang@redhat.com> wrote:
>>>  =20
>>>> On 2020/12/22 =E4=B8=8B=E5=8D=882:50, Halil Pasic wrote:
>>>>> On Tue, 22 Dec 2020 10:36:41 +0800
>>>>> Jason Wang <jasowang@redhat.com> wrote:
>>>>>     =20
>>>>>> On 2020/12/22 =E4=B8=8A=E5=8D=885:33, Halil Pasic wrote:
>>>>>>> On Fri, 18 Dec 2020 12:23:02 +0800
>>>>>>> Jason Wang <jasowang@redhat.com> wrote:
>>>>>>>     =20
>>>>>>>> This patch introduces a new status bit DEVICE_STOPPED. This will b=
e
>>>>>>>> used by the driver to stop and resume a device. The main user will=
 be
>>>>>>>> live migration support for virtio device.
>>>>>>>>     =20
>>>>>>> Can you please provide some more background information, or point
>>>>>>> me to the appropriate discussion?
>>>>>>>
>>>>>>> I mean AFAIK migration already works without this driver initiated
>>>>>>> drain. What is the exact motivation? What about the big picture? I
>>>>>>> guess some agent in the guest would have to make the driver issue
>>>>>>> the DEVICE_STOP.
>>>>>> This is not necessary if the datapath is done inside qemu and when
>>>>>> migration is initiated by qemu itself.
>>>>>>
>>>>>> But it's a must for using virtio-device as a backend for emulated vi=
rtio
>>>>>> devices (e.g vhost-vDPA). In this case, qemu needs to stop the devic=
e
>>>>>> then it can safely synchronize the state from them.
>>>>>>     =20
>>>>> You say, in this case qemu needs to stop the device, which makes sens=
e
>>>>> (it also has to do this when the datapath is implemented in qemu), bu=
t
>>>>> AFAIU DEVICE_STOPPED is initiated by the guest and not by qemu. I'm
>>>>> confused.
>>>> It's initiated by Qemu. Guest is unware of live migration.
>>> But isn't setting DEVICE_STOPPED a _driver_ initiated process? That
>>> sounds like "guest" to me.
>>
>> I think we need clarification on the "driver".
> Looking through the spec, I think we have never properly defined what
> we mean by "device" or "driver". Not sure what a good definition would
> look like. I would consider a "device" an entity that is present and is
> configured/used by a "driver". The "driver" is the means to actually
> configure/use a "device", i.e. the "initiating" part (even though some
> actions are initiated by the device once the driver has started
> interacting with it).


Sorry for being unclear. I think the spec is fine since it's not limit=20
to a host/guest interface, the clarification is only needed for the=20
context of the use cases of DEVICE_STOP.


>
>> Think the following setup:
>>
>> Guest driver <-> Qemu <-> vhost-vdpa <-> vDPA parent (virtio-pci vDPA
>> driver)
>>
>> It's the Qemu that initiates the stop, and the request is forwarded to
>> virtio-pci vDPA driver. So the process is transparent to the guest (driv=
er).
> So it's
>
> Guest driver <-> QEMU <-> vhost-vdpa <-> vDPA parent
> |<-- guest -->|<-------------- host -------------->|
>
> but the vDPA parent is itself acting as a "driver" if you take my
> attempt at a definition above?
>
> (Wouldn't that mean that the device in QEMU is configured/used from two
> entities?)


A more accurate version

Guest virtio-pci driver <->=C2=A0 virtio-pci=C2=A0 device QEMU <-> vhost-vd=
pa <->=20
virtio pci vDPA driver <-> virtio-pci device

So we had two drivers:

1) The first that is running in the guest (it could be either L1 or L2)
2) The second that is running on the host (or L1 if the first is running=20
in L2)

And we had two devices
1) The first that is emulated by QEMU which is running in either L0 or L1
2) The second could be either a physical device on L0 or emulated one in=20
L1 (Qemu is running in L1)

The main use case for DEVICE_STOP the second device and driver. This=20
driver is not the virtio-pci driver but a vDPA driver [1].

[1] https://lkml.org/lkml/2020/12/3/1589


>
>>
>>>  =20
>>>>  =20
>>>>> I'm still curious about how the different components in the stack
>>>>> (guest OS, qemu, vdpa-vhost in host kernel, the PCI function) are
>>>>> supposed to interact.
>>>> It works like:
>>>>
>>>>    From Qemu point of view, vhost-vDPA is just another type of vhost
>>>> backend. Qemu needs to stop virtio (vhost) before it can do migration.
>>>> So we require vDPA devices to have the ability of stopping or pausing
>>>> its datapath. If the vDPA device is by chance the virtio-PCI device, i=
t
>>>> needs an interface for receiving stop/resume command from the driver.
>>>>
>>>> So the devce stop/resume command was sent from Qemu to vhost-VDPA, the=
n
>>>> to vDPA parent which could be a virtio-PCI device in this case.
>>> But QEMU implements the _device_, not the driver, doesn't it?
>>
>> The device is implemented with the co-operation between Qemu and
>> vhost-vDPA. During migration qemu need to stop the virtio-net device,
>> then vhost must be stopped as well.
> Yes, it makes sense that any vhost parts need to be stopped as well.
>
>>
>>> And IIUC,
>>> vhost-VDPA and the vDPA parent are also on the device side. I feel like
>>> I'm missing something essential here.
>>
>> Virtio-PCI driver could be a vDPA parent as well in this case. So we
>> need stop the virtio-pci device.
> Who is the "driver" in that case?


It's the virtio-PCI vDPA driver.


>
>>
>>>  =20
>>>>  =20
>>>>>     =20
>>>>>>>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>>>>>>>> ---
>>>>>>>>      content.tex | 26 ++++++++++++++++++++++++--
>>>>>>>>      1 file changed, 24 insertions(+), 2 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/content.tex b/content.tex
>>>>>>>> index 61eab41..4392b60 100644
>>>>>>>> --- a/content.tex
>>>>>>>> +++ b/content.tex
>>>>>>>> @@ -47,6 +47,9 @@ \section{\field{Device Status} Field}\label{sec:=
Basic Facilities of a Virtio Dev
>>>>>>>>      \item[DRIVER_OK (4)] Indicates that the driver is set up and =
ready to
>>>>>>>>        drive the device.
>>>>>>>>     =20
>>>>>>>> +\item[DEVICE_STOPPED (32)] When VIRTIO_F_DEVICE_STOPPED is negoti=
ated,
>>>>>>>> +  indicates that the device has been stopped by the driver.
>>>>>>>> +
>>>>>>> AFAIU it is not only about indicating stopped, but also requesting =
to be
>>>>>>> stopped.
>>>>>>>
>>>>>>> More importantly, that must not be set immediately, in a sense that=
 the
>>>>>>> one side initiates some action by requesting the bit to be set, and=
 the
>>>>>>> other side must not set the bit before the action is performed.
>>>>>> Yes.
>>>>>>
>>>>>>     =20
>>>>>>> We also
>>>>>>> seem to assume that every device implementation is capable of perfo=
rming
>>>>>>> this trick.
>>>>>> A dedicated feature bit is introduced for this.
>>>>>>     =20
>>>>> This is not about the feature bit, but about the mechanism. But your
>>>>> subsequent answers explain, that this is nothing unusual, and then
>>>>> we should be fine.
>>>>>        =20
>>>>>>> Is it for hardware devices (e.g. PCI) standard to request an
>>>>>>> operation by writing some value into a register, and get feedback b=
out
>>>>>>> a non-completion by reading different value that written,
>>>>>> This is not ununsal in other devices. And in fact, the FEATURES_OK w=
orks
>>>>>> like this:
>>>>>>
>>>>>> """
>>>>>>
>>>>>> The device MUST NOT offer a feature which requires another feature w=
hich
>>>>>> was not offered. The device SHOULD accept any valid subset of featur=
es
>>>>>> the driver accepts, otherwise it MUST fail to set the FEATURES_OK de=
vice
>>>>>> status bit when the driver writes it.
>>>>>>
>>>>>> """
>>>>>>     =20
>>>>> Thanks for the pointer. I intend to have another look at how FEATURES=
_OK
>>>>> works, and how similar this is to DEVICE_STOPPED.
>>>> My understanding is that for both of them, driver can try to set the b=
it
>>>> by writing to the status register but it's the device that decide when
>>>> to set the bit.
>>> I think there's a difference: For FEATURES_OK, the driver can read back
>>> the status and knows that the feature combination is not accepted if it
>>> is not set. For DEVICE_STOPPED, it does not really know whether the
>>> device has started to stop yet. It only knows that the device is
>>> actually done stopping when DEVICE_STOPPED is set.
>>
>> The only difference is that device may need sometime to be stopped.
>> FEATURES_OK might not be the best example. Let's see how reset work
>> which is more similar to DEVICE_STOPPED:
>>
>> """
>>
>> After writing 0 to device_status, the driver MUST wait for a read of
>> device_status to return 0 before reinitializing the device.
>>
>> """
> Hm, but that is PCI-specific writing of fields in the configuration
> structure, right? CCW uses a different method for resetting (an
> asynchronous channel command; channel commands create an interrupt when
> done); "write 0 to status for reset" is not universal.


I may miss something. Even if CCW is using something asynchronously (e.g=20
interrupt). It still present a synchronous API to the upper layer. E.g=20
ccw_io_helper() is using wait_event()?


>
> Which makes me think: is using the device status a good universal
> method for stopping the device?


This part I don't understand. Device stop is kind of similar to reset in=20
this case. If reset can work what prevent stop work?

E.g:

ccw_io_helper(VIRTIO_CCW_DOING_WRITE_STATUS);
while (1) {
 =C2=A0=C2=A0=C2=A0 ccw_io_helper(VIRTIO_CCW_DOING_READ_STATUS);
 =C2=A0=C2=A0=C2=A0 if (status & DEVICE_STOPPED)
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 break;
}


>   If I look at it only from the CCW
> perspective, I'd have used a new channel command with a payload of
> stop/resume and only reflected the stopped state in the device status
> (i.e. read-only from the driver, and only changed by the device when it
> transitions to/from the stopped state.) Could PCI use a new field for
> that?


PCI can use new filed. But I wonder how can that help for CCW.

Thanks


>
>>> Do we need a different mechanism for the device to signal the driver
>>> that the device has actually been stopped? If the driver sees the
>>> STOPPED status after reading back, it knows that the device has
>>> acknowledged the request and is now stopping down. If it is not set, it
>>> means that the device has not honoured the request. Same for clearing
>>> it to resume.
>>
>> I don't see much difference. Device reset doesn't have such notification
>> and driver may simply poll or use a timer.
> See above; CCW does not really use the device status in the same way. I
> think a notification would be useful.


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

