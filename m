Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758281EE014
	for <virtio-comment@lists.linux.dev>; Tue,  1 Apr 2025 10:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743502187; cv=none; b=WZtZldG+K0WoALnFTzMuvm65I6+5bcw8pW9dmlzFXeIj3RwkV9DZ62u3HYlz9WQigiybQ1s+hR4F26WmZ96OD48rNjBKyVlo5p0tSckf4zdtOUEn2Jb7zVD5cj03Ou+GgVNwcolj9eoxyKSDa1WCLwom5/RaMBcVALqpPKuOn/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743502187; c=relaxed/simple;
	bh=ctWvEwMSKNij3c3UzdxmvOrGj6SxBvSJaTq66+mp7rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=C1FpZ3gAiW6SX8VWZVgvVJh3yu6xoi7yOBJ4drk+0mAi2UC/enpEjYUvAJb1LXlfG6HSVfJsFcjs08d1m1xPKRYQYtNURNcldiEV+Duy4uWqfoXwjkf0uF6S4RGO8YrGGKrJfRdpk5dxY17pqSxTR3l5amcwZRZnLibZztSNy2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HBlXA5rC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HBlXA5rC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743502184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=07gQ7VBBitexlfhi4ockNH3llI/2uvi28iuhAR2th8M=;
	b=HBlXA5rCt6TlEeniFlBfA/BnTyCYHovQU1+4jbA8HfqWE6zHNZvj7IVF4fuDZdFmNpYl6O
	oBO5ul9C6JJ4qezwkuTeWoKaXSwQHlK8dzPQu8jVGMiRn5HVoOEtdyfSLkLG+ggvrGzOZV
	qxWxobOq8vUjpEmtlOFqLbFe+BAZ6IM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-3kij_oIcPX2Owlv4y8d1uA-1; Tue, 01 Apr 2025 06:09:43 -0400
X-MC-Unique: 3kij_oIcPX2Owlv4y8d1uA-1
X-Mimecast-MFC-AGG-ID: 3kij_oIcPX2Owlv4y8d1uA_1743502182
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-39c142d4909so1563353f8f.3
        for <virtio-comment@lists.linux.dev>; Tue, 01 Apr 2025 03:09:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743502182; x=1744106982;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07gQ7VBBitexlfhi4ockNH3llI/2uvi28iuhAR2th8M=;
        b=B6nxHAtiZ5Xci7p/Z+eDMdcjnxd3xsuXTwloWlx3nP7tboU3jZJcYT+NVVIkEbIFJV
         wIGbdyuvl/xRRPPQ6noOzx7DeAlGeGwY7YJ1wUcJCMFhDcSEWM+s3qykFhvxh0q/Hm22
         KPEKuzYBV+fA/jKan5y9iOXQHKyVWeofyGFDm1Cdktr/bYbbce99zAkA5Z4frsVJDsZL
         DGjbDCxF5LHGeTyms9sFPYliH2E1jQy+yjgUJXMEvCTO6Q5s78A2Yufn6ON0kDQ9J4Gi
         iXas7UVA1x+omHoeLM/LEg6k5IoMHrvfM3NfEw6MD3kfV1JEqeME3OJhoj8181PhdTfq
         C46A==
X-Gm-Message-State: AOJu0YyH83dQ/Qofk2qIALX+jgKJperleyZTuxMR7GatCfGT8+hcVuxO
	RNOZBd7DeXaiQDCxC6STz0Fv2WuTErDg4do3X6+j/WaazZLNOGrSOHJhMuql1rt+ofn2V1xECwZ
	vywZ6E/D7y+puaGRkFXfSmrWPJ6ZqLSu2zMeDrAFJz4ZPGljjEoF+blSnc1ako6SQ7KtMI/ue
X-Gm-Gg: ASbGncv1tpHDjvRrChYJ4QVJDsXuDzl/8kt97ubA+n878rUndzEXjf2YaYEPT+odnAg
	Dvo5DsGuGpNBshk1INpNgvpbQxsjQA+yxWdqkfNGeB51S9s4/kfzwtHuittJzDHYSZgYi3ulUYl
	5jtixSZogoCrQ6fJ1dwbhpZqrg0iSIEeCWHfK/mTKqoYUfQMP746X4y+mGENFK/mUAVzzAgDyxJ
	4TqFvCFRwvRcuEYVGY7ftXv1jOlu4Dgts42umMiK4L36iV+KqOmf3GDKTo6JOxIHoYngFI6rva9
	SsLeF2RShQ==
X-Received: by 2002:a05:6000:43d5:b0:391:40bd:621e with SMTP id ffacd0b85a97d-39c12118f91mr7788430f8f.44.1743502181796;
        Tue, 01 Apr 2025 03:09:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdHdbmnZ0qC/xKYGa+VNylFst4jNSwE6ZKHP/8sq/NSCIRM2cnIa5CDeBb008nQMPXnuYW/g==
