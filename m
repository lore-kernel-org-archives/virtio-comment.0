Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFFC54F87
	for <virtio-comment@lists.linux.dev>; Thu,  5 Sep 2024 23:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725580262; cv=none; b=LE6Nt99KYnoTAUG1yNJCIfBh4FxI7WcutCDoG2oOyEMaYzZcCyq/xc/4LBDdpoG10tI2mTSI8r2TULokj8UVfHxaltjNlcfDg1obBgH5KEJBU/TvW3euX9Lq6sF+RQmbV/WaqetFVjisi+rnUz52GxcH97TxaodjY8rji0wZsag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725580262; c=relaxed/simple;
	bh=WShYtoHLRVK+7IRBrE4C7oPcDH2KW2WFPNrFQ6SLWhk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ELjEP9rPq/s26dmphpF3Yv7qD4T95oSoOQCHgvafJT7/Npkkwh8iIZO9QX6Kz62jlPfbTpcNBENMc7I9rDU2ROyTcntwBjfjgUAmL6/eXyD1UvfuDEclYGVve0MMkBXQL4OWeEhR/jFGgSR5FibajAvPkzrkJ/pUMaRpLdtydM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NRxk4L2D; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NRxk4L2D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725580258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oy1m+kQ2cXXhyOCXV6GHpRh/PlwDIg6JVTtq0LsvnmE=;
	b=NRxk4L2Dp678QM/h7vzQRVNVUxMvwf4XD3KMi0MqYgT2gRsARNv8Ff7wX7QailNEtOsUo9
	ULygB6AZT49/lXsn2YE7iU5+sWRssPzXwTWuJEFiHUW6nEjvbe9aKwwplmb1IKOqmSkFrD
	/KSh/UybcB2dfnFcuq25lUmd0ERFvKM=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-2-ARVlbPOESybFM50cML1Q-1; Thu, 05 Sep 2024 19:50:57 -0400
X-MC-Unique: 2-ARVlbPOESybFM50cML1Q-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2d86e9da90cso1984490a91.2
        for <virtio-comment@lists.linux.dev>; Thu, 05 Sep 2024 16:50:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725580257; x=1726185057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oy1m+kQ2cXXhyOCXV6GHpRh/PlwDIg6JVTtq0LsvnmE=;
        b=SQtBvDdqd1XpQ9yZjXdf/cIOoNagEbC874zhyQ41dCwyFXr2CjkszLrwVmyNBt68Ab
         XLlrS+o4ttOTXnrEF3/0r+DIVUYZ2UdmM062uG1oS3VzB+Dh0wCJmkm/uOijiCWS9uIi
         i5DoyZt7kcJ0AbpIjs7tNhbnUrOCN5mahlIyczwzL9FyW5Dfbd+mpSnl14luxKl7s3LB
         vnJ+V7t0b+bRJGVKh9t0QYE9LiT/TO+VBYMb6/X0mfe+ruU/1F+uvESrVXkBWAGMpcGm
         WdRK6h01oga0siVfHoYB6BkiJJxgizwoEVFvfcRPjHAz5gMDQURBmIbKTKwgK3h5Gw5D
         o/RA==
X-Forwarded-Encrypted: i=1; AJvYcCWytX1smBd7rDfgAfli9HJH4uRUshKrmY/WK/zCREhDSNmcQAD9MrsL6dfKAEOfI6e8xWD/hGPvrnMzHXmjtw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxUDJRoln2oyTbXtwIdlxIW/lD2oalR4OhnLwGi3sp4kIKq6XRC
	VC5dq/BLDu0veN9FrclGiF7EQbXvEUgVdGuz570xj1ms7hjfIFPpFGVgxhcYJH7VSw9EY3M/eIm
	8DyCE9lL7Ys8GgPq+T0sZBI/EGs+nawuET0JsFeo3IzN9S4AvKOFYvbTjbyp3tPPawI+KdR7a2o
	nNZl0caIbrWA1+SRXQlJA+YprDy6zcFOtWh5lWF2w=
