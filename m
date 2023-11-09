Return-Path: <virtio-comment-return-8277-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF542C4167B
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 03:31:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 234132A839
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 03:31:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id ED821986CC6
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 03:31:43 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D4943986CBA; Thu,  9 Nov 2023 03:31:43 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C3335986CBB
	for <virtio-comment@lists.oasis-open.org>; Thu,  9 Nov 2023 03:31:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: PEjikSCAOAGZ9jpWvvqSdw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699500699; x=1700105499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tk92QaHOtuhIHJj5cfOqKtHMhjC5qVA8H0bx1DvnDbU=;
        b=BtCB/p40S4l8EpMXryxM/L4PYiwzpKOIBGcXVTyQBnpbbET6LkpXpxxbEpoSnjsJ0/
         i8AtCXD+SuqNm+BOv4wdYVkIXiX4hJAaRL6oTvbD08lMRALNFNwAvl5SlPn4Gw0c5Zuv
         HwQY9mp1YLFOhlQ3aL7/NmjrO7SAMDzserD67uUo4WxR9iMcX9SMxqAfHgiNTYTjugve
         4iFTjsN6qa2ud+hRccDQHThK0QRvnB21wYVa8/W+C8y3R9l2eTRlaU2QYgWsAgFeECpJ
         7nh0Uq7i5OGCwoYc8aIIy5O7Wb/JmwKCaZmyTjpkyWq7Yt9P0X4MB2d4fKom7YliubKU
         LcyQ==
X-Gm-Message-State: AOJu0Yzk4HgefapTpDCs0ubd4ioX5/k0+X4z7BCLOnrdGPdUyw+zrzBl
	aIKXWPDftD8MXjjPlTgX2jclKRmXNDfLxiA0Cg0SC4ui6Ntutee9s+Kp0vmWfL33XukyIHGEV6y
	O++uoRVhjWoUtEL7hCsfQkphMDJNNILXWibwDZ+4tor8GrZZrJQ==
X-Received: by 2002:a05:6512:24a:b0:507:9a05:1aed with SMTP id b10-20020a056512024a00b005079a051aedmr339121lfo.4.1699500699293;
        Wed, 08 Nov 2023 19:31:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEhxsPqjT8wIw/nx4tyEyhVTeKXdCrRkNQEPfDmkFNiPKcn4kP/GiMXPZMwYruIs8hFXBHPUOsBJIBC1FJQtyE=
X-Received: by 2002:a05:6512:24a:b0:507:9a05:1aed with SMTP id
 b10-20020a056512024a00b005079a051aedmr339103lfo.4.1699500698859; Wed, 08 Nov
 2023 19:31:38 -0800 (PST)
MIME-Version: 1.0
References: <PH0PR12MB54811B1D566FA64E693E20D6DCA0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEuA6u-EJCsrhvBRKxB6nxG=H28SEh4ihM3Ptgn1FQdGKA@mail.gmail.com>
 <DM8PR12MB54809F8316720CE5C1BCFF33DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEtFyH_wJAqTz=jwosVM-=SRuO+wpT7NM=Eod8ExsxfTsg@mail.gmail.com>
 <PH0PR12MB54814420718AB387C0C84C07DCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtGvDxF1Dnb6FJDK8XEAUcast-7OnuzTyfAr7m0LURWMw@mail.gmail.com>
 <PH0PR12MB548152A30021BEBFFCA62AA9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEv8mccZfcA4n+KVwdkaWAqhM94Qhq8H5Rvw2CocCmt9UA@mail.gmail.com>
 <20231107015412-mutt-send-email-mst@kernel.org> <CACGkMEv+jir2+f_vHmi_KjFXf0yz+EQmEbvzX0pheHKsVJkWZw@mail.gmail.com>
 <20231108025854-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231108025854-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 9 Nov 2023 11:31:27 +0800
