Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B0C284B2F
	for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 07:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772005530; cv=none; b=AYFviw/EyCF2l9WAqmcHF0ojGTSNGC/Ncrbq2iVfJvxXbSn+yk7bDkcTpmDdMLJ5/NTxh6kcUOIrlt9l87vMLwrXU6APNTN9I2FLTEzz8XbDHCkBE5g9j/LgbDWv8VaUDkgKFHI+E073DJLZyhPOick1+mYxXe8QOtqeRdrN1Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772005530; c=relaxed/simple;
	bh=s4fVjzyBadr1oEURLvqjE6fqeT8Es5F4G9jJqFUWngM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KE6gNpnX3zXRX3rEj2mIaXRZU/m2pqnq2yvdhz9vzAMdCtK3ItNh9hMoZ6SpFlFnv4v18UfbWqL9oXQEgswstHgBhHVt7q3EG4qRMC2RfohoI6LU0lLNkUoX3YDyhK1KZ1sFjedndDpu+A5njedZk3QkH6sGFrvsCU//KgL2B5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZPnuq9J3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZPnuq9J3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8C52C19425;
	Wed, 25 Feb 2026 07:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772005530;
	bh=s4fVjzyBadr1oEURLvqjE6fqeT8Es5F4G9jJqFUWngM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZPnuq9J33G5TCZv5WMydWuxw59mMSCZ8sWcUoJu8P2Q5PEZ/8JDX/UFdp5Rn0td+T
	 1KZQz5e5CREkRm577N+3wCbTfhUHaEhmMYYQJAaOmxB92ppBZ/6Fyw3+KuFNeOytvJ
	 WJoO4c2Aqo6bTPTrXog6E8NxBy9lJyEhkJO6iSCEowAW34SXUTMoZHc9ex4d7pAC5t
	 n7SFJ4yEX3IC5/d+VDd7IaYGMyRE+xl4S6w5Barr5/UaTW3bKgY1aWDz3Bm3BfTjol
	 G1Yk3X4f+kMyDeF9y0rDc/m0qqJ/+55q01RDCJS148Du2Xg+tsP4X6OnY5woGIaemA
	 ErrZLIpkun3tw==
Date: Wed, 25 Feb 2026 13:15:22 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	"Bill Mills (bill.mills@linaro.org)" <bill.mills@linaro.org>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, "Edgar E . Iglesias" <edgar.iglesias@amd.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Alex Bennee <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
Message-ID: <vigplm62id3vzr3fzekbn5io6qcpeqksgxph6jm4f2qzoripkw@sdh7k6ohw63t>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <SJ0PR12MB680610C1B53CA4E8B4470411DC61A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260219185034-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806F703CB616D184FCBE5B3DC68A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <C6374491-FCB1-421F-9273-16B9CB954F5B@arm.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <C6374491-FCB1-421F-9273-16B9CB954F5B@arm.com>

Hi Bertrand,

