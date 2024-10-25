Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4E970803
	for <virtio-comment@lists.linux.dev>; Fri, 25 Oct 2024 14:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729866968; cv=none; b=szK/XEoiXxWn8azyZFSreGNn/8WYNxNGduuoP6z0bUfHPlndZmvDOZETs7xOZYvxNaiFCaXWF5jZ/BM2cjUMo9IHv4L6msYpq6/V521xBMC3fSLcGGJLowkc/xoqEJLD9PNT8kqNCVAMRvl+AaPD6OBQJDM+QiiT2+iY+HJpNKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729866968; c=relaxed/simple;
	bh=IeiDBWoeWY7PyQd7uELv8viyIdlJ2jN4ubPf3ieetMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J2c9AoO/7mzAvvbHHR17JlIQoOfdHtcOAB8meVuo1s2++Tq/SOfKdjsJwkFmQ1X10pRP64lEXuhDZfMlk0rU/bV/5UDGfCWVsiW2HchLHpn4H2OvfoNWd46/Y5v5bY/l5Ws7ow0RNhhMgljk06eNzW3fThdnQoUZBHQr3XKKSUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dA84gYti; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dA84gYti"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729866964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V4MzPuZN07ShJNG3GZvpnXPu00If80VYMWxXBMbZOYw=;
	b=dA84gYtiC+ushjapMwYmEyNghXpFFEct/kAS578Dy4uITfuJ6aIHMqXjeFkjhuqxIAMyed
	OeR6Txadv5eGZz9nrBy88FclsuMoyc/kXDoehQ+sUvq6L+03fHkorhiNBoAs2BkSgTfhAq
	C0YHofS7qWXG2NSoDi87a6ims9fAW6E=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-4lY0pyo_Maet8yawHZb-YA-1; Fri, 25 Oct 2024 10:36:03 -0400
X-MC-Unique: 4lY0pyo_Maet8yawHZb-YA-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-431673032e6so14594575e9.0
        for <virtio-comment@lists.linux.dev>; Fri, 25 Oct 2024 07:36:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729866961; x=1730471761;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V4MzPuZN07ShJNG3GZvpnXPu00If80VYMWxXBMbZOYw=;
        b=HqrqjQTu+W3RJNec2CFMMCAPZixwFQBEtvg+WOcKYqxdcdVKp+p8YU+6JiOzpgatUw
         buXMWPLYSDiK48lAZbtGla7O48ifaOcM9SiOd0WTe+ciLRYtopCyzLxmW/SmeKNX9RKp
         K8YN72Ktehj9r4i/urLvn7H0AVVP6nWGwghsEt2zEBPxTn7VYwH34PEpDmD9B4lpqyKG
         5JPme5ygFEZjT7r877fN1ufiKO6oCQTPn2rTvMV3pqc6E3S8dB4wNPqeL7z38FXLTGuL
         vuVs90lAm1q+bDfEZ9EIPS89eYfN2vT+Y0d9JDsTnvVXoiORymwfmS2Y2twKXsKvLP1y
         FgRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvTgzkrF/kaj2bLMjBuwiaNXPaQRwBCKj9E09eRo3kWHp1AfBHepb+AQNMo892C2jIQia7ZnfSA8fzGS3aNg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwZDvCuQdQZvdjwQryp/BfFvYuG+ck9fYQbsdfBjPEpfWILDfpf
	7WUt36FWG7YVIDY01SFnk1Pz0awwT8iWVafSYB/nac85KUG8vDH4zsRvzGjwKy6xf6SHzBG0Sij
	C22yLCKLnyEky7pKxmpC5EbfIKSFUValuGL8xV36egj1uk2ZmnEZjQmecBII5HwEqjGnx6i+jYp
	4=
X-Received: by 2002:a05:600c:1c01:b0:431:680e:95ff with SMTP id 5b1f17b1804b1-4318413e475mr82690795e9.9.1729866961250;
        Fri, 25 Oct 2024 07:36:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG37ttxRcdWB3kzreN37uP3GGWi0PRt26IoHeDdAGRB3r//iFMVnZXtkc+gJxqv4Rfbl7btWw==
