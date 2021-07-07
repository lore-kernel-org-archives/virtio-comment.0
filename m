Return-Path: <virtio-comment-return-1959-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 36EBF986462
	for <virtio-comment@lists.oasis-open.org>; Wed,  7 Jul 2021 17:01:59 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <6229141e-2604-d941-dfc4-2d8f414f4011@nvidia.com>
References: <20210624082032.44186-1-mgurtovoy@nvidia.com>
 <20210624082032.44186-2-mgurtovoy@nvidia.com> <8735t2m2uc.fsf@redhat.com>
 <6229141e-2604-d941-dfc4-2d8f414f4011@nvidia.com>
Date: Wed, 07 Jul 2021 19:01:38 +0200
Message-ID: <874kd6f47h.fsf@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH 1/1] live_migration: initial support
 for migrating virtio devices
Content-Type: text/plain
To: Max Gurtovoy <mgurtovoy@nvidia.com>, virtio-comment@lists.oasis-open.org, mst@redhat.com, jasowang@redhat.com
Cc: eperezma@redhat.com, aadam@redhat.com, oren@nvidia.com, shahafs@nvidia.com, parav@nvidia.com, bodong@nvidia.com, amikheev@nvidia.com, stefanha@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, Jul 07 2021, Max Gurtovoy <mgurtovoy@nvidia.com> wrote:

> On 6/28/2021 6:22 PM, Cornelia Huck wrote:
>> On Thu, Jun 24 2021, Max Gurtovoy <mgurtovoy@nvidia.com> wrote:
>>
>>> Describe the needed updates to the virtio specification for adding live
>>> migration support for various devices. Live migration is one of the most
>>> important features of virtualization and virtio devices are oftenly
>>> found in virtual environments so setting a standard mechanism for this
>>> feature will allow virtio providers to develop compliant devices that
>>> will use standard drivers for that matter.
>>>
>>> Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
>>> ---
>>>   virtio-live-migration.md | 399 +++++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 399 insertions(+)
>>>   create mode 100644 virtio-live-migration.md
>> What is the context of this file, and where is it supposed to live?
>
> This is initial RFC.
>
> We need to agree on the approach and then decide where we embed parts of 
> this file in proper places in the spec.

I'd probably have done a simple writeup for that (not a patch), that's
what confused me.

>
>>
>>> diff --git a/virtio-live-migration.md b/virtio-live-migration.md
>>> new file mode 100644
>>> index 0000000..8655375
>>> --- /dev/null
>>> +++ b/virtio-live-migration.md
>>> @@ -0,0 +1,399 @@
>>> +[VER]
>>> +
>>> +[DATE]
>>> +
>>> +# Overview
>>> +
>>> +This document will describe the needed updates to the virtio
>>> specification for adding live migration support for various
>>> devices. Live migration is one of the most important features of
>>> virtualization and virtio devices are oftenly found in virtual
>>> environments so setting a standard mechanism for this feature will
>>> allow virtio providers to develop compliant devices that will use
>>> standard drivers for that matter.
>> Is this supposed to happen on the device side? Do drivers need to get
>> involved, or is it transparent to them?
>
> Guest drivers should be involved.
>
> Hypervisor drivers should have the vfio re-design that we're doing now 
> in parallel.
>
> We'll develop new virtio_vfio_pci driver that will implement the 
> specification.
>
> Like we're doing for mlx5 NIC, the PF will be the communication channel 
> for the migration process.
>
> The virtio pci PF admin queue will be used for that matter. The PF will 
> not be migratable. It will manage the migration process for its VFs.

PF/VF is great as an example, but we really should keep it independent
of that concept, or at least the terminology.

Do we always need the separation of managed and managing devices?

>
>>
>>> +
>>> +In order to fulfil the Live migration requirements for virtual
>>> functions, each physical function controller must implement basic
>>> migration operations. Using these operations, it will be able to
>>> master the migration process for the virtual function
>>> controllers. Each capable physical function controller actually has a
>>> supervisor permissions to change the virtual function operational
>>> states, save/restore its internal state and start/stop dirty pages
>>> tracking.
>> Virtual/physical function sounds very PCI specific. Is this supposed to
>> be generic (with PCI being an example), or is this really about PCI
>> migration?
>
> PCI is a formal transport of virtio that support virtualization.
>
> Do you have more transports in mind that are in the spec that we would 
> like to migrate ?

I do not know if we would want something for e.g. the ccw transport, but
what's most important in my opinion is that we don't tie something to
PCI that's not inherently PCI-specific.

