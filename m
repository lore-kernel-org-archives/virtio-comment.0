Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC08C21578F
	for <virtio-comment@lists.linux.dev>; Thu, 27 Feb 2025 08:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740645191; cv=none; b=Ih0rjBqIOM1RKe4oSkhJHALMjf1oGXEyjJd1PGNTitzHE6w6ZVwBOLXOERIzQGNVwPe9tbpcDJ9ScYTEdHzAxuXH8ktW/k8XbBAen5wJJO/KOHRoS1j0z9hssE0gEcZeUHeSEXTZOG9poxx1B/1WOMCosS7jXr9pSyinmc8k1tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740645191; c=relaxed/simple;
	bh=qK+vlGwC4VlsG2qkBTIMBdPi+lWCdyrWOPa+Tcr8Jeo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J8QTS6C720NpAUfZlSUfw+a12qe50H1PRGKUnouVObNv9DPTbrLrtpGSakIPaEFFYBxqJ+I4IOfFpe4KMBeuhyBtCJkk+uSilfPjGHyH+Dk8HTGUny0jP9qrZ0TbqU1TViDGV2OzljBxMSq7CIyr2lsP4n2dlEEt1D1oQsQpXFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U4OEJj2V; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U4OEJj2V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740645187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1wXw04/aCmmvsyMxMWq/TX7RwwmWHDWjttvIATusv2Y=;
	b=U4OEJj2V0St30ZuRzvZXWlyCvjduMN+EsxkaF8GLN4otffxSDSVegExB0Toy5TUGle1jMx
	raZ7KwawivXp1YrY0bUwBBeM2r1hI7Boow6W5SGj2nGO15PVO+0WkR62+0UtLPy8qmofO2
	qYy8qGGgosKbMm5wvonnnYuQNdBosiU=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-05nu4-7jMOqz2Ytxwg4Ohg-1; Thu, 27 Feb 2025 03:33:06 -0500
X-MC-Unique: 05nu4-7jMOqz2Ytxwg4Ohg-1
X-Mimecast-MFC-AGG-ID: 05nu4-7jMOqz2Ytxwg4Ohg_1740645185
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2fe916ba298so1684418a91.1
        for <virtio-comment@lists.linux.dev>; Thu, 27 Feb 2025 00:33:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740645185; x=1741249985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1wXw04/aCmmvsyMxMWq/TX7RwwmWHDWjttvIATusv2Y=;
        b=A1jKBAOjCB6TAoiQlFTa4NBgVHyYUL7Kme/v9Ukzd3n9TgXDYOPSvIcsE7nCLE/EkX
         3ORN9n1znbpyWMOc8v4//36fWZTTz3TBw3u2QOsZiG7lJFaJaPV0YtLhnBOYFjuRt8Xs
         GZF6JB2+LcFkWQKdX0cz9l2wPULlqXtGi/T65fIC2WpEJxEuCSmCxekD4DQ9sarV9oJO
         yEOUdL6ZLViVxH7zsmZhbMWpOxEQFcBI6V/Pniy8c9UKhdqlmgbxLbqFSU3qpK7zAexn
         MuY/MiJQVLPYb1Yj17Xl+RMAdYRCKiisvaELjSlLDfz139DaUdWNvrNuRkFb/PeaAHEk
         RTaA==
X-Forwarded-Encrypted: i=1; AJvYcCVvvglkzZFgid/8+zJ/2rwwhtMsZ/L2S4KPcMkS4qnxHUWd9Tkv3jB4hJZj4VJD/YJDiRq/vIHLEWlftbKnmA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxvjGeytzhqEDovsxqzG3aiQnryP0LH6sgwe80FYz0/x4wvaitJ
	+sh7rU/A35/PauZBp5rWCb8FQxGnqBsuhiFS4D8gwTy1wwYA+2/WVHF8KpVuFJ8OW33Bl0ZtEWx
	I23Uc1ToC3bgrJZlD4mhgvVUPk2bzRqao39KroBnG9IhAUhDdkvOtF+V2xQ32lgbOczT4EszrtZ
	qlQlW7POHcK4jl5URKilg/3ikEM7GOkkg1y9qJfyk=
X-Gm-Gg: ASbGncsG6IcvFVZ5y8Z0ONkQtjYN5lB72TlLRztqPoQV+jSHwWPTfBVJ2dM1cjiEU6d
	J5UytCM+YDcJi/NygQ+oYuSg9qOO7vMdNk+7Kmqgonqj+p0ei2yUEahXiWAMx5XW57AhXRVKQ
X-Received: by 2002:a17:90b:1811:b0:2ee:aed2:c15c with SMTP id 98e67ed59e1d1-2fce873aeffmr38033660a91.28.1740645185411;
        Thu, 27 Feb 2025 00:33:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFEHOfa/3PpP17cDJ3EgCnGKGP6lOJimNpMNmxoKEgGt3J6RDvPPOv/nzpaWd8NwLYL9V44corYJ8b5VF5c/II=
X-Received: by 2002:a17:90b:1811:b0:2ee:aed2:c15c with SMTP id
 98e67ed59e1d1-2fce873aeffmr38033632a91.28.1740645185040; Thu, 27 Feb 2025
 00:33:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250225134801.3546224-1-bill.mills@linaro.org> <20250227025757-mutt-send-email-mst@kernel.org>
