Return-Path: <virtio-comment-return-7745-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4ECCDB465
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 02:02:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E7F5C774EB
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 02:02:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D5063986849
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 02:02:48 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C0784986580; Tue, 17 Oct 2023 02:02:48 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B0E2F986843
	for <virtio-comment@lists.oasis-open.org>; Tue, 17 Oct 2023 02:02:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: rW9tRuYOMKaojCD6WLP05g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697508164; x=1698112964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9avQJG28PNnD42U98dHEyH66BPfn1YMfKHyeXc20bxg=;
        b=Ctemw8l5LhuEBPyZ1zxKh8D4xco2so6Lpgq17ivhbtQCdnNWFbSj1HQRYWskkdENFE
         DlDJEH8Ts20Ny20irqhjV7J7OSQkvTTYEiEGqAeXEevqtWgoOxdM0UxH2GjljqbuP6lp
         kHmTgRgDtdLKRQnF5HqdjI8WbrPpHj42hJzrXgO64MyZ6aQYcsfapIAT69WrMBOCfOWH
         1g6gtZh2iNEC7wibn7AYEpOKzumvHQ8fPTkvcW90rNBj3uCm+xa0NxiSLFK+m9UbVeYJ
         PhcqCnljnuEWDGzduvSnRX2cPxsT0Na0d5BHqYJc7xUJk1HZi7BI1lltMYzPQQLyMqJz
         ZkGg==
X-Gm-Message-State: AOJu0YxjBrdI3y8FoSdXT2XNK8/l7RXYM7dbH9bQMaacAAU73QOgXu5I
	1wnThk9ELT7tmY2FrjBbq9J70SHtDU7/kw9SsaoseXqa809iwguIUjO8K3UltMYEiZUhgyrWkXw
	awbnV8ZO9BZ9Ahcyx+XcKdn4FHf0RSJuUVrFn2Q9kc7+orRB6SA==
X-Received: by 2002:a05:6512:1105:b0:505:73e7:b478 with SMTP id l5-20020a056512110500b0050573e7b478mr762865lfg.16.1697508164252;
        Mon, 16 Oct 2023 19:02:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZ1sbRYMD/qO3cfv889SAKpIhwj3OSVr3+rwLQB5bnymUDNBZ5HHUWgPHIiy8sUF9QM4PQ72TfvuyCXe+t43o=
X-Received: by 2002:a05:6512:1105:b0:505:73e7:b478 with SMTP id
 l5-20020a056512110500b0050573e7b478mr762851lfg.16.1697508163881; Mon, 16 Oct
 2023 19:02:43 -0700 (PDT)
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
In-Reply-To: <CACGkMEtihTxYADd1dbG=vX9=VLp0xfRJSQ4jd_m0UiuZNz_2sg@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 17 Oct 2023 10:02:32 +0800
Message-ID: <CACGkMEu2RdhUeeG-WNcrPqbQpHaeU06t32516ihv72uN99=mfQ@mail.gmail.com>
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

