Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC7E18DF9F
	for <virtio-comment@lists.linux.dev>; Wed, 31 Jul 2024 11:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722424661; cv=none; b=jbjdNAE+QQVrVEo6xDDH3IYv150uoAbOsFZnPKaJ1wkizlJm4ldqOW2mLM47lGyTSbTYW1w/Yhb5Jkx7NNsCuJwhlxKfSekOwDGYfUt2BcBSQQbiNvBTiykiwM+A66BrYGSd6WOzfBbi2OZD/Vg+wCUOzdtidjGEkbnr1nZBqZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722424661; c=relaxed/simple;
	bh=kecEpCdnhrUc3Psm/QPrVIsOIz/rvTJSGMt9/OeAkaA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Ro53I5fa4qe2RJq5P8fq/lqf6ISlNTSON+xkM58b802uGaHaFXLWy0wRiz90K4iZkta088uouQadywjzl93/ot6FO3lQawImEFaDF+3NUXl84l22SW1L6Pr396heZKNITzLkE6TI0NDqx3l32MJ03uiIUYdtZoflK8bwah9Z32s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VugVaKmU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VugVaKmU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722424658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8wTE3acys13xntZiiOZc2E6qNI26tEwLMaA1PcNlSu0=;
	b=VugVaKmUzLhPEe1TDuTvDTEO6we8IoOCKQDcf2/nqciiwWc16m3OMrCMdccWpwlmJL93Pn
	04xF0cV7+aVSxRJEaZIEwALJqvXu3ODOWrSF9DTuwGIFC8E6HJbUpDngW3smaanoLXop57
	vsRZqDl2//C+1bPqo69wjc/Rj9wJbKE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-v037PB71P9KoztnEQppiJw-1; Wed, 31 Jul 2024 07:17:37 -0400
X-MC-Unique: v037PB71P9KoztnEQppiJw-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-428086c2187so4187785e9.2
        for <virtio-comment@lists.linux.dev>; Wed, 31 Jul 2024 04:17:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722424656; x=1723029456;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8wTE3acys13xntZiiOZc2E6qNI26tEwLMaA1PcNlSu0=;
        b=fMXOEjxXHHEfv/D5FEEsLFAmlllZXjCxj2D9m1P4JeRZ2rIYng6bG/adilSdA9prDL
         L7ZTaJ11HHnGVND8f3UYP5CJNar8xU9xUFvXCc1P+JGGv0crsWB/w24uc9tk1UoFdt53
         HhKWYYHOEcyuNXRSVAIvBmT5bIOXWh8wmdwEiVcGKhlDPmxCKkwggRdSq/vEGRJ8UtgN
         cbJH9DmIzoaFSQz0prB2cmPydpGAgHHs1lUuFUdMPLbBzE+GYgVuakGEU6zC7r/NNYRH
         d4O6IkiMGKZe5i+5cGFLTPWWF2sosiESzq789rSW/9m2cdRxYA1mJUX66Ri0Vx4VZDz5
         yD8g==
X-Forwarded-Encrypted: i=1; AJvYcCXLCuim8QT4bTgL1Izr3V4IY9dofDbgmK0tkf848p7KxtDtoeXaOexUu8kuL2nD6JzerxTf1YTwVtNUZLgxEIsfJ+4J8TS1nM1RBwqjNM8=
X-Gm-Message-State: AOJu0YzFUE8yPWzX9ibEavaSTxo1gVPlzxgODDN19anN03DNVSQIVQcu
	zEqD51Mi+Vl27z2AZ9XzOgtEY2WR2okpo3dyZGWjFILWnoPgarL9BU8bH/49lb7BQaYogtvazyS
	j7ih7FqNqRPwVi6do/dZx+ug5lhYFqBYSW9W50Y+NZonAj17+L1wYnAxl/RRnrfvQ
X-Received: by 2002:a05:600c:4fc2:b0:425:6962:4253 with SMTP id 5b1f17b1804b1-4280574c650mr94314925e9.4.1722424655663;
        Wed, 31 Jul 2024 04:17:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHK6ZBonayPPcx9kPzHTQ/eOXv5leIkl5tO+4JRd06O9FI9xuR4DIems38X+ACDgVDvCNP8WQ==
