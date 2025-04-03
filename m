Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC942E3385
	for <virtio-comment@lists.linux.dev>; Thu,  3 Apr 2025 12:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743684504; cv=none; b=fWYAGkSYY0/6WnXN+KJ2Doxmt0hxNozNpMDurVXptrMZbWuhl+rP2UAHvkEkYQ6s75ZTIekVysepe7koHfG+EtN+bV8FI+3i/turkCLh9JVcdfTmx9QT0UahVToaxO7aHnaiSPoWlbJPt4EA6C/vbkCETlClNBO2qBZ8MXPCsHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743684504; c=relaxed/simple;
	bh=PcpaMo38KWFBgvsMhSCGUuULdh8eYKwOIS/nIqsUZ7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=iycGx2ofSxnPLdfU9FX5ar/SNay4VQeqsKF31fJ/gFq2ThXG6voLQscO8vLjcraDDNlqswUCyrpxt3BmTcFMajo7JYKqEU4YYmVyON8yH5xXm9IRsHxjRVcEWjRn5hTFRN8YhvxM2sJ5J6vSHUuaEP6qlzPRu22phvzbPXMl8LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Wo6EX06t; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Wo6EX06t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743684501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SOwyKeHHGplN7+HLe+ptvvGcGGQ7bp8HkgF8x8VuKTs=;
	b=Wo6EX06tUO+Wx6tRWErIjhUiymWfUutbtVpU5t/B3eTX8/yqDV2JTNmV038pyowrxuamrF
	z7I7WlgBp3PZaFIM36GCh9Dy7X8Z7CNr5f2/QRXjA9M69we3A+KaABp9dL9+hyc30BXS8H
	lLaTRFbPjIB8OGSw2QZBrSlzMqx+V4Y=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-ZUdQKN3eMUO95HblmSXTDw-1; Thu, 03 Apr 2025 08:48:20 -0400
X-MC-Unique: ZUdQKN3eMUO95HblmSXTDw-1
X-Mimecast-MFC-AGG-ID: ZUdQKN3eMUO95HblmSXTDw_1743684499
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-54ac9c33f74so438959e87.1
        for <virtio-comment@lists.linux.dev>; Thu, 03 Apr 2025 05:48:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743684499; x=1744289299;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SOwyKeHHGplN7+HLe+ptvvGcGGQ7bp8HkgF8x8VuKTs=;
        b=iTRX28HMBuCN3VtZTXMZA+ex5kLNdDD5ZL23at/mtepafk8s54WWFeO6epkt+O3FEY
         tmfvFQUtA23DqB1KMAytVmQg8T2lh1a8TOyyyg7ftXU+BLRagm2pmB1X4HyMC+sUIcMs
         4ICzASc0Xe7lGegNdYyAOJbAO/w6I9RDcn0umYeA0wpPsLA+ci+h+GzVkQ8+85+EXrWe
         SsYjxHlribieIrGB0mK/wE8hgwJKu/kpypXzxKK39+67E5vFrcfeaT5ytzQ4OyVS59yc
         3QbyCn96Y6awaK2bnZYrZ10g8u454mW0ekW8QGtTxFYEPPsgux0YJi2I8rNe6z/retjT
         c0ZA==
X-Forwarded-Encrypted: i=1; AJvYcCU3XYdkgd9LHTcuEFrwE0f894k09B34yWC/XN1jFWkeruCV4d+U1f2riW2U0guDW+FYppnSY73VhIuwhfk//w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyne7obIThMfUAw/IAPtFVS6eSuYa2pSgUWEu4WeioFCLLE16xg
	BoWNt6GnsCPknc4b1WjxJPTwn5qo3zGG56PIz1GAHiotx8kzA6bkh9ydKUendXyD0NAI7KxS7Qr
	yZ65pfeRes8syn5Ddc5h8vEj9sfL1gcZBdb1h/FKWy9xwuKpiRUnW/PVhmt8fF1ln
X-Gm-Gg: ASbGncs/iVsst3X0CbCmWISIV5wCY+cddjNQneZw9e1FvzoZvoUZIlbTxL0QxX4JrhG
	JelgSINlldwdNTGLGGidji8thS78wlWhYBx/fPD4J+0ahmO/Z4uOPYSel7iHk5Wt9rXiylYYIaE
	nblkvtlkLk4sP3zOFSywbeHmw84ewJ5jwT8QRgvWRPAeKYuF1POW4uT1BIXfkE4nWjijyAK1L7w
	yncfL4pUcIujgUXrids/0qFszpJKS1JDr9XjJnwCSYMbF3mYtc54PfncSKGxR1OEW27TXQ5sV3v
	AjlR4OKrlg==
X-Received: by 2002:a05:6512:2350:b0:549:8999:8bc6 with SMTP id 2adb3069b0e04-54c1ca5a5a7mr1084195e87.6.1743684498693;
        Thu, 03 Apr 2025 05:48:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEG9NM0gjGWD44eZnVMdbZ6DtDQTLME7/lPKXv+CX7zdnhyoze3I4+CnPAFQf9p0TEey7H7kQ==
X-Received: by 2002:a05:6512:2350:b0:549:8999:8bc6 with SMTP id 2adb3069b0e04-54c1ca5a5a7mr1084187e87.6.1743684498214;
        Thu, 03 Apr 2025 05:48:18 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e5c2377sm149003e87.85.2025.04.03.05.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 05:48:17 -0700 (PDT)
