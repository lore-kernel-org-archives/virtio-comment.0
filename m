Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433041DE4CB
	for <virtio-comment@lists.linux.dev>; Thu, 17 Oct 2024 15:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729179266; cv=none; b=HZFsgwZZ5IeuDudFukzkB3fQ96fxD946x6sOploo3VMuRpugFaJpGya5sZO6d+QNkRPDhY15Egk7N47mqJ5bvfi+79XYSjTnkMZ3RsWHzCE3Dh97DMzpgmnonmWHPv1+OznFmJkXfcESv/S+cNm5K7Llt1Hoo8yeBir3r6B//80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729179266; c=relaxed/simple;
	bh=P3njzNbIkGMtayO3ycU1q/5+8dgfRJ+6N5D4aCr/j4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JE3q8WSV7zW+JzAhmxj0S0Ku893eRKofhu9xnmh3lgN05C1dYgVINU/WIquAjoM3k4Xuk3qi61wQJcqGoI9+AHF5c5UQTN0CUjk4VuHvJLB0bR4U2oE95ULlyuBswxIQivP8Vfro99LHAKUxnYuUD2Rtn/0TWQymBKEKBTQ5oWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dv8ZnN2h; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dv8ZnN2h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729179260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KAg7pPhHP5+Gpre6V63JWyN+Lrttz9LsQVlPohAxCFU=;
	b=dv8ZnN2hgSv/p9Rrg0oiEBOw2uUshCo7y0bcQC2yJlTEdBK7fOwwF8p+Y9AlTh+vzgxXlY
	juSJ3xriRiCjXO2MZxBoTyqf7Ujoik73gb9mykXodeYonQtrCCfQBQBDaFsEk05v+DCkCY
	Ns+7/E7JXN8/Ysq6NtU9IuSnNfoZl2c=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-77-O6PElBPWOoarWjoKhH10nQ-1; Thu, 17 Oct 2024 11:34:18 -0400
X-MC-Unique: O6PElBPWOoarWjoKhH10nQ-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-539e03bfd4aso1069655e87.1
        for <virtio-comment@lists.linux.dev>; Thu, 17 Oct 2024 08:34:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729179257; x=1729784057;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KAg7pPhHP5+Gpre6V63JWyN+Lrttz9LsQVlPohAxCFU=;
        b=F6dVaMyI2h+QItLuwOCxAkw6xBxihUpHC0ZY/GKYEhmz01LmFqX9fSH37JqwS+C4jF
         1lL8GNybxJeHaYLoPdC9dN7H0GmBPu6pBklE+rgLR0hHnpdhs2nk0Quz0E5ERgVHhD9G
         d/5xxOL5ym82GSb7D+q8/OBtLNOTBDdoTSMJVjKVYZWNd8m/xsztruksiP4shXPCWGBf
         QPPgXX9M/VaQsGooBzWhon+IkIpkLoxc3ZF0atmpQCZeGLqmoyqKP2YQMCx+aH7a+KeQ
         ultUGGz9/8CKecW3K2Q4EZ4xd6QYhsJ2g25kW02uqOBAOn+cbhev8Rol/JBmWmvYNtTs
         IPMQ==
X-Gm-Message-State: AOJu0YwnJJnx6jophYPVz16iMT98YfMyc4R85a3V9uxKyYu8IGgtixfA
	DCJzM5HAMlifJNIEpAaNggPlsjUEkVDIV/tKn4exCgsWtmeaOb14npvRuN9e0tilXqNmQadgXRJ
	zhm5JsxPWAau+AeycJgVzipZXQk+vjDc8DTCPs41qt2kXyD7e/cSOlAUVAIQpMwPz
X-Received: by 2002:a05:6512:3da2:b0:539:fc75:99ae with SMTP id 2adb3069b0e04-53a03f2eb14mr5795632e87.31.1729179257287;
        Thu, 17 Oct 2024 08:34:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnisme/nwHac8CEw8pVQvWixjIn97RcLIEksM2sUOqVJg0BUIIq2GBUPcdnDvpVj7efIySBQ==
X-Received: by 2002:a05:6512:3da2:b0:539:fc75:99ae with SMTP id 2adb3069b0e04-53a03f2eb14mr5795602e87.31.1729179256773;
        Thu, 17 Oct 2024 08:34:16 -0700 (PDT)
