Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE65E224FD
	for <virtio-comment@lists.linux.dev>; Sun,  6 Apr 2025 18:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743964098; cv=none; b=MDpvaIKf0HJa0kFEsaxczOqzRYqi53wzcVPE4A0r4vxGLV/VApXoZl2gXzSgv2HaTj2O01nBd1y487NCRphHTQCAruh3lAF77R1RAmYauzNMXi2yzYlUm6fzzxDAt/nVhSjIafsxF8ozsHcofecr5sGxFqxiHvDB2VQS6IVSikk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743964098; c=relaxed/simple;
	bh=QO4YgeSl0i5WYqse9b0k2XDA2qWOnb5rpKGHL35a7NE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=BvFs/Az5xBT42eQon0oi47beKJq/IfYNHbNGF3F2B+EK1MsAdWlpsmel8Kfd3+JsWg7d7nlBWyaCRjU3PLULz0C6ETnM89/dhmvPTurxy9XVGg+NpzSFTwW8vV6QfbsU8XMjmjENwW96Ot1Gtaz6I1+0t7X3WVpYoehGzjrafH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Io2/pkMG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Io2/pkMG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743964095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kUpzOoybZCjV/WY+gmOrQcMd2Tvg8+iKrIdRhgWrjew=;
	b=Io2/pkMGoJ4prYpo96KOo+pPNU678gYsFiGMKzdRdvGsgsMgqBvmc/bY+Sl/NHXt6xvBEY
	i/ef0K8i8DxrwXEPi4hDtaMp/rNxYMitDDBsbHZyGs3RVH+mqdNym2qgv/TvodpLXJwZRa
	H+eX286jS4y2uzZ+RlRdVJKg+AUt4Qc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-cOSkc7CzNaqQ_GwA45sFAA-1; Sun, 06 Apr 2025 14:28:14 -0400
X-MC-Unique: cOSkc7CzNaqQ_GwA45sFAA-1
X-Mimecast-MFC-AGG-ID: cOSkc7CzNaqQ_GwA45sFAA_1743964093
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43cf327e9a2so30553975e9.3
        for <virtio-comment@lists.linux.dev>; Sun, 06 Apr 2025 11:28:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743964093; x=1744568893;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kUpzOoybZCjV/WY+gmOrQcMd2Tvg8+iKrIdRhgWrjew=;
        b=BFVnCzSnFTP5pxdUGMVezf3emk5JfKk321MeC5b2qPnQyuBRs8bWR5jABkiHVxXuUL
         /bWcmrZArhqNlAHEiBz62QQbPLfPrmfVfJWskyWH9mfCOvIuo9P0wM54rPWsO0lg9v0Y
         OSQeQ89xqU1iZQZCOBi/OcvuXGBcBi4XnqQFZ7rKQCWVZLh860U2+b9TBOsCx5gQumLY
         73ezGuu41Fy0yXlJshuVrt3n/bnVyXRLCVJdu/GP2ZN+cDuyJ80CMLf5ii/22Y6R6LE8
         ix0uCnoLaa2wyM0pKYDRCDj3e9W/PvIWobbhlov93/Sh1jGDEpdkJ9AL+GHjqaa5qI4j
         63Qw==
X-Forwarded-Encrypted: i=1; AJvYcCWMzcWwdJc07SWHGHluibrId/kNVkyTjYwxDeaPrVG3e3ulBC2GegPRzkmhfq1EL/iOgzh6hXFZ6n8VGMUmVw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3LekwbppPKVgFO1Mk84DCxLp+Qu15mPAHQpjYYf+IM5oWiyN/
	6uQZ9GYDWxh3qmGjhIf8lFk5O9WWSMAP03T9x2R6WW3RHxvaNfOVYTx39i1MxeOUkcRlyF54qtR
	lG8U0A5GDLPvEa0StPLPtrGBHhgKAoT45RowK33zpSdic6BKbhXftgu1gPSxVZ7ZH
