Return-Path: <virtio-comment-return-8254-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62CD1C4167B
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Nov 2023 04:28:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 843742AD5E
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Nov 2023 04:28:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 65045986C9A
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Nov 2023 04:28:52 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4B057986C8F; Wed,  8 Nov 2023 04:28:52 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 38DE3986C90
	for <virtio-comment@lists.oasis-open.org>; Wed,  8 Nov 2023 04:28:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: C6vOBJTYMvWipSNTA0M2WQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699417728; x=1700022528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H3BmCi+FydZdrty3Avnt6jU6I3LDZsyTtbB/BoNS3rw=;
        b=Qs8lOJLqarjCBmNMqrDAjCCbwFtslFPTiOLJSfVJaY5J2VeRs2/ORPsT1mGIVloM2p
         cS2X+Bn7pm/K8RxmFUwx0kdjtrKtPQ91J6IBcXPAztn9j0GggUC6N3UdWwXycgPA8YTg
         5h4x47LedTktLe8tpNjQgR6ITnJG3wt0yiC5tzODpzCNPRfQquoNWqadj7fVhp6xLwFv
         SNF+xCXsa1SkJAnkS5go2fzNm8cZwh3N7FzuTCDonfMoHFREII+gp56SfWOd+R1bU5L7
         lUJ9WWx2seBluJmvTB19U1SmTk+1mVlPv9DrF0Z+4tM/kEdXG2uCWaD3Uo7Wm2fjc55P
         oX/Q==
X-Gm-Message-State: AOJu0YxGojUgBq07Z+wKxQE5131BmoFglC/O0cNrVSXmPYxW9tl1q1fG
	wZSWNMAy4vGi6GerilYLSduQapKtwJkQAyzcMvjnH1YQVlx+tXxHWEWkkhPA0SEc5gJPZ0msjFK
	/AC5dK+UjSRy2YF4bubAcB3eAQLYlVICno17TTyMwW0H1rNEYqw==
X-Received: by 2002:a19:4f18:0:b0:504:33ff:156a with SMTP id d24-20020a194f18000000b0050433ff156amr1778540lfb.11.1699417727925;
        Tue, 07 Nov 2023 20:28:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHAFybcECxZ4yFHJX72S2O6kf1n7Ll97IAF/4Aa+o4XAW1VkVaPnPgqyXHXEHWExiGLBtHAuMPQmuRNNtt6rU=
X-Received: by 2002:a19:4f18:0:b0:504:33ff:156a with SMTP id
 d24-20020a194f18000000b0050433ff156amr1778531lfb.11.1699417727514; Tue, 07
 Nov 2023 20:28:47 -0800 (PST)
MIME-Version: 1.0
References: <20231030131959.1386107-7-parav@nvidia.com> <CACGkMEuHBRwH9LqC+_jBX5OFrzhJw88AZeAQBou+G_hZK1F2Ug@mail.gmail.com>
 <PH0PR12MB54811B1D566FA64E693E20D6DCA0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEuA6u-EJCsrhvBRKxB6nxG=H28SEh4ihM3Ptgn1FQdGKA@mail.gmail.com>
 <DM8PR12MB54809F8316720CE5C1BCFF33DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEtFyH_wJAqTz=jwosVM-=SRuO+wpT7NM=Eod8ExsxfTsg@mail.gmail.com>
 <PH0PR12MB54814420718AB387C0C84C07DCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtGvDxF1Dnb6FJDK8XEAUcast-7OnuzTyfAr7m0LURWMw@mail.gmail.com>
 <PH0PR12MB548152A30021BEBFFCA62AA9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEv8mccZfcA4n+KVwdkaWAqhM94Qhq8H5Rvw2CocCmt9UA@mail.gmail.com> <20231107015412-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231107015412-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 8 Nov 2023 12:28:36 +0800
Message-ID: <CACGkMEv+jir2+f_vHmi_KjFXf0yz+EQmEbvzX0pheHKsVJkWZw@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>, 
	"lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of operation for write recording commands

On Tue, Nov 7, 2023 at 3:05=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com> =
wrote:
>
> On Tue, Nov 07, 2023 at 12:04:29PM +0800, Jason Wang wrote:
> > > > > Each virtio and non virtio devices who wants to report their dirt=
y page report,
> > > > will do their way.
> > > > >
> > > > > > 3) inventing it in the virtio layer will be deprecated in the f=
uture
> > > > > > for sure, as platform will provide much rich features for loggi=
ng
> > > > > > e.g it can do it per PASID etc, I don't see any reason virtio n=
eed
> > > > > > to compete with the features that will be provided by the platf=
orm
> > > > > Can you bring the cpu vendors and committement to virtio tc with =
timelines
> > > > so that virtio TC can omit?
> > > >
> > > > Why do we need to bring CPU vendors in the virtio TC? Virtio needs =
to be built
> > > > on top of transport or platform. There's no need to duplicate their=
 job.
> > > > Especially considering that virtio can't do better than them.
> > > >
> > > I wanted to see a strong commitment for the cpu vendors to support di=
rty page tracking.
> >
> > The RFC of IOMMUFD support can go back to early 2022. Intel, AMD and
> > ARM are all supporting that now.
> >
> > > And the work seems to have started for some platforms.
> >
> > Let me quote from the above link:
> >
> > """
> > Today, AMD Milan (or more recent) supports it while ARM SMMUv3.2
> > alongside VT-D rev3.x also do support.
> > """
> >
> > > Without such platform commitment, virtio also skipping it would not w=
ork.
> >
> > Is the above sufficient? I'm a little bit more familiar with vtd, the
> > hw feature has been there for years.
>
>
> Repeating myself - I'm not sure that will work well for all workloads.

