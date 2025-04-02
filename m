Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0F0233D85
	for <virtio-comment@lists.linux.dev>; Wed,  2 Apr 2025 10:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743589765; cv=none; b=N/pNQvfRTZglGo/q+596teAe60hmXNYM6IW5DlZpTd7k+uYC9TLS+yxbuLIS9YVD04BP3eyL0RrUibDFnMKq9x7rJgH7gXrK84fNn3/K/kKIaxKr4S0LDmah8AymBFQlf3G+BuSoPf8aUIMiML5wcvXRhNUV1mI6bf6CdUts7bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743589765; c=relaxed/simple;
	bh=7MDvaLk93xayqVKAnHGU8GdtlrIQXLZ9+uX5OpNQvTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A5xrSU5LePTad5cfmqK6G/rl7dgovY11MSa3Ai5A8ePwwPtPWuaxY9/fYg3RabYu8avlo6RxAU1xiCKuiBKq3V2M0pqMh7UTR1CkkwoflvVJkHLwr0bxj9hYsACtRyJUkZiFh4xBPzqiMvKM3Ry+uzImfVmAX93xFLGspWh+MWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Sga8kNFg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Sga8kNFg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743589761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4iyx3+VcdL2pQDdAh/R9mlsA5EAG7YmraShgEJO9C30=;
	b=Sga8kNFgu+Q2h0DKu8l9ewawm4I7hHJrmbTE326n3LlUj25xKpPs2g6vWbzHlDMkRm9xOs
	l6zx8jfGIiyruR3AIgqKvXe7Y+WzJ0zKVX1iGyuXTA2PMMeT6jyYyURpNjAPGj8l2eTGNP
	JHs+HOhwaATmK4/48O5NS8MZq1x6jMQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-204-MoV3fYz4Npe8BlZLQRliaQ-1; Wed, 02 Apr 2025 06:29:20 -0400
X-MC-Unique: MoV3fYz4Npe8BlZLQRliaQ-1
X-Mimecast-MFC-AGG-ID: MoV3fYz4Npe8BlZLQRliaQ_1743589759
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5f05d36993aso597296a12.0
        for <virtio-comment@lists.linux.dev>; Wed, 02 Apr 2025 03:29:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743589759; x=1744194559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4iyx3+VcdL2pQDdAh/R9mlsA5EAG7YmraShgEJO9C30=;
        b=w+qZBrx60dbLCjwcKWUV2DvS1llCaYQaGb/OH+k7/tKJPCPiLioeKFIxzhGIgv5MjY
         kRgqr4wfON4Dzr8aLnnRvgtVQ3hlYRPr2dOkw3fM3f6xTBrQl8p9Yn0wAnQvWFwtAafi
         1dz6P3vR9sR8bgK8UCbpUSvUeU4GoDn/xFEgjzAWVFEPbhG4iPgvkzJE2HOcOcUtm6AJ
         uQqD4RKg3XYP0lcy4adP0LutmxcRTc5vpPifihNhZVmUKPZST3ffy4uBqT3PgVLArLYC
         c6KVNdkX77dHxqzCmvXBR29adDJREnTKws5kKHd2g2fljH1LZblSpY06m3FXSlvvLwKp
         xJow==
X-Forwarded-Encrypted: i=1; AJvYcCUkTxZpEjLdYHJ0lVrlzrPvuN92JN0Het7ZzcPbIYryvNdYjacAdc70EdQd6diTgZb/2P/lax/s2ofhr8+tTw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7+qx6SebfWe4fIWavSp1mdN5VrK9d7cna51bG05eYClr21EIV
	z48b8GOLCIGjcLQ9fLUfdZJt9ytrUz4KtethMHrdbojf7yCBi2D5WPNOlfCMjSCx0tnY8eTaiKZ
	q8XUnzaaQg/qpHB6rfFjjBJu23iSjHN0tea86DIo9Sla84NxM3Al2QOjNepAhyYqHsj11MgAuQS
	X9ZIvtOWGGTYyDKOHYrMIPZnMdz/QFM170Oj0AzuLoTDhMSMA=
X-Gm-Gg: ASbGnctpVhfwp6FKNBlmiTvIwlzxlu82u+YndizzML1A86M9HUAvkEZkxUUHy41vH0u
	BN6xzvl8bhW8XEMFmVYPbQM/N1wESfbOOKFze9U1dGWzzLx8YvW2uw+LT3aqp9IEYG3ysex/hN/
	fFpxbEnxl0COttUBnMw+CU7VCiWdvx
