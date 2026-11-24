Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795555217;
	b=ly6GbCI233xrAoYvkKWQV+vePb6DHWqxCcq+Vobe+ddecyu6eihvmw1YRRTsVBm8/qzp
	 9DkwVlavH2YgA+jM39zJVNZr5YbtjAMNj6I1mCIXRWpo6eatux0hS1n76pdDhlsKwAJ+/
	 EzdMraZhk2+znWD3lSU/dcubqfZdI6tBhFZcP4Jp4I3r0gA30r+DXwrwYi6P9mGB5p7KZ
	 93CE475TnsLmNPvmTpOlaBXrRi8w/CWHBhWViTuJ1dplM5PIZZjBjbpDHgv4qMqHQojcA
	 fmzXO7D7Xgp3hmmGeSa9d5BjAC176s/6mASahPiQOimD3YMYYHCjT3iDYiL7AFAoRWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795555217;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=sLY3vcxuuWGV9x9ADqa1fI03EnC0bInAJ3LK4l04pyI=;
	b=b99x2PoUHi5gQMmpV0OlaXVc/iWiKreEgp/RHNtVrFSwBn72j8manZl1BLvM31a1npx8
	 RV1rYhAltDA1W5NFM6oUGU/zteOuDw+buDQ5rOYNrMwIVE2EFpiEzS3GCHoedpV5T8n6o
	 DUlc4FOLkpZ+4XAP07KMdc9qgBp5PLtfoq9e6XyrlZzlheS075xgKA2DJi0f3VEd0a2o+
	 +3GSVkeauM/y2xeUn7BMWQVDlAXzIdcvkLKqY67d0URBdswrXBICeytla7njxrArUK+YG
	 PzaLd9xD1h9N8hKvTGkc0/XmP92u4gIapyJOZeQXmJtWPArmp81dMztnBXYZsxECBZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=invisiblethingslab.com;
	spf=pass smtp.mailfrom=invisiblethingslab.com;
	dkim=pass header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.a=rsa-sha256 header.s=fm3 header.b=P+w6EV+q;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=QDlHSoya;
	arc=none smtp.remote-ip=202.12.124.158
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1605606A330
	for <virtio-comment@lists.linux.dev>; Tue, 24 Nov 2026 21:20:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1605606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.a=rsa-sha256 header.s=fm3 header.b=P+w6EV+q;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=QDlHSoya
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 049C87A05B7
	for <virtio-comment@lists.linux.dev>; Tue, 24 Nov 2026 16:20:14 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 24 Nov 2026 16:20:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to; s=fm3; t=1795555214; x=1795641614; bh=sLY3vcxuuWGV9x9ADqa1f
	I03EnC0bInAJ3LK4l04pyI=; b=P+w6EV+qm6M+Gk8B7WC6WuDqADkNuO8rSiwSl
	nY0PH22e4xP1/AQTIsqqeJZzQNd7sww2HwH1Ol4mQiqJsYUk78Cm/ZZ4J/JB6mNU
	fIvLmPBvvyo4P0tJmibfB5YG6w7Xz3hpWq0EC+lXUp1z8Q4XcnUNcM+K0h2D9Vme
	OTyqaQ1faCOfmEOAGOJl3kkspG36PftBWY6JRDouR8J5o05RpnFRBybjAzRbAlB3
	Wr79rvHl1+9xvH4hjEVCtIPduU8HNMlkgKawhFoRsh3/3+ly7ZlFgXh37ID/vner
	CBWJq8VLmPJ+7lepclcCORep60ANF9FfMx8wNGIXTaEFaPvRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1795555214; x=1795641614; bh=s
	LY3vcxuuWGV9x9ADqa1fI03EnC0bInAJ3LK4l04pyI=; b=QDlHSoyaNPmZ4UEDt
	L+/9cFLSigeuIJ6qOqxfgG6nKK6mwjhB+C4rLGs23ZiwL8hst7BJwBS//E6jL7fq
	zl+1jmg5W0+zaeTKT5mdu5uUjCEKsxDTvKzZtXFSZzQXdyjAUszQx1rQ0bC2IHzT
	/JhQaZJabIpvLYPn8OiWnZM4TXjSTz46MS8NFjYh1UkfafdsFYgJkmvSTld+8MEi
	xwSrzr2hfDHRj4EBUPgcPCOU93pWQ1Ko22n6XMTJp+VAkqF6b29VdjqQQTZCwFBG
	09cWRYM3lgqhpG/Jcrez6HkARZkXxVXd7HkAccVqVrAzaseZUWPUgj2XlXTXu9DB
	MdRUA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=invisiblethingslab.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795555214; d=invisiblethingslab.com;
	mf=PHZhbEBpbnZpc2libGV0aGluZ3NsYWIuY29tPg==;
	rt=PHZpcnRpby1jb21tZW50QGxpc3RzLmxpbnV4LmRldj4=;
	s=fm3:rsa-sha256:cBgkruDZgqqXOH2nHZnCfqrP0hUN7J3v2ueW1srGv1DLUl8
	Yk3C6CLPkWALNLcrZg7YjZydOk1TCyQdQDQhphPN9B98DS7jGihrdKyVFaRKm34Z
	dMhiHymbWDHcVsERG8KHXZWz+UXIHwzPb+FOhlzOmx4zyGnnFsz5wxMW4tsLHldR
	fj5x/9dj4VkTJXHSC8p8oIjUFQrwnKakM+lj+ffDTP3vRO9tA93b8n3nHFJ0Y3L/
	ZFAnJYTk4proqeEIjtFdSuLaLobtQS5IrFH9REZt9DNpLJWoOQHKkV05IwtMpapZ
	CeeZm20jWsg6Cs9UDA2FJcv7IOsx3xetzcom/XQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:EpAOAWoHMXY/tpU1bedTAr7KSSp8WXZIPSnlMYfhmBM=:LohcoIv6HWeZcDqtntBytcApPnPIieCzSV6E3YqxxKc=;
