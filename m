Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558D333438F
	for <virtio-comment@lists.linux.dev>; Wed, 21 Jan 2026 03:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768966464; cv=none; b=Z5lY99hbgnCXWKSvTbZQ9pVoVZyMynTCde6WjI2ZdjN8eoMIJxfPbZMQhOd5Y9/eI3F/nWryFozV+fgKyHjIadwdceQvqGgrL25i8Zr06uy5m2kQ+Bmea9hHj1nRbqvTBH+t1aMpFNyLUk7xaZq9K+kCylDBNQ3Y8/ECHawxgsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768966464; c=relaxed/simple;
	bh=g0lSu2hsYKhg1DFg2KzKQ+VJv5Je3PGeKKdOh5524nY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=u+005TgkWAQ5gb0zyVJwHIv25L/YT7ZM2Yv3xQynSQonrQ3yi8aoqdVERC+8StLGZMn5ej/8G8OhcKufuyKHnOiibYbNBgBwrzKJ+h7uVtL2mIoJLKLYY0FKGBnuVWJulbKEpcs7546IE0CGsdcYiKuCJ0B5WL0wF7eDIOXXRCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TvpUI9Vi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TvpUI9Vi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768966461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qzo8iLm8vVKuCaVvIwsJvpKZMbRiF2+sFIb+NvhWtWk=;
	b=TvpUI9ViZS6SBifuaVY/EOJh8TIp9ucBD2AeuWOx0S5duOltWIwtWJF22Vx4wy9GkO0/Df
	NhyTwO52FdWc96gqIZa0S3MWNY8K/WL2anHoIdy/NOaAfIycd+0vjOQbYudtQNzGeVORqa
	ria+TzgOy4kB0QEsCTF2mdPOPAJKCqI=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-gVbDKADlPUatgRXgN8J6CQ-1; Tue, 20 Jan 2026 22:34:17 -0500
X-MC-Unique: gVbDKADlPUatgRXgN8J6CQ-1
X-Mimecast-MFC-AGG-ID: gVbDKADlPUatgRXgN8J6CQ_1768966457
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-45c879592feso11015256b6e.0
        for <virtio-comment@lists.linux.dev>; Tue, 20 Jan 2026 19:34:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768966457; x=1769571257;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qzo8iLm8vVKuCaVvIwsJvpKZMbRiF2+sFIb+NvhWtWk=;
        b=bsaoQEPbPXjV8NBhu5E5TqVrk6IMu2rwx9wsu7GMPTfGAH8jbdR+R0w96Qx8/8+M8u
         BMIdq/eCNJ5Joj6PsBbzC8ZNTVwQTu5IlvqtfS+RfqOtRwJcDZfCaPgK63M/2D3FADWX
         ZMp+4OpdvHPSc/ghr33PfsPc5rzBik5syRLc5d9Ti0/qqp5nabr/2B0oZDLXI2IPOeI4
         PKkhwPqgHndPKi0mRrYKMXnZhyz7yRpLld2YJqURk1zfTcmTzhvv9yCmKYVu0zzPMTJ4
         K6GFCv7zDIdzKW6pDoNjqGqYIRK/fMFz6YD9nMp2pJiDe/K1ys/nTMb4qoKBNeaE64gm
         k5bA==
X-Gm-Message-State: AOJu0YxmV1MZ/9WvsjV1ma3866fV3Z3v7jf9PPfSHdiIQoqH3mljIi4N
	V1KdSNTkT8a+r19ZnFm/Flcf5urrkh3yCuyc2qt4NMcwKC9UEUM+hOAOUu7rZ3PKNeisWGK/Hm0
	S8tXBacsyzdzc7a7EGccOcp9dvXYJHdO7CUv1L5attN6Wz5w89xI0dR4vry1W9XOZe/ZgSjK5Gi
	ButhQ8Ueb2eLeTlwBPBnwBFEONXAcTrZ7MhIQq+OikVIXhSK3hSDi95A==
X-Gm-Gg: AY/fxX6mKmEUtBB7NJg8gVMVMNv7fl4K4PLMY+3Qv/7SJEGLNejZ/vDHX715pufIfRw
	Qb4RgDZshCI7pw6j+Eu3xz6AUo2btiv/HB3WMd50fy7t2PO0cp4UpK+rKRT76PU+nlgLftVW5uJ
	fmep0+A0kbaZtaNMEgJOXGj3P4nZeBwgmsYdUJm+hC4tTgd7Q52PecVrv5NDtQmXHtIx+xmgsPk
	i6oHElYgtI+SUbq9znAz49JcQU=
X-Received: by 2002:a05:6808:1784:b0:455:daf0:9998 with SMTP id 5614622812f47-45c9d871c44mr6634526b6e.41.1768966456726;
        Tue, 20 Jan 2026 19:34:16 -0800 (PST)
