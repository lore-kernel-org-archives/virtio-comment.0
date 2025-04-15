Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5DA2973D7
	for <virtio-comment@lists.linux.dev>; Tue, 15 Apr 2025 13:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744723329; cv=none; b=CmF1abk9P5LurDADRDFSYN7W2WKaZHAYNyZVD39r6jQQoDhd8g45ZZ3Vv6zhOkOH4k7WvPdpH30FY40o2ASUeA5caPuxYRXHRpATqQ9A7F3qx1d+I6dla5V8kajAWJx5VTGwFg9DXJjjFzSg0Wo/aHWcMJwvLYf5w/gft5OxRbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744723329; c=relaxed/simple;
	bh=kk4TeZsy8yLJZlXbrPKDEhB/wobtskRUs/kckQ3/Thw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=m1dOyBgA0f8WveRXGDcyo66SNQ3czbTtz9yTD5k3NkfqJMHRvf0mqQbSo12xIYW7glKAxY/oJhPizlbpgVpGbzBtbc0Bs+F5UupvaHLcw1f45kqlB9jAjHqsIlqG9NY8sey+ScWAY4dKlw5euuS6YN7Kns7IHmozHSJsCxPYIyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bP5VetVW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bP5VetVW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744723325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Dt4Vjhq0rq7OLcr4sZgUKLVziHAYp7SVyfgy8YHFulE=;
	b=bP5VetVWE5MQb51k3zu4Ugb1F3F8FxC/RzcXFuxJ2bp2gEwD6Qot8jXabqD0rVAhE3LnUm
	EAjCn6bp0aTPNeIt7PbImA+68uDl8JEjlhjiROJzxEG40su6hZObYbCavloaMPu51McJHN
	70ojeCBhCzKa50HNkLTwMOVSEwGHId0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-EJHd-ffmONGQvyPmFrAUPg-1; Tue, 15 Apr 2025 09:22:02 -0400
X-MC-Unique: EJHd-ffmONGQvyPmFrAUPg-1
X-Mimecast-MFC-AGG-ID: EJHd-ffmONGQvyPmFrAUPg_1744723321
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43ea256f039so42268315e9.0
        for <virtio-comment@lists.linux.dev>; Tue, 15 Apr 2025 06:22:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744723321; x=1745328121;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dt4Vjhq0rq7OLcr4sZgUKLVziHAYp7SVyfgy8YHFulE=;
        b=bCK3v4ifw7+q8Qe1eh3UpW82PaG5at6Yhc20JkdlXKNpFpUll/yaaAsYwWvgNez0sU
         T4yf8h+BgZzqNgOv1Sq94BOqtzGZJpPP4vif9alROySoaN1q3+xhemtJLiZS9isz5uox
         CWjcC2hFvxVzW9cLvo89FRK0QXDxCWEeRAVURpe8FcUScjgJVmyUbipiqcFjb26krOZo
         aPmnGL4gaBI+qr9+4Gk944WJi9WCm3w1+RZuu53y47OKFG+9pAs8NahDKDyMYE00Uzm/
         zDh3YQdu8OU2IHheG3J2zl+ETMnZnwA4KKtkxtRJnqu+tInkOF5ZXTt5CA5v3T2E71qa
         9jzg==
X-Gm-Message-State: AOJu0YyZmsPXEZAKq27TsoPVwW6IUMPB3f5IFVCxwu2+/budyVXlTFNz
	A+t0HnLsIN+CDqGmJ8dY1bgYSeVgGlDVuygHye5f9uhXrnqcVGJRpDw4JVGP0g/6VS7qQ1WiRHN
	JN4y8Y/brR+jNOGI8gfw+ThAZCcBXr3qOr6q2QVtYTY0eNmm0+ATYybHfe64D0Mvm
