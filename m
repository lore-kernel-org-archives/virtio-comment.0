Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67E11D049F
	for <virtio-comment@lists.linux.dev>; Wed,  2 Oct 2024 14:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727879394; cv=none; b=sZokb4ljHaP1GMO41o48o4iO07PyFhVHyXkCqD01Ox2/35Hj2BYxEBTS0azS1XQkGkZ6ZoSjXY+C2NatQjgnm+F7qWxIIXDCSeEYwy9Crj4Syb3aHk0YqE4RY39/zxOD3ItlnFuuUvFsCbMveEwj+9AHODuyQa7vBNI6mUGmHew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727879394; c=relaxed/simple;
	bh=lPp/Ca4rA2B6ht63EtZMJ2dk35087N+fffl9RSUHofQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=enJra1BCoGLxk0pDWrcf7nLsCuinMFxehmcTjafenIlTdgNFtks0WuoIbt9qOc/ezHSwDGRzhVo9wYE6llcv4DmHPdsAIto8dT3MietFoRwR+3jmQWV6gws+8fdRLnL5z+hxg5ivMuPHPA99Da2K0LGaQsv8skT/xQVLHJBWS2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CkbGnap4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CkbGnap4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727879391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nGhXOZDLOml2vBn28Pg+mtsa2Xa2kaEly+lfrGXZPr0=;
	b=CkbGnap4cR4Lxh5j5LLFS4gKowJE2EDYDcxw9V/EKP6Vh2mc6YrS039nm1H1oStCxP+n4H
	rSz+pBqpQv+L8Oqo1r+BbaJyfhH72GFx+coEbwlThBQ1vRS1E8m1rQLrC5m5lIuUCN68BQ
	OgZ1E/gsnveD/LbZddzrOAfhSq//b0w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-385-6UuKfUgFNY6WSzzaVS8AqA-1; Wed, 02 Oct 2024 10:29:50 -0400
X-MC-Unique: 6UuKfUgFNY6WSzzaVS8AqA-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-42cb115566eso67204605e9.2
        for <virtio-comment@lists.linux.dev>; Wed, 02 Oct 2024 07:29:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727879389; x=1728484189;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nGhXOZDLOml2vBn28Pg+mtsa2Xa2kaEly+lfrGXZPr0=;
        b=hWHKw1BVSsDPT/U+P4Psouyh4FMg6sXFXdIVWxhBd3d6Dm0E0+fNbtnCBX5eXSNIHs
         gqcfyUdIaM8Hn0oDCz79Wj/ktJAdvg0FmmmjyK6+0vy5lUrKf9RUkdTyzfX6f5nScs/m
         hm/S4H/HNK52gMc/vnK49JIJkybUby8JoOdYU0JS2cT9b7aAQpuRJ333NIUOOB2KV+hY
         dYW9CgV1t69/l8hxLRQd9RS7dWYh+deLXjcXdCiozFk0vKWYeIFR9gnF6Lu7K/zGYQa6
         oJYlyorxP+bAw2tCh8U9+Z3nb2cOfNG43x12dD/IeJpsVjNxEaNmWCsxvv9UQLIwDvSI
         mHNw==
X-Gm-Message-State: AOJu0YxHY3ZRJAFiEOLUBay/Gq1Uwo1z7GxOIP9U3TeGycFCUpqqWY8r
	6yurRpmEWQ0mkVYmUyfGDuNmAmn7okqqmBxd1pN1aXyUlUaQdnW5y78K8OEEVypyFA8JhGEvhw/
	/bu7e9i0KTUqEiSCXf9Bz3t9z6idIpocZsqlD+FebKRLWSpPD+GkhKMi7szdUkPpI
X-Received: by 2002:a05:600c:3b82:b0:42c:ba83:3f00 with SMTP id 5b1f17b1804b1-42f777b1f79mr34184705e9.1.1727879389207;
        Wed, 02 Oct 2024 07:29:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyuvl9R7ehYepdFbHMQ9nkQ36TscKMCGgDE+P8gdaJmhARklj32IDu94xtsDgJpx5GSDCdMg==
X-Received: by 2002:a05:600c:3b82:b0:42c:ba83:3f00 with SMTP id 5b1f17b1804b1-42f777b1f79mr34184455e9.1.1727879388769;
        Wed, 02 Oct 2024 07:29:48 -0700 (PDT)
