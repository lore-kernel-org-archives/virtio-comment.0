Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2D67261C
	for <virtio-comment@lists.linux.dev>; Tue,  3 Feb 2026 19:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770148542; cv=none; b=D1Y7bMcC3Y2BUqaCVlfNKawCxAEF51QrjpQe/Hct6zOTgTtMXaHV28VbAuKWGWbKIpUskxIK9MNhOaCbWhp+qIoBCMdCzG5m545tGFF9tu7CTtJnm56r4LCeauF3JU7YG9iB69xriSpL7XTzXH4Ybjd12SBszWMLwxxAYZU7EOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770148542; c=relaxed/simple;
	bh=VdXtsPc83PvPjTaP5NU70a1eR+SuSsIc4vqk2gXCLco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=lPh7sOVUJnLhvt3VeNkXzTEonSnMMHoHNWnqOauYO6X7HnHNLLiKG6J1Hv1k/0Fwqp4tkPleBAmr+L51Ga6GuWAu/R2p3eNNXiXW5ZsPiiSDkFB+d2HBLzi4vsrNNgPQon7BrrAWisl9vXx8yDOLXg/82XNDFg6w7wu5yfpTraY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JYDNUdhq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JYDNUdhq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770148539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QWdoS3diqVqc1mIjccEayazjPapt9gPare+tax38tHM=;
	b=JYDNUdhqZmuO+xKG3j57n+iO3bpyIeTbQPApjCQgKoaycUZFJoDzg7t7M65vetc8CaRako
	KMEF4NRBYjfzyLSw/B9pHztmcrKiifhjywUjeQvy+VP5rgKnxeeA9is27oaBFc7vl+Mrh5
	E052RL5O/Liskq9zJeFiQsEwsvEzTQU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-296-2wsgtnwTOzyonq96f6zF4w-1; Tue, 03 Feb 2026 14:55:36 -0500
X-MC-Unique: 2wsgtnwTOzyonq96f6zF4w-1
X-Mimecast-MFC-AGG-ID: 2wsgtnwTOzyonq96f6zF4w_1770148535
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-430fe16b481so4086232f8f.3
        for <virtio-comment@lists.linux.dev>; Tue, 03 Feb 2026 11:55:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770148535; x=1770753335;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QWdoS3diqVqc1mIjccEayazjPapt9gPare+tax38tHM=;
        b=gphu0W+4PlPEUmpHFOFRePc96RpxrcoCivCHiRsuPZf8MDYIXFebjU74P/O/Z5qhcy
         MAUL7H3HtYw7dIANK2HawIgmWL0qggnyZkUzDYxXqy4e/5nfA2QfOwoKa+bVrLhum5xR
         5P5v0AkVsLcOVhzIdlxDL3wdmdM93qII1gJHX3dDD+n5g5bjDyA9jP1XRp0YZP22hShN
         w6sbUOEoQ737vv6jCRgsBI2HwqltP9fbqAr5uJ8npGLsfzEW5OV9Njeiuzr/kLE+BE5w
         wajB/WTCSPucsOr/V1z9MzWBqERbde6Ubq/z4rtkgBC1L4RewmkqriMOG/9+oNbsRQEO
         Vu7A==
X-Forwarded-Encrypted: i=1; AJvYcCW4k5PhVL1sKl9K0MSMx/hn3v/9hHky9QUXg0kBjFsPTsm8XGoUK92TVjBUwb4mRRCiWYNXEpNPp7pSm/4vCQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzFUMV/hIK34w6Wxe+xcFLjHB9S2qAZVIMuXVan8UDLSbicoxL0
	AKcKYJRX3m73DdiRAS4559FCxwjdBO0cETjKy2Lw8QjPdRG4bkBMM6JC2nTYY/rZ4aSRGF5+7M9
	yvwFlu6e3YlexxTVJ22YPAwR7j8uzBNKfqVpaNoj24K8r+oV2oqsrwTCo5yc52aCRDSgV
X-Gm-Gg: AZuq6aJL830/dD3wix/CQ/+UeqFZZwIsdb/B6Zh0QVhn33OKupRYvo9pHpmrcRT7xdb
	vtCgp9y9Dw+cmp667Sv50XnlctP1g53TcKC8jrrUsLVrp1/qXai1nC5qDvy3cNrZTl2ccwJQKcj
	CuHu/peHQxnUNq4LBAUHiMoZfTXlHSheFbWTskRrIOsVhCSyspJ0a+NzzePq0BjlO9aKeKNnv8p
	e9F1djhrmZM69bBVS5X9t/FViacv3+EPJvxCuBVNxJbtEhEzHf9byuhSGPPiRcI1ugVOCtMRUbS
	h7M77DGTpCnv9dm1p2l2s+yD9CWMOO+NRKncNt0M4XFZAaEonT8lkI1g3sVeFVVINyg146rKDS3
	A0ok5GFdKU2oEbgF/VQPyjnr0nu9fHoxDyA==
