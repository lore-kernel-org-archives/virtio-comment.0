Return-Path: <virtio-comment-return-1954-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5C194986457
	for <virtio-comment@lists.oasis-open.org>; Wed,  7 Jul 2021 12:51:37 +0000 (UTC)
References: <20210624082032.44186-1-mgurtovoy@nvidia.com>
 <20210624082032.44186-2-mgurtovoy@nvidia.com> <8735t2m2uc.fsf@redhat.com>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <6229141e-2604-d941-dfc4-2d8f414f4011@nvidia.com>
Date: Wed, 7 Jul 2021 15:51:25 +0300
MIME-Version: 1.0
In-Reply-To: <8735t2m2uc.fsf@redhat.com>
Subject: Re: [virtio-comment] [PATCH 1/1] live_migration: initial support for
 migrating virtio devices
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>, virtio-comment@lists.oasis-open.org, mst@redhat.com, jasowang@redhat.com
Cc: eperezma@redhat.com, aadam@redhat.com, oren@nvidia.com, shahafs@nvidia.com, parav@nvidia.com, bodong@nvidia.com, amikheev@nvidia.com, stefanha@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>


On 6/28/2021 6:22 PM, Cornelia Huck wrote:
> On Thu, Jun 24 2021, Max Gurtovoy <mgurtovoy@nvidia.com> wrote:
>
>> Describe the needed updates to the virtio specification for adding live
>> migration support for various devices. Live migration is one of the most
>> important features of virtualization and virtio devices are oftenly
>> found in virtual environments so setting a standard mechanism for this
>> feature will allow virtio providers to develop compliant devices that
>> will use standard drivers for that matter.
>>
>> Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
>> ---
>>   virtio-live-migration.md | 399 +++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 399 insertions(+)
>>   create mode 100644 virtio-live-migration.md
> What is the context of this file, and where is it supposed to live?

This is initial RFC.

We need to agree on the approach and then decide where we embed parts of 
this file in proper places in the spec.

>
>> diff --git a/virtio-live-migration.md b/virtio-live-migration.md
>> new file mode 100644
>> index 0000000..8655375
>> --- /dev/null
>> +++ b/virtio-live-migration.md
>> @@ -0,0 +1,399 @@
>> +[VER]
>> +
>> +[DATE]
>> +
>> +# Overview
>> +
>> +This document will describe the needed updates to the virtio
>> specification for adding live migration support for various
>> devices. Live migration is one of the most important features of
>> virtualization and virtio devices are oftenly found in virtual
>> environments so setting a standard mechanism for this feature will
>> allow virtio providers to develop compliant devices that will use
>> standard drivers for that matter.
> Is this supposed to happen on the device side? Do drivers need to get
> involved, or is it transparent to them?

Guest drivers should be involved.

Hypervisor drivers should have the vfio re-design that we're doing now 
in parallel.

We'll develop new virtio_vfio_pci driver that will implement the 
specification.

Like we're doing for mlx5 NIC, the PF will be the communication channel 
for the migration process.

The virtio pci PF admin queue will be used for that matter. The PF will 
not be migratable. It will manage the migration process for its VFs.

>
>> +
>> +In order to fulfil the Live migration requirements for virtual
>> functions, each physical function controller must implement basic
>> migration operations. Using these operations, it will be able to
>> master the migration process for the virtual function
>> controllers. Each capable physical function controller actually has a
>> supervisor permissions to change the virtual function operational
>> states, save/restore its internal state and start/stop dirty pages
>> tracking.
> Virtual/physical function sounds very PCI specific. Is this supposed to
> be generic (with PCI being an example), or is this really about PCI
> migration?

PCI is a formal transport of virtio that support virtualization.

Do you have more transports in mind that are in the spec that we would 
like to migrate ?


>> +
>> +Although the migration operations API is common, each controller has
>> it's own internal implementation. For example, internal device state
>> structure is different between the different types of
>> controllers/providers.
> What is a "controller" in this context?

