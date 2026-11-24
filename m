Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795555212;
	b=tKVpkwC99ntSn12sdalGw2y3bcaGPtuyrjZdzlHgdwJzplddrEK6Ks6g/Tf9+Mv0tEcK
	 u2kIEiMzOzPKXPQH1XX85yEvpkSqztcFUakoSdVIg9V6b9odLOuumPaiWRM6jGvAsA1Vm
	 8QmY9HZ5j5DubhWVmP5N8dS1KYTeklX+EPs7sN6nS3UY8XK4K0KK1AdHqTMboDQiCZQ+T
	 x4EgBKLDMRTaJBmLcoPiQxxVaAd1/p0asDo0vN4a0/vmsJA+2XuP+FchE5PI1dac7WAQA
	 6kl0fVGOc/Ly/uKBFIjDmCcqOg3AxS330sEnrcUPTRJQLhWLJ5P7rhIboooUAIim2AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795555212;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=RzjQNEbvrT69kvPi+VgYj0lDaNs25NJXyPt/XXaBCRE=;
	b=r72UgT7TvBbjXAkFe9VnJkDija1Ns+IiykpjPwuj1S2VresFS95/MkFhb2+x7DGrOwiA
	 31eVoLjXU8yYMyozbag7asUcmBt1wlvZiMOc7Mcsue4FmIficBG9kj/cj0T5ysR7/Yx5K
	 6CEuF3Sq75QhLVDl5BAzSxmyr5k0KSEckLRXVJABn30Mi1gZn3K3Ahn0nivfoqXBm3LOt
	 BKu6wtHss0Ex2CnC9FD3MTR1jrvm5gtEAoCAykLKivo7M2nxyt3wX7D90xM4EQPb9TugT
	 lfNdg4azJAxxBI7uWFiV0LNErooMRp+0zRJA4yIt1qiLmyWkg2GpONXaDfyq2LVhGWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=invisiblethingslab.com;
	spf=pass smtp.mailfrom=invisiblethingslab.com;
	dkim=pass header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.a=rsa-sha256 header.s=fm3 header.b=IWM4YxSh;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=YWKxTERJ;
	arc=none smtp.remote-ip=202.12.124.158
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5531E606A32D
	for <virtio-comment@lists.linux.dev>; Tue, 24 Nov 2026 21:20:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5531E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.a=rsa-sha256 header.s=fm3 header.b=IWM4YxSh;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=YWKxTERJ
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 9DDDB7A027B
	for <virtio-comment@lists.linux.dev>; Tue, 24 Nov 2026 16:20:10 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 24 Nov 2026 16:20:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to; s=fm3; t=1795555210; x=1795641610; bh=RzjQNEbvrT69kvPi+VgYj
	0lDaNs25NJXyPt/XXaBCRE=; b=IWM4YxShyn7KYFAWPQhmxRWcPneg++s7BAlFU
	kyNbMU9oDY6JrEAEUZDPmBpB8bTjPjuzCrtUVT7tRbaMWPst6r/B+XOX0tEH6aLV
	qKNLUyIXmB4pOaEZNy9zGn5WkIEksZAEvId8RBlO6r1Gbzue+oXycjczyziHhkIz
	jVyMsL5pvst+h+fCXYdFP2DVIft/fFc8cFgKDOS8NDcMOff7ylOfzTfGNqVSddwZ
	e6H0RdAFZ043ya7jj3E/v3NuQMMntEbc2WpH1YJ54QfI1ySLDuPUIz7xcwlit9I5
	4/Uhkm0XOagzIlIp3iD5LSTAUCeJuJIJxVjJAoBvTxRmUZtSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1795555210; x=1795641610; bh=R
	zjQNEbvrT69kvPi+VgYj0lDaNs25NJXyPt/XXaBCRE=; b=YWKxTERJaDGRF5EzG
	hvCEi+u99Se5RgoU+uVIFFIy7shcQt+XPimM9CH4f/W9ZmbJSTOLebblGp2/Hp8d
	dpPi+A/P5fIW5w9xi2CDku50Wp/6BvE9R7Ghhzggln/RJdZT0/E1OOiXkoEQNQtL
	wnLsGPvIglR7hSwFxfLZLU+XRHLalCP1QdzdCZfOHv37FjSgqfNU2lEotcQ/S93m
	SpIprT/9xG4w7QtOO6Jpaw7guNBE/SlI9qLd33nMzgTl6c9wt5/lHXS9MQaj9giL
	g76rR18EA3RPtQvI4EwqoHE9EgcY2jNfGN46EiRe5oAtuU3Ls9tEF8fj2DRyt0sM
	1fS5A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=invisiblethingslab.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795555210; d=invisiblethingslab.com;
	mf=PHZhbEBpbnZpc2libGV0aGluZ3NsYWIuY29tPg==;
	rt=PHZpcnRpby1jb21tZW50QGxpc3RzLmxpbnV4LmRldj4=;
	s=fm3:rsa-sha256:CXd+tM4e3QvsmeFQzMnjGAfwFfkzCLsPehC9FiMxEqXstfx
	nwIZ1Fvfsw44Yq5XkYp+lwLPDA86DMsnf/7QhkKltAQH/PTee/gBggDfd8Q8td2B
	6k2QbLjGeVMEnbmtLkKtn6WGVzziQn4sSryyiKEIbEEEU4NHwZWflkkRMjpusYTM
	A4TMI4rirGOPZKyHmnDkjq0U+ME8v2MnU13ELmS9dB4rFTyJBhMq4RpXGVRSp5td
	oZceYQdc4Pi14wveDW9Ri6ktuWd70D8TjEehIqSTqfXYRNSr2QaaZZ5+q9Q+UHFA
	YDd33rHvW4rnPiTx1RXwAFisOWiSKJRR1kB+5/Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:qxJqjBAUl6d74N6GdVhv9viP0AEy6oMC/Cerg8D/VEk=:Sv477xhpPwiUR7uFQjat/gyxgoLQEzv/wmUXzpeQueo=;
