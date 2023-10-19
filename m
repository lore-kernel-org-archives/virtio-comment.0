Return-Path: <virtio-comment-return-7826-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B772CDB482
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 02:41:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 08EE37956C
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 02:41:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F05B19868C8
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 02:41:49 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E7C689868C0; Thu, 19 Oct 2023 02:41:49 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D99D99868C1
	for <virtio-comment@lists.oasis-open.org>; Thu, 19 Oct 2023 02:41:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: -MlYCMRuMbeSEpPP3BSrfg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697683305; x=1698288105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SZcHocLcA0JfhDd+RyrdVqgzbwSaGxF0dygR1AHrXVE=;
        b=PdIU1JaVKwAQIQFdZu0LfqfY+Bidjhyy1BCDv+2y0Khts0gJxIuSfjgoSDVCsk54nr
         vj9fcZC/2n1a+O0TF3TRlnafJC/1NxFIvY4ZXUKR6VkH2qZ0x7onryTXsFsRjKyPM9i0
         xFJs8P5cievUvgcubNnVzK/hWiLG+UFFcdRPhrQ+OIkGNabUrOIAlhXgdyVuvrLQBjrg
         fjoOKHvf9g29x3uGnCp0crBqzr2hRIhPI291jcaONw4bZRGpx7h5neT8YXa4QxsWpEQw
         zP1vykiC0amJH6RrcZryot+AzEf4i7i215AnRi52WLdccWJYpYc8cACiJvkwWyOpi/YL
         QAGQ==
X-Gm-Message-State: AOJu0Yx6gX0qIVKzy8EwaAxJuvAYEtNT/GZ81F67FWsJxxNetQkVoLnO
	HJWczRAW81u7FrigElE4ZDWnt5bHNx2avfXBxSBhCZeAKQeWqVrRkQLrBjtFE+h2GX/gwTCDjYh
	kEQrlTz4UrVgCnvg1v5URz09g8qVgaomRdhBxVWXbVyFutiZXgg==
X-Received: by 2002:a05:6512:3047:b0:507:a62c:5d0c with SMTP id b7-20020a056512304700b00507a62c5d0cmr550123lfb.19.1697683305041;
        Wed, 18 Oct 2023 19:41:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFV2IWScHqxtApUpnfxpxJmCSQsqV7Hx7v9athnS36qyL3+iN35QwdvyiV7uP6SZH7IzxLJoKOIeb7ubOr41iE=
X-Received: by 2002:a05:6512:3047:b0:507:a62c:5d0c with SMTP id
 b7-20020a056512304700b00507a62c5d0cmr550106lfb.19.1697683304591; Wed, 18 Oct
 2023 19:41:44 -0700 (PDT)
MIME-Version: 1.0
References: <20231008112555.473895-1-parav@nvidia.com> <20231008112555.473895-4-parav@nvidia.com>
 <20231008073912-mutt-send-email-mst@kernel.org> <2fa89e37-a097-d785-e1ee-cda151b0d872@intel.com>
 <DM8PR12MB548001B88B5FA72B403A2AC9DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <85c59856-b68e-940c-08ed-a14e5a02554d@intel.com> <PH0PR12MB548135EDA034FDF7AE77C5FDDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <cbf6b0b4-c49f-6809-cac8-2d8336a8cc76@intel.com> <PH0PR12MB5481A03DDF43FCBD4184693FDCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <e2696020-8444-0ff3-a774-0b41151a18fb@intel.com> <PH0PR12MB548184740ED3C1011C2A85DEDCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <6fc4af28-67d9-781b-a243-a6c2ebf0244c@intel.com> <PH0PR12MB548125EFC96DE6640F9F4A34DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEuw0qvrVSLXfT2KaCX-GYiw4o9=FifcYDnDHFidGhq23Q@mail.gmail.com>
 <PH0PR12MB5481691682222F6A7E495A7DDCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsLSW-_dTwWD8RJn+wudQL1itDFfZZV15GH9NXy=bLbCw@mail.gmail.com>
 <PH0PR12MB5481B064B44E165949A127EFDCD6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEuz8wyT5vkt7s+fQA7x=r92KP2886dDdzW82y7NUa9zRg@mail.gmail.com> <PH0PR12MB5481083E35E16FA311F59D21DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481083E35E16FA311F59D21DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 19 Oct 2023 10:41:32 +0800
