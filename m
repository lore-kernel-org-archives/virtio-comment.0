Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED0212F397
	for <virtio-comment@lists.linux.dev>; Mon, 10 Jun 2024 13:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718027793; cv=none; b=IWUG0Cj9E8R8NdP2axDjSwEvlNBsuPCDiJg09vD+BH3aa8Ek7jTA+Dg1tzbjGaFueWAOo5vdMTTiTn9LOKRcWkjtebptEEuauZH7kE8gqr2zPOE260PWtFIkHQoX+bvrYEKes0WXM4EL32Wv/ofwOaUDXUUfmQSIF4/BMkIgc8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718027793; c=relaxed/simple;
	bh=Wc0siQUP8KhnPYSbMlZHc0Qnuh0e8u36ndLAzfV5EJc=;
	h=Message-ID:Subject:Date:From:To:Cc:References:In-Reply-To; b=ktFNhLB0CqXtI8GD/E4pNqrqNb5LoJ6uWR6fEqSLu9n/eYP2HnyEiWgmS7Gc5/2xBsu2/rPySJmTpl7AvmaLEgn5v5zrnE3PbITHYW1UGOgg4yIwasGwooUj1/GMexcebQYaAd2ticZzGRngFi+wC92h4v6dRO/15DeN22HsN0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=h9BLZ0a2; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="h9BLZ0a2"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1718027781; h=Message-ID:Subject:Date:From:To;
	bh=xuRfMCenZVfcYmV2N3vmBAuyIO3DvYnXoH/uENlcpSA=;
	b=h9BLZ0a2ZSXQp8SnSyNmzUzMRk/dLdxDRqWmlEIBhjGqz6qKI26xb38Q2WPszGQcTwzhEXLq4qS87aTKVPQP2ft9UTWfCPhOv+2dozGUhhzS53Z4TPtXlfAljqQRMqQhdAvsESdg1VQH0um2IAtI/HtDjf+63rHIgGvTwQ69gSQ=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R911e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045046011;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0W8Cu7y6_1718027780;
Received: from localhost(mailfrom:hengqi@linux.alibaba.com fp:SMTPD_---0W8Cu7y6_1718027780)
          by smtp.aliyun-inc.com;
          Mon, 10 Jun 2024 21:56:21 +0800
Message-ID: <1718026545.7557275-2-hengqi@linux.alibaba.com>
Subject: Re: [PATCH v5] virtio-net: clarify coalescing parameters settings
Date: Mon, 10 Jun 2024 21:35:45 +0800
From: Heng Qi <hengqi@linux.alibaba.com>
To: Halil Pasic <pasic@linux.ibm.com>, "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>
Cc: virtio-comment@lists.linux.dev,
 Jason Wang <jasowang@redhat.com>,
 Parav Pandit <parav@nvidia.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Halil Pasic <pasic@linux.ibm.com>
References: <20240528044702.50603-1-hengqi@linux.alibaba.com>
 <20240607220246.3213607c.pasic@linux.ibm.com>
 <1717814062.4461155-1-hengqi@linux.alibaba.com>
 <20240610144602.57a04723.pasic@linux.ibm.com>
In-Reply-To: <20240610144602.57a04723.pasic@linux.ibm.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>

