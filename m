Return-Path: <virtio-comment-return-2123-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C3B26986276
	for <virtio-comment@lists.oasis-open.org>; Mon,  2 Aug 2021 15:21:43 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <8360728a-68e7-3727-be2c-20b3a259a633@nvidia.com>
References: <20210726165254.8529-1-mgurtovoy@nvidia.com>
 <20210728083306-mutt-send-email-mst@kernel.org>
 <f79c6f8f-04c7-3ca7-432a-b23e6eb09ce8@nvidia.com>
 <20210730032625-mutt-send-email-mst@kernel.org>
 <0bffb13f-4e88-266d-e072-bafa44ec86fe@nvidia.com>
 <20210731175617-mutt-send-email-mst@kernel.org>
 <8360728a-68e7-3727-be2c-20b3a259a633@nvidia.com>
Date: Mon, 02 Aug 2021 17:21:29 +0200
Message-ID: <874kc727pi.fsf@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] Re: [RFC PATCH v2 1/2] Add virtio Admin Virtqueue specification
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
To: Max Gurtovoy <mgurtovoy@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, jasowang@redhat.com, stefanha@redhat.com, oren@nvidia.com, parav@nvidia.com, shahafs@nvidia.com, eperezma@redhat.com, aadam@redhat.com, bodong@nvidia.com, amikheev@nvidia.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Sun, Aug 01 2021, Max Gurtovoy <mgurtovoy@nvidia.com> wrote:

> On 8/1/2021 1:17 AM, Michael S. Tsirkin wrote:
>> On Sat, Jul 31, 2021 at 02:53:45PM +0300, Max Gurtovoy wrote:
>>> On 7/30/2021 10:36 AM, Michael S. Tsirkin wrote:
>>>> On Thu, Jul 29, 2021 at 05:51:07PM +0300, Max Gurtovoy wrote:
>>>>> On 7/28/2021 3:48 PM, Michael S. Tsirkin wrote:
>>>>>> On Mon, Jul 26, 2021 at 07:52:53PM +0300, Max Gurtovoy wrote:
>>>>>>> Admin virtqueues will be used to send administrative commands to
>>>>>>> manipulate various features of the device which would not easily ma=
p
>>>>>>> into the configuration space.
>>>>>>>
>>>>>>> The same Admin command format will be used for all virtio devices. =
The
>>>>>>> Admin command set will include 4 types of command classes:
>>>>>>> 1. The generic common class
>>>>>>> 2. The transport specific class
>>>>>>> 3. The device specific class
>>>>>>> 4. The vendor specific class
>>>>>>>
>>>>>>> The above mechanism will enable adding various features to the virt=
io
>>>>>>> specification, e.g.:
>>>>>>> 1. Format virtio-blk devices in various configurations (512B block =
size,
>>>>>>>       512B + 8B T10-DIF, 4K block size, 4k + 8B T10-DIF, etc..).
>>>>>>> 2. Live migration management.
>>>>>>> 3. Encrypt/Decrypt descriptors.
>>>>>>> 4. Virtualization management.
>>>>>>> 5. Get device error logs.
>>>>>>> 6. Implement advanced vendor/device/transport specific features.
>>>>>>> 7. Run device health test.
>>>>>>> 8. More.
>> I still don't really see what do all these things have in common?
>
> I don't think you need to look on this in that direction.
>
> This is a queue for administration.
>
> Cornelia and Stefan already agreed on this approach.
>
> Please lets progress and not go back to the beginning.
>
>> Why are they grouped behind the same feature bit? Share same VQ?
>
> They are grouped behind an admin q.

It's fine for a variety of things to use the admin q. But I think each
feature should come with its own feature bit that depends on the admin
vq.

What actually makes sense to use the admin vq is also worth further
discussion.

>
>
>>
>>>>>>> As virtio evolves beyond the para-virt/sw-emulated world, it's mand=
atory
>>>>>>> for the specification to become flexible and allow a wider feature =
set.
>>>>>>> The corrent ctrl virtq that is defined for some of the virtio devic=
es is
>>>>>>> device specific and wasn't designed to be a generic virtq for
>>>>>>> admininistration.
>>>>>>>
>>>>>>> Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
>>>>>> Lots of things on this list seem to make sense when
>>>>>> done from PF and affecting a VF.
>>>>>> I think from this POV the generic structure should include
>>>>>> a way to address one device from another.
>>>>> This will be defined per command.
>>>>>
>>>>> For example, funcion_id will be given as command data.
>>>> Why? Sounds like a generic thing to me.
>>> Generic to a command that handles virtualization management.
>>
>> It could be that mixing up virtualization management and arbitrary
>> other management commands in the same interface is a mistake.
>
> It's not a mistake.
>
> This is the right design.

