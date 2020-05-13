Return-Path: virtio-comment-return-1238-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 96C5F985F69
	for <virtio-comment@lists.oasis-open.org>; Wed, 13 May 2020 23:13:29 +0000 (UTC)
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Wed, 13 May 2020 16:13:18 -0700
Message-Id: <20200513231319.1169-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
Subject: [virtio-comment] [RFC PATCH v3 1/2] virtio-gpu: add resource create blob
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: kraxel@redhat.com, olvaffe@gmail.com, marcheu@chromium.org, Gurchetan Singh <gurchetansingh@chromium.org>
List-ID: <virtio-comment.lists.oasis-open.org>

Blob resources are size-based containers for host, guest, or
host+guest allocations.  These resources are designed with
mulit-process 3D support in mind, but also usable in virtio-gpu 2d
with guest memory.

Many hypercalls are reused, since a image view into the blob resource
is possible.

Blob resources are both forward and backward looking.

v2: Add TRANSFER_BLOB, SET_SCANOUT_BLOB, SCANOUT_FLUSH
v3: Remove SCANOUT_FLUSH and add notes

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 virtio-gpu.tex | 125 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/virtio-gpu.tex b/virtio-gpu.tex
index e70532f..179e57c 100644
--- a/virtio-gpu.tex
+++ b/virtio-gpu.tex
@@ -36,6 +36,7 @@ \subsection{Feature bits}\label{sec:Device Types / GPU De=
vice / Feature bits}
 \item[VIRTIO_GPU_F_VIRGL (0)] virgl 3D mode is supported.
 \item[VIRTIO_GPU_F_EDID  (1)] EDID is supported.
 \item[VIRTIO_GPU_F_RESOURCE_UUID (2)] assigning resources UUIDs for export=
 to other virtio devices is supported.
+\item[VIRTIO_GPU_F_RESOURCE_BLOB (3)] creating and using size-based blob r=
esources is supported.
 \end{description}
