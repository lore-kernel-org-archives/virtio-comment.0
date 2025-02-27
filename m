Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D105922617F
	for <virtio-comment@lists.linux.dev>; Thu, 27 Feb 2025 08:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740646545; cv=none; b=twsKrUzGhDXh8xLE3PD8KqmB2EdOEwGx7iEpXB+gpjVLEVfozRBUboob+eOrIy/ZS7w5fBHbXUUKjx3aI/IPgz4c1QzulJ2Cv/gbwkVfOOEzn231m+HOQZZPE5cKjoyxKMH4jd1YQHwvSnBoiI/bOTPBr/s8f3l7hvhBMEvDoqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740646545; c=relaxed/simple;
	bh=sg4oZV+1CsEOG2axdm2bO3MNcY/UsG1/SwziEhp7YdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Nth09k9gxxXSkYKlWRwR4fxSjI/9Mb6E9nMyYxUVIRB5nKPBHCp2gP0beD/80FdKbA1j7/36xmJ5EWCbmKGtnWBOYf0DlUvZVpAllTi5+nd620ErlDFZ2A+f6y1h9sPIsgaWrdIHwMkAUIPMHJB+8n1O+kJZq+Yj0pg2pkRxAhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R3tM73QL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R3tM73QL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740646542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WH8vAIgr3GCWWrgz/qF3Kld8pdMHdXtEr+VYJIPUSFA=;
	b=R3tM73QLAcjJtZkX/PlmAaV8r8DfqbPC0iAveBl0/F7a3qu5IsP47Rp7IpVgpynHMxhvGN
	f9wtw0YcT2Ig0j5bSXFC8OwmWZ65IuZf3kcIHmZenF7yOv0RTq6Bgs6xASRHiRDH2Dply3
	MkfuL9eJwimwuOZEgRJD+gun9l3DsJQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-2-MuNJgiORMQyYFPkF2J6jFQ-1; Thu, 27 Feb 2025 03:55:39 -0500
X-MC-Unique: MuNJgiORMQyYFPkF2J6jFQ-1
X-Mimecast-MFC-AGG-ID: MuNJgiORMQyYFPkF2J6jFQ_1740646538
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4398ed35b10so3493605e9.1
        for <virtio-comment@lists.linux.dev>; Thu, 27 Feb 2025 00:55:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740646537; x=1741251337;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WH8vAIgr3GCWWrgz/qF3Kld8pdMHdXtEr+VYJIPUSFA=;
        b=aCXEp/5Xynrwf/HpKyq2jRf5z8UOGiGIbCxYsIMIpCyTCGrQyqgYOeRTh4QsTPBSyn
         4hnsGNqE7yTuAa42E0QLj0r/KMF9JdUtevTRQZ8vRUN7kUzvr1sRNofuEoN4S/tS6dSt
         Kf23yY2nehNrEJGfpWzqh+K9+x1kcmmQlTegCgTLJWLIj8b9qZvzY65/T+UbKh5piHH8
         CnSxE7vp36GlETXKBrZkyrXWbSVf+UfwWaSJV9BoZNKPTL2XkqwC61Y4MQaJR34lXCIw
         ESMyHYxY/n2/Fnd/hbWYW3C32XTwl+M8cD2OnFv2FOweL6KCxwjB4XDAH80ZmvIe42m8
         DErQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/Sy4yttB2c1LymL0YqTal6Tood/sHThM0uvt+yLMFarkhTaAHENqCXUNQ3TYFUOeY0WTIkSduVLWC1Hr0DQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwxKVqyoKo2Ndws6hyDIw2SaKXEHkx5zeTge9abIEhZ/RwYYVFU
	Hd/RsmsDFTVDGkdd8TOTEUPLHlIGAHnW9enFu1aGjup74AEVWm/NAYJ9KltlMADnPKsCIU0pEqx
	VnjtIMR1iobYSj9rlVY3vJzLJMAJ+hyDuiPiAe4x+yqU4jfCXBU/KvFYsP/4F5u0uG7ch4SxD
X-Gm-Gg: ASbGncs/Cb3gYTC8uDRwd201uHBrPitk6V7m9c/UtuW3D9q0R2sP+uPcWr23jVVdOwV
	YD4UvQj6vz7jq+l1GijbILWILumq+zs8KU/rwChPUKgYV37um6/Di0cfTFsfJjI40EkUVwb/uIf
	Y/MlDUVgNlFz6114l2ctShjLzFLoMSJd2iganVOP9ryXWinq/dPnuhybZC8pbtslgOqsk3UlhQf
	v4nq9M0grVKIKA2ACtnKJhlpzPZUQmHrCtkWEA+21eQHLMAVlyIhks7Zib2gF18Zxr1/4Ejz8Bp
X-Received: by 2002:a05:6000:2a2:b0:38f:4fa5:58ce with SMTP id ffacd0b85a97d-38f70772a64mr17376290f8f.6.1740646537323;
        Thu, 27 Feb 2025 00:55:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFuRe2T6tb97tfnfnPWg+f4fYuXZn1R3asoq7CKO1+zxDzmgIlAjxjxa+kLZpiXGK86E+Yr+w==
X-Received: by 2002:a05:6000:2a2:b0:38f:4fa5:58ce with SMTP id ffacd0b85a97d-38f70772a64mr17376273f8f.6.1740646536923;
        Thu, 27 Feb 2025 00:55:36 -0800 (PST)
