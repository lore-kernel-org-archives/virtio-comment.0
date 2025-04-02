Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B4E1853
	for <virtio-comment@lists.linux.dev>; Wed,  2 Apr 2025 07:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743579175; cv=none; b=DjpzGOLNmrxTKQldX0Zh+GaC6AubNlwTebDpqXIydE9LYiREfVavzqQolQ6ZII/yX7IdBGzOgJWlKxWf3ep+ITwNLwnje3n18FmwcFaLTBTDOudAk8R8XfdPwKo3KZQMjW9FgrpgupYDtanqPEUxp8nkL/AbMPKfbs+hGNNHy8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743579175; c=relaxed/simple;
	bh=DitRX6vtcpILM7LwoKR2Twg1EwF1PWd65cbu5/HGs6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=mK/16m0DC2HILZbZFEzKGzCqxb+m3me8q7KGIms860jrmoLBu4JPtOMoOX/l2LO+uiA4/bAy7zlmzxeW1beL9OzeAflLJd/pkURD61mjT/6L2uuSK0BjxIKKVSryRWYKN5qxr5mBqxJu5g8LlAev3EpNSLyxEdYUho2eLX9M1Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Kmr/KNoM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Kmr/KNoM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743579171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iZznx/aXBelvcdsFIi20WziZXc9ykl+Z9v5n+3LZmv8=;
	b=Kmr/KNoMTCpb5Gw78os5pLsyy2oW4lBs0F9MpXs5WittSCNxv0+Mdq/lCPVxO6sdOsy3KH
	MMMtJhxNSA3WjP6K1uVUmorPg74mI4MFfJa3JbkjzzY3P48nl6N81CK5VpGKme6r5+i6Mi
	hnfNMcC7AWxGJayI5HFTI0VLMmaq6+o=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-mjgmDQ8_Og6OES9FtMGaIw-1; Wed, 02 Apr 2025 03:32:50 -0400
X-MC-Unique: mjgmDQ8_Og6OES9FtMGaIw-1
X-Mimecast-MFC-AGG-ID: mjgmDQ8_Og6OES9FtMGaIw_1743579169
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3978ef9a284so2990261f8f.3
        for <virtio-comment@lists.linux.dev>; Wed, 02 Apr 2025 00:32:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743579169; x=1744183969;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iZznx/aXBelvcdsFIi20WziZXc9ykl+Z9v5n+3LZmv8=;
        b=L535NcPSypmI4KkhJCRWgdtIun0mWtE0vbWzJowq1LFwDMoX3/3liDEFktx/t5ewdz
         xP4Z1cq/bOXREimEIuLG4wn08sVuyTWHtPGF66HXAZYrpWwSa/IAABOEHOa8i+12XHN2
         I2bxaYAHKhc3Qc7kjEDwCqE6wxJfWwSjBwIzRG9imKbX0fi2qKJg17tllpT4v56QWKl4
         QIzn9PqqOCei0w/NT91Eud27PbjrwAJQizVWuFBudTxp9v3RqTRd4497us5myyRm/Ul8
         zDo0ENX8SuseDnbyNNuWjB/9QQ0D3z00CgpFUTKSjnDCmdDlDGy0XA0LPxjOKktxnlmr
         r28g==
X-Gm-Message-State: AOJu0YyHWpKo/kD4NiYxlzoh6QMNXb8tSePA4tQQU7e3bH7bIhJpxGBV
	Rs793Oju3yVyUc+LGBnlfXhI1KZRmh+ARJF/Doffk9NiytXvkgkhIc6aX+LuFib5vH0IW+Alfc+
	nPqxp1KuGY/2v3hIynjc8LOlejpNzQpdyrcvK87o3cgBdsjy778+dj2OZwOWa/rEF
X-Gm-Gg: ASbGncufvJx0FoJb3tsSv9pKt+mydx8ZWuvLu+RfHSjo/6U5nsoef9JnbjgqA25fQRz
	ys00/Sxeby9Q4gONEUqklCqYSku/rGEIziUNl3N6U9D55rf7ADgaJzNLGSqeVi6Kz0C2MDgojQD
	MbJ8cLZhvqVcqYxSR9ghqDXoxlTy70viTUq69VczRA/h4V9dlAgB2rwmkzSYXka/6XALhTSt89X
	5kq9Yh2vczNkoi3njCLe/3I08cRc++FFElnhcVU2ww4avT026mie3lASeFOn92Vr9rF99B98wFV
	T9q7iwaXjA==
X-Received: by 2002:a05:6000:402a:b0:390:f9d0:5e4 with SMTP id ffacd0b85a97d-39c120de3f8mr11187993f8f.21.1743579169334;
        Wed, 02 Apr 2025 00:32:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyJRdj6HrkxKrh7nTgaokanIbSoCegS5ImrscWFCc/Nfp193pGLecQW+xvo9hLoULjWsO9Bg==
