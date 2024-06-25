Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A73314900E
	for <virtio-comment@lists.linux.dev>; Tue, 25 Jun 2024 09:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719306696; cv=none; b=WaZheEB0A0pp0pSRg9/exP3+bkURIII1bnCv84mYSTGwTQMoNs9RllxC/wZ4e0QZ88v2yLCEz2qyAJoSMUiNLYKLIRBfHTSTxY1kAFI+uJaXZNotZbsAzv3uwD46slfeMruY+EwJxqgeKt7PfxG7y2v+EO+uPkP3OuoKOMQgqkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719306696; c=relaxed/simple;
	bh=Em3jsrFFmMCK0twJdKk+KplzkzKYvwAm94y/+/h10dU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CEXc2viNIuEWdO+WdSaDq2vD4p2GKpk4eqSwYpIZUpjP7YFm4R5yjdlHNZmgGITpA3qE/k4JrbzbBjPYL6TQPFsjP9VIK4OXcEJBapqcQ0mOWejaV5dwhe7irSvukkGfrqvpMIOcPSdmHq7MypgfiqjXcAc4wqcPPbpIw6+aizw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Exv4egcR; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Exv4egcR"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1f65a3abd01so42710995ad.3
        for <virtio-comment@lists.linux.dev>; Tue, 25 Jun 2024 02:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719306693; x=1719911493; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hltqsnP1Q1r3Btr++PX+/sQl6isuWPbyJ6DfK5tHXXs=;
        b=Exv4egcRv9F8EgKAQXBxYMjZdGhHArizqzxhrCBogkPyWs/gV2Q2rbrSFDP5UOSJTy
         NhtEuxHXOlh0nPLAU9PF69bWD2Vmkx9z5Cog7tqO5TMXEv0tAU19xJTFw6t3BT49dEJW
         K/aI33Er5aB4dRQ2CS9ugryVdU3mb+FJSZyKvHmfKnY6ASCeb+HCMPRwrfF3j/nw6U+k
         RMNEEjPN1FZ58je8qxoz2v4FfifIVV/PmqlD+2L4Q+nwX5JFj/FsU6/KWbBE0OVPxVLg
         SwVdf4YG2v1sFmUDe29EQ3FNSiAaJw0MSuQNefG+7OAvZzq43m0YM9KFUiW5UWkYo3AJ
         vOhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719306693; x=1719911493;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hltqsnP1Q1r3Btr++PX+/sQl6isuWPbyJ6DfK5tHXXs=;
        b=lhqsCyqoEIxV8pSnYjYe2Lu78Hem/HX/QD3uNBQk7SungkYdd4GZCdJM5lyCGioq1f
         f6NBSgG9/d19bWl+AdxgTLPAtSENFExMvasr787N21VaUP62IbYsd21E9rOouE4jgD+M
         QqkcG5wVMZPa1ZGFhCbxJb3zyyqR7aLlyge9Bb4Q/hRv/MleKC/adiRkVisWi2qAMRHm
         hhBwvc98JeLHnovd99vCbHwys1cTPHH+fJ07qWdklXdwcxVs+mp6sb907FTKt3WGrCgo
         kfo5mOqyCgx6wbZiaf2xo8QCGjvnXt2VNktb3zVVZ7+F/EX0HN1sxFa53M2rbgYjI0ix
         cr3g==
X-Gm-Message-State: AOJu0Yx1jSPsNFTtiU3t8jhnqGOPhM/GPaoTi/FBrVllk6enotQUZhOr
	BM9Zb+RWM+PFeAEcd0/Fs8FJQBdmnBIKIMXCvJC8tJl0vw5z2ymG
X-Google-Smtp-Source: AGHT+IFcIQhrXKROn7Pqj9oPUDIzf2xq0Y/enmXh62unp7Nelsvp1t6YJXh+FBvCzJQshtKBzXz6QA==
X-Received: by 2002:a17:903:32c1:b0:1f9:9768:ea61 with SMTP id d9443c01a7336-1fa23bd1994mr107501455ad.2.1719306693161;
        Tue, 25 Jun 2024 02:11:33 -0700 (PDT)
