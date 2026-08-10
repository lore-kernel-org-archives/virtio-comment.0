Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EF437BE64
	for <virtio-comment@lists.linux.dev>; Mon, 10 Aug 2026 08:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786349996; cv=none; b=u8KudRhNLRTWh0CNjIcRw4rYJqpy6/xESXuDvVP4j5UZNq0JR57QIvw9RY3bRmYbnuALJFt0f7XECF9FDeWok4jWHy72lAlYReQr5/1bugltS19iMy9/oMTlOUXCq3lnjEqKESeH1rLsao7Ob+mIy+k3ZodWPsttXDbPFEEdtEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786349996; c=relaxed/simple;
	bh=4RCJpNalDSnjD7eRiGghw3r6Y9Dpe142LhJTGystyhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=gKjheSg+YCtoCxEtwgifVjrSxB9QQziltljxLhFe1Qu/jwCUNArK1Y2Q6ln4PhZmQ0/WD9/5M0jyOy2zdPXqFHPPirU/jthy8h/YZn+8gYFMpRB7G1Nnaeg9YFUPqA9Wms/Y95MIRnLK9oA7+cPC0MkMcvBMGRjvjZTpH8fXDF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T03u3bVE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T03u3bVE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786349993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BK4sK3Jc3xdWFvZyKExLaTpSHRRvwjd3Jm3P7dfmwX4=;
	b=T03u3bVEb965UevS+XRo+OwXruCFUznK/DmClZD4WdZ2KJ7Cmi4z+sfYUJEa1NbJD6iW8G
	DOKT9XijRr5gQN7jkspiYzHjUzYI3pyK9oiYbthEtfl6bg0VlC47VDVlVstqYCPsIMfSEQ
	XAxSbA7CNwCMu3Rwq5L52/acfDm0KZw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-161-O_JOL7cePxypKmL6HgwBUw-1; Mon, 10 Aug 2026 04:19:52 -0400
X-MC-Unique: O_JOL7cePxypKmL6HgwBUw-1
X-Mimecast-MFC-AGG-ID: O_JOL7cePxypKmL6HgwBUw_1786349991
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-47f8398ed9fso1378628f8f.0
        for <virtio-comment@lists.linux.dev>; Mon, 10 Aug 2026 01:19:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786349991; x=1786954791;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BK4sK3Jc3xdWFvZyKExLaTpSHRRvwjd3Jm3P7dfmwX4=;
        b=OLccHh1YPzePF1HAaYO3W+5yIFmcZaAbao5hvGXS2tteDMwEnzS61LylESGG+OK1eB
         ZCc9R6b1h/Ung1Zu9HMEuouxxf6ipDkDXgQSjZ3rpJFFEVtjSbK798G1nwaDfHUYa8Ww
         TtGGbq/afV+R1mB/93BWzTX9q2o2yJ9c5UX6CUOOM/cFudp5iGj+Il5H8Kg1IYYYKdO8
         JvoK3H3Ept8XFgg/sOUfONzIijGhNRpBtNmpnREy+vYqcJzm4CIqF71K5D4KdhtbvIO2
         mus9MAOZCOrZj8v2X0hoJNyk1bN+laCf3md/YkpdLmGE7kkMp0VxmqX7FpFiixWqP+hw
         Mfew==
X-Forwarded-Encrypted: i=1; AHgh+RqgllsTblNyONkaDUY1HPlN9IFGwCaJPMWnblU+wHAC/b/X3ahOCfSJT+H/cUh7+25T5JR8v5HZeEK5poxQgg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1sI3jTGNh3KXs1zOClU8CYfR6kuCM1nqE8BfWWyhldE5pEa/Z
	0MYkJwgVTjy8UtERHzGbArfCRVfLBWgoCgX71k3MQSgkQeaeyBlegKhWPFqqs24A/bNxPpHT5Xk
	5O5zTgmNEvlMWg6Z407rYNYtBNPKkA6VDxoRVZXAPUrENviWJogoQ3hNVlD5ZlTdeOojq8eTFVj
	NR
X-Gm-Gg: AR+sD12ZCX/Fz/4qqkjWPdQckRweQF9RAWVqbG4OIrQVLZfrwr4OU6jJeA76ZwnyxBQ
	9bUBhK9VPUrQJlx6cMnrBppTfRuPfzkNnOJ3fazRH645JYobxbJNVcNjeHAGOuKBSMGZT+3TPll
	jq4OAUwg7uyRyIpQsmDNhZvnf+c5Bq46d6vCpsooIVcbiP/AOoJ9/1uqS9OQqCqAH4hqH6iIG1f
	loeM2z3lflOvGNpphgxwWVzAyXRCYzgNCsq635DAZHpjKk9cU3jJDSClvK1dN+Loymae0rbw6ix
	UEF/YyH7yRc2TCCk/K70vFQR/nFaN3VmcTIuSizIQYGWftWde8yB0UJcNkWUr1IPQ0g2eZXDO7f
	j821S/zcJ4b1uw5cRSdl3cQ==
X-Received: by 2002:a05:6000:41fd:b0:47f:9839:a79a with SMTP id ffacd0b85a97d-481455f4b71mr18388f8f.10.1786349991108;
        Mon, 10 Aug 2026 01:19:51 -0700 (PDT)
