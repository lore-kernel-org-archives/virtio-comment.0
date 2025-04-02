Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D673120E70F
	for <virtio-comment@lists.linux.dev>; Wed,  2 Apr 2025 15:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743607516; cv=none; b=bfVyBTF4luBOoAF//fTbHkM3o9egxyqZfesX1jvxHDxpmdlHdYLRHfFipHz/n3aztUxqVHBPhp1zMm24vViNZ1TEVo0goQeAkTTY0nPstcvfChSAXtn6uFNXhBwLIff0vb99QLA3QDXbVkB6DlI9gL0Xd58aQvU8QX3FwH2vDo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743607516; c=relaxed/simple;
	bh=1sTYcODFoj6tbp/5hpv0tA9uJz3SFMF7qRYSgDOH/60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oFBvTcdsvMNrUmlpnsBwju3ptxBZvQL7bJYgKmCvyjdqyHaD2N3zJG3rcRw+hPR3K8yn0fgsGCrIXwTP03L8NpZr2U4avXYpcI/afsubvdZwmgpowIlbxS+YBE1H6xwGH2poy7YLtONwnGwMUZlT+IjoflDGsTuhsqmG94GLYtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OSEEL/HA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OSEEL/HA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743607513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a3NfJ/MaMC4hIGdw2uoveN2g3uLp45ISXzmGIj9k8b0=;
	b=OSEEL/HAsZGBI83Uv3Z0OeLJGbuUnI1FxAvYgmvBFg7eq5JSdCVd2ADNXLl5cf8F9p+iUx
	+HWRmrdd8RRG9sOMB/PGR69LrGVtBkjis8Hwh8ZtnqCGp/Et3aBqRXI1pQZk/Rvl0a8G+K
	LskddFEPzx26yWacFLgReIU4FeMctHw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-kFRbg9y_NzqhoBqNUxeCqQ-1; Wed, 02 Apr 2025 11:25:12 -0400
X-MC-Unique: kFRbg9y_NzqhoBqNUxeCqQ-1
X-Mimecast-MFC-AGG-ID: kFRbg9y_NzqhoBqNUxeCqQ_1743607511
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5e5c808e777so6574021a12.0
        for <virtio-comment@lists.linux.dev>; Wed, 02 Apr 2025 08:25:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743607511; x=1744212311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a3NfJ/MaMC4hIGdw2uoveN2g3uLp45ISXzmGIj9k8b0=;
        b=UqwwsvkQhuxcdVuVJ9bTe9bBmKVrulqlmO0J/oJDgvLzvkGaMoFC12gqB9KBfElWNv
         tpC6DCWHh24CyiwAvou1wMDl2/gKK/1jSi5JCqHFi8Nt2hF5nT3TrCkOaOiTQuKM//yK
         VVoFVCmNNsceyUTem59uHApjPiH6f/SIWIraratc2E5Lls9CPPYX/H6twGTs4Rfok7/T
         3HcVu5Vj2Rqi2rYXPY+JtamA+9xLd1hclJqSbh5TfNsIubyy6juFcDLKmp0vYrjRS5oB
         ti7HdbG6QXTJzpQGHTrpGY7i4Us/e635myBkr7Az0dAVk8eQgl8bLKaJPFZMkgpUfMwO
         +FPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXk6Zt5Rn/BpNXg4mQKfsDSIeyaAhQWJBcX97tTMc79z+acuhSezFaVNFf/rCbzX8VqJko3pjm2k+tKHA0aOw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyzqTQWl5gkkv5B79R3t71y6wXsUj1WmtgR0NnyoFIsfLADDvTy
	DJe5OrhgD4s4+RDMgDvuI4EIlXaZYiw8WQaD77+x2w/3memla5RUoZMf3zyEp49kBCMDNDDqhUS
	XjCEtFBRcUDMLSoOuXswRX5hTqPJ13wUD78oXeVNHFPh9w7N9lepjGR8oQnyEJ6GQmzXtRFMvDM
	iFaO/aOeUmRAV//Fkn0TLiAKkVfRpBDinFChEZ9xY=
X-Gm-Gg: ASbGncv2FxIOcay+vAANRA5qPzwffP126yxG/qjfqTcWoRBM8LMNGG5azZvnbQAzZ2y
	FqbjB6wJTzxNK6hfIBll02vVt6Bvh0kywT361GDCdXdDBL/e0Nf0JGmyu/QRsRDk9inPAbq9uQZ
	zjTHdLJVVnP/w0kjqnOMe6OQdsNPiW
X-Received: by 2002:a05:6402:5488:b0:5f0:242d:5c08 with SMTP id 4fb4d7f45d1cf-5f0242d5c5bmr6718424a12.24.1743607511085;
        Wed, 02 Apr 2025 08:25:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFo5q9OO21MRp8E4ZSWIxmJbHgn/Za7/lNE3Yps88s9zknfnlagbgZctWW5DRc2mJYznnQwDsFZaP6vgQ7bP9A=
