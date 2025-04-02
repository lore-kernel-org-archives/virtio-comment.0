Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FE014AD20
	for <virtio-comment@lists.linux.dev>; Wed,  2 Apr 2025 09:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743585513; cv=none; b=WiaF69maLdo1O1OYoq1zPTK1aaQT3k1PDNWrrJCC45GQOwiywbbHeiUPm8Ts+HXk1Bll+o5mpug2rU1x4ym0qJt9FycE53JXoGtsteVg1z86YFZsxTHbyNs+6CeORfnswM6Pe5a1BZHO//YaJT1c1UKEiCyCDVYkWuyLyt34VWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743585513; c=relaxed/simple;
	bh=I9Nlqb8vnkLlnkh34ycassaXp30Yq6x0vcX3nJ2X9cc=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m74uvStwK5MBNPLQr+xOQ/+ztz1p7P+O8PB4+a9jsfPyIbfpA26zr71aAJS/EvGVFWFtPSU7cJZGGXQxycOygklpic/q2UFPvTWi13Q4tUzv7ua4H9bFj0sdkIsFlYCRq8ygu2VojCVPfbh+EkR8hyxSEclCyLx10mxmGSJlYo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KKPxLHjr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KKPxLHjr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743585510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=40uoT4B7RzgIfNvLdAZ9mIwlJFaT+8DqetEEaRsHnIY=;
	b=KKPxLHjrMQqy4I3u8XXE6RoXkRCieluk/SUSWMJrbcRonJZJhtcOkeQtBbd+m0mKO1mjP+
	2+w1ImnqsEsjG68yzBAR2NMLfuUQ/0FCmYttL9bMflNy0m4xVdS4KZGtC5mQHP6eQpWXKF
	cjD2hZVqhqTws6sKIuQNhd+NRX91mmo=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-eRbfv_f0OHmd9psz-B4UhQ-1; Wed, 02 Apr 2025 05:18:28 -0400
X-MC-Unique: eRbfv_f0OHmd9psz-B4UhQ-1
X-Mimecast-MFC-AGG-ID: eRbfv_f0OHmd9psz-B4UhQ_1743585508
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-225429696a9so188479505ad.1
        for <virtio-comment@lists.linux.dev>; Wed, 02 Apr 2025 02:18:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743585507; x=1744190307;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=40uoT4B7RzgIfNvLdAZ9mIwlJFaT+8DqetEEaRsHnIY=;
        b=rEBSWtR/KmoQQi9hcMiJfydMII8xm0xYwyIi81boB37GI5gU1l6w/6/L5MmmxRedB7
         TAllWMFX5qmyDGlyb152RMpGFEEo9ZHzoTGTrv5ssXUV03FGs2DxTlNDEQ0bUqVfHKZd
         cZ0GhO9dP4CBqNFxuKQeEGlQFvvZsZ2LvF5cN19bxT2JSH9odd/HcXOCSoCRVyckcmFy
         W/Uz1NUZBBAejHWzi+MELk1xc5mpaKRNMyTilDIWj8ZqvpftuqvtnvQLHTA4Xo321nfB
         aftJE75YFt2HvfwH41w8vwfd+TLbzqfLANhnFD8CobUHcHTGlsx2WjbkR/Pz5GmaIpqg
         kxTQ==
X-Gm-Message-State: AOJu0YxENmA0xSU86Nf/pSJSxrTe8NIMJ+aY/qdC6hO6CXDA/Anjk9eV
	PKdcIQendx+7gH952ttgl2Jc5OHiXN0rUxgFO31EWHTERgzFX3nUV8/FQBkBZa2R42ExoZpDeM5
	GtJ0JbvkdJuskB2ilptgWXaGSpSrb1TxKBsW34QvISDKsNwLrnQB1XLmtMNbNCNx7oObMH+bhJK
	qHJXLGCXWef3EggowQcTpuScTDQFX1PXTPfO7/2vA=
X-Gm-Gg: ASbGncsUkw2PAqs8dVO2rLRXIH3EkvMtClF49eGqiP0vy+0N6Fdtt/JHy4kV1P2VCH9
	JngZFR40UMWQvPZpQzzD8r6dbajPsKJINO9nK8jfwPluXbzEE5wpbSlhMmIC3K6Es5ZyN/Q==
X-Received: by 2002:a05:6a00:852:b0:736:48d1:57f7 with SMTP id d2e1a72fcca58-7398036737cmr20865515b3a.7.1743585507491;
        Wed, 02 Apr 2025 02:18:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKT7RmTYgwh4Om8JwYYuLziPSubXPMyj8Pz58kxCWOFIabx84jV1SW9DNfiJDfvGrewAfS273dk4WF5F3uM3g=
