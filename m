Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31441E47DB
	for <virtio-comment@lists.linux.dev>; Fri, 25 Oct 2024 11:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729857051; cv=none; b=uj3Ur6r/Chc+BpojS06ds/yCRK2EF24HCPKu858JXdkn0B1wO7hjXjojqQwUDy3syJSFKrgzWaL6XA0Wlctjn++gxAHyNCc5wIjimRvDkk+tpU3sscvBfNdPkf4D4MzCsXUT65qhv3jZqzPB6PzwhIcCi/9PUn9pqeH48gcSJeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729857051; c=relaxed/simple;
	bh=bkynkEhWi5RXJFbSst3XELI2ihQS6PZWoth63U5qgCk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GbKgySnGZOf79WcUBHnXf6r+FGYi/Z0cMZm0xcdwWN/nIozWlU9zwe4LbC2mkUts9tS4jXHHGmIUGJixvJDyGwoTFq6g5gcBh8SAtKhNL7rxNNWWjNEJ0Citi2DfOjBCyOzupWPn/6GPHwxQO3FllY93srdSD2WqAFOPbr+mtSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C9aP1+Or; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C9aP1+Or"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729857047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XC7BDx5dRQ7f5/99rCnjU2RugZ87v2uLiGrOj7l3myw=;
	b=C9aP1+OrAf5+7tMQiiMsX+h57nri5TrbA1yk60DtwB0hulNKPfPrbgbhrIWiOJMLNzT2Ty
	SIJPiBeQKh48aO+VSoZLMoeEq4EtjON2wnHWgJeUVzEYrJPrs6jettn200oh1Plq92s3AL
	+bYsYrIcKAPGWQTUb83glL4pg1+Y718=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-8_RMMXvUPZeDKIrN2b5gMw-1; Fri, 25 Oct 2024 07:50:46 -0400
X-MC-Unique: 8_RMMXvUPZeDKIrN2b5gMw-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-539fdef0040so1780132e87.0
        for <virtio-comment@lists.linux.dev>; Fri, 25 Oct 2024 04:50:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729857045; x=1730461845;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XC7BDx5dRQ7f5/99rCnjU2RugZ87v2uLiGrOj7l3myw=;
        b=v0U1zkDuI0eJMdYtlseclKQ19l2p54DM3G+PwkDd/Ec556wD5/JMw83uRsF5+OiXXq
         dWzXEnGXaRf3mfAETtX+irveo8ggubIfWUzbBPUGfLnXChiDjASRnn2NuHjd3jkIwn7K
         MPBv0gzxB+fsJIsqx+DIFvSKl0k6hiC2CwDD8loKcKZ6fl7Cr5rGosTxALUo++H/uV31
         zlAyu2Ea9MXwe96Fvu1c/upy9tqmt9cip/KMWQsq/UqNbNLygtoZ6j1keMpA4J3aaGTO
         y1SMvSqRZo78WBBKAPf9raQVQj7T3R0QTYQp2J9GOpc+toBMgqzJ0ioO0DoA3M7WLinb
         0Gqw==
X-Gm-Message-State: AOJu0YwC2aGrcL3UN3JNRaweqjcN7TECMnVpFutY97yfHapkKPJrarL1
	ks03b0beQ20KvF7W/Jo0IGo+gfvhGLSi6ZSkttLLe6eKzHNQzqu6NtN8HphVaCo8oUXheZ3SMBA
	J3JHVx2LweLxEI5vDmQV5FwJ/7EPM42vceI3Msl0VTHOb8PIus/qMqukEDqD5n6fn
X-Received: by 2002:a05:6512:a93:b0:539:ccfd:8f36 with SMTP id 2adb3069b0e04-53b1a310742mr5550282e87.28.1729857044846;
        Fri, 25 Oct 2024 04:50:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhFHkZ9HK71L3rO8YbZzw3OKL5mG7IS5/pFVYy5WfpfzfPS2l0VE3IYHufaEbaZqM4gc1Jng==
