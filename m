Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7842572
	for <virtio-comment@lists.linux.dev>; Wed,  2 Apr 2025 15:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743609116; cv=none; b=YiSZbW85qkOXqkdD09DkaMashstjsDhvd3mYLnf+RM4yKzQGRGHQ/Mzf5t2Obpw6/+A7YnTW6wv0QP3SSoAItCUwyyY+hn6hWEuvARW9yNMyrZ3WnEy13F0Z1TFScxvp/fv/tWweQC/SBZberG/qfo1eROQiC2XHesukH1PjVQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743609116; c=relaxed/simple;
	bh=S6XMQ2AU39hYH5ah1HWGtNLnyoFQLpd8n80nkv6ZI4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=fdWU0/PBS3nQhu7kuzpWt2fb3+KQ57ansafSs19eoTHNRd7/jV61UwdrlvPrZVZvSSzAOiMsHwLp6mwLRbq0bnmWirCZr/7xHoCEznULLd+MaYMENOfuf3Tfa15ca5SB2gHzy0TE70EA1es3cRbpbNRoTawZmq+rFf45IBKeL6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iciyBzaG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iciyBzaG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743609113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gjP/k3uVElhyu6yWy2GkiN2O11Nh5PnXFm8Rjgvf9F0=;
	b=iciyBzaG3bhQxxpgFZacCmrIU7E6zwLqFgp6+uexKrbILZGdqHu4F2LXrtY1fTs7rd4MAr
	QYquvPZmnzYP2UTW+e3RzWeIWWZrOFsLleBDny62gZ6sQ03HmoN/wN67l3fQW/WTNxKEEn
	HyN2YShDldD1nkYhrdxgd6PkSW9oofA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-A4VFRscXPBOcAp2VDOKiOA-1; Wed, 02 Apr 2025 11:51:52 -0400
X-MC-Unique: A4VFRscXPBOcAp2VDOKiOA-1
X-Mimecast-MFC-AGG-ID: A4VFRscXPBOcAp2VDOKiOA_1743609111
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43ce8f82e66so41065295e9.3
        for <virtio-comment@lists.linux.dev>; Wed, 02 Apr 2025 08:51:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743609111; x=1744213911;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gjP/k3uVElhyu6yWy2GkiN2O11Nh5PnXFm8Rjgvf9F0=;
        b=eHSRB9ESTfXYgZuLh2hYG0J1Eiy130/nUrT3dtQ2M2fGSm3y7rpoQ0QMEbwUg9Sy4s
         hh0kJGx7f8c0QOH3kw9efZoPXw8Hdyi/Z7Lv4ndQIXoVP5VYUfsRWvoZ1UdIwOkQVWet
         Qo8IkfEoFPfodhFxnvwqrilE7n/Av5vOspVsYXdNSsPTjcLLroqUBOztrFSewZdnIgH3
         IJd5pAlqKsIqM2ft2lCMc2nkTc5+xTAXpV247tIfM/BQa8yF3+c0JCmKdsmPUo6guRK+
         9OPHpnRJlP9guRpqZJhsd0beUmPwkU7G0fAm4PHh1s5Fsqw8iqknydD/diYFD6DQJgyw
         DUfw==
X-Gm-Message-State: AOJu0YzOIWowR2eF3G8LVE8vSoOhvEtjKMXKc+QM5lwXwcEJsLXJBbgF
	evjUIuKQDleE/a0R5dFK827X+ZgXCHt/VFJWQq4ajJwgtnG48iUu6CdFYVg+0YPc4l4OygaaqVC
	2ynF4J5helZJcbo8aPkHhThh/lIF8nU3N009qft1jw6H4/ZaP4mMekO0iYtioVgTu
X-Gm-Gg: ASbGnct9qjGu8s1zSaJDqW6NGDJvnjI79cTW+NJhBXnY688FFoPV1ss1pGxcRacvmXD
	EsDkz35owX2jhvRrSaV5RdPCGN/VXvC/cYXnknwh/sWjmy0UerIPcsHqPmBHxsHxnDsdE0evrJy
	7pqzEZsA68czedhYBPxdjtyTpGhPuZVGRENj8yqKhuEiIHlztZVUKJ/oeHuK65brGlwbCh4VyWZ
	0VDQtVH2gx32/FhwbWDJDZhTDyQRQvfg8pWgeQ1VFK2elRDTw4aPKrXLJhxHyVbsfZrxYVV8+zS
	gnKQXcEjEw==
X-Received: by 2002:a7b:c85a:0:b0:43d:fa59:cc8f with SMTP id 5b1f17b1804b1-43dfa59cd30mr114319005e9.33.1743609111410;
        Wed, 02 Apr 2025 08:51:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiu3ULj5S8kJbnqptVY3lwz6RG0tP91QvRSP7AmDKE1d8QjUwoVzBhXnKVVuSJMPHv4krlcQ==