Message-ID: <CACGkMEvgub4E__L8GT_4UYym2w6WVPiwgZF9DR_v=TPh5-EtGw@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

On Wed, Oct 18, 2023 at 1:28=E2=80=AFPM Parav Pandit <parav@nvidia.com> wro=
te:
>
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Wednesday, October 18, 2023 6:23 AM
> >
> > On Tue, Oct 17, 2023 at 11:46=E2=80=AFAM Parav Pandit <parav@nvidia.com=
> wrote:
> > >
> > >
> > >
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Tuesday, October 17, 2023 7:41 AM
> > > >
> > > > On Fri, Oct 13, 2023 at 2:40=E2=80=AFPM Parav Pandit <parav@nvidia.=
com> wrote:
> > > > >
> > > > >
> > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > Sent: Friday, October 13, 2023 6:48 AM
> > > > > >
> > > > > > On Thu, Oct 12, 2023 at 7:37=E2=80=AFPM Parav Pandit <parav@nvi=
dia.com>
> > > > > > wrote:>
> > > > > > > As Michael said, software based nesting is used..
> > > > > >
> > > > > > I've pointed out in another thread when hardware has less
> > > > > > abstraction level than nesting, trap/emulation is a must.
> > > > > >
> > > > > > > See if actual hw based devices can implement it or not. Many
> > > > > > > components of
> > > > > > cpu cannot do N level nesting either, but may be virtio can.
> > > > > > > I don=E2=80=99t know how yet.
> > > > > >
> > > > > > I would not repeat the lessons given by Gerald J. Popek and Rob=
ert P.
> > > > > > Goldberg[1] in 1976, but I think you miss a lot of fundamental
> > > > > > things in the methodology of virtualization.
> > > > > Weekend is coming. I will read it.
> > > > >
> > > > > > For example, nesting is a very important criteria to examine
> > > > > > whether an architecture is well designed for virtualization.
> > > > > >
> > > > >
> > > > > In my reading of a leading OS vendor documentation, I leant that
> > > > > OS vendor
> > > > do not recommend nested virtualization for production at [1].
> > > > > Snippet:
> > > > > "In addition, Red Hat does not recommend using nested
> > > > > virtualization in
> > > > production user environments, due to various limitations in functio=
nality.
> > > > Instead, nested virtualization is primarily intended for developmen=
t
> > > > and testing scenarios."
> > > > >
> > > > > [1]
> > > > > https://access.redhat.com/documentation/en-us/red_hat_enterprise_=
l
> > > > > inux
> > > > > /8/html/configuring_and_managing_virtualization/creating-nested-v=
i
> > > > > rtua l-machines_configuring-and-managing-virtualization
> > > > >
> > > > > 2nd leading hypervisor listed nested virtualization to be not use=
d
> > > > > for
> > > > "performance sensitive applications".
> > > >
> > > > Another concept shift.
> > > >
> > > > I'm not going to comment on the choice for individual distros. But
> > > > the points are whether we can deploy a nesting virtualization easil=
y
> > > > under a specific hardware architecture. In this regard, the above i=
s a good
> > example.
> > > >
> > > And most of such nesting seems for non production use, helpful for
> > debugging and more.
> >
> > I'm asking you to google, but you refuse to spent 1 minutes to do that =
but
> > spending several days to debate on this fact:
> >
> > https://cloud.google.com/compute/docs/instances/nested-
> > virtualization/overview
> >
> > Please don't waste the time of both of us.
>
> I showed the link of Redhat and another one is Hyper-V.
> You showed link of google cloud.

The reason is that Red Hat is not offering IAAS, so a IAAS vendor
should be more convincing.

And,

Firstly, it's not about whether or not it is used in a production
environment. It usually takes many years before new technologies land
in production. For example, we all know it may take time for adminq to
be productiion ready, no?
Secondly, the link you show me is RHEL8 which is at the end of its
life cycle? It is supported in RHEL9 AFAIK, and it is supported more
than just x86.
Lastly, where is the Hyper-V link you've mentioned above? Google gives
me a good link for Azure:
https://learn.microsoft.com/en-us/virtualization/hyper-v-on-windows/user-gu=
ide/nested-virtualization

