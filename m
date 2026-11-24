Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795555203;
	b=mHxOVxRi2LrQBXe820XpP9bwwk/LSJzeiNU52U9G4N8pClw+GyQa/p4h573XcFdyZjSD
	 JqkWi1Ssxb5rkRmdaYOcXkG2ygPa6phzinqhRGUD1tcydUNJzEYoHOsd+6bKYPmwiusKu
	 G1I55rfAkOAGs5o79b3vb9m+obCsqerbZAE8PxVjBA6651qv0D/bRuq3PrtVdwiwdo3ND
	 YnElhqE0aZIfLQ4cuGPvNaTpQA3EQhjEPI48xIYV8UVFc2rlyFBhnuU3kS6XwGzaC4oAU
	 /SyF2NyjWGzgK8ymL4WZv2BJb9a44Zg4OYKNCJQNt6zUTjqgZ5NLxb6hNGX7hnwc72Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795555203;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ABy1PyLXaVNytmF7ACqnKx5lyj6/yFOba0a4DJJ6PEk=;
	b=c3fORfVaFUb4+gckrCesn75/XnTVknYHA6W4T1YzaKQmiiZJ51GcRG0vkgcupIQXMEQY
	 Hb5wbLv9zUg5g7eZVA91enZYjdZOV1usfGeBNnWJrm/klisdoCh4JThO4T2njUiKP5y6E
	 nHuzptbbScJwfXPATkJNubwx53TQrLE3K4uIoF2vN5ELqRFb/e0fNrsUN5uGJhOF2G7pR
	 rP/W869gE1rPuucu0dSopv4b3YT8kDwW+1f4cup893SJ5Y1tglRBIW1WxDF/noA82ZDNN
	 BMZ+rMxov5AGw5fn1vK1jEPpgv3Bj7eWQNUsqkbAQSXRFABnNDUq4pGk2DPQXTXeUaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=invisiblethingslab.com;
	spf=pass smtp.mailfrom=invisiblethingslab.com;
	dkim=pass header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.a=rsa-sha256 header.s=fm3 header.b=Qg0B1ClI;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=CWvZT6le;
	arc=none smtp.remote-ip=202.12.124.158
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A442E606A332
	for <virtio-comment@lists.linux.dev>; Tue, 24 Nov 2026 21:20:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A442E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.a=rsa-sha256 header.s=fm3 header.b=Qg0B1ClI;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=CWvZT6le
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A290B7A0062
	for <virtio-comment@lists.linux.dev>; Tue, 24 Nov 2026 16:20:01 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 24 Nov 2026 16:20:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to; s=fm3; t=
	1795555201; x=1795641601; bh=ABy1PyLXaVNytmF7ACqnKx5lyj6/yFOba0a
	4DJJ6PEk=; b=Qg0B1ClIAJfwCYRIVgxxGWNqOyjzZ07gdRRJ4KyBpuzbnokwAw/
	E854n5doaVolFOSCyzyEYm5ZBojKT0sbopvQnleAbcOe/7NoGbE1TuBoeaVcvf6A
	B/c4vs7EET5N2GYQWSNsr5EfQ0rBih/ULfls5BGgzlOSooz/6f+SszQ04epIUUcw
	pZnwN3gvtpS0pHFR9vImjJSJt59rak2na2IjPQyQ77J9yLGy2RvKkCYGVIY7ziGz
	Q0Gyj39r7uP+YwPqEs2LLp9qyZ1sJzQ24m/a/MhYjl0oHwLSigaHXQ5srAo08nhb
	25P/nKg5vQNxwKxcSXgETt7ELe3x+SEHyqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795555201; x=1795641601; bh=ABy1PyLXaVNytmF7ACqnKx5lyj6/yFOba0a
	4DJJ6PEk=; b=CWvZT6leLy4hljh6fvi5sFpoTHBfFvZtdkMFtiZK8m4YN1QGiNA
	J2zwaXNkcsNecKg9FUC3QNp5l6oX5WznTBxYEK3mfOeL+CpoR5IKye/MSWfttFSv
	pg+OxwTRui8NXGG+2m/xVU0D/DVyW2+q7Wx3o2RDkAxuTI+VhK27ktwmMArBnAxP
	ou4kFkoLfre6fHleRD4hhg3v+oxbDejTJ6xT+EYz1qFKMH7r18g+asj3lLT1W2h3
	UR/uri2smCYHBReDoR9FVcreFHD40zt4WIyWS3Wkftw3XTHKASJ+kK7qBp/MJZwx
	i8SOPBLENZ1a0q68e8+jJsawzP8CvxjRcxg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=invisiblethingslab.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795555201; d=invisiblethingslab.com;
	mf=PHZhbEBpbnZpc2libGV0aGluZ3NsYWIuY29tPg==;
	rt=PHZpcnRpby1jb21tZW50QGxpc3RzLmxpbnV4LmRldj4=;
	s=fm3:rsa-sha256:GvdaR3Y19VlZYGp4eqmUh2s+2fzmQWnwp8miNPWlvD3Lfwb
	+ZGF6/osq21lPvvyUeiAQDAjvnnDX4jiJfVL0I8VVYNfPlbVtSgtv7xQkx6CkOA7
	MQ5+XPCUir4YLisjJgbl7515+aA2MX96C/JPfV7ivJEXVh+nIMml1q6Fg+rDhM0K
	z2NmkP4b2Of1jdI2pJNLdC2wuWliDp7cXY0IgvW3wn6P3Qt2OkZSow9Xi6iSz6Po
	Uv0QOzpbjhnB+ZErRR8/qg8qZc+P7ZWeJH1rjzXQYSILX8xs7Kjtwz38twqQfw90
	CP3cArICBBLcNf6sFB1aD/kD0otdBnGE30rP2Hg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:o9HMrLWs4KwI0cUFt+hCHwSVU2x+mizPC0KdQcD+lvw=:O+Tn6WgNP+MLMahvfT5ethW4poskNlabh85c35tOen0=;
