Return-Path: <virtio-comment-return-2258-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7BF86986506
	for <virtio-comment@lists.oasis-open.org>; Thu, 26 Aug 2021 02:13:20 +0000 (UTC)
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Wed, 25 Aug 2021 19:13:12 -0700
Message-Id: <20210826021313.378-2-gurchetansingh@chromium.org>
In-Reply-To: <20210826021313.378-1-gurchetansingh@chromium.org>
References: <20210826021313.378-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
Subject: [virtio-comment] [RFC PATCH 1/2] virtio-gpu: clarify spec regarding capability sets
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"
To: virtio-comment@lists.oasis-open.org
Cc: kraxel@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

Capability sets will be used as a proxy for the context type,
so add more detail regarding their use.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 virtio-gpu.tex | 58 +++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 57 insertions(+), 1 deletion(-)

diff --git a/virtio-gpu.tex b/virtio-gpu.tex
index 7bfb8dd..35c129f 100644
--- a/virtio-gpu.tex
+++ b/virtio-gpu.tex
@@ -53,7 +53,7 @@ \subsection{Device configuration layout}\label{sec:Device=
 Types / GPU Device / D
         le32 events_read;
         le32 events_clear;
         le32 num_scanouts;
-        le32 reserved;
+        le32 num_capsets;
 };
 \end{lstlisting}
=20
@@ -67,6 +67,8 @@ \subsubsection{Device configuration fields}
   \field{events_read}, mimicking write-to-clear behavior.
 \item[\field{num_scanouts}] specifies the maximum number of scanouts
   supported by the device.  Minimum value is 1, maximum value is 16.
+\item[\field{num_capsets}] specifies the maximum number of capability
+  sets supported by the device.  The minimum value is zero.
 \end{description}
=20
 \subsubsection{Events}
@@ -498,6 +500,60 @@ \subsubsection{Device Operation: controlq}\label{sec:D=
evice Types / GPU Device /
 This detaches any backing pages from a resource, to be used in case of
 guest swapping or object destruction.
=20
+\item[VIRTIO_GPU_CMD_GET_CAPSET_INFO] Gets the information associated with
+  a particular \field{capset_index}, which MUST less than \field{num_capse=
ts}
+  defined in the device configuration.  Request data is
+  \field{struct virtio_gpu_get_capset_info}.  Response type is
+  VIRTIO_GPU_RESP_OK_CAPSET_INFO.
+
+  On success, \field{struct virtio_gpu_resp_capset_info} contains the
+  \field{capset_id}, \field{capset_max_version}, \field{capset_max_size}
+  associated with capset at the specified {capset_idex}.  field{capset_id}=
 MUST
+  be one of the following (see listing for values):
+
+  \begin{itemize*}
+  \item \href{https://gitlab.freedesktop.org/virgl/virglrenderer/-/blob/ma=
ster/src/virgl_hw.h#L526}{VIRTIO_GPU_CAPSET_VIRGL} --
+=09the first edition of Virgl (Gallium OpenGL) protocol.
+  \item \href{https://gitlab.freedesktop.org/virgl/virglrenderer/-/blob/ma=
ster/src/virgl_hw.h#L550}{VIRTIO_GPU_CAPSET_VIRGL2} --
+=09the second edition of Virgl (Gallium OpenGL) protocol after the capset =
fix.
+  \end{itemize*}
+
+\begin{lstlisting}
+struct virtio_gpu_get_capset_info {
+        struct virtio_gpu_ctrl_hdr hdr;
+        le32 capset_index;
+        le32 padding;
+};
+
+#define VIRTIO_GPU_CAPSET_VIRGL 1
+#define VIRTIO_GPU_CAPSET_VIRGL2 2
+struct virtio_gpu_resp_capset_info {
+        struct virtio_gpu_ctrl_hdr hdr;
+        le32 capset_id;
+        le32 capset_max_version;
+        le32 capset_max_size;
+        le32 padding;
+};
+\end{lstlisting}
+
+\item[VIRTIO_GPU_CMD_GET_CAPSET] Gets the capset associated with a
+  particular \field{capset_id} and \field{capset_version}.  Request data i=
s
+  \field{struct virtio_gpu_get_capset}.  Response type is
+  VIRTIO_GPU_RESP_OK_CAPSET.
+
+\begin{lstlisting}
+struct virtio_gpu_get_capset {
+        struct virtio_gpu_ctrl_hdr hdr;
+        le32 capset_id;
+        le32 capset_version;
+};
+
+struct virtio_gpu_resp_capset {
+        struct virtio_gpu_ctrl_hdr hdr;
+        u8 capset_data[];
+};
+\end{lstlisting}
+
 \item[VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID] Creates an exported object from
   a resource. Request data is \field{struct
     virtio_gpu_resource_assign_uuid}.  Response type is
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

