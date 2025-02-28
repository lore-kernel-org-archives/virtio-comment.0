Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4570524886A
	for <virtio-comment@lists.linux.dev>; Fri, 28 Feb 2025 08:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740731098; cv=none; b=UnqYCPqYecFJsQQZF6Cnylu+JGRdbcHGRH2QVqdW9YRQaDTKgM/7T+piMvjnzfcVIjiOGVODI4/vI/ZAoNMt4Pw399GKns6MMMUOCnx93f7HyUTSWh+v+e11CYt0BJtZIr4j3bl308Pk2iTIGxJg4kSyQgTHoCbxbZub5O/tndA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740731098; c=relaxed/simple;
	bh=kIaiP5/WzmgRryE1f3mamV/tT+YK90DzXVO2RlSEyCw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gzzCm6Exji+ST25pxlrHuLhjTA7Q73n/AxR2OnZjQhYIt1rR7dAyqMRPPKl8k4QsFbCaoJ/7/q18oVkqJL2kX6FXLruxC5TuNK50VSOSntuVAA2UfRwPrNLbvlvlZjRRlA1R2derSdDTYsO15SvL3j515eU6f8x12W/vO4wrmbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IeU1RjyX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IeU1RjyX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740731094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hgO0kA4k+Ngl3ZGtDsG/FiiNFVXnQYuBt698TM58ynU=;
	b=IeU1RjyXUnMm1cyy9hiDgYd8Yg2oemHMDUOvxHWXRvK31UG8lH+4TeKfxIpbwtbHeUa9lD
	M8hbS2ky85lUYTYXDRiJ8LK59Cpb9FP7Gz/4xTqaWBGkJBgs7tFCzQVt0yXzFW3KSQOwTr
	QvLZmjnAsP86jfd+rQYt/01ogDJP5jI=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-438--XAQxiZJPU2o-isV3bMPSg-1; Fri, 28 Feb 2025 03:24:51 -0500
X-MC-Unique: -XAQxiZJPU2o-isV3bMPSg-1
X-Mimecast-MFC-AGG-ID: -XAQxiZJPU2o-isV3bMPSg_1740731089
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2fc1eadf5a8so4113034a91.3
        for <virtio-comment@lists.linux.dev>; Fri, 28 Feb 2025 00:24:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740731089; x=1741335889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hgO0kA4k+Ngl3ZGtDsG/FiiNFVXnQYuBt698TM58ynU=;
        b=YWl51ATTnvKjJHkcWOr2BkMc7Y6JahjtKR1B+B6E8YhmOZM3Agh0A6fV4jtGqR98Xc
         B/0ibpAQqTHjEDFMpA4KHhyNhGAsCo1JAop8kpWTPrnl758SrVibjlCtfOKd0M1QjgCd
         YjWExY7S0LanCgnbfHBdXwUest3nrvhp3OoWLB9sdmMIFo/XrIOtv7O6PRTVDWJhFLDt
         qk75NwnBQWaXGEMu2ynnKWJ0JdxN6EkPtti94JpJAOc/ZO/3JDGtyFEXsRNNfRR9ZRNU
         vrxN+hZ3JzKCb3ccc+M8NHBtdrC7aVE+BG+C/PpNaAoVff+2E5yk1jLUHBQ1HdpNqogm
         TW/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUZYHBHHBCU6rB93qAfwfSQ2eNYVR1uq4aSWhbmdkUx1xn6/JkJhi0GuV6MgjO8je/a08Eg12j+ku/zP8w5Sw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1xLUyjPWeHc+ILf01BdedvBQtKtBS5956n+HeeMBV+UlLgBJx
	DnikSc/w8+dFV+xnh5GA5x9CaPGIXBWBT2APtc81hg2OidutaO5oRhAJAfUegXvMRchNBJDrRXU
	WHun3NUPaDsaFo0RkCa7ik1PhUfH6p/II816RzVFX7blGsouQU2StEDZxIXQUxB6ann/13CWayX
	VKi+xyvHdjSvzHs85sFhSP2uBXckRgoQ/f+a9bx2o=
X-Gm-Gg: ASbGncvWlYH7NK8H4eUS77fozESkByT2Xgv61F3Gx6QAdHLtKw3QLuCTef+R+mFBPtD
	MNx45zVp0CA2y8HvM976xs6XvkA+6Jl3jfr065hffK1jbDQ0aaZc5gk68CL8fWSsBEXRG/GO/4g
	==
