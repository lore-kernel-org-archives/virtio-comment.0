Return-Path: <virtio-comment-return-8260-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0207C4332F
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Nov 2023 08:17:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C71E82AC56
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Nov 2023 08:17:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9692E986CA0
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Nov 2023 08:17:28 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7BC57986C95; Wed,  8 Nov 2023 08:17:28 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6B460986C96
	for <virtio-comment@lists.oasis-open.org>; Wed,  8 Nov 2023 08:17:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: g4BSFc90P-WGo2XzmIltGg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699431445; x=1700036245;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zQXJ81kyC14FkvW+o1Nw5bYzuqNxckKZLzljZINOUCk=;
        b=FDOn5y3HMooCOx68SpXtyomj+jmfdNWpi6poGjioq1Xsy8zT3qGMf/0lDNO1XYD75a
         W04ObsPrMO5WGH1FpzUX+DGCk44xpD+YI3b8ZFK0fwb4tHQ8k0GdclKVJPlpZiYP8m/8
         TMv3qGR8aA0SOeESFt9mUU1gnUyY5gg3ajHz6a0DB2r0u7AR1zPdJ0sAkt/ESMxCekYC
         m4m6USE9ywxkLCqnDc4+zM9T3LIeGFAr57CVo9niRQkKGqfVVoFCAe1FkKLigsCn3sKu
         vHMu4pj8b9IGRpgJR8WPwDyQYbOU1cq1rJH+NWRUJI5clFWMUfmJ1lLi0dJ92O2yTEN+
         SIfg==
X-Gm-Message-State: AOJu0YwvpHOoZBLWR8gaEvWxMHHgUaNKpuZb7FgZLH3WOqYbq4PvMwa5
	OkTaEv7awnATZ8CC39Ld+Ez1rzrOdNCXl5jVJ/uEedT5/tJSBQDfq+943UoSCEnq2jcg9FnuWk+
	8D5QZTOb5zKujvnI5gq0dGcNOPPtSIwIL0w==
X-Received: by 2002:a05:600c:4f4d:b0:409:79cb:1df6 with SMTP id m13-20020a05600c4f4d00b0040979cb1df6mr1102162wmq.14.1699431444740;
        Wed, 08 Nov 2023 00:17:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFroA4CTAG/WahWxyPKlQyg0Cp+6XMLLyQYL6U3/Ns36mnTaT5mw3HNMXqLCSwMbKtNk/lo0A==
X-Received: by 2002:a05:600c:4f4d:b0:409:79cb:1df6 with SMTP id m13-20020a05600c4f4d00b0040979cb1df6mr1102142wmq.14.1699431444273;
        Wed, 08 Nov 2023 00:17:24 -0800 (PST)
Date: Wed, 8 Nov 2023 03:17:18 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
	"lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Message-ID: <20231108025854-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB54811B1D566FA64E693E20D6DCA0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEuA6u-EJCsrhvBRKxB6nxG=H28SEh4ihM3Ptgn1FQdGKA@mail.gmail.com>
 <DM8PR12MB54809F8316720CE5C1BCFF33DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEtFyH_wJAqTz=jwosVM-=SRuO+wpT7NM=Eod8ExsxfTsg@mail.gmail.com>
 <PH0PR12MB54814420718AB387C0C84C07DCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtGvDxF1Dnb6FJDK8XEAUcast-7OnuzTyfAr7m0LURWMw@mail.gmail.com>
 <PH0PR12MB548152A30021BEBFFCA62AA9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEv8mccZfcA4n+KVwdkaWAqhM94Qhq8H5Rvw2CocCmt9UA@mail.gmail.com>
 <20231107015412-mutt-send-email-mst@kernel.org>
 <CACGkMEv+jir2+f_vHmi_KjFXf0yz+EQmEbvzX0pheHKsVJkWZw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEv+jir2+f_vHmi_KjFXf0yz+EQmEbvzX0pheHKsVJkWZw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of operation for write
 recording commands

