Return-Path: <stefanha@redhat.com>
Date: Mon, 5 Jul 2021 16:45:27 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 1/1] live_migration: initial support for migrating virtio
 devices
Message-ID: <YOMpF2Ga0g2HnawH@stefanha-x1.localdomain>
References: <20210624082032.44186-1-mgurtovoy@nvidia.com>
 <20210624082032.44186-2-mgurtovoy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="45jEPmIreje3BTF6"
Content-Disposition: inline
In-Reply-To: <20210624082032.44186-2-mgurtovoy@nvidia.com>
To: Max Gurtovoy <mgurtovoy@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, mst@redhat.com, jasowang@redhat.com, cohuck@redhat.com, eperezma@redhat.com, aadam@redhat.com, oren@nvidia.com, shahafs@nvidia.com, parav@nvidia.com, bodong@nvidia.com, amikheev@nvidia.com
List-ID: <virtio-comment.lists.oasis-open.org>


--45jEPmIreje3BTF6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 24, 2021 at 11:20:32AM +0300, Max Gurtovoy wrote:
> +## VIRTIO_F_GENERIC_CTRL_VQ_VER_1
> +
> +Add a new feature bit to the specification: `VIRTIO_F_GENERIC_CTRL_VQ_VER_1 (39) Device supports a generic form version_1 for all commands that are isseud using the control virtq.`

Another idea for the name "device control virtqueue" (devctrl vq).

> +
> +The commands of the generic version_1 control format are as follows:
> +
> +```c
> +struct virtio_generic_v1_ctrl {
> +	// Device-readable part
> +	u8 class;
> +	u8 command;
> +	u8 command-specific-data[];
> +	// Device-writable part
> +	u8 command-specific-result[];
> +	u8 ack;
> +};
> +
> +/* ack values */
> +#define VIRTIO_CTRL_OK 0
> +#define VIRTIO_CTRL_ERR 1
> +```
> +
> +The class, command and command-specific-data are set by the driver, and the device sets the ack byte and command-specific-result, if needed.
> +
> +Note: feature bit 39 was chosen until it will be standardized by the virtio specification working group (This is the first free bit in the "Reserved Feature Bits").
> +
> +## VIRTIO_F_VF_MIGRATION
> +
> +Add a new feature bit to the specification: `VIRTIO_F_VF_MIGRATION (40) Device can control live migration operation for its virtual functions`. This feature indicates that the device can manage the live migration process of its virtual functions. This feature is currently supported only for physical virtio PCI based functions. Thus, the device should offer `VIRTIO_F_VF_MIGRATION` feature bit if `VIRTIO_F_SR_IOV` feature bit to be offered as well for the specific device. Otherwise, it must not offer `VIRTIO_F_VF_MIGRATION`.

Hmm...Hybrid software/hardware approaches using vDPA or VFIO/mdev are
becoming popular. I think there should be a clear path for enabling this
for non-SR-IOV devices. The virtqueue format is what needs to be
standardized. Beyond that the vDPA or mdev driver can set up the
virtqueue so the host kernel is able to communicate with the physical
device.

The question is which parts of this spec are SR-IOV specific and how can
they be generalized so that vDPA and VFIO/mdev devices can use them
too?

