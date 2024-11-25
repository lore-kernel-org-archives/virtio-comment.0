Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC4716419
	for <virtio-comment@lists.linux.dev>; Mon, 25 Nov 2024 16:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732553097; cv=none; b=B51WC2q0QbJ5vRrWXMXz+HyUP6yF/2Q0cq9UBls/UQOSbZwOcBQHsXdqlNXfSl+xvTDg4g65NYFkxXaGq01IkZ8L9s9tcx9/znIyPhDXXXEFPGUt7Cd99QF/kG3U9/U1Sp5gtsFwNAGHJhrwTSYn9IQR5Tes5fQSVwHhjfvhkkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732553097; c=relaxed/simple;
	bh=MfEkWLUflM8dZV1vYw00t43i/m55po8bRU2iyckLA8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RAw1xwmx0vNfXxvjsVO6SfG+eo/uv6ldQ1dMU2GAu7Crto/UdLQVBQN8BisXexlUpHlrBsOyOhAs9JEtSiQVZyqFRuLGQFeFE9h0SgqdW1Htw96gw6TbHUVQMHy5Gjgq8MCLtu2e94dNy1cu5vcIXUJ4+cTOuI1gJGd2EP4W12E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SVRCMgYb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SVRCMgYb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732553094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EwIMI3eKu7EPgkiwFAoGhW55k/kAQxzTu8btZSRHZuc=;
	b=SVRCMgYb2iJQHXHsI4kLFNIcsSYYsBbf7qYkk9PG9+/Qp6Uf/17Fti0fshherEMEqoVJlh
	Da53MbMLO1KCAoPdh5c8eUKscXuYbvDSAtSLqXZ2nrVdcbT1ZL9LSLUjU0VOVaAF+gadni
	tIUtQpIu1OpbJSuG0grp+jbPd2j+LYY=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-462-tGRQAJ8cMZ63jOoxai4QrA-1; Mon, 25 Nov 2024 11:44:52 -0500
X-MC-Unique: tGRQAJ8cMZ63jOoxai4QrA-1
X-Mimecast-MFC-AGG-ID: tGRQAJ8cMZ63jOoxai4QrA
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-460b35f8214so77706941cf.1
        for <virtio-comment@lists.linux.dev>; Mon, 25 Nov 2024 08:44:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732553091; x=1733157891;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EwIMI3eKu7EPgkiwFAoGhW55k/kAQxzTu8btZSRHZuc=;
        b=JLoc+uL+NA69iaxvNwIOM+oLha+KkWWtioWmxLLrMJ7YmVdBlCj/Y+gBa+fAC1cPFA
         p3rWlcDPhgn6TqGvMASNhe1FQ1zcQbzg7XY5KcDYpUQUYbon5JQQxms7m4gcgJPfII4s
         bhY4MIUN7I+kQDen5/CoAXHTlVQPsBQWmidJa98TwOeUGfm+fYH71Hhd0qJB1YTHgC3c
         BUo11Us9+fzgGZNR7wIpqJbtaI9NsqHNC511vLDbSM4XepRvASlsehRLSm5IBgHQ57QP
         MmBtUdOFfWnh+FFC2nQU1sVXoC470OO2PDJGmYXGepAym8gvVkaZz6eEqsh789u5PA8M
         lF5A==
X-Gm-Message-State: AOJu0Yyy3uD+4uec0ZIAH/6RbjkN+1toLT+aULnHIVLb1286zXw4XrDf
	+5D5LX580cZ0OQAqdkh+5GDZ73I/JaHuZbHgHnNgm6d8zOgglo4kLLud/DdPSKaopvb5wLCedUs
	rGTt8q7jeQej9Pg+wr5S6Jew3O7pLQVQqZzPM5/805PXkFzy9VX34SoD6NhFMCmOu
X-Gm-Gg: ASbGncsL3cP9XxfhMGE80ULq1t4dvP9TZV/KsT3ieUF0lC/O8AUgDrfdOVgCW4xSyIb
	KccfoapNPTf4H9fSBKph8Oq3e2BmwcVXhmqcSfwA4DMv6LvMx4V5j2cMjXKTzNkWannySL9O12H
	W7RYIo7C81IW7QVx7Y6zlyChqGijzCh37pSAiRhFKbTgvilZ6f6RtzkFD98PlMLBZeUqXpl3wQZ
	e1uZ+sNggWPq0L9cRSsHLndrJ6OlaLt6yLyX5R2j0MzGshGgk87OxWSLqWwOwtYt9fUp8Z17rNf
