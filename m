Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750D62253EA
	for <virtio-comment@lists.linux.dev>; Wed, 26 Feb 2025 17:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740592206; cv=none; b=FNLn9dVY2ss3NfhBD9BGFrotkY+MO1r6z0iheo9nj5EjZx2bIAwDdEwgzNGRLT4yARet4ALpMz0Trs4JA9R+FDfWpsYU3UyLqJY5BNJuLoDTWaUS6kWUMTPKSLaJsMe11xYSWtKn7CSc3VumghZ83ddifof8rck4eZa/BQpz+4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740592206; c=relaxed/simple;
	bh=yVyHS5zraagKnP2oqBezrMRU2lVHk20KAeo2oW1tLBw=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Content-Type; b=Wxx0pv1ZmkH2b6dynSX5tJfM6+MlhezN+my7SyV03HKymI8IfIML1PWVFYpGTYap53R9ec6m/fN5fItbymf/fJe3OepJkLiCwJdW2re4ZeqVlpfNpx3AmzU6jP4BXNCTg0rOeRg70O0o5YuuF8DHn/fQRmIrDBTkFnlpyKs2cQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X6H1T4Sr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X6H1T4Sr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740592203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TWQnDLWwfk/gdwhYVgbsYed0bpQxyjJZnaf5I8fs8SU=;
	b=X6H1T4Sr1tqltMc1yo1cCo9ihELpJRuaVZ666zJu/KEniZsQ797cwCmXlkW5EyP3jYiBSj
	WZtEiapnYzQ5dX+V1AWJUonXLJ/R+PujbaHuaOWU1970Z+S0X5C13LHg+YqLBqig1MvLNS
	qswg5RAL2QtzukOMaXKgJwCW3z35uJU=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-VgBMUk__Ps-QCLPEDR9kuQ-1; Wed, 26 Feb 2025 12:50:01 -0500
X-MC-Unique: VgBMUk__Ps-QCLPEDR9kuQ-1
X-Mimecast-MFC-AGG-ID: VgBMUk__Ps-QCLPEDR9kuQ_1740592200
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2fc4dc34291so214886a91.3
        for <virtio-comment@lists.linux.dev>; Wed, 26 Feb 2025 09:50:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740592200; x=1741197000;
        h=to:subject:message-id:date:mime-version:references:in-reply-to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TWQnDLWwfk/gdwhYVgbsYed0bpQxyjJZnaf5I8fs8SU=;
        b=CGHIxK0m0rMEvTNK0fIxcORgD4iOilYn10vvqUBbVdVFu9eZNuF78dmC4Tb5yUVlqu
         yqbID6gg89caJyAd9jwqT3XkIBDkGHR33vM0GpWa1kuUD8wqL9+VmTJAUgqz8jSToT3V
         g0LR4RRKgb4T/PduvKOR5fApVWvkGdY8CBu8t2/8V2rLwsqai/Zk2afAfeTffsOeTyIy
         9eVo7bf1DFME8p9E7ZlDrazi71nDku1LxzzdftSiokAnWAT58hRuyjKRPdjxrerc3soK
         waToF57XgZHlWM5fhO3mu8M4kBgz61lRHppBn7NMB0beCmwrLJI1lQk0oGpauf9iBerJ
         rwaw==
X-Forwarded-Encrypted: i=1; AJvYcCWYwUnoUv02akwAHbLHY4oZqNT8tiiSB3p3hxhAfErTUUF5TN8iWmLkDs8OSwUOK4sC6Ivlmx3Kh9sM48Cupw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywdy7KlvLYemTrghndAOlkCqGeKybAN28QzdDMdRZ/BJXx8G9dt
	LZhd+6hotB+XdIvliIUeS7CWQqgy81Ui9SwrtEV+3x8AHmCVBHznFOGtCo4lv5GOn/UPefrQDOo
	mPFEwEh1orHjLBrVBlyMfinSdlUfV9j8ucmsX/UXgkFvy/2qnDAK3aPkVaFXaSR1EZtWBETuxHM
	mIfyNPgVF8n0nQoqPY15HxyBRC583T85jCaTYHIkGLlQ1GHoI=
X-Gm-Gg: ASbGncs+xorkyin83hmTBsyvHTTsMLtgxbyuuiyrTSsrxoQToiOWvKyTFjbVljJrIvm
	RNThXDBucbzTVLX6YhlQwoiItPer8DVo3GGlQQa7YevFC0QdzsZsVCttypN5z6ElquOkf
X-Received: by 2002:a17:90b:2e47:b0:2fe:99cf:f579 with SMTP id 98e67ed59e1d1-2fe99cff844mr1408312a91.4.1740592200036;
        Wed, 26 Feb 2025 09:50:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGbLcXaO8aoTOpjWo3T9sEiMzcOEgHJ8zPHwaYXbgntcyuEOhOx48Ufg60JQfxT9gPGgjG11S+DYbVy1ngH0f4=
X-Received: by 2002:a17:90b:2e47:b0:2fe:99cf:f579 with SMTP id
 98e67ed59e1d1-2fe99cff844mr1408286a91.4.1740592199649; Wed, 26 Feb 2025
 09:49:59 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Feb 2025 09:49:58 -0800
