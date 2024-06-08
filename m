Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5437D7F
	for <virtio-comment@lists.linux.dev>; Sat,  8 Jun 2024 02:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717814528; cv=none; b=masatIUrgbq7YrH3nHcHaieZ/GlKylByh2KgfI7f3i0w7ITj4XHgoEQsOkxG0XrZ26lv01HEwW/AjeiEzKGKbz3WhnRZBvP1pmKTZ1iK22jBnM7xZqgJE8JfzIvpV6P+Pwid2WFx+l2Z/+h5hBBtAAf9PULp7MBvaHlVy2xFLJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717814528; c=relaxed/simple;
	bh=eQjmk9PSNIKNScNQVqebhYJnDTpAAdYUaQUfnKUDmtM=;
	h=Message-ID:Subject:Date:From:To:Cc:References:In-Reply-To; b=KNknJ1gMpUsv8zrvg8h0vjGbjk+ipZQU328XqoMMC3mKmxJ9rxXR47KN0ixoc4xgnWviMxT2TV6M7ARTQTmsaoSR3vn3XFzcPEfzyUor8Yd3KLbEYAatvdEr8pBj2/xJVyOAcZAXgqFF/kYDYG8cxVHYwmHDpWQrwkY5NzLGsDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=jhPoS9G1; arc=none smtp.client-ip=115.124.30.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="jhPoS9G1"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1717814517; h=Message-ID:Subject:Date:From:To;
	bh=x3VeVWQ5HWZM8e9Bc6OIyhwQ2vXovyuVRm7+hjhfq+Q=;
	b=jhPoS9G12YXi6kAmyjwPQ9vr/E7SpufaL0aw8+1YpeB8kYnSVLM3I5bYOWWY4qJ4g2MG7w8FSc1PbRPjg6gj59NPxg+ktwyJqIzyshRq75iHbrtJyAYpMO9E7fkk5nj/j9ldE867QuZBbJ9/f+Fu2IFjnPmpjFc2VA12BDaGnjQ=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033068173054;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0W80Uyld_1717814515;
Received: from localhost(mailfrom:hengqi@linux.alibaba.com fp:SMTPD_---0W80Uyld_1717814515)
          by smtp.aliyun-inc.com;
          Sat, 08 Jun 2024 10:41:55 +0800
Message-ID: <1717814062.4461155-1-hengqi@linux.alibaba.com>
Subject: Re: [PATCH v5] virtio-net: clarify coalescing parameters settings
Date: Sat, 8 Jun 2024 10:34:22 +0800
From: Heng Qi <hengqi@linux.alibaba.com>
To: Halil Pasic <pasic@linux.ibm.com>
Cc: virtio-comment@lists.linux.dev,
 Jason Wang <jasowang@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Parav Pandit <parav@nvidia.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Halil Pasic <pasic@linux.ibm.com>
References: <20240528044702.50603-1-hengqi@linux.alibaba.com>
 <20240607220246.3213607c.pasic@linux.ibm.com>
In-Reply-To: <20240607220246.3213607c.pasic@linux.ibm.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>

On Fri, 7 Jun 2024 22:02:46 +0200, Halil Pasic <pasic@linux.ibm.com> wrote:
> On Tue, 28 May 2024 12:47:02 +0800
> Heng Qi <hengqi@linux.alibaba.com> wrote:
> 
> > The device can set any initial coalescing parameters (0 or non-zero)
> > for the receive/send queue before the setting command is executed,
> > not just 0, enhancing device performance even without DIM enabled.
> > 
> > So we need to clarify descriptions that don't fit the behavior.
> 
> Sorry I'm late to the party -- again! Just for my understanding: how/why
> is this a clarification and not just a (basically incompatible) change?

In my opinion, "clarification" means that something may have been described
incorrectly before, and we now need to discuss, explain clearly, and correct
the possibly incorrect description.

> 
> I mean if I read this correctly, before the driver had the guaranty
> that if the parameters are not set by the driver, negotiating the
> feature does not introduce any coalescing. After this in theory
> the device could just pick some max value and potentially introduce
> maximal latency in certain scenarios.

"maximum latency" also means "throughput improvement".

> 
> I understand that it is probably in the best interest of the devices to
> not pick stupid defaults. But it is also probably in the best interest
> of the driver to set those params, and if the driver is going to set its
> values, the devices defaults are moot unless we assume that those may end
> up being used by the driver as a hint when deciding which parameter
> values to choose.

"Any values" is compatible with "0 for max-usecs and max-frames", and the device
can choose "no coalescing".

"No coalescing" means "latency friendly", but it also means "a lot of
interruptions and throughput unfriendly". If the device chooses a stupid
maximum value, it is his choice (spec should give more devices choices instead of
forcing them to choose "0" which is not the best practice). We can't talk about
performance for drivers when the devices tend to choose any "stupid" designs.

We need relaxe the restrictions and makes the spec more reasonable.

Thanks.

> What am I missing here?
> 
> Regards,
> Halil