X-Received: by 2002:a05:6402:1e90:b0:5ec:cd7c:a187 with SMTP id 4fb4d7f45d1cf-5f04ebceef5mr1702154a12.26.1743589758512;
        Wed, 02 Apr 2025 03:29:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxgaqwaOhOxAjcbzRY6EG7AcURWj/7Z14+lSoOgjo+ftQg2zwg6YEnjsq/hniniLMCWPqfVB01voHsjbxBjEE=
X-Received: by 2002:a05:6402:1e90:b0:5ec:cd7c:a187 with SMTP id
 4fb4d7f45d1cf-5f04ebceef5mr1702130a12.26.1743589758101; Wed, 02 Apr 2025
 03:29:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250401133543.801184-1-mvaralar@redhat.com> <87y0wiapex.fsf@redhat.com>
 <CY8PR12MB71956AADC6DBE9891FE9CA9BDCAF2@CY8PR12MB7195.namprd12.prod.outlook.com>
In-Reply-To: <CY8PR12MB71956AADC6DBE9891FE9CA9BDCAF2@CY8PR12MB7195.namprd12.prod.outlook.com>
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Date: Wed, 2 Apr 2025 12:29:07 +0200
X-Gm-Features: AQ5f1JpwAQVqeXeNfzhzr960dPh3pgp0FqrGx6ozDkY2MeXeoEOb9Vad1l2k1RQ
Message-ID: <CAHYGQ0x2_QtLBrMmxmzcdNUki5Xjjhvg7e=khYVFWbtnGrYgvQ@mail.gmail.com>
Subject: Re: [PATCH 00/13] Backport 1.4 fixes to 1.3
To: Parav Pandit <parav@nvidia.com>
Cc: Cornelia Huck <cohuck@redhat.com>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, "mst@redhat.com" <mst@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0b0f-WLOO-UgidXXjRksp7G4xSORl8HWD_WShj4m9HU_1743589759
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 12:25=E2=80=AFPM Parav Pandit <parav@nvidia.com> wro=
te:
>
>
> > From: Cornelia Huck <cohuck@redhat.com>
> > Sent: Wednesday, April 2, 2025 2:53 PM
> >
> > On Tue, Apr 01 2025, Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > wrote:
> >
> > > Backport commits from 1.4 branch into 1.3 in preparation for releasin=
g
> > > v1.3.
> > >
> > > Haixu Cui (1):
> > >   content: Rename SPI master to SPI controller
> > >
> > > Martin Kr=C3=B6ning (1):
> > >   virtio_pci_cap64: specify offset_hi, length_hi endianness
> > >
> > > Paolo Abeni (2):
> > >   virtio-net: clarify NEEDS_CSUM semantic for GSO packats.
> > >   virtio-net: clarify DATA_VALID semantic for encap protos.
> > >
> > > Parav Pandit (8):
> > >   conformance: Add missing virtqueue reset conformance references
> > >   packed-ring: Change host,guest to device,driver
> > >   description: Avoid splitting the word virtqueue
> > >   virtio-blk: Fix data type of num_queues field
> > >   virtio-net: Fix receive buffer size calculation text
> > >   virtio-net: Clarify the size of the struct virtio_net_hdr for tx
> > >   virtio-net: Annotate virtio_net_hdr as field
> > >   gpu: editorial: Fix spelling errors
> > >
> > > Steffen Trumtrar (1):
> > >   virtio-net: Fix receive buffer size typo
> > >
> > >  conformance.tex                  |  2 ++
> > >  content.tex                      |  2 +-
> > >  device-types/blk/description.tex |  2 +-
> > > device-types/gpu/description.tex |  6 ++--
> > > device-types/net/description.tex | 52 +++++++++++++++++++++++--------=
-
> > >  packed-ring.tex                  |  4 +--
> > >  transport-pci.tex                |  4 +--
> > >  7 files changed, 49 insertions(+), 23 deletions(-)
> > >
> > >
> > > base-commit: b495841a8e80d12c1130f8868f4128866291142d
> >
> > Looks good to me.
>
> I did dry run and was able to merge them to master successfully with pdf =
diff too.
> Do we need a vote for it or because these changes are already voted somew=
here else or they are editorial, can I merge the changes now?
>

Cool, thanks. I do not know how this usually works. I was planning to
follow the normal procedure: 1. open an issue, 2. comment in the
thread, 3. open a ballot.

Matias

