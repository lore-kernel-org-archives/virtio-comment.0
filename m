Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632A6126F1A
	for <virtio-comment@lists.linux.dev>; Fri, 19 Jul 2024 12:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721390838; cv=none; b=IqTUNDUokaUtRUSzG02wX2YUct6WAE9bBOWjWxqRp9VXF/pm89XAX+mZRHmgD+q+qJmYGabpzOOBP1r3Hlms2gVRiTW2Ndp3ydqkecTvw6btCCrTodKG8jWbfu71vjW5OFfEeRPfnzxISK6odnMIniMJJMSyzJ4ClKadF7bnucQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721390838; c=relaxed/simple;
	bh=phyVUNQbZOup68jtSfREmnc6EnIfy8rRQ5/OPbx4UN8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PaXM/tAGywPgY0euJhGBrOCuPMXcHxkfjbb3c0bN1yKUXO1VSiSgI2S/y3NKkxEbAyAS2vHYWUo3N2NATO6b9DAmO33ndGOPCnS8driDFDp845/gndcsrAkdiT3l/su2ZoHnXmKZL9w//H1BrVAxe6NTGEs8ULqw2aCR6amsODs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qW+lF7Fo; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qW+lF7Fo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721390835;
	bh=phyVUNQbZOup68jtSfREmnc6EnIfy8rRQ5/OPbx4UN8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qW+lF7FohrST9T4pGITRLYvb2nd4hk0PfgRAbVoWTikdNq6bQCRqHo5wJeSSiMCy2
	 PnTppXCUc1U58tH2YXAmZEamnnxTx3bt16qxjWAFHAdre579CkDHtpVYfRLFj5jOyN
	 UcwMt+63z7mKae74QpvQjpMR3bSvALORUjCLs88OjNvU5IGzwfN3lfYvGych4fdrsT
	 P/7xcF1i2+z0ZOn7moxyxVAqH+MoDMSriKMENop5FNPhehOxbsW2RyBsbIAZyOws/B
	 uzv3W48eLjeRpIO47SF2/wifS8ijNP7ze+8ZQECYuHCeDxa+0PbjAUzKedrCDXlyEe
	 +jpIN8x8rr1IQ==
Received: from workpc.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dmitry.osipenko)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id CBAA4378215E;
	Fri, 19 Jul 2024 12:07:14 +0000 (UTC)
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Gerd Hoffmann <kraxel@redhat.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Huang Rui <ray.huang@amd.com>,
	Sergio Lopez <slp@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	virtio-comment@lists.linux.dev,
	"Michael S . Tsirkin" <mst@redhat.com>
Subject: [PATCH v3 1/3] virtio-gpu: Rename GFXSTREAM context capset to GFXSTREAM_VULKAN
Date: Fri, 19 Jul 2024 15:06:35 +0300
Message-ID: <20240719120638.196052-2-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240719120638.196052-1-dmitry.osipenko@collabora.com>
References: <20240719120638.196052-1-dmitry.osipenko@collabora.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Initially, the plan was to use a single GFXSTREAM context for all of
GLES/GL/VK gfxstream sub-contexts. Over time the plan changed and
GFXSTREAM context became used exclusively for Vulkan, while GLES/GL
contexts were moved to a new own experimental virtio-gpu contexts.
Rename GFXSTREAM capset to GFXSTREAM_VULKAN.

Acked-by: Huang Rui <ray.huang@amd.com>
Link: https://lore.kernel.org/dri-devel/CAAfnVB=Mki1zEyjByJ_7tRrib74E4KSbjezqQcb_Uia8EQEXHw@mail.gmail.com/
Link: https://chromium.googlesource.com/chromiumos/platform/crosvm/+/e4c1878733937042111fca58899a3a94002bfef0
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 device-types/gpu/description.tex | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/device-types/gpu/description.tex b/device-types/gpu/description.tex
index 443524851a05..4b8dd7733c31 100644
--- a/device-types/gpu/description.tex
+++ b/device-types/gpu/description.tex
@@ -530,8 +530,8 @@ \subsubsection{Device Operation: controlq}\label{sec:Device Types / GPU Device /
 	the first edition of Virgl (Gallium OpenGL) protocol.
   \item \href{https://gitlab.freedesktop.org/virgl/virglrenderer/-/blob/master/src/virgl_hw.h#L550}{VIRTIO_GPU_CAPSET_VIRGL2} --
 	the second edition of Virgl (Gallium OpenGL) protocol after the capset fix.
-  \item \href{https://android.googlesource.com/device/generic/vulkan-cereal/+/refs/heads/master/protocols/}{VIRTIO_GPU_CAPSET_GFXSTREAM} --
-	gfxtream's (mostly) autogenerated GLES and Vulkan streaming protocols.
+  \item \href{https://android.googlesource.com/device/generic/vulkan-cereal/+/refs/heads/android13-release/protocols/vulkan/}{VIRTIO_GPU_CAPSET_GFXSTREAM_VULKAN} --
+	gfxtream's (mostly) autogenerated Vulkan streaming protocol.
   \item \href{https://gitlab.freedesktop.org/olv/venus-protocol}{VIRTIO_GPU_CAPSET_VENUS} --
 	Mesa's (mostly) autogenerated Vulkan protocol.
   \item \href{https://chromium.googlesource.com/chromiumos/platform/crosvm/+/refs/heads/main/rutabaga_gfx/src/cross_domain/cross_domain_protocol.rs}{VIRTIO_GPU_CAPSET_CROSS_DOMAIN} --
@@ -547,7 +547,7 @@ \subsubsection{Device Operation: controlq}\label{sec:Device Types / GPU Device /
 
 #define VIRTIO_GPU_CAPSET_VIRGL 1
 #define VIRTIO_GPU_CAPSET_VIRGL2 2
-#define VIRTIO_GPU_CAPSET_GFXSTREAM 3
+#define VIRTIO_GPU_CAPSET_GFXSTREAM_VULKAN 3
 #define VIRTIO_GPU_CAPSET_VENUS 4
 #define VIRTIO_GPU_CAPSET_CROSS_DOMAIN 5
 struct virtio_gpu_resp_capset_info {
-- 
2.45.2

