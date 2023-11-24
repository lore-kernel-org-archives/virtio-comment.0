Return-Path: <virtio-comment-return-8580-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC24C61D85
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 03:08:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 00FB61FF9B
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 03:08:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9C476986E4E
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 03:08:23 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 77989986E8D; Fri, 24 Nov 2023 03:08:23 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 497299868B1
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 Nov 2023 03:08:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: f2REyAVnPHyUWXweqaiVww-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700795297; x=1701400097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vUt+ZMQbAH+SZkadm9jU54yKk7p4JaJmdi6F4PuPky4=;
        b=eEOUditkc1U+ULo/5rfQTaLUx92Rm6KhiKH5VCaz6ZJKpOIvtJWzWzGcg621lgW7CI
         CeZNM2f6++9/9BRPiZmAtSPScSM9CLwWhGXCYgkvd1lqJ81Zs0IzD+Hu16wdDfSPPV2/
         kcxltkTfWXwJAZ/u4KReuD8kqEALu0r8Tpbk3OdRqUwpZInPHPfp+8m1s/EI//XbviXd
         jqEBvLFHa9O5ByQpDr0PLbJ1WfmBcgawuGimU0WEMk4heVo40z13zwjtsLwdhfo1fPLZ
         JnMWHclR+x9afv/t3ExWWsoP7emiCCQfVghRKT2PzcjvyqDE1iaHbA+q2Avy7kCkK9lw
         kTbQ==
X-Gm-Message-State: AOJu0YwyQgdWupEFjQMqk0aPDkeMVhdqCnCRtCbS44HO0Z/xoSvc9sES
	J8c9/wQcoifGLn9Ss7fQ8SOPhmsaY8bCUzHhVMXrAYoysFLgBF1HigjUp1qDqRkIpabWUQr+5L4
	2t0t7uKPDJp68Z+QEKJRL1/QyNoL5V5IbuGomoST+vZZX68d/5g==
X-Received: by 2002:a05:6512:1251:b0:50a:aa64:a6a9 with SMTP id fb17-20020a056512125100b0050aaa64a6a9mr1765226lfb.16.1700795297458;
        Thu, 23 Nov 2023 19:08:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEyIWujmdSXTs36JXUFC2Vwkr5nY9E3+8Ucf8jBdQr9e0bpyn7u/sx6bcik4g+bQG23ydgFt1i6I/eyDQ88M54=
X-Received: by 2002:a05:6512:1251:b0:50a:aa64:a6a9 with SMTP id
 fb17-20020a056512125100b0050aaa64a6a9mr1765220lfb.16.1700795297111; Thu, 23
 Nov 2023 19:08:17 -0800 (PST)
MIME-Version: 1.0
References: <705e728a-368a-4e28-a7b2-61afddb15ce9@intel.com>
 <PH0PR12MB5481C2B37901FDBBE672EF98DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117054650-mutt-send-email-mst@kernel.org> <PH0PR12MB54813446F8F2BBDBC74BF393DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117063304-mutt-send-email-mst@kernel.org> <PH0PR12MB548179702B4F7B460E09681CDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117065740-mutt-send-email-mst@kernel.org> <PH0PR12MB5481C905833821171814CB13DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117073031-mutt-send-email-mst@kernel.org> <PH0PR12MB548103A393411CF8357B85DEDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117085848-mutt-send-email-mst@kernel.org> <PH0PR12MB5481E5431DFCF96F622A7696DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvYTVA=kOT5vZSZ7nwTm00vbMy92EUV9RMX5ycrhweeVQ@mail.gmail.com>
 <PH0PR12MB54819571D6DC3E7BCF4E010DDCBBA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtr-wnH_zPgM-dZ=ym=5wOcs5maCxB8FXWT9qiGnHpqxw@mail.gmail.com> <PH0PR12MB5481CB661C84D0B6CE799919DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481CB661C84D0B6CE799919DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 24 Nov 2023 11:08:06 +0800
Message-ID: <CACGkMEtgZi5jOWvbAVjhvr=Xz5WR2LOGODyxY6CeLvb0f3Se-A@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, "Zhu, Lingshan" <lingshan.zhu@intel.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>, 
	eperezma <eperezma@redhat.com>, Siwei Liu <loseweigh@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands

On Wed, Nov 22, 2023 at 12:28=E2=80=AFPM Parav Pandit <parav@nvidia.com> wr=
ote:
>
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Wednesday, November 22, 2023 9:50 AM
> >
> > On Wed, Nov 22, 2023 at 12:30=E2=80=AFAM Parav Pandit <parav@nvidia.com=
> wrote:
> > >
> > >
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Tuesday, November 21, 2023 12:25 PM
> > > >
> > > > On Fri, Nov 17, 2023 at 10:48=E2=80=AFPM Parav Pandit <parav@nvidia=
.com>
> > wrote:
> > > > >
> > > > >
> > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > Sent: Friday, November 17, 2023 7:31 PM
> > > > > > To: Parav Pandit <parav@nvidia.com>
> > > > > >
> > > > > > On Fri, Nov 17, 2023 at 01:03:03PM +0000, Parav Pandit wrote:
> > > > > > >
> > > > > > >
> > > > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > > Sent: Friday, November 17, 2023 6:02 PM
> > > > > > > >
> > > > > > > > On Fri, Nov 17, 2023 at 12:11:15PM +0000, Parav Pandit wrot=
e:
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > > > > Sent: Friday, November 17, 2023 5:35 PM
> > > > > > > > > > To: Parav Pandit <parav@nvidia.com>
> > > > > > > > > >
> > > > > > > > > > On Fri, Nov 17, 2023 at 11:45:20AM +0000, Parav Pandit =
wrote:
> > > > > > > > > > >
> > > > > > > > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > > > > > > Sent: Friday, November 17, 2023 5:04 PM
> > > > > > > > > > > >
> > > > > > > > > > > > On Fri, Nov 17, 2023 at 11:05:16AM +0000, Parav Pan=
dit
> > wrote:
> > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > > > > > > > > Sent: Friday, November 17, 2023 4:30 PM
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > On Fri, Nov 17, 2023 at 10:03:47AM +0000, Parav
> > > > > > > > > > > > > > Pandit
> > > > wrote:
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > From: Zhu, Lingshan <lingshan.zhu@intel.com=
>
> > > > > > > > > > > > > > > > Sent: Friday, November 17, 2023 3:30 PM
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > On 11/16/2023 7:59 PM, Michael S. Tsirkin w=
rote:
> > > > > > > > > > > > > > > > > On Thu, Nov 16, 2023 at 06:28:07PM +0800,
> > > > > > > > > > > > > > > > > Zhu, Lingshan
> > > > > > > > wrote:
> > > > > > > > > > > > > > > > >>
> > > > > > > > > > > > > > > > >> On 11/16/2023 1:51 PM, Michael S. Tsirki=
n wrote:
> > > > > > > > > > > > > > > > >>> On Thu, Nov 16, 2023 at 05:29:54AM
> > > > > > > > > > > > > > > > >>> +0000, Parav Pandit
> > > > > > > > wrote:
> > > > > > > > > > > > > > > > >>>> We should expose a limit of the device
> > > > > > > > > > > > > > > > >>>> in the proposed
> > > > > > > > > > > > > > > > WRITE_RECORD_CAP_QUERY command, that how
> > > > > > > > > > > > > > > > much
> > > > > > range
> > > > > > > > > > > > > > > > it can
> > > > > > > > > > > > track.
> > > > > > > > > > > > > > > > >>>> So that future provisioning framework =
can use
> > it.
> > > > > > > > > > > > > > > > >>>>
> > > > > > > > > > > > > > > > >>>> I will cover this in v5 early next wee=
k.
> > > > > > > > > > > > > > > > >>> I do worry about how this can even work
> > though.
> > > > > > > > > > > > > > > > >>> If you want a generic device you do not
> > > > > > > > > > > > > > > > >>> get to dictate how much memory VM
> > > > > > > > > > > > has.
> > > > > > > > > > > > > > > > >>>
> > > > > > > > > > > > > > > > >>> Aren't we talking bit per page? With
> > > > > > > > > > > > > > > > >>> 1TByte of memory to track
> > > > > > > > > > > > > > > > >>> -> 256Gbit -> 32Gbit -> 8Gbyte per VF?
> > > > > > > > > > > > > > > > >>>
> > > > > > > > > > > > > > > > >>> And you happily say "we'll address this=
 in the
