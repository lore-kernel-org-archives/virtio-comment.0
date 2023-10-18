Return-Path: <virtio-comment-return-7772-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E01EDCDB482
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 00:53:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4EDA3750A7
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 00:53:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 474A598688F
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 00:53:17 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3CDF5983C26; Wed, 18 Oct 2023 00:53:17 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2F5AD986885
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Oct 2023 00:53:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: et46oclbOf6ldNhyESLRxQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697590383; x=1698195183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uVgPdrLgt3Dz9G6sFg0D5KHxiwPEZBxZYj5TyAyDQdA=;
        b=PlEemHEwe5vrcaEoqr4cYo6GOitMjKeBVjvfbiteElcPa+zDWNugXiU7/1M+Dk8ehl
         lDR87osSXBMIVeoSbsvdK5iDNAAK/tfM0R961piG1ynK0xdds2POc4KH4UTT1uSMffVu
         iZweMQUQxFofnMuFKVgHBksnf+sam3HjwR/6qS8b9rWEBcsRtuYNKfdTEXQhS6PKMqre
         C40acwHHvYcLnr9d83eoygoYA4eBLRxEJTjXJ5373AkIKJg2uijEtLLyMTwFAI/B6W8E
         vP5gUrJB1RsiygwHeUdnQl3vmii2Qri8Zkef62hjKjgIdgHkd/RrXEY0t5obAnwYnJl0
         pUQA==
X-Gm-Message-State: AOJu0YwcxxcX+PjDT82VAi4Q9aA5szHt9G0klztUGOxQUAaSf/rotBTa
	Lti+Ha2RMrd7WbGADNGuAdF2eJzC8KyVp7YPGpufVTBbvitJoPNHrOR0RWAwOPDIZueNtzTbO+b
	/nIOuQLm0Knev75Eee65qjPR3tMSlVAhsqxoPEmE4vkqJAW/53Q==
X-Received: by 2002:ac2:43d0:0:b0:507:96e7:c08d with SMTP id u16-20020ac243d0000000b0050796e7c08dmr2730453lfl.61.1697590383137;
        Tue, 17 Oct 2023 17:53:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5XsIZSG8TpkvczzAqW2q8FGyCjuHtyECTEg6XU6z6qsb6dZqBm7W7CjN2jNBoY7AjEPmOsl5FBqaFPoFDaz8=
X-Received: by 2002:ac2:43d0:0:b0:507:96e7:c08d with SMTP id
 u16-20020ac243d0000000b0050796e7c08dmr2730443lfl.61.1697590382864; Tue, 17
 Oct 2023 17:53:02 -0700 (PDT)
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
 <CACGkMEsLSW-_dTwWD8RJn+wudQL1itDFfZZV15GH9NXy=bLbCw@mail.gmail.com> <PH0PR12MB5481B064B44E165949A127EFDCD6A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481B064B44E165949A127EFDCD6A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 18 Oct 2023 08:52:51 +0800
Message-ID: <CACGkMEuz8wyT5vkt7s+fQA7x=r92KP2886dDdzW82y7NUa9zRg@mail.gmail.com>
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

On Tue, Oct 17, 2023 at 11:46=E2=80=AFAM Parav Pandit <parav@nvidia.com> wr=
ote:
>
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Tuesday, October 17, 2023 7:41 AM
> >
> > On Fri, Oct 13, 2023 at 2:40=E2=80=AFPM Parav Pandit <parav@nvidia.com>=
 wrote:
