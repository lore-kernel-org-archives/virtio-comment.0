Return-Path: virtio-comment-return-1055-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AED139860E2
	for <virtio-comment@lists.oasis-open.org>; Fri,  7 Feb 2020 07:40:58 +0000 (UTC)
From: David Stevens <stevensd@chromium.org>
Date: Fri,  7 Feb 2020 16:40:33 +0900
Message-Id: <20200207074033.172289-3-stevensd@chromium.org>
In-Reply-To: <20200207074033.172289-1-stevensd@chromium.org>
References: <20200207074033.172289-1-stevensd@chromium.org>
MIME-Version: 1.0
Subject: [virtio-comment] [RFC PATCH v3 2/2] virtio-gpu: add the ability to export resources
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Dylan Reid <dgreid@chromium.org>, Tomasz Figa <tfiga@chromium.org>, Zach Reizner <zachr@chromium.org>, Keiichi Watanabe <keiichiw@chromium.org>, Alexandre Courbot <acourbot@chromium.org>, Alex Lau <alexlau@chromium.org>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>, Pawel Osciak <posciak@chromium.org>, Gurchetan Singh <gurchetansingh@chromium.org>, Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel <qemu-devel@nongnu.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, David Stevens <stevensd@chromium.org>
List-ID: <virtio-comment.lists.oasis-open.org>

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 virtio-gpu.tex | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/virtio-gpu.tex b/virtio-gpu.tex
index af4ca61..e950ad3 100644
--- a/virtio-gpu.tex
+++ b/virtio-gpu.tex
@@ -186,12 +186,16 @@ \subsubsection{Device Operation: Request header}\labe=
l{sec:Device Types / GPU De
         VIRTIO_GPU_CMD_UPDATE_CURSOR =3D 0x0300,
         VIRTIO_GPU_CMD_MOVE_CURSOR,
=20
+        /* misc commands */
+        VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID =3D 0x0400,
+
         /* success responses */
         VIRTIO_GPU_RESP_OK_NODATA =3D 0x1100,
         VIRTIO_GPU_RESP_OK_DISPLAY_INFO,
         VIRTIO_GPU_RESP_OK_CAPSET_INFO,
         VIRTIO_GPU_RESP_OK_CAPSET,
         VIRTIO_GPU_RESP_OK_EDID,
+        VIRTIO_GPU_RESP_OK_RESOURCE_ASSIGN_UUID,
=20
         /* error responses */
         VIRTIO_GPU_RESP_ERR_UNSPEC =3D 0x1200,
@@ -454,6 +458,31 @@ \subsubsection{Device Operation: controlq}\label{sec:D=
evice Types / GPU Device /
 This detaches any backing pages from a resource, to be used in case of
 guest swapping or object destruction.
=20
+\item[VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID] Creates an exported object from
+  a resource. Request data is \field{struct
+    virtio_gpu_resource_assign_uuid}.  Response type is
+  VIRTIO_GPU_RESP_OK_RESOURCE_ASSIGN_UUID, response data is \field{struct
+    virtio_gpu_resp_resource_assign_uuid}.
+
+\begin{lstlisting}
+struct virtio_gpu_resource_assign_uuid {
+        struct virtio_gpu_ctrl_hdr hdr;
+        le32 resource_id;
+        le32 padding;
+};
+
+struct virtio_gpu_resp_resource_assign_uuid {
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
2.25.0.341.g760bfbb309-goog


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

