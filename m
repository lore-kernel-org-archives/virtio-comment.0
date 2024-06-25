Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DE849656
	for <virtio-comment@lists.linux.dev>; Tue, 25 Jun 2024 09:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719307158; cv=none; b=BJL0X6TB3+H3B+FfOglrr+r73gyScyLF9FiGCL2HpL6dsa2JsfRwiDngb2fKS15kF1Ux8WxVcSpcoaZ+/FC0zL/aNp+YxDhOLaMdNRzrpcNBGUfMQ6xFEbw0skI8jLLsfRRIzVp49dK8g7kHnkMg9zXgHOi1vLlkWGqOcmky80g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719307158; c=relaxed/simple;
	bh=NxbTTQ1vF2V/TgNsj0TwzurpxZl5YHorDJfUtnv4SNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JKQEvZSH4N9XMyZKwefuTRYMxV2F6FcDPxf2+iXzQdl8WTh/mz8EQ+Eiu7RXORuZAaA0T4dd+gpAJCgT+uTSCa0JTpVL0tae5fcHuY/IprVgDCQOuiJ4bqa4q0RKxCdBbuBfEVViO3sUgfPs4L/KWqfiGeHzhXff0c8LuCy/oJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cFqsDYqx; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cFqsDYqx"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1f6a837e9a3so32483665ad.1
        for <virtio-comment@lists.linux.dev>; Tue, 25 Jun 2024 02:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719307157; x=1719911957; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M+Zf8A0nsoaeaqe0PF58AIUkuNPNovQNeFa8eAjOORY=;
        b=cFqsDYqxl/ikn1bVXmQkAzjvPmB33aTZYN2wTOyD6BBP2u0eb1Oee66Zdsnt1XuGrK
         D15I2QShMU1k9U1YKaLun/TKlXD3UiPgIkAO+T9zwgn3UD0H2AuPe7ZjoWxw0NxyWvtE
         ne/1UemsKIXZ31M1ZhulWM48TlYfD7XJ/wldCPhCCl8QDfTsqWf2qoxJ3cndJ7/UonD+
         Zcyl0JLxMiGgMOCi++iZyMue6Ks6nMeJrtLGlOQGXhp06q4Jc70NJsTPDWbkPHxMgDSt
         /woF+vdcSnqBaXa6Qle5fPtWrSezDvXymSJJP5LXoklRHudodWlUPqXnzaZzmaJxOMxZ
         A3Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719307157; x=1719911957;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M+Zf8A0nsoaeaqe0PF58AIUkuNPNovQNeFa8eAjOORY=;
        b=VVTnWcEFaEepvZdBfVa1D72QPWGZ5fd9gA5peHs6r0HTE5xynd/xfT2av5/Eyb1upl
         5tnnyTjfzjAP+9NaRLadx30mIeeu/nXfjdAdAeo+YAfQ6BlhYsRp1ob8oiw6nnT0UmyB
         O3RddsOr/P967za2lxmRoIRjBOcU4hMvxISjcf83WayTZSzUC5fXafnAxVa3EAE7/CM2
         GKP0GydyZos5xKWLv6mfDZ3Yj1rDnnlEkqnMAcl2waw9POx3iyRKKqlPDQx2AF2JSHcO
         TTk4QcSMbwbmE9RiFvU3KUXA1BagL6tD90gA/Ypc5TK30VvhrtKX4T/ryBzDnoEQiGag
         pDgA==
X-Gm-Message-State: AOJu0YxSS1EnOsJdNeFU0sE3a37uxfMMdmO/izavrlltm8SnNYehkMlB
	9rLkIH8x40kHq2yZJSO+cgMR90FyYdzKRIsK3xQcsg9kEHs2jbJ+
X-Google-Smtp-Source: AGHT+IG601rJoTbKg4yR/yArzcvcGmfuyjUA2tNczmwDFZcgvGPzxLPV2mXmkCeeQ/JJNLeAA2Tn1g==
X-Received: by 2002:a17:902:d50b:b0:1f7:3a4:f669 with SMTP id d9443c01a7336-1fa240f30c9mr81245615ad.69.1719307156507;
        Tue, 25 Jun 2024 02:19:16 -0700 (PDT)
