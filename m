Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A46194AEB
	for <virtio-comment@lists.linux.dev>; Wed,  9 Oct 2024 08:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728463063; cv=none; b=dwcTFDg277rz4N/IKL07sPESTj7bup3i+ZENBzDXgree7GHUaujkj7PvEMT4hhrDaxjRFjWfN7EI3SkAezKDKPNCKUm0CDg3ZgGeCPGEaVBYMegAjQGSOK1RsmWmQZzBR0JjyHROfgkk/oCDwhENTskXGiJqt8lj9x9wrkkeLno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728463063; c=relaxed/simple;
	bh=jDSGLGqe75aDUnQTQPAmy60LZpr1EPCdJXJoH6VZbYQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n+CUjyCqawqdqt4ctwz9BNBtj918gu/tPQVyNuZvW8szvfNI3IudoxAERy712huJLKU0tJdoNu9Ei+1tWaaOiGq3RvG4QtUcZ26XQTmKv7TGsiOhYjIZeqsjO1AQ3SJYxq2fbnwTrUqAL7/VnxWIxLdfS27KfL3H1H5otDeGMqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NHU+tD4M; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NHU+tD4M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728463061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uw1e+aKO9WP9Mb7uLOMiqTeSrcu6jUtZREkwWBXGdEQ=;
	b=NHU+tD4MW2B/nfhq9mnjDoqOKS7T3rtQkqezFYcXa2BdihbtOvHDob0aHSh4QV9ypDgg6/
	gTfw74MUiyP0Doq1yDees+uGOsc75pHz+4fuN373lK1XalMkkin+xCHgUIIUkUkWVI9CI7
	rGs/qOO6TEqSM16/KqiBRyYbobJRk+k=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-6-i6RCfVfhP2CJ556Ldv-BIQ-1; Wed, 09 Oct 2024 04:37:39 -0400
X-MC-Unique: i6RCfVfhP2CJ556Ldv-BIQ-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-37cd08d3678so272834f8f.1
        for <virtio-comment@lists.linux.dev>; Wed, 09 Oct 2024 01:37:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728463058; x=1729067858;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uw1e+aKO9WP9Mb7uLOMiqTeSrcu6jUtZREkwWBXGdEQ=;
        b=KbzwEhyAos6oYkakte1e3BudUd/b5PSyBoY55UOIHPNNZ2wZ4CO+60X7+jlzFqQOog
         ln5vR5My4yILjnAsGuRriLf0N1H4UOIx1VArNk/GZGhidBWu2sy+Jq8QCl1bfPfqNwrO
         uXrydil3PQUbnBZv4BkuA5wwi8HLTHs9M+03O9KMp+YPR+a9cOBvH4y1t4o8AqkpKg8w
         D8+uo40NgKULegbcxOieOl6uGCH7gDht/rktP/vG1IqEbs2r5fEDGGtO6wxX1eswPN9R
         Wb92D6C2rDM87proAQSrbCh8v3yNlJNhsuhPCRfhr2Zw7tROSWo1nMsEgDlj2GimhGzV
         6Jfg==
X-Gm-Message-State: AOJu0Yw3XGM4bhvVp4NFbveOEyFvjZe4HW5o+/toQQ8G5MtK5ckGzZgB
	i6eQKE8NDzhLxpIy+ZrItveB9GbleiGg+Yj+LgTnWWuwC8pA9zng325Z0StHuIAKZBLxXpPEDZ/
	LMl3oO1DfI1vlZErPzeKiKgm74kiWnV6q4UZuHv5Ei/cqvlFzyTG4ETgB2jW2NSAw
X-Received: by 2002:adf:fe8b:0:b0:374:c21a:9dd4 with SMTP id ffacd0b85a97d-37d3a522b52mr1201083f8f.20.1728463058239;
        Wed, 09 Oct 2024 01:37:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2MzkoDcAsLCVGgvhkn/cablEJJXWSSu+aloJHzduKZlA2VpYkYH/Oho7RPI3Msd2HvNlz4g==
