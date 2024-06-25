Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3517344F
	for <virtio-comment@lists.linux.dev>; Tue, 25 Jun 2024 08:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719302795; cv=none; b=swNrDwnB7uUd+TI9gkcNomdzAOkrz80HMiNdHhiUV/79+UmykmKLRHyyOOwkR+xMBlsCHBXD1ZH5oaiaK+z0R5flBtDEGVG6ZDseuUGjNdSEFyqZkoEV9Z3VvRRbv/xFNPJdrdBo+xx98Q/631gwmuP7TFE3URgk75aO8jn0s6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719302795; c=relaxed/simple;
	bh=9CiIAiwTMVoobE7WvYqI1KDpr7vHaZhBYQCxdE1pw50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=hTEbQWLDFvMhzRv957ylqX1lDou2YftHnsTFzaEkJKuxjts3YiYRqXgr870VWyXIGCsV9yppyEIm6w+GODczXbPjTbD1SINgJwC+T+oyip0tbfr93OS2ikLzMWiEfTvSoZKACnGvXWl7yvM6AHYYAEcd0l9Ose2m6s3XB0Q8QK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VtkbEJi+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VtkbEJi+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719302793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UOlDulrvQ9S+PczO94Hl8F6vI0i17FewHdfcKTlyL7o=;
	b=VtkbEJi+Bk3JO/EbQGcn3RYJCGIkfoCpFBhZCUSV+MU2I7Q18M56rhSW9wuc/ssdskeSUz
	X42/A9g75gfzjbLEb8dVCEuuJJH9ONLend0979Ld2/jNQ6lqVGSoFDbzCfgTclHZcKoL44
	U9REQ77Zfe6cnI14Bo3KR6JgAhBQvxw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-7yvhr9yoMo-8cNDZFm2-1g-1; Tue, 25 Jun 2024 04:06:31 -0400
X-MC-Unique: 7yvhr9yoMo-8cNDZFm2-1g-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4217f941ca8so32487935e9.1
        for <virtio-comment@lists.linux.dev>; Tue, 25 Jun 2024 01:06:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719302790; x=1719907590;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UOlDulrvQ9S+PczO94Hl8F6vI0i17FewHdfcKTlyL7o=;
        b=sJoY3U8EYAajKOJgpwyNcBI3E56ZJNIH33Eyrdog65kjwMNCNVVGThzxj6A8qRJ9Lb
         4ZKLcvDpHpWd/8U9ZeL+PV3ydnMd0hD1x5d6DBmu/Wp+vORjJsJ+naDHXleVDaCyGHa6
         TxtdYk8MgsKKhP8XVZhjnS58nY9Ff3tBJF4HtwbcYMTcEuEOriWV/8CDy2Hc3mLzE9xY
         kltmoU12IqtqhESWAvcyfxktjFLlXbolcp4uSUxHtJHpQw95Na6VpDRWRa7ChJbE0Aaz
         5YfgIXI5DRb1iL4BZo3KLkPQ8dDd0uGwQAd5RuPLyNFiPPCvp2sdjUHFGdl+YAuLu5r3
         mEJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVYFtPwZodhysDybfWl6oDHH1JDO+LpN5al53F9sj0jxlbo+vfnAodmdKiE849Hi1vxSED0tKb8McKk9ZQF/n64eXzE24Wm3j9N3ovXMU=
X-Gm-Message-State: AOJu0Yymw4OHmh0APoo9khiCoQFufO5oh12wpZjVMhH7XEhVN5qrth6g
	M7smDF0VhJUnvMNM4AqTMS6I0Fqw0d+2qych/XgfJq5HAkR5rQggPiU9oumGk3jzLGLnFUrcMiV
	WUZn3tY3SCneqjfjI5C6pCAmDCrrb+yg4VGOLDmP6UlKRi8v1YWZrSNYaEDuEn3y3
X-Received: by 2002:a05:600c:17d7:b0:424:a49a:ff0a with SMTP id 5b1f17b1804b1-424a49affc2mr4269545e9.15.1719302790435;
        Tue, 25 Jun 2024 01:06:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGV3oZ1hkF39EgcdwS/yWXHogygiHILs4j/T9w0epB4t1IAtZcEZLa5knoM9j4dHGWw/xa44g==
X-Received: by 2002:a05:600c:17d7:b0:424:a49a:ff0a with SMTP id 5b1f17b1804b1-424a49affc2mr4269295e9.15.1719302789710;
        Tue, 25 Jun 2024 01:06:29 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:342:f1b5:a48c:a59a:c1d6:8d0a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0be80dsm201014535e9.19.2024.06.25.01.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 01:06:29 -0700 (PDT)
