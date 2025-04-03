Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2833B24113A
	for <virtio-comment@lists.linux.dev>; Thu,  3 Apr 2025 07:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743665708; cv=none; b=d9QCl3a7kJ9fR5gLv3IzqytrTdgxZvn1gT/ERInnshekvahBYiTETLHtIXg+zBhHX+8US8UEGLE0+etQQfjA9tYnUnJ1X5qehDQYFhEllmilowwcOr3Edul1OqDeJxgrCmYC8QYOL4NnZhERhUClY+59OOj/i94aeMRGZi/6EZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743665708; c=relaxed/simple;
	bh=d63kIu9qyG+o/mctmfnCbBSEiAKZDg77+zc89xIvcps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=NtOLh6ghhjVjP9FSg6zmo8j8JZf5pKOZf3cw/hT31hknLuKpTyvInirTqA/mjOtfsCaXAo7IjpRdfiSBy+QehaLkMi3jNrdHY5pB/aNyr50Uw9P/n5YybIrRF1jnGeNfoAFnUr29vo1RjN/1yc0RsDc5jtcB4lgQ4IT35A/daNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ImtGXerj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ImtGXerj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743665704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tH1gG9VG04OUG8mFcJOacCTP14bJ6cWs2J5rylrfcUo=;
	b=ImtGXerjNggtPIg1fJ5H3fBEoS7VlvWeANpigBOZYjWHcm7yw3sCOrvgop+SQapfkU/FwN
	F9wHSgSRVJ0jaid7YEKshuiCikbMuKS0k5G9ADXP0wa3b3H3CoNoepGcmskPv93jkzQnsu
	M3RK+NexTlUh3zmuwvUM9TuOwCwPlr4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-YutO9eHONbSVOgpWA_JQDA-1; Thu, 03 Apr 2025 03:35:01 -0400
X-MC-Unique: YutO9eHONbSVOgpWA_JQDA-1
X-Mimecast-MFC-AGG-ID: YutO9eHONbSVOgpWA_JQDA_1743665700
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3913f97d115so286280f8f.0
        for <virtio-comment@lists.linux.dev>; Thu, 03 Apr 2025 00:35:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743665700; x=1744270500;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tH1gG9VG04OUG8mFcJOacCTP14bJ6cWs2J5rylrfcUo=;
        b=WmZ0XvoP7vOh9ijRHsULNPTYZpF4Ln39Foys+K7qg9PKeCwMe933P9dA5nPzm/JQN4
         bj88aFSv2Ur1U8mePN7XXO9eivsLLHrcGm8PtgAq23BdIQKQCLPYXBE/Iya77NwPceGW
         Q1hUzvfgEaTqkE3TDlcCzxCH/R3XFUEn8kcigu2woXHE+jiEcxMkrY6gxHnndVWRBOEv
         QEj2oQ4M18M5LI5WMMWf1UdfQgNofeRMXulkSJ7yJaQ7GWGDu9oX6Zl2hqXcHLQx00xq
         Evv2BgaCDLkRM9OMFMUwAtGlUax20W1OK1MASxBzJy+jsuflxjT+OK7UayR5hlPnPHT4
         qXag==
X-Forwarded-Encrypted: i=1; AJvYcCVg9Jlz5cS0MLDbjbYTraBhjm0V42b/j/axmeUEPFSqgdNLtlxWmWJsiQh5k4oaG4yjUXe7VI505yx3P4yi5w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyIa0Hg16HkOE2Mbl+qaG58jVizqAFw+EgFm7JfTwfJ3nhea4YQ
	VtvE2IdKF4oYygxkR9v+oSnL6uIiL/bSpH+PrS6C0XIZ6geV8p5r00nLcaCB9IUjurX2pmgj1z0
	UfbduzUnRqQoBVqebBH4tOkUvAP0qp6GoNs+5KAwe+pvowa9CqwvzNcy3A33Wmnrf
X-Gm-Gg: ASbGncs/Avkj7s7WL3GDWfnKzVXaTvUL3AaTBdrfACv1cs78llCI+bnRSe/wZ9WW38n
	T6RSNVT3sxfrlORPg0fJODVlNDViXi0zsXA/D4W1gpKxVciOewU9Z6lmtjUcSb0VYRA0a4hWiMF
	iVfhsOgbUJ7aVyA7ZmwXEyOwlv4Edbf4qSUS4mq32wrKXnrN7G6srVWwCAyVm1yX+CxDffkLB6e
	C7ixJOBgYn6Zz19UCpuw+bGRGR8vAaqTGl8zIrcho1qeMsg8VHQO6E6vyP75cgGEGQHu1AHCKm3
	0x3iAwINPA==
X-Received: by 2002:a5d:6489:0:b0:39a:c9c0:a37d with SMTP id ffacd0b85a97d-39c2e62f098mr2241448f8f.21.1743665700000;
        Thu, 03 Apr 2025 00:35:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZIst0XjT/xRVTxo82OPOTNWOFyrC0Ro2il8L8kS+KFxjoLyxc/nBmTOck70Pr3aB191585g==
X-Received: by 2002:a5d:6489:0:b0:39a:c9c0:a37d with SMTP id ffacd0b85a97d-39c2e62f098mr2241418f8f.21.1743665699650;
        Thu, 03 Apr 2025 00:34:59 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b8ad6sm1028036f8f.56.2025.04.03.00.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 00:34:58 -0700 (PDT)