X-Received: by 2002:a05:6000:41fd:b0:47f:9839:a79a with SMTP id ffacd0b85a97d-481455f4b71mr18270f8f.10.1786349990417;
        Mon, 10 Aug 2026 01:19:50 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-39-98.inter.net.il. [80.230.39.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021f8f33sm37611261f8f.27.2026.08.10.01.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 01:19:49 -0700 (PDT)
Date: Mon, 10 Aug 2026 04:19:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Graf (AWS), Alexander" <graf@amazon.de>
Cc: Demi Marie Obenour <demiobenour@gmail.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Jason Wang <jasowangio@gmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3] Add VIRTIO_F_DMB (Device Memory Buffer)
Message-ID: <20260810041133-mutt-send-email-mst@kernel.org>
References: <20260716215426.46037-1-graf@amazon.com>
 <20260804161202.38619-1-graf@amazon.com>
 <044ee495-d958-4c91-9627-da4ce591e737@gmail.com>
 <20260810015206-mutt-send-email-mst@kernel.org>
 <ef5fb8d2-4dce-4487-bb76-ce26e2ad7892@amazon.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ef5fb8d2-4dce-4487-bb76-ce26e2ad7892@amazon.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: I9pspz3Vxibv2BS33EeGIzefTBiiKKtL9YxVDXsloHQ_1786349991
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 10, 2026 at 08:09:19AM +0000, Graf (AWS), Alexander wrote:
> 
> On 10.08.26 07:59, Michael S. Tsirkin wrote:
> > On Thu, Aug 06, 2026 at 12:09:04PM -0400, Demi Marie Obenour wrote:
> >> On 8/4/26 12:12, Alexander Graf wrote:
> >>> When a transport uses a shared bounce region for virtqueue memory today,
> >>> that region is global and shared by multiple devices at once. Devices
> >>> then contend over one small region, so a busy device can starve the
> >>> others, and one device's emulation cannot be isolated or torn down on its
> >>> own because its state lives in memory everyone else is using too.
> >>>
> >>> VIRTIO_F_DMB gives each device its own shared memory region, the Device
> >>> Memory Buffer, that holds that device's virtqueues (Descriptor, Driver
> >>> and Device Areas) and the buffers the descriptors reference. When the
> >>> feature is negotiated, every address the driver places in a virtqueue is
> >>> an offset into that region rather than a physical or bus address, so the
> >>> device only ever touches memory the driver placed there. Because each
> >>> device owns its region, its emulation can run in a separate host process
> >>> and be terminated independently, and devices no longer contend over one
> >>> shared region.
> >>>
> >>> The device reports the region's shmid through a transport-specific
> >>> mechanism (dmb_shm_id in the PCI common configuration structure, DMBSHMId
> >>> on MMIO), so the shmid does not collide with device-specific or future
> >>> transport-specific shared memory regions. The driver locates the region
> >>> through the existing Shared Memory Regions facility. VIRTIO_F_DMB refines
> >>> VIRTIO_F_ACCESS_PLATFORM and is negotiated only together with it.
> >>>
> >>> To provide the confinement guarantee, the device bounds-checks every
> >>> driver-supplied offset against the region and sets DEVICE_NEEDS_RESET on
> >>> violation.
> >>>
> >>> The general requirement on shared memory regions forbids a device to
> >>> expose a region used to control its operation or to stream data, and a
> >>> Device Memory Buffer is used for both, so it is named as that
> >>> requirement's exception.
> >>>
> >>> The Device Memory Buffer is memory the driver shares with the device on
> >>> platforms that distinguish shared from private mappings, and the device
> >>> provides coherency without cache maintenance by the driver. A device
> >>> that requires the platform's barriers offers VIRTIO_F_ORDER_PLATFORM,
> >>> and a driver accepts VIRTIO_F_DMB only together with it. Offset 0 in
> >>> the region is reserved: a device that predates the feature reads a
> >>> Descriptor Area address of 0 as a queue that is not in use, as the
> >>> legacy QueuePFN register states.
> >> I think this is going to be a prerequisite for strongly isolating
> >> vhost-user backends (so they can't compromise the frontend)
> > compromise the frontend how?
> >
> >> while
> >> maintaining high performance.  One can use shadow virtqueues, but
> >> this will add extra round-trips.
> > At the cost of guest bouncing all data around each time it
> > moves between devices? Let's say, this is not a fit for
> > all use-cases. A more universal approach would allow data
> > in a pool shared by a group of devices.
> 
> 
> Why would we want to use a common pool across multiple devices? All 
> we're creating is more visibility to device backends and more lock 
> contention across multiple consumers, no?

Not sure what "contention" is. I think when you say pool you
mean the allocator. But let me clarify, what I mean
is data coming from device 1 and out to device 2, without
full data copies on the way.

People are already doing this for performance and I like it
when one can pick multiple points on security/performance curve,
not one.

> By keeping everything per-device, we have a super straight forward, 
> simple path that is very easy to reason about.
> 

I'm with you on keeping simple things simple but I'd like to make
complex things possible.

> > But I guess at that point, why don't we just invent a virtio iommu
> > command to describe all this? We don't really need a special device
> > mode just to limit access to guest memory.
> >
> >
> >
> > So Alex, now I'd like to know what exactly is the actual use-case,
> > because if it's not really on-device memory, there are better
> > ways to do it.
> 
> 
> My main use case is to create a confidential VM which has completely 
> static layout. The entity that backs device emulation (owns the DMB 
> region) is untrusted. The entity that implements the virtio machinery is 
> trusted. Private/shared state of memory should not change at runtime.
> 
> 
> Alex

No problem with that.

