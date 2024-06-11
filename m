Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9980545948
	for <virtio-comment@lists.linux.dev>; Tue, 11 Jun 2024 16:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718123384; cv=none; b=cZarIZOWWWwBFEQtUSqEk16zfqHX5jCtsfNpxjT5Uk5TbKNwwBobMExWUmtwALzZ+CDYpIj2R76IXkKKcsDs1+HpsmgKxJGOoQ7v8IwPKCqVKY3Hkp0fPYxbptLZHmAbkF2cle9Ns9KXmlIBWrrLEK17eAVq87e4L5fcOVTxFi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718123384; c=relaxed/simple;
	bh=bo7Ee5LqJGWFQVTG4JRKSjW7JXnjTJPRwQG8+F5tlYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=RdSirAMP7shFXGxC5CzBQlInme32pzn76xOwQnCe25J9WFBx4Yw/rhXM+ykz9h+M4HarI4/rzNC5HB1ZmfMEHMqzfPqObUcN2QhI67HzoAF4Nic46nVQ7PqSJdeLLLfwu4V6Q8plJay5X0pGrTkBQNHqaXCl71wia9YduRJews0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I+GHDlh7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I+GHDlh7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718123381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=txcFrPnbl+W+6cFbLL0eb6+GMaVzFZ0vPlOJV4trftA=;
	b=I+GHDlh7AqUUV4ar5Eajlghug1ARoAsOQQCnuJbGIAALU1AXWuLJqkp9l8+/GsLizbfee0
	W9kLk0lUTiwDmUnbK8i57jV3Om9RCpX1Gmv73hTr7J0CQLP21oTbx13N59Hy0vnQUAWw4D
	ZUwa2H38z/ozIw2TSW9mXXXesHmayLE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-fO97CLTrNJuhtyxKzG3hfA-1; Tue, 11 Jun 2024 12:29:39 -0400
X-MC-Unique: fO97CLTrNJuhtyxKzG3hfA-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-35f1d26b0fcso2009113f8f.1
        for <virtio-comment@lists.linux.dev>; Tue, 11 Jun 2024 09:29:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718123378; x=1718728178;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=txcFrPnbl+W+6cFbLL0eb6+GMaVzFZ0vPlOJV4trftA=;
        b=KEE2lSxFixc9b+r86DNUU3yM5OFG5cBRJVi9s4lIzr1J/JU1DXomv1dIG43wzaQBqg
         /21cRMJQ/R8IOOXRVZsuQGSU9ga9T5thTMyqUQCI6W2m8NyzBCS3d6Fbt4NUnx7gJuD+
         nho2uBimPa9dA6YsCEnHQu+AkMgwZwzvLCwxPMP0d938LJP95gnmKGFBNZ0iOVI7LNPF
         KvBbz1xZUASJAo2ewbtAYww0VFzPrU4EZHLZwa09XzxS4cDMMNuYXHR3JIF1V1kFPvtq
         voxPMkrxHG6h7QgQeae5oHwzjKdxZ5oBrbr86w7uqY/TQzFl6rn8JezSWXe3cz5WzaZK
         iLOg==
X-Forwarded-Encrypted: i=1; AJvYcCVfY6Gfh5/UZv1OK2zJkgTleLeBPWzU7lYDSEIYSmtepg9QldLSm5iW6C0f0u9lOjqnpduUDfJh7LgxSWse6D/uDVkZwoVlFYQ1KNbXwcM=
X-Gm-Message-State: AOJu0YywF4fgp3vZaCNXqzMOYu10RvRxfQ9c40jeb5tmeL/2eHdZ4a31
	h3O86r8//+UC4H2hIYdlUn4hWrYjbxYHLpFquJWVNAItnSi4Plpj6EM5XW8k9i08IEc8crI0Ipq
	+17gGBG2A8Vndsv2kuL+b3FA4+mN6xj7O0ZqOzcbzJL4RJyNEFYBnL+Rn+tBKkmWI
X-Received: by 2002:a05:6000:1f81:b0:35f:2239:c543 with SMTP id ffacd0b85a97d-35f2239c64emr5522118f8f.66.1718123378101;
        Tue, 11 Jun 2024 09:29:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEui4YtCziIztXQqn1bWHMkKXozZS/NzbI9k0FxnC5374+190w+OlCt+r1kLtIps2rSyyJ70g==
X-Received: by 2002:a05:6000:1f81:b0:35f:2239:c543 with SMTP id ffacd0b85a97d-35f2239c64emr5522094f8f.66.1718123377535;
        Tue, 11 Jun 2024 09:29:37 -0700 (PDT)
