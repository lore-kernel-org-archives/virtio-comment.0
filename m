Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33254236451
	for <virtio-comment@lists.linux.dev>; Wed,  2 Apr 2025 12:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743596571; cv=none; b=hMMbGvLKP0UELHFbqlPdaMIwBR17zpaf741jrtHV4SeuxO+j001XYNcJChv1QrPzmIGNGw9v8ONJgsZ4gO3mS7kQPbyuULqePXqGXZ0ydgNXWirOGJaSP4RMOYknDxrafKU/Vg78kxsRB5ovtCHrD+Oq2iY7bb9MTPRkRNYxm30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743596571; c=relaxed/simple;
	bh=pv9GAvBe2twGKEnZRKlARXfaoqK4kvhdX39qSBVWnRs=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dz0zL40962pXw1w94O52tYrbS70RxxcWebm0cIxUZim/rmgaNWB3QOPCqYftEBgByHm2ODVxmxRMYiV04RsSsUOOyg3YUC0w3hPDqxCrqHKN1/L5y0m24qSpuDcc90AX42Gw6AHiYxYsPCV7xpjEAzvqMHG7XocG1axzieST99Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TDsxLfNv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TDsxLfNv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743596568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K7W8gbdZwxKttr4BXrEE5y7o4v7BREteTM1YFAs+l5c=;
	b=TDsxLfNvku2yxBVlbDpgxFxeLogFlSA20ly+sFIXv/2XZFCLqdX7OV/3f9TjZVbkM0LVUC
	Re/2jlPFkT11GEM76Wz4bsQ9k8ajl1DEoWOXerOIEOrkf/VL9jqzl3sxpv27pTyFsdUCxn
	M2A/1EURCNFIFBxfgD+v/bcr85suXWw=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-383-YJnmkggoNoqWUXuZh2VU_g-1; Wed, 02 Apr 2025 08:22:47 -0400
X-MC-Unique: YJnmkggoNoqWUXuZh2VU_g-1
X-Mimecast-MFC-AGG-ID: YJnmkggoNoqWUXuZh2VU_g_1743596566
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-6c8f99fef10so57546a12.3
        for <virtio-comment@lists.linux.dev>; Wed, 02 Apr 2025 05:22:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743596565; x=1744201365;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K7W8gbdZwxKttr4BXrEE5y7o4v7BREteTM1YFAs+l5c=;
        b=xAVdI+vWrs+cBvqdxQ4dLL28i4VJso/sfKdVroDhSapedtXUV3tQ61guj5AP4x4Myg
         EBqoq5U+x9w9wzGC2+lxvGktzQ2IugzbMxhFvmdxoIMLoYW7Z+mP9ly4P4T5DktwNECg
         222emSeFObnXLyUMebgWtMZJ0QieN9ClxmnizEp4KTaSdZc3cUUPxgtRuWlGSTZHI+wm
         xs2rP5XHaP69e64tH2imkavx5BJCRQTglikiOeUUO+4ZTnj7ILgOHR5uN8K6DsnIsItp
         7p4x0MbNwERB2CHXzH77BRs8N/pDt1wnB9uzK7uPbxeIiX1g5OEpuNAakRP09n3Na7uk
         HTJw==
X-Gm-Message-State: AOJu0Yyz8EzhvmJHdcsiiWJYYYGwguJn97LFd2yfBlGpB+ZEDSBqS8Md
	0NuQfYwsRFaPI/43knniCm4W6ZYEGZzXTMepn5V8sVhypx1fsJv9uasQkiuCM0iLuz54cfL3o6J
	CtHSpyRi6+y5GTn8paMNMurbVLTlUlIDYHxTrvY0saGULY0X0XVN0p9Hu8/KPlDplviHOHDU3lJ
	baPFCDmR40rKH2LeeAlDmSFqusmpusxz0tlESt4fBYr8F2WwI=
