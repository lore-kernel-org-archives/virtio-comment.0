Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BF744C7C
	for <virtio-comment@lists.linux.dev>; Wed,  2 Apr 2025 16:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743612237; cv=none; b=EwJwVqjwGeCNdu3lf9L2DEZOywdfXLwOeUVOlLstgWdWj0e4e38g77BYSCAWhC8Sfc1FWej6hE0DiLctE79Eq2KuKhWAHewdxgoe8bdqodHE4bR0fnzLieSZRtUe5cO5QHEeUVC9kIEp83rZBycGjJXNQAlZFjBcksCWDOvR4sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743612237; c=relaxed/simple;
	bh=iQY+6g0BmpbaD8MfkzQbFz6UlXW6t2eBdTbgfZwYfJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=UMVHYJFjay9YN1MmlyjIj4UfdZkKhypoL1Ar8INCb8YH9uNjg/ji2jDS7n3FtRCgFrEtCcP7OAwN/S88c75ByNm1Y+eafoapXBmn45aCWEur3XjMy+uN1Se5p3Ch/VG1XuHjqzjbyuzrDGB827MwwP4TR2qHX9z/NkLrOOHLFng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GJIFmlJo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GJIFmlJo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743612234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YeSTKdZVyyzbJFFy/rsJd54pLFQsVU38OTGQV8/31gI=;
	b=GJIFmlJofnQ3VPFHuU4SJD2KcdKl1JQgvGEhHgavEvT+417yUkAlV3tOBT+w60Qk2Uzdex
	eihb7CAu++aRkC6k7amWU3tfiV7eE0byJivJIrwzVa7gE9f6cLgP247ZWVgO6lBWRCNQda
	TNx3OgXE7LK29jr/iIWloOu2of0ICfg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-107-M1EKLW1FPaSQybI66N0kiw-1; Wed, 02 Apr 2025 12:43:53 -0400
X-MC-Unique: M1EKLW1FPaSQybI66N0kiw-1
X-Mimecast-MFC-AGG-ID: M1EKLW1FPaSQybI66N0kiw_1743612232
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5e6c14c0a95so23530a12.0
        for <virtio-comment@lists.linux.dev>; Wed, 02 Apr 2025 09:43:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743612231; x=1744217031;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YeSTKdZVyyzbJFFy/rsJd54pLFQsVU38OTGQV8/31gI=;
        b=t0LQDZ6h5i4IzcNoOJTiS4mA8sxsQ59fhIo+pGX/lGbQ+eT/NH3khDCDEA+PvC8ZMd
         dVPJ3j28XKb4goAyBW5t8GXL821hNeRDiHE3F6EmKwgbJyoMPSLWeoHv5gf2vAZoXzg2
         3YuzcQOohwLgglT9Pp9FMQXxMn9NwNPCy5UXbv6macqbaC5J4UtoPikVhAmfxq1AzZHg
         HFUXeoC04jkbTwfSNGqzshbHAt/iDGsy1vUvqBsYJwf19ye42Hl5MzrPAxbzZxsgzN6r
         yiIiDvQTJzC9yIl9QPh1tf2Ge1erLA3rjdoO4j+XSWckeuWNmSKy+eWhbhLf6M3Aaeyl
         9VzQ==
X-Gm-Message-State: AOJu0YwW2fYW3HOFvan7B1QyL6yk9gJvv2LooHCrCnBjQx5FPB0mZSF1
	VQYyFp8W8aQsBCscVIq0r4DqnJqRDnjDboPyWv8+bf55YHfnkHDzjjMDLIBYLqsz1s6uMlQenGu
	FgS1bIQtQcyeWexXloNkDZH92dlhz3gkrzUv79qZWzLggLDrJcETPApsJLIcXBASM9dFri6c7
X-Gm-Gg: ASbGncusVqx76uyEmo9q0tULx4D7ZZtjeoTKZ5CSl0wc/1Uvxp0VImqA+zf+DkW3RxV
	ajcoR8xnfPOupoK4VB+lbVBbYxj3uaKh+VD4WqI5lwd7IUzlBad4LuYssGFwxtUBMMqV0ibTU8R
	iBpziz51wsQyK8MkHc1rwcHF5iTjuR0X5twNx1YE4d6cEFx64Ig95ZIXistxeM8XNBCy4lgD3a4
	nE8/z21XKVWhS/6q6Sflh63zpWJUxsEFZ+6GLr5x+xyQCn2Vt+utI0LDqn9WjhZDgN6NeuZ4EyR
	Hjb0ZqGjEw==