On Wed, Nov 08, 2023 at 12:28:36PM +0800, Jason Wang wrote:
> On Tue, Nov 7, 2023 at 3:05 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Tue, Nov 07, 2023 at 12:04:29PM +0800, Jason Wang wrote:
> > > > > > Each virtio and non virtio devices who wants to report their dirty page report,
> > > > > will do their way.
> > > > > >
> > > > > > > 3) inventing it in the virtio layer will be deprecated in the future
> > > > > > > for sure, as platform will provide much rich features for logging
> > > > > > > e.g it can do it per PASID etc, I don't see any reason virtio need
> > > > > > > to compete with the features that will be provided by the platform
> > > > > > Can you bring the cpu vendors and committement to virtio tc with timelines
> > > > > so that virtio TC can omit?
> > > > >
> > > > > Why do we need to bring CPU vendors in the virtio TC? Virtio needs to be built
> > > > > on top of transport or platform. There's no need to duplicate their job.
> > > > > Especially considering that virtio can't do better than them.
> > > > >
> > > > I wanted to see a strong commitment for the cpu vendors to support dirty page tracking.
> > >
> > > The RFC of IOMMUFD support can go back to early 2022. Intel, AMD and
> > > ARM are all supporting that now.
> > >
> > > > And the work seems to have started for some platforms.
> > >
> > > Let me quote from the above link:
> > >
> > > """
> > > Today, AMD Milan (or more recent) supports it while ARM SMMUv3.2
> > > alongside VT-D rev3.x also do support.
> > > """
> > >
> > > > Without such platform commitment, virtio also skipping it would not work.
> > >
> > > Is the above sufficient? I'm a little bit more familiar with vtd, the
> > > hw feature has been there for years.
> >
> >
> > Repeating myself - I'm not sure that will work well for all workloads.
> 
> I think this comment applies to this proposal as well.

Yes - some systems might be better off with platform tracking.
And I think supporting shadow vq better would be nice too.

> > Definitely KVM did
> > not scan PTEs. It used pagefaults with bit per page and later as VM size
> > grew switched to PLM.  This interface is analogous to PLM,
> 
> I think you meant PML actually. And it doesn't work like PML. To
> behave like PML it needs to
> 
> 1) log buffers were organized as a queue with indices
> 2) device needs to suspend (as a #vmexit in PML) if it runs out of the buffers
> 3) device need to send a notification to the driver if it runs out of the buffer
> 
> I don't see any of the above in this proposal. If we do that it would
> be less problematic than what is being proposed here.

What is common between this and PML is that you get the addresses
directly without scanning megabytes of bitmaps or worse -
hundreds of megabytes of page tables.

The data structure is different but I don't see why it is critical.

I agree that I don't see out of buffers notifications too which implies
device has to maintain something like a bitmap internally.  Which I
guess could be fine but it is not clear to me how large that bitmap has
to be. How does the device know? Needs to be addressed.


> Even if we manage to do that, it doesn't mean we won't have issues.
> 
> 1) For many reasons it can neither see nor log via GPA, so this
> requires a traversal of the vIOMMU mapping tables by the hypervisor
> afterwards, it would be expensive and need synchronization with the
> guest modification of the IO page table which looks very hard.

vIOMMU is fast enough to be used on data path but not fast enough for
dirty tracking? Hard to believe.  If true and you want to speed up
vIOMMU then you implement an efficient datastructure for that.

> 2) There are a lot of special or reserved IOVA ranges (for example the
> interrupt areas in x86) that need special care which is architectural
> and where it is beyond the scope or knowledge of the virtio device but
> the platform IOMMU. Things would be more complicated when SVA is
> enabled.

SVA being what here?

> And there could be other architecte specific knowledge (e.g
> PAGE_SIZE) that might be needed. There's no easy way to deal with
> those cases.

Good point about page size actually - using 4k unconditionally
is a waste of resources.


> We wouldn't need to care about all of them if it is done at platform
> IOMMU level.

If someone logs at IOMMU level then nothing needs to be done
in the spec at all. This is about capability at the device level.


