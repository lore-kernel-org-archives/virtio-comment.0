Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291671465B4
	for <virtio-comment@lists.linux.dev>; Fri,  4 Sep 2026 00:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788481179; cv=none; b=sy4Bk85Q1uwuNPArZDWAoW/Y24YGdVc24UvXCvC0hDwc/XqRBdzEoFhIrG4GHYWtduPB7e5c9uHzP+JDVoFEP2eYeYkTfdWmERszFoOVVHXrl8KfOtSHhN8dLzyuBmksAuNxkJSHvvC81w5pWgmTAKlDGygpLWjIC+P0ChUzRCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788481179; c=relaxed/simple;
	bh=tb3A9IcXqRkxgTZvxfaz+I2T6TVbgCHlwp5lQA+kP+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BM8Zeh0VEpxcNtHvulleSV81c7r6j/CHmZ5SjOM8lXCp0xgG3f2Zy6zf/VgZCldC6tzP/lHCsI53lI8Eg0wPHiZ5X69c643eebyras7bBEjJoI4R2+LKp80lHk0mHDBhzOcPWYkVcLnZKfp86pXp9ZIMpTCGdtJuU4QLgct1HwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com; spf=pass smtp.mailfrom=invisiblethingslab.com; dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b=U5wA/Er/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pqRR77pn; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="U5wA/Er/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pqRR77pn"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 5D3681400078;
	Thu,  3 Sep 2026 20:19:36 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 03 Sep 2026 20:19:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1788481176; x=1788567576; bh=yBN7420nmO
	XP28OWEtdVm7xB02rEkCEtUq69/zPcWjs=; b=U5wA/Er/U/To3EPqZUqExhm4D8
	BkcqjhlmOagbjj3NN1MPy1tehji4SWGI+PERUSoiCgSzpD3GTSddebyak6LtC/hP
	rnsl2504tUeFPtXZ7OcQ0MtRHp12vwkVZKhlMHqx8BXfccKYBpBV9hSKUlFukCpc
	7yM9Zr1YuYy4PVeNGsWHu7MN2v+HY78j8V3dNwqabNRiOZ3Ei+D77iSsDeYtIdMS
	ZjQWpQ8qDWA4z98AMYABG3f+juWM3d90HNIcKLOw3zf9veldXmq7x1qd8hvapCi2
	Jn1Mw/HgWnjmqhxeMLJ28qaYTIYHLj1ABAZZe4EKOvK6Fbil651VKWfeZK1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788481176; x=
	1788567576; bh=yBN7420nmOXP28OWEtdVm7xB02rEkCEtUq69/zPcWjs=; b=p
	qRR77pn2XhxxVtp4NfpaFUNuh1WUDxBpIYLqt/HavfC47qYp44i2AHoSLUtxm9th
	yXvPonf/m+VN0afXVNsSlCgkX2+jeYQOooKo0KzNqCC90oHucBxWYk3WgDsVLbgX
	s1BEF/9dWARMbBlaXMEZ6LfQP/6Wdn6O6nxqRUQOMoADRgyjvkST6QQ+I3RqXFUI
	mkQtr/MBX8Cnzt3ZTn+CjR6CdHN2VVW6kmyPHEgES/E/TDMRvKQ5r37jbC9uvF7Y
	O41mb3kuTJe/weoko81u3vtGe+NnDD+a5rFvKNiAjgS8YRDcQu8n48OiJhvqs+Ja
	TfxwZQTZB6MPpC/kvT8xA==
X-ME-Sender: <xms:lw6aagbLvp7yvpjc373ZjPlpj-9ymW4zRO7GNufizIOQ-tRHkHEiTw>
    <xme:lw6aat-135E0VegOGug1YNTCnvsy_5izy0G6BkzwSDzGAZAzCaFL7QWW97oc9Pper
    IH7LXU20PbswkI5-uapwrn89JiTkAqD2ZKzI8Fvagsd5WU-YLpUFA>
