Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A40C225AF
	for <virtio-comment@lists.linux.dev>; Tue, 13 Aug 2024 08:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723536241; cv=none; b=RB1tdYp2mmCZlOeKsO4wj3rWXKajqHdTqjShNEdhJNaG0Uo1UyYVRY2f0NwVZ0itIULW9nzeNvAjKW7Xn2Dh034xDcuDM+tVOMbj7n0aSXYqB3srPSVsMhcywCmakTjCtT/vwg+zV/l3EbKlc4FOSdH8EplzKrnQ6ZteBa76ZqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723536241; c=relaxed/simple;
	bh=tHRIoSmUlpyojdXUcGVsmaXJ7TxNaQUul4lpldCVprU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=SDvtrxX+4flV3uA4aBTuGkCD4A2uWBkn69eB0yegEUsPJe0tNVM9st4i5ru0QhrCvuUw6rV4nyPjwbI3iGGLKy34y7a3xCDUOxbM75zpL1JwCchkrZbCQveZAMIS0NeGfk0JlYdIUNps11cA4m8YBa6eEJNBk5h3fdf7WLJGFos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fm9KJmfk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fm9KJmfk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723536238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NTZKRzoyesAsAlGeNf0GOgS0USRLQIlW7esbW/pqEvM=;
	b=Fm9KJmfkRBNt4jssXURiKjTDMOU5Xq/wmnzx0CaUkSjZznkA5ssI5VoI0PWZGXpGJ3Qmk5
	6V/Y0AXPz2zY7USUdt8qE0ZGpFlDqzMO38Gpaw92Qah+wfKpIZa3WuoUPsgtgB2vEDIUaf
	vQ7kxnvyPBaYg9fe4oHu5xzeJyuQsD0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-PPy-sUetObybOjTL9Q3d8A-1; Tue, 13 Aug 2024 04:03:54 -0400
X-MC-Unique: PPy-sUetObybOjTL9Q3d8A-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5af9df8ef73so7941505a12.1
        for <virtio-comment@lists.linux.dev>; Tue, 13 Aug 2024 01:03:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723536233; x=1724141033;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTZKRzoyesAsAlGeNf0GOgS0USRLQIlW7esbW/pqEvM=;
        b=aTqxOoAftDm1evZ/wgmXK1wY0e/pwqB6AN4y7FmjbS9ufpa/jfvHvgecrn+kH9m4k3
         muS4pQGgb/CpFymkW5E0qya+3HrAB5WAh4nMabt2pUCxmGYKb+FSzZn5xNT6hU66JygD
         Sa76tildQP9HcWbVaBdcAebvUnGHnOacjoFyOz2hwV1JSu0ZP9Klca31EGAQiQ1sYR21
         8Uq3kSnbXEm462gIDyEC7y0E0ac3+gNftU7ctp8NNxWqTSyDH1s8QSXmO7iOATX5LusI
         b7ucskSAFiVcx7j+qMyFqX0DsZ+OJYyN8WZsZ6R9lBAYuNUh5DhgGUw4zYSKj92TOrAL
         T4sA==
X-Forwarded-Encrypted: i=1; AJvYcCUrCYlS7hbyQSrUsyBcA3Aj7hZDHonQ2JILyykPOFFp9nl/wQXrXkzEXu5KxUd8nazLyEjlAgpsEiwAjkOMpA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0fU3Znv84LrEjjj613bPhrpZffkiWGDkM+u9/LJFBQfrQV4lt
	G+2aYl1m1bLGdSLZL/C/O6aB2ff/6+FpE7Tr5T9gL3H2r0v9tMlF+uaX5pVpljFvxEeyYTRrAA5
	bOQiygJWLHBg8Inhz3Sei7UR8JqWD3sETF/aiRvgeCZr/elcXAdUoG3hqz8gyPMNs
X-Received: by 2002:a05:6402:1d55:b0:585:5697:b882 with SMTP id 4fb4d7f45d1cf-5bd4616ac6amr1870240a12.3.1723536233512;
        Tue, 13 Aug 2024 01:03:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHflu1vogNL21hszdFzMbZ4Q9ZV1u4LYkWqXkHKmOMhwqqXSgGPISoXEG1w1cdQUzqysRtmyQ==
X-Received: by 2002:a05:6402:1d55:b0:585:5697:b882 with SMTP id 4fb4d7f45d1cf-5bd4616ac6amr1870197a12.3.1723536232608;
        Tue, 13 Aug 2024 01:03:52 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:346:dcde:9c09:aa95:551d:d374])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bd1a60984bsm2698234a12.79.2024.08.13.01.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 01:03:51 -0700 (PDT)
Date: Tue, 13 Aug 2024 04:03:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Zhu Lingshan <lingshan.zhu@amd.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Message-ID: <20240813040219-mutt-send-email-mst@kernel.org>
References: <20240801113516.22155-1-lingshan.zhu@amd.com>
 <IA0PR12MB871379BD50370080A9B6849EDC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240813033547-mutt-send-email-mst@kernel.org>
 <IA0PR12MB8713365735501290E3174F40DC862@IA0PR12MB8713.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <IA0PR12MB8713365735501290E3174F40DC862@IA0PR12MB8713.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 13, 2024 at 07:58:32AM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Tuesday, August 13, 2024 1:22 PM
> > 
> Removing intel email id again to avoid constant bouncing messages.

Thanks.

> > On Tue, Aug 13, 2024 at 04:42:06AM +0000, Parav Pandit wrote:
> > > a. suspending a device is non frequent operation (in order of N
> > operations/sec, where N is roughly in range of 10 or 100) per device?
> > > b. A software-based device may not always want to force VM_EXIT on read
> > and write on the device_status register?
> > 
> > I just see where this is going.  Parav, if you want a device with as little as
> > possible memory on it, using DMA as much as possible, what you want is
> > develop an alternative transport that will let you control status without using
> > memory accesses.
> No, there is no need of DMA here.
> This is not about less memory either.

OK, sorry. I misunderstood.

> As I explained, the challenge is implementing suspend bits to operate at sub-microsecond level granularity.

Yes, I think the proposal is too vague on how all this happens.
Replied separately.

> > This will also, with time, allow doing this for existing config space.
> > We aren't blocking all spec development until you do, and the tradeoff of
> > easy to debug, robust MMIO control versus complex but maybe cheaper for
> > some hardware vendors DMA based access is up to the device.
> >
> No one is blocking the spec etc. Not sure why you say that.
> The idea is to have suspend as command register, and its status to reflect in the existing device_status.
> 
> Last time you recommended to only make design suggestion and not go down the exact details of the bit and let author to fix it.
> 
> If you prefer to discuss the bit level details, it looks good to me to go to that details.

Sorry, reacted too early.

> > --
> > MST

