Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61C1188006
	for <virtio-comment@lists.linux.dev>; Thu, 10 Apr 2025 13:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744292321; cv=none; b=EA1y2k7+Hj/4aL+ccjL3s9OGFNuYaI8I8equ4TqfmFrCFedOhZg2F5jFSvPGZ0zQD3kf42Ffy8CT8jnCW7jeM7xDb45V8qbQyHwyDakwDpO8HDUSOUtM/U9Dh0eqTEr/nha63xz+P5s2+lbeTUgjJfo0RNf15DRPrwR6KwgPMdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744292321; c=relaxed/simple;
	bh=fmztGZy7NYGshBHQKK4Hww9kCHihWhz7qCVbRU6BzHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=bgry+0dpEMXhMO63WIcE9Jssmbl//zEjAqSbEmqXo+/WhrKSEcC92prdbe9w1gLGGtJe9H0BSl3vx1HZ9xA08IOwRnrMzxSqguKKr9vXmMPmGOqffEvxssQj9VXJi3QdflTYyWx6FTugq54AacYjQouF9XBqdj3Pep6MCGxontc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CM3AZK6d; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CM3AZK6d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744292318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6vxYj5pphXiKQDipB51FbVBIkIZQPXk3C84QzQIk5p0=;
	b=CM3AZK6dQB8L2T2iFfpPq0ykgbVHIjrbxSBxblZ6jOvOWmfp0WlPRUfcvt2ch1T47I5jRU
	5tGvITryCROea5UPbMJq0Ec5dYvEUiI/WykqG+lo1wcOIeuKZgZxHHhuW5MkxGVoZiZ03c
	SohbCBhq24ehPtgIMQg8MnSbaH/0LWo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-530-EQysXsD-Pk-qpjFGwknpoA-1; Thu, 10 Apr 2025 09:38:37 -0400
X-MC-Unique: EQysXsD-Pk-qpjFGwknpoA-1
X-Mimecast-MFC-AGG-ID: EQysXsD-Pk-qpjFGwknpoA_1744292316
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d3b211d0eso10726335e9.1
        for <virtio-comment@lists.linux.dev>; Thu, 10 Apr 2025 06:38:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744292316; x=1744897116;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vxYj5pphXiKQDipB51FbVBIkIZQPXk3C84QzQIk5p0=;
        b=jv06TS4QwehiYgg2WQtd3DGOTW1p97EcHAV75xmJ5aZhC+VRo1WDPR0hZHhUg85Rgq
         wwHPQQBqSQG08cAb4Ca3OqAyVPOOWl3FZRa03+Hi9dDzIcnevsGaRB2fuvgleuLg+V4c
         xSCtN2JGjsry9XwSU9/8dpgDpiQhFRgharBvrxVQQlEwhx+6aXUwH+uohIx155e2uROU
         6cdhV1sJxFwBO/4Cv7/aCKkf1Fj8sh4FW1g2R06OTgxsivgExPnU8c6BCo8K5JlKwqyD
         hhwEcKRF63NJirni/m/m0eMoPJOyhg2tx0sGYZm1NSVSBq17v8YI9qDMDvLha7MP+8Zq
         1W8A==
X-Gm-Message-State: AOJu0YxR9oeJJG8uUSS3DI7Gqiru9HGCaszwcpAP72bu8db0/fZZZRzU
	PF0vNbtUO1IQC/2s/yLkVFZDee7DTSFu0a7dxySGlfSjTEZ/fbRw/avVeOWdIVGh0km/eV09qH3
	H8/ix4A4QTdaamJ55rs9n15g5/kTn3m65XSWbI0V9BOXDZlWJc6tswJqgf2+tsJuP
X-Gm-Gg: ASbGncuJtoS+NjI0QhtuZIcgTcWBYdEcpqVsDBuz0BNc56olGnL8OFX6zZj1Jteb18C
	VQWh3Uei2XN4MUtuXmp8LKA2ivFVyx/Ay8a/wmO8Gz9XUA446tY1GS9rWsrHw7oME7OXCxx7egp
	JZ3siYvN1T4A8ABIk5OqWFcL0Z3XUd81z1me8lgnpT+L3YZDTV/o3BAeOZKnP4FV3tmJpor0L2m
	u4Sy5sGc3PDVg6qx2YolHtrmH/GCCq3sCfhiBhXGfW+lgflyvaQjOUZ2xX6x4Q1jdtJthCvj6xq
	At6v7Q==