X-ME-Received: <xmr:lw6aaumeWKyHVg0oO3dqkkMJrsXNQ-oCUzTMZ9MgT9ptXN6Z6BCImTpxuJknCkP-GOGKlmEWJuk3L65G-EbgNQEZopHYlMLcElA>
X-ME-Proxy-Cause: dmFkZTGXLOdTRNS6K6DqsQqY6VOZatv4iadYWJhiYnCxdl8BdYws3tBz/2t78Bo7zbcP5F
    Ab0HJogCCHH87eMTRpo4175K97V4JlE9Lpvqh83HzIJ1JCcO3kr5Xtcog6K3N3c+BxrQJS
    yMAd1gnz8TEpORURPQv0QpeQ9d8m0MoX4G9KEh42SED6rEzq1m3c/I1TatxTZ6fceHXmsU
    7Lo/14sRAkJf3d9DVEdp8+PFu4GywT0coyfnAaVHWAUdHQwb4PyD3SXKF4E0CFcmmifJJW
    nSzbgraXtrbCgkbg9UW/XsBlYj8Oqp34XFew/55+ZdpZ8JumomleMxhtV5ogWV7KGHWIIv
    Ie3J/cPmgVXqQJt1FqwFJPC8gSZGiJ9tCpG1NdevSDNpvWyZV20kVXk2m8Eid7NklpewKF
    Z6akXYLkiqIUaijKx9lYfT6tfSm1xMVGuRDOFSMoM9ewG/ub1+XRxSmup7YrHOHyPam2G8
    4+tXqFXRA13djpLV7UvF3D4+PunK3KwZqc8xD1SjsQKqBK5l5N0Ql45IpuI42p46Bvw9O9
    b/2G0UOWuwZEMc3BnI0MG4ySR/oQZ70x0Kk/RyG1pdOHKT4BHRgP0Sssy6L7sTLuT8n20g
    O/DL/fgZ6zaNqFwPjloBFikUo/E3wzLNaP1tAmkE8/QqY+TrWA68z7mOGKkA
X-ME-Proxy: <xmx:lw6aaqy02ZryXyTcjQfft6caHbsODdfLGm1cFV44dJXOWNN07puQUg>
    <xmx:lw6aag6lFL8_i1LdgGZtF8IQJSKQCi1Uq2hLNCUlKWDGfKeqVpiwrw>
    <xmx:lw6aaiWRnkZDUqJhkNcRHXI5wa-JAtzlTJAz37USsMeEvRNufdi9Uw>
    <xmx:lw6aagIHDjWWCO9TeAysFQsGKKsgvs_I3QBJBohW-0O-cJCFVfSlvA>
    <xmx:mA6aajWxTHdRU8Fqlt7oU1ozn7gJSH_meMu5mjBOMKPGYtmHxlqdq58J>
Feedback-ID: i001e48d0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Sep 2026 20:19:33 -0400 (EDT)
Message-ID: <bc74587f-734a-4dfd-ad13-e0e848f9522d@invisiblethingslab.com>
Date: Thu, 3 Sep 2026 21:19:29 -0300
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] virtio-gpu: add flag to negotiate always passing
 ctx_id to RESOURCE_CREATE_BLOB
To: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: virtio-comment@lists.linux.dev, Sergio Lopez <slp@redhat.com>,
 Parav Pandit <parav@nvidia.com>, dmitry.osipenko@collabora.com,
 mst@redhat.com, =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Alyssa Ross <hi@alyssa.is>,
 Demi Marie Obenour <demiobenour@gmail.com>
References: <20260903021442.423274-1-val@invisiblethingslab.com>
 <20260903021442.423274-3-val@invisiblethingslab.com>
 <CAAfnVBmzsXrOwEoaBWeUNCwrnh7bpZ_gtqSpakz6zaiANQrjhg@mail.gmail.com>
Content-Language: en-US
From: Val Packett <val@invisiblethingslab.com>
Autocrypt: addr=val@invisiblethingslab.com; keydata=
 xm8EaFTEiRMFK4EEACIDAwQ+qzawvLuE95iu+QkRqp8P9z6XvFopWtYOaEnYf/nE8KWCnsCD
 jz82tdbKBpmVOdR6ViLD9tzHvaZ1NqZ9mbrszMXq09VfefoCfZp8jnA2yCT8Y4ykmv6902Ne
 NnlkVwrNKFZhbCBQYWNrZXR0IDx2YWxAaW52aXNpYmxldGhpbmdzbGFiLmNvbT7CswQTEwkA
 OxYhBAFMrro+oMGIFPc7Uc87uZxqzalRBQJoVMSJAhsDBQsJCAcCAiICBhUKCQgLAgQWAgMB
 Ah4HAheAAAoJEM87uZxqzalRlIIBf0cujzfSLhvib9iY8LBh8Tirgypm+hJHoY563xhP0YRS
 pmqZ6goIuSGpEKcW5mV3egF/TLLAOjsfroWae4giImTVOJvLOsUycxAP4O5b1Qiy+cCGsHKA
 nCRzrvqnPkyf4OeRznMEaFTEiRIFK4EEACIDAwSffe3tlMmmg3eKVp7SJ+CNZLN0M5qzHSCV
 dBBkIVvEJo+8SDg4jrx/832rxpvMCz2+x7+OHaeBHKafhOWUccYBLKqV/3nBftxCkbzXDbfY
 d02BY9H4wBIn0Y3GnwoIXRgDAQkJwpgEGBMJACAWIQQBTK66PqDBiBT3O1HPO7mcas2pUQUC
 aFTEiQIbDAAKCRDPO7mcas2pUaptAX9f7yUJLGU4C6XjMJvXd8Sz6cGTyxkngPtUyFiNqtad
 /GXBi3vHKYNfSrdqJ8wmZ8MBgOqWaaa1wE4/3qZU8d4RNR8mF7O40WYK/wdf1ycq1uGad8PN
 UDOwAqdfvuF3w8QMPw==