>
> There are no representatives from Google and Microsoft here to support ne=
sted here in the discussion.

Shouldn't we trust the link published from the official website of a
cloud vendor? We can't involve people from every aspect here.

I meant why not just play with a nested VM? It won't take you too much
time and you will see how seamless it would be now (and actually it
has been very there for many years).

>
> I assume you as part of Redhat show some production use, but in public do=
cumentation of Redhat it said non production.
>
> Regardless, I want to emphasize that I am not against the use case of nes=
ted.

This is not what I read from you. Or why do you keep wanting me to
prove it has real use but refuse to do a simple Google search?

>
> I am highlighting that any L2 nesting involves today hw emulation in the =
ecosystem.

How do you define emulation? Emulation does mean it needs to emulate
all? If yes, why don't you start using L1?

> If this is incorrect, please point to the datasheet. (not user documentat=
ion at high level).
>
> And for L2 nesting, virtio doing hw emulation is fine to me.
> And one wants to improve that too, lets have the proper nested VF.
> Lets discuss in other thread, where you have many questions.

While I don't see why we need to discuss it here, the nested issues
were raised for this series in this thread.

>
>
> >
> > >
> > > And the nesting is not working without trap + emulation for > 2 level=
 of
> > nesting outside of virtio as far as I understand.
> >
> > Read the above link.
> >
> > > Like Intel PML. How many levels of nesting is done by hw for PML?
> > >
> > > > Again, just a simple google will tell you the instances that suppor=
t
> > > > nesting have been available for almost all the major cloud vendors =
for a
> > while.
> > > >
> > > From cpu data sheets, it does not appear that hw is able to do such n=
esting.
> >
> > For PML, it's up to the CPU vendor to consider a good way to be self vi=
rtualized.
> > If it's not, it's a design defect. This is not the place to discuss the=
 design choice
> > of a specific CPU vendor, if you are really interested in this, you can=
 go back in
> > the archive to figure out why AMD nesting is done much earlier than Int=
el.
>
> In the google link you posted, I read "VMs powered by AMD processors are =
not supported".
> I wish they should have been able to utilize it.

How is it related to the discussion here? A good design may simplify
nesting a lot, that's the point. A specific vendor hardware may choose
to do something to complicate at their will and at their risk. But it
is not the case for virtio. We have a way to achieve nesting easily
already.

>
> >
> > >
> > > > >
> > > > > I want to repeat and emphasize that I am not ignoring the nested =
case.
> > > > >
> > > > > An extension for nesting would be the VF presented to the guest
> > > > > itself with
> > > > SR-IOV capability can work as_is as proposed here.
> > > >
> > > > How can a VF have the SR-IOV capability?
> > > >
> > > One option is by trap + emulation.
> >
> > Great.
> >
> > > Second is having it actually on the VF, which will follow the true de=
finition of
> > nesting.
> >
> > How is VF allowed to have SR-IOV capability by the spec?
> >
> To support nesting, PCI-SIG can extend it.

How many layers do you want then?

>
> > >
> > > > > Michael presented the idea of the dummy PF, which is to represent
> > > > > the VF as
> > > > dummy PF which can do the SR-IOV with one VF.
> > > >
> > > > Why do we need the complicated SR-IOV emulation at the nesting leve=
l?
> > > You have to complicate one way or the other.
> >
> > How? I've demonstrated that you won't end up with such complications if
> > everything is self contained.
> The primary problem with self-contained is it is not fitting the requirem=
ents of passthrough.

Why not?

> How can we do self-contained interface without mediation where device con=
text, dirty pages are lost, when device reset/flr occurs?

Michael demonstread one possible method via admin command, and I
pointed out a per VF adminq in another thread? How can't them work?

> Also the dma occurs in the guest.
> We need facility like PML where PML logs the pages in the VMM level, in v=
irtio case to the owner PF.

Pages do not belong to a device, it's fine to depend on other
entities, that's also my point so dirty page tracking is optional in
the migration.

