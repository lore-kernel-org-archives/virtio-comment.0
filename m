Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C9F2F8E87
	for <virtio-comment@lists.linux.dev>; Thu, 28 May 2026 05:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779947726; cv=pass; b=We1fVBwxJ14G1blnXBJnfxesrzMLvnC/IWiKIa+D2fheq0UIe9RadaRKOLpB6Y64dVBbsvBnLexsFFY1K7lRd2bKJ4yGXRLzgZBhE+5So48W5IaIVTYsYWwdG3b2sk7tevoHxBIsSY0LmaYpGzLTJDGmHdDd1mCbh2zRcFaq18Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779947726; c=relaxed/simple;
	bh=dZDvb3DbUuwDGQTQO613z6j31uDvtwlQ8QlBaEvYEwU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=UGxUFS/U2WnY5OTem90VdjYpqkoe6/snsnuxUwn7dP6Nxw7l1YdUmLD3yh0yzDg5E5vOTBf6GCuc1NXYVAdreZPNFXp0v+FFHjwwCoVTh/UbgHkuoWkK+h4eIAS5wJpDO/w5bQRqhtvfN+409064JyI/XEfuZ/XBIAu1yxSdwpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p/1VjoT6; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p/1VjoT6"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490426d72f7so56868265e9.3
        for <virtio-comment@lists.linux.dev>; Wed, 27 May 2026 22:55:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779947724; cv=none;
        d=google.com; s=arc-20240605;
        b=ceCeZCPSIj0vQlfQutbh79UT31yZA+mCWNvSszZyA43eg3aMmiBKA/iSkEHKj/aX4f
         aqUCe/upIafqSz2uf+jIC51Y7vE2gi4O4utCPHvrD6DERFN9G7a2YucBhVXzT0ZTdPiX
         ciLV+8igpzXETMk5pHWDe9X6Hl2ZMbwXtDhlsHFI1tzlkWEzvqiF89OK25mbsN286T24
         Yj7mCZkvgAMDMVqfdU4o7i5AfVCdI9xfU03h9BZ2j9BTdMNQQjm3MEUo5D5bdeI5ngFr
         xhUUYbf9bl7ke90ewR27Ew25ivajGzEHBJ9zfacc/qeCOrI1Mt7N8cQry7hjtFNxz13P
         mGEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aGSXFhcdpHDmmVtP3ru94NQttujUlcPSLzhUeWnzJ/Q=;
        fh=loU4DmrFD2CmAWlXP7CniSyp0WE7EA7NuurJAzRbxKk=;
        b=Gj+2t2A+RU9dPZfYdLmRcuXl3XlY7PTNcFX7jQZfo27/fhxbz6SPC0goOjqetmVpy1
         5M61t/B+SzKaDBPv+9c8tAwiESm5X4LGdXwhPMboCJn521sRajq6tnPxX1SfrraA9VRT
         qJU2s7gLy/ZgmLKnUCxmjFOh1FJg4Gz+B2jJPzX/XjnCpn16Ua54r6V7n+3nux+0PDuJ
         YC34UzTKlsL/oO/BWVK/nEG3Sdi0/kgqYEGtpbGsNEzAsys+WO4g+AQCOHqhaC5tkpOm
         CuG8JqY5j+z/65PUn8UOboFeBvlPhz4Uy3ojYHwsFrixkw39LIAQnC0KWpD5xKRR2XpD
         ysMA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779947724; x=1780552524; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGSXFhcdpHDmmVtP3ru94NQttujUlcPSLzhUeWnzJ/Q=;
        b=p/1VjoT6OEoDq9yw7JA9/0v1XVcBUE/V19YX4GGLyOe0JDDNLtjuucWVeubjQwBRaA
         GOpHQvfLaOZyO5L5rVXy7Uz31NBypw9jLygSp/s7kJn8nvGeMCoYHsoCke6hLBuS7ZI/
         feSb+G3818MHCo5DSaPgXVstM/J3IERAgpaiE0yY0kkvaE/WyBgQZGT5cJhdjkbBCWMg
         DJWzHe1Tv5EJv7aWXWmJEdizgs9wlG1NgvRiae7SkpcXRFLUD7zgDz2+89zVLZml+ZpP
         /OYXWMobECntezKyBVd1yPbH4UGdR2OzyEl9H3F+JqO/ygLmAmKkdIq8xA8pE+j+FfYY
         8XRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779947724; x=1780552524;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aGSXFhcdpHDmmVtP3ru94NQttujUlcPSLzhUeWnzJ/Q=;
        b=SC6yEpIuqg7h5FhlUKohSW3B8ajNolTzcYSRMI13mEXTRFrQmd1pMCLR+Vjk7LqRgJ
         dSGmm5KkrsRrc4yq1i13orj5OKyOazxicsgrZqkWh3yySLRGUKIYtf2+dhqpMpdcNcBx
         oC1o/e18pTKWlV+JKcFbiJTzUFfKumg6t/j73j+KxeEDfclf5bb5CH9CsDjYrBMB/7vY
         yctwTsudpQg+RJAUahivOy+bsf4qNN5HUg9oE14Iin2TV/XG9/Wj5/xl6A3gWXThuOeI
         sdXEJFGm3MuGorXUQ84rrHeCY+JqE3vnT8NQiZn4B55ky75IEDn1I3F+3boCBAF6AOEa
         J2Jg==
