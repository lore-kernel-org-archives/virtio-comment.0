Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288402E336E
	for <virtio-comment@lists.linux.dev>; Wed,  2 Apr 2025 07:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743579461; cv=none; b=WFYRemzM2+pB1pyXRCxfklf3kKq2bhuSQZyNwChDWFFcuR/L7m7R9HF77vVvP9lzfjlcA+EX4H5Bz7uuKJ2f2m0hbBZX2oOuJFZ3gpuvJrfjBAJ9ewjK+DBe1GfI3wZrCOE/e3wedyxcCis6hUkz0ylUk1NL+tbH1aqJjXzV0yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743579461; c=relaxed/simple;
	bh=bFcnCeGfDX2DQTOUaEIrc+joROW0nAHPWCS7GUjolpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=YLGPJ/gkGM/WyFM2IR3ZUpFjvXD0uOHxMDNDUvVWhM2GPRkaLjWRLG/FG+S1CoV7E/8+UxABmM1lUOS/4DDJmnIkVRprl0+BmywpXnrIW/BjCtVgy9UFaeDPOZ3WhGfE0oQth9Z+ljv4FJG+hvh0a614anZB6DXghMUsqFIA0m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dQdZPx69; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dQdZPx69"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743579458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HwTYlYGUZ4tRN7L178v1kECO77wnHGX39ydHH3MB3cA=;
	b=dQdZPx69hy2jSa/97LsoT6gGvdnkcG/c3RQSuwnBBezNx1Ei65C47LyWdOfSWEfxBMgeEn
	tsoyOg1ZwVu/7/uOSqWvVPX5nmj/DUZK+uRmzxBmLTs5j3zL9Lth/oZpPcAv+3pDbLna1m
	ddcUKlM9WOw9M8AbwwLCu+a4vHaKCLU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-0Me1MD9kNEi6OAEZsu-uBw-1; Wed, 02 Apr 2025 03:37:36 -0400
X-MC-Unique: 0Me1MD9kNEi6OAEZsu-uBw-1
X-Mimecast-MFC-AGG-ID: 0Me1MD9kNEi6OAEZsu-uBw_1743579455
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43941ad86d4so32918465e9.2
        for <virtio-comment@lists.linux.dev>; Wed, 02 Apr 2025 00:37:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743579455; x=1744184255;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HwTYlYGUZ4tRN7L178v1kECO77wnHGX39ydHH3MB3cA=;
        b=Nn1GwaRl2mDwMWIviLVDFO2qJvL9seKv+0crmvDuk2nlV5vqs2ZIZcYL+FEnDQzg5M
         ebz21c0DYdjGER5H/w5UaZq3R/euzN7qZ0+TVvbTZ3YSokDQeoxWrPCXtgf5b63UAKdL
         w12zXnIEOujl2k4V6SFtt8Zv7iaNEry/69HaN98iVCYjN0YkT4ICFyNy+DNN7kSjYxwY
         xYTAksDwLzRLnJ6+z/8M9o1zzhB4mlfCu4FloL98FUOCv+QkIgBeoPilyXVNArN9AwLn
         H1oHCz8DSUnJA9aDw6aAXxoPI5xO0DQuh0YpP0wzMR++7Jh35xl0eHGcBckf63qBb9r9
         a+4w==
X-Gm-Message-State: AOJu0YyeWK0EHbNcVAywzTn5pI17SJNReWutgk7/iS1lain5WhHkXztr
	f74Fws0RxLdtAVUmda7YD4qtO3bbmX9UKC24chw91srKJs63hc365Uv+PGPULwlxpsgCP9BAtks
	cSv29G7W+FIYcB9GCY/PSscIFQk3GI6n+RcX56kN109AYAELhy4zhrbIg7N9N4tRO
X-Gm-Gg: ASbGnct8fU20blOb3HGEIZNHYOtTMeaI/wZNQjuiES/T/27iN7rV5NyLAYXBsBzV8wg
	TtIE5/wwp6GONK8oY4VHXrOfD1fG/ZEdZQyME5WVLyi3uGyVD8RzEpl70i8imWQgO12pJg9qfTc
	H4/5AhuIqi8FXSr0dYXPhqBLbWdQG+1wKmGNwncu9BBjRUwBTogjnmfF32W68w9GMha4Haqean8
	NwL5x+wHEV57yEdatsXK/0bVnjld67UxZ8Y8MfUS20RjiHrv8GdE6iZYi7zOyvV1GABQHLCya2o
	1/qlLOXSJg==
