Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1084633F8A3
	for <virtio-comment@lists.linux.dev>; Thu,  3 Sep 2026 02:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788401725; cv=none; b=LDO+24rVRqgyp8QYyAYqPQ0G4Mp2BA6soaRezvxh4nzOCVnnCof5o5+WrRdbpMtwAu4iN5JaesJ9OKUVb2Oz7L7qoBdxPdxgBWv8GU0+YckPk2DaE72C0xlP7goL15pYJ2hYwnDW8r2mhDjPxVZfCpB26ZIh11hASP9tb3Qt/z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788401725; c=relaxed/simple;
	bh=y6i8zMANcvFgkLvZpLasCPkfx2fMZi2PFUKCxxOB+bI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WZSds1nbf+Bh7ClrH5ot0wP5GutoWsHS03GAtJu6O3J0UvpzhanAE/bgNjgZn2sG9hWIonLljFlaufLuq+tIbD5jIJpVxRw9AXl1MGqgTpFLlez77+uEwqHp1gphECpAv4RKXI2lyV4Zsji9COPDDrOcdMAb3kbaMMY/aRkCzds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com; spf=pass smtp.mailfrom=invisiblethingslab.com; dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b=nittapKs; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Jxf0+cCl; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="nittapKs";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Jxf0+cCl"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 9812C1D000CC;
	Wed,  2 Sep 2026 22:15:20 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 02 Sep 2026 22:15:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to; s=fm3; t=1788401720; x=1788488120; bh=y/f0SuYP2jYutmlBI7jFt
	VjJx5W4l3Vj9oInEjPYNM4=; b=nittapKs+HMDzjDWpH7SHoIxI21qc4L2RbGAC
	R4kDhXNE1NOJclvyY3rNrlB+cTfvkTDmJOMp13B4eLnjLlvLawdNkm1/mTTO8xcQ
	iUBvcp1YlqNgm3o5wm6R/ctJINxHN5lu41PHvb4BCk+thGYUtnSNapN2nCc9ej85
	sr0IbgKbi6XwyLBReYFLx3Wp7E+gAoD3uSTPwKR81T9IZ4QgSruG/0T4QyL+/eGD
	B9+0VVzQF6oHlhAXXAz1Z/rBW0OTirOdCQkrN2N8+M5qqaCabShDc69bgP8WhM+H
	ZOGqk5kVOLCQVOEYrWGez/cV4Sg8aOsOUNpNNg+LyKDFNqeeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1788401720; x=1788488120; bh=y
	/f0SuYP2jYutmlBI7jFtVjJx5W4l3Vj9oInEjPYNM4=; b=Jxf0+cCl1xlCfnb3u
	3KeNhXFvqv7MJ9/CDUBTWV00ysByohfksvG1PpjLZQ8GKTLLM8i6DNGyNtiQj/xV
	/rE6C0X3dhCbCZBhYCQAt25d0QyiypqjTt+hRCx8hsczAuR2HxJ0T7mCsIY9BCRh
	LFtbGHaQWWaC4uRlJCER5spK+LDHBVyygtcDNP34Bjt0BtUarTOvm7ymoS+xMAm+
	1GGq2JVH0QP2jgdwUgP/5LU+vCR6dSJm8Yc9Xju24AFi3QNJcF5NTSvVFN1GQ1CM
	yeZFKGEhkj2BX5IHF4x3tauuogTkZx/DY0PZN+7LYEjPGkyiNyBP2uPVFB2iFdwr
	kmA0A==
X-ME-Sender: <xms:ONiYasxt0I2IaP2F7pJlsvSGMVQTe6w6VngQKN5cDPcqYInuF4PSyg>
    <xme:ONiYas3uPzz-ATU30P323vIHWbBZ8d1C3ByJ_uOatZ_KG8ODuFJU-UGw8XfKF3bpm
    UW1H0kSq94EBcGsVXJS92CtMgo23He5qf_8kdWASOQ-DW8uFqs>
