Return-Path: mgurtovoy@nvidia.com
From: Max Gurtovoy <mgurtovoy@nvidia.com>
Subject: [PATCH 1/1] live_migration: initial support for migrating virtio
 devices
Date: Thu, 24 Jun 2021 11:08:25 +0300
Message-ID: <20210624080825.43478-2-mgurtovoy@nvidia.com>
In-Reply-To: <20210624080825.43478-1-mgurtovoy@nvidia.com>
References: <20210624080825.43478-1-mgurtovoy@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: virtio-comment@lists.oasis-open.org, mst@redhat.com, jasowang@redhat.com, cohuck@redhat.com
Cc: eperezma@redhat.com, aadam@redhat.com, oren@nvidia.com, shahafs@nvidia.com, parav@nvidia.com, bodong@nvidia.com, amikheev@nvidia.com, stefanha@redhat.com, Max Gurtovoy <mgurtovoy@nvidia.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Describe the needed updates to the virtio specification for adding live
migration support for various devices. Live migration is one of the most
important features of virtualization and virtio devices are oftenly
found in virtual environments so setting a standard mechanism for this
feature will allow virtio providers to develop compliant devices that
will use standard drivers for that matter.

Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
---
 virtio-live-migration.md | 399 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 399 insertions(+)
 create mode 100644 virtio-live-migration.md