X-Received: by 2002:a05:6808:1784:b0:455:daf0:9998 with SMTP id
 5614622812f47-45c9d871c44mr6634518b6e.41.1768966456379; Tue, 20 Jan 2026
 19:34:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251112055113.62207-1-afaria@redhat.com>
In-Reply-To: <20251112055113.62207-1-afaria@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Wed, 21 Jan 2026 03:33:39 +0000
X-Gm-Features: AZwV_QhFMqKGVfGMcmUJA1ixjlDHV5q-cEYWZJ8gpayv-bvNgWW3aEcU1FBCvSs
Message-ID: <CAELaAXxJy7vyjq+zegKzGL_W24GC_k0cRmVnqLCuiFmVtXpL1Q@mail.gmail.com>
Subject: Re: [PATCH v4] virtio-blk: Add support for "Force Unit Access" writes
To: virtio-comment@lists.linux.dev, mst@redhat.com, stefanha@redhat.com, 
	dverkamp@chromium.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1tlTq3runGZRmdpLjxCbJ8c_piobhujSI2hY0vSbzrE_1768966457
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Could please open a voting ballot for these changes?

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/237

Thanks,
Alberto


On Wed, Nov 12, 2025 at 5:51=E2=80=AFAM Alberto Faria <afaria@redhat.com> w=
rote:
>
> Add a VIRTIO_BLK_F_REQ_FLAGS feature bit converting the current
> `virtio_blk_req::reserved` field into a `flags` bit field, which can be
> used to modify the behavior of an entire request. The meaning of each
> bit depends on the request type.
>
> Define a single VIRTIO_BLK_REQ_FLAG_OUT_FUA bit as signaling that a
> VIRTIO_BLK_T_OUT request should be a "Force Unit Access" (FUA) write,
> i.e., should become stable once the request completes. FUA writes enable
> better performance compared to the alternative of waiting for a write to
> complete and subsequently submitting a flush.
>
> Also add a VIRTIO_BLK_F_REQ_FLAGS_OUT_FUA feature bit indicating device
> support for the aforementioned FUA bit.
>
> This approach allows for future expansion to other request-level flags
> and allows the same flag bit to be used for different purposes on
> different request types. The VIRTIO_BLK_F_REQ_FLAGS feature bit ensures
> compatibility with legacy devices/drivers that interpret the
> previously-`reserved` field as a priority indicator.
>
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>
> v4:
> - Have the semantics of each request flag depend on the request type, as
>   suggested by Stefan.
> - Some other smaller rewordings suggested by Stefan.
>
> v3:
> - Changed to a more future-proof approach somewhat similar to what was
>   suggested by Stefan.
> - Included a brief rationale for the introduction of FUA write requests,
>   as suggested by Michael.
>
> v2:
> - Redefine VIRTIO_BLK_T_OUT_FUA to 27 since 15 is already in use.
> - Clarify that the cache mode has no impact on VIRTIO_BLK_T_OUT_FUA
>   semantics.
> - Allow drivers to negotiate VIRTIO_BLK_F_OUT_FUA even if they are
>   incapable of sending VIRTIO_BLK_T_OUT_FUA commands.
>
>  device-types/blk/description.tex | 43 +++++++++++++++++++++++++++++---
>  1 file changed, 39 insertions(+), 4 deletions(-)
>
> diff --git a/device-types/blk/description.tex b/device-types/blk/descript=
ion.tex
> index 2712ada..3b3a4e7 100644
> --- a/device-types/blk/description.tex
> +++ b/device-types/blk/description.tex
> @@ -66,6 +66,13 @@ \subsection{Feature bits}\label{sec:Device Types / Blo=
ck Device / Feature bits}
>         (ZNS). For brevity, these standard documents are referred as "ZBD=
 standards"
