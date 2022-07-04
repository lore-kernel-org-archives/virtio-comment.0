Return-Path: <virtio-comment-return-3204-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 316949862DE
	for <virtio-comment@lists.oasis-open.org>; Mon,  4 Jul 2022 07:49:40 +0000 (UTC)
From: Zhu Lingshan <lingshan.zhu@intel.com>
Date: Mon,  4 Jul 2022 15:41:42 +0800
Message-Id: <20220704074142.80791-1-lingshan.zhu@intel.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH] Introduce virtio virtual device and transport vq
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true
To: virtio-comment@lists.oasis-open.org, mst@redhat.com, cohuck@redhat.com, jasowang@redhat.com
Cc: sgarzare@redhat.com, eperezma@redhat.com, lulu@redhat.com, Zhu Lingshan <lingshan.zhu@intel.com>
List-ID: <virtio-comment.lists.oasis-open.org>

This patch introduces a new device type: virtio virtual device.
An virtio virtual device example is virtio based
Scalable I/O Virtualization devices.

This commit also introduces a new transport other than PCI and MMIO - the
transport virtqueue.

This transport is useful for implementing virtual devices with a limited
transport specific resources or presenting the virtual device in a
transport independent way.

This means, all the basic device facilities are provided solely via
the the transport virtqueue. Additionally, the transport virtqueue is also =
in
charge of the creating and destroying of the virtual device.

With the help of the transport virtqueue, the presenting of the virtual
device is done via the co-operation between the management device and
its driver.

Signed-off-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
---
 content.tex      | 621 ++++++++++++++++++++++++++++++++++++++++++++++-
 introduction.tex |   3 +
 2 files changed, 622 insertions(+), 2 deletions(-)