Received: from redhat.com ([2.52.7.97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4795d44sm1324290f8f.8.2025.02.27.00.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 00:55:36 -0800 (PST)
Date: Thu, 27 Feb 2025 03:55:32 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Bill Mills <bill.mills@linaro.org>, virtio-comment@lists.linux.dev,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	"Edgar E . Iglesias" <edgar.iglesias@amd.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Alex Bennee <alex.bennee@linaro.org>
Subject: Re: [PATCH RFC v1 0/1] virtio-msg transport layer
Message-ID: <20250227035442-mutt-send-email-mst@kernel.org>
References: <20250225134801.3546224-1-bill.mills@linaro.org>
 <20250227025757-mutt-send-email-mst@kernel.org>
 <CACGkMEsmvBkfPffDGxpnArOuz_JqYfwZ-uA-H=hWKr5QyjjSwA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CACGkMEsmvBkfPffDGxpnArOuz_JqYfwZ-uA-H=hWKr5QyjjSwA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iZT4Kls0FYmMiMW4OZv_3HLhcigTUaEpnwQM9T_4O-0_1740646538
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Feb 27, 2025 at 04:32:53PM +0800, Jason Wang wrote:
> On Thu, Feb 27, 2025 at 4:09 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Tue, Feb 25, 2025 at 08:48:00AM -0500, Bill Mills wrote:
> > > This series adds the virtio-msg transport layer.
> > >
> > > The individuals and organizations involved in this effort have had difficulty in
> > > using the existing virtio-transports in various situations and desire to add one
> > > more transport that performs its transport layer operations by sending and
> > > receiving messages.
> > >
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
> > > How much of the bus level should be described in the virtio spec is one item
> > > we wish to discuss. This draft takes a middle approach by describing the bus
> > > level and defining some standard bus level messages that MAY be used by the bus.
> > > It also describes a range of bus messages that are implementation dependent.
> > >
> > > The standard bus messages are an effort to avoid different bus implementations
> > > doing the same thing in different ways for no good reason. However the
> > > different environments will require different things. Instead of trying to
> > > anticipate all needs and provide something very abstract, we think
> > > implementation specific messages will be needed at the bus level. Over time,
> > > if we see similar messages across multiple bus implementations, we will move to
> > > standardize a bus level message for that.
> > >
> > > We are working on two reusable bus implementations:
> > >
> > > * virtio-msg-ffa based on Arm FF-A interface for use between:
> > >   * normal world and secure world
> > >   * host and VM or VM to VM
> > >   * Can be used w/ or with out a hypervisor
> > >   * Any Hypervisor that implements FF-A can be used
> > >
> > > * virtio-msg-amp for use between heterogenous systems
> > >   * The main processors and its co-processors on an AMP SOC
> > >   * Two or more systems connected via PCIe
> > >   * Minimal requirements: bi-directional interrupts and
> > >     at least one shared memory area
> > >
> > > We also anticipate a third:
> > >
> > > * virtio-msg-xen specific to Xen
> > >   * Usable on any Xen system (including x86 where FF-A does not exist)
> > >   * Using Xen events and page grants
> >
> > I am also interested in virtio-msg-admin-cmd, sending messages to VFs
> > over the admin commands of the PF.
> 
> One more thing, there used to be a similar proposal which is the
> transport virtqueue which also defines the message. And it has the
> chance to be unified with the admin command. Need to think about the
> (dis)advantages of each proposal.
> 
> What's more, if the actual method to send and receive the message, can
> we still call this a transport or not?
> 
> Thanks


This one has the advantage that it does not rely on some other
transport to operate the vq.

But yes, adding some specific ways to send the message would
be good.


> >
> > Thank you, will review.
> >
> > > This series is a work in progress and we acknowledge at least the following
> > > issues we need to work on:
> > >
> > > * Conform to virtio spec nouns (device/driver vs frontend/backend)
> > >   and verbs (must/may)
> > > * Perhaps move error definition elsewhere it the spec and align on its symbols
> > >   and numeric values
> > > * Allow message size to be greater than 40 bytes and allow bus implementations
> > >   to define their max message size
> > > * Add a way to discover the protocol version
> > > * Add a better description of the types of things a bus can do, specifically
> > >   including out-of-band notification and memory area sharing/discovery
> > > * Maybe redo configuration generation handling
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
> > > Please note that although the demos work, they are not yet aligned with each
> > > other nor this version of the spec.
> > >
> > > [1] https://linaro.atlassian.net/wiki/spaces/HVAC/overview
> > > [2] https://github.com/wmamills/hvac-demo
> > > [3] https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git/log/?h=virtio/msg
> > > [4] https://github.com/edgarigl/qemu/commits/edgar/virtio-msg-new
> > > [5] https://github.com/arnopo/open-amp/commits/virtio-msg/
> > >
> > > Bill Mills (1):
> > >   virtio-msg: Add virtio-msg, a message based virtio transport layer
> > >
> > >  content.tex       |   1 +
> > >  transport-msg.tex | 680 ++++++++++++++++++++++++++++++++++++++++++++++
> > >  2 files changed, 681 insertions(+)
> > >  create mode 100644 transport-msg.tex
> > >
> > > --
> > > 2.34.1
> > >
> >
> >