X-Received: by 2002:a17:90b:118a:b0:2ca:2c4b:476 with SMTP id 98e67ed59e1d1-2dad4f06028mr1294458a91.10.1725580256543;
        Thu, 05 Sep 2024 16:50:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGX7nEsBy0QS0bfxr10U1ffzhRwus5WLz37PsSuhx9uoyZfp51XttPfnjtU2w1w9NIdT8mZIbri/MnSnoe4LVs=
X-Received: by 2002:a17:90b:118a:b0:2ca:2c4b:476 with SMTP id
 98e67ed59e1d1-2dad4f06028mr1294429a91.10.1725580255950; Thu, 05 Sep 2024
 16:50:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240905134621.711743-1-eric.auger@redhat.com>
In-Reply-To: <20240905134621.711743-1-eric.auger@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 6 Sep 2024 07:50:44 +0800
Message-ID: <CACGkMEs8moUvhZda78cCstjO+aYb+SsrFF_nks6BJptVcYD_xg@mail.gmail.com>
Subject: Re: [PATCH] virtio-iommu: Introduce lazy mode domains and IOTLB_FLUSH request
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, virtio-comment@lists.linux.dev, mst@redhat.com, 
	jean-philippe@linaro.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024 at 9:46=E2=80=AFPM Eric Auger <eric.auger@redhat.com> w=
rote:
>
> At the moment the virtio-iommu offers MAP and UNMAP requests.
> This means that if the virtio-iommu protects a device with an iotlb
> we have no other choice but invalidating the device iotlb on UNMAP.
> This proposal aims at allowing the decoupling of UNMAP commands
> and domain IOTLB invalidations.

I think there should be some difference between "device iotlb" and
"domain IOTLB".  My understanding is that usually "device iotlb" means
the mapping cached by the individual device while "domain IOTLB" means
the mapping cached by the IOMMU.

E.g in the case of intel IOMMU, it has two kind of invalidation

device iotlb invalidation: used to invalidate device IOTLB via ATS
domain selective invalidation: used to invalidate all IOTLB for a
specific domain


> This enables lazy mode where iotlb
> invalidations are deferred and batched. In that prospect we add a
> new VIRTIO_IOMMU_F_LAZY_IOTLB_FLUSH feature which, when offered
> allows an endpoint to be attached to a domain in lazy mode. Alongside
> we introduce a new IOTLB_FLUSH request which allows to invalidate
> iotlb entries for the whole domain.

I am not sure "lazy" is the best, for example a driver may just want
to invalidate all the mappings for some reason. Is this better to
rename this as "_F_IOTLB_FLUSH" instead?

> When the domain is created in
> lazy mode, the virtio-iommu device knows it will receive IOTLB_FLUSH
> and it can avoid flushing the device IOTLB on individual UNMAPs.

I wonder what's the advantage to make it per domain instead of per device.

>
> On a virtio-iommu/vhost scp use case, this can improve the
> performance by ~10%.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/204
>
> ---
>
> As a side not virtio-iommu/vhost/scp use case was completely broken

For "not" I think you mean "now"?

> on aarch64 with guests older than v6.6-rc1. The scp stalled and we got
> soft-lockups on guest in viommu_iotlb_sync. It happened
> 295525e29a5b (=E2=80=9Cvirtio_net: merge dma operations when filling merg=
eable buffers=E2=80=9D)

Interesting, it doesn't seem to be a fix.

> fixed the performance issue. Without that patch and with lazy mode, we
> do not observe any stalls although the perf is way worse than with the
> above patch. Without lazy mode, it looks like the number of vhost iotlb
> invalidation is large enough to cause serious performance issues.
>
> This proposal can be tested with the following branches
> guest branch: https://github.com/eauger/linux/tree/virtio-iommu-lazy-rfc
> qemu branch: https://github.com/eauger/qemu/tree/virtio-iommu-device-lazy=
-rfc
>
> This was tested with vhost. In qemu command line, you need to set ats=3Do=
n
> to get benefit of lazy mode.

Ok, I think what you really meant is the "device iotlb" as it ties to ATS.

