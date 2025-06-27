Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2D72BDC1D
	for <virtio-comment@lists.linux.dev>; Fri, 27 Jun 2025 11:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751024832; cv=none; b=gH61MnZswk9lqBnWfKpfirsXwd6xINP6kjhCY8NdTmhYkIbcLIp1e6NbsurxPqjInzUdwg+2JH9zVlmwpr8xC58+0Wr6AF0dSrBBf0XWXNzIRH3NUFe1bIJxKnrM7KmkFN6lUohFBd9lam+h2PryxABVZKq9agsVsyeSHo2+3Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751024832; c=relaxed/simple;
	bh=hDjduAJWUJk6in5peBnM6PLc8vuMRRjjVWHT0cIhPrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=gHCMKdzWKjZKDDSpR/0JIGr0ap4BZ2LIEYJchHDJdG87jl66SGKMAR00lFM2wdMykRf3ncH50czFwGYHPNZcRRuyjSzyG4RuhHqWnMRGOwxTvo+8TLwee9ghv/XcWGY3arYth2yi1tDciTRg730hI5vIgO3hf+orJLMQ+97WAZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=flVitRuU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="flVitRuU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751024829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hZDVOq+Sju4nKbsHB0ZeFVo/dyznW91GIB8wXYP6eRM=;
	b=flVitRuUmJNwS2k1Rkwwvd347WL9nC6mWdIStJBB20ZZFb0u06mTMq+3vobXAlSJ9hUXvx
	TfMEBIh6YbUMtlwB07VMzlfd93WgB18Wty1YBHHAALrVmJPKTGTpEPf8t6tbXjoIR5KGN5
	gwuqSevsyznEh71XOWB2lCDkLrXg8Ig=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-pCeepmAWO7qIp2YE1cgw-w-1; Fri, 27 Jun 2025 07:47:07 -0400
X-MC-Unique: pCeepmAWO7qIp2YE1cgw-w-1
X-Mimecast-MFC-AGG-ID: pCeepmAWO7qIp2YE1cgw-w_1751024826
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-453018b4ddeso11864175e9.3
        for <virtio-comment@lists.linux.dev>; Fri, 27 Jun 2025 04:47:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751024824; x=1751629624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZDVOq+Sju4nKbsHB0ZeFVo/dyznW91GIB8wXYP6eRM=;
        b=sy0u7dMvusXUiXFIBm7RqIvzh/42SKizp8uf3gEVDRdKDqddVv4ho9hgRcZWY8zJ5x
         eZbkHlhOmq8o5b54VzC9RRTl4KjSxzUEMkOJRpAhus4c4bqxNfdkqcG7Q+ia5xppNadt
         EOjWpGJD3b/+GM915DW+/BN5tp2Jlvt+X+vUBMfvXy8GVtPY0LPZfQBl3K+gOq5z0oI6
         RqH6V3sMcwlychPdhmaRB7Ij2zV8ykNgMP450oVmk1bdBHYFigGV64Z6kr50EO6Lu2U9
         SK+ZbMu7Nsopc01bHY3VyyG3kh0coCzhWBrk3g8Qd6u8ZiZHqaaMg79Aw966c7D9vzqy
         OPkA==
X-Forwarded-Encrypted: i=1; AJvYcCWVEYzXAZ9etMSu8vborxWBd3311WlLmw8Md3TJxIb+KW4B0UUqARHogP8dbQZ27SrPdbgc3epMVBAf4QfAlQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzTQT/ceXd188HaRoLky7bPcI9MGuwNyAqNQUn1pG+mzynl1WWm
	MPeG4qRBCWCRgEesGYEel92zona2dUNFYLyP4VGYZO1VPKauu0gEwvrF69DB8MCsZy7NwEqLFB8
	J1GcymzvC9qBnL8sBarMburZgz3yRaVvB+RagvGZocL3fBZbEpM0zRkrXGzgbsBSsT/tthvaLJ5
	ml
X-Gm-Gg: ASbGncueLGip0mPHWE8GrGx9Kof3foWn9igT1KZV5cwqZyBQYpztcG71qmwWLlhpAxs
	SpuCcPWcjFbLM0pqKUiTtQjy00AEQaeA66waWCk+eK8mlSomCW66p+E+MRPP8a9mTNdqQUJbgIa
	ivrd0KlFC0Sxb8CGT2aUtIrYdYRMNrfv2+bFp7BvqLKFQbGV1vyEJGQD19L/82pkXspLBAT+bpb
	ucKaTsBqQek0SAAVx1oiUZJf9QvkVS/pdP5nmE1rEg9jMt0Y3Q/tz2iRV+C/Pr1EMQfRN7r8NY6
	Tcwx3nULeBlfB86P
X-Received: by 2002:a05:6000:2183:b0:3a6:e2d5:f161 with SMTP id ffacd0b85a97d-3a8fda35a9dmr2269879f8f.8.1751024823882;
        Fri, 27 Jun 2025 04:47:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbO6lkXyCzNXFI1InE2O7NXhZCX23InvAHJ+jT3pT+glghD7PKMcdztIqvOfq0mv7/s6bAnw==
X-Received: by 2002:a05:6000:2183:b0:3a6:e2d5:f161 with SMTP id ffacd0b85a97d-3a8fda35a9dmr2269855f8f.8.1751024823377;
        Fri, 27 Jun 2025 04:47:03 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152e:1400:856d:9957:3ec3:1ddc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823b75cdsm76366435e9.32.2025.06.27.04.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 04:47:02 -0700 (PDT)