X-Received: by 2002:adf:fe8b:0:b0:374:c21a:9dd4 with SMTP id ffacd0b85a97d-37d3a522b52mr1201067f8f.20.1728463057770;
        Wed, 09 Oct 2024 01:37:37 -0700 (PDT)
Received: from [192.168.88.248] (146-241-42-55.dyn.eolo.it. [146.241.42.55])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1695ec1esm9865237f8f.74.2024.10.09.01.37.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2024 01:37:37 -0700 (PDT)
Message-ID: <d34f50af-4042-44c6-90e1-0acbbb899e96@redhat.com>
Date: Wed, 9 Oct 2024 10:37:35 +0200
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/2] virtio-net: define UDP tunnel segmentation offload
 feature
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com,
 Eelco Chaudron <echaudro@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Willem de Bruijn <willemb@google.com>, kshankar@marvell.com
References: <cover.1728029499.git.pabeni@redhat.com>
 <55306969c73f62bf4d100d15074bfd6cde741417.1728029499.git.pabeni@redhat.com>
 <CACGkMEvV0gtvgpb7z1MqJLKzHm-Be_8hkf0GzqqsFsfDG8oAeA@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CACGkMEvV0gtvgpb7z1MqJLKzHm-Be_8hkf0GzqqsFsfDG8oAeA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/9/24 09:18, Jason Wang wrote:
> On Fri, Oct 4, 2024 at 4:13 PM Paolo Abeni <pabeni@redhat.com> wrote:
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
>> by the existing csum_start field.
>>
>> Note that there is no concept of UDP tunnel type negotiation (e.g.
>> vxlan, geneve, vxlan-gpe, etc.), as a virtio device H/W implementation
>> can perform segmentation for every possible UDP-tunnel given the
>> specified new fields.
>> In the reverse direction, if a virtio device H/W implementation receives
>> some traffic for an unknown or unsupported UDP tunnel, it will simply
>> not aggregate the wire packet in a GSO one.
>>
>> Signed-off-by: Paolo Abeni <pabeni@redhat.com>
>> ---
>> v8 -> v9:
>>   - rebased on top of virtio-1.4, changed udp-tunnel features number
>>     to avoid conflicts/duplications
>>   - fixed typos:
>>     VIRTIO_NET_HDR_F_UDP_TUNNEL_IPV4 -> VIRTIO_NET_HDR_F_GSO_UDP_TUNNEL_IPV4
>>     VIRTIO_NET_HDR_F_UDP_TUNNEL_IPV6 -> VIRTIO_NET_HDR_F_GSO_UDP_TUNNEL_IPV6
>>   - specified strict validation on RX side (both driver and device)
>>     for UDP tunneled packet: NEEDS_CSUM and plain GSO are mandatory for UDP
>>     tunnel GSO packets. The driver is not allowed to set DATA_VALID for UDP
>>     tunnel GSO packets, the driver can set both DATA_VALID & NEEDS_CSUM.
> 
> DATA_VALID and NEEDS_CSUM are mutually exclusive unless I miss something.

AFAICS the specification does not specify them to be mutually esclusive 
and at least the linux kernel implementation allow them to be set together.

As a possible alternative to the change from v8 to v9 we can enforce 
DATA_VALID and NEEDS_CSUM to be mutually esclusive. GSO over UDP tunnel 
needs the csum_start offset; with DATA_VALID and NEEDS_CSUM mutually 
esclusive exclusive we must either:
- NOT allow GSO over UDP tunnel with DATA_VALID
or
- required csum_start being set with GSO over UDP tunnel and DATA_VALID

Please LMK which one is the preferred option.

>> @@ -639,12 +721,48 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
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
> 
> How could a device know if the checksum if pre-computed or not? (I
> could not find the relevant part in the sample kernel code).