diff --git a/content.tex b/content.tex
index 3aeb4a4..1cdb683 100644
--- a/content.tex
+++ b/content.tex
@@ -2784,6 +2784,619 @@ \subsubsection{Resetting Devices}\label{sec:Virtio =
Transport Options / Virtio ov
 In order to reset a device, a driver sends the
 CCW_CMD_VDEV_RESET command.
=20
+\section{Virtio Over Transport Virtqueue}\label{sec:Virtio Transport Optio=
ns Virtio Over Transport Virtqueue}
+Sometimes it's hard to implement the device in a transport specific method=
.
+One example is that a physical device may try to present multiple virtual =
devices
+with limited transport specific resources.
+Another example is to implement virtual devices which are transport indepe=
ndent.
+In those cases, the transport virtqueue provided by the management device =
could be used to replace
+the transport specific method to implement the virtual device.
+Then the presenting of the virtual device is done through the cooperation =
between
+the transport virtqueue and the management device's driver.
+
+Feature bit VIRTIO_F_TRNSPT_VQ indicates that the device offers a transpor=
t virtqueue.
+
+\subsection{Basic Concepts}\label{sec:Virtio Transport Options / Virtio ov=
er Transport Virtqueue / Basic Concepts}
+
+All transport virtqueue commands are of the following form:
+
+\begin{lstlisting}
+struct virtio_transportq_ctrl {
+        u64 device_id;
+        u16 class;
+        u16 command;
+        u32 length_out;
+        u8 command-out-data[];
+        u32 length_in;
+        u32 ack;
+        u8 command-in-data[];
+};
+
+/* ack values */
+#define VIRTIO_TRANSPTQ_OK     0
+#define VIRTIO_TRANSPTQ_EIO    1
+#define VIRTIO_TRANSPTQ_EAGAIN 11
+#define VIRTIO_TRANSPTQ_EBUSY  16
+#define VIRTIO_TRANSPTQ_EINVAL 22
+#define VIRTIO_TRANSPTQ_ERR    255
+\end{lstlisting}
+
+The \field{device_id}, \field{class}, \field{command}, \field{length_out} =
and
+\field{command-out-data} are set by the management driver,
+and the device sets the \field{ack}, \field{length_in} and \field{command-=
in-data}.
+
+\field{device_id} is an UUID to address a virtio virtual device,
+The \field{device_id} value 0 is used for identify the management device i=
tself
+
+\subsubsection{The managment devices}\label{sec:Virtio Transport Options /=
 Virtio over Transport Virtqueue / Basic Concepts / The management devices}
+A device that offers a transport virtqueue (via feature VIRTIO_F_TRNSPT_VQ=
)
+is the management device of the virtual devices which are the managed devi=
ces.
+
+For example, a PCIe PF with a transport virtqueue is a management device.
+
+\subsubsection{The virtual devices}\label{sec:Virtio Transport Options / V=
irtio over Transport Virtqueue / Basic Concepts / The virtual devices}
+A device that is created through a transport virtqueue which is offered by=
 a management
+device is a virtual device. Virtual devices are logical devices, managed b=
y the management devices,
+they usually don't have a dedicated physical transport.
+
+For example, a Scalable I/O Virtualization \hyperref[intro:SIOV]{[SIOV]} d=
evice which is created and managed through a transport virtqueue of
+a management device is a virtual device.
+
+\devicenormative{\subsubsection}{Basic Concepts}{Virtio Transport Options =
/ Virtio Over Transport Virtqueue / Basic Concepts}
+The management device MUST offer feature bit VIRTIO_F_TRNSPT_VQ and a tran=
sport virtqueue as a device specific virtqueue.\\
+The virtual devices MUST not offer VIRTIO_F_TRNSPT_VQ feature.\\
+The management device MUST fail all commands against the transport virtque=
ue if VIRTIO_F_TRNSPT_VQ is not negotiated.
+
+\drivernormative{\subsubsection}{Basic Concepts}{Virtio Transport Options =
/ Virtio Over Transport Virtqueue / Basic Concepts}
+The management driver MUST not send any commands against the transport vir=
tqueue if VIRTIO_F_TRNSPT_VQ is not negotiated.
+
+\subsection{Virtual Devices Discovery}\label{sec:Virtio Transport Options =
/Virtio Over Transport Virtqueue / Virtual Devices Discovery}
+
+The management device is discovered through its own transport and device s=
pecific method.
+Virtual devices are created and discovered via the transport virtqueue.
+
+\subsection{Transport Virtqueue Features}\label{sec:Virtio Transport Optio=
ns /Virtio Over Transport Virtqueue / Transport Virtqueue Features}
+
+Feature bit VIRTIO_F_TRNSPT_VQ_VDEV indicates that the virtual devices are=
 created, configured
+and destroyed through the transport virtqueue.
+This means the transport virtqueue is the transport for the virtual device=
s.
+
+Feature bit VIRTIO_F_TRNSPT_VQ_VDEV depends on VIRTIO_F_TRNSPT_VQ
+
+\devicenormative{\subsubsection}{Transport Virtqueue Features}{Virtio Tran=
sport Options / Virtio Over Transport Virtqueue / Transport Virtqueue Featu=
res}
+The management device MUST not accept VIRTIO_F_TRNSPT_VQ_VDEV if VIRTIO_F_=
TRNSPT_VQ is not negotiated.
+
+\subsection{Device Management}\label{sec:Virtio Transport Options / Virtio=
 Over Transport Virtqueue / Device Management}
+
+When VIRTIO_F_TRNSPT_VQ_VDEV is negotiated,
+virtual devices must be created and destroyed through the transport virtqu=
eue.
+
+\begin{lstlisting}
+struct virtio_transportq_ctrl_vdev_attribute {
+       u32 virtio_device_id;
+       u32 asid;
+       u8 config[];
+};
+
+#define virtio_transportq_ctrl_vdev    1 (class)
+ #define virtio_transportq_ctrl_vdev_CREATE        0 (command)
+ #define virtio_transportq_ctrl_vdev_DESTROY       1 (command)
+\end{lstlisting}
+
+The virtio_transportq_ctrl_vdev_CREATE command is used to create a virtual=
 device.
+The command-out-data for VIRTIO_TRANSPTQ_CTRL_CREATE is the virtio device =
id (\field{virtio_device_id}),
+the address space id (\field{asid})
+and device specific configuration (\field{config}) for creating the virtua=
l device.
+When succeed, the device returns an u64 as a unique identifier of the crea=
ted virtual device in command-in-data.
+
+The field \field{config} is device type specific. E.g., for virtio-net, it=
 should follow the struct virtio_net_config
+in section \ref{sec:Device Types / Network Device / Device configuration l=
ayout}
+
+The virtio_transportq_ctrl_vdev_DESTROY command is used to destroy a
+virtual device which is identified by its 64bit identifier
+\field{virtual_device_id}. There's no command-in-data for
+VIRTIO_TRANSPTQ_CTRL_DESTROY command.
+
+\devicenormative{\subsubsection}{Device Management}{Virtio Transport Optio=
ns / Virtio Over Transport Virtqueue / Device Management}
+
+The management device MUST fail the virtio_transportq_ctrl_vdev_CREATE if
+\field{device_id} is not 0.
+
+The management device MUST fail the virtio_transportq_ctrl_vdev_DESTROY if
+\field{device_id} is 0.
+
+All virtual devices MUST be created via the transport virtqueue if the man=
agement
+device offers VIRTIO_F_TRNSPT_VQ_VDEV.
+
+\drivernormative{\subsubsection}{Driver Management}{Virtio Transport Optio=
ns / Virtio Over Transport Virtqueue / Device Management}
+
+The management driver MUST use 0 as \field{device_id} for
+virtio_transportq_ctrl_vdev_CREATE command.
+
+\subsection{Available resource of the management device}\label{sec:Virtio =
Transport Options / Virtio Over Transport Virtqueue / Available resource of=
 the management devic}
+When VIRTIO_F_TRNSPT_VQ_VDEV is negotiated,
+statistical information of available resource of the management device cou=
ld be fetched
+by the following command:
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_AVAIL_RES    2
+ #define VIRTIO_TRANSPTQ_CTRL_AVAIL_RES_GET     0
+\end{lstlisting}
+
+VIRTIO_TRANSPTQ_CTRL_AVAIL_RES_GET command is used to get the statstical i=
nformation of available
+resource of the management device. There is no command-out-data for VIRTIO=
_TRANSPTQ_CTRL_AVAIL_RES_GET
+command. The management device fills command-in-data in the following form=
at:
+
+\begin{lstlisting}
+struct mgmt_dev_avail_res{
+        /* The number of total remaining virtqueus of the management devic=
e */
+        u16 num_avail_vqs;
+        /* The minimal number of virtqueues of the virtual devices */
+        u16 min_vdev_vqs;
+        /* The maximum number of virtqueues of the virtual devices */
+        u16 max_vdev_vqs;
+        /* The number of virtual devices that can be created with min_vdev=
_vqs virtqueues.
+         * This number may not equal to num_avail_vqs divided by min_vdev_=
vqs due to
+         * the limitations of other resource
+         */
+        u16 num_avail_vdev;
+};
+\end{lstlisting}
+
+If \field{min_vdev_vqs} equals to \field{min_vdev_vqs}, that means the man=
agement device
+can only create virtual devices with a fixed number of virtqueues
+
+\devicenormative{\subsubsection}{Available resource of the management devi=
ce}{Virtio Transport Options /
+Virtio Over Transport Virtqueue / Available resource of the management dev=
ice}
+The management device MUST fail the VIRTIO_TRANSPTQ_CTRL_AVAIL_RES_GET com=
mand if \field{device_id} is not 0
+
+\drivernormative{\subsubsection}{Available resource of the management devi=
ce}{Virtio Transport Options /
+Virtio Over Transport Virtqueue / Available resource of the management dev=
ice}
+The management driver MUST use 0 as \field{device_id} for
+VIRTIO_TRANSPTQ_CTRL_AVAIL_RES_GET command.
+
+\subsection{Features Negotiation}\label{sec:Virtio Transport Options / Vir=
tio
+Over Transport Virtqueue / Features Negotiation}
+
+When VIRTIO_F_TRNSPT_VQ_VDEV is negotiated,
+the feature negotiation of virtual devices is done by the
+following commands:
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_FEAT   3
+ #define VIRTIO_TRANSPTQ_CTRL_FEAT_DEVICE_GET        0
+ #define VIRTIO_TRANSPTQ_CTRL_FEAT_DRIVER_SET        1
+ #define VIRTIO_TRANSPTQ_CTRL_FEAT_DRIVER_GET        2
+\end{lstlisting}
+
+The VIRTIO_TRANSPTQ_CTRL_FEAT_DEVICE_GET is to get the features offered
+by a virtual device.
+
+The VIRTIO_TRANSPTQ_CTRL_FEAT_DRIVER_SET is for driver to accept feature
+bits offered by the virtual device.
+
+The VIRTIO_TRANSPTQ_CTRL_FEAT_DRIVER_GET is to get the features accepted
+by both the virtual driver and the device.
+
+The features is 64 bits mask of the virtio features bit. For
+VIRTIO_TRANSPTQ_CTRL_DRIVER_SET, the feature is passed to the device
+through command-out-data. For VIRTIO_TRANSPTQ_CTRL_FEAT_DEVICE_GET and
+VIRTIO_TRANSPTQ_CTRL_DRIVER_GET the feature is returned for the device
+through command-in-data.
+
+\devicenormative{\subsubsection}{Features Negotiation}{Virtio Transport Op=
tions /
+Virtio Over Transport Virtqueue / Features Negotiation}
+
+The management device MUST fail VIRTIO_TRANSPTQ_F_CTRL_FEAT class for the
+command that use 0 as its \field{device_id}.
+
+\drivernormative{\subsubsection}{Features Negotiation}{Virtio Transport Op=
tions /
+Virtio Over Transport Virtqueue / Features Negotiation}
+
+The management driver MAY mediate between the feature negotiation
+request of the virtual devices and the transport virtqueue. E.g when
+offering features to the virtual device, the management driver MAY
+exclude some features in order to limit the behaviour of the virtual
+device.
+
+\subsection{Device Status}\label{sec:Virtio Transport Options / Virtio Ove=
r
+Transport Virtqueue / Device Status}
+
+When VIRTIO_F_TRNSPT_VQ_VDEV is negotiated,
+the status of virtual device is accessed by the following
+commands:
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_STATUS    4
+ #define VIRTIO_TRANSPTQ_CTRL_STATUS_SET        0
+ #define VIRTIO_TRANSPTQ_CTRL_STATUS_GET        1
+\end{lstlisting}
+
+The VIRTIO_TRANSPTQ_CTRL_STATUS_SET is used to set the device status of
+a virtual device here. The command-out-data is the one byte status
+to set to the device. There's no command-in-data for this command.
+
+The VIRTIO_TRANSPTQ_CTRL_STATUS_GET is used to get the device status of
+a virtual device. The command-in-data is the one byte status
+returned from the device. There's no command-out-data for this
+command.
+
+\devicenormative{\subsubsection}{Device Status}{Virtio Transport Options /=
 Virtio
+Over Transport Virtqueue / Device Status}
+
+The management device MUST reset the virtual device when 0
+is written via VIRTIO_TRANSPTQ_CTRL_STATUS_SET, the success of this
+command demonstrate the success of the reset.
+
+The management device MUST present 0 through
+VIRTIO_TRANSPTQ_CTRL_STATUS_GET once the reset is done.
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
+When VIRTIO_F_TRNSPT_VQ_VDEV is negotiated,
+the device generation count is read from the following commands:
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_GENERATION    5
+ #define VIRTIO_TRANSPTQ_CTRL_GENERATION_GET        0
+\end{lstlisting}
+
+The VIRTIO_TRANSPTQ_CTRL_GENERATION_GET is used to get the device configur=
ation generation field
+of the virtual device. The command-in-data is the u32 device
+generation returned from the device. There's no command-out-data for
+this command.
+
+\devicenormative{\subsubsection}{Device Generation}{Virtio Transport Optio=
ns / Virtio Over Transport Virtqueue / Device Generation}
+
+The management device MUST present a changed generation count after the dr=
iver
+has read a device-specific configuration value which has changed since
+any part of the device-specific configuration was last read.
+
+The management device MUST fail the device generation access if \field{dev=
ice_id} is 0.
+
+\subsection{Device Specific Configuration}\label{sec:Virtio Transport Opti=
ons /
+Virtio Over Transport Virtqueue / Device Specific Configuration}
+
+When VIRTIO_F_TRNSPT_VQ_VDEV is negotiated,
+the device config space contents of a virtual device are accessed through
+VIRTIO_TRANSPTQ_CTRL_CONFIG_GET and VIRTIO_TRANSPTQ_CTRL_CONFIG_SET.
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_CONFIG    6
+  #define VIRTIO_TRANSPTQ_CTRL_CONFIG_GET    0
+  #define VIRTIO_TRANSPTQ_CTRL_CONFIG_SET    1
+
+struct virtio_transportq_ctrl_vdev_config_get {
+       u32 offset;
+       u32 size;
+};
+
+struct virtio_transportq_ctrl_vdev_config_set {
+       u32 offset;
+       u32 size;
+       u8  data[];
+};
+\end{lstlisting}
+
+The VIRTIO_TRANSPTQ_CTRL_CONFIG_GET is used to read data from the
+device configuration space. As described in struct
+virtio_transportq_ctrl_vdev_config_get, The command-out-data is the offset
+from the start of the config space and the size of the data. The
+command-in-data is an array of u8 data that read from the config
+space.
+
+The VIRTIO_TRANSPTQ_CTRL_CONFIG_SET is used to write data to the device
+configuration space. As described in struct
+virtio_transportq_ctrl_vdev_config_set, the command-out-data contains the
+offset from the start of the config space, the size of the data and
+the data that will be written. There's no command-in-data for this
+command.
+
+\devicenormative{\subsubsection}{Device Specific Configuration}{Virtio Tra=
nsport
+Options / Virtio Over Transport Virtqueue / Device Specific Configuration}
+
+The management device MUST fail the device configuration space access
+if the driver wants to access the range which is outside the config space.
+
+The management device MUST fail the device configuration space access
+if \field{device_id} is 0.
+
+\subsection{MSI Configuration}\label{sec:Virtio Transport Options / Virtio=
 Over
+dmin Virtqueue / MSI Configuration}
+
+When VIRTIO_F_TRNSPT_VQ_VDEV is negotiated,
+the MSI entry for a specific virtqueue is set through following command:
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_MSI    7
+ #define VIRTIO_TRANSPTQ_CTRL_MSI_VQ_SET        0
+ #define VIRTIO_TRANSPTQ_CTRL_MSI_VQ_ENABLE     1
+ #define VIRTIO_TRANSPTQ_CTRL_MSI_VQ_MASK       2
+ #define VIRTIO_TRANSPTQ_CTRL_MSI_CONFIG_SET    3
+ #define VIRTIO_TRANSPTQ_CTRL_MSI_CONFIG_ENABLE 4
+ #define VIRTIO_TRANSPTQ_CTRL_MSI_CONFIG_MASK   5
+
+struct virtio_transportq_ctrl_vdev_msi_vq_set {
+       u16 queue_index;
+       u64 addr;
+       u32 data;
+};
+
+struct virtio_transportq_ctrl_vdev_msi_vq_enable {
+       u16 queue_index;
+       u8 enable;
+};
+
+struct virtio_transportq_ctrl_vdev_msi_vq_mask {
+       u16 queue_index;
+       u8 mask;
+};
+
+struct virtio_transportq_ctrl_vdev_msi_config {
+       u64 addr;
+       u32 data;
+};
+\end{lstlisting}
+
+The VIRTIO_TRANSPTQ_CTRL_MSI_VQ_SET command is used to set the MSI entry f=
or a
+specific virtqueue. The command-out-data is the virtqueue index and
+the MSI address and data (as described in struct
+virtio_transportq_ctrl_vdev_msix_vq_set).
+
+The VIRTIO_TRANSPTQ_CTRL_MSI_VQ_ENABLE command is used to enable or disabl=
e
+the MSI interrupt for a specific virtqueue. The command-out-data is the
+virtqueue index and whether to enable the MSI: 0 means to enable and 1
+means to disable (as described in struct
+virtio_transportq_ctrl_vdev_msi_vq_enable).
+
+The VIRTIO_TRANSPTQ_CTRL_MSI_VQ_MASK command is used to mask or unmask the
+MSI interrupt for a specific virtqueue. The command-out-data is the
+virtqueue index and the mask status: 0 means unmak and 1 means mask
+(as described in struct virtio_transportq_ctrl_vdev_msi_vq_mask).
+
+The VIRTIO_TRANSPTQ_CTRL_MSI_CONFIG_SET command is used to set the MSI ent=
ry
+for the config interrupt. The command-out-data is the MSI address and
+data (as described in struct virtio_transportq_ctrl_vdev_msi_config).
+
+The VIRTIO_TRANSPTQ_CTRL_MSI_CONFIG_ENABLE command is used to enable and d=
isable
+MSI for config space. The command-out-data is an u8: 0 means to
+disable and 1 means to enable.
+
+The VIRTIO_TRANSPTQ_CTRL_MSI_CONFIG_MASK command is used to mask and unmas=
k MSI
+interrupt for config space. The command-out-data is an u8: 0 means to
+mask and 1 means to unmask.
+
+There's no command-in-data for all the above MSI commands.
+
+\devicenormative{\subsubsection}{MSI Configuration}{Virtio Transport Optio=
ns / Virtio
+ver Transport Virtqueue / MSI Configuration}
+
+The virtual device MUST record the pending MSI interrupts and
+re-generate the pending MSI interrupts when unmasking.
+
+The virtual device MUST disable the MSI for both virtqueue and config spac=
e
+upon reset.
+
+\drivernormative{\subsubsection}{MSI Configuration}{Virtio Transport Optio=
ns / Virtio
+Over Transport Virtqueue / MSI Configuration}
+
+The driver MUST allocate transport or platform specific MSI entries
+for both virtqueue and config space if it wants to use interrupt.
+
+The driver MAY choose disable the MSI if polling mode is used.
+
+\subsection{Virtqueue Address}\label{sec:Virtio Transport Options / Virtio=
 Over
+Transport Virtqueue / Virtqueue Address}
+
+When VIRTIO_F_TRNSPT_VQ_VDEV is negotiated,
+the addresses of a specific virtqueue are accessed through the following c=
ommand:
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_VQ_ADDR    8
+ #define VIRTIO_TRANSPTQ_CTRL_VQ_ADDR_SET       0
+
+struct virtio_transportq_ctrl_vdev_vq_addr {
+       u16 queue_index;
+       u64 device_area;
+       u64 descriptor_area;
+       u64 driver_area;
+};
+\end{lstlisting}
+
+The command-out-data is the queue index, the addresses of device area,
+descriptor area and driver area (as described in struct
+virtio_transportq_ctrl_vdev_vq_addr); There's no command-in-data.
+
+\devicenormative{\subsubsection}{Virtqueue Address}{Virtio Transport Optio=
ns / Virtio
+Over Transport Virtqueue / Virtqueeu Address}
+
+The management device MUST fail the commands of class
+VIRTIO_TRANSPTQ_CTRL_VQ_ADDR if \field{device_id} is 0.
+
+\subsection{Virtqueue Status}\label{sec:Virtio Transport Options / Virtio =
Over
+Transport Virtqueue / Virtqueue Status}
+
+When VIRTIO_F_TRNSPT_VQ_VDEV is negotiated,
+virtqueue status is set and get through the following command:
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_VQ_ENABLE    9
+ #define VIRTIO_TRANSPTQ_CTRL_VQ_ENABLE_SET       0
+ #define VIRTIO_TRANSPTQ_CTRL_VQ_ENABLE_GET       1
+
+struct virtio_transportq_ctrl_vq_status_set {
+  u16 queue_index;
+  u8 status;
+};
+
+\end{lstlisting}
+
+The VIRTIO_TRANSPTQ_CTRL_VQ_ENABLE_SET command is used to set the status o=
f a
+specific virtqueue. The command-out-data is the queue index and the
+status that is set to the virtqueue (0 disabled, 1 enabled),
+as described in struct virtio_transportq_ctrl_vq_status_set.
+There's no command-in-data.
+
+The VIRTIO_TRANSPTQ_CTRL_VQ_ENABLE_GET is used to get the status of a
+specific virtqueue. The command-out-data is an u16 of the queue
+index. The command-in-data is the virtqueue status (0 disabled, 1
+enabled).
+
+\devicenormative{\subsubsection}{Virtqueue Status}{Virtio Transport Option=
s / Virtio
+Over Transport Virtqueue / Virtqueue Status}
+
+When disabled, the virtual device MUST stop processing requests from
+this virtqueue.
+
+The management device MUST present a 0 via
+VIRTIO_TRANSPTQ_CTRL_VQ_ENABLE_GET upon a reset of the virtual device.
+
+The management device MUST fail the virtqueue status access if
+\field{device_id} is 0.
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
+When VIRTIO_F_TRNSPT_VQ_VDEV is negotiated,
+virtqueue size is accessed through the following command:
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_VQ_SIZE    10
+ #define VIRTIO_TRANSPTQ_CTRL_VQ_SIZE_SET       0
+ #define VIRTIO_TRANSPTQ_CTRL_VQ_SIZE_GET       1
+
+struct virtio_transportq_ctrl_vdev_vq_size_set {
+       u16 queue_index;
+       u16 size;
+};
+\end{lstlisting}
+
+The VIRTIO_TRANSPTQ_CTRL_VQ_SIZE_SET command is used to set the virtqueue
+size. The command-out-data is the queue index and the size of the
+virtqueue (as described in struct
+virtio_transportq_ctrl_vdev_vq_size_set). There's no command-in-data.
+
+The VIRTIO_TRANSPTQ_CTRL_VQ_SIZE_GET command is used to get the virtqueue
+size. On reset, the maximum queue size supported by the device is
+returned. The command-out-data is an u16 of the virtqueue index. The
+command-in-data is an u16 of queue size for the virtqueue.
+
+\devicenormative{\subsubsection}{Virtqueue Status}{Virtio Transport Option=
s / Virtio
+Over Transport Virtqueue / Virtqueue Size}
+
+The management device MUST fail the virtqueue size access if
+\field{device_id} is 0.
+
+\subsection{Virtqueue Notification}\label{sec:Virtio Transport Options / V=
irtio
+Over Transport Virtqueue / Virtqueue Notification}
+
+When VIRTIO_F_TRNSPT_VQ_VDEV is negotiated,
+the virtqueue notification is done through the following commands:
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_VQ_NOTIFY    11
+ #define VIRTIO_TRANSPTQ_CTRL_VQ_NOTIFY_GET          1
+
+struct virtio_transportq_ctrl_vdev_vq_notification_area {
+       le64 addr
+       le64 size;
+};
+\end{lstlisting}
+
+The VIRTIO_TRANSPTQ_CTRL_VQ_NOTIFY_GET is used to get the transport
+specific address area that can be used to notify a virtqueue. The
+command-out-data is an u16 of the virtqueue index. The command-in-data
+contains the address and the size of the notification area (as
+described in struct virtio_transportq_ctrl_vdev_vq_notification_area).
+
+\devicenormative{\subsubsection}{Virtqueue Notification}{Virtio Transport =
Options /
+Virtio Over Transport Virtqueue / Virtqueue Notification}
+
+The management device MUST fail the VIRTIO_TRANSPTQ_CTRL_VQ_NOTIFY_GET com=
mand
+if there's no transport specific notification address for a virtqueue of
+its virtual device.
+
+The management device MUST fail the virtqueue notification access if
+\field{device_id} is 0.
+
+The management device MUST forbid the notification area of a specific
+virtual device to be accessed from another virtual device.
+
+\drivernormative{\subsubsection}{Virtqueue Notification}{Virtio Transport =
Options /
+Virtio Over Transport Virtqueue / Virtqueue Notification}
+
+The driver MAY choose to notify the virtqueue by writing the queue
+index at address \field{addr} which is fetched from the
+VIRTIO_TRANSPTQ_CTRL_VQ_NOTIFY_GET command.
+
+\subsection{Virtqueue Index}\label{sec:Virtio Transport Options / Virtio
+Over Transport Virtqueue / Virtqueue Index}
+
+When VIRTIO_F_TRNSPT_VQ_VDEV is negotiated,
+the virtqueue available index is accessed through the following commands:
+
+\begin{lstlisting}
+#define VIRTIO_TRANSPTQ_CTRL_VQ_AVAIL_INDEX    12
+ #define VIRTIO_TRANSPTQ_CTRL_VQ_AVAIL_INDEX_SET       0
+ #define VIRTIO_TRANSPTQ_CTRL_VQ_ AVAIL_INDEX_GET       1
+
+struct virtio_transportq_ctrl_vdev_vq_avail_idx_set {
+        u16 queue_index;
+        u16 avail_idx;
+};
+\end{lstlisting}
+
+The VIRTIO_TRANSPTQ_CTRL_VQ_AVAIL_INDEX_SET commmand is used to set the av=
ailable index of a specific virtqueue.
+The command-out-data is the virtqueue index and the available index (as de=
scribed in struct virtio_transportq_ctrl_vdev_vq_avail_idx).
+There is no command-in-data.
+
+The VIRTIO_TRANSPTQ_CTRL_VQ_ AVAIL_INDEX_GET command is used to get the av=
ailable index of a specific virtqueue.
+The command-out-data is the queue index, the command-in-data is the availa=
ble index of the queue.
+
+\devicenormative{\subsubsection}{Virtqueue Index}{Virtio Transport Options=
 /
+Virtio Over Transport Virtqueue / Virtqueue Index}
+
+The management device MUST fail the virtqueue index access if \field{devic=
e_id} is 0
+The management device MUST fail the virtqueue index access if \field{queue=
_id} is invalid.
+
+\subsection{Presenting Virtual Devices}\label{sec:Virtio Transport Options=
 /
+Virtio Over Transport Virtqueue / Presenting Virtual Device}
+
+If VIRTIO_TRANSPTQ_F_VDEV is offered by a management device. The presentin=
g of
+the virtual devices requires co-operation between the management
+driver and the transport virtqueue. This means, from the view of the
+virtual device driver, the transport is done via the communication
+with the management device driver. It's up to the software to decide
+what kind of method that is needed be used for those communications.
+
+The management driver typically takes the following steps for creating a
+virtual device:
+
+\begin{enumerate}
+\item Determine the virtio id and device specific configuration.
+\item Create the virtual devices using the virtio_transportq_ctrl_vdev_CRE=
ATE command.
+\item Optionally, configure the MSI.
+\item Perform device specific setup.
+\item Let the virtual device to be probed by the virtual device
+driver. The management driver will then use the transport virtqueue to
+implement the requests of basic facility from the virtual device
+driver.
+\end{enumerate}
=20
 \chapter{Device Types}\label{sec:Device Types}
=20
@@ -2911,12 +3524,14 @@ \subsection{Virtqueues}\label{sec:Device Types / Ne=
twork Device / Virtqueues}
 \item[2(N-1)] receiveqN
 \item[2(N-1)+1] transmitqN
 \item[2N] controlq
+\item[2N+1] transportq
 \end{description}
=20
  N=3D1 if neither VIRTIO_NET_F_MQ nor VIRTIO_NET_F_RSS are negotiated, oth=
erwise N is set by
  \field{max_virtqueue_pairs}.
=20
- controlq only exists if VIRTIO_NET_F_CTRL_VQ set.
+ controlq only exists if VIRTIO_NET_F_CTRL_VQ set.\\
+ transportq only exists if VIRTIO_F_TRNSPT_VQ is offered.
=20
 \subsection{Feature bits}\label{sec:Device Types / Network Device / Featur=
e bits}
=20
@@ -4399,10 +5014,12 @@ \subsection{Virtqueues}\label{sec:Device Types / Bl=
ock Device / Virtqueues}
 \item[0] requestq1
 \item[\ldots]
 \item[N-1] requestqN
+\item[N] transportq
 \end{description}
=20
  N=3D1 if VIRTIO_BLK_F_MQ is not negotiated, otherwise N is set by
- \field{num_queues}.
+ \field{num_queues}.\\
+ transportq only exists if VIRTIO_F_TRNSPT_VQ is offered.
=20
 \subsection{Feature bits}\label{sec:Device Types / Block Device / Feature =
bits}
=20
diff --git a/introduction.tex b/introduction.tex
index 6d52717..de3839b 100644
--- a/introduction.tex
+++ b/introduction.tex
@@ -79,6 +79,9 @@ \section{Normative References}\label{sec:Normative Refere=
nces}
 =09\phantomsection\label{intro:SCMI}\textbf{[SCMI]} &
 =09Arm System Control and Management Interface, DEN0056,
 =09\newline\url{https://developer.arm.com/docs/den0056/c}, version C and a=
ny future revisions\\
+=09\phantomsection\label{intro:SIOV}\textbf{[SIOV]} &
+=09Scalable I/O Virtualization,
+=09\newline\url{https://www.opencompute.org/documents/ocp-scalable-io-virt=
ualization-technical-specification-revision-1-v1-2-pdf}\\
=20
 \end{longtable}
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

