Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187C64C81
	for <virtio-comment@lists.linux.dev>; Mon,  9 Sep 2024 07:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725866203; cv=none; b=SNydlLCo1ww9vezMGnoqbaeX2JNQZNpsG/3t27W+TnLAv2WnAPqXac4aWQcB93nG3e78rmHsAj01yhgKalEk6+rpO4hEgyaIstLz7Qzpv8sZ6pfsml6JUU8SJiNfgjzrOTBCiOvt1ZJW5tHCckI4gID+Zeu274PS4iJTvHhxeXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725866203; c=relaxed/simple;
	bh=wzbJaFlshqemYoYjqpIkPCP1GFHBaJXVgVanAe0idvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=skVnrxoVHfqI3Wq/Otmp4J77j+LRt3JVsP1l2QIVvpNNTe3SryEh9N9XpDE/gFCfJe38Q7uzSOjcAbVLF9aOeRW9Q4a3CHwsQbFF/TQ6m/vuc1E+9PibBOyEnIifnBXI/xkfkINqsy8DYbIi9MJhIKZ40u/RfZt7siHeI0Rjzkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ji1jIzoU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ji1jIzoU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725866199;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9wq35cCCRj6NP79MnYaKpyHrBl53lnZxZhIgC78jLOE=;
	b=Ji1jIzoUjh82Xm8v2NJ0/VCU5dS/CzUfOeGgtUKEQo+LJDfE8hhx+4ADGB4wp7XfEAPQ42
	FEFnodj/yX635qv8iRgBCL40zJYHbjzur5dTID5c8xrYSk8MydXfRi0TlqrbfJVli9wTOQ
	xJppGx6Y1z2IBSQBfTbjt6+xxlNS08s=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-sR-baHgDNBOasF4JS20VcA-1; Mon, 09 Sep 2024 03:16:36 -0400
X-MC-Unique: sR-baHgDNBOasF4JS20VcA-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7a9a71b17a3so241064985a.0
        for <virtio-comment@lists.linux.dev>; Mon, 09 Sep 2024 00:16:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725866196; x=1726470996;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9wq35cCCRj6NP79MnYaKpyHrBl53lnZxZhIgC78jLOE=;
        b=QvxljnTr9axlDDFQZswMk1K9ugCSKVJlu/uCwznCyztUEpRA30EG1R0P/BORbr1vHY
         I+4Q9AtEDbeCneX6TSNW6qkLDjY23vxF4Ff7BUUUxFUdxK1r/Lp+q8AMXsgNc5ovEmD3
         0sChRmQimLd64zRamku55e/Y5pk9101FiQRJDHD5UoNMhCuWu0MlU2hEC3drQ6iiXfDe
         8Fpj93l1bCWQwnvWz2nClQ0XWZdrjduaFwQlLwRfiKrQ4Qk9dWj+9PTCzET7xoWG1oFt
         3/URJYXcVq/2AQJCiUsBmvJ2K7TfcCX83QeHQKGAeq4xcC6jJD1O0MTKJCdkL1teC5dD
         +N0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVVXbXVOo3Ou0xXA9mr/fr1icRpwigstLTnttN6oAIVoLwIxnLtUBD8KNwfkX5nyKG/LntQQYPX1plBXezvuQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywgvccv/uXsFuo91YZHw0txWKT/kigZHZ0jQxkcaYhn+r0KiLhu
	VeC2Z0Yo/vWX8Q9sa6bPfvYJtTOE//iEjW8LWYBh8Ow+ZYURZbi5oV1rEVrN3uN9N5U9tGQHdqZ
	CswM/+fbEGADcri/tO61s2sB5os+u/5a23DYDgYhTSmnG/dqClyXCxDT65V156b8T
X-Received: by 2002:a05:620a:491:b0:7a9:9a64:cda9 with SMTP id af79cd13be357-7a99a64cefemr806767585a.47.1725866195988;
        Mon, 09 Sep 2024 00:16:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFW7EmL7KKkfU3rOWWV28k1dUsO3sBYa63xzi7oLo0QGaBVzjURNLl5Ekb3EZzfQLyNvWNAsw==
X-Received: by 2002:a05:620a:491:b0:7a9:9a64:cda9 with SMTP id af79cd13be357-7a99a64cefemr806766885a.47.1725866195595;
        Mon, 09 Sep 2024 00:16:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a9a7967499sm190035785a.28.2024.09.09.00.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 00:16:35 -0700 (PDT)
