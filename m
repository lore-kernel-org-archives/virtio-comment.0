Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B583A1DA
	for <virtio-comment@lists.linux.dev>; Thu,  1 Aug 2024 16:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722529588; cv=none; b=cyciHAW9LBzE8WyNGpez+jXN5nV0zWs1wNyFELvKTAypIQDw7DREmEa0RlwteEvH4pZaONjipHw8UM1IjjL32ZY5Gu9C4w2+QZaxKklNbU225mpeyjDSERZuHPp4/MijDfaqGALZb1uxQ/6U7lqIpso+OqT8Sq+Me6puzE13xys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722529588; c=relaxed/simple;
	bh=gP1lFZSiwI3PWJp4Kilswl27WC1cZw+/rlcfYKJeYLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=spmza546ADJQIyVDi14kxk2ouu6RxKgnsD7cmcRvFYyWCtJYp10pDL7RVhqpNItp4nUzpK7+0kw9HHeclbfJnx+vlpZz79+wJe/pGhuE2QaWo5bG1fDFuLN1H3SkX4NHsZ60jgjWUjTdhD9UXodAalsIz4OoErYfdDxodEXWbNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ftO/1TVj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ftO/1TVj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722529585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6jj3L4VjNEi/KTYnZB+PBLFvAKjrV0o0KxE1p1EHfWE=;
	b=ftO/1TVj2fhUvohd+elISqZ+vePm5QaCpGmNP05lLXTJ1cuzk45J3/tDyrDPaoPbuQenms
	P81L6N+bjfz/fK8lUJmVHD8zV+HvfgmMHejhkzIfqXcNO1ya82ANCK4M0R9MQbWKr4U2i+
	1QYZlJgi13Bv8U1+iSCfzzR9538BqeY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-71YC-yz7MmuTdsRKvzZVVA-1; Thu, 01 Aug 2024 12:26:24 -0400
X-MC-Unique: 71YC-yz7MmuTdsRKvzZVVA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-42808f5d32aso9521935e9.2
        for <virtio-comment@lists.linux.dev>; Thu, 01 Aug 2024 09:26:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722529583; x=1723134383;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6jj3L4VjNEi/KTYnZB+PBLFvAKjrV0o0KxE1p1EHfWE=;
        b=WPC8+ShNFlHIf9t/Zr1xCmHxY8tcF8kj2HAdJ2cDZdm/yngN7ow5NFHe22pjp/4n0V
         +TheFto80iHZ7Fnz9UBnMQXMNz2iGl52ldbiU/XJSA7bcmxKbKMRGBPZy1EhaoHZyV9D
         2jfkxUvNzz1Z9T1TNDuZfBZuppaaU332xGyNYcZW0GYZ10b4C/S/XyGLELyRsqQ6v9JW
         q0kI9OBk7mP3OmCGPdhmbjSmN0vDEa/R69Gjjf7uLy2dF8MJptzeDOCO1h4TaX5QSc8Y
         PAIqY3ANuEceysqeGQ7H+nys8xmzh6qD8kUCoMpv2CTEDEj9uMMuCP5Cnyi82eqV8Pkg
         XGdw==
X-Forwarded-Encrypted: i=1; AJvYcCUiu84gx5e+7sOM1LcItw9OtC6jCX6gLpU1XuCQ5j3s3Qt0f0pdvXGGKYmQixQ3i8thTm5FLH4Ns/nPzJFtCraZ/pqiSoki2M7rVS00id0=
X-Gm-Message-State: AOJu0YwjtyUf/5ycpwlgIOB0U7Xys189dk8KAlBMcVEF4d/qaq4YwFyc
	slzEDnq4IslO4MN3Q4DmsjEPN3zX2t26V9OxrXqGum1ZNA/Z/c2y5YWSmoe21zZASZLtcSpAOt6
	lkg/uxs1MPBM3zYP86P6mQ1CvsxbzTOVp9EEmtZKbEpoW/6g/s2cUx75NkYNVpH8h
