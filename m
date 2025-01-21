Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2265E1DA0F1
	for <virtio-comment@lists.linux.dev>; Tue, 21 Jan 2025 18:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737484817; cv=none; b=MzOMs8aHiFPNIgyHFkxLTiSb1tbyxpRYQTy5OMbqTvkwDznLE1VZoS/+sNL0PsrT5LdeviXbdC/le4fE8hmVO3tYsbTkAQmNZjoGHG4d+Gm0vErquMPWl9TH4rcT2Foop7F6cU6yCVe3WdgddZfHfX8r4tU0rmDBKesa6GzZ1Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737484817; c=relaxed/simple;
	bh=8Umang14I7w0jp2PqrEwDlbEAHriPisQwsq59SotV2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NeWCMTPJfq8TYBZH+wvfPs8mp1EQ33BABuQzxqzr6a0gUpJoGK3PdxpDAZ0vtLQS0tr77YzydzuSSVYxL5ajRZKtJ38luq/na4LOtdQzRQUN6ha2wUxEgTfizKBWx74+na13Xk4HxnnI8fNVkFKV9cnufbTZGLR3iouLQ9uYHVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KYehTiiY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KYehTiiY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737484812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KzHwbVHS9mpuvTDOMyy86/45WL96UUv9P3u7nPEGq7I=;
	b=KYehTiiY1VyPrZLsoqRpHKvrPTGAFw5pAMkmNhXi8tAnHsAe7CKQyzkzH0ti0rPdky8242
	UhiLyJmvRJGq72ugjaNXvmAF6v2U+Cf4P1WbHBvdowv9e8ZWjntGtBB6MTIC40FSajS5ge
	kYYqIAL7RT7hbibV/Z8kiGdone2x3jo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-27-dPPd2lDCNqO9mXVHiIC_LA-1; Tue, 21 Jan 2025 13:40:11 -0500
X-MC-Unique: dPPd2lDCNqO9mXVHiIC_LA-1
X-Mimecast-MFC-AGG-ID: dPPd2lDCNqO9mXVHiIC_LA
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-38639b4f19cso4208861f8f.0
        for <virtio-comment@lists.linux.dev>; Tue, 21 Jan 2025 10:40:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737484810; x=1738089610;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KzHwbVHS9mpuvTDOMyy86/45WL96UUv9P3u7nPEGq7I=;
        b=AmwLGIhBSWO24equhhPTLR1odWy84aKjMaVuUUZOnHqMx/Fm85Pv9ALFeRXK3na3wR
         ukJ57f+NDqZLJJ5FBCxPEliB6kMLIYnTI6IkmAiJtvcaIm1YeFe9cUjxDZar0/PuOsCZ
         Z000txlxkPPQgPKjo8aVXIr0vQOFJb+zZZ6Pm0B7pfrewMNeTm9JW2cVWEO6+9DXRobT
         63XpYTuATUzzMn5c/gBB9uwBwHxqAh93BVCea9aCshJ7Rgld5qauYflV4VajATIeF8kg
         lKiu6keM05dKWcUx8YMg7FV3MmytB70Q3OW32wUVlsDrIiMEl5ljFZxxOMAL6cYgef8/
         kcNg==
X-Forwarded-Encrypted: i=1; AJvYcCU/RtiP38J39aRZdnwuhwtgSs54WkJjRDUK2PQ/Te6+G/+8Eqlwannf9QyAucGyEs72NZ04IcxhFfJb6C03pg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwxVuSXElxT/oxPazeKReqyxkQ6X67Qv7n/6k3C+6wVOTkJJrkX
	rSPGalhhwEyWYCp4Oq2pOILla/8T7Iklzzw+aEAVgDo6djvBJ4nCwFR4+6TdFu9MTN8BiiWR/lo
	jMqf1uLT1NswW7R72z8Xo1AX08JUWo8cUo0G6mhg/4JT7em1gAc+mzAuDbYrQ8b2b