Received: from thinkpad ([117.193.213.113])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb7d1859sm76298995ad.228.2024.06.25.02.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 02:11:32 -0700 (PDT)
Date: Tue, 25 Jun 2024 14:41:28 +0530
From: Manivannan Sadhasivam <manisadhasivam.linux@gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"mie@igel.co.jp" <mie@igel.co.jp>
Subject: Re: MSI for Virtio PCI transport
Message-ID: <20240625091128.GC2642@thinkpad>
References: <20240624161957.GB3179@thinkpad>
 <PH0PR12MB54812829338B9B950001BA9BDCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240625054346.GA2642@thinkpad>
 <PH0PR12MB54817F3736022FFE3B9C570FDCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PH0PR12MB54817F3736022FFE3B9C570FDCD52@PH0PR12MB5481.namprd12.prod.outlook.com>

On Tue, Jun 25, 2024 at 06:18:46AM +0000, Parav Pandit wrote:
> 
> 
> > From: Manivannan Sadhasivam <manisadhasivam.linux@gmail.com>
> > Sent: Tuesday, June 25, 2024 11:14 AM
> > 
> > On Tue, Jun 25, 2024 at 04:09:07AM +0000, Parav Pandit wrote:
> > > Hi,
> > >
> > > > From: Manivannan Sadhasivam <manisadhasivam.linux@gmail.com>
> > > > Sent: Monday, June 24, 2024 9:50 PM
> > > >
> > > > Hi,
> > > >
> > > > We are looking into adapting Virtio spec for configurable physical
> > > > PCIe endpoint devices to expose Virtio devices to the host machine
> > > > connected over PCIe. This allows us to use the existing frontend
> > > > drivers on the host machine, thus minimizing the development
> > > > efforts. This idea is not new as some vendors like NVidia have
> > > > already released customized PCIe devices exposing Virtio devices to
> > > > the host machines. But we are working on making the configurable
> > > > PCIe devices running Linux kernel to expose Virtio devices using the PCI
> > Endpoint (EP) subsystem.
> > > >
> > > > Below is the simplistic represenation of the idea with virt-net as an
> > example.
> > > > But this could be extended to any supported Virtio devices:
> > > >
> > > >            HOST                                    ENDPOINT
> > > >
> > > > +-----------------------------+
> > > > +-----------------------------+ +-----------------------------+
> > > > |                             |         |                             |
> > > > |         Linux Kernel        |         |         Linux Kernel        |
> > > > |                             |         |                             |
> > > > |                             |         |     +------------------+    |
> > > > |                             |         |     |                  |    |
> > > > |                             |         |     |       Modem      |    |
> > > > |                             |         |     |                  |    |
> > > > |                             |         |     +---------|--------+    |
> > > > |                             |         |               |             |
> > > > |     +------------------+    |         |     +---------|--------+    |
> > > > |     |                  |    |         |     |                  |    |
> > > > |     |     Virt-net     |    |         |     |    Virtio EPF    |    |
> > > > |     |                  |    |         |     |                  |    |
> > > > |     +---------|--------+    |         |     +---------|--------+    |
> > > > |               |             |         |               |             |
> > > > |     +---------|--------+    |         |     +---------|--------+    |
> > > > |     |                  |    |         |     |                  |    |
> > > > |     |    Virtio PCI    |    |         |     | PCI EP Subsystem |    |
> > > > |     |                  |    |         |     |                  |    |
> > > > |     +---------|--------+    |         |     +---------|--------+    |
> > > > | SW            |             |         | SW            |             |
> > > > ----------------|--------------         ----------------|--------------
> > > > | HW            |             |         | HW            |             |
> > > > |     +---------|--------+    |         |     +---------|--------+    |
> > > > |     |                  |    |         |     |                  |    |
> > > > |     |      PCIe RC     |    |         |     |     PCIe EP      |    |
> > > > |     |                  |    |         |     |                  |    |
> > > > +-----+---------|--------+----+
> > > > +-----+---------|--------+----+ +-----+---------|--------+----+
> > > >                 |                                       |
> > > >                 |                                       |
> > > >                 |                                       |
> > > >                 |                PCIe                   |
> > > >                 -----------------------------------------
> > > >
> > > Can you please explain what is PCIe EP subsystem is?
> > > I assume, it is a subsystem to somehow configure the PCIe EP HW
> > instances?
> > > If yes, it is not connected to any PCIe RC in your diagram.
> > >
> > 
> > PCIe EP subsystem is a Linux kernel framework to configure the PCIe EP IP
> > inside an SoC/device. Here 'Endpoint' is a separate SoC/device that is running
> > Linux kernel and uses PCIe EP subsystem in kernel [1] to configure the PCIe
> > EP IP based on product usecase like GPU card, NVMe, Modem, WLAN etc...
> >
> 
> I understood the PCI EP subsystem.
> I didn’t follow it in context of virtio device as you have "virtio EPF".
> 
> > > So how does the MSI help in this case?
> > >
> > 
> > I think you are missing the point that 'Endpoint' is a separate SoC/device that
> > is connected to a host machine over PCIe. 
> Understood.
> 
> > Just like how you would connect a PCIe based GPU card to a Desktop PC. 
> Also understood.
> 
> > Only difference is, most of the PCIe
> > cards will run on a proprietary firmware supplied by the vendor, but here the
> > firmware itself can be built by the user and configurable. And this is where
> > Virtio is going to be exposed.
> >
> This part I read few times, but not understanding.
> 
> A PCI EP can be a virtio or nvme or any device.
> A PCI controller driver in Linux can call devm_pci_epc_create() and implement virtio specific configuration headers.