X-Received: by 2002:a05:6000:402a:b0:390:f9d0:5e4 with SMTP id ffacd0b85a97d-39c120de3f8mr11187973f8f.21.1743579169024;
        Wed, 02 Apr 2025 00:32:49 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb60ec915sm11787595e9.28.2025.04.02.00.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:32:48 -0700 (PDT)
Date: Wed, 2 Apr 2025 03:32:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Cc: virtio-comment@lists.linux.dev, dmitry.osipenko@collabora.com,
	parav@nvidia.com
Subject: Re: [PATCH v3 1/3] shared-mem: introduce page alignment restrictions
Message-ID: <20250402030335-mutt-send-email-mst@kernel.org>
References: <20250331213711.63398-1-slp@redhat.com>
 <20250331213711.63398-2-slp@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250331213711.63398-2-slp@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Q0m3SDd6369cw8MD7dZyfGgqIxT7unhHKnvFcq6cBso_1743579169
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 31, 2025 at 05:37:09PM -0400, Sergio Lopez wrote:
> Add a subsection for page alignment restrictions and introduce the
> VIRTIO_F_SHM_PAGE_SIZE feature bit.
> 
> Signed-off-by: Sergio Lopez <slp@redhat.com>
> ---
>  content.tex    | 10 ++++++++--
>  shared-mem.tex |  7 +++++++
>  2 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/content.tex b/content.tex
> index c17ffa6..c8826a2 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -99,10 +99,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
>  \begin{description}
>  \item[0 to 23, and 50 to 127] Feature bits for the specific device type
>  
> -\item[24 to 41] Feature bits reserved for extensions to the queue and
> +\item[24 to 42] Feature bits reserved for extensions to the queue and
>    feature negotiation mechanisms, see \ref{sec:Reserved Feature Bits}
>  
> -\item[42 to 49, and 128 and above] Feature bits reserved for future extensions.
> +\item[43 to 49, and 128 and above] Feature bits reserved for future extensions.
>  \end{description}
>  
>  \begin{note}
> @@ -872,6 +872,12 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>  	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits} for
>  	handling features reserved for future use.
>  
> +  \item[VIRTIO_F_SHM_PAGE_SIZE(42)] This feature indicates that the device
> +  transport provides information about the supported page size and expects the
> +  driver to honor the alignment restrictions derived from it when requesting
> +  mappings on the corresponding shared memory region.
> +  See also \ref {sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Page alignment restrictions}.
> +
>  \end{description}
>  
>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
> diff --git a/shared-mem.tex b/shared-mem.tex
> index 6e6f6c4..dd90cb7 100644
> --- a/shared-mem.tex
> +++ b/shared-mem.tex
> @@ -34,6 +34,13 @@ \subsection{Addressing within regions}\label{sec:Basic Facilities of a Virtio De
>  The \field{shmid} may be explicit or may be inferred from the
>  context of the reference.
>  
> +\subsection{Page alignment restrictions}\label{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Page alignment restrictions}
> +
> +If VIRTIO_F_SHM_PAGE_SIZE has been negotiated, when requesting
> +the device to map memory into a shared memory region, the driver

the shared memory region - it is this specific one.

> +MUST obtain the page size information from the transport

avoid MUST. Also not "from the transport". In a transport-specific way.

> and honor
> +the page alignment constrains derived from that page size.

Also explain here it is only supported for pci for now, to make
sure people do not go looking for it on other transports.

> +
>  \devicenormative{\subsection}{Shared Memory Regions}{Basic Facilities of a Virtio
>  Device / Shared Memory Regions}
>  Shared memory regions MUST NOT expose shared memory regions which



I have a problem with this wording in that "map" and "request mapping"
is actually a device type specific thing. Someone reading this
paragraph will not know what this term means. Note also that the
term "map" has two meanings, e.g. device-types/fs/description.tex
says 
	In cases where data transfer is
	undesirable, the device can map file contents into the DAX window shared memory
	region. 
but also
	Drivers map this shared
	memory region with writeback caching as if it were regular RAM. 

I am guessing the "request mapping" refers to the 1st but not the 2nd
type of map, but neither mentions "request mapping".

My suggestions, but really just suggestions:

- update device specific text to mention alignment where appropriate,
  using MUST there.

- Remove the MUST here, it is not good to have MUST outside non
conformance sections anyway.

- Avoid saying map since that is not
a generic term.
Just say generally
"information about the supported page size" and put all
the detail in device specific sections.
Also "device expects" is really a weird way to put things.
device does abc. driver does abc. that is all.

E.g. 
	When VIRTIO_F_SHM_PAGE_SIZE is negotiated, driver aligns
	device requests
	using shared memory regions on the supported page size of each
	memory region, in a device-specific way. The supported
	page size is retrieved in a transport-specific way. This feature
	is only supported for the PCI transport (see ref to the relevant section).


And add device specific text where it applies.


> -- 
> 2.49.0

