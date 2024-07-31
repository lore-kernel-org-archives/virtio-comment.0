Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41EA1CF93
	for <virtio-comment@lists.linux.dev>; Wed, 31 Jul 2024 09:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722416570; cv=none; b=bC8LbJUxqvuNEdmnjUPV/JHcNwMg16Y1mfQVD0UhcNtTUtvi+FK/pi6Hxp+66OvTLu9pMC//FyxBcA64V6wz7dcAP6v1i/0JH35roEhuWGDS53uL69R4JG4vcJcvLHVslguhJYi5rVkm2ex5Jfa7HDOo1GUVZW10P87oJ4N4RNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722416570; c=relaxed/simple;
	bh=5S2GywNRgKRy6fonRB+n+nWudo67vhXge2mNSXDGRzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tgfyndQF6Kglrg9ZU4F7WC9kqzjxXyHdfdRIe3u+q1V4x5FDsammW7HoaQvAU+d8exDXFN4YIhOrpsBDbTEDjGR8SbRN+DJV32L3W0dAWrNyE3ZXzZx8qDbJIqjbOx8z37JNIx/2AdilVZrMKnTRzknvoxO0ydYrJxJHUf0SvaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XT8WgX69; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XT8WgX69"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722416567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MCQ9o3c83+QPBFoSxZykseQ5mtKA9nkDekRXbVqYpJs=;
	b=XT8WgX69qAYzDky7ypCRVIC1PbvwCppAu3M5tiy9WV4iv5S4G3rnif3K4h2Pcdbbn84yyH
	vN8Swz4sq2px89ueQesORlshN1XhLZSYm0+/JtXAkngN0IJhEVtRlVz7pjc2GdkqlwhMrp
	ZaLwnJYeIkBJSUDLp8Q/VzzPLeZlw1w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-244-7nGO0_9AMz28WcTg4TsHPg-1; Wed, 31 Jul 2024 05:02:46 -0400
X-MC-Unique: 7nGO0_9AMz28WcTg4TsHPg-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4210e98f8d7so6681365e9.3
        for <virtio-comment@lists.linux.dev>; Wed, 31 Jul 2024 02:02:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722416565; x=1723021365;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MCQ9o3c83+QPBFoSxZykseQ5mtKA9nkDekRXbVqYpJs=;
        b=YuyKq3OoLK2yhngo8hZRpFdPHnxbMQvKqyOyxXqTxZZP4P3q++pSeVxyIsMW8E5HKb
         NG4s+5eJQBNmd910/+unFfM5Db6y+9se7BHnuQBiiUkzqEzA0ZTpGjyWIbxLA17DXS/p
         nnWfjJJmVzihpClxOEiIMgNDISwufoxna/kLkHleiEcN3AxhMtGKhFXTLZTKrx8KaLNb
         qFa35SxXumW0rLVcq+PAZ7jsJ3JbTBaB+L3hyUTwWKPEWa1bNRxBu9O5urt2uhz2bxNs
         u+DYSt8u54Ebj2WQ/sTv2J1V197P4dhOO+w06diUehcSFyEJsLo48MIeKxm78LpCPata
         C35g==
X-Forwarded-Encrypted: i=1; AJvYcCUSOiMpCENJfaVv/ZCRBtj3jy6mp5g/eQ6L6dToBhug6Sc0wzUY1ioHRfT+7CdmmRK98HlwG/I3up4yWx6JAjpm5Wsn5jZp4kFJA5FUIHg=
X-Gm-Message-State: AOJu0Yzinx08dbDPJ14izNW8ne/XLFgUGexEoYpeLalYLhhiYNX5f4KX
	lkRpElaYMSuT70ovLkca5/cPn8nL7Qgl/tjRJHMMMyDY2gPsiL+NkVOKVTs1yCwTJPUdAHQSklM
	ZQ/onoyUszBDSHweetbfckcmEL5wsIvXNYiDqCYup5JE3lwmsptqjjIKYacn+Zk4D
X-Received: by 2002:a05:600c:1f85:b0:426:6358:7c5d with SMTP id 5b1f17b1804b1-4280550cf89mr87778155e9.4.1722416564996;
        Wed, 31 Jul 2024 02:02:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsSNb+t1DZcA/mPMFKvW8ud8jiZNsDvvuvykqKS6g0X5ySI/swY8WbbOiXIDosTJpCrvgBqQ==
