Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E249C1B3B2E
	for <virtio-comment@lists.linux.dev>; Thu, 29 Aug 2024 15:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724946582; cv=none; b=fVUu3GCBQZcMZLMlW+irIDazB05fMqsNyj0DvVCWuukyHbKyqn+rc/v3RpqAv9/TTqr4unZoDZ9Ec0DGcFvItUuBLjHM5fbTnKCYhNXhx9vd8amgsFu6Z+T4bTjJoJwGyQE5UlhShdSQE0/F77W66UoOSSPor9ce2w2fsv0uwwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724946582; c=relaxed/simple;
	bh=Czu6uzxNxcvu8uONScIPBEALtj+ky2kF4yVXzq6MxYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X3gEAMF+BDJ2yVecZCRF/nK+ISob1yqiVg3LqWutyvyWlNJbi0tdzpuY4iB7dQvSqz20lA9RPHuqaxvuuNu29LHzFydIbuMPjbUtZQcmCGNxjgt8Pm6r5idhh2Wrvba80u9zqVn4PlOYCfIQAsVt7vPWTZ8UK+26K9LR4f0V4I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OT+YsolU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OT+YsolU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724946579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zsR9xd2SdFYsT9sDIl35+/Zwnq3NhIOT4sCH3c5UueI=;
	b=OT+YsolUmufoRk3lJ+4Y9ds52c+smu8sS8WAxl2fIIPNcuKgiyVYhzXU70UR3XiUXlH3sv
	44r/58zY8wEL5KVqTg9PYf/eLPozWI6H/GNTLsCkU87Nx/TAsmY+Z43tfjbyzTLIf0Y/Qi
	zvfaB3NeYZPmtlDIC54itRpWcNqfmZY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-m08CgJ7aMGiee_ukAs_6mQ-1; Thu, 29 Aug 2024 11:49:38 -0400
X-MC-Unique: m08CgJ7aMGiee_ukAs_6mQ-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3719cee43abso514218f8f.0
        for <virtio-comment@lists.linux.dev>; Thu, 29 Aug 2024 08:49:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724946577; x=1725551377;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zsR9xd2SdFYsT9sDIl35+/Zwnq3NhIOT4sCH3c5UueI=;
        b=Oi89Ds6YyfoB4L8ULgdKebo1JysQ7LDFDfmsNRU2Wm7v+QjYVsljT9LTGoAEKD2HZU
         t05SSslR2xdASnh5hxqGBAbZGScKG5RYFiO05pywlJVvkCwUW3ertbOBcxU4MDjdh1Hc
         2O1vu/QzhRUN2pBVY6WqGRny0LR1z5sAGhmdzn1/xG0hefgjWArBsH2kF9pRECIndprT
         z5ex3rszVN+DIpSpUcDDjBDQNdxiCnh89gCKHu6n5GgRl1o1aW40GmqaAILQmLny6lV4
         +zYA4aFjW53Zw3T35zMwOt824Yf5yxjwYPyzNAV1VGJ56yJpvi53XUBQPZLsgft0UJnd
         2fqQ==
X-Gm-Message-State: AOJu0Yy5huMGdz6/aq2VH/a/HF/uyWntjpB42tESiyMsuBw1kqj3Tp3N
	mkFzKA7gaakTJOM1UeQjsokTVIqj2imstK8Y7O5NOvoGMs8FzXGSewSZ9qivadcyBh4LNdNSOeI
	u0CH0lDyEjd86ARHXRH4BHC8qdIKKQ4WbtwF12TueBg/nnemGB+F3D+Pd2PraMYpA
X-Received: by 2002:a5d:4e83:0:b0:371:8ced:52e2 with SMTP id ffacd0b85a97d-3749b5882a6mr2147218f8f.52.1724946577202;
        Thu, 29 Aug 2024 08:49:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOAEMTukq29vAr2iOYD8NKO1o2vuiJuxU8uqpEP6tIctEb2E6KU/GA/D+q4QXIi+gsfFgD7w==