Date: Thu, 3 Apr 2025 08:48:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Subject: Re: [PATCH 00/13] Backport 1.4 fixes to 1.3
Message-ID: <20250403084731-mutt-send-email-mst@kernel.org>
References: <20250401133543.801184-1-mvaralar@redhat.com>
 <87y0wiapex.fsf@redhat.com>
 <CY8PR12MB71956AADC6DBE9891FE9CA9BDCAF2@CY8PR12MB7195.namprd12.prod.outlook.com>
 <CAHYGQ0x2_QtLBrMmxmzcdNUki5Xjjhvg7e=khYVFWbtnGrYgvQ@mail.gmail.com>
 <CY8PR12MB7195C055D9C78F68CCD1AE61DCAF2@CY8PR12MB7195.namprd12.prod.outlook.com>
 <CAHYGQ0z69kwemGBahoEBz7Est8+8e2GjsFH_Xx-kA=51iomMqQ@mail.gmail.com>
 <CAHYGQ0xfGzxqgBsZuyH7-WPTobkKq+fw+z_G5nq4xyJdzPvmbA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAHYGQ0xfGzxqgBsZuyH7-WPTobkKq+fw+z_G5nq4xyJdzPvmbA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Pw_zzHGgiqsGGGcq0TVCpCcYiCc51hLpsb_LN6c_Rag_1743684499
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Apr 03, 2025 at 10:14:42AM +0200, Matias Ezequiel Vara Larsen wrote:
> On Wed, Apr 2, 2025 at 5:24 PM Matias Ezequiel Vara Larsen
> <mvaralar@redhat.com> wrote:
> >
> > On Wed, Apr 2, 2025 at 12:59 PM Parav Pandit <parav@nvidia.com> wrote:
> > >
> > >
> > > > From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > > > Sent: Wednesday, April 2, 2025 3:59 PM
> > > >
> > > > On Wed, Apr 2, 2025 at 12:25 PM Parav Pandit <parav@nvidia.com> wrote:
> > > > >
> > > > >
> > > > > > From: Cornelia Huck <cohuck@redhat.com>
> > > > > > Sent: Wednesday, April 2, 2025 2:53 PM
> > > > > >
> > > > > > On Tue, Apr 01 2025, Matias Ezequiel Vara Larsen
> > > > > > <mvaralar@redhat.com>
> > > > > > wrote:
> > > > > >
> > > > > > > Backport commits from 1.4 branch into 1.3 in preparation for
> > > > > > > releasing v1.3.
> > > > > > >
> > > > > > > Haixu Cui (1):
> > > > > > >   content: Rename SPI master to SPI controller
> > > > > > >
> > > > > > > Martin Kröning (1):
> > > > > > >   virtio_pci_cap64: specify offset_hi, length_hi endianness
> > > > > > >
> > > > > > > Paolo Abeni (2):
> > > > > > >   virtio-net: clarify NEEDS_CSUM semantic for GSO packats.
> > > > > > >   virtio-net: clarify DATA_VALID semantic for encap protos.
> > > > > > >
> > > > > > > Parav Pandit (8):
> > > > > > >   conformance: Add missing virtqueue reset conformance references
> > > > > > >   packed-ring: Change host,guest to device,driver
> > > > > > >   description: Avoid splitting the word virtqueue
> > > > > > >   virtio-blk: Fix data type of num_queues field
> > > > > > >   virtio-net: Fix receive buffer size calculation text
> > > > > > >   virtio-net: Clarify the size of the struct virtio_net_hdr for tx
> > > > > > >   virtio-net: Annotate virtio_net_hdr as field
> > > > > > >   gpu: editorial: Fix spelling errors
> > > > > > >
> > > > > > > Steffen Trumtrar (1):
> > > > > > >   virtio-net: Fix receive buffer size typo
> > > > > > >
> > > > > > >  conformance.tex                  |  2 ++
> > > > > > >  content.tex                      |  2 +-
> > > > > > >  device-types/blk/description.tex |  2 +-
> > > > > > > device-types/gpu/description.tex |  6 ++--
> > > > > > > device-types/net/description.tex | 52 +++++++++++++++++++++++---------
> > > > > > >  packed-ring.tex                  |  4 +--
> > > > > > >  transport-pci.tex                |  4 +--
> > > > > > >  7 files changed, 49 insertions(+), 23 deletions(-)
> > > > > > >
> > > > > > >
> > > > > > > base-commit: b495841a8e80d12c1130f8868f4128866291142d
> > > > > >
> > > > > > Looks good to me.
> > > > >
> > > > > I did dry run and was able to merge them to master successfully with pdf
> > > > diff too.
> > > > > Do we need a vote for it or because these changes are already voted
> > > > somewhere else or they are editorial, can I merge the changes now?
> > > > >
> > > >
> > > > Cool, thanks. I do not know how this usually works. I was planning to follow
> > > > the normal procedure: 1. open an issue, 2. comment in the thread, 3. open a
> > > > ballot.
> > > >
> > > Sounds good to me.
> > >
> > > We need below fix too.
> > >
> > > 124fcd0 virtio-net: Fix receive buffer size typo
> >
> > I think it is in `[PATCH 13/13] virtio-net: Fix receive buffer size typo`.
> >
> > Matias
> 
> Could please open a voting ballot for these changes?
> 
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/220
> 
> Thanks, Matias.


OK but you need to fix the link in the issue to point at
the virtio comment list. We need to be sure only patches
on list are merged.

