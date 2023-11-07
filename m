Return-Path: <virtio-comment-return-8219-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E7B3C4332F
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 07:05:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id DF4112B078
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 07:05:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E6A109867FE
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 07:05:43 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C764F9867E3; Tue,  7 Nov 2023 07:05:43 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 06BA39867E4
	for <virtio-comment@lists.oasis-open.org>; Tue,  7 Nov 2023 07:05:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: n1vH70e7Oj2FdqC2x-afEw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699340723; x=1699945523;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cuMAJzbcBYymd1rJJJqXqPyb4t9JGGvgFNFRFbkDzYg=;
        b=XCmpsq3GHDvifDUl1K7e24//ffdC98YC9XrjdOB4D0ds4EQgRcKTbMu/wJUtTVpGVL
         pLvBTKgLQ7agjkvOQ8Guii7qqPFL0sBbXhBlPUd8OkI03pESoIf24OHpmyE+Fmouel53
         RrtzLWBjaO/oGJuvjPKlzark+kYbvrQZfcefgEo+SKIT3BsojJ4MI+n4Qv92slkkP8Dg
         YR/GgnLz8fJ0LdwSJpagQPg/REGb3vYiYcLp+MMF33usdEIIGbOgo5p5P5m92NQkOOK1
         eaIe7ImCTvWKyHVTExV97ncELwybbmoOZsXTGu24VGfxFJ+r6g9zbALFoBUjatYrzBp8
         OE4g==
X-Gm-Message-State: AOJu0Yw/se+KRWXZjunRFPDB0eN8oFY8yC3AkUDzwoerIhgsToh7NX7Z
	rKiAbAUqOD5ATmARADogGsRS86StHBmVU7+Duf6uM6ghxBiu3XYcIlsX5CKHkgsivU5VYr+UTVL
	gf5CxpvsuOoVtbIbveaUSxuY0LkXPVe27jBqaUi8QJQ==
X-Received: by 2002:adf:d1cb:0:b0:32f:8966:c39c with SMTP id b11-20020adfd1cb000000b0032f8966c39cmr19444711wrd.71.1699340722986;
        Mon, 06 Nov 2023 23:05:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEw6C6LXNOyl8i9Qxb8g0DUuRTvekOKCnPO7dUouQdzECfySD6DlpwG5jIdSB8tJCKmk7T5JA==
X-Received: by 2002:adf:d1cb:0:b0:32f:8966:c39c with SMTP id b11-20020adfd1cb000000b0032f8966c39cmr19444685wrd.71.1699340722564;
        Mon, 06 Nov 2023 23:05:22 -0800 (PST)
Date: Tue, 7 Nov 2023 02:05:17 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
	"lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Message-ID: <20231107015412-mutt-send-email-mst@kernel.org>
References: <20231030131959.1386107-7-parav@nvidia.com>
 <CACGkMEuHBRwH9LqC+_jBX5OFrzhJw88AZeAQBou+G_hZK1F2Ug@mail.gmail.com>
 <PH0PR12MB54811B1D566FA64E693E20D6DCA0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEuA6u-EJCsrhvBRKxB6nxG=H28SEh4ihM3Ptgn1FQdGKA@mail.gmail.com>
 <DM8PR12MB54809F8316720CE5C1BCFF33DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEtFyH_wJAqTz=jwosVM-=SRuO+wpT7NM=Eod8ExsxfTsg@mail.gmail.com>
 <PH0PR12MB54814420718AB387C0C84C07DCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtGvDxF1Dnb6FJDK8XEAUcast-7OnuzTyfAr7m0LURWMw@mail.gmail.com>
 <PH0PR12MB548152A30021BEBFFCA62AA9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEv8mccZfcA4n+KVwdkaWAqhM94Qhq8H5Rvw2CocCmt9UA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEv8mccZfcA4n+KVwdkaWAqhM94Qhq8H5Rvw2CocCmt9UA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of operation for write
 recording commands

