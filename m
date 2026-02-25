Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8459D37E314
	for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 09:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772011356; cv=none; b=rnavgdLuDY8tnvnLASEFgboFOytch9/o/VW1pZ73YJRSrHXP557G8al39ZL6Pglz/FQeF21nLSGkBCCYy1LA9qm6bVVlMCmt2dd2C61MKSDhb+J3iL/NYUMjKFJOmvIRLq59Nnjtjt1SJX/Kf/BuVViBNS8V45LnfxDfoWvx9Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772011356; c=relaxed/simple;
	bh=Du1bKlbwY2/kIhM9F9htw4UJuDB2t82E+4eFlO72hyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=hpvPJpFzxnGQRdwoEjIdLMz+XjbjF4TTVlpCTCZ7O6r7U58Zs9gYhjrbOtt6n3Wv3yVEWDdIXekfZR3IUsDj9hItUU2pe7DDfudJtYW4Z70jsFekYTqMSy3AFx9AMfQxXcl9fxe7157s81EHNsHxD9h1uk2nQFqBV2ivw9GBsPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fwi+RDNa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fwi+RDNa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772011354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KaosWJg0I6Z7nL1wrU5obMvBP/CiKGRk6knYQyBjezY=;
	b=fwi+RDNaRXR3ThloFoFK0bw2ZwIUItC51Ez/zEarkOY0XXAO2vof0QsC5UWd2m5gfLe8Ut
	4rayhvmIj/qcdja7NW9wMfvLQVZ0s2fMT56Q3rhdIHhuBWWk8swQjgZTKWfh3QDDf2z0sa
	kC9k9V/TJn1EJMHMKivmuEsCCNQIg3E=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-458-1Hx-rEaFMGamRACShUApOg-1; Wed, 25 Feb 2026 04:22:33 -0500
X-MC-Unique: 1Hx-rEaFMGamRACShUApOg-1
X-Mimecast-MFC-AGG-ID: 1Hx-rEaFMGamRACShUApOg_1772011352
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4836fbfa35cso43284425e9.1
        for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 01:22:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772011352; x=1772616152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KaosWJg0I6Z7nL1wrU5obMvBP/CiKGRk6knYQyBjezY=;
        b=jmWrXrJ5HuTtFMHPf5IjYqEnReiJs4E7Qk4fktWe8XBOJIW+7L+GJygmNM7Q6gE4Jn
         ksy3C3UKH+hoR6LT/Euq2SGUemofAAu36aAiECGzuam7OKMUc86F0S2LY8/Vb1IKEU/6
         xZxMs0Z8M82JBwR/UBy+22dFJ3ON5eOp554kHwj4IjaHO2dYCSk0Ac+KZjglQ43dDf6h
         gyjdwp//WS3pTv3D/H1MKPlhIfUGeBiGRUmVhgg2viT0fh9CZO9/2psI8Q33OICWXz4T
         1LaHSFLN9kzqGirbKyhepNVRLU0yyV43lhTKd3w3uKs12K9wjxsrJEqJYRBqsPf7qt+2
         l2HA==
X-Forwarded-Encrypted: i=1; AJvYcCUqe16LVWZjEvyBo3ZV2/aVVmy3K2jv3xnT1WaoJmt0SywkcznTO48ogZ27juzhmlHT6PVZredM2fpoEozRGA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxndfKFQXJdiIXDICfNlCVSI7Zve4T05WslnOEWKtf8qxBrUtH3
	FCEY/UD3YE+JssVa8oZq9DhlgeVXRoHqvP55ETxwVwUunS1q5bq+D9KJ5GxlxlgyFX/cB8GAt5Q
	sL5CvwjJu+Uyi4JeRqddsIhOW8bSbouymmL0cbBpBdHzq6zZFGQgOHWVH4qgoAdPxDwrW
X-Gm-Gg: ATEYQzxtYvDkh6wwc5ue5tD4Keg9+2udENwBh0BrLcn9d94c3qrGmFOAblAZ7mlGgRt
	49X1/ySc0oycqfoB1kYV1wpZUO6/ob7Q3M2QfPWAWFPlwk+Q7o94c3e2+NcON4YwHx/Z1sCTK6f
	+0gedqQwthk3Lj5QzNZSudnL+rWukkusq5JdDx8P0j6wG5TMOaHABp/IQrXrQ82a57V8xCtSnxB
	6i/RIf0PKD+neDD3DBi3+nyeDVywHnv18pT1pTnsdbrTitLAb+/PQ1y0wKv+uGAyCHQPRTfsfZs
	AMLgDvRPmyIne8DZy9Y2QsvTfoUlqObliurtR25U0iZOE8Vukq5N9nFywswVf+ebD/qV3ibn5AG
	1ZLVmsuG4SLfTnA3n4Cw/ekzHb9F8sj5WftQ39HVxRsmcsg==
X-Received: by 2002:a05:600c:3e05:b0:477:7f4a:44b4 with SMTP id 5b1f17b1804b1-483a95b3df6mr246230405e9.1.1772011351516;
        Wed, 25 Feb 2026 01:22:31 -0800 (PST)
X-Received: by 2002:a05:600c:3e05:b0:477:7f4a:44b4 with SMTP id 5b1f17b1804b1-483a95b3df6mr246229735e9.1.1772011350932;
        Wed, 25 Feb 2026 01:22:30 -0800 (PST)
