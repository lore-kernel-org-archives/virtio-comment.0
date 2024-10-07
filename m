Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694A01D4615
	for <virtio-comment@lists.linux.dev>; Mon,  7 Oct 2024 14:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728310973; cv=none; b=fMZUJUNXqHqp7ecg9jnVFRBzWNnTlVrmG4kkCojXLjzSS/E+I7llESd4+GyNmFYyTjc3KBT28mcpyPvRnrlH7HqdicZhAKoOtyggiCdPDTZL4GlGqXDorp+WWwNxeCyYkIouy4J6cyvde5xfhIIJ3V9FWP38+en+d4Ae8gQaCaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728310973; c=relaxed/simple;
	bh=F1lYWG0Ezu/nevgyPaxsI3MQ5lagcCPogkF+WN/ORQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=TD0dgKD4Zd9MyT1giLUgw6QFknvPL/VoSkYhSwPu/1XyY14b/33x7S45rQh71JZYvdeKTwLO1HNTrUQ0Ivkq7I68Gm0C3hJd/3Fkl2wn2QDGmY56RNnrvj0ZUqE31cAbbfXgF6s2asJcmJf5f1UWgd1jOWJjRshSIxPqc0IIHqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QHmI0IZu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QHmI0IZu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728310970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qrVb19XY5YepqIxZ/Fj0PmC5PmkCtGckEq/7yB79AkE=;
	b=QHmI0IZutShrZ3pcs2okvhdu/ye88pFdAPzILjHJjJcJbsBLlBceMt5+8+saPLLhJb8/kV
	5PKDvIPMFPtfrrHz6yoMHgoJZ6vfPazXMUWQ3lXPCJf2tuIXHHPS2EXhP81YlOF/NCbpvw
	iPh/3ESkEv0ZqCr7u6xteCOWE2+17D8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-OQvKGvs4MEelvfsPqbPSIg-1; Mon, 07 Oct 2024 10:22:48 -0400
X-MC-Unique: OQvKGvs4MEelvfsPqbPSIg-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-42caf073db8so40211595e9.3
        for <virtio-comment@lists.linux.dev>; Mon, 07 Oct 2024 07:22:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728310967; x=1728915767;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrVb19XY5YepqIxZ/Fj0PmC5PmkCtGckEq/7yB79AkE=;
        b=Hmcda2PgJz/kXzRBFF14v/RigouTKTAJ1t5GoTI/12/FGNf6s/xdqPaJSKN/oWjJJl
         FTQxVlFxcCjFaxqPTlhuFz5xsWm+u3BgRS625L7U2y/IuJiZTsylX5H+wPbwIMPO1MYk
         U7lMwWz+yKifDySQByBGbZkFDkg+PP/uMCZ9XcgIV48Bvx0xDNz6pfYQhMRdGOpOM4u7
         Tr/zzkseMFdAAFMWaGFjUNg0qomL2zMo5xMteY5F4FXQ/Fn94lhWpC2xHGwHCG9/P+SL
         lwImBaTuQ4DlqIXL6CijmK+f4uYnUblvOgayAv0G0FRZqc725UF7ksg7/3z0ryJRUmTS
         X+9Q==
X-Forwarded-Encrypted: i=1; AJvYcCV4fo111BswfU3ONv1pzfDIGnw0Kv7vnbHmgK9nluTl8fKjZJhUF4qjYwMX2+crJcrFAum3YwaMevEyC7VR9Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/I1r4HREJ2ABvOMHFp3d+73aSSfEIZMS9IPYl3yLXqH7YN4ff
	lxhLeaBjB9xP2SRrsmAb1/+qbEYYzZ3hAQaygo0klTMMruGV/Jgfipe6WGv6uWZLFpJtFo8/puZ
	V1pLEX0iO3e/gv3CCE8sSF8HXnjGwqStaFQC2ZRCB0EPYQixip7fcSDHD32ZB2jsQ
X-Received: by 2002:a05:600c:35c9:b0:42c:cd88:d0f4 with SMTP id 5b1f17b1804b1-42f85ae8efbmr95642075e9.22.1728310966980;
        Mon, 07 Oct 2024 07:22:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHR/8Je1S7s9viNK3W1oIlbMu8YzU4oFL7NqEJx6hPN5EY61Ft3dVi+/eGw28YCXN32ULjDiw==
X-Received: by 2002:a05:600c:35c9:b0:42c:cd88:d0f4 with SMTP id 5b1f17b1804b1-42f85ae8efbmr95641785e9.22.1728310966497;
        Mon, 07 Oct 2024 07:22:46 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1691a4eesm5830341f8f.31.2024.10.07.07.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 07:22:46 -0700 (PDT)