> > future"
> > > > > > > > > > > > > > > > >>> while at the same time fighting tooth
> > > > > > > > > > > > > > > > >>> and nail against adding single bit
> > > > > > > > > > > > > > > > >>> status registers because
> > > > > > scalability?
> > > > > > > > > > > > > > > > >>>
> > > > > > > > > > > > > > > > >>>
> > > > > > > > > > > > > > > > >>> I have a feeling doing this completely
> > > > > > > > > > > > > > > > >>> theoretical like this is
> > > > > > > > > > > > problematic.
> > > > > > > > > > > > > > > > >>> Maybe you have it all laid out neatly i=
n
> > > > > > > > > > > > > > > > >>> your head but I suspect not all of TC
> > > > > > > > > > > > > > > > >>> can picture it clearly enough based jus=
t
> > > > > > > > > > > > > > > > >>> on spec
> > > > > > > > > > > > text.
> > > > > > > > > > > > > > > > >>>
> > > > > > > > > > > > > > > > >>> We do sometimes ask for POC
> > > > > > > > > > > > > > > > >>> implementation in linux / qemu to
> > > > > > > > > > > > > > > > >>> demonstrate how things work before
> > > > > > > > > > > > > > > > >>> merging
> > > > > > > > code.
> > > > > > > > > > > > > > > > >>> We skipped this for admin things so far
> > > > > > > > > > > > > > > > >>> but I think it's a good idea to start d=
oing it here.
> > > > > > > > > > > > > > > > >>>
> > > > > > > > > > > > > > > > >>> What makes me pause a bit before saying
> > > > > > > > > > > > > > > > >>> please do a PoC is all the opposition
> > > > > > > > > > > > > > > > >>> that seems to exist to even using admin
> > > > > > > > > > > > > > > > >>> commands in the 1st place. I think once
> > > > > > > > > > > > > > > > >>> we finally stop arguing about whether t=
o
> > > > > > > > > > > > > > > > >>> use admin commands at all then a PoC
> > > > > > > > > > > > > > > > >>> will be needed
> > > > > > > > > > > > > > before merging.
> > > > > > > > > > > > > > > > >> We have POR productions that implemented
> > > > > > > > > > > > > > > > >> the approach in my
> > > > > > > > > > > > series.
> > > > > > > > > > > > > > > > >> They are multiple generations of
> > > > > > > > > > > > > > > > >> productions in market and running in
> > > > > > > > > > > > > > > > >> customers data centers for
> > > > years.
> > > > > > > > > > > > > > > > >>
> > > > > > > > > > > > > > > > >> Back to 2019 when we start working on
> > > > > > > > > > > > > > > > >> vDPA, we have sent some samples of
> > > > > > > > > > > > > > > > >> production(e.g., Cascade
> > > > > > > > > > > > > > > > >> Glacier) and the datasheet, you can find
> > > > > > > > > > > > > > > > >> live migration facilities there, include=
s
> > > > > > > > > > > > > > > > >> suspend, vq state and other
> > > > > > > > features.
> > > > > > > > > > > > > > > > >>
> > > > > > > > > > > > > > > > >> And there is an reference in DPDK live
> > > > > > > > > > > > > > > > >> migration, I have provided this page
> > > > > > > > > > > > > > > > >> before:
> > > > > > > > > > > > > > > > >> https://doc.dpdk.org/guides-21.11/vdpade=
v
> > > > > > > > > > > > > > > > >> s/if c.ht ml, it has been working for
> > > > > > > > > > > > > > > > >> long long time.
> > > > > > > > > > > > > > > > >>
> > > > > > > > > > > > > > > > >> So if we let the facts speak, if we want
> > > > > > > > > > > > > > > > >> to see if the proposal is proven to work=
,
> > > > > > > > > > > > > > > > >> I would
> > > > > > > > > > > > > > > > >> say: They are POR for years, customers
> > > > > > > > > > > > > > > > >> already deployed them for
> > > > > > > > > > > > years.
> > > > > > > > > > > > > > > > > And I guess what you are trying to say is
> > > > > > > > > > > > > > > > > that this patchset we are reviewing here
> > > > > > > > > > > > > > > > > should be help to the same standard and
> > > > > > > > > > > > > > > > > there should be a PoC? Sounds
> > > > > > reasonable.
> > > > > > > > > > > > > > > > Yes and the in-marketing productions are
> > > > > > > > > > > > > > > > POR, the series just improves the design,
> > > > > > > > > > > > > > > > for example, our series also use registers
> > > > > > > > > > > > > > > > to track vq state, but improvements than CG
> > > > > > > > > > > > > > > > or BSC. So I think they are proven
> > > > > > > > > > > > > > to work.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > If you prefer to go the route of POR and
> > > > > > > > > > > > > > > production and proven documents
> > > > > > > > > > > > > > etc, there is ton of it of multiple types of
> > > > > > > > > > > > > > products I can dump here with open- source code
> > > > > > > > > > > > > > and documentation and
> > > > > > more.
> > > > > > > > > > > > > > > Let me know what you would like to see.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Michael has requested some performance
> > > > > > > > > > > > > > > comparisons, not all are ready to
> > > > > > > > > > > > > > share yet.
> > > > > > > > > > > > > > > Some are present that I will share in coming =
weeks.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > And all the vdpa dpdk you published does not
> > > > > > > > > > > > > > > have basic CVQ support when I
> > > > > > > > > > > > > > last looked at it.
> > > > > > > > > > > > > > > Do you know when was it added?
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > It's good enough for PoC I think, CVQ or not.
> > > > > > > > > > > > > > The problem with CVQ generally, is that VDPA
> > > > > > > > > > > > > > wants to shadow CVQ it at all times because it
> > > > > > > > > > > > > > wants to decode and cache the content. But this
> > > > > > > > > > > > > > problem has nothing to do with dirty tracking
> > > > > > > > > > > > > > even though it also
> > > > > > > > > > > > mentions "shadow":
> > > > > > > > > > > > > > if device can report it's state then there's no
> > > > > > > > > > > > > > need to shadow
> > > > > > CVQ.
> > > > > > > > > > > > >
> > > > > > > > > > > > > For the performance numbers with the pre-copy and
> > > > > > > > > > > > > device context of
> > > > > > > > > > > > patches posted 1 to 5, the downtime reduction of th=
e
> > > > > > > > > > > > VM is 3.71x with active traffic on 8 RQs at 100Gbps=
 port
