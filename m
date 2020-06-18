Return-Path: virtio-comment-return-1322-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CE9DC985EDA
	for <virtio-comment@lists.oasis-open.org>; Thu, 18 Jun 2020 08:22:33 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
Date: Thu, 18 Jun 2020 10:21:50 +0200
Message-Id: <20200618082150.17476-4-david@redhat.com>
In-Reply-To: <20200618082150.17476-1-david@redhat.com>
References: <20200618082150.17476-1-david@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH v2 3/3] Add virtio-mem device specification
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>, teawater <teawaterz@linux.alibaba.com>
List-ID: <virtio-comment.lists.oasis-open.org>

The virtio memory device provides and manages a memory region in guest
physical address space. This memory region is partitioned into memory
blocks of fixed size that can either be in the state plugged or unplugged.

Specify the device configuration, initialization, and operation.
Introduce PLUG, UNPLUG, UNPLUG ALL and STATE requests.

Cc: teawater <teawaterz@linux.alibaba.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 conformance.tex |  38 +++-
 content.tex     |   1 +
 virtio-mem.tex  | 448 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 483 insertions(+), 4 deletions(-)
 create mode 100644 virtio-mem.tex

diff --git a/conformance.tex b/conformance.tex
index ea48d2d..0715da1 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -25,8 +25,9 @@ \section{Conformance Targets}\label{sec:Conformance / Con=
formance Targets}
 \ref{sec:Conformance / Driver Conformance / Input Driver Conformance},
 \ref{sec:Conformance / Driver Conformance / Crypto Driver Conformance},
 \ref{sec:Conformance / Driver Conformance / Socket Driver Conformance},
-\ref{sec:Conformance / Driver Conformance / RPMB Driver Conformance} or
-\ref{sec:Conformance / Driver Conformance / IOMMU Driver Conformance}.
+\ref{sec:Conformance / Driver Conformance / RPMB Driver Conformance},
+\ref{sec:Conformance / Driver Conformance / IOMMU Driver Conformance} or
+\ref{sec:Conformance / Driver Conformance / Memory Driver Conformance}.
     \item Clause \ref{sec:Conformance / Legacy Interface: Transitional Dev=
ice and Transitional Driver Conformance}.
   \end{itemize}
 \item[Device] A device MUST conform to four conformance clauses:
@@ -43,8 +44,9 @@ \section{Conformance Targets}\label{sec:Conformance / Con=
formance Targets}
 \ref{sec:Conformance / Device Conformance / Input Device Conformance},=20
 \ref{sec:Conformance / Device Conformance / Crypto Device Conformance},=20
 \ref{sec:Conformance / Device Conformance / Socket Device Conformance},=20
-\ref{sec:Conformance / Device Conformance / RPMB Device Conformance} or=20
-\ref{sec:Conformance / Device Conformance / IOMMU Device Conformance}.
+\ref{sec:Conformance / Device Conformance / RPMB Device Conformance},
+\ref{sec:Conformance / Device Conformance / IOMMU Device Conformance}, or
+\ref{sec:Conformance / Device Conformance / Memory Device Conformance}.
     \item Clause \ref{sec:Conformance / Legacy Interface: Transitional Dev=
ice and Transitional Driver Conformance}.
   \end{itemize}
 \end{description}
@@ -231,6 +233,20 @@ \section{Conformance Targets}\label{sec:Conformance / =
Conformance Targets}
 \item \ref{drivernormative:Device Types / IOMMU Device / Device operations=
 / Fault reporting}
 \end{itemize}
=20
+\conformance{\subsection}{Memory Driver Conformance}\label{sec:Conformance=
 / Driver Conformance / Memory Driver Conformance}
+
+A memory driver MUST conform to the following normative statements:
+
+\begin{itemize}
+\item \ref{drivernormative:Device Types / Memory Device / Device configura=
tion layout}
+\item \ref{drivernormative:Device Types / Memory Device / Device Initializ=
ation}
+\item \ref{drivernormative:Device Types / Memory Device / Device Operation=
}
+\item \ref{drivernormative:Device Types / Memory Device / Device Operation=
 / PLUG request}