Message-ID: <dc606cb9-79bb-4825-956e-5298fa8f956e@redhat.com>
Date: Mon, 9 Sep 2024 09:16:31 +0200
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
To: Jason Wang <jasowang@redhat.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: eric.auger.pro@gmail.com, virtio-comment@lists.linux.dev, mst@redhat.com
References: <20240905134621.711743-1-eric.auger@redhat.com>
 <CACGkMEs8moUvhZda78cCstjO+aYb+SsrFF_nks6BJptVcYD_xg@mail.gmail.com>
 <20240906134724.GA780139@myrica>
 <CACGkMEvtA6FdzebGifyjzLumN6dhuCrg=bJmKfrE1xioY0tF1A@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CACGkMEvtA6FdzebGifyjzLumN6dhuCrg=bJmKfrE1xioY0tF1A@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jason, Jean,

On 9/9/24 05:25, Jason Wang wrote:
> On Fri, Sep 6, 2024 at 9:47 PM Jean-Philippe Brucker
> <jean-philippe@linaro.org> wrote:
>> On Fri, Sep 06, 2024 at 07:50:44AM +0800, Jason Wang wrote:
>>> On Thu, Sep 5, 2024 at 9:46 PM Eric Auger <eric.auger@redhat.com> wrote:
>>>> At the moment the virtio-iommu offers MAP and UNMAP requests.
>>>> This means that if the virtio-iommu protects a device with an iotlb
>>>> we have no other choice but invalidating the device iotlb on UNMAP.
>>>> This proposal aims at allowing the decoupling of UNMAP commands
>>>> and domain IOTLB invalidations.
>>> I think there should be some difference between "device iotlb" and
>>> "domain IOTLB".  My understanding is that usually "device iotlb" means
>>> the mapping cached by the individual device while "domain IOTLB" means
>>> the mapping cached by the IOMMU.
>>>
>>> E.g in the case of intel IOMMU, it has two kind of invalidation
>>>
>>> device iotlb invalidation: used to invalidate device IOTLB via ATS
>>> domain selective invalidation: used to invalidate all IOTLB for a
>>> specific domain
>> I agree, and we should describe the TLBs a little more since the spec
>> didn't need to mention them so far. An implementation could have both
>> IOTLBs:
>>
>>   dev <-> dev-IOTLB <-> IOTLB <-> mapping tree <-> virtio-iommu drv
>>
>> At the moment, the MAP/UNMAP interface only acts on the mapping tree, and
>> the virtio-iommu device implicitly invalidates both IOTLB and dev-IOTLB on
>> UNMAP. Here you want to keep the UNMAP requests and add an explicit IOTLB
>> FLUSH request. The IOMMU device would keep maintaining the mappings tree
>> on UNMAP, but wait until a FLUSH request to clear IOTLB and dev-IOTLB.
>>
>>>> This enables lazy mode where iotlb
>>>> invalidations are deferred and batched. In that prospect we add a
>>>> new VIRTIO_IOMMU_F_LAZY_IOTLB_FLUSH feature which, when offered
>>>> allows an endpoint to be attached to a domain in lazy mode. Alongside
>>>> we introduce a new IOTLB_FLUSH request which allows to invalidate
>>>> iotlb entries for the whole domain.
>>> I am not sure "lazy" is the best, for example a driver may just want
>>> to invalidate all the mappings for some reason. Is this better to
>>> rename this as "_F_IOTLB_FLUSH" instead?
>>>
>>>> When the domain is created in
>>>> lazy mode, the virtio-iommu device knows it will receive IOTLB_FLUSH
>>>> and it can avoid flushing the device IOTLB on individual UNMAPs.
>>> I wonder what's the advantage to make it per domain instead of per device.
>> The UNMAP request works on domains (= address spaces), so at the moment
>> when handling UNMAP the virtio-iommu device already needs to implicitly
>> issue a "invalidate all dev-IOTLB attached to this domain". Since we're
>> splitting out this operation into an explicit request, I think making the
>> request per domain means less work on the virtio-iommu device side,
>> because it's familiar with manipulating domains rather than devices.
> Ok, I see.

Yes the 2 aspects that drove this choice were that
- UNMAP applied on domain and also
- lazy mode is set at domain level on kernel(IOMMU_DOMAIN_DMA_FQ domain
type)


Also what I had in mind is the flush should invalidate both device and
IOMMU IOTLB. The spec update proposal was really driven by the iommu
lazy mode implementation.

