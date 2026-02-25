Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3556938F231
	for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 10:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772017104; cv=none; b=rwu+0fZG/J/jjioarzquwuNmBrooP+p33JtNwlYFNI5ZvuVF4ffwXhv/eAvcliiRsqdUQfCOCi5yKzU/bdGfmaGten2XAa1rPk2fvuqPQGHY4HkyWBWOaFlPMo8aMC2RhYH4alXV0qckXivs5pvOlRqthuECgt84gFtgYTHNSrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772017104; c=relaxed/simple;
	bh=yJJQkS2nsEQ/YND3Si8bBmw/F3u9oO2g4oLguyOqcbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Lh2SdjS/7oUtqdmf5R5BSM6zTurYwsnkVQPjrcMuY8oXMsCt16Z615hiWjR4UMAdUdEtLaLg2gbqLiL9YB+FeCHXYTx33wYKNG5QEr5SOU1o32EMlgS5nMsud84pnmwoQ/2hy7uyrwKhvoN2AExpe5KWXNbMnShtEE4JnJF1f3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VlAn8Ttg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VlAn8Ttg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772017102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lOqc0eenu/E8Yd9oWHoToXCV3DaInTSZwP0pTnQwRY8=;
	b=VlAn8TtgdfP92W6nIutVxoyBVr4DDQQF3TbfBhZytftekfgY3QiBKr+Pm2Uqh/ilkkGTAk
	JEzW9C9myooKCbUbKR2pbnMZdFd7mbaOGHXPTjKBG5Y1knY7HVc+Wf8szTi13Yr8ay4Ei4
	6/Cp53/FQRrfH1w86GNxa6V5Ni0WCDk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609--cDAuBLXP_W6un8K1aRHsg-1; Wed, 25 Feb 2026 05:58:20 -0500
X-MC-Unique: -cDAuBLXP_W6un8K1aRHsg-1
X-Mimecast-MFC-AGG-ID: -cDAuBLXP_W6un8K1aRHsg_1772017099
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4837b9913c9so62421105e9.0
        for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 02:58:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772017099; x=1772621899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lOqc0eenu/E8Yd9oWHoToXCV3DaInTSZwP0pTnQwRY8=;
        b=PmQFJH5rV7Jo0Pa9w4ysaERAK7dtkEf2RJz8hFMoi+jZYS8Xc8JOy8uo8RNsrnIDBI
         NKeoH8MeGamzpIAuHSkNgYyMUc+p1t0JEgMqql0bTEM4agQHNkMJWnijF+T3YfrN+Q5O
         5e0ziOaZG4q0xZXVhmyr6gi41xqeq0ju/xbWFZsRN2b+/X6eTlpQM9RAOM9eqe1s/XAA
         NvsXcynG7I5X3eCx2bq+zlpPbJl4aihpoLfs8qqXrR67I2HXN1+4YGVAXjU0yD7yHgpV
         myaKbYgXSoPaLt2Bm+ADmh5HtucGVJHTITzIjntXUXSuiXqfyHtajEjMV04HExiJBu1h
         o1Uw==
X-Forwarded-Encrypted: i=1; AJvYcCVG1v0/lufTh+kAgjl7R+Fdt+2JAB09xAqFKz6jD7I2H9WHySyzpuPvXNes3d3KVMNgRwgBAbtyazNCG7Ci1g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxhjrzyc/AD68lobGe+1RVwpZq3FDDLs1W9VXkXiTsX1N5jTjfm
	ck32L1OF6zM4ODKxy16sF5x4JAgz9pA+EnUcnEibe/YIDmXKMtz1IgTFpm5k6heZXt9kR2x397e
	EymEnKUvrU52eIYBlxSVmcjB9i72fa3cbE8rYy3A03Ibu3yc6hRbgFHreuGqpKQ+e2bgE
X-Gm-Gg: ATEYQzzAxvkWxNx+4vdD79dnd2AMahIzt2p0uft5dduaUG1QcStrRHIpesjknECU73j
	YwVXzrhob6IeLFGYW98CIIEfs7FvGsDEfwOHb/DL5e9E19o0GVJZinKGTsMzK2dRoMjV4mr5x2+
	4++LirmB1cgnwnqjBU43BK3u3Hl+l2uaz69ySSkaWJbqlGalgfHZc0mzfzhoL0r7lFWIqg2LZQR
	8wEcdd9MOGC7dHnEBMuf4egyzUEVgDv4tHmLpzr6QftBgy6v4lWB56vH9p62AyoMbY2h3xCj08+
	mY/TFHPEZZ4gdzLKMHqakoR5UeJ+c1I1RaTJErHbKIm19/DZThA61P9iyUFbQlLA91J+cbAS4fY
	eV+q+j9nv0exvib2698RYEamG8Tiogx+jttiQUsLiXktSoA==
