Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C15578F4F
	for <virtio-comment@lists.linux.dev>; Mon, 31 Mar 2025 16:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743439243; cv=none; b=mwiTbzmYlgMXdTkdjnZ1twwg7hkHqc6de9Z8WglzXq0BEq53MJ0MMVeBCoqyDbxkMW/x5Mqj72SV6eTyhUV20Cbb9Fy9Z+dacoFtVVqn8gFfE0BGuYKrdPd7rlcUMkCrGFHRd3Yj7iSZ39QHmGjT+ootzfZJ7t6uptrFEELmLXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743439243; c=relaxed/simple;
	bh=qh742di/4Z3C4zmriVYPPRSeVxV9fRSaaNee4lWX8rs=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B9Vv+ESdthV+bZORFZXehDMg3QiyOsulRk8H75x4m5XOoQmlt3inBrmyeoSCDB7nZ6UpSNQAl7/CATXQ57hlkNPY9sO9JKW/TLuIYuU6JTGpmwPRUoxEKO1b3xIABx5knJyyOzdn48LN93vHqSUUcOlUcj0q+tKJaZ6KXT5WaaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xwc/EI+W; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xwc/EI+W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743439241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Wva/83y/vmSngECSmRlJWPTnXx2wXuZ28a3/ogiDjJM=;
	b=Xwc/EI+WicBR60Pl4+85RSwP4WI6iYmiHuzvYBDxeZJV8kcJ+ywygxSCnmXsz+MhJGMig0
	R5F1yORUrrHRWpSKsExRC0u7onEh6g3LvYC0uqlUKhQVOY0hs1crYG0rrup+Yzv85Nfkio
	2qN+hJcFa/+Qbg9kXuSD2mj7t/9OGqg=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-YCfub9O7OvuShjAM4BOHJQ-1; Mon, 31 Mar 2025 12:40:39 -0400
X-MC-Unique: YCfub9O7OvuShjAM4BOHJQ-1
X-Mimecast-MFC-AGG-ID: YCfub9O7OvuShjAM4BOHJQ_1743439238
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ff8340d547so7903759a91.2
        for <virtio-comment@lists.linux.dev>; Mon, 31 Mar 2025 09:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743439238; x=1744044038;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wva/83y/vmSngECSmRlJWPTnXx2wXuZ28a3/ogiDjJM=;
        b=WBidmdiKnJ0Ub/+2LH165yRt67l5c1pXLFzd3mM10f/nNttRXAGCzD3OSAUdPjErKC
         KBdT089RjYpl2NQttctxNNq7qco2kKWmnIMxGJmUNBkwyCR8VwJyBUFLJm7tTZz9mXQk
         b7LE/4cGQ6mwRJE7u0n/v/ue0otNiLHkEX/hZGiJQWkue1feGssQGAvW2Js2hFzUAFHJ
         0jRh/P4KLYbuGRE2k0FoQTypOZSILf3naEqEs62xonlb42f1Kn3nn0JTvnA+LIFVxRip
         sYDZjzydPT/oN4MXOcwAlVpV9rhOpZUpZPQ1cvXCtzvA8GmxcLI3VF6aWPsHII6d+U5f
         DXTQ==
X-Gm-Message-State: AOJu0Yzng23P9CH5UBUhmOlWtrCZEZlCQTKinMZSiyOMXhy+ItQYg7h9
	2t/7MLzvmJuXUuHKd+g8ALCSH5n/S0ypfdbuGQdI6wQP21s0kE6v9sgCZgTRp3ERScppSumrkh4
	h64r4qZzGqZFqnOZ38YOsbUl+goTMSOECoU7+AUO6+8CaxTaJwsvRd4B8hMfLkHToRRCjKBn1BN
	F3DbWVbGbd4xGMFYm6RAmhjPkhaN4j0suzgVuq3vI=
X-Gm-Gg: ASbGnctHcuRlQBXIlUTLES0AqlGpAx3+bN07mfLgnDuY432uCUQKFMTQJGEUXBjQz58
	5KqMwR9ZUHTI+Gy4ITO2yjyDzNil7v5x+RpXc4urET9mm+MKuFoETy7vG1Y1hGKezz0qnOw==
X-Received: by 2002:a17:90b:1648:b0:301:1d03:93cd with SMTP id 98e67ed59e1d1-3053214bfcamr15179110a91.24.1743439238494;
        Mon, 31 Mar 2025 09:40:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZkv+L6UJV8SEBCMTYvtCMZhLJsyHaRJVRTBbaD+MtW60KAGbVwdlXNjdkcIKyFdqICogTafGnSyHapD0AOWA=
X-Received: by 2002:a17:90b:1648:b0:301:1d03:93cd with SMTP id
 98e67ed59e1d1-3053214bfcamr15179087a91.24.1743439238185; Mon, 31 Mar 2025
 09:40:38 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 31 Mar 2025 09:40:37 -0700
From: Sergio Lopez Pascual <slp@redhat.com>
In-Reply-To: <20250331121538-mutt-send-email-mst@kernel.org>
References: <20250331150548.50595-1-slp@redhat.com> <20250331150548.50595-2-slp@redhat.com>
 <20250331121538-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 31 Mar 2025 09:40:37 -0700
X-Gm-Features: AQ5f1Jpxp3oWk0BGcd0pny4aA9Lo9-w5IDJ9Jp5k_IDdYiEll2rIAgvWU01c4pc
Message-ID: <CAAiTLFXdYDSgZnYAgGC-FpMcyOnqBZpiTrHOk=4x_jFiRzkcbg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] shared-mem: introduce page alignment restrictions
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev, dmitry.osipenko@collabora.com, 
	parav@nvidia.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Z98D66WCirz-ny9NPRI7Zy4NKIgHB32Pgqs4Fe2WQ-g_1743439238
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Mon, Mar 31, 2025 at 11:05:46AM -0400, Sergio Lopez wrote:
>> Add a subsection for page alignment restrictions.
>>
>> Signed-off-by: Sergio Lopez <slp@redhat.com>
>> ---
>>  shared-mem.tex | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/shared-mem.tex b/shared-mem.tex
>> index 6e6f6c4..2021083 100644
>> --- a/shared-mem.tex
>> +++ b/shared-mem.tex
>> @@ -34,6 +34,12 @@ \subsection{Addressing within regions}\label{sec:Basic Facilities of a Virtio De
>>  The \field{shmid} may be explicit or may be inferred from the
>>  context of the reference.
>>
>> +\subsection{Page alignment restrictions}\label{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Page alignment restrictions}
>> +
>> +When requesting the device to map memory into a shared memory region
>> +the driver MUST obtain the page size information from the transport
>> +and honor the page alignment constrains derived from that page size.
>> +
>
> will make existing drivers autmatically incompliant with new devices.
>
> we generally avoid things like this.

This is the reason why in v1 this was gated behind
VIRTIO_F_SHM_PAGE_SIZE. But from the discussion on that thread, I
understood that, at least for the PCI transport, it was preferred to
have the page_shift field unconditionally:

https://lore.kernel.org/virtio-comment/CY8PR12MB71950314C5683EB7CFF0815BDCCA2@CY8PR12MB7195.namprd12.prod.outlook.com/

Did I misunderstand the conclusions?

Sergio.

