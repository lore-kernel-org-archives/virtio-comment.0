Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5456A2765ED
	for <virtio-comment@lists.linux.dev>; Thu, 26 Feb 2026 05:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772084180; cv=none; b=NEMp7mlTcnog9uavDfniWo/IyDDb5d/sIrxmiqAdqgNIXPL/CSuhJQh7UcKjQXSEmnF5idpCeXLGpszE6MttaSeAfcTzjoUc133A1suzTiSRxdRDbhexqj/nuJzgbxaktAlD940TF0MhVmj/c4YhvV20xNAve58KUF64awVW5uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772084180; c=relaxed/simple;
	bh=cELDvRJbiv3Y1qdTlG0BX6prcMzXndnqbnRplsG3n8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ROyN+ztB9pJncodg5WWScZhdp9UWVMcjhS6iW7qhg+dHLNUOuBgwem2K/HNCg3/hNPaz0gaRTJ4rJc298l9VILSSECRaQTvt3kQ3l8KYGUmBNaTNcNty7Di2zCWsOlcnYML02ykEDDaXJOYXCMnearxixTLJ+GXP5mwgi5jg6wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ahb17g2o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ahb17g2o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6E9DC19422;
	Thu, 26 Feb 2026 05:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772084180;
	bh=cELDvRJbiv3Y1qdTlG0BX6prcMzXndnqbnRplsG3n8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ahb17g2ohb47Qh1wVHdL7kuCj9926ZxTgXpk1LPF7mMshAQrJT++LAAA6nyyOmpp5
	 fNDLnpyNzHZW048y1gPi6/nFpyX0Z9jogIfMNzMxlvfIxHlC7OC9K+WGsRbqIlXY1C
	 JQ9k6UbtBje0ABIyNd4Qs7o1nIk8apNKpZPSBynAEyamgVSMR0g0WE5UPaRt9CG3RW
	 zT5K3egzNVX8+U9fGfy2WNX2Y76oTzuD8oPkHcktEV0Et1L0CcKGI752SUKd3Ye924
	 O8ELMabWpTapYIedrpY8DzWoGzCdpZZyM+0NyAXwIUix5WWlULFjmo71teLYq5GLOK
	 VodQSQDHXokvg==
Date: Thu, 26 Feb 2026 11:06:12 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Parav Pandit <parav@nvidia.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, "Bill Mills (bill.mills@linaro.org)" <bill.mills@linaro.org>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, "Edgar E . Iglesias" <edgar.iglesias@amd.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Alex Bennee <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
Message-ID: <yogqvbadx7kqirie47fjmndlpgprj3jzoltdeuh2hzcpms3rcm@nlde6ernzinx>
References: <359B0C17-9D57-423A-A229-6CEDA19C975A@arm.com>
 <dyiwq5xhqeoaqmzquzzx4wxsptm6uvrnfgspi6vmcaucq6jn4l@6dvya4te4vsj>
 <SJ0PR12MB68068259D212C6AC8B6A5DEADC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <02226901-7670-4AAB-8F55-0B2FB7C0CA49@arm.com>
 <SJ0PR12MB68068FA1D1893B774C5A8A15DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260225094902-mutt-send-email-mst@kernel.org>
 <8B4F5FE2-1F80-43BE-A60B-5C24B69C8B4E@arm.com>
 <SJ0PR12MB680642C4277CBAC888052FDEDC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <u6crvmiyjbz4d7gokuegarg7d2c2krymfutzgtr26epzmv2ro7@5saaxv4agwwi>
 <SJ0PR12MB68066D1ACA893589E0675028DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SJ0PR12MB68066D1ACA893589E0675028DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>

On Wed, Feb 25, 2026 at 03:15:39PM +0000, Parav Pandit wrote:
> 
> > From: Manivannan Sadhasivam <mani@kernel.org>
> > Sent: 25 February 2026 08:41 PM
> > 
> > On Wed, Feb 25, 2026 at 03:00:19PM +0000, Parav Pandit wrote:
> > 
> > [...]
> > 
> > > > >> Yes. This makes a lot of sense now.
> > > > >>
> > > > >> This is a virtio-msg-transport device that needs its own device id in the table.
> > > > >> And its binding to the PCI transport.
> > > > >
> > > > > ok. how about an rfc of that idea on the list?
> > > >
> > > >
> > > > I will let Edgar answer on this.
> > > >
> > > Sure.
> > > Also please explain how is this different than SR-IOV devices?
> > > On a PCI device there are some child devices exposed using some virtio-msg bus transport.
> > > And all of them are going to share same PCI BDF.
> > > These individual devices cannot be mapped to different VMs (secure or regular) in a performant way either.
> > > So what would this virtio-msg-transport device achieve?
> > >
> > 
> > IDK why you are comparing this transport with SR-IOV, which altogether serves a
> > different purpose.
> > 
> In the example showed there are multiple devices behind one PCI device.
> Why is it not similar to SR-IOV that does exactly that, on one PCI link, exposes multiple devices.
> 

That could be one usecase, but not the actual design.

> > > If there was no PCI bus when implementing the virtio-msg transport, it would make sense to avoid trap-emulate story.
> > > But underlying transport being PCI, its back to square one for the originally described motivation.
> > >
> > 
> > Even with PCI as the physical bus, we don't need any trap and emulate assumption
> > with this transport, because the communication is message based, not writing and
> > reading registers directly in the BAR memory.
> > 
> That is true. Somewhere in this thread, there was mention of trap+emulation as reason to create some msg based transport.
> So I do not know why t+e was mentioned.
> I don’t have the link to that email at the moment.
> 

I mentioned that because to run the existing Virtio PCI one would need an
emulated PCI device. I think it is also possible to expose custom designed HW as
a Virtio PCI device, but that's not the majority.

One primary example is how the virtqueue configuration happens. The driver
selects the queue by writing to the 'queue_select' and immediately it expects
the device to select that virtqueue and give response in other fields such as
'queue_size'. This only happens in an emulated PCI bus. But in a real PCI bus,
the device on the other end cannot synchronize itself with the host. And this is
what being fixed by the message based communication.

We tried using the existing Virtio PCI transport in a design where two SoCs are
connected using PCIe bus, both running Linux. One will act as Virtio Frontend
and another as backend. Then we ran into all sort issues due to the above
mentioned assumption/expectation by the transport.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
