Return-Path: <mgurtovoy@nvidia.com>
Subject: Re: [RFC PATCH v2 1/2] Add virtio Admin Virtqueue specification
References: <20210726165254.8529-1-mgurtovoy@nvidia.com>
 <20210728083306-mutt-send-email-mst@kernel.org>
 <f79c6f8f-04c7-3ca7-432a-b23e6eb09ce8@nvidia.com> <87zgu41dt4.fsf@redhat.com>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <6b01d0aa-005b-06fc-aa07-70f26ed98c4c@nvidia.com>
Date: Sat, 31 Jul 2021 14:34:25 +0300
MIME-Version: 1.0
In-Reply-To: <87zgu41dt4.fsf@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, jasowang@redhat.com, stefanha@redhat.com, oren@nvidia.com, parav@nvidia.com, shahafs@nvidia.com, eperezma@redhat.com, aadam@redhat.com, bodong@nvidia.com, amikheev@nvidia.com
List-ID: <virtio-comment.lists.oasis-open.org>


On 7/30/2021 10:05 AM, Cornelia Huck wrote:
> On Thu, Jul 29 2021, Max Gurtovoy <mgurtovoy@nvidia.com> wrote:
>
>> On 7/28/2021 3:48 PM, Michael S. Tsirkin wrote:
>>> On Mon, Jul 26, 2021 at 07:52:53PM +0300, Max Gurtovoy wrote:
>>>> +\subsubsection{Vendor specific command set}\label{sec:Basic Facilitie=
s of a Virtio Device / Admin Virtqueues / Admin command set / Vendor specif=
ic command set}
>>>> +
>>>> +The Vendor specific command set is a group of classes and commands
>>>> +within each of these classes which are vendor specific. Refer to
>>>> +each vendor specification for more information on the supported
>>>> +commands.
>>> Here's another example.
>>> It's important that there is a way to make a device completely
>>> generic without vendor specific expensions.
>>> Would be hard to do here.
>>>
>>> That's a generic comment.
>>>
>>> but specifically I am very reluctant to add vendor specific stuff like
>>> this directly in the spec. We already have VIRTIO_PCI_CAP_VENDOR_CFG
>>> and if that is not sufficient I would like to know why
>>> before we add more vendor specific stuff.
>> We are adding an option to add vendor specific commands. We're not
>> adding it to the spec since each vendor will have its own manual for
>> that.
> IMHO, that way madness lies. I want to be able to look at the spec and
> be able to implement a compliant device or a compliant driver. If a
> vendor has some special feature they want to support, put it in the
> spec, so that it is possible to actually implement it.

You can implement a compliant device and a compliant. why do you think=20
you can't ?

Some features are vendor/sub-vendor specific.

And as mentioned, you already added it to=C2=A0 the spec so I guess it was=
=20
for a reason.

If someone would like to add its special souse to virtio device and we=20
have a flexible admin queue to manage it with a spec compliant manner,=20
why not ?

The feature might not get support by the working group so do you really=20
want to limit vendor from implementing features that are not agreed here=20
on the mailing list ?

Adding a vendor specific command set is trivial.

>
>> For example, we can use virtio-cli to pass command from command line to
>> device in pass-through manner without changing driver.
> Things like that are part of the driver as in the spec sense. The spec
> does not care how you actually split the implementation, or what
> controls you are giving to whom. We need a defined interface.

We have an interface. Its the admin queue.

Virtio-cli will be a user space tool to send commands via this admin=20
queue and configure the device.

The driver will just open a char dev to supply a channel to this admin=20
queue from user space.

Examples:

1. format a virtio-blk device to add data integrity checks (T-10)

2. set 5 msix to VF_1, 12 msix to VF_2 and 2 msix to VF_3 before=20
enabling SRIOV

3. Get telemetry log

4. Get error log

5. Get vendor specific HW health report

6. Get generic virtio device health report

7. set 5 queues to VF_1, 12 queues to VF_2 and 2 queues to VF_3 before=20
enabling SRIOV


This knowledge is needed for the sys-admin and not the driver. The=20
driver will provide the channel to enable this configuration by an=20
orchestrator/admin.



>

