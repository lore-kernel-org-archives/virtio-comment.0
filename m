Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F3213D531
	for <virtio-comment@lists.linux.dev>; Wed,  9 Oct 2024 09:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728466763; cv=none; b=bjrW/316kJQbK1LJNDBbkNoZAECXOC9Ay9BeFS66pJ2u6CR2VTYzqoQqfMZJ73QPYbSsJZr/tNqDTNAF9XUwJlE3vPYVsifCMsPMvOOEtn1+P1UUnmAFGpUAR9zRrgPOhveROlfQLJIbPJu1XQPhFm3w35CiVgoWoVPz93N6Nzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728466763; c=relaxed/simple;
	bh=2sqFGs1SWJfLcEeg3Awod/wKVTgjflT3pk9mjTA2IXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R80mMsBt6u/GkHmXGHcVvvNAbvjjUZjBn951YWxpz2zNh00LO+pVXOK+qZCkuwZgdEmJ3jF8UFbajViDZJ2PO5tkHwDe/ur2wROI6D/XQxy4B6fxziLlgFix3ElvXqlrLY1bjMfGfC2B6mfXQLnbOSI4Zy11ObGGJh1ICD4LFA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VvkD/P1j; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VvkD/P1j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728466760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=04VmU5kfRd9FhlD+WJm40t+h983zg/n/f/aTw9k+Pdc=;
	b=VvkD/P1jW343UsdMuG2bwSZHKg1XHEbDFp3oU84sVyiAX9CdC2nVDZP+g231vjhMa9CG3y
	5YDE8U1ujwDFqRfy7ysgYX64wSpHb15n7rTgJl3DuNPZ7wCHdsXISaXETnUMh2vsHuZQSe
	VRjdl8SN4NobwtYKGjy0oArdSF82hlc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-1J4daDqPMjaPMNHqWKYQvw-1; Wed, 09 Oct 2024 05:39:19 -0400
X-MC-Unique: 1J4daDqPMjaPMNHqWKYQvw-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-42cdeac2da6so57069705e9.2
        for <virtio-comment@lists.linux.dev>; Wed, 09 Oct 2024 02:39:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728466758; x=1729071558;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=04VmU5kfRd9FhlD+WJm40t+h983zg/n/f/aTw9k+Pdc=;
        b=PkoakSj+M6Tl5jBsnrX8auCY4M/z4gE3qTBiwr67gvzn4uIFpJ3DPC8/apPVBSMfr5
         EZbZAoK5MCW/+OzzyKKKXNL3przle5q/C9awtFr6OGSPZaS7mBEk+xg/ijMbxoBy1YTr
         Ij8fdRIodR71oG3JhVDNTeqxnU603VDH3Xl+/6L8kYr5p4l5zFv3AkW0i2P8/uSDz6od
         AXwYydVdTmU5d87/m1nMpI3WHVouatabbSwO7eePulPchXrDRtnOeV1v/v2KPf2C7r2x
         I0Hxp11dZlpd239Af6r8E1u5TUs7+tFaHK4mxw1ldvi+DB73XvuXcDSgNWvvZvy3A2qp
         bLxg==
X-Gm-Message-State: AOJu0YygduVO72F/YNf4/teVPqZmp4VdM7GtpuODxYMypnDHLXyv56D2
	PFEr9bXKDLKXlnD6539GpxfXSsOsOCd/wIQNxny9wgMg51jisv6DMzHNsGIFXB3LwAVmPK3hOwO
	QTq2+j4i5j+Fu0zamKCSiEqDL74AM2o2J5OIEWJ5KQhJH3/Mh2q851sYp74XZBEZw
X-Received: by 2002:a5d:688a:0:b0:374:c64d:5379 with SMTP id ffacd0b85a97d-37d3a9f8707mr1135063f8f.27.1728466757865;
        Wed, 09 Oct 2024 02:39:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHR54Dyo74heq4V4Dk+HVHMfMpUbEp6ITW6QE0GFJu6GIYaCueSusRyuEEpAZinekgWdGNlFQ==