X-Gm-Gg: ASbGncuAmh94uZoZebcLEWlYnaumkFyiHJYeiFB0yTcP2adj1o2XDbRCZBpU4IhBl3E
	0CPEQvyPKEyt0A4AyM/PLXFsr18DbEF7HBgSy/WQ3fVn739H5UuWR8pd9KdEPrI4owepNdL3KoS
	2nc1T+QWy1E6x+UMlxbrElnkOz9zrY+j4irqFKY8ma2vIqUR7Lhqgjcvopr/jCKXtsTS6ACc15q
	xhs5YWZOgwa5ySiBnr86ZubTIQlAETOgkwBccD6+lB/cDGCwhTI0GNorBGXD9HBqGSWLzTQ6v0X
	7d7P5qo1xg==
X-Received: by 2002:a05:600c:2157:b0:43c:f87c:24d3 with SMTP id 5b1f17b1804b1-43ee0878e6emr38603385e9.20.1743964093107;
        Sun, 06 Apr 2025 11:28:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFFNEz0BaTWmqRTlho9bh/h+LO78mwXJbiMmvuhqlDLyW02fPdmXPDwKzB0L/AQ+PSp6rbHQ==
X-Received: by 2002:a05:600c:2157:b0:43c:f87c:24d3 with SMTP id 5b1f17b1804b1-43ee0878e6emr38603325e9.20.1743964092759;
        Sun, 06 Apr 2025 11:28:12 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096b9csm10093725f8f.13.2025.04.06.11.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 11:28:11 -0700 (PDT)
Date: Sun, 6 Apr 2025 14:28:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Christoph Hellwig <hch@infradead.org>, virtio-comment@lists.linux.dev,
	Claire Chang <tientzu@chromium.org>,
	linux-devicetree <devicetree@vger.kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	=?iso-8859-1?Q?J=F6rg?= Roedel <joro@8bytes.org>,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	graf@amazon.de
Subject: Re: [RFC PATCH 1/3] content: Add VIRTIO_F_SWIOTLB to negotiate use
 of SWIOTLB bounce buffers
