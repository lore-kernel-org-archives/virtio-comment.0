Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD5F1ADFFE
	for <virtio-comment@lists.linux.dev>; Mon, 25 Nov 2024 16:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732552303; cv=none; b=ihpxMnc9S3hBsSJ0CG9zbDElA7NFNJHczoUlDbpioT3yUz6TSEOwRyeY0XXfdUCbNH1Ix7QsuAJ0ShCs/D1kbhzNNARa3Oy01W9h3VvET3YUfHLGt+cXGN8QFVSaxE/+MKvjMwOjLrIT3Zg1lv2SVbtIGokeSv0XUi61elhc7oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732552303; c=relaxed/simple;
	bh=FcKof3dyIAxs4aMism+ZRn1OprP8Tq0gN/3HT928zNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pmfD9xR43BnHE9+ZQeV3EHxxoB9vYEXo29Q8OXtWZARMTDo/4xx8HW/4ReO1NSoQqdKONfMrZ5FVzOx4KWvZYOSdT7NDFyRFov52vO10c9/9IwZxJMM0p0rz3oRztAo+iF8w+lEnklwdIulgwQu6w9IZX3Ch1pmLIheTfmLVd3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R31kx3Sz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R31kx3Sz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732552300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I855Yc1OOJdZ2hVbHk27LLWJmo0UaXswvybOQZmZPpc=;
	b=R31kx3SzSf1JHiLFdrdscSrocD+QbN1Zacwqc8r93rN4ue8QykELgRk80PJ9t2MdVtjjDH
	COzclORCSKfNm8hv/WwPfIDAeMBPCFXG+SOASfBq6vsWOJhcEr64GL2zl9t4t1EilYC9h+
	2t6atpbQOobLxhtRSUmITE0MlXA+ae4=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-470-BUemgyCTN9ydQLDxC_KSsQ-1; Mon, 25 Nov 2024 11:31:39 -0500
X-MC-Unique: BUemgyCTN9ydQLDxC_KSsQ-1
X-Mimecast-MFC-AGG-ID: BUemgyCTN9ydQLDxC_KSsQ
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d3a07b63e6so77073426d6.3
        for <virtio-comment@lists.linux.dev>; Mon, 25 Nov 2024 08:31:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732552298; x=1733157098;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I855Yc1OOJdZ2hVbHk27LLWJmo0UaXswvybOQZmZPpc=;
        b=eGqqscVOWt63Hnqe0HPKrChmtzNaoWwICfdB3aOF+vvSImbkgIkugzEONclLCSoMlf
         ZVtLblNto+/6PA7m4hdsvwDqSvS6CCFrAyNrt1MkHowsFtZE7xC4IO0jUC4nroiV4fFB
         vpkU3FTi7nS4w3Z5KuIIT9kltcaTenB88LuEQ1wj8VDpwPA1g+Q7qHuUmYM7UW2Y3NcG
         99K86MIOL6dPFPtGRuSl6xYm+nFyIFNuwukv+eH6o90DDgcsFSdMAtrjwOUcT30TeUoU
         r+sp/5RXzEgrhSFkBMrVp1KnuywaJRDFH+9R73cgYyWhpD+xrFJRsJ1wgXD5xKuYEq5C
         3kGA==
X-Gm-Message-State: AOJu0YwMCSfwuVGPT4OeWOERws7SKpSO8RrxXkbBnT3zRykqehnhD7SF
	jmpUyl923y08RBW1bjj/T8bscxMo18CY/d0L7HXf2Ell2hAVMgE1d/zQrERFvRAagY0KH0HUHDk
	mTakT2cbRcdRGA5hv4yBcXsCTmvGjJ5KwuI9LVjzIBLusYfXekgBMJoccvehoMviI
X-Gm-Gg: ASbGnctOmuUUPasWG2N2EAodpPk1d1PtXH0/X+sveafLLiw+dP4m8OKDTg/HGAs/oND
	it+X9edwD1B0vIy+s3V9E82Mgznvv06ke3K6C/cbQ8hhdh4rzpj7yKR7DqmhY5Y2vCSinwKIu45
	tkzr0APGuxLP5L9zkQpzyAdVBL4q2+Ryln1VgmC1lAEtbWScgV2gw7TnBmUqUnaTsHiYunLNdr9
	lr4/iDJJeAoLnJL5P7+C5Tkv81MhyDiQx5m9cupppFxBesfZFoKLwVQ77VJAl2aWpI1rNZGUdFd
