Return-Path: <virtio-comment-return-8576-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3929AC636CB
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 02:30:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 755522AEE0
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 02:30:14 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4F6439868A8
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 02:30:14 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2DC039865ED; Fri, 24 Nov 2023 02:30:14 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1C3599868A5
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 Nov 2023 02:30:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: eaLxubbBOqW4NZ5CEbgJsA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700793007; x=1701397807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q5Ls57cL2bZBO1G+RWTV4TQVk3jg8EVpwU7pKhQ5JTI=;
        b=TqnX8Q3FLVvw8Uieg3vwXut6oP2BUSM+j8gef7PnJL/WgA3QnHA4MwtVM2aZMOi2XY
         zxZboke77FIolCOLqye8UQye5QAzkcJtJ3RRP8DJwh4kohp2svBsXcScN/eHMUYCJtLT
         qZqtAssUzoMK9QOUHvEVqDaJmNV+uqSBAQLXHpIWJrUAi6B/PkuXwIYRu+h6iA2xpWZB
         /+av3gLQlSAMyFUipZVFFYZcnguoSiQiENk8GHas+wWDYemgG5fMbX+LrznnDVzKort5
         8GGle5uMbeddA7eZPdP2DV927NBuwzOYh45ti35hHNMtr8dkghQW89T9G2duYNJYsRjY
         oMwg==
X-Gm-Message-State: AOJu0YzKPghNEB5kVE1T1zqYciGNfSzoWf1DxYX2AfkqtxnaiTcV02dH
	nJsHHBDPAMsElx47i0Q4Xy0vmDvAGUgX3joj1kDn1NSllQK/Na71UB+RWRvxp+kC1pbx1A5eSDQ
	3+oN1nUPRdT80KsE5ixFFbXfOwprxJ7PZWMg5a+VXp5XgNTgKcA==
X-Received: by 2002:a05:6512:2096:b0:506:899d:1989 with SMTP id t22-20020a056512209600b00506899d1989mr614407lfr.44.1700793007178;
        Thu, 23 Nov 2023 18:30:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJ5s8QsBQRHNNEdvM+Xww13oYWnXYYh9ONhU4Co8CkPHT7EiCT1M94LErdEtsPznhRL73dtNSZA8JujBZtNiM=
X-Received: by 2002:a05:6512:2096:b0:506:899d:1989 with SMTP id
 t22-20020a056512209600b00506899d1989mr614397lfr.44.1700793006660; Thu, 23 Nov
 2023 18:30:06 -0800 (PST)
MIME-Version: 1.0
References: <705e728a-368a-4e28-a7b2-61afddb15ce9@intel.com>
 <PH0PR12MB5481C2B37901FDBBE672EF98DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117054650-mutt-send-email-mst@kernel.org> <PH0PR12MB54813446F8F2BBDBC74BF393DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117063304-mutt-send-email-mst@kernel.org> <PH0PR12MB548179702B4F7B460E09681CDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117065740-mutt-send-email-mst@kernel.org> <PH0PR12MB5481C905833821171814CB13DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117073031-mutt-send-email-mst@kernel.org> <PH0PR12MB548103A393411CF8357B85DEDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117085848-mutt-send-email-mst@kernel.org> <PH0PR12MB5481E5431DFCF96F622A7696DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvYTVA=kOT5vZSZ7nwTm00vbMy92EUV9RMX5ycrhweeVQ@mail.gmail.com>
 <bcb86082-31d8-4c59-b731-9aca05742568@oracle.com> <CACGkMEuOV7fSN8hXRG6HOvfOBZYrr_ZvRE0eEJwCxeHzLHebYQ@mail.gmail.com>
 <9404c15c-9c9b-45c7-befd-636b3d831c3e@oracle.com>
In-Reply-To: <9404c15c-9c9b-45c7-befd-636b3d831c3e@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 24 Nov 2023 10:29:55 +0800
Message-ID: <CACGkMEtq7hFh1E_esYnYW6YQcru4_jvwAQJb6tJAB_zC87fcEQ@mail.gmail.com>
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

