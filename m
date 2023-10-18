Return-Path: <virtio-comment-return-7771-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11077CDB474
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 00:53:05 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 368AF747CB
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 00:53:05 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0ACC5986887
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 00:53:05 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E5DE3983C26; Wed, 18 Oct 2023 00:53:04 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CE4CD986885
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Oct 2023 00:53:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 1TF-Q9s0Oo-vYnKT8npW8g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697590371; x=1698195171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EMsQUjgBLdLIX9YO5IhUrnxrRzrpTTGfsvcUYRLd6i0=;
        b=EzfSIi7BFQYtH6hVBA3hU8uD3abJC64v53QHXlGsTjauowS+XoEaCJS2HklerR/7vj
         hwWvhytdxHszOZeVmKSB9Au+8cJbjdxibmJfMjWZGWJlfnCFvWoWsI288YI5YoRrySwX
         ErCvCC1vp5BSuMRw9KRN62Gdqwu/LYqI/JZLzeRWIGz6fDOInBeP/3itOI1AGJUiBCRe
         JG376SMpG+78ngxwH+xQo1ANDc4TJeJQ8b1ygvw/6r+j/jGR7jTIEdrQR0XxgH8VxkS5
         jIt3zu3wDtl+75rbsEBT947GG4TE3uUKXi0yjGpFssF6YqnBWYUwGODeeaHIbPO6ltrb
         bqqw==
X-Gm-Message-State: AOJu0YxbxD+9BDo8qyX8QyHtPurIPGUN+hUyXpi1MWmhc/wk5Ryecx/N
	9EKk9pbuexH5nxqg3fSVub0t3pdCBtMPo+DlKWL8h8WoCetTa7XRYusR1qtymz5+1mjz0znhwLt
	Tt94QMbujUy41N2B0JBMhxa8iWxrA+tv5kb6ODRE8sHfUW55OxA==
X-Received: by 2002:ac2:5a04:0:b0:500:99a9:bc40 with SMTP id q4-20020ac25a04000000b0050099a9bc40mr2721945lfn.69.1697590370902;
        Tue, 17 Oct 2023 17:52:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElEpU47Rc/jlOI4xDJ/qcfwxTo8WCwEvWXcf0FPybqbJkpB97xngIuPlvU893Uryiqdl3EpWhJEoOXW/+xPE4=
X-Received: by 2002:ac2:5a04:0:b0:500:99a9:bc40 with SMTP id
 q4-20020ac25a04000000b0050099a9bc40mr2721930lfn.69.1697590370580; Tue, 17 Oct
 2023 17:52:50 -0700 (PDT)
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
 <CACGkMEtihTxYADd1dbG=vX9=VLp0xfRJSQ4jd_m0UiuZNz_2sg@mail.gmail.com> <PH0PR12MB5481E85F17F9D22CBCC9FDF8DCD6A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481E85F17F9D22CBCC9FDF8DCD6A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 18 Oct 2023 08:52:39 +0800
Message-ID: <CACGkMEu_uRcL293Dd+vo2VvYJfUiCaPYF0dAjk-s6=RUtw-PEQ@mail.gmail.com>
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

On Tue, Oct 17, 2023 at 11:26=E2=80=AFAM Parav Pandit <parav@nvidia.com> wr=
ote:
>
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Tuesday, October 17, 2023 7:23 AM
> >
> > On Fri, Oct 13, 2023 at 2:36=E2=80=AFPM Parav Pandit <parav@nvidia.com>=
 wrote:
> > >
> > >
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Friday, October 13, 2023 6:47 AM
> > > >
> > > > On Thu, Oct 12, 2023 at 6:58=E2=80=AFPM Parav Pandit <parav@nvidia.=
com> wrote:
> > > > >
> > > > >
> > > > > > From: Zhu, Lingshan <lingshan.zhu@intel.com>
> > > > > > Sent: Thursday, October 12, 2023 3:51 PM
> > > > > >
> > > > > > On 10/11/2023 7:43 PM, Parav Pandit wrote:
> > > > > > >> From: Zhu, Lingshan <lingshan.zhu@intel.com>
> > > > > > >> Sent: Wednesday, October 11, 2023 3:55 PM
> > > > > > >>>>>>> I don=E2=80=99t have any strong opinion to keep it or r=
emove it
> > > > > > >>>>>>> as most stakeholders
> > > > > > >>>>>> has the clear view of requirements now.
> > > > > > >>>>>>> Let me know.
> > > > > > >>>>>> So some people use VFs with VFIO. Hence the module name.
> > > > > > >>>>>> This sentence by itself seems to have zero value for the
> > > > > > >>>>>> spec. Just
> > > > drop it.
> > > > > > >>>>> Ok. Will drop.
> > > > > > >>>> So why not build your admin vq live migration on our confi=
g
> > > > > > >>>> space solution, get out of the troubles, to make your life=
 easier?