On Fri, Feb 20, 2026 at 09:02:12AM +0000, Bertrand Marquis wrote:
> Hi Parav,
> 
> > On 20 Feb 2026, at 07:13, Parav Pandit <parav@nvidia.com> wrote:
> >
> >
> >
> >> From: Michael S. Tsirkin <mst@redhat.com>
> >> Sent: 20 February 2026 05:25 AM
> >>
> >> On Fri, Feb 13, 2026 at 01:52:06PM +0000, Parav Pandit wrote:
> >>> Hi Bill,
> >>>
> >>>> From: Bill Mills <bill.mills@linaro.org>
> >>>> Sent: 26 January 2026 10:02 PM
> >>>>
> >>>> This series adds the virtio-msg transport layer.
> >>>>
> >>>> The individuals and organizations involved in this effort have had difficulty in
> >>>> using the existing virtio-transports in various situations and desire to add one
> >>>> more transport that performs its transport layer operations by sending and
> >>>> receiving messages.
> >>>>
> >>>> Implementations of virtio-msg will normally be done in multiple layers:
> >>>> * common / device level
> >>>> * bus level
> >>>>
> >>>> The common / device level defines the messages exchanged between the driver
> >>>> and a device. This common part should lead to a common driver holding most
> >>>> of the virtio specifics and can be shared by all virtio-msg bus implementations.
> >>>> The kernel implementation in [3] shows this separation. As with other transport
> >>>> layers, virtio-msg should not require modifications to existing virtio device
> >>>> implementations (virtio-net, virtio-blk etc). The common / device level is the
> >>>> main focus of this version of the patch series.
> >>>>
> >>>> The virtio-msg bus level implements the normal things a bus defines
> >>>> (enumeration, dma operations, etc) but also implements the message send and
> >>>> receive operations. A number of bus implementations are envisioned,
> >>>> some of which will be reusable and general purpose. Other bus implementations
> >>>> might be unique to a given situation, for example only used by a PCIe card
> >>>> and its driver.
> >>>>
> >>>> The standard bus messages are an effort to avoid different bus implementations
> >>>> doing the same thing in different ways for no good reason. However the
> >>>> different environments will require different things. Instead of trying to
> >>>> anticipate all needs and provide something very abstract, we think
> >>>> implementation specific messages will be needed at the bus level. Over time,
> >>>> if we see similar messages across multiple bus implementations, we will move to
> >>>> standardize a bus level message for that.
> >>>>
> >>>
> >>> I would review more, had first round of sparse review.
> >>> Please find few comments/questions below.
> >>
> >> I'd like to comment that I think it makes sense to have a basic simple transport and
> >> then add performance features on top as appropriate.
> > Sounds good. Simple but complete is needed.
> 
> Agree.
> 
> >
> >> So one way to address some of these comments is to show how
> >> they can be addressed with a feature bit down the road.
> >>
> >>
> >>> 1. device number should be 32-bit in struct virtio_msg_header.
> >>>> From SIOV_R2 experiences, we learnt that some uses have use case for more than 64k devices.
> >>> Also mapping PCI BDF wont be enough in 16-bits considering domain field.
> >>>
> >>> 2. msg_size of 16-bits for 64KB-8 bytes is too less for data transfer.
> >>> For example, a TCP stream wants to send 64KB of data + payload, needs more than 64KB data.
> >>> Needs 32-bits.
> >>>
> >>> 3. BUS_MSG_EVENT_DEVICE to have symmetric name as ADDED and REMOVED (instead of READY)
> >>> But more below.
> >>>
> >>> 4. I dont find the transport messages to read and write to the driver memory supplied in VIRTIO_MSG_SET_VQUEUE addresses to operate
> >> the virtqueues.
> >>> Dont we need VIRTIO_MEM_READ, VIRTIO_MEM_WRITE request and response?
> >>
> >> surely this can be an optional transport feature bit.
> >>
> > How is this optional?
> 
> As said in a previous mail, we have messages already for that.
> Please confirm if that answer your question.
> 
> > How can one implement a transport without defining the basic data transfer semantics?
> 
> We did a lot of experiments and we are feature equivalent to PCI, MMIO or Channel I/O.
> If anything is missing, we are more than happy to discuss it and solve the issue.
> 

I'd love to have this transport over PCI because it addresses the shortcomings
of the existing PCI transport which just assumes that every config space access\
is trap and emulate.

But that being said, I somewhat agree with Parav that we should define the bus
implementations in the spec to avoid fixing the ABI in the implementations. For
instance, if we try to use this transport over PCI, we've got questions like:

1. How the device should be bind to the virtio-msg-pci bus driver and not with
the existing virtio-pci driver? Should it use a new Vendor ID or Sub-IDs?

2. How the Virtio messages should be transferred? Is it through endpoint config
space or through some other means?

3. How the notification be delivered from the device to the host? Through
INT-X/MSI/MSI-X or even polling?

And these are just a few questions that comes to the top of my head. There could
be plenty more.

How can we expect all the virtio-msg bus implementations to adhere to the same
format so that the interoperability offered by the Virtio spec is guaranteed?

- Mani

-- 
மணிவண்ணன் சதாசிவம்
