Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0D61FCF41
	for <virtio-comment@lists.linux.dev>; Wed,  9 Jul 2025 16:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752078321; cv=none; b=mbY8TJEYdtCeELhO9yexomUAyDV9u73ineKdzKp8ubq0GsGofJT3Gbe4wUIKyxUR891rLEj7Z+VR+TCSGyh4azoRC2cQxfTtkhEOO4/2fH3ASGqgN27mIgJS4e94nRPYhC7uTHAfq/xricYuM/noodZeKAPKBW4TEF0rWVyXsEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752078321; c=relaxed/simple;
	bh=w4qk4zchkfxSuko+rU6JXEAy8cRw65edGOiZi1pAGHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=kEMdVj0iIKuT31P+/HcHC5im6qIQuuivcoFs7ctYFHXqZesAmNXbzFmS5+DutXYHuYBQZTmJHkwPdIfzV/LnLpMAuh24jl/BVqP0Ot+Uk3mcfnSkFp5tVKOXgvg0Dfr840nV7Y5ibrdefzrS3lt4ivUnqTn06tGGigXOuM2xfPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ACZvmyAN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ACZvmyAN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752078316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U7s3pdgHhTnnoxyATfcm7cehFfiQx8bJ/JcZB+KSA5Q=;
	b=ACZvmyANSzDKIW7+8JHfrieMw7VhLOC1raNHrI/MDa16wxc+ee44sqhNhEX+PHHflQ5qbZ
	l9gVmwFsBd/rtkU4qAUMR/76G8SwszuDzkkqmQRC8POaCjNBxwyN/cHRKp3F31BwEB6XTM
	yarduP59wTHpWu8MKy3VhE2ckdbWjKM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-369-LXAMSUDAN-W9EDQN1qLtFQ-1; Wed, 09 Jul 2025 12:25:15 -0400
X-MC-Unique: LXAMSUDAN-W9EDQN1qLtFQ-1
X-Mimecast-MFC-AGG-ID: LXAMSUDAN-W9EDQN1qLtFQ_1752078314
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-451d5600a54so233985e9.2
        for <virtio-comment@lists.linux.dev>; Wed, 09 Jul 2025 09:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752078314; x=1752683114;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U7s3pdgHhTnnoxyATfcm7cehFfiQx8bJ/JcZB+KSA5Q=;
        b=tpx90xYon+adkW1Ich7wnQi09iqSpalO+//rRvr6Yz+eOPV1lTU1lkbCtJi6vEglrC
         +BFM+PPUG5pOIFOhNXZi70MdMnLWVEjsxZYvsJlqv3RM1I71hv5h1dp5Q94LvjFb6/xG
         sLF4U90GwfPj2oGKwt9Vfa02CIgR5pVw1tAD7cZX5k37Pa4PveXTObOvP4NNqew/RpzA
         eixLWrf9LBGxcVoeFsJhj4hrjpk2aY1xYibjulFbJKhKOOsZcpSqX7T3YrLKjR63YvyO
         rD+VxYJsIlm97e7lS6ESfMTtzpgYyLl/Dwq1XZN0x+/oqrXTnJIFO/BWuhebTG4HJA0e
         WFbA==
X-Gm-Message-State: AOJu0YwHZ4mO+qypnqBzHA7GZwKb+jstemQkUvMeeRa0KxHRFpFOWku4
	h63ScdsQW0+xj92Idrc6DhDzL9brdfchbo8IxEAGHrCBGLwjZW17F/TtoYs77SYbOg015qFodLL
	CwoO7MNtTbC4jj/K7DFMtx3B4IlnrvjJj05U9rOk1iJ/vd9bkOGIRsuKaJxeopxTVJWSW
X-Gm-Gg: ASbGncst8c7deU08Lo0JuPUaj6o6NXRB2QhRCUJZ2fIQOoe1i3LQ8gaFmag644LoZxA
	J7qI7WnwYRINpulewxhndM/EftFUzuJFucwYBVKZR+RsqEVpk0u35eYFAQOVN16DYj5q/2HXsJh
	TgEFip/Diql+kmEna9FDwsmDB3EaDfr7xkLJ1Cai08qhBeSPN0QdZrK/1U5cuXgQiud3FMZT7x0
	dA1/0xAUOji2NnT5T4qF+MFr9PPIgtNKNw8OfUFB8RsXpijguHNT/5t4d8K+q2LUeVe7C4/42Il
	As/BRmhnPWWT/yYJ
X-Received: by 2002:a5d:5f49:0:b0:3a5:8d0b:600c with SMTP id ffacd0b85a97d-3b5e44da7dfmr3137215f8f.3.1752078314156;
        Wed, 09 Jul 2025 09:25:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH81BpEaD9WM7wGyduL4ZFd1vhqWl6HHZ0PqTsdU8o2EKGz3cVGhiCPLUS5AzDXS+kljIwggw==
X-Received: by 2002:a5d:5f49:0:b0:3a5:8d0b:600c with SMTP id ffacd0b85a97d-3b5e44da7dfmr3137185f8f.3.1752078313762;
        Wed, 09 Jul 2025 09:25:13 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d575cbbfsm28433465e9.32.2025.07.09.09.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 09:25:13 -0700 (PDT)
Date: Wed, 9 Jul 2025 18:25:12 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.linux.dev, mst@redhat.com, cohuck@redhat.com,
	shahafs@nvidia.com
Subject: Re: [PATCH] virtio-net: Fix ipsec broken conformance links
Message-ID: <aG6X6GwEqOP9ONck@fedora>
References: <20250709140049.507870-1-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250709140049.507870-1-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZsSIU3JIFQ5gQYmH50ShmYmyGXVOG7YS-r0d-XicSKk_1752078314
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 09, 2025 at 05:00:49PM +0300, Parav Pandit wrote:
> Fix the broken conformance links for ipsec device and driver
> requirements.
> 
> Fixes: a0b809a7ddbd ("virtio-net: Add IPsec operation device and driver requirements")
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
>  device-types/net/description.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>

> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> index 415c7fd..da9ff17 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -3599,7 +3599,7 @@ \subsubsection{IPsec Operation}\label{sec:Device Types / Network Device / Device
>  
>  See \hyperref[par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Resource objects / VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-INBOUND-SA]{VIRTIO_NET_RESOURCE_OBJ_IPSEC_INB_SA}.
>  
> -\devicenormative{\paragraph}{IPsec Operation}{Device Types / Net Device / Device Operation / IPsec Operation}
> +\devicenormative{\paragraph}{IPsec Operation}{Device Types / Network Device / Device Operation / IPsec Operation}
>  
>  When the device supports IPsec operations,
>  \begin{itemize}
> @@ -3656,7 +3656,7 @@ \subsubsection{IPsec Operation}\label{sec:Device Types / Network Device / Device
>  
>  On device reset, the device MUST destroy all the resource objects which have been created.
>  
> -\drivernormative{\paragraph}{IPsec Operation}{Device Types / Net Device / Device Operation / IPsec Operation}
> +\drivernormative{\paragraph}{IPsec Operation}{Device Types / Network Device / Device Operation / IPsec Operation}
>  
>  The driver MUST query the capabilities using VIRTIO_ADMIN_CMD_CAP_ID_LIST_QUERY
>  to discover the capability types the device offers.
> -- 
> 2.34.1
> 