X-Received: by 2002:a05:600c:1c01:b0:431:680e:95ff with SMTP id 5b1f17b1804b1-4318413e475mr82690515e9.9.1729866960807;
        Fri, 25 Oct 2024 07:36:00 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:1b73:a910::f71? ([2a0d:3344:1b73:a910::f71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b56ef06sm49819265e9.30.2024.10.25.07.35.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 07:36:00 -0700 (PDT)
Message-ID: <19647957-c747-4a63-8bce-1f381e0faae4@redhat.com>
Date: Fri, 25 Oct 2024 16:35:58 +0200
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/2] virtio-net: define UDP tunnel segmentation offload
 feature
To: Willem de Bruijn <willemb@google.com>
Cc: Jason Wang <jasowang@redhat.com>, virtio-comment@lists.linux.dev,
 maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, kshankar@marvell.com
References: <cover.1728029499.git.pabeni@redhat.com>
 <CACGkMEvrowr6CwF+=RiR+f3EagdKB=rzyCPCQcUdXee4a5MaZA@mail.gmail.com>
 <2b90c368-b514-4077-a6bf-43da075af4fc@redhat.com>
 <CACGkMEu5GWZrYVRN==F=vrRQQGnxj_WqX86YZ+diqC3s3m2m_A@mail.gmail.com>
 <10bc51b2-efbe-4f33-a1b3-827de4d0cd10@redhat.com>
 <CACGkMEuhJXMd0hGopyehESO1eNVRXVX+FaF7m8f6Y9yWCzoESA@mail.gmail.com>
 <44be2d9c-5624-4419-8e9c-e5302a5f6b2f@redhat.com>
 <CACGkMEsgJT1c93RZur20fUyjtxSX6dMPePEJvzbmNWpAHd92Mg@mail.gmail.com>
 <3e3d6984-65d3-46b0-aaa3-e6591123f95a@redhat.com>
 <CACGkMEsiRJ2zAcys0iFQkiL0h9MY-LOE4=LP7s4ksN=T+HY_Xw@mail.gmail.com>
 <7f40f3da-aa6e-437c-af73-97e44e1982d1@redhat.com>
 <CACGkMEu-83JEcs73R4Eym2tkcUT5Zsj7i2qOsB-9ivmLNf0b5g@mail.gmail.com>
 <5da197a8-a022-4c2d-a4ae-09e0948e620e@redhat.com>
 <CACGkMEu-AQea98e5xqj4Vfo4zog_nzeJQ_pLADAOY9ZogsS8AQ@mail.gmail.com>
 <a6ad7c40-d65d-4b95-a7ae-86d77eda4bdf@redhat.com>
 <CA+FuTScZXfqm+Y=i6MY4QFCwZnoBg4EG4jZktvX9Y5G5FeoRHg@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CA+FuTScZXfqm+Y=i6MY4QFCwZnoBg4EG4jZktvX9Y5G5FeoRHg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/25/24 15:28, Willem de Bruijn wrote:
> On Fri, Oct 25, 2024 at 7:50 AM Paolo Abeni <pabeni@redhat.com> wrote:
>>
>> On 10/25/24 10:28, Jason Wang wrote:
>>> On Wed, Oct 23, 2024 at 12:56 AM Paolo Abeni <pabeni@redhat.com> wrote:
>>>> I proposed the following:
>>>>
>>>> For GSO over UDP tunnel VIRTIO_NET_HDR_F_DATA_VALID is allowed if and
>>>> only even  VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM is set in flags.
>>>>
>>>> That means that the device supports csum offload for both the inner and
>>>> the outer and both csums are valid. The corresponding skb will have
>>>> CHECKSUM_UNNECESSARY and csum_level == 1.
>>>
>>> Nit: csum_level seems to be Linux specific.
>>
>> Note: the above was an informal description of the proposal, not the
>> actual wording to be used in the spec.
>>
>>>> There is actually another point which I'm quite scared to mention
>>>> because it caused v9 and implicitly all this discussion.
>>>>
>>>> I want to prevent the driver receiving from the device GSO over UDP
>>>> tunnel packets without csum_start/csum_offset, because the header
>>>> probing code looks fragile and bug-prone and will be even more complex
>>>> in case of tunnels.
>>>
>>> This needs more thought. For example, it seems not specific to GSO.
>>> Should we have a new feature for this? (And build a GSO UDP tunnel on
>>> top?)
>>
>> Double checking I read the above correctly.
>>
>> Do you mean something alike the following to negotiated another feature
>> controlling a new bit in flag telling 'the csum_start field is set even
>> if NEEDS_CSUM is not set'?
>>
>> What about using the flag already defined in patch 2 instead (currently
>> named VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM, possibly a different better name
>> can be used [suggestion more than welcome])?
>>
>> The overall schema will be:
>>
>> - DATA_VALID retains its current semantic when GSO over UDP features are
>> not negotiated and when VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM is not set
>>
>> - when VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM is set that means the following:
>>   - 2 checksums are offloaded - the 2 outer-most one in case the packet
>> carries more nested headers.
> 
> Is this on transmit, receive or both. Can we be very explicit in all cases?

This is for both device->driver and driver->device directions.

>>   and
>>   - 'csum_start' points to the innermost offloaded header
>>
>> - DATA_VALID can be set together with VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM,
>>   meaning:
>>   - CHECKSUM_UNNECESSARY with csum_level == 1,
>>   and
>>   - csum_start -> inner transport offset. If the packet carries many
>> nested headers csum_start points to the 2nd outermost one.
> 
> Given LCO, is there ever a compelling reason to support offload of more than the
> inner checksum?

The end goal here is to support VM doing/receiving tunneled traffic.

With the above proposal device H/W GRO is straight-forward - likely
existing nics could support hit with some formware update.

Even with devices not supporting H/W GRO, it's beneficial. Currently GRO
for UDP tunneled CHECKSUM_UNNECESSARY traffic requires csum_level == 1
(or zero outer csum). This allows the VM to perform GRO for UDP tunneled
traffic out of the virtio_net device.

I guess the relevant GRO code could be refactored to lift the mentioned
requirement and instead leveraging LCO, but we will need to look at the
inner header before tacking the decision of attempting the aggregation.
Without any code written yet (here), such refactor looks weird/the
current implementation feels preferable and simpler.

> And iff there is, can csum_start imply the innermost offloaded header, such
> that all checksums preceding it have been verified, rather than hardcoding
> this as exactly 2?

Uhm... I guess it could be doable with an additional field (carrying the
csum_valid value), but why should be useful? multiple nested tunnels
can't be GRO aggregated (s/w), not H/W GRO aggregated.

Note that the thing discussed here:

https://netdev.bots.linux.dev/netconf/2024/paolo.pdf

in all its variant, basically tricks multiple nested tunnel in a single one.

Given that reaching agreement has proven to be complex, I would avoid
adding additional complexity without a very strong reason.

Thanks,

Paolo

