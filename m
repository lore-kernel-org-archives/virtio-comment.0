Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8259BEAC7
	for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 07:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772004312; cv=none; b=SQY8Uflw1JJsKpZC6LAK+JSdj7sqwkULuMjyE5RHgbf4MJCaz1h7We3kCaC+H4r9U0EYOV/wAUMr+4VOqUvCkUr21C1j28W7+1tHF2lQJbkSYCDyMbCEOe97rnoXo06UdOo9/NWjJO086LRRObRCxquK1DQHpHdGZTN49Wmxvz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772004312; c=relaxed/simple;
	bh=hoZ9WpSBOGMJuwWSjqWcifK8RvY9V3a+zm6oxb3d+P0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=DO5DEp8Bj+9+far7wupxGUAKR198++snxC1LG23+qKSGj2UH3PoUVEENZPqETY2nOeGwpMTZd9tLEXy3RwZI9p6L3e0V0TYdlb1zjBhWW1iVLI7pbJPSCr3RA2tlUChb/f7Fs058SDSVlVnm4AfcZ9AhhkZCrke+g4sUeGykS88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=REwymZXH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="REwymZXH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772004310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MRc9vJfcwi+Sacr5HA0WszQMk5c6a1iQVtKHS+HANgI=;
	b=REwymZXHYVitqAFO6KqDJKB6A45xogLUxNxo7RnzDqKI+0KzKEhk2cvA7vayImRZ59m6X1
	wHnq/3LKZJMN40NZZPjW2ByYq7CTgDVdIl0hGIY3FfPM31PZk/Zjf2tZaIL1MNDFJGp/13
	EDyAZjWw/BH6gELXICptQw3WIevEzdU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-394-QJG1OoJgN3-oc9bHgaEJtQ-1; Wed, 25 Feb 2026 02:25:09 -0500
X-MC-Unique: QJG1OoJgN3-oc9bHgaEJtQ-1
X-Mimecast-MFC-AGG-ID: QJG1OoJgN3-oc9bHgaEJtQ_1772004308
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4376761037bso581708f8f.1
        for <virtio-comment@lists.linux.dev>; Tue, 24 Feb 2026 23:25:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772004308; x=1772609108;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MRc9vJfcwi+Sacr5HA0WszQMk5c6a1iQVtKHS+HANgI=;
        b=tViAh3Hd/YiX6CzwfAmQSallyu7/R7wZCC0/hJWoOyHcvf5ba6GzWV3OS773ta/9YW
         65HT5KG54IUH+5NAEFVg0QBizeknOJVgQvc22WvwWI5DPbzTJfHUH5VZd2qU3VQK71+H
         DP6wqYggrrYUxMyDs7G608yNKeaiSF+f7NMKBvZPBjzq/ZpWCUHenCanuJyTKRPxfgnr
         BOh1yKynutTMDVrmWgAlv2dPdsteVUzcM/uqJLZA3jhxn4t8rpDryLWBq55wlZ1ANW+n
         cNP0QoO/kQp1xSj5WfPxeAAiOsqeMEHf+7p2I6Ur+uYNSKpqXTBSOr+fb8a9YFMKKkD5
         HroA==
X-Forwarded-Encrypted: i=1; AJvYcCWHP3lE7s/8EawLuZvDtDJcipICPbo3wi+q3an5bzfIptvyMttFWNVMAoWAIehwSfyAy2b/o5AMLv7O9Kpp3Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyZyTnwZgbHTG+gsW5bdSXsQbzy90glQbTA1SS1MqiKoJhlIzaY
	ap42i3LBhproaGdSBektziaNoMgxykhtipY0cMTx5sZHzDcNzAcatRFaY7vKYJaatr+RJe9GnEw
	zCGrkyVUtYeu0ydATVno1HMUU/6rsH7bBqQwK7BqU5Zwunm1EYMktC3IUSDvZTtS+aN3v
