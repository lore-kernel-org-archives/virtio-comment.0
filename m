Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F56717B414
	for <virtio-comment@lists.linux.dev>; Tue, 11 Jun 2024 11:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718105558; cv=none; b=ioy9nKXceMfjTf115hdEiLUSOBhIs//wzYoAMPCgNgoZLGTFyRnBM96+QHT3/ndZZgtRhM0lrvlXsbG76trMnOQbpyouWFT2bv/iW5NLtuYLQ5nGjTem/f4zTVGkNx/b6ZfhfD8kB/wfF94Hfw6OLL4gj18ZPQiQjaZwSw2HvRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718105558; c=relaxed/simple;
	bh=NjTTpCLFvrKxIe5Gq/tYuDVZDkEawOHw6Jeoj+xGY4A=;
	h=Message-ID:Subject:Date:From:To:Cc:References:In-Reply-To; b=ARn8cF8snQnrvvc7DKMdVm0LNwjH0zv532zKvWXbqMiYdLaBSABX9wdtFZfvD2Nd2ZRouf98XKHltqmZmkZhiG/N72hF3PFxyDVQg2oYPwhPtKwoUmVM9Q/++RsHfkCWBLKrwgoBYrt+m7rGDGAVGJYLowl6Bs4lZ0YNy9l/A3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=dH9U5DB+; arc=none smtp.client-ip=115.124.30.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="dH9U5DB+"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1718105553; h=Message-ID:Subject:Date:From:To;
	bh=N/C4HzwYBG8WX1F3Qft+wrtyOCNpb4ztBCCp6k+tfaI=;
	b=dH9U5DB+EO/+g2NTWHvri5ha4bUK1m1ZPmjZNdfIS/eeTEUAjzRYMYLpS6BinUJxs1IJbQbOh+79HBVGTYfLKGaGgds64tJNrBGUnMVXmt6DWUVSGwzV4OGAhvo9hwaejFqy8vBPrI7F14lltg1xzrJ5wWoQAzpa0j55bxa43f4=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R841e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045046011;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0W8GJ4mq_1718105551;
Received: from localhost(mailfrom:hengqi@linux.alibaba.com fp:SMTPD_---0W8GJ4mq_1718105551)
          by smtp.aliyun-inc.com;
          Tue, 11 Jun 2024 19:32:32 +0800
Message-ID: <1718102433.0456574-3-hengqi@linux.alibaba.com>
Subject: Re: [PATCH v5] virtio-net: clarify coalescing parameters settings
Date: Tue, 11 Jun 2024 18:40:33 +0800
From: Heng Qi <hengqi@linux.alibaba.com>
To: Halil Pasic <pasic@linux.ibm.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 virtio-comment@lists.linux.dev,
 Jason Wang <jasowang@redhat.com>,
 Parav Pandit <parav@nvidia.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Halil Pasic <pasic@linux.ibm.com>
References: <20240528044702.50603-1-hengqi@linux.alibaba.com>
 <20240607220246.3213607c.pasic@linux.ibm.com>
 <1717814062.4461155-1-hengqi@linux.alibaba.com>
 <20240610144602.57a04723.pasic@linux.ibm.com>
 <1718026545.7557275-2-hengqi@linux.alibaba.com>
 <20240610221900.1810ea96.pasic@linux.ibm.com>
In-Reply-To: <20240610221900.1810ea96.pasic@linux.ibm.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>

On Mon, 10 Jun 2024 22:19:00 +0200, Halil Pasic <pasic@linux.ibm.com> wrote:
> On Mon, 10 Jun 2024 21:35:45 +0800
> Heng Qi <hengqi@linux.alibaba.com> wrote:
> 
> > On Mon, 10 Jun 2024 14:46:02 +0200, Halil Pasic <pasic@linux.ibm.com> wrote:
> [..]
> 
> > > > If the device chooses a stupid
> > > > maximum value, it is his choice (spec should give more devices choices instead of
> > > > forcing them to choose "0" which is not the best practice). We can't talk about
> > > > performance for drivers when the devices tend to choose any "stupid" designs.
> > > > 
> > > > We need relaxe the restrictions and makes the spec more reasonable.
> > > >   
> > > 
> > > Hm, I see Linux virtio-net changes have landed with v6.0 and if I read
> > > those correctly the driver -- contrary to my initial expectation --
> > > negotiates the feature, but does not set the parameters explicitly and  
> > 
> > How does the driver know what parameters to set? 
> 
> Disclaimer: I'm not very knowledgeable when it comes to networking and
> NICs. Please be patient with me.
> 
> If I understood that properly have previously stated that it is basically
> a trade-off between "latency friendly"  (downside: overhead and not so
> throughput friendly) and "throughput friendly" (downside: not so latency
> friendly). And that makes sense to me.
> 