=20
 \subsection{Device configuration layout}\label{sec:Device Types / GPU Devi=
ce / Device configuration layout}
@@ -188,6 +189,9 @@ \subsubsection{Device Operation: Request header}\label{=
sec:Device Types / GPU De
         VIRTIO_GPU_CMD_GET_CAPSET,
         VIRTIO_GPU_CMD_GET_EDID,
         VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID,
+        VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB,
+        VIRTIO_GPU_CMD_TRANSFER_BLOB,
+        VIRTIO_GPU_CMD_SET_SCANOUT_BLOB,
=20
         /* 3d commands (OpenGL) */
         VIRTIO_GPU_CMD_CTX_CREATE =3D 0x0200,
@@ -498,6 +502,127 @@ \subsubsection{Device Operation: controlq}\label{sec:=
Device Types / GPU Device /
 other devices are not visible in the attached backing until they are trans=
ferred
 into the backing.
=20
+\item[VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB] Creates a virtio-gpu blob
+  resource. Request data is \field{struct
+  virtio_gpu_resource_create_blob}, followed by \field{struct
+  virtio_gpu_mem_entry} entries. Response type is
+  VIRTIO_GPU_RESP_OK_NODATA. Support is optional and negotiated
+  using the VIRTIO_GPU_F_RESOURCE_BLOB feature flag.
+
+\begin{lstlisting}
+#define VIRTIO_GPU_BLOB_MEM_GUEST             0x0001
+#define VIRTIO_GPU_BLOB_MEM_HOST3D            0x0002
+#define VIRTIO_GPU_BLOB_MEM_HOST3D_GUEST      0x0003
+
+#define VIRTIO_GPU_BLOB_FLAG_USE_MAPPABLE     0x0001
+#define VIRTIO_GPU_BLOB_FLAG_USE_SHAREABLE    0x0002
+#define VIRTIO_GPU_BLOB_FLAG_USE_CROSS_DEVICE 0x0004
+
+struct virtio_gpu_resource_create_blob {
+       struct virtio_gpu_ctrl_hdr hdr;
+       le32 resource_id;
+       le32 blob_mem;
+       le32 blob_flags;
+       le32 nr_entries;
+       le64 blob_id;
+       le64 size;
+};
+
+\end{lstlisting}
+
+A blob resource is a container for:
+
+  \begin{itemize*}
+  \item a guest memory allocation (referred to as a
+  "guest-only blob resource").
+  \item a host memory allocation (referred to as a
+  "host-only blob resource").
+  \item a guest memory and host memory allocation (referred
+  to as a "default blob resource").
+  \end{itemize*}
+
+The memory properties of the blob resource MUST be described by
+\field{blob_mem}, which MUST be non-zero.
+
+For default and guest-only blob resources, \field{nents} guest
+system pages are assigned to the resource.  For default blob resources
+(i.e, when \field{blob_mem} is VIRTIO_GPU_BLOB_MEM_HOST3D_GUEST), these
+guest pages are used as a shadow buffer for the host memory.
+
+\field{blob_mem} can only be VIRTIO_GPU_BLOB_MEM_HOST3D and
+VIRTIO_GPU_BLOB_MEM_HOST3D_GUEST if VIRTIO_GPU_F_VIRGL is supported.
+VIRTIO_GPU_BLOB_MEM_GUEST is valid regardless whether VIRTIO_GPU_F_VIRGL
+is supported or not.
+
+For VIRTIO_GPU_BLOB_MEM_HOST3D and VIRTIO_GPU_BLOB_MEM_HOST3D_GUEST, the
+virtio-gpu resource MUST be created from the rendering context local objec=
t
+identified by the \field{blob_id}. The actual allocation is done via
+VIRTIO_GPU_CMD_SUBMIT_3D.
+
+The driver MUST inform the device if the blob resource is used for
+memory access, sharing between driver instances and/or sharing with
+other devices. This is done via the \field{blob_flags} field.
+
+If VIRTIO_GPU_F_VIRGL is set, both VIRTIO_GPU_CMD_TRANSFER_TO_HOST_3D
+and VIRTIO_GPU_CMD_TRANSFER_FROM_HOST_3D may be used to update the
+resource. There is no restriction on the image/buffer view the driver
+has on the blob resource.  VIRTIO_GPU_CMD_TRANSFER_BLOB (described below)
+may also be used.
+
+\item[VIRTIO_GPU_CMD_TRANSFER_BLOB] synchronizes a blob resource. Request
+  data is \field{struct virtio_gpu_resource_transfer_blob}, followed by
+  \field{struct virtio_gpu_blob_range} entries. Response type is
+  VIRTIO_GPU_RESP_OK_NODATA. Support is optional and negotiated
+  using the VIRTIO_GPU_F_RESOURCE_BLOB feature flag.
+
+\begin{lstlisting}
+#define VIRTIO_GPU_TRANSFER_BLOB_TO_HOST   0x0001
+#define VIRTIO_GPU_TRANSFER_BLOB_FROM_HOST 0x0002
+
+struct virtio_gpu_blob_range {
+       le64 offset;
+       le64 size;
+};
+
+struct virtio_gpu_resource_transfer_blob {
+       struct virtio_gpu_ctrl_hdr hdr;
+       le32 resource_id;
+       le32 flags;
+       le32 nr_ranges;
+       le32 pad;
+};
+\end{lstlisting}
+
+The default blob resources, transfer operations transfer operations
+copy the contents of the guest pages to or from the host.
+For host-only blob resources, transfer operations MAY synchronize caches.
+
+\item[VIRTIO_GPU_CMD_SET_SCANOUT_BLOB] sets scanout parameters for a
+   blob resource. Request data is
+  \field{struct virtio_gpu_set_scanout_blob}. Response type is
+  VIRTIO_GPU_RESP_OK_NODATA. Support is optional and negotiated
+  using the VIRTIO_GPU_F_RESOURCE_BLOB feature flag.
+
+\begin{lstlisting}
+struct virtio_gpu_set_scanout_blob {
+       struct virtio_gpu_ctrl_hdr hdr;
+       struct virtio_gpu_rect r;
+       le32 scanout_id;
+       le32 resource_id;
+       le32 width;
+       le32 height;
+       le32 format;
+       le32 padding;
+       le32 strides[4];
+       le32 offsets[4];
+};
+\end{lstlisting}
+
+The rectangle \field{r} represents the portion of the blob resource being
+displayed. The rest is the metadata associated with the blob resource. The
+format MUST be one of \field{enum virtio_gpu_formats}.  The format MAY be
+compressed with header and data planes.
+
 \end{description}
=20
 \subsubsection{Device Operation: controlq (3d)}\label{sec:Device Types / G=
PU Device / Device Operation / Device Operation: controlq (3d)}
--=20
2.24.1


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