On Thu, Nov 23, 2023 at 9:19=E2=80=AFPM Si-Wei Liu <si-wei.liu@oracle.com> =
wrote:
>
>
>
> On 11/21/2023 9:31 PM, Jason Wang wrote:
> > On Wed, Nov 22, 2023 at 10:31=E2=80=AFAM Si-Wei Liu <si-wei.liu@oracle.=
com> wrote:
> >> (dropping my personal email abandoned for upstream discussion for now,
> >> please try to copy my corporate email address for more timely response=
)
> >>
> >> On 11/20/2023 10:55 PM, Jason Wang wrote:
> >>> On Fri, Nov 17, 2023 at 10:48=E2=80=AFPM Parav Pandit <parav@nvidia.c=
om> wrote:
> >>>>> From: Michael S. Tsirkin <mst@redhat.com>
> >>>>> Sent: Friday, November 17, 2023 7:31 PM
> >>>>> To: Parav Pandit <parav@nvidia.com>
> >>>>>
> >>>>> On Fri, Nov 17, 2023 at 01:03:03PM +0000, Parav Pandit wrote:
> >>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
> >>>>>>> Sent: Friday, November 17, 2023 6:02 PM
> >>>>>>>
> >>>>>>> On Fri, Nov 17, 2023 at 12:11:15PM +0000, Parav Pandit wrote:
> >>>>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
> >>>>>>>>> Sent: Friday, November 17, 2023 5:35 PM
> >>>>>>>>> To: Parav Pandit <parav@nvidia.com>
> >>>>>>>>>
> >>>>>>>>> On Fri, Nov 17, 2023 at 11:45:20AM +0000, Parav Pandit wrote:
> >>>>>>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
> >>>>>>>>>>> Sent: Friday, November 17, 2023 5:04 PM
> >>>>>>>>>>>
> >>>>>>>>>>> On Fri, Nov 17, 2023 at 11:05:16AM +0000, Parav Pandit wrote:
> >>>>>>>>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
> >>>>>>>>>>>>> Sent: Friday, November 17, 2023 4:30 PM
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> On Fri, Nov 17, 2023 at 10:03:47AM +0000, Parav Pandit wrot=
e:
> >>>>>>>>>>>>>>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
> >>>>>>>>>>>>>>> Sent: Friday, November 17, 2023 3:30 PM
> >>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>> On 11/16/2023 7:59 PM, Michael S. Tsirkin wrote:
> >>>>>>>>>>>>>>>> On Thu, Nov 16, 2023 at 06:28:07PM +0800, Zhu,
> >>>>>>>>>>>>>>>> Lingshan
> >>>>>>> wrote:
> >>>>>>>>>>>>>>>>> On 11/16/2023 1:51 PM, Michael S. Tsirkin wrote:
> >>>>>>>>>>>>>>>>>> On Thu, Nov 16, 2023 at 05:29:54AM +0000, Parav
> >>>>>>>>>>>>>>>>>> Pandit
> >>>>>>> wrote:
> >>>>>>>>>>>>>>>>>>> We should expose a limit of the device in the
> >>>>>>>>>>>>>>>>>>> proposed
> >>>>>>>>>>>>>>> WRITE_RECORD_CAP_QUERY command, that how much
> >>>>> range
> >>>>>>>>>>>>>>> it can
> >>>>>>>>>>> track.
> >>>>>>>>>>>>>>>>>>> So that future provisioning framework can use it.
> >>>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>>> I will cover this in v5 early next week.
> >>>>>>>>>>>>>>>>>> I do worry about how this can even work though.
> >>>>>>>>>>>>>>>>>> If you want a generic device you do not get to
> >>>>>>>>>>>>>>>>>> dictate how much memory VM
> >>>>>>>>>>> has.
> >>>>>>>>>>>>>>>>>> Aren't we talking bit per page? With 1TByte of
> >>>>>>>>>>>>>>>>>> memory to track
> >>>>>>>>>>>>>>>>>> -> 256Gbit -> 32Gbit -> 8Gbyte per VF?
> >>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>> And you happily say "we'll address this in the future"
> >>>>>>>>>>>>>>>>>> while at the same time fighting tooth and nail
> >>>>>>>>>>>>>>>>>> against adding single bit status registers because
> >>>>> scalability?
> >>>>>>>>>>>>>>>>>> I have a feeling doing this completely
> >>>>>>>>>>>>>>>>>> theoretical like this is
> >>>>>>>>>>> problematic.
> >>>>>>>>>>>>>>>>>> Maybe you have it all laid out neatly in your
> >>>>>>>>>>>>>>>>>> head but I suspect not all of TC can picture it
> >>>>>>>>>>>>>>>>>> clearly enough based just on spec
> >>>>>>>>>>> text.
> >>>>>>>>>>>>>>>>>> We do sometimes ask for POC implementation in
> >>>>>>>>>>>>>>>>>> linux / qemu to demonstrate how things work
> >>>>>>>>>>>>>>>>>> before merging
> >>>>>>> code.
> >>>>>>>>>>>>>>>>>> We skipped this for admin things so far but I
> >>>>>>>>>>>>>>>>>> think it's a good idea to start doing it here.
> >>>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>>> What makes me pause a bit before saying please
> >>>>>>>>>>>>>>>>>> do a PoC is all the opposition that seems to
> >>>>>>>>>>>>>>>>>> exist to even using admin commands in the 1st
> >>>>>>>>>>>>>>>>>> place. I think once we finally stop arguing
> >>>>>>>>>>>>>>>>>> about whether to use admin commands at all then
> >>>>>>>>>>>>>>>>>> a PoC will be needed
> >>>>>>>>>>>>> before merging.
> >>>>>>>>>>>>>>>>> We have POR productions that implemented the
> >>>>>>>>>>>>>>>>> approach in my
> >>>>>>>>>>> series.
> >>>>>>>>>>>>>>>>> They are multiple generations of productions in
> >>>>>>>>>>>>>>>>> market and running in customers data centers for years.
> >>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>> Back to 2019 when we start working on vDPA, we
> >>>>>>>>>>>>>>>>> have sent some samples of production(e.g.,
> >>>>>>>>>>>>>>>>> Cascade
> >>>>>>>>>>>>>>>>> Glacier) and the datasheet, you can find live
> >>>>>>>>>>>>>>>>> migration facilities there, includes suspend, vq
> >>>>>>>>>>>>>>>>> state and other
> >>>>>>> features.
> >>>>>>>>>>>>>>>>> And there is an reference in DPDK live migration,
> >>>>>>>>>>>>>>>>> I have provided this page
> >>>>>>>>>>>>>>>>> before:
> >>>>>>>>>>>>>>>>> https://doc.dpdk.org/guides-21.11/vdpadevs/ifc.ht
> >>>>>>>>>>>>>>>>> ml, it has been working for long long time.
> >>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>>> So if we let the facts speak, if we want to see
> >>>>>>>>>>>>>>>>> if the proposal is proven to work, I would
> >>>>>>>>>>>>>>>>> say: They are POR for years, customers already
> >>>>>>>>>>>>>>>>> deployed them for
> >>>>>>>>>>> years.
> >>>>>>>>>>>>>>>> And I guess what you are trying to say is that
> >>>>>>>>>>>>>>>> this patchset we are reviewing here should be help
> >>>>>>>>>>>>>>>> to the same standard and there should be a PoC? Sounds
> >>>>> reasonable.
> >>>>>>>>>>>>>>> Yes and the in-marketing productions are POR, the
> >>>>>>>>>>>>>>> series just improves the design, for example, our
> >>>>>>>>>>>>>>> series also use registers to track vq state, but
> >>>>>>>>>>>>>>> improvements than CG or BSC. So I think they are
> >>>>>>>>>>>>>>> proven
> >>>>>>>>>>>>> to work.
> >>>>>>>>>>>>>> If you prefer to go the route of POR and production
> >>>>>>>>>>>>>> and proven documents
> >>>>>>>>>>>>> etc, there is ton of it of multiple types of products I
> >>>>>>>>>>>>> can dump here with open- source code and documentation and
> >>>>> more.
> >>>>>>>>>>>>>> Let me know what you would like to see.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> Michael has requested some performance comparisons,
> >>>>>>>>>>>>>> not all are ready to
> >>>>>>>>>>>>> share yet.
> >>>>>>>>>>>>>> Some are present that I will share in coming weeks.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> And all the vdpa dpdk you published does not have
> >>>>>>>>>>>>>> basic CVQ support when I
> >>>>>>>>>>>>> last looked at it.
> >>>>>>>>>>>>>> Do you know when was it added?
> >>>>>>>>>>>>> It's good enough for PoC I think, CVQ or not.
> >>>>>>>>>>>>> The problem with CVQ generally, is that VDPA wants to
> >>>>>>>>>>>>> shadow CVQ it at all times because it wants to decode
> >>>>>>>>>>>>> and cache the content. But this problem has nothing to
> >>>>>>>>>>>>> do with dirty tracking even though it also
> >>>>>>>>>>> mentions "shadow":
> >>>>>>>>>>>>> if device can report it's state then there's no need to sha=
dow
> >>>>> CVQ.
> >>>>>>>>>>>> For the performance numbers with the pre-copy and device
> >>>>>>>>>>>> context of
> >>>>>>>>>>> patches posted 1 to 5, the downtime reduction of the VM is
> >>>>>>>>>>> 3.71x with active traffic on 8 RQs at 100Gbps port speed.
> >>>>>>>>>>>
> >>>>>>>>>>> Sounds good can you please post a bit more detail?
> >>>>>>>>>>> which configs are you comparing what was the result on each o=
f
> >>>>> them.
> >>>>>>>>>> Common config: 8+8 tx and rx queues.
> >>>>>>>>>> Port speed: 100Gbps
> >>>>>>>>>> QEMU 8.1
> >>>>>>>>>> Libvirt 7.0
> >>>>>>>>>> GVM: Centos 7.4
> >>>>>>>>>> Device: virtio VF hardware device
> >>>>>>>>>>
> >>>>>>>>>> Config_1: virtio suspend/resume similar to what Lingshan has,
> >>>>>>>>>> largely vdpa stack
> >>>>>>>>>> Config_2: Device context method of admin commands
> >>>>>>>>> OK that sounds good. The weird thing here is that you measure
> >>>>> "downtime".
> >>>>>>>>> What exactly do you mean here?
> >>>>>>>>> I am guessing it's the time to retrieve on source and re-progra=
m
> >>>>>>>>> device state on destination? And this is 3.71x out of how long?
> >>>>>>>> Yes. Downtime is the time during which the VM is not responding =
or
> >>>>>>>> receiving
> >>>>>>> packets, which involves reprogramming the device.
> >>>>>>>> 3.71x is relative time for this discussion.
> >>>>>>> Oh interesting. So VM state movement including reprogramming the =
CPU
> >>>>>>> is dominated by reprogramming this single NIC, by a factor of alm=
ost 4?
> >>>>>> Yes.
> >>>>> Could you post some numbers too then?  I want to know whether that =
would
> >>>>> imply that VM boot is slowed down significantly too. If yes that's =
another
> >>>>> motivation for pci transport 2.0.
> >>>> It was 1.8 sec down to 480msec.
> >>> Well, there's work ongoing to reduce the downtime of the shadow virtq=
ueue.
> >>>
> >>> Eugenio or Si-wei may share an exact number, but it should be several
> >>> hundreds of ms.
> >> That was mostly for device teardown time at the the source but there's
> >> also setup cost at the destination that needs to be counted.
> >> Several hundred of milliseconds would be the ultimate goal I would say
> >> (right now the numbers from Parav more or less reflects the status quo
> >> but there's ongoing work to make it further down), and I don't doubt
> >> several hundreds of ms is possible. But to be fair, on the other hand,
> >> shadow vq on real vdpa hardware device would need a lot of dedicated
> >> optimization work across all layers (including hardware or firmware) a=
ll
> >> over the places to achieve what a simple suspend-resume (save/load)
> >> interface can easily do with VFIO migration.
> > That's fine. Just to clairfy, shadow virtqueue here doesn't mean it
> > can't save/load. We want to see how it is useful for dirty page
> > tracking since tracking dirty pages by device itself seems problematic
> > at least from my point of view.
> TBH I don't see how this comparison can help prove the problematic part
> of device dirty tracking, or if it has anything to do with.

Shadow virtqueue is not used to prove the problem, the problem could
be uncovered during the review.

The shadow virtuqueue is used to give us a bottom line. If a huge
effort were done for spec but it can't perform better than virtqueue,
the effort became meaningless.

> In many
> cases vDPA and hardware virtio are for different deployment scenarios
> with varied target users, I don't see how vDPA can completely substitute
> hardware virtio for many reasons regardless shadow virtqueue wins or not.

It's not about whether vDPA can win or not. It's about a quick
demonstration about how shadow virtqueue can perform.  From the view
of the shadow virtqueue, it doesn't know whether the underlayer is
vDPA or virtio. It's not hard to imagine, the downtime we get from
vDPA is the bottom line of downtime via virtio since virtio is much
more easier.

>
> If anything relevant I would more like to see performance comparison
> with platform dirty tracking via IOMMUFD, but that's perhaps too early
> stage at this point to conclude anything given there's very limited
> availability (in terms of supporting software, I know some supporting
> hardware has been around for a few years) and none of the potential
> software optimizations is in place at this point to make a fair
> comparison for.

We need to make sure the correctness of the function before we can
talk about optimizations. And I don't see how this proposal is
optimized for many ways.

> Granted device assisted tracking has its own set of
> limitations e.g. loose coupling or integration with platform features,
> lack of nested and PASID support et al. However, state of the art for
> platform dirty tracking is not perfect either, far off being highly
> optimized for all types of workload or scenarios. At least to me the
> cost of page table walk to scan all PTEs across all levels is not easily
> negligible - given no PML equivalent here, are we sure the whole range
> scan can be as efficient and scalable as memory size / # of PTEs grows?

If you see the discussion, this proposal requires scan PTEs as well in
many ways.

> How large it may impact the downtime with this rudimentary dirty scan?
> No data point was given thus far. If chances are that there could be
> major improvement from device tracking for those general use cases to
> supplement what platform cannot achieve efficiently enough, it's not too
> good to kill off the possibility entirely at this early stage. Maybe a
> PoC or some comparative performance data can help prove the theory?

We can ask in the thread of IOMMUFD dirty tracking patches.

>
> On the other hand, the device assisted tracking has at least one
> advantage that platform cannot simply offer - throttle down device for
> convergence, inherently or explicitly whenever needed.

Please refer the past discussion, I can see how it is throttled in the
case of PML similar mechanism. But I can't see how it can be done
here. This proposal requires the device to reserver sufficient
resources where the throttle is implementation specific where the
hypervisor can't depend on. It needs API to set dirty page rates at
least.

>I think earlier
> Micheal suggested something to make the core data structure used for
> logging more efficient and compact, working like PML but using a queue
> or an array, and the entry of which may contain a list of discrete pages
> or contiguous PFN ranges.

PML solve the resources problem but not other problem:

1) Throttling: it's still not something that hypervisor can depend.
The reason why PML in CPU work is that hypervisor can throttle the KVM
process so it can slow down to the expected dirty rates.
2) Platform specific issue: PASID, ATS, translation failures, reserved
regions, and a lot of other stuffs
3) vIOMMU issue: horrible delay in IOTLB invalidation path
4) Doesn't work in the case of vIOMMU offloading