X-Gm-Message-State: AOJu0YzSVRjJeCTQQ4sGCcwKZ7zlEVFtjBpvHhQtLL/BgE36e7kv3wcW
	p7NOwaMxViqZPkoyeQQwwU8YkKluxWzBOxfTv0cbMMlh6j4rDAfrychZ3vLSgETzZx/OcQt1zZg
	9HPafToGpyQsVFlPSeo/B3uMpRdupsfLwIiorxrjO8ORoSJ6FLwAQbq4=
X-Gm-Gg: Acq92OEs0vweOiXqCrTgdKG7snc7nCeiLhwrtljKvRB3nh7n27d4BSf0ItwxK/SFh8k
	gJYNq7HaK9dppGnzC7I8egCkbpkz7DVjUqElzU9Gg33d2vnsQ+cvqh2qKhbP1dKTGBBzNOVKzNB
	QU76K33Z7h/mOPZOSBpFml8uaK0j3Tf2vXy5KvCZcFVvp/oNCECdBvLe1RaBP54fBGCh6sLIZSy
	lX8LvP4dU6IOU+AjiqNl+8siiH9v25tILrs0mf+2vy77jaQwmceJRcur/YKny6bWbfo2OGar4vg
	Lck8V3MD2DNzAmXirb0W1elX0U2l2ctiZUfI+YXAc7q8QVM29SAYUVWMJbtp
X-Received: by 2002:a05:600c:5298:b0:48f:e230:1d12 with SMTP id
 5b1f17b1804b1-490428dd63emr441963475e9.31.1779947723606; Wed, 27 May 2026
 22:55:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260515-virtio-gpu-missing-structs-v2-1-c45dec740af7@linaro.org>
In-Reply-To: <20260515-virtio-gpu-missing-structs-v2-1-c45dec740af7@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Thu, 28 May 2026 08:54:57 +0300
X-Gm-Features: AVHnY4Iw-HnkKoewwznBVS-SVx2TqQVbIvVt1S8vprv1evaJwWtJg6RDqTIZxDU
Message-ID: <CAAjaMXZ25K1kHeAxesKOSfgxCDkuefzouQmC_iWwDwgDwskqug@mail.gmail.com>
Subject: Re: [PATCH v2] gpu: add missing controlq (3d) struct listings
To: virtio-comment@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Could we open a voting ballot for these changes?

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/239

