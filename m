Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C153939C8
	for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 10:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772016844; cv=none; b=k/fRjDr9b9lnvJTdE/NNeccevBVkOwkd32io7kWaYDHCh1Cm/46sZlfgAATQHjdumwwOE8BsIzNH/7C3ONv2tojzDQSaBpC2AOwX8q+VyF/coC8XcbM70/V5qdfL5AGzLvPrfgJsdeX6qBFNzwpQ9ty0i+J/xoQrELFcEXX4pjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772016844; c=relaxed/simple;
	bh=+5AUPd7H8VJx/FxpsRKKRJjYfRlv0dU7gH2c2JhlPU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TnSe3LGmlL4w6fwNH5m72cu6TkpUugxFXG7ULQ5BlSgMDXUgrXNfxgkQTpuPR6I26De6Tmx4iaHM9cRB+RKZnxgjKYJQ2N/KEOzz26JaYGqfoT6bgxjkp/LJq45UWXHRRGCpxz1fVSgzCoDJwDipVp59tkzSR4NFVgICEQsEqXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M9ju/pv2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M9ju/pv2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81128C19421;
	Wed, 25 Feb 2026 10:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772016844;
	bh=+5AUPd7H8VJx/FxpsRKKRJjYfRlv0dU7gH2c2JhlPU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M9ju/pv2fNyky8O0wpMD14CWm+IRGtngUsZsnz2SftrM3Znv57uYB98XGR2PIHTzd
	 ypiw+pBBwMvl155ue6WW38cehgWIjTZq/dhdu4CTnLEl01ULRzSa+Bv0J9E4vYi4qN
	 qFodUJ1ikTtI6lD37IX8i2NKMGUdpkbRzCVvBC56n+T8mZLdq1+YH1yGK+sN6WPuia
	 KFKwypHDtSB0jkoMcYJjEE4r2x/PDE+w1bOnModoc/GcjIFMjyHiKNLPTQtGUnFUAJ
	 f73wMZOggXkFTaJwcuWyfzO8POnici7QClk+P68wqu0f5uFUJ8NjOHq28N9abX+liR
	 SUafB8SFp2pkQ==
Date: Wed, 25 Feb 2026 16:23:56 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	Parav Pandit <parav@nvidia.com>, "Bill Mills (bill.mills@linaro.org)" <bill.mills@linaro.org>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, "Edgar E . Iglesias" <edgar.iglesias@amd.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Alex Bennee <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
Message-ID: <frosrzknuslikfaq42346m2lxsntjlg2qevnrhl4w7oa75quc6@yv6kwp3ailx7>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <SJ0PR12MB680610C1B53CA4E8B4470411DC61A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260219185034-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806F703CB616D184FCBE5B3DC68A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <C6374491-FCB1-421F-9273-16B9CB954F5B@arm.com>
 <vigplm62id3vzr3fzekbn5io6qcpeqksgxph6jm4f2qzoripkw@sdh7k6ohw63t>
 <359B0C17-9D57-423A-A229-6CEDA19C975A@arm.com>
 <dyiwq5xhqeoaqmzquzzx4wxsptm6uvrnfgspi6vmcaucq6jn4l@6dvya4te4vsj>
 <20260225051849-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260225051849-mutt-send-email-mst@kernel.org>

On Wed, Feb 25, 2026 at 05:22:32AM -0500, Michael S. Tsirkin wrote:
> On Wed, Feb 25, 2026 at 03:36:36PM +0530, Manivannan Sadhasivam wrote:
> > > > But that being said, I somewhat agree with Parav that we should define the bus
> > > > implementations in the spec to avoid fixing the ABI in the implementations. For
> > > > instance, if we try to use this transport over PCI, we've got questions like:
> > > >
> > > > 1. How the device should be bind to the virtio-msg-pci bus driver and not with
> > > > the existing virtio-pci driver? Should it use a new Vendor ID or Sub-IDs?
> > > 
> > > One bus is appearing as one pci device with its own Vendor ID,
> > > 
> > 
> > What should be the 'own Vendor ID' here?
> > 
> > The existing virtio-pci driver binds to all devices with the Vendor ID of
> > PCI_VENDOR_ID_REDHAT_QUMRANET. So are you expecting the Vendors to use their own
> > VID for exposing the Virtio devices? That would mean, the drivers on the host
> > need update as well, which will not scale.
> > 
> > It would be good if the existing virtio-pci devices can use this new transport
> > with only device side modifications.
> 
> ah maybe i misuderstand. you do not mean do not change drivers.
> you mean a generic driver for everyone?
> 

I actually meant to say that any device that supports virtio-msg-pci transport
should just work without modifying the virtio-msg-pci driver on the host.

> there are several ways to address this in pci
> - use a shared vendor/device id: worked so far reasonably well for virtio.
>   we can allocate a new range of device ids or a new vendor id.
> 

This sounds good to me.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