+\item \ref{drivernormative:Device Types / Memory Device / Device Operation=
 / UNPLUG request}
+\item \ref{drivernormative:Device Types / Memory Device / Device Operation=
 / UNPLUG ALL request}
+\item \ref{drivernormative:Device Types / Memory Device / Device Operation=
 / STATE request}
+\end{itemize}
+
 \conformance{\section}{Device Conformance}\label{sec:Conformance / Device =
Conformance}
=20
 A device MUST conform to the following normative statements:
@@ -419,6 +435,20 @@ \section{Conformance Targets}\label{sec:Conformance / =
Conformance Targets}
 \item \ref{devicenormative:Device Types / IOMMU Device / Device operations=
 / Fault reporting}
 \end{itemize}
=20
+\conformance{\subsection}{Memory Device Conformance}\label{sec:Conformance=
 / Device Conformance / Memory Device Conformance}
+
+A memory device MUST conform to the following normative statements:
+
+\begin{itemize}
+\item \ref{devicenormative:Device Types / Memory Device / Device configura=
tion layout}
+\item \ref{devicenormative:Device Types / Memory Device / Device Initializ=
ation}
+\item \ref{devicenormative:Device Types / Memory Device / Device Operation=
}
+\item \ref{devicenormative:Device Types / Memory Device / Device Operation=
 / PLUG request}
+\item \ref{devicenormative:Device Types / Memory Device / Device Operation=
 / UNPLUG request}
+\item \ref{devicenormative:Device Types / Memory Device / Device Operation=
 / UNPLUG ALL request}
+\item \ref{devicenormative:Device Types / Memory Device / Device Operation=
 / STATE request}