Message-ID: <CACGkMEvkQawXWCvu7rZHnZk8YsNunS_B-fcQmEHEe_N87Q6y6g@mail.gmail.com>
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

On Wed, Nov 8, 2023 at 4:17=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com> =
wrote:
>
> On Wed, Nov 08, 2023 at 12:28:36PM +0800, Jason Wang wrote:
> > On Tue, Nov 7, 2023 at 3:05=E2=80=AFPM Michael S. Tsirkin <mst@redhat.c=
om> wrote:
> > >
> > > On Tue, Nov 07, 2023 at 12:04:29PM +0800, Jason Wang wrote:
> > > > > > > Each virtio and non virtio devices who wants to report their =
dirty page report,
> > > > > > will do their way.
> > > > > > >
> > > > > > > > 3) inventing it in the virtio layer will be deprecated in t=
he future
> > > > > > > > for sure, as platform will provide much rich features for l=
ogging
> > > > > > > > e.g it can do it per PASID etc, I don't see any reason virt=
io need
> > > > > > > > to compete with the features that will be provided by the p=
latform
> > > > > > > Can you bring the cpu vendors and committement to virtio tc w=
ith timelines
> > > > > > so that virtio TC can omit?
> > > > > >
> > > > > > Why do we need to bring CPU vendors in the virtio TC? Virtio ne=
eds to be built
> > > > > > on top of transport or platform. There's no need to duplicate t=
heir job.
> > > > > > Especially considering that virtio can't do better than them.
> > > > > >
> > > > > I wanted to see a strong commitment for the cpu vendors to suppor=
t dirty page tracking.
> > > >
> > > > The RFC of IOMMUFD support can go back to early 2022. Intel, AMD an=
d
> > > > ARM are all supporting that now.
> > > >
> > > > > And the work seems to have started for some platforms.
> > > >
> > > > Let me quote from the above link:
> > > >
> > > > """
> > > > Today, AMD Milan (or more recent) supports it while ARM SMMUv3.2
> > > > alongside VT-D rev3.x also do support.
> > > > """
> > > >
> > > > > Without such platform commitment, virtio also skipping it would n=
ot work.
> > > >
> > > > Is the above sufficient? I'm a little bit more familiar with vtd, t=
he
> > > > hw feature has been there for years.
> > >
> > >
> > > Repeating myself - I'm not sure that will work well for all workloads=
.
> >
> > I think this comment applies to this proposal as well.
>
> Yes - some systems might be better off with platform tracking.
> And I think supporting shadow vq better would be nice too.

For shadow vq, did you mean the work that is done by Eugenio?

>
> > > Definitely KVM did
> > > not scan PTEs. It used pagefaults with bit per page and later as VM s=
ize
> > > grew switched to PLM.  This interface is analogous to PLM,
> >
> > I think you meant PML actually. And it doesn't work like PML. To
> > behave like PML it needs to
> >
> > 1) log buffers were organized as a queue with indices
> > 2) device needs to suspend (as a #vmexit in PML) if it runs out of the =
buffers
> > 3) device need to send a notification to the driver if it runs out of t=
he buffer
> >
> > I don't see any of the above in this proposal. If we do that it would
> > be less problematic than what is being proposed here.
>
> What is common between this and PML is that you get the addresses
> directly without scanning megabytes of bitmaps or worse -
> hundreds of megabytes of page tables.

Yes, it has overhead but this is the method we use for vhost and KVM (earli=
er).

To me the  important advantage of PML is that it uses limited
resources on the host which

1) doesn't require resources in the device
2) doesn't scale as the guest memory increases. (but this advantage
doesn't exist in neither this nor bitmap)

>
> The data structure is different but I don't see why it is critical.
>
> I agree that I don't see out of buffers notifications too which implies
> device has to maintain something like a bitmap internally.  Which I
> guess could be fine but it is not clear to me how large that bitmap has
> to be. How does the device know? Needs to be addressed.