It's the device or device-fw/sw that manage it.

>> +
>> +The readers of this document are assumed to have a basic understanding in virtio, virtualization and migration process.
>> +
>> +## Terms
>> +
>> +| Name | Description       |
>> +| ---- | ----------------- |
>> +| PF   | Physical function |
>> +| VF   | Virtual function  |
>> +| VM   | Virtual machine   |
>> +| FW   | Firmware          |
>> +| HW   | Hardware          |
>> +| SW   | Software          |
>> +
>> +# Scope
>> +
>> +This document will describe the following:
>> +
>> +1. Generic virtio device extensions
>> +2. virtio block device extensions
>> +3. virtio net device extensions
>> +4. virtio fs device extensions - TBD
>> +
>> +# General
>> +
>> +## Dirty page tracking
>> +
>> +During live migration process the system memory pages that are
>> modified in the "pre-copy" stage are called dirty pages. These pages
>> must be retransmitted to the destination migration SW to update the
>> memory content that was initially sent by the source migration SW. For
>> some devices (e.g. storage controllers), it's vital that the migration
>> SW will transfer these pages during "pre-copy" stage to reduce the
>> downtime for the VM. This is important since storage devices might
>> dirty a huge amount of pages at any time. For that reason, dirty page
>> tracking while running is highly recommended feature for migration
>> capable devices and especially for storage devices.
> Is this designed to be similar to how vfio migration works?

All the migration frameworks that I'm aware of using dirty page tracking 
mechanism in "pre-copy".

What do you mean similar to vfio ?

>
>> +
>> +When device is quiesced it is no longer capable of dirtying additional pages (e.g. in "stop-and-copy" and "resuming" stages). During the downtime of the VM, the migration SW will transfer the rest of the dirty pages to the destination.
>> +
>> +### Push tracking mode
>> +
>> +In this mode of operation, the device will get a pointer to a dedicated memory space that represents a dirty_page_map. The granularity of the map is negotiated during initialization and might be bit_per_page or byte_per_page. For each page that is dirtied by the device, it will mark the corresponding bit/byte in the dirty_page_map. The migration SW, will be responsible for managing this map and clear the relevant dirty page marks during the migration process in atomic way (e.g. using compare and swap).
>> +
>> +### Pull tracking mode
>> +
>> +In this mode of operation, the device will be asked to track and internally save a dirty_page_map. The granularity of the map is negotiated during initialization and might be bit_per_page or byte_per_page. For each page that is dirtied by the device, it will mark the corresponding bit/byte in the dirty_page_map. During the migration process, the migration SW, will ask the device to report the size of the dirty_page_map and copy the content of it to host memory.
>> +
>> +# Reserved Feature Bits
>> +
>> +According to the specification, these bits are device-independent feature bits.
>> +
>> +## VIRTIO_F_GENERIC_CTRL_VQ_VER_1
>> +
>> +Add a new feature bit to the specification:
>> `VIRTIO_F_GENERIC_CTRL_VQ_VER_1 (39) Device supports a generic form
>> version_1 for all commands that are isseud using the control virtq.`
> What is the 'control virtq' in this context? Some devices already have a
> control virtqueue, so I assume this is supposed to be something new?

After sending this RFC I understood that there is a WIP to create new 
admin_virtq.

This queue should have generic and common command set and structure.

I think the structure I used in this RFC can be used.

>
>> +
>> +The commands of the generic version_1 control format are as follows:
>> +
>> +```c
>> +struct virtio_generic_v1_ctrl {
>> +	// Device-readable part
>> +	u8 class;
>> +	u8 command;
>> +	u8 command-specific-data[];
>> +	// Device-writable part
>> +	u8 command-specific-result[];
>> +	u8 ack;
>> +};
>> +
>> +/* ack values */
>> +#define VIRTIO_CTRL_OK 0
>> +#define VIRTIO_CTRL_ERR 1
>> +```
>> +
>> +The class, command and command-specific-data are set by the driver,
>> and the device sets the ack byte and command-specific-result, if
>> needed.
> Do we need a way to specify the length of the data and result areas
> (i.e. a built-in variable length specification vs a per-command one?) Is
> the device required to ack all buffers that it consumes? Do we need a
> way for the driver to discover which commands the device actually
> supports?

