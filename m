Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051B817BBF
	for <virtio-comment@lists.linux.dev>; Wed, 31 Jul 2024 17:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722447173; cv=none; b=tvTcpTAkamzEtLw8uNHH6C0FR9iO68XJCSiByT5xbomCBALHpEyQKAV8jaLUe8mhiTxGGW9PvOCPAjKzhdkqaA3cR+sfvfVql9C11U62oVNIBQ5SEtoN5681BSTw2qU3fH/qPTdHN0PFNzTX7suVe6hZ9JKgM9/rCQvrHZbeq9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722447173; c=relaxed/simple;
	bh=IKfo0+v2cb56pP4HZXOBNjZn+yY0teivlm6zhPnjYYQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A27/esN9xmgqOiIde/FQpQpk1qlg6MCdzPHEcCaReyOhDvFCqDEAOj1pqu/t2Q88wgU5sVhAv3wlq4ilMPD2zjaDLDg3S/fl8XetECQk+C32rimvUQJJwTaTjzkaE1bKYewZB1lulX61YLi3HOLCTInNWFlUI+h/e+tOb7XzOjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UnCTqtcJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UnCTqtcJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722447171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sjNfDdcSW52V6PHNmIL7QpmI5yN54ZY49fq+mgniENE=;
	b=UnCTqtcJXxFa0K/yYn+DWynZLvNlJWfr1RjqeXJMuaBUHN5l8BJ8VNmllQw/inFDoW99pZ
	zwVV2TLJZ3d4EDR7TovbvSu2PkmmUl1M9G0SH1HXYopkMsmLdLb+mXMVh26ff0++EBED9g
	TwlsSDShQKr2hWg3B/19wuVVHVPCYLY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-5781xOKPM5mNMALrJ1Djmw-1; Wed, 31 Jul 2024 13:32:49 -0400
X-MC-Unique: 5781xOKPM5mNMALrJ1Djmw-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4281e72db54so5711755e9.0
        for <virtio-comment@lists.linux.dev>; Wed, 31 Jul 2024 10:32:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722447168; x=1723051968;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sjNfDdcSW52V6PHNmIL7QpmI5yN54ZY49fq+mgniENE=;
        b=pOJ0RG8v8eFBo8oX6E7Nm0fKtZzc+UqZRduq19tW0KjfpV6Yq+IJyJbVoXvSdSTi21
         hNrRqD5n0xQc7zEp6cYxVWegqxPTBU8TwD+0yopm7KUbCnMZaSInU9jtj95akcqI44M2
         yTVo+LAkXM0EdfxsjQcHS9lGDFV96MFKgVKT8PhlKTdYrohw+ajW/pOGZebCfmTi6o18
         WzE6YeQZnopq1+nolX9fUfLTeKJoAP8qVzpp9ckFyjFDPKGgjF6ZQ5w0d/zF0/Iz5jNr
         n+3S4hBzhVhvFrzpZ03PFrlFko/XpVeH0C/IqohzHKNkPdzZzlVfQtKCzqUpAz8LObK1
         h6vg==
X-Gm-Message-State: AOJu0YxIAOix3voDqFvFFRMiU5vxGp5+V6NLDOSVWN5O2W7GaeYes3Yz
	QUhp70xl9E6JKO7zD4iMJewBkijBSi3ynsthTRQDFN5mQiXpqW21/pKdLWADml/ATdd0GiAVB4I
	aXKjD3RAGSiAQKYyLmYxnRlfLm7w2ljshgVCcfz/nXxKfAcb8vZuDkZFdGpZURRc8
X-Received: by 2002:a05:6000:402a:b0:360:872b:7e03 with SMTP id ffacd0b85a97d-36baa9f73cfmr22315f8f.0.1722447168212;
        Wed, 31 Jul 2024 10:32:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1wUEjEmMrbcsm1jIRKf2eZPRBkDeTlhnoQFNmchI705CHo1qK//+B79MIFpPcAR02PBE6lQ==
