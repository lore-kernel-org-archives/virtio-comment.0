Return-Path: <virtio-comment-return-8667-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE89AC4167B
	for <virtio-comment@archiver.kernel.org>; Wed, 29 Nov 2023 05:12:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0303818F54E
	for <virtio-comment@archiver.kernel.org>; Wed, 29 Nov 2023 05:12:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C9791986653
	for <virtio-comment@archiver.kernel.org>; Wed, 29 Nov 2023 05:12:43 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id AA47998616A; Wed, 29 Nov 2023 05:12:43 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 94D09986589
	for <virtio-comment@lists.oasis-open.org>; Wed, 29 Nov 2023 05:12:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: dA8OuZTIOHCMz2-uk37LZg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701234758; x=1701839558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GXgZLbW4kWbkPA8rQX1iSnv/opd9uvRtThn22SLINU8=;
        b=BjGiq6ETwwz7+qHSMNaPqQZybiiN+6A0Fjk5Sxw/8FzBS+JQRNlpYUUHnkfRQmcyNt
         zUE+R/VDvEfMWi70KDaVR+puuP5DOzjQ35FNWaYlLCHMONO8Mjese2M3/e9vDKFQCdDX
         nrlCqO/4Wm5Y/YfAKOe4FKJWmj1fVKQu35bIxPvs0GRHTpvlTrE3h1SVBm9Dvbv5svdm
         kMotbhlukXMQXNQWL1PRpuJRh8NYSzc0/lpcGjHNcXjRuW+DrsCQYJabIZXNmNY+pmZC
         xwZVuEsDzfHCpKb6mKcXBKESBgBPDCGELKKEcMNnTQzJJZzXpov6FyyvPUygecuLkQz0
         5VNQ==
X-Gm-Message-State: AOJu0Yx2c7otFTKFMPGIAEliQRl4L484EzyquYzp9hWuQd7xuDGL0lEW
	acB9lT8aiQcj64hUFjwEvTgpdKOAiqp3oay0R5jNAFCOkgOF2l+b8ouD7XFlX9DdeHb5cuhV2Zf
	SpkZsbn0DjZUn3HQjiB3hzYCRhWbFhU5Gw4J1sd1Uwr5hNmHOuQ==
X-Received: by 2002:a05:6512:38cf:b0:503:3781:ac32 with SMTP id p15-20020a05651238cf00b005033781ac32mr10053788lft.41.1701234758456;
        Tue, 28 Nov 2023 21:12:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEdyOrtwQG9hzCjJHuZ2NOs/wbpQcb07V9Be9QeyHuM3abnoh9M1kH7AZ4t+aHImkE8CM3W1Ui7ZQcyph+BzE=
X-Received: by 2002:a05:6512:38cf:b0:503:3781:ac32 with SMTP id
 p15-20020a05651238cf00b005033781ac32mr10053780lft.41.1701234758034; Tue, 28
 Nov 2023 21:12:38 -0800 (PST)
MIME-Version: 1.0
References: <705e728a-368a-4e28-a7b2-61afddb15ce9@intel.com>
 <PH0PR12MB54813446F8F2BBDBC74BF393DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117063304-mutt-send-email-mst@kernel.org> <PH0PR12MB548179702B4F7B460E09681CDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117065740-mutt-send-email-mst@kernel.org> <PH0PR12MB5481C905833821171814CB13DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117073031-mutt-send-email-mst@kernel.org> <PH0PR12MB548103A393411CF8357B85DEDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117085848-mutt-send-email-mst@kernel.org> <PH0PR12MB5481E5431DFCF96F622A7696DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvYTVA=kOT5vZSZ7nwTm00vbMy92EUV9RMX5ycrhweeVQ@mail.gmail.com>
 <bcb86082-31d8-4c59-b731-9aca05742568@oracle.com> <CACGkMEuOV7fSN8hXRG6HOvfOBZYrr_ZvRE0eEJwCxeHzLHebYQ@mail.gmail.com>
 <9404c15c-9c9b-45c7-befd-636b3d831c3e@oracle.com> <CACGkMEtq7hFh1E_esYnYW6YQcru4_jvwAQJb6tJAB_zC87fcEQ@mail.gmail.com>
 <acca3523-6d8a-4000-885f-0859b43838cf@oracle.com>