And compare the the existing approach, it ends up with more PCI
transactions under heavy load.

> On top of this one may add parallelism to
> distribute load to multiple queues, or add zero copy to speed up dirty
> sync to userspace - things virtio queues are pretty good at doing. After
> all, nothing can be perfect to begin with, and every complex feature
> would need substantial time to improve and evolve.

Evolve is good, but the problem is platform is also evolving. The
function is duplicated there and platform provides a lot of advanced
features that can co-operate with dirty page tracking like vIOMMU
offloading where it almost impossible to be done in virtio. Virtio
needs to leverage the platform or transport instead of reinventing
wheels so it can focus on the virtio device logic.

> It does so for shadow
> virtqueue from where it gets started to where it is now, even so there's
> still a lot of optimization work not done yet. There must be head room
> here for device page tracking or platform tracking, too.

Let's then focus on the possible issues (I've pointed out a brunches).

Thanks

>
> Regards,
> -Siwei
>
>
> >
> > Shadow virtqueue can be used with a save/load model for device state
> > recovery for sure.
> >
> >>> But it seems the shadow virtqueue itself is not the major factor but
> >>> the time spent on programming vendor specific mappings for example.
> >> Yep. The slowness on mapping part is mostly due to the artifact of
> >> software-based implementation. IMHO for live migration p.o.v it's bett=
er
> >> to not involve any mapping operation in the down time path at all.
> > Yes.
> >
> > Thanks
> >
> >> -Siwei
> >>> Thanks
> >>>
> >>>> The time didn't come from pci side or boot side.
> >>>>
> >>>> For pci side of things you would want to compare the pci vs non pci =
device based VM boot time.
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
> >>
> >> This publicly archived list offers a means to provide input to the
> >> OASIS Virtual I/O Device (VIRTIO) TC.
> >>
> >> In order to verify user consent to the Feedback License terms and
> >> to minimize spam in the list archive, subscription is required
> >> before posting.
> >>
> >> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> >> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> >> List help: virtio-comment-help@lists.oasis-open.org
> >> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> >> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.=
pdf
> >> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailin=
g-lists
> >> Committee: https://www.oasis-open.org/committees/virtio/
> >> Join OASIS: https://www.oasis-open.org/join/
> >>
> >
> > This publicly archived list offers a means to provide input to the
> >
> > OASIS Virtual I/O Device (VIRTIO) TC.
> >
> >
> >
> > In order to verify user consent to the Feedback License terms and
> >
> > to minimize spam in the list archive, subscription is required
> >
> > before posting.
> >
> >
> >
> > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> >
> > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> >
> > List help: virtio-comment-help@lists.oasis-open.org
> >
> > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> >
> > Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.p=
df
> >
> > List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing=
-lists
> >
> > Committee: https://www.oasis-open.org/committees/virtio/
> >
> > Join OASIS: https://www.oasis-open.org/join/
> >
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