AFAIK in the virtio-blk command we don't specify the length and also the 
structure of the virtio-net ctrl command doesn't do it.

There should not be a difference here.

>
>> +
>> +Note: feature bit 39 was chosen until it will be standardized by the virtio specification working group (This is the first free bit in the "Reserved Feature Bits").
>> +
>> +## VIRTIO_F_VF_MIGRATION
>> +
>> +Add a new feature bit to the specification: `VIRTIO_F_VF_MIGRATION
>> (40) Device can control live migration operation for its virtual
>> functions`. This feature indicates that the device can manage the live
>> migration process of its virtual functions. This feature is currently
>> supported only for physical virtio PCI based functions. Thus, the
>> device should offer `VIRTIO_F_VF_MIGRATION` feature bit if
>> `VIRTIO_F_SR_IOV` feature bit to be offered as well for the specific
>> device. Otherwise, it must not offer `VIRTIO_F_VF_MIGRATION`.
> This feels overly restrictive. If a generic migration feature makes
> sense, it should possibly be available to other implementations as
> well.

Which implementations ?

>
> Also, is this 'support migration' or 'support dirty page reporting' (or
> something like that?) The latter might be potentially useful for other
> cases, and should probably not be tied to a 'migration' concept.

I guess dirty page tracking can be another feature bit.

>
>> +
>> +The driver will use the control virtq to communicate migration
>> commands to the device. Thus, the device should offer a control virtq
>> feature. Otherwise, it must not offer `VIRTIO_F_VF_MIGRATION`. The
>> driver should negotiate the generic format of the commands that will
>> be supported. Currently only the generic version_1 control format (see
>> section 5) is supported. For that, the
>> `VIRTIO_F_GENERIC_CTRL_VQ_VER_1` feature bit should be offered by the
>> device and negotiated.
> I'm not sure how much sense a generic control queue interface makes for
> this feature. Do we expect to run different classes of control commands
> via that queue? If not, would a concrete migration/dirty page tracking
> control queue make more sense?
>
>> +
>> +A PF driver must complete `VIRTIO_F_VF_MIGRATION` negotiation before starting live migration process for any virtual function that is related to that PF.
>> +
>> +Note: feature bit 40 was chosen until it will be standardized by the virtio specification working group (This is the first free bit in the "Reserved Feature Bits").
>> +
>> +#  Reserved Control Commands
>> +
>> +Currently only 1 generic control format was defined (see section 4.1).
>> +
>> +For supporting devices the following command classes are reserved for specific device types:
>> +
>> +```c
>> +/* class values that are device specific */
>> +#define VIRTIO_GENERIC_V1_DEVICE_SPECIFIC_CTRL_CLASS_F_START 0
>> +#define VIRTIO_GENERIC_V1_DEVICE_SPECIFIC_CTRL_CLASS_F_END 127
>> +```
>> +
>> +For supporting devices the following command classes are common and device-independent:
>> +
>> +```c
>> +/* class values that are device independent */
>> +#define VIRTIO_GENERIC_V1_DEVICE_COMMON_CTRL_CLASS_F_START 128
>> +#define VIRTIO_GENERIC_V1_DEVICE_COMMON_CTRL_CLASS_F_END 255
>> +```
> I'm not sure whether splitting the commands is better than defining
> distinct control queues for distinct purposes. How do different commands
> on a queue interact with each other? Say one buffer contains some kind
> of migration command, the next one a device-specific command that
> triggers a long-running action, and the next one another migration
> command. Is it acceptable for that long-running command to hold up the
> migration?