X-Received: by 2002:a05:600c:13d6:b0:43b:c305:3954 with SMTP id 5b1f17b1804b1-43f2ea651a4mr20362145e9.8.1744292316064;
        Thu, 10 Apr 2025 06:38:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1UWFUutc6s0DLJIwZadAPaNKYCBhWHrI0UAdwWWUi1tREvhdppiD7euRYuXrF1OBMK9AgJQ==
X-Received: by 2002:a05:600c:13d6:b0:43b:c305:3954 with SMTP id 5b1f17b1804b1-43f2ea651a4mr20361955e9.8.1744292315680;
        Thu, 10 Apr 2025 06:38:35 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233a273fsm51433465e9.9.2025.04.10.06.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 06:38:35 -0700 (PDT)
Date: Thu, 10 Apr 2025 09:38:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Cc: virtio-comment@lists.linux.dev, gurchetansingh@chromium.org,
	dmitry.osipenko@collabora.com, parav@nvidia.com
Subject: Re: [PATCH v2] virtio-gpu: support blob alignment information
Message-ID: <20250410093545-mutt-send-email-mst@kernel.org>
References: <20250409212324.18134-1-slp@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250409212324.18134-1-slp@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: v7O-6F-CxCvay-6e96Afbz6g6ZGPaJWw7Xhs9CYBlb4_1744292316
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 09, 2025 at 05:23:24PM -0400, Sergio Lopez wrote:
> Allow the device to require certain alignment constrains for blob
> resources by extending the device configuration with the field
> "blob_alignment" and introducing the VIRTIO_GPU_F_BLOB_ALIGNMENT
> feature.

could you add a bit more info about the use-case here?

> v2:
>  - Clarify blob_alignment valid values (thanks Michael).
>  - Rephrase feature negotiation (thanks Michael).


versioning after --- please.

> 
> Signed-off-by: Sergio Lopez <slp@redhat.com>
> ---
>  device-types/gpu/description.tex | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/device-types/gpu/description.tex b/device-types/gpu/description.tex
> index 4435248..b3e75d3 100644
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
> @@ -67,6 +70,9 @@ \subsubsection{Device configuration fields}
>    supported by the device.  Minimum value is 1, maximum value is 16.
>  \item[\field{num_capsets}] specifies the maximum number of capability
>    sets supported by the device.  The minimum value is zero.
> +\item[\field{blob_alignment}] specifies the minimal alignment, in bytes,
> +  required by the device for resource blobs.  The value must a power of

is a power

> +  two.  Minimum value is 1, maximum value is 4294967296.
>  \end{description}
>  
>  \subsubsection{Events}
> @@ -672,6 +678,9 @@ \subsubsection{Device Operation: controlq}\label{sec:Device Types / GPU Device /
>  resource. There is no restriction on the image/buffer view the driver
>  has on the blob resource.
>  
> +If VIRTIO_GPU_F_BLOB_ALIGNMENT has been negotiated, \field{size} must be
> +aligned to \field{blob_alignment} as defined in the device configuration.

is aligned here. And add a cnformance statement using MUST.

> +
>  \item[VIRTIO_GPU_CMD_SET_SCANOUT_BLOB] sets scanout parameters for a
>     blob resource. Request data is
>    \field{struct virtio_gpu_set_scanout_blob}. Response type is
> @@ -776,6 +785,10 @@ \subsubsection{Device Operation: controlq (3d)}\label{sec:Device Types / GPU Dev
>  };
>  \end{lstlisting}
>  
> +If VIRTIO_GPU_F_BLOB_ALIGNMENT has been negotiated, \field{padding} and
> +\field{offset} must be aligned to \field{blob_alignment} as defined in the
> +device configuration.

same. here just a statement "are aligned". and add a conformance
statement.

> +
>  \item[VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB] unmaps a
>    host-only blob resource from the host visible memory region. Request data
>    is \field{struct virtio_gpu_resource_unmap_blob}.  Response type is
> -- 
> 2.49.0