> > >
> > >
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Friday, October 13, 2023 6:48 AM
> > > >
> > > > On Thu, Oct 12, 2023 at 7:37=E2=80=AFPM Parav Pandit <parav@nvidia.=
com>
> > > > wrote:>
> > > > > As Michael said, software based nesting is used..
> > > >
> > > > I've pointed out in another thread when hardware has less
> > > > abstraction level than nesting, trap/emulation is a must.
> > > >
> > > > > See if actual hw based devices can implement it or not. Many
> > > > > components of
> > > > cpu cannot do N level nesting either, but may be virtio can.
> > > > > I don=E2=80=99t know how yet.
> > > >
> > > > I would not repeat the lessons given by Gerald J. Popek and Robert =
P.
> > > > Goldberg[1] in 1976, but I think you miss a lot of fundamental
> > > > things in the methodology of virtualization.
> > > Weekend is coming. I will read it.
> > >
> > > > For example, nesting is a very important criteria to examine whethe=
r
> > > > an architecture is well designed for virtualization.
> > > >
> > >
> > > In my reading of a leading OS vendor documentation, I leant that OS v=
endor
> > do not recommend nested virtualization for production at [1].
> > > Snippet:
> > > "In addition, Red Hat does not recommend using nested virtualization =
in
> > production user environments, due to various limitations in functionali=
ty.
> > Instead, nested virtualization is primarily intended for development an=
d testing
> > scenarios."
> > >
> > > [1]
> > > https://access.redhat.com/documentation/en-us/red_hat_enterprise_linu=
x
> > > /8/html/configuring_and_managing_virtualization/creating-nested-virtu=
a
> > > l-machines_configuring-and-managing-virtualization
> > >
> > > 2nd leading hypervisor listed nested virtualization to be not used fo=
r
> > "performance sensitive applications".
> >
> > Another concept shift.
> >
> > I'm not going to comment on the choice for individual distros. But the =
points are
> > whether we can deploy a nesting virtualization easily under a specific =
hardware
> > architecture. In this regard, the above is a good example.
> >
> And most of such nesting seems for non production use, helpful for debugg=
ing and more.

I'm asking you to google, but you refuse to spent 1 minutes to do that
but spending several days to debate on this fact:

https://cloud.google.com/compute/docs/instances/nested-virtualization/overv=
iew

Please don't waste the time of both of us.

>
> And the nesting is not working without trap + emulation for > 2 level of =
nesting outside of virtio as far as I understand.

Read the above link.

> Like Intel PML. How many levels of nesting is done by hw for PML?
>
> > Again, just a simple google will tell you the instances that support ne=
sting have
> > been available for almost all the major cloud vendors for a while.
> >
> From cpu data sheets, it does not appear that hw is able to do such nesti=
ng.

For PML, it's up to the CPU vendor to consider a good way to be self
virtualized. If it's not, it's a design defect. This is not the place
to discuss the design choice of a specific CPU vendor, if you are
really interested in this, you can go back in the archive to figure
out why AMD nesting is done much earlier than Intel.

>
> > >
> > > I want to repeat and emphasize that I am not ignoring the nested case=
.
> > >
> > > An extension for nesting would be the VF presented to the guest itsel=
f with
> > SR-IOV capability can work as_is as proposed here.
> >
> > How can a VF have the SR-IOV capability?
> >
> One option is by trap + emulation.

Great.

> Second is having it actually on the VF, which will follow the true defini=
tion of nesting.

How is VF allowed to have SR-IOV capability by the spec?

>
> > > Michael presented the idea of the dummy PF, which is to represent the=
 VF as
> > dummy PF which can do the SR-IOV with one VF.
> >
> > Why do we need the complicated SR-IOV emulation at the nesting level?
> You have to complicate one way or the other.

How? I've demonstrated that you won't end up with such complications
if everything is self contained.

> And here it does not look complicated because it uses all existing define=
d constructs available at VMM and GVM level.
> It follows both the principles you listed in the paper, i.e. (a) efficien=
cy and (b) equivalence property.

In order to achieve (b), you need to have many PFs and many levels
which is an obvious unnecessary complication.

>
> > How can you make sure such a design can result in a live migration to b=
e done at
> > any levels?
> >
> I will propose design that is practical and has some use case.
> I will not propose theoretical work that no one will implement.

Again, it's only a matter if you want to do everything in a
passthrough mode, this is not to the methodology proven by [1]. It's
not a matter if you stick to trapping.