how do you solve "long" command vs. "short" commands in virtio blk device ?

>
>> +
>> +## VF Live Migration control commands
>> +
>> +if `VIRTIO_F_VF_MIGRATION` feature is negotiated, the driver can send control commands for performing live migration operation for a virtual function that is related to the physical virtio controller. These commands will be issued using the control virtqueue with the generic version_1 control format that was negotiated via `VIRTIO_F_GENERIC_CTRL_VQ_VER_1` feature bit.
>> +
>> +Supported commands (are part of the class values that are device independent) :
>> +
>> +```c
>> +#define VIRTIO_GENERIC_V1_CTRL_VF_MIGRATION 128 //This is the class (bellow are the commands)
>> + #define VIRTIO_CTRL_VF_MIGRATION_IDENTIFY 0
>> + #define VIRTIO_CTRL_VF_MIGRATION_START_DIRTY_PAGE_TRACK 1 //choose reporting mode
>> + #define VIRTIO_CTRL_VF_MIGRATION_STOP_DIRTY_PAGE_TRACK 2
>> + #define VIRTIO_CTRL_VF_MIGRATION_GET_DIRTY_REPORT_SIZE 3 //valid for pull modes only
>> + #define VIRTIO_CTRL_VF_MIGRATION_REPORT_DIRTY_PAGES 4 //valid for pull modes only
>> + #define VIRTIO_CTRL_VF_MIGRATION_SET_STATE 5
>> + #define VIRTIO_CTRL_VF_MIGRATION_GET_STATE_ATTRS 6
>> + #define VIRTIO_CTRL_VF_MIGRATION_SAVE_STATE 7
>> + #define VIRTIO_CTRL_VF_MIGRATION_RESTORE_STATE 8
>> +```
>> +
>> +### VIRTIO_CTRL_VF_MIGRATION_IDENTIFY (0)
>> +
>> +This command has no command specific data set by the driver.
>> +
>> +The following is the command specific result that the device should return upon successful operation:
>> +
>> +```c
>> +enum virtio_dirty_page_track_mode_caps {
>> +    VIRTIO_ID_DIRTY_TRACK_PUSH_BITMAP = 1 << 0, /* push mode with bit granularity */
>> +    VIRTIO_ID_DIRTY_TRACK_PUSH_BYTEMAP = 1 << 1, /* push mode with byte granularity */
>> +    VIRTIO_ID_DIRTY_TRACK_PULL_BITMAP = 1 << 2, /* pull mode with bit granularity */
>> +    VIRTIO_ID_DIRTY_TRACK_PULL_BYTEMAP = 1 << 3, /* pull mode with byte granularity */
>> +};
>> +
>> +struct virtio_ctrl_vf_mig_get_identify_result {
>> +	__virtio16 mjr_ver;
>> +	__virtio16 mnr_ver;
>> +	__virtio16 ter_ver;
>> +
>> +    /* bitmap of enum virtio_dirty_page_track_mode_caps */
>> +	__virtio16 dirty_page_track_modes;
>> +    /* number of pages the device can track per vf in pull bitmap mode (log) */
>> +	__virtio16 log_max_pages_track_pull_bitmap_mode;
>> +    /* number of pages the device can track per vf in pull bytemap mode (log) */
>> +	__virtio16 log_max_pages_track_pull_bytemap_mode;
>> +	__virtio32 reserved;
>> +};
> These should all be little-endian (as this will not be available to
> legacy devices.)
>
>> +```
>> +
>> +### VIRTIO_CTRL_VF_MIGRATION_START_DIRTY_PAGE_TRACK (1)
>> +
>> +The following is the command specific data that the driver should send:
>> +
>> +```c
>> +enum virtio_dirty_track_mode {
>> +    VIRTIO_M_DIRTY_TRACK_PUSH_BITMAP = 1, /* Use push mode with bit granularity */
>> +    VIRTIO_M_DIRTY_TRACK_PUSH_BYTEMAP = 2, /* Use push mode with byte granularity */
>> +	VIRTIO_M_DIRTY_TRACK_PULL_BITMAP = 3, /* Use pull mode with bit granularity */
>> +    VIRTIO_M_DIRTY_TRACK_PULL_BYTEMAP = 4, /* Use pull mode with byte granularity */
>> +};
>> +struct virtio_ctrl_vf_mig_start_dirty_page_track {
>> +	__virtio16 func_id;
>> +	__virtio16 mode;
>> +	u8 reserved;
>> +	u8 data[]; /* push mode only */
>> +};
>> +```
>> +
>> +This command has no command specific result set by the device.
>> +
>> +Note_1: In *push* mode, the posted data descriptors will set `VIRTQ_DESC_F_INDIRECT` flag. These descriptors will point to a table of descriptors anywhere in the memory. The memory pointed by the indirect descriptor table will be used by the device until `VIRTIO_CTRL_VF_MIGRATION_STOP_DIRTY_PAGE_TRACK` command will finish successfully. The driver can't free this memory before that, with the exception of device reset.
>> +
>> +Note_2: `push` mode should be supported only for devices that support `VIRTIO_F_INDIRECT_DESC` feature.
>> +
>> +### VIRTIO_CTRL_VF_MIGRATION_STOP_DIRTY_PAGE_TRACK (2)
>> +
>> +The following is the command specific data that the driver should send:
>> +
>> +```c
>> +struct virtio_ctrl_vf_mig_stop_dirty_page_track {
>> +	__virtio16 func_id;
>> +};
>> +```
>> +
>> +This command has no command specific result set by the device.
>> +
>> +Note: In *push* mode, the memory pointed by the indirect descriptors that were provided during `VIRTIO_CTRL_VF_MIGRATION_START_DIRTY_PAGE_TRACK` command will become available to the driver upon successful completion. The device is not allowed to access this memory anymore and the driver may free this memory.
>> +
>> +### VIRTIO_CTRL_VF_MIGRATION_GET_DIRTY_REPORT_SIZE (3)
>> +
>> +The following is the command specific data that the driver should send:
>> +
>> +```c
>> +struct virtio_ctrl_vf_mig_get_dirty_report_size {
>> +	__virtio16 func_id;
>> +};
>> +```
>> +
>> +The following is the command specific result that the device should return upon successful operation:
>> +
>> +```c
>> +struct virtio_ctrl_vf_mig_get_dirty_report_size_result {
>> +	__virtio32 len;
>> +};
>> +```
>> +
>> +### VIRTIO_CTRL_VF_MIGRATION_REPORT_DIRTY_PAGES (4)
>> +
>> +The following is the command data that the driver should send:
>> +
>> +```c
>> +struct virtio_ctrl_vf_mig_report_dirty_pages {
>> +	__virtio16 func_id;
>> +	__virtio16 reserved;
>> +	__virtio32 offset; /* Offset in the device internal report (in case we want to copy in portions) */
>> +};
>> +```
>> +
>> +The following is the command specific result that the device should return upon successful operation:
>> +
>> +```c
>> +struct virtio_ctrl_vf_mig_report_dirty_pages_result {
>> +	u8 data[];
>> +};
>> +```
>> +
>> +### VIRTIO_CTRL_VF_MIGRATION_SET_STATE (5)
>> +
>> +The following is the command specific data that the driver should send:
>> +
>> +```c
>> +enum virtio_internal_state {
>> +    /* Reset occured. The device is in initial state. aka FLR state */
>> +    VIRTIO_S_INIT = 0,
>> +    /* The device is running (unquiesced and unfreezed) */
>> +    VIRTIO_S_RUNNING = 1,
>> +    /*
>> +     * The device has been quiesced (Internal state can be changed.
>> +     * Can't master transactions)
>> +     */
>> +    VIRTIO_S_QUIESCED = 2,
>> +    /*
>> +     * The device has been freezed (Internal state can't be changed.
>> +     * Can't master transactions. SAVE_STATE and RESTORE_STATE are allowed.)
>> +     */
>> +    VIRTIO_S_FREEZED = 3,
>> +};
> What are 'transactions'?

dirty guest memory and change other devices internal states.

>
>> +
>> +struct virtio_ctrl_vf_mig_set_state {
>> +	__virtio16 func_id;
>> +	__virtio16 state; /* value from enum virtio_internal_state */
>> +};
>> +```
>> +
>> +This command has no command specific result set by the device.
>> +
>> +Bellow the state machine definition:
>> +
>> +```
>> +                                    +-----------------------------+
>> +                                    |                             +<--------QUIESCE ("UNFREEZE")
>> +              +---QUIESCE----------->      QUIESCED               |                        |
>> +              |                     |                             +----FREEZE--+           |
>> +              |      +--------------+                             |            |           |
>> +              |      |              +---------^------+------------+            |           |
>> +              |      |                        |      |                         |           |
>> +              | RUN ("UNQUIESCE")             |      |                         |           |
>> +              |      |                        |     FLR                        |           |
>> ++-------------+------v--------+               |      |                  +------v-----------+----------+
>> +|                             |               |      |                  |                             |
>> +|        RUNNING              +---FLR-----+   |      |    +---FLR-------+     FREEZED                 |
>> +|                             |           |   |      |    |             |                             |
>> +|                             |           | QUIESCE  |    |             |                             |
>> ++-------------^---------------+           |   |      |    |             +----------^------------------+
>> +              |                           |   |      |    |                        |
>> +              |                           |   |      |    |                        |
>> +              |                           |   |      |    |                        |
>> +              |                      +----v---+------v----v--------+               |
>> +              |                      |                             |               |
>> +              |                      |         INIT                |               |
>> +              +-----RUN--------------+                             +-----FREEZE----+
>> +                                     |                             |
>> +                                     +-----------------------------+
>> +
>> +```
>> +
>> +Note: The device can implicitly move to "INIT" state (from any other state) in case of FLR detection and implicitly move to "RUNNING" (only from "INIT" state) in case of driver detection.
>> +
>> +### VIRTIO_CTRL_VF_MIGRATION_GET_STATE_ATTR (6)
>> +
>> +The following is the command specific data that the driver should send:
>> +
>> +```c
>> +struct virtio_ctrl_vf_mig_get_state_attr {
>> +	__virtio16 func_id;
>> +};
>> +```
>> +
>> +The following is the command specific result that the device should return upon successful operation:
>> +
>> +```c
>> +enum virtio_internal_state {
>> +    /* Reset occured. The device is in initial state. aka FLR state */
>> +    VIRTIO_S_INIT = 0,
>> +    /* The device is running (unquiesced and unfreezed) */
>> +    VIRTIO_S_RUNNING = 1,
>> +    /*
>> +     * The device has been quiesced (Internal state can be changed.
>> +     * Can't master transactions)
>> +     */
>> +    VIRTIO_S_QUIESCED = 2,
>> +    /*
>> +     * The device has been freezed (Internal state can't be changed.
>> +     * Can't master transactions. SAVE_STATE and RESTORE_STATE are allowed.)
>> +     */
>> +    VIRTIO_S_FREEZED = 3,
>> +};
>> +
>> +struct virtio_ctrl_vf_mig_get_state_attr_result {
>> +	__virtio32 len;
>> +	__virtio16 state; /* value from enum virtio_internal_state */
>> +};
>> +```
>> +
>> +### VIRTIO_CTRL_VF_MIGRATION_SAVE_STATE (7)
>> +
>> +The following is the command data that the driver should send:
>> +
>> +```c
>> +struct virtio_ctrl_vf_mig_save_state {
>> +	__virtio16 func_id;
>> +	__virtio16 reserved;
>> +	__virtio32 offset; /* offset in the device internal state (in case we want to copy state in portions) */
>> +};
>> +```
>> +
>> +The following is the command specific result that the device should return upon successful operation:
>> +
>> +```c
>> +struct virtio_ctrl_vf_mig_save_state_result {
>> +	u8 data[];
>> +};
>> +```
>> +
>> +### VIRTIO_CTRL_VF_MIGRATION_RESTORE_STATE (8)
>> +
>> +The following is the command data that the driver should send:
>> +
>> +```c
>> +struct virtio_ctrl_vf_mig_restore_state {
>> +	__virtio16 func_id;
>> +	__virtio16 reserved;
>> +	__virtio32 offset; /* offset in the device internal state (in case we want to restore state in portions) */
>> +	u8 data[];
>> +};
>> +```
>> +
>> +This command has no command specific result set by the device.
>> +
>> +# VIRTIO BLK
>> +
>> +## Feature bits
>> +
>> +Add a new feature bit to virtio Block device specification: `VIRTIO_BLK_F_CTRL_VQ (15) Control channel is available.` The controlq exists only if VIRTIO_BLK_F_CTRL_VQ set by the controller. The controlq is another virtq in the device virtq list. Thus, for backward compatibility, the `VIRTIO_BLK_F_CTRL_VQ` feature bit requires `VIRTIO_BLK_F_MQ` feature bit to be set. The controlq is used to administer the device (not to confuse with the already defined "device features" VIRTIO_BLK_F_*).
>> +
>> +Note: feature bit 15 was chosen until it will be standardized by the virtio specification working group (This is the first free bit in the virtio block "Feature bits").
>> +
>> +## Control Virtqueue
>> +
>> +The driver uses the control virtqueue (if VIRTIO_BLK_F_CTRL_VQ is negotiated) to send commands to manipulate various features of the device which would not easily map into the configuration space (similar to virtio net control queue). Live migration is one of these features.
>> +
>> +The control virtq will the (N + 1) queue while N is set by virtio_blk_config.num_queues (that will imply on the maximal number of request queues). This is similar to VIRTIO Crypto device controlq numbering logic.
>> +
>> +Note: We can fix the BLK spec bug and change the controlq to be the N queue.
>> +
>> +If the `VIRTIO_F_GENERIC_CTRL_VQ_VER_1` feature was negotiated, all the commands that will be issued using this controlq will use the generic version_1 control format (section 4.1).
>> +
>> +# VIRTIO NET
>> +
>> +## Feature bits
>> +
>> +VIRTIO_NET_F_CTRL_VQ feature already exist in the specification.
>> +
>> +## Control Virtqueue
>> +
>> +The driver uses the control virtqueue (if VIRTIO_NET_F_CTRL_VQ is negotiated) to send commands to manipulate the live migration process.
>> +
>> +If the `VIRTIO_F_GENERIC_CTRL_VQ_VER_1` feature was negotiated, all
>> the commands that will be issued using this controlq will use the
>> generic version_1 control format (section 4.1).
> This is overloading the existing control queue definition; that feels
> wrong to me.
>
>> +
>> +# VIRTIO FS
> All in all, I'm not quite sure where this is supposed to be going. What
> are the concrete problems that this dirty page tracking interface is
> supposed to solve?
>
> If we need an interface like that, I'd vote for a separate virtqueue for
> that purpose, which could in theory be negotiated for every device.

Yes. As mentioned above, new admin virtq is needed.

What is the issue you see with dirty page tracking ?

We provide 2 modes of operation (push and pull) that each device can 
chose what ever it wants to implement.

The purpose of this RFC is to agree on the approach: PF manages VF 
migration, new admin virtq, new admin commands for live migration, dirty 
page tracking modes and state machine.

Later we'll divide the RFC to few smaller parts.

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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