>
> >
> > > And here it does not look complicated because it uses all existing de=
fined
> > constructs available at VMM and GVM level.
> > > It follows both the principles you listed in the paper, i.e. (a) effi=
ciency and (b)
> > equivalence property.
> >
> > In order to achieve (b), you need to have many PFs and many levels whic=
h is an
> > obvious unnecessary complication.
> >
> This is what you wanted to follow the paper.
> It does not need many PFs, at L0 there is one PF and N VFs.
> At L1, one VF is given with emulated config space that consist of SR-IOV =
capability.

How can you use this "PF" in L1 to migrate the VF in L2?

> This L1 VF allows creating new VF, one of the VF will be passed to L2.
>
> > >
> > > > How can you make sure such a design can result in a live migration
> > > > to be done at any levels?
> > > >
> > > I will propose design that is practical and has some use case.
> > > I will not propose theoretical work that no one will implement.
> >
> > Again, it's only a matter if you want to do everything in a passthrough=
 mode,
> > this is not to the methodology proven by [1]. It's not a matter if you =
stick to
> > trapping.
> >
> I didn=E2=80=99t understand, but I don=E2=80=99t see a point of discussin=
g passthrough vs non_passthrough.

Well, my point is, trap/emulation has been well studied but not
passthrough. For passthrough, we need to know if it can work or not.
For example, do we need to disable all the sensitive instructions like
PM/FLR etc.

>
>
> > >
> > > > E.g in LN, you had a PF and a VF. How to migrate the PF to this lev=
el?
> > > > You want two PFs in the L(N-1) level?
> > > >
> > > Likely yes as dummy PF with emulated caps.
> >
> > Ok, so you will have N PFs in L0 which is unrealistic. Not only because=
 of the
> > limitation of the resources but also because there's no way for the hyp=
ervisor to
> > know how many levels of nesting are being used.
> >
> Only one PF in L0. Emulated PF in L1. Similar to how rest of the eco-syst=
em platform components are doing it.

See my above question.

> When whole platform commit to do N level nesting, it make sense for virti=
o to align.
> For example cpu vendors to commit to do N level nested page table travers=
al on pci read/writes, posted interrupts at N level, PML logging at N level=
.
> At that point virtio for N level nesting make sense.
>
> > >
> > > > > You need the support from the platform too, I guess TC can extend=
 it.
> > > > > May be a different interface more suitable for nested case which
> > > > > do not have
> > > > performance needs.
> > > >
> > > > I disagree, it's about if the performance can satisfy the requireme=
nt at N
> > level.
> > > >
> > > > >
> > > > > How about a nested user to have AQ located on the VF so that
> > > > > mediation sw
> > > > can operate admin commands over self?
> > > >
> > > > I would go with such complicated architecture.
> > > >
> > > You like meant, you wouldn't, Right?
> >
> > Right.
> >
> > >
> > > Also, following your paper which clearly highlights, "execution of pr=
ivileged
> > instruction in vm occurs, which would have effect of changing machine
> > resources".
> > > In the passthrough case it is not the privileged instruction because =
the
> > resource is not composed by the the machine, it is already done by the =
device".
> >
> > How do you know that? With save/load of a device state, you can
> > schedule/share a VF among multiple VMs. Then you still want to pass thr=
ough
> > everything?
> You cannot share a VF among multiple VMs as each VM has its own isolated =
memory boundary, isolated by the IOMMU and MMU.
> PCI incoming requests of a specific RID cannot split to two different gue=
st VMs.

All of the modern IOMMUs have a table to map RID to the I/O page
table, do you know why?

>
> > Let's just not invent a mechanism that can only work for a very
> > limited use case.
> >
> The use case you are quoting as limited is common one for passthrough use=
rs.

No, see my above question. It is just one case that is beyond what you
can have. There are for sure a lot of others.

>
> > > Hence for such cvq operation trap is not to be done for member virtio=
 device.
