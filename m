Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C021B151A
	for <virtio-comment@lists.linux.dev>; Mon,  9 Sep 2024 08:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725870326; cv=none; b=I6ri7xhPMVf94Yck91i4vMzisrNaFFBFoRWNwtGPKQM1SypMIZKAIMv0Gv1ATpc8BvPXwmzTrSBczqDU6lLiz8Ig8uvVp63hR5AJikSXeiMgMy9wMxOej1xC7CQLCoLnwqvNt3nHkb0jak5wvZo34wzI61poUDJEURq+rGF7NS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725870326; c=relaxed/simple;
	bh=GvCdvIJqmUYmREZQkcnXAHydNuNkIXsnzH+pLChQHjA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OOstzavVFTAGk4vhZROdlxeBBHzLiGxwh3qaiOx7abpJDYCS5Vk1QZr0hRcGgGIeUTCQvwgwQgF7fnQl7jSqsTumQBKC513oXv2uzntvCR4uP8o11FSX7hxMhg2+jTQsLllNLGXQXP/zJ5207iCiPQ9OZw2L7UR1XArXr/tTRVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FJlJCS+b; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FJlJCS+b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725870322;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1E0uVbdjDlPTD2K8D9gY5iPNKTIa4t77q0Bni/IhAds=;
	b=FJlJCS+biekl2SyGYsPDWTLDaY/U+WyARLH6mk2phkWX4YVZnCLjH4kKZVc8LyvSy5jVj1
	uha8cpeUOd6PPVrQSjNpI47erb+aUU0dgn3iL7I+lkChDJwpOfnbEwwI7NxjlqnUskg1qB
	9wOXoh3mitFJruHCZVyRCUXbv8KV0vY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-XtrliciIMuOjdAGRtdKAlg-1; Mon, 09 Sep 2024 04:25:21 -0400
X-MC-Unique: XtrliciIMuOjdAGRtdKAlg-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7a99ec827f3so463826085a.2
        for <virtio-comment@lists.linux.dev>; Mon, 09 Sep 2024 01:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725870321; x=1726475121;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1E0uVbdjDlPTD2K8D9gY5iPNKTIa4t77q0Bni/IhAds=;
        b=q+9QNX3a3a4/Sh9EFZC5vp/7iq/Kr7GnOFObsJV6ak2cFastEbLGYY4ZfD6jwpxgtr
         Hktr0mr0NpftvsvosVoFgigYbI9LYkDfaZk4ldgw8jZIP/REgAoiUe8D8BLIuZ/Gh+pq
         pCNucOHU+/dsSbZeDVvgIqWqGKpTXxFnDWm1rYdoc8RjglolAFrQSyiAgTvjIyPlMO9g
         +ieqjaYGqH9GLxbaS7uXmcw7k0CrCG3jAg0nBpRuhZ5VnVMC++ykte442hQkdWMwyKpY
         VBCMBRfRrG8sjIMT76kaDQTRH2YTp0drjLGh6VPaivRuT1aURMQw6NU+67VtbPqEalXP
         /6Gg==
X-Forwarded-Encrypted: i=1; AJvYcCWleB7LDSWnGlNZQv5J34P77uEHUkUo6IooOb98o8fJ2/WZWVtX13xgeEGIM7De8SKdZjjzcDllmVXNfiMFxg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyEc5+fCra6a1iMfvBQTUzNdLEiWUPRRFj1ERPiUsaPUVneyN59
	fl2dg52Ezpb11OhaEmEPl1X+wYAiF+q3wDEKI4nDZbLeHQuE5JutUXdGXgi68JWMIJgzhOHotOW
	116sEt02aGgqvt5AczKwZjsZOHSmf6NhcN7d9qeHOJXMpuuKXMBmENjQHluOprcYqkKzS39Xs
X-Received: by 2002:a05:620a:40cc:b0:7a1:d08d:e2fa with SMTP id af79cd13be357-7a9973283dcmr1351319385a.1.1725870320464;
        Mon, 09 Sep 2024 01:25:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0XvwRGCpw372OAL7ED31CwHucMwzen26pJV8lcMjx2qMMugSDJHLfVRDkxqAXABUo+hZmMQ==
