Return-Path: <virtio-comment-return-2262-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 14C6F98638E
	for <virtio-comment@lists.oasis-open.org>; Mon, 30 Aug 2021 19:42:01 +0000 (UTC)
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Mon, 30 Aug 2021 12:41:55 -0700
Message-Id: <20210830194155.882-1-gurchetansingh@chromium.org>
In-Reply-To: <20210826021313.378-3-gurchetansingh@chromium.org>
References: <20210826021313.378-3-gurchetansingh@chromium.org>
MIME-Version: 1.0
Subject: [virtio-comment] [RFC PATCH v2 2/2] virtio-gpu: add context init support
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"
To: virtio-comment@lists.oasis-open.org
Cc: kraxel@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

This brings explicit context initialization and different types
to virtio-gpu.

In the past, VIRTIO_GPU_F_VIRGL meant the virglrenderer support.
With VIRTIO_GPU_F_VIRGL + VIRTIO_GPU_F_CONTEXT_INIT, this means
generic 3D virtualization defined by the context type.  It's
entirely possible the virglrenderer project isn't available on
the host in this scenario.  The VIRTIO_GPU_F_VIRGL naming
convention is kept since it's easier to redefine the meaning
rather than changing header files.

The context type is associated an particular capset id.  Virgl
has two capsets due a prior bug, but for other cases the 1:1
mapping between context type and capset id is valid.

In addition, fencing needs to be fixed to accomodate multiple
context types.  In the past, there was one global timeline
associated witht the OpenGL rendering.  Now, there are multiple
timelines which can be associated with GL, VK or even display
contexts.

v2: Correct number of bits

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 virtio-gpu.tex | 75 ++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 63 insertions(+), 12 deletions(-)

diff --git a/virtio-gpu.tex b/virtio-gpu.tex
index 35c129f..5753466 100644
--- a/virtio-gpu.tex
+++ b/virtio-gpu.tex
@@ -1,14 +1,10 @@
 \section{GPU Device}\label{sec:Device Types / GPU Device}
=20
 virtio-gpu is a virtio based graphics adapter.  It can operate in 2D
-mode and in 3D (virgl) mode.  3D mode will offload rendering ops to
+mode and in 3D mode.  3D mode will offload rendering ops to
 the host gpu and therefore requires a gpu with 3D support on the host
 machine.
=20
-3D mode is not covered (yet) in this specification, even though it is
-mentioned here and there due to some details of the virtual hardware
-being designed with 3D mode in mind.
-
 In 2D mode the virtio-gpu device provides support for ARGB Hardware
 cursors and multiple scanouts (aka heads).
=20
@@ -39,6 +35,8 @@ \subsection{Feature bits}\label{sec:Device Types / GPU De=
vice / Feature bits}
   to other virtio devices is supported.
 \item[VIRTIO_GPU_F_RESOURCE_BLOB (3)] creating and using size-based blob
   resources is supported.
+\item[VIRTIO_GPU_F_CONTEXT_INIT (4)] multiple context types and
+  synchronization timelines supported.  Requires VIRTIO_GPU_F_VIRGL.
 \end{description}