This is the question I asked Parav in another thread. Using host
memory as a queue with notification (like PML) might be much better.

>
>
> > Even if we manage to do that, it doesn't mean we won't have issues.
> >
> > 1) For many reasons it can neither see nor log via GPA, so this
> > requires a traversal of the vIOMMU mapping tables by the hypervisor
> > afterwards, it would be expensive and need synchronization with the
> > guest modification of the IO page table which looks very hard.
>
> vIOMMU is fast enough to be used on data path but not fast enough for
> dirty tracking?

We set up SPTEs or using nesting offloading where the PTEs could be
iterated by hardware directly which is fast.

This is not the case here where software needs to iterate the IO page
tables in the guest which could be slow.

> Hard to believe.  If true and you want to speed up
> vIOMMU then you implement an efficient datastructure for that.

Besides the issue of performance, it's also racy, assuming we are logging I=
OVA.

0) device log IOVA
1) hypervisor fetches IOVA from log buffer
2) guest map IOVA to a new GPA
3) hypervisor traverse guest table to get IOVA to new GPA

Then we lost the old GPA.

>
> > 2) There are a lot of special or reserved IOVA ranges (for example the
> > interrupt areas in x86) that need special care which is architectural
> > and where it is beyond the scope or knowledge of the virtio device but
> > the platform IOMMU. Things would be more complicated when SVA is
> > enabled.
>
> SVA being what here?

For example, IOMMU may treat interrupt ranges differently depending on
whether SVA is enabled or not. It's very hard and unnecessary to teach
devices about this.

>
> > And there could be other architecte specific knowledge (e.g
> > PAGE_SIZE) that might be needed. There's no easy way to deal with
> > those cases.
>
> Good point about page size actually - using 4k unconditionally
> is a waste of resources.

Actually, they are more than just PAGE_SIZE, for example, PASID and others.

>
>
> > We wouldn't need to care about all of them if it is done at platform
> > IOMMU level.
>
> If someone logs at IOMMU level then nothing needs to be done
> in the spec at all. This is about capability at the device level.

True, but my question is where or not it can be done at the device level ea=
sily.

>
>
> > > what Lingshan
> > > proposed is analogous to bit per page - problem unfortunately is
> > > you can't easily set a bit by DMA.
> > >
> >
> > I'm not saying bit/bytemap is the best, but it has been used by real
> > hardware. And we have many other options.
> >
> > > So I think this dirty tracking is a good option to have.
> > >
> > >
> > >
> > > > >
> > > > > > > i.e. in first year of 2024?
> > > > > >
> > > > > > Why does it matter in 2024?
> > > > > Because users needs to use it now.
> > > > >
> > > > > >
> > > > > > > If not, we are better off to offer this, and when/if platform=
 support is, sure,
> > > > > > this feature can be disabled/not used/not enabled.
> > > > > > >
> > > > > > > > 4) if the platform support is missing, we can use software =
or
> > > > > > > > leverage transport for assistance like PRI
> > > > > > > All of these are in theory.
> > > > > > > Our experiment shows PRI performance is 21x slower than page =
fault rate
> > > > > > done by the cpu.
> > > > > > > It simply does not even pass a simple 10Gbps test.
> > > > > >
> > > > > > If you stick to the wire speed during migration, it can converg=
e.
> > > > > Do you have perf data for this?
> > > >
> > > > No, but it's not hard to imagine the worst case. Wrote a small prog=
ram
> > > > that dirty every page by a NIC.
> > > >
> > > > > In the internal tests we don=E2=80=99t see this happening.
> > > >
> > > > downtime =3D dirty_rates * PAGE_SIZE / migration_speed
> > > >
> > > > So if we get very high dirty rates (e.g by a high speed NIC), we ca=
n't
> > > > satisfy the requirement of the downtime. Or if you see the converge=
,
> > > > you might get help from the auto converge support by the hypervisor=
s
> > > > like KVM where it tries to throttle the VCPU then you can't reach t=
he
> > > > wire speed.
> > >
> > > Will only work for some device types.
> > >
> >
> > Yes, that's the point. Parav said he doesn't see the issue, it's
> > probably because he is testing a virtio-net and so the vCPU is
> > automatically throttled. It doesn't mean it can work for other virito
> > devices.
>
> Only for TX, and I'm pretty sure they had the foresight to test RX not
> just TX but let's confirm. Parav did you test both directions?

