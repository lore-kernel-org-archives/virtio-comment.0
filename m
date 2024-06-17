Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1725F1D688
	for <virtio-comment@lists.linux.dev>; Mon, 17 Jun 2024 02:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718591645; cv=none; b=FgF0EqRVQVfLQGcoD1zzuamuxHvBEDZvdwDwVQWUJrx3XfDzA2kI3u6e4iameYk+i18MjmRLGZMpSGf0scrTnOlEc9c5Y2JFvY/3py2OvCkJbQ2cEzkes3hqB72rc/uevHxg74kC+tCPZK1xoRRXVDCrESIpkaO2gHPevE8eCfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718591645; c=relaxed/simple;
	bh=M9B5/Q61qJpuT00ABATHdhBEN8Z1dLc93B6uQP4cWHs=;
	h=Message-ID:Subject:Date:From:To:Cc:References:In-Reply-To; b=UdfBJ1xv1b+m0uR0PdKo4LbQ3r7kn2DV7/5BCNMvZIgTMLP7cRbuxCJiqGV/61KAisqYRKJpH5tJBwCXO1yLPiecpYsqYol1w3ZJcYtR9ViIdXhOH9gyolWQhowC8SZMdTi24ELT4VeQQ0ykT9k/Hpt23+pc0Jt2KfcMYFCsrE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=JYW7hZtS; arc=none smtp.client-ip=115.124.30.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="JYW7hZtS"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1718591640; h=Message-ID:Subject:Date:From:To;
	bh=+hD5aiRp9vD/Q5h4CTGwtF4B64D1hjiJLeMDwvT0eDA=;
	b=JYW7hZtSTxSNtj15rOXUj5QNVBmaJXAxj9deTRFjFbi1be70QhYqH1gGzbay4Ub/5j+GvBvxmVfRCMRGLGi3oweGgGCFF0i5SARul9Ygr+Rf0oFr7agDZH85JaRPtWnBPJ+bMdVW17jE825mnrzU2TdfbHB6VsTsadeuSJTDN4k=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R851e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037067110;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0W8X5fUM_1718591639;
Received: from localhost(mailfrom:hengqi@linux.alibaba.com fp:SMTPD_---0W8X5fUM_1718591639)
          by smtp.aliyun-inc.com;
          Mon, 17 Jun 2024 10:33:59 +0800
Message-ID: <1718591277.4770932-5-hengqi@linux.alibaba.com>
Subject: Re: [PATCH v5] virtio-net: clarify coalescing parameters settings
Date: Mon, 17 Jun 2024 10:27:57 +0800
From: Heng Qi <hengqi@linux.alibaba.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Parav Pandit <parav@nvidia.com>
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
In-Reply-To: <20240613021132-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>

On Thu, 13 Jun 2024 02:13:50 -0400, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> On Tue, Jun 11, 2024 at 05:43:18PM +0000, Parav Pandit wrote:
> > 
> > 
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Tuesday, June 11, 2024 10:00 PM
> > 
> > 
> > > How we can we make progress with
> > > the realease but sure we don't make backwards compat a pain?
> > > 
> > > Ideas?
> > >
> > There is no functional break with this relaxation.
> > Device set some non-zero defaults and driver didn't modify them.... 
> > Anything broken? Unlikely.
> > And device/driver has better performance, is that a problem? Unlikely.
> > 

Sorry, my vacation just ended.

> 
> Yes, it is possible. Driver can cache values it sets
> and never query device with get.

Don't we already have a lot of behaviors to drive queries from devices?
RSS context, device stats.

> Before anything is set, driver will report incorrect values.

Devices that are widely supported and supported by good practices should have
any initialization value. Just reporting 0 is incorrect value. Although the
spec now says so.

> What will break as a result? Hard to predict.
> 
> 
> Given the patch is big, I am inclined to say it just should use
> a feature bit.
> 

This doesn't seem to break anything in my opinion, we just told the device that
now you can set more values.

Using new feature bits does not seem necessary.

Thanks.

> -- 
> MST
> 