> +
> +The driver will use the control virtq to communicate migration commands to the device. Thus, the device should offer a control virtq feature. Otherwise, it must not offer `VIRTIO_F_VF_MIGRATION`. The driver should negotiate the generic format of the commands that will be supported. Currently only the generic version_1 control format (see section 5) is supported. For that, the `VIRTIO_F_GENERIC_CTRL_VQ_VER_1` feature bit should be offered by the device and negotiated.
> +
> +A PF driver must complete `VIRTIO_F_VF_MIGRATION` negotiation before starting live migration process for any virtual function that is related to that PF.
> +
> +Note: feature bit 40 was chosen until it will be standardized by the virtio specification working group (This is the first free bit in the "Reserved Feature Bits").
> +
> +#  Reserved Control Commands
> +
> +Currently only 1 generic control format was defined (see section 4.1).
> +
> +For supporting devices the following command classes are reserved for specific device types:
> +
> +```c
> +/* class values that are device specific */
> +#define VIRTIO_GENERIC_V1_DEVICE_SPECIFIC_CTRL_CLASS_F_START 0
> +#define VIRTIO_GENERIC_V1_DEVICE_SPECIFIC_CTRL_CLASS_F_END 127
> +```
> +
> +For supporting devices the following command classes are common and device-independent:
> +
> +```c
> +/* class values that are device independent */
> +#define VIRTIO_GENERIC_V1_DEVICE_COMMON_CTRL_CLASS_F_START 128
> +#define VIRTIO_GENERIC_V1_DEVICE_COMMON_CTRL_CLASS_F_END 255
> +```
> +
> +## VF Live Migration control commands
> +
> +if `VIRTIO_F_VF_MIGRATION` feature is negotiated, the driver can send control commands for performing live migration operation for a virtual function that is related to the physical virtio controller. These commands will be issued using the control virtqueue with the generic version_1 control format that was negotiated via `VIRTIO_F_GENERIC_CTRL_VQ_VER_1` feature bit.
> +
> +Supported commands (are part of the class values that are device independent) :
> +
> +```c
> +#define VIRTIO_GENERIC_V1_CTRL_VF_MIGRATION 128 //This is the class (bellow are the commands)
> + #define VIRTIO_CTRL_VF_MIGRATION_IDENTIFY 0
> + #define VIRTIO_CTRL_VF_MIGRATION_START_DIRTY_PAGE_TRACK 1 //choose reporting mode
> + #define VIRTIO_CTRL_VF_MIGRATION_STOP_DIRTY_PAGE_TRACK 2
> + #define VIRTIO_CTRL_VF_MIGRATION_GET_DIRTY_REPORT_SIZE 3 //valid for pull modes only
> + #define VIRTIO_CTRL_VF_MIGRATION_REPORT_DIRTY_PAGES 4 //valid for pull modes only
> + #define VIRTIO_CTRL_VF_MIGRATION_SET_STATE 5
> + #define VIRTIO_CTRL_VF_MIGRATION_GET_STATE_ATTRS 6
> + #define VIRTIO_CTRL_VF_MIGRATION_SAVE_STATE 7
> + #define VIRTIO_CTRL_VF_MIGRATION_RESTORE_STATE 8
> +```
> +
> +### VIRTIO_CTRL_VF_MIGRATION_IDENTIFY (0)
> +
> +This command has no command specific data set by the driver.
> +
> +The following is the command specific result that the device should return upon successful operation:
> +
> +```c
> +enum virtio_dirty_page_track_mode_caps {
> +    VIRTIO_ID_DIRTY_TRACK_PUSH_BITMAP = 1 << 0, /* push mode with bit granularity */
> +    VIRTIO_ID_DIRTY_TRACK_PUSH_BYTEMAP = 1 << 1, /* push mode with byte granularity */
> +    VIRTIO_ID_DIRTY_TRACK_PULL_BITMAP = 1 << 2, /* pull mode with bit granularity */
> +    VIRTIO_ID_DIRTY_TRACK_PULL_BYTEMAP = 1 << 3, /* pull mode with byte granularity */
> +};
> +
> +struct virtio_ctrl_vf_mig_get_identify_result {
> +	__virtio16 mjr_ver;
> +	__virtio16 mnr_ver;
> +	__virtio16 ter_ver;

How are these fields used?

> +
> +    /* bitmap of enum virtio_dirty_page_track_mode_caps */
> +	__virtio16 dirty_page_track_modes;
> +    /* number of pages the device can track per vf in pull bitmap mode (log) */
> +	__virtio16 log_max_pages_track_pull_bitmap_mode;
> +    /* number of pages the device can track per vf in pull bytemap mode (log) */
> +	__virtio16 log_max_pages_track_pull_bytemap_mode;
> +	__virtio32 reserved;
> +};
> +```
> +
> +### VIRTIO_CTRL_VF_MIGRATION_START_DIRTY_PAGE_TRACK (1)
> +
> +The following is the command specific data that the driver should send:
> +
> +```c
> +enum virtio_dirty_track_mode {
> +    VIRTIO_M_DIRTY_TRACK_PUSH_BITMAP = 1, /* Use push mode with bit granularity */
> +    VIRTIO_M_DIRTY_TRACK_PUSH_BYTEMAP = 2, /* Use push mode with byte granularity */
> +	VIRTIO_M_DIRTY_TRACK_PULL_BITMAP = 3, /* Use pull mode with bit granularity */
> +    VIRTIO_M_DIRTY_TRACK_PULL_BYTEMAP = 4, /* Use pull mode with byte granularity */
> +};
> +struct virtio_ctrl_vf_mig_start_dirty_page_track {
> +	__virtio16 func_id;
> +	__virtio16 mode;
> +	u8 reserved;
> +	u8 data[]; /* push mode only */
> +};
> +```
> +
> +This command has no command specific result set by the device.
> +
> +Note_1: In *push* mode, the posted data descriptors will set `VIRTQ_DESC_F_INDIRECT` flag. These descriptors will point to a table of descriptors anywhere in the memory. The memory pointed by the indirect descriptor table will be used by the device until `VIRTIO_CTRL_VF_MIGRATION_STOP_DIRTY_PAGE_TRACK` command will finish successfully. The driver can't free this memory before that, with the exception of device reset.

