Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9879E4C92
	for <virtio-comment@lists.linux.dev>; Wed,  2 Apr 2025 14:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743605655; cv=none; b=kMGkyujRdSmw3qbbwoNtzWZC0f8EXCmhNQTLXCS/F1ig5snaKW8uHvkS4SOzdjU4JjZWztMEzXfjaeBEeXHDMaC7sxk9V20pUWAa8Pq9nCun6+08w/AzuQEze6cep0Vmj7moXmI51k9913gygO1vbIKGn3S4h39uZWB3NITjlwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743605655; c=relaxed/simple;
	bh=GQBUmlJtouPTHL2D0z387jKeA8ysEZB0JB27Rzluxvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=oq0fRHtutxCjLtdheXbhPS25GA7rD7WWp7Ov9O9KGebAsWhjB176AQ115Pk9FPInGyvvigC/zhcGKZPGFmRU8gFpQoHwdVwlkiKiMzW0WD6iVqI16CNRThXHwRFG7c1GNuXkyYWCxPKhrUH6qpz0MukXL1TgOalV+3PUIcL1QaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jSVDPY/N; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jSVDPY/N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743605652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HT3T8r9bivYjQcCb2PJ3vqTiUiLOTviDPtnxa540ZNU=;
	b=jSVDPY/NZ+IDpv2MT3Q8LxmxffJL9i4qKcp+2K86DjZ6Q3Z38wUztM5fgvjV+CgSVjHTWE
	TRA5QNE64HEX52IsR8lFc1jGAMsfUjKrIFBezDGrVXfqeN+Rhaorn9jeZX894OHRVj7V9K
	axVFsoE1qFIu1pLlAM1+TQzk0vskavE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-153-Ndg6bHa1NuqxrfVqCEPisw-1; Wed, 02 Apr 2025 10:54:10 -0400
X-MC-Unique: Ndg6bHa1NuqxrfVqCEPisw-1
X-Mimecast-MFC-AGG-ID: Ndg6bHa1NuqxrfVqCEPisw_1743605649
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3913f546dfdso3691826f8f.1
        for <virtio-comment@lists.linux.dev>; Wed, 02 Apr 2025 07:54:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743605649; x=1744210449;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HT3T8r9bivYjQcCb2PJ3vqTiUiLOTviDPtnxa540ZNU=;
        b=EcLFrLjJEUNn9WddxRfGYRlxjIaynX93prnYBWIUmJ9SrhQNfEa/dkVL02imH4zRhM
         psMCcgzSNUNG9/p65pxqOm0fWOfskXon6c9SY7znSqjgim+O/t8nl4Ao5qIzQdxv2iz2
         qnUp6/a1zGdyjAr3qW4RoV0GsypOywGsW3n7tZskvoqfJUIml1WfX2uTx/ycAeM6fZTc
         2Jd01dxsx8eLGHQoqMk90eWbfWG4CPhdJWaHxb7P7zCkbgW366/64NiA5EfTbt76oySB
         GqZWqHX9jaOuYqTWgEAc92gQchyhrQTqnoWCZGQkgRlzcU+DJ0YP5fh344JeOA9v+d+k
         ux4A==
X-Gm-Message-State: AOJu0YzAlPwi964fCPaT4WIIo5uhwPsRqANurTzzChvTHrOYzKSf2/zk
	5E5VBWDf0aDgE08wfQ0U95lnQHywd5tYGNjLYn9Fjnpi98P0W6tRHg9ehr8BoPxRXcyLInPLNrQ
	l8QeyiKrp7kwQmlHFMv3DOsUGLZSZyle3bIz69/9059MqhLLdWMUU5T09eSzwrJSU
X-Gm-Gg: ASbGncvtRKH38R4BZ0/5ZKX4tzLiDiMJNIiwp4OnCZs79t4z26e8CM+58VVXZkgMMBL
	Rz/r5VI2Q34yDSCZxW3cvxA9WVryjiHTzCLMcKXHtmFQnrazxweOzofxbbK0q57Qft9w+huP2lD
	6tsBFiy0TJ0F2Z33K0vYb5S5CjzLvIwNBH8aVYm0POnvCzPr5BSGPzS3f5PASQrgT8rryNHuFdz
	mcmI1XI8NHDNLImyfq7n1EH4wPhSPvgfsJ5fDYRCWQN8mAcXxqXiQG0Xp4AoClp9i3mWzClmgiO
	Ibf9dDfmAA==
X-Received: by 2002:a5d:5f90:0:b0:39c:11c0:eba1 with SMTP id ffacd0b85a97d-39c29737faamr2656211f8f.12.1743605649346;
        Wed, 02 Apr 2025 07:54:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3aSe1fBS4Qdu5ZBsQ2H6BJae2MKkwKU+4XOXjshIZExrVJISjZyrr4js2K+lUUR/iW6y00g==
