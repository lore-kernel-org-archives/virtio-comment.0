Return-Path: <jasowang@redhat.com>
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
From: Jason Wang <jasowang@redhat.com>
Message-ID: <7cd59fb6-4b3c-207d-0e82-fa0e0309034e@redhat.com>
Date: Tue, 3 Aug 2021 17:01:05 +0800
MIME-Version: 1.0
In-Reply-To: <639b4189-1aa4-aa48-eb15-709c30fefb6e@nvidia.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
To: Max Gurtovoy <mgurtovoy@nvidia.com>, Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, stefanha@redhat.com, oren@nvidia.com, parav@nvidia.com, shahafs@nvidia.com, eperezma@redhat.com, aadam@redhat.com, bodong@nvidia.com, amikheev@nvidia.com, Laurent Vivier <lvivier@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>


在 2021/8/3 下午4:32, Max Gurtovoy 写道:
>
> On 8/3/2021 6:39 AM, Jason Wang wrote:
>>
>> 在 2021/8/2 下午11:27, Max Gurtovoy 写道:
>>>
>>> On 8/2/2021 5:51 PM, Cornelia Huck wrote:
>>>> On Mon, Aug 02 2021, Max Gurtovoy <mgurtovoy@nvidia.com> wrote:
>>>>
>>>>> On 8/2/2021 5:17 AM, Jason Wang wrote:
>>>>>> 在 2021/8/1 上午6:53, Max Gurtovoy 写道:
>>>>>>> On 8/1/2021 1:26 AM, Michael S. Tsirkin wrote:
>>>>>>>> On Sat, Jul 31, 2021 at 02:34:25PM +0300, Max Gurtovoy wrote:
>>>>>>>>> On 7/30/2021 10:05 AM, Cornelia Huck wrote:
>>>>>>>>>> On Thu, Jul 29 2021, Max Gurtovoy <mgurtovoy@nvidia.com> wrote:
>>>>>>>>>>
>>>>>>>>>>> On 7/28/2021 3:48 PM, Michael S. Tsirkin wrote:
>>>>>>>>>>>> On Mon, Jul 26, 2021 at 07:52:53PM +0300, Max Gurtovoy wrote:
>>>>>>>>>>>>> +\subsubsection{Vendor specific command set}\label{sec:Basic
>>>>>>>>>>>>> Facilities of a Virtio Device / Admin Virtqueues / Admin
>>>>>>>>>>>>> command set / Vendor specific command set}
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +The Vendor specific command set is a group of classes and
>>>>>>>>>>>>> commands
>>>>>>>>>>>>> +within each of these classes which are vendor specific. 
>>>>>>>>>>>>> Refer to
>>>>>>>>>>>>> +each vendor specification for more information on the 
>>>>>>>>>>>>> supported
>>>>>>>>>>>>> +commands.
>>>>>>>>>>>> Here's another example.
>>>>>>>>>>>> It's important that there is a way to make a device completely
>>>>>>>>>>>> generic without vendor specific expensions.
>>>>>>>>>>>> Would be hard to do here.
>>>>>>>>>>>>
>>>>>>>>>>>> That's a generic comment.
>>>>>>>>>>>>
>>>>>>>>>>>> but specifically I am very reluctant to add vendor specific
>>>>>>>>>>>> stuff like
>>>>>>>>>>>> this directly in the spec. We already have
>>>>>>>>>>>> VIRTIO_PCI_CAP_VENDOR_CFG
>>>>>>>>>>>> and if that is not sufficient I would like to know why
>>>>>>>>>>>> before we add more vendor specific stuff.
>>>>>>>>>>> We are adding an option to add vendor specific commands. 
>>>>>>>>>>> We're not
>>>>>>>>>>> adding it to the spec since each vendor will have its own 
>>>>>>>>>>> manual for
>>>>>>>>>>> that.
>>>>>>>>>> IMHO, that way madness lies. I want to be able to look at the 
>>>>>>>>>> spec
>>>>>>>>>> and
>>>>>>>>>> be able to implement a compliant device or a compliant 
>>>>>>>>>> driver. If a
>>>>>>>>>> vendor has some special feature they want to support, put it 
>>>>>>>>>> in the
>>>>>>>>>> spec, so that it is possible to actually implement it.
>>>>>>>>> You can implement a compliant device and a compliant. why do you
>>>>>>>>> think you
>>>>>>>>> can't ?
>>>> If I want to implement a device/driver, I need a standard to refer
>>>> to. How can something vendor-specific be standard? If it is useful, 
>>>> add
>>>> it to the virtio spec.
>>>
>>> again, Linux driver will be generic.
>>>
>>> It will include a char dev to user space virtio-cli that will enable 
>>> sending admin commands to do administration.
>>>
>>> Nobody asked to add vendor specific code to the driver.
>>
>>
>> It's not about the general driver but about the general device. We 
>> want to present a general standard device which means we can migrate 
>> virtio devices among different vendors.
>
> I don't know if it's reasonable.
>
> You're looking on a device as a SW component since it was like this 
> from day 1. But it's not. It's HW, and HW has its own internal state 
> and implementation that is known only to the vendor.


