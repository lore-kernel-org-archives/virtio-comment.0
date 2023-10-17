Return-Path: <virtio-comment-return-7744-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 560C2CDB465
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 01:53:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 90E67750AC
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 01:53:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6F3FE98684B
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 01:53:19 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 59EFB986580; Tue, 17 Oct 2023 01:53:19 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 49E1D986843
	for <virtio-comment@lists.oasis-open.org>; Tue, 17 Oct 2023 01:53:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: e4RsXCwVMBewf9QkW6sIpQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697507595; x=1698112395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Epqy9hN69j0eq7Ut1X+9M41JylGRnDqu1tBZfR94x8s=;
        b=T3ZU5GeOygMKKNudhnKp49AzNafx0bCERkCSheZTB4qt7AGtjfkzUznVDu/7LzMhbb
         3RFPgDPVC/+/j9u99NYza9qtVAWZye93utZ1Rju03yPeMTeX3yRXPJ1haPwHBaCVMfyL
         PP5sz4E7OdrN1ncIYuHPg/NAxbNiYHxhH9qVqZt9j5O6llaqECSCJPPjMg24s0Zor7fA
         SGRt12PklozfHU7vzJg+GV2a9zwkFF3iqq7TMlmig6KvcqPGKigkLejpJZl9HDx1RgZl
         wLctempAsNvwVDxBkFWJOsPNSoC4/KQb8Qf3bfTNbIxUDWKXgb8qD6HE5FLtGgUBnf4r
         ziFg==
X-Gm-Message-State: AOJu0YzjgdMtXff509PgQiq/alK5ob2/HzaRI213HpcW5IVwtwQzKXly
	3KSvEk6bAYHxVR/Sb/LIzf+7LQFBU2rw8MKL9kyiPENaBGVbQu/U5PHZpHNknTuY3Cs18ogNEiY
	awPrgS/iLafdf2oaAeptf9O22KKjic+9nY9wYYj5XaJgsHDej1Q==
X-Received: by 2002:ac2:52ac:0:b0:507:a089:caf4 with SMTP id r12-20020ac252ac000000b00507a089caf4mr793288lfm.60.1697507594850;
        Mon, 16 Oct 2023 18:53:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJ87OL4ANpnfqkXoaddpqAs3MEr8v6Ugz5h0wNPA8vsNjKeTFWwsKo2hDc9OlQ6uay+czBwjRompjBvhQadrI=
X-Received: by 2002:ac2:52ac:0:b0:507:a089:caf4 with SMTP id
 r12-20020ac252ac000000b00507a089caf4mr793273lfm.60.1697507594516; Mon, 16 Oct
 2023 18:53:14 -0700 (PDT)
MIME-Version: 1.0
References: <20231008112555.473895-1-parav@nvidia.com> <20231008112555.473895-2-parav@nvidia.com>
 <CACGkMEt0PNFUoVEYDtgziE5scYqauADX6PF-_f0NSCcWB_FrCA@mail.gmail.com>
 <DM8PR12MB54801E873241AA02CC32CDCBDCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231009121638-mutt-send-email-mst@kernel.org> <DM8PR12MB5480E0F15A1BBDD745EE3AF4DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <25375529-9c40-9ea9-692e-f557c514c72f@intel.com> <PH0PR12MB54812E59B581546FFB118F3FDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f875fa3b-4b33-71c2-e612-bc2a674a1e59@intel.com> <PH0PR12MB548171A06CCE458C913E4961DCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <97aa9108-0715-2483-f5cf-02698c745d60@intel.com> <PH0PR12MB5481F4F3B4FADD79770ADEA6DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEt-pUSazfjfROukZdaLdmeX1xP7_OxQaQ=Se=jV5NXkDA@mail.gmail.com> <PH0PR12MB5481F8312139BB197CEB024BDCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481F8312139BB197CEB024BDCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 17 Oct 2023 09:53:03 +0800
Message-ID: <CACGkMEtihTxYADd1dbG=vX9=VLp0xfRJSQ4jd_m0UiuZNz_2sg@mail.gmail.com>
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

