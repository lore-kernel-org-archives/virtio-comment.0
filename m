Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69857241688
	for <virtio-comment@lists.linux.dev>; Thu,  3 Apr 2025 08:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743668099; cv=none; b=WD+L2tq/OVSbbV3OmS8Xi4jnM1g3ffH1ifD1j2UQh3IR28EmRG4+/1MJczYJ8iRO9kIOO+9se8lj3WIv9jJNrLN61TMypx5Du/bO1NB64Pr3rkfv2S1XZ6lk8c+vwDsnbUqedrQ0X0ow+3Ly36141J6G/81eoR+/L3K/sVPZgjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743668099; c=relaxed/simple;
	bh=qs5Dc//XbmmLFt5TtR8y7sEXYZFbnXU8Phb0GgLoAWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KYzeCmCsi5aQ3rKAkqtdWkM2wbObZh9aUPDRgPCxt81ze2gohj2L3SJKob6ausSyPNCjYnWvzIkdHKGkjmlzMtBJQ9CxGZOSZw24eHCgF+/EjC7JBsC3gOlfmTC2EA874DcAFFuRCV2xR/n17RnYK4NXgKBvtc4jUkJiX5CTiwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VlGnHgVA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VlGnHgVA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743668096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m7fIovHPzqzlBjqJSWxBsPjR3AkxviZ81vXe2bJjv6Y=;
	b=VlGnHgVAf2mbeopKrda1o2d3R1hOn6h3DaEWBozXAYOF4Uf7zESqFUcAaCV1hnI7XK0/gF
	uMpM5d9oBF3dUStuc0rXuiJSptSKZKpo9GQhEqW2Y4b6tGXUsJG7Tn/JJunHLSxracINTI
	DyP90+BSEN2SvmFM4JoFp8Wop3cDgCQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-371-tv2ICX6xMf6yZMV_F1S2pg-1; Thu, 03 Apr 2025 04:14:54 -0400
X-MC-Unique: tv2ICX6xMf6yZMV_F1S2pg-1
X-Mimecast-MFC-AGG-ID: tv2ICX6xMf6yZMV_F1S2pg_1743668094
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac31adc55e4so53908866b.3
        for <virtio-comment@lists.linux.dev>; Thu, 03 Apr 2025 01:14:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743668094; x=1744272894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m7fIovHPzqzlBjqJSWxBsPjR3AkxviZ81vXe2bJjv6Y=;
        b=RVJcC+y35LOjm6X2MupFPvbL9+SftXgkgcANKpiZ6LqYdcdBhD9g64K8GxVD2lz8Dv
         +T8o+umEqeMHb7DzwJqVS1h4GizA7TLpiETnzXQ7dr4hVwqKBU/UX+HkvGputexuLBgK
         3NPRUAw/IuzeuELK3rg1QzjW7WdKIa2cU+N+4avLt+DQEjG9SqZ6BstTtT3w0rdHTj22
         geDDUmPsigr44YsKxECN+4rMurLIz1NqQoo2oKqLRlsTHk46jMjoxAxmuPo6zmhOtg8m
         jhQH98S2YEQfwJsR1TKZ4L4YGTJJOAT8WwJl2Y0Y0aE5XHupB646aL2yAE4vxqG59zA8
         T7yw==
X-Forwarded-Encrypted: i=1; AJvYcCXfDwwFeLg+yzd2+MExkoWaRMSK4kMwCUT36v0+L/fm4ixr/UKVppEeE26q8iII3pAvS/e2vomlW+i5HsYP+Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwcWOZXyutGZj/AfCRhz0UwWVsy4V0YwlXgn1cqsHpr+fsyn990
	LqaJ5RG8mMR51SCi+AoeFHmnPcUrvmUJ4u3OTzKKtgF28jeX5nYeE2j5GQl8v+lMoC+8U4KCZiU
	K8cChMXIdqBl9ZFEJc4lDTPHV23VAw0lD1/eML8iXFFJIm+1X7bpxyBRB686Y5tVx6LrNGRqALt
	YITNT8w4zQPnUDjuDM3yRsn1puCBBoSAqs/jZQp04=
X-Gm-Gg: ASbGnctwEu0jqE91FL8eo6KGZv6Aml8QwaPJMCtdtW+NU7JY6F2IVlnfs6HN5q4Ftc1
	OE2u9mQHzfEWxnaxtJsLuY7mFgzm68iVJjC0tzKZUiSPFTqb9Jg4bMXarGQtasuoB0Q2tq8n7B+
	u5D/pWWxJdj0dQuj2ry5OVZf/mDYkD
X-Received: by 2002:a17:906:d204:b0:ac3:f0a3:582e with SMTP id a640c23a62f3a-ac7c0a558ccmr98185166b.41.1743668093653;
        Thu, 03 Apr 2025 01:14:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+KPUrSZD14Zwb67FalGQiou11JHLP5270rwaOCVmtcXWjkwQl+rQtPMdLo6QaCoCzUjDtHU8MnEqWdY3bdCY=
