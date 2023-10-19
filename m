Return-Path: <virtio-comment-return-7825-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC13CCDB47E
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 02:41:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0B1E9780C9
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 02:41:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 00D399868C7
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 02:41:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E977C9868C0; Thu, 19 Oct 2023 02:41:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DAC799868C2
	for <virtio-comment@lists.oasis-open.org>; Thu, 19 Oct 2023 02:41:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: P52EwzwTPiK598XGwboPGw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697683285; x=1698288085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MNS18fcwNwo/7G6ZOyIEQKh7f5E6clC1DMK2hh+2LbM=;
        b=c3zamAEPRMGtySmN9vVsKOmRY11Wy/RzFMOJsVMmN0vDCW0Y3+KkM0nY1j5Iv1JAvJ
         zqQL65M0Wj9Sgdw7IPyKua32t8FuZ+vDxQAMFwLCMtu0NtvnZEkpSudvHwFACEoHTXd+
         c2VAIQTw4FFoNChSflD5mXkwSNYpTGuO0T8qwM1ZHQnQqP6wdey3tSkKT7OZHWgecmGw
         BUlkz7wsL5aSJLUMEBTxSSK3iPuZt9pPi0V3hE3+rwo2iRudmsm9+zJh4ge1TL8sCZDY
         Z3kEN5xmdloHufD+DqO1tKiKIkHClSoJXF02h//BwpVY8xHZ8aO78+cJJE3Gh8iriJUj
         VXsQ==
X-Gm-Message-State: AOJu0YxAv/3+mSmTieFHnNoSqJM0FlUjbuPDF8rKL+tEx7oBtbtykOt2
	HbeekCBot+IePAlWJPSzqD0J5XH81simm2VxdLznSL+T/C6aDXJFYZEpXN+543qZKGNtDaHTSu4
	r9er5xKAzrr6SV+M0WDigM0HDMfDqqbGA49RsVhSPaLQuh2KzEg==
X-Received: by 2002:a19:5011:0:b0:502:afea:dfdd with SMTP id e17-20020a195011000000b00502afeadfddmr568420lfb.13.1697683285449;
        Wed, 18 Oct 2023 19:41:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEu6eZlxUSWJe8Ji+3ClH/6VBct8/4cHzFZq0e8ZfaZO2xTS1SQCz2Wn9RfF0Cao32fesIiukcBoPQ9TBL7oa4=
X-Received: by 2002:a19:5011:0:b0:502:afea:dfdd with SMTP id
 e17-20020a195011000000b00502afeadfddmr568407lfb.13.1697683285071; Wed, 18 Oct
 2023 19:41:25 -0700 (PDT)
MIME-Version: 1.0
References: <20231008112555.473895-1-parav@nvidia.com> <20231008112555.473895-2-parav@nvidia.com>
 <CACGkMEt0PNFUoVEYDtgziE5scYqauADX6PF-_f0NSCcWB_FrCA@mail.gmail.com>
 <DM8PR12MB54801E873241AA02CC32CDCBDCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231009121638-mutt-send-email-mst@kernel.org> <DM8PR12MB5480E0F15A1BBDD745EE3AF4DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <25375529-9c40-9ea9-692e-f557c514c72f@intel.com> <PH0PR12MB54812E59B581546FFB118F3FDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f875fa3b-4b33-71c2-e612-bc2a674a1e59@intel.com> <PH0PR12MB548171A06CCE458C913E4961DCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <97aa9108-0715-2483-f5cf-02698c745d60@intel.com> <PH0PR12MB5481F4F3B4FADD79770ADEA6DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEt-pUSazfjfROukZdaLdmeX1xP7_OxQaQ=Se=jV5NXkDA@mail.gmail.com>
 <PH0PR12MB5481F8312139BB197CEB024BDCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtihTxYADd1dbG=vX9=VLp0xfRJSQ4jd_m0UiuZNz_2sg@mail.gmail.com>
 <PH0PR12MB5481E85F17F9D22CBCC9FDF8DCD6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu_uRcL293Dd+vo2VvYJfUiCaPYF0dAjk-s6=RUtw-PEQ@mail.gmail.com> <PH0PR12MB54813820D9800B4F62C5784FDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB54813820D9800B4F62C5784FDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 19 Oct 2023 10:41:13 +0800
Message-ID: <CACGkMEsMF4JVEQJ6skT2DrEWjop6wjKS6ad6dW2UNOA1oRuPKQ@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Wed, Oct 18, 2023 at 12:30=E2=80=AFPM Parav Pandit <parav@nvidia.com> wr=
ote:
>
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Wednesday, October 18, 2023 6:23 AM
>
> > Why can suspend go directly from guest to device then?
> >
> Because all the virtio registers are treated equally by the live migratio=
n driver.
> So why not?

Good, so you agree that if a new status bit is introduced then it can
work with passthrough? So did the register for indices.

> As explained device synchronizing all the operations which are not mediat=
ed by VMM.
>
> If somehow you claim that all the synchronization is possible _only_ in s=
oftware in various mediation layer,
> And it is impossible in single place in device, than I do not agree.
> V2 listed most of the synchronization points of the device.
>
> > > When such device reset is done, it does not reset the device context,=
 nor it