In-Reply-To: <acca3523-6d8a-4000-885f-0859b43838cf@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 29 Nov 2023 13:12:26 +0800
Message-ID: <CACGkMEu0vR6LSip=ewQ8RrLXV5cjQua3_gfFtAk+KtQLafATHQ@mail.gmail.com>
To: Si-Wei Liu <si-wei.liu@oracle.com>
Cc: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	"Zhu, Lingshan" <lingshan.zhu@intel.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>, 
	eperezma <eperezma@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands

On Tue, Nov 28, 2023 at 11:00=E2=80=AFAM Si-Wei Liu <si-wei.liu@oracle.com>=
 wrote:
>
>
>
> On 11/23/2023 6:29 PM, Jason Wang wrote:
> > On Thu, Nov 23, 2023 at 9:19=E2=80=AFPM Si-Wei Liu <si-wei.liu@oracle.c=
om> wrote:
> >>
> >>
> >> On 11/21/2023 9:31 PM, Jason Wang wrote:
> >>> On Wed, Nov 22, 2023 at 10:31=E2=80=AFAM Si-Wei Liu <si-wei.liu@oracl=
e.com> wrote:
> >>>> (dropping my personal email abandoned for upstream discussion for no=
w,
> >>>> please try to copy my corporate email address for more timely respon=
se)
> >>>>
> >>>> On 11/20/2023 10:55 PM, Jason Wang wrote:
> >>>>> On Fri, Nov 17, 2023 at 10:48=E2=80=AFPM Parav Pandit <parav@nvidia=
.com> wrote:
> >>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
> >>>>>>> Sent: Friday, November 17, 2023 7:31 PM
> >>>>>>> To: Parav Pandit <parav@nvidia.com>
> >>>>>>>
> >>>>>>> On Fri, Nov 17, 2023 at 01:03:03PM +0000, Parav Pandit wrote:
> >>>>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
> >>>>>>>>> Sent: Friday, November 17, 2023 6:02 PM
> >>>>>>>>>
> >>>>>>>>> On Fri, Nov 17, 2023 at 12:11:15PM +0000, Parav Pandit wrote:
> >>>>>>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
> >>>>>>>>>>> Sent: Friday, November 17, 2023 5:35 PM
> >>>>>>>>>>> To: Parav Pandit <parav@nvidia.com>
> >>>>>>>>>>>
> >>>>>>>>>>> On Fri, Nov 17, 2023 at 11:45:20AM +0000, Parav Pandit wrote:
> >>>>>>>>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
> >>>>>>>>>>>>> Sent: Friday, November 17, 2023 5:04 PM
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> On Fri, Nov 17, 2023 at 11:05:16AM +0000, Parav Pandit wrot=
e:
> >>>>>>>>>>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
> >>>>>>>>>>>>>>> Sent: Friday, November 17, 2023 4:30 PM
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> On Fri, Nov 17, 2023 at 10:03:47AM +0000, Parav Pandit wr=
ote:
> >>>>>>>>>>>>>>>>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
> >>>>>>>>>>>>>>>>> Sent: Friday, November 17, 2023 3:30 PM
> >>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>> On 11/16/2023 7:59 PM, Michael S. Tsirkin wrote:
> >>>>>>>>>>>>>>>>>> On Thu, Nov 16, 2023 at 06:28:07PM +0800, Zhu,
> >>>>>>>>>>>>>>>>>> Lingshan
> >>>>>>>>> wrote:
> >>>>>>>>>>>>>>>>>>> On 11/16/2023 1:51 PM, Michael S. Tsirkin wrote:
> >>>>>>>>>>>>>>>>>>>> On Thu, Nov 16, 2023 at 05:29:54AM +0000, Parav
> >>>>>>>>>>>>>>>>>>>> Pandit
> >>>>>>>>> wrote:
> >>>>>>>>>>>>>>>>>>>>> We should expose a limit of the device in the
> >>>>>>>>>>>>>>>>>>>>> proposed
> >>>>>>>>>>>>>>>>> WRITE_RECORD_CAP_QUERY command, that how much
> >>>>>>> range
> >>>>>>>>>>>>>>>>> it can
> >>>>>>>>>>>>> track.
> >>>>>>>>>>>>>>>>>>>>> So that future provisioning framework can use it.
> >>>>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>>>> I will cover this in v5 early next week.
> >>>>>>>>>>>>>>>>>>>> I do worry about how this can even work though.
> >>>>>>>>>>>>>>>>>>>> If you want a generic device you do not get to
> >>>>>>>>>>>>>>>>>>>> dictate how much memory VM
> >>>>>>>>>>>>> has.
> >>>>>>>>>>>>>>>>>>>> Aren't we talking bit per page? With 1TByte of
> >>>>>>>>>>>>>>>>>>>> memory to track
> >>>>>>>>>>>>>>>>>>>> -> 256Gbit -> 32Gbit -> 8Gbyte per VF?
> >>>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>>> And you happily say "we'll address this in the futur=
e"
> >>>>>>>>>>>>>>>>>>>> while at the same time fighting tooth and nail
> >>>>>>>>>>>>>>>>>>>> against adding single bit status registers because
> >>>>>>> scalability?
> >>>>>>>>>>>>>>>>>>>> I have a feeling doing this completely
> >>>>>>>>>>>>>>>>>>>> theoretical like this is
> >>>>>>>>>>>>> problematic.
> >>>>>>>>>>>>>>>>>>>> Maybe you have it all laid out neatly in your
> >>>>>>>>>>>>>>>>>>>> head but I suspect not all of TC can picture it
> >>>>>>>>>>>>>>>>>>>> clearly enough based just on spec
> >>>>>>>>>>>>> text.
> >>>>>>>>>>>>>>>>>>>> We do sometimes ask for POC implementation in
> >>>>>>>>>>>>>>>>>>>> linux / qemu to demonstrate how things work
> >>>>>>>>>>>>>>>>>>>> before merging
> >>>>>>>>> code.
> >>>>>>>>>>>>>>>>>>>> We skipped this for admin things so far but I
> >>>>>>>>>>>>>>>>>>>> think it's a good idea to start doing it here.
> >>>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>>> What makes me pause a bit before saying please
> >>>>>>>>>>>>>>>>>>>> do a PoC is all the opposition that seems to
> >>>>>>>>>>>>>>>>>>>> exist to even using admin commands in the 1st
> >>>>>>>>>>>>>>>>>>>> place. I think once we finally stop arguing
> >>>>>>>>>>>>>>>>>>>> about whether to use admin commands at all then
> >>>>>>>>>>>>>>>>>>>> a PoC will be needed
> >>>>>>>>>>>>>>> before merging.
> >>>>>>>>>>>>>>>>>>> We have POR productions that implemented the
> >>>>>>>>>>>>>>>>>>> approach in my
> >>>>>>>>>>>>> series.
> >>>>>>>>>>>>>>>>>>> They are multiple generations of productions in
> >>>>>>>>>>>>>>>>>>> market and running in customers data centers for year=
s.
> >>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>> Back to 2019 when we start working on vDPA, we
> >>>>>>>>>>>>>>>>>>> have sent some samples of production(e.g.,
> >>>>>>>>>>>>>>>>>>> Cascade
> >>>>>>>>>>>>>>>>>>> Glacier) and the datasheet, you can find live
> >>>>>>>>>>>>>>>>>>> migration facilities there, includes suspend, vq
> >>>>>>>>>>>>>>>>>>> state and other
> >>>>>>>>> features.
> >>>>>>>>>>>>>>>>>>> And there is an reference in DPDK live migration,
> >>>>>>>>>>>>>>>>>>> I have provided this page
> >>>>>>>>>>>>>>>>>>> before:
> >>>>>>>>>>>>>>>>>>> https://doc.dpdk.org/guides-21.11/vdpadevs/ifc.ht
> >>>>>>>>>>>>>>>>>>> ml, it has been working for long long time.
> >>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>> So if we let the facts speak, if we want to see
> >>>>>>>>>>>>>>>>>>> if the proposal is proven to work, I would
> >>>>>>>>>>>>>>>>>>> say: They are POR for years, customers already
> >>>>>>>>>>>>>>>>>>> deployed them for
> >>>>>>>>>>>>> years.
> >>>>>>>>>>>>>>>>>> And I guess what you are trying to say is that
> >>>>>>>>>>>>>>>>>> this patchset we are reviewing here should be help
> >>>>>>>>>>>>>>>>>> to the same standard and there should be a PoC? Sounds
> >>>>>>> reasonable.
> >>>>>>>>>>>>>>>>> Yes and the in-marketing productions are POR, the
> >>>>>>>>>>>>>>>>> series just improves the design, for example, our
> >>>>>>>>>>>>>>>>> series also use registers to track vq state, but
> >>>>>>>>>>>>>>>>> improvements than CG or BSC. So I think they are
> >>>>>>>>>>>>>>>>> proven
> >>>>>>>>>>>>>>> to work.
> >>>>>>>>>>>>>>>> If you prefer to go the route of POR and production
> >>>>>>>>>>>>>>>> and proven documents
> >>>>>>>>>>>>>>> etc, there is ton of it of multiple types of products I
> >>>>>>>>>>>>>>> can dump here with open- source code and documentation an=
d
> >>>>>>> more.
> >>>>>>>>>>>>>>>> Let me know what you would like to see.
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> Michael has requested some performance comparisons,
> >>>>>>>>>>>>>>>> not all are ready to
> >>>>>>>>>>>>>>> share yet.
> >>>>>>>>>>>>>>>> Some are present that I will share in coming weeks.
> >>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> And all the vdpa dpdk you published does not have
> >>>>>>>>>>>>>>>> basic CVQ support when I
> >>>>>>>>>>>>>>> last looked at it.
> >>>>>>>>>>>>>>>> Do you know when was it added?
> >>>>>>>>>>>>>>> It's good enough for PoC I think, CVQ or not.
> >>>>>>>>>>>>>>> The problem with CVQ generally, is that VDPA wants to
> >>>>>>>>>>>>>>> shadow CVQ it at all times because it wants to decode
> >>>>>>>>>>>>>>> and cache the content. But this problem has nothing to
> >>>>>>>>>>>>>>> do with dirty tracking even though it also
> >>>>>>>>>>>>> mentions "shadow":
> >>>>>>>>>>>>>>> if device can report it's state then there's no need to s=
hadow
> >>>>>>> CVQ.
> >>>>>>>>>>>>>> For the performance numbers with the pre-copy and device
> >>>>>>>>>>>>>> context of
> >>>>>>>>>>>>> patches posted 1 to 5, the downtime reduction of the VM is
> >>>>>>>>>>>>> 3.71x with active traffic on 8 RQs at 100Gbps port speed.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Sounds good can you please post a bit more detail?
> >>>>>>>>>>>>> which configs are you comparing what was the result on each=
 of