Right. Although, there is one more component called EPF (Endpoint Function)
driver that implements the header for the device. I didn't go in detail because
I thought that would mislead the discussion. But if you want to know more about
PCI Endpoint subsystem, please take a look at my ELEC presentation:

https://elinux.org/images/3/3a/PCI_Endpoint_drivers_in_Linux_kernel_and_How_to_write_one_.pdf

> Don’t see this anyway related to MSI-X.

MSI/MSI-X is a PCIe endpoint controller (hardware) capability. Based on that,
the PCI EP subsystem will expose those functionalities to the host. But if the
underlying hardware is not supporing MSI-X, then it won't be exposed.

> A PCI controller driver may operate a non virtio SoC device, right?
> 

If you go over my presentation, then you will get the internals of EP
subsystem. According to that, a PCIe endpoint device may expose it as any kind
of device to the host. That behavior is defined by the EPF driver. Currently,
mainline Linux kernel supports a test driver, MHI (Qcom specific), NTB function
drivers. And if Virtio is supported, then there would be a common Virtio driver
together with an usecase specific driver like virt-net, virt-blk etc...

> Are you trying to create a new kind of virtio device that is actually bind to PCI controller driver?
> and if so, it likely needs a new device id as this is the control point of PCIe EP device.
>  

No new Virtio device. We are just trying to expose transitional Virtio devices
like virt-net, virt-blk, virt-console etc... The idea is to just expose these
devices and make use of the existing frontend drivers on the host machine.

Just like how a hypervisor would expose Virtio devices to the guest. Here,
hypervisor is replaced by the PCIe endpoint device running Linux kernel.

> and idea is to consume MSI vectors by this PCI controller driver like updated virtio PCI driver , it looks fine to me.
> 

Yeah, since our devices are supporting MSI only, we want the host side Virtio
stack to make use of it.