Well, we're clearly not all in agreement what the "right design"
is. Figuring that out is the whole point of this discussion.

>
> Creating a new interface for each feature is madness.
>
>
>> Or maybe not - do we want host to have ability to run health tests
>> for a VF without loading VF driver? Get error logs?
>
> This can be an optional feature.
>
> We need to define it in the future. We can't define the entire command=20
> set now.
>
> We need to define the infrastructure.
>
>>
>> In fact besides migration and virtualization management the rest of
>> examples that you give all seem to be more or less device specific, with
>> the possible exception of 3. Encrypt/Decrypt descriptors.  what does
>> this one imply, exactly?
>
> For storage devices there is an option to have a self encrypted drive.
>
> Maybe we can develop encryption/decryption also=C2=A0 for net devices.
>
> This will be developed in the future.
>
> But the infrastructure will allow it. This is the beauty if it, you=20
> create infrastructure today and add optional commands tomorrow.
>
> Nobody can think of thousands of features and commands today, and we=20
> also can't push thousands of pages to the spec.
>
> Lets push 2-3 mandatory commands with the infrastructure and build new=20
> features incrementally.

Why "mandatory commands"? Just make them covered by a feature bit.

>>>>>> So there are several problems with this approach.
>>>>>> One is that there is no two way negotiation.
>>>>> you negotiate the adminq feature.
>>>>>
>>>>> then you can send admin commands and discover the supported commands.
>>>>>
>>>>>> No way for device to know what will driver use in the end.
>>>>> device will be designed to support mandatory admin commands and some
>>>>> optional.
>>>>>
>>>>> It doesn't need to care whether the driver will use it or not.
>>>>>> This breaks things like e.g. accelerating some configurations
>>>>>> but not others.
>>>>> I don't understand what it breaks exactly.
>>>> Long practice taught us that it is good for device to know
>>>> what is driver going to use.
>>>> For example, some features can be implemented in hardware
>>>> and some in hypervisor software. If driver is going to use software
>>>> features then you need to switch to a slower software
>>>> implementation. Doing that dynamically at time of use is
>>>> often much harder that up-front at negotiation time.
>>> I don't think we should write specifications that should consider hyper=
visor
>>> SW.
>> Well considering hypervisors is clearly one of the purposes of virtio TC=
.
>> Look it up in the charter, section 2. Statement of Purpose.
>>
>>
>>> You might use virtio device without hypervisor at all.
>> Yes and supporting that is also clearly an objective:
>>
>> =09With the 1.1, 1.2 and future revisions of the Specification, we aim t=
o
>> =09evolve the VIRTIO standard further, addressing such new requirements
>> =09while both continuing to honor the goals of the 1.0 Specification and
>> =09including new objectives.
>>
>>
> There is nothing in admin queue that doesn't honor old spec.
>
> Old driver will not be aware of it.

I don't see how this helps; negotiating the admin vq only tells the
device that the driver wants to use the admin vq, but not what it
actually wants to use. This is a departure from the feature negotiation
method used up to now.

>>>>>>> +\subsubsection{Vendor specific command set}\label{sec:Basic Facili=
ties of a Virtio Device / Admin Virtqueues / Admin command set / Vendor spe=
cific command set}
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
>>>>>> but specifically I am very reluctant to add vendor specific stuff li=
ke
>>>>>> this directly in the spec. We already have VIRTIO_PCI_CAP_VENDOR_CFG
>>>>>> and if that is not sufficient I would like to know why
>>>>>> before we add more vendor specific stuff.
>>>>> We are adding an option to add vendor specific commands. We're not ad=
ding it
>>>>> to the spec since each vendor will have its own manual for that.
>>>> You didn't actually answer the question though.
>>>>
>>>>> For example, we can use virtio-cli to pass command from command line =
to
>>>>> device in pass-through manner without changing driver.
>>>>>
>>>> Opaque strings passed all the way from guest userspace to host device?
>>>> Not sure why is that a good idea.
>>> Where did I mentioned a guest ?
>>>
>>> Virtio-cli will control a device on the same host that it runs.
>>>
>>> If it's a bare metal host so it will manage the virtio attached device.
>>>
>>> If it's a guest it will manage the device attached to the guest.
>> Opaqueness of all this is what worries at least me and Cornelia.
>
> guest is not aware of host devices.
>
> Sending raw command from Linux cmdline to a device is not something I=20
> invented.
>
> If a user is aware of its HW he can use the virtio-cli tool to configure=
=20
> its unique features.
>
> And if the user is not so smart, we can help him with adding vendor=20
> classes to virtio-cli management tool.

There's something very wrong in relying on an external tool to configure
a supposedly standardized device. This spec is supposed to be
platform-agnostic. Everything must be implementable by a random OS or HW
maker, and for that, it needs to be properly specified.


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