Message-ID: <20250406114130-mutt-send-email-mst@kernel.org>
References: <05abb68286dd4bc17b243130d7982a334503095b.camel@infradead.org>
 <Z-99snVF5ESyJDDs@infradead.org>
 <fb7ea3ee5bf970fa36b012e16750f533b72903a0.camel@infradead.org>
 <20250404040838-mutt-send-email-mst@kernel.org>
 <67bd998bfe385088ef863342b9f8714754585476.camel@infradead.org>
 <20250404043016-mutt-send-email-mst@kernel.org>
 <F30D33D5-38CC-4397-8DC8-9EE1B0FEF40D@infradead.org>
 <5cc2f558b0f4d387349c3a2936ff00430804536d.camel@infradead.org>
 <20250404062409-mutt-send-email-mst@kernel.org>
 <7fd789b61a586417add2115f6752ebec5e7b81bf.camel@infradead.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <7fd789b61a586417add2115f6752ebec5e7b81bf.camel@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gmMBpyhf3fNYvp6a2rAK46IEvJfSxR5euh7moed5wFI_1743964093
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Apr 04, 2025 at 12:15:52PM +0100, David Woodhouse wrote:
> On Fri, 2025-04-04 at 06:37 -0400, Michael S. Tsirkin wrote:
> > On Fri, Apr 04, 2025 at 11:15:33AM +0100, David Woodhouse wrote:
> > > On Fri, 2025-04-04 at 10:27 +0100, David Woodhouse wrote:
> > > > On 4 April 2025 09:32:39 BST, "Michael S. Tsirkin" <mst@redhat.com>
> > > > wrote:
> > > > > On Fri, Apr 04, 2025 at 09:16:44AM +0100, David Woodhouse wrote:
> > > > > > On Fri, 2025-04-04 at 04:09 -0400, Michael S. Tsirkin wrote:
> > > > > > > On Fri, Apr 04, 2025 at 08:50:47AM +0100, David Woodhouse
> > > > > > > wrote:
> > > > > > > > What's annoying is that this should work out of the box
> > > > > > > > *already* with
> > > > > > > > virtio-mmio and a `restricted-dma-pool` — for systems which
> > > > > > > > aren't
> > > > > > > > afflicted by UEFI/ACPI/PCI as their discovery mechanisms.
> > > > > > > 
> > > > > > > 
> > > > > > > That specifically would be just a driver bugfix then?
> > > > > > 
> > > > > > I actually think it works out of the box and there isn't even a
> > > > > > bug to
> > > > > > fix. Haven't tested yet.
> > > > > > 
> > > > > > The sad part is that the system does it all automatically *if* it
> > > > > > has
> > > > > > CONFIG_DMA_RESTRICTED_POOL (e.g. Linux) and the driver never even
> > > > > > notices that the dma_ops it's using are the swiotlb ops using the
> > > > > > provided buffer.
> > > > > > 
> > > > > > Which is *kind* of nice... except that when on a guest OS which
> > > > > > *isn't*
> > > > > > Linux with CONFIG_DMA_RESTRICTED_POOL, the guest will just ignore
> > > > > > the
> > > > > > `restricted-dma-pool` node and try DMA to system memory anyway,
> > > > > > which
> > > > > > will fail.
> > > > > 
> > > > > I mean, it's easy to misconfigure Linux, this is why we love it ;)
> > > > > Why
> > > > > is this such a concern?
> > > > 
> > > > Because it's incompatible. In the DT world, perhaps this new *non-
> > > > optional* feature/restriction should have come with a new
> > > > "compatible" string such as "virtio-mmio-restricted-dma".
> > > > 
> > > > Adding it without backwards compatibility wasn't ideal.
> > > > 
> > > > > > That's why my proposal adds the negotiated VIRTIO_F_SWIOTLB
> > > > > > feature, so
> > > > > > that the device side can refuse, if the guest *isn't* agreeing to
> > > > > > use
> > > > > > the bounce buffer in the situations where it must do so.
> > > > > 
> > > > > 
> > > > > OTOH then setting this feature and if you make the device force it,
> > > > > you are breaking guests restricted-dma-pool which worked
> > > > > previously, no?
> > > > 
> > > > Yes. So a platform offering virtio-mmio with restricted DMA, if the
> > > > driver doesn't accept the offered VIRTIO_F_SWIOTLB, may want to
> > > > accept that negotiation anyway, and *hope* that the driver/OS are
> > > > going to use the buffer anyway.
> > > > 
> > > > I just didn't want to make that same mistake again when formalising
> > > > and documenting this, and especially when attempting to extend it to
> > > > PCI.
> > > 
> > > Of course, the beauty of the restricted-dma-pool as supported by DT is
> > > that it's a *system* memory buffer, which is actually OK as long as
> > > it's reserved address space and not just part of normal system memory
> > > that an unsuspecting guest might use for general purposes. So the
> > > trusted part of the hypervisor (e.g. pKVM) can *allow* the VMM access
> > > to that space.
> > > 
> > > It doesn't *have* to be on-device. That just seemed like the more
> > > natural way to do it for PCI.
> > > 
> > > I suppose we *could* allow for the virtio-pci transport to do it the
> > > same way as virtio-mmio though. The VIRTIO_PCI_CAP_SWIOTLB capability¹
> > > could reference a range of system memory space, just like the
> > > `restricted-dma-pool` property does.
> > > 
> > > It's a weird abstraction especially for a physical PCI device to do
> > > that because the system memory space is outside its ownership. But in a
> > > physical device it could be writable, and you could consider it the
> > > responsibility of the system firmware to configure it appropriately, in
> > > accordance with the IOMMU and other DMA restrictions of the platform.
> > > 
> > > That does solve it for the CoCo case without addressing the P2P staging
> > > case that Christoph mentions, though.
> > > 
> > > 
> > > ¹ I will rename it, Christoph, if it survives at all. Probably
> > > VIRTIO_F_RESTRICTED_DMA and VIRTIO_PCI_CAP_RESTRICTED_DMA but of course
> > > it depends on the semantics we conclude it should have.
> > 
> > OK. So basically, all this does, is a promise by driver to only
> > DMA into a range of memory?
> 
> Basically, yes.
> 
> > This part, I get. I wouldn't put it in a capability, just in config
> > space then.
> 
> Sure... but how? There are some things which are defined to be at fixed
> locations in config space, like the vendor/device IDs, COMMAND, STATUS,
> BARs, etc..
> 
> And for the rest of the optional things which might be in config space
> of a given device... isn't that exactly what capabilities are for?


Sorry I am unclear. Not the pci config space. The virtio config space.
After admin_queue_num ?

