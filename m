Return-Path: <mgurtovoy@nvidia.com>
Subject: Re: [RFC PATCH v2 1/2] Add virtio Admin Virtqueue specification
References: <20210726165254.8529-1-mgurtovoy@nvidia.com>
 <20210728083306-mutt-send-email-mst@kernel.org>
 <f79c6f8f-04c7-3ca7-432a-b23e6eb09ce8@nvidia.com> <87zgu41dt4.fsf@redhat.com>
 <6b01d0aa-005b-06fc-aa07-70f26ed98c4c@nvidia.com>
 <20210731181746-mutt-send-email-mst@kernel.org>
 <6828669b-4d05-e4bf-99c8-e14481b99358@nvidia.com>
 <ebf614d7-0503-cafe-3db4-055a601157b9@redhat.com>
 <9b7ddc04-2669-0ab8-1304-1bfdf3b8e96c@nvidia.com> <877dh3293d.fsf@redhat.com>
 <abbc3417-5636-4e06-d47b-123473f8bc4a@nvidia.com>
 <1f4fd34c-bd6a-bfbf-a7df-cba697dc71c6@redhat.com>
 <639b4189-1aa4-aa48-eb15-709c30fefb6e@nvidia.com>
 <7cd59fb6-4b3c-207d-0e82-fa0e0309034e@redhat.com>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <4a7c36f9-6ef7-f5ac-9ed4-d0a350fe6080@nvidia.com>
Date: Tue, 3 Aug 2021 12:21:44 +0300
MIME-Version: 1.0
In-Reply-To: <7cd59fb6-4b3c-207d-0e82-fa0e0309034e@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, stefanha@redhat.com, oren@nvidia.com, parav@nvidia.com, shahafs@nvidia.com, eperezma@redhat.com, aadam@redhat.com, bodong@nvidia.com, amikheev@nvidia.com, Laurent Vivier <lvivier@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>


On 8/3/2021 12:01 PM, Jason Wang wrote:
>
> =E5=9C=A8 2021/8/3 =E4=B8=8B=E5=8D=884:32, Max Gurtovoy =E5=86=99=E9=81=
=93:
>>
>> On 8/3/2021 6:39 AM, Jason Wang wrote:
>>>
>>> =E5=9C=A8 2021/8/2 =E4=B8=8B=E5=8D=8811:27, Max Gurtovoy =E5=86=99=E9=
=81=93:
>>>>
>>>> On 8/2/2021 5:51 PM, Cornelia Huck wrote:
>>>>> On Mon, Aug 02 2021, Max Gurtovoy <mgurtovoy@nvidia.com> wrote:
>>>>>
>>>>>> On 8/2/2021 5:17 AM, Jason Wang wrote:
>>>>>>> =E5=9C=A8 2021/8/1 =E4=B8=8A=E5=8D=886:53, Max Gurtovoy =E5=86=99=
=E9=81=93:
>>>>>>>> On 8/1/2021 1:26 AM, Michael S. Tsirkin wrote:
>>>>>>>>> On Sat, Jul 31, 2021 at 02:34:25PM +0300, Max Gurtovoy wrote:
>>>>>>>>>> On 7/30/2021 10:05 AM, Cornelia Huck wrote:
>>>>>>>>>>> On Thu, Jul 29 2021, Max Gurtovoy <mgurtovoy@nvidia.com> wrote:
>>>>>>>>>>>
>>>>>>>>>>>> On 7/28/2021 3:48 PM, Michael S. Tsirkin wrote:
>>>>>>>>>>>>> On Mon, Jul 26, 2021 at 07:52:53PM +0300, Max Gurtovoy wrote:
>>>>>>>>>>>>>> +\subsubsection{Vendor specific command set}\label{sec:Basic
>>>>>>>>>>>>>> Facilities of a Virtio Device / Admin Virtqueues / Admin
>>>>>>>>>>>>>> command set / Vendor specific command set}
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>> +The Vendor specific command set is a group of classes and
>>>>>>>>>>>>>> commands
>>>>>>>>>>>>>> +within each of these classes which are vendor specific.=20
>>>>>>>>>>>>>> Refer to
>>>>>>>>>>>>>> +each vendor specification for more information on the=20
>>>>>>>>>>>>>> supported
>>>>>>>>>>>>>> +commands.
>>>>>>>>>>>>> Here's another example.
>>>>>>>>>>>>> It's important that there is a way to make a device=20
>>>>>>>>>>>>> completely
>>>>>>>>>>>>> generic without vendor specific expensions.
>>>>>>>>>>>>> Would be hard to do here.
>>>>>>>>>>>>>
>>>>>>>>>>>>> That's a generic comment.
>>>>>>>>>>>>>
>>>>>>>>>>>>> but specifically I am very reluctant to add vendor specific
>>>>>>>>>>>>> stuff like
>>>>>>>>>>>>> this directly in the spec. We already have
>>>>>>>>>>>>> VIRTIO_PCI_CAP_VENDOR_CFG
>>>>>>>>>>>>> and if that is not sufficient I would like to know why
>>>>>>>>>>>>> before we add more vendor specific stuff.
>>>>>>>>>>>> We are adding an option to add vendor specific commands.=20
>>>>>>>>>>>> We're not
>>>>>>>>>>>> adding it to the spec since each vendor will have its own=20
>>>>>>>>>>>> manual for
>>>>>>>>>>>> that.
>>>>>>>>>>> IMHO, that way madness lies. I want to be able to look at=20
>>>>>>>>>>> the spec
>>>>>>>>>>> and
>>>>>>>>>>> be able to implement a compliant device or a compliant=20
>>>>>>>>>>> driver. If a
>>>>>>>>>>> vendor has some special feature they want to support, put it=20
>>>>>>>>>>> in the
>>>>>>>>>>> spec, so that it is possible to actually implement it.
>>>>>>>>>> You can implement a compliant device and a compliant. why do you
>>>>>>>>>> think you
>>>>>>>>>> can't ?
>>>>> If I want to implement a device/driver, I need a standard to refer
>>>>> to. How can something vendor-specific be standard? If it is=20
>>>>> useful, add
>>>>> it to the virtio spec.
>>>>
>>>> again, Linux driver will be generic.
>>>>
>>>> It will include a char dev to user space virtio-cli that will=20
>>>> enable sending admin commands to do administration.
>>>>
>>>> Nobody asked to add vendor specific code to the driver.
>>>
>>>
>>> It's not about the general driver but about the general device. We=20
>>> want to present a general standard device which means we can migrate=20
>>> virtio devices among different vendors.
>>
>> I don't know if it's reasonable.
>>
>> You're looking on a device as a SW component since it was like this=20
>> from day 1. But it's not. It's HW, and HW has its own internal state=20
>> and implementation that is known only to the vendor.
>
>
> Spec doesn't forbid device internal state. But it cares the state that=20
> is visible to the driver. If we had vendor specific state, it would be=20
> very hard to claim to be a standard virtio device.
>
>
>>
>>>
>>>
>>> If each vendor choose to implement their own vendor specific=20
>>> features via vendor specific commands that are not ruled by the=20
>>> spec, there will be little value of the spec.
>>
>> Not at all.
>>
>> I'm very surprised that you are negative to this RFC instead of=20
>> working on defining admin commands to stop/start queues and other=20
>> commands that can be helpful for vDPA migration.
>
>
> I think there are some misunderstanding here. I'm not negative to=20
> admin virtqueue, actually such concept has been discussed by the end=20
> of last year. If you search the archive, I've posted RFC for net=20
> specific admin virtqueue sometime early this year.
>
> But what I want to be negative is the vendor specific=20
> commands/features through the admin virtqueue. The admin virtqueue=20
> should be used for general facility like (device stop and migration as=20
> you said above).
>
>
>>
>>>
>>>
>>>>
>>>> The spec allows vendor specific stuff today that are not usable and=20
>>>> I'm trying to create a usable API without adding one line of vendor=20
>>>> code to driver.
>>>>
>>>> You just need to open a window for few commands like others do and=20
>>>> like you already did in the spec.
>>>>
>>>> NVIDIA HW internals are different from VENDOR_A and VENDOR_B.
>>>>
>>>> I want to debug my HW or enable some accelerations in it.
>>>
>>>
>>> A big question is that, on what layer do you want to provide those=20
>>> functions?
>>>
>>> 1) virtio level
>>> 2) vendor level
>>>
>>> For 1), it needs to be done in the spec instead of introducing=20
>>> backdoor for vendor specific command
>>
>> I'm repeating myself. You already have this backdoor for=20
>> workarounding bugs.
>
>
> To say the truth, I don't like that. And it was probably too late to=20
> fix. And I am not aware of any vendor that implements the VENDOR_CFG=20
> capability.
>
> But we can do better now by not introducing any new vendor specific=20
> stuffs.
>
>
>>
>> I don't ask for workarounds. I want to create a clean spec definition=20
>> for vendor to debug/control their special souse.
>
>
> That's fine, but if it can't be generalized, it's better to be done at=20
> the layer under virtio.
>
what layer are you talking about ?