X-Received: by 2002:a5d:5f90:0:b0:39c:11c0:eba1 with SMTP id ffacd0b85a97d-39c29737faamr2656183f8f.12.1743605648968;
        Wed, 02 Apr 2025 07:54:08 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb5fd1626sm23036825e9.16.2025.04.02.07.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 07:54:08 -0700 (PDT)
Date: Wed, 2 Apr 2025 10:54:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: virtio-comment@lists.linux.dev, hch@infradead.org,
	Claire Chang <tientzu@chromium.org>,
	linux-devicetree <devicetree@vger.kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	=?iso-8859-1?Q?J=F6rg?= Roedel <joro@8bytes.org>,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	graf@amazon.de
Subject: Re: [RFC PATCH 1/3] content: Add VIRTIO_F_SWIOTLB to negotiate use
 of SWIOTLB bounce buffers
Message-ID: <20250402105137-mutt-send-email-mst@kernel.org>
References: <20250402112410.2086892-1-dwmw2@infradead.org>
 <20250402112410.2086892-2-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250402112410.2086892-2-dwmw2@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TpMD3sQ1eKPujkBijwfPADRj5ewUY3EtTcWd5n51fVo_1743605649
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 02, 2025 at 12:04:45PM +0100, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Device-tree bindings for `restricted-dma-pool` were defined in 2021, which
> allow devices to be restricted to a given SWIOTLB pool instead of allowing
> DMA to arbitrary system memory:
> https://lore.kernel.org/all/20210624155526.2775863-1-tientzu@chromium.org/
> 
> This facility was not specific to virtio-mmio, but does apply to it. No
> attempt was made to ensure backward-compatibility for virtio-mmio devices.
> 
> Define a VIRTIO_F_SWIOTLB feature which allows the device and driver to
> agree on the use of the SWIOTLB, if present. This enables the device to
> refuse to operate further if the driver does not support the SWIOTLB
> requirement expressed in the device-tree.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>  content.tex | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/content.tex b/content.tex
> index c17ffa6..63d075f 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -773,6 +773,9 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>  Currently these device-independent feature bits are defined:
>  
>  \begin{description}
> +  \item[VIRTIO_F_SWIOTLB (27)] This feature indicates that the device
> +  transport provides a memory region which is to be used for bounce
> +  buffering, rather than permitting direct memory access to system memory.
>    \item[VIRTIO_F_INDIRECT_DESC (28)] Negotiating this feature indicates
>    that the driver can use descriptors with the VIRTQ_DESC_F_INDIRECT
>    flag set, as described in \ref{sec:Basic Facilities of a Virtio
> @@ -807,6 +810,9 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>    the driver. When clear, this overrides any platform-specific description of
>    whether device access is limited or translated in any way, e.g.
>    whether an IOMMU may be present.
> +  If a the device transport provides a software IOTLB bounce buffer,
> +  addresses within its range are not subject to the requirements of
> +  VIRTIO_F_ACCESS_PLATFORM as they are considered to be ``on-device''.

I don't get this part. the system designers currently have a choice
whether to have these controlled by VIRTIO_F_ACCESS_PLATFORM or not.
with PCI, for example, BAR on the same device is naturally not
behind an iommu.


>    \item[VIRTIO_F_RING_PACKED(34)] This feature indicates
>    support for the packed virtqueue layout as described in
>    \ref{sec:Basic Facilities of a Virtio Device / Packed Virtqueues}~\nameref{sec:Basic Facilities of a Virtio Device / Packed Virtqueues}.
> @@ -885,6 +891,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>  VIRTIO_F_ACCESS_PLATFORM is not offered, then a driver MUST pass only physical
>  addresses to the device.
>  
> +A driver SHOULD accept VIRTIO_F_SWIOTLB if it is offered, and it MUST
> +then pass only addresses within the Software IOTLB bounce buffer to the
> +device.
> +
>  A driver SHOULD accept VIRTIO_F_RING_PACKED if it is offered.
>  
>  A driver SHOULD accept VIRTIO_F_ORDER_PLATFORM if it is offered.
> @@ -921,6 +931,8 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>  A device MAY fail to operate further if VIRTIO_F_ACCESS_PLATFORM is not
>  accepted.
>  
> +A device MAY fail to operate further if VIRTIO_F_SWIOTLB is not accepted.
> +
>  If VIRTIO_F_IN_ORDER has been negotiated, a device MUST use
>  buffers in the same order in which they have been available.
>  
> -- 
> 2.49.0
> 