X-ME-Sender: <xms:gf8Faz8vo_Ew0dphqH3joXGgek-s80uyEw3x6sksZvYi13J7kO-BGw>
    <xme:gf8Fa8SezSals8cpchIP8dcRTMltV9ObtiwhIJVbWrdMq4GSYj4Jzwo2o5KF-P2TX
    YraLzCDY-2Ewf6ov6_xl0Xuv2CDTs_XVRCWcNumYxYg7G0eaLE>
X-ME-Received: <xmr:gf8Fa1fqhgobMffMwDvcaaPOi6z9Mxl32_Uu4EVlViW7qbR4jXh7oRI9Oo8pVXxTVRt5UeBKptUzwfYgebgGc_AsCsCWRUK1xkVAACmgZSjlVi6cW74jRxHHqjaDiA>
X-ME-Proxy-Cause: dmFkZTFUQi39QndnsHMAKtQPySt+T0H+7mmWfwltQsOsz6TizxV1QUYVc+4Q42CjpkxdR9
    +Tev2fAQ++H31XDpPfF8Y9scKC3jW3tlgNiKAvNpNrXThwq+6meIXQE611nbnXzBSR92ZX
    WLl45dG6q2fX5Gydp6k2HKWzzGn9g/x4J7G4eKTi1C54H4GBFPRHuPzZi8RY8b6qdR/v5t
    d67dLvVhnQqXVwgr6an0H8cQBDjf2GHMf+Ww6F3zy1ZCYH8B2CF5W/s6uoOVq+fSMLRk9E
    9Q4ut5UDUk/4/JGREox26rPQeneEjsEUAqukWLNrpDhzaK0FDmQ9JvJbsBVT+iuJJQx8ih
    F57TJb09xsRBVFavuTi4jCuhIT0nnUGPWvPfLkL0c1kKx5u6vsj29C72MIOT5kSnpw4ZQt
    mzFVXcyB3yv3yjrsZEFnq2RZtCuct/ojkCBfwosDgGcQJmLfVymt7tkE5Mmtl0YMBpcFun
    hbpCdZLSinMhLfGfXLEvuwv422a1YAHi/0jX3ffL0yL9BfwDXc+jfeYzMgVHMpzKlNJsdY
    a1Ors4lbRvT9i+vi1ofhJ2uGPADo+r5cf4Vfoe41Lps9uq8VaUVKWUFQASzCRQ0JaJEAPn
    y1zpdD6FCWhbcCBNbwnuD59jlIQwOje+pVKoFh8in0kS2Is+xKfNTHhtyTeA
