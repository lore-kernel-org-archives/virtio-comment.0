Return-Path: <lingshan.zhu@intel.com>
From: Zhu Lingshan <lingshan.zhu@intel.com>
Subject: [PATCH V4 1/4] Introduce virito transport virtqueue
Date: Fri, 26 Aug 2022 18:00:30 +0800
Message-Id: <20220826100034.200432-2-lingshan.zhu@intel.com>
In-Reply-To: <20220826100034.200432-1-lingshan.zhu@intel.com>
References: <20220826100034.200432-1-lingshan.zhu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
To: mst@redhat.com, cohuck@redhat.com, sgarzare@redhat.com, stefanha@redhat.com, nrupal.jani@intel.com, Piotr.Uminski@intel.com, hang.yuan@intel.com
Cc: virtio-comment@lists.oasis-open.org, Zhu Lingshan <lingshan.zhu@intel.com>, Jason Wang <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

This commit introduces transport virtqueue as a new transport
layer for virtio devices. And the format of the commands
through the transport virtqueue is defined as well.

We also give examples for the management devices and the
managed devices.

Signed-off-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
---
 content.tex      | 113 +++++++++++++++++++++++++++++++++++++++++++++++
 introduction.tex |   3 ++
 2 files changed, 116 insertions(+)

diff --git a/content.tex b/content.tex
index e863709..0f2dee4 100644
--- a/content.tex
+++ b/content.tex
@@ -2895,6 +2895,119 @@ \subsubsection{Resetting Devices}\label{sec:Virtio Transport Options / Virtio ov
 MAY also choose to verify reset completion by reading \field{device status} via
 CCW_CMD_READ_STATUS and checking whether it is 0 afterwards.
 
+\section{Virtio Over Transport Virtqueue}\label{sec:Virtio Transport Options Virtio Over Transport Virtqueue}
+
+In some cases, it is challenging to implement a virtio device in a transport specific method.
+
+One example is that a physical device may try to present multiple virtio (maybe virtual) devices
+with limited transport specific resources.
+
+Another example is to implement transport-independent virtio devices.
+In those cases, a transport virtqueue could be used as the transport layer to
+implement virtio managed device.
+
+\subsection{Basic Concepts}\label{sec:Virtio Transport Options / Virtio over Transport Virtqueue / Basic Concepts}
+
+Feature bit VIRTIO_F_TRANSPT_VQ indicates that a device offers a transport virtqueue.
+
+\subsubsection{The Management Device}\label{sec:Virtio Transport Options / Virtio over Transport Virtqueue / Basic Concepts / The Management Device}
+
+A device that offers feature bit VIRTIO_F_TRANSPT_VQ and a transport virtqueue is a management device.
+
+For example, a PCIe device with a transport virtqueue and offers VIRTIO_F_TRANSPT_VQ is a management device.
+
+A set of management commands with a format defined in section \ref{sec:Virtio Transport Options / Virtio over Transport Virtqueue / Format of Commands through Transport Virtqueue}
+is processed over the transport virtqueue.
+
+\devicenormative{\subsubsection}{The Management Device}{Virtio Transport Options / Virtio Over Transport Virtqueue / Basic Concepts / The management Device}
+
+The management device MUST offer feature bit VIRTIO_F_TRANSPT_VQ and a transport virtqueue.
+
+\subsubsection{The Managed Device}\label{sec:Virtio Transport Options / Virtio over Transport Virtqueue / Basic Concepts / The Managed Device}
+
+A managed device is a kind of device that is created, destroyed and configured through a transport virtqueue,
+it utilizes the transport virtqueue as its transport layer.
+
+Virtio can use the transport virtqueue to implement managed devices
+
+An example of managed devices is a Scalable I/O Virtualization \hyperref[intro:SIOV]{[SIOV]} VDEV which is created and managed
+through a transport virtqueue of a management device.
+
+A managed device and its management device work in a sub-device and parent-device topology.
+
+\devicenormative{\subsubsection}{The Managed Device}{Virtio Transport Options / Virtio Over Transport Virtqueue / Basic Concepts / The Managed Device}
+
+A managed device should be isolated from other managed devices on DMA and interrupts. An example for this isolation is a PCIe VF isolates from other VFs.
+
+\subsubsection{Managed Devices Dscovery}\label{sec:Virtio Transport Options /Virtio Over Transport Virtqueue / Managed Devices Discovery}
+
+Managed devices are created, discovered and configured through a transport virtqueue.
+
+\subsubsection{Managed Devices Interrupts}\label{sec:Virtio Transport Options /Virtio Over Transport Virtqueue / Managed Devices Interrupts}
+
+The managed devices utilize MSI (Message Signaled Interrupts) to send interrupts, MSI based interrupts are enabled by default,
+there are no legacy interrupts.
+
+\begin{lstlisting}
+struct virtio_msi_vector {
+       u64 address;
+       u32 data;
+       u8 mask:1;
+       u8 pending:1;
+};
+
+struct virtio_msi_table {
+       u32 num_msi;
+       struct virtio_msi_vector table[num_msi];
+};
+\end{lstlisting}
+
+As described in struct virtio_msi_vector, an MSI vector is composed of:
+\begin{itemize*}
+\item \field{address}: the 64bit address, when sending an MSI interrupt, \field{data} should be sent to \field{address} by a memory write operation.
+\item \field{data}: the 32bit data payload.
+\item \field{mask}: indicating whether this MSI is masked, 0 (unmasked) by default.
+\item \field{pending}: indicating whether this MSI has pending interrupts to send, 0 (no pending interrupts) by default.
+\end{itemize*}
+
+A managed device makes use of an MSI entries table to store MSI vectors,
+each MSI entry in the table contains an MSI vector, as described in struct virtio_msi_table.
+
+\devicenormative{\subsubsection}{The Managed Device}{sec:Virtio Transport Options /Virtio Over Transport Virtqueue / The Managed Device}
+
+The managed device MUST not share its MSI entries with another manged device or with the management device.
+
+\subsection{Format of Commands through Transport Virtqueue}\label{sec:Virtio Transport Options / Virtio over Transport Virtqueue / Format of Commands through Transport Virtqueue}
+
+All transport virtqueue commands are of the following form:
+
+\begin{lstlisting}
+struct virtio_transportq_ctrl {
+        u64 device_id;
+        u16 class;
+        u16 command;
+        u8 command-out-data[];
+        u32 ack;
+        u8 command-in-data[];
+};
+
+/* ack values */
+#define VIRTIO_TRANSPTQ_OK     0
+#define VIRTIO_TRANSPTQ_ERR    1
+\end{lstlisting}
+
+The \field{device_id}, \field{class}, \field{command} and
+\field{command-out-data} are set by the management device driver,
+and the management device sets \field{ack} and \field{command-in-data}.
+
+\field{device_id} with a positive value is used to identify a virtio managed device.
+The management device allocates this \field{device_id},
+and it should be unique in the management device context.
+
+The \field{device_id} value 0 is used to identify the management device itself.
+
+\field{class} is an identifier of a set of commands with similar  purposes.
+
 \chapter{Device Types}\label{sec:Device Types}
 
 On top of the queues, config space and feature negotiation facilities
diff --git a/introduction.tex b/introduction.tex
index a9491cf..94a1b51 100644
--- a/introduction.tex
+++ b/introduction.tex
@@ -80,6 +80,9 @@ \section{Normative References}\label{sec:Normative References}
 	\phantomsection\label{intro:SCMI}\textbf{[SCMI]} &
 	Arm System Control and Management Interface, DEN0056,
 	\newline\url{https://developer.arm.com/docs/den0056/c}, version C and any future revisions\\
+	\phantomsection\label{intro:SIOV}\textbf{[SIOV]} &
+	Scalable I/O Virtualization,
+	\newline\url{https://www.opencompute.org/documents/ocp-scalable-io-virtualization-technical-specification-revision-1-v1-2-pdf}\\
 
 \end{longtable}
 
-- 
2.35.3