X-ME-Received: <xmr:ONiYaiwUZ3Z61MdX_QGpc7sUWvHbhLgmoo_pLqEF2i7mGoT95bXPjcrv5gXDw5HVFmvzAsI46Z9507Fkk3DomGcPzfrQxGG3H2-EiRGhrT_wfGDGfTghW8yyvU1wxA>
X-ME-Proxy-Cause: dmFkZTEGB8+JyXK0vzlHP8aEK462UogXP6Vn7le7A57K9K4ROq/3mgKsD/tGZeae6DSSQD
    nef273JFF9nU4COX4ac2uNboThr2O5835ArwRb9669zCFmZcYNvCwebwjEhS//KuGH0MeG
    Bk2fuPHWnEZamUMU5NOcLttVkQkFChfJG2ldEmyqhH3nxtompCDiz6NurVGS/DfhvP0S6e
    4DmaGm/DXAE9U5Jx/vcatPC3RwpbNd8T0Wy+GLFwNN25+ID1MsJDaQLX9b5FEjp/CAP09w
    +jGRzJN20aOY+u3VfUvcBaVsaueKOCJDpc/ZU/AaiQP8kq3+6b+mW+QAp8txO/Uj1QntNK
    LtwQr6Zinchn3N/Hv2umDlffmO1JeJbjG0uoK+13f+AYTZeTBDuecfgr2MuiLrMOEVuDIe
    sQ7DxuimyHfnkNdUmqxEgsFC40Z93+VM+MYq5YgkycXOjKarM7B4brnXWTXI+R3KEFOto6
    jNNC6yiW0+ndINrvKs+zkO061g6BEeW9MgFfnz7GokeZfdO9v4YUSl3vC558xrQqvFp76s
    0PN5NVT29EJkEUhX13GFj4DJx35qsou+Zh8Lqoxt9iJOt4T3cV7ZX302ydRBUeMNL3seJl
    hkHIwB/5qy69ByC8D2iryZOA30LgSDMxlHmVdo+q0bwwrv3C4loZajQnF0Sg
X-ME-Proxy: <xmx:ONiYahUgCPfxgWRsTtYdBBbLMvubMBmtqQ0jtfc5afPq7Umi7Hzr3w>
    <xmx:ONiYau9ewqA0yFNHYT8vM8LEco23KynAzd4CWY81rwKqY2IocmGoqA>
    <xmx:ONiYakudY7M8aKuuNQSFb8iVAY8cA28cH4RhsIifR6FnQGdvZrYJkA>
    <xmx:ONiYau3Dn3_y8rElo3AMyg78Z9-NTFGe5BgdIG30BftAZHs7AzgV4A>
    <xmx:ONiYamb_tW2FqVCP7O-PIDCLSU05LJlOw83Ph9zaWHCNmIZK6Lgw_K6Q>
Feedback-ID: i001e48d0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Sep 2026 22:15:18 -0400 (EDT)
From: Val Packett <val@invisiblethingslab.com>
To: virtio-comment@lists.linux.dev
Cc: Val Packett <val@invisiblethingslab.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Sergio Lopez <slp@redhat.com>,
	Parav Pandit <parav@nvidia.com>,
	dmitry.osipenko@collabora.com,
	mst@redhat.com,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Alyssa Ross <hi@alyssa.is>,
	Demi Marie Obenour <demiobenour@gmail.com>
Subject: [PATCH v2 1/2] virtio-gpu: support requesting host handles for guest-only blob resources
Date: Wed,  2 Sep 2026 23:14:35 -0300
Message-ID: <20260903021442.423274-2-val@invisiblethingslab.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903021442.423274-1-val@invisiblethingslab.com>
References: <20260903021442.423274-1-val@invisiblethingslab.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

So far, desktop integration over VIRTIO_GPU_CAPSET_CROSS_DOMAIN has
relied on host-only blob resources, which are always backed by a
shareable object on the host side (such as a memfd or a DMA-BUF).

However, to access such resources the guest needs to use the
VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB command which is currently only
available when a VIRTIO_GPU_SHM_ID_HOST_VISIBLE shared memory region
exists, which is not possible in all environments (e.g. the memory
sharing model of the Xen hypervisor does not make it possible).

Also, this necessarily introduces copying for software-rendered client
buffers. The Wayland protocol makes clients responsible for allocating
their SHM buffer pools, which are ordinary guest kernel shared temporary
file objects (memfds). The only way to bridge those and host-only buffers
is a copy on every content update.

