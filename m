Return-Path: <virtio-comment-return-2121-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C0D94986276
	for <virtio-comment@lists.oasis-open.org>; Mon,  2 Aug 2021 14:51:50 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <9b7ddc04-2669-0ab8-1304-1bfdf3b8e96c@nvidia.com>
References: <20210726165254.8529-1-mgurtovoy@nvidia.com>
 <20210728083306-mutt-send-email-mst@kernel.org>
 <f79c6f8f-04c7-3ca7-432a-b23e6eb09ce8@nvidia.com>
 <87zgu41dt4.fsf@redhat.com>
 <6b01d0aa-005b-06fc-aa07-70f26ed98c4c@nvidia.com>
 <20210731181746-mutt-send-email-mst@kernel.org>
 <6828669b-4d05-e4bf-99c8-e14481b99358@nvidia.com>
 <ebf614d7-0503-cafe-3db4-055a601157b9@redhat.com>
 <9b7ddc04-2669-0ab8-1304-1bfdf3b8e96c@nvidia.com>
Date: Mon, 02 Aug 2021 16:51:34 +0200
Message-ID: <877dh3293d.fsf@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] Re: [RFC PATCH v2 1/2] Add virtio Admin Virtqueue specification
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
To: Max Gurtovoy <mgurtovoy@nvidia.com>, Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, stefanha@redhat.com, oren@nvidia.com, parav@nvidia.com, shahafs@nvidia.com, eperezma@redhat.com, aadam@redhat.com, bodong@nvidia.com, amikheev@nvidia.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Aug 02 2021, Max Gurtovoy <mgurtovoy@nvidia.com> wrote:

> On 8/2/2021 5:17 AM, Jason Wang wrote:
>>
>> =E5=9C=A8 2021/8/1 =E4=B8=8A=E5=8D=886:53, Max Gurtovoy =E5=86=99=E9=81=
=93:
>>>
>>> On 8/1/2021 1:26 AM, Michael S. Tsirkin wrote:
>>>> On Sat, Jul 31, 2021 at 02:34:25PM +0300, Max Gurtovoy wrote:
>>>>> On 7/30/2021 10:05 AM, Cornelia Huck wrote:
>>>>>> On Thu, Jul 29 2021, Max Gurtovoy <mgurtovoy@nvidia.com> wrote:
>>>>>>
>>>>>>> On 7/28/2021 3:48 PM, Michael S. Tsirkin wrote:
>>>>>>>> On Mon, Jul 26, 2021 at 07:52:53PM +0300, Max Gurtovoy wrote:
>>>>>>>>> +\subsubsection{Vendor specific command set}\label{sec:Basic=20
>>>>>>>>> Facilities of a Virtio Device / Admin Virtqueues / Admin=20
>>>>>>>>> command set / Vendor specific command set}
>>>>>>>>> +
>>>>>>>>> +The Vendor specific command set is a group of classes and=20
>>>>>>>>> commands
>>>>>>>>> +within each of these classes which are vendor specific. Refer to
>>>>>>>>> +each vendor specification for more information on the supported
>>>>>>>>> +commands.
>>>>>>>> Here's another example.
>>>>>>>> It's important that there is a way to make a device completely
>>>>>>>> generic without vendor specific expensions.
>>>>>>>> Would be hard to do here.
>>>>>>>>
>>>>>>>> That's a generic comment.
>>>>>>>>
>>>>>>>> but specifically I am very reluctant to add vendor specific=20
>>>>>>>> stuff like
>>>>>>>> this directly in the spec. We already have=20
>>>>>>>> VIRTIO_PCI_CAP_VENDOR_CFG
>>>>>>>> and if that is not sufficient I would like to know why
>>>>>>>> before we add more vendor specific stuff.
>>>>>>> We are adding an option to add vendor specific commands. We're not
>>>>>>> adding it to the spec since each vendor will have its own manual fo=
r
>>>>>>> that.
>>>>>> IMHO, that way madness lies. I want to be able to look at the spec=
=20
>>>>>> and
>>>>>> be able to implement a compliant device or a compliant driver. If a
>>>>>> vendor has some special feature they want to support, put it in the
>>>>>> spec, so that it is possible to actually implement it.
>>>>> You can implement a compliant device and a compliant. why do you=20
>>>>> think you
>>>>> can't ?

If I want to implement a device/driver, I need a standard to refer
to. How can something vendor-specific be standard? If it is useful, add
it to the virtio spec.

>>>>>
>>>>> Some features are vendor/sub-vendor specific.
>>
>>
>> Please don't do this. This breaks the efforts for making virtio as a=20
>> standard and generic device.
>>
> no it doesn't.
>
> virtio already has vendor specific section.

But only as a pci-specific capability, with a very narrow scope and
constraints; that is a very far cry from what you're proposing!

>
>
>>
>>>>>
>>>>> And as mentioned, you already added it to=C2=A0 the spec so I guess i=
t=20
>>>>> was for a
>>>>> reason.
>>>> Well we basically just reserved a capability ID so if people add their
>>>> vendor specific ones they don't conflict with each other or=20
>>>> capabilities
>>>> we'll add in the future.
>>>
>>> it shouldn't bother you as a driver maintainer. I don't think vendor=20
>>> specific code should go to Linux kernel.
>>>
>>> No conflict will happen.
>>>
>>> There is no harm in having a virtio-cli tool that will pass-through=20
>>> commands from command line to the device using the admin queue.
>>>
>>> All the HW devices I know have sw tool that can access it and virtio=20
>>> shouldn't be different.
>>>
>>> Also, I can develop my own vendor specific user space driver for=20
>>> virtio-blk for example (lets say in SPDK framework). And this driver=20
>>> will be aware of this vendor specific capabilities.
>>
>>
>> That's even worse since the driver can only work for the vendor=20
>> specific device which is in fact not a standard device.
>
> this is not true.

What is not true? Adding some magic vendor-specific stuff that is needed
for the device to function does make it de facto non-standard.

>
>
>>
>> For the vendor specific capability, the spec has already said that it=20
>> will be only used for debugging/reporting purpose:
>>
>> """
>>
>> The optional Vendor data capability allows the device to present
>> vendor-specific data to the driver, without
>> conflicts, for debugging and/or reporting purposes,
>> and without conflicting with standard functionality.
>>
>> """
>>
>> It looks to me what you're trying to invent may violate the spec.
>>
> this is also not true.

What is not true about that? That capability has even more restrictions
than what is cited here.


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