On Mon, 10 Jun 2024 14:46:02 +0200, Halil Pasic <pasic@linux.ibm.com> wrote:
> On Sat, 8 Jun 2024 10:34:22 +0800
> Heng Qi <hengqi@linux.alibaba.com> wrote:
> 
> > On Fri, 7 Jun 2024 22:02:46 +0200, Halil Pasic <pasic@linux.ibm.com> wrote:
> > > On Tue, 28 May 2024 12:47:02 +0800
> > > Heng Qi <hengqi@linux.alibaba.com> wrote:
> > >   
> > > > The device can set any initial coalescing parameters (0 or non-zero)
> > > > for the receive/send queue before the setting command is executed,
> > > > not just 0, enhancing device performance even without DIM enabled.
> > > > 
> > > > So we need to clarify descriptions that don't fit the behavior.  
> > > 
> > > Sorry I'm late to the party -- again! Just for my understanding: how/why
> > > is this a clarification and not just a (basically incompatible) change?  
> > 
> > In my opinion, "clarification" means that something may have been described
> > incorrectly before, and we now need to discuss, explain clearly, and correct
> > the possibly incorrect description.
> > 
> 
> I figure the difference in perceived semantics of the word
> "clarification" is at the root of my confusion. Let us have a look at
> https://dictionary.cambridge.org/de/worterbuch/englisch/clarification
> 
> According to my understanding a "clarification", while an improvement in
> ease of understanding and/or decrease of ambiguity (possibly to no
> ambiguity at all) implies that what receiving a clarification is not
> outright wrong.
> 
> When rectifying something that is outright incorrect or wrong, I would
> refer to that with words like "correction", "fix", "erratum" or
> "corrigendum".
> 
> > > 
> > > I mean if I read this correctly, before the driver had the guaranty
> > > that if the parameters are not set by the driver, negotiating the
> > > feature does not introduce any coalescing. After this in theory
> > > the device could just pick some max value and potentially introduce
> > > maximal latency in certain scenarios.  
> > 
> > "maximum latency" also means "throughput improvement".
> > 
> 
> Under certain assumptions. But not necessarily. Again my concern is
> mostly the type of change. The virtio standard maintain a revision
> history appendix, and I would like to avoid the nature of this change
> being misrepresented there. If Connie and/or Michael think it is worth
> fixing, I believe it can be fixed with an editorial change.
> 
> AFAIU VIRTIO_NET_F_NOTF_COAL and VIRTIO_NET_F_VQ_NOTF_COAL are about to
> land with virtio-1.3, i.e. there is no released/standardized virtio
> version where the "initialize to 0" is released. In that sense it looks
> like we are still on time to change this. But I am not 100% certain. In
> any case I don't think this as a huge impact and I'm fine going ahead
> with the change.

Sorry for the late reply, I'm on vacation.

I agree with this, and I prefer to release this patch as a correction for
virtio1.3 instead of a new patch for virtio1.4, because if devices support moderation coalescing based on virtio1.3,
and after virtio1.4 is released, these devices need to be updated again for a
more reasonable coalescing parameters.

Cornelia and Michael, what do you think?

> 
> > > 
> > > I understand that it is probably in the best interest of the devices to
> > > not pick stupid defaults. But it is also probably in the best interest
> > > of the driver to set those params, and if the driver is going to set its
> > > values, the devices defaults are moot unless we assume that those may end
> > > up being used by the driver as a hint when deciding which parameter
> > > values to choose.  
> > 
> > "Any values" is compatible with "0 for max-usecs and max-frames", and the device
> > can choose "no coalescing".
> > 
> > "No coalescing" means "latency friendly", but it also means "a lot of
> > interruptions and throughput unfriendly". 
> 
> To what extent does virtio's "normal" notification suppression
> (VIRTIO_F_EVENT_IDX) would alleviate that in practice? At least in
> theory the interruption suppression could save us there right? 
> 

Interruption suppression is useful, but many scenes still have a lot of
interruptions.

> 
> > If the device chooses a stupid
> > maximum value, it is his choice (spec should give more devices choices instead of
> > forcing them to choose "0" which is not the best practice). We can't talk about
> > performance for drivers when the devices tend to choose any "stupid" designs.
> > 
> > We need relaxe the restrictions and makes the spec more reasonable.
> > 
> 
> Hm, I see Linux virtio-net changes have landed with v6.0 and if I read
> those correctly the driver -- contrary to my initial expectation --
> negotiates the feature, but does not set the parameters explicitly and

How does the driver know what parameters to set? The parameters should be
exposed by each device.

> thus keeps the defaults (until userspace decides to set the parameters).
> So it does matter whether the defaults are guaranteed to be 0 or not,
> and if not it does matter what defaults are chosen by the device.

Didn't follow this. More below.

> 
> One could even argue that those patches have been reviewed under the
> assumption that the device needs to use 0 as the default parameter value.

The default value should not be explicitly specified in the spec, because one
size does not fit multiple devices. The source of this problem is that we are
missing fields like default_{rx, tx}_coalesicng_params that indicate the device
capabilities. No?

Thanks.

> 
> Well no strong opinions here. If the community is fine with it, I'm fine
> with it as well.
> 
> Thank you!
> 
> Regards,
> Halil
