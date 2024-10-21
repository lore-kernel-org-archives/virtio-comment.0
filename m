Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC0C1C3F0B
	for <virtio-comment@lists.linux.dev>; Mon, 21 Oct 2024 15:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729525670; cv=none; b=ICMZ6dnvCpcXKaWkb6cYUbw2Hzp1kRveiZt7vZ3qv0SCgXBKYhGaYdN4r7TdY/5+dfim9GQNtjHLvlosn8YEROJp4VPxhZ3XN/DY4ZJm+R50D7F4CM9dOluObLZGXR+C0nKHUtZvl0IK+sVAi0EF/fKPXzbwqri9LUNYS9oNR0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729525670; c=relaxed/simple;
	bh=v14sY4l1vanv8Z1f7zdxq4TBUv9fKyb8RVKzoSgir68=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=MhIVQw0LV3TL/3Pah8HfThNwAQjE/0nIYn8Vw5I2YHg8CAxvH7Eawc4M7vT3jN3aqcxnrLuRXdREU0y3N31kCSq184J44p0kh2cfh10HWw6BWSiq4QXhcs1eZFKq6eiizzEU50d2PBPnnvb7BSibLwXFCIA6Zrkmco9s8xquPog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rr61t141; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rr61t141"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729525667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eoZy51a+qBaKJ9ieuVZirol0eutpoFswU6u4jop0aJQ=;
	b=Rr61t141lf6xdm1HFHiKO8WVCpMwPCgOxKKchtcEBLMbpLM/gyWz+T/v2fPc4uFTYiApa3
	8Uzc8fmsxvHJp1VDGQX6VB9rV5LmfWAuwDae8K4aPv3+fy2c7F7Pius2H8z33fip3zO4oC
	1fyZPP+HMFdL03w2/kmWzdfuzOcELWw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-296-yuXsJtQPMuO1btgyzGMsbw-1; Mon, 21 Oct 2024 11:47:46 -0400
X-MC-Unique: yuXsJtQPMuO1btgyzGMsbw-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43157cff1d1so37049805e9.2
        for <virtio-comment@lists.linux.dev>; Mon, 21 Oct 2024 08:47:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729525665; x=1730130465;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eoZy51a+qBaKJ9ieuVZirol0eutpoFswU6u4jop0aJQ=;
        b=fs4HqvLmrQWDEcCct2P5Zv5z8AenuvVUyVZLmrX3//ZPJ5qxQ4NxQdwE6CguRx5rBz
         OAdN0JOihAvxIlmA3rLf8Nbhip++x/qyh3BhMrdRkJCNcHDUor1b7oLR3rJejC7A9XfG
         zF3Z+Mpt0wWALVX7Z0GGV0EjPwA/DTDW8mNDA3qSNZ+wxu71vU/McPMOeYUL95P5+ix1
         GFIbH4rLRLJCQbcoXJxQHLUOQ4uZ1OC5/ftlUnidWNeeAWm3zSo0lkqaPSuKj9Ns8q4G
         qj/B0Gka+BctSSxGdZAlJK5+zgMXaXiKB1uRPOXXWU/b97151pfj94Xvtoeq9n51fD7O
         hdOw==
X-Forwarded-Encrypted: i=1; AJvYcCXdfgKMfRrCOFyTdP+MU/yMIxbvfhCw58WsPGRMEeE2KbpxUJfh3rTJ0DLADayc8x2OLdi4bShVfJkLLeVQxQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3mbbW6TA77yB7+IcRS8jwSRs9TMSK8ylGTZZhhJdEcSSFJc9L
	S4I7JcGvGQmJzTLKgNA0edzNw3PI2AdSAqD4KRrfGuNdFiFNMrMJfCIt6OQDApBkg/uBpFzGY2U
	YF7jchjqx6S9be92Xx6hAqwFu2S1fXIOjnvbRKfqKIa3nS/gdzqBMGdJR7lVnT6wS
X-Received: by 2002:a05:600c:1c0a:b0:431:51e5:2316 with SMTP id 5b1f17b1804b1-431616911d5mr94197905e9.34.1729525664975;
        Mon, 21 Oct 2024 08:47:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVO9svt1SdzSbWaJAYnJ+K8uqJS65+N6G29O2GkWP0ZjshoXThIsy9ie+UeowVEUarxqkQCA==
