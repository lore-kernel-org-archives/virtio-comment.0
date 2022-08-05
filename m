Return-Path: <virtio-comment-return-3328-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1F01598658A
	for <virtio-comment@lists.oasis-open.org>; Fri,  5 Aug 2022 10:02:36 +0000 (UTC)
From: Zhu Lingshan <lingshan.zhu@intel.com>
Date: Fri,  5 Aug 2022 17:53:41 +0800
Message-Id: <20220805095343.486546-3-lingshan.zhu@intel.com>
In-Reply-To: <20220805095343.486546-1-lingshan.zhu@intel.com>
References: <20220805095343.486546-1-lingshan.zhu@intel.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH V3 RESEND 2/4] Introduce the commands set of the transport vq
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true
To: jasowang@redhat.com, mst@redhat.com, cohuck@redhat.com, sgarzare@redhat.com, stefanha@redhat.com, nrupal.jani@intel.com, Piotr.Uminski@intel.com, hang.yuan@intel.com
Cc: virtio-comment@lists.oasis-open.org, Zhu Lingshan <lingshan.zhu@intel.com>
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
 content.tex | 636 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 636 insertions(+)

diff --git a/content.tex b/content.tex
index c747d21..190f3a0 100644
--- a/content.tex
+++ b/content.tex
@@ -2975,6 +2975,642 @@ \subsection{Format of Commands through Transport Vi=
rtqueue}\label{sec:Virtio Tra
 The \field{device_id} value 0 is used to identify the management device it=
self.
=20
 \field{class} is an identifier of a set of commands with similar  purposes=
.
+=20
+\subsection{Available Resource of the Management Device}\label{sec:Virtio =
Transport Options / Virtio Over Transport Virtqueue / Available Resource of=
 the Management Device}
+
+When VIRTIO_F_TRANSPT_VQ is negotiated with the management device,
+statistical information of available resources on the management device co=
uld be fetched
+by the following command:
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_AVAIL_RES    1 (class)
+ #define VIRTIO_TRANSPTQ_CTRL_AVAIL_RES_GET     0 (command)
+\end{lstlisting}
+
+VIRTIO_TRANSPTQ_CTRL_AVAIL_RES_GET command is used to get the statistical =
information of the available
+resource of a management device. There is no command-out-data for VIRTIO_T=
RANSPTQ_CTRL_AVAIL_RES_GET
+command. The management device fills command-in-data in the following form=
at:
+
+\begin{lstlisting}
+struct virtio_mgmt_dev_avail_res {
+        /* The number of management device total remaining available free
+         * virtqueues for the managed devices
+         */
+        u16 num_avail_vqs;
+        /* The minimal number of virtqueues for a managed device */
+        u16 min_dev_vqs;
+        /* The maximum number of virtqueues for a managed device */
+        u16 max_dev_vqs;
+        /* The number of managed devices that can be created with min_vqs =
virtqueues */
+        u16 num_avail_dev;
+};
+\end{lstlisting}
+
+\field{max_avail_dev} MAY not equal to \field{num_avail_vqs} divided by \f=
ield{min_vqs}
+due to the limitations of of other resources.
+
+\devicenormative{\subsubsection}{Available Resource of the Management Devi=
ce}{Virtio Transport Options /
+Virtio Over Transport Virtqueue / Available Resource of the Management Dev=
ice}
+
+The management device MUST fail VIRTIO_TRANSPTQ_CTRL_AVAIL_RES_GET command=
 if \field{device_id} is not 0
+
+\drivernormative{\subsubsection}{Available Resource of the Management Devi=
ce}{Virtio Transport Options /
+Virtio Over Transport Virtqueue / Available Resource of the Management Dev=
ice}
+
+The management device driver MUST use 0 as \field{device_id} for
+VIRTIO_TRANSPTQ_CTRL_AVAIL_RES_GET command.
+
+\subsection{Create and Destroy Managed Devices}\label{sec:Virtio Transport=
 Options / Virtio Over Transport Virtqueue / Create and Destroy Managed Dev=
ices}
+
+When VIRTIO_F_TRANSPT_VQ is negotiated with the management device,
+managed devices must be created and destroyed through the transport virtqu=
eue.
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPORTQ_CTRL_DEV    2
+ #define VIRTIO_TRANSPORTQ_CTRL_DEV_CREATE        0
+ #define VIRTIO_TRANSPORTQ_CTRL_DEV_DESTROY       1
+
+struct virtio_transportq_ctrl_dev_attribute {
+       u64 device_features[2];
+       u32 virtio_device_id;
+       u8 dev_config[];
+};
+\end{lstlisting}
+
+The VIRTIO_TRANSPORTQ_CTRL_DEV_CREATE command is used to create a managed =
device.
+
+As described in struct virtio_transportq_ctrl_dev_attribute, the command-o=
ut-data for VIRTIO_TRANSPTQ_CTRL_DEV_CREATE includes:
+\begin{itemize*}
+\item \field{device_features}: the 128-bit device feature bits (defined in=
 section \ref{sec:Basic Facilities of a Virtio Device / Feature Bits})
+of the managed device.
+\item \field{virtio_device_id}: the virtio device id defined in Chapter \r=
ef{sec:Device Types}.
+\item \field{dev_config}: the device type specific configurations. E.g., f=
or a virtio-net device,
+it is struct virtio_net_config in section \ref{sec:Device Types / Network =
Device / Device configuration layout};
+for a virtio-block device, it is struct virtio_blk_config in section \ref{=
sec:Device Types / Block Device / Device configuration layout}
+\end{itemize*}
+
+When succeed, the device returns a 64 bits UUID as an unique identifier of=
 the created managed device in command-in-data.
+
+The VIRTIO_TRANSPORTQ_CTRL_DEV_DESTROY command is used to destroy a
+managed device which is identified by its 64 bits UUID
+\field{device_id}. There's no command-in-data nor command-out-data for
+VIRTIO_TRANSPTQ_CTRL_DEV_DESTROY command.
+
+\devicenormative{\subsubsection}{Create and Destroy Managed Devices}{Virti=
o Transport Options / Virtio Over Transport Virtqueue / Create and Destroy =
Managed Devices}
+
+The management device MUST fail VIRTIO_TRANSPORTQ_CTRL_DEV_CREATE command
+if \field{device_id} is not 0.
+
+The management device MUST fail VIRTIO_TRANSPORTQ_CTRL_DEV CREATE command
+if \field{device_features} exceeds the features that can be provided from =
the management device.
+
+The management device MUST fail VIRTO_TRANSPORTQ_CTRL_DEV_DESTROY command
+if \field{device_id} is 0.
+
+\drivernormative{\subsubsection}{Create and Destroy Managed Devices}{Virti=
o Transport Options / Virtio Over Transport Virtqueue / Create and Destroy =
Managed Devices}
+
+The management device driver MUST use 0 as \field{device_id} for
+TRANSPORTQ_CTRL_DEV_CREATE command.
+
+\subsection{Features Negotiation}\label{sec:Virtio Transport Options / Vir=
tio
+Over Transport Virtqueue / Features Negotiation}
+
+When VIRTIO_F_TRANSPT_VQ is negotiated with the management device,
+the features negotiation of managed devices is done by the
+following commands:
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_FEAT   3
+ #define VIRTIO_TRANSPTQ_CTRL_FEAT_DEVICE_GET        0
+ #define VIRTIO_TRANSPTQ_CTRL_FEAT_DRIVER_SET        1
+ #define VIRTIO_TRANSPTQ_CTRL_FEAT_DRIVER_GET        2
+\end{lstlisting}
+
+The VIRTIO_TRANSPTQ_CTRL_FEAT_DEVICE_GET command is used to get the featur=
es offered
+by a managed device. The command-in-data is the 128-bit feature bits
+(defined in section \ref{sec:Basic Facilities of a Virtio Device / Feature=
 Bits}).
+There is no command-out-data.=20
+
+The VIRTIO_TRANSPTQ_CTRL_FEAT_DRIVER_SET command is for the driver to acce=
pt feature
+bits offered by the managed device. The command-out-data is the 128-bit fe=
ature bits
+passed to the managed device. There is no command-in-data.
+
+The VIRTIO_TRANSPTQ_CTRL_FEAT_DRIVER_GET command is used to get the featur=
es accepted
+by both the managed device driver and the managed device. The command-in-d=
ata is the
+128-bit feature bits. There is no command-out-data.
+
+\devicenormative{\subsubsection}{Features Negotiation}{Virtio Transport Op=
tions /
+Virtio Over Transport Virtqueue / Features Negotiation}
+
+The management device MUST fail VIRTIO_TRANSPTQ_F_CTRL_FEAT class commands=
 if
+\field{device_id} is 0.
+
+\subsection{Device Status}\label{sec:Virtio Transport Options / Virtio Ove=
r
+Transport Virtqueue / Device Status}
+
+When VIRTIO_F_TRANSPT_VQ is negotiated with the management device,
+the device status of a managed device can be accessed by the following
+commands:
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_STATUS    4
+ #define VIRTIO_TRANSPTQ_CTRL_STATUS_GET        0
+ #define VIRTIO_TRANSPTQ_CTRL_STATUS_SET        1
+\end{lstlisting}
+
+The VIRTIO_TRANSPTQ_CTRL_STATUS_GET command is used to get the device stat=
us of
+a managed device. The command-in-data is the 8-bit status
+returned from the device. There's no command-out-data for this
+command.
+
+The VIRTIO_TRANSPTQ_CTRL_STATUS_SET command is used to set the device stat=
us of
+a managed device. The command-out-data is the 8-bit status
+to set to the device. There's no command-in-data for this command.
+
+\devicenormative{\subsubsection}{Device Status}{Virtio Transport Options /=
 Virtio
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
+\drivernormative{\subsubsection}{Device Status}{Virtio Transport Options /=
 Virtio
+Over Transport Virtqueue / Device Status}
+
+After writing 0 via VIRTIO_TRANSPTQ_CTRL_STATUS_SET, the driver MUST wait
+for the success of the command before re-initializing the device.
+
+\subsection{Device Generation}\label{sec:Virtio Transport Options / Virtio=
 Over Transport Virtqueue / Device Generation}
+
+When VIRTIO_F_TRANSPT_VQ is negotiated with the management device,
+the device generation count can be read from the following commands:
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_GENERATION    5
+ #define VIRTIO_TRANSPTQ_CTRL_GENERATION_GET        0
+\end{lstlisting}
+
+The VIRTIO_TRANSPTQ_CTRL_GENERATION_GET command is used to get the device =
configuration generation count
+of the managed device. The command-in-data is the one byte device
+generation returned from the device. There's no command-out-data for
+this command.
+
+\devicenormative{\subsubsection}{Device Generation}{Virtio Transport Optio=
ns / Virtio Over Transport Virtqueue / Device Generation}
+
+The managed device MUST present a changed generation count after the drive=
r
+has read any device-specific configuration values if the values have been =
changed
+during the last read.
+
+The management device MUST fail the device generation access if \field{dev=
ice_id} is 0.
+
+\subsection{Device Specific Configuration}\label{sec:Virtio Transport Opti=
ons /
+Virtio Over Transport Virtqueue / Device Specific Configuration}
+
+When VIRTIO_F_TRANSPT_VQ is negotiated with the management device,
+the device config space contents of a managed device can be accessed throu=
gh
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
+of the data (as described in struct virtio_transportq_ctrl_dev_config_get)=
.
+The command-in-data is an array of the data that read from the config spac=
e.
+
+The VIRTIO_TRANSPTQ_CTRL_CONFIG_SET command is used to write data to the d=
evice
+configuration space. The command-out-data contains the
+\field{offset} from the start of the config space, the \field{size} of the=
 data and
+the \field{data} to be written (as described in struct virtio_transportq_c=
trl_dev_config_set).
+There's no command-in-data for this command.
+
+\devicenormative{\subsubsection}{Device Specific Configuration}{Virtio Tra=
nsport
+Options / Virtio Over Transport Virtqueue / Device Specific Configuration}
+
+The management device MUST fail the device configuration space access
+if the driver access the range which is outside the config space.
+
+The management device MUST fail the device configuration space access
+if \field{device_id} is 0.
+
+\subsection{MSI Configuration}\label{sec:Virtio Transport Options / Virtio=
 Over
+Transport Virtqueue / MSI Configuration}
+
+When VIRTIO_F_TRANSPT_VQ is negotiated with the management device,
+the MSI entries of a managed device can be accessed  through the following=
 command:
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_MSI    7
+ #define VIRTIO_TRANSPTQ_CTRL_MSI_VQ_GET        0
+ #define VIRTIO_TRANSPTQ_CTRL_MSI_VQ_SET        1
+ #define VIRTIO_TRANSPTQ_CTRL_MSI_VQ_ENABLE     2
+ #define VIRTIO_TRANSPTQ_CTRL_MSI_CONFIG_GET    3
+ #define VIRTIO_TRANSPTQ_CTRL_MSI_CONFIG_WET    4
+ #define VIRTIO_TRANSPTQ_CTRL_MSI_CONFIG_ENABLE 5
+
+struct virtio_transportq_ctrl_msi_vq_config {
+       u16 queue_index;
+       u64 address;
+       u32 data;
+       u8 padding[2];
+};
+
+struct virtio_transportq_ctrl_msi_vq_enable {
+       u16 queue_index;
+       u8 enable;
+       u8 padding[5];
+};
+
+struct virtio_transportq_ctrl_msi_config {
+       u64 address;
+       u32 data;
+       u8 padding[4];
+};
+\end{lstlisting}
+
+The VIRTIO_TRANSPTQ_CTRL_MSI_VQ_GET command is used to read the MSI entry =
of a
+specific virtqueue. The command-out-data is the queue index. The command-i=
n-data contains
+\field{queue_index}, the \field{address} and \field{data}
+(as described in struct virtio_transportq_ctrl_msi_vq_config).
+
+
+The VIRTIO_TRANSPTQ_CTRL_MSI_VQ_SET command is used to set the MSI entry f=
or a
+specific virtqueue. The command-out-data is the \field{queue_index},
+\field{address} and \field{data} (as described in struct virtio_transportq=
_ctrl_msi_vq_config).
+There is no command-in-data.
+
+The VIRTIO_TRANSPTQ_CTRL_MSI_VQ_ENABLE command is used to enable or disabl=
e
+the MSI interrupt for a specific virtqueue. The command-out-data is the
+\field{queue_index} and a byte \field{enable} which representing ENABLE or=
 DISABLE the MSI.
+(as described in struct virtio_transportq_ctrl_msi_vq_enable).
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_MSI_VQ_ENABLE     1
+#define VIRTIO_TRANSPTQ_CTRL_MSI_VQ_DISABLE    0
+\end{lstlisting}
+
+The VIRTIO_TRANSPTQ_CTRL_MSI_CONFIG_GET command is used to read the MSI en=
try
+of the config interrupt. The command-in-data contains the \field{address} =
and
+\field{data} (as described in struct virtio_transportq_ctrl_msi_config).
+There is no command-out-data.
+
+The VIRTIO_TRANSPTQ_CTRL_MSI_CONFIG_SET command is used to set the MSI ent=
ry
+for the config interrupt. The command-out-data is the \field{address} and
+\field{data} (as described in struct virtio_transportq_ctrl_msi_config).
+There is no command-in-data.
+
+The VIRTIO_TRANSPTQ_CTRL_MSI_CONFIG_ENABLE command is used to enable or di=
sable
+the MSI interrupt for config space. The command-out-data is a byte which r=
epresenting
+ENABLE or DISABLE the config MSI.
+There is no command-in-data
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_MSI_CFG_ENABLE     1
+#define VIRTIO_TRANSPTQ_CTRL_MSI_CFG_DISABLE    0
+\end{lstlisting}
+
+\devicenormative{\subsubsection}{MSI Configuration}{Virtio Transport Optio=
ns / Virtio
+ver Transport Virtqueue / MSI Configuration}
+
+The managed device MUST disable the MSI interrupts for both virtqueues and=
 config space
+upon a reset.
+
+Once a MSI entry is disabled, the managed device MUST not send any interru=
pts
+by this MSI entry.
+
+\drivernormative{\subsubsection}{MSI Configuration}{Virtio Transport Optio=
ns / Virtio
+Over Transport Virtqueue / MSI Configuration}
+
+The driver MUST allocate transport or platform specific MSI entries
+for both virtqueues and config space if it wants to use interrupts.
+
+The driver MAY choose to disable the MSI if polling mode is used.
+
+\subsection{Virtqueue Address}\label{sec:Virtio Transport Options / Virtio=
 Over
+Transport Virtqueue / Virtqueue Address}
+
+When VIRTIO_F_TRANSPT_VQ is negotiated with the management device,
+the addresses of a specific virtqueue are accessed through the following c=
ommand:
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
+The VIRTIO_TRANSPTQ_CTRL_VQ_ADDR_SET command is used to set the addresses =
of a specified
+virtqueue. The command-out-data contains the \field{queue_index}, the addr=
esses of \field{device_area},
+\field{descriptor_area} and \field{driver_area} (as described in struct
+virtio_transportq_ctrl_vq_addr). There's no command-in-data.
+
+\devicenormative{\subsubsection}{Virtqueue Address}{Virtio Transport Optio=
ns / Virtio
+Over Transport Virtqueue / Virtqueeu Address}
+
+The management device MUST fail the commands of class
+VIRTIO_TRANSPTQ_CTRL_VQ_ADDR if \field{device_id} is 0.
+
+The management device MUST fail the commands of class
+VIRTIO_TRANSPTQ_CTRL_VQ_ADDR if \field{queue_index} is out-of-range invali=
d.
+
+\subsection{Virtqueue Status}\label{sec:Virtio Transport Options / Virtio =
Over
+Transport Virtqueue / Virtqueue Status}
+
+When VIRTIO_F_TRANSPT_VQ is negotiated with the management device,
+virtqueue status is accessed through the following command:
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
+The VIRTIO_TRANSPTQ_CTRL_VQ_ENABLE_SET command is used to set the status o=
f a
+specific virtqueue. The command-out-data is the \field{queue_index} and th=
e
+\field{status} representing ENABLE or DISABLE that is set to the virtqueue
+(as described in struct virtio_transportq_ctrl_vq_status_set).
+There's no command-in-data.
+
+\devicenormative{\subsubsection}{Virtqueue Status}{Virtio Transport Option=
s / Virtio
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
+
+\drivernormative{\subsubsection}{Virtqueue Status}{Virtio Transport Option=
s / Virtio
+Over Transport Virtqueue / Virtqueue Status}
+
+The driver MUST configure other virtqueue fields before enabling
+the virtqueue with VIRTIO_TRANSPTQ_CTRL_VQ_ENABLE_SET.
+
+\subsection{Virtqueue Size}\label{sec:Virtio Transport Options / Virtio Ov=
er
+Transport Virtqueue / Virtqueue Size}
+
+When VIRTIO_F_TRANSPT_VQ is negotiated with the management device,
+virtqueue size is accessed through the following command:
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
+command-in-data is an 16-bit queue size.
+
+The VIRTIO_TRANSPTQ_CTRL_VQ_SIZE_SET command is used to set the virtqueue
+size. The command-out-data is the \field{queue_index} and the \field{size}
+of the virtqueue (as described in struct virtio_transportq_ctrl_vq_size_se=
t).
+There's no command-in-data.
+
+\devicenormative{\subsubsection}{Virtqueue Status}{Virtio Transport Option=
s / Virtio
+Over Transport Virtqueue / Virtqueue Size}
+
+The management device MUST fail the virtqueue size access if
+\field{device_id} is 0.
+
+The management device MUST fail the virtqueue size access if
+the queue index is out-of-range invalid.
+
+\subsection{Virtqueue Notification}\label{sec:Virtio Transport Options / V=
irtio
+Over Transport Virtqueue / Virtqueue Notification}
+
+When VIRTIO_F_TRANSPT_VQ is negotiated with the management device,
+the virtqueue notification area information can be get through the followi=
ng commands:
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
+of the notification area (as described in struct virtio_transportq_ctrl_vq=
_notification_area).
+
+\devicenormative{\subsubsection}{Virtqueue Notification}{Virtio Transport =
Options /
+Virtio Over Transport Virtqueue / Virtqueue Notification}
+
+The management device MUST fail the virtqueue notification area informatio=
n
+access if \field{device_id} is 0.
+
+The management device MUST fail the virtqueue notification area informatio=
n
+access if the queue index is out-of-range invalid.
+
+\drivernormative{\subsubsection}{Virtqueue Notification}{Virtio Transport =
Options /
+Virtio Over Transport Virtqueue / Virtqueue Notification}
+
+The driver MAY choose to notify the virtqueue by writing the queue
+index at address \field{address} which is fetched from the
+VIRTIO_TRANSPTQ_CTRL_VQ_NOTIFY_GET command.
+
+\subsection{Virtqueue State}\label{sec:Virtio Transport Options / Virtio
+Over Transport Virtqueue / Virtqueue State}
+
+When VIRTIO_F_TRANSPT_VQ is negotiated with the management device,
+the virtqueue state is accessed through the following commands:
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_VQ_STATE            12
+ #define VIRTIO_TRANSPTQ_CTRL_VQ_STATE_GET       0
+ #define VIRTIO_TRANSPTQ_CTRL_VQ_STATE_SET       1
+\end{lstlisting}
+
+\subsubsection{Split Virtqueue State}\label{sec:Virtio Transport Options /=
 Virtio
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
+The VIRTIO_TRANSPTQ_CTRL_VQ_STATE_GET command can be  used to get the stat=
e of a
+split virtqueue. The command-out-data is the queue index, the command-in-d=
ata is the available index of the virtqueue.
+
+The VIRTIO_TRANSPTQ_CTRL_VQ_STATE_SET command can be used to set the state=
 of a
+split virtqueue. The command-out-data contains the \field{queue_index} and=
 the
+available index (\field{avail_index}) for the virtqueue (as described in s=
truct virtio_transportq_ctrl_split_vq_state_set).
+There is no command-in-data.
+
+\subsubsection{Packed Virtqueue State}\label{sec:Virtio Transport Options =
/ Virtio
+Over Transport Virtqueue / Virtqueue State / Packed Virtqueue State}
+
+\begin{lstlisting}
+struct virtio_transportq_ctrl_packed_vq_state {
+    u16 queue_index;
+    u16 avail_counter;
+    u16 avail_index;
+    u16 used_counter;
+    u16 used_index;
+    u8 padding[6];
+};
+\end{lstlisting}
+
+The state of a packed virtqueue includes :\\
+\field{avail_counter}: last driver ring wrap counter observed by device.\\
+\field{avail_index}: virtqueue available index.\\
+\field{used_counter}: device ring wrap counter.\\
+\field{used_index}: virtqueue used index.
+
+The VIRTIO_TRANSPTQ_CTRL_VQ_STATE_GET command can be used to get the state=
 of a packed virtqueue.
+The command-out-data is the queue index, the command-in-data contains the =
\field{queue_index},
+\field{avail_counter}, \field{avail_index}, \field{used_counter} and \fiel=
d{used_index} of the virtqueue
+(as described in transportq_ctrl_packed_vq_state).
+
+The VIRTIO_TRANSPTQ_CTRL_VQ_STATE_SET command can be used to set the state=
 of a packed virtqueue.
+The command-out-data contains the \field{queue_index}, \field{avail_counte=
r}, \field{avail_index},
+\field{used_counter} and \field{used_index} for the virtqueue
+(as described in transportq_ctrl_packed_vq_state).
+There is no command-in-data.
+
+\devicenormative{\subsubsection}{Virtqueue State}{Virtio Transport Options=
 /
+Virtio Over Transport Virtqueue / Virtqueue State}
+
+The management device MUST fail the virtqueue index access if \field{devic=
e_id} is 0.
+
+The management device MUST fail the virtqueue index access if \field{queue=
_index} is out-of-range invalid.
+
+\subsection{Virtqueue ASID}\label{sec:Virtio Transport Options / Virtio Ov=
er
+Transport Virtqueue / Virtqueue ASID}
+
+When VIRTIO_F_TRANSPT_VQ is negotiated with the management device,
+the address space id of a virtqueue could be set through the following com=
mand:
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_VQ_ASID        13
+ #define VIRTIO_TRANSPTQ_CTRL_VQ_ASID_SET   1
+
+struct virtio_transportq_ctrl_vq_asid_set {
+       u16 queue_index;
+       u32 asid;
+       u8 padding[2];
+};
+\end{lstlisting}
+
+The VIRTIO_TRANSPTQ_CTRL_VQ_ASID_SET command is used to set the address sp=
ace id(\field{asid})
+of a virtqueue.
+
+The address space id is an identifier of a memory space which is used to c=
onvey the address space targeted by the
+memory accesses, and to distinguish memory accesses performed by different=
 virtqueues
+
+One example of the address space id is PASID (Process Address Space Identi=
fier) which is
+defined in \hyperref[intro:PCIe]{[PCIe]} specification.
+
+The command-out-data of VIRTIO_TRANSPTQ_CTRL_VQ_ASID_SET command is the \f=
ield{queue_index}
+and the address space id (\field{asid}).
+(as described in struct virtio_transportq_ctrl_vq_asid_set).
+
+\devicenormative{\subsubsection}{Virtqueue ASID}{Virtio Transport Options =
/
+Virtio Over Transport Virtqueue / Virtqueue ASID}
+
+Once a virtqueue has been set an asid, it MUST perform any memory accesses=
 with the asid.
+
+The management device MUST fail the virtqueue index access if \field{devic=
e_id} is 0.
+
+The management device MUST fail the virtqueue index access if \field{queue=
_index} is out-of-range invalid.
+
+\subsection{Virtqueue Reset}\label{sec:Virtio Transport Options / Virtio O=
ver
+Transport Virtqueue / Virtqueue Reset}
+
+When VIRTIO_F_TRANSPT_VQ is negotiated with the management device,
+a virtqueue can be reset through the following command:
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_VQ_RESET        14
+ #define VIRTIO_TRANSPTQ_CTRL_VQ_DO_RESET    1
+\end{lstlisting}
+
+The VIRTIO_TRANSPTQ_CTRL_VQ_DO_RESET command is used to reset a virtqueue.
+The command-out-data is the virtqueue index, there is no command-in-data.
+
+\devicenormative{\subsubsection}{Virtqueue Reset}{Virtio Transport Options=
 /
+Virtio Over Transport Virtqueue / Virtqueue Reset}
+
+The management device MUST fail VIRTIO_TRANSPTQ_CTRL_VQ_RESET if
+\field{device_id} is 0.
+
+The management device MUST fail VIRTIO_TRANSPTQ_CTRL_VQ_RESET if
+the virtqueue index is out-of-range  invalid.
+
+The managed device MUST stop consuming the descriptors in the virtqueue on=
ce reset it.
+
+The managed device MUST present default states of a virtqueue after reset =
it.
+
+\drivernormative{\subsubsection}{Virtqueue Reset}{Virtio Transport Options=
 /
+Virtio Over Transport Virtqueue / Virtqueue Reset}
+
+After reseting a virtqueue, the driver MUST wait until the reset is succes=
sfully
+done (by verifying virtio_transportq_ctrl.ack =3D=3D VIRTIO_TRANSPTQ_OK)
+before re-enabling it.
=20
 \chapter{Device Types}\label{sec:Device Types}
=20
--=20
2.35.3


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

