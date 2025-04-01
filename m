Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEDCEACE
	for <virtio-comment@lists.linux.dev>; Tue,  1 Apr 2025 10:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743504425; cv=none; b=uhTiMpc6F7rBVqqQ4OyMnGFeg469ODc1hATY1J5W+oPyXcQiJ3l2O2wINO7XspifpvQReyxvOfdOkhM2TxtWNpEd6WJX1V4O4RGF1aCr4WIF4PgF/hnKaDs67F8/OHsmZT9IyG0V8H4GycUbeFpG1d6Ket2FEJLMxHGugWbfFzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743504425; c=relaxed/simple;
	bh=51F8rA71vbLJ/WlU6hZkbOU9Td6YlFH80ezLX8ZUPek=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IAFExAVDN4m4VwRWU3hPDaCpEhUMHczlvmMlk4TILioRQgSt4DYUQIwaomLMgr6eMpPQpD20GXwhnYdZSvFOMbhP4FT0GmBxbyOyvmy9P3zDPNdDqNDHrqW+HT0b4SR1mlMBPzmK+ma4Sr0m9KSNlen19iHzUOJF/cZnFqRfetg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HGvuR3a+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HGvuR3a+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743504422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p0U11TQ+9Z58Zz7mFF8uchKx5wo01pJZeeXAMAXZG54=;
	b=HGvuR3a+SMiu5d8Qceq5VWMZ1CxmxtPeOOIwQdgZnWPfkxfvj5yELHpr5rFeJ1/n6e6F4/
	ei1sAzv0hC7lJOtEsMrRKixrrDyWxL4/UmogWAfnzEcpHEAI+IdbAptW1tMZROEVGUeNq4
	aE0Syr7Ydseuy7ieha+N0kjdIQuybm4=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-pmFAf0GZPcGu-OulCcKBtA-1; Tue, 01 Apr 2025 06:47:01 -0400
X-MC-Unique: pmFAf0GZPcGu-OulCcKBtA-1
X-Mimecast-MFC-AGG-ID: pmFAf0GZPcGu-OulCcKBtA_1743504421
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2254e500a73so73153235ad.0
        for <virtio-comment@lists.linux.dev>; Tue, 01 Apr 2025 03:47:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743504421; x=1744109221;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p0U11TQ+9Z58Zz7mFF8uchKx5wo01pJZeeXAMAXZG54=;
        b=evNYjmknQyVRop1CUf5ZPw7nQZQDQLOlbQjuJG4b+Lg0lxNYCa/SsJlhlg+INus10A
         QmbBQnaLBiMB7EueWv/wbuv8AOUOMHlcVqfam+HH1HeJodO0C4UfdJUSSoKG8wbQ/3m8
         S6bvdibJg+DOCn7zMfytn1kKgAfVf0J2CKm6BPf0i2kdD5iHpPqDd6TKXoBsiH7lH/OJ
         866YkFxrdBTDTJmDvbXBlA0Vx9fvA80ektNLFyQ5T3goxjhgyJ6/mcRaT5tm00qGpn3+
         roI/eQgGxAcpbMSfT3TxNnNUsMhkwe98GukPc58g7sg+72H05IHebWS7ciyrvus7ks/Q
         p7XQ==
X-Gm-Message-State: AOJu0Ywe6XuUzVE8NP85dYrTW0C/xJb3EPpN42hwbmfp70lVo8D8yinQ
	h2mLoYVENwDrsXxWle+ead1555la0U6XLBbI3fsZD3NZHGemt2pz5O3Wlf6p8Vjj3BezItAiBMu
	hHuVN5GXfYELE+q51XWEQIkMWnbfkwI9W36TRZAAbmLSBpFgzkklY49FGPwJCeAiwedamBPRSkf
	gUGe72DrxztM6PQacVcTliNkueP5rR3Hnl93yciLg=
X-Gm-Gg: ASbGncv43Un1bQBFKm2dx/z+HwQRe8IV6USbMd84NByQuk/1j+86DtMoEAwmu9Ey5ZF
	R2JtIqfHIxOmCefiddR0WDqMZAVvVSswCeCgeGzgejrtS9OdDgD8B+tydF6/iSr2DQTuuRg==
X-Received: by 2002:a17:903:2f03:b0:220:c911:3f60 with SMTP id d9443c01a7336-2295c104441mr35668565ad.47.1743504420698;
        Tue, 01 Apr 2025 03:47:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQdyp7mnw5RCw7LZkp7e58HyXs8u7Ts4ADDO3SU8SeKN+k4y7ze8RZdsp9raySQNZBICqXOe4VS708HDKHh2g=
X-Received: by 2002:a17:903:2f03:b0:220:c911:3f60 with SMTP id
 d9443c01a7336-2295c104441mr35668285ad.47.1743504420321; Tue, 01 Apr 2025
 03:47:00 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Apr 2025 03:46:59 -0700