X-Gm-Gg: ASbGncuAFtZC0a98I2Rw4ablr70fniMTtSKsb85q91jBlEwcv5QkK9wIzzB3MB+9op/
	qDnPyqlDc7bbuC1BckvJcnzYcuUSc1TRPex5rmTZ0LPLdqKTywd6i5tZzWjM2da9G2QxsoxBKnU
	/ykvwwWd/AbK+3E0lOP1K6L2LnQba5Rvpkl9WWcJpduKSYqVukRWAH9mLBLylOj+DBNHWacCaid
	4cBu4MYcckM0Z0Chxe+Jk8p+RRfqyk9oSkmI+Ghp4dJHJbO+qfhPcHILZniZ1nIqpzQFgXEfdp8
	9iNZDQ==
X-Received: by 2002:a5d:59a7:0:b0:38f:2ddd:a1bb with SMTP id ffacd0b85a97d-39ea51ecc7amr12387027f8f.8.1744723321224;
        Tue, 15 Apr 2025 06:22:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeuffwnwt06zeisddMb8Zdt8bxbGSKlBjEP50ZzHO63ZRNbw54QLSrJVg36f5uy9HifqoWbg==
X-Received: by 2002:a5d:59a7:0:b0:38f:2ddd:a1bb with SMTP id ffacd0b85a97d-39ea51ecc7amr12386998f8f.8.1744723320785;
        Tue, 15 Apr 2025 06:22:00 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf445454sm14157324f8f.83.2025.04.15.06.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:22:00 -0700 (PDT)
Date: Tue, 15 Apr 2025 09:21:57 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Cc: virtio-comment@lists.linux.dev, parav@nvidia.com,
	dmitry.osipenko@collabora.com, dverkamp@chromium.org,
	gurchetansingh@chromium.org
Subject: Re: [PATCH v3] virtio-gpu: support blob alignment information
Message-ID: <20250415092125-mutt-send-email-mst@kernel.org>
References: <20250410143456.122942-1-slp@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250410143456.122942-1-slp@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _uLQPmRsDqj3bWJgmM1X5i1IVGb1_P8XqkA7_n8r4mA_1744723321
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 10, 2025 at 10:34:56AM -0400, Sergio Lopez wrote:
> There's an increasing number of machines supporting multiple page sizes
> and, on these machines, the host and a guest can be running with
> different pages sizes. In addition to this, there might be physical
> devices that require to operate their memory at a specific granularity.
> 
> In these cases, if they are to use Shared Memory Regions, the device
> and the driver must operate with the same granularity, as otherwise
> the former might not be able to fulfill the requests sent by the
> latter.
> 
> For the GPU device, this has an impact on blob creation and mapping. To
> address the problem, allow the device to require certain alignment
> constrains for blob resources by extending the device configuration
> with the field "blob_alignment" and introducing the
> VIRTIO_GPU_F_BLOB_ALIGNMENT feature.
> 
> Signed-off-by: Sergio Lopez <slp@redhat.com>

Looks good to me now.

