Return-Path: <jasowang@redhat.com>
Subject: Re: [RFC PATCH v2 1/2] Add virtio Admin Virtqueue specification
References: <20210726165254.8529-1-mgurtovoy@nvidia.com>
 <20210728083306-mutt-send-email-mst@kernel.org>
 <f79c6f8f-04c7-3ca7-432a-b23e6eb09ce8@nvidia.com> <87zgu41dt4.fsf@redhat.com>
 <6b01d0aa-005b-06fc-aa07-70f26ed98c4c@nvidia.com>
 <20210731181746-mutt-send-email-mst@kernel.org>
 <6828669b-4d05-e4bf-99c8-e14481b99358@nvidia.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <ebf614d7-0503-cafe-3db4-055a601157b9@redhat.com>
Date: Mon, 2 Aug 2021 10:17:52 +0800
MIME-Version: 1.0
In-Reply-To: <6828669b-4d05-e4bf-99c8-e14481b99358@nvidia.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
To: Max Gurtovoy <mgurtovoy@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>, virtio-comment@lists.oasis-open.org, stefanha@redhat.com, oren@nvidia.com, parav@nvidia.com, shahafs@nvidia.com, eperezma@redhat.com, aadam@redhat.com, bodong@nvidia.com, amikheev@nvidia.com
List-ID: <virtio-comment.lists.oasis-open.org>


在 2021/8/1 上午6:53, Max Gurtovoy 写道:
>
> On 8/1/2021 1:26 AM, Michael S. Tsirkin wrote:
>> On Sat, Jul 31, 2021 at 02:34:25PM +0300, Max Gurtovoy wrote:
>>> On 7/30/2021 10:05 AM, Cornelia Huck wrote:
>>>> On Thu, Jul 29 2021, Max Gurtovoy <mgurtovoy@nvidia.com> wrote:
>>>>
>>>>> On 7/28/2021 3:48 PM, Michael S. Tsirkin wrote:
>>>>>> On Mon, Jul 26, 2021 at 07:52:53PM +0300, Max Gurtovoy wrote:
>>>>>>> +\subsubsection{Vendor specific command set}\label{sec:Basic 
>>>>>>> Facilities of a Virtio Device / Admin Virtqueues / Admin command 
>>>>>>> set / Vendor specific command set}
>>>>>>> +
>>>>>>> +The Vendor specific command set is a group of classes and commands
>>>>>>> +within each of these classes which are vendor specific. Refer to
>>>>>>> +each vendor specification for more information on the supported
>>>>>>> +commands.
>>>>>> Here's another example.
>>>>>> It's important that there is a way to make a device completely
>>>>>> generic without vendor specific expensions.
>>>>>> Would be hard to do here.
>>>>>>
>>>>>> That's a generic comment.
>>>>>>
>>>>>> but specifically I am very reluctant to add vendor specific stuff 
>>>>>> like
>>>>>> this directly in the spec. We already have VIRTIO_PCI_CAP_VENDOR_CFG
>>>>>> and if that is not sufficient I would like to know why
>>>>>> before we add more vendor specific stuff.
>>>>> We are adding an option to add vendor specific commands. We're not
>>>>> adding it to the spec since each vendor will have its own manual for
>>>>> that.
>>>> IMHO, that way madness lies. I want to be able to look at the spec and
>>>> be able to implement a compliant device or a compliant driver. If a
>>>> vendor has some special feature they want to support, put it in the
>>>> spec, so that it is possible to actually implement it.
>>> You can implement a compliant device and a compliant. why do you 
>>> think you
>>> can't ?
>>>
>>> Some features are vendor/sub-vendor specific.


Please don't do this. This breaks the efforts for making virtio as a 
standard and generic device.


>>>
>>> And as mentioned, you already added it to  the spec so I guess it 
>>> was for a
>>> reason.
>> Well we basically just reserved a capability ID so if people add their
>> vendor specific ones they don't conflict with each other or capabilities
>> we'll add in the future.
>
> it shouldn't bother you as a driver maintainer. I don't think vendor 
> specific code should go to Linux kernel.
>
> No conflict will happen.
>
> There is no harm in having a virtio-cli tool that will pass-through 
> commands from command line to the device using the admin queue.
>
> All the HW devices I know have sw tool that can access it and virtio 
> shouldn't be different.
>
> Also, I can develop my own vendor specific user space driver for 
> virtio-blk for example (lets say in SPDK framework). And this driver 
> will be aware of this vendor specific capabilities.


That's even worse since the driver can only work for the vendor specific 
device which is in fact not a standard device.

For the vendor specific capability, the spec has already said that it 
will be only used for debugging/reporting purpose:

"""

The optional Vendor data capability allows the device to present
vendor-specific data to the driver, without
conflicts, for debugging and/or reporting purposes,
and without conflicting with standard functionality.

"""

It looks to me what you're trying to invent may violate the spec.

Thanks


>
>
>> And such a capability can prove useful for things like
>> identifying the device to enable workarounds, etc.
>>
>> That is a far cry from a fat interface which generic drivers will 
>> need to
>> support and who's sole purpose is vendor specific extensions.
>
> No vendor specific commands will be added to generic driver. I never 
> said this.
>
> I'll enable the option to create devices that support vendor specific 
> commands.
>
>
>>
>> And yes, it also allows you to unload the generic driver and load
>> a vendor driver. Which can then go wild if it wants to - nothing
>> we can or want to do about it.
>
> I don't get your point.
>
> If someone would like to do crazy stuff, you can't stop him.
>
>
>>
>>
>>> If someone would like to add its special souse to virtio device and 
>>> we have
>>> a flexible admin queue to manage it with a spec compliant manner, 
>>> why not ?
>>>
>>> The feature might not get support by the working group so do you 
>>> really want
>>> to limit vendor from implementing features that are not agreed here 
>>> on the
>>> mailing list ?
>>>
>>> Adding a vendor specific command set is trivial.
>> Supporting all this mess leter isn't. So we better make sure just how
>> is all this vendor stuff going to be limited.
>
> You define a range of commands for vendors and that's it.
>
> I don't see a scenario to add some vendor code to virtio generic drivers.
>
>
>>
>>>>> For example, we can use virtio-cli to pass command from command 
>>>>> line to
>>>>> device in pass-through manner without changing driver.
>>>> Things like that are part of the driver as in the spec sense. The spec
>>>> does not care how you actually split the implementation, or what
>>>> controls you are giving to whom. We need a defined interface.
>>> We have an interface. Its the admin queue.
>>>
>>> Virtio-cli will be a user space tool to send commands via this admin 
>>> queue
>>> and configure the device.
>>>
>>> The driver will just open a char dev to supply a channel to this 
>>> admin queue
>>> from user space.
>>>
>>> Examples:
>>>
>>> 1. format a virtio-blk device to add data integrity checks (T-10)
>>>
>>> 2. set 5 msix to VF_1, 12 msix to VF_2 and 2 msix to VF_3 before 
>>> enabling
>>> SRIOV
>>>
>>> 3. Get telemetry log
>>>
>>> 4. Get error log
>>>
>>> 5. Get vendor specific HW health report
>>>
>>> 6. Get generic virtio device health report
>>>
>>> 7. set 5 queues to VF_1, 12 queues to VF_2 and 2 queues to VF_3 before
>>> enabling SRIOV
>>>
>>>
>>> This knowledge is needed for the sys-admin and not the driver. The 
>>> driver
>>> will provide the channel to enable this configuration by an
>>> orchestrator/admin.
>>>
>>>
>>>
>