X-Received: by 2002:a7b:c85a:0:b0:43d:fa59:cc8f with SMTP id 5b1f17b1804b1-43dfa59cd30mr114318845e9.33.1743609111065;
        Wed, 02 Apr 2025 08:51:51 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb61116ffsm25120395e9.32.2025.04.02.08.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:51:50 -0700 (PDT)
Date: Wed, 2 Apr 2025 11:51:47 -0400
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
Message-ID: <20250402114757-mutt-send-email-mst@kernel.org>
References: <20250402112410.2086892-1-dwmw2@infradead.org>
 <20250402112410.2086892-2-dwmw2@infradead.org>
 <20250402105137-mutt-send-email-mst@kernel.org>
 <19ba662feeb93157bc8a03fb0b11cb5f2eca5e40.camel@infradead.org>
 <20250402111901-mutt-send-email-mst@kernel.org>
 <6b3b047f1650d91abe5e523dd7f862c6f7ee6611.camel@infradead.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <6b3b047f1650d91abe5e523dd7f862c6f7ee6611.camel@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IQ3VgspHxr-mlFsBDDsZMaKvHCvrTj_Gg9kcKVHhJ6c_1743609111
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Apr 02, 2025 at 04:47:18PM +0100, David Woodhouse wrote:
> On Wed, 2025-04-02 at 11:20 -0400, Michael S. Tsirkin wrote:
> > On Wed, Apr 02, 2025 at 04:12:39PM +0100, David Woodhouse wrote:
> > > On Wed, 2025-04-02 at 10:54 -0400, Michael S. Tsirkin wrote:
> > > > > +  If a the device transport provides a software IOTLB bounce buffer,
> > > > > +  addresses within its range are not subject to the requirements of
> > > > > +  VIRTIO_F_ACCESS_PLATFORM as they are considered to be ``on-device''.
> > > > 
> > > > I don't get this part. the system designers currently have a choice
> > > > whether to have these controlled by VIRTIO_F_ACCESS_PLATFORM or not.
> > > > with PCI, for example, BAR on the same device is naturally not
> > > > behind an iommu.
> > > 
> > > In the PCI case this *is* a BAR on the same device, and is naturally
> > > not behind an IOMMU as you say. This is just stating the obvious, for
> > > clarity.
> > 
> > Then the platform already does this right, and it's better not to
> > try and override it in the spec.
> 
> It isn't intended as an "override". This *is* what will happen if the
> platform does it right. By mandating it in the spec, the intent is to
> reduce the chances of platforms doing it *wrong*? (Or of drivers making
> wrong assumptions).

The text you wrote makes it seem that even if the platform says use
an IOMMU, it should be bypassed.

> > > For virtio-mmio it also isn't translated by an IOMMU; that was the
> > > *point* of the `restricted-dma-pool` support.
> > > 
> > 
> > Clear VIRTIO_F_ACCESS_PLATFORM then?
> 
> > I don't want to say that VIRTIO_F_ACCESS_PLATFORM and VIRTIO_F_SWIOTLB
> 
> > are mutually exclusive...
> 
> 
> > Generally, it is preferable to keep all features orthogonal if
> > at all possible.
> 
> ...precisely because they *should* be orthogonal.
> 
> VIRTIO_F_ACCESS_PLATFORM defines how system memory is accessed;
> basically whether DMA goes through an IOMMU or not. And as you point
> out, the "on-device" buffer used with VIRTIO_F_SWIOTLB should never
> pass through the IOMMU anyway, so it *is* naturally orthogonal.
> 
> 
> And I think it does make sense for both to be set in some cases, for
> both physical and virtual devices.
> 
> 
> For physical devices that would mean "Got an IOMMU? Sure, go ahead and
> use it. If not, if you don't trust me, you can just disable my bus
> mastering and just use the SWIOTLB".
> 
> It's basically the same for a virtual device. In a confidential compute
> model, the device model (in the VMM) might not be *able* to access the
> guest memory unless the core guest OS explicitly permits that, through
> some kind of pKVM enlightenment to allow pages to be shared, or a
> vIOMMU, or marking hardware pages unencrypted. So having both bits set
> would mean "Know how to drive that enlightenment? Sure, go ahead and
> use it. Otherwise, use the SWIOTLB".
> 
> In fact that's exactly what that Linux code for `restricted-dma-pool`
> already does — when setting up the dma_ops for the device, if it finds
> an actual set of IOMMU operations, it'll use those. And if not, that's
> when it falls back to using the provided SWIOTLB.
> 

I just feel your text for VIRTIO_F_ACCESS_PLATFORM make it
seem like that is not the case.

VIRTIO_F_ACCESS_PLATFORM says a lot of things, e.g.  it has implications
for encrypted VMs, and so on.

I would drop this text, and maybe add some clarification in the mmio transport,
as needed.


-- 
MST

