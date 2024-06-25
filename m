Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7C514658B
	for <virtio-comment@lists.linux.dev>; Tue, 25 Jun 2024 07:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719301964; cv=none; b=k8MwsdxmqsAEVqSrMu7UJ6GOtrrHWVQHGb4oTyVTaDzc0n4mha3CX2mpNRWcLR9MoDY/tIb97ICugTy5DvVSFQLNkh0JYZogKnsK+UAmKHPWCqBZV3XrFvfZaEOR1xq0nNXvHZlumzCADdWAJrF/3FakwvqUkeKfDN4ZJpYmzi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719301964; c=relaxed/simple;
	bh=Zs0ZwCrBNfrh4Btz2uYHwezg5QyklD29J6nkI4k56sE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Vd8niLApPzTpodgM+ewGU6HgJ/XS4uMignZCYTjldtpao/DRFqVBuaoG4LeZ6dlCOxU6E0uEqFgITAiof8mv6Dh2uA+mAeZ6rx3Is+p/oICk5KGPNQx7VUgcgQKhlQ83XC/2YSiPUoIgNcGeBXcjiBfC4Q44T28NnRNHlqL7tJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gWDNynI+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gWDNynI+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719301961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YfNOi3we0XliKc2QjTGHgG7W0hBFh6+LLMcAJb5MTlM=;
	b=gWDNynI+xLuW2LZtIuXqunaWNK66kM0mRP263lBDpi3amlXlXSEGvbHD1PiFloaxDTcTRG
	kZy+VGgSRpvbZ5RofBu/SRbXohve4ZOM4/3OW5I/5XHVpu46Wn8nYXoy0yuwss/PX94VQY
	zzv4UaHLRFyUq24+06ixgkGU5KG2uOg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-xixkjpd9NB2s71j5PE3zrw-1; Tue, 25 Jun 2024 03:52:36 -0400
X-MC-Unique: xixkjpd9NB2s71j5PE3zrw-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-42488bec55cso13157335e9.0
        for <virtio-comment@lists.linux.dev>; Tue, 25 Jun 2024 00:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719301955; x=1719906755;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YfNOi3we0XliKc2QjTGHgG7W0hBFh6+LLMcAJb5MTlM=;
        b=rHijh/a+qRScTg3EQnJsmXlq1lEhdNqVvnEAa2uu8q/3Ynqr51zKJR/N8LDKWJaY+b
         rxZ0d0Dp910UpS5n2kod+OSkuL5g9Oq3unGCIrZ7uBe5l+28C/50AMqpB5yrkqCNu7Yz
         mM+Wd/5igkpRhlU8Fo0Pjn1YUsW4m1QX+G61JRxph2/EZYJMYlxx2w7oXpnJWWUZEZva
         DzSfvr5Hu5pr5o/5ercRNtCtzfbsvaEcwc5s7fPiK/xKgSgCBKdl1kLeOORA8REtMWSE
         /EhIV4Mi/jhE0yag831w04AYZwVbC1/wovZItex5NIqmxs0kxJMDGNPv9MV+Amtpu9i0
         C1XA==
X-Gm-Message-State: AOJu0YyCiLVHrCbJ1alxDLmz8V/QMEcLiGDn2uC910tRECMcuLBnYxed
	59wY1VCcqY1qoX4GthlmVv0AtwtaV1azRr3/RHhd/WclPsh0gocIbocw9iK1K0QRg3AXMdCTeq+
	mRSi8wcTdWhdsUsJNRbtfuTLMCtbjBOP/BbiwF5KIaTGCMFQ43dhHsz+42tqFyROvQdVQhnrw
X-Received: by 2002:a05:600c:1604:b0:424:7443:e6d8 with SMTP id 5b1f17b1804b1-424895dad6dmr68876325e9.9.1719301955213;
        Tue, 25 Jun 2024 00:52:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGUXnPYdIdLcytpyER8BHjyFZ53NiPqp+6jnCq7z+HcAuHGQAQ4g5U6/GzvXn/jH2WmFFtqw==
X-Received: by 2002:a05:600c:1604:b0:424:7443:e6d8 with SMTP id 5b1f17b1804b1-424895dad6dmr68876065e9.9.1719301954502;
        Tue, 25 Jun 2024 00:52:34 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:342:f1b5:a48c:a59a:c1d6:8d0a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0b634asm201768775e9.1.2024.06.25.00.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 00:52:33 -0700 (PDT)
