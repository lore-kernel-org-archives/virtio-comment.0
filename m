Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055FC2D600
	for <virtio-comment@lists.linux.dev>; Tue, 25 Jun 2024 05:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719294234; cv=none; b=hCcTe4ikSNC6h23jQ5dY3I8DhGr/3S3VJumHqXxAXCVorDVsYC92IHL5m8ZwH1fxYykyVlyoF3LtHC7Bw+IB7TKeOUx4EEMyXWXlSv3onIj01T3f4ZRi7Yj340Guw7um/Wbc/3tvp+yM/gs/wNC2oYG7VABhbytYp+gUsxxhvgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719294234; c=relaxed/simple;
	bh=3w0w4JQ5eLE+UQrtWcNgXykXLAiy09Yg/uIJr0hS5DA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CvvpkWrijRCNO8jw93Za1MnnCDpBkJYRN8VOFNkfvZ6Ui5BA2zqtP4E6Lw2GM+ZODvLKfYO8JuD4hYvIN1uCRGLO/IlgnbCAd6jMFrAKS83spX5mU1k9q2VYU9sVkkO93uJNVs/quaW6xYiCTh29uMPIZV91+sdeq1whOFT1nT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ad/TfiGb; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ad/TfiGb"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3d513eb6e56so2826712b6e.0
        for <virtio-comment@lists.linux.dev>; Mon, 24 Jun 2024 22:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719294232; x=1719899032; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=42ErFpg6CIU3TMmLIyEOcVvJAFcpKOmVF8on4qZgrNI=;
        b=ad/TfiGbYELIMKtkXL0Z6nt9SLafnC5P/a9uiBVuv6k/thChvyfLbq/+29dfAH60bL
         4YdNxAYl4nmeetPAbNsDmHDIHi1YwPdansvompx5JA44FhekoxrsQ8kVwHgQb77bMczw
         T59Uv36scM6VmfKWlxVaEl7Mgukui/Zg+fy0JB4b1ZsqMQVOIBRuz8X1WVv+szpc8iCg
         rNCiqcAKlRRB/0XlatEYgAW0HZpDeDlloc60sa0BUsFq43MN7LJnI6JFxBn/ed6xQWE/
         sWXoqFrWEqvsEMCTRuQpCZYNzffUGCQkHtfHj2hQ1laYchmJIj+azBPDJKvElwhH5g8v
         +rug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719294232; x=1719899032;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=42ErFpg6CIU3TMmLIyEOcVvJAFcpKOmVF8on4qZgrNI=;
        b=PLagGgzIbSYqotmGAS3GaT30grLecIRgbNvT8HujIdTFNGjZPzuWD2VySB4kpcTScp
         8A3lIW+XuuExoE/ITbiW3r7Byw3mPlsgjCBsVL77ippA0jWF//zOxGUpSpm3L7PjTC5C
         foz5N/sqheRbQIN1l5Cud7wmNp0m/XCbFGAprc601zkCvZrVdrFsy0+Eip1kIFD/5PNp
         0+4x8j4ltEMXux30Bc+XiKlozUgKEjndHP/UDoG7FmRvb3apXdM9pjYZK6Wolj6e1VeS
         E7674LGnJkQb+ErbiNEIeSZLzTawj90+vWKW7pIg0weiPc3gRmowUPOkZoU0PTelAoOC
         +ljw==
X-Gm-Message-State: AOJu0Yw/KNGKnnsQTHEROGyHJWn1Y+SgHFALoM6g+VcMqIv8zw/72v/f
	3sHNQrkF6KviFjYTHCibXrrPlhx2+zP/uxG0MLERXY/+WV8f7QZN
X-Google-Smtp-Source: AGHT+IH1H6Kvdggrb+e8RrmHwTs+Ylh0CW3ALZL0/pI/J2g/kfv3fJIDVDwpXgo56sGbFCUOe+MRAA==
X-Received: by 2002:a05:6808:1312:b0:3d2:255f:8352 with SMTP id 5614622812f47-3d543a7bc9bmr8385407b6e.4.1719294231396;
        Mon, 24 Jun 2024 22:43:51 -0700 (PDT)
Received: from thinkpad ([117.193.213.113])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7067a098233sm3660122b3a.78.2024.06.24.22.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 22:43:51 -0700 (PDT)
Date: Tue, 25 Jun 2024 11:13:46 +0530
From: Manivannan Sadhasivam <manisadhasivam.linux@gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"mie@igel.co.jp" <mie@igel.co.jp>
Subject: Re: MSI for Virtio PCI transport
Message-ID: <20240625054346.GA2642@thinkpad>
References: <20240624161957.GB3179@thinkpad>
 <PH0PR12MB54812829338B9B950001BA9BDCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PH0PR12MB54812829338B9B950001BA9BDCD52@PH0PR12MB5481.namprd12.prod.outlook.com>