Date: Fri, 27 Jun 2025 07:47:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@amd.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"Ray.Huang@amd.com" <Ray.Huang@amd.com>
Subject: Re: [PATCH v3 3/3] virtio: introduce SUSPEND and RESUME feature
Message-ID: <20250627074321-mutt-send-email-mst@kernel.org>
References: <20250623083637.296041-1-lingshan.zhu@amd.com>
 <20250623083637.296041-4-lingshan.zhu@amd.com>
 <CY8PR12MB71959BD1BFE6319F6E05A7FDDC7AA@CY8PR12MB7195.namprd12.prod.outlook.com>
 <092e01c6-1756-4293-8183-8efea6720548@amd.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <092e01c6-1756-4293-8183-8efea6720548@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UHJ7IqFVdHtGQZgKZP240kwEUbKSsbJecE9bwrQOKM8_1751024826
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 26, 2025 at 09:25:42PM +0800, Zhu, Lingshan wrote:
> On 6/26/2025 7:59 PM, Parav Pandit wrote:
> 
>         From: Zhu Lingshan <lingshan.zhu@amd.com>
>         Sent: 23 June 2025 02:07 PM
> 
>         This commit allows the driver to suspend the device through a new device
>         status bit SUSPEND and resume the device running by re-setting DRIVER_OK
>         bit in device status.
> 
>         Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
>         Signed-off-by: Jason Wang <jasowang@redhat.com>
>         Fixes:
>         https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgith
>         ub.com%2Foasis-tcs%2Fvirtio-
>         spec%2Fissues%2F229&data=05%7C02%7Cparav%40nvidia.com%7C3085ab
>         378f264b5c845808ddb2313478%7C43083d15727340c1b7db39efd9ccc17
>         a%7C0%7C0%7C638862646595099882%7CUnknown%7CTWFpbGZsb3d8e
>         yJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIj
>         oiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=Pf2ub%2FwVzdmf
>         A1JjScOJ7D%2B%2BNea9XgVFYdvvDQxym40%3D&reserved=0
>         ---
>          content.tex | 59
>         +++++++++++++++++++++++++++++++++++++++++++++++++++--
>          1 file changed, 57 insertions(+), 2 deletions(-)
> 
>         diff --git a/content.tex b/content.tex
>         index 2e8da46..c987334c 100644
>         --- a/content.tex
>         +++ b/content.tex
>         @@ -42,6 +42,9 @@ \section{\field{Device Status} Field}\label{sec:Basic
>         Facilities of a Virtio Dev  \item[FEATURES_OK (8)] Indicates that the driver has
>         acknowledged all the
>            features it understands, and feature negotiation is complete.
> 
>         +\item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated, indicates that
>         +the
>         +  device has been suspended by the driver.
>         +
>          \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has experienced
>            an error from which it can't recover.
> 
>         @@ -99,10 +102,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a
>         Virtio Device / Feature B  \begin{description}
>          \item[0 to 23, and 50 to 127] Feature bits for the specific device type
> 
>         -\item[24 to 42] Feature bits reserved for extensions to the queue and
>         +\item[24 to 43] Feature bits reserved for extensions to the queue and
>            feature negotiation mechanisms, see \ref{sec:Reserved Feature Bits}
> 
> 
>     Ignoring this delta as the fix of patch-2 will change this.
> 
> 
>         -\item[43 to 49, and 128 and above] Feature bits reserved for future
>         extensions.
>         +\item[44 to 49, and 128 and above] Feature bits reserved for future
>         extensions.
>          \end{description}
> 
>          \begin{note}
>         @@ -629,6 +632,54 @@ \section{Device Cleanup}\label{sec:General
>         Initialization And Device Operation /
> 
>          Thus a driver MUST ensure a virtqueue isn't live (by device reset) before
>         removing exposed buffers.
> 
>         +\section{Device Suspend}\label{sec:General Initialization And Device
>         +Operation / Device Suspend}
>         +
>         +If VIRTIO_F_SUSPEND is negotiated, the driver is eligible to suspend the
>         device by setting the SUSPEND bit in \field{device status} to 1, and the device
>         SHOULD set the DRIVER_OK bit to 0 once it has been suspended.
>         +
> 
>     You ignored the inputs.
>     I do not agree to add the "SHOULD" normative wording in the general description area.
>     The reasoning is explained already.
>     Please adapt to the existing style of this spec to keep the normative in requirements section.
> 
>     If VIRTIO_F_SUSPEND is negotiated, the driver is eligible to suspend the
>     device by setting the SUSPEND bit in \field{device status} to 1, and the device
>     sets the DRIVER_OK bit to 0 once it has been suspended.
> 
>     Is this really that hard to write above way?
> 
> I believe you totally ignored my replies in the last thread.
> There are no rules forbid using "SHOULD" in any non-normative sections.


While true, it is confusing to the reader, and tends to make writers
sloopy about adding confirmance statements.

Our recommendation (which we do not always remembered to follow, sadly)
is to do it like this:

In the non confirmance sections, avoid these keywords, describing the
functionality in a detailed way but without putting too much
emphasis on who does what and the specific level or requirement
and without using keywords.

Additionally, repeat the requirement in a short but formal way in the
confirmance section. For details of the operation, reader has the
non-confirmance sections.



Hope that helps.