I think this comment applies to this proposal as well.

> Definitely KVM did
> not scan PTEs. It used pagefaults with bit per page and later as VM size
> grew switched to PLM.  This interface is analogous to PLM,

I think you meant PML actually. And it doesn't work like PML. To
behave like PML it needs to

1) log buffers were organized as a queue with indices
2) device needs to suspend (as a #vmexit in PML) if it runs out of the buff=
ers
3) device need to send a notification to the driver if it runs out of the b=
uffer

I don't see any of the above in this proposal. If we do that it would
be less problematic than what is being proposed here.

Even if we manage to do that, it doesn't mean we won't have issues.

1) For many reasons it can neither see nor log via GPA, so this
requires a traversal of the vIOMMU mapping tables by the hypervisor
afterwards, it would be expensive and need synchronization with the
guest modification of the IO page table which looks very hard.
2) There are a lot of special or reserved IOVA ranges (for example the
interrupt areas in x86) that need special care which is architectural
and where it is beyond the scope or knowledge of the virtio device but
the platform IOMMU. Things would be more complicated when SVA is
enabled. And there could be other architecte specific knowledge (e.g
PAGE_SIZE) that might be needed. There's no easy way to deal with
those cases.

We wouldn't need to care about all of them if it is done at platform
IOMMU level.

> what Lingshan
> proposed is analogous to bit per page - problem unfortunately is
> you can't easily set a bit by DMA.
>

I'm not saying bit/bytemap is the best, but it has been used by real
hardware. And we have many other options.

> So I think this dirty tracking is a good option to have.
>
>
>
> > >
> > > > > i.e. in first year of 2024?
> > > >
> > > > Why does it matter in 2024?
> > > Because users needs to use it now.
> > >
> > > >
> > > > > If not, we are better off to offer this, and when/if platform sup=
port is, sure,
> > > > this feature can be disabled/not used/not enabled.
> > > > >
> > > > > > 4) if the platform support is missing, we can use software or
> > > > > > leverage transport for assistance like PRI
> > > > > All of these are in theory.
> > > > > Our experiment shows PRI performance is 21x slower than page faul=
t rate
> > > > done by the cpu.
> > > > > It simply does not even pass a simple 10Gbps test.
> > > >
> > > > If you stick to the wire speed during migration, it can converge.
> > > Do you have perf data for this?
> >
> > No, but it's not hard to imagine the worst case. Wrote a small program
> > that dirty every page by a NIC.
> >
> > > In the internal tests we don=E2=80=99t see this happening.
> >
> > downtime =3D dirty_rates * PAGE_SIZE / migration_speed
> >
> > So if we get very high dirty rates (e.g by a high speed NIC), we can't
> > satisfy the requirement of the downtime. Or if you see the converge,
> > you might get help from the auto converge support by the hypervisors
> > like KVM where it tries to throttle the VCPU then you can't reach the
> > wire speed.
>
> Will only work for some device types.
>

Yes, that's the point. Parav said he doesn't see the issue, it's
probably because he is testing a virtio-net and so the vCPU is
automatically throttled. It doesn't mean it can work for other virito
devices.

>
>
> > >
> > > >
> > > > > There is no requirement for mandating PRI either.
> > > > > So it is unusable.
> > > >
> > > > It's not about mandating, it's about doing things in the correct la=
yer. If PRI is
> > > > slow, PCI can evolve for sure.
> > > You should try.
> >
> > Not my duty, I just want to make sure things are done in the correct
> > layer, and once it needs to be done in the virtio, there's nothing
> > obviously wrong.
>
> Yea but just vague questions don't help to make sure eiter way.

I don't think it's vague, I have explained, if something in the virito
slows down the PRI, we can try to fix them. Missing functions in
platform or transport is not a good excuse to try to workaround it in
the virtio. It's a layer violation and we never had any feature like
this in the past.

>
> > > In the current state, it is mandating.
> > > And if you think PRI is the only way,
> >
> > I don't, it's just an example where virtio can leverage from either
> > transport or platform. Or if it's the fault in virtio that slows down
> > the PRI, then it is something we can do.
> >
> > >  than you should propose that in the dirty page tracking series that =
you listed above to not do dirty page tracking. Rather depend on PRI, right=
?
> >
> > No, the point is to not duplicate works especially considering virtio
> > can't do better than platform or transport.
>
> If someone says they tried and platform's migration support does not
> work for them and they want to build a solution in virtio then
> what exactly is the objection?

The discussion is to make sure whether virtio can do this easily and
correctly, then we can have a conclusion. I've stated some issues
above, and I've asked other questions related to them which are still
not answered.

I think we had a very hard time in bypassing IOMMU in the past that we
don't want to repeat.

We've gone through several methods of logging dirty pages in the past
(each with pros/cons), but this proposal never explains why it chooses
one of them but not others. Spec needs to find the best path instead
of just a possible path without any rationale about why.

> virtio is here in the
> first place because emulating devices didn't work well.

I don't understand here. We have supported emulated devices for years.
I'm pretty sure a lot of issues could be uncovered if this proposal
can be prototyped with an emulated device first.

Thanks





>
> --
> MST
>


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

