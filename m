Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0951B0406
	for <virtio-comment@lists.linux.dev>; Wed,  2 Apr 2025 16:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743611340; cv=none; b=dwnMF3dMZUZV+R11yChbybnhcpMm2fpebpkkuwvV3ZHNfD157snfiuZ85/amLUXLK33f0nzJbgNPDgrhub0jZ9se19fMVfnw0SD3Go+QbzdzCSgA2gXeEhK52/xiaQ8ZEPmd6ouQJ5KeSCarNu7RGPwDAuh2v3TLEqGa66gOMyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743611340; c=relaxed/simple;
	bh=Ga4tcelrpHl5hwELWM+TRRYKbdrM94BPrdQd2tr/vz8=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SFF0JZw/cWR85ehUiDng1vnuxKoDAPT2gqFH27/dgXBIvP36q80MMzBEvQdXH0aJE1unGg1K7j8Xyxp41/blVhHIMKSnHY7Hl3BuBd2BL7Ygt4kB9gWM1iFqsKk/H/CXgcyfZK2dbt9bDIRW+mWwIa+BfHYCHJWs5BPIfdvzE5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QGdBZxDD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QGdBZxDD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743611338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1/i6PTl5094bhhbLnlQXns3Y7BW6QLjvLVGTw4dqNoY=;
	b=QGdBZxDDLqBa9ilJ0SfeyxwsIsguYRK4Bz2GD+7ugYtbkpp0po7KAtrMtkV3Of2ZhNsydM
	p7kHtZsUdsShiU64rkJqY7Yo4T6xHwD7fQtwe4ZqvbA0F9OU7hc2aY5bhXQFAy21Sz/pW4
	frZQg8gsp+vDFjdrqwhB8QE1IGZ+MDk=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-YGsMBLCHP9q9cN_8kBN-aA-1; Wed, 02 Apr 2025 12:28:57 -0400
X-MC-Unique: YGsMBLCHP9q9cN_8kBN-aA-1
X-Mimecast-MFC-AGG-ID: YGsMBLCHP9q9cN_8kBN-aA_1743611336
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-229170fbe74so343665ad.2
        for <virtio-comment@lists.linux.dev>; Wed, 02 Apr 2025 09:28:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743611336; x=1744216136;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1/i6PTl5094bhhbLnlQXns3Y7BW6QLjvLVGTw4dqNoY=;
        b=w0nqlM2PtTGcc6SdOoB7RDVhzcWPHIEG/geewGi6khB4Z1GWl5dSr4f7gpByObBH3b
         fWz8PcMAWhTvHE7nV/574QV1Pp4h7PhClwSIxakcHV0z2I3GMSkHNCDg2wDMBAqczxhd
         nsV+9OGMYZd4lSvKZrwKkn0LB8VSeooW/TxE5j8z+h1Z5ti2YJFvMCobIlf7QMYUrneC
         Mq2BcX9kiv05mkUP9nkwGptp2qQIWziaVap/e+X3EtY/3yWh5Gx0CycqMgrTD2iAXfJK
         rLMmDfPZCaHWR1xacoLlDxY1eJBkj0IuSSntKCiyz3jYYVJno6ywguOtBpZ02jPHuiqx
         aOXw==
X-Gm-Message-State: AOJu0YyXGfyyPRivLpjeDE0VqNsPPr823jgV2w3xz0sS9Y/puEd9JGCW
	YpyCVuRYaOg1vhT3pqTdBS7fbBTQxiPUCqj3BQV/1/DundoOh7tssrWlZq88JJoASg++rpmmA9B
	2z/k4IcxPt+ekGXoYfnog/awr0U8fFxwpujwYvHtoTDV0EJN7j+DJ+Eoyfm8EjbOFkvJ1DTtbBc
	7pxWeEM9pfjrJI056Bk9W0M9B+Umy3IggHueJsJgk=
X-Gm-Gg: ASbGncsdGrnJhRYybfcVPtOO/wRdFnTxkkylAgCa3aDMu8RpwTIlDi7SSWhP31ayN01
	Q8XstcJaclhRInzbhb2y3nnIbBJbtVq88HViwvyEb3qeEYXtVrMYsW+9XcDk+iRA3XkYZ3w==