Yes, I am correcting the description about the trade-off thing.

> So I would think, the answer to the question what is the best trade-off
> should also depend on the workload.

device-side dim or driver-side dim to solve this problem. But, when the device
is reset, the driver may not enable dim, the device or driver needs to  have a
static coalescing parameters (0 or non-zero) for the trade-off.

(don't trust dim too much now, I'm doing some updates to optimize dim.)


> 
> Now as far as I understand although we call the parameters max_usecs and 
> max_packets the notification condition is dictated by those two values. I.e.
> there won't be a notification unless the compound condition is met.

Right, just one of the conditions needs to be met.

> 
> When there is no traffic 0 and 0 looks like reasonable values to me: I
> want the first of possibly many packets ASAP. Depending on the actual
> load, maybe one could employ some sort of a heuristics to keep good
> balance -- maybe based on a frequency of interrupts. Maybe DIM is
> actually exactly what I have in mind.

This patch is not to solve the scenario where dim exists, but what the
static value of the coalescing parameter is when the device is reset.
(please check some hhistorical discussion of this topic)

> 
> You seem more knowledgeable on the topic. How is this usually done? How
> are the optimal values correlated with device characteristics?


NICs such as mlx, ena, ice, and HiSilicon all have a non-zero static
coalescing value. Although they all support netdim, the static value is
still useful when dim is disabled.

As for the specific value, I think it is best to notify the driver through the
device itself, such as adding capability fileds or this:
https://lore.kernel.org/all/20240426065441.120710-3-hengqi@linux.alibaba.com/

> 
> > The parameters should be
> > exposed by each device.
> 
> I would like to better understand why. My intention is not to question
> the correctness of this statement, but to gain a better understanding.
> 
> > 
> > > thus keeps the defaults (until userspace decides to set the parameters).
> > > So it does matter whether the defaults are guaranteed to be 0 or not,
> > > and if not it does matter what defaults are chosen by the device.  
> > 
> > Didn't follow this. More below.
> >
> 
> Maybe my statement was wrong. So let me make a question out of it. What
> entity or entities do we expect to change the parameter values, and when
> or under which conditions do we expect them to change the parameter
> values?

Changed by the driver when the load changes or user..

>  
> > > 
> > > One could even argue that those patches have been reviewed under the
> > > assumption that the device needs to use 0 as the default parameter value.  
> > 
> > The default value should not be explicitly specified in the spec, because one
> > size does not fit multiple devices.
> 
> This ties in to my previous question about the relationship between
> device characteristics and the optimal values for max_usecs and
> max_packets.

Device characteristics and optimal max_usecs/frames are preferably communicated
via device capability, but at least should not be forced to a specific value by
the driver.

> 
> > The source of this problem is that we are
> > missing fields like default_{rx, tx}_coalesicng_params that indicate the device
> > capabilities. No?
> 
> I don't think so! In my understanding is that with your proposal
> after a reset, the OS/driver has no problem obtaining the defaults that
> indicate the device capabilities. But I would really like to better
> understand that device capabilities part.
> 
> And yes another way around this would have been say:
> * let us introduce those defaults fields, e.g. to the config space

Do you want to solve it by adding another new feature?
Otherwise, how do you solve the compatibility problem?

> * make the driver read those values as a part of the initialization

The spec is in conflict with this, because the driver can only read 0 from
devices that conform to the spec. I submitted this patch to achieve this goal:
https://lore.kernel.org/all/20240426065441.120710-3-hengqi@linux.alibaba.com/

> * and set those values as the initial parameters.

I don't support this, the device doesn't want to accept any initial
unreasonable settings.

Thanks.

> But frankly I see no benefit of that over what you propose here.
> 
> Regards,
> Halil
