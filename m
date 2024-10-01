Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5D61C461C
	for <virtio-comment@lists.linux.dev>; Tue,  1 Oct 2024 14:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727791375; cv=none; b=M723uQ8wHc5AL5PFmF1TvMBQscQcSKHWfODZDCh6a9p918mgv5qgQ+/UHHs2twyD1YupFm0ZNI89+77nNNLm1OJTn0IOHaV0BL6mLfB0UgE5dZOqLxiO+T/Jf0QV5TQawXuahl3hsSQ0thZSFTDLm0t+R+cTvdDVYJxTXzQucuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727791375; c=relaxed/simple;
	bh=60X7x8FieZzyDrCdbK4xX8jOh87Qun2vy0DNrJwZUbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qzl/FTqD9o9f2/6WUl7ncXJAW2Ib/mVb9X+8rmUf0yy20PR+ZgaQ+XDvf+TQA+vwa3aY1lcoNi7X/9YEFiNWFYcR0cWHFuepzGhcNNhZmzGwDs7CLIQB8NzmhPITGzzH033AYvQGzar4z01IDpVLliKUiyCjNa0anVK8SXpvGbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IQeSqR8g; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IQeSqR8g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727791372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6WnYUS+5AkXmU9UPnSX597ROpg7FKbUzz4D3dJoaq5Y=;
	b=IQeSqR8gmExK8ZHrIUIIK5I8D5kPO3awK4fIPFKNIRcI0MTif5phrgLZKc2ZbbLbX3yaw2
	RoM3jkR0zAeAVdPW2acs5gNozgE2A2PoU/4482hpBmoXzZOU2Cfuf/u9Vce5FrdDGJy/H3
	JkfeZn5ugg0zrJBNn99+i8NTFvULLVM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-cnvowC4jPNCcyZSRxElG7w-1; Tue, 01 Oct 2024 10:02:51 -0400
X-MC-Unique: cnvowC4jPNCcyZSRxElG7w-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-42cb830ea86so36720055e9.3
        for <virtio-comment@lists.linux.dev>; Tue, 01 Oct 2024 07:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727791369; x=1728396169;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6WnYUS+5AkXmU9UPnSX597ROpg7FKbUzz4D3dJoaq5Y=;
        b=W8qQzhjD/PFKY+xBqFbB7feXZuTwA3KaqoQEQs/Tr+9+i8tlYq/K95IFek9NM8JmwM
         H/OlmjSRHJOGxdk+VXio3SSpFbAi3S3DMwHDU8quQcMnTR2oVg4pOOg+i6aAnul4Cqwa
         KcxmYfCjqIh23GCpt2CzR4Vugz/H7wXmCN2c38LJ2a1nrwDoc5qIxaTcZrEH7QWJiARk
         jI5ei+xl6xaErMVYxAy+tF9LI2i8dMcnBmJA0bwgroAzvPVm/G5dB91NnEVO8V5CrTxV
         zprXblo/6GaT6GgYr+OcWq7LWFlws6bERFKy/dR0rCOch9wIzxHXvSkXnOfPZCLdXWOi
         482A==
X-Forwarded-Encrypted: i=1; AJvYcCX6dn4L3FbZ1+zXSsIufYAZI7+9jNhqrPvJUyl7JnYNEcaTam7CDKZDXdPyd/LiBtzVdxyFrSxRe9kBQfENuw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzLLyfLnhY3jj78jV7qyj8nXm33GtZwObvxGKIndzxDSLzMQEn/
	L880QoRRFrcMZCBuznuplU3W81Xh98Kt40tvQkTl9pXsbog0t9W3G60R5JII0DTG4HOXd9xYcx7
	R5y5v165kpPNnNrPmgtoGmzUieRXhacI6cvCKaEWci5nqivRniGqlL3hkpRDEkTrA
X-Received: by 2002:a05:600c:3ca6:b0:426:6710:223c with SMTP id 5b1f17b1804b1-42f584128f9mr110771705e9.9.1727791368895;
        Tue, 01 Oct 2024 07:02:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEo51soEjimKMpCJqGmn1S2+DoKtVSrfd/QwQzAy14IYqOhtkZuiJdhNLx2xE8bREIDtgIfCg==
X-Received: by 2002:a05:600c:3ca6:b0:426:6710:223c with SMTP id 5b1f17b1804b1-42f584128f9mr110770865e9.9.1727791368143;
        Tue, 01 Oct 2024 07:02:48 -0700 (PDT)