>         from this point on in the text.
>
> +\item[VIRTIO_BLK_F_REQ_FLAGS (18)] Device can interpret the \field{flags=
}
> +    bitfield in the \field{virtio_blk_req} structure.
> +
> +\item[VIRTIO_BLK_F_REQ_FLAGS_OUT_FUA (19)] Device supports the
> +    VIRTIO_BLK_REQ_FLAG_OUT_FUA flag in the \field{flags} bitfield of th=
e
> +    \field{virtio_blk_req} structure for VIRTIO_BLK_T_OUT requests.
> +
>  \end{description}
>
>  \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types / =
Block Device / Feature bits / Legacy Interface: Feature bits}
> @@ -317,6 +324,9 @@ \subsection{Device Initialization}\label{sec:Device T=
ypes / Block Device / Devic
>      driver SHOULD ignore all other fields in \field{zoned}.
>  \end{itemize}
>
> +The driver MUST NOT negotiate VIRTIO_BLK_F_REQ_FLAGS_OUT_FUA without
> +VIRTIO_BLK_F_REQ_FLAGS.
> +
>  \devicenormative{\subsubsection}{Device Initialization}{Device Types / B=
lock Device / Device Initialization}
>
>  Devices SHOULD always offer VIRTIO_BLK_F_FLUSH, and MUST offer it
> @@ -402,6 +412,9 @@ \subsection{Device Initialization}\label{sec:Device T=
ypes / Block Device / Devic
>  \item the device MUST initialize padding bytes \field{unused2} to 0.
>  \end{itemize}
>
> +The device MUST NOT acknowledge FEATURES_OK if the driver sets
> +VIRTIO_BLK_F_REQ_FLAGS_OUT_FUA without VIRTIO_BLK_F_REQ_FLAGS.
> +
>  \subsubsection{Legacy Interface: Device Initialization}\label{sec:Device=
 Types / Block Device / Device Initialization / Legacy Interface: Device In=
itialization}
>
>  Because legacy devices do not have FEATURES_OK, transitional devices
> @@ -434,7 +447,7 @@ \subsection{Device Operation}\label{sec:Device Types =
/ Block Device / Device Ope
>  \begin{lstlisting}
>  struct virtio_blk_req {
>          le32 type;
> -        le32 reserved;
> +        le32 flags;
>          le64 sector;
>          u8 data[];
>          u8 status;
> @@ -459,6 +472,16 @@ \subsection{Device Operation}\label{sec:Device Types=
 / Block Device / Device Ope
>  #define VIRTIO_BLK_T_SECURE_ERASE   14
>  \end{lstlisting}
>
> +The \field{flags} bitfield is ignored by the device unless
> +VIRTIO_BLK_F_REQ_FLAGS is negotiated, in which case each bit's meaning d=
epends
> +on the request type. The following flags are currently defined (the nume=
ric
> +value is the bit index in the \field{flags} bitfield):
> +
> +\begin{description}
> +\item[VIRTIO_BLK_REQ_FLAG_OUT_FUA (0) for VIRTIO_BLK_T_OUT requests] For=
ce Unit
> +    Access (FUA) flag.
> +\end{description}
> +
>  The \field{sector} number indicates the offset (multiplied by 512) where
>  the read or write is to occur. This field is unused and set to 0 for
>  commands other than read, write and some zone operations.
> @@ -873,6 +896,11 @@ \subsection{Device Operation}\label{sec:Device Types=
 / Block Device / Device Ope
>
>  A driver SHOULD accept the VIRTIO_BLK_F_RO feature if offered.
>
> +If VIRTIO_BLK_F_REQ_FLAGS is negotiated, a driver MUST NOT set a bit in
> +\field{flags} (e.g., VIRTIO_BLK_REQ_FLAG_OUT_FUA) unless the correspondi=
ng
> +feature (e.g., VIRTIO_BLK_F_REQ_FLAGS_OUT_FUA) for the request type in q=
uestion
> +(e.g., VIRTIO_BLK_T_OUT) is negotiated.
> +
>  A driver MUST set \field{sector} to 0 for a VIRTIO_BLK_T_FLUSH request.
>  A driver SHOULD NOT include any data in a VIRTIO_BLK_T_FLUSH request.
>
> @@ -1000,14 +1028,21 @@ \subsection{Device Operation}\label{sec:Device Ty=
pes / Block Device / Device Ope
>    \field{writeback} field in configuration space was 0 \textbf{all the t=
ime between
>    the submission of the write and its completion};
>
> -\item\label{item:flush3} a VIRTIO_BLK_T_FLUSH request is sent \textbf{af=
ter the write is
> +\item\label{item:flush3} the VIRTIO_BLK_F_REQ_FLAGS_OUT_FUA feature was
> +  negotiated and the VIRTIO_BLK_REQ_FLAG_OUT_FUA bit in \field{flags} wa=
s set in
> +  the write request (regardless of whether the VIRTIO_BLK_F_FLUSH or
> +  VIRTIO_BLK_F_CONFIG_WCE features were negotiated, and regardless of th=
e
> +  current cache mode as expressed by the value of the \field{writeback} =
field in
> +  configuration space).
> +
> +\item\label{item:flush4} a VIRTIO_BLK_T_FLUSH request is sent \textbf{af=
ter the write is
>    completed} and is completed itself.
>  \end{enumerate}
>
>  If the device is backed by persistent storage, the device MUST ensure th=
at
>  stable writes are committed to it, before reporting completion of the wr=
ite
> -(cases~\ref{item:flush1} and~\ref{item:flush2}) or the flush
> -(case~\ref{item:flush3}).  Failure to do so can cause data loss
> +(cases~\ref{item:flush1}, \ref{item:flush2} and~\ref{item:flush3}) or th=
e flush
> +(case~\ref{item:flush4}).  Failure to do so can cause data loss
>  in case of a crash.
>
>  If the driver changes \field{writeback} between the submission of the wr=
ite
> --
> 2.51.1
>