RX speed somehow depends on the speed of refill, so throttling helps
more or less.

>
> > >
> > >
> > > > >
> > > > > >
> > > > > > > There is no requirement for mandating PRI either.
> > > > > > > So it is unusable.
> > > > > >
> > > > > > It's not about mandating, it's about doing things in the correc=
t layer. If PRI is
> > > > > > slow, PCI can evolve for sure.
> > > > > You should try.
> > > >
> > > > Not my duty, I just want to make sure things are done in the correc=
t
> > > > layer, and once it needs to be done in the virtio, there's nothing
> > > > obviously wrong.
> > >
> > > Yea but just vague questions don't help to make sure eiter way.
> >
> > I don't think it's vague, I have explained, if something in the virito
> > slows down the PRI, we can try to fix them.
>
> I don't believe you are going to make PRI fast. No one managed so far.

So it's the fault of PRI not virito, but it doesn't mean we need to do
it in virtio.

>
> > Missing functions in
> > platform or transport is not a good excuse to try to workaround it in
> > the virtio. It's a layer violation and we never had any feature like
> > this in the past.
>
> Yes missing functionality in the platform is exactly why virtio
> was born in the first place.

Well the platform can't do device specific logic. But that's not the
case of dirty page tracking which is device logic agnostic.

>
> > >
> > > > > In the current state, it is mandating.
> > > > > And if you think PRI is the only way,
> > > >
> > > > I don't, it's just an example where virtio can leverage from either
> > > > transport or platform. Or if it's the fault in virtio that slows do=
wn
> > > > the PRI, then it is something we can do.
> > > >
> > > > >  than you should propose that in the dirty page tracking series t=
hat you listed above to not do dirty page tracking. Rather depend on PRI, r=
ight?
> > > >
> > > > No, the point is to not duplicate works especially considering virt=
io
> > > > can't do better than platform or transport.
> > >
> > > If someone says they tried and platform's migration support does not
> > > work for them and they want to build a solution in virtio then
> > > what exactly is the objection?
> >
> > The discussion is to make sure whether virtio can do this easily and
> > correctly, then we can have a conclusion. I've stated some issues
> > above, and I've asked other questions related to them which are still
> > not answered.
> >
> > I think we had a very hard time in bypassing IOMMU in the past that we
> > don't want to repeat.
> >
> > We've gone through several methods of logging dirty pages in the past
> > (each with pros/cons), but this proposal never explains why it chooses
> > one of them but not others. Spec needs to find the best path instead
> > of just a possible path without any rationale about why.
>
> Adding more rationale isn't a bad thing.
> In particular if platform supplies dirty tracking then how does
> driver decide which to use platform or device capability?
> A bit of discussion around this is a good idea.
>
>
> > > virtio is here in the
> > > first place because emulating devices didn't work well.
> >
> > I don't understand here. We have supported emulated devices for years.
> > I'm pretty sure a lot of issues could be uncovered if this proposal
> > can be prototyped with an emulated device first.
> >
> > Thanks
>
> virtio was originally PV as opposed to emulation. That there's now
> hardware virtio and you call software implementation "an emulation" is
> very meta.

Yes but I don't see how it relates to dirty page tracking. When we
find a way it should work for both software and hardware devices.

Thanks

>
>
> >
> >
> >
> >
> > >
> > > --
> > > MST
> > >
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

