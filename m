Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1EB2D2385
	for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 14:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772031004; cv=none; b=UXvZgXVokP5mA0KXIZ2Egf67UDllQNGysF6gKlIy5Irzeo5KQNCc+TeIKHqOkmdKmOMPZEqfgb6+NWN11EmSqguqgn7XoBJQA6EYjwcc1abJ9s9FfYiQGkvnAXxfrgkueiQYVH3uTSeprAwQ4SdzgiWBkW+vF/cNQv8Gybu4W3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772031004; c=relaxed/simple;
	bh=+v6IWGyhBIlmTZyZdf3rxIuIRuvR8QPMnuz0EK32yA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=KywE0htullvZu0r31WpFY7ynxP65oKX8WX0r+htxhNxc7hT5SwS3DjqDs8ox94skD2snps8ReIoRvqYGi9iJDCGGtky9kQh2ypIyaQmSR2fqzQkxJVdy5EhWH71gzs31p9y4F6NUhScJbYiW/3IRNikOfy/ENyAgqSHxnj7cYd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dt58RApt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dt58RApt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772031001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7SzVZKMq9YnRkXvnw5KuK2QfcXKrxZVlAhseahNewyQ=;
	b=dt58RAptACRM+RbMLFc902ZTAp4nwhGwhxMsXPIQdrbl5H0sy2k44KBpr8YlaI29fp1ZfL
	8regX6FhP1V+9NJDC8xPNmh3m7CT94eVbe1GsD9/4UrFtOQAwxg5nI+neSzcuR244YFhjx
	Xc7gpTkETdNV0/RiS00Ll3V7oc1Rza8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-AkXWFU2SMJCi_598LxQoMQ-1; Wed, 25 Feb 2026 09:50:00 -0500
X-MC-Unique: AkXWFU2SMJCi_598LxQoMQ-1
X-Mimecast-MFC-AGG-ID: AkXWFU2SMJCi_598LxQoMQ_1772030999
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-483bcfdaf7dso17103935e9.0
        for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 06:50:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772030999; x=1772635799;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7SzVZKMq9YnRkXvnw5KuK2QfcXKrxZVlAhseahNewyQ=;
        b=HtwIJzzu06ryb41KSNaX+nvo0N05GBPUYa6bSnE+dv60lE9UG+UGOEVD5VeoIuRS6b
         3cFCa0aPHCqm/7Ak4Tez5VkZGj+XH4l26iUYF5Td66AZjHF39Wu0KQZA95OcbPqcxviM
         fWDUuGB+NY2gSnIdeWr79iU5fRF465ZYjclOR5JdEwyyuFWnay7esawWi0jDLN0GfPM+
         yFZs0gQ19mJRSbspG46b0YVyHi2DwXsmJ/ZhU5ihPT3kW6UpUqtPgCCqGy7lR8QqQhuL
         9U4iNcqfKcwl0MFurMWBWPyKDNi9uiF0vBLxEgWhaTSOZPyS3yZgFiM1rR5UyVLIDfr4
         yg1w==
X-Forwarded-Encrypted: i=1; AJvYcCX50Lb6DFcx9Vm5OXxduO/uySw5ka8WLvvesduvW0/rSElI+lbp5OIAMIC1T9VK58+S3P4mJ8C1xedacKCenA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxailQ5R/hWe6ueSuIxxzAMArB7cqOMsZheZYrcIJv1mNGUTKWT
	ze/TP7J6nKQOG8wcZMhekW7S0Esmgeahim76m+jv4gSA23b34Z5Qpa3xRqsrid1VHmqg182RKCx
	p7cucDyYoyDlFdwPX6MRaZ4RGcefWj8cfsCkUTrYMGAvQhZKL2Lpa6cOSvE+dKig67Z5Q