X-ME-Sender: <xms:iv8Fa9EiV9hL-dxCmnHxZUnk27mfOSxTHYFhPnj7SjOxeMXk4z5LsQ>
    <xme:iv8Fa-DRszBXE692PkxOt1mKbFsFq_XIzO5tL1YghgEP1VOw0vGu_vrkPCmre4fR9
    yhDZ9XWG7Dv3rTKamcXUJc63Vp0ng2agyZGdeDoxb_Wywtum_QWRg>
X-ME-Received: <xmr:iv8Fa7mdFDbq90Rhr5x2r7zsUMnCRpIOquwYDo7D2Jxmyp19ScvnZZEXoin9CAEhhwISj7j0GLWry_Vh2lfq7XLGfBOZbDAaqRIR0mA8iZlgmsy7vEMhkMjWEAvDbg>
X-ME-Proxy-Cause: dmFkZTGLEYS9tIoTLxpXyPeZdIbwOU9OoFF27/++WYhnhVy0LEPnkEfMOYCJpJNnNfFD1H
    C4AicO1m4FCqlUW8ERLTRrNbGbCFX8BtzF0sdHF4s0yhgOvfW2zfg2t+hi6yPuiSQdNOZj
    lz7/DtCaS6/Pm9v9/jEa/nAZZ80L8brFqgaWX7ul55HHVVncaper4gPWRPeYnOYLCtyWWH
    EFRqlKVNI7mPFayG/PDK8UYtPpxYytczmGxe/7HGv3IL6fqkjbwKx6ZeImn8JUyLDoqQkv
    hKlAd9DYtDT6bCj+uNZXCXK8n2Nbx9blA7yuJnWGbtBB299XeDhRqHcSGhBqIssbHGYTJf
    11T/ckVPkUqdwSK7QREEXLAC8K64oFjfKx5N3qpI5v5mfcRGsH9GTQ1MnmIrMoUbFCPt/6
    tuyJAaO/HyQYRzwSjAWQr6G1cZUvuWHC8dvPhWS201RcQ9mhnuQUYO4MS0r3qYC9PHpkd7
    e5mj+sjrYkJpUmkoMemkaqlDnWpGktysC8MyuWIF0cuUvXw9LzO09eWDYxGZt1ulkQnhtb
    rTefc6ppfVbPKHsYuLg7ocJZJ0DnDiawYqeaAlz2QQlkJc4qXO1ldpA2hz/9Wt0Ysg18S3
    Z3nJ3rJu0reEDTc9bZIlXCaPK//ZUsFKK5V+t9CkTX0okmbkkO55j8qAIYOw
X-ME-Proxy: <xmx:iv8Fa8M1Jb3EjC-j6WHUmuuBiBSgy63rx9p8k-dYYX3I5x-z8tsLnA>
    <xmx:iv8Fa4-N63n7wV1YfjF0aoNoW6pz-3RsKMvqCkXqqeyz38yj9ElelA>
    <xmx:iv8Fa-EoDqC9zj5sIw0HlhCvyKzjOv9t-hKZCJxJ7tp2OerUquB8Ig>
    <xmx:iv8Fa3ien24e75TTat7-yl7QC_zalnSfpAM-5d0V9BMfPgdhftzdgg>
    <xmx:iv8Fa14AGI_mOWIIaKH3dCZlu-48XdC1hwNI2szl7_wFcuFeFsyqYPwl>
Feedback-ID: i001e48d0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Nov 2026 16:20:08 -0500 (EST)
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
Subject: [PATCH v3 2/3] virtio-gpu: introduce BLOB_CTX_ID_FIX feature
Date: Tue, 24 Nov 2026 18:19:28 -0300
Message-ID: <20261124211931.809982-3-val@invisiblethingslab.com>
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
CREATE_GUEST_HANDLE feature which, due to kernel constraints, must also
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
index ea6fae4667e1..63e600bd04e8 100644
--- a/device-types/gpu/description.tex
+++ b/device-types/gpu/description.tex
@@ -39,6 +39,9 @@ \subsection{Feature bits}\label{sec:Device Types / GPU Device / Feature bits}
   synchronization timelines supported.  Requires VIRTIO_GPU_F_VIRGL.
 \item[VIRTIO_GPU_F_BLOB_ALIGNMENT (5)] configuration field
   \field{blob_alignment} is valid. Requires VIRTIO_GPU_F_RESOURCE_BLOB.
+\item[VIRTIO_GPU_F_BLOB_CTX_ID_FIX (6)] it is always safe to pass the
+  current context ID to VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB,
+  including for guest-only blobs.
 \end{description}
 
 \subsection{Device configuration layout}\label{sec:Device Types / GPU Device / Device configuration layout}
@@ -669,6 +672,12 @@ \subsubsection{Device Operation: controlq}\label{sec:Device Types / GPU Device /
 identified by the \field{blob_id}. The actual allocation is done via
 VIRTIO_GPU_CMD_SUBMIT_3D.
 
+If VIRTIO_GPU_F_BLOB_CTX_ID_FIX has been negotiated, the \field{ctx_id} of
+the \field{hdr} MUST always be filled in with the ID of the default context
+associated with the current handle, if one exists. Otherwise, it MUST only
+be filled when the \field{blob_id} has been filled to create a resource
+from a context local object.
+
 The driver MUST inform the device if the blob resource is used for
 memory access, sharing between driver instances and/or sharing with
 other devices. This is done via the \field{blob_flags} field:
-- 
2.56.0

