Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D84E33D4EE
	for <virtio-comment@lists.linux.dev>; Fri, 27 Mar 2026 16:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774627866; cv=none; b=P65TT7XDNgtI4xJhmO2r702OozYZwHF1Y4Id/MKgvU+dEePT6hPLs+dioETsCmK1F2FyXCy9QoCbdCaU8KjNadxt9ywsg1EKijmp8t4JU5M0C98znGfdIZkYs2ZC7mv0IcNL0MZUY/C9Cdxv4VAGMjDgAlTz7P3oVmhHDW+a57w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774627866; c=relaxed/simple;
	bh=dfPb8vCB+MYVIKzN2j/6KhpzX5kHCQFACyw2rIRMaXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=jUlTAG+QfyJdIV50/2VhFYZL7jesPgv23T0hEdRiL2YSNAYdzxxt5jjBNCwuUMgIlM7xJzXh69nHg7p1lUSnccm2BeOdDtM6/1tHEZZDdxeMt9O7APqPJduVReWJlGaF/rZ5zpkVge9YDMO9+OBrHyBi3KywXEDo4lfuRYxaZm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LiaSLFzF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LiaSLFzF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774627863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QcFkRpthIv+RmRrZGPuaRiDwT0NM8M7Sut8AhcWbWW8=;
	b=LiaSLFzFn2K59wU+CITkZfA6jeE7VBqjFgTJVrUapkJPnkLkyCVe5oH7TZeMJujs0L3bC1
	z++xHSIVe5g+wfDhSEw2QdwsvC5XZdMF69FY94T5OtbVt1NbJTkpI/J9KMt64BtSqFKwhU
	47iLcdszR6bDIXakGkyemZYGqjL4GWk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-32-Ka6R8R2tNwSPvCfUOvW-Ng-1; Fri, 27 Mar 2026 12:11:01 -0400
X-MC-Unique: Ka6R8R2tNwSPvCfUOvW-Ng-1
X-Mimecast-MFC-AGG-ID: Ka6R8R2tNwSPvCfUOvW-Ng_1774627860
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-485c45885e6so18441345e9.0
        for <virtio-comment@lists.linux.dev>; Fri, 27 Mar 2026 09:11:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774627860; x=1775232660;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QcFkRpthIv+RmRrZGPuaRiDwT0NM8M7Sut8AhcWbWW8=;
        b=Db+YzZOvP5itBZP/UnHXZ5/dx9lJmAa7uLYFcF3k55kyYrjXkRK5fJ1Uw6q11+N6uq
         4x27OPYWDg0zuJVlcNyKK4DnqxIINZ7YnlWDF38tBXJKyluwwGKydqvwODZMCubdQSpB
         c4Vv/2KHWfc38agS2X+wj3UULVFWPSdsoT18YaEfB48MceN8i0EuSfts01TRuBtutrqZ
         YEDY/3tEzkkSjqsqjPD98Sz/ZLvY5bpnSeXrk9EwW+HQYZNyaM3Nd4pfn02PPEThFBpw
         ODVAv55+nqdDa7e6UzhwaXzz2AqPVQ2dK3F55udu+Mv0ImyWlwwKBs6XtBpT3oHMEL7w
         q/vw==
X-Gm-Message-State: AOJu0YwYX+NuF7jcedJGA0Qo3m1XSCJuDYwwSTTN7KqYw15KmdVq9Uwn
	ztBupAwnbbsL67rxaCD7VkoDEPGQtabP/2xVd+qTX0oXnGzaZHXw9Cd2ava2kaw1oAsJX4G50u3
	i5KP+yJcW8u3eurYuSSZ1YnIKXtgGkqi31jCmd5aYuN9ICV30LfhwC/hcARvtLxO/caNQ7Y6jhx
	i1