X-Received: by 2002:a05:600c:8a16:10b0:47e:e4ff:e2ac with SMTP id 5b1f17b1804b1-483a9603c2dmr183263205e9.33.1772017098908;
        Wed, 25 Feb 2026 02:58:18 -0800 (PST)
X-Received: by 2002:a05:600c:8a16:10b0:47e:e4ff:e2ac with SMTP id 5b1f17b1804b1-483a9603c2dmr183262865e9.33.1772017098325;
        Wed, 25 Feb 2026 02:58:18 -0800 (PST)
Received: from redhat.com (IGLD-80-230-79-166.inter.net.il. [80.230.79.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd6f19d6sm63905865e9.2.2026.02.25.02.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 02:58:17 -0800 (PST)
Date: Wed, 25 Feb 2026 05:58:15 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Parav Pandit <parav@nvidia.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	"Bill Mills (bill.mills@linaro.org)" <bill.mills@linaro.org>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"Edgar E . Iglesias" <edgar.iglesias@amd.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Alex Bennee <alex.bennee@linaro.org>,
	Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
Message-ID: <20260225055750-mutt-send-email-mst@kernel.org>
References: <20260219185034-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806F703CB616D184FCBE5B3DC68A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <C6374491-FCB1-421F-9273-16B9CB954F5B@arm.com>
 <vigplm62id3vzr3fzekbn5io6qcpeqksgxph6jm4f2qzoripkw@sdh7k6ohw63t>
 <359B0C17-9D57-423A-A229-6CEDA19C975A@arm.com>
 <dyiwq5xhqeoaqmzquzzx4wxsptm6uvrnfgspi6vmcaucq6jn4l@6dvya4te4vsj>
 <SJ0PR12MB68068259D212C6AC8B6A5DEADC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <02226901-7670-4AAB-8F55-0B2FB7C0CA49@arm.com>
 <20260225055020-mutt-send-email-mst@kernel.org>
 <49E4F96C-F23D-4D79-AB91-D132252CB76B@arm.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <49E4F96C-F23D-4D79-AB91-D132252CB76B@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: K-Wd4B1lsL0GgnY708VhFT6uBJAnKtDP4DaScsWYmy4_1772017099
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 25, 2026 at 10:55:05AM +0000, Bertrand Marquis wrote:
> Hi
> 
> > On 25 Feb 2026, at 11:52, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Wed, Feb 25, 2026 at 10:35:41AM +0000, Bertrand Marquis wrote:
> >> Hi Parav,
> >>
> >>> On 25 Feb 2026, at 11:24, Parav Pandit <parav@nvidia.com> wrote:
> >>>
> >>>>
> >>>> From: Manivannan Sadhasivam <mani@kernel.org>
> >>>> Sent: 25 February 2026 03:37 PM
> >>>>
> >>>> On Wed, Feb 25, 2026 at 08:03:48AM +0000, Bertrand Marquis wrote:
> >>>>> Hi Manivannan,
> >>>>>
> >>>>>> On 25 Feb 2026, at 08:45, Manivannan Sadhasivam <mani@kernel.org> wrote:
> >>>>>>
> >>>>>> Hi Bertrand,
> >>>>>>
> >>>>>> On Fri, Feb 20, 2026 at 09:02:12AM +0000, Bertrand Marquis wrote:
> >>>>>>> Hi Parav,
> >>>>>>>
> >>>>>>>> On 20 Feb 2026, at 07:13, Parav Pandit <parav@nvidia.com> wrote:
> >>>>>>>>
> >>>>>>>>
> >>>>>>>>
> >>>>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
> >>>>>>>>> Sent: 20 February 2026 05:25 AM
> >>>>>>>>>
> >>>>>>>>> On Fri, Feb 13, 2026 at 01:52:06PM +0000, Parav Pandit wrote:
> >>>>>>>>>> Hi Bill,
> >>>>>>>>>>
> >>>>>>>>>>> From: Bill Mills <bill.mills@linaro.org>
> >>>>>>>>>>> Sent: 26 January 2026 10:02 PM
> >>>>>>>>>>>
> >>>>>>>>>>> This series adds the virtio-msg transport layer.
> >>>>>>>>>>>
> >>>>>>>>>>> The individuals and organizations involved in this effort have had difficulty in
> >>>>>>>>>>> using the existing virtio-transports in various situations and desire to add one
> >>>>>>>>>>> more transport that performs its transport layer operations by sending and
> >>>>>>>>>>> receiving messages.
> >>>>>>>>>>>
> >>>>>>>>>>> Implementations of virtio-msg will normally be done in multiple layers:
> >>>>>>>>>>> * common / device level
> >>>>>>>>>>> * bus level
> >>>>>>>>>>>
> >>>>>>>>>>> The common / device level defines the messages exchanged between the driver
> >>>>>>>>>>> and a device. This common part should lead to a common driver holding most
> >>>>>>>>>>> of the virtio specifics and can be shared by all virtio-msg bus implementations.
> >>>>>>>>>>> The kernel implementation in [3] shows this separation. As with other transport
> >>>>>>>>>>> layers, virtio-msg should not require modifications to existing virtio device
> >>>>>>>>>>> implementations (virtio-net, virtio-blk etc). The common / device level is the
> >>>>>>>>>>> main focus of this version of the patch series.
> >>>>>>>>>>>
> >>>>>>>>>>> The virtio-msg bus level implements the normal things a bus defines
> >>>>>>>>>>> (enumeration, dma operations, etc) but also implements the message send and
> >>>>>>>>>>> receive operations. A number of bus implementations are envisioned,
> >>>>>>>>>>> some of which will be reusable and general purpose. Other bus implementations
> >>>>>>>>>>> might be unique to a given situation, for example only used by a PCIe card
> >>>>>>>>>>> and its driver.
> >>>>>>>>>>>
> >>>>>>>>>>> The standard bus messages are an effort to avoid different bus implementations
> >>>>>>>>>>> doing the same thing in different ways for no good reason. However the
> >>>>>>>>>>> different environments will require different things. Instead of trying to
> >>>>>>>>>>> anticipate all needs and provide something very abstract, we think
> >>>>>>>>>>> implementation specific messages will be needed at the bus level. Over time,
> >>>>>>>>>>> if we see similar messages across multiple bus implementations, we will move to
> >>>>>>>>>>> standardize a bus level message for that.
> >>>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>> I would review more, had first round of sparse review.
> >>>>>>>>>> Please find few comments/questions below.
> >>>>>>>>>
> >>>>>>>>> I'd like to comment that I think it makes sense to have a basic simple transport and
> >>>>>>>>> then add performance features on top as appropriate.
> >>>>>>>> Sounds good. Simple but complete is needed.
> >>>>>>>
> >>>>>>> Agree.
> >>>>>>>
> >>>>>>>>
> >>>>>>>>> So one way to address some of these comments is to show how
> >>>>>>>>> they can be addressed with a feature bit down the road.
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>>> 1. device number should be 32-bit in struct virtio_msg_header.
> >>>>>>>>>>> From SIOV_R2 experiences, we learnt that some uses have use case for more than 64k devices.
> >>>>>>>>>> Also mapping PCI BDF wont be enough in 16-bits considering domain field.
> >>>>>>>>>>
> >>>>>>>>>> 2. msg_size of 16-bits for 64KB-8 bytes is too less for data transfer.
> >>>>>>>>>> For example, a TCP stream wants to send 64KB of data + payload, needs more than 64KB data.
> >>>>>>>>>> Needs 32-bits.
> >>>>>>>>>>
> >>>>>>>>>> 3. BUS_MSG_EVENT_DEVICE to have symmetric name as ADDED and REMOVED (instead of READY)
> >>>>>>>>>> But more below.
> >>>>>>>>>>
> >>>>>>>>>> 4. I dont find the transport messages to read and write to the driver memory supplied in VIRTIO_MSG_SET_VQUEUE addresses to
> >>>> operate
> >>>>>>>>> the virtqueues.
> >>>>>>>>>> Dont we need VIRTIO_MEM_READ, VIRTIO_MEM_WRITE request and response?
> >>>>>>>>>
> >>>>>>>>> surely this can be an optional transport feature bit.
> >>>>>>>>>
> >>>>>>>> How is this optional?
> >>>>>>>
> >>>>>>> As said in a previous mail, we have messages already for that.
> >>>>>>> Please confirm if that answer your question.
> >>>>>>>
> >>>>>>>> How can one implement a transport without defining the basic data transfer semantics?
> >>>>>>>
> >>>>>>> We did a lot of experiments and we are feature equivalent to PCI, MMIO or Channel I/O.
> >>>>>>> If anything is missing, we are more than happy to discuss it and solve the issue.
> >>>>>>>
> >>>>>>
> >>>>>> I'd love to have this transport over PCI because it addresses the shortcomings
> >>>>>> of the existing PCI transport which just assumes that every config space access\
> >>>>>> is trap and emulate.
> >>>>>
> >>>>> Agree and AMD did exactly that in their demonstrator.
> >>>>> I will give you answers here as i know them but Edgar will probably give you more
> >>>>> details (and probably fix my mistakes).
> >>>>>
> >>>>>>
> >>>>>> But that being said, I somewhat agree with Parav that we should define the bus
> >>>>>> implementations in the spec to avoid fixing the ABI in the implementations. For
> >>>>>> instance, if we try to use this transport over PCI, we've got questions like:
> >>>>>>
> >>>>>> 1. How the device should be bind to the virtio-msg-pci bus driver and not with
> >>>>>> the existing virtio-pci driver? Should it use a new Vendor ID or Sub-IDs?
> >>>>>
> >>>>> One bus is appearing as one pci device with its own Vendor ID,
> >>>>>
> >>>>
> >>>> What should be the 'own Vendor ID' here?
> >>>>
> >>>> The existing virtio-pci driver binds to all devices with the Vendor ID of
> >>>> PCI_VENDOR_ID_REDHAT_QUMRANET. So are you expecting the Vendors to use their own
> >>>> VID for exposing the Virtio devices? That would mean, the drivers on the host
> >>>> need update as well, which will not scale.
> >>>>
> >>>> It would be good if the existing virtio-pci devices can use this new transport
> >>>> with only device side modifications.
> >>>>
> >>>>>>
> >>>>>> 2. How the Virtio messages should be transferred? Is it through endpoint config
> >>>>>> space or through some other means?
> >>>>>
> >>>>> The virtio messages are transfered using FIFOs stored in the BAR of the PCI
> >>>>> device (ending up being memory shared between both sides)
> >>>>>
> >>>>
> >>>> What should be the BAR number and size?
> >>>>
> >>>>>>
> >>>>>> 3. How the notification be delivered from the device to the host? Through
> >>>>>> INT-X/MSI/MSI-X or even polling?
> >>>>>
> >>>>> Notifications are delivered through MSI.
> >>>>>
> >>>>
> >>>> So no INT-X or MSI-X? Why so?
> >>>>
> >>>> Anyhow, my objective is not to get answers for my above questions here in this
> >>>> thread, but to state the reality that it would be hard for us to make use of
> >>>> this new transport without defining the bus implementation.
> >>>>
> >>> +1 to most of the points that Manivannan explained.
> >>>
> >>> The whole new definition of message layer for the PCI does not make any sense at all where expectation for the device is to build yet another interface for _Everything_ that already exists.
> >>> and device is still have to implement all the existing things because the device does not know which driver will operate.
> >>>
> >>> And that too some register based inefficient interface.
> >>> Just to reset the device one needs to fully setup the new message interface but device still have to be working.
> >>> That defeats the whole purpose of reset_1 and reset_2 in the device.
> >>>
> >>> This does not bring anything better for the PCI devices at all.
> >>>
> >>> A transport binding should be defined for the bus binding.
> >>> A bus that chooses a msg interface should be listed that way and bus choose inline messages can continue the way they are.
> >>>
> >>> If we are creating something brand-new, for PCI the only thing needed is:
> >>> 1. Reset the device
> >>> 2. Create an admin virtqueue
> >>> 3. Transport everything needed through this virtqueue including features, configs, control.
> >>>
> >>> And this will work for any other bus or msg based too given only contract needed is to creating the aq.
> >>
> >> I think you misunderstood a bit the point of virtio-msg bus over PCI so let me try to explain.
> >>
> >> You see one PCI device (regular, not virtio) which is a "virtio-msg bus over PCI".
> >>
> >> When the virtio-msg bus over PCI it will communicate through this device with an external
> >> system connected through the PCI bus.
> >> The driver will enumerate virtio devices available behind this bus and register them so that
> >> the corresponding virtio drivers are probed for them.
> >> All virtio-msg messages required to communicate with those devices will be transferred through
> >> a FIFO stored in the BAR of the pci device and standard PCI DMA will be used to share the
> >> virtqueues with all the devices on the bus.
> >>
> >> So the PCI device is not one virtio device but one bus behind which there can be many devices.
> >>
> >> Is this making the concept a bit clearer ?
> >>
> >> Cheers
> >> Bertrand
> >>
> >
> > So this is fundamentally pci over virtio-msg?
> 
> we are not doing anything PCI, we use PCI bars and device as a way to implement a virtio-msg
> bus. The devices on top are virtio devices not PCI devices and they use a virtio-msg transport
> not PCI.
> 
> PCI here is only used as a communication system between 2 heterogenous systems connected
> by PCI where one system is seen by the other as a PCI device.
> 
> pci over virtio-msg is making me think we provide some pci functionality over virtio-msg.
> 
> Cheers
> Bertrand
> 

it might make sense to write this up a bit more formally then.

