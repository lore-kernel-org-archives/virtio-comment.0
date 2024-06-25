Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE21A1487C3
	for <virtio-comment@lists.linux.dev>; Tue, 25 Jun 2024 08:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719304171; cv=none; b=UuaIKYFNEQx4OjTE/2wx5ooOAg+eZjtKgg0+Hm9GMmJsRmoZj39990yIrK+2Q9YhnHSwHDe6yxjMNgqawHtSh43Q1KLJz6KoYTf1kSPR2+sJX7S3k/oohGH8hcga/AOSvLdbQlNBxaY9EGkR7AMCIjRn1uueHUUZlIK98akgzKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719304171; c=relaxed/simple;
	bh=F83FPrMMO7L9/bPCY8hrB3yNccbYVkZSSqxWo5UmEVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=rCT6S0ZAz12lfFuKbFhXU0SqhW6i+Gmpcd1UMycqprpAlLkAmFCMVolmwvuZ6utsDh55eNbxHcJN817eozB/ua9z0FlX2GHLyfx5EvaulvG5f+awJlZXHNNSDOVoIu0eeQ0lGDMaPnSddkSqBcV5KNcWaDs/ZUPEc3RlWAM3LUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Op+gHyxe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Op+gHyxe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719304168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SyF9v10UxgReMoySPpNU7LZDbf8sJsyrMqVydMKvVNw=;
	b=Op+gHyxeaIQIMI5G3P2QzlYiguF5ujgDTZkiA0Xko/XfY7rBOHiD35EX8TOmDQIcpjQo8Q
	TgwQlR0R+ygMtGL4KRq1mSsCDYycFbnLT6vsBOnCmYdd+VTaygL2CTRaW5bgOt5JQwYyiE
	xzSh0Xep8rneLVfvukAWjeNIjn7Gcro=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-7ZU7Wg-dPWeB9nfa2R1HjA-1; Tue, 25 Jun 2024 04:29:26 -0400
X-MC-Unique: 7ZU7Wg-dPWeB9nfa2R1HjA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-42183fdd668so34750975e9.2
        for <virtio-comment@lists.linux.dev>; Tue, 25 Jun 2024 01:29:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719304165; x=1719908965;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SyF9v10UxgReMoySPpNU7LZDbf8sJsyrMqVydMKvVNw=;
        b=uRTLz7yXIZ9a+NKG498OIOY986e/jG9DeedzX+ztDJQ2FsaxA99JM+ka1JDn2XDl7i
         RmVaikXNcdIF3+ZIbKnixNTCzkiH5LrEyfdJoNG8XoGteQ6Glw/8Q7z9bKy1nKHPNkTx
         538IOROU3fRIDjN/Q9C2sRMU30hSGHQmvplGIyY7QxLcDnuhODmPOv2vlzbNreZh0yVX
         oL77NJPLCw9Gy7zzVMPGY6ulOlh5hdcC2Y/1v3PVBESUmBa2xLcpRagUh07uyRtCay2c
         0z+BuItlqLwxQijde3wnqV/+HrNdGZI+Kxqk0l7N5pb9d/avMtYw+JZpPpuM4O9zks4f
         fSKA==
X-Forwarded-Encrypted: i=1; AJvYcCW8NXN8KzObrLkZLnMPPG5++yafmCbhDbrdnJL4rRnxpwr/ZRCTCHN5fZovFFPHNl52yS3kFTFV0/ZZFX2gIwrfoOnToqo7pVIGLUihu8I=
X-Gm-Message-State: AOJu0YwhO6B2yZH5rfIb9Umv+Kqss7NG4MWtYoKZlxOOmqvQVNlGP+zL
	VVlHMhyTxdCjCNiSqGzZDXg0tpjBq7LkXkD9Bgpfj2fMQVCrXQVkVRxW5l1yggCKptrI1UqOCVX
	28y4FJlm/rXWvIVWu+p098YpM2jO/VOLC/2eZrMQpL3BGFSyt33lVpHFD/akmI9Ojbsw+kkpK
X-Received: by 2002:a05:600c:3798:b0:424:a59c:1050 with SMTP id 5b1f17b1804b1-424a59c118bmr4227215e9.29.1719304164989;
        Tue, 25 Jun 2024 01:29:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuzp5ZLvBNXtcjEKZNqBaJGJLobA0hfiUG5MPBWSzIzmGLs+bAPZnInzPJBD9Yb2wY34V8Dg==
X-Received: by 2002:a05:600c:3798:b0:424:a59c:1050 with SMTP id 5b1f17b1804b1-424a59c118bmr4226965e9.29.1719304164305;
        Tue, 25 Jun 2024 01:29:24 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:342:f1b5:a48c:a59a:c1d6:8d0a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42481910d5csm169207965e9.36.2024.06.25.01.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 01:29:23 -0700 (PDT)