X-Received: by 2002:a5d:688a:0:b0:374:c64d:5379 with SMTP id ffacd0b85a97d-37d3a9f8707mr1135044f8f.27.1728466757298;
        Wed, 09 Oct 2024 02:39:17 -0700 (PDT)
Received: from [192.168.88.248] (146-241-42-55.dyn.eolo.it. [146.241.42.55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430d70b41bfsm14631905e9.29.2024.10.09.02.39.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2024 02:39:16 -0700 (PDT)
Message-ID: <7e396509-f996-453b-baea-2e2ea0cf179d@redhat.com>
Date: Wed, 9 Oct 2024 11:39:15 +0200
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/2] virtio-net: define UDP tunnel checksum offload
 feature
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com,
 Eelco Chaudron <echaudro@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Willem de Bruijn <willemb@google.com>, kshankar@marvell.com
References: <cover.1728029499.git.pabeni@redhat.com>
 <dd1f0e96d889daec3e53ffd21cbbd061aad8cb9a.1728029499.git.pabeni@redhat.com>
 <CACGkMEsP3uobKB1aM=9NFFbdH8nGBsdb86F=LkAJgxafoAuJTw@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CACGkMEsP3uobKB1aM=9NFFbdH8nGBsdb86F=LkAJgxafoAuJTw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/24 09:18, Jason Wang wrote:
>> @@ -168,6 +176,13 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
>>   \item[VIRTIO_NET_F_RSS_CONTEXT] Requires VIRTIO_NET_F_CTRL_VQ and VIRTIO_NET_F_RSS.
>>   \end{description}
>>
>> +\begin{note}
>> +The dependency between UDP_TUNNEL_GSO_CSUM and UDP_TUNNEL_GSO is intentionally
>> +in the opposite direction with respect to the plain GSO features and the plain
>> +checksum offload because UDP tunnel checksum offload gives very little gain
>> +for non GSO packets and is quite complex to implement in H/W.
>> +\end{note}
> 
> Nit: maybe it's better to define "plain GSO" or just call it "non-tunnel GSO".

I'll opt for "non-tunnel GSO".
Note this section is not changed from the previous iteration.

>> @@ -731,8 +782,23 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
>>     to the inner transport header and inner transport checksum field.
>>   \end{itemize}
>>
>> +If the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM feature has been negotiated,
>> +and the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or
>> +VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type} are set,
>> +the driver MAY set the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in
>> +\field{flags}, if so the driver MUST set the packet outer UDP header checksum
>> +to the outer UDP pseudo header.
>> +
>> +\begin{note}
>> +calculating a ones' complement checksum from \field{outer_th_offset}
>> +up until the end of the packet and storing the result at offset 6
>> +from \field{outer_th_offset} will result in a fully checksummed outer UDP packet;
>> +\end{note}
>> +
>>   If the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
>> -VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type} are set, the
>> +VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type} are set
>> +and the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM feature has not
>> +been negotiated, the
>>   outer UDP header MUST NOT require checksum validation. That is, the
>>   outer UDP checksum value MUST be 0 or the validated complete checksum
>>   for such header.
> 
> Nit:  do we need to mention this is for TX?

Note that this the '\drivernormative... Packet Transmission' section. 
With 'TX' I guess you refer to '\devicenormative... Processing of 
Incoming Packets'? It's already there:

"""
Otherwise, the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM feature has been
negotiated, either the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit is set or the
VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit is set in \field{gso_type},
and the bit VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM is not set in
\field{flags}, the device MUST either provide a zero outer UDP header
checksum or a fully checksummed outer UDP header.
"""