In-Reply-To: <CAAfnVBmzsXrOwEoaBWeUNCwrnh7bpZ_gtqSpakz6zaiANQrjhg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/3/26 7:20 PM, Gurchetan Singh wrote:
>
>
> On Wed, Sep 2, 2026 at 7:15 PM Val Packett 
> <val@invisiblethingslab.com> wrote:
>
>     virtio-gpu device backends typically use ctx_id to route commands to
>     different modules that implement distinct context types, e.g.
>     virglrenderer vs. cross-domain. Each module may require the blob
>     resources intented to use with it to be allocated through it as well.
>
>     Currently, this happens for host-only and default blobs which are
>     allocated from a context-specific local blob_id (e.g. an image
>     requirements blob in cross-domain). For guest-only resources however,
>     existing software (both the Linux kernel and the rutabaga-gfx library
>     used by device backends to implement virtio-gpu) allocates those with
>     ctx_id == 0, which might be a different "default" context type
>     from the
>     one the resource is intended to be used with, e.g. when both
>     virglrenderer and cross-domain are present, the socket buffers used by
>     cross-domain were processed by virglrenderer which happens to work
>     but does not actually make sense.
>
>     Additionally we would like to support PRIME imported resources
>     (udmabufs
>     or dGPU passthrough dma-bufs) being passed over cross-domain with the
>     CREATE_GUEST_HANDLE feature, which due to API constraints must also
>     perform the creation of a guest-only blob resource with ctx_id but
>     without blob_id.
>
>     Unfortunately changing this without breaking backwards compatibility
>     requires a flag to negotiate the use of the "fixed" convention.
>     Otherwise
>     new guest kernel + old rutabaga would result in the command
>     failing due
>     to old rutabaga not expecting guest resources to be allocated w/
>     ctx_id.
>
>     Signed-off-by: Val Packett <val@invisiblethingslab.com>
>     ---
>      device-types/gpu/description.tex | 9 +++++++++
>      1 file changed, 9 insertions(+)
>
>     diff --git a/device-types/gpu/description.tex
>     b/device-types/gpu/description.tex
>     index 64e8c4ddecc5..c0ff3f34ec1c 100644
>     --- a/device-types/gpu/description.tex
>     +++ b/device-types/gpu/description.tex
>     @@ -42,6 +42,9 @@ \subsection{Feature bits}\label{sec:Device Types
>     / GPU Device / Feature bits}
>      \item[VIRTIO_GPU_F_CREATE_GUEST_HANDLE (6)] guest-only blob resources
>        may be created with the
>     VIRTIO_GPU_BLOB_FLAG_CREATE_GUEST_HANDLE flag.
>        Requires VIRTIO_GPU_F_RESOURCE_BLOB.
>     +\item[VIRTIO_GPU_F_BLOB_CTX_ID_FIX (7)] it is always safe to pass the
>     +  current context ID to VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB,
>     +  including for guest-only blobs.
>      \end{description}
>
>      \subsection{Device configuration layout}\label{sec:Device Types /
>     GPU Device / Device configuration layout}
>     @@ -673,6 +676,12 @@ \subsubsection{Device Operation:
>     controlq}\label{sec:Device Types / GPU Device /
>      identified by the \field{blob_id}. The actual allocation is done via
>      VIRTIO_GPU_CMD_SUBMIT_3D.
>
>     +If VIRTIO_GPU_F_BLOB_CTX_ID_FIX has been negotiated, the
>     \field{ctx_id} of
>     +the \field{hdr} MUST always be filled in with the ID of the
>     default rendering
>     +context associated with the current handle, if one exists.
>     Otherwise, it MUST
>     +only be filled when the \field{blob_id} has been filled to create
>     a resource
>     +from a rendering context local object.
>
>
>
> I can confirm for gfxstream/rutabaga_gfx, it is robust enough to 
> handle ctx_id != 0 + BLOB_MEM for all versions we care about.
> [..]

Umm, as long as "versions we care about" means only current git main 
right now..??

Before the latest fixes (PR #81), this would not work for cross-domain, 
starting with its socket buffers.

With ctx_id != 0 rutabaga dispatches to the context's 
context_create_blob impl. For the guest memory (blob_id == 0) that would 
unconditionally try to get the 0th context item and fail with 
RutabagaError::InvalidCrossDomainItemId. Only component-level 
create_blob (used via ctx_id == 0) would handle guest memory.

The flag means "that won't happen anymore", so VMMs built with rutabaga 
 >0.1.85 can set it, in which case the guest will happily go through the 
(ctx_id != 0, blob_id == 0) code path.

~val

