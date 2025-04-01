Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D0A1C7006
	for <virtio-comment@lists.linux.dev>; Tue,  1 Apr 2025 09:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743499605; cv=none; b=nZZl8q9IutEm3lbXM1KUygKLTXUuiLk0CWEXlpwnhYOFgg+Nb7ZymaZB/KJHzJZxAO/UPcWH3L+bxKEIQITTamMoBX2q0Xm25JaBstYoDqSGNho+EIfvD4pmzQhHLPtwJU9fDA6ReGhV2aQTMaskt9jxGFnbKCnIpGV4I8P1Mdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743499605; c=relaxed/simple;
	bh=vJ1TNUdb5vZc4u3PKMcyeWlaAqcMWPwOcgWBjtVGA0M=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GS/9XrUAhQwZBw0HFUqlC8QtAK88GW4VT/H/7gFEh9a0bs6sy3HuQfTOc/uy7ucynTY3AEgRDjqhXiscJKnXw70v/JggmFNakZQ47EQabPqGP3wN4+G/fKlHmXAah2xIE08smBVHOVcyJCzsXOLfcS0BGq9IcrN2Wu6zqpNOaBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JreerHro; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JreerHro"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743499602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oKoe6i2cjTM2a5h+x/jqxRzIniTgE1LaC32rJ9+C67o=;
	b=JreerHroyi6SLuDeyGwdwTG909mwKirN2F/bmaSP4XdnO1ZMc3u+68i1OKDBfv4WmW34lD
	E2GaskcpKCu4o0c/6pHjlRKT5BQB6rEILE2hYmMCkuiPSVaBjjGlIdr1Up7V+xQ35HTHhE
	F9cVaue+pgjIz98liyiQXTKBGBQOJCc=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-XCODssNBMhyDjNglu9ZfIQ-1; Tue, 01 Apr 2025 05:26:41 -0400
X-MC-Unique: XCODssNBMhyDjNglu9ZfIQ-1
X-Mimecast-MFC-AGG-ID: XCODssNBMhyDjNglu9ZfIQ_1743499600
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2255ae39f8fso118868185ad.0
        for <virtio-comment@lists.linux.dev>; Tue, 01 Apr 2025 02:26:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743499600; x=1744104400;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oKoe6i2cjTM2a5h+x/jqxRzIniTgE1LaC32rJ9+C67o=;
        b=Hp7v+6dN8vqKMupaKSNazEzeig/nPILPHF36Ckrxxhj6g8POHvxoI8NVSqPduZ/jsd
         h4KfgAzsr77XGRSnbFQfpxig9zRE5deKt/jfTTgIWbJ0xdIoqB8JbAWVXkFlMFC0UWpr
         dVPg/8Pb47tF6N4baXhRczcWRzlfbYnty7YnmWLyheqMnOnbFL16SyMG/od9dYi+jUZd
         13PU4pw/ROeBJ2SCoopdMHFInXPlqBmMlDraugqOCiM/GnnPIrKpwvNWY3KATKeSUVen
         ZTq/pzA6HFV9SO3s7AhOKU4c+VMW5r/eQO+bf3lZvyPR97xWu/jWeNeoNcAGHoSN2QW5
         odUw==
X-Gm-Message-State: AOJu0YzaXaz7JMMIz9LA47U/fGpTDI3cNj39WO93ItJs0+8KMcJ25Gg5
	+meskvmSAEth1k3b9iPBXz406/d7N5DgS7aYn3m9mafr/jCgw3i8chlugi29FkCEOz5zeNNyNko
	d36EA17fQVRQUeW3zYQtgemf7pBzu91EiW92gEy97z/WsH7S8m9+Lf70F3gAUTn8wteHNirFK0A
	wDTmVcsVNiizw6G+vsa2zmuuFeh65NYJgKIheUts8=
X-Gm-Gg: ASbGncvwrhRInz4tsG1hqR1Dg/a2lCoWLIeiJWoJqgaCv2210MeaczgBXI5uLgkdKDg
	NDLkErO0zxvcTlcKyvlW8Se11JBIwVZ9qliom7ZD6Uzql9FuvcLWIRDb854sjd4hpeHqdag==
X-Received: by 2002:a17:902:d507:b0:224:24d3:60fb with SMTP id d9443c01a7336-22921cca739mr247473945ad.10.1743499599998;
        Tue, 01 Apr 2025 02:26:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4EBi9dptdUjZG43IHv2qk//vxSrNiDnZghVwKXxTJ//dM59JshUMxmgX44rimg0AFvlM6POA6VhAUNqGaLV8=