X-ME-Sender: <xms:jv8FawlmI6yG68exXZppGdICXHiA9NBeY2m4QR572EOzDxu1QdAdFg>
    <xme:jv8Fa8Zu1m6Nv-0_iv8QgWXw1GHOL9nML6goEd1CqWoaevV3jN31p6qYlmZVxczUj
    wZMgeyvSIm5tUrjb7KVqRsUzU09Sj_YGmFmRlob4Zvib9OTvWXf>
X-ME-Received: <xmr:jv8FazFHAR9aoo4gibdyN5JXujEgqZx4VkyLBACGBei0Svk5MH6z9UjN6AF9gRfr8pV-xUwBD51oYfDqXz_LbJ-7NikES_QdSWG1wjLl8n0HwOePcV4OsgkJS3VGWg>
X-ME-Proxy-Cause: dmFkZTEOf8vigISVsJJ+DPsx1US06fRmkyOMAtEAXe7lEVhga4vk7kREzDjulT/2IwRTGs
    l8086vNDsb6HiKR9rB/43bM8wEeSj+/mtkBySFKDRfHUvPT/qOY1NzCsOa1xoinpRETbF+
    sBCyxZvdYnlzGxmjblXA7NZKrVeLzm55IrkMMGb/Dbj6dZT632rjUb4Nknh4dt7J1obW6Y
    vzsJkPNhTowUA7zXMwVsjuoyUQqTmFSvYZPQJHKqJ1mJPDL+rw7OhU50u+bhv0rgu5q2Rk
    CvxBFGpzrudbozrV0mT106wrMVgQlPWijUJSaMvuJBfmKN3u9N6OyDE+RIx0Xe5aTc9Ua/
    Q0E1Qtj3Q+rTytJ0fRRquJ2KiDUVWR4rd+Co7y1xHoj3HKtEVMexaIJPdXxUU+Z5OslLKQ
    GX5qO/vkIy/Tb25oK/sky/XQ6bklQdUhmfehDlCaczzk6QgIGQ5/30bNhaon8LADZm5a9K
    42jTo3p3N0X2QY7NfYAzjGoQWlc68VvBrmx3xj8qnqjwKI/Kj95r0mbyQ9iJzGq6t9945V
    +OOPeOiLbF6qPqOQ4zty3jnQ/HwRcfOAGg+Hexo2ZX27HuIFD0rOZz5aLhkl+g4obc5B41
    sSZBceQnarnv8dk+6I+IFMNe7DuMVS+03mLZ4Cs9+J6uaRrGO1tsqgCv5geg
X-ME-Proxy: <xmx:jv8FazZXIqkLmkvKPgUIIEts6n7iSWujdgPWsFXWsuIopanPMC4TPg>
    <xmx:jv8Fa_x933OLUIq-2KjXE5g2vPmRA_FzDbRPSnO7rShQ4d_E63C8aA>
    <xmx:jv8Fa9SDq6ZMZTCIgCO_ExOGeegVvQOfQmw5eMFqwp4hXRNDRnL8Hg>
    <xmx:jv8Fa0ICqAKSo__RPqW0mOA3hLd2unJLy9F1HT0xB9bpcspPjcjdpg>
    <xmx:jv8Fa2NSw4_YdLPxpf7So4Rt1CQyuh23Z49oFZaxo-n7lXN_5Ze6ruji>
