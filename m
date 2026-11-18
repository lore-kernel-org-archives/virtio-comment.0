Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795014866;
	b=gqKOfsDza5zj/D40k8vhS38e9IlejqR9ztVFpkr3hU5j9Ji2jHgefG63tyJPgYryWOxe
	 I7Y6asYcXCW+pO2LSd6dhd4UQ0+DKokfrWK1RuCrRQ3XiWQD94AM2ZvYHfkrEIdYOhgIK
	 3/8kajVP9MutwxdPMn3LXaCku1c69s7U2+4NDF/NsMg/bLAN8haCVWwMgjSKy/2iRq6lw
	 9NPaRE6KeXnlLV7KLTKmONB2bjy3dj/qBn+A996a7jGrrZwfc8q/8KgwLmirJRZDFrOyK
	 ULHKwI20tJrUavG4kjnqYLcHMTB6J9bAwKaJpiVQWUXbTMrlYyYmhaJPiftBQous/vQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014866;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ZohoMailClient;
	bh=QMs5H2/zIXicM5T7TQ6zsVWtWD5/gcfs6NUOOsIFJwM=;
	b=cWD0nRZLLG9OMUFYLVSC462+BuDkB1qNS7+dDV5fKtdsqlY27RV6lAucqSxPmvginZjm
	 2WOfdwbqAlnsu5Nd38F5yryGoPZxurN+NL0JEy4l97w0wyy6cC2ZdGIiySUTQjl22JHw5
	 KRlvHA5hYPFnvqxXbxbRtB8T4qtWB+mQ2EX8ZHzd1B9hNxheJFt3hBM4x1rW+Kl+lO7D5
	 qmLIAqzvSnySGjVEQ6Oek03CiAhVlZOUR7aIs9kta92NTN0EM77y+LcpJGgJbpQQyvCW/
	 Pn48pmVuPN+fbX+X1LQbXui49obvZBsYGyhXRBdpTZ18D7eU0njxVK7q98v05pvb0OQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=CNpiNpCp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0633606A31C
	for <virtio-comment@lists.linux.dev>; Wed, 18 Nov 2026 15:14:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0633606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=CNpiNpCp
ARC-Seal: i=1; a=rsa-sha256; t=1795014861; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GHcbcRKrHW2KyKPrkxvqIudFUUBcE6pylxHHBq7WfKiWQgrguKpXP1uEw/ruB/TFn6giDhM5U1tfMIO3n5zdWytWQ4A17o+RORJDmkiB1+1MU0vEj6nHbyJJHDmSgMS/IHb66sStbJPZwg64G79S6qbNrOhsuBx7v21cRIdqwtA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795014861; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QMs5H2/zIXicM5T7TQ6zsVWtWD5/gcfs6NUOOsIFJwM=; 
	b=H4l/e2g2Jkhni5KBHVQ+wF4RvAlMM3NjX1WWLQbU7Z03pB6JEreyHg/RR0WFVI30mg2I8xtnco/BZ5/UBzniaHdm8mFUmUM786y9+UCTu/JFziFBUsu0dww2NgqH0pQy8KzcsLB9thDRiW+bp4ltjmlQBEK7HbcafwgWE7773Bg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: a=rsa-sha256; b=CNpiNpCpt2WW1mgdl2MlbTQH79JrFB4JBwheXB9pwvULx0tApWbwd4riEYH4aQViC0WOtIuyP+rfXWK8qDvAkFhqBg6l73q9k5iogZmfNJyQILRWjiQgFuCI+sJ0Z/Tgm00oqZ3R19NX2LRo+asbr1oAvXBxOsaNeCtXSZ9QIhU=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=QMs5H2/zIXicM5T7TQ6zsVWtWD5/gcfs6NUOOsIFJwM=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795014858080541.9124095219717;
	Wed, 18 Nov 2026 07:14:18 -0800 (PST)
Message-ID: <7fc62ef8-f323-497e-bb5f-25bbbcd9992a@collabora.com>
Date: Wed, 18 Nov 2026 16:14:14 +0100
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] virtio-gpu: Add VIRTIO_GPU_CAPSET_DRM capset definition
To: Dorinda Bassey <dbassey@redhat.com>, virtio-comment@lists.linux.dev
Cc: slp@redhat.com, mhrica@redhat.com, aesteve@redhat.com, sgarzare@redhat.com
References: <20261118113242.59167-1-dbassey@redhat.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20261118113242.59167-1-dbassey@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Dorinda,

Thanks for the patch! It's great to see this happening. We have been
using this for a while now but it felt sort of weird to not have it in
the spec.

On 11/18/26 12:32, Dorinda Bassey wrote:
> The specification currently defines capsets 1-5, but the Linux
> kernel has supported VIRTIO_GPU_CAPSET_DRM (ID 6) since commit
> 7214da0ed ("drm/virtio: Add DRM capset definition", July 2024).
> 
> VIRTIO_GPU_CAPSET_DRM enables DRM native context support for
> direct rendering without GL/Vulkan translation layers, allowing
> applications to use native DRM APIs for lower latency GPU
> access and compute workloads.
> 
> Add VIRTIO_GPU_CAPSET_DRM definition with ID 6 to align the
> specification with the kernel UAPI and device implementations.
> 
> Signed-off-by: Dorinda Bassey <dbassey@redhat.com>

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael

> ---
>  device-types/gpu/description.tex | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/device-types/gpu/description.tex b/device-types/gpu/description.tex
> index ac3b427..2d7ffa6 100644
> --- a/device-types/gpu/description.tex
> +++ b/device-types/gpu/description.tex
> @@ -542,6 +542,8 @@ \subsubsection{Device Operation: controlq}\label{sec:Device Types / GPU Device /
>  	Mesa's (mostly) autogenerated Vulkan protocol.
>    \item \href{https://chromium.googlesource.com/chromiumos/platform/crosvm/+/refs/heads/main/rutabaga_gfx/src/cross_domain/cross_domain_protocol.rs}{VIRTIO_GPU_CAPSET_CROSS_DOMAIN} --
>  	protocol for display virtualization via Wayland proxying.
> +  \item \href{https://www.kernel.org/doc/html/latest/gpu/drm-uapi.html}{VIRTIO_GPU_CAPSET_DRM} --
> +	DRM native context support for direct rendering without GL/Vulkan translation.
>    \end{itemize*}
>  
>  \begin{lstlisting}
> @@ -556,6 +558,7 @@ \subsubsection{Device Operation: controlq}\label{sec:Device Types / GPU Device /
>  #define VIRTIO_GPU_CAPSET_GFXSTREAM 3
>  #define VIRTIO_GPU_CAPSET_VENUS 4
>  #define VIRTIO_GPU_CAPSET_CROSS_DOMAIN 5
> +#define VIRTIO_GPU_CAPSET_DRM 6
>  struct virtio_gpu_resp_capset_info {
>          struct virtio_gpu_ctrl_hdr hdr;
>          le32 capset_id;

