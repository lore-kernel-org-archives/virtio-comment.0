Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16B31D543
	for <virtio-comment@lists.linux.dev>; Thu, 20 Jun 2024 08:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718870704; cv=none; b=aKV51pMZtt1c40ij3RlrD4UW5dRPxA+LaRh+SfFvW2fLXkzadsQrwNHTlKyq7706rY2k91G6E3C352WaZEQgcBCg+rVmiVBrv1uUN2qDTX1YRrdhkKT2LzLad9fJmzfMOcOKGTz//nOb29Xs5BA+5q7ZrJonL01u/p+PNYrrbJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718870704; c=relaxed/simple;
	bh=lvt3xEkVyQyuoKH+wCALxE/124tAiYzSun62mC0CSwo=;
	h=Message-ID:Subject:Date:From:To:Cc:References:In-Reply-To; b=mg0hTRSyBfFEh/ye9T3LSqAzaaTVy+VjvNwvS21SfapRUA2eEMwOUjTXNGIDQ7kSOqy9CL7B5bU/M4o93MXEk+IagQX2C78CXvD7lwDSA5LDJO2YvJUxzc8PnrPFJJYls0SHypdD51ZKyvipCqa92pehGnNYnZ7qek1hCLWwGpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=IoUAecUz; arc=none smtp.client-ip=115.124.30.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="IoUAecUz"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1718870693; h=Message-ID:Subject:Date:From:To;
	bh=Y7aHpxfwYAGZQ1tI3RUbDjWNCjD5t+hKYeVXq88ZZkM=;
	b=IoUAecUztVCSv4N1fCfqkbcjtCCz3R/sUgx+YYcZQSbdAIAGnmp3nMxjo4TwR9FWMkerOkqGZQKRnHfCbVbA9EflXazh55b8eIfDQMlh4hTyOgwkm1k9HtUyneKrVWO2QLSsL1wc3gY0eNmFj0V9EChZcckWNxgN+FFot9sTwvo=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R791e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033068164191;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0W8qf1XA_1718870692;
Received: from localhost(mailfrom:hengqi@linux.alibaba.com fp:SMTPD_---0W8qf1XA_1718870692)
          by smtp.aliyun-inc.com;
          Thu, 20 Jun 2024 16:04:52 +0800
Message-ID: <1718869209.8824844-6-hengqi@linux.alibaba.com>
Subject: Re: [PATCH v5] virtio-net: clarify coalescing parameters settings
Date: Thu, 20 Jun 2024 15:40:09 +0800
From: Heng Qi <hengqi@linux.alibaba.com>
To: "Si-Wei Liu" <si-wei.liu@oracle.com>
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Parav Pandit <parav@nvidia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20240528044702.50603-1-hengqi@linux.alibaba.com>
 <20240607220246.3213607c.pasic@linux.ibm.com>
 <1717814062.4461155-1-hengqi@linux.alibaba.com>
 <20240610144602.57a04723.pasic@linux.ibm.com>
 <1718026545.7557275-2-hengqi@linux.alibaba.com>
 <20240610221900.1810ea96.pasic@linux.ibm.com>
 <1718102433.0456574-3-hengqi@linux.alibaba.com>
 <20240611122756-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54813E2EE4EA2BA729B2F6B7DCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240613021132-mutt-send-email-mst@kernel.org>
 <1718591277.4770932-5-hengqi@linux.alibaba.com>
 <77ec85ae-0f50-4093-b499-3b6defec4ade@oracle.com>
In-Reply-To: <77ec85ae-0f50-4093-b499-3b6defec4ade@oracle.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>

On Mon, 17 Jun 2024 16:31:25 -0700, "Si-Wei Liu" <si-wei.liu@oracle.com> wrote:
> 
> 
> On 6/16/2024 7:27 PM, Heng Qi wrote:
> > On Thu, 13 Jun 2024 02:13:50 -0400, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >> On Tue, Jun 11, 2024 at 05:43:18PM +0000, Parav Pandit wrote:
> >>>
> >>>> From: Michael S. Tsirkin <mst@redhat.com>
> >>>> Sent: Tuesday, June 11, 2024 10:00 PM
> >>>
> >>>> How we can we make progress with
> >>>> the realease but sure we don't make backwards compat a pain?
> >>>>
> >>>> Ideas?
> >>>>
> >>> There is no functional break with this relaxation.
> >>> Device set some non-zero defaults and driver didn't modify them....
> >>> Anything broken? Unlikely.
> Generally it's inappropriate to leave this decision making to the device 
> for what would be the best / most performant default config, as the 
> device is generally considered agnostic to the guest load...