On Fri, Oct 13, 2023 at 2:36=E2=80=AFPM Parav Pandit <parav@nvidia.com> wro=
te:
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Friday, October 13, 2023 6:47 AM
> >
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
e it as
> > > > >>>>>>> most stakeholders
> > > > >>>>>> has the clear view of requirements now.
> > > > >>>>>>> Let me know.
> > > > >>>>>> So some people use VFs with VFIO. Hence the module name.
> > > > >>>>>> This sentence by itself seems to have zero value for the spe=
c. Just
> > drop it.
> > > > >>>>> Ok. Will drop.
> > > > >>>> So why not build your admin vq live migration on our config
> > > > >>>> space solution, get out of the troubles, to make your life eas=
ier?
> > > > >>>>
> > > > >>> Your this question is completely unrelated to this reply or you
> > > > >>> misunderstood
> > > > >> what dropping commit log means.
> > > > >> if you can rebase admin vq LM on our basic facilities, I think
> > > > >> you dont need to talk about vfio in the first place, so I ask yo=
u
> > > > >> to re-consider
> > > > Jason's proposal.
> > > > > I don=E2=80=99t really know why you are upset with the vfio term.
> > > > > It is the use case of the cloud operator and it is listed to
> > > > > indicate how proposal
> > > > fits in a such use case.
> > > > > If for some reason, you don=E2=80=99t like vfio, fine. Ignore it =
and move on.
> > > > >
> > > > > I already answered that I will remove from the commit log, becaus=
e
> > > > > the
> > > > requirements are well understood now by the committee.
> > > > >
> > > > > Your comment is again unrelated (repeated) to your past two quest=
ions.
> > > > >
> > > > > I explained you the technical problem that admin command (not
> > > > > admin VQ)
> > > > of basic facilities cannot be done using config registers without
> > > > any mediation layer.
> > > > OK, I pop-ed Jason's proposal to make everything easier, and I see =
it is
> > refused.
> > > Because it does not work for passthrough mode.
> >
> > How and why? What's wrong with just passing through the newly introduce=
d 2
> > or 3 registers to guests?
> >
> If passed to the guest who is not involved in the live migration flow, ca=
nnot operate the device.
> VF =3D member device =3D controlled function
> PF =3D owner device =3D controlling function
> Device migration commands from the hypervisor are not forwarded inside th=
e guest.

I don't see why.

For example, can you explain how a virtio reset in guests can survive
with your proposal but not a virtio suspend?

>
> > This is the question you never answer even if I keep asking.
> >
>
> > > Sure, as I explained the config register method do not work for passt=
hrough
> > mode, and does not scale.
> >
> > We need to make sure your migration proposal can work for 1 VF which is=
 still
> > questionable then we can talk about others like scaling. No?
> Sure but in making sure that, the interface is built so that it can work =
for N VFs too.
>
> >
> > And most of your concern regarding scalability seems more like a limita=
tion of a
> > transport. Let's not mix the scalability for a specific transport with =
the one for
> > core virtio devices.
> Virtio device is for the defined transport.
> So it needs to work for the defined transport.
> Therefore, scalability cannot be ignored.

I'm not convinced that the scalability is broken by just having 2 or 3
more registers. We all know MSIX requires much more than this.

You can't solve all the issues in one series. As stated many times, if
you really care about the scalability, the correct way is to behave
like a real transport through virtqueue instead of trying to duplicate
the functionality of transport virtqueue slowly.

>
> It is not a question anymore as for any bulk transfer virtqueue is the sp=
ecification choice for obvious technical gains.

See above.

Thanks

>
> >
> > >
> > > > >
> > > > >> inflight descriptor tracking will be implemented by Eugenio in V=
2.
> > > > > When we have near complete proposal from two device vendors, you
> > > > > want to push something to unknown future without reviewing the
> > > > > work; does not
> > > > make sense.
> > > > Didn't I ever provide feedback to you? Really?
> > > No. I didn=E2=80=99t see why you need to post a new patch for dirty p=
age tracking,
> > when it is already present in this series.
> >
> > You know there are various ways to do dirty paging? For example, the we=
ll
> > known bitmap and its variants. I think we've discussed several times in=
 many
> > places in the past. I don't see where you explain why you choose one of=
 them
> > but not the others but you want to forbid other types of dirty page log=
ging?
> > Why?
> The well known bitmap simply do not work for the pci transport in atomic =
way, effectively.
> You tend to derive many conclusions to oppose the work frankly. :)
> Other types of dirty page logging is not forbidden.
>
> I don=E2=80=99t see the need to explain every single word why a given sch=
eme is chosen in the spec language.
> There is line drawn to avoid writing a book and a spec.
>
> > > Secondly I don=E2=80=99t see how one can read 1M flows using config r=
egisters.
> >
> > Why can't we trap them? vIOMMU even migrates internal translation table=
s.
>
> Because they are added and removed over the virtqueues almost as data pat=
h operations.
> Virtio queues are not mediated/trapped when the native device is virtio m=
ember device itself.


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