Received: from thinkpad ([117.193.213.113])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9ebbc4784sm76476655ad.292.2024.06.25.02.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 02:19:16 -0700 (PDT)
Date: Tue, 25 Jun 2024 14:49:11 +0530
From: Manivannan Sadhasivam <manisadhasivam.linux@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev, mie@igel.co.jp
Subject: Re: MSI for Virtio PCI transport
Message-ID: <20240625091911.GD2642@thinkpad>
References: <20240624161957.GB3179@thinkpad>
 <20240625034025-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240625034025-mutt-send-email-mst@kernel.org>

On Tue, Jun 25, 2024 at 03:52:30AM -0400, Michael S. Tsirkin wrote:
> On Mon, Jun 24, 2024 at 09:49:57PM +0530, Manivannan Sadhasivam wrote:
> > Hi,
> > 
> > We are looking into adapting Virtio spec for configurable physical PCIe endpoint
> > devices to expose Virtio devices to the host machine connected over PCIe. This
> > allows us to use the existing frontend drivers on the host machine, thus
> > minimizing the development efforts. This idea is not new as some vendors like
> > NVidia have already released customized PCIe devices exposing Virtio devices to
> > the host machines. But we are working on making the configurable PCIe devices
> > running Linux kernel to expose Virtio devices using the PCI Endpoint (EP)
> > subsystem.
> > 
> > Below is the simplistic represenation of the idea with virt-net as an
> > example. But this could be extended to any supported Virtio devices:
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
> > While doing so, we faced an issue due to lack of MSI support defined in Virtio
> > spec for PCI transport. Currently, the PCI transport (starting from 0.9.5) has
> > only defined INTx (legacy) and MSI-X interrupts for the device to send
> > notifications to the guest. While it works well for the hypervisor to guest
> > communcation, when a physical PCIe device is used as a Virtio device, lack of
> > MSI support is hurting the performance (when there is no MSI-X).
> > 
> > Most of the physical PCIe endpoint devices support MSI interrupts over MSI-X for
> > simplicity and with Virtio not supporting MSI, falling back to legacy INTx
> > interrupts is affecting the performance.
> > 
> > First of all, INTx requires the PCIe devices to send two MSG TLPs
> > (Assert/Deassert) to emulate level triggered interrupt on the host. And there
> > could be some delay between assert and deassert messages to make sure that the
> > host recognizes it as an interrupt (level trigger). Also, the INTx interrupts
> > are limited to 1 per function, so all the notifications from device has to share
> > this single interrupt (INTA).
> > 
> > On the other hand, MSI requires only one MWr TLP from the device to host and
> > since it is a posted write, there is no delay involved. Also, a single PCIe
> > function can use upto 32 MSIs, thus making it possible to use one MSI vector per
> > virtqueue (32 is more than enough for most of the usecases).
> > 
> > So my question is, why does the Virtio spec not supporting MSI? If there are no
> > major blocker in supporting MSI, could we propose adding MSI to the Virtio spec?
> > 
> > - Mani
> > 
> > -- 
> > மணிவண்ணன் சதாசிவம்
> 
> Yes, it's possible to add - however, you also said EP requires more
> changes from virtio. So maybe we need "virtio over EP" then.

I don't think we need a separate 'Virtio over EP'. EP uses PCI transport, so
'Virtio over PCI' is fine as it is. Just because 'Virtio over PCI' was designed
based on virtual PCI devices exposed by the hypervisor, the real world
limitations were not taken into account. And that's what we are trying to add.

> Let's try to figure out the full list of issues, to see which makes
> more sense.
> 

Sure. But each one would need a separate discussion, that's why I started this
thread for MSI. Let me check with Shunsuke and come up with an exhaustive list.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
