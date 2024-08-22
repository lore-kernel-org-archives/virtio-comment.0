Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12111F951
	for <virtio-comment@lists.linux.dev>; Thu, 22 Aug 2024 14:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724335897; cv=none; b=FQc4v6cT6S+CdhCJ5gX6AFP9OGiy/7QJSvM3f9jBKf6ySSy8Ogo7qT4z0VGW1qBR/JQE366ahV44ucN2uP8zK035Ly5CYdj4eUoW0laET/nND+9cxD+7pb8iEPkDsWwTvBH0bXZAbfQ068C1SJXTFsQDkYB+/pZ4CkrhMNMJNCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724335897; c=relaxed/simple;
	bh=sLKQOCIwRcTT0HnqxrhTzPTqRbIkB5dgiYX587O9RuE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fs2KGeTp/3cONOMWL+UWaeki9mtW5P4OqUpflPj4QXYYG9AC+7mIUtLkHrdHv0BoiugqMaSkwLpZbO3r8XMA5mH+rKzoUTb5RebQ5eU3ac3CcJGpYZXuy5TmPEucYZUiQP90aobI6fZklO2Whc4Lrj9M42TOGN8uajwDRqA7UVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CGtW6B3A; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CGtW6B3A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724335893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4x81WF9Bq84ITNeafTUObdhyG3kaAx1XIL2mtHRurlg=;
	b=CGtW6B3AILlFpG0m27m7WfsW56QL4r1heVQVn0FYYSEh/zMgDk+dPbHcGhtrXdNhyPovR3
	9e6Fg5Hiy+uQFfHqYw+Wr4+0ixXlA7I6A8zQ1QBJoyL5tFOjAIqNRzVOF6560vUftksPQ/
	XDL8pzDXMB37KGahwKwreAvERwhsLqw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-371-IrOt6GuhN763CYsPKBuNNg-1; Thu, 22 Aug 2024 10:11:29 -0400
X-MC-Unique: IrOt6GuhN763CYsPKBuNNg-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-428040f49f9so8096565e9.0
        for <virtio-comment@lists.linux.dev>; Thu, 22 Aug 2024 07:11:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724335888; x=1724940688;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4x81WF9Bq84ITNeafTUObdhyG3kaAx1XIL2mtHRurlg=;
        b=hyETcbpoETt9bqnoWGX/LSq4xb0XCRGQPyZuqU/TfaB3zFlNzpsZocJWCKtnQmEDtt
         L2bGs1YguwYbWlS/xuhQZqkjqHpl2j/YHn6d5j1vM2IR9eN2beFw0MlNmO6PYH80Jrl7
         6VD+Q7jXkFVdZAgYwqUBVl8xJIsitWTMIty8QCwkHHggaRbseNc5baiQqOtPDg9TM3L5
         B+th0EXhE9/uJuPHEHa4+1ciN6uiI98i8HE0hpUDLUyuJ6u64e2nLwst05mxAS8zJeSO
         El5YOkQqd4CPTZbBAJu2zXcSR3RF+WGjvj5eT6R1xNp+N0Jscf3rJgo4ByfdaX+zalZl
         MsLA==
X-Gm-Message-State: AOJu0YwTM/PmKRtzywR3ZMpaTD8vNpmDCMd6xb+iOp9+hsa/F9Z6nZFc
	DEhqHvXaZRe6PbPBYEC3At6nVWVAdfMVKpdEFOSK1EqF67zerwM6G9nPPuAM6f6LTYzd01GJTwA
	7tm2secfqbJWtDJD+EJhuxhvSmnOIfiCANzbtw3zqAHJDULkAdFuvX1FJQ78K/9sB
X-Received: by 2002:a05:600c:1906:b0:426:5c36:207c with SMTP id 5b1f17b1804b1-42abd245728mr42260775e9.25.1724335888380;
        Thu, 22 Aug 2024 07:11:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGACAiwvhbGdC4vpM6Un4UlgEBpHa8QbWxiUXqqWHkX9/qjmklLMI6wiSuqlnrwZRe2BdokqQ==