> > >
> > > > While doing so, we faced an issue due to lack of MSI support defined
> > > > in Virtio spec for PCI transport. Currently, the PCI transport
> > > > (starting from 0.9.5) has only defined INTx (legacy) and MSI-X
> > > > interrupts for the device to send notifications to the guest. While
> > > > it works well for the hypervisor to guest communcation, when a
> > > > physical PCIe device is used as a Virtio device, lack of MSI support is
> > hurting the performance (when there is no MSI-X).
> > > >
> > > I am familiar with the scale issue of MSI-X, which is better for MSI (relative
> > to MSI-X).
> > > What prevents implementing the MSI-X?
> > >
> > 
> > As I said, most of the devices I'm aware doesn't support MSI-X in hardware
> > itself (I mean in the PCIe EP IP inside the SoC/device). For simple usecases
> > like WLAN, modem, MSI-X is not really required.
> > 
> > > > Most of the physical PCIe endpoint devices support MSI interrupts
> > > > over MSI-
> > > I am not sure if this is true. :)
> > > But not a concern either.
> > >
> > 
> > It really depends on the usecase I would say.
> > 
> Right. And also depends from which side you see it.
> i.e. to see PCIe EP device from RC side or from Linux PCIe EP subsystem side.
>  
> A PCIe EP device does not support MSI-X is confusing term to say,
> Because from a host (server) root complex point of view, which is seeing virtio or nvme PCI device, it is a PCIe EP device.
> 
> Therefore, for simplicity, just say,
> 
> A virtio PCI device does not support MSI interrupt mode.
> And it is useful to support it, that is optimized then MSI-X at lower scale.
> 

Ok, I now get what you are saying. I was describing more from a PCIe endpoint
device point of view.

> > > > X for simplicity and with Virtio not supporting MSI, falling back to
> > > > legacy INTx interrupts is affecting the performance.
> > > >
> > > > First of all, INTx requires the PCIe devices to send two MSG TLPs
> > > > (Assert/Deassert) to emulate level triggered interrupt on the host.
> > > > And there could be some delay between assert and deassert messages
> > > > to make sure that the host recognizes it as an interrupt (level
> > > > trigger). Also, the INTx interrupts are limited to 1 per function,
> > > > so all the notifications from device has to share this single interrupt
> > (INTA).
> > > >
> > > Yes, INTx deprecation is in my list but didn’t get their yet.
> > >
> > > > On the other hand, MSI requires only one MWr TLP from the device to
> > > > host and since it is a posted write, there is no delay involved.
> > > > Also, a single PCIe function can use upto 32 MSIs, thus making it
> > > > possible to use one MSI vector per virtqueue (32 is more than enough for
> > most of the usecases).
> > > >
> > > > So my question is, why does the Virtio spec not supporting MSI? If
> > > > there are no major blocker in supporting MSI, could we propose
> > > > adding MSI to the Virtio spec?
> > > >
> > > MSI addition is good for virtio for small scale devices of 1 to 32.
> > > PCIe EP may support MSI-X and MSI both the capabilities and sw can give
> > preference to MSI when the need is <= 32 vectors.
> > >
> > 
> > PCIe specification only mandates the devices to support either MSI or MSI-X.
> > 
> > Reference: PCIe spec r5.0, sec 6.1.4:
> > 
> > "All PCI Express device Functions that are capable of generating interrupts
> > must support MSI or MSI-X or both."
> >
> I am referring to the last word "both".
> 

But there is an 'or' before 'both', that's what I'm trying to highlight.
Because, there is no necessity for a device to support MSI-X. But current Virtio
Linux driver expects the device to support MSI-X, otherwise falls back to INTx.

>  
> > So MSI-X is clearly an optional feature which simple devices tend to ignore.
> > But if both are supported, then obviously Virtio will make use of MSI-X, but
> > that's not the case here.
> > 
> If both are supported, and required scale by the driver is <=32, driver can choose MSI due to its lightweight nature.
> Why do you say "obviously virtio will make use of MSI-X?" do you mean current code or future code?
> 

Current code:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/virtio/virtio_pci_common.c#n102

The API vp_request_msix_vectors() just requests MSI-X using the flag
PCI_IRQ_MSIX. Because of this, even if the device supports MSI, it won't be used
by Virtio, hence falling back to legacy INTx.

> > > Though I don’t see it anyway related to PCIe EP configuration in your
> > diagram.
> > > In other words, PCI EP subsystem can still work with MSI-X.
> > > Can you please elaborate it?
> > >
> > 
> > I hope the above info clarifies. If not, please let me know.
> > 
> 
> The only part that is not clear to me is, the PCIe EP controller driver is attaching to virtio device or some vendor specific SoC platform device?

I think above justification will clarify this.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