X-Received: by 2002:a17:903:19e7:b0:224:5b4:b3b9 with SMTP id d9443c01a7336-2292f9d6822mr277982125ad.33.1743611335855;
        Wed, 02 Apr 2025 09:28:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFVC8SEvL+snnQBDP6WTOBFLCHDxuUxQrAezUaObVnte75Bhfev7rkYTfwQfl1sP9bJWjIIb6ucEMbGgAiYx4=
X-Received: by 2002:a17:903:19e7:b0:224:5b4:b3b9 with SMTP id
 d9443c01a7336-2292f9d6822mr277981845ad.33.1743611335498; Wed, 02 Apr 2025
 09:28:55 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 2 Apr 2025 16:28:54 +0000
From: Sergio Lopez Pascual <slp@redhat.com>
In-Reply-To: <20250402104725-mutt-send-email-mst@kernel.org>
References: <20250331213711.63398-1-slp@redhat.com> <20250402033354-mutt-send-email-mst@kernel.org>
 <CAAiTLFUxqPp4V=gkJ9CWttoP1wSKEtp5WrE9yhePFN2PiMVa5w@mail.gmail.com>
 <CY8PR12MB7195FB85CD0B553F8C262456DCAF2@CY8PR12MB7195.namprd12.prod.outlook.com>
 <20250402104725-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 2 Apr 2025 16:28:54 +0000