X-Received: by 2002:a05:6512:a93:b0:539:ccfd:8f36 with SMTP id 2adb3069b0e04-53b1a310742mr5550266e87.28.1729857044323;
        Fri, 25 Oct 2024 04:50:44 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:1b73:a910::f71? ([2a0d:3344:1b73:a910::f71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4319360833asm15567035e9.39.2024.10.25.04.50.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 04:50:43 -0700 (PDT)
Message-ID: <a6ad7c40-d65d-4b95-a7ae-86d77eda4bdf@redhat.com>
Date: Fri, 25 Oct 2024 13:50:41 +0200
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
 <CACGkMEsiRJ2zAcys0iFQkiL0h9MY-LOE4=LP7s4ksN=T+HY_Xw@mail.gmail.com>
 <7f40f3da-aa6e-437c-af73-97e44e1982d1@redhat.com>
 <CACGkMEu-83JEcs73R4Eym2tkcUT5Zsj7i2qOsB-9ivmLNf0b5g@mail.gmail.com>
 <5da197a8-a022-4c2d-a4ae-09e0948e620e@redhat.com>
 <CACGkMEu-AQea98e5xqj4Vfo4zog_nzeJQ_pLADAOY9ZogsS8AQ@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CACGkMEu-AQea98e5xqj4Vfo4zog_nzeJQ_pLADAOY9ZogsS8AQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/25/24 10:28, Jason Wang wrote:
> On Wed, Oct 23, 2024 at 12:56 AM Paolo Abeni <pabeni@redhat.com> wrote:
>> I proposed the following:
>>
>> For GSO over UDP tunnel VIRTIO_NET_HDR_F_DATA_VALID is allowed if and
>> only even  VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM is set in flags.
>>
>> That means that the device supports csum offload for both the inner and
>> the outer and both csums are valid. The corresponding skb will have
>> CHECKSUM_UNNECESSARY and csum_level == 1.
> 
> Nit: csum_level seems to be Linux specific.

Note: the above was an informal description of the proposal, not the
actual wording to be used in the spec.

>> There is actually another point which I'm quite scared to mention
>> because it caused v9 and implicitly all this discussion.
>>
>> I want to prevent the driver receiving from the device GSO over UDP
>> tunnel packets without csum_start/csum_offset, because the header
>> probing code looks fragile and bug-prone and will be even more complex
>> in case of tunnels.
> 
> This needs more thought. For example, it seems not specific to GSO.
> Should we have a new feature for this? (And build a GSO UDP tunnel on
> top?)

Double checking I read the above correctly.

Do you mean something alike the following to negotiated another feature
controlling a new bit in flag telling 'the csum_start field is set even
if NEEDS_CSUM is not set'?

What about using the flag already defined in patch 2 instead (currently
named VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM, possibly a different better name
can be used [suggestion more than welcome])?

The overall schema will be:

- DATA_VALID retains its current semantic when GSO over UDP features are
not negotiated and when VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM is not set

- when VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM is set that means the following:
  - 2 checksums are offloaded - the 2 outer-most one in case the packet
carries more nested headers.
  and
  - 'csum_start' points to the innermost offloaded header

- DATA_VALID can be set together with VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM,
  meaning:
  - CHECKSUM_UNNECESSARY with csum_level == 1,
  and
  - csum_start -> inner transport offset. If the packet carries many
nested headers csum_start points to the 2nd outermost one.

- VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV{4,6} can be set/used if and only if:
  - NEEDS_CSUM is set (csum_start/csum_offset avail)
    or
  - DATA_VALID and VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM are both set
    (meaning 2 csums are offloaded and csum_start is avail)

Note that even the following will be also allowed:

VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV{4,6} is set, NEEDS_CSUM is set,
VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM is set.

meaning it's GSO over UDP tunnel packets, with both checksum offloaded
and CSUM_PARTIAL.

WDYT?

Thanks,

Paolo