X-Gm-Gg: ATEYQzwRABzPP6qkxY2U62X0bwBgZOJw+OE0by/DzvuU8ILgXjhnCtQuluwqtw5JBvi
	PNXXXE6cbrZ+eZ5gmzeqvvR4OKNLq++PdnbTyB4wKK9ypST7iOkxxrCxz31yI6v3xtf2uaNZuKA
	ol+COGItWFhvmWggzE/a24KNwMDth7NfqXG5zXqjB02OsdZh2wE/uKHZKVUtyqBmi7Rnzq8jw2y
	SfziEdFXrUTu/UnMTbBBuF9e5NG5gU2soSrSygitfI7obz4qnxUAlXjFb75VNbTYd6mWOgpifWu
	XCH1MwNjD6C5Wz9N57BOWjP3NjeytkME61GeasIJ9ms0MqLwEN9eVGayf5RmmPsnvnr0YHC30LC
	vH+q0fd0GfIuYlRM4kUNLklxxXsuFXwx7si2s6QU3mqKVSA==
X-Received: by 2002:a5d:43d0:0:b0:439:872f:b495 with SMTP id ffacd0b85a97d-439872fb5ccmr8352656f8f.42.1772030998692;
        Wed, 25 Feb 2026 06:49:58 -0800 (PST)
X-Received: by 2002:a5d:43d0:0:b0:439:872f:b495 with SMTP id ffacd0b85a97d-439872fb5ccmr8352611f8f.42.1772030998081;
        Wed, 25 Feb 2026 06:49:58 -0800 (PST)