X-Received: by 2002:a05:600c:1f85:b0:426:6358:7c5d with SMTP id 5b1f17b1804b1-4280550cf89mr87777945e9.4.1722416564478;
        Wed, 31 Jul 2024 02:02:44 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:1712:4410::f71? ([2a0d:3344:1712:4410::f71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282b8ad9ddsm13883025e9.17.2024.07.31.02.02.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 02:02:43 -0700 (PDT)
Message-ID: <db018dea-d186-40e7-88e6-e493fa3c24ab@redhat.com>
Date: Wed, 31 Jul 2024 11:02:42 +0200
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] virtio-net: define UDP tunnel segmentation offload
 feature
To: Jason Wang <jasowang@redhat.com>
Cc: Willem de Bruijn <willemb@google.com>, virtio-comment@lists.linux.dev,
 maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
References: <cover.1722252302.git.pabeni@redhat.com>
 <2977107dcc842c0665227f7c3696157ecd15a1b2.1722252302.git.pabeni@redhat.com>
 <CA+FuTSfu8Sys_s+3jpXoS0GbZC4stOVgBrEYOtA9YoTCEJkJAA@mail.gmail.com>
 <d79c4ed9-c1d5-4c9c-9f10-661745edf96c@redhat.com>
 <CACGkMEu6dnKOgYVYRWKadXirnk4R6Rc16ojNR=oSX-a22Rt4OA@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CACGkMEu6dnKOgYVYRWKadXirnk4R6Rc16ojNR=oSX-a22Rt4OA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/31/24 06:10, Jason Wang wrote:
> On Tue, Jul 30, 2024 at 3:33 PM Paolo Abeni <pabeni@redhat.com> wrote:
>> On 7/29/24 23:04, Willem de Bruijn wrote:
>>>> @@ -423,6 +441,9 @@ \subsection{Device Operation}\label{sec:Device Types / Network Device / Device O
>>>>            le32 hash_value;        (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
>>>>            le16 hash_report;       (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
>>>>            le16 padding_reserved;  (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
>>>> +        le16 outer_th_offset    (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO negotiated)
>>>> +        le16 inner_protocol_type;(Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO negotiated)
>>>> +        le16 inner_nh_offset;   (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO negotiated)
>>>>    };

[...]

>> If we would have VIRTIO_NET_HDR_GSO_UDPv4_L4 and
>> VIRTIO_NET_HDR_GSO_UDPv6_L4 variants, we could avoid entirely
>> 'inner_protocol_type', as the network protocol will be implied by the
>> GSO type itself.
> 
> I may miss something, but can it be done by just introducing a new
> gso_type without vnet header extension?

Yep, that is what I mean above: we could replace the
'inner_protocol_type' field - which carries a single bit information, 
inner ipv4 vs ipv6 - with some (inner) GSO-type related info.

Unfortunately that last step does not look 110% 'clean' to me, as the 
inner GSO type is already specified by VIRTIO_NET_HDR_GSO_TCPV4, 
VIRTIO_NET_HDR_GSO_TCPV6 or
VIRTIO_NET_HDR_GSO_UDP_L4. In case of inner TCP, the inner network 
protocol is already specified, but it's not in case of UDP.

I'm wondering: why the single VIRTIO_NET_HDR_GSO_UDP_L4 value has been 
preferred to a pair of ipv4/ipv6 variants? Could we add such variants 
now? Note that I would like such option very much, as it will make this 
change even more complex, but looks IMHO quite clean.

Otherwise another option would be to allocate another bit in the GSO 
type field, set such field when VIRTIO_NET_HDR_GSO_UDP_TUNNEL is set, 
too, and use such field specify the inner header network protocol. I 
don't like much even this option because the new bit will carry 
duplicate information in case of TCP, and it's implementation looks bug 
prone.

I don't see other options, any suggestions/preferences welcome!

Thanks,

Paolo





> 
>>
>>>> +\item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feature,
>>>> +  the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit in \field{gso_type} indicates that
>>>> +  the GSO protocol is encapsulated in a UDP tunnel.
>>>> +  The outer UDP header must not require checksumming, e.g. the outer UDP checksum
>>>> +  must be zero.
>>>
>>> nit: "e.g." should be "i.e.," here
>>>
>>> and maybe must be a positive zero (0x0) checksum as defined in UDP RFC 768.
>>>
>>>> +If the bit VIRTIO_NET_HDR_GSO_UDP_TUNNEL in \field{gso_type} is set, the outer
>>>> +UDP header MUST NOT require checksumming. That is the, the outer UDP checksum
>>>> +value must be 0, or the valid complete checksum for such header.
>>>
>>> MUST NOT require checksum validation. [..] or the validated complete checksum
>>
>> Ack to all the above.
>>
>> Thanks!
>>
>> Paolo
>>
> 
> Thanks
> 