> > speed.
> > > > > > > > > > > >
> > > > > > > > > > > > Sounds good can you please post a bit more detail?
> > > > > > > > > > > > which configs are you comparing what was the result
> > > > > > > > > > > > on each of
> > > > > > them.
> > > > > > > > > > >
> > > > > > > > > > > Common config: 8+8 tx and rx queues.
> > > > > > > > > > > Port speed: 100Gbps
> > > > > > > > > > > QEMU 8.1
> > > > > > > > > > > Libvirt 7.0
> > > > > > > > > > > GVM: Centos 7.4
> > > > > > > > > > > Device: virtio VF hardware device
> > > > > > > > > > >
> > > > > > > > > > > Config_1: virtio suspend/resume similar to what
> > > > > > > > > > > Lingshan has, largely vdpa stack
> > > > > > > > > > > Config_2: Device context method of admin commands
> > > > > > > > > >
> > > > > > > > > > OK that sounds good. The weird thing here is that you
> > > > > > > > > > measure
> > > > > > "downtime".
> > > > > > > > > > What exactly do you mean here?
> > > > > > > > > > I am guessing it's the time to retrieve on source and
> > > > > > > > > > re-program device state on destination? And this is
> > > > > > > > > > 3.71x out of
> > > > how long?
> > > > > > > > > Yes. Downtime is the time during which the VM is not
> > > > > > > > > responding or receiving
> > > > > > > > packets, which involves reprogramming the device.
> > > > > > > > > 3.71x is relative time for this discussion.
> > > > > > > >
> > > > > > > > Oh interesting. So VM state movement including reprogrammin=
g
> > > > > > > > the CPU is dominated by reprogramming this single NIC, by a
> > > > > > > > factor of
> > > > almost 4?
> > > > > > > Yes.
> > > > > >
> > > > > > Could you post some numbers too then?  I want to know whether
> > > > > > that would imply that VM boot is slowed down significantly too.
> > > > > > If yes that's another motivation for pci transport 2.0.
> > > > > It was 1.8 sec down to 480msec.
> > > >
> > > > Well, there's work ongoing to reduce the downtime of the shadow
> > virtqueue.
> > > >
> > > > Eugenio or Si-wei may share an exact number, but it should be
> > > > several hundreds of ms.
> > > >
> > > Shadow vq is not applicable at all as comparison point because there =
is no
> > virtio specific qemu etc software involved here.
> >
> > I don't get the point.
> >
> > Shadow virtqueue is virtio specific for sure and the core logic is deco=
upled of
> > the vDPA logic. If not, it's bug and we need to fix.
> >
> The base requirement is that the software is not mediating any virtio int=
erfaces (config, cvq, data vqs).

I think we agree that any proposal should work in both passthrough and
non-passthrough. No?

Otherwise we circle back.

Thanks


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