X-Received: by 2002:a05:6000:4283:b0:431:fc:694a with SMTP id ffacd0b85a97d-43617e397d2mr756294f8f.12.1770148534691;
        Tue, 03 Feb 2026 11:55:34 -0800 (PST)
X-Received: by 2002:a05:6000:4283:b0:431:fc:694a with SMTP id ffacd0b85a97d-43617e397d2mr756266f8f.12.1770148534168;
        Tue, 03 Feb 2026 11:55:34 -0800 (PST)
Received: from redhat.com (IGLD-80-230-34-155.inter.net.il. [80.230.34.155])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43617e40b49sm1157349f8f.19.2026.02.03.11.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 11:55:33 -0800 (PST)
Date: Tue, 3 Feb 2026 14:55:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
Cc: Bill Mills <bill.mills@linaro.org>, virtio-comment@lists.linux.dev,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Alex Bennee <alex.bennee@linaro.org>,
	Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
Message-ID: <20260203145523-mutt-send-email-mst@kernel.org>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <20260203081952-mutt-send-email-mst@kernel.org>
 <aYJQ8HK2J1nGifEy@zapote>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <aYJQ8HK2J1nGifEy@zapote>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lg6tPkA9il14i7z1ufVpJR6uvMzcWi0Ef1zRiWCt2nQ_1770148535
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 03, 2026 at 08:48:00PM +0100, Edgar E. Iglesias wrote:
> On Tue, Feb 03, 2026 at 08:21:01AM -0500, Michael S. Tsirkin wrote:
> > On Mon, Jan 26, 2026 at 11:32:26AM -0500, Bill Mills wrote:
> > > This series adds the virtio-msg transport layer.
> > > 
> > > The individuals and organizations involved in this effort have had difficulty in
> > > using the existing virtio-transports in various situations and desire to add one
> > > more transport that performs its transport layer operations by sending and
> > > receiving messages.
> > 
> > Is it arm and linaro, or more?
> > If more, could we get some acks on list from the people involved?
> > 
> >
> 
> AMD is also involved, I've acked patches 1, 3, and 4 (patch 2 has my Signed-off-by).
> 
> Cheers,
> Edgar
> 

Thank you