X-Gm-Gg: ASbGnct46IoXu3pfDA/8dKQheby93NXqMaD/6CtTtZLKC3ncc4t5DArPlpXDgxdFIGY
	cxFg0WYWfbqFT8eUQuWi1K3jwMLWFFS4aBu0Nrs0vLc975TKvalizoVcz/PDwXQqpCYk5XnsXLI
	UpuBLmma0Rv5u6wKC/XWBWqun+bdLGL8z7UkXYqN9rBgPVJmyO0rctR2FZhDcHdGtPD3D74gjLr
	HxVlQtAYl98NbFLEgyde7ckwjn0kU2ZMNq1xXQGnKezt8DDrbl8mXPjcXFVyabfrWato9FRiR2S
	nZjoSSPjgCHFSjdXkif/BNqb
X-Received: by 2002:a05:6000:4011:b0:38a:4184:152a with SMTP id ffacd0b85a97d-38bf5669eb5mr19819513f8f.28.1737484810304;
        Tue, 21 Jan 2025 10:40:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVmwgyWvu1hFej953gCgTrbVkjw9Ibd3VR16W5zxNIYbXZuFM3BerD6Zv7XBWP/zTpQTyFfg==
X-Received: by 2002:a05:6000:4011:b0:38a:4184:152a with SMTP id ffacd0b85a97d-38bf5669eb5mr19819497f8f.28.1737484809938;
        Tue, 21 Jan 2025 10:40:09 -0800 (PST)