Reset of which device, the PF or the VF?

> +
> +Note_2: `push` mode should be supported only for devices that support `VIRTIO_F_INDIRECT_DESC` feature.

Why is VIRTIO_F_INDIRECT_DESC required? In practice it's probably the
only vring descriptor format that will be used, but is INDIRECT strictly
necessary?

> +
> +### VIRTIO_CTRL_VF_MIGRATION_STOP_DIRTY_PAGE_TRACK (2)
> +
> +The following is the command specific data that the driver should send:
> +
> +```c
> +struct virtio_ctrl_vf_mig_stop_dirty_page_track {
> +	__virtio16 func_id;
> +};
> +```
> +
> +This command has no command specific result set by the device.
> +
> +Note: In *push* mode, the memory pointed by the indirect descriptors that were provided during `VIRTIO_CTRL_VF_MIGRATION_START_DIRTY_PAGE_TRACK` command will become available to the driver upon successful completion. The device is not allowed to access this memory anymore and the driver may free this memory.

Is the driver allowed to inspect or atomically test-and-clear the bitmap
while dirty page tracking (push mode) is active?

> +
> +### VIRTIO_CTRL_VF_MIGRATION_GET_DIRTY_REPORT_SIZE (3)
> +
> +The following is the command specific data that the driver should send:
> +
> +```c
> +struct virtio_ctrl_vf_mig_get_dirty_report_size {
> +	__virtio16 func_id;
> +};
> +```
> +
> +The following is the command specific result that the device should return upon successful operation:
> +
> +```c
> +struct virtio_ctrl_vf_mig_get_dirty_report_size_result {
> +	__virtio32 len;

Units?

> +};
> +```
> +
> +### VIRTIO_CTRL_VF_MIGRATION_REPORT_DIRTY_PAGES (4)
> +
> +The following is the command data that the driver should send:
> +
> +```c
> +struct virtio_ctrl_vf_mig_report_dirty_pages {
> +	__virtio16 func_id;
> +	__virtio16 reserved;
> +	__virtio32 offset; /* Offset in the device internal report (in case we want to copy in portions) */
> +};
> +```
> +
> +The following is the command specific result that the device should return upon successful operation:
> +
> +```c
> +struct virtio_ctrl_vf_mig_report_dirty_pages_result {
> +	u8 data[];
> +};
> +```