On Tue, Oct 17, 2023 at 9:53=E2=80=AFAM Jason Wang <jasowang@redhat.com> wr=
ote:
>
> On Fri, Oct 13, 2023 at 2:36=E2=80=AFPM Parav Pandit <parav@nvidia.com> w=
rote:
> >
> >
> > > From: Jason Wang <jasowang@redhat.com>
> > > Sent: Friday, October 13, 2023 6:47 AM
> > >
> > > On Thu, Oct 12, 2023 at 6:58=E2=80=AFPM Parav Pandit <parav@nvidia.co=
m> wrote:
> > > >
> > > >
> > > > > From: Zhu, Lingshan <lingshan.zhu@intel.com>
> > > > > Sent: Thursday, October 12, 2023 3:51 PM
> > > > >
> > > > > On 10/11/2023 7:43 PM, Parav Pandit wrote:
> > > > > >> From: Zhu, Lingshan <lingshan.zhu@intel.com>
> > > > > >> Sent: Wednesday, October 11, 2023 3:55 PM
> > > > > >>>>>>> I don=E2=80=99t have any strong opinion to keep it or rem=
ove it as
> > > > > >>>>>>> most stakeholders
> > > > > >>>>>> has the clear view of requirements now.
> > > > > >>>>>>> Let me know.
> > > > > >>>>>> So some people use VFs with VFIO. Hence the module name.
> > > > > >>>>>> This sentence by itself seems to have zero value for the s=
pec. Just
> > > drop it.
> > > > > >>>>> Ok. Will drop.
> > > > > >>>> So why not build your admin vq live migration on our config
> > > > > >>>> space solution, get out of the troubles, to make your life e=
asier?
> > > > > >>>>
> > > > > >>> Your this question is completely unrelated to this reply or y=
ou
> > > > > >>> misunderstood
> > > > > >> what dropping commit log means.
> > > > > >> if you can rebase admin vq LM on our basic facilities, I think
> > > > > >> you dont need to talk about vfio in the first place, so I ask =
you
> > > > > >> to re-consider
> > > > > Jason's proposal.
> > > > > > I don=E2=80=99t really know why you are upset with the vfio ter=
m.
> > > > > > It is the use case of the cloud operator and it is listed to
> > > > > > indicate how proposal
> > > > > fits in a such use case.
> > > > > > If for some reason, you don=E2=80=99t like vfio, fine. Ignore i=
t and move on.
> > > > > >
> > > > > > I already answered that I will remove from the commit log, beca=
use
> > > > > > the
> > > > > requirements are well understood now by the committee.
> > > > > >
> > > > > > Your comment is again unrelated (repeated) to your past two que=
stions.
> > > > > >
> > > > > > I explained you the technical problem that admin command (not
> > > > > > admin VQ)
> > > > > of basic facilities cannot be done using config registers without
> > > > > any mediation layer.
> > > > > OK, I pop-ed Jason's proposal to make everything easier, and I se=
e it is
> > > refused.
> > > > Because it does not work for passthrough mode.
> > >
> > > How and why? What's wrong with just passing through the newly introdu=
ced 2
> > > or 3 registers to guests?
> > >
> > If passed to the guest who is not involved in the live migration flow, =
cannot operate the device.
> > VF =3D member device =3D controlled function
> > PF =3D owner device =3D controlling function
> > Device migration commands from the hypervisor are not forwarded inside =
the guest.
>
> I don't see why.
>
> For example, can you explain how a virtio reset in guests can survive
> with your proposal but not a virtio suspend?
>
> >
> > > This is the question you never answer even if I keep asking.
> > >
> >
> > > > Sure, as I explained the config register method do not work for pas=
sthrough
> > > mode, and does not scale.
> > >
> > > We need to make sure your migration proposal can work for 1 VF which =
is still
> > > questionable then we can talk about others like scaling. No?
> > Sure but in making sure that, the interface is built so that it can wor=
k for N VFs too.
> >
> > >
> > > And most of your concern regarding scalability seems more like a limi=
tation of a
> > > transport. Let's not mix the scalability for a specific transport wit=
h the one for
> > > core virtio devices.
> > Virtio device is for the defined transport.
> > So it needs to work for the defined transport.
> > Therefore, scalability cannot be ignored.
>
> I'm not convinced that the scalability is broken by just having 2 or 3
> more registers. We all know MSIX requires much more than this.
>
> You can't solve all the issues in one series. As stated many times, if
> you really care about the scalability, the correct way is to behave
> like a real transport through virtqueue instead of trying to duplicate
> the functionality of transport virtqueue slowly.
>
> >
> > It is not a question anymore as for any bulk transfer virtqueue is the =
specification choice for obvious technical gains.
>
> See above.
>
> Thanks
>
> >
> > >
> > > >
> > > > > >
> > > > > >> inflight descriptor tracking will be implemented by Eugenio in=
 V2.
> > > > > > When we have near complete proposal from two device vendors, yo=
u
> > > > > > want to push something to unknown future without reviewing the
> > > > > > work; does not
> > > > > make sense.
> > > > > Didn't I ever provide feedback to you? Really?
> > > > No. I didn=E2=80=99t see why you need to post a new patch for dirty=
 page tracking,
> > > when it is already present in this series.
> > >
> > > You know there are various ways to do dirty paging? For example, the =
well
> > > known bitmap and its variants. I think we've discussed several times =
in many
> > > places in the past. I don't see where you explain why you choose one =
of them
> > > but not the others but you want to forbid other types of dirty page l=
ogging?
> > > Why?
> > The well known bitmap simply do not work for the pci transport in atomi=
c way, effectively.
> > You tend to derive many conclusions to oppose the work frankly. :)
> > Other types of dirty page logging is not forbidden.
> >
> > I don=E2=80=99t see the need to explain every single word why a given s=
cheme is chosen in the spec language.
> > There is line drawn to avoid writing a book and a spec.
> >
> > > > Secondly I don=E2=80=99t see how one can read 1M flows using config=
 registers.
> > >
> > > Why can't we trap them? vIOMMU even migrates internal translation tab=
les.
> >
> > Because they are added and removed over the virtqueues almost as data p=
ath operations.

I don't understand, we trap RSS commands already.

Thanks

> > Virtio queues are not mediated/trapped when the native device is virtio=
 member device itself.


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