X-Received: by 2002:a5d:4e83:0:b0:371:8ced:52e2 with SMTP id ffacd0b85a97d-3749b5882a6mr2147195f8f.52.1724946576686;
        Thu, 29 Aug 2024 08:49:36 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:1b50:3f10::f71? ([2a0d:3344:1b50:3f10::f71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba63aba23sm53965305e9.21.2024.08.29.08.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 08:49:36 -0700 (PDT)
Message-ID: <5b555612-dcac-46d9-acb2-f712a40a4ede@redhat.com>
Date: Thu, 29 Aug 2024 17:49:34 +0200
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [PATCH v7 1/2] virtio-net: define UDP tunnel
 segmentation offload feature
To: Shiva Shankar Kommula <kshankar@marvell.com>,
 Willem de Bruijn <willemb@google.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 Eelco Chaudron <echaudro@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Nithin Kumar Dabilpuram <ndabilpuram@marvell.com>
References: <cover.1724234131.git.pabeni@redhat.com>
 <04089a87ff34aa518345ba5b50aecf737fb03f40.1724234131.git.pabeni@redhat.com>
 <CA+FuTScjheR1htWujZ5=adBRB3+_z5KrCyHKoRGVapGq-MGtJQ@mail.gmail.com>
 <70256c1c-f5dd-4ccd-a414-434bb56612fd@redhat.com>
 <DM4PR18MB4269FAAC3CFC7E57E25DFBD2DF8B2@DM4PR18MB4269.namprd18.prod.outlook.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <DM4PR18MB4269FAAC3CFC7E57E25DFBD2DF8B2@DM4PR18MB4269.namprd18.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/26/24 14:23, Shiva Shankar Kommula wrote:
>> -----Original Message-----
>> From: Paolo Abeni <pabeni@redhat.com>
>> Sent: Thursday, August 22, 2024 7:41 PM
>> To: Willem de Bruijn <willemb@google.com>
>> Cc: virtio-comment@lists.linux.dev; maxime.coquelin@redhat.com; Eelco
>> Chaudron <echaudro@redhat.com>; Jason Wang <jasowang@redhat.com>;
>> Stefano Garzarella <sgarzare@redhat.com>
>> Subject: [EXTERNAL] Re: [PATCH v7 1/2] virtio-net: define UDP tunnel
>> segmentation offload feature
>>
>> On 8/21/24 21: 28, Willem de Bruijn wrote: > On Wed, Aug 21, 2024 at 6: 03
>> AM Paolo Abeni <pabeni@ redhat. com> wrote: >> >> The
>> VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV{4,6} are two gso_type flags >>
>> allowing respectively GSO
>> On 8/21/24 21:28, Willem de Bruijn wrote:
>>> On Wed, Aug 21, 2024 at 6:03 AM Paolo Abeni <pabeni@redhat.com>
>> wrote:
>>>>
>>>> The VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV{4,6} are two gso_type flags
>>>> allowing respectively GSO over UDPv4 tunnel and GSO over UDPv6 tunnel.
>>>> They can be negotiated on both the host and guest sides.
>>>>
>>>> One constraint addressed here is that the virtio side (either device
>>>> or
>>>> driver) receiving a UDP tunneled GSO packet must be able to
>>>> reconstruct completely the inner and outer headers offset - to allow for
>> later GSO.
>>>>
>>>> To accommodate such need, new fields are introduced in the virtio_net
>>>> header: outer_th_offset and inner_nh_offset.
>>>> They map directly to the corresponding header information. The inner
>>>> transport header is implied by the (inner) checksum offload.
>>>>
>>>> Those fields are required because a virtio device H/W implementation
>>>> performing segmentation for UDP tunneled packet will need to touch
>>>> the outer transport protocol (for the UDP length filed), the inner
>>>> network protocol (for the total length field, in the IPv4 case).
>>>>
>>>> Note that segmentation will additionally need to touch the outer
>>>> network protocol and the inner transport protocol. The first is
>>>> implied/easily found with trivial parsing, the latter is identified
>>>
>>> Trivial because Ethernet header followed by IPv4 or IPv6 header is
>>> assumed? I.e., no level 2.5 headers like vlan or mpls to complicate
>>> matters.
>>
>> Yes ;)
> Hi Paolo Abeni,
> Apologies for joining the conversion bit late.
> 
> We are using VDPA-based device along with DPDK in our environment
> and have noticed a significant performance drop (~8-10%) when
> reading packet data to determine the [outer]network header type
> in segment offloading cases as segmentation offload needs to
> know the start of network header.

I'm unsure I parse the above correctly. DPDK is reading packets from the 
VDPA device, when does segmentation offload come into place? I guess the 
DPDK application is forwarding the packets towards another (VDPA?) device?.

There is no encapsulation protocol at all right?

The idea of adding additional virtio net header fields for plain GSO 
packets sounds a bit strange to me.

I guess a more detailed description of your scenario would help.

Thanks,

Paolo