> ---
> 
> v3:
>  - Add driver conformance statements (thanks Michael).
>  - Avoid using "must" outside conformance statements (thanks Michael).
>  - Elaborate use case in commit description (thanks Michael).
>  - Drop "padding" field requirements (thanks Daniel).
> 
> v2:
>  - Clarify blob_alignment valid values (thanks Michael).
>  - Rephrase feature negotiation (thanks Michael).
> 
>  conformance.tex                  |  2 ++
>  device-types/gpu/description.tex | 28 ++++++++++++++++++++++++++++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/conformance.tex b/conformance.tex
> index dc00e84..0aeb406 100644
> --- a/conformance.tex
> +++ b/conformance.tex
> @@ -22,6 +22,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>  \ref{sec:Conformance / Driver Conformance / Entropy Driver Conformance},
>  \ref{sec:Conformance / Driver Conformance / Traditional Memory Balloon Driver Conformance},
>  \ref{sec:Conformance / Driver Conformance / SCSI Host Driver Conformance},
> +\ref{sec:Conformance / Driver Conformance / GPU Driver Conformance},
>  \ref{sec:Conformance / Driver Conformance / Input Driver Conformance},
>  \ref{sec:Conformance / Driver Conformance / Crypto Driver Conformance},
>  \ref{sec:Conformance / Driver Conformance / Socket Driver Conformance},
> @@ -140,6 +141,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>  \input{device-types/entropy/driver-conformance.tex}
>  \input{device-types/balloon/driver-conformance.tex}
>  \input{device-types/scsi/driver-conformance.tex}
> +\input{device-types/gpu/driver-conformance.tex}
>  \input{device-types/input/driver-conformance.tex}
>  \input{device-types/crypto/driver-conformance.tex}
>  \input{device-types/vsock/driver-conformance.tex}
> diff --git a/device-types/gpu/description.tex b/device-types/gpu/description.tex
> index 4435248..af54cf1 100644
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
> +  required by the device for resource blobs.  The value is a power of
> +  two.  Minimum value is 1, maximum value is 4294967296.
>  \end{description}
>  
>  \subsubsection{Events}
> @@ -672,6 +678,9 @@ \subsubsection{Device Operation: controlq}\label{sec:Device Types / GPU Device /
>  resource. There is no restriction on the image/buffer view the driver
>  has on the blob resource.
>  
> +If VIRTIO_GPU_F_BLOB_ALIGNMENT has been negotiated, \field{size} is aligned
> +to \field{blob_alignment} as defined in the device configuration.
> +
>  \item[VIRTIO_GPU_CMD_SET_SCANOUT_BLOB] sets scanout parameters for a
>     blob resource. Request data is
>    \field{struct virtio_gpu_set_scanout_blob}. Response type is
> @@ -700,6 +709,14 @@ \subsubsection{Device Operation: controlq}\label{sec:Device Types / GPU Device /
>  
>  \end{description}
>  
> +\drivernormative{\paragraph}{Device Operation: controlq}{Device Types / GPU Device / Device Operation / Device Operation: controlq}
> +
> +\begin{itemize}
> +\item If VIRTIO_GPU_F_BLOB_ALIGNMENT has been negotiated, in
> +VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB requests \field{size} MUST be aligned
> +to \field{blob_alignment} as defined in the device configuration.
> +\end{itemize}
> +
>  \subsubsection{Device Operation: controlq (3d)}\label{sec:Device Types / GPU Device / Device Operation / Device Operation: controlq (3d)}
>  
>  These commands are supported by the device if the VIRTIO_GPU_F_VIRGL
> @@ -776,6 +793,9 @@ \subsubsection{Device Operation: controlq (3d)}\label{sec:Device Types / GPU Dev
>  };
>  \end{lstlisting}
>  
> +If VIRTIO_GPU_F_BLOB_ALIGNMENT has been negotiated, \field{offset} is
> +aligned to \field{blob_alignment} as defined in the device configuration.
> +
>  \item[VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB] unmaps a
>    host-only blob resource from the host visible memory region. Request data
>    is \field{struct virtio_gpu_resource_unmap_blob}.  Response type is
> @@ -793,6 +813,14 @@ \subsubsection{Device Operation: controlq (3d)}\label{sec:Device Types / GPU Dev
>  
>  \end{description}
>  
> +\drivernormative{\paragraph}{Device Operation: controlq (3d)}{Device Types / GPU Device / Device Operation / Device Operation: controlq (3d)}
> +
> +\begin{itemize}
> +\item If VIRTIO_GPU_F_BLOB_ALIGNMENT has been negotiated, in
> +VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB requests \field{offset} MUST be aligned to
> +\field{blob_alignment} as defined in the device configuration.
> +\end{itemize}
> +
>  \subsubsection{Device Operation: cursorq}\label{sec:Device Types / GPU Device / Device Operation / Device Operation: cursorq}
>  
>  Both cursorq commands use the same command struct.
> -- 
> 2.49.0