>
> > E.g in LN, you had a PF and a VF. How to migrate the PF to this level?
> > You want two PFs in the L(N-1) level?
> >
> Likely yes as dummy PF with emulated caps.

Ok, so you will have N PFs in L0 which is unrealistic. Not only
because of the limitation of the resources but also because there's no
way for the hypervisor to know how many levels of nesting are being
used.

>
> > > You need the support from the platform too, I guess TC can extend it.
> > > May be a different interface more suitable for nested case which do n=
ot have
> > performance needs.
> >
> > I disagree, it's about if the performance can satisfy the requirement a=
t N level.
> >
> > >
> > > How about a nested user to have AQ located on the VF so that mediatio=
n sw
> > can operate admin commands over self?
> >
> > I would go with such complicated architecture.
> >
> You like meant, you wouldn't, Right?

Right.

>
> Also, following your paper which clearly highlights, "execution of privil=
eged instruction in vm occurs, which would have effect of changing machine =
resources".
> In the passthrough case it is not the privileged instruction because the =
resource is not composed by the the machine, it is already done by the devi=
ce".

How do you know that? With save/load of a device state, you can
schedule/share a VF among multiple VMs. Then you still want to pass
through everything? Let's just not invent a mechanism that can only
work for a very limited use case.

> Hence for such cvq operation trap is not to be done for member virtio dev=
ice.
>
> It would make sense to trap cvq for non virtio device, where cvq is compo=
sed as part of the machine resource.
>
> > > Device mode commands will not be applicable there, instead some other
> > things to be done.
> > > So non passthrough mode software possibly can make use of it?
> >
> > It would be a great burden if you
> >
> > 1) use passthrough in L0
> > 2) use trap/emulation in L(N+1)
> >
> How is this different than Intel PML hw?

Let me clarify my points, I meant.

You can't simply use pass through in order to live migrate at any
level. So what you can did is:

1) using passthrough to VF in L0
2) using trap/emulation for PF/VF in L1 and LN

Isn't this much more complicated than simply having a self contained
device for VF, then you don't need the composition of PF in any level.
No?

>
> > >
> > > > That is to say for any CPU/hypervisor vendors, the architecture
> > > > should be designed to run any levels of nesting instead of just an
> > > > awkward 2 levels (but what you proposed can not work for even 2).
> > > Huh, some missing text for corner case as making claim, _not_working =
in not a
> > healthy discussion.
> > >
> > > > For x86 and KVM, any level of
> > > > nesting has been done for about 10 years ago.
> > > >
> > > I didn=E2=80=99t find hw for PML support in x86 for N or 3 level nest=
ing. Did I miss?
> > > I didn=E2=80=99t find hw for nested page tables upto N level walking =
on the PCIe
> > read/writes in any cpu. Did I miss?
> >
> > You need first asking why it is a must to achieve nested virtualization=
. All of
> > those obstacles come only if you want to use "passthrough" for any leve=
ls.
> >
> > > Have you seen nesting in hw works at N level?
> >
> > Again, hardware can't have endless resources for endless levels.
> Can you please list two or 3 hw features that are in hw, for > 2 levels?

Why do I need to do this? What I'm saying is that hardware doesn't
need to be designed for N levels. What it needs to make sure to
satisfy the requirement proved by [1].

>
> > Trap and
> > emulation is a must for achieving nesting virtualization. If you try to=
 invent a
> > passthrough method that can work for any level, you will probably fail
>
> It at least follows the design principle of the paper you suggested.

I don't see it this way, see the above reply. The paper is for trap
and emulation for sure but you propose to pass through everything.

> I don=E2=80=99t see a point of designing something for N level nesting in=
 first go when rest eco system is not there to support it at hw level.

Your design complicates the nesting a lot. We have hands-on
methodology which has been well studied since the 1970s where you
refuse to start with. Then you may end up with a lot of issues.

What's more you design is incomplete as it can't be used for migrating:

1) owner
2) virtio devices that doesn't structure as owner/member

That's why I see this as incomplete and immature.

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