Date: Mon, 7 Oct 2024 16:22:44 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: Juraj Marcin <jmarcin@redhat.com>, virtio-comment@lists.linux.dev,
	Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH] virtio-mem: introduce VIRTIO_MEM_F_PERSISTENT_SUSPEND
Message-ID: <ZwPutFATuftmzHK6@fedora>
References: <20240809140403.484556-1-jmarcin@redhat.com>
 <11d91474-5b53-49f8-9301-a2db885948a0@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <11d91474-5b53-49f8-9301-a2db885948a0@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 07, 2024 at 10:17:23AM +0200, David Hildenbrand wrote:
> On 09.08.24 16:03, Juraj Marcin wrote:
> > Before, the behavior while suspending to a deep sleep state and waking
> > up was not specified. For example, in x86 QEMU VM all devices receive a
> > reset request during wake-up. This would lead to unplugging of all the
> > plugged memory blocks. Due to this, suspending is disallowed in the
> > Linux Kernel, when plugged memory is present and
> > VIRTIO_MEM_F_PERSISTENT_SUSPEND feature flag is not advertised by the
> > virtio-mem device.
> > 
> > This new flag should signal to the guest driver, that the device can
> > correctly suspend to a deep sleep state and then wake up without
> > disrupting the plugged memory blocks. This feature flag is already
> > supported in the Linux Kernel [1] and should be soon also supported in
> > QEMU [2].
> > 
> > [1]: https://lore.kernel.org/all/20240318120645.105664-1-david@redhat.com/
> > [2]: https://lore.kernel.org/all/20240806160756.182524-1-jmarcin@redhat.com/
> > 
> > Signed-off-by: Juraj Marcin <jmarcin@redhat.com>
> > ---
> >   device-types/mem/description.tex | 12 ++++++++++++
> >   1 file changed, 12 insertions(+)
> > 
> > diff --git a/device-types/mem/description.tex b/device-types/mem/description.tex
> > index 0a6d558..5bff24c 100644
> > --- a/device-types/mem/description.tex
> > +++ b/device-types/mem/description.tex
> > @@ -60,6 +60,8 @@ \subsection{Feature bits}\label{sec:Device Types / Memory Device / Feature bits}
> >   access unplugged memory. \footnote{On platforms with memory properties that
> >   might get modified implicitly on memory access, this feature is expected to
> >   be offered by the device.}
> > +\item[VIRTIO_MEM_F_PERSISTENT_SUSPEND (2)] The driver can allow the guest
> > +system to enter suspended state (deep sleep, suspend-to-RAM).
> >   \end{description}
> >   \subsection{Device configuration layout}\label{sec:Device Types / Memory Device / Device configuration layout}
> > @@ -174,6 +176,9 @@ \subsection{Device Initialization}\label{Device Types / Memory Device / Device I
> >   The device MUST NOT modify memory or memory properties of plugged memory
> >   blocks during device reset.
> > +The device SHOULD offer VIRTIO_MEM_F_PERSISTENT_SUSPEND if the platform
> > +supports suspending (deep sleep, suspend-to-RAM) with plugged memory blocks.
> > +
> >   \subsection{Device Operation}\label{sec:Device Types / Memory Device / Device Operation}
> >   The device notifies the driver about the amount of memory the device wants
> > @@ -268,6 +273,9 @@ \subsection{Device Operation}\label{sec:Device Types / Memory Device / Device Op
> >   memory blocks to unplug them, or it would not be able to make use of
> >   unplugged memory blocks after plugging them (e.g., alignment).
> > +If VIRTIO_MEM_F_PERSISTENT_SUSPEND has not been negotiated, the driver MUST NOT
> > +allow the guest system to enter a suspended state (deep sleep, suspend-to-RAM).

I think `guest system` could be simply `guest` but I do not have a
strong opinion about it.

> > +
> >   \devicenormative{\subsubsection}{Device Operation}{Device Types / Memory Device / Device Operation}
> >   The device MUST provide the exact same memory properties with the exact same
> > @@ -293,6 +301,10 @@ \subsection{Device Operation}\label{sec:Device Types / Memory Device / Device Op
> >   The device SHOULD unplug all memory blocks during system resets.
> > +If VIRTIO_MEM_F_PERSISTENT_SUSPEND has been negotiated, the device MUST NOT not
> > +change the state of memory blocks when suspending or when waking up from
> > +suspended state (deep sleep, suspend-to-RAM).
> > +
> >   \subsubsection{PLUG request}\label{sec:Device Types / Memory Device / Device Operation / PLUG request}
> >   Request to plug consecutive memory blocks that are currently unplugged.
> 
> The kernel and QEMU part is upstream. A second pair of eyes would be great
> :)
> 

Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>

Matias

