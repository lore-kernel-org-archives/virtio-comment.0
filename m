Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982A836C5A1
	for <virtio-comment@lists.linux.dev>; Mon, 10 Aug 2026 06:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786341604; cv=none; b=u+vYTUt68AcctkaEm7EzU7BnX9FPAUr6rmW3lracKpf9q02PJiVa5CpvPhXjXHHAc3+6JVRweIvIZGSAzrlBUe3a9ehBM3m01kD1QYeRja2oQNSxFdm06uXReM6ASvmn7bpWUPGvxnezTO4/GMcb3EdSgDVRlwRFrX9l2325Gh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786341604; c=relaxed/simple;
	bh=uKDOqq+pbnLFR7iRD1StRcwMImIkHPkTVoqQRKnooeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=CtayW6vpKo8gsEBWq5XdyHhXr22Gbtx/wfR7b0sZ3NhXXhsuwCUDgAG0wk0IqmnRQXFXMRbj18nZnVsqgZKXYKe4tq+W/q9w+ZypkpD3ACll+PICdXSaZJQipfI0VGf1YUS2nAu8zqFVoZsokSBSaN8oR6kI2+mVINQKfcBsLZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cZuf/u0I; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cZuf/u0I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786341601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TS85GEtnMYF2CM0IYs1PFu/PkwKWXl0OsH3bC3yl15U=;
	b=cZuf/u0ILXiZEDhEftKMLgW6k/TRVpcXANP6Pp9uVaZ7GOyIxyXHEgccKK6LuXH7jUqwek
	F4LZtbHDejINcVX5Ro3IDUnlOmG8kIQhYW+n1XcPp9GSRuUOQGWTmbQs1ZJRSyU+0DjvL1
	VugrV1PqOZlRBtHBeZMEiAJXd5SMBFs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-g1QnZeOBPFy4LFp9mrwbwA-1; Mon, 10 Aug 2026 02:00:00 -0400
X-MC-Unique: g1QnZeOBPFy4LFp9mrwbwA-1
X-Mimecast-MFC-AGG-ID: g1QnZeOBPFy4LFp9mrwbwA_1786341599
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-473ac08a6a4so986884f8f.0
        for <virtio-comment@lists.linux.dev>; Sun, 09 Aug 2026 22:59:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786341599; x=1786946399;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TS85GEtnMYF2CM0IYs1PFu/PkwKWXl0OsH3bC3yl15U=;
        b=etS5JIBbPSYMUjAyVjojDzNMEYkLsAVeJQ2xuZZg1ZoCi/W3BfNCqqMQ6qSg/YCjtG
         /6dcdAwYdvk4+UFKZK4qPvwspB4FBAfT2m4BEhtZNSs3nbhMotIukETqaDRQLDSGtbsk
         WkCfr5eFxhvTittAeZ6BxOi5xWSj3pLLYftX3xKlYjmdLnqXTSgfy1KOK2fWsj0mP4FT
         pwBFcTjnchENeI3+NyQvlbK6qTMjX73sywXYNpAvR+vK7/utOh51nbcmLjFbVXHNdW3B
         tNxx5sDmlB9j340nsZ5t4SjsY8iWeFprpLf1buVgetjyXUypxq2m2Dc2fWIrD0Z2W0Di
         l+XQ==
X-Forwarded-Encrypted: i=1; AHgh+RqBUg91I8WqxMT8IFOY1t9MldvjyZ36YlJrp7m6G+S79N+6DvEZhjj4Tq8PP2+W1elYkY5i+VNAm1tri0P95g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/r1woAhrx5xl2LWYiJnzUY+9VdNU6p5DTlueHqW5xhGi2u+Yu
	QUw/CnbGrKlv4Qk7DttC0+I9gfQ4gpVl4SYsVxnHfx4V7p2JfWRz+qOdhblWEuvx+/d4/EOFb/8
	vj02zmnA5I0lOXbGYqqSD4FxTR1OUyk8Igs+a3JtPArUAzjlIUMCDA039i91YcKE2Qixa
X-Gm-Gg: AR+sD11TWYR7cQk3Zgg50ly7hFKbY3yycpbymWELTbdkTUkKxSqG82/Zt/Vh82UlVpP
	fTogeXId9IbVA7Vsr9kw7GZSDizS41V0rT9bke/xPUykrWFzRQ6DiSIRmW3BvmKu8SOUc+fA3hl
	3557UhiBaVHe2j+WDhpT7sDvY7FKnMTV1uAorIJxBqAjvBgcAHmZu8d+0ROVP48Rz2E/6TQGEL3
	cxAkAECxR7izdplaa6YCWPFxKgU3+8EIB7Irqrolc8bpeHby0EgGLBwc04/lchGSNqeKvXV+syz
	FG1pBPqR9Is4d6ZlN5H2Fek3YRuJGq3rMlY4vW/kwOmdhYMOLgYuFO3xRzqPL7LlmpB+qn0fHgs
	oGRSdjcfqaiM/YMIBJyI2Gw==