Date: Thu, 3 Apr 2025 03:34:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zhu Lingshan <lingshan.zhu@amd.com>
Cc: David Woodhouse <dwmw2@infradead.org>, virtio-comment@lists.linux.dev,
	hch@infradead.org, Claire Chang <tientzu@chromium.org>,
	linux-devicetree <devicetree@vger.kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	=?iso-8859-1?Q?J=F6rg?= Roedel <joro@8bytes.org>,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	graf@amazon.de
Subject: Re: [RFC PATCH 1/3] content: Add VIRTIO_F_SWIOTLB to negotiate use
 of SWIOTLB bounce buffers
Message-ID: <20250403033230-mutt-send-email-mst@kernel.org>
References: <20250402112410.2086892-1-dwmw2@infradead.org>
 <20250402112410.2086892-2-dwmw2@infradead.org>
 <1966cbf1-a430-480e-a78d-3d6bbcb4ada4@amd.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <1966cbf1-a430-480e-a78d-3d6bbcb4ada4@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: r1sQwKd5U2HSQ51yvJ0UNFo0xsrIOsYVm_EMfLMEGYQ_1743665700
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Apr 03, 2025 at 03:13:30PM +0800, Zhu Lingshan wrote:
> On 4/2/2025 7:04 PM, David Woodhouse wrote:
> > From: David Woodhouse <dwmw@amazon.co.uk>
> >
> > Device-tree bindings for `restricted-dma-pool` were defined in 2021, which
> > allow devices to be restricted to a given SWIOTLB pool instead of allowing
> > DMA to arbitrary system memory:
> > https://lore.kernel.org/all/20210624155526.2775863-1-tientzu@chromium.org/
> >
> > This facility was not specific to virtio-mmio, but does apply to it. No
> > attempt was made to ensure backward-compatibility for virtio-mmio devices.
> >
> > Define a VIRTIO_F_SWIOTLB feature which allows the device and driver to
> > agree on the use of the SWIOTLB, if present. This enables the device to
> > refuse to operate further if the driver does not support the SWIOTLB
> > requirement expressed in the device-tree.
> >
> > Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> > ---
> >  content.tex | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/content.tex b/content.tex
> > index c17ffa6..63d075f 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -773,6 +773,9 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
> >  Currently these device-independent feature bits are defined:
> >  
> >  \begin{description}
> > +  \item[VIRTIO_F_SWIOTLB (27)] This feature indicates that the device
> > +  transport provides a memory region which is to be used for bounce
> > +  buffering, rather than permitting direct memory access to system memory.
> Hello David
> 
> IMHO, if we need a bounce buffer, why not place it on the host memory?
> Because if the  bounce buffer resides in the device memory, it requires CPU traverse the pci bus,
> that can be 10 times slower than accessing host memory.
> This performance overhead can be worse when transmitting small packets,
> and stress the CPU cores, even lead to IO starvation when CPU over-commit.
> The device side memory is a host thing to the guest anyway.
> 
> Thanks
> Zhu Lingshan


Indeed I personally do not exactly get why implement a virtual system
without an IOMMU when virtio-iommu is available.

I have a feeling it's about lack of windows drivers for virtio-iommu
at this point.


> >    \item[VIRTIO_F_INDIRECT_DESC (28)] Negotiating this feature indicates
> >    that the driver can use descriptors with the VIRTQ_DESC_F_INDIRECT
> >    flag set, as described in \ref{sec:Basic Facilities of a Virtio
> > @@ -807,6 +810,9 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
> >    the driver. When clear, this overrides any platform-specific description of
> >    whether device access is limited or translated in any way, e.g.
> >    whether an IOMMU may be present.
> > +  If a the device transport provides a software IOTLB bounce buffer,
> > +  addresses within its range are not subject to the requirements of
> > +  VIRTIO_F_ACCESS_PLATFORM as they are considered to be ``on-device''.
> >    \item[VIRTIO_F_RING_PACKED(34)] This feature indicates
> >    support for the packed virtqueue layout as described in
> >    \ref{sec:Basic Facilities of a Virtio Device / Packed Virtqueues}~\nameref{sec:Basic Facilities of a Virtio Device / Packed Virtqueues}.
> > @@ -885,6 +891,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
> >  VIRTIO_F_ACCESS_PLATFORM is not offered, then a driver MUST pass only physical
> >  addresses to the device.
> >  
> > +A driver SHOULD accept VIRTIO_F_SWIOTLB if it is offered, and it MUST
> > +then pass only addresses within the Software IOTLB bounce buffer to the
> > +device.
> > +
> >  A driver SHOULD accept VIRTIO_F_RING_PACKED if it is offered.
> >  
> >  A driver SHOULD accept VIRTIO_F_ORDER_PLATFORM if it is offered.
> > @@ -921,6 +931,8 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
> >  A device MAY fail to operate further if VIRTIO_F_ACCESS_PLATFORM is not
> >  accepted.
> >  
> > +A device MAY fail to operate further if VIRTIO_F_SWIOTLB is not accepted.
> > +
> >  If VIRTIO_F_IN_ORDER has been negotiated, a device MUST use
> >  buffers in the same order in which they have been available.
> >  

