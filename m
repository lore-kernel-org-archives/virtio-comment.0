Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8386D1AE859
	for <virtio-comment@lists.linux.dev>; Mon,  9 Sep 2024 07:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725866468; cv=none; b=Tgep1iT3MTF6tnNix8YTOpd2L+mpz1EJihB4w5fvonyxbYYStzWqpFHSxjjiFxSUc7qOS9yUYNOjcsUBpen1Gk0uY8+3WwIcHWjMhaA/u8qj9rS/aox3ViB24kmzy0eKiB7LpQvfSjIqrLmtQPCs1JIj0SN9JYWHnUmKdIwU8hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725866468; c=relaxed/simple;
	bh=wfbVCT3gYFkovqS2wnXDlDaeOB+B88dDcc+wtSFMmKI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lGh7RHVXC76xQYqpvYrWbb19aotfV/2u1cZqVTl6DNQZyGZv/lOVtBkYKqWvZJiVH8ziD9ab8sesMkjrStujkWLJGnnyB9Hvx+oBB/phBUnDfMWOwZK3ioDOaW20doybkIRIQ2IzQQZJ2AKPnimO6QirGKbQjluF9OY16m+0+E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ACk1BAWL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ACk1BAWL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725866465;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QiC17RZNA2XRlCAp863u7klDbMcovcdonWuw1oo44+8=;
	b=ACk1BAWLjWQ0v3o/fwS4dCYKgtzJWUjrG/NsdmJnkBITvVYZUGFZ6o/8OOG40LhIgy+Mo9
	A0UfBjh4/jPNuLL+KJT/ocUxun2GS4KE5zUo/YH/5m0HyWthycU7hR4YzAnTm5Xnc1w9kX
	tMkKq0rRklFgBRnKK7N3eu6ZJKHQw2s=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-501-EdnyA5tFPTW2Ev4Zui9eKg-1; Mon, 09 Sep 2024 03:21:04 -0400
X-MC-Unique: EdnyA5tFPTW2Ev4Zui9eKg-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-6cf78470a56so129980987b3.3
        for <virtio-comment@lists.linux.dev>; Mon, 09 Sep 2024 00:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725866462; x=1726471262;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QiC17RZNA2XRlCAp863u7klDbMcovcdonWuw1oo44+8=;
        b=bsC084kesGiCXvAxp4r/ZMzmYtSQ3SlG29tBv18ritMZPKsH/7Yd2DKEUdOb73xvEX
         hxkjBP1QJjci+4z7fD1o9RtKbKhiFet8uMqqqWyrF+g6LMcxdOjNslwCdGysZCAP+TM7
         lam1TQ6a6LhJi234qIw2L/s86ymFEKT6jp6NupM9JPc2iPUieHPBNoE3RiYE6D/nPDlo
         kI8tXT9L24z0MJbc68Q+Jwy6ZH6bwHMIwCT1UOVo/pbigz2E/G9O8BnjxrPSdTPlb2LQ
         M7xPu9WFArAXQJ6FXdhJt0kC+RfknhWdVNasu44cgJz2YAmbpgovZ26Mj6vn5E2hm+OM
         e2fA==
X-Forwarded-Encrypted: i=1; AJvYcCUaGmSb/LWnKqkce3pxEUBTAYLnfCL35604yCLLnThPQ18l7bz9obZCjWi5A/EVTy6ANa7LDN1D9GN9OicFQg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxu9MV+dSVfqHhp0mM5kSfzci7mr/zjxsjCDGiHTwLS4cb0IaWU
	EVnC7aRNokQW3hh3k5QoucpvTHpTPIr+MTQMt9JYuBaUthiFfYbF6W23pCT/p+tg7NwkAYyv4s3
	vtDFBVZHBwC/37/96Lsu2bF70dcpPqH25VB3h50p4qZnj/epJ2Z/acVHyLrOEOWKRhXTW4Frh
X-Received: by 2002:a05:6902:2601:b0:e11:66ee:332c with SMTP id 3f1490d57ef6-e1d34897d00mr8017664276.27.1725866462098;
        Mon, 09 Sep 2024 00:21:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIQIG7WRCtZJbCwb5YX42dOiqr58AI+lZBpRp/hsjE0KsEcsoaf3Cv8p9xFtC+He9v4cTi8w==