Received: from redhat.com (IGLD-80-230-79-166.inter.net.il. [80.230.79.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d40004sm34169089f8f.21.2026.02.25.06.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 06:49:57 -0800 (PST)
Date: Wed, 25 Feb 2026 09:49:54 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	"Bill Mills (bill.mills@linaro.org)" <bill.mills@linaro.org>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"Edgar E . Iglesias" <edgar.iglesias@amd.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Alex Bennee <alex.bennee@linaro.org>,
	Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
Message-ID: <20260225094902-mutt-send-email-mst@kernel.org>
References: <SJ0PR12MB680610C1B53CA4E8B4470411DC61A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260219185034-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806F703CB616D184FCBE5B3DC68A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <C6374491-FCB1-421F-9273-16B9CB954F5B@arm.com>
 <vigplm62id3vzr3fzekbn5io6qcpeqksgxph6jm4f2qzoripkw@sdh7k6ohw63t>
 <359B0C17-9D57-423A-A229-6CEDA19C975A@arm.com>
 <dyiwq5xhqeoaqmzquzzx4wxsptm6uvrnfgspi6vmcaucq6jn4l@6dvya4te4vsj>
 <SJ0PR12MB68068259D212C6AC8B6A5DEADC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <02226901-7670-4AAB-8F55-0B2FB7C0CA49@arm.com>
 <SJ0PR12MB68068FA1D1893B774C5A8A15DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <SJ0PR12MB68068FA1D1893B774C5A8A15DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0_FlgQJmVUFjoOP8uPFNz_jg5NcFmRGkGxFTXLUg_Ek_1772030999
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 25, 2026 at 02:45:35PM +0000, Parav Pandit wrote:
> 
> > From: Bertrand Marquis <Bertrand.Marquis@arm.com>
> > Sent: 25 February 2026 04:06 PM
> > 
> > Hi Parav,
> > 
> > > On 25 Feb 2026, at 11:24, Parav Pandit <parav@nvidia.com> wrote:
> > >
> > >>
> > >> From: Manivannan Sadhasivam <mani@kernel.org>
> > >> Sent: 25 February 2026 03:37 PM
> > >>
> > >> On Wed, Feb 25, 2026 at 08:03:48AM +0000, Bertrand Marquis wrote:
> > >>> Hi Manivannan,
> > >>>
> > >>>> On 25 Feb 2026, at 08:45, Manivannan Sadhasivam <mani@kernel.org> wrote:
> > >>>>
> > >>>> Hi Bertrand,
> > >>>>
> > >>>> On Fri, Feb 20, 2026 at 09:02:12AM +0000, Bertrand Marquis wrote:
> > >>>>> Hi Parav,
> > >>>>>
> > >>>>>> On 20 Feb 2026, at 07:13, Parav Pandit <parav@nvidia.com> wrote:
> > >>>>>>
> > >>>>>>
> > >>>>>>
> > >>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
> > >>>>>>> Sent: 20 February 2026 05:25 AM
> > >>>>>>>
> > >>>>>>> On Fri, Feb 13, 2026 at 01:52:06PM +0000, Parav Pandit wrote:
> > >>>>>>>> Hi Bill,
> > >>>>>>>>
> > >>>>>>>>> From: Bill Mills <bill.mills@linaro.org>
> > >>>>>>>>> Sent: 26 January 2026 10:02 PM
> > >>>>>>>>>
> > >>>>>>>>> This series adds the virtio-msg transport layer.
> > >>>>>>>>>
> > >>>>>>>>> The individuals and organizations involved in this effort have had difficulty in
> > >>>>>>>>> using the existing virtio-transports in various situations and desire to add one
> > >>>>>>>>> more transport that performs its transport layer operations by sending and
> > >>>>>>>>> receiving messages.
> > >>>>>>>>>
> > >>>>>>>>> Implementations of virtio-msg will normally be done in multiple layers:
> > >>>>>>>>> * common / device level
> > >>>>>>>>> * bus level
> > >>>>>>>>>
> > >>>>>>>>> The common / device level defines the messages exchanged between the driver
> > >>>>>>>>> and a device. This common part should lead to a common driver holding most
> > >>>>>>>>> of the virtio specifics and can be shared by all virtio-msg bus implementations.
> > >>>>>>>>> The kernel implementation in [3] shows this separation. As with other transport
> > >>>>>>>>> layers, virtio-msg should not require modifications to existing virtio device
> > >>>>>>>>> implementations (virtio-net, virtio-blk etc). The common / device level is the
> > >>>>>>>>> main focus of this version of the patch series.
> > >>>>>>>>>
> > >>>>>>>>> The virtio-msg bus level implements the normal things a bus defines
> > >>>>>>>>> (enumeration, dma operations, etc) but also implements the message send and
> > >>>>>>>>> receive operations. A number of bus implementations are envisioned,
> > >>>>>>>>> some of which will be reusable and general purpose. Other bus implementations
> > >>>>>>>>> might be unique to a given situation, for example only used by a PCIe card
> > >>>>>>>>> and its driver.
> > >>>>>>>>>
> > >>>>>>>>> The standard bus messages are an effort to avoid different bus implementations
> > >>>>>>>>> doing the same thing in different ways for no good reason. However the
> > >>>>>>>>> different environments will require different things. Instead of trying to
> > >>>>>>>>> anticipate all needs and provide something very abstract, we think
> > >>>>>>>>> implementation specific messages will be needed at the bus level. Over time,
> > >>>>>>>>> if we see similar messages across multiple bus implementations, we will move to
> > >>>>>>>>> standardize a bus level message for that.
> > >>>>>>>>>
> > >>>>>>>>
> > >>>>>>>> I would review more, had first round of sparse review.
> > >>>>>>>> Please find few comments/questions below.
> > >>>>>>>
> > >>>>>>> I'd like to comment that I think it makes sense to have a basic simple transport and
> > >>>>>>> then add performance features on top as appropriate.
> > >>>>>> Sounds good. Simple but complete is needed.
> > >>>>>
> > >>>>> Agree.
> > >>>>>
> > >>>>>>
> > >>>>>>> So one way to address some of these comments is to show how
> > >>>>>>> they can be addressed with a feature bit down the road.
> > >>>>>>>
> > >>>>>>>
> > >>>>>>>> 1. device number should be 32-bit in struct virtio_msg_header.
> > >>>>>>>>> From SIOV_R2 experiences, we learnt that some uses have use case for more than 64k devices.
> > >>>>>>>> Also mapping PCI BDF wont be enough in 16-bits considering domain field.
> > >>>>>>>>
> > >>>>>>>> 2. msg_size of 16-bits for 64KB-8 bytes is too less for data transfer.
> > >>>>>>>> For example, a TCP stream wants to send 64KB of data + payload, needs more than 64KB data.
> > >>>>>>>> Needs 32-bits.
> > >>>>>>>>
> > >>>>>>>> 3. BUS_MSG_EVENT_DEVICE to have symmetric name as ADDED and REMOVED (instead of READY)
> > >>>>>>>> But more below.
> > >>>>>>>>
> > >>>>>>>> 4. I dont find the transport messages to read and write to the driver memory supplied in VIRTIO_MSG_SET_VQUEUE addresses to
> > >> operate
> > >>>>>>> the virtqueues.
> > >>>>>>>> Dont we need VIRTIO_MEM_READ, VIRTIO_MEM_WRITE request and response?
> > >>>>>>>
> > >>>>>>> surely this can be an optional transport feature bit.
> > >>>>>>>
> > >>>>>> How is this optional?
> > >>>>>
> > >>>>> As said in a previous mail, we have messages already for that.
> > >>>>> Please confirm if that answer your question.
> > >>>>>
> > >>>>>> How can one implement a transport without defining the basic data transfer semantics?
> > >>>>>
> > >>>>> We did a lot of experiments and we are feature equivalent to PCI, MMIO or Channel I/O.
> > >>>>> If anything is missing, we are more than happy to discuss it and solve the issue.
> > >>>>>
> > >>>>
> > >>>> I'd love to have this transport over PCI because it addresses the shortcomings
> > >>>> of the existing PCI transport which just assumes that every config space access\
> > >>>> is trap and emulate.
> > >>>
> > >>> Agree and AMD did exactly that in their demonstrator.
> > >>> I will give you answers here as i know them but Edgar will probably give you more
> > >>> details (and probably fix my mistakes).
> > >>>
> > >>>>
> > >>>> But that being said, I somewhat agree with Parav that we should define the bus
> > >>>> implementations in the spec to avoid fixing the ABI in the implementations. For
> > >>>> instance, if we try to use this transport over PCI, we've got questions like:
> > >>>>
> > >>>> 1. How the device should be bind to the virtio-msg-pci bus driver and not with
> > >>>> the existing virtio-pci driver? Should it use a new Vendor ID or Sub-IDs?
> > >>>
> > >>> One bus is appearing as one pci device with its own Vendor ID,
> > >>>
> > >>
> > >> What should be the 'own Vendor ID' here?
> > >>
> > >> The existing virtio-pci driver binds to all devices with the Vendor ID of
> > >> PCI_VENDOR_ID_REDHAT_QUMRANET. So are you expecting the Vendors to use their own
> > >> VID for exposing the Virtio devices? That would mean, the drivers on the host
> > >> need update as well, which will not scale.
> > >>
> > >> It would be good if the existing virtio-pci devices can use this new transport
> > >> with only device side modifications.
> > >>
> > >>>>
> > >>>> 2. How the Virtio messages should be transferred? Is it through endpoint config
> > >>>> space or through some other means?
> > >>>
> > >>> The virtio messages are transfered using FIFOs stored in the BAR of the PCI
> > >>> device (ending up being memory shared between both sides)
> > >>>
> > >>
> > >> What should be the BAR number and size?
> > >>
> > >>>>
> > >>>> 3. How the notification be delivered from the device to the host? Through
> > >>>> INT-X/MSI/MSI-X or even polling?
> > >>>
> > >>> Notifications are delivered through MSI.
> > >>>
> > >>
> > >> So no INT-X or MSI-X? Why so?
> > >>
> > >> Anyhow, my objective is not to get answers for my above questions here in this
> > >> thread, but to state the reality that it would be hard for us to make use of
> > >> this new transport without defining the bus implementation.
> > >>
> > > +1 to most of the points that Manivannan explained.
> > >
> > > The whole new definition of message layer for the PCI does not make any sense at all where expectation for the device is to build yet
> > another interface for _Everything_ that already exists.
> > > and device is still have to implement all the existing things because the device does not know which driver will operate.
> > >
> > > And that too some register based inefficient interface.
> > > Just to reset the device one needs to fully setup the new message interface but device still have to be working.
> > > That defeats the whole purpose of reset_1 and reset_2 in the device.
> > >
> > > This does not bring anything better for the PCI devices at all.
> > >
> > > A transport binding should be defined for the bus binding.
> > > A bus that chooses a msg interface should be listed that way and bus choose inline messages can continue the way they are.
> > >
> > > If we are creating something brand-new, for PCI the only thing needed is:
> > > 1. Reset the device
> > > 2. Create an admin virtqueue
> > > 3. Transport everything needed through this virtqueue including features, configs, control.
> > >
> > > And this will work for any other bus or msg based too given only contract needed is to creating the aq.
> > 
> > I think you misunderstood a bit the point of virtio-msg bus over PCI so let me try to explain.
> > 
> > You see one PCI device (regular, not virtio) which is a "virtio-msg bus over PCI".
> > 
> > When the virtio-msg bus over PCI it will communicate through this device with an external
> > system connected through the PCI bus.
> > The driver will enumerate virtio devices available behind this bus and register them so that
> > the corresponding virtio drivers are probed for them.
> > All virtio-msg messages required to communicate with those devices will be transferred through
> > a FIFO stored in the BAR of the pci device and standard PCI DMA will be used to share the
> > virtqueues with all the devices on the bus.
> > 
> > So the PCI device is not one virtio device but one bus behind which there can be many devices.
> > 
> > Is this making the concept a bit clearer ?
> > 
> Yes. This makes a lot of sense now.
> 
> This is a virtio-msg-transport device that needs its own device id in the table.
> And its binding to the PCI transport.

ok. how about an rfc of that idea on the list?


> So that device producer can implement this standard device and driver developer can develop the driver for multiplexing by reading the spec.
> 
> > Cheers
> > Bertrand
> > 
> > 
> > >
> > >>>>
> > >>>> And these are just a few questions that comes to the top of my head. There could
> > >>>> be plenty more.
> > >>>>
> > >>>> How can we expect all the virtio-msg bus implementations to adhere to the same
> > >>>> format so that the interoperability offered by the Virtio spec is guaranteed?
> > >>>
> > >>> We spent a lot of time thinking on that (this started around 2 years ago) and we
> > >>> discussed several use cases and did some PoC to try to have everything covered
> > >>> (secure to non secure and vm to vm using ffa, system to system over PCI or hardware
> > >>> messaging system, PCI, Xen specific implementation) to check the needs and try to
> > >>> cover as much as we can.
> > >>>
> > >>> Now there might be cases we missed but we think that having a purely message based
> > >>> interface between the bus and the transport and split responsibilities the way we did
> > >>> is allowing lots of different bus implementations without affecting the transport and
> > >>> driver/device implementations on top.
> > >>>
> > >>> We identified that a common use case will be for the bus to transfer messages using
> > >>> FIFOs to optimize speed (at the end you need to have a way to share memory between
> > >>> both sides so why not using a part of it to transfer the messages to and reduce the number
> > >>> of data exchanges and copies) and this will be used by PCI, Xen, FF-A and others in
> > >>> practice (so we might standardize the FIFO format in the future to allow even more code
> > >>> reuse between busses).
> > >>>
> > >>
> > >> Not just the FIFO format, but how that FIFO gets shared between the device and
> > >> the host also needs to be documented. Maybe for this initial transport version,
> > >> you can start with defining the FF-A bus implementation?
> > 
> > 
> > IMPORTANT NOTICE: The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended
> > recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy
> > the information in any medium. Thank you.

