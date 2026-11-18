Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795015445;
	b=3lGRtDRrpYjm27yeJ9UQK/AO4snYeFlcfx4STej9ZPNGSPXMhXWNfhdnYLAMyUlE/Qte
	 r6W9SMbgDvpJ+FRhFf6L3f2bv5wR8Dgc8wOkbhKvof/molMhyaExMQRzrvrpCFvzVGx4v
	 2lm6fGeUY4Fp2y9QwUJij6DRxyZsj78BYCOQLJa9CH+m2oCcaWFEZSmxszzBtrtpZeSQI
	 SfYIJi9X5+ewakI1aWzrJM9QrD3HgHRFJ9c9ajREyJFXeoJCVfLiLJd8VfmGnCORTwLx9
	 VmA68qZEkhQolEkIGQdTq4brIGC3OSSlHFl8f4khq0Jgo3vlCj6cRfQZoceeutqf76g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015445;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ZohoMailClient;
	bh=qSnESoDcABWJDcyonb5AGyGSxkhjiIaKPRXmr4zVruM=;
	b=nLifWnISwQCOJ2gwZ0bolauriYIbRCBfOeDJ5I33BXur1snDpcDxyaZRYS5T6/jiOP70
	 LOCZYT5QqMPwWnw8qPXjY6tj1x6garehR/PbsHjZa6HiLlLhaHTlqZlEjve72/q6N7xqP
	 hxuCvrcNI03UnYiC56e8e5MM6XXHBiFky85O3X4Z1QwCf94fo9Grs+7x0sYf1KWYq/vmT
	 hZFZWRM2+r4rYFjjiCm9w4tCTQjfq6vUQkgbxtkznRbFxthtgwgC1NtBQYkM8yrpAp9Hq
	 Fj/XPw2c2NSOLnYLEwwcBJj47AD23ysGl3L+bN09cMeKHHLM7Zhx5+CS/s685xz6kYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=j6oY5vmK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC26F606A335
	for <virtio-comment@lists.linux.dev>; Wed, 18 Nov 2026 15:24:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC26F606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=j6oY5vmK
ARC-Seal: i=1; a=rsa-sha256; t=1795015438; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TqVlmC9xyJQ6iiF5NKZglv86KGM3tjtNtBbMpetSoi9zPbDz/mdWdjB/jSYo4FUC3udkvEwlZ/aOl0JMZbgEpovrWHWAEV98gFlMehPkXCONTsho8l7EgkPOw/GjwdKoHSKOiTbGPmyhfyfJOdFjJ6JOzps5wSuUn3dSz+7Ddxs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795015438; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qSnESoDcABWJDcyonb5AGyGSxkhjiIaKPRXmr4zVruM=; 
	b=HySiwByM31lxnQc2LWAx7KUmRoXEEVXe9IqPJ/5jLRRkpuUc5BlqlheE3MFsXngqkD9+UFuefswmjPE1KbZP3vjYnrk7eJMFr3D6g4Xi1cYBtcPvSPY0QJZTetPUaio0Z859ps1xbyeL7vHQYe1FwBPk5RopJKQF8RTUHqJ9PHg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: a=rsa-sha256; b=j6oY5vmKMFIGXC26Oq6XgcYBLW9712Bzj5tunIDUPs1sSk+ofcUDsMcw6hg1dbap4penj9o7CIzupqjkucV/UxhHRMzmaedUy/R3yrDzC6TdcwHR2tqTKmUdBnO8WfhMM8fFHQtTOn4FR0VDxcQI4YItEqrgLVRzn2M3R6pTtTQ=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=qSnESoDcABWJDcyonb5AGyGSxkhjiIaKPRXmr4zVruM=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795015435254482.5112907164013;
	Wed, 18 Nov 2026 07:23:55 -0800 (PST)
Message-ID: <bef167e8-73d1-417b-b0f1-3e4b93af968a@collabora.com>
Date: Wed, 18 Nov 2026 18:23:50 +0300
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] virtio-gpu: Add VIRTIO_GPU_CAPSET_DRM capset definition
To: Michael Riesch <michael.riesch@collabora.com>,
 Dorinda Bassey <dbassey@redhat.com>, virtio-comment@lists.linux.dev,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: slp@redhat.com, mhrica@redhat.com, aesteve@redhat.com, sgarzare@redhat.com
References: <20261118113242.59167-1-dbassey@redhat.com>
 <7fc62ef8-f323-497e-bb5f-25bbbcd9992a@collabora.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <7fc62ef8-f323-497e-bb5f-25bbbcd9992a@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 11/18/26 18:14, Michael Riesch wrote:
> Hi Dorinda,
> 
> Thanks for the patch! It's great to see this happening. We have been
> using this for a while now but it felt sort of weird to not have it in
> the spec.
> 
> On 11/18/26 12:32, Dorinda Bassey wrote:
>> The specification currently defines capsets 1-5, but the Linux
>> kernel has supported VIRTIO_GPU_CAPSET_DRM (ID 6) since commit
>> 7214da0ed ("drm/virtio: Add DRM capset definition", July 2024).
>>
>> VIRTIO_GPU_CAPSET_DRM enables DRM native context support for
>> direct rendering without GL/Vulkan translation layers, allowing
>> applications to use native DRM APIs for lower latency GPU
>> access and compute workloads.
>>
>> Add VIRTIO_GPU_CAPSET_DRM definition with ID 6 to align the
>> specification with the kernel UAPI and device implementations.
>>
>> Signed-off-by: Dorinda Bassey <dbassey@redhat.com>
> 
> Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
> 
> Best regards,
> Michael
> 
>> ---
>>   device-types/gpu/description.tex | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/device-types/gpu/description.tex b/device-types/gpu/description.tex
>> index ac3b427..2d7ffa6 100644
>> --- a/device-types/gpu/description.tex
>> +++ b/device-types/gpu/description.tex
>> @@ -542,6 +542,8 @@ \subsubsection{Device Operation: controlq}\label{sec:Device Types / GPU Device /
>>   	Mesa's (mostly) autogenerated Vulkan protocol.
>>     \item \href{https://chromium.googlesource.com/chromiumos/platform/crosvm/+/refs/heads/main/rutabaga_gfx/src/cross_domain/cross_domain_protocol.rs}{VIRTIO_GPU_CAPSET_CROSS_DOMAIN} --
>>   	protocol for display virtualization via Wayland proxying.
>> +  \item \href{https://www.kernel.org/doc/html/latest/gpu/drm-uapi.html}{VIRTIO_GPU_CAPSET_DRM} --
>> +	DRM native context support for direct rendering without GL/Vulkan translation.
>>     \end{itemize*}
>>   
>>   \begin{lstlisting}
>> @@ -556,6 +558,7 @@ \subsubsection{Device Operation: controlq}\label{sec:Device Types / GPU Device /
>>   #define VIRTIO_GPU_CAPSET_GFXSTREAM 3
>>   #define VIRTIO_GPU_CAPSET_VENUS 4
>>   #define VIRTIO_GPU_CAPSET_CROSS_DOMAIN 5
>> +#define VIRTIO_GPU_CAPSET_DRM 6
>>   struct virtio_gpu_resp_capset_info {
>>           struct virtio_gpu_ctrl_hdr hdr;
>>           le32 capset_id;
> 

There is [1] that I thought was merged long time ago. Apparently it's not?

[1] https://github.com/oasis-tcs/virtio-spec/issues/182

-- 
Best regards,
Dmitry