X-Received: by 2002:a05:6402:5488:b0:5f0:242d:5c08 with SMTP id
 4fb4d7f45d1cf-5f0242d5c5bmr6718401a12.24.1743607510780; Wed, 02 Apr 2025
 08:25:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250401133543.801184-1-mvaralar@redhat.com> <87y0wiapex.fsf@redhat.com>
 <CY8PR12MB71956AADC6DBE9891FE9CA9BDCAF2@CY8PR12MB7195.namprd12.prod.outlook.com>
 <CAHYGQ0x2_QtLBrMmxmzcdNUki5Xjjhvg7e=khYVFWbtnGrYgvQ@mail.gmail.com> <CY8PR12MB7195C055D9C78F68CCD1AE61DCAF2@CY8PR12MB7195.namprd12.prod.outlook.com>
In-Reply-To: <CY8PR12MB7195C055D9C78F68CCD1AE61DCAF2@CY8PR12MB7195.namprd12.prod.outlook.com>
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Date: Wed, 2 Apr 2025 17:24:58 +0200
X-Gm-Features: AQ5f1Jq2VIwanrt6js9V0dpTHUao-UsLkBW8ot92Pmv66Fxlni0CCZ6Mw9NIp2s
Message-ID: <CAHYGQ0z69kwemGBahoEBz7Est8+8e2GjsFH_Xx-kA=51iomMqQ@mail.gmail.com>
Subject: Re: [PATCH 00/13] Backport 1.4 fixes to 1.3
To: Parav Pandit <parav@nvidia.com>
Cc: Cornelia Huck <cohuck@redhat.com>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, "mst@redhat.com" <mst@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wq1HcEJ2z7XteFrk2BUka2fqLAnnKOSOCmXm4pQZH2E_1743607511
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 12:59=E2=80=AFPM Parav Pandit <parav@nvidia.com> wro=
te:
>
>
> > From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > Sent: Wednesday, April 2, 2025 3:59 PM
> >
> > On Wed, Apr 2, 2025 at 12:25=E2=80=AFPM Parav Pandit <parav@nvidia.com>=
 wrote:
> > >
> > >
> > > > From: Cornelia Huck <cohuck@redhat.com>
> > > > Sent: Wednesday, April 2, 2025 2:53 PM
> > > >
> > > > On Tue, Apr 01 2025, Matias Ezequiel Vara Larsen
> > > > <mvaralar@redhat.com>
> > > > wrote:
> > > >
> > > > > Backport commits from 1.4 branch into 1.3 in preparation for
> > > > > releasing v1.3.
> > > > >
> > > > > Haixu Cui (1):
> > > > >   content: Rename SPI master to SPI controller
> > > > >
> > > > > Martin Kr=C3=B6ning (1):
> > > > >   virtio_pci_cap64: specify offset_hi, length_hi endianness
> > > > >
> > > > > Paolo Abeni (2):
> > > > >   virtio-net: clarify NEEDS_CSUM semantic for GSO packats.
> > > > >   virtio-net: clarify DATA_VALID semantic for encap protos.
> > > > >
> > > > > Parav Pandit (8):
> > > > >   conformance: Add missing virtqueue reset conformance references
> > > > >   packed-ring: Change host,guest to device,driver
> > > > >   description: Avoid splitting the word virtqueue
> > > > >   virtio-blk: Fix data type of num_queues field
> > > > >   virtio-net: Fix receive buffer size calculation text
> > > > >   virtio-net: Clarify the size of the struct virtio_net_hdr for t=
x
> > > > >   virtio-net: Annotate virtio_net_hdr as field
> > > > >   gpu: editorial: Fix spelling errors
> > > > >
> > > > > Steffen Trumtrar (1):
> > > > >   virtio-net: Fix receive buffer size typo
> > > > >
> > > > >  conformance.tex                  |  2 ++
> > > > >  content.tex                      |  2 +-
> > > > >  device-types/blk/description.tex |  2 +-
> > > > > device-types/gpu/description.tex |  6 ++--
> > > > > device-types/net/description.tex | 52 +++++++++++++++++++++++----=
-----
> > > > >  packed-ring.tex                  |  4 +--
> > > > >  transport-pci.tex                |  4 +--
> > > > >  7 files changed, 49 insertions(+), 23 deletions(-)
> > > > >
> > > > >
> > > > > base-commit: b495841a8e80d12c1130f8868f4128866291142d
> > > >
> > > > Looks good to me.
> > >
> > > I did dry run and was able to merge them to master successfully with =
pdf
> > diff too.
> > > Do we need a vote for it or because these changes are already voted
> > somewhere else or they are editorial, can I merge the changes now?
> > >
> >
> > Cool, thanks. I do not know how this usually works. I was planning to f=
ollow
> > the normal procedure: 1. open an issue, 2. comment in the thread, 3. op=
en a
> > ballot.
> >
> Sounds good to me.
>
> We need below fix too.
>
> 124fcd0 virtio-net: Fix receive buffer size typo

I think it is in `[PATCH 13/13] virtio-net: Fix receive buffer size typo`.

Matias