X-Received: by 2002:a05:620a:40cc:b0:7a1:d08d:e2fa with SMTP id af79cd13be357-7a9973283dcmr1351317785a.1.1725870319823;
        Mon, 09 Sep 2024 01:25:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a9a7946afbsm193552385a.3.2024.09.09.01.25.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 01:25:19 -0700 (PDT)
Message-ID: <11c8fa1b-cae2-424e-9f0a-15e64de05ef1@redhat.com>
Date: Mon, 9 Sep 2024 10:25:16 +0200
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
To: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Jason Wang <jasowang@redhat.com>
Cc: eric.auger.pro@gmail.com, virtio-comment@lists.linux.dev, mst@redhat.com
References: <20240905134621.711743-1-eric.auger@redhat.com>
 <CACGkMEs8moUvhZda78cCstjO+aYb+SsrFF_nks6BJptVcYD_xg@mail.gmail.com>
 <20240906134724.GA780139@myrica>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240906134724.GA780139@myrica>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jean,

On 9/6/24 15:47, Jean-Philippe Brucker wrote:
> On Fri, Sep 06, 2024 at 07:50:44AM +0800, Jason Wang wrote:
>> On Thu, Sep 5, 2024 at 9:46 PM Eric Auger <eric.auger@redhat.com> wrote:
>>> At the moment the virtio-iommu offers MAP and UNMAP requests.
>>> This means that if the virtio-iommu protects a device with an iotlb
>>> we have no other choice but invalidating the device iotlb on UNMAP.
>>> This proposal aims at allowing the decoupling of UNMAP commands
>>> and domain IOTLB invalidations.
>> I think there should be some difference between "device iotlb" and
>> "domain IOTLB".  My understanding is that usually "device iotlb" means
>> the mapping cached by the individual device while "domain IOTLB" means
>> the mapping cached by the IOMMU.
>>
>> E.g in the case of intel IOMMU, it has two kind of invalidation
>>
>> device iotlb invalidation: used to invalidate device IOTLB via ATS
>> domain selective invalidation: used to invalidate all IOTLB for a
>> specific domain
> I agree, and we should describe the TLBs a little more since the spec
> didn't need to mention them so far. An implementation could have both
> IOTLBs:
>
>   dev <-> dev-IOTLB <-> IOTLB <-> mapping tree <-> virtio-iommu drv
>
> At the moment, the MAP/UNMAP interface only acts on the mapping tree, and
> the virtio-iommu device implicitly invalidates both IOTLB and dev-IOTLB on
> UNMAP. Here you want to keep the UNMAP requests and add an explicit IOTLB
> FLUSH request. The IOMMU device would keep maintaining the mappings tree
> on UNMAP, but wait until a FLUSH request to clear IOTLB and dev-IOTLB.

I agree I will add such IOTLB invalidation details in the spec.
>
>>> This enables lazy mode where iotlb
>>> invalidations are deferred and batched. In that prospect we add a
>>> new VIRTIO_IOMMU_F_LAZY_IOTLB_FLUSH feature which, when offered
>>> allows an endpoint to be attached to a domain in lazy mode. Alongside
>>> we introduce a new IOTLB_FLUSH request which allows to invalidate
>>> iotlb entries for the whole domain.
>> I am not sure "lazy" is the best, for example a driver may just want
>> to invalidate all the mappings for some reason. Is this better to
>> rename this as "_F_IOTLB_FLUSH" instead?
>>
>>> When the domain is created in
>>> lazy mode, the virtio-iommu device knows it will receive IOTLB_FLUSH
>>> and it can avoid flushing the device IOTLB on individual UNMAPs.
>> I wonder what's the advantage to make it per domain instead of per device.
> The UNMAP request works on domains (= address spaces), so at the moment
> when handling UNMAP the virtio-iommu device already needs to implicitly
> issue a "invalidate all dev-IOTLB attached to this domain". Since we're
> splitting out this operation into an explicit request, I think making the
> request per domain means less work on the virtio-iommu device side,
> because it's familiar with manipulating domains rather than devices.