From: Sergio Lopez Pascual <slp@redhat.com>
In-Reply-To: <CY8PR12MB7195A2AFBB7530874D228954DCC12@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250217115227.4961-1-slp@redhat.com> <20250217115227.4961-2-slp@redhat.com>
 <CY8PR12MB7195A2AFBB7530874D228954DCC12@CY8PR12MB7195.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 26 Feb 2025 09:49:58 -0800
X-Gm-Features: AQ5f1Jqyq1zJfzU47DcZGPyUujQDZei_X3kdDD3wFJKHyEGuiq0USO1LDCWGjOM
Message-ID: <CAAiTLFV2Dn_WztJ4evXLN4tFJGJ_Fqkw=xk5DD5jukvze0snQg@mail.gmail.com>
Subject: RE: [PATCH 1/3] shared-mem: introduce page alignment restrictions
To: Parav Pandit <parav@nvidia.com>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cQ6C44bkDpPh-ZBAf2CYp-fQ2NfNSPW2HAY9U78_4jY_1740592200
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Parav Pandit <parav@nvidia.com> writes:

>> From: Sergio Lopez <slp@redhat.com>
>> Sent: Monday, February 17, 2025 5:22 PM
>>
>> Add a subsection for page alignment restrictions and introduce the
>> VIRTIO_F_SHM_PAGE_SIZE feature bit.
>>
>> Signed-off-by: Sergio Lopez <slp@redhat.com>
>> ---
>>  content.tex    | 3 +++
>>  shared-mem.tex | 7 +++++++
>>  2 files changed, 10 insertions(+)
>>
>> diff --git a/content.tex b/content.tex
>> index c17ffa6..575065d 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -872,6 +872,9 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved
>> Feature Bits}
>>  	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits}
>> for
>>  	handling features reserved for future use.
>>
>> +  \item[VIRTIO_F_SHM_PAGE_SIZE(42)] This feature indicates that the
>> + device  transport provides information about the supported page size.
>> +
>
> Please extend the description around "Feature Bits" section to increase 24 to 41 -> 24 to 42.

Ack.

>>  \end{description}
>>
>>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits} diff
>> --git a/shared-mem.tex b/shared-mem.tex index 6e6f6c4..dd90cb7 100644
>> --- a/shared-mem.tex
>> +++ b/shared-mem.tex
>> @@ -34,6 +34,13 @@ \subsection{Addressing within regions}\label{sec:Basic
>> Facilities of a Virtio De  The \field{shmid} may be explicit or may be inferred
>> from the  context of the reference.
>>
>> +\subsection{Page alignment restrictions}\label{sec:Basic Facilities of
>> +a Virtio Device / Shared Memory Regions / Page alignment restrictions}
>> +
>> +If VIRTIO_F_SHM_PAGE_SIZE has been negotiated, when requesting the
>> +device to map memory into a shared memory region, the driver MUST
>> +obtain the page size information from the transport and honor the page
>> +alignment constrains derived from that page size.
>> +
> A device requirement is also needed to indicate that pci capability field is only valid after/when the feature is negotiated.

Ack.

>>  \devicenormative{\subsection}{Shared Memory Regions}{Basic Facilities of a
>> Virtio  Device / Shared Memory Regions}  Shared memory regions MUST NOT
>> expose shared memory regions which
>> --
>> 2.48.1
>>
> 1. Shared memory cap is already defined as VIRTIO_PCI_CAP_SHARED_MEMORY_CFG.
> This capability should be extended instead of polluting generic structure field of padding.
>
> If its done in generic way like proposed, you need to call out that page_size field is only valid for VIRTIO_PCI_CAP_SHARED_MEMORY_CFG.
>
> Overall extending pci cap structure is not good idea even though it may appear as small change for below reasons.
>
> 1. PCI spec already ran out of total bytes that can be stored in the capability section. Extending it will not help.
> A virtio level extended capability is not good either due to below guidance from PCI-SIG.
>
> 2. PCI spec highly discouraged putting vendor specific bits like this in the capability section.
> Citation: "It is strongly recommended that PCI Express devices place no registers in Configuration Space other than those in
> headers or Capability structures architected by applicable PCI specifications."

Honestly, making it clear that the field is only valid for
VIRTIO_PCI_CAP_SHARED_MEMORY_CFG _and_ when VIRTIO_F_SHM_PAGE_SIZE has
been negotiated (I can extend the comment of the field itself to clarify
that, otherwise, it just acts as padding), I fail to see which kind
of problems might bring, but admitedly I'm not a PCI expert by any
means.

If using the padding is really not an option, would it be reasonable to
introduce a different variant of "virtio_pci_cap64" struct, including
the page_size, to be used when VIRTIO_F_SHM_PAGE_SIZE has been
negotiated?

IIUC, "virtio_pci_cap64" is VIRTIO-specific, so this shouldn't have
impact anywhere else.

> So, you should consider discovering the shared memory page size and more such fields using device administration commands.
>
> It may sound overkill to use administration commands for 8-bits of page size,
> but as more generic and device specific things evolve, it is likely useful vehicle where you don't have to search hard to squeeze things in some existing structure like pci capability.

Do you mean using an adminitration queue (VIRTIO_F_ADMIN_VQ)? If so,
yes, I think it's extremely overkill for both the device and the driver.
If possible, I would like explore every other option before resorting to
this one.

Thanks!
Sergio.