X-Gm-Gg: ATEYQzyFeKCE8KbM43Q0iu9lam/WjctSJhIbTX7ysHHwp6ocuiKiw5rZxGZNtgjnb65
	NjCjv7b7ZqbHsYKNpr5cEW3p6z+82bySiW5/76J1yGWcC6NTJ57Xlmry15qCyidtD/DLq55wPLM
	BCA12UV4/8C+TlNLn2O02K3Whg8iNt0rQn93wL7M2xfExDqZn9HHbndqDQSqS8vjQlCWjZDn3Bi
	l0y4q2FjdmcOFVHNPGp7udkTjr6ibvpypXHbujbiHQDpYLsoXaK4cD2k3NboFQIBIq2b/z1kaXK
	RSxb8FQ5dJ4TmIe3rz817ZymUjCmNmb9t4FgLWWMt+7rUfxx74JmLn88hdAZPfnNIsPL/XNsnhy
	8Wc/3BFAu9GWWLYM=
X-Received: by 2002:a05:600c:5249:b0:487:386:3714 with SMTP id 5b1f17b1804b1-48727f7bb08mr54655105e9.17.1774627859977;
        Fri, 27 Mar 2026 09:10:59 -0700 (PDT)
X-Received: by 2002:a05:600c:5249:b0:487:386:3714 with SMTP id 5b1f17b1804b1-48727f7bb08mr54654475e9.17.1774627859378;
        Fri, 27 Mar 2026 09:10:59 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872719627esm22126065e9.33.2026.03.27.09.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:10:58 -0700 (PDT)
Date: Fri, 27 Mar 2026 17:10:57 +0100
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: virtio-comment@lists.linux.dev
Subject: Re: [PATCH] gpu: add missing controlq (3d) struct listings
Message-ID: <acasEcGGGUpzQExl@fedora>
References: <20260304-virtio-gpu-missing-structs-v1-1-654218322e6a@linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260304-virtio-gpu-missing-structs-v1-1-654218322e6a@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pk7ecb5fDQc4keSrkzuwApLoG-iHgKRFRaAAWCykbw8_1774627860
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Hello Manos,

I used Claude to review the patch and I added some comments, most of them
minors.

On Wed, Mar 04, 2026 at 09:41:17AM +0200, Manos Pitsidianakis wrote:
> Lifted from include/uapi/linux/virtio_gpu.h with adjustments.
> 
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/239
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> ---
>  device-types/gpu/description.tex | 75 +++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 74 insertions(+), 1 deletion(-)
> 
> diff --git a/device-types/gpu/description.tex b/device-types/gpu/description.tex
> index ac3b427725f6036ca069b398fdde712cab833225..5adf02c5ac9bd80fb0986bc3847cff0698f85801 100644
> --- a/device-types/gpu/description.tex
> +++ b/device-types/gpu/description.tex
> @@ -749,21 +749,94 @@ \subsubsection{Device Operation: controlq (3d)}\label{sec:Device Types / GPU Dev
>  If the lower 8-bits of the \field{context_init} are zero, then the type of
>  the context is determined by the device.
>  
> -\item[VIRTIO_GPU_CMD_CTX_DESTROY]
> +\item[VIRTIO_GPU_CMD_CTX_DESTROY] destroyes a context.

s/destroyes/destroys

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

VIRTIO_GPU_RESOURCE_FLAG_Y_0_TOP is not explained anywhere, however,
most of the defines in this file are not well explained so I think it is
OK.

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
Would it worth to explain some of these fields like for the field `size`
in `virtio_gpu_cmd_submit`?

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
> +  Request data is \field{struct virtio_gpu_cmd_submit}, followed by the stream bytes.
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
>    blob resource into an offset in the host visible memory region. Request
> 
> ---
> base-commit: 1ba6e8108644d598cf9c772bac7b856fb5c7df6b
> change-id: 20260304-virtio-gpu-missing-structs-dc8f75a7d370
> 
> Best regards,
> -- 
> Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> 
> 

