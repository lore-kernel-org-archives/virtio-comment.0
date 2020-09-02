Return-Path: virtio-comment-return-1441-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2B9EC985EC1
	for <virtio-comment@lists.oasis-open.org>; Wed,  2 Sep 2020 20:58:31 +0000 (UTC)
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Wed,  2 Sep 2020 13:58:24 -0700
Message-Id: <20200902205825.2055-2-gurchetansingh@chromium.org>
In-Reply-To: <20200902205825.2055-1-gurchetansingh@chromium.org>
References: <20200902205825.2055-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH 1/2] virtio-gpu: add resource create blob
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
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
v4: Remove TRANSFER_BLOB for now.
v5: clarify interactions with ATTACH_BACKING / DETACH_BACKING.
    This is to preserve the possibility of guest swap-in and guest
    swap-out, while acknowledging this feature may never be implemented
    and may not be applicable for all future planned values of
    `blob_mem` or context types.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Acked-by: Chia-I Wu <olvaffe@gmail.com>
---
 virtio-gpu.tex | 99 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/virtio-gpu.tex b/virtio-gpu.tex
index f98ddba..55bd6d2 100644
--- a/virtio-gpu.tex
+++ b/virtio-gpu.tex
@@ -37,6 +37,8 @@ \subsection{Feature bits}\label{sec:Device Types / GPU De=
vice / Feature bits}
 \item[VIRTIO_GPU_F_EDID  (1)] EDID is supported.
 \item[VIRTIO_GPU_F_RESOURCE_UUID (2)] assigning resources UUIDs for export
   to other virtio devices is supported.
+\item[VIRTIO_GPU_F_RESOURCE_BLOB (3)] creating and using size-based blob
+  resources is supported.
 \end{description}
=20
 \subsection{Device configuration layout}\label{sec:Device Types / GPU Devi=
ce / Device configuration layout}
@@ -189,6 +191,8 @@ \subsubsection{Device Operation: Request header}\label{=
sec:Device Types / GPU De
         VIRTIO_GPU_CMD_GET_CAPSET,
         VIRTIO_GPU_CMD_GET_EDID,
         VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID,
+        VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB,
+        VIRTIO_GPU_CMD_SET_SCANOUT_BLOB,
=20
         /* 3d commands (OpenGL) */
         VIRTIO_GPU_CMD_CTX_CREATE =3D 0x0200,
@@ -499,6 +503,101 @@ \subsubsection{Device Operation: controlq}\label{sec:=
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
+For default and guest-only blob resources, \field{nr_entries} guest
+memory entries may be assigned to the resource.  For default blob resource=
s
+(i.e, when \field{blob_mem} is VIRTIO_GPU_BLOB_MEM_HOST3D_GUEST), these
+memory entries are used as a shadow buffer for the host memory. To
+facilitate drivers that support swap-in and swap-out, \field{nr_entries} m=
ay
+be zero and VIRTIO_GPU_CMD_RESOURCE_ATTACH_BACKING may be subsequently use=
d.
+VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING may be used to unassign memory entr=
ies.
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
+has on the blob resource.
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