X-Received: by 2002:a05:600c:1906:b0:426:5c36:207c with SMTP id 5b1f17b1804b1-42abd245728mr42260445e9.25.1724335887728;
        Thu, 22 Aug 2024 07:11:27 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:1b51:3b10::f71? ([2a0d:3344:1b51:3b10::f71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ac5158420sm25422125e9.14.2024.08.22.07.11.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Aug 2024 07:11:27 -0700 (PDT)
Message-ID: <70256c1c-f5dd-4ccd-a414-434bb56612fd@redhat.com>
Date: Thu, 22 Aug 2024 16:11:26 +0200
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] virtio-net: define UDP tunnel segmentation offload
 feature
To: Willem de Bruijn <willemb@google.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com,
 Eelco Chaudron <echaudro@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
References: <cover.1724234131.git.pabeni@redhat.com>
 <04089a87ff34aa518345ba5b50aecf737fb03f40.1724234131.git.pabeni@redhat.com>
 <CA+FuTScjheR1htWujZ5=adBRB3+_z5KrCyHKoRGVapGq-MGtJQ@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CA+FuTScjheR1htWujZ5=adBRB3+_z5KrCyHKoRGVapGq-MGtJQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/21/24 21:28, Willem de Bruijn wrote:
> On Wed, Aug 21, 2024 at 6:03 AM Paolo Abeni <pabeni@redhat.com> wrote:
>>
>> The VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV{4,6} are two gso_type flags
>> allowing respectively GSO over UDPv4 tunnel and GSO over UDPv6 tunnel.
>> They can be negotiated on both the host and guest sides.
>>
>> One constraint addressed here is that the virtio side (either device or
>> driver) receiving a UDP tunneled GSO packet must be able to reconstruct
>> completely the inner and outer headers offset - to allow for later GSO.
>>
>> To accommodate such need, new fields are introduced in the virtio_net
>> header: outer_th_offset and inner_nh_offset.
>> They map directly to the corresponding header information. The inner
>> transport header is implied by the (inner) checksum offload.
>>
>> Those fields are required because a virtio device H/W implementation
>> performing segmentation for UDP tunneled packet will need to touch
>> the outer transport protocol (for the UDP length filed), the
>> inner network protocol (for the total length field, in the IPv4
>> case).
>>
>> Note that segmentation will additionally need to touch
>> the outer network protocol and the inner transport protocol. The first
>> is implied/easily found with trivial parsing, the latter is identified
> 
> Trivial because Ethernet header followed by IPv4 or IPv6 header is
> assumed? I.e., no level 2.5 headers like vlan or mpls to complicate
> matters.

Yes ;)

>> @@ -516,6 +542,39 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
>>   specifically in the protocol.}.
>>      \end{itemize}
>>
>> +\item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feature and the
>> +  \field{gso_type} has the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or
>> +  VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit set, the GSO protocol is encapsulated
>> +  in a UDP tunnel.
>> +  The outer UDP header must not require checksum validation, i.e. the outer UDP
>> +  checksum must be a positive zero (0x0) as defined in UDP RFC 768.
>> +  The other tunnel-related fields indicate how to replicate the packet
>> +  headers to cut it into smaller packets:
>> +
>> +  \begin{itemize}
>> +  \item \field{outer_th_offset} field indicates the outer transport header within
>> +      the packet. Note that such field differs from \field{csum_start} as the latter
>> +      points to the inner transport header within the packet.
>> +
>> +  \item \field{inner_nh_offset} field indicates the inner network header within
>> +      the packet.
>> +  \end{itemize}
>> +
>> +\begin{note}
>> +For example, consider a partially checksummed TCP (IPv4) packet carried over a
> 
> partially checksummed here means CHECKSUM_PARTIAL?
> 
> The term makes sense within Linux, but intuitively partially
> checksummed could be interpreted to mean something like UDPLite: a
> checksum over part of the packet.
> 
> Perhaps checksum offloaded instead?

I used the same wording of the similar note describing plain TCP GSO 
packet a few lines above, for cargo cul...  consistency.

So just a small consistency-related resistence here.

> And since I'm bikeshedding: "Note that" is a phrase that can almost
> always be dropped entirely.

Will drop in the next revision.

>> @@ -557,6 +616,29 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
>>   driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
>>   \field{gso_type}.
>>
>> +If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, the driver MAY set
>> +VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit
>> +in \field{gso_type} according to the inner network header protocol type
>> +to request TCP or UDP GSO packets over UDPv4 or UDPv6 tunnel
>> +segmentation, otherwise the driver MUST NOT set neither the
> 
> not neither is a double negative. Neither already means not either, so
> this because not not either.

The intended meaning is a single negative (not set). I'll replace 
neither with either in the next revision.

>> @@ -598,6 +680,36 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
>>          header.
>>   \end{itemize}
>>
>> +If the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO option has been negotiated, the
>> +driver MAY set the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
>> +VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type}, if so:
>> +\begin{itemize}
>> +\item the driver MUST set \field{outer_th_offset} to the outer UDP header
>> +  offset and \field{inner_nh_offset} to the inner network header offset.
>> +  The \field{csum_start} and \field{csum_offset} fields point respectively
>> +  to the inner transport header and inner transport checksum field.
>> +\end{itemize}
>> +
>> +If the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
>> +VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type} are set, the
>> +outer UDP header MUST NOT require checksum validation. That is, the
>> +outer UDP checksum value MUST be 0 or the validated complete checksum
>> +for such header.
>> +
>> +\begin{note}
>> +The valid complete checksum of the outer UDP header of individual segments
>> +can be computed by the driver prior to segmentation only if the GSO packet
>> +size is a multiple of \field{gso_size}, because then all segments
>> +have the same size and thus all data included in the outer UDP
>> +checksum is the same for every segment. These pre-computed segment
>> +length and checksum fields are different from those of the GSO
>> +packet.
>> +\end{note}
> 
> The second variant, gso_partial, also implies that the outer header
> already has udph->length set to the segment length.
> 
> While the first variant does not. Right?
> 
> Probably worth clarifying.

I will do in the next revision.

Thanks,

Paolo