X-ME-Proxy: <xmx:gf8Fa2TypFwIK9R6Abw5RNAxbRLTVGT5xDD__oRKbcJ4kJ08G0yGuQ>
    <xmx:gf8Fa5LkTiy4gUfU8IPv_t1-Q1EC_OtgXEjrK0vT8RTqBR8y35Cl0Q>
    <xmx:gf8Fa7L1jOqzLeTG_zhkyWTwPJ0bhZOI3W8zuwR1pTqkpzAhO6Wsxw>
    <xmx:gf8Fa8jxmvKGcssaTHNCVcK1jdbrp_7t6fvdhRNI6A990fsL4tw4bQ>
    <xmx:gf8Fa8EabKHMLrKFXxlI89WHPzR6aKGFYLxySKpWBYr3d7WPT0dxVe_4>
Feedback-ID: i001e48d0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Nov 2026 16:19:58 -0500 (EST)
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
Subject: [PATCH v3 0/3] virtio-gpu: add F_BLOB_GUEST_SHAREABLE (ex CREATE_GUEST_HANDLE) and F_BLOB_CTX_ID_FIX
Date: Tue, 24 Nov 2026 18:19:26 -0300
Message-ID: <20261124211931.809982-1-val@invisiblethingslab.com>
X-Mailer: git-send-email 2.56.0
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

Hi,

I've been working on actually implementing the "lost" CREATE_GUEST_HANDLE
feature which allows guest-only blobs to be shareable, particularly enabling
PRIME-imported (from udmabuf or passthru dGPUs) buffers to be shared with
the host Wayland compositor when using the cross-domain context type.

This version renames the feature from F_CREATE_GUEST_HANDLE (which was too
host/implementation-centric really) to F_BLOB_GUEST_SHAREABLE, and removes
the new blob creation flag in favor of reusing the existing one,
VIRTIO_GPU_BLOB_FLAG_USE_SHAREABLE. While here, I documented all three
existing flags properly, including which kinds of resources they work with.

It seems correct to me to reuse the SHAREABLE flag because the semantics are
the same. Sharing between virtio-gpu contexts *is* what the guest relies on
to instruct the host to effectively share across host processes!

The flag has *not* been used with guest-only blobs when 3d contexts are
present before. The Linux driver did set the SHAREABLE flag in PRIME import
code, but PRIME import was restricted to devices that did *NOT* support
3d contexts at all. In Mesa, the use of SHAREABLE corresponds to "being able
to DMA-BUF export" (non-empty VkExternalMemoryHandleTypeFlags for Venus,
!RADEON_FLAG_NO_INTERPROCESS_SHARING for amdgpu). These are all exactly
the semantics that match the cross-process/dma-buf kind of shareability
on the host side.


Also addressed feedback: now BLOB_GUEST_SHAREABLE depends on BLOB_CTX_ID_FIX
(therefore BLOB_CTX_ID_FIX is introduced first); s/rendering context/context/.

Hopefully third time's the charm :)


v2: https://lore.kernel.org/all/20260903021442.423274-1-val@invisiblethingslab.com/
v1 has been lost to the moderation queue.


Thanks,
~val

---

Val Packett (3):
  virtio-gpu: document individual blob_flags
  virtio-gpu: introduce BLOB_CTX_ID_FIX feature
  virtio-gpu: introduce BLOB_GUEST_SHAREABLE feature

 device-types/gpu/description.tex | 34 +++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

-- 
2.56.0