Host-only resources with the HOST_VISIBLE region were picked as the
default solution because it's easy to implement with KVM. However with
the introduction of the udmabuf driver, it also became possible to create
shareable handles (namely DMA-BUFs) for specific subranges of various
memfd objects (which can be the backing objects for a KVM guest's RAM).
And on the Xen side, gntdev-dmabuf provides a similar operation for
Xen grant references. With these capabilities, it should be possible
to use guest-only blob resources as well!

The udmabuf driver can also be used in the guest to complete the Wayland
SHM zero-copy fast path. A memfd allocated by an ordinary client,
completely unaware of virtualization, can be turned into a DMA-BUF (as
long as some conditions hold) which can be imported into the virtio-gpu
device. This new flag, VIRTIO_GPU_BLOB_FLAG_CREATE_GUEST_HANDLE,
indicates to the host that the provided memory range entries should be
used to construct a corresponding DMA-BUF on the host side as well,
so that this resource can then be sent over to the host Wayland
compositor using the cross-domain context's send command.

Signed-off-by: Val Packett <val@invisiblethingslab.com>
---
 device-types/gpu/description.tex | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/device-types/gpu/description.tex b/device-types/gpu/description.tex
index ac3b427725f6..64e8c4ddecc5 100644
--- a/device-types/gpu/description.tex
+++ b/device-types/gpu/description.tex
@@ -39,6 +39,9 @@ \subsection{Feature bits}\label{sec:Device Types / GPU Device / Feature bits}
   synchronization timelines supported.  Requires VIRTIO_GPU_F_VIRGL.
 \item[VIRTIO_GPU_F_BLOB_ALIGNMENT (5)] configuration field
   \field{blob_alignment} is valid. Requires VIRTIO_GPU_F_RESOURCE_BLOB.
+\item[VIRTIO_GPU_F_CREATE_GUEST_HANDLE (6)] guest-only blob resources
+  may be created with the VIRTIO_GPU_BLOB_FLAG_CREATE_GUEST_HANDLE flag.
+  Requires VIRTIO_GPU_F_RESOURCE_BLOB.
 \end{description}
 
 \subsection{Device configuration layout}\label{sec:Device Types / GPU Device / Device configuration layout}
@@ -621,9 +624,10 @@ \subsubsection{Device Operation: controlq}\label{sec:Device Types / GPU Device /
 #define VIRTIO_GPU_BLOB_MEM_HOST3D            0x0002
 #define VIRTIO_GPU_BLOB_MEM_HOST3D_GUEST      0x0003
 
-#define VIRTIO_GPU_BLOB_FLAG_USE_MAPPABLE     0x0001
-#define VIRTIO_GPU_BLOB_FLAG_USE_SHAREABLE    0x0002
-#define VIRTIO_GPU_BLOB_FLAG_USE_CROSS_DEVICE 0x0004
+#define VIRTIO_GPU_BLOB_FLAG_USE_MAPPABLE        0x0001
+#define VIRTIO_GPU_BLOB_FLAG_USE_SHAREABLE       0x0002
+#define VIRTIO_GPU_BLOB_FLAG_USE_CROSS_DEVICE    0x0004
+#define VIRTIO_GPU_BLOB_FLAG_CREATE_GUEST_HANDLE 0x0008
 
 struct virtio_gpu_resource_create_blob {
        struct virtio_gpu_ctrl_hdr hdr;
@@ -673,6 +677,12 @@ \subsubsection{Device Operation: controlq}\label{sec:Device Types / GPU Device /
 memory access, sharing between driver instances and/or sharing with
 other devices. This is done via the \field{blob_flags} field.
 
+If VIRTIO_GPU_F_CREATE_GUEST_HANDLE has been negotiated, the
+VIRTIO_GPU_BLOB_FLAG_CREATE_GUEST_HANDLE flag may be used to request the
+creation of a shareable host kernel handle for a guest-only blob resource.
+Guest-only resources using this flag MAY be created from the rendering context
+local object identified by the \field{blob_id}.
+
 If VIRTIO_GPU_F_VIRGL is set, both VIRTIO_GPU_CMD_TRANSFER_TO_HOST_3D
 and VIRTIO_GPU_CMD_TRANSFER_FROM_HOST_3D may be used to update the
 resource. There is no restriction on the image/buffer view the driver
-- 
2.55.0

