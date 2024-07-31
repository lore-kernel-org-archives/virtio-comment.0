Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C9518DF8E
	for <virtio-comment@lists.linux.dev>; Wed, 31 Jul 2024 08:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722415396; cv=none; b=p1MYzlj6GeJWrKhUM88KUzs24VxchJVXXs95Wk8PzvlOpFAFasRrDTUIJgjvQPXmVA6hMNoJG0HYMvvwLGK2XbvxvyQcwBajK3gr3yMoVpHTnsV6jYifippWGxAA8QH9mqjJJUcNBsZuYOhBJ7KH/sWa/nF/w5bfQHCBVhf4dRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722415396; c=relaxed/simple;
	bh=pX9C4yJeqAER4NWSe4cbhRCmZsKfJiTozzK3CNjPzy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LKXRs6B5K/1cBzlfM82kRI1U/cl8aLLLx0AXoTV7+5RRV2n0vcj8eDfSIdwKY8J63n6u4VVAoRjcZV47fzx+IWoA0NnxuWapDq0KWndhcjH/gSLyEv5JUN1opdeCHsnwgGDJhxrsTxxlAb82YYr1FWFr75C1RnwKdIDB6UMLcig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CVopSOTm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CVopSOTm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722415393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K8eBq1mCyhK2epARhhic8BhoYg4vJQXhtjj/qx1UR/g=;
	b=CVopSOTmtRG3ey4GZTHaG21Y3rAUdnoBXxDwuFPtNpTN8GyvvZdYkELReqEKThjwvl22pI
	6r6dErKpV8DfkcLy92kGkQN6ZN3wYkYkkWnu7TzgpPfw+junuNC8bIoZU4RmDvWYojTtIi
	gr++Ysw8IuF7McJ3nT1ELW3j0NehW4M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-YHIqBoRHMai7z5wl8nd-RQ-1; Wed, 31 Jul 2024 04:43:08 -0400
X-MC-Unique: YHIqBoRHMai7z5wl8nd-RQ-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-427feed9c71so6682055e9.0
        for <virtio-comment@lists.linux.dev>; Wed, 31 Jul 2024 01:43:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722415387; x=1723020187;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K8eBq1mCyhK2epARhhic8BhoYg4vJQXhtjj/qx1UR/g=;
        b=ck5nCg8ivWW219qzLoJ7pLj2JRCWdhFOXDbna2CUuHIbnVG1ypqVbIylBwxeGSoS1/
         nu9DTi9/QzqK2GCLlLBg5afjI5/tQXoXvbY2kGpLYvYWcPZFbsx8C0vTdVWadNhT6/2P
         S37H050tUOzF0u7vv3bBPBl5Y1UxvyZhID1GGy+0DYgK6BHkk9Hy8DOYVwVDyIrA7SeQ
         /EfElEsdHKlIWXPGbpWbDcvSv4lP6bCFryYn6U5+qoZ/8kY6d8p8u3D6pAY0Pw3IcJSK
         HOtN6wikIaIWPcpQFT3dPyde4wqDIqdcw9e8WNIKHmehQEDOqdWvsi+rJvkVA3Pg8140
         nxZA==
X-Gm-Message-State: AOJu0Yy1cmOgAe3uTibp68AQZauwOgyjXugABMlvILj/s64V+Gt1qfKb
	z2a5aTpTedt0XmSX1ZK8txP1iBlKfLfvP+QLZPUPLxAJFyWluwfPmNtXUv0R0qeUCn58AOsu/4R
	gLKt2suLNs9BdBTvOkIdy9Rwa9hllzZghvCR2Eak3Z1/+g5W5D/DLCHTqTOwJyhMoHWiKUQimFV
	g=
X-Received: by 2002:a5d:64a3:0:b0:367:4d9d:56a6 with SMTP id ffacd0b85a97d-36b34be17d5mr7935997f8f.1.1722415387237;
        Wed, 31 Jul 2024 01:43:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYG9uofZR45dT6R+NzK/Ao+F64AZ6YkSxyQL17OO/SF9XZAbW2E+cDFTYdZndQKVj38XRKFg==