Received: from [192.168.88.253] (146-241-15-169.dyn.eolo.it. [146.241.15.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf327ded8sm13916433f8f.89.2025.01.21.10.40.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 10:40:09 -0800 (PST)
Message-ID: <2d27f420-d155-4aad-9626-8b42acc0cc22@redhat.com>
Date: Tue, 21 Jan 2025 19:40:08 +0100
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/4] virtio-net: define UDP tunnel segmentation
 offload feature
To: Parav Pandit <parav@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Cc: "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 Eelco Chaudron <echaudro@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Willem de Bruijn <willemb@google.com>,
 "kshankar@marvell.com" <kshankar@marvell.com>
References: <cover.1732699986.git.pabeni@redhat.com>
 <3e1c45071c8cf4efc7ca0ecc7b52a73c6bf983fe.1732699986.git.pabeni@redhat.com>
 <CY8PR12MB7195D914B9EF00FF62C5E1DFDCE42@CY8PR12MB7195.namprd12.prod.outlook.com>
 <87ldv597rl.fsf@redhat.com>
 <CY8PR12MB719550ABC66CDDF8D71E2F7DDCE72@CY8PR12MB7195.namprd12.prod.outlook.com>
 <87ikq98yod.fsf@redhat.com>
 <PH8PR12MB7208F319B0C0380FAD5DA45DDCE72@PH8PR12MB7208.namprd12.prod.outlook.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <PH8PR12MB7208F319B0C0380FAD5DA45DDCE72@PH8PR12MB7208.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Dhdx2kCjYYP8_W5nVPuTIT630d7skNvnFxrb18yLsCU_1737484810
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/20/25 3:19 PM, Parav Pandit wrote:
> 
>> From: Cornelia Huck <cohuck@redhat.com>
>> Sent: Monday, January 20, 2025 5:50 PM
>>
>> On Mon, Jan 20 2025, Parav Pandit <parav@nvidia.com> wrote:
>>
>>>> From: Cornelia Huck <cohuck@redhat.com>
>>>> Sent: Monday, January 20, 2025 2:34 PM
>>>>
>>>> On Sun, Jan 19 2025, Parav Pandit <parav@nvidia.com> wrote:
>>>>
>>>>> Hi Paolo, Michael,
>>>>>
>>>>>> From: Paolo Abeni <pabeni@redhat.com>
>>>>>> Sent: Wednesday, November 27, 2024 3:07 PM
>>>>>>
>>>>>>
>>>>>> +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO (46)] Driver can
>> receive
>>>>>> GSO
>>>>>> +packets
>>>>>> +  carried by a UDP tunnel.
>>>>>> +
>>>>>> +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO (48)] Device can
>> receive
>>>>>> GSO
>>>>>> +packets
>>>>>> +  carried by a UDP tunnel.
>>>>>
>>>>> Feature bits 42 to 49 are not applicable to device specific type.
>>>>> They are
>>>> reserved.
>>>>> Please see the note.
>>>>>
>>>>> Current spec description is:
>>>>>
>>>>> 0 to 23, and 50 to 127 Feature bits for the specific device type
>>>>> 24 to 41 Feature bits reserved for extensions to the queue and
>>>>> feature negotiation mechanisms, see 6
>>>>> 42 to 49, and 128 and above Feature bits reserved for future extensions.
>>>>>
>>>>> So 2 bits of these patch and of patch 4, 46 to 49 to be shifted to
>>>>> bits 65 to
>>>> 68.
>>>>>
>>>>> Or an alternative would be to amend,
>>>>>
>>>>> Bits 46 to 127 for specific device type, And 42 to 45 and 128
>>>>> reserved for future extensions.
>>>>>
>>>>> Michael,
>>>>> Please let me know so that I can have the follow up patch to this
>>>>> one as
>>>> voting is started.
>>>>> And the fix is required for it.
>>>>>
>>>>> Is there any historic reason for 42-49 as reserved, or it can be
>>>>> used as
>>>> proposed in this patch?
>>>>> If it was only kept as elastic buffer for device generic, and
>>>>> device type to
>>>> grow it is probably ok.
>>>>> Using 46 to 49 has small advantage to reuse in the offloads bit as below.
>>>>> Please confirm.
>>>>
>>>> See the reasoning given in 88895f56e642 ("Reserve more feature bits
>>>> for device type usage") -- the idea was to push out the point in time
>>>> when generic feature bits will have to be in the bit area beyond 63.
>>>> Given that we only used one of those generic bits in the meantime, I
>>>> assume it will still be some time before we run out of bits, even if
>>>> we let the net driver grab some bits there. Still, I'd probably prefer that the
>> net device used different bits.
>>>> [And issues like this are easy to miss during review unfortunately.]
>>>>
>>> I made assumption that one would have picked the device specific rage.
>>> I missed to detect this early enough, my bad. :(
>>>
>>> Given that we are only left with 4 bits in range 42 to 45, at generic level, it
>> seems wise for device-type to consume feature bits in its defined range.
>>> For virtio-net, bits 65 and higher are preferred.
>>>
>>>> However, if the device was to use different bits, the clean solution
>>>> would be to withdraw, respin, and revote. If we only changed the
>>>> reserved ranges, we'd be fine with a change on top, so that would be
>>>> less hassle in the short team. If we decide that we can live with the
>>>> smaller feature bit space below 63, I'd be fine with that solution.
>>>>
>>>
>>> I am fine either way to merge this and fix immediately for using bits 65 and
>> higher.
>>> My preference is to use bits 65 and higher.
>>>
>>> Or as you suggested to respin and revote right away to forward with bit 65.
>>>
>>> Please let me know.
>>
>> Personally, I'd prefer to handle this in an "atomic" manner, i.e. making sure
>> that no version ever has the wrong bit numbers... maybe if you did a fixup
>> patch that changes the numbers, and commit these patches + the fixup all at
>> once? Less churn than doing the respin and revote dance.
>>
> Here it is.
> https://lore.kernel.org/virtio-comment/20250120141052.877355-1-parav@nvidia.com/T/#u
> 
> Do we need to open a new voting request for it? yes?

I'm sorry for the latency.

Please be aware that VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO and
VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM values are reported a 2nd time in
the "Offloads State Configuration" paragraph. I guess even such chunk
will need patching.

/P