> 
> > > Implementations of virtio-msg will normally be done in multiple layers:
> > > * common / device level
> > > * bus level
> > > 
> > > The common / device level defines the messages exchanged between the driver
> > > and a device. This common part should lead to a common driver holding most
> > > of the virtio specifics and can be shared by all virtio-msg bus implementations.
> > > The kernel implementation in [3] shows this separation. As with other transport
> > > layers, virtio-msg should not require modifications to existing virtio device
> > > implementations (virtio-net, virtio-blk etc). The common / device level is the
> > > main focus of this version of the patch series.
> > > 
> > > The virtio-msg bus level implements the normal things a bus defines
> > > (enumeration, dma operations, etc) but also implements the message send and
> > > receive operations. A number of bus implementations are envisioned,
> > > some of which will be reusable and general purpose. Other bus implementations
> > > might be unique to a given situation, for example only used by a PCIe card
> > > and its driver.
> > > 
> > > The standard bus messages are an effort to avoid different bus implementations
> > > doing the same thing in different ways for no good reason. However the
> > > different environments will require different things. Instead of trying to
> > > anticipate all needs and provide something very abstract, we think
> > > implementation specific messages will be needed at the bus level. Over time,
> > > if we see similar messages across multiple bus implementations, we will move to
> > > standardize a bus level message for that.
> > > 
> > > We are working on a few reusable bus implementations:
> > > 
> > > * virtio-msg-ffa based on Arm FF-A interface for use between:
> > >   * normal world and secure world
> > >   * host and VM or VM to VM
> > >   * Can be used w/ or with out a hypervisor
> > >   * Any Hypervisor that implements FF-A can be used
> > >   * We have this working with pKVM and Xen
> > >   * We have this working with Trusty and OP-TEE
> > > 
> > > * virtio-msg-amp for use between heterogenous systems
> > >   * The main processors and its co-processors on an AMP SOC
> > >   * Two or more systems connected via PCIe
> > >   * Minimal requirements: bi-directional interrupts and
> > >     at least one shared memory area
> > >   * hvac-demo has 2 demos of this
> > >   * This is working on two hardware platforms
> > > 
> > > * virtio-msg-loopback for userspace implemented devices
> > >   * Allows user space to provide devices to its own kernel
> > >   * This is similar to fuse, cuse or loopback block devices but for virtio
> > >   * hvac-demo has a demo
> > > 
> > > We also anticipate a few more:
> > > 
> > > * virtio-msg-xen specific to Xen
> > >   * Usable on any Xen system (including x86 where FF-A does not exist)
> > >   * Using Xen events and page grants
> > > 
> > > * virtio-msg over admin virtqueues
> > >   * This allows any virtio-pci device that supports admin virtqueues to also
> > >     support a virtio-msg bus that supports sub devices
> > >   * [We are looking for collaborators for this work]
> > > 
> > > Changes since RFC2:
> > > 
> > > Spec Functional:
> > > * Made the common message header 8 bytes and added a token for optional use
> > >   when parallel outstanding requests are possible
> > > * Made the 8 byte fields align to 8 byte offsets.
> > >   This effects the {SET,GET}_VQUEUE messages
> > > * Many conformance cases have been tightened.
> > > 
> > > Spec Editorial:
> > > * Major restructure to better align with virtio spec
> > >   * Conformance model now matches other transports
> > >   * Use C structures to define messages instead of tables
> > > * Added a section to describe how responses are matched to requests
> > >   This includes the use of the new token field
> > > * Redefined / better described error handling between transport and bus
> > >   layers to eliminate the need for the bus to generate fake response messages
> > > * Included editorial feedback from RFC2
> > > 
> > > Eco-system:
> > > * Added virtio-msg-loopback demo
> > > * Arm has published the first draft of the virtio-msg over FFA spec [6]
> > > * virtio-msg over FFA has been demonstrated with both Trusty and OP-TEE
> > >   secure world
> > > * LKML RFC has been sent [7]
> > > * QEMU RFC has been sent [8]
> > > 
> > > This is the first non-RFC patch series. The known short comings have been
> > > addressed. We ask for review in earnest on this series and thank you for
> > > any feedback you can provide.
> > > 
> > > Background info and work in progress implementations:
> > > * HVAC project page with intro slides [1]
> > > * HVAC demo repo w/ instructions in README.md [2]
> > > * Kernel w/ virtio-msg common level and ffa support [3]
> > > * QEMU w/ support for one form of virtio-msg-amp [4]
> > > * Portable RTOS library w/ one form of virtio-msg-amp [5]
> > > 
> > > In addition to the QEMU system based demos in the hvac-demo repo, we also have
> > > two hardware systems running:
> > > * AMD x86 + AMD Arm Versal connected via PCIe
> > > * ST STM32MP157 A7 Linux using virtio-i2c provided by M4 Zephyr
> > > 
> > > Please note that although the demos work, a few have not been aligned
> > > with this version of the spec.
> > > 
> > > [1] https://linaro.atlassian.net/wiki/spaces/HVAC/overview
> > > [2] https://github.com/wmamills/hvac-demo
> > > [3] https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git/log/?h=virtio/msg
> > > [4] https://github.com/edgarigl/qemu/commits/edgar/virtio-msg-rfc/
> > > [5] https://github.com/arnopo/open-amp/commits/virtio-msg/
> > > [6] https://documentation-service.arm.com/static/68f647791134f773ab3f0a7c
> > > [7] https://lore.kernel.org/all/cover.1753865268.git.viresh.kumar@linaro.org/
> > > [8] https://mail.gnu.org/archive/html/qemu-devel/2025-10/msg07438.html
> > > 
> > > Bertrand Marquis (2):
> > >   virtio-msg: add new command for bus normative
> > >   virtio-msg: add conformance entries in conformance chapter
> > > 
> > > Bill Mills (2):
> > >   virtio-msg: Add virtio-msg, a message based virtio transport layer
> > >   virtio-msg: link virtio-msg content
> > > 
> > >  commands.tex      |    3 +-
> > >  conformance.tex   |  105 ++-
> > >  content.tex       |    1 +
> > >  transport-msg.tex | 1640 +++++++++++++++++++++++++++++++++++++++++++++
> > >  4 files changed, 1746 insertions(+), 3 deletions(-)
> > >  create mode 100644 transport-msg.tex
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 