> > > > > > >>>>
> > > > > > >>> Your this question is completely unrelated to this reply or
> > > > > > >>> you misunderstood
> > > > > > >> what dropping commit log means.
> > > > > > >> if you can rebase admin vq LM on our basic facilities, I
> > > > > > >> think you dont need to talk about vfio in the first place, s=
o
> > > > > > >> I ask you to re-consider
> > > > > > Jason's proposal.
> > > > > > > I don=E2=80=99t really know why you are upset with the vfio t=
erm.
> > > > > > > It is the use case of the cloud operator and it is listed to
> > > > > > > indicate how proposal
> > > > > > fits in a such use case.
> > > > > > > If for some reason, you don=E2=80=99t like vfio, fine. Ignore=
 it and move on.
> > > > > > >
> > > > > > > I already answered that I will remove from the commit log,
> > > > > > > because the
> > > > > > requirements are well understood now by the committee.
> > > > > > >
> > > > > > > Your comment is again unrelated (repeated) to your past two
> > questions.
> > > > > > >
> > > > > > > I explained you the technical problem that admin command (not
> > > > > > > admin VQ)
> > > > > > of basic facilities cannot be done using config registers
> > > > > > without any mediation layer.
> > > > > > OK, I pop-ed Jason's proposal to make everything easier, and I
> > > > > > see it is
> > > > refused.
> > > > > Because it does not work for passthrough mode.
> > > >
> > > > How and why? What's wrong with just passing through the newly
> > > > introduced 2 or 3 registers to guests?
> > > >
> > > If passed to the guest who is not involved in the live migration flow=
, cannot
> > operate the device.
> > > VF =3D member device =3D controlled function PF =3D owner device =3D
> > > controlling function Device migration commands from the hypervisor ar=
e
> > > not forwarded inside the guest.
> >
> > I don't see why.
> >
> > For example, can you explain how a virtio reset in guests can survive w=
ith your
> > proposal but not a virtio suspend?
> >
> In this proposal virtio reset goes directly from guest to the device with=
out intervention of hypervisor.

Why can suspend go directly from guest to device then?

> When such device reset is done, it does not reset the device context, nor=
 it clears the dirty page records, because they are done by the controlling=
 function.
>
> > I'm not convinced that the scalability is broken by just having 2 or 3 =
more
> > registers. We all know MSIX requires much more than this.
> >
> Saying there is some other high resource consumer method exists, so lets =
consume more in new interface we do now, is not good approach.

This is self-contradictory and double standard. You allow #MSI-X
vectors to grow but not config?

> MSI-X on its v2 is underway. Hopefully it will be finished this year, whi=
ch is already cutting down O(N) resources.

Why couldn't such a method be applied to config registers and others?

>
> > You can't solve all the issues in one series. As stated many times,
> I am not solving all issues in one series. This series builds the infrast=
ructure.

It's you that is raising the scalability issue, and what you've
ignored is that such an "issue" has existed for many years and various
hardware has been built on top of that.

Again, we should make sure the function is correct before we can talk
about others, otherwise it would be an endless discussion.

>
> > if you really
> > care about the scalability, the correct way is to behave like a real tr=
ansport
> > through virtqueue instead of trying to duplicate the functionality of t=
ransport
> > virtqueue slowly.
> >
> This will be impossible because no device will transport driver notificat=
ions using a virtqueue.
> Therefore, virtqueue is not some generic transport that does everything -=
 as simple as that. hence there is no transport virtqueue.

You won't get such a wrong conclusion if you read that proposal.

>
> And virtqueue for bulk data transfer exists so no need to invent yet anot=
her thing without a good reason.

I don't understand why this is related to transport virtqueue anyhow,
it's also a queue interface, no?

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