>> @@ -920,8 +995,11 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
>>     in \field{flags}, meaning that the device validated the checksum,
>>     set the csum_start and csum_offset fields, but did not provide the
>>     partial checksum for the transport header.
>> -  In case of multiple encapsulated protocols, one level of checksums
>> -  has been validated.
>> +  If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM feature has been negotiated,
>> +  and the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit is set in \field{flags},
>> +  both the outer UDP checksum and the inner transport checksum
>> +  have been validated,
> 
> We may need to clarify this is for RX. 

I'm sorry, I'm still slightly confused by the 'RX' alone. This is in the 
'\devicenormative ... Setting Up Receive Buffers' section, do you mean 
the other direction?, that is '\drivernormative ... Processing of 
Incoming Packets'?

Currently such section only prescribe 'MUST NOT' behavior (even for non 
tunnel GSO), such clarification does not seam to fit there?!?

> What's more, this seems to be
> the semantic of DATA_VALID? If yes, to be consistent, something like
> VIRTIO_NET_HDR_F_UDP_TUNNEL_DATA_VALID might be better.

The VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM bit just specify how many 
csums are validated by the driver (or the device).

If DATA_VALID is set, this is checksum unnecessary. Otherwise is csum 
partial. Its specificed a few lines above:

"""
\item If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
   VIRTIO_NET_HDR_F_DATA_VALID bit in \field{flags} can be
   set: if so, device has validated the packet checksum.
   If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO feature has been negotiated,
   and either the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
   VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type} are set,
   the device can additionally set the VIRTIO_NET_HDR_F_DATA_VALID bit
   in \field{flags}, meaning that the device validated the checksum,
   set the csum_start and csum_offset fields, but did not provide the
   partial checksum for the transport header.
"""

> And is there a chance that we may need partial csum for outer UDP e.g
> in the case of VM2VM communication.

I feel like I'm missing something?!? AFAICS this is has been already 
discussed, agreed and set int spec. This specification allows for 
checksum partial for the outer header, in both direction 
(VIRTIO_NET_HDR_F_DATA_VALID not set and 
VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM set.

>> @@ -957,6 +1035,14 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
>>     bit MAY be set. In such case the \field{outer_th_offset} and
>>     \field{inner_nh_offset} fields indicate the corresponding
>>     headers information.
>> +\item If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM feature was
>> +negotiated, and
>> +  the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit is set in \field{gso_type}, the
>> +  VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in the \field{flags} can be set: if so,
>> +  the outer UDP checksum has been validated.
>> +  If the VIRTIO_NET_HDR_F_DATA_VALID bit in \field{flags} is not set, the UDP
>> +  header checksum at offset 6 from from \field{outer_th_offset}
>> +  is set to the outer UDP pseudo header checksum.
> 
> Just to confirm, VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM is for outer and
> VIRTIO_NET_HDR_F_DATA_VALID is for inner in this case?

The VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit specify if the outer header has 
been validated: with !VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM only the inner 
header is validated, with VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM set, both the 
inner and the outer.

The VIRTIO_NET_HDR_F_DATA_VALID specify if it's the packet is 
csum_partial (!VIRTIO_NET_HDR_F_DATA_VALID) or csum_unnecessary 
(VIRTIO_NET_HDR_F_DATA_VALID). It refers only to the inner header when 
!VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM or to both the inner and the outer 
when VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM is set.

The relevant spec wording is:

"""
\item If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
   VIRTIO_NET_HDR_F_DATA_VALID bit in \field{flags} can be
   set: if so, device has validated the packet checksum.
   If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO feature has been negotiated,
   and either the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
   VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type} are set,
   the device can additionally set the VIRTIO_NET_HDR_F_DATA_VALID bit
   in \field{flags}, meaning that the device validated the checksum,
   set the csum_start and csum_offset fields, but did not provide the
   partial checksum for the transport header.
   If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM feature has been 
negotiated,
   and the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit is set in \field{flags},
   both the outer UDP checksum and the inner transport checksum
   have been validated, otherwise only one level of checksums (the inner one
   in case of tunnels) has been validated.
"""

Is that unclear? which part needs rewording?

Thanks,

Paolo