Spec doesn't forbid device internal state. But it cares the state that 
is visible to the driver. If we had vendor specific state, it would be 
very hard to claim to be a standard virtio device.


>
>>
>>
>> If each vendor choose to implement their own vendor specific features 
>> via vendor specific commands that are not ruled by the spec, there 
>> will be little value of the spec.
>
> Not at all.
>
> I'm very surprised that you are negative to this RFC instead of 
> working on defining admin commands to stop/start queues and other 
> commands that can be helpful for vDPA migration.


I think there are some misunderstanding here. I'm not negative to admin 
virtqueue, actually such concept has been discussed by the end of last 
year. If you search the archive, I've posted RFC for net specific admin 
virtqueue sometime early this year.

But what I want to be negative is the vendor specific commands/features 
through the admin virtqueue. The admin virtqueue should be used for 
general facility like (device stop and migration as you said above).


>
>>
>>
>>>
>>> The spec allows vendor specific stuff today that are not usable and 
>>> I'm trying to create a usable API without adding one line of vendor 
>>> code to driver.
>>>
>>> You just need to open a window for few commands like others do and 
>>> like you already did in the spec.
>>>
>>> NVIDIA HW internals are different from VENDOR_A and VENDOR_B.
>>>
>>> I want to debug my HW or enable some accelerations in it.
>>
>>
>> A big question is that, on what layer do you want to provide those 
>> functions?
>>
>> 1) virtio level
>> 2) vendor level
>>
>> For 1), it needs to be done in the spec instead of introducing 
>> backdoor for vendor specific command
>
> I'm repeating myself. You already have this backdoor for workarounding 
> bugs.


To say the truth, I don't like that. And it was probably too late to 
fix. And I am not aware of any vendor that implements the VENDOR_CFG 
capability.

But we can do better now by not introducing any new vendor specific stuffs.


>
> I don't ask for workarounds. I want to create a clean spec definition 
> for vendor to debug/control their special souse.


That's fine, but if it can't be generalized, it's better to be done at 
the layer under virtio.


>
>>
>> For 2), virtio keeps simple as is, functionality is provided in a 
>> vendor specific device interface. In this case, you can't use 
>> virtio-pci directly, then you need present virtio on the upper layer 
>> (with some software meditation)
>
> you mean VDPA ?


vDPA is one approach but not all.

Another example is the IFCVF, it has a dedicated bar for live migration 
which is not a part of the virtio-pci capability. (I'm not saying it's a 
good design, but it's indeed another approach).


>
>>
>>
>>>
>>> This is the way to do it.
>>
>>
>> Again, for debug or acceleration, if you want to do it at the virtio 
>> level, you need generalize those features and define them in the spec.
>>
>> Maybe we can start the work on generalizing the debug facility first. 
>> (adding Laurent who is working on this).
>
> Virtio debug stuff can be generalized.
>
> Vendor debug stuff should use vendor specific commands. A HW device 
> has more than virtio state. It might have FW that controls it.  It 
> might be an SoC with a lot of components that are used to accelerate 
> this device.


If the states/statistics/counters are highly vendor specific, let's do 
that under virtio(pci). Such method has been used by other vendors.


>
> It's not always a QEMU code that implements virtio device.


It's unrelated to whether or not it's a software device. It's about the 
effort of the spec to present a standard device.

What I don't understand is that, the mlx5-vdpa approach has been proved 
to succeed in all points you raised above (I meant the vendor specific 
part). Why need to bother them in the virtio layer if the feature can't 
be generalized?

Thanks


>
>>
>> Tahnks
>>
>