Received: from [192.168.88.248] (146-241-47-72.dyn.eolo.it. [146.241.47.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f79c67c5csm20518325e9.0.2024.10.02.07.29.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2024 07:29:48 -0700 (PDT)
Message-ID: <4d9cb8bf-dbaf-4707-83fe-9b9dbc7d1e88@redhat.com>
Date: Wed, 2 Oct 2024 16:29:46 +0200
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/2] virtio-net: define UDP tunnel offload
To: Willem de Bruijn <willemb@google.com>, Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com,
 Eelco Chaudron <echaudro@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, kshankar@marvell.com
References: <cover.1725463935.git.pabeni@redhat.com>
 <CACGkMEsXhsTpZg2DP5BqUOodjR1HOTc-a-FuaCbxffZhpPj2aQ@mail.gmail.com>
 <45c88725-bacd-4999-919c-4191ea0cbdfc@redhat.com>
 <1ca3a523-87d1-4450-a0bb-980b1c8109c4@redhat.com>
 <CA+FuTSfdXbMsFqEDXRwoKZUwaRJLHi6H-BZjEF00-1bWqXvEdQ@mail.gmail.com>
 <891cebdd-a417-4d16-b01c-197bc0b5afdc@redhat.com>
 <CA+FuTSdTjtyjCJoZX4YHSeifL+BH=zD_ezLUL30=aqeJiDE+iw@mail.gmail.com>
 <d2c437a4-1e84-46c6-a51b-77e97ed8e15b@redhat.com>
 <CA+FuTSdPDb7gfrTEpDteqvvGkqZBD97mHudHHvf4ObhfAG+nBA@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CA+FuTSdPDb7gfrTEpDteqvvGkqZBD97mHudHHvf4ObhfAG+nBA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/2/24 14:29, Willem de Bruijn wrote:
> On Wed, Oct 2, 2024 at 4:35 AM Paolo Abeni <pabeni@redhat.com> wrote:
>>
>> On 10/1/24 21:15, Willem de Bruijn wrote:
>>> On Tue, Oct 1, 2024 at 10:02 AM Paolo Abeni <pabeni@redhat.com> wrote:
>>>> On 10/1/24 15:09, Willem de Bruijn wrote:
>>>>> On Mon, Sep 30, 2024 at 3:36 AM Paolo Abeni <pabeni@redhat.com> wrote:
>>>>>> On 9/9/24 10:05, Paolo Abeni wrote:
>>>>>> I'm wondering if we could revisit the spec change requiring that both
>>>>>> the driver and the device, for GSO over UDP tunnel packets only, will
>>>>>> fill the csum_start field when either the NEEDS_CSUM or the DATA_VALID
>>>>>> bits are set.
>>>>>
>>>>> This SGTM.
>>>>>
>>>>>> Equivalently, for GSO over UDP tunnel packets only, the
>>>>>> driver and the device, to specify CHECKSUM_UNNECESSARY packets, could
>>>>>> set both the NEEDS_CSUM and DATA_VALID, with the latter flag 'taking
>>>>>> precedence' WRT the actual checksum type.
>>>>>
>>>>> Why do both need to be set to signal CHECKSUM_UNNECESSARY, rather
>>>>> than only DATA_VALID?
>>>>
>>>> I think it's mostly a matter of preferences, and 'allowed delta' WRT to
>>>> the existing offload.
>>>>
>>>> AFAICS, technically the plain GSO spec don't mandate that NEEDS_CSUM and
>>>> DATA_VALID as mutually exclusive. Instead the spec require the
>>>> NEEDS_CSUM flag to use csum_* fields: the first option would create a
>>>> more significant difference WRT plain GSO.
>>>
>>> True. The existing API is very permissive.
>>>
>>> As you probably know, I'm strongly in favor of being more strict in
>>> new additions, to avoid allowing weird unexpected packets that we then
>>> have to detect and work around later.
>>>
>>>   From that PoV, explicitly specifying whether the bits are mutually
>>> exclusive or, if not, what having both sets means, would be great.
>>> Even if only for the new tunnel case, as we cannot do it
>>> retroactively.
>>
>> I must admit it's not clear to me if the above is a sort of endorsement
>> for both options, assuming each of them will be strict about the flags
>> definition.
>>
>> If even the 2nd option is ok, I would go with that, as
> 
> Here option 1 is "requiring that both the driver and the device, for
> GSO over UDP tunnel packets only, will fill the csum_start field when
> either the NEEDS_CSUM or the DATA_VALID bits are set."
> 
> And option 2 is "Equivalently, for GSO over UDP tunnel packets only,
> the driver and the device, to specify CHECKSUM_UNNECESSARY packets,
> could set both the NEEDS_CSUM and DATA_VALID, with the latter flag
> 'taking precedence' WRT the actual checksum type."
> 
> Right?

Yes!

> Option 1 intuitively is simpler to follow: for tunnel offload,
> csum_start must always be set.
> 
>> it sounds preferable to me for the mentioned reasons.
> 
> It's a bit unfortunate for implementation to dictate interface,
> especially if it makes it less straightforward. But if the
> implementation is significantly simpler with option 2, no strong
> objections from me. This is not a huge design point, either way.

Arguably the most relevant sell-point for option 2 is that it allows 
enforcing simpler/stricter checks in virtio net hdr parsing (if 
UDP_TUNNEL is set, NEEDS_CSUM and plain gso must be set, too).

Somewhat related: I just noted that the 'TX sides' of the spec (both in 
device->driver and in the driver -> device direction) is already strict 
WRT csum and gso dependency, but the corresponding 'RX sides' 
({device,driver}normative/Processing of Incoming Packets) lack 
completely any MUST NOT accept/MUST drop statement for bad/invalid inputs.

My understanding is that most/all of the trouble we have on virtio net 
hdr parsing and validation steam from such lack. I'm adding explicit 
'MUST NOT accept' statements for all the UDP-tunnel-related invalid 
flags/gso_type permutation I can think of.

@Jason: do you know if there is a specific reason for the mentioned lack 
  validation in the current specs?

Cheers,

Paolo