X-Received: by 2002:a05:600c:1c0a:b0:431:51e5:2316 with SMTP id 5b1f17b1804b1-431616911d5mr94197705e9.34.1729525664562;
        Mon, 21 Oct 2024 08:47:44 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:1b73:a910::f71? ([2a0d:3344:1b73:a910::f71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160682586sm104670935e9.1.2024.10.21.08.47.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 08:47:44 -0700 (PDT)
Message-ID: <2bd71d08-3ae5-427f-8c2e-21af2d5650bf@redhat.com>
Date: Mon, 21 Oct 2024 17:47:43 +0200
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/2] virtio-net: define UDP tunnel segmentation offload
 feature
To: Willem de Bruijn <willemb@google.com>
References: <cover.1728029499.git.pabeni@redhat.com>
 <55306969c73f62bf4d100d15074bfd6cde741417.1728029499.git.pabeni@redhat.com>
 <CACGkMEvV0gtvgpb7z1MqJLKzHm-Be_8hkf0GzqqsFsfDG8oAeA@mail.gmail.com>
 <d34f50af-4042-44c6-90e1-0acbbb899e96@redhat.com>
 <CACGkMEvrowr6CwF+=RiR+f3EagdKB=rzyCPCQcUdXee4a5MaZA@mail.gmail.com>
 <2b90c368-b514-4077-a6bf-43da075af4fc@redhat.com>
 <CACGkMEu5GWZrYVRN==F=vrRQQGnxj_WqX86YZ+diqC3s3m2m_A@mail.gmail.com>
 <10bc51b2-efbe-4f33-a1b3-827de4d0cd10@redhat.com>
 <CACGkMEuhJXMd0hGopyehESO1eNVRXVX+FaF7m8f6Y9yWCzoESA@mail.gmail.com>
 <44be2d9c-5624-4419-8e9c-e5302a5f6b2f@redhat.com>
 <CACGkMEsgJT1c93RZur20fUyjtxSX6dMPePEJvzbmNWpAHd92Mg@mail.gmail.com>
 <3e3d6984-65d3-46b0-aaa3-e6591123f95a@redhat.com>
 <CA+FuTSdvJNOBUQcUKPaJYO5t2pxByPSsj_USYdS=o1jKZBJK4A@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 Eelco Chaudron <echaudro@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
In-Reply-To: <CA+FuTSdvJNOBUQcUKPaJYO5t2pxByPSsj_USYdS=o1jKZBJK4A@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/21/24 00:28, Willem de Bruijn wrote:
> This thread has gotten very long. I'm not sure where exactly to
> sprinkle all responses, so just starting my attempt at a summary
> afresh.
> 
> One continuing point of confusion is ingress vs egress.
> 
> * Checksumming.
> 
> Perhaps we can start with a new precursor patch that clarifies the
> intended existing behavior?
> 
> - NEEDS_CSUM and DATA_VALID are mutually exclusive bits
> - DATA_VALID reads/writes CHECKSUM_UNNECESSARY
> - NEEDS_CSUM reads/writes CHECKSUM_PARTIAL, and implies that
> virtio_net_hdr csum_start/_off are set
> 
> This does not explicitly address CHECKSUM_NONE and CHECKSUM_COMPLETE.
> And the meaning of the flags are different on ingress vs egress. All
> of these points can probably be clarified.
> 
> Also CHECKSUM_UNNECESSARY has the csum_level field to encode how many
> levels of checksums it covers. This only becomes relevant with
> tunnels.
> 
> Also, if the current Linux virtio_net_hdr_to_skb is more permissive
> than the spec, let's definitely update the code.

Can we? Wouldn't that possibly cause some interoperability problems with
other implementations (H/W or S/W) that are currently leveraging such
more permissive behavior? (Note: I don't have any specific info WRT that
point).

> * Tunnels.
> 
> Technically there are no existing non-GSO tunnels in the virtio spec.
> 
> What exists are packets with a single checksum offload. These may
> happen to be UDP packets with tunnels and inner packets, whose
> checksum virtio indeed has no way to vouch for. But no tunnel specific
> information is read/written in
> virtio_net_hdr_from_skb/virtio_net_hdr_to_skb. Such as the skb
> inner_.. fields, or csum_level.
> 
> When introducing tunneling in the spec, and when only one checksum can
> be hardware offloaded, the most valuable one to offload is the
> innermost. Inner TCP packets must always be checksummed. UDP or other
> outer checksum fields can be left zero.
> 
> Or computed cheaply in software, derived from the innermost checksum
> (local checksum offload). Though that is only relevant to patch 2.
> Relevant here is that in the current proposal if NEEDS_CHECKSUM is
> set, this is a checksum offload request of the inner TCP packet, and
> the outer UDP header has checksum zero. The inverse, for TSO, would
> not be very useful.

I read the above as we are basically on the same page.

> An alternative is to support multiple checksum offload requests at
> once, at a minimum two. But most hardware only supports one
> csum_start/_csum_off. And due to LCO, the complexity of supporting
> multiple levels is just not needed.

patch 2 is about supporting offload of 2 checksums. In the v9
incarnation allows either CSUM_PARTIAL or CSUM_COMPLETE for both the
offloaded csum. FTR I'm aware of at least a (old, low-end) H/W
supporting offload of 2 separate, concurrent running csums.

In any case my understanding is that the most controversial point in
this thread is the previous one: which header should csum_start point to
for GSO over UDP tunnel, as Jason prefer to have csum_start point to the
outer header. Let's try to solve such point first.

Cheers,

Paolo