Date: Tue, 25 Jun 2024 04:29:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Manivannan Sadhasivam <manisadhasivam.linux@gmail.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"mie@igel.co.jp" <mie@igel.co.jp>
Subject: Re: MSI for Virtio PCI transport
Message-ID: <20240625042318-mutt-send-email-mst@kernel.org>
References: <20240624161957.GB3179@thinkpad>
 <PH0PR12MB54812829338B9B950001BA9BDCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240625054346.GA2642@thinkpad>
 <PH0PR12MB54817F3736022FFE3B9C570FDCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240625035343-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481F6B84ABAF617B0571242DCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240625040729-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D98A78FB4650F9024E1CDCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481D98A78FB4650F9024E1CDCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 25, 2024 at 08:18:03AM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Tuesday, June 25, 2024 1:40 PM
> > 
> > On Tue, Jun 25, 2024 at 08:00:45AM +0000, Parav Pandit wrote:
> > >
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Tuesday, June 25, 2024 1:25 PM
> > > > To: Parav Pandit <parav@nvidia.com>
> > > > Cc: Manivannan Sadhasivam <manisadhasivam.linux@gmail.com>; virtio-
> > > > comment@lists.linux.dev; mie@igel.co.jp
> > > > Subject: Re: MSI for Virtio PCI transport
> > > >
> > > > On Tue, Jun 25, 2024 at 06:18:46AM +0000, Parav Pandit wrote:
> > > > > > So MSI-X is clearly an optional feature which simple devices tend to
> > ignore.
> > > > > > But if both are supported, then obviously Virtio will make use
> > > > > > of MSI-X, but that's not the case here.
> > > > > >
> > > > > If both are supported, and required scale by the driver is <=32,
> > > > > driver can
> > > > choose MSI due to its lightweight nature.
> > > >
> > > > Unlikely, MSI vectors are tricky to mask and this is a problem for
> > > > interrupt balancing. So MSIX is better for performance even if the # of
> > vectors is low.
> > > Masking to my knowledge is not used by MSIX.
> > 
> > There's a mask bit per vector, yes.
> > 
> > > Didn't follow how MSIX helps with performance.
> > 
> > Linux uses mask/change/unmask to balance interrupts between CPUs.
> > *That* is important for performance.
> Ah, I see, didn't know this.
> Frequently reprogramming the mask in device is expensive and also requires synchronization to not miss the interrupt.
> In case if you have pointer to the Linux code please share.


static inline void pci_msix_mask(struct msi_desc *desc)
{
        desc->pci.msix_ctrl |= PCI_MSIX_ENTRY_CTRL_MASKBIT;
        pci_msix_write_vector_ctrl(desc, desc->pci.msix_ctrl);
        /* Flush write to device */
        readl(desc->pci.mask_base);
}

and

static inline void pci_write_msg_msix(struct msi_desc *desc, struct msi_msg *msg)
{
        void __iomem *base = pci_msix_desc_addr(desc);
        u32 ctrl = desc->pci.msix_ctrl;
        bool unmasked = !(ctrl & PCI_MSIX_ENTRY_CTRL_MASKBIT);

        if (desc->pci.msi_attrib.is_virtual)
                return;
        /*
         * The specification mandates that the entry is masked
         * when the message is modified:
         * 
         * "If software changes the Address or Data value of an
         * entry while the entry is unmasked, the result is
         * undefined."
         */
        if (unmasked)
                pci_msix_write_vector_ctrl(desc, ctrl | PCI_MSIX_ENTRY_CTRL_MASKBIT);

        writel(msg->address_lo, base + PCI_MSIX_ENTRY_LOWER_ADDR);
        writel(msg->address_hi, base + PCI_MSIX_ENTRY_UPPER_ADDR);
        writel(msg->data, base + PCI_MSIX_ENTRY_DATA);
        
        if (unmasked)
                pci_msix_write_vector_ctrl(desc, ctrl);

        /* Ensure that the writes are visible in the device */
        readl(base + PCI_MSIX_ENTRY_DATA);
}


both do this.


> A while back, I recollect seeing reprogramming done by the IOAPIC at the interrupt table level within the cpu (without involving the device) to forward to different cpu.

AFAIK MSI goes to lapic not to ioapic. I might be confused though.

> > 
> > 
> > > The benefit of MSI is it does not need to store addr+data pair per vector.
> > 
> > The addr/data thing wasn't invented just to make hardware costs go up.
> >
> I am aware of it. :)
> I will let other non virtio forums finish their ongoing optimization work in this area to reduce hardware costs.

Absolutely.

-- 
MST