There is the virtio layer and the transport layer. That's it.

The transport layer has a small window for configuration and handshake.

The virtio layer has ability to transfer data to/from driver from/to device=
.

>
>>
>>>
>>> For 2), virtio keeps simple as is, functionality is provided in a=20
>>> vendor specific device interface. In this case, you can't use=20
>>> virtio-pci directly, then you need present virtio on the upper layer=20
>>> (with some software meditation)
>>
>> you mean VDPA ?
>
>
> vDPA is one approach but not all.
>
> Another example is the IFCVF, it has a dedicated bar for live=20
> migration which is not a part of the virtio-pci capability. (I'm not=20
> saying it's a good design, but it's indeed another approach).

Sorry, I don't this virtio spec should care about vDPA and IFCVF. This=20
should be the other way around.

And you try to enforce the opposite.

>
>
>>
>>>
>>>
>>>>
>>>> This is the way to do it.
>>>
>>>
>>> Again, for debug or acceleration, if you want to do it at the virtio=20
>>> level, you need generalize those features and define them in the spec.
>>>
>>> Maybe we can start the work on generalizing the debug facility=20
>>> first. (adding Laurent who is working on this).
>>
>> Virtio debug stuff can be generalized.
>>
>> Vendor debug stuff should use vendor specific commands. A HW device=20
>> has more than virtio state. It might have FW that controls it.=C2=A0 It=
=20
>> might be an SoC with a lot of components that are used to accelerate=20
>> this device.
>
>
> If the states/statistics/counters are highly vendor specific, let's do=20
> that under virtio(pci). Such method has been used by other vendors.

No other layers.

Lets stop mentioning this.

>
>
>>
>> It's not always a QEMU code that implements virtio device.
>
>
> It's unrelated to whether or not it's a software device. It's about=20
> the effort of the spec to present a standard device.
>
> What I don't understand is that, the mlx5-vdpa approach has been=20
> proved to succeed in all points you raised above (I meant the vendor=20
> specific part). Why need to bother them in the virtio layer if the=20
> feature can't be generalized?

vDPA code shouldn't change at all.

Let's keep vDPA out of this discussion.

I can invent another my_virtio_data_path_acceleration and when I'll do=20
that I don't expect the TC to change the spec to fit it.

>
> Thanks
>
>
>>
>>>
>>> Tahnks
>>>
>>
>