X-Received: by 2002:a05:6902:2601:b0:e11:66ee:332c with SMTP id 3f1490d57ef6-e1d34897d00mr8017648276.27.1725866461619;
        Mon, 09 Sep 2024 00:21:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45822e63873sm17942661cf.7.2024.09.09.00.20.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 00:21:01 -0700 (PDT)
Message-ID: <598aa735-70fe-4175-b94f-26330ea47654@redhat.com>
Date: Mon, 9 Sep 2024 09:20:57 +0200
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH] virtio-iommu: Introduce lazy mode domains and IOTLB_FLUSH
 request
To: Jason Wang <jasowang@redhat.com>
Cc: eric.auger.pro@gmail.com, virtio-comment@lists.linux.dev, mst@redhat.com,
 jean-philippe@linaro.org
References: <20240905134621.711743-1-eric.auger@redhat.com>
 <CACGkMEs8moUvhZda78cCstjO+aYb+SsrFF_nks6BJptVcYD_xg@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CACGkMEs8moUvhZda78cCstjO+aYb+SsrFF_nks6BJptVcYD_xg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jason,
On 9/6/24 01:50, Jason Wang wrote:
> On Thu, Sep 5, 2024 at 9:46 PM Eric Auger <eric.auger@redhat.com> wrote:
>> At the moment the virtio-iommu offers MAP and UNMAP requests.
>> This means that if the virtio-iommu protects a device with an iotlb
>> we have no other choice but invalidating the device iotlb on UNMAP.
>> This proposal aims at allowing the decoupling of UNMAP commands
>> and domain IOTLB invalidations.
> I think there should be some difference between "device iotlb" and
> "domain IOTLB".  My understanding is that usually "device iotlb" means
> the mapping cached by the individual device while "domain IOTLB" means
> the mapping cached by the IOMMU.
>
> E.g in the case of intel IOMMU, it has two kind of invalidation
>
> device iotlb invalidation: used to invalidate device IOTLB via ATS
> domain selective invalidation: used to invalidate all IOTLB for a
> specific domain
>
>
>> This enables lazy mode where iotlb
>> invalidations are deferred and batched. In that prospect we add a
>> new VIRTIO_IOMMU_F_LAZY_IOTLB_FLUSH feature which, when offered
>> allows an endpoint to be attached to a domain in lazy mode. Alongside
>> we introduce a new IOTLB_FLUSH request which allows to invalidate
>> iotlb entries for the whole domain.
> I am not sure "lazy" is the best, for example a driver may just want
> to invalidate all the mappings for some reason. Is this better to
> rename this as "_F_IOTLB_FLUSH" instead?
Yes I can get rid of lazy terminology either by just using flush or
invalidate as suggested by Jean.
>
>> When the domain is created in
>> lazy mode, the virtio-iommu device knows it will receive IOTLB_FLUSH
>> and it can avoid flushing the device IOTLB on individual UNMAPs.
> I wonder what's the advantage to make it per domain instead of per device.
>
>> On a virtio-iommu/vhost scp use case, this can improve the
>> performance by ~10%.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/204
>>
>> ---
>>
>> As a side not virtio-iommu/vhost/scp use case was completely broken
> For "not" I think you mean "now"?
yes I meant side note
>
>> on aarch64 with guests older than v6.6-rc1. The scp stalled and we got
>> soft-lockups on guest in viommu_iotlb_sync. It happened
>> 295525e29a5b (“virtio_net: merge dma operations when filling mergeable buffers”)
> Interesting, it doesn't seem to be a fix.
Yes it is rather an optimization. But it looks like with
virtio-iommu/vhsot/scp use case it brings such a huge perf boost that it
fixes the guest lockups and scp stalls.
>
>> fixed the performance issue. Without that patch and with lazy mode, we
>> do not observe any stalls although the perf is way worse than with the
>> above patch. Without lazy mode, it looks like the number of vhost iotlb
>> invalidation is large enough to cause serious performance issues.
>>
>> This proposal can be tested with the following branches
>> guest branch: https://github.com/eauger/linux/tree/virtio-iommu-lazy-rfc
>> qemu branch: https://github.com/eauger/qemu/tree/virtio-iommu-device-lazy-rfc
>>
>> This was tested with vhost. In qemu command line, you need to set ats=on
>> to get benefit of lazy mode.
> Ok, I think what you really meant is the "device iotlb" as it ties to ATS.
The actual device implementation brought some confusion on the wording.
I hope I better explained in my previous reply.