Date: Tue, 25 Jun 2024 04:06:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Si-Wei Liu <si-wei.liu@oracle.com>, Heng Qi <hengqi@linux.alibaba.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Parav Pandit <parav@nvidia.com>
Subject: Re: [PATCH v5] virtio-net: clarify coalescing parameters settings
Message-ID: <20240625040500-mutt-send-email-mst@kernel.org>
References: <20240611122756-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54813E2EE4EA2BA729B2F6B7DCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240613021132-mutt-send-email-mst@kernel.org>
 <1718591277.4770932-5-hengqi@linux.alibaba.com>
 <77ec85ae-0f50-4093-b499-3b6defec4ade@oracle.com>
 <1718869209.8824844-6-hengqi@linux.alibaba.com>
 <e774e811-27ba-4151-b300-e22161f1b4d5@oracle.com>
 <1718940245.6932242-13-hengqi@linux.alibaba.com>
 <b9e47c91-46aa-4526-b441-de48906f1ae4@oracle.com>
 <CACGkMEvFmh-xq5TWqf16YMPSVkmz1BfKcuR7H9vw1zmouD-kZw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CACGkMEvFmh-xq5TWqf16YMPSVkmz1BfKcuR7H9vw1zmouD-kZw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Jun 25, 2024 at 03:53:33PM +0800, Jason Wang wrote:
> On Sat, Jun 22, 2024 at 7:46 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
> >
> >
> >
> > On 6/20/2024 8:24 PM, Heng Qi wrote:
> > > On Thu, 20 Jun 2024 18:21:03 -0700, "Si-Wei Liu" <si-wei.liu@oracle.com> wrote:
> > >>
> > >> On 6/20/2024 12:40 AM, Heng Qi wrote:
> > >>> On Mon, 17 Jun 2024 16:31:25 -0700, "Si-Wei Liu" <si-wei.liu@oracle.com> wrote:
> > >>>> On 6/16/2024 7:27 PM, Heng Qi wrote:
> > >>>>> On Thu, 13 Jun 2024 02:13:50 -0400, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > >>>>>> On Tue, Jun 11, 2024 at 05:43:18PM +0000, Parav Pandit wrote:
> > >>>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
> > >>>>>>>> Sent: Tuesday, June 11, 2024 10:00 PM
> > >>>>>>>> How we can we make progress with
> > >>>>>>>> the realease but sure we don't make backwards compat a pain?
> > >>>>>>>>
> > >>>>>>>> Ideas?
> > >>>>>>>>
> > >>>>>>> There is no functional break with this relaxation.
> > >>>>>>> Device set some non-zero defaults and driver didn't modify them....
> > >>>>>>> Anything broken? Unlikely.
> > >>>> Generally it's inappropriate to leave this decision making to the device
> > >>>> for what would be the best / most performant default config, as the
> > >>>> device is generally considered agnostic to the guest load...
> > >>> Instead, the performance of the virtual machine and the driver depends heavily
> > >>> on how the device is implemented, just as we have proposed various ways to
> > >>> offload the data queue in the device to the hardware. The reason why most
> > >>> devices use software to simulate ctrlq instead of using hardware offload is
> > >>> that the driver has no requirements for the performance of ctrlq before, that is,
> > >>> the device implementation is responsible for and meets the driver's performance
> > >>> requirements.
> > >> I am not sure I follow the arguments of ctrlq being s/w or h/w, I
> > >> thought that it was for the debate why we need coalescing on hardware
> > >> offload device in the first place, instead of reusing event index or
> > >> similar s/w based notification suppression. I don't doubt the value of
> > >> coalescing, but how's it relevant to the default value disposition?
> > >> Generally the default config disposition is not considered to be part of
> > >> device implementation, especially when it comes to the situation where
> > >> device can't easily figure out the specific workload to occur in the
> > >> guest, and there's no perfect single default value that could meet every
> > >> single performance metric across the board. This is a typical tuning
> > >> knob left up to the user to adjust, why the device or driver needs to
> > >> set or load the initial value? The driver just needs to start with
> > >> certain value, be it 0 or non-zero, which guest user can override at any
> > >> point of time, depending on his/her need, and that's it! I guess I still
> > >> don't understand your user case here, why device / driver default is of
> > >> such importance.
> > > I've explained that, and I understand your argument is why default value is needed,
> > > and users should be able to adjust them, right?
> > Sounds about right. You'll soon realize that there's no perfect default
> > that could work with everyone - in that it's just a static value to
> > begin with, no matter whatever initial value the device comes up with,
> > one user or another will come over to you and complain that what is
> > loaded from the device doesn't match the workload they have, so those
> > users are still expected to adjust manually tweaking for their own. As
> > long as it's a tunable that guest user can control and override anytime,
> > I don't feel it too much different what initial config the device would
> > start with.
> 
> Think hard of these, I think there's probably no conflict between the
> points of each.
> 
> Generally, it's very hard to have a default value for virtio-net moderation as
> 
> 1) various implementations of virtio-net
> 2) various setups of virtio-net (from virtual to physical, from 1G to 100G)
> 3) various kind of workloads
> 
> But it doesn't mean the device can not have something by default which
> the vendor thinks it works well for in most cases. And anyhow the
> value could be overridden by the driver if it wants (e.g several Linux
> networking drivers will try to set a good default moderation value
> during probe).
> 
> Thanks

Do we want to just burn a feature bit on this then?
I also think we need to have a way to reset to that
default value. Maybe setting #packets to 0 should do that?


-- 
MST