In-Reply-To: <20250227025757-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 27 Feb 2025 16:32:53 +0800
X-Gm-Features: AQ5f1Jp9MAnbDTDeYQEjQ_wbjal4sLhDnNqV7VLslHvzlkweuFNhyL4b2x4eMN0
Message-ID: <CACGkMEsmvBkfPffDGxpnArOuz_JqYfwZ-uA-H=hWKr5QyjjSwA@mail.gmail.com>
Subject: Re: [PATCH RFC v1 0/1] virtio-msg transport layer
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Bill Mills <bill.mills@linaro.org>, virtio-comment@lists.linux.dev, 
	Bertrand Marquis <bertrand.marquis@arm.com>, "Edgar E . Iglesias" <edgar.iglesias@amd.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Alex Bennee <alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Eruke48uHoKoEb0KDMPmIgYjUGs2a6bvhTOFf7XsAOg_1740645185
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 4:09=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Tue, Feb 25, 2025 at 08:48:00AM -0500, Bill Mills wrote:
> > This series adds the virtio-msg transport layer.
> >
> > The individuals and organizations involved in this effort have had diff=
iculty in
> > using the existing virtio-transports in various situations and desire t=
o add one
> > more transport that performs its transport layer operations by sending =
and
> > receiving messages.
> >
> > Implementations of virtio-msg will normally be done in multiple layers:
> > * common / device level
> > * bus level
> >
> > The common / device level defines the messages exchanged between the dr=
iver
> > and a device. This common part should lead to a common driver holding m=
ost
> > of the virtio specifics and can be shared by all virtio-msg bus impleme=
ntations.
> > The kernel implementation in [3] shows this separation. As with other t=
ransport
> > layers, virtio-msg should not require modifications to existing virtio =
device
> > implementations (virtio-net, virtio-blk etc). The common / device level=
 is the
> > main focus of this version of the patch series.
> >
> > The virtio-msg bus level implements the normal things a bus defines
> > (enumeration, dma operations, etc) but also implements the message send=
 and
> > receive operations. A number of bus implementations are envisioned,
> > some of which will be reusable and general purpose. Other bus implement=
ations
> > might be unique to a given situation, for example only used by a PCIe c=
ard
> > and its driver.
> >
> > How much of the bus level should be described in the virtio spec is one=
 item
> > we wish to discuss. This draft takes a middle approach by describing th=
e bus
> > level and defining some standard bus level messages that MAY be used by=
 the bus.
> > It also describes a range of bus messages that are implementation depen=
dent.
> >
> > The standard bus messages are an effort to avoid different bus implemen=
tations
> > doing the same thing in different ways for no good reason. However the
> > different environments will require different things. Instead of trying=
 to
> > anticipate all needs and provide something very abstract, we think
> > implementation specific messages will be needed at the bus level. Over =
time,
> > if we see similar messages across multiple bus implementations, we will=
 move to
> > standardize a bus level message for that.
> >
> > We are working on two reusable bus implementations:
> >
> > * virtio-msg-ffa based on Arm FF-A interface for use between:
> >   * normal world and secure world
> >   * host and VM or VM to VM
> >   * Can be used w/ or with out a hypervisor
> >   * Any Hypervisor that implements FF-A can be used
> >
> > * virtio-msg-amp for use between heterogenous systems
> >   * The main processors and its co-processors on an AMP SOC
> >   * Two or more systems connected via PCIe
> >   * Minimal requirements: bi-directional interrupts and
> >     at least one shared memory area
> >
> > We also anticipate a third:
> >
> > * virtio-msg-xen specific to Xen
> >   * Usable on any Xen system (including x86 where FF-A does not exist)
> >   * Using Xen events and page grants
>
> I am also interested in virtio-msg-admin-cmd, sending messages to VFs
> over the admin commands of the PF.

One more thing, there used to be a similar proposal which is the
transport virtqueue which also defines the message. And it has the
chance to be unified with the admin command. Need to think about the
(dis)advantages of each proposal.

What's more, if the actual method to send and receive the message, can
we still call this a transport or not?

Thanks

>
> Thank you, will review.
>
> > This series is a work in progress and we acknowledge at least the follo=
wing
> > issues we need to work on:
> >
> > * Conform to virtio spec nouns (device/driver vs frontend/backend)
> >   and verbs (must/may)
> > * Perhaps move error definition elsewhere it the spec and align on its =
symbols
> >   and numeric values
> > * Allow message size to be greater than 40 bytes and allow bus implemen=
tations
> >   to define their max message size
> > * Add a way to discover the protocol version
> > * Add a better description of the types of things a bus can do, specifi=
cally
> >   including out-of-band notification and memory area sharing/discovery
> > * Maybe redo configuration generation handling
> >
> > Background info and work in progress implementations:
> > * HVAC project page with intro slides [1]
> > * HVAC demo repo w/ instructions in README.md [2]
> > * Kernel w/ virtio-msg common level and ffa support [3]
> > * QEMU w/ support for one form of virtio-msg-amp [4]
> > * Portable RTOS library w/ one form of virtio-msg-amp [5]
> >
> > In addition to the QEMU system based demos in the hvac-demo repo, we al=
so have
> > two hardware systems running:
> > * AMD x86 + AMD Arm Versal connected via PCIe
> > * ST STM32MP157 A7 Linux using virtio-i2c provided by M4 Zephyr
> >
> > Please note that although the demos work, they are not yet aligned with=
 each
> > other nor this version of the spec.
> >
> > [1] https://linaro.atlassian.net/wiki/spaces/HVAC/overview
> > [2] https://github.com/wmamills/hvac-demo
> > [3] https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git/l=
og/?h=3Dvirtio/msg
> > [4] https://github.com/edgarigl/qemu/commits/edgar/virtio-msg-new
> > [5] https://github.com/arnopo/open-amp/commits/virtio-msg/
> >
> > Bill Mills (1):
> >   virtio-msg: Add virtio-msg, a message based virtio transport layer
> >
> >  content.tex       |   1 +
> >  transport-msg.tex | 680 ++++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 681 insertions(+)
> >  create mode 100644 transport-msg.tex
> >
> > --
> > 2.34.1
> >
>
>