X-Received: by 2002:a05:600c:4fc2:b0:425:6962:4253 with SMTP id 5b1f17b1804b1-4280574c650mr94314845e9.4.1722424655099;
        Wed, 31 Jul 2024 04:17:35 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:1712:4410::f71? ([2a0d:3344:1712:4410::f71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367fde8asm16767578f8f.54.2024.07.31.04.17.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 04:17:34 -0700 (PDT)
Message-ID: <f16ac8f1-bb5e-4fab-bc22-c76e2df64bc7@redhat.com>
Date: Wed, 31 Jul 2024 13:17:32 +0200
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] virtio-net: define UDP tunnel segmentation offload
 feature
From: Paolo Abeni <pabeni@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Willem de Bruijn <willemb@google.com>, virtio-comment@lists.linux.dev,
 maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
References: <cover.1722252302.git.pabeni@redhat.com>
 <2977107dcc842c0665227f7c3696157ecd15a1b2.1722252302.git.pabeni@redhat.com>
 <CA+FuTSfu8Sys_s+3jpXoS0GbZC4stOVgBrEYOtA9YoTCEJkJAA@mail.gmail.com>
 <d79c4ed9-c1d5-4c9c-9f10-661745edf96c@redhat.com>
 <CACGkMEu6dnKOgYVYRWKadXirnk4R6Rc16ojNR=oSX-a22Rt4OA@mail.gmail.com>
 <db018dea-d186-40e7-88e6-e493fa3c24ab@redhat.com>
In-Reply-To: <db018dea-d186-40e7-88e6-e493fa3c24ab@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/31/24 11:02, Paolo Abeni wrote:
> On 7/31/24 06:10, Jason Wang wrote:
>> On Tue, Jul 30, 2024 at 3:33 PM Paolo Abeni <pabeni@redhat.com> wrote:
>>> On 7/29/24 23:04, Willem de Bruijn wrote:
>>>>> @@ -423,6 +441,9 @@ \subsection{Device Operation}\label{sec:Device Types / Network Device / Device O
>>>>>             le32 hash_value;        (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
>>>>>             le16 hash_report;       (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
>>>>>             le16 padding_reserved;  (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
>>>>> +        le16 outer_th_offset    (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO negotiated)
>>>>> +        le16 inner_protocol_type;(Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO negotiated)
>>>>> +        le16 inner_nh_offset;   (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO negotiated)
>>>>>     };
> 
> [...]
> 
>>> If we would have VIRTIO_NET_HDR_GSO_UDPv4_L4 and
>>> VIRTIO_NET_HDR_GSO_UDPv6_L4 variants, we could avoid entirely
>>> 'inner_protocol_type', as the network protocol will be implied by the
>>> GSO type itself.
>>
>> I may miss something, but can it be done by just introducing a new
>> gso_type without vnet header extension?
> 
> Yep, that is what I mean above: we could replace the
> 'inner_protocol_type' field - which carries a single bit information,
> inner ipv4 vs ipv6 - with some (inner) GSO-type related info.
> 
> Unfortunately that last step does not look 110% 'clean' to me, as the
> inner GSO type is already specified by VIRTIO_NET_HDR_GSO_TCPV4,
> VIRTIO_NET_HDR_GSO_TCPV6 or
> VIRTIO_NET_HDR_GSO_UDP_L4. In case of inner TCP, the inner network
> protocol is already specified, but it's not in case of UDP.
> 
> I'm wondering: why the single VIRTIO_NET_HDR_GSO_UDP_L4 value has been
> preferred to a pair of ipv4/ipv6 variants? Could we add such variants
> now? Note that I would like such option very much, as it will make this
> change even more complex, but looks IMHO quite clean.

After more pondering, I think implementing this option would be quite a 
mess. E.g. we would need a feature bit for 
VIRTIO_NET_HDR_GSO_UDP{4,6}_L4 different from 
VIRTIO_NET_F_{GUEST,HOST}_USO{4,6,}...

I guess we are better off excluding such option.

> Otherwise another option would be to allocate another bit in the GSO
> type field, set such field when VIRTIO_NET_HDR_GSO_UDP_TUNNEL is set,
> too, and use such field specify the inner header network protocol. I
> don't like much even this option because the new bit will carry
> duplicate information in case of TCP, and it's implementation looks bug
> prone.

In practice it would replace 'inner_protocol_type' with:

#define VIRTIO_NET_HDR_GSO_INNER_IPv6 0x20

And set/clearing such bit depending on the inner network protocol type, 
for VIRTIO_NET_HDR_GSO_UDP_TUNNEL packets.

Processing the virtio net hdr will require validating such bit value 
with WRT the carried GSO type, i.e. must be set when

gso_type & (VIRTIO_NET_HDR_GSO_TCPV6 | VIRTIO_NET_HDR_GSO_UDP_TUNNEL) ==
VIRTIO_NET_HDR_GSO_TCPV6 | VIRTIO_NET_HDR_GSO_UDP_TUNNEL

must be cleared in all the other cases

Cheers,

Paolo