X-Received: by 2002:a05:6402:3604:b0:5ed:1400:f879 with SMTP id 4fb4d7f45d1cf-5edfdf1c140mr14341544a12.32.1743612231287;
        Wed, 02 Apr 2025 09:43:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGesprQ+9pczctecRSfjK0ZQ9vGuaIFPNBThEHmQLbDLgGhL8lnXWSb9uDROnuC2kC47MqVsg==
X-Received: by 2002:a05:6402:3604:b0:5ed:1400:f879 with SMTP id 4fb4d7f45d1cf-5edfdf1c140mr14341525a12.32.1743612230961;
        Wed, 02 Apr 2025 09:43:50 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc16f213dsm8798770a12.44.2025.04.02.09.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 09:43:50 -0700 (PDT)
Date: Wed, 2 Apr 2025 12:43:47 -0400
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
Message-ID: <20250402124131-mutt-send-email-mst@kernel.org>
References: <20250402112410.2086892-1-dwmw2@infradead.org>
 <20250402112410.2086892-2-dwmw2@infradead.org>
 <20250402105137-mutt-send-email-mst@kernel.org>
 <19ba662feeb93157bc8a03fb0b11cb5f2eca5e40.camel@infradead.org>
 <20250402111901-mutt-send-email-mst@kernel.org>
 <6b3b047f1650d91abe5e523dd7f862c6f7ee6611.camel@infradead.org>
 <20250402114757-mutt-send-email-mst@kernel.org>
 <965ccf2f972c5d5f1f4edacb227f03171f20e887.camel@infradead.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <965ccf2f972c5d5f1f4edacb227f03171f20e887.camel@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5fEqce0Rbo9h-QrDlJx2pEDJTWm9vziimf-O4ewUMQk_1743612232
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Apr 02, 2025 at 05:16:28PM +0100, David Woodhouse wrote:
> On Wed, 2025-04-02 at 11:51 -0400, Michael S. Tsirkin wrote:
> > On Wed, Apr 02, 2025 at 04:47:18PM +0100, David Woodhouse wrote:
> > > On Wed, 2025-04-02 at 11:20 -0400, Michael S. Tsirkin wrote:
> > > > On Wed, Apr 02, 2025 at 04:12:39PM +0100, David Woodhouse wrote:
> > > > > On Wed, 2025-04-02 at 10:54 -0400, Michael S. Tsirkin wrote:
> > > > > > > +  If a the device transport provides a software IOTLB bounce buffer,
> > > > > > > +  addresses within its range are not subject to the requirements of
> > > > > > > +  VIRTIO_F_ACCESS_PLATFORM as they are considered to be ``on-device''
> 
> ...
> 
> > The text you wrote makes it seem that even if the platform says use
> > an IOMMU, it should be bypassed.
> 
> It was trying just to state the obvious, that addresses within the
> range of the *on-device* memory buffer are not handled by the IOMMU.
> 
> > I would drop this text, and maybe add some clarification in the mmio transport,
> > as needed.
> 
> It would be PCI too. I guess we could move the "obvious" comment that
> 'addresses within the range of the SWIOTLB bounce buffer region are
> considered to be "on-device" and are thus not affected by the
> requirements of VIRTIO_F_ACCESS_PLATFORM' into *both* the MMIO and PCI
> transport docs? But then it's basically just saying the same thing in
> two different locations?
> 
> I don't think we're debating what the actual implementations should
> *do* ...  are we? To me it's obvious that what I'm trying to say here
> *should* always be true.
> 
> We're just debating the wording and where to put it, yes?

yes.

I know a bit more about PCI, and for PCI I prefer just not saying
anything. The platform already defines whether it is behind an iommu
or not, and duplication is not good.

For mmio it is my understanding that the "restricted" does the same
already? or is it required in the spec for some reason?