X-Received: by 2002:a05:6000:1886:b0:368:4e52:5877 with SMTP id ffacd0b85a97d-36bbc1a703dmr137121f8f.9.1722529582747;
        Thu, 01 Aug 2024 09:26:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfDrtj3juO1LJufiGCImjt6NQ1pj8a1DkQk5ZsRsL5iAke1iNwfVirkZTUJrwVSqOgeLVubg==
X-Received: by 2002:a05:6000:1886:b0:368:4e52:5877 with SMTP id ffacd0b85a97d-36bbc1a703dmr137105f8f.9.1722529582195;
        Thu, 01 Aug 2024 09:26:22 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:1712:4410::f71? ([2a0d:3344:1712:4410::f71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b3687003dsm19727136f8f.115.2024.08.01.09.26.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Aug 2024 09:26:21 -0700 (PDT)
Message-ID: <b5e8135e-9034-45f1-9e78-a5405073dfc6@redhat.com>
Date: Thu, 1 Aug 2024 18:26:20 +0200
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
Cc: Jason Wang <jasowang@redhat.com>, virtio-comment@lists.linux.dev,
 maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
References: <cover.1722252302.git.pabeni@redhat.com>
 <2977107dcc842c0665227f7c3696157ecd15a1b2.1722252302.git.pabeni@redhat.com>
 <CA+FuTSfu8Sys_s+3jpXoS0GbZC4stOVgBrEYOtA9YoTCEJkJAA@mail.gmail.com>
 <d79c4ed9-c1d5-4c9c-9f10-661745edf96c@redhat.com>
 <CACGkMEu6dnKOgYVYRWKadXirnk4R6Rc16ojNR=oSX-a22Rt4OA@mail.gmail.com>
 <CA+FuTScr26P+QtPfWKzD1zzadKiZ3zRs75KC1ycexdQRAQ0XuQ@mail.gmail.com>
 <56d62e5a-b7df-43f7-8878-517505345529@redhat.com>
 <CA+FuTScunTfXGzpEFEgZcv3FKSzVwSK0vhuO61a=Ui2HybTsJw@mail.gmail.com>
 <494ee50c-eae3-41fb-9823-595ce00b0c35@redhat.com>
 <CA+FuTSfiec0x0f3rQjkZpiihEhcu_JcoU4c+Qd=8GM0kDjDoiw@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CA+FuTSfiec0x0f3rQjkZpiihEhcu_JcoU4c+Qd=8GM0kDjDoiw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/1/24 18:04, Willem de Bruijn wrote:
> On Thu, Aug 1, 2024 at 11:34 AM Paolo Abeni <pabeni@redhat.com> wrote:
>>
>> On 7/31/24 20:21, Willem de Bruijn wrote:
>>> On Wed, Jul 31, 2024 at 1:32 PM Paolo Abeni <pabeni@redhat.com> wrote:
>>>> What about reserving an additional bit in gso_type to specify the inner
>>>> network header protocol?
>>>
>>> Similar to VIRTIO_NET_HDR_GSO_ECN?
>>>
>>> Is that preferable over VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IP4 and
>>> .._UDP_TUNNEL_IP6 variants?
>>
>> Should be basically the same, as VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IP4
>> VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IP6 will be 2 separate bits in gso_type,
>> right?
> 
> One difference is that we have to update other code to use a bitmask.
> 
> I'd prefer the two types for that reason.

Please pardon me for the high-frequency spamming. I'd love to have this 
topic well defined.

I'm unsure how to read your suggestion exactly.

VIRTIO_NET_HDR_GSO_UDP_TUNNEL needs to be "combined" (set together) with 
VIRTIO_NET_HDR_GSO_TCPV4, VIRTIO_NET_HDR_GSO_TCPV6 or 
VIRTIO_NET_HDR_GSO_UDP_L4, so it's currently defined as a bit flag:

#define VIRTIO_NET_HDR_GSO_UDP_TUNNEL 0x40

 From an implementation perspective this allow us reusing the existing 
code for to fill inner headers related field, masking such bit in the 
gso_type before invoking the existing virtio_hdr parsing helper - it 
will be used unmodified.

Due to all the above, I thought the IPv4 and IPv6 variant would be 
defined as:

#define VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IP4 0x20
#define VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IP6 0x40

How would you define VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IP4 and 
VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IP6?

Thanks,

Paolo