Feedback-ID: i001e48d0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Nov 2026 16:20:12 -0500 (EST)
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
Subject: [PATCH v3 3/3] virtio-gpu: introduce BLOB_GUEST_SHAREABLE feature
Date: Tue, 24 Nov 2026 18:19:29 -0300
Message-ID: <20261124211931.809982-4-val@invisiblethingslab.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261124211931.809982-1-val@invisiblethingslab.com>
References: <20261124211931.809982-1-val@invisiblethingslab.com>
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

So far, desktop integration over VIRTIO_GPU_CAPSET_CROSS_DOMAIN has
relied on host-only blob resources, which are always backed by a
shareable object on the host side (such as a memfd or a DMA-BUF).

However, to access such resources the guest needs to use the
VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB command which is currently only
available when a VIRTIO_GPU_SHM_ID_HOST_VISIBLE shared memory region
exists, which is not possible in all environments (e.g. under Xen).

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
to use guest-only blob resources as well.

The udmabuf driver can also be used in the guest to complete the Wayland
SHM zero-copy fast path. A memfd allocated by an ordinary client,
completely unaware of virtualization, can be turned into a DMA-BUF (as
long as some conditions hold) which can be imported into the virtio-gpu
device. With the new feature VIRTIO_GPU_F_BLOB_GUEST_SHAREABLE, it is
possible to use the VIRTIO_GPU_BLOB_FLAG_USE_SHAREABLE flag (previously
only available for host-only resources) to indicate to the host that the
resource should be shareable between contexts (therefore, importable
into the cross-domain context). In practice that would imply that the
provided memory range entries would be used to construct a corresponding
DMA-BUF on the host side, which the cross-domain context would send over
to the host Wayland compositor.

Such resources can also be used for scanout, e.g. when a guest
compositor wants to directly scan out a full-screen
software-rendered application.

Signed-off-by: Val Packett <val@invisiblethingslab.com>
---
 device-types/gpu/description.tex | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/device-types/gpu/description.tex b/device-types/gpu/description.tex
index 63e600bd04e8..9c1ccd854f6a 100644
--- a/device-types/gpu/description.tex
+++ b/device-types/gpu/description.tex
@@ -41,7 +41,10 @@ \subsection{Feature bits}\label{sec:Device Types / GPU Device / Feature bits}
   \field{blob_alignment} is valid. Requires VIRTIO_GPU_F_RESOURCE_BLOB.
 \item[VIRTIO_GPU_F_BLOB_CTX_ID_FIX (6)] it is always safe to pass the
   current context ID to VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB,
-  including for guest-only blobs.
+  including for guest-only blobs. Requires VIRTIO_GPU_F_RESOURCE_BLOB.
+\item[VIRTIO_GPU_F_BLOB_GUEST_SHAREABLE (7)] guest-only blob resources
+  may be created with the VIRTIO_GPU_BLOB_FLAG_USE_SHAREABLE flag.
+  Requires VIRTIO_GPU_F_BLOB_CTX_ID_FIX.
 \end{description}
 
 \subsection{Device configuration layout}\label{sec:Device Types / GPU Device / Device configuration layout}
@@ -672,6 +675,10 @@ \subsubsection{Device Operation: controlq}\label{sec:Device Types / GPU Device /
 identified by the \field{blob_id}. The actual allocation is done via
 VIRTIO_GPU_CMD_SUBMIT_3D.
 
+If VIRTIO_GPU_F_BLOB_GUEST_SHAREABLE has been negotiated, guest-only
+(VIRTIO_GPU_BLOB_MEM_GUEST) resources MAY also be created from the
+context local object identified by the \field{blob_id}.
+
 If VIRTIO_GPU_F_BLOB_CTX_ID_FIX has been negotiated, the \field{ctx_id} of
 the \field{hdr} MUST always be filled in with the ID of the default context
 associated with the current handle, if one exists. Otherwise, it MUST only
@@ -690,7 +697,8 @@ \subsubsection{Device Operation: controlq}\label{sec:Device Types / GPU Device /
   \item VIRTIO_GPU_BLOB_FLAG_USE_SHAREABLE indicates that the resource may be
   shared between multiple virtio-gpu contexts. The device MAY only support this
   flag with certain values of \field{blob_mem}; historically, this has only
-  worked with host-only blobs.
+  worked with host-only blobs. If VIRTIO_GPU_F_BLOB_GUEST_SHAREABLE has been
+  negotiated, this flag MUST be supported with guest-only blobs as well.
   \item VIRTIO_GPU_BLOB_FLAG_USE_CROSS_DEVICE indicates that the resource may
   be shared with other virtio devices via VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID.
   The device MAY only support this flag with certain values of \field{blob_mem}.
-- 
2.56.0

