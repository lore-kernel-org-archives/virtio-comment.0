Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D092AD37
	for <virtio-comment@lists.linux.dev>; Thu, 26 Feb 2026 06:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772086776; cv=none; b=itxP8fpIE/byccL6nzOPwWfjRNpH0G+CZ8J4hgitO9mV1MLV35ypp5mbywsrwdKxvgnvgwuffQA66j/vh+W/6FNdLTuEYqhBqzfL05edYIZ77/ANFHngQ7GqDod4EBHUdwAF5kryr0slAz0emp46e+HG2jMOqrT9/JS0Dj+Y2Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772086776; c=relaxed/simple;
	bh=opzgmpq7jzZX3JTvqU+dRlmgcJKOPfUifn4AF5O6FzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bmtyCEjkOgf4KeqH+Yj1C/TYas3B97nW+4BB77G2yUsuaP69I5DGMr9LnnifYfUd3ZD92sR5s8dQIzQMTOzUrNk883WpFNnWIjaukumnDeC516sUjvT8zWQ8eYezXByEJSk/DaTsZvpTJ64IGkFFXZJfbhJyd3FRjJmCcpUpSAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AiNBgA0U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AiNBgA0U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E34C19422;
	Thu, 26 Feb 2026 06:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772086775;
	bh=opzgmpq7jzZX3JTvqU+dRlmgcJKOPfUifn4AF5O6FzE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AiNBgA0U2VFCHpuKDhmjJoRPRli3lS4uwnGndV47zrm58tMlN1BHU5JiEQuXALeXd
	 41Ghx3jdurxccT6XFknxK/1tWWbPEHN1t9h32yOPf24Cz/2Y0U0nkBCBpwYNnosP4b
	 O7aakw4YVu0myd6YZ0u8hAbDnygghqlbzskx0U+QbHtyHbnHY2lzEBqken3XBzLlQ3
	 0GVL2iG1BG2HtZrWtMhrGpChr+mfgZz3Aqdi/gzMRy/zxDD6IRSiyzEz9J4wHIhK9d
	 A8LhsAD4xLKPsrjSSaoY6GBAmnhE4uwB1XRQL33t+Pv1lg660MWGdJxvCYt6AlOPhF
	 6EmkAMvRrmglg==
Date: Thu, 26 Feb 2026 11:49:27 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Parav Pandit <parav@nvidia.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, "Bill Mills (bill.mills@linaro.org)" <bill.mills@linaro.org>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, "Edgar E . Iglesias" <edgar.iglesias@amd.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Alex Bennee <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
Message-ID: <kgprjcq7mhaxv2luxou2wxp542qn5ckm3bqxaikewrhibi5g2k@kvsgoujqtgmu>
References: <SJ0PR12MB68068259D212C6AC8B6A5DEADC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <02226901-7670-4AAB-8F55-0B2FB7C0CA49@arm.com>
 <SJ0PR12MB68068FA1D1893B774C5A8A15DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260225094902-mutt-send-email-mst@kernel.org>
 <8B4F5FE2-1F80-43BE-A60B-5C24B69C8B4E@arm.com>
 <SJ0PR12MB680642C4277CBAC888052FDEDC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <u6crvmiyjbz4d7gokuegarg7d2c2krymfutzgtr26epzmv2ro7@5saaxv4agwwi>
 <SJ0PR12MB68066D1ACA893589E0675028DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <yogqvbadx7kqirie47fjmndlpgprj3jzoltdeuh2hzcpms3rcm@nlde6ernzinx>
 <SJ0PR12MB680610CBC90E1ED27D61E1BDDC72A@SJ0PR12MB6806.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SJ0PR12MB680610CBC90E1ED27D61E1BDDC72A@SJ0PR12MB6806.namprd12.prod.outlook.com>