On Fri, May 15, 2026 at 12:14=E2=80=AFPM Manos Pitsidianakis
<manos.pitsidianakis@linaro.org> wrote:
>
> Lifted from include/uapi/linux/virtio_gpu.h with adjustments.
>
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/239
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> ---
> Changes in v2:
> - s/destroyes/destroys (thanks Matias)
> - Link to v1: https://lore.kernel.org/virtio-comment/20260304-virtio-gpu-=
missing-structs-v1-1-654218322e6a@linaro.org
> ---
>  device-types/gpu/description.tex | 75 ++++++++++++++++++++++++++++++++++=
+++++-
>  1 file changed, 74 insertions(+), 1 deletion(-)
>
> diff --git a/device-types/gpu/description.tex b/device-types/gpu/descript=
ion.tex
> index ac3b427725f6036ca069b398fdde712cab833225..b61f298cfb82d2577f7e04526=
62c5b92a92bcb1e 100644
> --- a/device-types/gpu/description.tex
> +++ b/device-types/gpu/description.tex
> @@ -749,21 +749,94 @@ \subsubsection{Device Operation: controlq (3d)}\lab=
el{sec:Device Types / GPU Dev
>  If the lower 8-bits of the \field{context_init} are zero, then the type =
of
>  the context is determined by the device.
>
> -\item[VIRTIO_GPU_CMD_CTX_DESTROY]
> +\item[VIRTIO_GPU_CMD_CTX_DESTROY] destroys a context.
> +  Request data is \field{struct virtio_gpu_ctx_destroy}.
> +  Response type is VIRTIO_GPU_RESP_OK_NODATA.
> +
> +\begin{lstlisting}
> +struct virtio_gpu_ctx_destroy {
> +        struct virtio_gpu_ctrl_hdr hdr;
> +};
> +\end{lstlisting}
> +
>  \item[VIRTIO_GPU_CMD_CTX_ATTACH_RESOURCE]
>  \item[VIRTIO_GPU_CMD_CTX_DETACH_RESOURCE]
>    Manage virtio-gpu 3d contexts.
> +  Request data is \field{struct virtio_gpu_ctx_resource}.
> +  Response type is VIRTIO_GPU_RESP_OK_NODATA.
> +
> +\begin{lstlisting}
> +struct virtio_gpu_ctx_resource {
> +        struct virtio_gpu_ctrl_hdr hdr;
> +        le32 resource_id;
> +        le32 padding;
> +};
> +\end{lstlisting}
>
>  \item[VIRTIO_GPU_CMD_RESOURCE_CREATE_3D]
>    Create virtio-gpu 3d resources.
> +  Request data is \field{struct virtio_gpu_resource_create_3d}.
> +  Response type is VIRTIO_GPU_RESP_OK_NODATA.
> +
> +\begin{lstlisting}
> +#define VIRTIO_GPU_RESOURCE_FLAG_Y_0_TOP (1 << 0)
> +struct virtio_gpu_resource_create_3d {
> +        struct virtio_gpu_ctrl_hdr hdr;
> +        le32 resource_id;
> +        le32 target;
> +        le32 format;
> +        le32 bind;
> +        le32 width;
> +        le32 height;
> +        le32 depth;
> +        le32 array_size;
> +        le32 last_level;
> +        le32 nr_samples;
> +        le32 flags;
> +        le32 padding;
> +};
> +\end{lstlisting}
>
>  \item[VIRTIO_GPU_CMD_TRANSFER_TO_HOST_3D]
>  \item[VIRTIO_GPU_CMD_TRANSFER_FROM_HOST_3D]
>    Transfer data from and to virtio-gpu 3d resources.
> +  Request data is \field{struct virtio_gpu_transfer_host_3d}.
> +  Response type is VIRTIO_GPU_RESP_OK_NODATA.
> +
> +\begin{lstlisting}
> +struct virtio_gpu_box {
> +        le32 x, y, z;
> +        le32 w, h, d;
> +};
> +
> +struct virtio_gpu_transfer_host_3d {
> +        struct virtio_gpu_ctrl_hdr hdr;
> +        struct virtio_gpu_box box;
> +        le64 offset;
> +        le32 resource_id;
> +        le32 level;
> +        le32 stride;
> +        le32 layer_stride;
> +};
> +\end{lstlisting}
>
>  \item[VIRTIO_GPU_CMD_SUBMIT_3D]
>    Submit an opaque command stream.  The type of the command stream is
>    determined when creating a context.
> +  Request data is \field{struct virtio_gpu_cmd_submit}, followed by the =
stream bytes.
> +  Response type is VIRTIO_GPU_RESP_OK_NODATA.
> +
> +\begin{lstlisting}
> +struct virtio_gpu_cmd_submit {
> +        struct virtio_gpu_ctrl_hdr hdr;
> +        le32 size;
> +        le32 padding;
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +  \item[\field{size}] the size of the opaque command stream in bytes.
> +\end{description}
>
>  \item[VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB] maps a host-only
>    blob resource into an offset in the host visible memory region. Reques=
t
>
> ---
> base-commit: 15f488c162107f7b52fb2e4d0f36a2349fe9d3a9
> change-id: 20260304-virtio-gpu-missing-structs-dc8f75a7d370
>
> Best regards,
> --
> Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>