X-Gm-Features: AQ5f1JpGq-sQmL-3nki16dBAo3_ykR_cQLGjuN9U20LN-8t9GHyyUA91XiZY80M
Message-ID: <CAAiTLFXmFPmHHk--d_RxNV2C40RO1PNuBSJoHeuCFZ-T165cBQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] shared-mem: introduce page alignment restrictions
To: "Michael S. Tsirkin" <mst@redhat.com>, Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, 
	"dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: w-v7zQYsjvObFzoU82C95Vh0DpEOKeSE9VoMpSzpe-k_1743611336
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Wed, Apr 02, 2025 at 09:55:20AM +0000, Parav Pandit wrote:
>> Hi Sergio,
>>
>> > From: Sergio Lopez Pascual <slp@redhat.com>
>> > Sent: Wednesday, April 2, 2025 2:48 PM
>> >
>> > "Michael S. Tsirkin" <mst@redhat.com> writes:
>> >
>> > > On Mon, Mar 31, 2025 at 05:37:08PM -0400, Sergio Lopez wrote:
>> > >> There's an incresing number of machines supporting multiple page
>> > >> sizes and, on these machines, the host and a guest can be running
>> > >> with different pages sizes.
>> > >>
>> > >> In addition to this, there might be devices that have a required
>> > >> and/or preferred page size for mapping memory.
>> > >>
>> > >> In this series we extend the "Shared Memory Regions" with a
>> > >> subsection explaining the posible existence of page alignment
>> > >> restrictions when the VIRTIO_F_SHM_PAGE_SIZE feature has been
>> > negotiated.
>> > >>
>> > >> For the device to provide the page size information to the driver, we
>> > >> need to extend the PCI and MMIO transports. For the former, we borrow
>> > >> 8 bits from the 16 bit padding in virtio_pci_cap to hold a page_shift
>> > >> field which can be used to derive the page size by using the
>> > >> following
>> > >> formula: (page_size = 1 << (page_shift + 12)).
>> > >>
>> > >> For MMIO, we add a the SHMPageShift register at offset 0x0c4, also
>> > >> holding the page_shift value. Since MMIO registers are 32 bit wide,
>> > >> we could have asked the device to directly provide page_size instead
>> > >> of page_shift, but seems reasonable to be consistent across transports.
>> > >>
>> > >> An implementation of the changes proposed in this series has been
>> > >> published as an RFC to the LKML, to be used as a reference:
>> > >>
>> > >> https://lore.kernel.org/all/20250214-virtio-shm-page-size-v2-0-aa1619
>> > >> e6908b@redhat.com/
>> > >
>> > >
>> > > Can you explain the use a bit more please?
>> > >
>> > > - looks like this is exposed to userspace?
>> > >   but userspace can not be trusted not to violate the spec.
>> > >   how can that be sufficient to satisfy MUST requirements?
>> >
>> > In the virtio-gpu implementation in the RFC series it's indeed exposed to
>> > userspace. This is because gpu drivers are supported by userspace drivers
>> > (Mesa), and both have a very close relationship. Probably, that patch should
>> > also make the kernel driver reject mappings that doesn't comply with the
>> > alignment to ensure it satisfies the MUST requirements.
>> >
>> > I'll do that in the non-RFC series.
>> >
>> > >   what are these mappings and what are the alignment restrictions,
>> > >   in fact?
>> > >
>> > >
>> > > Looking at that patch, I begin to suspect that while the spec patch
>> > > talks about device mapping requests, it is actually the other way around:
>> > > the restriction is on guest virtual to guest physical mappings?
>> >
>> > No. The guest can operate in smaller-than-host mappings (otherwise, running
>> > a 4K guest kernel on a 16k host wouldn't be possible).
>> >
>> > Shared Memory Regions tend to be used this way:
>> >
>> >  1. The guest requests access to certain resource owned by the host. The
>> > request can be for the whole resource or part of it. The request  includes the
>> > 'offset' within the resource, and the 'size' of the window  it wants to have on
>> > it.
>> >
>> >  2. The host maps the resource, from 'offset' to 'size' (as received by  the
>> > guest), into a certain offset from the host's view of the mapping  backing the
>> > Shared Memory Region.
>> >
>> >  3. The guest receives an answer indicating the offset (completely  different
>> > and independet from the offset that was requested within the  resource in 1)
>> > within the Shared Memory Region where the resource has  been mapped.
>> >
>> >  4. The guest starts operating on the resource, now available in the  Shared
>> > Memory Region at the offset received in 3.
>> >
>> > The problem this change in the specification tries to address is that, in step 2,
>> > both 'offset' and 'size' must be aligned according to the host's limitations (in a
>> > traditional host/guest scenario, this would the host's page size). But the guest
>> > has no knowledge of this limitations, so it can't adjust 'offset' and 'size' as
>> > needed.
>> >
>> > While this example is written thinking of virtual devices, it's certainly possible
>> > to implement physical virtio devices that may have a minimum granularity
>> > bigger than the host's.
>> >
>> > > Does the feature affect other device types besides gpu, and how?
>> >
>> > Every device with Shared Memory Regions is affected. The only reason we
>> > found the issue in gpu first is because it's the most intense user of SHM
>> > regions. The moment we attempted to use it on a 16K page host, the issue
>> > was made clear.
>> >
>> > For instance, fs is also affected, but only uses SHM regions with DAX, and the
>> > latter is barely used due to various constrains.
>> >
>> > New devices using SHM, like virtio-media, are sure to hit this issue sooner
>> > than later.
>> >
>> I understand the issue much better now. Thanks a lot for the detailed explanation.
>> Given that all the resource carve out (window access), resource allocation and mapping is done through a channel outside of shared memory,
>> and this is not about the page size, but about the resource mapping size,
>>
>> I believe this resource mapping size and offset restrictions should be communicated via same communication channel that does this resource mapping plumbing.
>>
>> Plumbing this into the shared memory capability does not look right place as it has no knowledge of steps #1 to #4 you walk through.
>> Please consider using your existing resource mapping channel to communicate such restrictions.
>
> I think the channel does not matter much. We provide the size why not
> the granularity? But the documentation as written is clearly
> insufficient, there's no explanation how the field is
> used besides some opaque talk about "map" which is never
> defined anywhere.

While working on adding per-device alignment restrictions as you
suggested, I've found there's a precedent for a device already
negotiating the alignment in a device-specific way in fs DAX:

---
The driver maps a file range into the DAX window using the
FUSE_SETUPMAPPING request. Alignment
constraints for FUSE_SETUPMAPPING and FUSE_REMOVEMAPPING requests are
communicated dur-
ing FUSE_INIT negotiation.
---

The structure exchanged in FUSE_INIT does indeed contain such field
(map_alignment):

---
pub struct InitOut {
    pub major: u32,
    pub minor: u32,
    pub max_readahead: u32,
    pub flags: u32,
    pub max_background: u16,
    pub congestion_threshold: u16,
    pub max_write: u32,
    pub time_gran: u32,
    pub max_pages: u16,
    pub map_alignment: u16,
    pub flags2: u32,
    pub unused: [u32; 7],
}
---

Given this precedent, I think it makes sense to keep providing the
alignment information in a device-specific way.

Thanks,
Sergio.