> > clears the dirty page records, because they are done by the controlling=
 function.
> > >
> > > > I'm not convinced that the scalability is broken by just having 2 o=
r
> > > > 3 more registers. We all know MSIX requires much more than this.
> > > >
> > > Saying there is some other high resource consumer method exists, so l=
ets
> > consume more in new interface we do now, is not good approach.
> >
> > This is self-contradictory and double standard. You allow #MSI-X vector=
s to
> > grow but not config?
> >
>
>
> > > MSI-X on its v2 is underway. Hopefully it will be finished this year,=
 which is
> > already cutting down O(N) resources.
> >
> > Why couldn't such a method be applied to config registers and others?
> >
> Because config registers are not de-duplicating type.
> Meaning each config register is unique in nature.

In nature from the view of the device logic but not the transport like PCIE=
.

> For such work a queue/dma approach is taken.
> So it is applied to config registers and others to not place as _always_a=
vailable registers.
> We just need to do that in virtio too.
> All the recent work of flow filters, counters no longer rely on the confi=
g registers as we both agreed in discussion [1] with your comment

Yes but it serves a different purpose CVQ can't work before probing,
no? Or are you saying you want to trap CVQ for migration?

>
> "Adding cvq is much easier than inventing(duplicating) the work of a tran=
sport."
>
> [1] https://lore.kernel.org/virtio-comment/CACGkMEseZeT4VX8Ut-7KraxLKNOMK=
OgFDNxqKofXSFT8yHfg-w@mail.gmail.com/#t
> > >
> > > > You can't solve all the issues in one series. As stated many times,
> > > I am not solving all issues in one series. This series builds the inf=
rastructure.
> >
> > It's you that is raising the scalability issue, and what you've ignored=
 is that such
> > an "issue" has existed for many years and various hardware has been bui=
lt on
> > top of that.
> >
> That does not mean one should continue with such issue.

Then how many MSI-X vectors do you expect to have for each VF? Why did
you choose that value? Why forbid a vendor to have more than that?

> And that hardware consumes more power and memory that results in overall =
device inefficiency.
> You should have objected the IMS patches in Linux kernel, you should also=
 object new MSI-X proposal and say just use registers.

Actually the reverse, why can't we use something similar to IMS? IMS
allows storage in arbitrary places, no?

>
> > Again, we should make sure the function is correct before we can talk a=
bout
> > others, otherwise it would be an endless discussion.
> >
> And using registers is not the way to make it correct.

Correct in what sense? You are actually

1) doing a complete NACK of the existing PCI transport design
2) prevent new features from developing based on the mature of a
software device implementation
3) tie all new features to the owner/member structure which doesn't
exist and unnecessary for transport other than PCI

> Lets make sure that basic function for the member device to first level i=
s correct.

Isn't this what I'm currently doing?

>
>
> > >
> > > > if you really
> > > > care about the scalability, the correct way is to behave like a rea=
l
> > > > transport through virtqueue instead of trying to duplicate the
> > > > functionality of transport virtqueue slowly.
> > > >
> > > This will be impossible because no device will transport driver notif=
ications
> > using a virtqueue.
> > > Therefore, virtqueue is not some generic transport that does everythi=
ng - as
> > simple as that. hence there is no transport virtqueue.
> >
> > You won't get such a wrong conclusion if you read that proposal.
> I have read those 4 or 5 patches posted by Lingshan and showed you that t=
ime that driver notifications are not coming via virtqueue.
> And if I missed it, and if they are coming via virtqueue, it does not mee=
t the performance and "efficiency principle" from the paper you pointed.

Good and if you read the patches, you should know it allows transport
specific notification or you meant:

MMIO device notification is not coming via the MMIO, so "MMIO"
transport is not efficient?

>
> >
> > >
> > > And virtqueue for bulk data transfer exists so no need to invent yet =
another
> > thing without a good reason.
> >
> > I don't understand why this is related to transport virtqueue anyhow, i=
t's also a
> > queue interface, no?
> Transport virtqueue is diversion of unrelated topic here.

You're talking about scalability, and you are saying registers are the
major blocker, but you stick to registers for guest to use and think
it is scalable.

How can I understand your point from the self contradictory statement above=
?

My point is simple, if your complaint about registers is true and if
you really care about scalability, you should not use any register for
virtio at all, and then you will end up with the transport virtqueue.

>
> A guest vm driver must be able to talk to the member device for all queue=
 configuration etc through its own channel not mediated by the hypervisor.

You just invented a legacy tunnel which requires mediation, no?

> Otherwise such plumbing does not work for any confidential compute worklo=
ad.

I'm pretty sure your conclusion here is wrong. Let's not keep raising
unrelated issues here or you don't want to converge this series. Let's
open a new thread with CC guys if you wish.

> Hence, I wouldn=E2=80=99t discuss transport virtqueue for now.

Again, if you don't want to talk about transport virtqueue, that's
fine. But let's leave the scalability issue aside as well.

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