On Tue, Jun 25, 2024 at 04:09:07AM +0000, Parav Pandit wrote:
> Hi,
> 
> > From: Manivannan Sadhasivam <manisadhasivam.linux@gmail.com>
> > Sent: Monday, June 24, 2024 9:50 PM
> > 
> > Hi,
> > 
> > We are looking into adapting Virtio spec for configurable physical PCIe
> > endpoint devices to expose Virtio devices to the host machine connected
> > over PCIe. This allows us to use the existing frontend drivers on the host
> > machine, thus minimizing the development efforts. This idea is not new as
> > some vendors like NVidia have already released customized PCIe devices
> > exposing Virtio devices to the host machines. But we are working on making
> > the configurable PCIe devices running Linux kernel to expose Virtio devices
> > using the PCI Endpoint (EP) subsystem.
> > 
> > Below is the simplistic represenation of the idea with virt-net as an example.
> > But this could be extended to any supported Virtio devices:
> > 
> >            HOST                                    ENDPOINT
> > 
> > +-----------------------------+         +-----------------------------+
> > |                             |         |                             |
> > |         Linux Kernel        |         |         Linux Kernel        |
> > |                             |         |                             |
> > |                             |         |     +------------------+    |
> > |                             |         |     |                  |    |
> > |                             |         |     |       Modem      |    |
> > |                             |         |     |                  |    |
> > |                             |         |     +---------|--------+    |
> > |                             |         |               |             |
> > |     +------------------+    |         |     +---------|--------+    |
> > |     |                  |    |         |     |                  |    |
> > |     |     Virt-net     |    |         |     |    Virtio EPF    |    |
> > |     |                  |    |         |     |                  |    |
> > |     +---------|--------+    |         |     +---------|--------+    |
> > |               |             |         |               |             |
> > |     +---------|--------+    |         |     +---------|--------+    |
> > |     |                  |    |         |     |                  |    |
> > |     |    Virtio PCI    |    |         |     | PCI EP Subsystem |    |
> > |     |                  |    |         |     |                  |    |
> > |     +---------|--------+    |         |     +---------|--------+    |
> > | SW            |             |         | SW            |             |
> > ----------------|--------------         ----------------|--------------
> > | HW            |             |         | HW            |             |
> > |     +---------|--------+    |         |     +---------|--------+    |
> > |     |                  |    |         |     |                  |    |
> > |     |      PCIe RC     |    |         |     |     PCIe EP      |    |
> > |     |                  |    |         |     |                  |    |
> > +-----+---------|--------+----+         +-----+---------|--------+----+
> >                 |                                       |
> >                 |                                       |
> >                 |                                       |
> >                 |                PCIe                   |
> >                 -----------------------------------------
> > 
> Can you please explain what is PCIe EP subsystem is?
> I assume, it is a subsystem to somehow configure the PCIe EP HW instances?
> If yes, it is not connected to any PCIe RC in your diagram.
> 

PCIe EP subsystem is a Linux kernel framework to configure the PCIe EP IP inside
an SoC/device. Here 'Endpoint' is a separate SoC/device that is running Linux
kernel and uses PCIe EP subsystem in kernel [1] to configure the PCIe EP IP
based on product usecase like GPU card, NVMe, Modem, WLAN etc...

[1] https://docs.kernel.org/PCI/endpoint/pci-endpoint.html

> So how does the MSI help in this case?
> 

I think you are missing the point that 'Endpoint' is a separate SoC/device that
is connected to a host machine over PCIe. Just like how you would connect a PCIe
based GPU card to a Desktop PC. Only difference is, most of the PCIe cards will
run on a proprietary firmware supplied by the vendor, but here the firmware
itself can be built by the user and configurable. And this is where Virtio is
going to be exposed.

> 
> > While doing so, we faced an issue due to lack of MSI support defined in Virtio
> > spec for PCI transport. Currently, the PCI transport (starting from 0.9.5) has
> > only defined INTx (legacy) and MSI-X interrupts for the device to send
> > notifications to the guest. While it works well for the hypervisor to guest
> > communcation, when a physical PCIe device is used as a Virtio device, lack of
> > MSI support is hurting the performance (when there is no MSI-X).
> > 
> I am familiar with the scale issue of MSI-X, which is better for MSI (relative to MSI-X).
> What prevents implementing the MSI-X?
> 

As I said, most of the devices I'm aware doesn't support MSI-X in hardware
itself (I mean in the PCIe EP IP inside the SoC/device). For simple usecases
like WLAN, modem, MSI-X is not really required.

> > Most of the physical PCIe endpoint devices support MSI interrupts over MSI-
> I am not sure if this is true. :)
> But not a concern either.
> 

It really depends on the usecase I would say.

> > X for simplicity and with Virtio not supporting MSI, falling back to legacy INTx
> > interrupts is affecting the performance.
> > 
> > First of all, INTx requires the PCIe devices to send two MSG TLPs
> > (Assert/Deassert) to emulate level triggered interrupt on the host. And there
> > could be some delay between assert and deassert messages to make sure
> > that the host recognizes it as an interrupt (level trigger). Also, the INTx
> > interrupts are limited to 1 per function, so all the notifications from device
> > has to share this single interrupt (INTA).
> > 
> Yes, INTx deprecation is in my list but didn’t get their yet.
> 
> > On the other hand, MSI requires only one MWr TLP from the device to host
> > and since it is a posted write, there is no delay involved. Also, a single PCIe
> > function can use upto 32 MSIs, thus making it possible to use one MSI vector
> > per virtqueue (32 is more than enough for most of the usecases).
> > 
> > So my question is, why does the Virtio spec not supporting MSI? If there are
> > no major blocker in supporting MSI, could we propose adding MSI to the
> > Virtio spec?
> > 
> MSI addition is good for virtio for small scale devices of 1 to 32.
> PCIe EP may support MSI-X and MSI both the capabilities and sw can give preference to MSI when the need is <= 32 vectors.
> 

PCIe specification only mandates the devices to support either MSI or MSI-X.

Reference: PCIe spec r5.0, sec 6.1.4:

"All PCI Express device Functions that are capable of generating interrupts must
support MSI or MSI-X or both."

So MSI-X is clearly an optional feature which simple devices tend to ignore. But
if both are supported, then obviously Virtio will make use of MSI-X, but that's
not the case here.

> Though I don’t see it anyway related to PCIe EP configuration in your diagram.
> In other words, PCI EP subsystem can still work with MSI-X.
> Can you please elaborate it?
> 

I hope the above info clarifies. If not, please let me know.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
