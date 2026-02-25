Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB15C38F936
	for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 13:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772024964; cv=none; b=MGfBU9PizA0nPsqiRcY3YTI608xj0EDc3BosF3dMKJZi8xag/OK95x4wHo+nllBBUAeb0jaZityqBJPsSKZ3fH9owRY6OYdZrAgm7GcuWrOKyYqfewDZO1lldKYGVIoYD3H4vPbNI4LfEik8KVUabFkkd+YSc6A/FpegPLOMOpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772024964; c=relaxed/simple;
	bh=jsryLBr/CO+o9gPRY7jlIqljhcFkMJxJApoamuiaBTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PTy9Ok5vjcQKWQKYtJ8fVyxmd6c743AbNdbmZ799PWCQG6qXFktBka9CoIjcfJ9Mho688aHe3ANHolUcEAN9jtTwrjx5MKIlsXRgzxBKo8X5GyXE6ywrmjhGNmXBMCSSVABdhuEEX6a8Glk7FNfQLj+RAPAnXUhND0ewvzj7EZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FsVr3utR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FsVr3utR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E78ADC116D0;
	Wed, 25 Feb 2026 13:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772024964;
	bh=jsryLBr/CO+o9gPRY7jlIqljhcFkMJxJApoamuiaBTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FsVr3utRjPwtpEmFdN/RKVYArqawd+J5UVv0uqpIEqwvUBkjbrFPzxuQDbjuLs+nI
	 urw6RmBU4OYJuB1AEB7gnzjUU6TM0XIf7qOhgoE1lXufyAGv7U13iSUcP9CBU4UrIi
	 yENkRH4x9LppBQD/W8hcxYLG7u7ltkl7ODR1Bw6ZBGzJlSMkMOz5FTVH8dWPEeQ6+W
	 oBgvDR0mPoGZjDReMoX9wv7IROBcyitmzEK9WzBM6dwXrNpwS1qWL9d0YIhp8LcSnL
	 D4b9Cy+RqfjUx84RL35LenYXT84BLZ+1bUrsePEjujXB3lkkDMCwtYaxM9l66tRxA7
	 T4c6WYdtXmZjg==
Date: Wed, 25 Feb 2026 18:39:16 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	"Bill Mills (bill.mills@linaro.org)" <bill.mills@linaro.org>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, "Edgar E . Iglesias" <edgar.iglesias@amd.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Alex Bennee <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
Message-ID: <tfpemcac7vkfaw6omv64pilbtdvdehiduwvd4mgdxsrusskftt@jpnczfiakaxv>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <SJ0PR12MB680610C1B53CA4E8B4470411DC61A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260219185034-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806F703CB616D184FCBE5B3DC68A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <C6374491-FCB1-421F-9273-16B9CB954F5B@arm.com>
 <vigplm62id3vzr3fzekbn5io6qcpeqksgxph6jm4f2qzoripkw@sdh7k6ohw63t>
 <71d106ec-a4b3-4382-8044-001def36027e@gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <71d106ec-a4b3-4382-8044-001def36027e@gmail.com>

On Wed, Feb 25, 2026 at 07:53:38AM -0500, Demi Marie Obenour wrote:
> On 2/25/26 02:45, Manivannan Sadhasivam wrote:
> > Hi Bertrand,
> > 
> > On Fri, Feb 20, 2026 at 09:02:12AM +0000, Bertrand Marquis wrote:
> >> Hi Parav,
> 
> (snip)
> 
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
> Would you mind elaborating on "over PCI"?
> 
> I can see two meanings for this:
> 
> 1. Virtio-msg over a physical PCI bus for heterogeneous multiprocessing
>    environments.
> 
> 2. Virtio-msg over an emulated PCI bus for QEMU, Cloud Hypervisor,
>    and other existing VMMs.
> 
> Which one are you referring to?
> 

Physical PCI bus, that's why I mentioned 'trap and emulate' which only applies
to emulated PCI bus.

> > But that being said, I somewhat agree with Parav that we should define the bus
> > implementations in the spec to avoid fixing the ABI in the implementations. For
> > instance, if we try to use this transport over PCI, we've got questions like:> 
> > 1. How the device should be bind to the virtio-msg-pci bus driver and not with
> > the existing virtio-pci driver? Should it use a new Vendor ID or Sub-IDs?
> > 
> > 2. How the Virtio messages should be transferred? Is it through endpoint config
> > space or through some other means?
> > 
> > 3. How the notification be delivered from the device to the host? Through
> > INT-X/MSI/MSI-X or even polling?
> > 
> > And these are just a few questions that comes to the top of my head. There could
> > be plenty more.
> > 
> > How can we expect all the virtio-msg bus implementations to adhere to the same
> > format so that the interoperability offered by the Virtio spec is guaranteed?
> This really ought to be included in the virtio standard.  FF-A is an
> Arm specification, but PCI is not, and virtio already references PCI.

Yes!

- Mani

-- 
மணிவண்ணன் சதாசிவம்
