Return-Path: virtio-comment-return-1149-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 085CB985DC1
	for <virtio-comment@lists.oasis-open.org>; Thu, 19 Mar 2020 02:18:46 +0000 (UTC)
From: David Stevens <stevensd@chromium.org>
Date: Thu, 19 Mar 2020 11:18:23 +0900
Message-Id: <20200319021823.57219-3-stevensd@chromium.org>
In-Reply-To: <20200319021823.57219-1-stevensd@chromium.org>
References: <20200319021823.57219-1-stevensd@chromium.org>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH v4 2/2] virtio-gpu: add the ability to export resources
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Dylan Reid <dgreid@chromium.org>, Tomasz Figa <tfiga@chromium.org>, Zach Reizner <zachr@chromium.org>, Keiichi Watanabe <keiichiw@chromium.org>, Alexandre Courbot <acourbot@chromium.org>, Alex Lau <alexlau@chromium.org>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>, Pawel Osciak <posciak@chromium.org>, Gurchetan Singh <gurchetansingh@chromium.org>, Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel <qemu-devel@nongnu.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, David Stevens <stevensd@chromium.org>
List-ID: <virtio-comment.lists.oasis-open.org>

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 virtio-gpu.tex | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/virtio-gpu.tex b/virtio-gpu.tex
index af4ca61..e75aafa 100644
--- a/virtio-gpu.tex
+++ b/virtio-gpu.tex
@@ -35,6 +35,8 @@ \subsection{Feature bits}\label{sec:Device Types / GPU De=
vice / Feature bits}
 \begin{description}
 \item[VIRTIO_GPU_F_VIRGL (0)] virgl 3D mode is supported.
 \item[VIRTIO_GPU_F_EDID  (1)] EDID is supported.
+\item[VIRTIO_GPU_F_RESOURCE_UUID (2)] assigning resources UUIDs for export
+  to other virtio devices is supported.
 \end{description}
=20
 \subsection{Device configuration layout}\label{sec:Device Types / GPU Devi=
ce / Device configuration layout}
@@ -181,6 +183,7 @@ \subsubsection{Device Operation: Request header}\label{=
sec:Device Types / GPU De
         VIRTIO_GPU_CMD_GET_CAPSET_INFO,
         VIRTIO_GPU_CMD_GET_CAPSET,
         VIRTIO_GPU_CMD_GET_EDID,
+        VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID,
=20
         /* cursor commands */
         VIRTIO_GPU_CMD_UPDATE_CURSOR =3D 0x0300,
@@ -192,6 +195,7 @@ \subsubsection{Device Operation: Request header}\label{=
sec:Device Types / GPU De
         VIRTIO_GPU_RESP_OK_CAPSET_INFO,
         VIRTIO_GPU_RESP_OK_CAPSET,
         VIRTIO_GPU_RESP_OK_EDID,
+        VIRTIO_GPU_RESP_OK_RESOURCE_UUID,
=20
         /* error responses */
         VIRTIO_GPU_RESP_ERR_UNSPEC =3D 0x1200,
@@ -454,6 +458,32 @@ \subsubsection{Device Operation: controlq}\label{sec:D=
evice Types / GPU Device /
 This detaches any backing pages from a resource, to be used in case of
 guest swapping or object destruction.
=20
+\item[VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID] Creates an exported object from
+  a resource. Request data is \field{struct
+    virtio_gpu_resource_assign_uuid}.  Response type is
+  VIRTIO_GPU_RESP_OK_RESOURCE_UUID, response data is \field{struct
+    virtio_gpu_resp_resource_uuid}. Support is optional and negotiated
+    using the VIRTIO_GPU_F_RESOURCE_UUID feature flag.
+
+\begin{lstlisting}
+struct virtio_gpu_resource_assign_uuid {
+        struct virtio_gpu_ctrl_hdr hdr;
+        le32 resource_id;
+        le32 padding;
+};
+
+struct virtio_gpu_resp_resource_uuid {
+        struct virtio_gpu_ctrl_hdr hdr;
+        u8 uuid[16];
+};
+\end{lstlisting}
+
+The response contains a UUID which identifies the exported object created =
from
+the host private resource. Note that if the resource has an attached backi=
ng,
+modifications made to the host private resource through the exported objec=
t by
+other devices are not visible in the attached backing until they are trans=
ferred
+into the backing.
+
 \end{description}
=20
 \subsubsection{Device Operation: cursorq}\label{sec:Device Types / GPU Dev=
ice / Device Operation / Device Operation: cursorq}
--=20
2.25.1.481.gfbce0eb801-goog


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