X-Received: by 2002:a05:6a00:852:b0:736:48d1:57f7 with SMTP id
 d2e1a72fcca58-7398036737cmr20865476b3a.7.1743585506986; Wed, 02 Apr 2025
 02:18:26 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 2 Apr 2025 09:18:26 +0000
From: Sergio Lopez Pascual <slp@redhat.com>
In-Reply-To: <20250402033354-mutt-send-email-mst@kernel.org>
References: <20250331213711.63398-1-slp@redhat.com> <20250402033354-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 2 Apr 2025 09:18:26 +0000
X-Gm-Features: AQ5f1Jq_GAuW3JNNL2LBUS_HUR1DIkw7bjR9C3mgC3RQ5HOz6OsfAIWsK-e7TvA
Message-ID: <CAAiTLFUxqPp4V=gkJ9CWttoP1wSKEtp5WrE9yhePFN2PiMVa5w@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] shared-mem: introduce page alignment restrictions
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev, dmitry.osipenko@collabora.com, 
	parav@nvidia.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OWhsQ74x4hqAAUl7BO1yJibldRaItiyO0HiqW7_IFCU_1743585508
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Mon, Mar 31, 2025 at 05:37:08PM -0400, Sergio Lopez wrote:
>> There's an incresing number of machines supporting multiple page sizes
>> and, on these machines, the host and a guest can be running with
>> different pages sizes.
>>
>> In addition to this, there might be devices that have a required and/or
>> preferred page size for mapping memory.
>>
>> In this series we extend the "Shared Memory Regions" with a subsection
>> explaining the posible existence of page alignment restrictions when
>> the VIRTIO_F_SHM_PAGE_SIZE feature has been negotiated.
>>
>> For the device to provide the page size information to the driver, we
>> need to extend the PCI and MMIO transports. For the former, we borrow
>> 8 bits from the 16 bit padding in virtio_pci_cap to hold a page_shift
>> field which can be used to derive the page size by using the following
>> formula: (page_size = 1 << (page_shift + 12)).
>>
>> For MMIO, we add a the SHMPageShift register at offset 0x0c4, also
>> holding the page_shift value. Since MMIO registers are 32 bit wide, we
>> could have asked the device to directly provide page_size instead of
>> page_shift, but seems reasonable to be consistent across transports.
>>
>> An implementation of the changes proposed in this series has been
>> published as an RFC to the LKML, to be used as a reference:
>>
>> https://lore.kernel.org/all/20250214-virtio-shm-page-size-v2-0-aa1619e6908b@redhat.com/
>
>
> Can you explain the use a bit more please?
>
> - looks like this is exposed to userspace?
>   but userspace can not be trusted not to violate the spec.
>   how can that be sufficient to satisfy MUST requirements?

In the virtio-gpu implementation in the RFC series it's indeed exposed
to userspace. This is because gpu drivers are supported by userspace
drivers (Mesa), and both have a very close relationship. Probably, that
patch should also make the kernel driver reject mappings that doesn't
comply with the alignment to ensure it satisfies the MUST requirements.

I'll do that in the non-RFC series.

>   what are these mappings and what are the alignment restrictions,
>   in fact?
>
>
> Looking at that patch, I begin to suspect that while the spec patch talks about
> device mapping requests, it is actually the other way around:
> the restriction is on guest virtual to guest physical mappings?

No. The guest can operate in smaller-than-host mappings (otherwise,
running a 4K guest kernel on a 16k host wouldn't be possible).

Shared Memory Regions tend to be used this way:

 1. The guest requests access to certain resource owned by the host. The
 request can be for the whole resource or part of it. The request
 includes the 'offset' within the resource, and the 'size' of the window
 it wants to have on it.

 2. The host maps the resource, from 'offset' to 'size' (as received by
 the guest), into a certain offset from the host's view of the mapping
 backing the Shared Memory Region.

 3. The guest receives an answer indicating the offset (completely
 different and independet from the offset that was requested within the
 resource in 1) within the Shared Memory Region where the resource has
 been mapped.

 4. The guest starts operating on the resource, now available in the
 Shared Memory Region at the offset received in 3.

The problem this change in the specification tries to address is that,
in step 2, both 'offset' and 'size' must be aligned according to the
host's limitations (in a traditional host/guest scenario, this would the
host's page size). But the guest has no knowledge of this limitations,
so it can't adjust 'offset' and 'size' as needed.

While this example is written thinking of virtual devices, it's
certainly possible to implement physical virtio devices that may have a
minimum granularity bigger than the host's.

> Does the feature affect other device types besides gpu, and how?

Every device with Shared Memory Regions is affected. The only reason we
found the issue in gpu first is because it's the most intense user of
SHM regions. The moment we attempted to use it on a 16K page host, the
issue was made clear.

For instance, fs is also affected, but only uses SHM regions with DAX,
and the latter is barely used due to various constrains.

New devices using SHM, like virtio-media, are sure to hit this issue
sooner than later.

Thanks,
Sergio.