Note that the UDP tunnel csum offload is discusses in patch 2/2 as per 
your request. At this point (only patch 1/2 applied) there is no concept 
of csum offload for the outer header. With only patch 1/2 applied the 
outer UDP will be always left-alone/ignored/not touched (either 0 or 
pre-computed).

In patch 2/2 is specified that the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit 
in flags carries the info about the outer csum offload. When set the 
outer csum is offloaded, when cleared is either 0 or precomputed.

>> @@ -776,12 +913,19 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
>>   \item If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
>>     VIRTIO_NET_HDR_F_DATA_VALID bit in \field{flags} can be
>>     set: if so, device has validated the packet checksum.
>> +  If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO feature has been negotiated,
>> +  and either the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
>> +  VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type} are set,
>> +  the device can additionally set the VIRTIO_NET_HDR_F_DATA_VALID bit
>> +  in \field{flags}, meaning that the device validated the checksum,
>> +  set the csum_start and csum_offset fields, but did not provide the
>> +  partial checksum for the transport header.
> 
> Interesting, we had this in the spec now:
> 
> """
> \item If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
>    VIRTIO_NET_HDR_F_DATA_VALID bit in \field{flags} can be
>    set: if so, device has validated the packet checksum.
>    In case of multiple encapsulated protocols, one level of checksums
>    has been validated.
> """
> 
> Firstly, it doesn't mandate the csum_start/csum_offset. Anything makes
> the tunnel GSO different?

This difference is intentional, to satisfy a requested from Willem for 
"robustness". We have a continuos flow of serious bugs in the current 
virtio implementation due to the spec allowing "unexpected"/strange/weak 
features combination leading to strange packet layout and crashes.

i.e. see the kernel commits:
49d14b54a527289d09a9480f214b8c586322310a
6513eb3d3191574b58859ef2d6dc26c0277c6f81
89add40066f9ed9abe5f7f886fe5789ff7e0c50e

The idea is that GSO over UDP tunnel specs are new, so we can be more 
strict and we try to mandate only 'sane' flag/features/layout combinations.

> Secondly, I think "one level of checksums" means the outer, this seems
> to be contradict to what we had here: 1) DATA_VALID seems to be for
> inner 2) no outer checksum offload

Yes, with this spec GSO over UDP tunnel DATA_VALID specify the inner 
head csum.

AFAICS the simpler option is allowing DATA_VALID with GSO over UDP 
tunnel without only with outer header csum offload, too.

> It looks like we want to reuse hdr->flags for inner, not sure if it
> would result come conflict when introducing outer checksum offload. Or
> maybe we should introduce a dedicated inner_flags.

I could not follow the above, could you please re-phrase?

>> @@ -920,6 +1092,24 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
>>   VIRTIO_NET_HDR_F_DATA_VALID is set, the driver MUST NOT
>>   rely on the packet checksum being correct.
>>
>> +If both the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit and
>> +the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in in \field{gso_type} are set,
>> +the driver MUST NOT accept the packet.
>> +
>> +If the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6
>> +bit in \field{gso_type} are not set, the driver MUST NOT use the
>> +\field{outer_th_offset} and \field{inner_nh_offset}.
>> +
>> +If either the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or
>> +the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type} are set, and any of
>> +the following is true:
>> +\begin{itemize}
>> +\item the VIRTIO_NET_HDR_F_NEEDS_CSUM is not set in \field{flags}
>> +\item the \field{gso_type} excluding the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4
>> +bit and the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit is VIRTIO_NET_HDR_GSO_NONE
> 
> Maybe we can just simplify this as
> 
> "VIRTIO_NET_HDR_GSO_NONE is set in \field{gso_type}"

I considered that option, the main problem is that such statement will 
never be true: gso_type has at least a bit set 
(VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 or 
VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6). I preferred to be more accurate 
even if more verbose. I think we should preserve this accuracy.

Thanks,

Paolo