X-Received: by 2002:a17:906:d204:b0:ac3:f0a3:582e with SMTP id
 a640c23a62f3a-ac7c0a558ccmr98182866b.41.1743668093201; Thu, 03 Apr 2025
 01:14:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250401133543.801184-1-mvaralar@redhat.com> <87y0wiapex.fsf@redhat.com>
 <CY8PR12MB71956AADC6DBE9891FE9CA9BDCAF2@CY8PR12MB7195.namprd12.prod.outlook.com>
 <CAHYGQ0x2_QtLBrMmxmzcdNUki5Xjjhvg7e=khYVFWbtnGrYgvQ@mail.gmail.com>
 <CY8PR12MB7195C055D9C78F68CCD1AE61DCAF2@CY8PR12MB7195.namprd12.prod.outlook.com>
 <CAHYGQ0z69kwemGBahoEBz7Est8+8e2GjsFH_Xx-kA=51iomMqQ@mail.gmail.com>
In-Reply-To: <CAHYGQ0z69kwemGBahoEBz7Est8+8e2GjsFH_Xx-kA=51iomMqQ@mail.gmail.com>
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Date: Thu, 3 Apr 2025 10:14:42 +0200
X-Gm-Features: ATxdqUF9ntjZBjO0PG04htOgZ95bTjUGe4Hl7pd09hPGZQ5Qoc7GTbAYukb8Dds
Message-ID: <CAHYGQ0xfGzxqgBsZuyH7-WPTobkKq+fw+z_G5nq4xyJdzPvmbA@mail.gmail.com>
Subject: Re: [PATCH 00/13] Backport 1.4 fixes to 1.3
To: Parav Pandit <parav@nvidia.com>
Cc: Cornelia Huck <cohuck@redhat.com>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, "mst@redhat.com" <mst@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0aA3tVQZwmbDnJ2tCbFGOHHeLaBDVnvMaZZL4N5cnF0_1743668094
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 5:24=E2=80=AFPM Matias Ezequiel Vara Larsen
<mvaralar@redhat.com> wrote:
>
> On Wed, Apr 2, 2025 at 12:59=E2=80=AFPM Parav Pandit <parav@nvidia.com> w=
rote:
> >
> >
> > > From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > > Sent: Wednesday, April 2, 2025 3:59 PM
> > >
> > > On Wed, Apr 2, 2025 at 12:25=E2=80=AFPM Parav Pandit <parav@nvidia.co=
m> wrote:
> > > >
> > > >
> > > > > From: Cornelia Huck <cohuck@redhat.com>
> > > > > Sent: Wednesday, April 2, 2025 2:53 PM
> > > > >
> > > > > On Tue, Apr 01 2025, Matias Ezequiel Vara Larsen
> > > > > <mvaralar@redhat.com>
> > > > > wrote:
> > > > >
> > > > > > Backport commits from 1.4 branch into 1.3 in preparation for
> > > > > > releasing v1.3.
> > > > > >
> > > > > > Haixu Cui (1):
> > > > > >   content: Rename SPI master to SPI controller
> > > > > >
> > > > > > Martin Kr=C3=B6ning (1):
> > > > > >   virtio_pci_cap64: specify offset_hi, length_hi endianness
> > > > > >
> > > > > > Paolo Abeni (2):
> > > > > >   virtio-net: clarify NEEDS_CSUM semantic for GSO packats.
> > > > > >   virtio-net: clarify DATA_VALID semantic for encap protos.
> > > > > >
> > > > > > Parav Pandit (8):
> > > > > >   conformance: Add missing virtqueue reset conformance referenc=
es
> > > > > >   packed-ring: Change host,guest to device,driver
> > > > > >   description: Avoid splitting the word virtqueue
> > > > > >   virtio-blk: Fix data type of num_queues field
> > > > > >   virtio-net: Fix receive buffer size calculation text
> > > > > >   virtio-net: Clarify the size of the struct virtio_net_hdr for=
 tx
> > > > > >   virtio-net: Annotate virtio_net_hdr as field
> > > > > >   gpu: editorial: Fix spelling errors
> > > > > >
> > > > > > Steffen Trumtrar (1):
> > > > > >   virtio-net: Fix receive buffer size typo
> > > > > >
> > > > > >  conformance.tex                  |  2 ++
> > > > > >  content.tex                      |  2 +-
> > > > > >  device-types/blk/description.tex |  2 +-
> > > > > > device-types/gpu/description.tex |  6 ++--
> > > > > > device-types/net/description.tex | 52 +++++++++++++++++++++++--=
-------
> > > > > >  packed-ring.tex                  |  4 +--
> > > > > >  transport-pci.tex                |  4 +--
> > > > > >  7 files changed, 49 insertions(+), 23 deletions(-)
> > > > > >
> > > > > >
> > > > > > base-commit: b495841a8e80d12c1130f8868f4128866291142d
> > > > >
> > > > > Looks good to me.
> > > >
> > > > I did dry run and was able to merge them to master successfully wit=
h pdf
> > > diff too.
> > > > Do we need a vote for it or because these changes are already voted
> > > somewhere else or they are editorial, can I merge the changes now?
> > > >
> > >
> > > Cool, thanks. I do not know how this usually works. I was planning to=
 follow
> > > the normal procedure: 1. open an issue, 2. comment in the thread, 3. =
open a
> > > ballot.
> > >
> > Sounds good to me.
> >
> > We need below fix too.
> >
> > 124fcd0 virtio-net: Fix receive buffer size typo
>
> I think it is in `[PATCH 13/13] virtio-net: Fix receive buffer size typo`=
.
>
> Matias

Could please open a voting ballot for these changes?

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/220

Thanks, Matias.