> ---
>  device-types/iommu/description.tex | 74 +++++++++++++++++++++++++++++-
>  1 file changed, 73 insertions(+), 1 deletion(-)
>
> diff --git a/device-types/iommu/description.tex b/device-types/iommu/desc=
ription.tex
> index f8cbe88..990734e 100644
> --- a/device-types/iommu/description.tex
> +++ b/device-types/iommu/description.tex
> @@ -74,6 +74,14 @@ \subsection{Feature bits}\label{sec:Device Types / IOM=
MU Device / Feature bits}
>    whether endpoints that are attached to a domain are in bypass
>    mode.
>
> +\item[VIRTIO_IOMMU_F_LAZY_IOTLB_FLUSH (7)]
> +  This feature determines the capability to use deferred and batched
> +  IOTLB flushes. If the feature is available, the driver can inform
> +  a given domain works in lazy mode. For such domain, the device is
> +  allowed to dissociate UNMAP requests from IOTLB flush operations and
> +  accepts separate IOTLB flush requests that invalidate the IOTLB entrie=
s
> +  for the whole domain.

Does this imply a flush for device IOTLB invalidation? It need more
clarification.

Or we probably need to do the same as other IOMMU to separate device
IOTLB invalidation from the IOMMU IOTLB.

> +
>  \end{description}
>
>  \drivernormative{\subsubsection}{Feature bits}{Device Types / IOMMU Devi=
ce / Feature bits}
> @@ -312,6 +320,7 @@ \subsubsection{ATTACH request}\label{sec:Device Types=
 / IOMMU Device / Device op
>  };
>
>  #define VIRTIO_IOMMU_ATTACH_F_BYPASS  (1 << 0)
> +#define VIRTIO_IOMMU_ATTACH_F_LAZY    (1 << 1)
>  \end{lstlisting}
>
>  Attach an endpoint to a domain. \field{domain} uniquely identifies a
> @@ -341,6 +350,18 @@ \subsubsection{ATTACH request}\label{sec:Device Type=
s / IOMMU Device / Device op
>  can set the VIRTIO_IOMMU_ATTACH_F_BYPASS flag to create a bypass
>  domain. Endpoints attached to this domain are in bypass mode.
>
> +When the VIRTIO_IOMMU_F_LAZY_IOTLB_FLUSH feature is available, the drive=
r
> +can set the VIRTIO_IOMMU_ATTACH_F_LAZY flag to create a lazy mode domain=
.
> +Only such domains do support the IOTLB_FLUSH request.
> +
> +If the device does not offer the VIRTIO_IOMMU_F_LAZY_IOTLB_FLUSH feature=
 and
> +if the driver sets \field{flags} field to VIRTIO_IOMMU_ATTACH_F_LAZY, th=
e
> +device MAY set the request \field{status} to VIRTIO_IOMMU_S_INVAL.
> +
> +If several endpoints are attached to the same domain, they must be attac=
hed
> +with the same value for that flag. Otherwise the device MAY set the requ=
est
> +\field{status} to VIRTIO_IOMMU_S_INVAL.
> +
>  \drivernormative{\paragraph}{ATTACH request}{Device Types / IOMMU Device=
 / Device operations / ATTACH request}
>
>  The driver SHOULD set \field{reserved} to zero.
> @@ -351,7 +372,8 @@ \subsubsection{ATTACH request}\label{sec:Device Types=
 / IOMMU Device / Device op
>  If the domain already exists and is a bypass domain, the driver
>  SHOULD set the VIRTIO_IOMMU_ATTACH_F_BYPASS flag. If the domain
>  exists and is not a bypass domain, the driver SHOULD NOT set the
> -VIRTIO_IOMMU_ATTACH_F_BYPASS flag.
> +VIRTIO_IOMMU_ATTACH_F_BYPASS flag. The same holds for the
> +VIRTIO_IOMMU_ATTACH_F_LAZY flag.
>
>  \devicenormative{\paragraph}{ATTACH request}{Device Types / IOMMU Device=
 / Device operations / ATTACH request}
>
> @@ -374,6 +396,10 @@ \subsubsection{ATTACH request}\label{sec:Device Type=
s / IOMMU Device / Device op
>  flag is not consistent with that domain, the device SHOULD reject
>  the request and set \field{status} to VIRTIO_IOMMU_S_INVAL.
>
> +If the domain already exists and the VIRTIO_IOMMU_ATTACH_F_LAZY
> +flag is not consistent with that domain, the device SHOULD reject
> +the request and set \field{status} to VIRTIO_IOMMU_S_INVAL.
> +
>  If the endpoint identified by \field{endpoint} is already attached to
>  another domain, then the device SHOULD first detach it from that domain
>  and attach it to the one identified by \field{domain}. In that case the
> @@ -590,6 +616,11 @@ \subsubsection{UNMAP request}\label{sec:Device Types=
 / IOMMU Device / Device ope
>  This request is only available when VIRTIO_IOMMU_F_MAP_UNMAP has been
>  negotiated.
>
> +In case the domain is created with the VIRTIO_IOMMU_ATTACH_F_LAZY flag,
> +the device is allowed to separate UNMAP from IOTLB invalidations. The dr=
iver
> +must explicitly invalidate the whole domain IOTLB entries using the sepa=
rate
> +IOTLB_FLUSH request.
> +
>  \drivernormative{\paragraph}{UNMAP request}{Device Types / IOMMU Device =
/ Device operations / UNMAP request}
>
>  The driver SHOULD set the \field{reserved} field to zero.
> @@ -625,6 +656,47 @@ \subsubsection{UNMAP request}\label{sec:Device Types=
 / IOMMU Device / Device ope
>  mapping, then the device SHOULD remove all mappings affected by the rang=
e
>  and set the request \field{status} to VIRTIO_IOMMU_S_OK.
>
> +\subsubsection{IOTLB_FLUSH request}\label{sec:Device Types / IOMMU Devic=
e / Device operations / IOTLB_FLUSH request}
> +
> +\begin{lstlisting}
> +struct virtio_iommu_req_iotlb_flush {
> +  struct virtio_iommu_req_head head;
> +  le32  domain;
> +  u8    reserved[4];
> +  struct virtio_iommu_req_tail tail;
> +};
> +\end{lstlisting}
> +
> +Flush IOTLB entries for a given domain. This domain must have been creat=
ed
> +with lazy mode set (VIRTIO_IOMMU_ATTACH_F_LAZY flag set on attachment).
> +
> +\drivernormative{\paragraph}{IOTLB_FLUSH request}{Device Types / IOMMU D=
evice / Device operations / IOTLB_FLUSH request}
> +
> +The driver SHOULD set the \field{reserved} field to zero.
> +
> +The driver SHOULD NOT send IOTLB_FLUSH requests on a bypass domain.
> +
> +The driver SHOULD NOT send IOTLB_FLUSH requests on a non lazy domain.
> +
> +\devicenormative{\paragraph}{IOTLB_FLUSH request}{Device Types / IOMMU D=
evice / Device operations / UNMAP request}
> +
> +If the \field{reserved} field of an IOTLB_FLUSH request is not zero, the=
 device
> +MAY set the request \field{status} to VIRTIO_IOMMU_S_INVAL, in which cas=
e
> +the device MAY perform the IOTLB_FLUSH operation.
> +
> +If the device does not offer the VIRTIO_IOMMU_F_LAZY_IOTLB_FLUSH feature=
 and
> +if the driver calls the IOTLB_FLUSH request, the device MAY set the requ=
est
> +\field{status} to VIRTIO_IOMMU_S_INVAL.
> +
> +If \field{domain} does not exist, the device SHOULD set the request
> +\field{status} to VIRTIO_IOMMU_S_NOENT.
> +
> +If the domain is a bypass domain, the device SHOULD reject the
> +request and set \field{status} to VIRTIO_IOMMU_S_INVAL.
> +
> +If the domain is not a lazy domain, the device SHOULD reject the
> +request and set \field{status} to VIRTIO_IOMMU_S_INVAL.
> +
>  \subsubsection{PROBE request}\label{sec:Device Types / IOMMU Device / De=
vice operations / PROBE request}
>
>  If the VIRTIO_IOMMU_F_PROBE feature bit is present, the driver sends a
> --
> 2.41.0
>

Thanks