X-Gm-Gg: ASbGncskvfu8vmuL0/rC8UwiJ/oHA+lYSLNqkFJXRTIrKfiwZohzjP+I0F+KnDR4VSg
	VWUkuTaLfwrIipDu5nxGRba+vS9BhYNBw8Dto+8QzCDzzJ/9xVMmUlOby9bjIZk+cxfM8BQ==
X-Received: by 2002:a17:90b:5824:b0:2ff:53a4:74f0 with SMTP id 98e67ed59e1d1-30532176cf3mr24453257a91.29.1743596565308;
        Wed, 02 Apr 2025 05:22:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkaEvOK1rRgKYRCG+6UzA5edQ+VsXJdR+bR9YIBvaRdGpe8G+V4YaReMthTSGgGCiS5gVakIHwE+e15GeZS0U=
X-Received: by 2002:a17:90b:5824:b0:2ff:53a4:74f0 with SMTP id
 98e67ed59e1d1-30532176cf3mr24453241a91.29.1743596564989; Wed, 02 Apr 2025
 05:22:44 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 2 Apr 2025 07:22:43 -0500
From: Sergio Lopez Pascual <slp@redhat.com>
In-Reply-To: <CY8PR12MB7195FB85CD0B553F8C262456DCAF2@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250331213711.63398-1-slp@redhat.com> <20250402033354-mutt-send-email-mst@kernel.org>
 <CAAiTLFUxqPp4V=gkJ9CWttoP1wSKEtp5WrE9yhePFN2PiMVa5w@mail.gmail.com> <CY8PR12MB7195FB85CD0B553F8C262456DCAF2@CY8PR12MB7195.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 2 Apr 2025 07:22:43 -0500
X-Gm-Features: AQ5f1JqYjy-Ez88hBpapg_SoVUMPIaTlxJio2PtHcZt2GQ26sgHNFfa4wRdFjHQ
Message-ID: <CAAiTLFWTBx1Gdaxs=86+iiPjcZm4w9KCypJbq174n0_ORgZjvQ@mail.gmail.com>
Subject: RE: [PATCH v3 0/3] shared-mem: introduce page alignment restrictions
To: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, 
	"dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QSsHmbDRUpEfiBTZ4qfwbRXkpmGWRcmP7tWqva6-e2I_1743596566
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Parav Pandit <parav@nvidia.com> writes:

> Hi Sergio,
>
>> From: Sergio Lopez Pascual <slp@redhat.com>
>> Sent: Wednesday, April 2, 2025 2:48 PM
>>
>> "Michael S. Tsirkin" <mst@redhat.com> writes:
>>
>> > On Mon, Mar 31, 2025 at 05:37:08PM -0400, Sergio Lopez wrote:
>> >> There's an incresing number of machines supporting multiple page
>> >> sizes and, on these machines, the host and a guest can be running
>> >> with different pages sizes.
>> >>
>> >> In addition to this, there might be devices that have a required
>> >> and/or preferred page size for mapping memory.
>> >>
>> >> In this series we extend the "Shared Memory Regions" with a
>> >> subsection explaining the posible existence of page alignment
>> >> restrictions when the VIRTIO_F_SHM_PAGE_SIZE feature has been
>> negotiated.
>> >>
>> >> For the device to provide the page size information to the driver, we
>> >> need to extend the PCI and MMIO transports. For the former, we borrow
>> >> 8 bits from the 16 bit padding in virtio_pci_cap to hold a page_shift
>> >> field which can be used to derive the page size by using the
>> >> following
>> >> formula: (page_size = 1 << (page_shift + 12)).
>> >>
>> >> For MMIO, we add a the SHMPageShift register at offset 0x0c4, also
>> >> holding the page_shift value. Since MMIO registers are 32 bit wide,
>> >> we could have asked the device to directly provide page_size instead
>> >> of page_shift, but seems reasonable to be consistent across transports.
>> >>
>> >> An implementation of the changes proposed in this series has been
>> >> published as an RFC to the LKML, to be used as a reference:
>> >>
>> >> https://lore.kernel.org/all/20250214-virtio-shm-page-size-v2-0-aa1619
>> >> e6908b@redhat.com/
>> >
>> >
>> > Can you explain the use a bit more please?
>> >
>> > - looks like this is exposed to userspace?
>> >   but userspace can not be trusted not to violate the spec.
>> >   how can that be sufficient to satisfy MUST requirements?
>>
>> In the virtio-gpu implementation in the RFC series it's indeed exposed to
>> userspace. This is because gpu drivers are supported by userspace drivers
>> (Mesa), and both have a very close relationship. Probably, that patch should
>> also make the kernel driver reject mappings that doesn't comply with the
>> alignment to ensure it satisfies the MUST requirements.
>>
>> I'll do that in the non-RFC series.
>>
>> >   what are these mappings and what are the alignment restrictions,
>> >   in fact?
>> >
>> >
>> > Looking at that patch, I begin to suspect that while the spec patch
>> > talks about device mapping requests, it is actually the other way around:
>> > the restriction is on guest virtual to guest physical mappings?
>>
>> No. The guest can operate in smaller-than-host mappings (otherwise, running
>> a 4K guest kernel on a 16k host wouldn't be possible).
>>
>> Shared Memory Regions tend to be used this way:
>>
>>  1. The guest requests access to certain resource owned by the host. The
>> request can be for the whole resource or part of it. The request  includes the
>> 'offset' within the resource, and the 'size' of the window  it wants to have on
>> it.
>>
>>  2. The host maps the resource, from 'offset' to 'size' (as received by  the
>> guest), into a certain offset from the host's view of the mapping  backing the
>> Shared Memory Region.
>>
>>  3. The guest receives an answer indicating the offset (completely  different
>> and independet from the offset that was requested within the  resource in 1)
>> within the Shared Memory Region where the resource has  been mapped.
>>
>>  4. The guest starts operating on the resource, now available in the  Shared
>> Memory Region at the offset received in 3.
>>
>> The problem this change in the specification tries to address is that, in step 2,
>> both 'offset' and 'size' must be aligned according to the host's limitations (in a
>> traditional host/guest scenario, this would the host's page size). But the guest
>> has no knowledge of this limitations, so it can't adjust 'offset' and 'size' as
>> needed.
>>
>> While this example is written thinking of virtual devices, it's certainly possible
>> to implement physical virtio devices that may have a minimum granularity
>> bigger than the host's.
>>
>> > Does the feature affect other device types besides gpu, and how?
>>
>> Every device with Shared Memory Regions is affected. The only reason we
>> found the issue in gpu first is because it's the most intense user of SHM
>> regions. The moment we attempted to use it on a 16K page host, the issue
>> was made clear.
>>
>> For instance, fs is also affected, but only uses SHM regions with DAX, and the
>> latter is barely used due to various constrains.
>>
>> New devices using SHM, like virtio-media, are sure to hit this issue sooner
>> than later.
>>
> I understand the issue much better now. Thanks a lot for the detailed explanation.
> Given that all the resource carve out (window access), resource allocation and mapping is done through a channel outside of shared memory,
> and this is not about the page size, but about the resource mapping size,
>
> I believe this resource mapping size and offset restrictions should be communicated via same communication channel that does this resource mapping plumbing.
>
> Plumbing this into the shared memory capability does not look right place as it has no knowledge of steps #1 to #4 you walk through.
> Please consider using your existing resource mapping channel to communicate such restrictions.

I'm afraid I have to disagree. Today, the transports provide the
'offset' and 'size' for each SHM region, because back in the day it was
deemed to be all the information needed to make use of them. Now we know
that having the 'minimum granularity' allowed for each mapping in the
region is as important as having 'offset' and 'size'.

I can't think of a reason why, given that those three pieces of
information are needed to make use of a SHM region, two of them must be
provided in the transport, but the third must be obtained in a
device-specific way.

Thanks,
Sergio.