Instead, the performance of the virtual machine and the driver depends heavily
on how the device is implemented, just as we have proposed various ways to
offload the data queue in the device to the hardware. The reason why most
devices use software to simulate ctrlq instead of using hardware offload is
that the driver has no requirements for the performance of ctrlq before, that is,
the device implementation is responsible for and meets the driver's performance
requirements.


>Unless the 
> device is specially hard wired to some fixed guest setup that users 
> couldn't change, it doesn't seem logical that the device could derive 
> the best or most performant config on driver's behalf. What if the guest 
> wants best latency for its load but the device just blindlessly guess 
> the guest might prefer throughput friendly that it miserably uses 
> latency impacting non-zero default? 

The device does not want to guess and cannot guess. This patch does not force
the device to choose a non-zero value, but relaxes it to allow the device to
choose 0 or non-zero, which is very friendly to virtual machines with different
performance requirements, right?

>Could this device side change for 
> the default config regress boot time performance (which may need best 
> latency over throughput)?

Don't make these assumptions, what if the driver needs better throughput?

> 
> >>> And device/driver has better performance, is that a problem? Unlikely.
> >>>
> Even for rare case with a hard wired setup, the way to tackle the very 
> problem using device's default is still quite questionable. Usually the 
> mgmt software or network config utility should be equipped with some 
> default value if need be. And we know the guest has the best position to 
> impose the best / most performant config for its own load. What is the 
> issue or use case that this initial config couldn't be applied by the 
> guest mgmt software ahead but has to resort to the device to load some 
> default (which is odd and irrelevant to any guest load), before the 
> interface is brought up for operation i.e. performing I/O?

Use cases are everywhere, Alibaba Cloud, MLX and all other modern network cards
have a default value that is not 0.
(0 is actually a kind of default value)

> 
> > Sorry, my vacation just ended.
> >
> >> Yes, it is possible. Driver can cache values it sets
> >> and never query device with get.
> > Don't we already have a lot of behaviors to drive queries from devices?
> > RSS context, device stats.
> >
> >> Before anything is set, driver will report incorrect values.
> > Devices that are widely supported and supported by good practices should have
> > any initialization value. Just reporting 0 is incorrect value. Although the
> > spec now says so.
> I don't have an aligned view here, sorry. As I recall having 0 as the 
> default is just to keep device started in a state where coalescing is 
> disabled, so it's backward compatible and consistent with a 
> non-coalescing supporting driver - such that it won't yield surprising 
> effect (for e.g. regressed latency) inadvertently after user's getting 
> driver software upgraded. Unlike the other virtio-net features that 
> could 100% improve performance in all aspect, this coalescing feature is 
> more of a performance tuning knob that may improve performance metrics 
> (such as cpu usage or throughput) of one dimension while demoting the 
> others (such as latency, jitter or connection rate) from the equation. 
> That said, there's not a single and fixed set of default config that 
> device could supply which is able to satisfy all kind of guest load. 
> Rather than rely on the device to offer a matching default for driver 
> (which I think it's technically wrong), I'd lean to having guest 
> software or network utility to apply the initial config for the guest, 
> where they should have best knowledge for the specific guest workload 
> than what device could do.

Before this feature, a good device implementation should also support coalescing
(of course we don't necessarily assume it has coalescing). In addition, virtual
machines that tend to favor latency and throughput exist. If the device supported
by the manufacturer needs to provide a low-latency virtual machine, please
continue to keep the default value of 0.

> 
> >
> >> What will break as a result? Hard to predict.
> >>
> >>
> >> Given the patch is big, I am inclined to say it just should use
> >> a feature bit.
> 
> > This doesn't seem to break anything in my opinion, we just told the device that
> > now you can set more values.
> Another thing this could break is live migration between devices with 
> varied default. How do you make sure the guest doesn't rely on some 
> default from the source device, while on the destination it just doesn't 
> get the same default coalescingjjj value? To get rid of this side effect 
> the guest would still need to apply the initial config for its own, 
> anyway... Which eventually would render this proposal with arbitrary 
> default rather pointless.

I don't quite understand why this would affect hot migration, the values
would be migrated over.

Thanks.

> 
> 
> Thanks,
> -Siwei
> >
> > Using new feature bits does not seem necessary.
> >
> > Thanks.
> >
> >> -- 
> >> MST
> >>
> 
