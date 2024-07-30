Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E49E13B780
	for <virtio-comment@lists.linux.dev>; Tue, 30 Jul 2024 07:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722324831; cv=none; b=SOAeYjqapZ9zloWLatrKqaCrGPXw4tXrC9plWws33tWq6+Zl1aQm2p5nIOiaqAW87q6S7R3pwcwjhZZCIRiE+efEaujf9dq8kZz/R48c2n/Rg9trYuPm/aTfklRvPOr2DJ/QZ/yRtsaHQTC/PLye5hA9sU8BpuqLJjnDzE9kMmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722324831; c=relaxed/simple;
	bh=8lwMqDO6DIruVsITfQ8WUsmkH9wUKp9bqC8zQi5rWOs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AzivV1QD2Sg7eWZ2CbxGBx3cmzgfknEm/4+xE+Hz47VrX8nvs4Nz5CScANYdZhB5ndiLXq7+o+jjS6x+3MZE5gOtXvw92Em0VHBngbPfoXYDAgn1FPGwhnvi6/hDre6U2XQBw7W3XHZBWTgRPJKVzSDqe2dGgAAhfkoN9oyUQFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BcsPLfue; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BcsPLfue"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722324828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p3hp5JE9irHK/RFKivIOGSr6kla3+n9E8u+cvnGG7TY=;
	b=BcsPLfueXRCGD3A536N0ni97IfRnF9LD8LLhb0S13FHpRxjX+nwwU8lxiG9KhR4ciqkcPy
	iXDnYSitLTjRRlS7QvAOA2aplfvdcAJAo+e3NjUBPELsS5jYNu6tbnlZU8AGbRP/gwkSUH
	K21APt2mlLq5xSkQgU6X+8tdqS8k/aw=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-90-betDq9fWOfm-oNmM2gJqDg-1; Tue, 30 Jul 2024 03:33:46 -0400
X-MC-Unique: betDq9fWOfm-oNmM2gJqDg-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2ef973d9b41so4487311fa.0
        for <virtio-comment@lists.linux.dev>; Tue, 30 Jul 2024 00:33:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722324825; x=1722929625;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p3hp5JE9irHK/RFKivIOGSr6kla3+n9E8u+cvnGG7TY=;
        b=SyugDzOrhB80JIpiftXXoQ6Kve74akbtCQ5I5L0EaPPqRQ1FPiXWLbocMnKnys/Yuq
         nV78aFT4Ujtvs9f7yqBDYlmqBonbm1r3dKc8OY0h1ySZVFzlk/w21/MZDM/GAnzdYEv2
         iXrP6hK4TUoWsnrHFTJHLorQK3faQ06sDpxy/fC+TY1vzJYeAauZTQgHiDp4Fd08D9nI
         d8KGeG44zRl5ULA0XcOJ4zaBtqGyO+DlEypXp8CJncfccMtIRziArkR3xhLR9GSXDofJ
         I4bpwvY0ZCZ2zQK/QIk2bS52OHHkaiT3AkQaokX2LcUt0emg2dRGZIT2cXd4X5QpZaFm
         yJ+A==
X-Gm-Message-State: AOJu0YwM7WUt1OvynV1Ftru0OBLlJwku7zk7ZaDiBRhxzWBanO3UIQJg
	TDFCzDusgSJF6nrqKHoUgBUEYJpYSHp0bmvfBnka5zIi20iniTMihbYFGqLF5G5oIbWMwneNUv3
	y5L+V+rjsmq2WBQ8JTuLkSjwhiJplFkY3wR/BiSw74FusdSpRQI1vO42zaf9j8vZx
X-Received: by 2002:a2e:a548:0:b0:2ef:2f59:76e0 with SMTP id 38308e7fff4ca-2f03c7d6e19mr67605561fa.9.1722324825023;
        Tue, 30 Jul 2024 00:33:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHY6SD5wycstNgBa6ISB2CpJa4v8ayS7kq3w33cvwoiLG5nNmDJG2Ojlk12yCReCRt8M4qXNg==