Received: from redhat.com ([2.52.131.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f2024b1c8sm7184179f8f.39.2024.06.11.09.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 09:29:36 -0700 (PDT)
Date: Tue, 11 Jun 2024 12:29:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
	virtio-comment@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
	Parav Pandit <parav@nvidia.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH v5] virtio-net: clarify coalescing parameters settings
Message-ID: <20240611122756-mutt-send-email-mst@kernel.org>
References: <20240528044702.50603-1-hengqi@linux.alibaba.com>
 <20240607220246.3213607c.pasic@linux.ibm.com>
 <1717814062.4461155-1-hengqi@linux.alibaba.com>
 <20240610144602.57a04723.pasic@linux.ibm.com>
 <1718026545.7557275-2-hengqi@linux.alibaba.com>
 <20240610221900.1810ea96.pasic@linux.ibm.com>
 <1718102433.0456574-3-hengqi@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <1718102433.0456574-3-hengqi@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 11, 2024 at 06:40:33PM +0800, Heng Qi wrote:
> On Mon, 10 Jun 2024 22:19:00 +0200, Halil Pasic <pasic@linux.ibm.com> wrote:
> > On Mon, 10 Jun 2024 21:35:45 +0800
> > Heng Qi <hengqi@linux.alibaba.com> wrote:
> > 
> > > On Mon, 10 Jun 2024 14:46:02 +0200, Halil Pasic <pasic@linux.ibm.com> wrote:
> > [..]
> > 
> > > > > If the device chooses a stupid
> > > > > maximum value, it is his choice (spec should give more devices choices instead of
> > > > > forcing them to choose "0" which is not the best practice). We can't talk about
> > > > > performance for drivers when the devices tend to choose any "stupid" designs.
> > > > > 
> > > > > We need relaxe the restrictions and makes the spec more reasonable.
> > > > >   
> > > > 
> > > > Hm, I see Linux virtio-net changes have landed with v6.0 and if I read
> > > > those correctly the driver -- contrary to my initial expectation --
> > > > negotiates the feature, but does not set the parameters explicitly and  
> > > 
> > > How does the driver know what parameters to set? 
> > 
> > Disclaimer: I'm not very knowledgeable when it comes to networking and
> > NICs. Please be patient with me.
> > 
> > If I understood that properly have previously stated that it is basically
> > a trade-off between "latency friendly"  (downside: overhead and not so
> > throughput friendly) and "throughput friendly" (downside: not so latency
> > friendly). And that makes sense to me.
> > 
> 
> Yes, I am correcting the description about the trade-off thing.

It does not look like this thing is ready yet.


How we can we make progress with
the realease but sure we don't make backwards compat a pain?

Ideas?



> > So I would think, the answer to the question what is the best trade-off
> > should also depend on the workload.
> 
> device-side dim or driver-side dim to solve this problem. But, when the device
> is reset, the driver may not enable dim, the device or driver needs to  have a
> static coalescing parameters (0 or non-zero) for the trade-off.
> 
> (don't trust dim too much now, I'm doing some updates to optimize dim.)
> 
> 
> > 
> > Now as far as I understand although we call the parameters max_usecs and 
> > max_packets the notification condition is dictated by those two values. I.e.
> > there won't be a notification unless the compound condition is met.
> 
> Right, just one of the conditions needs to be met.
> 
> > 
> > When there is no traffic 0 and 0 looks like reasonable values to me: I
> > want the first of possibly many packets ASAP. Depending on the actual
> > load, maybe one could employ some sort of a heuristics to keep good
> > balance -- maybe based on a frequency of interrupts. Maybe DIM is
> > actually exactly what I have in mind.
> 
> This patch is not to solve the scenario where dim exists, but what the
> static value of the coalescing parameter is when the device is reset.
> (please check some hhistorical discussion of this topic)
> 
> > 
> > You seem more knowledgeable on the topic. How is this usually done? How
> > are the optimal values correlated with device characteristics?
> 
> 
> NICs such as mlx, ena, ice, and HiSilicon all have a non-zero static
> coalescing value. Although they all support netdim, the static value is
> still useful when dim is disabled.
> 
> As for the specific value, I think it is best to notify the driver through the
> device itself, such as adding capability fileds or this:
> https://lore.kernel.org/all/20240426065441.120710-3-hengqi@linux.alibaba.com/
> 
> > 
> > > The parameters should be
> > > exposed by each device.
> > 
> > I would like to better understand why. My intention is not to question
> > the correctness of this statement, but to gain a better understanding.
> > 
> > > 
> > > > thus keeps the defaults (until userspace decides to set the parameters).
> > > > So it does matter whether the defaults are guaranteed to be 0 or not,
> > > > and if not it does matter what defaults are chosen by the device.  
> > > 
> > > Didn't follow this. More below.
> > >
> > 
> > Maybe my statement was wrong. So let me make a question out of it. What
> > entity or entities do we expect to change the parameter values, and when
> > or under which conditions do we expect them to change the parameter
> > values?
> 
> Changed by the driver when the load changes or user..
> 
> >  
> > > > 
> > > > One could even argue that those patches have been reviewed under the
> > > > assumption that the device needs to use 0 as the default parameter value.  
> > > 
> > > The default value should not be explicitly specified in the spec, because one
> > > size does not fit multiple devices.
> > 
> > This ties in to my previous question about the relationship between
> > device characteristics and the optimal values for max_usecs and
> > max_packets.
> 
> Device characteristics and optimal max_usecs/frames are preferably communicated
> via device capability, but at least should not be forced to a specific value by
> the driver.
> 
> > 
> > > The source of this problem is that we are
> > > missing fields like default_{rx, tx}_coalesicng_params that indicate the device
> > > capabilities. No?
> > 
> > I don't think so! In my understanding is that with your proposal
> > after a reset, the OS/driver has no problem obtaining the defaults that
> > indicate the device capabilities. But I would really like to better
> > understand that device capabilities part.
> > 
> > And yes another way around this would have been say:
> > * let us introduce those defaults fields, e.g. to the config space
> 
> Do you want to solve it by adding another new feature?
> Otherwise, how do you solve the compatibility problem?
> 
> > * make the driver read those values as a part of the initialization
> 
> The spec is in conflict with this, because the driver can only read 0 from
> devices that conform to the spec. I submitted this patch to achieve this goal:
> https://lore.kernel.org/all/20240426065441.120710-3-hengqi@linux.alibaba.com/
> 
> > * and set those values as the initial parameters.
> 
> I don't support this, the device doesn't want to accept any initial
> unreasonable settings.
> 
> Thanks.
> 
> > But frankly I see no benefit of that over what you propose here.
> > 
> > Regards,
> > Halil

