Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2481FCFFC
	for <virtio-comment@lists.linux.dev>; Thu,  3 Sep 2026 02:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788401726; cv=none; b=dvIRUjzKuPjyLGjU3ZgQgRP7UjDbbDB1ErMyrCjtmLO71Gz47CfpkG0PGbkVG3xzVpcEy0Nv/nSagjZAs+4JzHi05o6QSepJV8DtF+2JCslnfBLQiIPCZ6SYyx8GYmlDDWA7uEFW2g3lDY121ScQk+Bd2UDMnujzub1uIIqECGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788401726; c=relaxed/simple;
	bh=m1gnnQ7ZWyzY7DC4ZUIWLz8aymFvnzNQM2FlMFyoCRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CbTMUsEXD/tK9c4jzelwOe5udxys7CYYxrZL0AJ3LBOB3HlafIqUuQl+410CjCA2ZTzD7AXzZyD1LVwbwTogxTaySZcFy8HW4YJHowybdbXvgeCFsX8PBh7v4YAHDIhzNuDvCYtVRyEeb8vIoWCsxc1Fwc6GuqZKNEJU2JBHO5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com; spf=pass smtp.mailfrom=invisiblethingslab.com; dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b=a89p3snd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QTQLy3gz; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="a89p3snd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QTQLy3gz"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 931427A00D4;
	Wed,  2 Sep 2026 22:15:23 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 02 Sep 2026 22:15:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to; s=fm3; t=1788401723; x=1788488123; bh=gMPhjTbWxihzOumXealr6
	w42UBdn6PpIZmSgV0Mbt44=; b=a89p3sndddrBJcPcKBDRH1OYU8tqgc7yflRZr
	Tcs1CpLauK8yA3N3gIVSzJitcmukcEDmklScjhEKM9KjcEJ7BtHktVf/yOgWzekM
	7pwxKjEMeN+eF69Dh9yjpR6n/D3HPMQK6/6dtK/xB1iWBuDlun4Xy6XE0Tn78Qii
	ZCL2Fupqv7L7hFG1WHjQz9Lwb/AZ+LMVPNh5rZvaImZVZ2UNirrJdOuueXNQPD5j
	alwhV6Xya3ta/xHsZPSK5sDnyZsRUbgzRHxCjyJYpKYvjveqEXWAl6QrYvDmQ3rV
	o1sdjfkGc5baccZ5HzTEIvwsOxvY5kxZKxgzTPediEVAEQyEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1788401723; x=1788488123; bh=g
	MPhjTbWxihzOumXealr6w42UBdn6PpIZmSgV0Mbt44=; b=QTQLy3gzyuxOTxiG/
	2saM/eCxgvQewsiRQ/Tqo43Vbgb8I5fm9U3jjhLn3SLKR7+Sq9bfuRvRLoCmskUS
	0ocfGd+P7z5mN/Jq00ckM2J9vkYsvmgcSEd6B5F1mYHmDTeTkawmlTwfDqoQqOEr
	rOl5Fo9o+dW5uWqrAhgpChDPf5y/BduTQegiTVc5rIlxtkdW54LcmADPmZiRXDKw
	M4c+ilD1sk03lvqbwGdajisn00PyiLgNxq97cbnx7yvdud0doWwUDVki/B0Q4tFR
	XG1V3V/WW9crsDE5DcSlDImip6JoTlrMmjRNdrFqbuBQYPqCS5PAGYWi7ws7YfjC
	RhbIQ==
X-ME-Sender: <xms:O9iYahmHC-LKGZKBzLB-rWySiQu266eq9qmXF17Ar-sALQ_egzfGvA>
    <xme:O9iYapbiIEsYJtFoMZr0SF9ms-ese4lI5QtFAP6t6Za_gDPJrOF25k3kReUGEv3Y8
    SFSB2xjGzrrLaf3KbWKAbjneZrVskiERMdspx0QACvzn4UhNnc>
X-ME-Received: <xmr:O9iYasF2gfLW3wG7sWfBV5lNok4NqBlhdUAsj1ejHBelm8z6UMRWP_ynpeO3CYPS763dKldOFdvbn7P_5vKfsmRd9SUdj7BZb16y0jIsNrKtnHk_5iCOQ8gwI1TlxQ>
X-ME-Proxy-Cause: dmFkZTFDIdnESlmf0YEy/+YSuL4Efsl7esaIC59AltlRyTGB/ehOrbogHpRf14Mb1QI3Gw
    o/kwRIiq/5Wd7hEPyArnKjjakjxxvjfC6F/gLOjSLZeXZNZxLR2ZjIDywKxMO4LhhLLqF+
    V5aMd8rLv66P5t4So0m13VZt03lICWH6FckfbYZRzSWpLer/Vd1yDqhWuDJzMvkC4nq3Qf
    kU7kVcWsSv4VYH5t+ixonsBtTEgHBd+JdH8dMI9aQdhxlZt6TOJY/xwCinO8UuvVpi00Es
    FSLh97xDPxBsP88kwm1UjK2m35NCtuvM9PhoogA74/rpuwgwFxTatW6GeXBfigP8WjgvDv
    pVUsT1Bvew6Aa0o2wMf2EfV7X4Vnq+hSN27LU7u1hpG7zeYOPazAQ2WWlbQTH/O/OKhWW4
    CiMZs0VGmHuYuPw+y/MmCOKBo+zUH4BLQOjDFJy4aMfojQ4lkRqdTQk3qmIx/ykYx9JwyP
    Nv4jkBQI/OdO97Q8ix9vkpFGCONs80Zfhr0ctI+/u8EtWk3Oz2QF0H/K2DsKL2ROkWGkj2
    1OZxLEXbw0IN5m6V3J2cu+Lomq8sZqZ8S+bEnU5FygMcamuK/si9WTxKa4d4LViorC+E3y
    noQY9gth/rFpeQiGyz0vvcBsezzkDQOJK3dJYbF8hoVSQ+kdGr9uyzauExIg