X-Received: by 2002:a5d:64a3:0:b0:367:4d9d:56a6 with SMTP id ffacd0b85a97d-36b34be17d5mr7935983f8f.1.1722415386745;
        Wed, 31 Jul 2024 01:43:06 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:1712:4410::f71? ([2a0d:3344:1712:4410::f71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b36858229sm16521787f8f.82.2024.07.31.01.43.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 01:43:06 -0700 (PDT)
Message-ID: <a9a575a8-3ffe-4c0a-9ed3-4eb1174e8364@redhat.com>
Date: Wed, 31 Jul 2024 10:43:05 +0200
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
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com,
 Eelco Chaudron <echaudro@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Willem de Bruijn <willemb@google.com>
References: <cover.1722252302.git.pabeni@redhat.com>
 <2977107dcc842c0665227f7c3696157ecd15a1b2.1722252302.git.pabeni@redhat.com>
 <CACGkMEsOPcyUevsGcZeR8311-=5kGt5bRmxDQ3XGYQ3_S4Diyw@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CACGkMEsOPcyUevsGcZeR8311-=5kGt5bRmxDQ3XGYQ3_S4Diyw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/31/24 03:57, Jason Wang wrote:
>> @@ -133,12 +139,16 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
>>   \item[VIRTIO_NET_F_GUEST_UFO] Requires VIRTIO_NET_F_GUEST_CSUM.
>>   \item[VIRTIO_NET_F_GUEST_USO4] Requires VIRTIO_NET_F_GUEST_CSUM.
>>   \item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM.
>> +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO] Requires both VIRTIO_NET_F_GUEST_TSO4 and VIRTIO_NET_F_GUEST_TSO6, or
>> +   both VIRTIO_NET_F_GUEST_USO4 and VIRTIO_NET_F_GUEST_USO6.
> 
> I think VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO requires all of the four?

Functionally speaking is not strictly necessary: the UDP tunnel feature 
needs just a single inner GSO type to assemble and process an UDP 
tunneled packet.

On the flip side I think is reasonable that modern implementations 
support all the mentioned inner GSO type and requiring all of them would 
possibly make the implementation simpler and/or less bug prone.

So I guess I can change the requirement as you say above.

>>   \item[VIRTIO_NET_F_HOST_TSO4] Requires VIRTIO_NET_F_CSUM.
>>   \item[VIRTIO_NET_F_HOST_TSO6] Requires VIRTIO_NET_F_CSUM.
>>   \item[VIRTIO_NET_F_HOST_ECN] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_NET_F_HOST_TSO6.
>>   \item[VIRTIO_NET_F_HOST_UFO] Requires VIRTIO_NET_F_CSUM.
>>   \item[VIRTIO_NET_F_HOST_USO] Requires VIRTIO_NET_F_CSUM.
>> +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO] Requires both VIRTIO_NET_F_HOST_TSO4 and VIRTIO_NET_F_HOST_TSO6, or
>> +   both VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6.
>>
>>   \item[VIRTIO_NET_F_CTRL_RX] Requires VIRTIO_NET_F_CTRL_VQ.
>>   \item[VIRTIO_NET_F_CTRL_VLAN] Requires VIRTIO_NET_F_CTRL_VQ.
>> @@ -375,6 +385,12 @@ \subsection{Device Initialization}\label{sec:Device Types / Network Device / Dev
>>     TCP), VIRTIO_NET_F_HOST_TSO6 (IPv6 TCP), VIRTIO_NET_F_HOST_UFO
>>     (UDP fragmentation) and VIRTIO_NET_F_HOST_USO (UDP segmentation) features.
>>
>> +\item If any TCP or UDP segmentation feature is negotiated,
> 
> Not a native speaker but this seems to conflict with the above. For
> example, does "only VIRTIO_NET_F_GUEST_TSO4 is negotiated" mean any
> TCP segmentation feature?

As per the previois comment, I'll change this in the next revision to:

