Return-Path: <virtio-comment-return-7743-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD2BCDB465
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 01:43:05 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 59E196846D
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 01:43:05 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4F32A98684C
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 01:43:05 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 45631986580; Tue, 17 Oct 2023 01:43:05 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 37DEB986843
	for <virtio-comment@lists.oasis-open.org>; Tue, 17 Oct 2023 01:43:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: iSrmzFQzPiegqkjzccSZbw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697506981; x=1698111781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v2lP08jkBJkTpGw6a97BtRg1mcF+TqsOvzB5hCHapHQ=;
        b=jWKUrfOfUY2NumI1gKnyxRoeBtUy+SlFcSThKUSkPJWxf71Ic7+ToyZymzBEsZEOtD
         egmsVzQnbww9BC45albghttfqRDIo7iDSpgN2bZtb/BzgGi52Hx7F4jPUdXwf69PcyTQ
         xX+Qq/ABTCiX47CIm6tgJob7d4RHObuRqMZlAj/oRJaNIoxUIhXbBo8gdhiAaHqaAvpm
         l8B+1y1l2FJeqaq7nWw7ZsCuK2JpdxvR2ITK0hUyU5XrfqEYPJNiETeUFBaQu2saRh5V
         WLNsVHoGkltPfGhuP/xJaPbqwigE6lYvZqmEvbVBp55/rFUsPAlYcwGlvXim62nRG3B5
         gR8w==
X-Gm-Message-State: AOJu0YwPp7ffGi7j9bsfnyW8tS18VTNlK3Q73bt0jvTH34VzZjkdHtv6
	/Xuu3FDENjyo0yZCIPe0CW6/NOnOTIIUnif1HQbca4Ar4YEN4Nfr+NOzFoDZ9NxEmJdawYSQwQV
	X+8YDkHBgjUjMuEfUJn6v4RUeAjINtDFTmlCGuZu47gigpaVUmg==
X-Received: by 2002:a05:6512:3112:b0:503:3781:ac32 with SMTP id n18-20020a056512311200b005033781ac32mr662867lfb.41.1697506981164;
        Mon, 16 Oct 2023 18:43:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKjr2g09cIwjb1qaMaopPZfveBtmx2nKULB/tssFyAUtmL6OhXGrQYNKBCucoJOZhcKORP4Fiaha1jNSUJs+g=
X-Received: by 2002:a05:6512:3112:b0:503:3781:ac32 with SMTP id
 n18-20020a056512311200b005033781ac32mr662860lfb.41.1697506980964; Mon, 16 Oct
 2023 18:43:00 -0700 (PDT)
MIME-Version: 1.0
References: <DM8PR12MB54801E873241AA02CC32CDCBDCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231009121638-mutt-send-email-mst@kernel.org> <DM8PR12MB5480E0F15A1BBDD745EE3AF4DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <25375529-9c40-9ea9-692e-f557c514c72f@intel.com> <PH0PR12MB54812E59B581546FFB118F3FDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f875fa3b-4b33-71c2-e612-bc2a674a1e59@intel.com> <PH0PR12MB548171A06CCE458C913E4961DCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <97aa9108-0715-2483-f5cf-02698c745d60@intel.com> <PH0PR12MB5481F4F3B4FADD79770ADEA6DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEt-pUSazfjfROukZdaLdmeX1xP7_OxQaQ=Se=jV5NXkDA@mail.gmail.com> <20231013071610-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231013071610-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 17 Oct 2023 09:42:49 +0800
Message-ID: <CACGkMEt2mr0B=Hftt02k=BZ4_a=SAPL-MoPe=Ovr7_cnrwB-pg@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, "Zhu, Lingshan" <lingshan.zhu@intel.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Fri, Oct 13, 2023 at 7:26=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Fri, Oct 13, 2023 at 09:16:43AM +0800, Jason Wang wrote:
> > On Thu, Oct 12, 2023 at 6:58=E2=80=AFPM Parav Pandit <parav@nvidia.com>=
 wrote:
> > >
> > >
> > > > From: Zhu, Lingshan <lingshan.zhu@intel.com>
> > > > Sent: Thursday, October 12, 2023 3:51 PM
> > > >
> > > > On 10/11/2023 7:43 PM, Parav Pandit wrote:
> > > > >> From: Zhu, Lingshan <lingshan.zhu@intel.com>
> > > > >> Sent: Wednesday, October 11, 2023 3:55 PM
> > > > >>>>>>> I don=E2=80=99t have any strong opinion to keep it or remov=
e it as most
> > > > >>>>>>> stakeholders
> > > > >>>>>> has the clear view of requirements now.
> > > > >>>>>>> Let me know.
> > > > >>>>>> So some people use VFs with VFIO. Hence the module name.  Th=
is
> > > > >>>>>> sentence by itself seems to have zero value for the spec. Ju=
st drop it.
> > > > >>>>> Ok. Will drop.
> > > > >>>> So why not build your admin vq live migration on our config sp=
ace
> > > > >>>> solution, get out of the troubles, to make your life easier?
> > > > >>>>
> > > > >>> Your this question is completely unrelated to this reply or you
> > > > >>> misunderstood
> > > > >> what dropping commit log means.
> > > > >> if you can rebase admin vq LM on our basic facilities, I think y=
ou
> > > > >> dont need to talk about vfio in the first place, so I ask you to=
 re-consider
> > > > Jason's proposal.
> > > > > I don=E2=80=99t really know why you are upset with the vfio term.
> > > > > It is the use case of the cloud operator and it is listed to indi=
cate how proposal
> > > > fits in a such use case.
> > > > > If for some reason, you don=E2=80=99t like vfio, fine. Ignore it =
and move on.
> > > > >
> > > > > I already answered that I will remove from the commit log, becaus=
e the
> > > > requirements are well understood now by the committee.
> > > > >
> > > > > Your comment is again unrelated (repeated) to your past two quest=
ions.
> > > > >
> > > > > I explained you the technical problem that admin command (not adm=
in VQ)
> > > > of basic facilities cannot be done using config registers without a=
ny mediation
> > > > layer.
> > > > OK, I pop-ed Jason's proposal to make everything easier, and I see =
it is refused.
> > > Because it does not work for passthrough mode.
> >
> > How and why? What's wrong with just passing through the newly
> > introduced 2 or 3 registers to guests?
> >
> > This is the question you never answer even if I keep asking.
>
> It is, fundamentally, a question of supporting as many architectures
> as we can as opposed to being opinionated.
>
> On the one end of the spectrum, device is completely under guest control
> and anything external has to trap to hypervisor.
> None of existing implementations are there, at least pci config space
> is typically under hypervisor control.
> What Parav calls "passthrough" is built I think along these lines:
> memory and interrupts go straight to guest, config space
> is trapped and emulated.
> On the other side of the spectrum is trapping everything in hypervisor.
> Your "2 to 3 registers" is also not there, but is I think closer to that =
end
> of the arc.

Those simple registers could be used by both trapping or
"passthrough". Depending on the viewpoint, it could be treated as a
simple extension of existing common cfg, it can be used beyond just
migration. Nothing prevents those registers from coexisting with
things like admin virtqueue or commands.

>
> Any new feature should ideally be a building block supporting as many
> approaches as possible. Fundamentally that requires a level of
> indirection, as usual :)

Exactly. So an transport/interface independent section in the basic
facility makes a lot of sense.

Thanks


> Having two completely distict interfaces for
> that straight off the bat?  Gimme a break.
> --
> MST
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

