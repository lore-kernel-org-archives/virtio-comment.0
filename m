Return-Path: <virtio-comment-return-7746-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C443BCDB465
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 02:10:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 256A177B29
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 02:10:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0159C98684A
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 02:10:51 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E0B37986580; Tue, 17 Oct 2023 02:10:50 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D0C84986843
	for <virtio-comment@lists.oasis-open.org>; Tue, 17 Oct 2023 02:10:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 2-OkWwxkP0O43AGgIrE2kA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697508647; x=1698113447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sApYy5vIdl1U10wPBgfOQaDNUb0ugBVoWL03G8TYrBA=;
        b=v65KUA/GJV26BCLEYQn6d8wJ11dfXeVyH9ZbNoZEn0mJ7Mt5ogeFTHGhp5XvLqFxgO
         hPEy85fBXi9zmg6uXfi0V7ATdN+ujT/dWqqlqvYnGlQsD/uPw0zEJvG1SlmOoucpLaEF
         UKvIwe0IRBelpQUjWNqc089I05D7Q/kbDBXB7HQhLf/6pg7sbSf/fw3l3zcnL1vJKWDG
         5+ueTqskd67EDf3du4jCg1dJjik9RIbB8Ck8pg5RNJsW+RB22EqvS451xiq1a7v9ggrk
         jZcmvehaWaxGT29xdLuBlilWX0SOvJ5Dg47UNmJ2Tp34bQRwEMR2u5MqeCOnDuICXwBO
         6zUw==
X-Gm-Message-State: AOJu0YyFmX8SiJb4ikcRtmd9EgYOjiUB6TZ7aTr/n5RlOBoQDejtynM5
	BWQ2u23SbpSt86qSZFv5YcmlwVGVyDiaAjQZO89g4pEjnAnUQZQXqYggnY/kXgbFds6jNKR0Cbr
	iYomBi9ADlnVM9lLvgHw30vaSjIjiimsLRfKNRLYyn7f1C/sklw==
X-Received: by 2002:a19:6703:0:b0:4fb:94c6:fd63 with SMTP id b3-20020a196703000000b004fb94c6fd63mr686935lfc.17.1697508646993;
        Mon, 16 Oct 2023 19:10:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaTxU8vl9uq8zbBinKNG3NJLn4kxucVytxgMrptNJc1i+OIODnVfmlG6M7arWkbIe+1dE4Xx3IDDSghdQBLLg=
X-Received: by 2002:a19:6703:0:b0:4fb:94c6:fd63 with SMTP id
 b3-20020a196703000000b004fb94c6fd63mr686925lfc.17.1697508646676; Mon, 16 Oct
 2023 19:10:46 -0700 (PDT)
MIME-Version: 1.0
References: <20231008112555.473895-1-parav@nvidia.com> <20231008112555.473895-4-parav@nvidia.com>
 <20231008073912-mutt-send-email-mst@kernel.org> <2fa89e37-a097-d785-e1ee-cda151b0d872@intel.com>
 <DM8PR12MB548001B88B5FA72B403A2AC9DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <85c59856-b68e-940c-08ed-a14e5a02554d@intel.com> <PH0PR12MB548135EDA034FDF7AE77C5FDDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <cbf6b0b4-c49f-6809-cac8-2d8336a8cc76@intel.com> <PH0PR12MB5481A03DDF43FCBD4184693FDCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <e2696020-8444-0ff3-a774-0b41151a18fb@intel.com> <PH0PR12MB548184740ED3C1011C2A85DEDCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <6fc4af28-67d9-781b-a243-a6c2ebf0244c@intel.com> <PH0PR12MB548125EFC96DE6640F9F4A34DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEuw0qvrVSLXfT2KaCX-GYiw4o9=FifcYDnDHFidGhq23Q@mail.gmail.com> <PH0PR12MB5481691682222F6A7E495A7DDCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481691682222F6A7E495A7DDCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 17 Oct 2023 10:10:35 +0800
Message-ID: <CACGkMEsLSW-_dTwWD8RJn+wudQL1itDFfZZV15GH9NXy=bLbCw@mail.gmail.com>
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

On Fri, Oct 13, 2023 at 2:40=E2=80=AFPM Parav Pandit <parav@nvidia.com> wro=
te:
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Friday, October 13, 2023 6:48 AM
> >
> > On Thu, Oct 12, 2023 at 7:37=E2=80=AFPM Parav Pandit <parav@nvidia.com>=
 wrote:>
