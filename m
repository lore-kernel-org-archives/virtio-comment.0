Return-Path: <lingshan.zhu@intel.com>
From: Zhu Lingshan <lingshan.zhu@intel.com>
Subject: [PATCH V4 2/4] Introduce the commands set of the transport vq
Date: Fri, 26 Aug 2022 18:00:31 +0800
Message-Id: <20220826100034.200432-3-lingshan.zhu@intel.com>
In-Reply-To: <20220826100034.200432-1-lingshan.zhu@intel.com>
References: <20220826100034.200432-1-lingshan.zhu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
To: mst@redhat.com, cohuck@redhat.com, sgarzare@redhat.com, stefanha@redhat.com, nrupal.jani@intel.com, Piotr.Uminski@intel.com, hang.yuan@intel.com
Cc: virtio-comment@lists.oasis-open.org, Zhu Lingshan <lingshan.zhu@intel.com>, Jason Wang <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

This commit introduces the commands set of the
transport virtqueue, including:

The command to query available resources of the management device
The commands to create / destroy the managed devices.
The commands to config the managed devices.
The commands to config virtqueues of the managed devices.

Signed-off-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
---
 content.tex | 702 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 702 insertions(+)

diff --git a/content.tex b/content.tex
index 0f2dee4..a299172 100644
--- a/content.tex
+++ b/content.tex
@@ -3008,6 +3008,708 @@ \subsection{Format of Commands through Transport Virtqueue}\label{sec:Virtio Tra
 
 \field{class} is an identifier of a set of commands with similar  purposes.
 
+\subsection{Management Device Information}\label{sec:Virtio Transport Options / Virtio Over Transport Virtqueue / Management Device Information}
+
+Statistical information of available resources on the management device could be fetched
+by the following command:
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_MGMT_DEV_INFO    1 (class)
+ #define VIRTIO_TRANSPTQ_CTRL_MGMT_DEV_INFO_GET     0 (command)
+\end{lstlisting}
+
+VIRTIO_TRANSPTQ_CTRL_MGMT_DEV_INFO_GET command is used to get the statistical information of a management device.
+There is no command-out-data for VIRTIO_TRANSPTQ_CTRL_MGMT_DEV_INFO_GET
+command. The management device fills command-in-data in the following format:
+
+\begin{lstlisting}
+struct virtio_mgmt_dev_info {
+        /* The number of remaining available virtqueues for new managed devices */
+        u16 avail_vqs;
+        /* The minimal number of virtqueues for a managed device */
+        u16 min_dev_vqs;
+        /* The maximum number of virtqueues for a managed device */
+        u16 max_dev_vqs;
+        /* The maximum number of MSI entries of the MSI entries table for a managed device */
+        u32 num_msi;
+        /* The number of managed devices that can be created with min_vqs virtqueues */
+        u16 avail_devs;
+};
+\end{lstlisting}
+
+\field{avail_devs} may not equal to \field{avail_vqs} divided by \field{min_vqs}
+due to the limitations of other resources.
+
+\devicenormative{\subsubsection}{Available Resource of the Management Device}{Virtio Transport Options /
+Virtio Over Transport Virtqueue / Available Resource of the Management Device}
+
+The management device MUST fail VIRTIO_TRANSPTQ_CTRL_MGMT_DEV_INFO_GET command if \field{device_id} is not 0
+
+\drivernormative{\subsubsection}{Available Resource of the Management Device}{Virtio Transport Options /
+Virtio Over Transport Virtqueue / Available Resource of the Management Device}
+
+The management device driver MUST use 0 as \field{device_id} for
+VIRTIO_TRANSPTQ_CTRL_MGMT_DEV_INFO_GET command.
+
+\subsection{Create and Destroy Managed Devices}\label{sec:Virtio Transport Options / Virtio Over Transport Virtqueue / Create and Destroy Managed Devices}
+
+Managed devices can be created and destroyed through the transport virtqueue by the following commands:
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPORTQ_CTRL_DEV    2
+ #define VIRTIO_TRANSPORTQ_CTRL_DEV_CREATE        0
+ #define VIRTIO_TRANSPORTQ_CTRL_DEV_DESTROY       1
+
+struct virtio_transportq_ctrl_dev_attribute {
+       u32 features_len;
+       u32 device_features[features_len];
+       u16 virtio_device_id;
+       u16 virtio_vendor_id;
+       u16 sub_device_id;
+       u16 sub_vendor_id
+       u32 num_msi;
+       u8 device_config[];
+};
+\end{lstlisting}
+
+The VIRTIO_TRANSPORTQ_CTRL_DEV_CREATE command is used to create a managed device.
+
+As described in struct virtio_transportq_ctrl_dev_attribute, the command-out-data for VIRTIO_TRANSPTQ_CTRL_DEV_CREATE includes:
+\begin{itemize*}
+\item features_len: length of the \field{device_features} in DWORDs.
+\item \field{device_features}: the feature bits (defined in section \ref{sec:Basic Facilities of a Virtio Device / Feature Bits})
+of the managed device.
+\item \field{virtio_device_id}: the virtio device id defined in Chapter \ref{sec:Device Types},
+this specifies the device type of the managed device.
+\item \field{virtio_vendor_id}: the vendor id of the managed device.
+\item \field{sub_device_id}: the sub device id of the managed device.
+\item \field{sub_vendor_id}: the sub vendor id of the managed device.
+\item \field{num_msi}: indicating how many MSI entries in the MSI entries table.
+If \field{num_msi} is 0, the managed device only works in polling mode.
+\item \field{device_config}: the device type specific configurations. E.g., for a virtio-net device,
+it is struct virtio_net_config in section \ref{sec:Device Types / Network Device / Device configuration layout};
+for a virtio-block device, it is struct virtio_blk_config in section \ref{sec:Device Types / Block Device / Device configuration layout}
+\end{itemize*}
+
+When succeed, the device returns a 64bit device_id as an unique identifier of the created managed device in command-in-data.
+This device_id should be unique in the management device context
+
+The VIRTIO_TRANSPORTQ_CTRL_DEV_DESTROY command is used to destroy a
+managed device which is identified by its 64bit device_id
+\field{device_id}. There's no command-in-data nor command-out-data for
+VIRTIO_TRANSPTQ_CTRL_DEV_DESTROY command.
+
+\devicenormative{\subsubsection}{Create and Destroy Managed Devices}{Virtio Transport Options / Virtio Over Transport Virtqueue / Create and Destroy Managed Devices}
+
+The management device MUST fail VIRTIO_TRANSPORTQ_CTRL_DEV_CREATE command
+if \field{device_id} is not 0.
+
+The management device MUST fail VIRTIO_TRANSPORTQ_CTRL_DEV CREATE command
+if \field{device_features} exceeds the features that can be provided from the management device.
+
+The management device MUST fail VIRTIO_TRANSPORTQ_CTRL_DEV CREATE command
+if \field{num_msi} exceeds the maximum allowed MSI entries table size for
+managed devices (struct virtio_mgmt_dev_info.num_msi).
+
+The management device MUST fail VIRTO_TRANSPORTQ_CTRL_DEV_DESTROY command
+if \field{device_id} is 0.
+
+\drivernormative{\subsubsection}{Create and Destroy Managed Devices}{Virtio Transport Options / Virtio Over Transport Virtqueue / Create and Destroy Managed Devices}
+
+The management device driver MUST use 0 as \field{device_id} for
+TRANSPORTQ_CTRL_DEV_CREATE command.
+
+\subsection{Features Negotiation}\label{sec:Virtio Transport Options / Virtio
+Over Transport Virtqueue / Features Negotiation}
+
+The features negotiation of managed devices is done by the
+following commands:
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_FEAT   3
+ #define VIRTIO_TRANSPTQ_CTRL_FEAT_DEVICE_GET        0
+ #define VIRTIO_TRANSPTQ_CTRL_FEAT_DRIVER_SET        1
+ #define VIRTIO_TRANSPTQ_CTRL_FEAT_DRIVER_GET        2
+
+struct virtio_transportq_ctrl_dev_features {
+        u32 features_len;
+        u32 features[features_len];
+};
+\end{lstlisting}
+
+The VIRTIO_TRANSPTQ_CTRL_FEAT_DEVICE_GET command is used to get the features offered
+by a managed device. As described in struct virtio_transportq_ctrl_dev_features,
+the command-in-data contains the length of the feature bits
+(\field{features_len}) in DWORDs and the feature bits (\field{features}).
+There is no command-out-data.
+
+The VIRTIO_TRANSPTQ_CTRL_FEAT_DRIVER_SET command is for the driver to accept feature
+bits offered by the managed device. The command-out-data is the struct
+virtio_tranportq_ctrl_dev_features which contains \field{features}
+passed to the managed device and \field{feature_len}. There is no command-in-data.
+
+The VIRTIO_TRANSPTQ_CTRL_FEAT_DRIVER_GET command is used to get the features accepted
+by both the managed device driver and the managed device. The command-in-data contains
+the length of the features(\field{features_len}) and the feature bits(\field{features}).
+There is no command-out-data.
+
+\devicenormative{\subsubsection}{Features Negotiation}{Virtio Transport Options /
+Virtio Over Transport Virtqueue / Features Negotiation}
+
+The management device MUST fail VIRTIO_TRANSPTQ_F_CTRL_FEAT class commands if
+\field{device_id} is 0.
+
+\subsection{Device Status}\label{sec:Virtio Transport Options / Virtio Over
+Transport Virtqueue / Device Status}
+
+The device status of a managed device can be accessed by the following
+commands:
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_STATUS    4
+ #define VIRTIO_TRANSPTQ_CTRL_STATUS_GET        0
+ #define VIRTIO_TRANSPTQ_CTRL_STATUS_SET        1
+\end{lstlisting}
+
+The VIRTIO_TRANSPTQ_CTRL_STATUS_GET command is used to get the device status of
+a managed device. The command-in-data is the 8bit status
+returned from the device. There's no command-out-data for this
+command.
+
+The VIRTIO_TRANSPTQ_CTRL_STATUS_SET command is used to set the device status of
+a managed device. The command-out-data is the 8bit status
+to set to the device. There's no command-in-data for this command.
+
+\devicenormative{\subsubsection}{Device Status}{Virtio Transport Options / Virtio
+Over Transport Virtqueue / Device Status}
+
+The management device MUST reset the managed device when 0
+is set via VIRTIO_TRANSPTQ_CTRL_STATUS_SET, the success of this
+command demonstrates the success of the reset.
+
+The management device MUST present 0 through
+VIRTIO_TRANSPTQ_CTRL_STATUS_GET once the reset is successfully done.
+
+The management device MUST fail the device status access if
+\field{device_id} is 0.
+
+\drivernormative{\subsubsection}{Device Status}{Virtio Transport Options / Virtio
+Over Transport Virtqueue / Device Status}
+
+After writing 0 via VIRTIO_TRANSPTQ_CTRL_STATUS_SET, the driver MUST wait
+for the success of the command before re-initializing the device.
+
+\subsection{Device Generation}\label{sec:Virtio Transport Options / Virtio Over Transport Virtqueue / Device Generation}
+
+The device generation count can be read from the following commands:
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_GENERATION    5
+ #define VIRTIO_TRANSPTQ_CTRL_GENERATION_GET        0
+\end{lstlisting}
+
+The VIRTIO_TRANSPTQ_CTRL_GENERATION_GET command is used to get the device configuration generation count
+of a managed device. The command-in-data is the one byte device
+generation returned from the device. There's no command-out-data for
+this command.
+
+\devicenormative{\subsubsection}{Device Generation}{Virtio Transport Options / Virtio Over Transport Virtqueue / Device Generation}
+
+The managed device MUST present a changed generation count after the driver
+has read any device-specific configuration values if the values have been changed
+during the last read.
+
+The management device MUST fail the device generation access if \field{device_id} is 0.
+
+\subsection{Device Specific Configuration}\label{sec:Virtio Transport Options /
+Virtio Over Transport Virtqueue / Device Specific Configuration}
+
+The contents of managed device config space can be accessed through
+the following commands:
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_CONFIG    6
+  #define VIRTIO_TRANSPTQ_CTRL_CONFIG_GET    0
+  #define VIRTIO_TRANSPTQ_CTRL_CONFIG_SET    1
+
+struct virtio_transportq_ctrl_dev_config_get {
+       u32 offset;
+       u32 size;
+};
+
+struct virtio_transportq_ctrl_dev_config_set {
+       u32 offset;
+       u32 size;
+       u8  data[];
+};
+\end{lstlisting}
+
+The VIRTIO_TRANSPTQ_CTRL_CONFIG_GET command is used to read data from the
+device configuration space.  The command-out-data is the \field{offset}
+from the start of the config space and the \field{size}
+of the data to read (as described in struct virtio_transportq_ctrl_dev_config_get).
+The command-in-data is an array of the data that read from the config space.
+
+The VIRTIO_TRANSPTQ_CTRL_CONFIG_SET command is used to write data to the device
+configuration space of a managed device. The command-out-data contains the
+\field{offset} from the start of the config space, the \field{size} of the data and
+the \field{data} to be written (as described in struct virtio_transportq_ctrl_dev_config_set).
+There's no command-in-data for this command.
+
+\devicenormative{\subsubsection}{Device Specific Configuration}{Virtio Transport
+Options / Virtio Over Transport Virtqueue / Device Specific Configuration}
+
+The management device MUST fail the device configuration space access
+if the driver accesses the range which is outside the config space.
+
+The management device MUST fail the device configuration space access
+if \field{device_id} is 0.
+
+\subsection{MSI Configuration}\label{sec:Virtio Transport Options / Virtio Over
+Transport Virtqueue / MSI Configuration}
+
+The MSI entries of a managed device can be accessed  through the following command:
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_MSI    7
+ #define VIRTIO_TRANSPTQ_CTRL_MSI_GET           1
+ #define VIRTIO_TRANSPTQ_CTRL_MSI_SET           2
+ #define VIRTIO_TRANSPTQ_CTRL_MSI_DEV_ENABLE    3
+ #define VIRTIO_TRANSPTQ_CTRL_MSI_MASK          4
+ #define VIRTIO_TRANSPTQ_CTRL_MSI_PENDING_GET   5
+ #define VIRTIO_TRANSPTQ_CTRL_MSI_VQ_GET        6
+ #define VIRTIO_TRANSPTQ_CTRL_MSI_VQ_SET        7
+ #define VIRTIO_TRANSPTQ_CTRL_MSI_CONFIG_GET    8
+ #define VIRTIO_TRANSPTQ_CTRL_MSI_CONFIG_SET    9
+
+struct virtio_transportq_ctrl_msi {
+       u64 address;
+       u32 data;
+       u8 padding[4];
+};
+
+struct virtio_transportq_ctrl_msi_set {
+       u32 msi_num;
+       u64 address;
+       u32 data;
+}
+
+struct transportq_ctrl_msi_mask {
+       u32 msi_num;
+       u8 mask;
+       u8 padding[3];
+};
+
+struct virtio_transportq_ctrl_vq_msi_set {
+       u16 queue_index;
+       u32 msi_num;
+       u8 padding[2];
+};
+\end{lstlisting}
+
+The VIRTIO_TRANSPTQ_CTRL_MSI_GET command is used to read an MSI vector.
+The command-out-data is the MSI entry number(\field{msi_num}) in the MSI entries table
+(\ref{sec:Virtio Transport Options /Virtio Over Transport Virtqueue / Managed Devices Interrupts}).
+The command-in-data is the \field{address} and payload \field{data} of the MSI vector
+(as described in struct virtio_transportq_ctrl_msi)
+
+The VIRTIO_TRANSPTQ_CTRL_MSI_SET command is used to setup an MSI vector for the managed device.
+The command-out-data is the MSI entry number (\field{num_msi}),
+the \field{address} and payload \field{data} for the MSI
+(as described in struct virtio_transportq_ctrl_msi_set).
+
+The VIRTIO_TRANSPTQ_CTRL_MSI_VQ_ENABLE command is used to enable or disable
+the MSI based interrupts of the managed device. The command-out-data is a byte
+which represents ENABLE or DISABLE the MSI.
+There is no command-in-data.
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_MSI_VQ_ENABLE     1
+#define VIRTIO_TRANSPTQ_CTRL_MSI_VQ_DISABLE    0
+\end{lstlisting}
+
+The VIRTIO_TRANSPTQ_CTRL_MSI_MASK command is used to mask or unmask
+an MSI vector. The command-out-data is the
+MSI entry number (\field{queue_index}) and the \field{mask} status which represents MASK or UNMASK
+(as described in struct transportq_ctrl_msi_mask).
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_MSI_MASK       1
+#define VIRTIO_TRANSPTQ_CTRL_MSI_UNMASK     0
+\end{lstlisting}
+
+When masking an MSI vector, the managed device should set the mask bit of the MSI vector to 1,
+and the managed device is prohibited from sending interrupts through the MSI vector.
+If there are any interrupts pending on the MSI vector since it has been masked,
+the managed device should set the pending bit of the MSI vector to 1.
+
+When unmasking an MSI vector, the managed device should set the mask bit of the MSI vector to 0,
+and the managed device is permitted to send interrupts through the MSI vector.
+If the pending bit of an MSI vector is 1 when unmasking the MSI vector,
+the managed device must generate an interrupt through
+the MSI vector, and then clear the pending bit.
+
+The VIRTIO_TRANSPTQ_CTRL_MSI_PENDING_GET command is used to read the pending bit of
+an MSI vector, the command-out-data is the MSI entry number,
+the command-in-data is the one byte represents the pending bit of the MSI vector.
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_MSI_PENDING       1
+#define VIRTIO_TRANSPTQ_CTRL_MSI_NO_PENDING    0
+\end{lstlisting}
+
+The VIRTIO_TRANSPTQ_CTRL_MSI_VQ_GET command is used to read the number of the MSI entry
+which assigned to a specific virtqueue.
+The command-out-data is the queue index. The command-in-data is the 32bit MSI entry number.
+
+The VIRTIO_TRANSPTQ_CTRL_MSI_VQ_SET command is used to assign an MSI vector to a
+specific virtqueue. The command-out-data is the \field{queue_index} and
+the number of the MSI entry(as described in struct virtio_transportq_ctrl_vq_msi_set).
+There is no command-in-data.
+
+The VIRTIO_TRANSPTQ_CTRL_MSI_CONFIG_GET command is used to read the MSI entry
+number of a managed device's config interrupt. The command-in-data is the 32bit MSI entry number.
+There is no command-out-data.
+
+The VIRTIO_TRANSPTQ_CTRL_MSI_CONFIG_SET command is used to assign an MSI vector
+to the config interrupt of a managed device. The command-out-data is the MSI entry number.
+There is no command-in-data.
+
+The driver can disable the interrupt of a virtqueue or the config space
+by writting a special NO_VECTOR value
+
+\begin{lstlisting}
+#define VIRTIO_MSI_NO_VECTOR 0xffff
+\end{lstlisting}
+
+\devicenormative{\subsubsection}{MSI Configuration}{Virtio Transport Options / Virtio
+ver Transport Virtqueue / MSI Configuration}
+
+The management device MUST fail VIRTIO_TRANSPTQ_CTRL_MSI class commands if
+\field{device_id} is 0.
+
+The management device MUST fail VIRTIO_TRANSPTQ_CTRL_MSI class commands if
+the provided MSI entry number if out-of-range invalid.
+
+The managed device MUST clear the MSI entries table and reset the MSI vectors
+for both virtqueues and config space upon a managed device reset.
+
+\drivernormative{\subsubsection}{MSI Configuration}{Virtio Transport Options / Virtio
+Over Transport Virtqueue / MSI Configuration}
+
+The driver MAY choose to disable the MSI based interrupts if polling mode is used.
+
+\subsection{Virtqueue Address}\label{sec:Virtio Transport Options / Virtio Over
+Transport Virtqueue / Virtqueue Address}
+
+The addresses of a specific virtqueue are accessed through the following command:
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_VQ_ADDR    8
+ #define VIRTIO_TRANSPTQ_CTRL_VQ_ADDR_SET       1
+
+struct virtio_transportq_ctrl_vq_addr {
+       u16 queue_index;
+       u64 descriptor_area;
+       u64 device_area;
+       u64 driver_area;
+       u8 padding[6];
+};
+\end{lstlisting}
+
+The VIRTIO_TRANSPTQ_CTRL_VQ_ADDR_SET command is used to set the addresses of a specified
+virtqueue. The command-out-data contains the \field{queue_index}, the addresses of \field{device_area},
+\field{descriptor_area} and \field{driver_area} (as described in struct
+virtio_transportq_ctrl_vq_addr). There's no command-in-data.
+
+\devicenormative{\subsubsection}{Virtqueue Address}{Virtio Transport Options / Virtio
+Over Transport Virtqueue / Virtqueeu Address}
+
+The management device MUST fail the commands of class
+VIRTIO_TRANSPTQ_CTRL_VQ_ADDR if \field{device_id} is 0.
+
+The management device MUST fail the commands of class
+VIRTIO_TRANSPTQ_CTRL_VQ_ADDR if \field{queue_index} is out-of-range invalid.
+
+\subsection{Virtqueue Status}\label{sec:Virtio Transport Options / Virtio Over
+Transport Virtqueue / Virtqueue Status}
+
+Virtqueue status is accessed through the following command:
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_VQ_ENABLE    9
+ #define VIRTIO_TRANSPTQ_CTRL_VQ_ENABLE_GET       0
+ #define VIRTIO_TRANSPTQ_CTRL_VQ_ENABLE_SET       1
+
+struct virtio_transportq_ctrl_vq_status_set {
+       u16 queue_index;
+       u8 status;
+       u8 padding[5];
+
+#define VIRTIO_TRANSPTQ_VQ_ENABLE     1
+#define VIRTIO_TRANSPTQ_VQ_DISABLE    0
+
+};
+
+\end{lstlisting}
+
+The VIRTIO_TRANSPTQ_CTRL_VQ_ENABLE_GET is used to get the status of a
+specific virtqueue. The command-out-data is the queue
+index. The command-in-data is the virtqueue status.
+
+The VIRTIO_TRANSPTQ_CTRL_VQ_ENABLE_SET command is used to set the status of a
+specific virtqueue. The command-out-data is the \field{queue_index} and the
+\field{status} that is set to the virtqueue
+(as described in struct virtio_transportq_ctrl_vq_status_set).
+There's no command-in-data.
+
+\devicenormative{\subsubsection}{Virtqueue Status}{Virtio Transport Options / Virtio
+Over Transport Virtqueue / Virtqueue Status}
+
+When disabled, the managed device MUST stop processing requests from
+this virtqueue.
+
+The management device MUST present a 0 via
+VIRTIO_TRANSPTQ_CTRL_VQ_ENABLE_GET upon a reset of the managed device.
+
+The management device MUST fail the virtqueue status access if
+\field{device_id} is 0.
+
+The management device MUST fail the virtqueue status access if
+the queue_index is out-of-range invalid.
+
+The management device MUST fail VIRTIO_TRANSPTQ_CTRL_VQ_ENABLE_SET command if
+its \field{status} is VIRTIO_TRANSPTQ_VQ_DISABLE.
+
+\drivernormative{\subsubsection}{Virtqueue Status}{Virtio Transport Options / Virtio
+Over Transport Virtqueue / Virtqueue Status}
+
+The driver MUST configure other virtqueue fields before enabling
+the virtqueue with VIRTIO_TRANSPTQ_CTRL_VQ_ENABLE_SET.
+
+The driver MUST NOT set VIRTIO_TRANSPTQ_VQ_DISABLE to a virtqueue.
+
+\subsection{Virtqueue Size}\label{sec:Virtio Transport Options / Virtio Over
+Transport Virtqueue / Virtqueue Size}
+
+Virtqueue size is accessed through the following command:
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_VQ_SIZE    10
+ #define VIRTIO_TRANSPTQ_CTRL_VQ_SIZE_GET       0
+ #define VIRTIO_TRANSPTQ_CTRL_VQ_SIZE_SET       1
+
+struct virtio_transportq_ctrl_vq_size_set {
+       u16 queue_index;
+       u16 size;
+       u8 padding[4];
+};
+\end{lstlisting}
+
+The VIRTIO_TRANSPTQ_CTRL_VQ_SIZE_GET command is used to get the virtqueue
+size. On reset, the maximum queue size supported by the device is
+returned. The command-out-data is the queue index. The
+command-in-data is an 16bit queue size.
+
+The VIRTIO_TRANSPTQ_CTRL_VQ_SIZE_SET command is used to set the virtqueue
+size. The command-out-data is the \field{queue_index} and the \field{size}
+of the virtqueue (as described in struct virtio_transportq_ctrl_vq_size_set).
+There's no command-in-data.
+
+\devicenormative{\subsubsection}{Virtqueue Status}{Virtio Transport Options / Virtio
+Over Transport Virtqueue / Virtqueue Size}
+
+The management device MUST fail the virtqueue size access if
+\field{device_id} is 0.
+
+The management device MUST fail the virtqueue size access if
+the queue index is out-of-range invalid.
+
+\subsection{Virtqueue Notification}\label{sec:Virtio Transport Options / Virtio
+Over Transport Virtqueue / Virtqueue Notification}
+
+The virtqueue notification area information can be get through the following commands:
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_VQ_NOTIFY    11
+ #define VIRTIO_TRANSPTQ_CTRL_VQ_NOTIFY_GET          0
+
+struct virtio_transportq_ctrl_vq_notification_area {
+       u64 address;
+       u64 size;
+};
+\end{lstlisting}
+
+The VIRTIO_TRANSPTQ_CTRL_VQ_NOTIFY_GET is used to get the transport
+specific address area that can be used to notify a virtqueue. The
+command-out-data is an u16 of the queue index. The command-in-data
+contains the \field{address} and the \field{size}
+of the notification area (as described in struct virtio_transportq_ctrl_vq_notification_area).
+
+\devicenormative{\subsubsection}{Virtqueue Notification}{Virtio Transport Options /
+Virtio Over Transport Virtqueue / Virtqueue Notification}
+
+The management device MUST fail the virtqueue notification area information
+access if \field{device_id} is 0.
+
+The management device MUST fail the virtqueue notification area information
+access if the queue index is out-of-range invalid.
+
+The management device MUST reserve sufficient transport specific resources
+as notification areas for the virtqueues.
+
+\drivernormative{\subsubsection}{Virtqueue Notification}{Virtio Transport Options /
+Virtio Over Transport Virtqueue / Virtqueue Notification}
+
+The driver MAY choose to notify the virtqueue by writing the queue
+index at address \field{address} which is fetched from the
+VIRTIO_TRANSPTQ_CTRL_VQ_NOTIFY_GET command.
+
+\subsection{Virtqueue State}\label{sec:Virtio Transport Options / Virtio
+Over Transport Virtqueue / Virtqueue State}
+
+The virtqueue state is accessed through the following commands:
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_VQ_STATE            12
+ #define VIRTIO_TRANSPTQ_CTRL_VQ_STATE_GET       0
+ #define VIRTIO_TRANSPTQ_CTRL_VQ_STATE_SET       1
+\end{lstlisting}
+
+\subsubsection{Split Virtqueue State}\label{sec:Virtio Transport Options / Virtio
+Over Transport Virtqueue / Virtqueue State / Split Virtqueue State}
+
+\begin{lstlisting}
+struct virtio_transportq_ctrl_split_vq_state_set {
+    u16 queue_index;
+    u16 avail_index;
+    u8 padding[4];
+};
+\end{lstlisting}
+
+The VIRTIO_TRANSPTQ_CTRL_VQ_STATE_GET command can be  used to get the state of a
+split virtqueue. The command-out-data is the queue index, the command-in-data is the
+on-device last available index of the virtqueue.
+
+The VIRTIO_TRANSPTQ_CTRL_VQ_STATE_SET command can be used to set the state of a
+split virtqueue. The command-out-data contains the \field{queue_index} and the
+available index (\field{avail_index}) for the virtqueue
+(as described in struct virtio_transportq_ctrl_split_vq_state_set).
+There is no command-in-data.
+
+\subsubsection{Packed Virtqueue State}\label{sec:Virtio Transport Options / Virtio
+Over Transport Virtqueue / Virtqueue State / Packed Virtqueue State}
+
+\begin{lstlisting}
+struct virtio_transportq_ctrl_packed_vq_state {
+       u16 last_avail_counter:1;
+       u16 last_avail_idx:15;
+       u16 last_used_counter:1;
+       u16 last_used_idx:15;
+};
+\end{lstlisting}
+
+The state of a packed virtqueue includes :\\
+\field{avail_counter}: last driver ring wrap counter observed by device.\\
+\field{avail_index}: virtqueue available index.\\
+\field{used_counter}: device ring wrap counter.\\
+\field{used_index}: virtqueue used index.
+
+The VIRTIO_TRANSPTQ_CTRL_VQ_STATE_GET command can be used to get the state of a packed virtqueue.
+The command-out-data is the queue index, the command-in-data contains the \field{queue_index},
+\field{avail_counter}, \field{avail_index}, \field{used_counter} and \field{used_index} of the virtqueue
+(as described in transportq_ctrl_packed_vq_state).
+
+The VIRTIO_TRANSPTQ_CTRL_VQ_STATE_SET command can be used to set the state of a packed virtqueue.
+The command-out-data contains the \field{queue_index}, \field{avail_counter}, \field{avail_index},
+\field{used_counter} and \field{used_index} for the virtqueue
+(as described in transportq_ctrl_packed_vq_state).
+There is no command-in-data.
+
+\devicenormative{\subsubsection}{Virtqueue State}{Virtio Transport Options /
+Virtio Over Transport Virtqueue / Virtqueue State}
+
+The management device MUST fail the virtqueue index access if \field{device_id} is 0.
+
+The management device MUST fail the virtqueue index access if \field{queue_index} is out-of-range invalid.
+
+\subsection{Virtqueue ASID}\label{sec:Virtio Transport Options / Virtio Over
+Transport Virtqueue / Virtqueue ASID}
+
+The address space id of a virtqueue could be set through the following command:
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_VQ_ASID        13
+ #define VIRTIO_TRANSPTQ_CTRL_VQ_ASID_SET   1
+
+struct virtio_transportq_ctrl_vq_asid_set {
+       u16 queue_index;
+       u32 primary_asid;
+       u32 secondary_asid;
+       u8 padding[2];
+};
+\end{lstlisting}
+
+The VIRTIO_TRANSPTQ_CTRL_VQ_ASID_SET command is used to set the address space IDs(\field{asid})
+of a virtqueue.
+
+The address space ID is a transport specific identifier of a memory space.
+An ASID is used to convey the address space targeted by DMA,
+and to distinguish DMA performed by different virtqueues or virtqueue groups.
+The default value of an ASID is 0.
+
+One example of the address space id is PASID (Process Address Space Identifier) which is
+defined in \hyperref[intro:PCIe]{[PCIe]} specification.
+
+The command-out-data of VIRTIO_TRANSPTQ_CTRL_VQ_ASID_SET command is the \field{queue_index},
+the primary address space id (\field{primary_asid}), and the optional secondary asid(\field{secondary_asid})
+(as described in struct virtio_transportq_ctrl_vq_asid_set).
+
+The default value for an ASID is 0, setting 0 to an ASID will invalidate it.
+
+\devicenormative{\subsubsection}{Virtqueue ASID}{Virtio Transport Options /
+Virtio Over Transport Virtqueue / Virtqueue ASID}
+
+Once a virtqueue has been set ASIDs, it MUST perform any memory accesses with a proper asid.
+
+The management device MUST fail the virtqueue index access if \field{device_id} is 0.
+
+The management device MUST fail the virtqueue index access if \field{queue_index} is out-of-range invalid.
+
+\subsection{Virtqueue Reset}\label{sec:Virtio Transport Options / Virtio Over
+Transport Virtqueue / Virtqueue Reset}
+
+A virtqueue can be reset (\ref {sec:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset})
+through the following command:
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_VQ_RESET        14
+ #define VIRTIO_TRANSPTQ_CTRL_VQ_DO_RESET    1
+\end{lstlisting}
+
+The VIRTIO_TRANSPTQ_CTRL_VQ_DO_RESET command is used to reset a virtqueue.
+The command-out-data is the queue index, there is no command-in-data.
+
+\devicenormative{\subsubsection}{Virtqueue Reset}{Virtio Transport Options /
+Virtio Over Transport Virtqueue / Virtqueue Reset}
+
+The management device MUST fail VIRTIO_TRANSPTQ_CTRL_VQ_RESET if
+\field{device_id} is 0.
+
+The management device MUST fail VIRTIO_TRANSPTQ_CTRL_VQ_RESET if
+the virtqueue index is out-of-range  invalid.
+
+The managed device MUST stop consuming the descriptors in the virtqueue once reset it.
+
+The managed device MUST present default states of a virtqueue after reset it.
+
+\drivernormative{\subsubsection}{Virtqueue Reset}{Virtio Transport Options /
+Virtio Over Transport Virtqueue / Virtqueue Reset}
+
+After reseting a virtqueue, the driver MUST wait until the reset is successfully
+done (by verifying virtio_transportq_ctrl.ack == VIRTIO_TRANSPTQ_OK)
+before re-enabling it.
+
 \chapter{Device Types}\label{sec:Device Types}
 
 On top of the queues, config space and feature negotiation facilities
-- 
2.35.3