Is this the pull mode command that the driver must submit while dirty
page tracking is active?

I guess it must not be sent in push mode or while dirty page tracking is
deactivated?

> +
> +### VIRTIO_CTRL_VF_MIGRATION_SET_STATE (5)
> +
> +The following is the command specific data that the driver should send:
> +
> +```c
> +enum virtio_internal_state {
> +    /* Reset occured. The device is in initial state. aka FLR state */
> +    VIRTIO_S_INIT = 0,

VIRTIO_S_ is a general term that could be confusing or collide with
other VIRTIO constants. How about VIRTIO_MIG_STATE_*?

> +    /* The device is running (unquiesced and unfreezed) */
> +    VIRTIO_S_RUNNING = 1,
> +    /*
> +     * The device has been quiesced (Internal state can be changed.
> +     * Can't master transactions)
> +     */
> +    VIRTIO_S_QUIESCED = 2,

Hmm...I think Jason Wang was working on a similar device or virtqueue
running/paused state (for vDPA). Maybe your two approaches can be
unified?

> +    /*
> +     * The device has been freezed (Internal state can't be changed.
> +     * Can't master transactions. SAVE_STATE and RESTORE_STATE are allowed.)
> +     */
> +    VIRTIO_S_FREEZED = 3,
> +};
> +
> +struct virtio_ctrl_vf_mig_set_state {
> +	__virtio16 func_id;
> +	__virtio16 state; /* value from enum virtio_internal_state */
> +};
> +```
> +
> +This command has no command specific result set by the device.
> +
> +Bellow the state machine definition:
> +
> +```
> +                                    +-----------------------------+
> +                                    |                             +<--------QUIESCE ("UNFREEZE")
> +              +---QUIESCE----------->      QUIESCED               |                        |
> +              |                     |                             +----FREEZE--+           |
> +              |      +--------------+                             |            |           |
> +              |      |              +---------^------+------------+            |           |
> +              |      |                        |      |                         |           |
> +              | RUN ("UNQUIESCE")             |      |                         |           |
> +              |      |                        |     FLR                        |           |
> ++-------------+------v--------+               |      |                  +------v-----------+----------+
> +|                             |               |      |                  |                             |
> +|        RUNNING              +---FLR-----+   |      |    +---FLR-------+     FREEZED                 |
> +|                             |           |   |      |    |             |                             |
> +|                             |           | QUIESCE  |    |             |                             |
> ++-------------^---------------+           |   |      |    |             +----------^------------------+
> +              |                           |   |      |    |                        |
> +              |                           |   |      |    |                        |
> +              |                           |   |      |    |                        |
> +              |                      +----v---+------v----v--------+               |
> +              |                      |                             |               |
> +              |                      |         INIT                |               |
> +              +-----RUN--------------+                             +-----FREEZE----+
> +                                     |                             |
> +                                     +-----------------------------+
> +
> +```
> +
> +Note: The device can implicitly move to "INIT" state (from any other state) in case of FLR detection and implicitly move to "RUNNING" (only from "INIT" state) in case of driver detection.

Sometimes I get confused between PF and VF. Explicitly saying PF or VF
instead of "device" would help clarify this throughout the spec.

> +
> +### VIRTIO_CTRL_VF_MIGRATION_GET_STATE_ATTR (6)
> +
> +The following is the command specific data that the driver should send:

Similarly, using just "driver" is confusing because that term means the
guest driver in the VIRTIO device model. Explicitly saying "PF driver"
and "VF driver" would clarify this throughout the spec.