X-Received: by 2002:a05:6000:43d5:b0:391:40bd:621e with SMTP id ffacd0b85a97d-39c12118f91mr7788412f8f.44.1743502181364;
        Tue, 01 Apr 2025 03:09:41 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e33asm13867282f8f.66.2025.04.01.03.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 03:09:40 -0700 (PDT)
Date: Tue, 1 Apr 2025 06:09:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Sergio Lopez Pascual <slp@redhat.com>
Cc: virtio-comment@lists.linux.dev, dmitry.osipenko@collabora.com,
	parav@nvidia.com
Subject: Re: [PATCH v2 1/3] shared-mem: introduce page alignment restrictions
Message-ID: <20250401053650-mutt-send-email-mst@kernel.org>
References: <20250331150548.50595-1-slp@redhat.com>
 <20250331150548.50595-2-slp@redhat.com>
 <20250331121538-mutt-send-email-mst@kernel.org>
 <CAAiTLFXdYDSgZnYAgGC-FpMcyOnqBZpiTrHOk=4x_jFiRzkcbg@mail.gmail.com>
 <20250401050828-mutt-send-email-mst@kernel.org>
 <CAAiTLFUsonoJnuqqgk8smb3ySEK-4GYnLweeu+GboTdyo0Uq5A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAiTLFUsonoJnuqqgk8smb3ySEK-4GYnLweeu+GboTdyo0Uq5A@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4xmEIapUoPyKFJUw9BilRgJOZJ5nVATtFFviAH-PFKE_1743502182
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 01, 2025 at 11:26:38AM +0200, Sergio Lopez Pascual wrote:
> "Michael S. Tsirkin" <mst@redhat.com> writes:
> 
> > On Mon, Mar 31, 2025 at 09:40:37AM -0700, Sergio Lopez Pascual wrote:
> >> "Michael S. Tsirkin" <mst@redhat.com> writes:
> >>
> >> > On Mon, Mar 31, 2025 at 11:05:46AM -0400, Sergio Lopez wrote:
> >> >> Add a subsection for page alignment restrictions.
> >> >>
> >> >> Signed-off-by: Sergio Lopez <slp@redhat.com>
> >> >> ---
> >> >>  shared-mem.tex | 6 ++++++
> >> >>  1 file changed, 6 insertions(+)
> >> >>
> >> >> diff --git a/shared-mem.tex b/shared-mem.tex
> >> >> index 6e6f6c4..2021083 100644
> >> >> --- a/shared-mem.tex
> >> >> +++ b/shared-mem.tex
> >> >> @@ -34,6 +34,12 @@ \subsection{Addressing within regions}\label{sec:Basic Facilities of a Virtio De
> >> >>  The \field{shmid} may be explicit or may be inferred from the
> >> >>  context of the reference.
> >> >>
> >> >> +\subsection{Page alignment restrictions}\label{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Page alignment restrictions}
> >> >> +
> >> >> +When requesting the device to map memory into a shared memory region
> >> >> +the driver MUST obtain the page size information from the transport
> >> >> +and honor the page alignment constrains derived from that page size.
> >> >> +
> >> >
> >> > will make existing drivers autmatically incompliant with new devices.
> >> >
> >> > we generally avoid things like this.
> >>
> >> This is the reason why in v1 this was gated behind
> >> VIRTIO_F_SHM_PAGE_SIZE. But from the discussion on that thread, I
> >> understood that, at least for the PCI transport, it was preferred to
> >> have the page_shift field unconditionally:
> >>
> >> https://lore.kernel.org/virtio-comment/CY8PR12MB71950314C5683EB7CFF0815BDCCA2@CY8PR12MB7195.namprd12.prod.outlook.com/
> >>
> >> Did I misunderstand the conclusions?
> >>
> >> Sergio.
> >
> > I think Parav missed this compatibility implication when he said:
> >
> > 	So to obtain a free information, feature bit is not necessary, this can be self-
> > 	described in the pci capability itself.
> >
> > Parav, this is about the MUST requirement referring to honoring
> > alignment, not about obtaining the information which indeed can
> > be done without.
> 
> Would it be reasonable to expose page_shift in the transports
> unconditionally but only require drivers to honor the page alignment
> restrictions if VIRTIO_F_SHM_PAGE_SIZE has been negotiated?
> 
> Personally, from a device/driver implementator PoV, I'd prefer to have
> everything (the `page_shift` field in PCI, the SHMPageShift register in
> MMIO and the requirement to honor page alignment) gated behind
> VIRTIO_F_SHM_PAGE_SIZE, but if there's a reason to prefer the approach
> mentioned above, I'm fine with it.
> 
> Thanks,
> Sergio.

It's unclear when is it ok to access the field then, or what is the
value if accessed when feature bit is not negotiated. On this I think
I agree it is easier to just have it there unconditionally.

-- 
MST