> >>>>>>> them.
> >>>>>>>>>>>> Common config: 8+8 tx and rx queues.
> >>>>>>>>>>>> Port speed: 100Gbps
> >>>>>>>>>>>> QEMU 8.1
> >>>>>>>>>>>> Libvirt 7.0
> >>>>>>>>>>>> GVM: Centos 7.4
> >>>>>>>>>>>> Device: virtio VF hardware device
> >>>>>>>>>>>>
> >>>>>>>>>>>> Config_1: virtio suspend/resume similar to what Lingshan has=
,
> >>>>>>>>>>>> largely vdpa stack
> >>>>>>>>>>>> Config_2: Device context method of admin commands
> >>>>>>>>>>> OK that sounds good. The weird thing here is that you measure
> >>>>>>> "downtime".
> >>>>>>>>>>> What exactly do you mean here?
> >>>>>>>>>>> I am guessing it's the time to retrieve on source and re-prog=
ram
> >>>>>>>>>>> device state on destination? And this is 3.71x out of how lon=
g?
> >>>>>>>>>> Yes. Downtime is the time during which the VM is not respondin=
g or
> >>>>>>>>>> receiving
> >>>>>>>>> packets, which involves reprogramming the device.
> >>>>>>>>>> 3.71x is relative time for this discussion.
> >>>>>>>>> Oh interesting. So VM state movement including reprogramming th=
e CPU
> >>>>>>>>> is dominated by reprogramming this single NIC, by a factor of a=
lmost 4?
> >>>>>>>> Yes.
> >>>>>>> Could you post some numbers too then?  I want to know whether tha=
t would
> >>>>>>> imply that VM boot is slowed down significantly too. If yes that'=
s another
> >>>>>>> motivation for pci transport 2.0.
> >>>>>> It was 1.8 sec down to 480msec.
> >>>>> Well, there's work ongoing to reduce the downtime of the shadow vir=
tqueue.
> >>>>>
> >>>>> Eugenio or Si-wei may share an exact number, but it should be sever=
al
> >>>>> hundreds of ms.
> >>>> That was mostly for device teardown time at the the source but there=
's
> >>>> also setup cost at the destination that needs to be counted.
> >>>> Several hundred of milliseconds would be the ultimate goal I would s=
ay
> >>>> (right now the numbers from Parav more or less reflects the status q=
uo
> >>>> but there's ongoing work to make it further down), and I don't doubt
> >>>> several hundreds of ms is possible. But to be fair, on the other han=
d,
> >>>> shadow vq on real vdpa hardware device would need a lot of dedicated
> >>>> optimization work across all layers (including hardware or firmware)=
 all
> >>>> over the places to achieve what a simple suspend-resume (save/load)
> >>>> interface can easily do with VFIO migration.
> >>> That's fine. Just to clairfy, shadow virtqueue here doesn't mean it
> >>> can't save/load. We want to see how it is useful for dirty page
> >>> tracking since tracking dirty pages by device itself seems problemati=
c
> >>> at least from my point of view.
> >> TBH I don't see how this comparison can help prove the problematic par=
t
> >> of device dirty tracking, or if it has anything to do with.
> > Shadow virtqueue is not used to prove the problem, the problem could
> > be uncovered during the review.
> >
> > The shadow virtuqueue is used to give us a bottom line. If a huge
> > effort were done for spec but it can't perform better than virtqueue,
> > the effort became meaningless.
> Got it. Thanks for detailed clarifications, Jason. So it's not device
> assisted dirty tracking itself you find issue with, but just the
> flaw/inefficiency in the current proposal as pointed out in previous
> discussions?  In other word, does it make sense to you if certain device
> assisted tracking scheme is proved to be helpful or perform better than
> the others, and its backed by real performance data, be it shadow vq or
> platform IOMMU tracking in just a few scenarios or in the mostly common
> used set up, then is it acceptable to you even if the same device
> tracking mechanism doesn't support or doesn't have reasonably good value
> for other scenarios (for e.g. PASID, ATS, vIOMMU and etc as you listed
> below)?

For PASID, maybe we can leave it aside.
For ATS, I think we need at least clarify the behaviour.
For vIOMMU, I'd suggest testing the RTT on a domain-selected
invalidation via vIOMMU. To make sure at least there's no lockups on
the guest.

And I think we need an API to throttle the dirty rate (no matter what
kind of dirty page tracking is used) so the hypervisor can use
heuristic to converge the migration.

But we can hear from others for sure.

>
> It's up to the author to further improve on the current spec proposal,
> but if the device assisted tracking itself in general is problematic and
> prohibited even if proved to be best performing for some (but not ALL)
> use cases, I will be very surprised to know the reason why, as it is
> just an optional device feature aiming to be self-contained in virtio
> itself, without having to depending on vendor specific optimization
> (like vdpa shadow vq).

There's no reason if it works well :). Parav said it is optional in
the new version.

My question is not about whether it's good or not to do that in
virtio. It's about whether it can behave correctly when we try to do
that in virtio:

Besides the above issues, here are more: 1) DMA to MSI-X 2) Log P2P
write or not 3) Log DMA to RMRR or not etc. All of which seems not
easy to be done in virtio device, or I would like to know how those
are handled.

