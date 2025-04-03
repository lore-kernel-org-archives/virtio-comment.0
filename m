Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3732127706
	for <virtio-comment@lists.linux.dev>; Thu,  3 Apr 2025 16:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743697642; cv=none; b=KRz3d9IYmWvP6P7h+Iyv/HBG5NIxkH2AVumBXaP59kWvUtPpyRbUBnH8pfKKxdLoaH2miUG4xhyF40CIfas2zL2qGN1V61v6kZjNxzidc0m4HbwUGHgbJpzq4hMRwYIIxeEEHBhuJOo9gMj4KS9b736bUggOlFaGM+nMWYGIvoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743697642; c=relaxed/simple;
	bh=1SLVS1Y7uhRq7a0ZtET4OMX2rKb8ohwj00r64yfMYYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=E7VKDeJebHgQJqjVkm/Ni/FCE50+SE94wI+zpmEYWibXjOTQ7hVd84NAsJthxcsn5Zr7fGy9kYBiIuZ6pPTJGjek3v88T0WdsLLsuGWRgetyP+J9XgNhe6A//tdfJFmHmxvIC0TyGb/HLHg/HrI0v3M2RSHBCYu8NKM+khSo/to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AomxJA32; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AomxJA32"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743697638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BIjkHQpi++VuPCU4w8fkAB8DjCU96f8jeDGmL0Z2BGs=;
	b=AomxJA32Apa1hrORYQv2KQOvMjYVsw2DYBgnbiNwOgl6sDcev6rgkSE6fYgtPf7XzGd60I
	/K+KdmZ9WMU8ZFx84CwQOKFy99riq+mJ44oUO4If2cSDAfiIs0X0YmojBvqxROKmnO8PVE
	hPL/UGAxpqiw5m5+Df9uP4yA4GC+p2E=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-83-JVCj38r7PsuXjaQnCV8c-A-1; Thu, 03 Apr 2025 12:27:17 -0400
X-MC-Unique: JVCj38r7PsuXjaQnCV8c-A-1
X-Mimecast-MFC-AGG-ID: JVCj38r7PsuXjaQnCV8c-A_1743697637
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43ced8c2eb7so8594885e9.1
        for <virtio-comment@lists.linux.dev>; Thu, 03 Apr 2025 09:27:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743697636; x=1744302436;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BIjkHQpi++VuPCU4w8fkAB8DjCU96f8jeDGmL0Z2BGs=;
        b=USKXNXTO1N9xP7+qNtDqQYezz3927d8thXfWDQSXn6Q56dEjKGHEUGodepYIs4uMdH
         Tsy8PuObEIVlW25IqMZouEx6JqJJl2hqzIf7T5siyD6SR0KOVRXuECETWX0K3wPlzKnY
         EdxYdiUUTOQOPe8gMxB5tVptN//WOgzcP6IWxx6LK54Y787TRf59djRkQkqnPIHuN/t+
         ldpXG49O7mAj0Cmb7T1obG/ITLlsQnFXBCe7wzj/YF+tarCMrV4TZnvaX2WGjaPbsvcD
         TEEs6c5jXbMz+AO0Gs8CzIyLfCZllCj/YY1b+2Gmkl1srvNBMIVmyRxm0O93MrWFSyLt
         MSxA==
X-Gm-Message-State: AOJu0Yy5Hhg9391Y2Esaq+WWAvmuNR5SgKNGac/c6rpgKzBAkP/G5MOm
	xUXdS0ULC6JYtqk/TGe5Uiew1NtUS2ukMZhn/G65TmanAw0NFj2qzICMIfnYu3FAdf9oNDEi2ED
	Xv8xCoL9wWaLz9wSF602KEadH7CgL+fmY7PSHvQRZ5lzBz3MM1zVIuGq1PvZHFTx9
X-Gm-Gg: ASbGncuNhBS5w+5UHgNvexnZEK1p5L6OIe0nwSBtYUaJBTJarn8V9tUQLTFVxhtT9Xv
	zfwiPH2bbU8qTdkvOgGJtGJCz9Ebdo2CZi4xoR5VjkvUiijEHURvqw/tMuPR9iN8zQv/xBRGcek
	YMh+b5sB5NjspCS6Jw/7sm4TyK/qAJ9yX+d+zlFRoQ3tHF4HoMZHslJvg4QrNaS/9yjT06PadrC
	G3Z9xG2O/0RFisFrXzFgfSr/dO5egMdsmBWII1ewbWGy2mfBIO03rOKMLzecXQrF7roE/YBjRnq
	dvVQkv+r3g==