Date: Tue, 25 Jun 2024 03:52:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Manivannan Sadhasivam <manisadhasivam.linux@gmail.com>
Cc: virtio-comment@lists.linux.dev, mie@igel.co.jp
Subject: Re: MSI for Virtio PCI transport
Message-ID: <20240625034025-mutt-send-email-mst@kernel.org>
References: <20240624161957.GB3179@thinkpad>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240624161957.GB3179@thinkpad>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Jun 24, 2024 at 09:49:57PM +0530, Manivannan Sadhasivam wrote:
> Hi,
> 
> We are looking into adapting Virtio spec for configurable physical PCIe endpoint
> devices to expose Virtio devices to the host machine connected over PCIe. This
> allows us to use the existing frontend drivers on the host machine, thus
> minimizing the development efforts. This idea is not new as some vendors like
> NVidia have already released customized PCIe devices exposing Virtio devices to
> the host machines. But we are working on making the configurable PCIe devices
> running Linux kernel to expose Virtio devices using the PCI Endpoint (EP)
> subsystem.
> 
> Below is the simplistic represenation of the idea with virt-net as an
> example. But this could be extended to any supported Virtio devices:
> 
>            HOST                                    ENDPOINT           
> 
> +-----------------------------+         +-----------------------------+
> |                             |         |                             |
> |         Linux Kernel        |         |         Linux Kernel        |
> |                             |         |                             |
> |                             |         |     +------------------+    |
> |                             |         |     |                  |    | 
> |                             |         |     |       Modem      |    |
> |                             |         |     |                  |    |
> |                             |         |     +---------|--------+    |
> |                             |         |               |             |
> |     +------------------+    |         |     +---------|--------+    |
> |     |                  |    |         |     |                  |    |
> |     |     Virt-net     |    |         |     |    Virtio EPF    |    |
> |     |                  |    |         |     |                  |    |
> |     +---------|--------+    |         |     +---------|--------+    |
> |               |             |         |               |             |
> |     +---------|--------+    |         |     +---------|--------+    |
> |     |                  |    |         |     |                  |    |
> |     |    Virtio PCI    |    |         |     | PCI EP Subsystem |    |
> |     |                  |    |         |     |                  |    |
> |     +---------|--------+    |         |     +---------|--------+    |
> | SW            |             |         | SW            |             |
> ----------------|--------------         ----------------|--------------
> | HW            |             |         | HW            |             |
> |     +---------|--------+    |         |     +---------|--------+    |
> |     |                  |    |         |     |                  |    |
> |     |      PCIe RC     |    |         |     |     PCIe EP      |    |
> |     |                  |    |         |     |                  |    |
> +-----+---------|--------+----+         +-----+---------|--------+----+
>                 |                                       |               
>                 |                                       |               
>                 |                                       |               
>                 |                PCIe                   |               
>                 -----------------------------------------               
> 
> While doing so, we faced an issue due to lack of MSI support defined in Virtio
> spec for PCI transport. Currently, the PCI transport (starting from 0.9.5) has
> only defined INTx (legacy) and MSI-X interrupts for the device to send
> notifications to the guest. While it works well for the hypervisor to guest
> communcation, when a physical PCIe device is used as a Virtio device, lack of
> MSI support is hurting the performance (when there is no MSI-X).
> 
> Most of the physical PCIe endpoint devices support MSI interrupts over MSI-X for
> simplicity and with Virtio not supporting MSI, falling back to legacy INTx
> interrupts is affecting the performance.
> 
> First of all, INTx requires the PCIe devices to send two MSG TLPs
> (Assert/Deassert) to emulate level triggered interrupt on the host. And there
> could be some delay between assert and deassert messages to make sure that the
> host recognizes it as an interrupt (level trigger). Also, the INTx interrupts
> are limited to 1 per function, so all the notifications from device has to share
> this single interrupt (INTA).
> 
> On the other hand, MSI requires only one MWr TLP from the device to host and
> since it is a posted write, there is no delay involved. Also, a single PCIe
> function can use upto 32 MSIs, thus making it possible to use one MSI vector per
> virtqueue (32 is more than enough for most of the usecases).
> 
> So my question is, why does the Virtio spec not supporting MSI? If there are no
> major blocker in supporting MSI, could we propose adding MSI to the Virtio spec?
> 
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்

Yes, it's possible to add - however, you also said EP requires more
changes from virtio. So maybe we need "virtio over EP" then.
Let's try to figure out the full list of issues, to see which makes
more sense.


