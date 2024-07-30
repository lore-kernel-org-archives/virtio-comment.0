Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD4E169382
	for <virtio-comment@lists.linux.dev>; Tue, 30 Jul 2024 07:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722325113; cv=none; b=d7ZR8U6E0Pyyx7GXOJcUYWdU77JYpPxLVZ9mq9gnMgnCgUJ69VUphbzezr98Nem8tokIUxufac8eeTU4+CpBPwrsQ/4koT+gohoC8ucieN+t0j+Q4qAIQTvkS605waEoyO6DXlelSnB09DoA7U3FjOUzA9GE67w12aatJNGOMwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722325113; c=relaxed/simple;
	bh=7czYxcoEDA5WYJjf/ZMoGpSxQ91EALcZoV81Z8SDyg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nw15xek+1nbMap9jlPlTEdEHv5M5wsV3bOAgyWPtetkf8V5PI5c5BQIa1+/vvm8mTXHuGbARADnUhi2hvTHlaczUEvHPSK0rdhSVxitltcDmXa2BNzIXQ0jlhhDQJ3GQcYu0lbGLTRxMVEaFyeuymf1enhT0qCTZ9IqAS/CF02U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DwPOIEAP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DwPOIEAP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722325109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qh8kclIhYwBc4mMLTR9mAjfTcoEHEXIrBx9ZMz0rWAY=;
	b=DwPOIEAPxXgzriy5eH4mLc/sZuU3I5ZhvCUqW7B+KpHgvDtxauQYfLTRIPiZRsqqc/fmZE
	IDzpntkZYzdy9UXsf8p9kx74+35px/5o2u/T8XljJl9IB450MdHKSGSCx3ppDU4+LYDEwF
	5a2UmYUZO6bi1neslDcoy4MjNpWovYc=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-202-uTl8rW2UOBKSPpRuDsrb9g-1; Tue, 30 Jul 2024 03:38:26 -0400
X-MC-Unique: uTl8rW2UOBKSPpRuDsrb9g-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2f0247c77c8so4948331fa.3
        for <virtio-comment@lists.linux.dev>; Tue, 30 Jul 2024 00:38:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722325103; x=1722929903;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qh8kclIhYwBc4mMLTR9mAjfTcoEHEXIrBx9ZMz0rWAY=;
        b=EHDQaIXzou8KDipayi3uVvjUs7/7CCnt4VEAKxHuE2MhNnyETya3xDP6KhxOEPrN72
         RguvL1ix7I/pAmgaWtgxYvuKEsWc+GW4kps0Y8cKx1prclAEC4hLq046t5YygHpIeXsD
         2X/VPNYDxpS5nytVI0lrez1T8HXHxtb6ReTPUKAeMKGSYEkHhVZ0zC8/w7l98BAyS2YV
         UljUOcy6C9ROInU9Le5rZ8+0KkuXNVP9S1fXRpvRsUeaF9z8M1PcBMh/MtnfWFbsjo3D
         VHKa8nCLP9ruWQg4cTCAfwg9PUMzjxMCB6gBxsMw6UwN+NSzG9ObhmT5QoSwEqMSM/+g
         4TKQ==
X-Gm-Message-State: AOJu0Yy85OAvEID8QlQtwHU8u5Xtn/bO9pwbuf5yc5fWMfoaM8m4CeAu
	OEUsauakZqqZ6JBF1yZQrp4/Lq7GWLAR70z64L3zlqfJ5TFdsXAyLSlE6Pau7IOAQwKpShoOgTK
	P6Q5FDLoAJFsv2MHeTy6/rk/5mZgK3l0+t7FcKwJzzpPs3mazPMy/lOa8lx4vawrl
