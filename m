Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2FC1A08AF
	for <virtio-comment@lists.linux.dev>; Thu, 26 Feb 2026 07:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772090904; cv=none; b=aOr4OcFWkXHTGdll/DdfWN6QudkAVsbTwiiSd7At0fUg1qPY4JY2X/iKEJGPAi0eShGSfAnr4+tqQzmfwcV5+2pvRjkk2LVXoMOgeLgnL1jn9aBGQcPJejUtpbJnt7sv6QMaWpcI3M3wl7TrI/WTaS9fRPJzfpeNl9vpyCp6ff4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772090904; c=relaxed/simple;
	bh=4owEmyVrw0a++Q1AaiZO4Rxf4ohXhOLjxOM8XbVWDok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=daMQtDK+pNtPwCj1TC2WF/+/8WBkQjz8qhwLtb6wUmBucbM2b5TRzzAwIFa7c/NCry/eIwSY3wMy1fz1SSSrqQfRj3jzTnjP4JchrBZ8gITEoxy9DgoPccuUBlb5hjxW61gxhTW6Mp23/ebzp2CPBk6RS69GoyZfrbaLyZh0vT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mOPvLemM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mOPvLemM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70B51C19422;
	Thu, 26 Feb 2026 07:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772090903;
	bh=4owEmyVrw0a++Q1AaiZO4Rxf4ohXhOLjxOM8XbVWDok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mOPvLemMqtG/MoI+i0xSJeBNDz0wjIBExXNQn9wzcFf5Bln7CI2OIZPiwOoOa6sxI
	 Pr/Nztkghm/+JwpQC/TdRS+eqlOSjm3hS0AapqFNCZev7n2KIBSsEIBsKuSF/+0T9C
	 HAt2mHIN0VTbwIoY2sJ9rmM19LcBlcYuOy+U+/hDSQc4+5qne868XeXOq+sH/XqEA2
	 RlAFW7MAYKmy2L9w7hHzDLkhh6x+yyM7oJD9yArDCc2Jn1qVz4VucWNMLdJBdlLg0h
	 cup0A2R814vFf/ypRbvdiXNIKvw9M+u2qz0q/f92JGtjD7azjQDqY95iCFCgv/HH/8
	 axWAxoEJmliXQ==
Date: Thu, 26 Feb 2026 12:58:15 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	"Bill Mills (bill.mills@linaro.org)" <bill.mills@linaro.org>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, "Edgar E . Iglesias" <edgar.iglesias@amd.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Alex Bennee <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
Message-ID: <xgfuzykbgw3r2igfmfrzmlr57y4er4urml3wrkerlld2awog3v@lp7itztottld>
References: <SJ0PR12MB68068259D212C6AC8B6A5DEADC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <02226901-7670-4AAB-8F55-0B2FB7C0CA49@arm.com>
 <SJ0PR12MB68068FA1D1893B774C5A8A15DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260225094902-mutt-send-email-mst@kernel.org>
 <8B4F5FE2-1F80-43BE-A60B-5C24B69C8B4E@arm.com>
 <SJ0PR12MB680642C4277CBAC888052FDEDC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <u6crvmiyjbz4d7gokuegarg7d2c2krymfutzgtr26epzmv2ro7@5saaxv4agwwi>
 <SJ0PR12MB68066D1ACA893589E0675028DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <yogqvbadx7kqirie47fjmndlpgprj3jzoltdeuh2hzcpms3rcm@nlde6ernzinx>
 <7C1E61B4-8405-40DE-94D4-21E9B7C22399@arm.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7C1E61B4-8405-40DE-94D4-21E9B7C22399@arm.com>

On Thu, Feb 26, 2026 at 07:01:25AM +0000, Bertrand Marquis wrote:
> Hi Manivannan,
> 
> > On 26 Feb 2026, at 06:36, Manivannan Sadhasivam <mani@kernel.org> wrote:
> >
> > On Wed, Feb 25, 2026 at 03:15:39PM +0000, Parav Pandit wrote:
> >>
> >>> From: Manivannan Sadhasivam <mani@kernel.org>
> >>> Sent: 25 February 2026 08:41 PM
> >>>
> >>> On Wed, Feb 25, 2026 at 03:00:19PM +0000, Parav Pandit wrote:
> >>>
> >>> [...]
> >>>
> >>>>>>> Yes. This makes a lot of sense now.
> >>>>>>>
> >>>>>>> This is a virtio-msg-transport device that needs its own device id in the table.
> >>>>>>> And its binding to the PCI transport.
> >>>>>>
> >>>>>> ok. how about an rfc of that idea on the list?
> >>>>>
> >>>>>
> >>>>> I will let Edgar answer on this.
> >>>>>
> >>>> Sure.
> >>>> Also please explain how is this different than SR-IOV devices?
> >>>> On a PCI device there are some child devices exposed using some virtio-msg bus transport.
> >>>> And all of them are going to share same PCI BDF.
> >>>> These individual devices cannot be mapped to different VMs (secure or regular) in a performant way either.
> >>>> So what would this virtio-msg-transport device achieve?
> >>>>
> >>>
> >>> IDK why you are comparing this transport with SR-IOV, which altogether serves a
> >>> different purpose.
> >>>
> >> In the example showed there are multiple devices behind one PCI device.
> >> Why is it not similar to SR-IOV that does exactly that, on one PCI link, exposes multiple devices.
> >>
> >
> > That could be one usecase, but not the actual design.
> >
> >>>> If there was no PCI bus when implementing the virtio-msg transport, it would make sense to avoid trap-emulate story.
> >>>> But underlying transport being PCI, its back to square one for the originally described motivation.
> >>>>
> >>>
> >>> Even with PCI as the physical bus, we don't need any trap and emulate assumption
> >>> with this transport, because the communication is message based, not writing and
> >>> reading registers directly in the BAR memory.
> >>>
> >> That is true. Somewhere in this thread, there was mention of trap+emulation as reason to create some msg based transport.
> >> So I do not know why t+e was mentioned.
> >> I don’t have the link to that email at the moment.
> >>
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
> > We tried using the existing Virtio PCI transport in a design where two SoCs are
> > connected using PCIe bus, both running Linux. One will act as Virtio Frontend
> > and another as backend. Then we ran into all sort issues due to the above
> > mentioned assumption/expectation by the transport.
> >
> 
> Definitely check Edgar's work using virtio-msg as it seems that it is exactly what
> you are looking for.
> 

I already have a prototype based on the intial virtio-msg transport kernel
patches by Viresh: https://github.com/Mani-Sadhasivam/linux/tree/pci-epf-virtio-msg

I guess some of it, especially the queue implementation was inspired from
Edgar's work I believe.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