X-Gm-Gg: ATEYQzzUq7Jab6AwqRM5xzGkvakuQ1OY9soGr/tuBnRMIVJc9dsuP8RP6zglr4Fz3Sd
	T+tWwJHEywudDnNBKBTnU33gE+F2Wtzgi661Gw8ZgkZW34yT6N+RrKmq2e4OTUkE9a4Fg/+Fv8Y
	FpWa3uzj6kp5RaNZ856u9ADczIvpgkEb9etvI0Sk1PMsSSf95d0FrNoc8jv+FX4MVz/9hRdoiqH
	FT5Pj8aU0/dZoWeWHtWAvXGh68YETQd9Y8bJ7wuvihm3Qeq23x2BGtfQ0uw3zjnuB9ly5bWdujs
	YxxumjYxUHPDZ0OiiNMuDkhcLZphWbv3D86QvpKY6ZCwu2ocaiR2K1K0/HtktGgtoBDghU9laBc
	kcDtkALooyKM8nFJZkzCvC1auWZT+Z/KLgCb717KJOzNdEg==
X-Received: by 2002:a05:6000:290b:b0:439:8c7f:712b with SMTP id ffacd0b85a97d-4398d95189amr4790266f8f.18.1772004307517;
        Tue, 24 Feb 2026 23:25:07 -0800 (PST)
X-Received: by 2002:a05:6000:290b:b0:439:8c7f:712b with SMTP id ffacd0b85a97d-4398d95189amr4790213f8f.18.1772004306970;
        Tue, 24 Feb 2026 23:25:06 -0800 (PST)
Received: from redhat.com (IGLD-80-230-79-166.inter.net.il. [80.230.79.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4c982sm31658258f8f.31.2026.02.24.23.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 23:25:06 -0800 (PST)
Date: Wed, 25 Feb 2026 02:25:03 -0500
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
Message-ID: <20260225022229-mutt-send-email-mst@kernel.org>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <SJ0PR12MB680610C1B53CA4E8B4470411DC61A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260219185034-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806F703CB616D184FCBE5B3DC68A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260220050136-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806139282845EA52421A9E2DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <SJ0PR12MB6806139282845EA52421A9E2DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5ORkCGepaZ8wNyGJeur008XKOZ-Hjkxm-4s-d--d-sY_1772004308
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 25, 2026 at 05:09:45AM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: 20 February 2026 03:33 PM
> > 
> > On Fri, Feb 20, 2026 at 06:13:55AM +0000, Parav Pandit wrote:
> > > > > 4. I dont find the transport messages to read and write to the driver memory supplied in VIRTIO_MSG_SET_VQUEUE addresses to
> > operate
> > > > the virtqueues.
> > > > > Dont we need VIRTIO_MEM_READ, VIRTIO_MEM_WRITE request and response?
> > > >
> > > > surely this can be an optional transport feature bit.
> > > >
> > > How is this optional?
> > > How can one implement a transport without defining the basic data transfer semantics?
> > > For example for TCP transporting, driver side OS is implementing header format foo, and device side is using header format bar.
> > > How does it work?
> > 
> > I'm not sure what do foo/bar refer to, or what TCP transporting means.
> This proposal is subset of past proposal of [1].
> 
> Proposal [1] covered transporting virtio control and data operations using something other than MMIO and PCI.
> And current proposal is similar, except that it didn't define the transport binding at all for the specific bus.
> It is only a partial 'control-transport'.
> 
> [1] https://yhbt.net/lore/virtio-comment/20231023104647.290759-2-pizhenwei@bytedance.com/
> 
> So foo and bar are the definitions I expect as listed in the patch-5 of [1].
> If it has to be done by the bus, lets write up this as 'control-transport'.
> 
> > The simplest way to do TCP on top of virtio is to layer it above virtio
> > net. That uses VQs for data transfers.
> > 
> The intention of this proposal is not to do TCP on top of virtio.
> The intention of this proposal is to do virtio on transports other than MMIO, PCI and channel.
> Such a transport can be anything - not defined in virtio spec.

> It could be FFA, some two SoC as written in cover letter example, or it can be something else such as TCP or UDP or vsock or whatever else.

I feel this "anything" is simply too broad a requirement. 
I did not see any demand for  virtio over TCP.
And, making it work with existing drivers will be a mess.
We can scope this for buses that can do DMA for now.



> 
> And hence, data transfer part must be scoped properly.
> Maybe I am yet to read this text in the 1600 lines of proposed patch...


Once we get into "support everything in the most abstract way possible"
we have already lost.
No one asked for virtio over carrier pigeons.
Let us not over engineer please.

-- 
MST

