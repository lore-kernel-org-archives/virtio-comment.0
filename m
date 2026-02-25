Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB35C19EED3
	for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 08:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772007144; cv=none; b=ZqU/42YuAXK7qk8EbkesF/OgJht9OEyuC+a/lLTtHefju/nQTSkGFHu21RjrEZldblKdBGRSYgQOBA+K5xpgVvXxQelqubgQt1D1xB5T0xFkoPF88yPSDAJ+WQMeMcG1+ORta/y87Yc8zvC0osdblwtLWUebyonqTLfDl6UC1G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772007144; c=relaxed/simple;
	bh=XV9qODagfLo8gMX+6YzmQtuaGDGHQbCwaTlgD3XSWNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ecci7kYbkWHvkJymv0bycEsSgzfWMwE9IWEc0lQWl7esW0WqfB1SuKa6P5YUD8xbEJokPZ46bwUeHQxiVXmBgqz0LaHZ8H4qRBC/gwPbuKkcK92rZckQBfj6g+glfKgnME8V9NA29ylD7knNcl2Hx2HZ1KhV2RuQl0a2MBM06QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C5fsu564; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C5fsu564"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772007141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GW5lCqtQpyqhT/Fj6IhfOjYk0jG6mfxJK4Hz5d46jt4=;
	b=C5fsu5649B+lqtHRg+wFai6o9OlHb754vOMV3ReIcd4ioeLMcw2TBhP+UL8172LymktzJE
	T+RiGZsmRTNIfA2z5s88C62igHF34AzRZv9Y/Pcje9jvI0etzaWDSrO3R1pf81m9TEGQ8f
	MBRBJFi7gqeVwJLi0waqB5kc5qi0a7I=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-20-VeqknbI5OQOdANZX5kXAWw-1; Wed, 25 Feb 2026 03:12:19 -0500
X-MC-Unique: VeqknbI5OQOdANZX5kXAWw-1
X-Mimecast-MFC-AGG-ID: VeqknbI5OQOdANZX5kXAWw_1772007139
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-43985826d05so1221600f8f.2
        for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 00:12:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772007138; x=1772611938;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GW5lCqtQpyqhT/Fj6IhfOjYk0jG6mfxJK4Hz5d46jt4=;
        b=D/GOkEqxRlSD2rto8uSwLMu3eg41UUinhTPBcnR57YZGbB0fQ4sEQTPPkGFKy3UbEm
         ieX6ghNgWTMdazbNrRq8M94Ysr5LAhxgFD43t5uwf7eRszUPCLejseCAvuy9A2Qr5R9a
         hDOUJdvtwhX6GuDcj+Y6W7A/UOfwi9niCJe0qzbRuUIPtdu5PX229dC550pJ2easEk4L
         NZOotbV/LrjLSx4qVJadR8Dj0uFlTr/PXgOcIIchWXQfURpY3SDtuDIWJjEglLOViqFI
         pS0vteBSYSZypDZv+0Cyl2ND0bMMwaasbEJ5Juo5YER6cCZQu1Hb9TRwrjecS5z2W5Mi
         j69w==
X-Forwarded-Encrypted: i=1; AJvYcCXsd2zvNiJqJMWbXZJjaFzJJpd5JNva2mfaDZVqpLFlUl56jhjIyaRh3XnHIC8YhacYO5x4L+z6cLwzXe2G4A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxfwm0MMDt++mOsNvbAbKHKwCs2W3F3Gp52lb1+jE+/MJ4veXAH
	kyi3+KEcuTDmVNdXEPd0SQ9MQx8YRt+lyFnWTir3rD1BCX6AbX3P9BOOZD1udqLCzcbBMA6C95b
	C5yKLpGi2nivSSWLZTQimDReil1sSG5S1NRSMhbqf9aGrMbwUtYHfkZxiyL3E3dpFMuL3
X-Gm-Gg: ATEYQzyY6CIIxJ/C/xg5UZsc55FEmjzEXuHfCZblZeZl5/Fq9kaTeRK+dgiV3bz9RY8
	qDXn0GQ1sBuYsOOmYgGghToKNQrMoKW/1WZeymf5tqMAdn5yjB47Y3o6U7cduEFhvjgDE2si5al
	rsiW3H7KUjQNtL9/8ML05YNUYGnrC7xayUEcIBndcLbVry1imPvhMiBjkxhVcsJmlRUFdtJQnjg
	qUbajnemq65tdUJ/bKeQvd4JifWyjUdMp251UcpVptvO/1PVZgMVfjPu6rBgVd9Ol6lqlVgxPbs
	UTCgOms91KRRTPfqANxB3hvbQ+Sb4Ql3DgabRT1DwRkwr1hi60G2SWkgtmVwuu5pCnrGrerVOCy
	ZQZ4rZ4kZFppmJAh2eVN9oWZyE7b38jrSaZ14M6i7f67XrQ==
X-Received: by 2002:a05:6000:40cf:b0:439:9106:3ba6 with SMTP id ffacd0b85a97d-439910649b9mr1457033f8f.49.1772007138391;
        Wed, 25 Feb 2026 00:12:18 -0800 (PST)
X-Received: by 2002:a05:6000:40cf:b0:439:9106:3ba6 with SMTP id ffacd0b85a97d-439910649b9mr1456983f8f.49.1772007137822;
        Wed, 25 Feb 2026 00:12:17 -0800 (PST)
Received: from redhat.com (IGLD-80-230-79-166.inter.net.il. [80.230.79.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4c982sm31948760f8f.31.2026.02.25.00.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 00:12:17 -0800 (PST)
Date: Wed, 25 Feb 2026 03:12:14 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Parav Pandit <parav@nvidia.com>,
	"Bill Mills (bill.mills@linaro.org)" <bill.mills@linaro.org>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"Edgar E . Iglesias" <edgar.iglesias@amd.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Alex Bennee <alex.bennee@linaro.org>,
	Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
Message-ID: <20260225030928-mutt-send-email-mst@kernel.org>
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
In-Reply-To: <359B0C17-9D57-423A-A229-6CEDA19C975A@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: H-itWGo1eiUcYAFYmiGsQlZAZTmy0kNATl_JPTSCvkc_1772007139
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

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


It might be pretty handy to include, as a separate RFC, a quick
description of that binding.


> >
> > 2. How the Virtio messages should be transferred? Is it through endpoint config
> > space or through some other means?
> 
> The virtio messages are transfered using FIFOs stored in the BAR of the PCI
> device (ending up being memory shared between both sides)
> 
> >
> > 3. How the notification be delivered from the device to the host? Through
> > INT-X/MSI/MSI-X or even polling?
> 
> Notifications are delivered through MSI.
> 
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
> If you have any questions or doubts, or if you have a use case that should be investigated
> please tell us.
> 
> Cheers
> Bertrand
> 
> 
> >
> > - Mani
> >
> > --
> > மணிவண்ணன் சதாசிவம்
> 
> IMPORTANT NOTICE: The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium. Thank you.