Currently the virtio-iommu driver lazy mode implementation differs from
other iommu drivers implementation in the fact it does not allow to
reduce the number of IOTLB invalidations.

However when I came to the practical qemu device implementation I
realized I needed to differentiate UNMAP notifications targeting vhost
or VFIO which do not mean the same thing at qemu level. vhost unmap
notifications mean dev IOTLB Invalidations whereas vfio unmap
notifications mean "unmap at physical level". Obviously on VFIO you
don't want to physically unmap the whole domain on flush while it is
fine to invalidate the whole domain vhost ioltb cache. So at QEMU level
I ended to the conclusion only the vhost unmap notification matched an
IOTLB flush. So to discriminate between vhost and VFIO the best is to
use ats which forces vhost to register DEVIOTLB_UNMAP notifiers.

Hope this clarifies


>
>>
>>>> On a virtio-iommu/vhost scp use case, this can improve the
>>>> performance by ~10%.
>>>>
>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/204
>>>>
>>>> ---
>>>>
>>>> As a side not virtio-iommu/vhost/scp use case was completely broken
>>> For "not" I think you mean "now"?
>>>
>>>> on aarch64 with guests older than v6.6-rc1. The scp stalled and we got
>>>> soft-lockups on guest in viommu_iotlb_sync. It happened
>>>> 295525e29a5b (“virtio_net: merge dma operations when filling mergeable buffers”)
>>> Interesting, it doesn't seem to be a fix.
>>>
>>>> fixed the performance issue. Without that patch and with lazy mode, we
>>>> do not observe any stalls although the perf is way worse than with the
>>>> above patch. Without lazy mode, it looks like the number of vhost iotlb
>>>> invalidation is large enough to cause serious performance issues.
>>>>
>>>> This proposal can be tested with the following branches
>>>> guest branch: https://github.com/eauger/linux/tree/virtio-iommu-lazy-rfc
>>>> qemu branch: https://github.com/eauger/qemu/tree/virtio-iommu-device-lazy-rfc
>>>>
>>>> This was tested with vhost. In qemu command line, you need to set ats=on
>>>> to get benefit of lazy mode.
>>> Ok, I think what you really meant is the "device iotlb" as it ties to ATS.
>>>
>>>> ---
>>>>  device-types/iommu/description.tex | 74 +++++++++++++++++++++++++++++-
>>>>  1 file changed, 73 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/device-types/iommu/description.tex b/device-types/iommu/description.tex
>>>> index f8cbe88..990734e 100644
>>>> --- a/device-types/iommu/description.tex
>>>> +++ b/device-types/iommu/description.tex
>>>> @@ -74,6 +74,14 @@ \subsection{Feature bits}\label{sec:Device Types / IOMMU Device / Feature bits}
>>>>    whether endpoints that are attached to a domain are in bypass
>>>>    mode.
>>>>
>>>> +\item[VIRTIO_IOMMU_F_LAZY_IOTLB_FLUSH (7)]
>>>> +  This feature determines the capability to use deferred and batched
>>>> +  IOTLB flushes. If the feature is available, the driver can inform
>>>> +  a given domain works in lazy mode. For such domain, the device is
>>>> +  allowed to dissociate UNMAP requests from IOTLB flush operations and
>>>> +  accepts separate IOTLB flush requests that invalidate the IOTLB entries
>>>> +  for the whole domain.
>>> Does this imply a flush for device IOTLB invalidation? It need more
>>> clarification.
>>>
>>> Or we probably need to do the same as other IOMMU to separate device
>>> IOTLB invalidation from the IOMMU IOTLB.
>> It's a good question. When adding page table support to virtio-iommu I
>> initially added separate flags for IOMMU IOTLB and dev-IOTLB, but in the
>> end I couldn't find a reason to act on them separately, so now invalidate
>> just means "all IOTLBs including ATCs".
>>
>> If the IOTLB and ATC are invalidated through different channels (Arm
>> broadcast TLB maintenance, where IOTLBs are invalidate with CPU
>> instructions but not ATCs), the host knows about it and only invalidates
>> the ATC when receiving a request.
>>
>> So in my opinion a single request acting on all IOTLBs and dev-IOTLBs is
>> all we need at the moment.
> Ok, I see. Just a note that as both Intel and AMD IOMMU have dedicated
> device IOTLB flush commands. (But they have other advanced features
> with them). Anyhow the spec could be extended if we find one real use
> case.
understood.

Thanks

Eric
>
> Thanks
>