From: Sergio Lopez Pascual <slp@redhat.com>
In-Reply-To: <20250401053650-mutt-send-email-mst@kernel.org>
References: <20250331150548.50595-1-slp@redhat.com> <20250331150548.50595-2-slp@redhat.com>
 <20250331121538-mutt-send-email-mst@kernel.org> <CAAiTLFXdYDSgZnYAgGC-FpMcyOnqBZpiTrHOk=4x_jFiRzkcbg@mail.gmail.com>
 <20250401050828-mutt-send-email-mst@kernel.org> <CAAiTLFUsonoJnuqqgk8smb3ySEK-4GYnLweeu+GboTdyo0Uq5A@mail.gmail.com>
 <20250401053650-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 1 Apr 2025 03:46:59 -0700
X-Gm-Features: AQ5f1Jo__7JyfmixHbKlEbSCV4Cs9YWrh-CWyCB9QL0IbgOesLpssf3szwFxp8w
Message-ID: <CAAiTLFWO3eg+gXNbpxSt9oZ5x=yK0w3LSXnZaTJJCjy8vt=BfA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] shared-mem: introduce page alignment restrictions
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev, dmitry.osipenko@collabora.com, 
	parav@nvidia.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0m0XUhcIMf3ITodU7CWcinReemmm1Pi7dN9StwtYp20_1743504421
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Tue, Apr 01, 2025 at 11:26:38AM +0200, Sergio Lopez Pascual wrote:
>> "Michael S. Tsirkin" <mst@redhat.com> writes:
>>
>> > On Mon, Mar 31, 2025 at 09:40:37AM -0700, Sergio Lopez Pascual wrote:
>> >> "Michael S. Tsirkin" <mst@redhat.com> writes:
>> >>
>> >> > On Mon, Mar 31, 2025 at 11:05:46AM -0400, Sergio Lopez wrote:
>> >> >> Add a subsection for page alignment restrictions.
>> >> >>
>> >> >> Signed-off-by: Sergio Lopez <slp@redhat.com>
>> >> >> ---
>> >> >>  shared-mem.tex | 6 ++++++
>> >> >>  1 file changed, 6 insertions(+)
>> >> >>
>> >> >> diff --git a/shared-mem.tex b/shared-mem.tex
>> >> >> index 6e6f6c4..2021083 100644
>> >> >> --- a/shared-mem.tex
>> >> >> +++ b/shared-mem.tex
>> >> >> @@ -34,6 +34,12 @@ \subsection{Addressing within regions}\label{sec:Basic Facilities of a Virtio De
>> >> >>  The \field{shmid} may be explicit or may be inferred from the
>> >> >>  context of the reference.
>> >> >>
>> >> >> +\subsection{Page alignment restrictions}\label{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Page alignment restrictions}
>> >> >> +
>> >> >> +When requesting the device to map memory into a shared memory region
>> >> >> +the driver MUST obtain the page size information from the transport
>> >> >> +and honor the page alignment constrains derived from that page size.
>> >> >> +
>> >> >
>> >> > will make existing drivers autmatically incompliant with new devices.
>> >> >
>> >> > we generally avoid things like this.
>> >>
>> >> This is the reason why in v1 this was gated behind
>> >> VIRTIO_F_SHM_PAGE_SIZE. But from the discussion on that thread, I
>> >> understood that, at least for the PCI transport, it was preferred to
>> >> have the page_shift field unconditionally:
>> >>
>> >> https://lore.kernel.org/virtio-comment/CY8PR12MB71950314C5683EB7CFF0815BDCCA2@CY8PR12MB7195.namprd12.prod.outlook.com/
>> >>
>> >> Did I misunderstand the conclusions?
>> >>
>> >> Sergio.
>> >
>> > I think Parav missed this compatibility implication when he said:
>> >
>> > 	So to obtain a free information, feature bit is not necessary, this can be self-
>> > 	described in the pci capability itself.
>> >
>> > Parav, this is about the MUST requirement referring to honoring
>> > alignment, not about obtaining the information which indeed can
>> > be done without.
>>
>> Would it be reasonable to expose page_shift in the transports
>> unconditionally but only require drivers to honor the page alignment
>> restrictions if VIRTIO_F_SHM_PAGE_SIZE has been negotiated?
>>
>> Personally, from a device/driver implementator PoV, I'd prefer to have
>> everything (the `page_shift` field in PCI, the SHMPageShift register in
>> MMIO and the requirement to honor page alignment) gated behind
>> VIRTIO_F_SHM_PAGE_SIZE, but if there's a reason to prefer the approach
>> mentioned above, I'm fine with it.
>>
>> Thanks,
>> Sergio.
>
> It's unclear when is it ok to access the field then, or what is the
> value if accessed when feature bit is not negotiated. On this I think
> I agree it is easier to just have it there unconditionally.

Got it. Let's do that in v3.

Thanks!
Sergio.

