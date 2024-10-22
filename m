Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384CE1BC067
	for <virtio-comment@lists.linux.dev>; Tue, 22 Oct 2024 16:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729616183; cv=none; b=S7ciL4QPD0Hyyigay/4XKfOgO0o4Zl2ZBjFNCZF6bzUjvE/9jidRkB4j4w6GTNKKJ/Fu26u0LyKgJzXJZ0/7honfx+pQsWbBQaWXaLIQkDwVteoH4UBiB0AbS4uoldG79vMJhrzzB80IXUeFd2E0iMG8x0c4RgT2koyiyyCosMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729616183; c=relaxed/simple;
	bh=98WhpBcwe4YM/iuoU2b1KcqEd/e/reXcZAS8Vb4BO6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NjshCYdBlQ3tyoO0pN8CEyHd+tTKoTszrg/4akXeHDDq13jU2fxnnYBLtRVY/xAnmOsXoABKkV63JhCr51YKBmICd4gY88LNICIL7ttYFx3QFT0+Mid+ot5b1NMFqyxjpOox7z2JTmAjtOApUKPu3KGHb+1XCSqiSPclvXTkEec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bjw57TDu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bjw57TDu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729616181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l82osBeX9yiwWo4ZttRPeUfJmAW8bh/dMwtg2y3VyIQ=;
	b=bjw57TDujC6OZ57UDfFn7TJSptaLUJ/nIH9m8+h8Le+wsVmjzlAt2Ma2XLgmVVKljAkLQy
	78CxteGdctPN9k9NJHMTJiLUe3gLasdy8i8TOAQnbAmMerNvPDZy7qZ6XX6bD7O81TjhG8
	2bXq1BhmhGzdCn/+pp63xZ9JzgUQ9P8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-h3ZxIRN0Okm5_nl7hJtdvQ-1; Tue, 22 Oct 2024 12:56:19 -0400
X-MC-Unique: h3ZxIRN0Okm5_nl7hJtdvQ-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-37d52ccc50eso2938211f8f.3
        for <virtio-comment@lists.linux.dev>; Tue, 22 Oct 2024 09:56:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729616178; x=1730220978;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l82osBeX9yiwWo4ZttRPeUfJmAW8bh/dMwtg2y3VyIQ=;
        b=Tt5zySHLPpHLm3Vn59WwNGcrrxiF93wjgslNHEc2Gon0KXY9FoRbU81mRMULDgetIl
         yHlSSNbn89iQSGTV7MzUoe11Oz79fibMK8PNs4sFA4StPqaIkdlhSqaggsDfBtl9bxXV
         NtmWwIGJPsqDvazAeT+NWfSceQsJu0dZNwLj2REbbUOGIuA/ExLzjnPezQjUIkZo7Dri
         FBizqDKd/R2SKDYsJqz0YXqVaZEOcJ+muNP/1aOPIpc4fwzUnKHa/7y6p9i5XBT2Vjeo
         A5Vms6BHCadGgbZcoPn77bqBeeIQdt285ZU/VkZv/PUhn72w3Uume8Avswh9x2wvUDJy
         EttQ==
X-Gm-Message-State: AOJu0YyyhjqaGY330w2w7WHye+VGDrIwV6ImR5yRodWJEAF+GvhgQr/v
	N2nlB5dnCAev/tHaIENBLmoNRlONb/N7yx/EnxDnPcwLj0QYH59fPZXMWUdJC3za6V1tUHs1QY4
	BGvKrB7VsHdDt90m2UnmIFXWa5ZdUTCowAnNl9NuWdLfn9MxlccP0WCfS/OZUkZle
X-Received: by 2002:a5d:5741:0:b0:37d:45f0:dd0a with SMTP id ffacd0b85a97d-37eab72787bmr9065049f8f.1.1729616178285;
        Tue, 22 Oct 2024 09:56:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFx/rQ5QRr8JmMi4Hw+TfalrNULkayCyUSOKyxINAeHxPCb2joprOm0ystsyP5r2e/VKNPFig==
