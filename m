Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA851400A
	for <virtio-comment@lists.linux.dev>; Mon,  9 Sep 2024 03:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725852374; cv=none; b=AJEo0QlpyPb4b+p+zJs6BJsI7UgcgBVDDajTweBHv99eYJpjyYUerBWCrcyNvDYxru5sk3SPpt2BEQpVMcUaL0/2mwpvmOKPo1I0qo9NVQNvZugwI026jPRkaxzim1oO6vSVLLtwJ5tkJ5N2iVt7vfWulMbH8bguL9sJEHbzLkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725852374; c=relaxed/simple;
	bh=63mG52kj2Q/Cjq9CY5KN48ZSreumAWNklZUL39YGAZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hpUtbbassKU51a/Z5zyTt6ZQ/ZvG8hwSFUPRbCaupmdK/v81lm5gVQoCpsNzprxg2UMylPlvfLZ4tiwfAgCB4ZkPeHGRK7JNbomC4JMB9DgewleukCPtexMDhZSnDmUBG67sK6B2g6c92VEklqFeO2Gt6qVpqZQgJZHAL41X6JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=igRfKzI8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="igRfKzI8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725852371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jvpb3ADWrFiWQ2XfE2+UIW+wne9rI5F8o5kJ5PUTFZY=;
	b=igRfKzI8YduOirvvwHTKGbO0zeSXJaRxY2Ae8XJVl9/A5d9c2LkTyMy1iUSyZTeqqFviPO
	BW/tMgUZg3+hIIuBnZ5shXu0272sp0zZMN9nYYU2zLN8CVl/gK6eRfXWQ67U5VFqQdmf9M
	G5DeyQH/l/Z9vJRfYHQ60BqLjKyUiIE=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-g6mwdjYqMq68ifB-zweIBA-1; Sun, 08 Sep 2024 23:26:10 -0400
X-MC-Unique: g6mwdjYqMq68ifB-zweIBA-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2d889fc26e7so4136603a91.3
        for <virtio-comment@lists.linux.dev>; Sun, 08 Sep 2024 20:26:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725852369; x=1726457169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jvpb3ADWrFiWQ2XfE2+UIW+wne9rI5F8o5kJ5PUTFZY=;
        b=Aw8LeQ+UrMQ7o7gK3C5LLh4sDy/x879hNOLHRl8tq49i9NbCn1LvYbsPL5cShf8Zy4
         b4ESq3/KYtihtmKQjr0dpZF/mWVu0SmN0IPMgW9ZNDKeFZhZU889PtmInjowwlnpXUk8
         rObK8ko4NMCgjhHoAeQFwY/XcaJ540vsU9jcKBn++fBl+0gmCIzFBA3vE3EqoO6wHeum
         NKyPMGcy0aPz2RT5W5oNs2XtRtNcQo76HOVvljQM/3ewoYb/XBdP1PqfwQujrRqQ7PtJ
         HmoPRB5X7AryDUB6FAg3NEqTNnSuyCItWp0DKutDVWyKdbhMqXzvR3TJxV+29agONeyv
         c8Aw==
X-Forwarded-Encrypted: i=1; AJvYcCVzBPw1yCgaDbyqyrdUSU0sztQk2mbIFIsc+x6jmqT3xXns68Kxali127o2jBoLKNSEjWgRoc50P/lkAO9vPg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzxk18ZqZ1iOoKowoBgNsZC92OK/yw24N+QBRdVp4Ep7+wOZjzN
	TTWrytX2godakyNZY/k+Oxf57v8filxGw5/JzGQ3FcfTJ+jZNZT08ZxmqUcb0s6TK+yN6rgVknI
	wMd/LwueT60aF0CkLpNLtWaCTcT3hXCgmk6T5Chqxwuj8MnaYsZwkmM2xDGesBeeidDRVs2AFSa
	pRTUr1hETwEhbbKM2LZM3ISM53FNyhBHbNGv1HUEojy/GEQuM=
