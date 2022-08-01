Return-Path: <lingshan.zhu@intel.com>
From: Zhu Lingshan <lingshan.zhu@intel.com>
Subject: [PATCH V2 1/5] Introduce virito transport virtqueue
Date: Mon,  1 Aug 2022 17:32:12 +0800
Message-Id: <20220801093216.362119-2-lingshan.zhu@intel.com>
In-Reply-To: <20220801093216.362119-1-lingshan.zhu@intel.com>
References: <20220801093216.362119-1-lingshan.zhu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
To: jasowang@redhat.com, mst@redhat.com, cohuck@redhat.com, sgarzare@redhat.com, stefanha@redhat.com, nrupal.jani@intel.com, Piotr.Uminski@intel.com
Cc: virtio-comment@lists.oasis-open.org, Zhu Lingshan <lingshan.zhu@intel.com>
List-ID: <virtio-comment.lists.oasis-open.org>

This commit introduces transport virtqueue as a new transport
layer for virtio devices. And the format of the commands
through the transport virtqueue is defined as well.

We also give examples for the management devices and the
managed devices.

Signed-off-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
---
 content.tex      | 73 ++++++++++++++++++++++++++++++++++++++++++++++++
 introduction.tex |  3 ++
 2 files changed, 76 insertions(+)

diff --git a/content.tex b/content.tex
index e863709..969ca46 100644
--- a/content.tex
+++ b/content.tex
@@ -2895,6 +2895,79 @@ \subsubsection{Resetting Devices}\label{sec:Virtio Transport Options / Virtio ov
 MAY also choose to verify reset completion by reading \field{device status} via
 CCW_CMD_READ_STATUS and checking whether it is 0 afterwards.
 
+\section{Virtio Over Transport Virtqueue}\label{sec:Virtio Transport Options Virtio Over Transport Virtqueue}
+
+In some cases, it is challenging to implement a virtio device in a transport specific method.
+
+One example is that a physical device may try to present multiple managed (usually virtual) devices
+with limited transport specific resources.
+
+Another example is to implement managed devices which are transport independent.
+
+In those cases, a transport virtqueue could be used as the transport layer to
+implement virtio managed device.
+
+Feature bit VIRTIO_F_TRANSPT_VQ indicates that a device offers a transport virtqueue.
+
+\subsection{Basic Concepts}\label{sec:Virtio Transport Options / Virtio over Transport Virtqueue / Basic Concepts}
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
+#define VIRTIO_TRANSPTQ_ERR    255
+\end{lstlisting}
+
+The \field{device_id}, \field{class}, \field{command} and
+\field{command-out-data} are set by the management driver,
+and the device sets \field{ack} and \field{command-in-data}.
+
+\field{device_id} is an UUID to identify a virtio managed device,
+The \field{device_id} value 0 is used for identify the management device itself
+
+\subsubsection{The Management Devices}\label{sec:Virtio Transport Options / Virtio over Transport Virtqueue / Basic Concepts / The Management Devices}
+
+A device that offers a transport virtqueue (via feature VIRTIO_F_TRANSPT_VQ)
+is a management device. It processes the commands through the transport virtqueue commands.
+
+For example, a PCIe PF with a transport virtqueue is a management device.
+
+\subsubsection{The Managed Devices}\label{sec:Virtio Transport Options / Virtio over Transport Virtqueue / Basic Concepts / The Managed Devices}
+
+A managed device is a kind of device that is created through a transport virtqueue,
+and utilizes the transport virtqueue as its transport layer.
+
+An example of managed devices is a Scalable I/O Virtualization \hyperref[intro:SIOV]{[SIOV]} device which is created and managed
+through a transport virtqueue of a management device.
+
+\devicenormative{\subsubsection}{Basic Concepts}{Virtio Transport Options / Virtio Over Transport Virtqueue / Basic Concepts}
+
+The management device MUST offer feature bit VIRTIO_F_TRANSPT_VQ and a transport virtqueue as a device specific virtqueue.
+
+The management device MUST fail all commands against the transport virtqueue if VIRTIO_F_TRANSPT_VQ is not negotiated.
+
+\drivernormative{\subsubsection}{Basic Concepts}{Virtio Transport Options / Virtio Over Transport Virtqueue / Basic Concepts}
+
+The management driver MUST not send any commands against the transport virtqueue if VIRTIO_F_TRANSPT_VQ is not negotiated.
+
+\subsection{Management Devices Dscovery}\label{sec:Virtio Transport Options /Virtio Over Transport Virtqueue / Management Devices Discovery}
+
+Management devices are discovered through their own transport and device-specific method.
+
+\subsection{Managed Devices Dscovery}\label{sec:Virtio Transport Options /Virtio Over Transport Virtqueue / Managed Devices Discovery}
+
+Managed devices are created and discovered through a transport virtqueue.
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