On Tue, Nov 07, 2023 at 12:04:29PM +0800, Jason Wang wrote:
> > > > Each virtio and non virtio devices who wants to report their dirty page report,
> > > will do their way.
> > > >
> > > > > 3) inventing it in the virtio layer will be deprecated in the future
> > > > > for sure, as platform will provide much rich features for logging
> > > > > e.g it can do it per PASID etc, I don't see any reason virtio need
> > > > > to compete with the features that will be provided by the platform
> > > > Can you bring the cpu vendors and committement to virtio tc with timelines
> > > so that virtio TC can omit?
> > >
> > > Why do we need to bring CPU vendors in the virtio TC? Virtio needs to be built
> > > on top of transport or platform. There's no need to duplicate their job.
> > > Especially considering that virtio can't do better than them.
> > >
> > I wanted to see a strong commitment for the cpu vendors to support dirty page tracking.
> 
> The RFC of IOMMUFD support can go back to early 2022. Intel, AMD and
> ARM are all supporting that now.
> 
> > And the work seems to have started for some platforms.
> 
> Let me quote from the above link:
> 
> """
> Today, AMD Milan (or more recent) supports it while ARM SMMUv3.2
> alongside VT-D rev3.x also do support.
> """
> 
> > Without such platform commitment, virtio also skipping it would not work.
> 
> Is the above sufficient? I'm a little bit more familiar with vtd, the
> hw feature has been there for years.


Repeating myself - I'm not sure that will work well for all workloads. Definitely KVM did
not scan PTEs. It used pagefaults with bit per page and later as VM size
grew switched to PLM.  This interface is analogous to PLM, what Lingshan
proposed is analogous to bit per page - problem unfortunately is
you can't easily set a bit by DMA.

So I think this dirty tracking is a good option to have.



> >
> > > > i.e. in first year of 2024?
> > >
> > > Why does it matter in 2024?
> > Because users needs to use it now.
> >
> > >
> > > > If not, we are better off to offer this, and when/if platform support is, sure,
> > > this feature can be disabled/not used/not enabled.
> > > >
> > > > > 4) if the platform support is missing, we can use software or
> > > > > leverage transport for assistance like PRI
> > > > All of these are in theory.
> > > > Our experiment shows PRI performance is 21x slower than page fault rate
> > > done by the cpu.
> > > > It simply does not even pass a simple 10Gbps test.
> > >
> > > If you stick to the wire speed during migration, it can converge.
> > Do you have perf data for this?
> 
> No, but it's not hard to imagine the worst case. Wrote a small program
> that dirty every page by a NIC.
> 
> > In the internal tests we don’t see this happening.
> 
> downtime = dirty_rates * PAGE_SIZE / migration_speed
> 
> So if we get very high dirty rates (e.g by a high speed NIC), we can't
> satisfy the requirement of the downtime. Or if you see the converge,
> you might get help from the auto converge support by the hypervisors
> like KVM where it tries to throttle the VCPU then you can't reach the
> wire speed.

Will only work for some device types.



> >
> > >
> > > > There is no requirement for mandating PRI either.
> > > > So it is unusable.
> > >
> > > It's not about mandating, it's about doing things in the correct layer. If PRI is
> > > slow, PCI can evolve for sure.
> > You should try.
> 
> Not my duty, I just want to make sure things are done in the correct
> layer, and once it needs to be done in the virtio, there's nothing
> obviously wrong.

Yea but just vague questions don't help to make sure eiter way.


> > In the current state, it is mandating.
> > And if you think PRI is the only way,
> 
> I don't, it's just an example where virtio can leverage from either
> transport or platform. Or if it's the fault in virtio that slows down
> the PRI, then it is something we can do.
> 
> >  than you should propose that in the dirty page tracking series that you listed above to not do dirty page tracking. Rather depend on PRI, right?
> 
> No, the point is to not duplicate works especially considering virtio
> can't do better than platform or transport.

If someone says they tried and platform's migration support does not
work for them and they want to build a solution in virtio then
what exactly is the objection? virtio is here in the
first place because emulating devices didn't work well.

-- 
MST


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

