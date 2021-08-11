Return-Path: <mgurtovoy@nvidia.com>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
Subject: [RFC PATCH v3 1/4] Add virtio Admin Virtqueue specification
Date: Wed, 11 Aug 2021 14:43:06 +0300
Message-ID: <20210811114309.7941-2-mgurtovoy@nvidia.com>
In-Reply-To: <20210811114309.7941-1-mgurtovoy@nvidia.com>
References: <20210811114309.7941-1-mgurtovoy@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: virtio-comment@lists.oasis-open.org, jasowang@redhat.com, mst@redhat.com, cohuck@redhat.com
Cc: parav@nvidia.com, shahafs@nvidia.com, aadam@redhat.com, bodong@nvidia.com, amikheev@nvidia.com, nitzanc@nvidia.com, jgg@nvidia.com, stefanha@redhat.com, eperezma@redhat.com, oren@nvidia.com, Max Gurtovoy <mgurtovoy@nvidia.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Admin virtqueues will be used to send administrative commands to
manipulate various features of the device which would not easily map
into the configuration space.

The same Admin command format will be used for all virtio devices. The
Admin command set will include 3 types of command classes:
1. The generic common class
2. The transport specific class
3. The device specific class

The above mechanism will enable adding various features to the virtio
specification, e.g.:
1. Format virtio-blk devices in various configurations (512B block size,
   512B + 8B T10-DIF, 4K block size, 4k + 8B T10-DIF, etc..).
2. Live migration management.
3. Encrypt/Decrypt data.
4. Virtualization management.
5. Get device error logs.
6. Implement advanced device/transport specific features.
7. Run device health test.
8. More.

As virtio evolves beyond the para-virt/sw-emulated world, it's mandatory
for the specification to become flexible and allow a wider feature set.
The corrent ctrl virtq that is defined for some of the virtio devices is
device specific and wasn't designed to be a generic virtq for
admininistration.

Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
---
 admin-virtq.tex | 300 ++++++++++++++++++++++++++++++++++++++++++++++++
 content.tex     |   8 +-
 2 files changed, 306 insertions(+), 2 deletions(-)
 create mode 100644 admin-virtq.tex