Received: from redhat.com (IGLD-80-230-79-166.inter.net.il. [80.230.79.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd75df9fsm59590125e9.13.2026.02.25.01.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 01:22:30 -0800 (PST)
Date: Wed, 25 Feb 2026 04:22:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Bill Mills <bill.mills@linaro.org>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	"Edgar E . Iglesias" <edgar.iglesias@amd.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Alex Bennee <alex.bennee@linaro.org>,
	Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
Message-ID: <20260225041945-mutt-send-email-mst@kernel.org>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <SJ0PR12MB680610C1B53CA4E8B4470411DC61A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260219185034-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806F703CB616D184FCBE5B3DC68A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260220050136-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806139282845EA52421A9E2DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260225022229-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806E3A4D9783E5DB5FA5EC4DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <SJ0PR12MB6806E3A4D9783E5DB5FA5EC4DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nVE73VMLaUt8N6JQoQ6aJX604rbdNzD9cI1Q3j7yfj0_1772011352
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 25, 2026 at 09:18:58AM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: 25 February 2026 12:55 PM
> > 
> > On Wed, Feb 25, 2026 at 05:09:45AM +0000, Parav Pandit wrote:
> > >
> > >
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: 20 February 2026 03:33 PM
> > > >
> > > > On Fri, Feb 20, 2026 at 06:13:55AM +0000, Parav Pandit wrote:
> > > > > > > 4. I dont find the transport messages to read and write to the driver memory supplied in VIRTIO_MSG_SET_VQUEUE addresses to
> > > > operate
> > > > > > the virtqueues.
> > > > > > > Dont we need VIRTIO_MEM_READ, VIRTIO_MEM_WRITE request and response?
> > > > > >
> > > > > > surely this can be an optional transport feature bit.
> > > > > >
> > > > > How is this optional?
> > > > > How can one implement a transport without defining the basic data transfer semantics?
> > > > > For example for TCP transporting, driver side OS is implementing header format foo, and device side is using header format bar.
> > > > > How does it work?
> > > >
> > > > I'm not sure what do foo/bar refer to, or what TCP transporting means.
> > > This proposal is subset of past proposal of [1].
> > >
> > > Proposal [1] covered transporting virtio control and data operations using something other than MMIO and PCI.
> > > And current proposal is similar, except that it didn't define the transport binding at all for the specific bus.
> > > It is only a partial 'control-transport'.
> > >
> > > [1] https://yhbt.net/lore/virtio-comment/20231023104647.290759-2-pizhenwei@bytedance.com/
> > >
> > > So foo and bar are the definitions I expect as listed in the patch-5 of [1].
> > > If it has to be done by the bus, lets write up this as 'control-transport'.
> > >
> > > > The simplest way to do TCP on top of virtio is to layer it above virtio
> > > > net. That uses VQs for data transfers.
> > > >
> > > The intention of this proposal is not to do TCP on top of virtio.
> > > The intention of this proposal is to do virtio on transports other than MMIO, PCI and channel.
> > > Such a transport can be anything - not defined in virtio spec.
> > 
> > > It could be FFA, some two SoC as written in cover letter example, or it can be something else such as TCP or UDP or vsock or whatever else.
> > 
> > I feel this "anything" is simply too broad a requirement.
> > I did not see any demand for  virtio over TCP.
> > And, making it work with existing drivers will be a mess.
> Why would it be a mess? Because of load/store semantics?
> If so, would the message layer also faces the same challenge?

not sure what "the message layer" is.

> > We can scope this for buses that can do DMA for now.
> That looks reasonable good start.
> However, "Appendix C. Creating New Transports" needs modification.
> 
> Following two likely needs to stay outside of the "control transport".
> 
> A transport provides a mechanism for the device to send device notifications to the driver, such as used
> buffer notifications.
> A transport provides a mechanism for the driver to send driver notifications to the device, such as available
> buffer notifications.


Well existing transports sure do include these.

> We also need to fix the Appendix to describe about control transport and full transport.
> Current definition of Appendix C is listing MMIO And PCI transport, yet it misses virtqueue implementation by _full_ transport.

because they all share a single virtqueue implementation.

> > 
> > 
> > 
> > >
> > > And hence, data transfer part must be scoped properly.
> > > Maybe I am yet to read this text in the 1600 lines of proposed patch...
> > 
> > 
> > Once we get into "support everything in the most abstract way possible"
> > we have already lost.
> Unlikely.
> Nvme over TCP is present since 2021.
> NVMe over RDMA is present since 2017.
> iSCSI over TCP is present from 2014.
> NFS .. 
> List continues...
> 
> The idea is to not define most abstract thing.
> The idea is to define the practical spec that cater to requirements already listed, including the TCP one in [1].

I don't object to virtio over TCP. just do not want to block this
work on that.


> > No one asked for virtio over carrier pigeons.
> CSP user already explained the use case of virtio over network transport in [1].
> Considering above many use cases already done on similar non virtio devices as pigeons is severe undermining the scope of virtio.
> 
> One can say, I only want to engineer control transport ignoring needs of [1].
> However, we must have the doors and vision open so that users of [1] can also use it without creating yet another 'fabric transport'.
> 
> At the same time, we must define the binding to the bus where it is going to be used for the DMA.
> 
> For example, cover letter mentions about " between a host processor and its co-processors"
> And " between normal and secure worlds"
> 
> How can one implement a driver if the bus driver does not know how to enumerate/discover it?
> 
> In the proposed example, of host processor and co-processor if they are connected via Xenbus or AMBA bus,
> how should driver discover this device?
> 
> If this bus binding is not part of the virtio spec, how can it be ever implemented and yet comply to the virtio spec?
> Can someone please explain this?
> 
> I frankly expect an ARM FF-A bus binding transport section in virtio-spec.
> So that device and driver can inter-operate implemented by two different entities.
> Only virtio level messages do not seem sufficient.

I agree at least one should be shown at least as an rfc.