X-ME-Proxy: <xmx:O9iYaob3MZqzGWVI44rlcStXOz92IgSH-2e8Fm9C-e5MvtJCic1Mmg>
    <xmx:O9iYagygTkuBg1CIbwkoZpsGW9lc7TG_HYYBCCjYFHmGcjV-_NgYYQ>
    <xmx:O9iYaqRkV4Bjt5trYxW3PgXaREUJyW74mawXeInM5blxKxRuQs8z3w>
    <xmx:O9iYatKakbzj3kGVUDFQ4iIFRBFebFvXSicaPX1bgTvuNdeyAFtk5w>
    <xmx:O9iYakN-OPLwdpPrL-o46fQaT6rfhlCMrYSsV8Gx5RiicA83JXV6oegm>
Feedback-ID: i001e48d0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Sep 2026 22:15:21 -0400 (EDT)
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
Subject: [PATCH v2 2/2] virtio-gpu: add flag to negotiate always passing ctx_id to RESOURCE_CREATE_BLOB
Date: Wed,  2 Sep 2026 23:14:36 -0300
Message-ID: <20260903021442.423274-3-val@invisiblethingslab.com>
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

virtio-gpu device backends typically use ctx_id to route commands to
different modules that implement distinct context types, e.g.
virglrenderer vs. cross-domain. Each module may require the blob
resources intented to use with it to be allocated through it as well.

Currently, this happens for host-only and default blobs which are
allocated from a context-specific local blob_id (e.g. an image
requirements blob in cross-domain). For guest-only resources however,
existing software (both the Linux kernel and the rutabaga-gfx library
used by device backends to implement virtio-gpu) allocates those with
ctx_id == 0, which might be a different "default" context type from the
one the resource is intended to be used with, e.g. when both
virglrenderer and cross-domain are present, the socket buffers used by
cross-domain were processed by virglrenderer which happens to work
but does not actually make sense.

Additionally we would like to support PRIME imported resources (udmabufs
or dGPU passthrough dma-bufs) being passed over cross-domain with the
CREATE_GUEST_HANDLE feature, which due to API constraints must also
perform the creation of a guest-only blob resource with ctx_id but
without blob_id.

Unfortunately changing this without breaking backwards compatibility
requires a flag to negotiate the use of the "fixed" convention. Otherwise
new guest kernel + old rutabaga would result in the command failing due
to old rutabaga not expecting guest resources to be allocated w/ ctx_id.

Signed-off-by: Val Packett <val@invisiblethingslab.com>
---
 device-types/gpu/description.tex | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/device-types/gpu/description.tex b/device-types/gpu/description.tex
index 64e8c4ddecc5..c0ff3f34ec1c 100644
--- a/device-types/gpu/description.tex
+++ b/device-types/gpu/description.tex
@@ -42,6 +42,9 @@ \subsection{Feature bits}\label{sec:Device Types / GPU Device / Feature bits}
 \item[VIRTIO_GPU_F_CREATE_GUEST_HANDLE (6)] guest-only blob resources
   may be created with the VIRTIO_GPU_BLOB_FLAG_CREATE_GUEST_HANDLE flag.
   Requires VIRTIO_GPU_F_RESOURCE_BLOB.
+\item[VIRTIO_GPU_F_BLOB_CTX_ID_FIX (7)] it is always safe to pass the
+  current context ID to VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB,
+  including for guest-only blobs.
 \end{description}
 
 \subsection{Device configuration layout}\label{sec:Device Types / GPU Device / Device configuration layout}
@@ -673,6 +676,12 @@ \subsubsection{Device Operation: controlq}\label{sec:Device Types / GPU Device /
 identified by the \field{blob_id}. The actual allocation is done via
 VIRTIO_GPU_CMD_SUBMIT_3D.
 
+If VIRTIO_GPU_F_BLOB_CTX_ID_FIX has been negotiated, the \field{ctx_id} of
+the \field{hdr} MUST always be filled in with the ID of the default rendering
+context associated with the current handle, if one exists. Otherwise, it MUST
+only be filled when the \field{blob_id} has been filled to create a resource
+from a rendering context local object.
+
 The driver MUST inform the device if the blob resource is used for
 memory access, sharing between driver instances and/or sharing with
 other devices. This is done via the \field{blob_flags} field.
-- 
2.55.0

