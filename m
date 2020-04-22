Return-Path: virtio-comment-return-1185-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 86BBF985EF6
	for <virtio-comment@lists.oasis-open.org>; Wed, 22 Apr 2020 00:55:38 +0000 (UTC)
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Tue, 21 Apr 2020 17:55:31 -0700
Message-Id: <20200422005531.15085-3-gurchetansingh@chromium.org>
In-Reply-To: <20200422005531.15085-1-gurchetansingh@chromium.org>
References: <20200422005531.15085-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH 2/2] virtio-gpu: add support for mapping/unmapping blob resources
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: kraxel@redhat.com, olvaffe@gmail.com, marcheu@chromium.org
List-ID: <virtio-comment.lists.oasis-open.org>

This defines a virtgpu shared memory region, with the possibilty
of more in the future.  This is required to implement VK/GL coherent
memory semantics, among other things.

Does anyone know when VIRTIO_PCI_CAP_SHARED_MEMORY_CFG is expected
to land in the Linux kernel?

Co-authored-by: Gerd Hoffman <kraxel@redhat.com>
Co-authored-by: Chia-I-Wu <olvaffe@gmail.com>
Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 virtio-gpu.tex | 71 +++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 67 insertions(+), 4 deletions(-)

diff --git a/virtio-gpu.tex b/virtio-gpu.tex
index 6f374bd..a19536d 100644
--- a/virtio-gpu.tex
+++ b/virtio-gpu.tex
@@ -88,13 +88,31 @@ \subsubsection{Events}
 information is available or all displays are disabled the driver MAY
 choose to use a fallback, such as 1024x768 at display 0.
=20
+The driver SHOULD query all shared memory regions supported by the device.
+If the device supports shared memory, the \field{shmid} of a region MUST
+(see \ref{sec:Basic Facilities of a Virtio Device /
+Shared Memory Regions}~\nameref{sec:Basic Facilities of a Virtio Device /
+Shared Memory Regions}) be one of the following:
+
+\begin{lstlisting}
+enum virtio_gpu_shm_id {
+        VIRTIO_GPU_SHM_ID_UNDEFINED =3D 0,
+        VIRTIO_GPU_SHM_ID_HOST_VISIBLE =3D 1,
+};
+\end{lstlisting}
+
+The shared memory region with VIRTIO_GPU_SHM_ID_HOST_VISIBLE is referred a=
s
+the "host visible memory region".  The device MUST support the
+VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB and VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB
+if the host visible memory region is available.
+
 \subsection{Device Operation}\label{sec:Device Types / GPU Device / Device=
 Operation}
=20
 The virtio-gpu is based around the concept of resources private to the
-host, the guest must DMA transfer into these resources. This is a
-design requirement in order to interface with future 3D rendering. In
-the unaccelerated 2D mode there is no support for DMA transfers from
-resources, just to them.
+host.  The guest must DMA transfer into these resources, unless shared mem=
ory
+regions are supported. This is a design requirement in order to interface =
with
+future 3D rendering. In the unaccelerated 2D mode there is no support for =
DMA
+transfers from resources, just to them.
=20
 Resources are initially simple 2D resources, consisting of a width,
 height and format along with an identifier. The guest must then attach
@@ -190,6 +208,8 @@ \subsubsection{Device Operation: Request header}\label{=
sec:Device Types / GPU De
         VIRTIO_GPU_CMD_GET_EDID,
         VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID,
         VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB,
+        VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB,
+        VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB,
=20
         /* 3d commands (OpenGL) */
         VIRTIO_GPU_CMD_CTX_CREATE =3D 0x0200,
@@ -212,6 +232,7 @@ \subsubsection{Device Operation: Request header}\label{=
sec:Device Types / GPU De
         VIRTIO_GPU_RESP_OK_CAPSET,
         VIRTIO_GPU_RESP_OK_EDID,
         VIRTIO_GPU_RESP_OK_RESOURCE_UUID,
+        VIRTIO_GPU_RESP_OK_MAP_INFO,
=20
         /* error responses */
         VIRTIO_GPU_RESP_ERR_UNSPEC =3D 0x1200,
@@ -599,6 +620,48 @@ \subsubsection{Device Operation: controlq}\label{sec:D=
evice Types / GPU Device /
 For host-only blob resources, transfer operations MAY synchronize
 caches.
=20
+\item[VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB] maps a host-only
+  blob resource into an offset in the host visible memory region. Request
+  data is \field{struct virtio_gpu_resource_map_blob}.  Response type
+  is VIRTIO_GPU_RESP_OK_MAP_INFO. Support is optional and negotiated
+  using the VIRTIO_GPU_F_RESOURCE_BLOB feature flag and checking for
+  the presence of the host visible memory region.
+
+\begin{lstlisting}
+/* VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB */
+struct virtio_gpu_resource_map_blob {
+        struct virtio_gpu_ctrl_hdr hdr;
+        le32 resource_id;
+        le32 padding;
+        le64 offset;
+};
+
+/* VIRTIO_GPU_RESP_OK_MAP_INFO */
+#define VIRTIO_GPU_MAP_CACHE_MASK =C2=A0 =C2=A0 =C2=A00x0f
+#define VIRTIO_GPU_MAP_CACHE_NONE      0x00
+#define VIRTIO_GPU_MAP_CACHE_CACHED =C2=A0 =C2=A00x01
+#define VIRTIO_GPU_MAP_CACHE_UNCACHED =C2=A00x02
+#define VIRTIO_GPU_MAP_CACHE_WC =C2=A0 =C2=A0 =C2=A0 =C2=A00x03
+struct virtio_gpu_resp_map_info {
+        struct virtio_gpu_ctrl_hdr hdr;
+        u32 map_info;
+        u32 padding;
+};
+\end{lstlisting}
+
+\item[VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB] unmaps a
+  host-only blob resource from the host visible memory region. Request dat=
a
+  is \field{struct virtio_gpu_resource_unmap_blob}.  Response type is
+  VIRTIO_GPU_RESP_OK_NODATA.  Support is optional and negotiated
+  using the VIRTIO_GPU_F_RESOURCE_BLOB feature flag and checking for
+  the presence of the host visible memory region.
+
+struct virtio_gpu_resource_unmap_blob {
+        struct virtio_gpu_ctrl_hdr hdr;
+        le32 resource_id;
+        le32 padding;
+};
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