diff --git a/virtio-live-migration.md b/virtio-live-migration.md
new file mode 100644
index 0000000..8655375
--- /dev/null
+++ b/virtio-live-migration.md
@@ -0,0 +1,399 @@
+[VER]
+
+[DATE]
+
+# Overview
+
+This document will describe the needed updates to the virtio specification for adding live migration support for various devices. Live migration is one of the most important features of virtualization and virtio devices are oftenly found in virtual environments so setting a standard mechanism for this feature will allow virtio providers to develop compliant devices that will use standard drivers for that matter.
+
+In order to fulfil the Live migration requirements for virtual functions, each physical function controller must implement basic migration operations. Using these operations, it will be able to master the migration process for the virtual function controllers. Each capable physical function controller actually has a supervisor permissions to change the virtual function operational states, save/restore its internal state and start/stop dirty pages tracking.
+
+Although the migration operations API is common, each controller has it's own internal implementation. For example, internal device state structure is different between the different types of controllers/providers.
+
+The readers of this document are assumed to have a basic understanding in virtio, virtualization and migration process.
+
+## Terms
+
+| Name | Description       |
+| ---- | ----------------- |
+| PF   | Physical function |
+| VF   | Virtual function  |
+| VM   | Virtual machine   |
+| FW   | Firmware          |
+| HW   | Hardware          |
+| SW   | Software          |
+
+# Scope
+
+This document will describe the following:
+
+1. Generic virtio device extensions
+2. virtio block device extensions
+3. virtio net device extensions
+4. virtio fs device extensions - TBD
+
+# General
+
+## Dirty page tracking
+
+During live migration process the system memory pages that are modified in the "pre-copy" stage are called dirty pages. These pages must be retransmitted to the destination migration SW to update the memory content that was initially sent by the source migration SW. For some devices (e.g. storage controllers), it's vital that the migration SW will transfer these pages during "pre-copy" stage to reduce the downtime for the VM. This is important since storage devices might dirty a huge amount of pages at any time. For that reason, dirty page tracking while running is highly recommended feature for migration capable devices and especially for storage devices.
+
+When device is quiesced it is no longer capable of dirtying additional pages (e.g. in "stop-and-copy" and "resuming" stages). During the downtime of the VM, the migration SW will transfer the rest of the dirty pages to the destination.
+
+### Push tracking mode
+
+In this mode of operation, the device will get a pointer to a dedicated memory space that represents a dirty_page_map. The granularity of the map is negotiated during initialization and might be bit_per_page or byte_per_page. For each page that is dirtied by the device, it will mark the corresponding bit/byte in the dirty_page_map. The migration SW, will be responsible for managing this map and clear the relevant dirty page marks during the migration process in atomic way (e.g. using compare and swap).
+
+### Pull tracking mode
+
+In this mode of operation, the device will be asked to track and internally save a dirty_page_map. The granularity of the map is negotiated during initialization and might be bit_per_page or byte_per_page. For each page that is dirtied by the device, it will mark the corresponding bit/byte in the dirty_page_map. During the migration process, the migration SW, will ask the device to report the size of the dirty_page_map and copy the content of it to host memory.
+
+# Reserved Feature Bits
+
+According to the specification, these bits are device-independent feature bits.
+
+## VIRTIO_F_GENERIC_CTRL_VQ_VER_1
+
+Add a new feature bit to the specification: `VIRTIO_F_GENERIC_CTRL_VQ_VER_1 (39) Device supports a generic form version_1 for all commands that are isseud using the control virtq.`
+
+The commands of the generic version_1 control format are as follows:
+
+```c
+struct virtio_generic_v1_ctrl {
+	// Device-readable part
+	u8 class;
+	u8 command;
+	u8 command-specific-data[];
+	// Device-writable part
+	u8 command-specific-result[];
+	u8 ack;
+};
+
+/* ack values */
+#define VIRTIO_CTRL_OK 0
+#define VIRTIO_CTRL_ERR 1
+```
+
+The class, command and command-specific-data are set by the driver, and the device sets the ack byte and command-specific-result, if needed.
+
+Note: feature bit 39 was chosen until it will be standardized by the virtio specification working group (This is the first free bit in the "Reserved Feature Bits").
+
+## VIRTIO_F_VF_MIGRATION
+
+Add a new feature bit to the specification: `VIRTIO_F_VF_MIGRATION (40) Device can control live migration operation for its virtual functions`. This feature indicates that the device can manage the live migration process of its virtual functions. This feature is currently supported only for physical virtio PCI based functions. Thus, the device should offer `VIRTIO_F_VF_MIGRATION` feature bit if `VIRTIO_F_SR_IOV` feature bit to be offered as well for the specific device. Otherwise, it must not offer `VIRTIO_F_VF_MIGRATION`.
+
+The driver will use the control virtq to communicate migration commands to the device. Thus, the device should offer a control virtq feature. Otherwise, it must not offer `VIRTIO_F_VF_MIGRATION`. The driver should negotiate the generic format of the commands that will be supported. Currently only the generic version_1 control format (see section 5) is supported. For that, the `VIRTIO_F_GENERIC_CTRL_VQ_VER_1` feature bit should be offered by the device and negotiated.
+
+A PF driver must complete `VIRTIO_F_VF_MIGRATION` negotiation before starting live migration process for any virtual function that is related to that PF.
+
+Note: feature bit 40 was chosen until it will be standardized by the virtio specification working group (This is the first free bit in the "Reserved Feature Bits").
+
+#  Reserved Control Commands
+
+Currently only 1 generic control format was defined (see section 4.1).
+
+For supporting devices the following command classes are reserved for specific device types:
+
+```c
+/* class values that are device specific */
+#define VIRTIO_GENERIC_V1_DEVICE_SPECIFIC_CTRL_CLASS_F_START 0
+#define VIRTIO_GENERIC_V1_DEVICE_SPECIFIC_CTRL_CLASS_F_END 127
+```
+
+For supporting devices the following command classes are common and device-independent:
+
+```c
+/* class values that are device independent */
+#define VIRTIO_GENERIC_V1_DEVICE_COMMON_CTRL_CLASS_F_START 128
+#define VIRTIO_GENERIC_V1_DEVICE_COMMON_CTRL_CLASS_F_END 255
+```
+
+## VF Live Migration control commands
+
+if `VIRTIO_F_VF_MIGRATION` feature is negotiated, the driver can send control commands for performing live migration operation for a virtual function that is related to the physical virtio controller. These commands will be issued using the control virtqueue with the generic version_1 control format that was negotiated via `VIRTIO_F_GENERIC_CTRL_VQ_VER_1` feature bit.
+
+Supported commands (are part of the class values that are device independent) :
+
+```c
+#define VIRTIO_GENERIC_V1_CTRL_VF_MIGRATION 128 //This is the class (bellow are the commands)
+ #define VIRTIO_CTRL_VF_MIGRATION_IDENTIFY 0
+ #define VIRTIO_CTRL_VF_MIGRATION_START_DIRTY_PAGE_TRACK 1 //choose reporting mode
+ #define VIRTIO_CTRL_VF_MIGRATION_STOP_DIRTY_PAGE_TRACK 2
+ #define VIRTIO_CTRL_VF_MIGRATION_GET_DIRTY_REPORT_SIZE 3 //valid for pull modes only
+ #define VIRTIO_CTRL_VF_MIGRATION_REPORT_DIRTY_PAGES 4 //valid for pull modes only
+ #define VIRTIO_CTRL_VF_MIGRATION_SET_STATE 5
+ #define VIRTIO_CTRL_VF_MIGRATION_GET_STATE_ATTRS 6
+ #define VIRTIO_CTRL_VF_MIGRATION_SAVE_STATE 7
+ #define VIRTIO_CTRL_VF_MIGRATION_RESTORE_STATE 8
+```
+
+### VIRTIO_CTRL_VF_MIGRATION_IDENTIFY (0)
+
+This command has no command specific data set by the driver.
+
+The following is the command specific result that the device should return upon successful operation:
+
+```c
+enum virtio_dirty_page_track_mode_caps {
+    VIRTIO_ID_DIRTY_TRACK_PUSH_BITMAP = 1 << 0, /* push mode with bit granularity */
+    VIRTIO_ID_DIRTY_TRACK_PUSH_BYTEMAP = 1 << 1, /* push mode with byte granularity */
+    VIRTIO_ID_DIRTY_TRACK_PULL_BITMAP = 1 << 2, /* pull mode with bit granularity */
+    VIRTIO_ID_DIRTY_TRACK_PULL_BYTEMAP = 1 << 3, /* pull mode with byte granularity */
+};
+
+struct virtio_ctrl_vf_mig_get_identify_result {
+	__virtio16 mjr_ver;
+	__virtio16 mnr_ver;
+	__virtio16 ter_ver;
+
+    /* bitmap of enum virtio_dirty_page_track_mode_caps */
+	__virtio16 dirty_page_track_modes;
+    /* number of pages the device can track per vf in pull bitmap mode (log) */
+	__virtio16 log_max_pages_track_pull_bitmap_mode;
+    /* number of pages the device can track per vf in pull bytemap mode (log) */
+	__virtio16 log_max_pages_track_pull_bytemap_mode;
+	__virtio32 reserved;
+};
+```
+
+### VIRTIO_CTRL_VF_MIGRATION_START_DIRTY_PAGE_TRACK (1)
+
+The following is the command specific data that the driver should send:
+
+```c
+enum virtio_dirty_track_mode {
+    VIRTIO_M_DIRTY_TRACK_PUSH_BITMAP = 1, /* Use push mode with bit granularity */
+    VIRTIO_M_DIRTY_TRACK_PUSH_BYTEMAP = 2, /* Use push mode with byte granularity */
+	VIRTIO_M_DIRTY_TRACK_PULL_BITMAP = 3, /* Use pull mode with bit granularity */
+    VIRTIO_M_DIRTY_TRACK_PULL_BYTEMAP = 4, /* Use pull mode with byte granularity */
+};
+struct virtio_ctrl_vf_mig_start_dirty_page_track {
+	__virtio16 func_id;
+	__virtio16 mode;
+	u8 reserved;
+	u8 data[]; /* push mode only */
+};
+```
+
+This command has no command specific result set by the device.
+
+Note_1: In *push* mode, the posted data descriptors will set `VIRTQ_DESC_F_INDIRECT` flag. These descriptors will point to a table of descriptors anywhere in the memory. The memory pointed by the indirect descriptor table will be used by the device until `VIRTIO_CTRL_VF_MIGRATION_STOP_DIRTY_PAGE_TRACK` command will finish successfully. The driver can't free this memory before that, with the exception of device reset.
+
+Note_2: `push` mode should be supported only for devices that support `VIRTIO_F_INDIRECT_DESC` feature.
+
+### VIRTIO_CTRL_VF_MIGRATION_STOP_DIRTY_PAGE_TRACK (2)
+
+The following is the command specific data that the driver should send:
+
+```c
+struct virtio_ctrl_vf_mig_stop_dirty_page_track {
+	__virtio16 func_id;
+};
+```
+
+This command has no command specific result set by the device.
+
+Note: In *push* mode, the memory pointed by the indirect descriptors that were provided during `VIRTIO_CTRL_VF_MIGRATION_START_DIRTY_PAGE_TRACK` command will become available to the driver upon successful completion. The device is not allowed to access this memory anymore and the driver may free this memory.
+
+### VIRTIO_CTRL_VF_MIGRATION_GET_DIRTY_REPORT_SIZE (3)
+
+The following is the command specific data that the driver should send:
+
+```c
+struct virtio_ctrl_vf_mig_get_dirty_report_size {
+	__virtio16 func_id;
+};
+```
+
+The following is the command specific result that the device should return upon successful operation:
+
+```c
+struct virtio_ctrl_vf_mig_get_dirty_report_size_result {
+	__virtio32 len;
+};
+```
+
+### VIRTIO_CTRL_VF_MIGRATION_REPORT_DIRTY_PAGES (4)
+
+The following is the command data that the driver should send:
+
+```c
+struct virtio_ctrl_vf_mig_report_dirty_pages {
+	__virtio16 func_id;
+	__virtio16 reserved;
+	__virtio32 offset; /* Offset in the device internal report (in case we want to copy in portions) */
+};
+```
+
+The following is the command specific result that the device should return upon successful operation:
+
+```c
+struct virtio_ctrl_vf_mig_report_dirty_pages_result {
+	u8 data[];
+};
+```
+
+### VIRTIO_CTRL_VF_MIGRATION_SET_STATE (5)
+
+The following is the command specific data that the driver should send:
+
+```c
+enum virtio_internal_state {
+    /* Reset occured. The device is in initial state. aka FLR state */
+    VIRTIO_S_INIT = 0,
+    /* The device is running (unquiesced and unfreezed) */
+    VIRTIO_S_RUNNING = 1,
+    /*
+     * The device has been quiesced (Internal state can be changed.
+     * Can't master transactions)
+     */
+    VIRTIO_S_QUIESCED = 2,
+    /*
+     * The device has been freezed (Internal state can't be changed.
+     * Can't master transactions. SAVE_STATE and RESTORE_STATE are allowed.)
+     */
+    VIRTIO_S_FREEZED = 3,
+};
+
+struct virtio_ctrl_vf_mig_set_state {
+	__virtio16 func_id;
+	__virtio16 state; /* value from enum virtio_internal_state */
+};
+```
+
+This command has no command specific result set by the device.
+
+Bellow the state machine definition:
+
+```
+                                    +-----------------------------+
+                                    |                             +<--------QUIESCE ("UNFREEZE")
+              +---QUIESCE----------->      QUIESCED               |                        |
+              |                     |                             +----FREEZE--+           |
+              |      +--------------+                             |            |           |
+              |      |              +---------^------+------------+            |           |
+              |      |                        |      |                         |           |
+              | RUN ("UNQUIESCE")             |      |                         |           |
+              |      |                        |     FLR                        |           |
++-------------+------v--------+               |      |                  +------v-----------+----------+
+|                             |               |      |                  |                             |
+|        RUNNING              +---FLR-----+   |      |    +---FLR-------+     FREEZED                 |
+|                             |           |   |      |    |             |                             |
+|                             |           | QUIESCE  |    |             |                             |
++-------------^---------------+           |   |      |    |             +----------^------------------+
+              |                           |   |      |    |                        |
+              |                           |   |      |    |                        |
+              |                           |   |      |    |                        |
+              |                      +----v---+------v----v--------+               |
+              |                      |                             |               |
+              |                      |         INIT                |               |
+              +-----RUN--------------+                             +-----FREEZE----+
+                                     |                             |
+                                     +-----------------------------+
+
+```
+
+Note: The device can implicitly move to "INIT" state (from any other state) in case of FLR detection and implicitly move to "RUNNING" (only from "INIT" state) in case of driver detection.
+
+### VIRTIO_CTRL_VF_MIGRATION_GET_STATE_ATTR (6)
+
+The following is the command specific data that the driver should send:
+
+```c
+struct virtio_ctrl_vf_mig_get_state_attr {
+	__virtio16 func_id;
+};
+```
+
+The following is the command specific result that the device should return upon successful operation:
+
+```c
+enum virtio_internal_state {
+    /* Reset occured. The device is in initial state. aka FLR state */
+    VIRTIO_S_INIT = 0,
+    /* The device is running (unquiesced and unfreezed) */
+    VIRTIO_S_RUNNING = 1,
+    /*
+     * The device has been quiesced (Internal state can be changed.
+     * Can't master transactions)
+     */
+    VIRTIO_S_QUIESCED = 2,
+    /*
+     * The device has been freezed (Internal state can't be changed.
+     * Can't master transactions. SAVE_STATE and RESTORE_STATE are allowed.)
+     */
+    VIRTIO_S_FREEZED = 3,
+};
+
+struct virtio_ctrl_vf_mig_get_state_attr_result {
+	__virtio32 len;
+	__virtio16 state; /* value from enum virtio_internal_state */
+};
+```
+
+### VIRTIO_CTRL_VF_MIGRATION_SAVE_STATE (7)
+
+The following is the command data that the driver should send:
+
+```c
+struct virtio_ctrl_vf_mig_save_state {
+	__virtio16 func_id;
+	__virtio16 reserved;
+	__virtio32 offset; /* offset in the device internal state (in case we want to copy state in portions) */
+};
+```
+
+The following is the command specific result that the device should return upon successful operation:
+
+```c
+struct virtio_ctrl_vf_mig_save_state_result {
+	u8 data[];
+};
+```
+
+### VIRTIO_CTRL_VF_MIGRATION_RESTORE_STATE (8)
+
+The following is the command data that the driver should send:
+
+```c
+struct virtio_ctrl_vf_mig_restore_state {
+	__virtio16 func_id;
+	__virtio16 reserved;
+	__virtio32 offset; /* offset in the device internal state (in case we want to restore state in portions) */
+	u8 data[];
+};
+```
+
+This command has no command specific result set by the device.
+
+# VIRTIO BLK
+
+## Feature bits
+
+Add a new feature bit to virtio Block device specification: `VIRTIO_BLK_F_CTRL_VQ (15) Control channel is available.` The controlq exists only if VIRTIO_BLK_F_CTRL_VQ set by the controller. The controlq is another virtq in the device virtq list. Thus, for backward compatibility, the `VIRTIO_BLK_F_CTRL_VQ` feature bit requires `VIRTIO_BLK_F_MQ` feature bit to be set. The controlq is used to administer the device (not to confuse with the already defined "device features" VIRTIO_BLK_F_*).
+
+Note: feature bit 15 was chosen until it will be standardized by the virtio specification working group (This is the first free bit in the virtio block "Feature bits").
+
+## Control Virtqueue
+
+The driver uses the control virtqueue (if VIRTIO_BLK_F_CTRL_VQ is negotiated) to send commands to manipulate various features of the device which would not easily map into the configuration space (similar to virtio net control queue). Live migration is one of these features.
+
+The control virtq will the (N + 1) queue while N is set by virtio_blk_config.num_queues (that will imply on the maximal number of request queues). This is similar to VIRTIO Crypto device controlq numbering logic.
+
+Note: We can fix the BLK spec bug and change the controlq to be the N queue.
+
+If the `VIRTIO_F_GENERIC_CTRL_VQ_VER_1` feature was negotiated, all the commands that will be issued using this controlq will use the generic version_1 control format (section 4.1).
+
+# VIRTIO NET
+
+## Feature bits
+
+VIRTIO_NET_F_CTRL_VQ feature already exist in the specification.
+
+## Control Virtqueue
+
+The driver uses the control virtqueue (if VIRTIO_NET_F_CTRL_VQ is negotiated) to send commands to manipulate the live migration process.
+
+If the `VIRTIO_F_GENERIC_CTRL_VQ_VER_1` feature was negotiated, all the commands that will be issued using this controlq will use the generic version_1 control format (section 4.1).
+
+# VIRTIO FS
-- 
2.21.0