X-Received: by 2002:a2e:a548:0:b0:2ef:2f59:76e0 with SMTP id 38308e7fff4ca-2f03c7d6e19mr67605441fa.9.1722324824416;
        Tue, 30 Jul 2024 00:33:44 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:1712:4410:9110:ce28:b1de:d919? ([2a0d:3344:1712:4410:9110:ce28:b1de:d919])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42820af1df0sm35535965e9.42.2024.07.30.00.33.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jul 2024 00:33:43 -0700 (PDT)
Message-ID: <d79c4ed9-c1d5-4c9c-9f10-661745edf96c@redhat.com>
Date: Tue, 30 Jul 2024 09:33:42 +0200
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] virtio-net: define UDP tunnel segmentation offload
 feature
To: Willem de Bruijn <willemb@google.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com,
 Eelco Chaudron <echaudro@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
References: <cover.1722252302.git.pabeni@redhat.com>
 <2977107dcc842c0665227f7c3696157ecd15a1b2.1722252302.git.pabeni@redhat.com>
 <CA+FuTSfu8Sys_s+3jpXoS0GbZC4stOVgBrEYOtA9YoTCEJkJAA@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CA+FuTSfu8Sys_s+3jpXoS0GbZC4stOVgBrEYOtA9YoTCEJkJAA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/29/24 23:04, Willem de Bruijn wrote:
> You have a working software implementation, right? Will this be sent
> (as RFC) to the public netdev or so mailing list before this becomes a
> standard? I assume that there is a standard process for virtio that
> you are following. I'd just be more confident in a thumbs up if we
> also review the code that implements the text.

My plan is to write the S/W virtio_net implementation, too, but it's 
currently not ready. I had a working PoC for the first draft of this 
changeset, long time ago. Things are changed enough that I'll need a 
rewrite. I can try to shared such a thing on netdev ASAP (where "soon" 
here is a very relative terms ;)

Also I don't know the standardization process. I hope for some guidance 
from Jason and/or Michael.

> 
>> @@ -423,6 +441,9 @@ \subsection{Device Operation}\label{sec:Device Types / Network Device / Device O
>>           le32 hash_value;        (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
>>           le16 hash_report;       (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
>>           le16 padding_reserved;  (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
>> +        le16 outer_th_offset    (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO negotiated)
>> +        le16 inner_protocol_type;(Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO negotiated)
>> +        le16 inner_nh_offset;   (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO negotiated)
>>   };
> 
> In relation to the above: I recall that expanding the virtio_net_hdr
> was non-trivial when I last tried to add fields ("[rfc,2/3]
> virtio-net: support receive timestamp"). If that is the experience
> again, it might be worthwhile to expand with enough space to also
> accommodate a few subsequent extensions. Headroom is not that
> expensive.

Do you mean, by adding 'padding' or 'unused' fields?

Side note: the above is not 32 bit aligned, do we need such aligment?
If we would have VIRTIO_NET_HDR_GSO_UDPv4_L4 and 
VIRTIO_NET_HDR_GSO_UDPv6_L4 variants, we could avoid entirely 
'inner_protocol_type', as the network protocol will be implied by the 
GSO type itself.

>> +\item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feature,
>> +  the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit in \field{gso_type} indicates that
>> +  the GSO protocol is encapsulated in a UDP tunnel.
>> +  The outer UDP header must not require checksumming, e.g. the outer UDP checksum
>> +  must be zero.
> 
> nit: "e.g." should be "i.e.," here
> 
> and maybe must be a positive zero (0x0) checksum as defined in UDP RFC 768.
> 
>> +If the bit VIRTIO_NET_HDR_GSO_UDP_TUNNEL in \field{gso_type} is set, the outer
>> +UDP header MUST NOT require checksumming. That is the, the outer UDP checksum
>> +value must be 0, or the valid complete checksum for such header.
> 
> MUST NOT require checksum validation. [..] or the validated complete checksum

Ack to all the above.

Thanks!

Paolo