>
>
>>> +
>>> +Although the migration operations API is common, each controller has
>>> it's own internal implementation. For example, internal device state
>>> structure is different between the different types of
>>> controllers/providers.
>> What is a "controller" in this context?
>
> It's the device or device-fw/sw that manage it.

So, isn't it the 'device' in virtio parlance, then?

>
>>> +
>>> +The readers of this document are assumed to have a basic understanding in virtio, virtualization and migration process.
>>> +
>>> +## Terms
>>> +
>>> +| Name | Description       |
>>> +| ---- | ----------------- |
>>> +| PF   | Physical function |
>>> +| VF   | Virtual function  |
>>> +| VM   | Virtual machine   |
>>> +| FW   | Firmware          |
>>> +| HW   | Hardware          |
>>> +| SW   | Software          |
>>> +
>>> +# Scope
>>> +
>>> +This document will describe the following:
>>> +
>>> +1. Generic virtio device extensions
>>> +2. virtio block device extensions
>>> +3. virtio net device extensions
>>> +4. virtio fs device extensions - TBD
>>> +
>>> +# General
>>> +
>>> +## Dirty page tracking
>>> +
>>> +During live migration process the system memory pages that are
>>> modified in the "pre-copy" stage are called dirty pages. These pages
>>> must be retransmitted to the destination migration SW to update the
>>> memory content that was initially sent by the source migration SW. For
>>> some devices (e.g. storage controllers), it's vital that the migration
>>> SW will transfer these pages during "pre-copy" stage to reduce the
>>> downtime for the VM. This is important since storage devices might
>>> dirty a huge amount of pages at any time. For that reason, dirty page
>>> tracking while running is highly recommended feature for migration
>>> capable devices and especially for storage devices.
>> Is this designed to be similar to how vfio migration works?
>
> All the migration frameworks that I'm aware of using dirty page tracking 
> mechanism in "pre-copy".
>
> What do you mean similar to vfio ?

I was mostly thinking about the state machine defined for vfio migration.

>
>>
>>> +
>>> +When device is quiesced it is no longer capable of dirtying additional pages (e.g. in "stop-and-copy" and "resuming" stages). During the downtime of the VM, the migration SW will transfer the rest of the dirty pages to the destination.
>>> +
>>> +### Push tracking mode
>>> +
>>> +In this mode of operation, the device will get a pointer to a dedicated memory space that represents a dirty_page_map. The granularity of the map is negotiated during initialization and might be bit_per_page or byte_per_page. For each page that is dirtied by the device, it will mark the corresponding bit/byte in the dirty_page_map. The migration SW, will be responsible for managing this map and clear the relevant dirty page marks during the migration process in atomic way (e.g. using compare and swap).
>>> +
>>> +### Pull tracking mode
>>> +
>>> +In this mode of operation, the device will be asked to track and internally save a dirty_page_map. The granularity of the map is negotiated during initialization and might be bit_per_page or byte_per_page. For each page that is dirtied by the device, it will mark the corresponding bit/byte in the dirty_page_map. During the migration process, the migration SW, will ask the device to report the size of the dirty_page_map and copy the content of it to host memory.
>>> +
>>> +# Reserved Feature Bits
>>> +
>>> +According to the specification, these bits are device-independent feature bits.
>>> +
>>> +## VIRTIO_F_GENERIC_CTRL_VQ_VER_1
>>> +
>>> +Add a new feature bit to the specification:
>>> `VIRTIO_F_GENERIC_CTRL_VQ_VER_1 (39) Device supports a generic form
>>> version_1 for all commands that are isseud using the control virtq.`
>> What is the 'control virtq' in this context? Some devices already have a
>> control virtqueue, so I assume this is supposed to be something new?
>
> After sending this RFC I understood that there is a WIP to create new 
> admin_virtq.
>
> This queue should have generic and common command set and structure.
>
> I think the structure I used in this RFC can be used.

Sounds reasonable.

>
>>
>>> +
>>> +The commands of the generic version_1 control format are as follows:
>>> +
>>> +```c
>>> +struct virtio_generic_v1_ctrl {
>>> +	// Device-readable part
>>> +	u8 class;
>>> +	u8 command;
>>> +	u8 command-specific-data[];
>>> +	// Device-writable part
>>> +	u8 command-specific-result[];
>>> +	u8 ack;
>>> +};
>>> +
>>> +/* ack values */
>>> +#define VIRTIO_CTRL_OK 0
>>> +#define VIRTIO_CTRL_ERR 1
>>> +```
>>> +
>>> +The class, command and command-specific-data are set by the driver,
>>> and the device sets the ack byte and command-specific-result, if
>>> needed.
>> Do we need a way to specify the length of the data and result areas
>> (i.e. a built-in variable length specification vs a per-command one?) Is
>> the device required to ack all buffers that it consumes? Do we need a
>> way for the driver to discover which commands the device actually
>> supports?
>
> AFAIK in the virtio-blk command we don't specify the length and also the 
> structure of the virtio-net ctrl command doesn't do it.
>
> There should not be a difference here.