X-Received: by 2002:a2e:870f:0:b0:2ef:17df:6314 with SMTP id 38308e7fff4ca-2f03c78612dmr55576451fa.4.1722325103387;
        Tue, 30 Jul 2024 00:38:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOZVnVzRm+s9p81HFxCcuyWkXekScgyhYpnjKE/pnW0SsGHeyAcy9sNGJeCKUpp9bLdY8Hfw==
X-Received: by 2002:a2e:870f:0:b0:2ef:17df:6314 with SMTP id 38308e7fff4ca-2f03c78612dmr55576291fa.4.1722325102847;
        Tue, 30 Jul 2024 00:38:22 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:1712:4410:9110:ce28:b1de:d919? ([2a0d:3344:1712:4410:9110:ce28:b1de:d919])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427f93592b6sm250876915e9.3.2024.07.30.00.38.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jul 2024 00:38:22 -0700 (PDT)
Message-ID: <46f6da7e-d20d-42b3-b23b-73237ae323fe@redhat.com>
Date: Tue, 30 Jul 2024 09:38:21 +0200
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
 <CA+FuTSc7hoJPuWSWwZCogzyUHcnD_2d5+ihFZZaKFAn7R==2UQ@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CA+FuTSc7hoJPuWSWwZCogzyUHcnD_2d5+ihFZZaKFAn7R==2UQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 7/29/24 23:36, Willem de Bruijn wrote:
> On Mon, Jul 29, 2024 at 5:04 PM Willem de Bruijn <willemb@google.com> wrote:
>>
>> On Mon, Jul 29, 2024 at 7:30 AM Paolo Abeni <pabeni@redhat.com> wrote:
>>>
>>> The VIRTIO_NET_HDR_GSO_UDP_TUNNEL is a gso_type flag allowing GSO over
>>> UDP tunnel. It can be negotiated on both the host and guest sides.
>>>
>>> One constraint addressed here is that the virtio side (either device or
>>> driver) receiving a UDP tunneled GSO packet must be able to reconstruct
>>> completely the inner and outer headers offset - to allow for later GSO.
>>>
>>> To accommodate such need, new fields are introduced in the virtio_net
>>> header: outer_th_offset, inner_protocol_type and inner_nh_offset.
>>> They map directly to the corresponding header information. The inner
>>> transport header is implied by the (inner) checksum offload.
>>>
>>> Those fields are required because a virtio device H/W implementation
>>> performing segmentation for UDP tunneled packet will need to touch
>>> the outer transport protocol (for the UDP length filed), the
>>> inner network protocol (for the total length field, in the IPv4
>>> case).
>>>
>>> Note that segmentation will additionally need to touch
>>> the outer network protocol and the inner transport protocol. The first
>>> is implied/easily found with trivial parsing, the latter is identified
>>> by the existing csum_start field.
>>>
>>> Note that there is no concept of UDP tunnel type negotiation (e.g.
>>> vxlan, geneve, vxlan-gpe, etc.), as a virtio device H/W implementation
>>> can perform segmentation for every possible UDP-tunnel given the
>>> specified new fields.
>>> In the reverse direction, if a virtio device H/W implementation receives
>>> some traffic for an unknown or unsupported UDP tunnel, it will simply
>>> not aggregate the wire packet in GSO one.
>>>
>>> Signed-off-by: Paolo Abeni <pabeni@redhat.com>
> 
>>> +
>>> +\begin{note}
>>> +The valid complete checksum of the outer UDP header of individual segments
>>> +can be computed by the driver prior to segmentation only if the GSO packet
>>> +size is a multiple of \field{gso_size}.
>>> +\end{note}
>>
>> Might be helpful to explain why. E.g., ", because then all segments
>> have the same size and thus all data included in the outer UDP
>> checksum is the same for every segment. These pre-computed segment
>> length and checksum fields are different from those of the GSO
>> packet."
> 
> Does this part belong in patch 2/2?

Possibly is a bit border-line.
IMHO it could belong to this patch, too. The idea is to specify one of 
the scenarios what will not require checksum offload.

Thanks,

Paolo

