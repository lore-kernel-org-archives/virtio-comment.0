Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AEF35F5FB
	for <virtio-comment@lists.linux.dev>; Thu, 21 May 2026 09:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779354135; cv=none; b=qMNNjZypnXXXrHBsE0FTPqDlAdi20HiNPvIaWu7NqNHemDCZBBsyWu8pq20G7nWA+8PnlZbbPJHLlVhgLrCfnHR43YU0zHKjMJBJNonhfqcsccBTAJZIrAF+69I3xGASJYsWaR8NJT2J0NO+YpkAavYGdGZSJx18fKxrZfreeyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779354135; c=relaxed/simple;
	bh=zdTkUAb9QpLhWsH5blF7fHj3HN3LPhr/xH0Qg4qGtN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=SHRUnsqM5m6v9Z403+vZGViaBC/HVT2WYcYeMXaIx4XeD1Z50F+GdTFxK+rGAK/iI9mgU6L3LuXsOReeds2E2H7pk5Tm07APbuhW4ZZ4DhnjPT8kTB6lppRMx08tGX49C2HZfhQZeX1bgSQhcvwFUT5eoRr2rc4EP9QvXLKNjZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fLN11I9k; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fLN11I9k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779354133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=23Cl9ZH+TWWlw+zCc84xyl3hdGt1jLkvSBw3KbUdrQE=;
	b=fLN11I9kd14quEPYdydozog5g/4yLYEmrDXj94SIdgoGEHHc1cQDWCrsfJQMLgYldzUTc2
	SNIkhgSrVOUCmQCG/6Jftv+wKiK4Pf+1Oq11/zjKTGj/ATApKROxVNZpz9fdn84KLaMxFw
	i+Ci5zpb+RULnt4TB5ZSRXvt6695pYQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-Xwh9uHT9NX2mXNSX0PFU6g-1; Thu, 21 May 2026 05:02:11 -0400
X-MC-Unique: Xwh9uHT9NX2mXNSX0PFU6g-1
X-Mimecast-MFC-AGG-ID: Xwh9uHT9NX2mXNSX0PFU6g_1779354130
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-48fd396daedso36242125e9.0
        for <virtio-comment@lists.linux.dev>; Thu, 21 May 2026 02:02:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779354130; x=1779958930;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=23Cl9ZH+TWWlw+zCc84xyl3hdGt1jLkvSBw3KbUdrQE=;
        b=Lz0NKG2oBxcY/02+4TzF1z702ahBl1LDvNJi2HlC4r6QE8C7L3HVYf1mkRzGHchPMS
         uPMAuLbh8bmaPYmLUIs3e40QMaqe+5QAsqUHOGrmqB+RSuZyik6Pr6688onWRX+VG+md
         f0MmJLkSZ4E5Fw3lMjGpDGGmo1fS4Kahc2haKBiwf8D0BmcI5BKKzcy554DdASF0A8ua
         CBAp3tmg8Pa2JqwaNmBeUHH3VofnVTDA7VjqR5+bcUsXeauLm/b031Ytju29zyabPmui
         nFdXm0L3RHk1OXQaYnGcQIDovZWEj0rIRMvvycqs6MZ8VQrvoRlI9Jjg+WPMHWeViLVl
         KCDw==
X-Gm-Message-State: AOJu0YzriQnqavWEualMdx0YoQ7i7gYaCD8XfvYId8PPdWxOPDkpb9xU
	W5BhmZnDxH8JuKIt+27dOjJacA24Eh035QEe/VxqQciPSjg7MCpo8sYZ6Ufr8JXpaZH/Ms5Faen
	Sg9YlgwbvRQCNaKqlAC58GiJI0eMT2MtlRjUQDiRMPaRZLS4N7wAvR2+FKf6/vKhpWlWt
X-Gm-Gg: Acq92OHtjjMWqZF6Zj3TnJbBEnPqS+pk55pw7ShKreCfGxMSFQxfy4/Jhi5tmOWxqMY
	r9CzZSU3eBJ9uI7+iviD9JOtIvRFhTU5DEeIeRExyNfR9bhMmZQxKVmPHOBJlbEiSCZwP6YWhoY
	SNYpoL4qvX9jV25w1/KnKgFBZ01IQK9lIe+nUsFsz5/1VvRCYJeAKz/+FE0FaHTk2TrSISt/v5j
	MPp7et2WeFzDFbtYbqLhWL8Dn0yGtkgImPTduWkQukiEkjGgnUg4/9szbCP7+JCa/dAO5j3NRLj
	8cLDDzOU4rVHNEfB8g/6HmC0MOPEsZgQ9K/FtkRWwZFSqSkTOWPYak0sVVVatae+t5qGBRzFYCT
	koBnwNpvql1O4MKw=
X-Received: by 2002:a05:600c:3147:b0:48a:52d4:888c with SMTP id 5b1f17b1804b1-49036033411mr26719135e9.3.1779354129717;
        Thu, 21 May 2026 02:02:09 -0700 (PDT)
X-Received: by 2002:a05:600c:3147:b0:48a:52d4:888c with SMTP id 5b1f17b1804b1-49036033411mr26718515e9.3.1779354129224;
        Thu, 21 May 2026 02:02:09 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm12284575e9.14.2026.05.21.02.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 02:02:07 -0700 (PDT)
Date: Thu, 21 May 2026 11:02:05 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: virtio-comment@lists.linux.dev,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v2] gpu: add missing controlq (3d) struct listings
Message-ID: <ag7KDU8nrhGja6+x@fedora>
References: <20260515-virtio-gpu-missing-structs-v2-1-c45dec740af7@linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260515-virtio-gpu-missing-structs-v2-1-c45dec740af7@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ft51xRu9V1bjh_61bNOgVVoCBJHHvHFELBr8UMQKd7w_1779354130
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, May 15, 2026 at 12:14:31PM +0300, Manos Pitsidianakis wrote:
> Lifted from include/uapi/linux/virtio_gpu.h with adjustments.
> 
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/239
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> ---
> Changes in v2:
> - s/destroyes/destroys (thanks Matias)
> - Link to v1: https://lore.kernel.org/virtio-comment/20260304-virtio-gpu-missing-structs-v1-1-654218322e6a@linaro.org
> ---


Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>

Thanks.

>  device-types/gpu/description.tex | 75 +++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 74 insertions(+), 1 deletion(-)
> 
> diff --git a/device-types/gpu/description.tex b/device-types/gpu/description.tex
> index ac3b427725f6036ca069b398fdde712cab833225..b61f298cfb82d2577f7e0452662c5b92a92bcb1e 100644
> --- a/device-types/gpu/description.tex
> +++ b/device-types/gpu/description.tex
> @@ -749,21 +749,94 @@ \subsubsection{Device Operation: controlq (3d)}\label{sec:Device Types / GPU Dev
>  If the lower 8-bits of the \field{context_init} are zero, then the type of
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
> base-commit: 15f488c162107f7b52fb2e4d0f36a2349fe9d3a9
> change-id: 20260304-virtio-gpu-missing-structs-dc8f75a7d370
> 
> Best regards,
> -- 
> Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> 
> 