+\end{itemize}
+
 \conformance{\section}{Legacy Interface: Transitional Device and Transitio=
nal Driver Conformance}\label{sec:Conformance / Legacy Interface: Transitio=
nal Device and Transitional Driver Conformance}
 A conformant implementation MUST be either transitional or
 non-transitional, see \ref{intro:Legacy
diff --git a/content.tex b/content.tex
index 91735e3..0a0f3a8 100644
--- a/content.tex
+++ b/content.tex
@@ -6062,6 +6062,7 @@ \subsubsection{Legacy Interface: Framing Requirements=
}\label{sec:Device
 \input{virtio-fs.tex}
 \input{virtio-rpmb.tex}
 \input{virtio-iommu.tex}
+\input{virtio-mem.tex}
=20
 \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
=20
diff --git a/virtio-mem.tex b/virtio-mem.tex
new file mode 100644
index 0000000..85cfb61
--- /dev/null
+++ b/virtio-mem.tex
@@ -0,0 +1,448 @@
+\section{Memory Device}\label{sec:Device Types / Memory Device}
+
+The virtio memory device provides and manages a memory region in guest
+physical address space.  This memory region is partitioned into memory
+blocks of fixed size that can either be in the state plugged or unplugged.
+Once plugged, a memory block can be used like ordinary RAM.  The driver
+selects memory blocks to (un)plug and requests the device to perform the
+(un)plug.
+
+The device requests the driver to plug a certain amount of memory, by
+setting the \field{requested_size} in the device configuration, which can
+change at runtime.  It is up to the device driver to fulfill this request
+by (un)plugging memory blocks.  Once the \field{plugged_size} is greater o=
r
+equal to the \field{requested_size}, requests to plug memory blocks will b=
e
+rejected by the device.
+
+The device-managed memory region is split into two parts, the usable regio=
n
+and the unusable region.  All memory blocks in the unusable region are
+unplugged and requests to plug them will be rejected.  The device will gro=
w
+the usable region to fit the \field{requested_size}.  Usually, the usable
+region is bigger than the \field{requested_size} of the device, to give th=
e
+driver some flexibility when selecting memory blocks to plug.
+
+On initial start, and after a system reset, all memory blocks are
+unplugged.  In corner cases, memory blocks might still be plugged after a
+system reset, and the driver usually requests to unplug all memory while
+initializing, before starting to select memory blocks to plug.
+
+The device-managed memory region is not exposed as RAM via other firmware
+/ hw interfaces (e.g., e820 on x86).  The driver is responsible for
+deciding how plugged memory blocks will be used.  A common use case is to
+expose plugged memory blocks to the operating system as system RAM,
+available for the page allocator.
+
+\subsection{Device ID}\label{sec:Device Types / Memory Device / Device ID}
+24
+
+\subsection{Virtqueues}\label{sec:Device Types / Memory Device / Virtqueue=
s}
+
+\begin{description}
+\item[0] guest-request
+\end{description}
+
+\subsection{Feature bits}\label{sec:Device Types / Memory Device / Feature=
 bits}
+
+\begin{description}
+\item[VIRTIO_MEM_F_ACPI_PXM (0)] The field \field{node_id} in the device
+configuration is valid and corresponds to an ACPI PXM.
+\end{description}
+
+\subsection{Device configuration layout}\label{sec:Device Types / Memory D=
evice / Device configuration layout}
+
+All fields of this configuration are always available and read-only for th=
e
+driver.
+
+\begin{lstlisting}
+struct virtio_mem_config {
+  le64 block_size;
+  le16 node_id;
+  le8 padding[6];
+  le64 addr;
+  le64 region_size;
+  le64 usable_region_size;
+  le64 plugged_size;
+  le64 requested_size;
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{block_size}] is the size and the alignment in bytes of a
+memory block.  Cannot change.
+\item[\field{node_id}] has no meaning without VIRTIO_MEM_F_ACPI_PXM.  With
+VIRTIO_MEM_F_ACPI_PXM, this field is valid and corresponds to an ACPI PXM.
+Cannot change.
+\item[\field{padding}] has no meaning and is reserved for future use.
+\item[\field{addr}] is the guest physical address of the start of the
+device-managed memory region in bytes.  Cannot change.
+\item[\field{region_size}] is the size of device-managed memory region in
+bytes.  Cannot change.
+\item[\field{usable_region_size}] is the size of the usable device-managed
+memory region.  Can grow up to \field{region_size}.  Can only shrink due t=
o
+VIRTIO_MEM_REQ_UNPLUG_ALL requests.
+\item[\field{plugged_size}] is the amount of plugged memory in bytes withi=
n
+the usable device-managed memory region.
+\item[\field{requested_size}] is the requested amount of plugged memory
+within the usable device-managed memory region.
+\end{description}
+
+\drivernormative{\subsubsection}{Device configuration layout}{Device Types=
 / Memory Device / Device configuration layout}
+
+The driver MUST NOT write to device configuration fields.
+
+The driver MUST ignore the value of \field{padding}.
+
+The driver MUST ignore the value of \field{node_id} without
+VIRTIO_MEM_F_ACPI_PXM.
+
+\devicenormative{\subsubsection}{Device configuration layout}{Device Types=
 / Memory Device / Device configuration layout}
+
+The device MAY change \field{usable_region_size} and
+\field{requested_size}.
+
+The device MUST NOT change \field{block_size}, \field{node_id},
+\field{addr}, and \field{region_size}, except during a system reset.
+
+The device MUST change \field{plugged_size} to reflect the size of plugged
+memory blocks.
+
+The device MUST set \field{usable_region_size} to \field{requested_size} o=
r
+greater.
+
+The device MUST set \field{block_size} to a power of two.
+
+The device MUST set \field{addr}, \field{region_size},
+\field{usable_region_size}, \field{plugged_size}, \field{requested_size} t=
o
+multiples of \field{block_size}.
+
+The device MUST set \field{region_size} to 0 or greater.
+
+The device MUST NOT shrink \field{usable_region_size}, except when
+processing an UNPLUG ALL request, or during a system reset.
+
+The device MUST send a configuration update notification when changing
+\field{usable_region_size} or \field{requested_size}, except when
+processing an UNPLUG ALL request.
+
+The device SHOULD NOT send a configuration update notification when
+changing \field{plugged_size}.
+
+The device MAY send a configuration update notification even if nothing
+changed.
+
+\subsection{Device Initialization}\label{Device Types / Memory Device / De=
vice Initialization}
+
+On initialization, the driver first discovers the device's virtqueues.  It
+then reads the device configuration.
+
+In case the driver detects that the device still has memory plugged
+(\field{plugged_size} in the device configuration is greater than 0), the
+driver will either try to re-initialize by issuing STATE requests, or try
+to unplug all memory before continuing.  Special handling might be
+necessary in case some plugged memory might still be relevant (e.g., syste=
m
+dump, memory still in use after unloading the driver).
+
+\drivernormative{\subsubsection}{Device Initialization}{Device Types / Mem=
ory Device / Device Initialization}
+
+The driver SHOULD issue UNPLUG ALL requests until successful if the device
+still has memory plugged and the plugged memory is not in use.
+
+\devicenormative{\subsubsection}{Device Initialization}{Device Types / Mem=
ory Device / Device Initialization}
+
+The device MUST NOT change the state of memory blocks during device reset.
+
+The device MUST NOT change the content of plugged memory blocks during
+device reset.
+
+\subsection{Device Operation}\label{sec:Device Types / Memory Device / Dev=
ice Operation}
+
+The device notifies the driver about the amount of memory the device wants
+the driver to consume via the device.  These resize requests from the
+device are communciated via the \field{requested_size} in the device
+configuration.  The driver will react by requesting to (un)plug specific
+memory blocks, to make the \field{plugged_size} match the
+\field{requested_size} as close as possible.
+
+The driver sends requests to the device on the guest-request virtqueue,
+notifies the device, and waits for the device to respond.  Requests have a
+common header, defining the request type, followed by request-specific
+data.  All requests are 24 bytes long and have the layout:
+
+\begin{lstlisting}
+struct virtio_mem_req {
+  le16 type;
+  le16 padding[3];
+
+  union {
+    struct virtio_mem_req_plug plug;
+    struct virtio_mem_req_unplug unplug;
+    struct virtio_mem_req_state state;
+  } u;
+}
+\end{lstlisting}
+
+Possible request types are:
+
+\begin{lstlisting}
+#define VIRTIO_MEM_REQ_PLUG            0
+#define VIRTIO_MEM_REQ_UNPLUG          1
+#define VIRTIO_MEM_REQ_UNPLUG_ALL      2
+#define VIRTIO_MEM_REQ_STATE           3
+\end{lstlisting}
+
+Responses have a common header, defining the response type, followed by
+request-specific data.  All responses are 10 bytes long and have the layou=
t:
+
+\begin{lstlisting}
+struct virtio_mem_resp {
+  le16 type;
+  le16 padding[3];
+
+  union {
+    struct virtio_mem_resp_state state;
+  } u;
+}
+\end{lstlisting}
+
+Possible response types, in general, are:
+
+\begin{lstlisting}
+#define VIRTIO_MEM_RESP_ACK            0
+#define VIRTIO_MEM_RESP_NACK           1
+#define VIRTIO_MEM_RESP_BUSY           2
+#define VIRTIO_MEM_RESP_ERROR          3
+\end{lstlisting}
+
+\drivernormative{\subsubsection}{Device Operation}{Device Types / Memory D=
evice / Device Operation}
+
+The driver MUST NOT write to unplugged memory blocks.
+
+The driver MUST NOT read from unplugged memory blocks outside
+\field{usable_region_size}.
+
+The driver SHOULD NOT read from unplugged memory blocks inside
+\field{usable_region_size}.
+
+The driver MUST NOT request to unplug memory blocks while the memory is
+still in use.
+
+The driver SHOULD initialize memory blocks after plugging them, the conten=
t
+is undefined.
+
+The driver SHOULD react to resize requests from the device
+(\field{requested_size} in the device configuration changed) by
+(un)plugging memory blocks.
+
+The driver SHOULD only plug memory blocks it can actually use.
+
+The driver MAY not reach the requested size (\field{requested_size} in the
+device configuration), for example, because it cannot free up any plugged
+memory blocks to unplug them, or it would not be able to make use of
+unplugged memory blocks after plugging them (e.g., alignment).
+
+\devicenormative{\subsubsection}{Device Operation}{Device Types / Memory D=
evice / Device Operation}
+
+The device MAY change the content of unplugged memory blocks at any time.
+
+The device MUST NOT change the content of plugged memory blocks.
+
+The device MUST allow to read from unplugged memory blocks inside
+the usable device-managed region.
+
+The device MAY allow to read from unplugged memory blocks outside
+the usable device-managed region.
+
+The device MAY allow to write to unplugged memory blocks.
+
+The device MAY change the state of memory blocks during system resets.
+
+The device SHOULD unplug all memory blocks during system resets.
+
+\subsubsection{PLUG request}\label{sec:Device Types / Memory Device / Devi=
ce Operation / PLUG request}
+
+Request to plug consecutive memory blocks that are currently unplugged.
+
+The request-specific data in a PLUG request has the format:
+
+\begin{lstlisting}
+struct virtio_mem_req_plug {
+  le64 addr;
+  le16 nb_blocks;
+  le16 padding[3];
+}
+\end{lstlisting}
+
+\field{addr} is the guest physical address of the first memory block.
+\field{nb_blocks} is the number of consecutive memory blocks
+
+Responses don't have request-specific data defined.
+
+\drivernormative{\paragraph}{PLUG request}{Device Types / Memory Device / =
Device Operation / PLUG request}
+
+The driver MUST ignore anything except the response type in a response.
+
+\devicenormative{\paragraph}{PLUG request}{Device Types / Memory Device / =
Device Operation / PLUG request}
+
+The device MUST ignore anything except the request type and the
+request-specific data in a request.
+
+The device MUST ignore the \field{padding} in the request-specific data in
+a request.
+
+The device MUST reject requests with VIRTIO_MEM_RESP_ERROR if \field{addr}
+is not aligned to the \field{block_size} in the device configuration, if
+\field{nb_blocks} is not greater than 0, or if any memory block outside of
+the usable device-managed memory region is covered by the request.
+
+The device MUST reject requests with VIRTIO_MEM_RESP_ERROR if any memory
+block covered by the request is already plugged.
+
+The device MAY reject requests with VIRTIO_MEM_RESP_BUSY if the request ca=
n
+currently not be processed.
+
+The device MUST acknowledge requests with VIRTIO_MEM_RESP_ACK in case all
+memory blocks were successfully plugged.  The device MUST reflect the
+change in the device configuration \field{plugged_size}.
+
+\subsubsection{UNPLUG request}\label{sec:Device Types / Memory Device / De=
vice Operation / UNPLUG request}
+
+Request to unplug consecutive memory blocks that are currently plugged.
+
+The request-specific data in an UNPLUG request has the format:
+
+\begin{lstlisting}
+struct virtio_mem_req_unplug {
+  le64 addr;
+  le16 nb_blocks;
+  le16 padding[3];
+}
+\end{lstlisting}
+
+\field{addr} is the guest physical address of the first memory block.
+\field{nb_blocks} is the number of consecutive memory blocks
+
+Responses don't have request-specific data defined.
+
+\drivernormative{\paragraph}{UNPLUG request}{Device Types / Memory Device =
/ Device Operation / UNPLUG request}
+
+The driver MUST ignore anything except the response type in a response.
+
+\devicenormative{\paragraph}{UNPLUG request}{Device Types / Memory Device =
/ Device Operation / UNPLUG request}
+
+The device MUST ignore anything except the request type and the
+request-specific data in a request.
+
+The device MUST ignore the \field{padding} in the request-specific data in
+a request.
+
+The device MUST reject requests with VIRTIO_MEM_RESP_ERROR if \field{addr}
+is not aligned to the \field{block_size} in the device configuration, if
+\field{nb_blocks} is not greater than 0, or if any memory block outside of
+the usable device-managed memory region is covered by the request.
+
+The device MUST reject requests with VIRTIO_MEM_RESP_ERROR if any memory
+block covered by the request is already unplugged.
+
+The device MAY reject requests with VIRTIO_MEM_RESP_BUSY if the request ca=
n
+currently not be processed.
+
+The device MUST acknowledge requests with VIRTIO_MEM_RESP_ACK in case all
+memory blocks were successfully unplugged.  The device MUST reflect the
+change in the device configuration \field{plugged_size}.
+
+\subsubsection{UNPLUG ALL request}\label{sec:Device Types / Memory Device =
/ Device Operation / UNPLUG ALL request}
+
+Request to unplug all memory blocks the device has currently plugged.  If
+successful, the \field{plugged_size} in the device configuration will be 0
+and \field{usable_region_size} might have changed.
+
+Requests don't have request-specific data defined, only the request type i=
s
+relevant.  Responses don't have request-specific data defined, only the
+response type is relevant.
+
+\drivernormative{\paragraph}{UNPLUG request}{Device Types / Memory Device =
/ Device Operation / UNPLUG ALL request}
+
+The driver MUST ignore any data in a response except the response type.
+
+\devicenormative{\paragraph}{UNPLUG request}{Device Types / Memory Device =
/ Device Operation / UNPLUG ALL request}
+
+The device MUST ignore any data in a request except the request type.
+
+The device MUST ignore the \field{padding} in the request-specific data in
+a request.
+
+The device MAY reject requests with VIRTIO_MEM_RESP_BUSY if the request ca=
n
+currently not be processed.
+
+The device MUST acknowledge requests with VIRTIO_MEM_RESP_ACK in case all
+memory blocks were successfully unplugged.
+
+The device MUST set \field{plugged_size} to 0 in case the request is
+acknowledged with VIRTIO_MEM_RESP_ACK.
+
+The device MAY modify \field{usable_region_size} before responding with
+VIRTIO_MEM_RESP_ACK.
+
+\subsubsection{STATE request}\label{sec:Device Types / Memory Device / Dev=
ice Operation / STATE request}
+
+Request the state (plugged, unplugged, mixed) of consecutive memory blocks=
.
+
+The request-specific data in a STATE request has the format:
+
+\begin{lstlisting}
+struct virtio_mem_req_state {
+  le64 addr;
+  le16 nb_blocks;
+  le16 padding[3];
+};
+\end{lstlisting}
+
+\field{addr} is the guest physical address of the first memory block.
+\field{nb_blocks} is the number of consecutive memory blocks.
+
+The request-specific data in a STATE response has the format:
+
+\begin{lstlisting}
+struct virtio_mem_resp_state {
+  le16 type;
+};
+\end{lstlisting}
+
+Whereby \field{type} defines one of three different state types:
+
+\begin{lstlisting}
+#define VIRTIO_MEM_STATE_PLUGGED        0
+#define VIRTIO_MEM_STATE_UNPLUGGED      1
+#define VIRTIO_MEM_STATE_MIXED          2
+\end{lstlisting}
+
+\drivernormative{\paragraph}{STATE request}{Device Types / Memory Device /=
 Device Operation / STATE request}
+
+The driver MUST ignore anything except the response type and the
+request-specific data in a response.
+
+The driver MUST ignore the request-specific data in a response in case the
+response type is not VIRTIO_MEM_RESP_ACK.
+
+\devicenormative{\paragraph}{STATE request}{Device Types / Memory Device /=
 Device Operation / STATE request}
+
+The device MUST ignore anything except the request type and the
+request-specific data in a request.
+
+The device MUST ignore the \field{padding} in the request-specific data in
+a request.
+
+The device MUST reject requests with VIRTIO_MEM_RESP_ERROR if \field{addr}
+is not aligned to the \field{block_size} in the device configuration, if
+\field{nb_blocks} is not greater than 0, or if any memory block outside of
+the usable device-managed memory region is covered by the request.
+
+The device MUST acknowledge requests with VIRTIO_MEM_RESP_ACK, supplying
+the state of the memory blocks.
+
+The device MUST set the state type in the response to
+VIRTIO_MEM_STATE_PLUGGED if all requested memory blocks are plugged.  The
+device MUST set the state type in the response to
+VIRTIO_MEM_STATE_UNPLUGGED if all requested memory blocks are unplugged.
+Otherwise, the device MUST set state type in the response to
+VIRTIO_MEM_STATE_MIXED.
--=20
2.26.2


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

