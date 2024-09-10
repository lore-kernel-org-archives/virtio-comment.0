Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0398513B5AE
	for <virtio-comment@lists.linux.dev>; Tue, 10 Sep 2024 06:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725949384; cv=none; b=lBtyjTuTs5dFMVvGaVZZK9Eh+KcPngZVqA4u4V6fbCq25CrAeeRrIxjrMv50zTKa+FYK5pMk7NZnX9e7BIjVXsEhleKt5rDxZCONCF1X2QRwogPseO3kn5a8tiaskwGSyP0aGI9fN5KEftK89RcDt8P/UY2+H7hNZrMxyySB5FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725949384; c=relaxed/simple;
	bh=aEoICMdQFkEyPKt+VITyJXcfG+dXAIyXOazoOkKwy08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ADNq+RHK6KvrUNZoQLvjtM/Y3JdaEHOZ8NvorDo+QrJBmourUvDgSZYD7+bcTPNcuRZzsUImxkFkXi6jNn7JR+cjXJwrvz2LXXPHN31GEtPpndukqXMGYlSNyO+S/gdhExezsBvMM/2j2VPt4XNN4U7tBoqhbSh6Nm+oBzuuhzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VZnPsn6r; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VZnPsn6r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725949380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TUyPCHyinSC9AfnJYDPhvyLoM3vCAU/frV+cu4WfqNc=;
	b=VZnPsn6rfeCuyQ5sPcyIMEqtS53hsyCMw2eGo8krsDhoOD3XVxqjnX4ZPz1SBsoyHQldQQ
	MVC/Xpbk8BMkhcweysz7AwOnm+YcYYNCK568kEQjtz5bR5aNcvsqrC2yZZLqJtKn0N+/pQ
	b5PZPEQ6b1XvXRHi8QboF/Y1cSfZHpo=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-S8_FOYAUNsukeVeGwEOjMQ-1; Tue, 10 Sep 2024 02:22:59 -0400
X-MC-Unique: S8_FOYAUNsukeVeGwEOjMQ-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2d878377fc2so6914056a91.0
        for <virtio-comment@lists.linux.dev>; Mon, 09 Sep 2024 23:22:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725949378; x=1726554178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TUyPCHyinSC9AfnJYDPhvyLoM3vCAU/frV+cu4WfqNc=;
        b=rnoyTEVGU+A2abuAfz6sXU/d/NQB4Qc0UyzX4ncVaYZrjhnMsM26WfbP6qzrb8CBWw
         gGQRCs9ATHf7sGJVPtohpl6yfma5KYPM6hLPma01aZyMojh153fZLEf3Ffegy/isJLqK
         kXp/J1SMLOVGqUrP6ccO83FSE+hzbwqt5bWXB8EMD7yql6J48kRluAdEqpiOssRscSEH
         6etDSIFoZBnt5RtcO5AzdKa7TUSQnnBg2xgMS7EunUFEgMksIdv6ORVMUUjpRx0y2fMm
         X5ZCxTW8NMruZDh16tOrYeQnQWXdbX55ZjAdFfZ5MsZGlYH5PDEHAQqAXJeF+KboP624
         IUiw==
X-Forwarded-Encrypted: i=1; AJvYcCWzuEqgxC1zf5zJR/4nTNx262jGwlbZFs3RtlHeYWojT7LpnAfk1vcTIyaRretr3OhRMu7vh6Oe8sPqp8TwRg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5cHKHy+qdoOMgjvcDY3OCaPWfaBjnn4ejIa9gnbSNQITMu1Yd
	q8NIW+n2IdllvDDvN1Lv7TDeSzOMrEtVSrzEU/pNzDuNxDcpPNGytqaMpHwRc6/9uRq17Fa+3+R
	qTvj7d3UUSpBLjHkoxbrWKGzfcbWpl8/zjNB/+HxXkd2BE4S9S3oxNsLRtihaKZhPnqa/9HXqcq
	XL8EzT47FkDbRtTM/qVcQatmJ8hzuOEv3dFOnThy4=
X-Received: by 2002:a17:90a:7806:b0:2d8:89c3:1b57 with SMTP id 98e67ed59e1d1-2db67211d8amr3100642a91.15.1725949377852;
        Mon, 09 Sep 2024 23:22:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtY8ltFt0eWA09hTrzeLX1Sq/Vuf+EQC+gRAOlqzrMz/xE0z4YbMaZvdYWgRgFuKEpsPJbh7FVeRHMaSzdHqo=