> > > As Michael said, software based nesting is used..
> >
> > I've pointed out in another thread when hardware has less abstraction l=
evel
> > than nesting, trap/emulation is a must.
> >
> > > See if actual hw based devices can implement it or not. Many componen=
ts of
> > cpu cannot do N level nesting either, but may be virtio can.
> > > I don=E2=80=99t know how yet.
> >
> > I would not repeat the lessons given by Gerald J. Popek and Robert P.
> > Goldberg[1] in 1976, but I think you miss a lot of fundamental things i=
n the
> > methodology of virtualization.
> Weekend is coming. I will read it.
>
> > For example, nesting is a very important criteria
> > to examine whether an architecture is well designed for virtualization.
> >
>
> In my reading of a leading OS vendor documentation, I leant that OS vendo=
r do not recommend nested virtualization for production at [1].
> Snippet:
> "In addition, Red Hat does not recommend using nested virtualization in p=
roduction user environments, due to various limitations in functionality. I=
nstead, nested virtualization is primarily intended for development and tes=
ting scenarios."
>
> [1] https://access.redhat.com/documentation/en-us/red_hat_enterprise_linu=
x/8/html/configuring_and_managing_virtualization/creating-nested-virtual-ma=
chines_configuring-and-managing-virtualization
>
> 2nd leading hypervisor listed nested virtualization to be not used for "p=
erformance sensitive applications".

Another concept shift.

I'm not going to comment on the choice for individual distros. But the
points are whether we can deploy a nesting virtualization easily under
a specific hardware architecture. In this regard, the above is a good
example.

Again, just a simple google will tell you the instances that support
nesting have been available for almost all the major cloud vendors for
a while.

>
> I want to repeat and emphasize that I am not ignoring the nested case.
>
> An extension for nesting would be the VF presented to the guest itself wi=
th SR-IOV capability can work as_is as proposed here.

How can a VF have the SR-IOV capability?

> Michael presented the idea of the dummy PF, which is to represent the VF =
as dummy PF which can do the SR-IOV with one VF.

Why do we need the complicated SR-IOV emulation at the nesting level?
How can you make sure such a design can result in a live migration to
be done at any levels?

E.g in LN, you had a PF and a VF. How to migrate the PF to this level?
You want two PFs in the L(N-1) level?

> You need the support from the platform too, I guess TC can extend it.
> May be a different interface more suitable for nested case which do not h=
ave performance needs.

I disagree, it's about if the performance can satisfy the requirement
at N level.

>
> How about a nested user to have AQ located on the VF so that mediation sw=
 can operate admin commands over self?

I would go with such complicated architecture.

> Device mode commands will not be applicable there, instead some other thi=
ngs to be done.
> So non passthrough mode software possibly can make use of it?

It would be a great burden if you

1) use passthrough in L0
2) use trap/emulation in L(N+1)

>
> > That is to say for any CPU/hypervisor vendors, the architecture should =
be
> > designed to run any levels of nesting instead of just an awkward 2 leve=
ls (but
> > what you proposed can not work for even 2).
> Huh, some missing text for corner case as making claim, _not_working in n=
ot a healthy discussion.
>
> > For x86 and KVM, any level of
> > nesting has been done for about 10 years ago.
> >
> I didn=E2=80=99t find hw for PML support in x86 for N or 3 level nesting.=
 Did I miss?
> I didn=E2=80=99t find hw for nested page tables upto N level walking on t=
he PCIe read/writes in any cpu. Did I miss?

You need first asking why it is a must to achieve nested
virtualization. All of those obstacles come only if you want to use
"passthrough" for any levels.

> Have you seen nesting in hw works at N level?

Again, hardware can't have endless resources for endless levels. Trap
and emulation is a must for achieving nesting virtualization. If you
try to invent a passthrough method that can work for any level, you
will probably fail

Thanks

>
> > For virtio, it can do any level. So did for vhost/vDPA. For example, I =
usually
> > develop and test virtio/vDPA/vhost in a nesting environment.
> >
> Great.
> Can you share the performance test results relative number with 2 and 3 l=
evel nesting covering the cpu utilization, latency?
>
> > Thanks
> >
> > [1] https://dl.acm.org/doi/pdf/10.1145/361011.361073


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