+1
>
>
>>> On a virtio-iommu/vhost scp use case, this can improve the
>>> performance by ~10%.
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/204
>>>
>>> ---
>>>
>>> As a side not virtio-iommu/vhost/scp use case was completely broken
>> For "not" I think you mean "now"?
>>
>>> on aarch64 with guests older than v6.6-rc1. The scp stalled and we got
>>> soft-lockups on guest in viommu_iotlb_sync. It happened
>>> 295525e29a5b (“virtio_net: merge dma operations when filling mergeable buffers”)
>> Interesting, it doesn't seem to be a fix.
>>
>>> fixed the performance issue. Without that patch and with lazy mode, we
>>> do not observe any stalls although the perf is way worse than with the
>>> above patch. Without lazy mode, it looks like the number of vhost iotlb
>>> invalidation is large enough to cause serious performance issues.
>>>
>>> This proposal can be tested with the following branches
>>> guest branch: https://github.com/eauger/linux/tree/virtio-iommu-lazy-rfc
>>> qemu branch: https://github.com/eauger/qemu/tree/virtio-iommu-device-lazy-rfc
>>>
>>> This was tested with vhost. In qemu command line, you need to set ats=on
>>> to get benefit of lazy mode.
>> Ok, I think what you really meant is the "device iotlb" as it ties to ATS.
>>
>>> ---
>>>  device-types/iommu/description.tex | 74 +++++++++++++++++++++++++++++-
>>>  1 file changed, 73 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/device-types/iommu/description.tex b/device-types/iommu/description.tex
>>> index f8cbe88..990734e 100644
>>> --- a/device-types/iommu/description.tex
>>> +++ b/device-types/iommu/description.tex
>>> @@ -74,6 +74,14 @@ \subsection{Feature bits}\label{sec:Device Types / IOMMU Device / Feature bits}
>>>    whether endpoints that are attached to a domain are in bypass
>>>    mode.
>>>
>>> +\item[VIRTIO_IOMMU_F_LAZY_IOTLB_FLUSH (7)]
>>> +  This feature determines the capability to use deferred and batched
>>> +  IOTLB flushes. If the feature is available, the driver can inform
>>> +  a given domain works in lazy mode. For such domain, the device is
>>> +  allowed to dissociate UNMAP requests from IOTLB flush operations and
>>> +  accepts separate IOTLB flush requests that invalidate the IOTLB entries
>>> +  for the whole domain.
>> Does this imply a flush for device IOTLB invalidation? It need more
>> clarification.
>>
>> Or we probably need to do the same as other IOMMU to separate device
>> IOTLB invalidation from the IOMMU IOTLB.
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
OK so I am tempted to keep this single request atm.
>
>
>>> +
>>>  \end{description}
>>>
>>>  \drivernormative{\subsubsection}{Feature bits}{Device Types / IOMMU Device / Feature bits}
>>> @@ -312,6 +320,7 @@ \subsubsection{ATTACH request}\label{sec:Device Types / IOMMU Device / Device op
>>>  };
>>>
>>>  #define VIRTIO_IOMMU_ATTACH_F_BYPASS  (1 << 0)
>>> +#define VIRTIO_IOMMU_ATTACH_F_LAZY    (1 << 1)
>>>  \end{lstlisting}
>>>
>>>  Attach an endpoint to a domain. \field{domain} uniquely identifies a
>>> @@ -341,6 +350,18 @@ \subsubsection{ATTACH request}\label{sec:Device Types / IOMMU Device / Device op
>>>  can set the VIRTIO_IOMMU_ATTACH_F_BYPASS flag to create a bypass
>>>  domain. Endpoints attached to this domain are in bypass mode.
>>>
>>> +When the VIRTIO_IOMMU_F_LAZY_IOTLB_FLUSH feature is available, the driver
>>> +can set the VIRTIO_IOMMU_ATTACH_F_LAZY flag to create a lazy mode domain.
> Maybe we could call this "deferral domain" rather than "lazy". In any case
> since we define the term here, then we don't have to refer to the attach
> flag in later descriptions, we can just call it "lazy domain" or "deferral
> domain" (like we did for bypass domains)
I am fine with deferral domain if prefered. Also I agree that once the
terminology is properly introduced in the spec, I can avoid refering to
the flag.
>
>>> +Only such domains do support the IOTLB_FLUSH request.
>>> +
>>> +If the device does not offer the VIRTIO_IOMMU_F_LAZY_IOTLB_FLUSH feature and
>>> +if the driver sets \field{flags} field to VIRTIO_IOMMU_ATTACH_F_LAZY, the
>>> +device MAY set the request \field{status} to VIRTIO_IOMMU_S_INVAL.
> (any statement MAY/MUST/SHOULD has to go in the devicenormative or
> drivernormative section below)
sure I am not yet familiar with those rules
>
> We already have:
>
> "If the device does not recognize a flags bit, it MUST reject the request
> and set status to VIRTIO_IOMMU_S_INVAL."
it is not really the same. Above I stated that you shall not accect a
flush on a non deferral domain. I understand the above as reject any
unknown flag.
>
>>> +
>>> +If several endpoints are attached to the same domain, they must be attached
>>> +with the same value for that flag. Otherwise the device MAY set the request
>>> +\field{status} to VIRTIO_IOMMU_S_INVAL.
> Already stated below
I will move/keep in the normative part
>
>>> +
>>>  \drivernormative{\paragraph}{ATTACH request}{Device Types / IOMMU Device / Device operations / ATTACH request}
>>>
>>>  The driver SHOULD set \field{reserved} to zero.
>>> @@ -351,7 +372,8 @@ \subsubsection{ATTACH request}\label{sec:Device Types / IOMMU Device / Device op
>>>  If the domain already exists and is a bypass domain, the driver
>>>  SHOULD set the VIRTIO_IOMMU_ATTACH_F_BYPASS flag. If the domain
>>>  exists and is not a bypass domain, the driver SHOULD NOT set the
>>> -VIRTIO_IOMMU_ATTACH_F_BYPASS flag.
>>> +VIRTIO_IOMMU_ATTACH_F_BYPASS flag. The same holds for the
>>> +VIRTIO_IOMMU_ATTACH_F_LAZY flag.
>>>
>>>  \devicenormative{\paragraph}{ATTACH request}{Device Types / IOMMU Device / Device operations / ATTACH request}
>>>
>>> @@ -374,6 +396,10 @@ \subsubsection{ATTACH request}\label{sec:Device Types / IOMMU Device / Device op
>>>  flag is not consistent with that domain, the device SHOULD reject
>>>  the request and set \field{status} to VIRTIO_IOMMU_S_INVAL.
>>>
>>> +If the domain already exists and the VIRTIO_IOMMU_ATTACH_F_LAZY
>>> +flag is not consistent with that domain, the device SHOULD reject
>>> +the request and set \field{status} to VIRTIO_IOMMU_S_INVAL.
>>> +
>>>  If the endpoint identified by \field{endpoint} is already attached to
>>>  another domain, then the device SHOULD first detach it from that domain
>>>  and attach it to the one identified by \field{domain}. In that case the
>>> @@ -590,6 +616,11 @@ \subsubsection{UNMAP request}\label{sec:Device Types / IOMMU Device / Device ope
>>>  This request is only available when VIRTIO_IOMMU_F_MAP_UNMAP has been
>>>  negotiated.
>>>
>>> +In case the domain is created with the VIRTIO_IOMMU_ATTACH_F_LAZY flag,
>>> +the device is allowed to separate UNMAP from IOTLB invalidations. The driver
>>> +must explicitly invalidate the whole domain IOTLB entries using the separate
>>> +IOTLB_FLUSH request.
> I think it's best to avoid "must" in non-normative section. Maybe we can
> simply say "the driver explicitly invalidates the whole domain..." here.
> Not sure it even makes sense to say "has to invalidate" because the whole
> thing is fuzzy. There is no well-defined period for the flushes so it
> could in theory never flush the TLB...
OK. I will put "the driver explicitly invalidates the whole domain". I
guess nothing prevents the device from invalidating on unmap either if
it can do differently.
>
> We could put a little more details here and less in other places, so it's
> easier for the reader to figure out what this feature is about: the
> feature flag description could just say "F_FLUSH attach flag is
> supported". And the attach flag description "INVALIDATE/FLUSH requests are
Yes I do agree.
> supported on this domain". And here a more detailed description on how to
> use UNMAP alongside FLUSH and why it's useful, something like:
>
> "To reduce the number of synchronizations between device and driver,
> the driver can send batches of UNMAP requests periodically instead of one
> at a time. Since this introduces a time window where the endpoint could
> access stale mappings and reallocated memory, the endpoint and its driver
> must be trusted not to misbehave. For <lazy/deferral> domains, the driver
> appends an <invalidate/flush> request at the end of each batch,
> allowing the device to invalidate TLBs once per batch instead of once per
> UNMAP request. For <lazy/deferral> domains, the device does not have to
> invalidate TLBs on UNMAP, it can wait until a <invalidate/flush> request."
Yes that's a good description. I will include that.
>
> This assumes we already defined what are TLBs somewhere
>
> The new feature raises one question: is a non-deferral domain forbidden
> from using lazy mode?  The Linux driver already implements lazy, and such
> statement would make it illegal. I think we need to phrase this new
> feature as only adding the flush request, but not allowing/forbidding lazy
> mode. That remains guest policy and isn't reflected by supporting F_LAZY.
I think I will remove any reference to lazy in this spec update proposal.
>
>>> +
>>>  \drivernormative{\paragraph}{UNMAP request}{Device Types / IOMMU Device / Device operations / UNMAP request}
>>>
>>>  The driver SHOULD set the \field{reserved} field to zero.
>>> @@ -625,6 +656,47 @@ \subsubsection{UNMAP request}\label{sec:Device Types / IOMMU Device / Device ope
>>>  mapping, then the device SHOULD remove all mappings affected by the range
>>>  and set the request \field{status} to VIRTIO_IOMMU_S_OK.
>>>
>>> +\subsubsection{IOTLB_FLUSH request}\label{sec:Device Types / IOMMU Device / Device operations / IOTLB_FLUSH request}
>>> +
>>> +\begin{lstlisting}
>>> +struct virtio_iommu_req_iotlb_flush {
>>> +  struct virtio_iommu_req_head head;
>>> +  le32  domain;
>>> +  u8    reserved[4];
>>> +  struct virtio_iommu_req_tail tail;
>>> +};
> It would be nice to reconcile this with the INVALIDATE request needed for
> page table support (although we don't have anyone available to work on
> this at the moment I'm still getting requests for it). The concept is the
> same, only the location of the components change (the mapping tree is
> maintained by the driver directly instead of the device via MAP/UNMAP)
>
> https://lore.kernel.org/virtio-comment/20240122171442.1740297-4-jean-philippe@linaro.org/
>
> The LAZY_IOTLB_FLUSH request corresponds to INVALIDATE request with scope
> VIRTIO_IOMMU_INVAL_S_DOMAIN, flag VIRTIO_IOMMU_INVAL_C_TLB. We certainly
> don't have to keep those values here but I'd rather not introduce a
> separate request later for exactly the same concept. How about we leave
> space for extension in the new request:
>
> struct virtio_iommu_req_invalidate {
>   struct virtio_iommu_req_head head;
>   le32  domain;
>   u8	reserved[56];
>   struct virtio_iommu_req_tail tail;
> };
>
> And maybe we call the new request INVALIDATE instead of IOTLB_FLUSH, so it
> can later be extended with address ranges (I think "flush" only means
> invalidate-all?)

Sure I can do that.
>
> Then when extending the INVALIDATE request for page table support, we'll
> have scope DOMAIN==0, and TLB cache always on (only the PASID cache will
> be selectable).
>
>>> +\end{lstlisting}
>>> +
>>> +Flush IOTLB entries for a given domain. This domain must have been created
>>> +with lazy mode set (VIRTIO_IOMMU_ATTACH_F_LAZY flag set on attachment).
> We can drop this...
>
>>> +
>>> +\drivernormative{\paragraph}{IOTLB_FLUSH request}{Device Types / IOMMU Device / Device operations / IOTLB_FLUSH request}
>>> +
>>> +The driver SHOULD set the \field{reserved} field to zero.
>>> +
>>> +The driver SHOULD NOT send IOTLB_FLUSH requests on a bypass domain.
>>> +
>>> +The driver SHOULD NOT send IOTLB_FLUSH requests on a non lazy domain.
> ... and replace these with "The domain MUST be a lazy/deferral domain"
OK
>
>>> +\devicenormative{\paragraph}{IOTLB_FLUSH request}{Device Types / IOMMU Device / Device operations / UNMAP request}
>>> +
>>> +If the \field{reserved} field of an IOTLB_FLUSH request is not zero, the device
>>> +MAY set the request \field{status} to VIRTIO_IOMMU_S_INVAL, in which case
>>> +the device MAY perform the IOTLB_FLUSH operation.
>>> +
>>> +If the device does not offer the VIRTIO_IOMMU_F_LAZY_IOTLB_FLUSH feature and
>>> +if the driver calls the IOTLB_FLUSH request, the device MAY set the request
>>> +\field{status} to VIRTIO_IOMMU_S_INVAL.
> The ATTACH request should have a normative statement preventing creation
> of deferral requests if the feature is not offered. And below we have
> normative statements preventing the use of this on deferral domains, so we
> can drop this
OK
>
>>> +
>>> +If \field{domain} does not exist, the device SHOULD set the request
>>> +\field{status} to VIRTIO_IOMMU_S_NOENT.
>>> +
>>> +If the domain is a bypass domain, the device SHOULD reject the
>>> +request and set \field{status} to VIRTIO_IOMMU_S_INVAL.
> This should probably be an ATTACH normative statement: prevent the
> creation of a deferral+bypass domain.
>
>>> +
>>> +If the domain is not a lazy domain, the device SHOULD reject the
>>> +request and set \field{status} to VIRTIO_IOMMU_S_INVAL.
>>> +
>>>  \subsubsection{PROBE request}\label{sec:Device Types / IOMMU Device / Device operations / PROBE request}
> Should we add a new PROBE property that says if the new mode is supported
> by each endpoint?  So when we have a mix of VFIO, vhost and virtio
> endpoints, only the vhost endpoint would have this property, and the driver
> wouldn't add an invalidate request for domains attached to the others?
> One reason is that the device may implement TLBs differently for each kind
> of endpoints. For example in vhost it's more efficient to invalidate the
> whole TLB rather than doing it by range, so this feature improves
> performance, but for other TLB implementations it could be the opposite.
I am not sure this extra complexity is needed atm. Currently the qemu
device implements the flush for vhost protected devices and does not
change the behavior for VFIO.
>
> If we make the attach rule about mixing domain types too strict though,
> this would prevent sharing a domain between the VFIO and vhost endpoints.

Yes I think we can manage without that new probe. I would be inclined to
go without
>
> Random thought: it may be interesting to actually implement this on VFIO
> endpoints at some point: VFIO_DMA_UNMAP ioctl only updates the page tables
> and FLUSH issues an invalidate-all in the HW IOMMU. But that requires
> VFIO_DMA_UNMAP not to unpin the guest pages so they aren't reallocated,
> which would be a big security hole.
At QEMU level we miss some notifiers to differentiate those and as you
noted this would induce changes in the vfio/iommufd driver. If someone
face perf issues in production use cases this can be further studied indeed.

Thank you for your thorough review!

Eric
>
> Thanks,
> Jean
>