X-Received: by 2002:a17:90b:37cb:b0:2ee:7c65:ae8e with SMTP id 98e67ed59e1d1-2febab61ec9mr4325608a91.11.1740731089248;
        Fri, 28 Feb 2025 00:24:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAlCu7NXGFc5y02qFPZwL8T4LwSA67l1igV/I1f3Z/KoBrLVvPywoZOpEF8EO73mQrcxYTkfB/zAbLF8sttT4=
X-Received: by 2002:a17:90b:37cb:b0:2ee:7c65:ae8e with SMTP id
 98e67ed59e1d1-2febab61ec9mr4325581a91.11.1740731088845; Fri, 28 Feb 2025
 00:24:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250225134801.3546224-1-bill.mills@linaro.org>
 <20250227025757-mutt-send-email-mst@kernel.org> <CACGkMEsmvBkfPffDGxpnArOuz_JqYfwZ-uA-H=hWKr5QyjjSwA@mail.gmail.com>
 <20250227035442-mutt-send-email-mst@kernel.org>
In-Reply-To: <20250227035442-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 28 Feb 2025 16:24:37 +0800
X-Gm-Features: AQ5f1JpicvOk6bXZvQaBvk4RHu0YKbEz9UMAf1BXPiRoD90KLhg4dN2s31IqOX4
Message-ID: <CACGkMEu=362MfQP=sO4KOYKDNs+jADF_ZJh-dXFK56yMJzzf4Q@mail.gmail.com>
Subject: Re: [PATCH RFC v1 0/1] virtio-msg transport layer
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Bill Mills <bill.mills@linaro.org>, virtio-comment@lists.linux.dev, 
	Bertrand Marquis <bertrand.marquis@arm.com>, "Edgar E . Iglesias" <edgar.iglesias@amd.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Alex Bennee <alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WJUM58Q8qzjkbLVC7JRST5dxKpV5RZK6oomdQeTgJCo_1740731089
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 4:55=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Thu, Feb 27, 2025 at 04:32:53PM +0800, Jason Wang wrote:
> > On Thu, Feb 27, 2025 at 4:09=E2=80=AFPM Michael S. Tsirkin <mst@redhat.=
com> wrote:
> > >
> > > On Tue, Feb 25, 2025 at 08:48:00AM -0500, Bill Mills wrote:
> > > > This series adds the virtio-msg transport layer.
> > > >
> > > > The individuals and organizations involved in this effort have had =
difficulty in
> > > > using the existing virtio-transports in various situations and desi=
re to add one
> > > > more transport that performs its transport layer operations by send=
ing and
> > > > receiving messages.
> > > >
> > > > Implementations of virtio-msg will normally be done in multiple lay=
ers:
> > > > * common / device level
> > > > * bus level
> > > >
> > > > The common / device level defines the messages exchanged between th=
e driver
> > > > and a device. This common part should lead to a common driver holdi=
ng most
> > > > of the virtio specifics and can be shared by all virtio-msg bus imp=
lementations.
> > > > The kernel implementation in [3] shows this separation. As with oth=
er transport
> > > > layers, virtio-msg should not require modifications to existing vir=
tio device
> > > > implementations (virtio-net, virtio-blk etc). The common / device l=
evel is the
> > > > main focus of this version of the patch series.
> > > >
> > > > The virtio-msg bus level implements the normal things a bus defines
> > > > (enumeration, dma operations, etc) but also implements the message =
send and
> > > > receive operations. A number of bus implementations are envisioned,
> > > > some of which will be reusable and general purpose. Other bus imple=
mentations
> > > > might be unique to a given situation, for example only used by a PC=
Ie card
> > > > and its driver.
> > > >
> > > > How much of the bus level should be described in the virtio spec is=
 one item
