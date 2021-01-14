Return-Path: virtio-comment-return-1640-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2FD949864DD
	for <virtio-comment@lists.oasis-open.org>; Thu, 14 Jan 2021 21:21:12 +0000 (UTC)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Date: Thu, 14 Jan 2021 21:20:59 +0000
Message-Id: <20210114212059.3822-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH] virtio-gpu.tex: fix some UTF-8 damage
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
List-ID: <virtio-comment.lists.oasis-open.org>

While building I got a warning about:

  ! Package utf8x Error: MalformedUTF-8sequence.

Fixes: 87fa6b5 ("virtio-gpu: add support for mapping/unmapping blob resourc=
es")
Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
---
 virtio-gpu.tex | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/virtio-gpu.tex b/virtio-gpu.tex
index 8225db6..a6afeda 100644
--- a/virtio-gpu.tex
+++ b/virtio-gpu.tex
@@ -660,11 +660,11 @@ \subsubsection{Device Operation: controlq (3d)}\label=
{sec:Device Types / GPU Dev
         le64 offset;
 };
=20
-#define VIRTIO_GPU_MAP_CACHE_MASK =C2=A0 =C2=A0 =C2=A00x0f
+#define VIRTIO_GPU_MAP_CACHE_MASK      0x0f
 #define VIRTIO_GPU_MAP_CACHE_NONE      0x00
-#define VIRTIO_GPU_MAP_CACHE_CACHED =C2=A0 =C2=A00x01
-#define VIRTIO_GPU_MAP_CACHE_UNCACHED =C2=A00x02
-#define VIRTIO_GPU_MAP_CACHE_WC =C2=A0 =C2=A0 =C2=A0 =C2=A00x03
+#define VIRTIO_GPU_MAP_CACHE_CACHED    0x01
+#define VIRTIO_GPU_MAP_CACHE_UNCACHED  0x02
+#define VIRTIO_GPU_MAP_CACHE_WC        0x03
 struct virtio_gpu_resp_map_info {
         struct virtio_gpu_ctrl_hdr hdr;
         u32 map_info;
--=20
2.20.1


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