X-Received: by 2002:a17:90a:7806:b0:2d8:89c3:1b57 with SMTP id
 98e67ed59e1d1-2db67211d8amr3100607a91.15.1725949377276; Mon, 09 Sep 2024
 23:22:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240905134621.711743-1-eric.auger@redhat.com>
 <CACGkMEs8moUvhZda78cCstjO+aYb+SsrFF_nks6BJptVcYD_xg@mail.gmail.com> <598aa735-70fe-4175-b94f-26330ea47654@redhat.com>
In-Reply-To: <598aa735-70fe-4175-b94f-26330ea47654@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 10 Sep 2024 14:22:45 +0800
Message-ID: <CACGkMEtDzpcMM97OFnsGVKZ3NiYmgL8BkVTdKELc5qwnwUQfsw@mail.gmail.com>
Subject: Re: [PATCH] virtio-iommu: Introduce lazy mode domains and IOTLB_FLUSH request
To: eric.auger@redhat.com
Cc: eric.auger.pro@gmail.com, virtio-comment@lists.linux.dev, mst@redhat.com, 
	jean-philippe@linaro.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 9, 2024 at 3:21=E2=80=AFPM Eric Auger <eric.auger@redhat.com> w=
rote:
>
> Hi Jason,
> On 9/6/24 01:50, Jason Wang wrote:
> > On Thu, Sep 5, 2024 at 9:46=E2=80=AFPM Eric Auger <eric.auger@redhat.co=
m> wrote:
> >> At the moment the virtio-iommu offers MAP and UNMAP requests.
> >> This means that if the virtio-iommu protects a device with an iotlb
> >> we have no other choice but invalidating the device iotlb on UNMAP.
> >> This proposal aims at allowing the decoupling of UNMAP commands
> >> and domain IOTLB invalidations.
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
> >
> >
> >> This enables lazy mode where iotlb
> >> invalidations are deferred and batched. In that prospect we add a
> >> new VIRTIO_IOMMU_F_LAZY_IOTLB_FLUSH feature which, when offered
> >> allows an endpoint to be attached to a domain in lazy mode. Alongside
> >> we introduce a new IOTLB_FLUSH request which allows to invalidate
> >> iotlb entries for the whole domain.
> > I am not sure "lazy" is the best, for example a driver may just want
> > to invalidate all the mappings for some reason. Is this better to
> > rename this as "_F_IOTLB_FLUSH" instead?
> Yes I can get rid of lazy terminology either by just using flush or
> invalidate as suggested by Jean.
> >
> >> When the domain is created in
> >> lazy mode, the virtio-iommu device knows it will receive IOTLB_FLUSH
> >> and it can avoid flushing the device IOTLB on individual UNMAPs.
> > I wonder what's the advantage to make it per domain instead of per devi=
ce.
> >
> >> On a virtio-iommu/vhost scp use case, this can improve the
> >> performance by ~10%.
> >>
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/204
> >>
> >> ---
> >>
> >> As a side not virtio-iommu/vhost/scp use case was completely broken
> > For "not" I think you mean "now"?
> yes I meant side note
> >
> >> on aarch64 with guests older than v6.6-rc1. The scp stalled and we got
> >> soft-lockups on guest in viommu_iotlb_sync. It happened
> >> 295525e29a5b (=E2=80=9Cvirtio_net: merge dma operations when filling m=
ergeable buffers=E2=80=9D)
> > Interesting, it doesn't seem to be a fix.
> Yes it is rather an optimization. But it looks like with
> virtio-iommu/vhsot/scp use case it brings such a huge perf boost

Right, this is what we want to achieve in that patch.

> that it
> fixes the guest lockups and scp stalls.

Ok, it seems that there's some bug somewhere. Btw, the pre mapping
code seems to introduce a regression which might be disabled for this
Linux release:

https://lore.kernel.org/all/20240908153712-mutt-send-email-mst@kernel.org/

