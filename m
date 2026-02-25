Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7658329E76
	for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 10:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772014005; cv=none; b=TEr4RBktJ9RBwbdUucx8RKi5/dlcgpEK9p94Pds52eKHUIFMOKPNu5FptnFdrk8cPGwi8ZmDM63pQSBA8BXwRZucbsHocFPFP0Bepev0tpkvczCgkubEQILje+TeVPuly3E921rnp0DTkPmp17UeKX1O8051vSZztnSj92OTZFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772014005; c=relaxed/simple;
	bh=JpxFKRmrz13KBEk9pcnD6o7PBJ6SEvzyKuuChVkQ9OU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=thcUFFHmQuOlR5qhR0hUORaD9elzHd1sFXqpIz8T6JrqETnaeGPn8Vlgi4sd3u3nPGnIvyrmAQbiJABrZHrZCOL2bEAHqw0ow9EAL8u2pJ6x/5+C51yrwChCH7W4QXSB3GIlYKmX/giyBwKuiG23S4/YubEZGtVWSZOfT/EK7Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eU2fRmiB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eU2fRmiB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57FC1C19423;
	Wed, 25 Feb 2026 10:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772014004;
	bh=JpxFKRmrz13KBEk9pcnD6o7PBJ6SEvzyKuuChVkQ9OU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eU2fRmiBsRuW5ZE/AutRaIepcLPwVkuSpcq5gF6cd+Qpr9WLC99U7sSkmaid1D7kw
	 1z1CehsUOUfxVQDfqkWe3f0v2iaaS61dTQodhNYJx/bnBvtCyUJRSYVNtYOkn8Z+0M
	 +KhL9pvuUxxEh9DFYp5xc9W8pyKoeJqtNfeuOwhfhxmMrXwkdytP1Rl0jtW1Sk3bVp
	 61PoXJLO/CuYwbOSPhTDweT/fiVZYqBR5MWzU3oKaj91nS44/ef5qjkZISRvAiLh7b
	 mqMRZgIH66HWUKjk65vlan5RPfJdIooCE5Ohz0SIFsG7/CGfrgPbmB4arfupl9rd8F
	 DixQAk1Fn30Gw==
Date: Wed, 25 Feb 2026 15:36:36 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	"Bill Mills (bill.mills@linaro.org)" <bill.mills@linaro.org>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, "Edgar E . Iglesias" <edgar.iglesias@amd.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Alex Bennee <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
Message-ID: <dyiwq5xhqeoaqmzquzzx4wxsptm6uvrnfgspi6vmcaucq6jn4l@6dvya4te4vsj>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <SJ0PR12MB680610C1B53CA4E8B4470411DC61A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260219185034-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806F703CB616D184FCBE5B3DC68A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <C6374491-FCB1-421F-9273-16B9CB954F5B@arm.com>
 <vigplm62id3vzr3fzekbn5io6qcpeqksgxph6jm4f2qzoripkw@sdh7k6ohw63t>
 <359B0C17-9D57-423A-A229-6CEDA19C975A@arm.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <359B0C17-9D57-423A-A229-6CEDA19C975A@arm.com>