> > > > we wish to discuss. This draft takes a middle approach by describin=
g the bus
> > > > level and defining some standard bus level messages that MAY be use=
d by the bus.
> > > > It also describes a range of bus messages that are implementation d=
ependent.
> > > >
> > > > The standard bus messages are an effort to avoid different bus impl=
ementations
> > > > doing the same thing in different ways for no good reason. However =
the
> > > > different environments will require different things. Instead of tr=
ying to
> > > > anticipate all needs and provide something very abstract, we think
> > > > implementation specific messages will be needed at the bus level. O=
ver time,
> > > > if we see similar messages across multiple bus implementations, we =
will move to
> > > > standardize a bus level message for that.
> > > >
> > > > We are working on two reusable bus implementations:
> > > >
> > > > * virtio-msg-ffa based on Arm FF-A interface for use between:
> > > >   * normal world and secure world
> > > >   * host and VM or VM to VM
> > > >   * Can be used w/ or with out a hypervisor
> > > >   * Any Hypervisor that implements FF-A can be used
> > > >
> > > > * virtio-msg-amp for use between heterogenous systems
> > > >   * The main processors and its co-processors on an AMP SOC
> > > >   * Two or more systems connected via PCIe
> > > >   * Minimal requirements: bi-directional interrupts and
> > > >     at least one shared memory area
> > > >
> > > > We also anticipate a third:
> > > >
> > > > * virtio-msg-xen specific to Xen
> > > >   * Usable on any Xen system (including x86 where FF-A does not exi=
st)
> > > >   * Using Xen events and page grants
> > >
> > > I am also interested in virtio-msg-admin-cmd, sending messages to VFs
> > > over the admin commands of the PF.
> >
> > One more thing, there used to be a similar proposal which is the
> > transport virtqueue which also defines the message. And it has the
> > chance to be unified with the admin command. Need to think about the
> > (dis)advantages of each proposal.
> >
> > What's more, if the actual method to send and receive the message, can
> > we still call this a transport or not?
> >
> > Thanks
>
>
> This one has the advantage that it does not rely on some other
> transport to operate the vq.

Right but I meant the transport virtqueue also defines a set of
messages like this proposal.

>
> But yes, adding some specific ways to send the message would
> be good.

Right.

Thanks

>
>
> > >
> > > Thank you, will review.
> > >
> > > > This series is a work in progress and we acknowledge at least the f=
ollowing
> > > > issues we need to work on:
> > > >
> > > > * Conform to virtio spec nouns (device/driver vs frontend/backend)
> > > >   and verbs (must/may)
> > > > * Perhaps move error definition elsewhere it the spec and align on =
its symbols
> > > >   and numeric values
> > > > * Allow message size to be greater than 40 bytes and allow bus impl=
ementations
> > > >   to define their max message size
> > > > * Add a way to discover the protocol version
> > > > * Add a better description of the types of things a bus can do, spe=
cifically
> > > >   including out-of-band notification and memory area sharing/discov=
ery
> > > > * Maybe redo configuration generation handling
> > > >
> > > > Background info and work in progress implementations:
> > > > * HVAC project page with intro slides [1]
> > > > * HVAC demo repo w/ instructions in README.md [2]
> > > > * Kernel w/ virtio-msg common level and ffa support [3]
> > > > * QEMU w/ support for one form of virtio-msg-amp [4]
> > > > * Portable RTOS library w/ one form of virtio-msg-amp [5]
> > > >
> > > > In addition to the QEMU system based demos in the hvac-demo repo, w=
e also have
> > > > two hardware systems running:
> > > > * AMD x86 + AMD Arm Versal connected via PCIe
> > > > * ST STM32MP157 A7 Linux using virtio-i2c provided by M4 Zephyr
> > > >
> > > > Please note that although the demos work, they are not yet aligned =
with each
> > > > other nor this version of the spec.
> > > >
> > > > [1] https://linaro.atlassian.net/wiki/spaces/HVAC/overview
> > > > [2] https://github.com/wmamills/hvac-demo
> > > > [3] https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.g=
it/log/?h=3Dvirtio/msg
> > > > [4] https://github.com/edgarigl/qemu/commits/edgar/virtio-msg-new
> > > > [5] https://github.com/arnopo/open-amp/commits/virtio-msg/
> > > >
> > > > Bill Mills (1):
> > > >   virtio-msg: Add virtio-msg, a message based virtio transport laye=
r
> > > >
> > > >  content.tex       |   1 +
> > > >  transport-msg.tex | 680 ++++++++++++++++++++++++++++++++++++++++++=
++++
> > > >  2 files changed, 681 insertions(+)
> > > >  create mode 100644 transport-msg.tex
> > > >
> > > > --
> > > > 2.34.1
> > > >
> > >
> > >
>