X-Received: by 2002:a05:600c:4f52:b0:498:2b1f:e0c6 with SMTP id 5b1f17b1804b1-49961b8652dmr194198735e9.18.1786341598650;
        Sun, 09 Aug 2026 22:59:58 -0700 (PDT)
X-Received: by 2002:a05:600c:4f52:b0:498:2b1f:e0c6 with SMTP id 5b1f17b1804b1-49961b8652dmr194198015e9.18.1786341598129;
        Sun, 09 Aug 2026 22:59:58 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-39-98.inter.net.il. [80.230.39.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995421934asm387121165e9.5.2026.08.09.22.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 22:59:57 -0700 (PDT)
Date: Mon, 10 Aug 2026 01:59:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Alexander Graf <graf@amazon.com>, virtio-comment@lists.linux.dev,
	Jason Wang <jasowangio@gmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3] Add VIRTIO_F_DMB (Device Memory Buffer)
Message-ID: <20260810015206-mutt-send-email-mst@kernel.org>
References: <20260716215426.46037-1-graf@amazon.com>
 <20260804161202.38619-1-graf@amazon.com>
 <044ee495-d958-4c91-9627-da4ce591e737@gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <044ee495-d958-4c91-9627-da4ce591e737@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oPttWeHPfYEUTWw5R0FG4UYXOTDX_G7Ixr9fNP92ex4_1786341599
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 06, 2026 at 12:09:04PM -0400, Demi Marie Obenour wrote:
> On 8/4/26 12:12, Alexander Graf wrote:
> > When a transport uses a shared bounce region for virtqueue memory today,
> > that region is global and shared by multiple devices at once. Devices
> > then contend over one small region, so a busy device can starve the
> > others, and one device's emulation cannot be isolated or torn down on its
> > own because its state lives in memory everyone else is using too.
> > 
> > VIRTIO_F_DMB gives each device its own shared memory region, the Device
> > Memory Buffer, that holds that device's virtqueues (Descriptor, Driver
> > and Device Areas) and the buffers the descriptors reference. When the
> > feature is negotiated, every address the driver places in a virtqueue is
> > an offset into that region rather than a physical or bus address, so the
> > device only ever touches memory the driver placed there. Because each
> > device owns its region, its emulation can run in a separate host process
> > and be terminated independently, and devices no longer contend over one
> > shared region.
> > 
> > The device reports the region's shmid through a transport-specific
> > mechanism (dmb_shm_id in the PCI common configuration structure, DMBSHMId
> > on MMIO), so the shmid does not collide with device-specific or future
> > transport-specific shared memory regions. The driver locates the region
> > through the existing Shared Memory Regions facility. VIRTIO_F_DMB refines
> > VIRTIO_F_ACCESS_PLATFORM and is negotiated only together with it.
> > 
> > To provide the confinement guarantee, the device bounds-checks every
> > driver-supplied offset against the region and sets DEVICE_NEEDS_RESET on
> > violation.
> > 
> > The general requirement on shared memory regions forbids a device to
> > expose a region used to control its operation or to stream data, and a
> > Device Memory Buffer is used for both, so it is named as that
> > requirement's exception.
> > 
> > The Device Memory Buffer is memory the driver shares with the device on
> > platforms that distinguish shared from private mappings, and the device
> > provides coherency without cache maintenance by the driver. A device
> > that requires the platform's barriers offers VIRTIO_F_ORDER_PLATFORM,
> > and a driver accepts VIRTIO_F_DMB only together with it. Offset 0 in
> > the region is reserved: a device that predates the feature reads a
> > Descriptor Area address of 0 as a queue that is not in use, as the
> > legacy QueuePFN register states.
> 
> I think this is going to be a prerequisite for strongly isolating
> vhost-user backends (so they can't compromise the frontend)

compromise the frontend how?

> while
> maintaining high performance.  One can use shadow virtqueues, but
> this will add extra round-trips.

At the cost of guest bouncing all data around each time it
moves between devices? Let's say, this is not a fit for
all use-cases. A more universal approach would allow data
in a pool shared by a group of devices.


But I guess at that point, why don't we just invent a virtio iommu
command to describe all this? We don't really need a special device
mode just to limit access to guest memory.



So Alex, now I'd like to know what exactly is the actual use-case,
because if it's not really on-device memory, there are better
ways to do it.



-- 
MST