X-Received: by 2002:a17:902:d507:b0:224:24d3:60fb with SMTP id
 d9443c01a7336-22921cca739mr247473705ad.10.1743499599691; Tue, 01 Apr 2025
 02:26:39 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Apr 2025 11:26:38 +0200
From: Sergio Lopez Pascual <slp@redhat.com>
In-Reply-To: <20250401050828-mutt-send-email-mst@kernel.org>
References: <20250331150548.50595-1-slp@redhat.com> <20250331150548.50595-2-slp@redhat.com>
 <20250331121538-mutt-send-email-mst@kernel.org> <CAAiTLFXdYDSgZnYAgGC-FpMcyOnqBZpiTrHOk=4x_jFiRzkcbg@mail.gmail.com>
 <20250401050828-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 1 Apr 2025 11:26:38 +0200
X-Gm-Features: AQ5f1JqiAjXg5SncM3JVhDXMUrDeMyyupi72WWJSNu7iXD57BqIWGBFprZxfwiM
Message-ID: <CAAiTLFUsonoJnuqqgk8smb3ySEK-4GYnLweeu+GboTdyo0Uq5A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] shared-mem: introduce page alignment restrictions
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev, dmitry.osipenko@collabora.com, 
	parav@nvidia.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sQ-QrDpQygrQioEVTJxgb83u1yefXqhTsoUv1A4ekzo_1743499600
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Mon, Mar 31, 2025 at 09:40:37AM -0700, Sergio Lopez Pascual wrote:
>> "Michael S. Tsirkin" <mst@redhat.com> writes:
>>
>> > On Mon, Mar 31, 2025 at 11:05:46AM -0400, Sergio Lopez wrote:
>> >> Add a subsection for page alignment restrictions.
>> >>
>> >> Signed-off-by: Sergio Lopez <slp@redhat.com>
>> >> ---
>> >>  shared-mem.tex | 6 ++++++
>> >>  1 file changed, 6 insertions(+)
>> >>
>> >> diff --git a/shared-mem.tex b/shared-mem.tex
>> >> index 6e6f6c4..2021083 100644
>> >> --- a/shared-mem.tex
>> >> +++ b/shared-mem.tex
>> >> @@ -34,6 +34,12 @@ \subsection{Addressing within regions}\label{sec:Basic Facilities of a Virtio De
>> >>  The \field{shmid} may be explicit or may be inferred from the
>> >>  context of the reference.
>> >>
>> >> +\subsection{Page alignment restrictions}\label{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Page alignment restrictions}
>> >> +
>> >> +When requesting the device to map memory into a shared memory region
>> >> +the driver MUST obtain the page size information from the transport
>> >> +and honor the page alignment constrains derived from that page size.
>> >> +
>> >
>> > will make existing drivers autmatically incompliant with new devices.
>> >
>> > we generally avoid things like this.
>>
>> This is the reason why in v1 this was gated behind
>> VIRTIO_F_SHM_PAGE_SIZE. But from the discussion on that thread, I
>> understood that, at least for the PCI transport, it was preferred to
>> have the page_shift field unconditionally:
>>
>> https://lore.kernel.org/virtio-comment/CY8PR12MB71950314C5683EB7CFF0815BDCCA2@CY8PR12MB7195.namprd12.prod.outlook.com/
>>
>> Did I misunderstand the conclusions?
>>
>> Sergio.
>
> I think Parav missed this compatibility implication when he said:
>
> 	So to obtain a free information, feature bit is not necessary, this can be self-
> 	described in the pci capability itself.
>
> Parav, this is about the MUST requirement referring to honoring
> alignment, not about obtaining the information which indeed can
> be done without.

Would it be reasonable to expose page_shift in the transports
unconditionally but only require drivers to honor the page alignment
restrictions if VIRTIO_F_SHM_PAGE_SIZE has been negotiated?

Personally, from a device/driver implementator PoV, I'd prefer to have
everything (the `page_shift` field in PCI, the SHMPageShift register in
MMIO and the requirement to honor page alignment) gated behind
VIRTIO_F_SHM_PAGE_SIZE, but if there's a reason to prefer the approach
mentioned above, I'm fine with it.

Thanks,
Sergio.