X-Received: by 2002:a05:600c:4fc8:b0:43d:9f2:6274 with SMTP id 5b1f17b1804b1-43db6248ff6mr209111055e9.14.1743697636540;
        Thu, 03 Apr 2025 09:27:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFX3K+PQuzk0LJWL51tprmvk+2XCKsy46SnSifT2o+eW/10pPsOyywi/DhpGKd5Q/bw36Q/KA==
X-Received: by 2002:a05:600c:4fc8:b0:43d:9f2:6274 with SMTP id 5b1f17b1804b1-43db6248ff6mr209110745e9.14.1743697636163;
        Thu, 03 Apr 2025 09:27:16 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec17b0dbesm26089935e9.33.2025.04.03.09.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 09:27:15 -0700 (PDT)
Date: Thu, 3 Apr 2025 12:27:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Cc: virtio-comment@lists.linux.dev, dmitry.osipenko@collabora.com,
	gurchetansingh@chromium.org, parav@nvidia.com
Subject: Re: [PATCH] virtio-gpu: support blob alignment information
Message-ID: <20250403122328-mutt-send-email-mst@kernel.org>
References: <20250401174203.161991-1-slp@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250401174203.161991-1-slp@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5WIoXp5YZIXbdeKJEmDkGcvaLGlz5u5Va0HqKPFM-9w_1743697637
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 01, 2025 at 01:42:03PM -0400, Sergio Lopez wrote:
> Allow the device to require certain alignment constrains for blob
> resources by extending the device configuration with the field
> "blob_alignment" and introducing the VIRTIO_GPU_F_BLOB_ALIGNMENT
> feature.
> 
> Signed-off-by: Sergio Lopez <slp@redhat.com>
> ---
>  device-types/gpu/description.tex | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/device-types/gpu/description.tex b/device-types/gpu/description.tex
> index 4435248..8e5258d 100644
> --- a/device-types/gpu/description.tex
> +++ b/device-types/gpu/description.tex
> @@ -37,6 +37,8 @@ \subsection{Feature bits}\label{sec:Device Types / GPU Device / Feature bits}
>    resources is supported.
>  \item[VIRTIO_GPU_F_CONTEXT_INIT (4)] multiple context types and
>    synchronization timelines supported.  Requires VIRTIO_GPU_F_VIRGL.
> +\item[VIRTIO_GPU_F_BLOB_ALIGNMENT (5)] configuration field
> +  \field{blob_alignment} is valid. Requires VIRTIO_GPU_F_RESOURCE_BLOB.
>  \end{description}
>  
>  \subsection{Device configuration layout}\label{sec:Device Types / GPU Device / Device configuration layout}
> @@ -52,6 +54,7 @@ \subsection{Device configuration layout}\label{sec:Device Types / GPU Device / D
>          le32 events_clear;
>          le32 num_scanouts;
>          le32 num_capsets;
> +        le32 blob_alignment;
>  };
>  \end{lstlisting}
>  
> @@ -67,6 +70,8 @@ \subsubsection{Device configuration fields}
>    supported by the device.  Minimum value is 1, maximum value is 16.
>  \item[\field{num_capsets}] specifies the maximum number of capability
>    sets supported by the device.  The minimum value is zero.
> +\item[\field{blob_alignment}] specifies the byte alignment required by
> +  the device for resource blobs.

byte alignment means no alignment restrictions.
I think "alignment, in bytes"?
I also think you mean the minimal alignment.

Also please specify the legal values, like other fields do.
Is 2G alignment always going to be sufficient, in your opinion?

>  \end{description}
>  
>  \subsubsection{Events}
> @@ -672,6 +677,9 @@ \subsubsection{Device Operation: controlq}\label{sec:Device Types / GPU Device /
>  resource. There is no restriction on the image/buffer view the driver
>  has on the blob resource.
>  
> +If VIRTIO_GPU_F_BLOB_ALIGNMENT is set, \field{size} must be aligned to
> +\field{blob_alignment} as defined in the device configuration.
> +

set where? you mean has been negotiated?

>  \item[VIRTIO_GPU_CMD_SET_SCANOUT_BLOB] sets scanout parameters for a
>     blob resource. Request data is
>    \field{struct virtio_gpu_set_scanout_blob}. Response type is
> @@ -776,6 +784,10 @@ \subsubsection{Device Operation: controlq (3d)}\label{sec:Device Types / GPU Dev
>  };
>  \end{lstlisting}
>  
> +If VIRTIO_GPU_F_BLOB_ALIGNMENT is set,

same

> \field{padding} and \field{offset}
> +must be aligned to \field{blob_alignment} as defined in the device
> +configuration.
> +
>  \item[VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB] unmaps a
>    host-only blob resource from the host visible memory region. Request data
>    is \field{struct virtio_gpu_resource_unmap_blob}.  Response type is
> -- 
> 2.49.0