THanks

>
> Thanks
> -Siwei
> >
> >> In many
> >> cases vDPA and hardware virtio are for different deployment scenarios
> >> with varied target users, I don't see how vDPA can completely substitu=
te
> >> hardware virtio for many reasons regardless shadow virtqueue wins or n=
ot.
> > It's not about whether vDPA can win or not. It's about a quick
> > demonstration about how shadow virtqueue can perform.  From the view
> > of the shadow virtqueue, it doesn't know whether the underlayer is
> > vDPA or virtio. It's not hard to imagine, the downtime we get from
> > vDPA is the bottom line of downtime via virtio since virtio is much
> > more easier.
> >
> >> If anything relevant I would more like to see performance comparison
> >> with platform dirty tracking via IOMMUFD, but that's perhaps too early
> >> stage at this point to conclude anything given there's very limited
> >> availability (in terms of supporting software, I know some supporting
> >> hardware has been around for a few years) and none of the potential
> >> software optimizations is in place at this point to make a fair
> >> comparison for.
> > We need to make sure the correctness of the function before we can
> > talk about optimizations. And I don't see how this proposal is
> > optimized for many ways.
> >
> >> Granted device assisted tracking has its own set of
> >> limitations e.g. loose coupling or integration with platform features,
> >> lack of nested and PASID support et al. However, state of the art for
> >> platform dirty tracking is not perfect either, far off being highly
> >> optimized for all types of workload or scenarios. At least to me the
> >> cost of page table walk to scan all PTEs across all levels is not easi=
ly
> >> negligible - given no PML equivalent here, are we sure the whole range
> >> scan can be as efficient and scalable as memory size / # of PTEs grows=
?
> > If you see the discussion, this proposal requires scan PTEs as well in
> > many ways.
> >
> >> How large it may impact the downtime with this rudimentary dirty scan?
> >> No data point was given thus far. If chances are that there could be
> >> major improvement from device tracking for those general use cases to
> >> supplement what platform cannot achieve efficiently enough, it's not t=
oo
> >> good to kill off the possibility entirely at this early stage. Maybe a
> >> PoC or some comparative performance data can help prove the theory?
> > We can ask in the thread of IOMMUFD dirty tracking patches.
> >
> >> On the other hand, the device assisted tracking has at least one
> >> advantage that platform cannot simply offer - throttle down device for
> >> convergence, inherently or explicitly whenever needed.
> > Please refer the past discussion, I can see how it is throttled in the
> > case of PML similar mechanism. But I can't see how it can be done
> > here. This proposal requires the device to reserver sufficient
> > resources where the throttle is implementation specific where the
> > hypervisor can't depend on. It needs API to set dirty page rates at
> > least.
> >
> >> I think earlier
> >> Micheal suggested something to make the core data structure used for
> >> logging more efficient and compact, working like PML but using a queue
> >> or an array, and the entry of which may contain a list of discrete pag=
es
> >> or contiguous PFN ranges.
> > PML solve the resources problem but not other problem:
> >
> > 1) Throttling: it's still not something that hypervisor can depend.
> > The reason why PML in CPU work is that hypervisor can throttle the KVM
> > process so it can slow down to the expected dirty rates.
> > 2) Platform specific issue: PASID, ATS, translation failures, reserved
> > regions, and a lot of other stuffs
> > 3) vIOMMU issue: horrible delay in IOTLB invalidation path
> > 4) Doesn't work in the case of vIOMMU offloading
> >
> > And compare the the existing approach, it ends up with more PCI
> > transactions under heavy load.
> >
> >> On top of this one may add parallelism to
> >> distribute load to multiple queues, or add zero copy to speed up dirty
> >> sync to userspace - things virtio queues are pretty good at doing. Aft=
er
> >> all, nothing can be perfect to begin with, and every complex feature
> >> would need substantial time to improve and evolve.
> > Evolve is good, but the problem is platform is also evolving. The
> > function is duplicated there and platform provides a lot of advanced
> > features that can co-operate with dirty page tracking like vIOMMU
> > offloading where it almost impossible to be done in virtio. Virtio
> > needs to leverage the platform or transport instead of reinventing
> > wheels so it can focus on the virtio device logic.
> >
> >> It does so for shadow
> >> virtqueue from where it gets started to where it is now, even so there=
's
> >> still a lot of optimization work not done yet. There must be head room
> >> here for device page tracking or platform tracking, too.
> > Let's then focus on the possible issues (I've pointed out a brunches).
> >
> > Thanks
> >
> >> Regards,
> >> -Siwei
> >>
> >>
> >>> Shadow virtqueue can be used with a save/load model for device state
> >>> recovery for sure.
> >>>
> >>>>> But it seems the shadow virtqueue itself is not the major factor bu=
t
> >>>>> the time spent on programming vendor specific mappings for example.
> >>>> Yep. The slowness on mapping part is mostly due to the artifact of
> >>>> software-based implementation. IMHO for live migration p.o.v it's be=
tter
> >>>> to not involve any mapping operation in the down time path at all.
> >>> Yes.
> >>>
> >>> Thanks
> >>>
> >>>> -Siwei
> >>>>> Thanks
> >>>>>
> >>>>>> The time didn't come from pci side or boot side.
> >>>>>>
> >>>>>> For pci side of things you would want to compare the pci vs non pc=
i device based VM boot time.
> >>>>>>
> >>>>> This publicly archived list offers a means to provide input to the
> >>>>>
> >>>>> OASIS Virtual I/O Device (VIRTIO) TC.
> >>>>>
> >>>>>
> >>>>>
> >>>>> In order to verify user consent to the Feedback License terms and
> >>>>>
> >>>>> to minimize spam in the list archive, subscription is required
> >>>>>
> >>>>> before posting.
> >>>>>
> >>>>>
> >>>>>
> >>>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> >>>>>
> >>>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> >>>>>
> >>>>> List help: virtio-comment-help@lists.oasis-open.org
> >>>>>
> >>>>> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> >>>>>
> >>>>> Feedback License: https://www.oasis-open.org/who/ipr/feedback_licen=
se.pdf
> >>>>>
> >>>>> List Guidelines: https://www.oasis-open.org/policies-guidelines/mai=
ling-lists
> >>>>>
> >>>>> Committee: https://www.oasis-open.org/committees/virtio/
> >>>>>
> >>>>> Join OASIS: https://www.oasis-open.org/join/
> >>>>>
> >>>> This publicly archived list offers a means to provide input to the
> >>>> OASIS Virtual I/O Device (VIRTIO) TC.
> >>>>
> >>>> In order to verify user consent to the Feedback License terms and
> >>>> to minimize spam in the list archive, subscription is required
> >>>> before posting.
> >>>>
> >>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> >>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> >>>> List help: virtio-comment-help@lists.oasis-open.org
> >>>> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> >>>> Feedback License: https://www.oasis-open.org/who/ipr/feedback_licens=
e.pdf
> >>>> List Guidelines: https://www.oasis-open.org/policies-guidelines/mail=
ing-lists
> >>>> Committee: https://www.oasis-open.org/committees/virtio/
> >>>> Join OASIS: https://www.oasis-open.org/join/
> >>>>
> >>> This publicly archived list offers a means to provide input to the
> >>>
> >>> OASIS Virtual I/O Device (VIRTIO) TC.
> >>>
> >>>
> >>>
> >>> In order to verify user consent to the Feedback License terms and
> >>>
> >>> to minimize spam in the list archive, subscription is required
> >>>
> >>> before posting.
> >>>
> >>>
> >>>
> >>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> >>>
> >>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> >>>
> >>> List help: virtio-comment-help@lists.oasis-open.org
> >>>
> >>> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> >>>
> >>> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license=
.pdf
> >>>
> >>> List Guidelines: https://www.oasis-open.org/policies-guidelines/maili=
ng-lists
> >>>
> >>> Committee: https://www.oasis-open.org/committees/virtio/
> >>>
> >>> Join OASIS: https://www.oasis-open.org/join/
> >>>
>
>
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
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