"""
If the VIRTIO_NET_F_HOST_TSO6, VIRTIO_NET_F_HOST_TSO4 and 
VIRTIO_NET_HDR_GSO_UDP_L4 features are negotiated
""">> @@ -516,6 +539,26 @@ \subsubsection{Packet 
Transmission}\label{sec:Device Types / Network Device / De
>>   specifically in the protocol.}.
>>      \end{itemize}
>>
>> +\item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feature,
>> +  the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit in \field{gso_type} indicates that
>> +  the GSO protocol is encapsulated in a UDP tunnel.
>> +  The outer UDP header must not require checksumming, e.g. the outer UDP checksum
>> +  must be zero.
>> +  The other tunnel-related fields indicate how to replicate the packet
>> +  headers to cut it into smaller packets:
>> +
>> +  \begin{itemize}
>> +  \item \field{outer_th_offset} field indicates the outer transport header within
>> +      the packet. Note that such field differs from \field{csum_start} as the latter
>> +      points to the inner transport header within the packet
> 
> I wonder if it's better to stick to outer_csum_start, and say it's
> offset within the packet to begin checksumming for outer packet.  This
> follows the existing name and could be reused for encapsulation other
> than UDP tunnel.

I thought we agreed on this name in the previous iteration?!? It feels 
strange to introduce a csum related field in a change NOT introducing a 
checksum related feature. And we need this filed here, for plain 
segmentation.

>> @@ -557,6 +600,18 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
>>   driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
>>   \field{gso_type}.
>>
>> +The driver MUST NOT send to the device TCP or UDP GSO packets over UDP tunnel
>> +requiring segmentation offload, unless the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is
>> +negotiated, in which case the driver MUST set the VIRTIO_NET_HDR_GSO_UDP_TUNNEL
>> +bit in \field{gso_type}.
> 
> Is this better to follow the existing style of the driver normative?
> For example, we had
> 
> "If VIRTIO_NET_F_HOST_TSO6 is negotiated, the driver MAY set gso_type
> to VIRTIO_NET_HDR_GSO_TCPV6 to request TCPv6 segmentation, otherwise
> the driver MUST NOT set gso_type to VIRTIO_NET_HDR_GSO_TCPV6."
> 
> We could do the same
> 
> "If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, the driver MAY ...
> otherwise the driver MUST NOT ..."

ok, I'll do that in the next revision

>> @@ -598,6 +653,28 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
>>          header.
>>   \end{itemize}
>>
>> +If the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO option has been negotiated, the
>> +driver MAY set the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit in \field{gso_type}, if so:
>> +\begin{itemize}
>> +\item the driver MUST set \field{outer_th_offset} to the outer UDP header
>> +  offset, \field{inner_protocol_type} to the ethernet type of the inner
>> +  protocol, and \field{inner_nh_offset} to the inner network header offset.
>> +\end{itemize}
> 
> Do we need to say then csum_start and csum_offset is for the inner packet here?

I thought such statement was already everywhere, but no objection to add 
it here, too.

Somewhat related, I have a doubt WRT the csum_start/csum_offset fields 
"presence" with plain GSO packets. AFAICS, the specs require the csum 
offload feature as a pre-req for the plain segmentation feature, but 
also allow the reception of a GSO packet without the 
VIRTIO_NET_HDR_F_NEEDS_CSUM bit set, see the recent linux patch from Willem:

https://lore.kernel.org/netdev/20240729201108.1615114-1-willemdebruijn.kernel@gmail.com/

I think it will make the thing simpler if we always require such bit to 
be set for GSO packets. I guess we can't change the current status for 
the existing GSO types, but for UDP tunnel we could add that requirement 
from the start, both for the driver -> device direction and for the 
device -> driver direction.

Even when the device sets the VIRTIO_NET_HDR_F_DATA_VALID, so can always 
expect a valid csum_start/csum_offset pair, and make things hopefully 
more robust. When VIRTIO_NET_HDR_F_DATA_VALID is set, the pair will NOT 
be used to validated the csum, just to point to the inner transport 
header and avoid parsing. WDYT?

Thanks,

Paolo