> +
> +```c
> +struct virtio_ctrl_vf_mig_get_state_attr {
> +	__virtio16 func_id;
> +};
> +```
> +
> +The following is the command specific result that the device should return upon successful operation:
> +
> +```c
> +enum virtio_internal_state {
> +    /* Reset occured. The device is in initial state. aka FLR state */
> +    VIRTIO_S_INIT = 0,
> +    /* The device is running (unquiesced and unfreezed) */
> +    VIRTIO_S_RUNNING = 1,
> +    /*
> +     * The device has been quiesced (Internal state can be changed.
> +     * Can't master transactions)
> +     */
> +    VIRTIO_S_QUIESCED = 2,
> +    /*
> +     * The device has been freezed (Internal state can't be changed.
> +     * Can't master transactions. SAVE_STATE and RESTORE_STATE are allowed.)
> +     */
> +    VIRTIO_S_FREEZED = 3,
> +};

This definition is a duplicate. It was already defined under VIRTIO_CTRL_VF_MIGRATION_SET_STATE.

> +
> +struct virtio_ctrl_vf_mig_get_state_attr_result {
> +	__virtio32 len;

What is the purpose of this field?

> +	__virtio16 state; /* value from enum virtio_internal_state */
> +};
> +```
> +
> +### VIRTIO_CTRL_VF_MIGRATION_SAVE_STATE (7)
> +
> +The following is the command data that the driver should send:
> +
> +```c
> +struct virtio_ctrl_vf_mig_save_state {
> +	__virtio16 func_id;
> +	__virtio16 reserved;
> +	__virtio32 offset; /* offset in the device internal state (in case we want to copy state in portions) */
> +};
> +```
> +
> +The following is the command specific result that the device should return upon successful operation:
> +
> +```c
> +struct virtio_ctrl_vf_mig_save_state_result {
> +	u8 data[];
> +};
> +```

Does offset have to increase by len(data) each time
VIRTIO_CTRL_VF_MIGRATION_SAVE_STATE is submitted?

What happens when len(data) is larger than the actual length of the
state?

> +
> +### VIRTIO_CTRL_VF_MIGRATION_RESTORE_STATE (8)
> +
> +The following is the command data that the driver should send:
> +
> +```c
> +struct virtio_ctrl_vf_mig_restore_state {
> +	__virtio16 func_id;
> +	__virtio16 reserved;
> +	__virtio32 offset; /* offset in the device internal state (in case we want to restore state in portions) */
> +	u8 data[];
> +};
> +```
> +
> +This command has no command specific result set by the device.

Similar questions about offset - is it monotonically increasing or can
state be overwritten?

> +# VIRTIO BLK

I thought the generic control virtqueue was on the PF, why are device
type-specific spec changes required? Maybe you can describe how this
works with an SR-IOV virtio-blk/net device?

I wasn't expecting changes to virtio-blk, virtio-net, etc. Instead I
thought this virtqueue would be a PF-only management virtqueue, perhaps
as part of a new PF management device type.

Stefan

--45jEPmIreje3BTF6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDjKRcACgkQnKSrs4Gr
c8hZgAf+PiBpWKoxQmES3cBiiaBOKi4dxwfhujMYtOIB50x4DzUU4Q5//tmnBE45
XuVGltNvHyHpziytA/mt+enzOF8N9u/i/gTa7EPPhsahpEoQW9QnFsvhS92kTXJ6
d0iZjC3wLsk/fflF5NAcQbjxKXCfFDrcTRdqcCECPskZG9Np4FWInKlVf8vcrrkT
MTvIJTsNDaQ9NYo0wX6bJL58t/B7CSoLt6TeRi0S2dHsEBDJ0bcBSQkM8TqtuqrP
ecR7jxIBiz1tCc+uEq8Retp6os8+2GkJ7hHVrR71iugWvhsP72ZgSoL96lYxYBh3
vYFJit+C8AOQq/NpPBqkcgjd2ALEZg==
=NyPu
-----END PGP SIGNATURE-----

--45jEPmIreje3BTF6--