X-Received: by 2002:a05:600c:3d06:b0:43d:42b:e186 with SMTP id 5b1f17b1804b1-43eb5c18562mr12087755e9.8.1743579455390;
        Wed, 02 Apr 2025 00:37:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/Bsv+YVJmyumwsuHHg3TjbAfMQ3+nfdnfbNkFn+co5D1EHjkQaWa9bSVvFVfzeNeRctBrHQ==
X-Received: by 2002:a05:600c:3d06:b0:43d:42b:e186 with SMTP id 5b1f17b1804b1-43eb5c18562mr12087525e9.8.1743579454889;
        Wed, 02 Apr 2025 00:37:34 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ea8d1673dsm35711475e9.0.2025.04.02.00.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:37:34 -0700 (PDT)
Date: Wed, 2 Apr 2025 03:37:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Cc: virtio-comment@lists.linux.dev, dmitry.osipenko@collabora.com,
	parav@nvidia.com
Subject: Re: [PATCH v3 0/3] shared-mem: introduce page alignment restrictions
Message-ID: <20250402033354-mutt-send-email-mst@kernel.org>
References: <20250331213711.63398-1-slp@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250331213711.63398-1-slp@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vHVXbpDWQOPm9C8sWpN1Yy-vWBjTRf12fiy__2vRsp4_1743579455
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 31, 2025 at 05:37:08PM -0400, Sergio Lopez wrote:
> There's an incresing number of machines supporting multiple page sizes
> and, on these machines, the host and a guest can be running with
> different pages sizes.
> 
> In addition to this, there might be devices that have a required and/or
> preferred page size for mapping memory.
> 
> In this series we extend the "Shared Memory Regions" with a subsection
> explaining the posible existence of page alignment restrictions when
> the VIRTIO_F_SHM_PAGE_SIZE feature has been negotiated.
> 
> For the device to provide the page size information to the driver, we
> need to extend the PCI and MMIO transports. For the former, we borrow
> 8 bits from the 16 bit padding in virtio_pci_cap to hold a page_shift
> field which can be used to derive the page size by using the following
> formula: (page_size = 1 << (page_shift + 12)).
> 
> For MMIO, we add a the SHMPageShift register at offset 0x0c4, also
> holding the page_shift value. Since MMIO registers are 32 bit wide, we
> could have asked the device to directly provide page_size instead of
> page_shift, but seems reasonable to be consistent across transports.
> 
> An implementation of the changes proposed in this series has been
> published as an RFC to the LKML, to be used as a reference:
> 
> https://lore.kernel.org/all/20250214-virtio-shm-page-size-v2-0-aa1619e6908b@redhat.com/


Can you explain the use a bit more please?

- looks like this is exposed to userspace?
  but userspace can not be trusted not to violate the spec.
  how can that be sufficient to satisfy MUST requirements?

  what are these mappings and what are the alignment restrictions,
  in fact?


Looking at that patch, I begin to suspect that while the spec patch talks about
device mapping requests, it is actually the other way around:
the restriction is on guest virtual to guest physical mappings?


Does the feature affect other device types besides gpu, and how?







> v3:
>  - Reintroduce the VIRTIO_F_SHM_PAGE_SIZE feature bit, but limit its
>    scope to page alignment restrictions, still exposing page shift
>    data in the transports unconditionally (thanks Michael S. Tsirkin)
>  - Adjust the feature bits to reflect we're using another one (thanks
>    Parav Pandit).
> 
> v2:
>  - Remove the VIRTIO_F_SHM_PAGE_SIZE feature bit, exposing page_shift
>    in the transports unconditionally (thanks Parav Pandit).
>  - Didn't pick up R-b due to the significant change between revisions.
> 
> Sergio Lopez (3):
>   shared-mem: introduce page alignment restrictions
>   transport-pci: introduce page_shift field for SHM
>   transport-mmio: introduce SHMPageShift register
> 
>  content.tex        | 10 ++++++++--
>  shared-mem.tex     |  7 +++++++
>  transport-mmio.tex |  8 ++++++++
>  transport-pci.tex  | 10 +++++++++-
>  4 files changed, 32 insertions(+), 3 deletions(-)
> 
> -- 
> 2.49.0