X-Received: by 2002:a5d:5741:0:b0:37d:45f0:dd0a with SMTP id ffacd0b85a97d-37eab72787bmr9065034f8f.1.1729616177754;
        Tue, 22 Oct 2024 09:56:17 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:1b73:a910::f71? ([2a0d:3344:1b73:a910::f71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a4ad48sm7004214f8f.42.2024.10.22.09.56.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 09:56:17 -0700 (PDT)
Message-ID: <5da197a8-a022-4c2d-a4ae-09e0948e620e@redhat.com>
Date: Tue, 22 Oct 2024 18:56:15 +0200
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
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CACGkMEu-83JEcs73R4Eym2tkcUT5Zsj7i2qOsB-9ivmLNf0b5g@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/22/24 09:42, Jason Wang wrote:
> So my point is considering we are designing virtio instead of trying
> to make existing GSO capable devices to support tunnel GSO (or can we
> do that for virtio?). If some new fields can make things easier, we
> probably need to go that way.
> 
> Let me summarize my understanding for your proposal so far:
> 
> 1) csum_start/csum_offset were for the inner and so the outer checksum
> can be done through LCO or offload via patch 2
> 2) if VIRTIO_NET_HDR_GSO_UDP_TUNNEL_{IPV4|IPV6} is set the rest bits
> of the gso_type were for inner
> 3) hdr_len is for inner (this needs to be clarified in the spec), so
> outer hdr_len could be deduced from inner
> 
> It should work but for 1) I worry about the possible inconsistency:
> 
> 1) It might have some conflict with
> 
> "
> If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
> VIRTIO_NET_HDR_F_DATA_VALID bit in flags can be set: if so, device has
> validated the packet checksum. In case of multiple encapsulated
> protocols, one level of checksums has been validated.
> "

I proposed the following:

For GSO over UDP tunnel VIRTIO_NET_HDR_F_DATA_VALID is allowed if and
only even  VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM is set in flags.

That means that the device supports csum offload for both the inner and
the outer and both csums are valid. The corresponding skb will have
CHECKSUM_UNNECESSARY and csum_level == 1.

For GSO over UDP tunnel VIRTIO_NET_HDR_F_DATA_VALID with a single csum
offloaded, VIRTIO_NET_HDR_F_DATA_VALID can't be used.

Note that we may want to avoid completely VIRTIO_NET_HDR_F_DATA_VALID
for GSO over UDP tunnel packets, see below[1]. Also that option would
avoid all the conflicts.

> 2) csum_start/csum_offset were for outer for non GSO tunnel packets.
> hdr_len, gso_type are fine.
> 
> I think those can be addressed for sure with more statements in the
> spec. Just not sure if it's worth it. I'm fine if you stick to that or
> we can hear from others.

I'm unsure I read this point correctly. A rephrase could help.

> Down this road, I have other questions:
> 
> 1) We need to clarify if there's an N level nesting tunnel, is
> csum_start/offset/hdr_len for the innermost or not. Linux seems to use
> the innermost semantic. If yes, for DATA_VALID, as Willem mentioned,
> we need a way to report csum_level.

If there are multiple nested tunnels, there will be no GSO over UDP
tunnels packets. The existing specs will apply, only one csum will be
offloaded.

> 2) In your POC[1], hdr->csum_start/offset seems still point to the outer header

That would be a bug...

> https://github.com/pabeni/linux-devel/blob/virtio_tunnel_gso/include/linux/virtio_net.h#L229

... but the above code shows that hdr->csum_start points to the inner,
because skb->csum_start/skb->csum_offset refers to the inner header in
Linux.

There is actually another point which I'm quite scared to mention
because it caused v9 and implicitly all this discussion.

I want to prevent the driver receiving from the device GSO over UDP
tunnel packets without csum_start/csum_offset, because the header
probing code looks fragile and bug-prone and will be even more complex
in case of tunnels.

[1] AFAICS the easiest way to prevent such thing is explicitly requiring
no DATA_VALID for GSO over UDP tunnel packets.

Cheers,

Paolo