If we use a device type agnostic queue, we might need to specify
something. Just a thought.

>
>>
>>> +
>>> +Note: feature bit 39 was chosen until it will be standardized by the virtio specification working group (This is the first free bit in the "Reserved Feature Bits").
>>> +
>>> +## VIRTIO_F_VF_MIGRATION
>>> +
>>> +Add a new feature bit to the specification: `VIRTIO_F_VF_MIGRATION
>>> (40) Device can control live migration operation for its virtual
>>> functions`. This feature indicates that the device can manage the live
>>> migration process of its virtual functions. This feature is currently
>>> supported only for physical virtio PCI based functions. Thus, the
>>> device should offer `VIRTIO_F_VF_MIGRATION` feature bit if
>>> `VIRTIO_F_SR_IOV` feature bit to be offered as well for the specific
>>> device. Otherwise, it must not offer `VIRTIO_F_VF_MIGRATION`.
>> This feels overly restrictive. If a generic migration feature makes
>> sense, it should possibly be available to other implementations as
>> well.
>
> Which implementations ?

Any that are not SR-IOV.

>
>>
>> Also, is this 'support migration' or 'support dirty page reporting' (or
>> something like that?) The latter might be potentially useful for other
>> cases, and should probably not be tied to a 'migration' concept.
>
> I guess dirty page tracking can be another feature bit.
>
>>
>>> +
>>> +The driver will use the control virtq to communicate migration
>>> commands to the device. Thus, the device should offer a control virtq
>>> feature. Otherwise, it must not offer `VIRTIO_F_VF_MIGRATION`. The
>>> driver should negotiate the generic format of the commands that will
>>> be supported. Currently only the generic version_1 control format (see
>>> section 5) is supported. For that, the
>>> `VIRTIO_F_GENERIC_CTRL_VQ_VER_1` feature bit should be offered by the
>>> device and negotiated.
>> I'm not sure how much sense a generic control queue interface makes for
>> this feature. Do we expect to run different classes of control commands
>> via that queue? If not, would a concrete migration/dirty page tracking
>> control queue make more sense?
>>
>>> +
>>> +A PF driver must complete `VIRTIO_F_VF_MIGRATION` negotiation before starting live migration process for any virtual function that is related to that PF.
>>> +
>>> +Note: feature bit 40 was chosen until it will be standardized by the virtio specification working group (This is the first free bit in the "Reserved Feature Bits").
>>> +
>>> +#  Reserved Control Commands
>>> +
>>> +Currently only 1 generic control format was defined (see section 4.1).
>>> +
>>> +For supporting devices the following command classes are reserved for specific device types:
>>> +
>>> +```c
>>> +/* class values that are device specific */
>>> +#define VIRTIO_GENERIC_V1_DEVICE_SPECIFIC_CTRL_CLASS_F_START 0
>>> +#define VIRTIO_GENERIC_V1_DEVICE_SPECIFIC_CTRL_CLASS_F_END 127
>>> +```
>>> +
>>> +For supporting devices the following command classes are common and device-independent:
>>> +
>>> +```c
>>> +/* class values that are device independent */
>>> +#define VIRTIO_GENERIC_V1_DEVICE_COMMON_CTRL_CLASS_F_START 128
>>> +#define VIRTIO_GENERIC_V1_DEVICE_COMMON_CTRL_CLASS_F_END 255
>>> +```
>> I'm not sure whether splitting the commands is better than defining
>> distinct control queues for distinct purposes. How do different commands
>> on a queue interact with each other? Say one buffer contains some kind
>> of migration command, the next one a device-specific command that
>> triggers a long-running action, and the next one another migration
>> command. Is it acceptable for that long-running command to hold up the
>> migration?
>
> how do you solve "long" command vs. "short" commands in virtio blk
> device ?

That's for virtio-blk experts to answer, I do not know.

Whether we need two queues really depends on the nature of the commands
that are supposed to go on there. We might be happy with just one queue.


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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