X-Received: by 2002:a17:90b:4c84:b0:2d8:87d3:903b with SMTP id 98e67ed59e1d1-2dad5196fe1mr8430265a91.35.1725852368867;
        Sun, 08 Sep 2024 20:26:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFB7/HP+GcwUiRV3EqpFYQ6OlG9MBiS5rDAm1Up9YC46XXGA1X8MF2hyw+FbZzo7nV7R8hgkEV3RPMQfBW5yFY=
X-Received: by 2002:a17:90b:4c84:b0:2d8:87d3:903b with SMTP id
 98e67ed59e1d1-2dad5196fe1mr8430242a91.35.1725852368328; Sun, 08 Sep 2024
 20:26:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240905134621.711743-1-eric.auger@redhat.com>
 <CACGkMEs8moUvhZda78cCstjO+aYb+SsrFF_nks6BJptVcYD_xg@mail.gmail.com> <20240906134724.GA780139@myrica>
In-Reply-To: <20240906134724.GA780139@myrica>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 9 Sep 2024 11:25:57 +0800
Message-ID: <CACGkMEvtA6FdzebGifyjzLumN6dhuCrg=bJmKfrE1xioY0tF1A@mail.gmail.com>
Subject: Re: [PATCH] virtio-iommu: Introduce lazy mode domains and IOTLB_FLUSH request
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com, 
	virtio-comment@lists.linux.dev, mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 9:47=E2=80=AFPM Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> On Fri, Sep 06, 2024 at 07:50:44AM +0800, Jason Wang wrote:
> > On Thu, Sep 5, 2024 at 9:46=E2=80=AFPM Eric Auger <eric.auger@redhat.co=
m> wrote:
> > >
> > > At the moment the virtio-iommu offers MAP and UNMAP requests.
> > > This means that if the virtio-iommu protects a device with an iotlb
> > > we have no other choice but invalidating the device iotlb on UNMAP.
> > > This proposal aims at allowing the decoupling of UNMAP commands
> > > and domain IOTLB invalidations.
> >
> > I think there should be some difference between "device iotlb" and
> > "domain IOTLB".  My understanding is that usually "device iotlb" means
> > the mapping cached by the individual device while "domain IOTLB" means
> > the mapping cached by the IOMMU.
> >
> > E.g in the case of intel IOMMU, it has two kind of invalidation
> >
> > device iotlb invalidation: used to invalidate device IOTLB via ATS
> > domain selective invalidation: used to invalidate all IOTLB for a
> > specific domain
>
> I agree, and we should describe the TLBs a little more since the spec
> didn't need to mention them so far. An implementation could have both
> IOTLBs:
>
>   dev <-> dev-IOTLB <-> IOTLB <-> mapping tree <-> virtio-iommu drv
>
> At the moment, the MAP/UNMAP interface only acts on the mapping tree, and
> the virtio-iommu device implicitly invalidates both IOTLB and dev-IOTLB o=
n
> UNMAP. Here you want to keep the UNMAP requests and add an explicit IOTLB
> FLUSH request. The IOMMU device would keep maintaining the mappings tree
> on UNMAP, but wait until a FLUSH request to clear IOTLB and dev-IOTLB.
>
> >
> > > This enables lazy mode where iotlb
> > > invalidations are deferred and batched. In that prospect we add a
> > > new VIRTIO_IOMMU_F_LAZY_IOTLB_FLUSH feature which, when offered
> > > allows an endpoint to be attached to a domain in lazy mode. Alongside
> > > we introduce a new IOTLB_FLUSH request which allows to invalidate
> > > iotlb entries for the whole domain.
> >
> > I am not sure "lazy" is the best, for example a driver may just want
> > to invalidate all the mappings for some reason. Is this better to
> > rename this as "_F_IOTLB_FLUSH" instead?
> >
> > > When the domain is created in
> > > lazy mode, the virtio-iommu device knows it will receive IOTLB_FLUSH
> > > and it can avoid flushing the device IOTLB on individual UNMAPs.
> >
> > I wonder what's the advantage to make it per domain instead of per devi=
ce.
>
> The UNMAP request works on domains (=3D address spaces), so at the moment
> when handling UNMAP the virtio-iommu device already needs to implicitly
> issue a "invalidate all dev-IOTLB attached to this domain". Since we're
> splitting out this operation into an explicit request, I think making the
> request per domain means less work on the virtio-iommu device side,
> because it's familiar with manipulating domains rather than devices.