On Thu, Feb 26, 2026 at 05:59:52AM +0000, Parav Pandit wrote:
> 
> 
> > From: Manivannan Sadhasivam <mani@kernel.org>
> > Sent: 26 February 2026 11:06 AM
> > 
> > On Wed, Feb 25, 2026 at 03:15:39PM +0000, Parav Pandit wrote:
> > >
> > > > From: Manivannan Sadhasivam <mani@kernel.org>
> > > > Sent: 25 February 2026 08:41 PM
> > > >
> > > > On Wed, Feb 25, 2026 at 03:00:19PM +0000, Parav Pandit wrote:
> > > >
> > > > [...]
> > > >
> > > > > > >> Yes. This makes a lot of sense now.
> > > > > > >>
> > > > > > >> This is a virtio-msg-transport device that needs its own device id in the table.
> > > > > > >> And its binding to the PCI transport.
> > > > > > >
> > > > > > > ok. how about an rfc of that idea on the list?
> > > > > >
> > > > > >
> > > > > > I will let Edgar answer on this.
> > > > > >
> > > > > Sure.
> > > > > Also please explain how is this different than SR-IOV devices?
> > > > > On a PCI device there are some child devices exposed using some virtio-msg bus transport.
> > > > > And all of them are going to share same PCI BDF.
> > > > > These individual devices cannot be mapped to different VMs (secure or regular) in a performant way either.
> > > > > So what would this virtio-msg-transport device achieve?
> > > > >
> > > >
> > > > IDK why you are comparing this transport with SR-IOV, which altogether serves a
> > > > different purpose.
> > > >
> > > In the example showed there are multiple devices behind one PCI device.
> > > Why is it not similar to SR-IOV that does exactly that, on one PCI link, exposes multiple devices.
> > >
> > 
> > That could be one usecase, but not the actual design.
> >
> I didn’t understand the design part.
> Why that cannot be the design if the intent is to have multiple devices?
>  

PCI is going to be *one* of the bus implementations for virtio-msg. Other busses
could also expose multiple devices if the underlying protocol supports. So I
didn't want to tie it with SR-IOV alone.

> > > > > If there was no PCI bus when implementing the virtio-msg transport, it would make sense to avoid trap-emulate story.
> > > > > But underlying transport being PCI, its back to square one for the originally described motivation.
> > > > >
> > > >
> > > > Even with PCI as the physical bus, we don't need any trap and emulate assumption
> > > > with this transport, because the communication is message based, not writing and
> > > > reading registers directly in the BAR memory.
> > > >
> > > That is true. Somewhere in this thread, there was mention of trap+emulation as reason to create some msg based transport.
> > > So I do not know why t+e was mentioned.
> > > I don’t have the link to that email at the moment.
> > >
> > 
> > I mentioned that because to run the existing Virtio PCI one would need an
> > emulated PCI device. I think it is also possible to expose custom designed HW as
> > a Virtio PCI device, but that's not the majority.
> > 
> > One primary example is how the virtqueue configuration happens. The driver
> > selects the queue by writing to the 'queue_select' and immediately it expects
> > the device to select that virtqueue and give response in other fields such as
> > 'queue_size'. This only happens in an emulated PCI bus. But in a real PCI bus,
> > the device on the other end cannot synchronize itself with the host. And this is
> > what being fixed by the message based communication.
> > 
> Yes, I am familiar with this inefficiency.
> Well for such fundamental case, all resource creation can be directly move to an admin command interface being basic facility for long enough period.
> 

I'm not aware of this 'admin command interface'. Could you elaborate?

> > We tried using the existing Virtio PCI transport in a design where two SoCs are
> > connected using PCIe bus, both running Linux. One will act as Virtio Frontend
> > and another as backend. Then we ran into all sort issues due to the above
> > mentioned assumption/expectation by the transport.
> >
> When you say front end meaning the driver, and backend being the device?

Yes!

> If yes, then then it is very common for us as well to have modern interface for resource creation such as virtqueue.
> 

When I talked to Michael a couple of years back at Vienna LPC about these
issues, he suggested going for a separate transport than fixing the existing PCI
transport (which might not be possible while preserving backwards
compatibility). That's when I encountered this new virtio-msg transport and it
suited my needs.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
