Return-Path: <virtio-comment-return-7700-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14ED5CDB474
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 01:17:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 61CCF7C92D
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 01:17:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 54C5698683E
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 01:17:02 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4A88B9842E5; Fri, 13 Oct 2023 01:17:02 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3D357986835
	for <virtio-comment@lists.oasis-open.org>; Fri, 13 Oct 2023 01:17:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 61ZamY8BNtmgudoXOUOsHQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697159818; x=1697764618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V+O3NDfb4IPtRh6e7ngcVFF+m/Tl+XJ5niE78xEGZjw=;
        b=K31GUgFIaZlpfj1bbUMgvVAZi+SeROPakr86pQvFOR95WMS7NMfz2chx9dbuu411qz
         KaLukBA3j2CPcLqlzFWmOuBc8F5CuBs8trZextPN7a50bU2hhvDgQvW5V6lq3vf+Wn1Z
         9srBCW/vfuF+OV3hrW7LprynEk4fhxbFj3pAVjcTqd0H4KaRPPWNLMNw/3xjc3w2PklU
         FDwXudPldvKwL4pgc7+U89Lwnc/sbyCokS2WCi/QjzFjybMEggF+2tSQ9Fns1wQw9mIa
         Zry798YBRkQcplYOxT+M6Ujoe4wtjaYnTMSeZrA6t3M7RtKCKx3TeooTLlX+Ca7W41VJ
         eolQ==
X-Gm-Message-State: AOJu0YxyGnKZ97GgEaiZROjOHCbSjLArqDMo9T34kWm6+AafcG5EktSr
	vE96hxNsYzYBMyFrp+wT+PFoKG4MVF+avV1Omi1h2em6y3CGvLtOI+spn5bBXEyJHrYD25rKNxL
	JIeblbjD0NV42Pwxym5QHbfuCvv9lHOGfgVsal+xwsEJXZmME+A==
X-Received: by 2002:a05:6512:2095:b0:503:5d8:da33 with SMTP id t21-20020a056512209500b0050305d8da33mr21508503lfr.20.1697159818715;
        Thu, 12 Oct 2023 18:16:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAAFBiYgMQ+nHjm0+X0gedL2SXVCZRVCPsWEqwv4Z9rDSl/9fxGL+uhGJ6O2KU+xh6IPOhzhjPCoCcVXH02Qc=
X-Received: by 2002:a05:6512:2095:b0:503:5d8:da33 with SMTP id
 t21-20020a056512209500b0050305d8da33mr21508436lfr.20.1697159814535; Thu, 12
 Oct 2023 18:16:54 -0700 (PDT)
MIME-Version: 1.0
References: <20231008112555.473895-1-parav@nvidia.com> <20231008112555.473895-2-parav@nvidia.com>
 <CACGkMEt0PNFUoVEYDtgziE5scYqauADX6PF-_f0NSCcWB_FrCA@mail.gmail.com>
 <DM8PR12MB54801E873241AA02CC32CDCBDCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231009121638-mutt-send-email-mst@kernel.org> <DM8PR12MB5480E0F15A1BBDD745EE3AF4DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <25375529-9c40-9ea9-692e-f557c514c72f@intel.com> <PH0PR12MB54812E59B581546FFB118F3FDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f875fa3b-4b33-71c2-e612-bc2a674a1e59@intel.com> <PH0PR12MB548171A06CCE458C913E4961DCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <97aa9108-0715-2483-f5cf-02698c745d60@intel.com> <PH0PR12MB5481F4F3B4FADD79770ADEA6DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481F4F3B4FADD79770ADEA6DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 13 Oct 2023 09:16:43 +0800
Message-ID: <CACGkMEt-pUSazfjfROukZdaLdmeX1xP7_OxQaQ=Se=jV5NXkDA@mail.gmail.com>
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

On Thu, Oct 12, 2023 at 6:58=E2=80=AFPM Parav Pandit <parav@nvidia.com> wro=
te:
>
>
> > From: Zhu, Lingshan <lingshan.zhu@intel.com>
> > Sent: Thursday, October 12, 2023 3:51 PM
> >
> > On 10/11/2023 7:43 PM, Parav Pandit wrote:
> > >> From: Zhu, Lingshan <lingshan.zhu@intel.com>
> > >> Sent: Wednesday, October 11, 2023 3:55 PM
> > >>>>>>> I don=E2=80=99t have any strong opinion to keep it or remove it=
 as most
