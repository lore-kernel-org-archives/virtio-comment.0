Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B3B1AAE30
	for <virtio-comment@lists.linux.dev>; Wed, 31 Jul 2024 09:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722417413; cv=none; b=fVF1d352r5u1uSR0pc198QYla3JbYdicnCDJVbp0wQplmt8uDt34YJcGlYFE8NFCKosh92FUa/Z4diELXCiCilB97nW9JEWo5oCgg7fS5EitqyJIRIOP2OwYme5V7ZKqt6s7NtclIYhZIr+9yCeFaO7tGG8zIWTSUeXUFJrP+4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722417413; c=relaxed/simple;
	bh=bdYyJgMtZ40TD+j/h4EGeQjrRNZ8zg62/qIN/Zj9D7s=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Z6I0tz1J1fQsI3mDmFARErhMq3qUw4QDFk/CaaSj43vTsnnDXW6rjSEAFjXYD3CBAi9vWdaj7IHSqyZ8N3Wl56OOc0dhgjSMm3LVDYLWChiXeICk0JcQhhLpWlEKiwqs38vONHK71gawtPf6fJ0Iv15zJZrvH/SeHD/JZ8X+Qrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jTr4PNlc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jTr4PNlc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722417410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8VwhWtSd+V0tcNe68fBMu5rh9/UrYXsScmIL2bNoUvI=;
	b=jTr4PNlcF0HUhhUoDVo2CThu6peKs9bYjOrW76x3m7FIF5/GFyEMELcpmy9X/E48wKKzZ3
	sTi0P0Fbj33ZMGDToGfBpiPD5mwADp3e0zMOzg8TLIMvsFTS6cX947o22sP5WLk5Lq/WOe
	ZbVBPAbSdVAA/kcDsVTdk3Yhx0GzYYY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-1248lpaIPnOERdze8NOeFQ-1; Wed, 31 Jul 2024 05:16:48 -0400
X-MC-Unique: 1248lpaIPnOERdze8NOeFQ-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-42818ae1a68so6719425e9.2
        for <virtio-comment@lists.linux.dev>; Wed, 31 Jul 2024 02:16:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722417407; x=1723022207;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8VwhWtSd+V0tcNe68fBMu5rh9/UrYXsScmIL2bNoUvI=;
        b=NQ/8nlgO+6Vk9FnmcGC2RXgPZmgZm66l74T+6F/PqzHMOBMqL7a8hnHDcQw0ulB5GQ
         TPMxXa+QMbgPoSOqz0362pZ9VP6HyZWqdl1XYzsMKHCnYq+goxSzEPJ3kqP0K/xXH9v+
         RfOtbmUkrG8Sd+IT1CJzXepV4A6l3WOgVOXpjGeP69on1PeO/OJTZnvYOAtNy42PpFv1
         Q6T0Ioanu3fcUP+dUU1IqKOltm15YTeDwX+x5Ssl3XQABCCEzhS/nlE4mGab6RhmfDyQ
         FClF7AIawVbgmrE411Rh+/i4Vb2Ml5iaO45gd2btuhAHisLtlk4OzrybCWVZ7CbmHUmy
         QJZg==
X-Gm-Message-State: AOJu0YwmDh65njw9N1MgEc0XvqS91hF97CTYnFLx3nRqZxC7sPJ8BRXl
	l/djUqActcpXzVpiz/QDqlj7VjjpcvsLoFBa0B7b72A+NN4oBqV6NNbs1FBWpd1OllqhO0PLGqp
	AHo4awtX+xYrHEn8x3vE1NZVkK2E63vNPo6CKS/HXykR2+cwp/B6n5XrlGLhrFJ3l
X-Received: by 2002:a05:600c:1387:b0:426:6fc0:5910 with SMTP id 5b1f17b1804b1-428054feb50mr88893185e9.1.1722417407302;
        Wed, 31 Jul 2024 02:16:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGj/cxz6/lTOJ2RrOm3X9apk+zhPojjKVDzHP0r2qqTeBdGFYSubRDGehpuIoIoYgxj332kNQ==
X-Received: by 2002:a05:600c:1387:b0:426:6fc0:5910 with SMTP id 5b1f17b1804b1-428054feb50mr88893025e9.1.1722417406757;
        Wed, 31 Jul 2024 02:16:46 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:1712:4410::f71? ([2a0d:3344:1712:4410::f71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b36861b1esm16569358f8f.92.2024.07.31.02.16.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 02:16:46 -0700 (PDT)
Message-ID: <1a8593d0-a658-4fc6-8fc2-e0a3fdc1d5d0@redhat.com>
Date: Wed, 31 Jul 2024 11:16:45 +0200
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
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com,
 Eelco Chaudron <echaudro@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Willem de Bruijn <willemb@google.com>
References: <cover.1722252302.git.pabeni@redhat.com>
 <2977107dcc842c0665227f7c3696157ecd15a1b2.1722252302.git.pabeni@redhat.com>
 <CACGkMEsOPcyUevsGcZeR8311-=5kGt5bRmxDQ3XGYQ3_S4Diyw@mail.gmail.com>
 <a9a575a8-3ffe-4c0a-9ed3-4eb1174e8364@redhat.com>
In-Reply-To: <a9a575a8-3ffe-4c0a-9ed3-4eb1174e8364@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/31/24 10:43, Paolo Abeni wrote:
> On 7/31/24 03:57, Jason Wang wrote:
>>>    \item[VIRTIO_NET_F_HOST_TSO4] Requires VIRTIO_NET_F_CSUM.
>>>    \item[VIRTIO_NET_F_HOST_TSO6] Requires VIRTIO_NET_F_CSUM.
>>>    \item[VIRTIO_NET_F_HOST_ECN] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_NET_F_HOST_TSO6.
>>>    \item[VIRTIO_NET_F_HOST_UFO] Requires VIRTIO_NET_F_CSUM.
>>>    \item[VIRTIO_NET_F_HOST_USO] Requires VIRTIO_NET_F_CSUM.
>>> +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO] Requires both VIRTIO_NET_F_HOST_TSO4 and VIRTIO_NET_F_HOST_TSO6, or
>>> +   both VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6.
>>>
>>>    \item[VIRTIO_NET_F_CTRL_RX] Requires VIRTIO_NET_F_CTRL_VQ.
>>>    \item[VIRTIO_NET_F_CTRL_VLAN] Requires VIRTIO_NET_F_CTRL_VQ.
>>> @@ -375,6 +385,12 @@ \subsection{Device Initialization}\label{sec:Device Types / Network Device / Dev
>>>      TCP), VIRTIO_NET_F_HOST_TSO6 (IPv6 TCP), VIRTIO_NET_F_HOST_UFO
>>>      (UDP fragmentation) and VIRTIO_NET_F_HOST_USO (UDP segmentation) features.
>>>
>>> +\item If any TCP or UDP segmentation feature is negotiated,
>>
>> Not a native speaker but this seems to conflict with the above. For
>> example, does "only VIRTIO_NET_F_GUEST_TSO4 is negotiated" mean any
>> TCP segmentation feature?
> 
> As per the previois comment, I'll change this in the next revision to:
> 
> """
> If the VIRTIO_NET_F_HOST_TSO6, VIRTIO_NET_F_HOST_TSO4 and
> VIRTIO_NET_HDR_GSO_UDP_L4 features are negotiated
> """

Typos above, should be:

"""
If the VIRTIO_NET_F_HOST_TSO6, VIRTIO_NET_F_HOST_TSO4, 
VIRTIO_NET_F_HOST_USO features are negotiated
"""

Cheers,

Paolo