> > >
> > > It would make sense to trap cvq for non virtio device, where cvq is c=
omposed
> > as part of the machine resource.
> > >
> > > > > Device mode commands will not be applicable there, instead some
> > > > > other
> > > > things to be done.
> > > > > So non passthrough mode software possibly can make use of it?
> > > >
> > > > It would be a great burden if you
> > > >
> > > > 1) use passthrough in L0
> > > > 2) use trap/emulation in L(N+1)
> > > >
> > > How is this different than Intel PML hw?
> >
> > Let me clarify my points, I meant.
> >
> > You can't simply use pass through in order to live migrate at any level=
. So what
> > you can did is:
> >
> > 1) using passthrough to VF in L0
> > 2) using trap/emulation for PF/VF in L1 and LN
> >
> > Isn't this much more complicated than simply having a self contained de=
vice for
> > VF, then you don't need the composition of PF in any level.
> > No?
> >
> The problem in self-contained is it is not able to do even #1.

Well, you know at least the CPU virtualization is self-contained? If
it can do that, why not a simple virtio can't?

>
> > >
> > > > >
> > > > > > That is to say for any CPU/hypervisor vendors, the architecture
> > > > > > should be designed to run any levels of nesting instead of just
> > > > > > an awkward 2 levels (but what you proposed can not work for eve=
n 2).
> > > > > Huh, some missing text for corner case as making claim,
> > > > > _not_working in not a
> > > > healthy discussion.
> > > > >
> > > > > > For x86 and KVM, any level of
> > > > > > nesting has been done for about 10 years ago.
> > > > > >
> > > > > I didn=E2=80=99t find hw for PML support in x86 for N or 3 level =
nesting. Did I miss?
> > > > > I didn=E2=80=99t find hw for nested page tables upto N level walk=
ing on
> > > > > the PCIe
> > > > read/writes in any cpu. Did I miss?
> > > >
> > > > You need first asking why it is a must to achieve nested
> > > > virtualization. All of those obstacles come only if you want to use
> > "passthrough" for any levels.
> > > >
> > > > > Have you seen nesting in hw works at N level?
> > > >
> > > > Again, hardware can't have endless resources for endless levels.
> > > Can you please list two or 3 hw features that are in hw, for > 2 leve=
ls?
> >
> > Why do I need to do this? What I'm saying is that hardware doesn't need=
 to be
> > designed for N levels. What it needs to make sure to satisfy the requir=
ement
> > proved by [1].
> >
> You need it because you want to follow the 3 principles listed in the pap=
er, i.e. efficiency, equivalency and resource control.

Let's not shift concepts again.

Using the terminology in the papare and it said:

"The efficiency property. All innocuous instructions are executed by
the hardware directly, with no intervention at all on the part of the
control program."

The current trap/emulation model satisfies the requirement as it
treats the virtio/PCI control path as sensitive, so efficiency is not
a requirement.

Looking at your proposal, you keep saying you have good performance
but you still fail to prove why in your proposal e.g the PM
instruction is innocuous (or can run natively).

That's the point.

>
> > >
> > > > Trap and
> > > > emulation is a must for achieving nesting virtualization. If you tr=
y
> > > > to invent a passthrough method that can work for any level, you wil=
l
> > > > probably fail
> > >
> > > It at least follows the design principle of the paper you suggested.
> >
> > I don't see it this way, see the above reply. The paper is for trap and=
 emulation
> > for sure but you propose to pass through everything.
> >
> > > I don=E2=80=99t see a point of designing something for N level nestin=
g in first go when
> > rest eco system is not there to support it at hw level.
> >
> > Your design complicates the nesting a lot. We have hands-on methodology
> > which has been well studied since the 1970s where you refuse to start w=
ith.
> > Then you may end up with a lot of issues.
> >
> I don=E2=80=99t think so. When the hw eco-system is built for nesting, it=
 make sense for virtio to do nesting acceleration.
> Otherwise method done in other nesting is enough for virtio.
>
> > What's more you design is incomplete as it can't be used for migrating:
> >
> > 1) owner
> Owner migration is not requirement. That is just silly.

Why? VFIO allows you to assign PF, is it also silly?

> If one wants to migrate owner, an admin virtio device can be present outs=
ide of owner to migrate.

Then we end up with a recursion, no?

>
> > 2) virtio devices that doesn't structure as owner/member
> >
> As with spec 1.3. they are structured for PCI SR-IOV group type.

1.3 should be transport independent, no?

Thanks






> MMIO transport is just missing out on the advancement happening on the PC=
I transport.
> If there is user interest, one will do for MMIO too.


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