X-Received: by 2002:a05:6214:224f:b0:6cb:c9e0:c299 with SMTP id 6a1803df08f44-6d450eed834mr218242206d6.27.1732552298442;
        Mon, 25 Nov 2024 08:31:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHf3r4ulpnRjZ/Z1NT6cbxyENHyF6KlDk+jlyxYNixNCYnfBhcZvcseqAzzxdz7YQ++nDbb8g==
X-Received: by 2002:a05:6214:224f:b0:6cb:c9e0:c299 with SMTP id 6a1803df08f44-6d450eed834mr218241846d6.27.1732552298135;
        Mon, 25 Nov 2024 08:31:38 -0800 (PST)
Received: from [192.168.88.24] (146-241-94-87.dyn.eolo.it. [146.241.94.87])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d451a83d8csm43964986d6.21.2024.11.25.08.31.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 08:31:37 -0800 (PST)
Message-ID: <b534b09a-76f8-4bc1-9d55-d5d667813e21@redhat.com>
Date: Mon, 25 Nov 2024 17:31:34 +0100
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/3] virtio-net: define UDP tunnel segmentation
 offload feature
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com,
 Eelco Chaudron <echaudro@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Willem de Bruijn <willemb@google.com>, kshankar@marvell.com
References: <cover.1731084277.git.pabeni@redhat.com>
 <c35d4e23bc260494a54f79479b8b722755bad66f.1731084277.git.pabeni@redhat.com>
 <CACGkMEs17PaqS2LmJo=DeB3eDF9EzzAfshPGvveEZ4xiEe4sgQ@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CACGkMEs17PaqS2LmJo=DeB3eDF9EzzAfshPGvveEZ4xiEe4sgQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vCvuPBWpGyROIWDOn3__apqej8g8X62SopwrxsNOf4w_1732552298
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/25/24 03:50, Jason Wang wrote:
>> @@ -554,6 +583,39 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
>>  specifically in the protocol.}.
>>     \end{itemize}
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
> 
> Do we need to clarify if "outer" here means outmost? Or we are
> assuming a 1 level of encapsulation here. We probably need more
> clarification in either cases.

Note that this is not the first place referring to the 'outer header'.

What if I extend the paragraph introducing
'VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO' a few lines above with:

"""
  GSO over UDP tunnels packets carry two sets of headers: the outer ones
  and the inner ones. The outer transport protocol is UDP, the inner
  could be either TCP or UDP. Only a single level of encapsulation
  offload is supported.
"""

The whole paragraph will read as:

"""
\item If the VIRTIO_NET_F_HOST_TSO6, VIRTIO_NET_F_HOST_TSO4 and
VIRTIO_NET_F_HOST_USO
  segmentation features are negotiated, a driver can
  use TCP segmentation or UDP segmentation on top of UDP encapsulation
  offload, when the outer header does not require checksumming - e.g.
  the outer UDP checksum is zero - by negotiating the
  VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feature.
  GSO over UDP tunnels packets carry two sets of headers: the outer ones
  and the inner ones. The outer transport protocol is UDP, the inner
  could be either TCP or UDP. Only a single level of encapsulation
  offload is supported.
"""

WDYT?

>> @@ -598,6 +660,29 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
>>  driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
>>  \field{gso_type}.
>>
>> +If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, the driver MAY set
>> +VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit
>> +in \field{gso_type} according to the inner network header protocol type
>> +to request TCP or UDP GSO packets over UDPv4 or UDPv6 tunnel
>> +segmentation, otherwise the driver MUST NOT set either the
>> +VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit
>> +in \field{gso_type}.
>> +
>> +When requesting TCP or UDP GSO segmentation over UDP tunnel,
> 
> I wonder if we can just remove this as
> 
> 1) if we want to support other type of GSO in the future, we need to
> add those types back to here
> 2) it only matters with the inner network protocol type

It's not clear to me which part would you prefer to remove. Do you mean
to rephrase the above as something alike:

"""
If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, the driver MAY set
VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit
in \field{gso_type} according to the inner network header protocol type
to request GSO packets over UDPv4 or UDPv6 tunnel
segmentation, otherwise the driver MUST NOT set either the
VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit
in \field{gso_type}.

When requesting GSO segmentation over UDP tunnel,
"""

basically I applied: "sed -e 's/TCP or UDP GSO/GSO/'"

Or did you mean something different?

Thanks,

Paolo