Received: from ?IPV6:2a0d:3341:b088:b810::f71? ([2a0d:3341:b088:b810::f71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f57de10e8sm133148445e9.13.2024.10.01.07.02.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 07:02:47 -0700 (PDT)
Message-ID: <891cebdd-a417-4d16-b01c-197bc0b5afdc@redhat.com>
Date: Tue, 1 Oct 2024 16:02:46 +0200
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/2] virtio-net: define UDP tunnel offload
To: Willem de Bruijn <willemb@google.com>
Cc: Jason Wang <jasowang@redhat.com>, virtio-comment@lists.linux.dev,
 maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, kshankar@marvell.com
References: <cover.1725463935.git.pabeni@redhat.com>
 <CACGkMEsXhsTpZg2DP5BqUOodjR1HOTc-a-FuaCbxffZhpPj2aQ@mail.gmail.com>
 <45c88725-bacd-4999-919c-4191ea0cbdfc@redhat.com>
 <1ca3a523-87d1-4450-a0bb-980b1c8109c4@redhat.com>
 <CA+FuTSfdXbMsFqEDXRwoKZUwaRJLHi6H-BZjEF00-1bWqXvEdQ@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CA+FuTSfdXbMsFqEDXRwoKZUwaRJLHi6H-BZjEF00-1bWqXvEdQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/1/24 15:09, Willem de Bruijn wrote:
> On Mon, Sep 30, 2024 at 3:36 AM Paolo Abeni <pabeni@redhat.com> wrote:
>> On 9/9/24 10:05, Paolo Abeni wrote:
>>> On 9/9/24 05:16, Jason Wang wrote:
>>>> On Wed, Sep 4, 2024 at 11:50 PM Paolo Abeni <pabeni@redhat.com> wrote:
>>>>>
>>>>> UDP tunnel usage is ubiquitous in container deployment, and the ability
>>>>> to offload UDP encapsulated GSO traffic impacts greatly the performances
>>>>> and the CPU utilization of such use cases.
>>>>>
>>>>> This series introduces separate features to handle both UDP tunnel
>>>>> segmentation offload (patch 1) and UDP tunnel outer checksum offload
>>>>> (patch 2).
>>>>
>>>> Looks good to me.
>>>>
>>>> And I wonder if there's a link to the prototype code so I can have a
>>>> double check.
>>>
>>> I still have to refresh the code from first implementation - that was
>>> the base for the first draft here some time ago.
>>>
>>> In the next 2 weeks I'll be traveling and/or AFK, I hope I can share the
>>> code a little after that.
>>
>> A very early PoC is available here:
>>
>> https://github.com/pabeni/linux-devel/commits/virtio_tunnel_gso/
>>
>> It's very lightly tested vs a patched user-space:
>>
>> https://github.com/pabeni/qemu/commits/virtio_tunnel/
>>
>> "very lightly" is actually a strong understatement; the thing survived a
>> single iperf-over-udp-tunnel run, and that is. However I hope it should
>> suffice as showcase.
>>
>> In the tun/user-space interface I used a separate ioctl to configure the
>> tunnel offload instead of re-using the existing ioctl for plain GSO,
>> because AFAICS the tun driver is currently unaware of the complete
>> virtio net hdr layout (e.g. ignores rx hash and VIRTIO_NET_F_MRG_RXBUF)
>> and it is just notified of the total hdr struct size.
>>
>> With UDP tunnel offload enabled, the tun driver need to know the tunnel
>> fields offset inside the virtio net hdr. Piggybacking such info inside
>> the the current ioctl(TUNSETOFFLOAD) data (a single long int) is
>> feasible but looks hackish. Instead I preferred implementing a separate
>> ioctl(TUNSETTNLOFFLOAD) receiving as input from user-space a struct
>> containing the mentioned offset and the "csum offload enabled" flag
>>
>> Any comments/suggestion WRT such interface more than welcome!
>>
>> The PoC demonstrated that the pending spec changes need some fixlet:
>>
>> - I wrote the patch on top of the current virtio-spec master branch, I
>> need to rebase on top of virtio-1.4, I guess.
>>
>> - I underlooked to the VIRTIO_NET_HDR_F_DATA_VALID flag. The
>> specification change allows GSO over UDP tunnel offload with DATA_VALID,
>> but GSO over UDP tunnel needs the inner transport protocol information.
>> This point looks more difficult and potentially controversial.
>>
>> With the proposed change, when DATA_VALID is set, the implementation
>> will have to determine the inner transport header location via parsing,
>> as currently is doing for plain GSO. Note that the PoC is currently
>> bugged WRT this scenario.
>>
>> I'm wondering if we could revisit the spec change requiring that both
>> the driver and the device, for GSO over UDP tunnel packets only, will
>> fill the csum_start field when either the NEEDS_CSUM or the DATA_VALID
>> bits are set.
> 
> This SGTM.
> 
>> Equivalently, for GSO over UDP tunnel packets only, the
>> driver and the device, to specify CHECKSUM_UNNECESSARY packets, could
>> set both the NEEDS_CSUM and DATA_VALID, with the latter flag 'taking
>> precedence' WRT the actual checksum type.
> 
> Why do both need to be set to signal CHECKSUM_UNNECESSARY, rather
> than only DATA_VALID?

I think it's mostly a matter of preferences, and 'allowed delta' WRT to 
the existing offload.

AFAICS, technically the plain GSO spec don't mandate that NEEDS_CSUM and 
DATA_VALID as mutually exclusive. Instead the spec require the 
NEEDS_CSUM flag to use csum_* fields: the first option would create a 
more significant difference WRT plain GSO.

 From an implementation PoV, the 2nd option (both NEEDS_CSUM and 
NEEDS_CSUM) would allow for simpler integration/reuse of the existing 
code: the UDP tunnel GSO 'to_skb()' helper could directly call the plain 
GSO one and eventually later just set CHECKSUM_UNNECESSARY as needed.

Thanks for the feedback,

Paolo