> > >>>>>>> stakeholders
> > >>>>>> has the clear view of requirements now.
> > >>>>>>> Let me know.
> > >>>>>> So some people use VFs with VFIO. Hence the module name.  This
> > >>>>>> sentence by itself seems to have zero value for the spec. Just d=
rop it.
> > >>>>> Ok. Will drop.
> > >>>> So why not build your admin vq live migration on our config space
> > >>>> solution, get out of the troubles, to make your life easier?
> > >>>>
> > >>> Your this question is completely unrelated to this reply or you
> > >>> misunderstood
> > >> what dropping commit log means.
> > >> if you can rebase admin vq LM on our basic facilities, I think you
> > >> dont need to talk about vfio in the first place, so I ask you to re-=
consider
> > Jason's proposal.
> > > I don=E2=80=99t really know why you are upset with the vfio term.
> > > It is the use case of the cloud operator and it is listed to indicate=
 how proposal
> > fits in a such use case.
> > > If for some reason, you don=E2=80=99t like vfio, fine. Ignore it and =
move on.
> > >
> > > I already answered that I will remove from the commit log, because th=
e
> > requirements are well understood now by the committee.
> > >
> > > Your comment is again unrelated (repeated) to your past two questions=
.
> > >
> > > I explained you the technical problem that admin command (not admin V=
Q)
> > of basic facilities cannot be done using config registers without any m=
ediation
> > layer.
> > OK, I pop-ed Jason's proposal to make everything easier, and I see it i=
s refused.
> Because it does not work for passthrough mode.

How and why? What's wrong with just passing through the newly
introduced 2 or 3 registers to guests?

This is the question you never answer even if I keep asking.

And again, passthrough is really confusing, PCI stuff can be
passthrough, and virtio can only be passthrough with a lot of
assumptions which are all missed in your series.

>
> > >
> > >>> Dropping link to vfio does not drop the requirement.
> > >>> I am ok to drop because requirements are clear of passthrough of
> > >>> member
> > >> device.
> > >>> Vfio is not a trouble at all.
> > >>> Admin command is not a trouble either.
> > >>>
> > >>> The pure technical reason is: all the functionalities proposed
> > >>> cannot be done
> > >> in any other existing way.
> > >>> Why? For below reasons.
> > >>> 1. device context, and write records (aka dirty page addresses) is
> > >>> huge which cannot be shared using config registers at scale of 4000
> > >>> member devices
> > >> dirty page tracking will be implmemented in V2, actually I have the
> > >> patch right now.
> > > That is yet again the invitation to non_colloboration mode.
> > > Without reviewing, v0 and v1, you want to show dirty page tracking in=
 some
> > other way.
> > >
> > > But ok, that is your non_coperative mode of working. Cannot help furt=
her.
> > I believe both me and Jason have proposed a solution, I see it is rejec=
ted.
> > But don't take it personal and please keep professional.
> Sure, as I explained the config register method do not work for passthrou=
gh mode, and does not scale.

We need to make sure your migration proposal can work for 1 VF which
is still questionable then we can talk about others like scaling. No?

And most of your concern regarding scalability seems more like a
limitation of a transport. Let's not mix the scalability for a
specific transport with the one for core virtio devices.

>
> > >
> > >> inflight descriptor tracking will be implemented by Eugenio in V2.
> > > When we have near complete proposal from two device vendors, you want
> > > to push something to unknown future without reviewing the work; does =
not
> > make sense.
> > Didn't I ever provide feedback to you? Really?
> No. I didn=E2=80=99t see why you need to post a new patch for dirty page =
tracking, when it is already present in this series.

You know there are various ways to do dirty paging? For example, the
well known bitmap and its variants. I think we've discussed several
times in many places in the past. I don't see where you explain why
you choose one of them but not the others but you want to forbid other
types of dirty page logging? Why?

> I would like to understand and review this aspects.
> Same for the device context.
>
> > >
> > > You are still in the mode of _take_ what we did with near zero explan=
ation.
> > > You asked question of why passthrough proposal cannot advantage of in=
_band
> > config registers.
> > > I explained technical reason listed here.
> > I have answered the questions, and asked questions for many times.
> > What do you mean by "why passthrough proposal cannot advantage of in_ba=
nd
> > config registers."?
> > Config space work for passthrough for sure.
> Config space registers are passthrough the guest VM.
> Hence hypervisor messing it with, programming some address would result i=
n either security issue.
> Or functionally broken, to sustain the functionality, each nested layer n=
eeds one copy of these registers for each nest level.
> So they must be trapped somehow.
>
> Secondly I don=E2=80=99t see how one can read 1M flows using config regis=
ters.

Why can't we trap them? vIOMMU even migrates internal translation tables.

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