=20
 \subsection{Device configuration layout}\label{sec:Device Types / GPU Devi=
ce / Device configuration layout}
@@ -214,7 +212,7 @@ \subsubsection{Device Operation: Request header}\label{=
sec:Device Types / GPU De
         VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB,
         VIRTIO_GPU_CMD_SET_SCANOUT_BLOB,
=20
-        /* 3d commands (OpenGL) */
+        /* 3d commands */
         VIRTIO_GPU_CMD_CTX_CREATE =3D 0x0200,
         VIRTIO_GPU_CMD_CTX_DESTROY,
         VIRTIO_GPU_CMD_CTX_ATTACH_RESOURCE,
@@ -249,13 +247,16 @@ \subsubsection{Device Operation: Request header}\labe=
l{sec:Device Types / GPU De
 };
=20
 #define VIRTIO_GPU_FLAG_FENCE (1 << 0)
+#define VIRTIO_GPU_FLAG_INFO_RING_IDX (1 << 1)
+
+#define VIRTIO_GPU_INFO_RING_IDX_MASK 0x0000001f;
=20
 struct virtio_gpu_ctrl_hdr {
         le32 type;
         le32 flags;
         le64 fence_id;
         le32 ctx_id;
-        le32 padding;
+        le32 info;
 };
 \end{lstlisting}
=20
@@ -275,6 +276,22 @@ \subsubsection{Device Operation: Request header}\label=
{sec:Device Types / GPU De
   \item send the response only after command processing is complete.
   \end{itemize*}
 \item[\field{ctx_id}] Rendering context (used in 3D mode only).
+\item[\field{info}] Information associated with the command.  If
+  VIRTIO_GPU_F_CONTEXT_INIT is supported, then the driver MAY set
+  VIRTIO_GPU_FLAG_INFO_RING_IDX bit in the request \field{flags}.  In
+  that case:
+  \begin{itemize*}
+  \item VIRTIO_GPU_FLAG_FENCE MUST also be set
+  \item the lower 5 bits of \field{info} indicates the value of a
+   context-specific ring index.  The minimum value is 0 and maximum
+   value is 31.
+  \item \field{fence_id} acts as a sequence number on the synchronization
+   timeline defined by \field{ctx_idx} and the ring index.
+  \item when the command associated with \field{fence_id} is complete, the
+  device MUST send a response for all outstanding commands with a sequence
+  number less than or equal to \field{fence_id} on the same
+  synchronization timeline.
+  \end{itemize*}
 \end{description}
=20
 On success the device will return VIRTIO_GPU_RESP_OK_NODATA in
@@ -516,6 +533,12 @@ \subsubsection{Device Operation: controlq}\label{sec:D=
evice Types / GPU Device /
 =09the first edition of Virgl (Gallium OpenGL) protocol.
   \item \href{https://gitlab.freedesktop.org/virgl/virglrenderer/-/blob/ma=
ster/src/virgl_hw.h#L550}{VIRTIO_GPU_CAPSET_VIRGL2} --
 =09the second edition of Virgl (Gallium OpenGL) protocol after the capset =
fix.
+  \item \href{https://android.googlesource.com/device/generic/vulkan-cerea=
l/+/refs/heads/master/protocols/}{VIRTIO_GPU_CAPSET_GFXSTREAM} --
+=09gfxtream's (mostly) autogenerated GLES and Vulkan streaming protocols.
+  \item \href{https://gitlab.freedesktop.org/olv/venus-protocol}{VIRTIO_GP=
U_CAPSET_VENUS} --
+=09Mesa's (mostly) autogenerated Vulkan protocol.
+  \item \href{https://chromium.googlesource.com/chromiumos/platform/crosvm=
/+/refs/heads/main/rutabaga_gfx/src/cross_domain/cross_domain_protocol.rs}{=
VIRTIO_GPU_CAPSET_CROSS_DOMAIN} --
+=09protocol for display virtualization via Wayland proxying.
   \end{itemize*}
=20
 \begin{lstlisting}
@@ -527,6 +550,9 @@ \subsubsection{Device Operation: controlq}\label{sec:De=
vice Types / GPU Device /
=20
 #define VIRTIO_GPU_CAPSET_VIRGL 1
 #define VIRTIO_GPU_CAPSET_VIRGL2 2
+#define VIRTIO_GPU_CAPSET_GFXSTREAM 3
+#define VIRTIO_GPU_CAPSET_VENUS 4
+#define VIRTIO_GPU_CAPSET_CROSS_DOMAIN 5
 struct virtio_gpu_resp_capset_info {
         struct virtio_gpu_ctrl_hdr hdr;
         le32 capset_id;
@@ -684,21 +710,46 @@ \subsubsection{Device Operation: controlq (3d)}\label=
{sec:Device Types / GPU Dev
=20
 \begin{description}
=20
-\item[VIRTIO_GPU_CMD_CTX_CREATE]
+\item[VIRTIO_GPU_CMD_CTX_CREATE] creates a context for submitting an opaqu=
e
+  command stream.  Request data is \field{struct virtio_gpu_ctx_create}.
+  Response type is VIRTIO_GPU_RESP_OK_NODATA.
+
+\begin{lstlisting}
+#define VIRTIO_GPU_CONTEXT_INIT_CAPSET_ID_MASK 0x0000003f;
+struct virtio_gpu_ctx_create {
+       struct virtio_gpu_ctrl_hdr hdr;
+       le32 nlen;
+       le32 context_init;
+       char debug_name[64];
+};
+\end{lstlisting}
+
+The implementation MUST create a context for the given \field{ctx_id} in
+the \field{hdr}.  For debugging purposes, a \field{debug_name} and it's
+length \field{nlen} is provided by the driver.  If
+VIRTIO_GPU_F_CONTEXT_INIT is supported, then lower 6 bits of
+\field{context_init} MAY contain the \field{capset_id} associated with
+context.  In that case, then the device MUST create a context that can
+handle the specified command stream.
+
+If the lower 6-bits of the \field{context_init} are zero, then the type of
+the context is determined by the device.
+
 \item[VIRTIO_GPU_CMD_CTX_DESTROY]
 \item[VIRTIO_GPU_CMD_CTX_ATTACH_RESOURCE]
 \item[VIRTIO_GPU_CMD_CTX_DETACH_RESOURCE]
-  Manage OpenGL contexts.
+  Manage virtio-gpu 3d contexts.
=20
 \item[VIRTIO_GPU_CMD_RESOURCE_CREATE_3D]
-  Create OpenGL resources.
+  Create virtio-gpu 3d resources.
=20
 \item[VIRTIO_GPU_CMD_TRANSFER_TO_HOST_3D]
 \item[VIRTIO_GPU_CMD_TRANSFER_FROM_HOST_3D]
-  Transfer data from and to OpenGL resources.
+  Transfer data from and to virtio-gpu 3d resources.
=20
 \item[VIRTIO_GPU_CMD_SUBMIT_3D]
-  Submit rendering commands (mesa gallium command stream).
+  Submit an opaque command stream.  The type of the command stream is
+  determined when creating a context.
=20
 \item[VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB] maps a host-only
   blob resource into an offset in the host visible memory region. Request
--=20
2.31.0


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