X-Received: by 2002:a05:6214:412:b0:6d4:22fc:62fc with SMTP id 6a1803df08f44-6d450e84c53mr194006196d6.19.1732553091565;
        Mon, 25 Nov 2024 08:44:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEaqFGiYw/LiarSi0Nm4E7kkqccn5QMQ8DVRCDqP/ZX/hb064JTkruvOqIh8s8e5X74i1wJAg==
X-Received: by 2002:a05:6214:412:b0:6d4:22fc:62fc with SMTP id 6a1803df08f44-6d450e84c53mr194005906d6.19.1732553091289;
        Mon, 25 Nov 2024 08:44:51 -0800 (PST)
Received: from [192.168.88.24] (146-241-94-87.dyn.eolo.it. [146.241.94.87])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d451b23b1esm44357996d6.85.2024.11.25.08.44.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 08:44:50 -0800 (PST)
Message-ID: <88fa80f1-d82a-49c8-b933-7621d24b15df@redhat.com>
Date: Mon, 25 Nov 2024 17:44:48 +0100
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/3] virtio-net: define UDP tunnel checksum offload
 feature
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com,
 Eelco Chaudron <echaudro@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Willem de Bruijn <willemb@google.com>, kshankar@marvell.com
References: <cover.1731084277.git.pabeni@redhat.com>
 <4a81d0cac760abddfdeeb71da4c42ee0ba83cc4d.1731084277.git.pabeni@redhat.com>
 <CACGkMEtR62pqGA9fi3np7fmpexq6F1MAx3XD2s0bctKKSofrug@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CACGkMEtR62pqGA9fi3np7fmpexq6F1MAx3XD2s0bctKKSofrug@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: V3RbkvXPEY_a5ynNu88d52pm-WgS3pTOHgQziNKkX58_1732553091
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/25/24 04:41, Jason Wang wrote:
>> @@ -744,8 +797,23 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
>>    to the inner transport header and inner transport checksum field.
>>  \end{itemize}
>>
>> +If the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM feature has been negotiated,
>> +and the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or
>> +VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type} are set,
>> +the driver MAY set the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in
>> +\field{flags}, if so the driver MUST set the packet outer UDP header checksum
>> +to the outer UDP pseudo header.
> 
> Is this "to the checksum of the outer UDP pseudo header."?

Yes, good catch. I'll fix in the next version.

>> @@ -926,8 +1003,11 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
>>  \item If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
>>    VIRTIO_NET_HDR_F_DATA_VALID bit in \field{flags} can be
>>    set: if so, device has validated the packet checksum.
>> -  In case of multiple encapsulated protocols, one level of checksums
>> -  has been validated.
>> +  If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM feature has been negotiated,
>> +  and the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit is set in \field{flags},
>> +  both the outer UDP checksum and the inner transport checksum
>> +  have been validated, otherwise only one level of checksums (the outer one
>> +  in case of tunnels) has been validated.
> 
> Not a must but I'd suggest making this an independent patch. (I meant
> the " (the outer one in case of tunnels) has been validated." part).
> 
> Or after some thought, maybe it's just better to leave it as is. This
> means let the device choose which part has been validated:
> 
> 1) more flexibility that it allows the device to choose the level it
> can do the validation
> 2) no need to worry about the migration compatibility
> 
> But it would
> 
> 1) complicate the implementation of both the device and driver

Note that offloading the inner checksum only would be quite useless, as
AFAIK no OS as support for such a thing on RX.

I think it would be simpler to move the ' (the outer one in case of
tunnels)" in the previous patch. Why do you think it would be better to
have this single statement on a separate patch?

>>  \end{enumerate}
>>
>>  Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, UDP_TUNNEL
>> @@ -968,12 +1048,22 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
>>    bit MAY be set. In such case the \field{outer_th_offset} and
>>    \field{inner_nh_offset} fields indicate the corresponding
>>    headers information.
>> +\item If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM feature was
>> +negotiated, and
>> +  the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6
>> +  are set in \field{gso_type}, the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in the
>> +  \field{flags} can be set: if so, the outer UDP checksum has been validated
>> +  and the UDP header checksum at offset 6 from from \field{outer_th_offset}
>> +  is set to the outer UDP pseudo header checksum.
> 
> For tunnel GSO, as replied in the patch 2, I think we need to clarify
> the behavior for multiple levels of encapsulation.

Please LMK if the reply on patch 1 suffices: this infra supports offload
for a single level of encapsulation.

Cheers,

Paolo