X-Received: by 2002:a05:6000:402a:b0:360:872b:7e03 with SMTP id ffacd0b85a97d-36baa9f73cfmr22296f8f.0.1722447167680;
        Wed, 31 Jul 2024 10:32:47 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:1712:4410::f71? ([2a0d:3344:1712:4410::f71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b36862489sm17415848f8f.105.2024.07.31.10.32.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 10:32:47 -0700 (PDT)
Message-ID: <56d62e5a-b7df-43f7-8878-517505345529@redhat.com>
Date: Wed, 31 Jul 2024 19:32:45 +0200
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] virtio-net: define UDP tunnel segmentation offload
 feature
To: Willem de Bruijn <willemb@google.com>, Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com,
 Eelco Chaudron <echaudro@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
References: <cover.1722252302.git.pabeni@redhat.com>
 <2977107dcc842c0665227f7c3696157ecd15a1b2.1722252302.git.pabeni@redhat.com>
 <CA+FuTSfu8Sys_s+3jpXoS0GbZC4stOVgBrEYOtA9YoTCEJkJAA@mail.gmail.com>
 <d79c4ed9-c1d5-4c9c-9f10-661745edf96c@redhat.com>
 <CACGkMEu6dnKOgYVYRWKadXirnk4R6Rc16ojNR=oSX-a22Rt4OA@mail.gmail.com>
 <CA+FuTScr26P+QtPfWKzD1zzadKiZ3zRs75KC1ycexdQRAQ0XuQ@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CA+FuTScr26P+QtPfWKzD1zzadKiZ3zRs75KC1ycexdQRAQ0XuQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/31/24 16:25, Willem de Bruijn wrote:
> On Wed, Jul 31, 2024 at 12:11 AM Jason Wang <jasowang@redhat.com> wrote:
>> On Tue, Jul 30, 2024 at 3:33 PM Paolo Abeni <pabeni@redhat.com> wrote:
>>> On 7/29/24 23:04, Willem de Bruijn wrote:
>>>>> @@ -423,6 +441,9 @@ \subsection{Device Operation}\label{sec:Device Types / Network Device / Device O
>>>>>            le32 hash_value;        (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
>>>>>            le16 hash_report;       (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
>>>>>            le16 padding_reserved;  (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
>>>>> +        le16 outer_th_offset    (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO negotiated)
>>>>> +        le16 inner_protocol_type;(Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO negotiated)
>>>>> +        le16 inner_nh_offset;   (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO negotiated)
>>>>>    };
>>>>
>>>> In relation to the above: I recall that expanding the virtio_net_hdr
>>>> was non-trivial when I last tried to add fields ("[rfc,2/3]
>>>> virtio-net: support receive timestamp"). If that is the experience
>>>> again, it might be worthwhile to expand with enough space to also
>>>> accommodate a few subsequent extensions. Headroom is not that
>>>> expensive.
>>
>> Yes, but it looks like an independent issue for this.
> 
> If this change requires new headroom, then it depends on headroom expansion.
> 
> My suggestion is to then expand it significantly immediately, to minimize the
> number of times we have to change the virtio_net code to support new lengths.
> 
> We already have structs virtio_net_hdr, virtio_net_hdr_mrg_rxbuf,
> virtio_net_hdr_v1, virtio_net_hdr_v1_hash.
> 
> Adding a new struct with every new field added just adds lots of churn in
> the code.
> 
> Just a thought, feel free to skip if the maintainers disagree.

I just read the old thread WRT virtio net timestamping.

If we reserve additional headroom space for timestamping here, such room 
will be available only if UDP_TUNNEL is negotiated, which sounds a bit 
counterintuitive to me.

I *think* ideally we want a separate virtio net feature for that?

Regarding the virtio_net_hdr parsing complexity increase, I think we 
should add to the uAPI a struct containing only the new fields, e.g. for 
UDP tunnel:

struct virtio_net_udp_tunnel {
	__virtio16 outer_th_offset;
	// eventually __virtio16 inner_protocol_type;
	__virtio16 inner_nh_offset;
};

At feature negotiation time both the drivers and the device compute the 
offset inside the virtio buffer where such struct is placed:

if VIRTIO_NET_F_HASH_REPORT is negotiated such offset is sizeof(struct 
virtio_net_hdr_v1_hash) elsewhere is sizeof(struct virtio_net_hdr_v1)

At rx time, struct virtio_net_udp_tunnel() is parsed from the above offset.

With all the above in place, for every additional later feature we add 
just a struct definition and the virtio_net header parsing complexity 
scales linearly.

>>> If we would have VIRTIO_NET_HDR_GSO_UDPv4_L4 and
>>> VIRTIO_NET_HDR_GSO_UDPv6_L4 variants, we could avoid entirely
>>> 'inner_protocol_type', as the network protocol will be implied by the
>>> GSO type itself.
> 
> But that's too late now? Probably don't want to make this work
> depending on such a change.
> 
> I don't entirely recall why we did not do that immediately. Perhaps
> it is related to also only having SKB_GSO_UDP_L4.

I reached the same conclusion here:

https://lore.kernel.org/virtio-comment/cover.1722252302.git.pabeni@redhat.com/T/#mac694da6e907451d5529116a97510c940bf2edd9

What about reserving an additional bit in gso_type to specify the inner 
network header protocol?

Thanks,

Paolo