Received: from [192.168.88.248] (146-241-63-201.dyn.eolo.it. [146.241.63.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa9090asm7563324f8f.57.2024.10.17.08.34.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 08:34:16 -0700 (PDT)
Message-ID: <44be2d9c-5624-4419-8e9c-e5302a5f6b2f@redhat.com>
Date: Thu, 17 Oct 2024 17:34:14 +0200
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
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CACGkMEuhJXMd0hGopyehESO1eNVRXVX+FaF7m8f6Y9yWCzoESA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/24 08:47, Jason Wang wrote:
>> AFAICS the main argument against the layout I proposed is the
>> inconsistent usage of csum_start that will refer to the inner header for
>> GSO over udp-tunnel packets and to the outer header in when the device
>> does not expose the GSO over UDP tunnel support.
>>
>> I argue that dubbing such behavior as inconsistent is a matter of
>> interpretation: in both case the csum_start field refers to the
>> innermost header that the device is able to parse.
> 
> I was convinced by this argument until I see this
> 
> """
> If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
> VIRTIO_NET_HDR_F_DATA_VALID bit in flags can be set: if so, device has
> validated the packet checksum. In case of multiple encapsulated
> protocols, one level of checksums has been validated.
> """
> 
> The "one level" seems to be ambiguous. But this reminds me that the
> innermost assumption seems to be impractical:
> 
> The checksum of non GSO tunnels has been supported.

I argue the above statement is again a matter of interpretation: the 
existing specs support checksum offload of UDP packets. That UDP packet 
may (or may not) carry a tunnel and some other headers, but such info 
are actually irrelevant to the device: lacking the GSO over UDP tunnel 
support, the device still parse the packet up to the (only known) 
transport (UDP) header and offload the related checksum.

Also note that I already agreed the specification for DATA_VALID with 
GSO over UDP tunnel packets must be changed/corrected and I proposed 2 
options to avoid confusion there:

https://lore.kernel.org/virtio-comment/CACGkMEvmhdYMHf5HKX37XqAYO2uHPq1=eWXfBPoS2gp8FJezDQ@mail.gmail.com/T/#m520efe2519200e878ab103f32598e5163cd01ec4

"""
1) forbid DATA_VALID with GSO over UDP tunnel

or

2) forbid DATA_VALID with GSO over UDP tunnel without UDP tunnel
checksum offload. That means that DATA_VALID for GSO over UDP tunnel
packets could only be set when both the inner and outher header are
offloaded.
"""

[...]
> Such inconsistency a lot of extra statements to describe the
> difference semantics in the spec and if/else in the code (as
> demonstrated in your POC which uses a completely different helper to
> do the header conversion between vnet header and skb metadata).

I think you have misread the PoC code. It actually re-uses the exiting 
helpers, verbatim, without the need to duplicate any existing checks.

Sure, there is some additional code in the GSO over UDP tunnel helpers, 
as the latter must process and check additional fields. The other 
additional conditionals you see are due to both the spec and helper 
being very strict about the admitted packets - we want to avoid the 
loopholes leading to nasty bugs, as already mentioned. Such code checks 
and spec statements should (/must) be there with any layout we chose for 
the virtio_net_hdr to support GSO over UDP tunnel.

Let me reiterate that, instead, using the csum_start/csum_offset fields 
to track the outer header information, the GSO over UDP tunnel could 
processing could not use 
virtio_net_hdr_to_skb()/virtio_net_hdr_from_skb() to process the 
existing fields. i.e. all the checks in

https://elixir.bootlin.com/linux/v6.12-rc2/source/include/linux/virtio_net.h#L97 
..L112

will be meaningless in such scenario and the GSO over UDP tunnel helper 
code must replicate them with the correct offsets.

IDK which extra statements in the spec you refers to, could you please 
be more specific?

> If we introduce new fields for inner, we can stick to the guidance and
> normatives for the new fields instead of dealing with the different
> semantics between GSO and non-GSO tunnels.
> 
> 1) a patch to clarify the existing fields in vnet header were for
> outer in there's a tunnel

Would such patch require the sort of extra statements you don't like?!?

> 2) adding new fields and explain that they were used for inner, we
> don't need to worry any possible conflict when trying to reuse fields
> with outer (as demonstrated by DATA_VALID).

I must admit the 6m (or 2y?) step backward in time does sound scaring to me.

As mentioned the above will lead to a poorer implementation, are we ok 
with that?

What about hdr_len field? for GSO over UDP packets should include the 
inner hdr len or not? If not, it would be useless, otherwise would be 
inconsistent.

/P