Thanks

Eric
>
>> ---
>>  device-types/iommu/description.tex | 74 +++++++++++++++++++++++++++++-
>>  1 file changed, 73 insertions(+), 1 deletion(-)
>>
>> diff --git a/device-types/iommu/description.tex b/device-types/iommu/description.tex
>> index f8cbe88..990734e 100644
>> --- a/device-types/iommu/description.tex
>> +++ b/device-types/iommu/description.tex
>> @@ -74,6 +74,14 @@ \subsection{Feature bits}\label{sec:Device Types / IOMMU Device / Feature bits}
>>    whether endpoints that are attached to a domain are in bypass
>>    mode.
>>
>> +\item[VIRTIO_IOMMU_F_LAZY_IOTLB_FLUSH (7)]
>> +  This feature determines the capability to use deferred and batched
>> +  IOTLB flushes. If the feature is available, the driver can inform
>> +  a given domain works in lazy mode. For such domain, the device is
>> +  allowed to dissociate UNMAP requests from IOTLB flush operations and
>> +  accepts separate IOTLB flush requests that invalidate the IOTLB entries
>> +  for the whole domain.
> Does this imply a flush for device IOTLB invalidation? It need more
> clarification.
>
> Or we probably need to do the same as other IOMMU to separate device
> IOTLB invalidation from the IOMMU IOTLB.
>
>> +
>>  \end{description}
>>
>>  \drivernormative{\subsubsection}{Feature bits}{Device Types / IOMMU Device / Feature bits}
>> @@ -312,6 +320,7 @@ \subsubsection{ATTACH request}\label{sec:Device Types / IOMMU Device / Device op
>>  };
>>
>>  #define VIRTIO_IOMMU_ATTACH_F_BYPASS  (1 << 0)
>> +#define VIRTIO_IOMMU_ATTACH_F_LAZY    (1 << 1)
>>  \end{lstlisting}
>>
>>  Attach an endpoint to a domain. \field{domain} uniquely identifies a
>> @@ -341,6 +350,18 @@ \subsubsection{ATTACH request}\label{sec:Device Types / IOMMU Device / Device op
>>  can set the VIRTIO_IOMMU_ATTACH_F_BYPASS flag to create a bypass
>>  domain. Endpoints attached to this domain are in bypass mode.
>>
>> +When the VIRTIO_IOMMU_F_LAZY_IOTLB_FLUSH feature is available, the driver
>> +can set the VIRTIO_IOMMU_ATTACH_F_LAZY flag to create a lazy mode domain.
>> +Only such domains do support the IOTLB_FLUSH request.
>> +
>> +If the device does not offer the VIRTIO_IOMMU_F_LAZY_IOTLB_FLUSH feature and
>> +if the driver sets \field{flags} field to VIRTIO_IOMMU_ATTACH_F_LAZY, the
>> +device MAY set the request \field{status} to VIRTIO_IOMMU_S_INVAL.
>> +
>> +If several endpoints are attached to the same domain, they must be attached
>> +with the same value for that flag. Otherwise the device MAY set the request
>> +\field{status} to VIRTIO_IOMMU_S_INVAL.
>> +
>>  \drivernormative{\paragraph}{ATTACH request}{Device Types / IOMMU Device / Device operations / ATTACH request}
>>
>>  The driver SHOULD set \field{reserved} to zero.
>> @@ -351,7 +372,8 @@ \subsubsection{ATTACH request}\label{sec:Device Types / IOMMU Device / Device op
>>  If the domain already exists and is a bypass domain, the driver
>>  SHOULD set the VIRTIO_IOMMU_ATTACH_F_BYPASS flag. If the domain
>>  exists and is not a bypass domain, the driver SHOULD NOT set the
>> -VIRTIO_IOMMU_ATTACH_F_BYPASS flag.
>> +VIRTIO_IOMMU_ATTACH_F_BYPASS flag. The same holds for the
>> +VIRTIO_IOMMU_ATTACH_F_LAZY flag.
>>
>>  \devicenormative{\paragraph}{ATTACH request}{Device Types / IOMMU Device / Device operations / ATTACH request}
>>
>> @@ -374,6 +396,10 @@ \subsubsection{ATTACH request}\label{sec:Device Types / IOMMU Device / Device op
>>  flag is not consistent with that domain, the device SHOULD reject
>>  the request and set \field{status} to VIRTIO_IOMMU_S_INVAL.
>>
>> +If the domain already exists and the VIRTIO_IOMMU_ATTACH_F_LAZY
>> +flag is not consistent with that domain, the device SHOULD reject
>> +the request and set \field{status} to VIRTIO_IOMMU_S_INVAL.
>> +
>>  If the endpoint identified by \field{endpoint} is already attached to
>>  another domain, then the device SHOULD first detach it from that domain
>>  and attach it to the one identified by \field{domain}. In that case the
>> @@ -590,6 +616,11 @@ \subsubsection{UNMAP request}\label{sec:Device Types / IOMMU Device / Device ope
>>  This request is only available when VIRTIO_IOMMU_F_MAP_UNMAP has been
>>  negotiated.
>>
>> +In case the domain is created with the VIRTIO_IOMMU_ATTACH_F_LAZY flag,
>> +the device is allowed to separate UNMAP from IOTLB invalidations. The driver
>> +must explicitly invalidate the whole domain IOTLB entries using the separate
>> +IOTLB_FLUSH request.
>> +
>>  \drivernormative{\paragraph}{UNMAP request}{Device Types / IOMMU Device / Device operations / UNMAP request}
>>
>>  The driver SHOULD set the \field{reserved} field to zero.
>> @@ -625,6 +656,47 @@ \subsubsection{UNMAP request}\label{sec:Device Types / IOMMU Device / Device ope
>>  mapping, then the device SHOULD remove all mappings affected by the range
>>  and set the request \field{status} to VIRTIO_IOMMU_S_OK.
>>
>> +\subsubsection{IOTLB_FLUSH request}\label{sec:Device Types / IOMMU Device / Device operations / IOTLB_FLUSH request}
>> +
>> +\begin{lstlisting}
>> +struct virtio_iommu_req_iotlb_flush {
>> +  struct virtio_iommu_req_head head;
>> +  le32  domain;
>> +  u8    reserved[4];
>> +  struct virtio_iommu_req_tail tail;
>> +};
>> +\end{lstlisting}
>> +
>> +Flush IOTLB entries for a given domain. This domain must have been created
>> +with lazy mode set (VIRTIO_IOMMU_ATTACH_F_LAZY flag set on attachment).
>> +
>> +\drivernormative{\paragraph}{IOTLB_FLUSH request}{Device Types / IOMMU Device / Device operations / IOTLB_FLUSH request}
>> +
>> +The driver SHOULD set the \field{reserved} field to zero.
>> +
>> +The driver SHOULD NOT send IOTLB_FLUSH requests on a bypass domain.
>> +
>> +The driver SHOULD NOT send IOTLB_FLUSH requests on a non lazy domain.
>> +
>> +\devicenormative{\paragraph}{IOTLB_FLUSH request}{Device Types / IOMMU Device / Device operations / UNMAP request}
>> +
>> +If the \field{reserved} field of an IOTLB_FLUSH request is not zero, the device
>> +MAY set the request \field{status} to VIRTIO_IOMMU_S_INVAL, in which case
>> +the device MAY perform the IOTLB_FLUSH operation.
>> +
>> +If the device does not offer the VIRTIO_IOMMU_F_LAZY_IOTLB_FLUSH feature and
>> +if the driver calls the IOTLB_FLUSH request, the device MAY set the request
>> +\field{status} to VIRTIO_IOMMU_S_INVAL.
>> +
>> +If \field{domain} does not exist, the device SHOULD set the request
>> +\field{status} to VIRTIO_IOMMU_S_NOENT.
>> +
>> +If the domain is a bypass domain, the device SHOULD reject the
>> +request and set \field{status} to VIRTIO_IOMMU_S_INVAL.
>> +
>> +If the domain is not a lazy domain, the device SHOULD reject the
>> +request and set \field{status} to VIRTIO_IOMMU_S_INVAL.
>> +
>>  \subsubsection{PROBE request}\label{sec:Device Types / IOMMU Device / Device operations / PROBE request}
>>
>>  If the VIRTIO_IOMMU_F_PROBE feature bit is present, the driver sends a
>> --
>> 2.41.0
>>
> Thanks
>