On Wed, Feb 25, 2026 at 08:03:48AM +0000, Bertrand Marquis wrote:
> Hi Manivannan,
> 
> > On 25 Feb 2026, at 08:45, Manivannan Sadhasivam <mani@kernel.org> wrote:
> >
> > Hi Bertrand,
> >
> > On Fri, Feb 20, 2026 at 09:02:12AM +0000, Bertrand Marquis wrote:
> >> Hi Parav,
> >>
> >>> On 20 Feb 2026, at 07:13, Parav Pandit <parav@nvidia.com> wrote:
> >>>
> >>>
> >>>
> >>>> From: Michael S. Tsirkin <mst@redhat.com>
> >>>> Sent: 20 February 2026 05:25 AM
> >>>>
> >>>> On Fri, Feb 13, 2026 at 01:52:06PM +0000, Parav Pandit wrote:
> >>>>> Hi Bill,
> >>>>>
> >>>>>> From: Bill Mills <bill.mills@linaro.org>
> >>>>>> Sent: 26 January 2026 10:02 PM
> >>>>>>
> >>>>>> This series adds the virtio-msg transport layer.
> >>>>>>
> >>>>>> The individuals and organizations involved in this effort have had difficulty in
> >>>>>> using the existing virtio-transports in various situations and desire to add one
> >>>>>> more transport that performs its transport layer operations by sending and
> >>>>>> receiving messages.
> >>>>>>
> >>>>>> Implementations of virtio-msg will normally be done in multiple layers:
> >>>>>> * common / device level
> >>>>>> * bus level
> >>>>>>
> >>>>>> The common / device level defines the messages exchanged between the driver
> >>>>>> and a device. This common part should lead to a common driver holding most
> >>>>>> of the virtio specifics and can be shared by all virtio-msg bus implementations.
> >>>>>> The kernel implementation in [3] shows this separation. As with other transport
> >>>>>> layers, virtio-msg should not require modifications to existing virtio device
> >>>>>> implementations (virtio-net, virtio-blk etc). The common / device level is the
> >>>>>> main focus of this version of the patch series.
> >>>>>>
> >>>>>> The virtio-msg bus level implements the normal things a bus defines
> >>>>>> (enumeration, dma operations, etc) but also implements the message send and
> >>>>>> receive operations. A number of bus implementations are envisioned,
> >>>>>> some of which will be reusable and general purpose. Other bus implementations
> >>>>>> might be unique to a given situation, for example only used by a PCIe card
> >>>>>> and its driver.
> >>>>>>
> >>>>>> The standard bus messages are an effort to avoid different bus implementations
> >>>>>> doing the same thing in different ways for no good reason. However the
> >>>>>> different environments will require different things. Instead of trying to
> >>>>>> anticipate all needs and provide something very abstract, we think
> >>>>>> implementation specific messages will be needed at the bus level. Over time,
> >>>>>> if we see similar messages across multiple bus implementations, we will move to
> >>>>>> standardize a bus level message for that.
> >>>>>>
> >>>>>
> >>>>> I would review more, had first round of sparse review.
> >>>>> Please find few comments/questions below.
> >>>>
> >>>> I'd like to comment that I think it makes sense to have a basic simple transport and
> >>>> then add performance features on top as appropriate.
> >>> Sounds good. Simple but complete is needed.
> >>
> >> Agree.
> >>
> >>>
> >>>> So one way to address some of these comments is to show how
> >>>> they can be addressed with a feature bit down the road.
> >>>>
> >>>>
> >>>>> 1. device number should be 32-bit in struct virtio_msg_header.
> >>>>>> From SIOV_R2 experiences, we learnt that some uses have use case for more than 64k devices.
> >>>>> Also mapping PCI BDF wont be enough in 16-bits considering domain field.
> >>>>>
> >>>>> 2. msg_size of 16-bits for 64KB-8 bytes is too less for data transfer.
> >>>>> For example, a TCP stream wants to send 64KB of data + payload, needs more than 64KB data.
> >>>>> Needs 32-bits.
> >>>>>
> >>>>> 3. BUS_MSG_EVENT_DEVICE to have symmetric name as ADDED and REMOVED (instead of READY)
> >>>>> But more below.
> >>>>>
> >>>>> 4. I dont find the transport messages to read and write to the driver memory supplied in VIRTIO_MSG_SET_VQUEUE addresses to operate
> >>>> the virtqueues.
> >>>>> Dont we need VIRTIO_MEM_READ, VIRTIO_MEM_WRITE request and response?
> >>>>
> >>>> surely this can be an optional transport feature bit.
> >>>>
> >>> How is this optional?
> >>
> >> As said in a previous mail, we have messages already for that.
> >> Please confirm if that answer your question.
> >>
> >>> How can one implement a transport without defining the basic data transfer semantics?
> >>
> >> We did a lot of experiments and we are feature equivalent to PCI, MMIO or Channel I/O.
> >> If anything is missing, we are more than happy to discuss it and solve the issue.
> >>
> >
> > I'd love to have this transport over PCI because it addresses the shortcomings
> > of the existing PCI transport which just assumes that every config space access\
> > is trap and emulate.
> 
> Agree and AMD did exactly that in their demonstrator.
> I will give you answers here as i know them but Edgar will probably give you more
> details (and probably fix my mistakes).
> 
> >
> > But that being said, I somewhat agree with Parav that we should define the bus
> > implementations in the spec to avoid fixing the ABI in the implementations. For
> > instance, if we try to use this transport over PCI, we've got questions like:
> >
> > 1. How the device should be bind to the virtio-msg-pci bus driver and not with
> > the existing virtio-pci driver? Should it use a new Vendor ID or Sub-IDs?
> 
> One bus is appearing as one pci device with its own Vendor ID,
> 

What should be the 'own Vendor ID' here?

The existing virtio-pci driver binds to all devices with the Vendor ID of
PCI_VENDOR_ID_REDHAT_QUMRANET. So are you expecting the Vendors to use their own
VID for exposing the Virtio devices? That would mean, the drivers on the host
need update as well, which will not scale.

It would be good if the existing virtio-pci devices can use this new transport
with only device side modifications.

> >
> > 2. How the Virtio messages should be transferred? Is it through endpoint config
> > space or through some other means?
> 
> The virtio messages are transfered using FIFOs stored in the BAR of the PCI
> device (ending up being memory shared between both sides)
> 

What should be the BAR number and size?

> >
> > 3. How the notification be delivered from the device to the host? Through
> > INT-X/MSI/MSI-X or even polling?
> 
> Notifications are delivered through MSI.
> 

So no INT-X or MSI-X? Why so?

Anyhow, my objective is not to get answers for my above questions here in this
thread, but to state the reality that it would be hard for us to make use of
this new transport without defining the bus implementation.

> >
> > And these are just a few questions that comes to the top of my head. There could
> > be plenty more.
> >
> > How can we expect all the virtio-msg bus implementations to adhere to the same
> > format so that the interoperability offered by the Virtio spec is guaranteed?
> 
> We spent a lot of time thinking on that (this started around 2 years ago) and we
> discussed several use cases and did some PoC to try to have everything covered
> (secure to non secure and vm to vm using ffa, system to system over PCI or hardware
> messaging system, PCI, Xen specific implementation) to check the needs and try to
> cover as much as we can.
> 
> Now there might be cases we missed but we think that having a purely message based
> interface between the bus and the transport and split responsibilities the way we did
> is allowing lots of different bus implementations without affecting the transport and
> driver/device implementations on top.
> 
> We identified that a common use case will be for the bus to transfer messages using
> FIFOs to optimize speed (at the end you need to have a way to share memory between
> both sides so why not using a part of it to transfer the messages to and reduce the number
> of data exchanges and copies) and this will be used by PCI, Xen, FF-A and others in
> practice (so we might standardize the FIFO format in the future to allow even more code
> reuse between busses).
> 

Not just the FIFO format, but how that FIFO gets shared between the device and
the host also needs to be documented. Maybe for this initial transport version,
you can start with defining the FF-A bus implementation?

- Mani

-- 
மணிவண்ணன் சதாசிவம்