> > what Lingshan
> > proposed is analogous to bit per page - problem unfortunately is
> > you can't easily set a bit by DMA.
> >
> 
> I'm not saying bit/bytemap is the best, but it has been used by real
> hardware. And we have many other options.
> 
> > So I think this dirty tracking is a good option to have.
> >
> >
> >
> > > >
> > > > > > i.e. in first year of 2024?
> > > > >
> > > > > Why does it matter in 2024?
> > > > Because users needs to use it now.
> > > >
> > > > >
> > > > > > If not, we are better off to offer this, and when/if platform support is, sure,
> > > > > this feature can be disabled/not used/not enabled.
> > > > > >
> > > > > > > 4) if the platform support is missing, we can use software or
> > > > > > > leverage transport for assistance like PRI
> > > > > > All of these are in theory.
> > > > > > Our experiment shows PRI performance is 21x slower than page fault rate
> > > > > done by the cpu.
> > > > > > It simply does not even pass a simple 10Gbps test.
> > > > >
> > > > > If you stick to the wire speed during migration, it can converge.
> > > > Do you have perf data for this?
> > >
> > > No, but it's not hard to imagine the worst case. Wrote a small program
> > > that dirty every page by a NIC.
> > >
> > > > In the internal tests we don’t see this happening.
> > >
> > > downtime = dirty_rates * PAGE_SIZE / migration_speed
> > >
> > > So if we get very high dirty rates (e.g by a high speed NIC), we can't
> > > satisfy the requirement of the downtime. Or if you see the converge,
> > > you might get help from the auto converge support by the hypervisors
> > > like KVM where it tries to throttle the VCPU then you can't reach the
> > > wire speed.
> >
> > Will only work for some device types.
> >
> 
> Yes, that's the point. Parav said he doesn't see the issue, it's
> probably because he is testing a virtio-net and so the vCPU is
> automatically throttled. It doesn't mean it can work for other virito
> devices.

Only for TX, and I'm pretty sure they had the foresight to test RX not
just TX but let's confirm. Parav did you test both directions?

> >
> >
> > > >
> > > > >
> > > > > > There is no requirement for mandating PRI either.
> > > > > > So it is unusable.
> > > > >
> > > > > It's not about mandating, it's about doing things in the correct layer. If PRI is
> > > > > slow, PCI can evolve for sure.
> > > > You should try.
> > >
> > > Not my duty, I just want to make sure things are done in the correct
> > > layer, and once it needs to be done in the virtio, there's nothing
> > > obviously wrong.
> >
> > Yea but just vague questions don't help to make sure eiter way.
> 
> I don't think it's vague, I have explained, if something in the virito
> slows down the PRI, we can try to fix them.

I don't believe you are going to make PRI fast. No one managed so far.

> Missing functions in
> platform or transport is not a good excuse to try to workaround it in
> the virtio. It's a layer violation and we never had any feature like
> this in the past.

Yes missing functionality in the platform is exactly why virtio
was born in the first place.

> >
> > > > In the current state, it is mandating.
> > > > And if you think PRI is the only way,
> > >
> > > I don't, it's just an example where virtio can leverage from either
> > > transport or platform. Or if it's the fault in virtio that slows down
> > > the PRI, then it is something we can do.
> > >
> > > >  than you should propose that in the dirty page tracking series that you listed above to not do dirty page tracking. Rather depend on PRI, right?
> > >
> > > No, the point is to not duplicate works especially considering virtio
> > > can't do better than platform or transport.
> >
> > If someone says they tried and platform's migration support does not
> > work for them and they want to build a solution in virtio then
> > what exactly is the objection?
> 
> The discussion is to make sure whether virtio can do this easily and
> correctly, then we can have a conclusion. I've stated some issues
> above, and I've asked other questions related to them which are still
> not answered.
> 
> I think we had a very hard time in bypassing IOMMU in the past that we
> don't want to repeat.
> 
> We've gone through several methods of logging dirty pages in the past
> (each with pros/cons), but this proposal never explains why it chooses
> one of them but not others. Spec needs to find the best path instead
> of just a possible path without any rationale about why.

Adding more rationale isn't a bad thing.
In particular if platform supplies dirty tracking then how does
driver decide which to use platform or device capability?
A bit of discussion around this is a good idea.


> > virtio is here in the
> > first place because emulating devices didn't work well.
> 
> I don't understand here. We have supported emulated devices for years.
> I'm pretty sure a lot of issues could be uncovered if this proposal
> can be prototyped with an emulated device first.
> 
> Thanks

virtio was originally PV as opposed to emulation. That there's now
hardware virtio and you call software implementation "an emulation" is
very meta.


> 
> 
> 
> 
> >
> > --
> > MST
> >


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