diff --git a/admin-virtq.tex b/admin-virtq.tex
new file mode 100644
index 0000000..d2b8ac0
--- /dev/null
+++ b/admin-virtq.tex
@@ -0,0 +1,300 @@
+\section{Admin Virtqueues}\label{sec:Basic Facilities of a Virtio Device / Admin Virtqueues}
+
+Admin virtqueues are used to send administrative commands to manipulate
+various features of the device which would not easily map into the
+configuration space.
+
+Use of Admin virtqueues is negotiated by the VIRTIO_F_ADMIN_VQ
+feature bit.
+
+Admin virtqueue index may vary among different device types.
+
+All commands are of the following form:
+
+\begin{lstlisting}
+struct virtio_admin_cmd {
+        /* Device-readable part */
+        u8 class;
+        u8 command;
+        u8 command-specific-data[];
+
+        /* Device-writable part */
+        u8 command-specific-result[];
+        u8 status;
+};
+
+/* status values that are transport, device and vendor independent */
+#define VIRTIO_ADMIN_STATUS_COMMON_START     0
+#define VIRTIO_ADMIN_STATUS_COMMON_END       63
+
+/* status values that are transport specific */
+#define VIRTIO_ADMIN_STATUS_TRANSPORT_START  64
+#define VIRTIO_ADMIN_STATUS_TRANSPORT_END    127
+
+/* status values that are device specific */
+#define VIRTIO_ADMIN_STATUS_DEVICE_START     128
+#define VIRTIO_ADMIN_STATUS_DEVICE_END       191
+
+/* status values that are reserved */
+#define VIRTIO_ADMIN_STATUS_RESERVED_START     192
+#define VIRTIO_ADMIN_STATUS_RESERVED_END       255
+
+/* Common status values */
+#define VIRTIO_ADMIN_STATUS_COMMON_OK                      0
+#define VIRTIO_ADMIN_STATUS_COMMON_ERR                     1
+#define VIRTIO_ADMIN_STATUS_COMMON_INVALID_CLASS           2
+#define VIRTIO_ADMIN_STATUS_COMMON_INVALID_COMMAND         3
+#define VIRTIO_ADMIN_STATUS_COMMON_DATA_TRANSFER_ERR       4
+#define VIRTIO_ADMIN_STATUS_COMMON_DEVICE_INTERNAL_ERR     5
+\end{lstlisting}
+
+The \field{class}, \field{command} and \field{command-specific-data} are
+set by the driver, and the device sets the \field{status} and the
+\field{command-specific-result}, if needed.
+
+The virtio Admin command class codes are divided in the following form:
+
+\begin{lstlisting}
+/* class values that are transport, device and vendor independent */
+#define VIRTIO_ADMIN_COMMON_CLASS_START    0
+#define VIRTIO_ADMIN_COMMON_CLASS_END      63
+
+/* class values that are transport specific */
+#define VIRTIO_ADMIN_TRANSPORT_CLASS_START  64
+#define VIRTIO_ADMIN_TRANSPORT_CLASS_END    127
+
+/* class values that are device specific */
+#define VIRTIO_ADMIN_DEVICE_CLASS_START     128
+#define VIRTIO_ADMIN_DEVICE_CLASS_END       191
+
+/* class values that are reserved */
+#define VIRTIO_ADMIN_RESERVED_CLASS_START     192
+#define VIRTIO_ADMIN_RESERVED_CLASS_END       255
+\end{lstlisting}
+
+\subsection{Admin command set}\label{sec:Basic Facilities of a Virtio Device / Admin Virtqueues / Admin command set}
+
+Each virtio device that advertises the VIRTIO_F_ADMIN_VQ feature, MUST
+support all the mandatory admin commands. A device MAY support also
+one or more optional admin commands.
+
+\subsubsection{Common command set}\label{sec:Basic Facilities of a Virtio Device / Admin Virtqueues / Admin command set / Common command set}
+
+The Common command set is a group of classes and commands within each
+of these classes which are transport, device and vendor independent.
+A mandatory class is a class that has at least one mandatory command.
+The Common command set is summarized in following table:
+
+\begin{tabular}{|l|l|l|}
+\hline
+Class  & Description    & M/O \\
+\hline \hline
+0  & VIRTIO_ADMIN_DISCOVER_DEVICE    & M \\
+\hline
+1  & VIRTIO_ADMIN_CTRL_FEATURES      & M \\
+\hline
+2-63  & reserved    & - \\
+\hline
+\end{tabular}
+
+\paragraph{Discover device class}\label{sec:Basic Facilities of a Virtio Device / Admin Virtqueues / Admin command set / Common command set / Discover device class}
+
+This class (opcode: 0) of commands is used to query generic device
+information. The following table describes the commands supported for
+this class:
+
+\begin{tabular}{|l|l|l|}
+\hline
+Command  & Description    & M/O \\
+\hline \hline
+0  & VIRTIO_ADMIN_DISCOVER_DEVICE_IDENTITY    & M \\
+\hline
+1-255  & reserved    & - \\
+\hline
+\end{tabular}
+
+\subparagraph{Device identity command}\label{sec:Basic Facilities of a Virtio Device / Admin Virtqueues / Admin command set / Common command set / Discover device class / Device identity command}
+
+This mandatory command should return device identity in the following
+structure:
+
+\begin{tabular}{|l|l|l|l|}
+\hline
+Bytes  & Name    & Description    & M/O \\
+\hline \hline
+03:00 & VIRTIO DEVICE ID & The device type identification according to the specification  & M \\
+\hline
+07:04 & VIRTIO VDEV ID & The virtual device identification & M \\
+\hline
+09:08 & VIRTIO TRANSPORT ID & The transport type identification (0 - PCI, 1 - MMIO, 2 - CHANNEL_IO) & M \\
+\hline
+137:10 & VIRTIO SERIAL ID & A unique identifier as an ASCII string assigned by the vendor & M \\
+\hline
+265:138 & VIRTIO MODEL ID & A model identifier as an ASCII string assigned by the vendor & M \\
+\hline
+4095:266 & reserved    & - & - \\
+ \hline
+\end{tabular}
+
+\paragraph{Ctrl features class}\label{sec:Basic Facilities of a Virtio Device / Admin Virtqueues / Admin command set / Common command set / Ctrl features class}
+
+This class (opcode: 1) of commands is used to negotiate admin queue
+features. The following table describes the commands supported for
+this class:
+
+\begin{tabular}{|l|l|l|}
+\hline
+Command  & Description    & M/O \\
+\hline \hline
+0  & VIRTIO_ADMIN_CTRL_FEATURES_DEVICE_GET    & M \\
+\hline
+1  & VIRTIO_ADMIN_CTRL_FEATURES_DRIVER_SET    & M \\
+\hline
+2  & VIRTIO_ADMIN_CTRL_FEATURES_DRIVER_GET    & M \\
+\hline
+3-255  & reserved    & - \\
+\hline
+\end{tabular}
+
+\subparagraph{Ctrl features device get command}\label{sec:Basic Facilities of a Virtio Device / Admin Virtqueues / Admin command set / Common command set / Ctrl features class / Ctrl features device get command}
+
+This mandatory command should return the admin features offered
+by the device in the following structure:
+
+\begin{tabular}{|l|l|l|}
+\hline
+Bytes  & Description    & M/O \\
+\hline \hline
+31:00  & VIRTIO_ADMIN_CLASS_0_COMMANDS_SUPPORTED_BITMAP    & M \\
+\hline
+63:32  & VIRTIO_ADMIN_CLASS_1_COMMANDS_SUPPORTED_BITMAP    & M \\
+ \hline
+95:64  & VIRTIO_ADMIN_CLASS_2_COMMANDS_SUPPORTED_BITMAP    & M \\
+\hline
+...  & ...    & M \\
+\hline
+8191:8160  & VIRTIO_ADMIN_CLASS_255_COMMANDS_SUPPORTED_BITMAP    & M \\
+\hline
+\end{tabular}
+
+The above structure is divided to 256 sections of 32B each, that will
+describe whether a device supports a certain command in a class code. A
+class is supported if one of its command is supported. Each of the 32B
+sections will follow the following data structure:
+
+\begin{tabular}{|l|l|l|}
+\hline
+Bits  & Description    & M/O \\
+\hline \hline
+0  & COMMAND_0_SUPPORTED (1: yes, 0:no)    & M \\
+\hline
+1  & COMMAND_1_SUPPORTED (1: yes, 0:no)    & M \\
+\hline
+2  & COMMAND_2_SUPPORTED (1: yes, 0:no)    & M \\
+\hline
+...  & ...    & M \\
+\hline
+254  & COMMAND_254_SUPPORTED (1: yes, 0:no)    & M \\
+ \hline
+255  & COMMAND_255_SUPPORTED (1: yes, 0:no)    & M \\
+\hline
+\end{tabular}
+
+\subparagraph{Ctrl features driver set command}\label{sec:Basic Facilities of a Virtio Device / Admin Virtqueues / Admin command set / Common command set / Ctrl features class / Ctrl features driver set command}
+
+This mandatory command should provide the admin features accepted
+by the driver in the following structure:
+
+\begin{tabular}{|l|l|l|}
+\hline
+Bytes  & Description    & M/O \\
+\hline \hline
+31:00  & VIRTIO_ADMIN_CLASS_0_COMMANDS_ACCEPTED_BITMAP    & M \\
+\hline
+63:32  & VIRTIO_ADMIN_CLASS_1_COMMANDS_ACCEPTED_BITMAP    & M \\
+ \hline
+95:64  & VIRTIO_ADMIN_CLASS_2_COMMANDS_ACCEPTED_BITMAP    & M \\
+\hline
+...  & ...    & M \\
+\hline
+8191:8160  & VIRTIO_ADMIN_CLASS_255_COMMANDS_ACCEPTED_BITMAP    & M \\
+\hline
+\end{tabular}
+
+The above structure is divided to 256 sections of 32B each, that will
+describe whether a driver accepts a certain command in a class code.
+Each of the 32B sections will follow the following data structure:
+
+\begin{tabular}{|l|l|l|}
+\hline
+Bits  & Description    & M/O \\
+\hline \hline
+0  & COMMAND_0_ACCEPTED (1: yes, 0:no)    & M \\
+\hline
+1  & COMMAND_1_ACCEPTED (1: yes, 0:no)    & M \\
+\hline
+2  & COMMAND_2_ACCEPTED (1: yes, 0:no)    & M \\
+\hline
+...  & ...    & M \\
+\hline
+254  & COMMAND_254_ACCEPTED (1: yes, 0:no)    & M \\
+ \hline
+255  & COMMAND_255_ACCEPTED (1: yes, 0:no)    & M \\
+\hline
+\end{tabular}
+
+\subparagraph{Ctrl features driver get command}\label{sec:Basic Facilities of a Virtio Device / Admin Virtqueues / Admin command set / Common command set / Ctrl features class / Ctrl features driver set command}
+
+This mandatory command should return the admin features accepted
+by both the device and the driver in the following structure:
+
+\begin{tabular}{|l|l|l|}
+\hline
+Bytes  & Description    & M/O \\
+\hline \hline
+31:00  & VIRTIO_ADMIN_CLASS_0_COMMANDS_NEGOTIATED_BITMAP    & M \\
+\hline
+63:32  & VIRTIO_ADMIN_CLASS_1_COMMANDS_NEGOTIATED_BITMAP    & M \\
+ \hline
+95:64  & VIRTIO_ADMIN_CLASS_2_COMMANDS_NEGOTIATED_BITMAP    & M \\
+\hline
+...  & ...    & M \\
+\hline
+8191:8160  & VIRTIO_ADMIN_CLASS_255_COMMANDS_NEGOTIATED_BITMAP    & M \\
+\hline
+\end{tabular}
+
+The above structure is divided to 256 sections of 32B each, that will
+describe whether the device and the driver accepted a certain command
+in a class code. Each of the 32B sections will follow the following data structure:
+
+\begin{tabular}{|l|l|l|}
+\hline
+Bits  & Description    & M/O \\
+\hline \hline
+0  & COMMAND_0_NEGOTIATED (1: yes, 0:no)    & M \\
+\hline
+1  & COMMAND_1_NEGOTIATED (1: yes, 0:no)    & M \\
+\hline
+2  & COMMAND_2_NEGOTIATED (1: yes, 0:no)    & M \\
+\hline
+...  & ...    & M \\
+\hline
+254  & COMMAND_254_NEGOTIATED (1: yes, 0:no)    & M \\
+ \hline
+255  & COMMAND_255_NEGOTIATED (1: yes, 0:no)    & M \\
+\hline
+\end{tabular}
+
+\subsubsection{Transport command set}\label{sec:Basic Facilities of a Virtio Device / Admin Virtqueues / Admin command set / Transport command set}
+
+The Transport command set is a group of classes and commands within
+each of these classes which are transport specific. Refer to each
+transport section for more information on the supported commands.
+
+\subsubsection{Device command set}\label{sec:Basic Facilities of a Virtio Device / Admin Virtqueues / Admin command set / Device command set}
+
+The Device command set is a group of classes and commands within
+each of these classes which are device specific. Refer to each
+device section for more information on the supported commands.
+
diff --git a/content.tex b/content.tex
index e1f05bc..72f2802 100644
--- a/content.tex
+++ b/content.tex
@@ -99,10 +99,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
 \begin{description}
 \item[0 to 23] Feature bits for the specific device type
 
-\item[24 to 39] Feature bits reserved for extensions to the queue and
+\item[24 to 40] Feature bits reserved for extensions to the queue and
   feature negotiation mechanisms
 
-\item[40 and above] Feature bits reserved for future extensions.
+\item[41 and above] Feature bits reserved for future extensions.
 \end{description}
 
 \begin{note}
@@ -407,6 +407,8 @@ \section{Exporting Objects}\label{sec:Basic Facilities of a Virtio Device / Expo
 types. It is RECOMMENDED that devices generate version 4
 UUIDs as specified by \hyperref[intro:rfc4122]{[RFC4122]}.
 
+\input{admin-virtq.tex}
+
 \chapter{General Initialization And Device Operation}\label{sec:General Initialization And Device Operation}
 
 We start with an overview of device initialization, then expand on the
@@ -6671,6 +6673,8 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
   data to be provided in driver notification and the delivery method is
   transport specific.
   For more details about driver notifications over PCI see \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation / Available Buffer Notifications}.
+  \item[VIRTIO_F_ADMIN_VQ(40)] This feature indicates that
+  the device supports administration virtqueue negotiation.
 
 \end{description}
 
-- 
2.21.0

