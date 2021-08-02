Return-Path: <virtio-comment-return-2124-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E92E4986276
	for <virtio-comment@lists.oasis-open.org>; Mon,  2 Aug 2021 15:28:07 +0000 (UTC)
References: <20210726165254.8529-1-mgurtovoy@nvidia.com>
 <20210728083306-mutt-send-email-mst@kernel.org>
 <f79c6f8f-04c7-3ca7-432a-b23e6eb09ce8@nvidia.com> <87zgu41dt4.fsf@redhat.com>
 <6b01d0aa-005b-06fc-aa07-70f26ed98c4c@nvidia.com>
 <20210731181746-mutt-send-email-mst@kernel.org>
 <6828669b-4d05-e4bf-99c8-e14481b99358@nvidia.com>
 <ebf614d7-0503-cafe-3db4-055a601157b9@redhat.com>
 <9b7ddc04-2669-0ab8-1304-1bfdf3b8e96c@nvidia.com> <877dh3293d.fsf@redhat.com>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <abbc3417-5636-4e06-d47b-123473f8bc4a@nvidia.com>
Date: Mon, 2 Aug 2021 18:27:58 +0300
MIME-Version: 1.0
In-Reply-To: <877dh3293d.fsf@redhat.com>
Subject: [virtio-comment] Re: [RFC PATCH v2 1/2] Add virtio Admin Virtqueue specification
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: Cornelia Huck <cohuck@redhat.com>, Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, stefanha@redhat.com, oren@nvidia.com, parav@nvidia.com, shahafs@nvidia.com, eperezma@redhat.com, aadam@redhat.com, bodong@nvidia.com, amikheev@nvidia.com
List-ID: <virtio-comment.lists.oasis-open.org>


On 8/2/2021 5:51 PM, Cornelia Huck wrote:
> On Mon, Aug 02 2021, Max Gurtovoy <mgurtovoy@nvidia.com> wrote:
>
>> On 8/2/2021 5:17 AM, Jason Wang wrote:
>>> =E5=9C=A8 2021/8/1 =E4=B8=8A=E5=8D=886:53, Max Gurtovoy =E5=86=99=E9=81=
=93:
>>>> On 8/1/2021 1:26 AM, Michael S. Tsirkin wrote:
>>>>> On Sat, Jul 31, 2021 at 02:34:25PM +0300, Max Gurtovoy wrote:
>>>>>> On 7/30/2021 10:05 AM, Cornelia Huck wrote:
>>>>>>> On Thu, Jul 29 2021, Max Gurtovoy <mgurtovoy@nvidia.com> wrote:
>>>>>>>
>>>>>>>> On 7/28/2021 3:48 PM, Michael S. Tsirkin wrote:
>>>>>>>>> On Mon, Jul 26, 2021 at 07:52:53PM +0300, Max Gurtovoy wrote:
>>>>>>>>>> +\subsubsection{Vendor specific command set}\label{sec:Basic
>>>>>>>>>> Facilities of a Virtio Device / Admin Virtqueues / Admin
>>>>>>>>>> command set / Vendor specific command set}
>>>>>>>>>> +
>>>>>>>>>> +The Vendor specific command set is a group of classes and
>>>>>>>>>> commands
>>>>>>>>>> +within each of these classes which are vendor specific. Refer t=
o
>>>>>>>>>> +each vendor specification for more information on the supported
>>>>>>>>>> +commands.
>>>>>>>>> Here's another example.
>>>>>>>>> It's important that there is a way to make a device completely
>>>>>>>>> generic without vendor specific expensions.
>>>>>>>>> Would be hard to do here.
>>>>>>>>>
>>>>>>>>> That's a generic comment.
>>>>>>>>>
>>>>>>>>> but specifically I am very reluctant to add vendor specific
>>>>>>>>> stuff like
>>>>>>>>> this directly in the spec. We already have
>>>>>>>>> VIRTIO_PCI_CAP_VENDOR_CFG
>>>>>>>>> and if that is not sufficient I would like to know why
>>>>>>>>> before we add more vendor specific stuff.
>>>>>>>> We are adding an option to add vendor specific commands. We're not
>>>>>>>> adding it to the spec since each vendor will have its own manual f=
or
>>>>>>>> that.
>>>>>>> IMHO, that way madness lies. I want to be able to look at the spec
>>>>>>> and
>>>>>>> be able to implement a compliant device or a compliant driver. If a
>>>>>>> vendor has some special feature they want to support, put it in the
>>>>>>> spec, so that it is possible to actually implement it.
>>>>>> You can implement a compliant device and a compliant. why do you
>>>>>> think you
>>>>>> can't ?
> If I want to implement a device/driver, I need a standard to refer
> to. How can something vendor-specific be standard? If it is useful, add
> it to the virtio spec.

again, Linux driver will be generic.

It will include a char dev to user space virtio-cli that will enable=20
sending admin commands to do administration.

Nobody asked to add vendor specific code to the driver.

The spec allows vendor specific stuff today that are not usable and I'm=20
trying to create a usable API without adding one line of vendor code to=20
driver.

You just need to open a window for few commands like others do and like=20
you already did in the spec.

NVIDIA HW internals are different from VENDOR_A and VENDOR_B.

I want to debug my HW or enable some accelerations in it.

This is the way to do it.

>>>>>> Some features are vendor/sub-vendor specific.
>>>
>>> Please don't do this. This breaks the efforts for making virtio as a
>>> standard and generic device.
>>>
>> no it doesn't.
>>
>> virtio already has vendor specific section.
> But only as a pci-specific capability, with a very narrow scope and
> constraints; that is a very far cry from what you're proposing!

why creating some pci vendor specific channel is ok but creating few=20
admin command isn't ?

>
>>
>>>>>> And as mentioned, you already added it to=C2=A0 the spec so I guess =
it
>>>>>> was for a
>>>>>> reason.
>>>>> Well we basically just reserved a capability ID so if people add thei=
r
>>>>> vendor specific ones they don't conflict with each other or
>>>>> capabilities
>>>>> we'll add in the future.
>>>> it shouldn't bother you as a driver maintainer. I don't think vendor
>>>> specific code should go to Linux kernel.
>>>>
>>>> No conflict will happen.
>>>>
>>>> There is no harm in having a virtio-cli tool that will pass-through
>>>> commands from command line to the device using the admin queue.
>>>>
>>>> All the HW devices I know have sw tool that can access it and virtio
>>>> shouldn't be different.
>>>>
>>>> Also, I can develop my own vendor specific user space driver for
>>>> virtio-blk for example (lets say in SPDK framework). And this driver
>>>> will be aware of this vendor specific capabilities.
>>>
>>> That's even worse since the driver can only work for the vendor
>>> specific device which is in fact not a standard device.
>> this is not true.
> What is not true? Adding some magic vendor-specific stuff that is needed
> for the device to function does make it de facto non-standard.

This is not true because I can write a user space driver any way I want.

This discussion is repeating in cycles.

You already added vendor specific channel to the spec so why you ask me=20
the need for it ?

lets progress to other sections.

>>
>>> For the vendor specific capability, the spec has already said that it
>>> will be only used for debugging/reporting purpose:
>>>
>>> """
>>>
>>> The optional Vendor data capability allows the device to present
>>> vendor-specific data to the driver, without
>>> conflicts, for debugging and/or reporting purposes,
>>> and without conflicting with standard functionality.
>>>
>>> """
>>>
>>> It looks to me what you're trying to invent may violate the spec.
>>>
>> this is also not true.
> What is not true about that? That capability has even more restrictions
> than what is cited here.
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