(Note that we haven't decided if this is the right way to go).

Haven't had time to check if it can re-introduce the issues or not.

> >
> >> fixed the performance issue. Without that patch and with lazy mode, we
> >> do not observe any stalls although the perf is way worse than with the
> >> above patch. Without lazy mode, it looks like the number of vhost iotl=
b
> >> invalidation is large enough to cause serious performance issues.
> >>
> >> This proposal can be tested with the following branches
> >> guest branch: https://github.com/eauger/linux/tree/virtio-iommu-lazy-r=
fc
> >> qemu branch: https://github.com/eauger/qemu/tree/virtio-iommu-device-l=
azy-rfc
> >>
> >> This was tested with vhost. In qemu command line, you need to set ats=
=3Don
> >> to get benefit of lazy mode.
> > Ok, I think what you really meant is the "device iotlb" as it ties to A=
TS.
> The actual device implementation brought some confusion on the wording.
> I hope I better explained in my previous reply.
>
> Thanks
>
> Eric
> >
> >> ---
> >>  device-types/iommu/description.tex | 74 +++++++++++++++++++++++++++++=
-
> >>  1 file changed, 73 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/device-types/iommu/description.tex b/device-types/iommu/d=
escription.tex
> >> index f8cbe88..990734e 100644
> >> --- a/device-types/iommu/description.tex
> >> +++ b/device-types/iommu/description.tex
> >> @@ -74,6 +74,14 @@ \subsection{Feature bits}\label{sec:Device Types / =
IOMMU Device / Feature bits}
> >>    whether endpoints that are attached to a domain are in bypass
> >>    mode.
> >>
> >> +\item[VIRTIO_IOMMU_F_LAZY_IOTLB_FLUSH (7)]
> >> +  This feature determines the capability to use deferred and batched
> >> +  IOTLB flushes. If the feature is available, the driver can inform
> >> +  a given domain works in lazy mode. For such domain, the device is
> >> +  allowed to dissociate UNMAP requests from IOTLB flush operations an=
d
> >> +  accepts separate IOTLB flush requests that invalidate the IOTLB ent=
ries
> >> +  for the whole domain.
> > Does this imply a flush for device IOTLB invalidation? It need more
> > clarification.
> >
> > Or we probably need to do the same as other IOMMU to separate device
> > IOTLB invalidation from the IOMMU IOTLB.
> >
> >> +
> >>  \end{description}
> >>
> >>  \drivernormative{\subsubsection}{Feature bits}{Device Types / IOMMU D=
evice / Feature bits}
> >> @@ -312,6 +320,7 @@ \subsubsection{ATTACH request}\label{sec:Device Ty=
pes / IOMMU Device / Device op
> >>  };
> >>
> >>  #define VIRTIO_IOMMU_ATTACH_F_BYPASS  (1 << 0)
> >> +#define VIRTIO_IOMMU_ATTACH_F_LAZY    (1 << 1)
> >>  \end{lstlisting}
> >>
> >>  Attach an endpoint to a domain. \field{domain} uniquely identifies a
> >> @@ -341,6 +350,18 @@ \subsubsection{ATTACH request}\label{sec:Device T=
ypes / IOMMU Device / Device op
> >>  can set the VIRTIO_IOMMU_ATTACH_F_BYPASS flag to create a bypass
> >>  domain. Endpoints attached to this domain are in bypass mode.
> >>
> >> +When the VIRTIO_IOMMU_F_LAZY_IOTLB_FLUSH feature is available, the dr=
iver
> >> +can set the VIRTIO_IOMMU_ATTACH_F_LAZY flag to create a lazy mode dom=
ain.
> >> +Only such domains do support the IOTLB_FLUSH request.
> >> +
> >> +If the device does not offer the VIRTIO_IOMMU_F_LAZY_IOTLB_FLUSH feat=
ure and
> >> +if the driver sets \field{flags} field to VIRTIO_IOMMU_ATTACH_F_LAZY,=
 the
> >> +device MAY set the request \field{status} to VIRTIO_IOMMU_S_INVAL.
> >> +
> >> +If several endpoints are attached to the same domain, they must be at=
tached
> >> +with the same value for that flag. Otherwise the device MAY set the r=
equest
> >> +\field{status} to VIRTIO_IOMMU_S_INVAL.
> >> +
> >>  \drivernormative{\paragraph}{ATTACH request}{Device Types / IOMMU Dev=
ice / Device operations / ATTACH request}
> >>
> >>  The driver SHOULD set \field{reserved} to zero.
> >> @@ -351,7 +372,8 @@ \subsubsection{ATTACH request}\label{sec:Device Ty=
pes / IOMMU Device / Device op
> >>  If the domain already exists and is a bypass domain, the driver
> >>  SHOULD set the VIRTIO_IOMMU_ATTACH_F_BYPASS flag. If the domain
> >>  exists and is not a bypass domain, the driver SHOULD NOT set the
> >> -VIRTIO_IOMMU_ATTACH_F_BYPASS flag.
> >> +VIRTIO_IOMMU_ATTACH_F_BYPASS flag. The same holds for the
> >> +VIRTIO_IOMMU_ATTACH_F_LAZY flag.
> >>
> >>  \devicenormative{\paragraph}{ATTACH request}{Device Types / IOMMU Dev=
ice / Device operations / ATTACH request}
> >>
> >> @@ -374,6 +396,10 @@ \subsubsection{ATTACH request}\label{sec:Device T=
ypes / IOMMU Device / Device op
> >>  flag is not consistent with that domain, the device SHOULD reject
> >>  the request and set \field{status} to VIRTIO_IOMMU_S_INVAL.
> >>
> >> +If the domain already exists and the VIRTIO_IOMMU_ATTACH_F_LAZY
> >> +flag is not consistent with that domain, the device SHOULD reject
> >> +the request and set \field{status} to VIRTIO_IOMMU_S_INVAL.
> >> +
> >>  If the endpoint identified by \field{endpoint} is already attached to
> >>  another domain, then the device SHOULD first detach it from that doma=
in
> >>  and attach it to the one identified by \field{domain}. In that case t=
he
> >> @@ -590,6 +616,11 @@ \subsubsection{UNMAP request}\label{sec:Device Ty=
pes / IOMMU Device / Device ope
> >>  This request is only available when VIRTIO_IOMMU_F_MAP_UNMAP has been
> >>  negotiated.
> >>
> >> +In case the domain is created with the VIRTIO_IOMMU_ATTACH_F_LAZY fla=
g,
> >> +the device is allowed to separate UNMAP from IOTLB invalidations. The=
 driver
> >> +must explicitly invalidate the whole domain IOTLB entries using the s=
eparate
> >> +IOTLB_FLUSH request.
> >> +
> >>  \drivernormative{\paragraph}{UNMAP request}{Device Types / IOMMU Devi=
ce / Device operations / UNMAP request}
> >>
> >>  The driver SHOULD set the \field{reserved} field to zero.
> >> @@ -625,6 +656,47 @@ \subsubsection{UNMAP request}\label{sec:Device Ty=
pes / IOMMU Device / Device ope
> >>  mapping, then the device SHOULD remove all mappings affected by the r=
ange
> >>  and set the request \field{status} to VIRTIO_IOMMU_S_OK.
> >>
> >> +\subsubsection{IOTLB_FLUSH request}\label{sec:Device Types / IOMMU De=
vice / Device operations / IOTLB_FLUSH request}
> >> +
> >> +\begin{lstlisting}
> >> +struct virtio_iommu_req_iotlb_flush {
> >> +  struct virtio_iommu_req_head head;
> >> +  le32  domain;
> >> +  u8    reserved[4];
> >> +  struct virtio_iommu_req_tail tail;
> >> +};
> >> +\end{lstlisting}
> >> +
> >> +Flush IOTLB entries for a given domain. This domain must have been cr=
eated
> >> +with lazy mode set (VIRTIO_IOMMU_ATTACH_F_LAZY flag set on attachment=
).
> >> +
> >> +\drivernormative{\paragraph}{IOTLB_FLUSH request}{Device Types / IOMM=
U Device / Device operations / IOTLB_FLUSH request}
> >> +
> >> +The driver SHOULD set the \field{reserved} field to zero.
> >> +
> >> +The driver SHOULD NOT send IOTLB_FLUSH requests on a bypass domain.
> >> +
> >> +The driver SHOULD NOT send IOTLB_FLUSH requests on a non lazy domain.
> >> +
> >> +\devicenormative{\paragraph}{IOTLB_FLUSH request}{Device Types / IOMM=
U Device / Device operations / UNMAP request}
> >> +
> >> +If the \field{reserved} field of an IOTLB_FLUSH request is not zero, =
the device
> >> +MAY set the request \field{status} to VIRTIO_IOMMU_S_INVAL, in which =
case
> >> +the device MAY perform the IOTLB_FLUSH operation.
> >> +
> >> +If the device does not offer the VIRTIO_IOMMU_F_LAZY_IOTLB_FLUSH feat=
ure and
> >> +if the driver calls the IOTLB_FLUSH request, the device MAY set the r=
equest
> >> +\field{status} to VIRTIO_IOMMU_S_INVAL.
> >> +
> >> +If \field{domain} does not exist, the device SHOULD set the request
> >> +\field{status} to VIRTIO_IOMMU_S_NOENT.
> >> +
> >> +If the domain is a bypass domain, the device SHOULD reject the
> >> +request and set \field{status} to VIRTIO_IOMMU_S_INVAL.
> >> +
> >> +If the domain is not a lazy domain, the device SHOULD reject the
> >> +request and set \field{status} to VIRTIO_IOMMU_S_INVAL.
> >> +
> >>  \subsubsection{PROBE request}\label{sec:Device Types / IOMMU Device /=
 Device operations / PROBE request}
> >>
> >>  If the VIRTIO_IOMMU_F_PROBE feature bit is present, the driver sends =
a
> >> --
> >> 2.41.0
> >>
> > Thanks
> >
>

Thanks