Ok, I see.

>
>
> >
> > >
> > > On a virtio-iommu/vhost scp use case, this can improve the
> > > performance by ~10%.
> > >
> > > Signed-off-by: Eric Auger <eric.auger@redhat.com>
> > > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/204
> > >
> > > ---
> > >
> > > As a side not virtio-iommu/vhost/scp use case was completely broken
> >
> > For "not" I think you mean "now"?
> >
> > > on aarch64 with guests older than v6.6-rc1. The scp stalled and we go=
t
> > > soft-lockups on guest in viommu_iotlb_sync. It happened
> > > 295525e29a5b (=E2=80=9Cvirtio_net: merge dma operations when filling =
mergeable buffers=E2=80=9D)
> >
> > Interesting, it doesn't seem to be a fix.
> >
> > > fixed the performance issue. Without that patch and with lazy mode, w=
e
> > > do not observe any stalls although the perf is way worse than with th=
e
> > > above patch. Without lazy mode, it looks like the number of vhost iot=
lb
> > > invalidation is large enough to cause serious performance issues.
> > >
> > > This proposal can be tested with the following branches
> > > guest branch: https://github.com/eauger/linux/tree/virtio-iommu-lazy-=
rfc
> > > qemu branch: https://github.com/eauger/qemu/tree/virtio-iommu-device-=
lazy-rfc
> > >
> > > This was tested with vhost. In qemu command line, you need to set ats=
=3Don
> > > to get benefit of lazy mode.
> >
> > Ok, I think what you really meant is the "device iotlb" as it ties to A=
TS.
> >
> > > ---
> > >  device-types/iommu/description.tex | 74 ++++++++++++++++++++++++++++=
+-
> > >  1 file changed, 73 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/device-types/iommu/description.tex b/device-types/iommu/=
description.tex
> > > index f8cbe88..990734e 100644
> > > --- a/device-types/iommu/description.tex
> > > +++ b/device-types/iommu/description.tex
> > > @@ -74,6 +74,14 @@ \subsection{Feature bits}\label{sec:Device Types /=
 IOMMU Device / Feature bits}
> > >    whether endpoints that are attached to a domain are in bypass
> > >    mode.
> > >
> > > +\item[VIRTIO_IOMMU_F_LAZY_IOTLB_FLUSH (7)]
> > > +  This feature determines the capability to use deferred and batched
> > > +  IOTLB flushes. If the feature is available, the driver can inform
> > > +  a given domain works in lazy mode. For such domain, the device is
> > > +  allowed to dissociate UNMAP requests from IOTLB flush operations a=
nd
> > > +  accepts separate IOTLB flush requests that invalidate the IOTLB en=
tries
> > > +  for the whole domain.
> >
> > Does this imply a flush for device IOTLB invalidation? It need more
> > clarification.
> >
> > Or we probably need to do the same as other IOMMU to separate device
> > IOTLB invalidation from the IOMMU IOTLB.
>
> It's a good question. When adding page table support to virtio-iommu I
> initially added separate flags for IOMMU IOTLB and dev-IOTLB, but in the
> end I couldn't find a reason to act on them separately, so now invalidate
> just means "all IOTLBs including ATCs".
>
> If the IOTLB and ATC are invalidated through different channels (Arm
> broadcast TLB maintenance, where IOTLBs are invalidate with CPU
> instructions but not ATCs), the host knows about it and only invalidates
> the ATC when receiving a request.
>
> So in my opinion a single request acting on all IOTLBs and dev-IOTLBs is
> all we need at the moment.

Ok, I see. Just a note that as both Intel and AMD IOMMU have dedicated
device IOTLB flush commands. (But they have other advanced features
with them). Anyhow the spec could be extended if we find one real use
case.

Thanks

