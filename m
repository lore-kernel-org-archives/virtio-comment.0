Return-Path: <virtio-comment-return-8490-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7CDDC54FB9
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 05:25:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2AFAA2AC53
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 05:25:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EC7DF98688C
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 05:25:21 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id CF9F3986191; Tue, 21 Nov 2023 05:25:21 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BEDFF986875
	for <virtio-comment@lists.oasis-open.org>; Tue, 21 Nov 2023 05:25:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 5Coe_soeOJSfZe8iMyczNg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700544316; x=1701149116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xmd1A35xhBbYjiOYMWz9oCwHCp/4WQEvMHfWAkhfmYI=;
        b=chTOTm92/4Pdk8OjZlRHfr/4XvXPXIS0ISJwK7/I4phDLuUqC+qvoSc+nqOakHT4Hk
         7XrQZY+B1ii/ybPeKMSMdgmBIj4Y883QOVolfRYvsMx1rYoBksOOKM9lXr5p6VmMOmsJ
         Kl2pYRKB1uhw10yZWHqh65L2f7zAHc2Vw76e9x+RIYiboJiw/a0EQDKbwXLAHLhHzy5S
         gQ1/2wfz6/rGp1DxDad8/5UDaA73MRGHR9biJjLdcIXBNI5Wdg7Id1NPgIQTsfotn5lp
         Kx+xNGrhdS6YQuUXhPaDvHxpZco6agl7LOk96ATcmZFURXYHsUG7aUi6tlRctjKtO3lR
         eREA==
X-Gm-Message-State: AOJu0YwlpK5l5e775u1DbWqRSqXtX5dGREmacv0z51pQKfxxkDt60nix
	wHbXNOCPgJq2/jWWPDfkn0+Kq/L42MIZizI5ymeojMcREdLlyWNIDo6sw5EG874co1G/HhbUCeQ
	C6I6QcbONy9INAzO4z32W0ywlA6de/r6s3XUgrZ81lL44iV6bXA==
X-Received: by 2002:a19:5f45:0:b0:507:b911:6706 with SMTP id a5-20020a195f45000000b00507b9116706mr5697896lfj.25.1700544316057;
        Mon, 20 Nov 2023 21:25:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBvO5nRJwX3h/CeYQk1+gh4KSeWGRZnVdFqrpUMV1bPPEdyU9BrfJg0m4LWN6aCJhCCzr9Lozw/2OEm6uIYrM=
X-Received: by 2002:a19:5f45:0:b0:507:b911:6706 with SMTP id
 a5-20020a195f45000000b00507b9116706mr5697871lfj.25.1700544315555; Mon, 20 Nov
 2023 21:25:15 -0800 (PST)
MIME-Version: 1.0
References: <CACGkMEsR56_C2b6-YQFpEOPt4sjJKyqcqrdhi9G0vU9ytezFLQ@mail.gmail.com>
 <PH0PR12MB54811373EA43BEDB4E159E0BDCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsMzp7DjDkQcO4RZ0H0HfxSrytUJrSyDj6gnPWV9cTZow@mail.gmail.com>
 <DM8PR12MB548085F25849CF1E055826E6DCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEsfcEjue1UZmuNs8k65o3HSM94VsweSbWLH3383STR97A@mail.gmail.com>
 <PH0PR12MB548149E1E51DA9C1C094ABCADCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117050357-mutt-send-email-mst@kernel.org> <PH0PR12MB54810D15E0897C2435697E39DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117060456-mutt-send-email-mst@kernel.org> <PH0PR12MB5481AB5ECF613D806C338C54DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117063406-mutt-send-email-mst@kernel.org> <PH0PR12MB5481089119BAB97C8F4B7CE0DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481089119BAB97C8F4B7CE0DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 21 Nov 2023 13:25:03 +0800
Message-ID: <CACGkMEsQorfXDUAv-oesSAVM4A4AdaGuutJ0-5uqGTe1f0kXQw@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, "Zhu, Lingshan" <lingshan.zhu@intel.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Fri, Nov 17, 2023 at 8:03=E2=80=AFPM Parav Pandit <parav@nvidia.com> wro=
te:
>
>
>
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Friday, November 17, 2023 5:13 PM
> >
> > On Fri, Nov 17, 2023 at 11:20:14AM +0000, Parav Pandit wrote:
> > >
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Friday, November 17, 2023 4:41 PM
> > > >
> > > > On Fri, Nov 17, 2023 at 10:20:45AM +0000, Parav Pandit wrote:
> > > > >
> > > > >
> > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > Sent: Friday, November 17, 2023 3:38 PM
> > > > > >
> > > > > > On Wed, Nov 15, 2023 at 05:39:43PM +0000, Parav Pandit wrote:
> > > > > > > > >
> > > > > > > > > Additionally, if hypervisor has put the trap on virtio
> > > > > > > > > config, and because the memory device already has the
> > > > > > > > > interface for virtio config,
> > > > > > > > >
> > > > > > > > > Hypervisor can directly write/read from the virtual confi=
g
> > > > > > > > > to the member's
> > > > > > > > config space, without going through the device context, rig=
ht?
> > > > > > > >
> > > > > > > > If it can do it or it can choose to not. I don't see how it
> > > > > > > > is related to the discussion here.
> > > > > > > >
> > > > > > > It is. I don=E2=80=99t see a point of hypervisor not using th=
e native
> > > > > > > interface provided
> > > > > > by the member device.
> > > > > >
> > > > > > So for example, it seems reasonable to a member supporting both
> > > > > > existing pci register interface for compatibility and the futur=
e
> > > > > > DMA based one for scale. In such a case, it seems possible that
> > > > > > DMA will expose more features than pci. And then a hypervisor
> > > > > > might decide to use
> > > > that in preference to pci registers.
> > > > >
> > > > > We don=E2=80=99t find it right to involve owner device for mediat=
ing at
> > > > > current scale
> > > >
> > > > In this model, device will be its own owner. Should not be a proble=
m.
> > > >
> > > I didn=E2=80=99t understand above comment.
> >
> > We'd add a new group type "self". You can then send admin commands thro=
ugh
> > VF itself not through PF.
> >
> How? The device is owned by the guest. FLR and device reset cannot send t=
he admin command reliably.
>
> >
> > > > > and to not break TDISP efforts in upcoming time by such design.
> > > >
> > > > Look you either stop mentioning TDISP as motivation or actually try
> > > > to address it. Safe migration with TDISP is really hard.
> > > But that is not an excuse to say that TDISP migration is not present,=
 hence
> > involve the owner device for config space access.
> > > This is another hurdle added that further blocks us away from TDISP.
> > > Hence, we don=E2=80=99t want to take the route of involving owner dev=
ice for any
> > config access.
> >
> > This "blocks" is all just wild hunches. hypervisor controls some aspect=
s of TDISP
> > devices for sure - maybe we actually should use pci config space as tha=
t is
> > generally hypervisor controlled.
> Even bad to do hypercalls.
> I showed you last time the role of the PCI config space snippet from the =
spec.
> Do you see we are repeating the discussion again?
>
> >
> > > > For example, your current patches are clearly broken for TDISP:
> > > > owner can control queue state at any time making device modify
> > > > memory in any way it wants.
> > > >
> > > When TDISP migration is needed, the admin device can be another TVM
> > outside the HV scope.
> > > Or an alternative would have device context encrypted not visible to =
HV at all.
> >
> > Maybe. Fact remains your patches do conflict with TDISP and you seem to=
 be
> > fine with it because you have a hunch you can fix it. But we can't do
> > development based on your hunches.
> >
> We have different view.
> My patches do not conflict with TDISP because TDISP has clear definition =
of not involving hypervisor for transport.
> And that part is still preserved.
> Delegating the migration to another TDISP or encrypting is yet to be defi=
ned.
> And current patches will align to both the approaches in future.
>
> So you need to re-evaluate your judgment.
>
> >
> > > Such encryption is not possible, with the trap+emulation method, wher=
e HV
> > will have to decrypt the data coming over MMIO writes.
> >
> > I don't how what trap+emulation has to do with it. Do you refer to the =
shadow
> > vq thing?
>
> The method proposed here does not hinder any TDISP direction.
>
> Without my proposal, do you have a method that does not involve hyperviso=
r intervention for virtio common and device config space, cvq and shadow vq=
?
> If so, I would like to hear that as well because that will align with TDI=
SP.

So this is what you said:

1) TDISP would not do mediation
2) registers doesn't scale

This is exactly what transport virtqueue did. Isn't it?

>
> > I am guessing modern platforms with TDISP support are likely to also
> > support dirty bit in the IOMMU.
> >
> It will be some day.

Dirty bit is far more realistic than TDISP in the short term.

>
> >
> > > > > And for future scale, having new SIOV interface makes more sense
> > > > > which has
> > > > its own direct interface to device.
> > > > >
> > > > > I finally captured all past discussions in form of a FAQ at [1].
> > > > >
> > > > > [1]
> > > > > https://docs.google.com/document/d/1Iyn-l3Nm0yls3pZaul4lZiVj8x1s7=
3
> > > > > Ed6r
> > > > > Osmn6LfXc/edit?usp=3Dsharing
> > > >
> > > > Yea skimmed that, "Cons: None". Are you 100% sure? Anyway,
> > > > discussion will take place on the mailing list please.
> > >
> > > We cannot keep discussing the register interface every week.
> > > I remember we have discussed this many times already in following ser=
ies.
> > >
> > > 1. legacy series

How can this be supported in TDISP then?

> > > 2. tvq v4 series
> > > 3. dynamic vq creation series
> > > 4. again during suspend series under tvq head 5. right now 6. May be
> > > more that I forgot.
> > >
> > > I captured all the direction and options in the doc. One can refer wh=
en those
> > questions arise there.
> > > If we don=E2=80=99t work cohesively same reasoning repetition does no=
t help.
> >
> > It's still the same too, doc or no doc. You want to build a device with=
out
> > registers fine but don't force it down everyone's throat.
> I don=E2=80=99t see any compelling reason for inventing new method really=
.

New requests/platforms come for sure, and virtio supports various transport=
s.

For example, there's a request to support PCI endpoint devices.

> Nor continuing in register mode.

Most virtio devices are implemented in software. And we have pure MMIO
based transport now which is implemented in registers only.

> Virtio already has VQ.
> If CVQ is so problematic, one should put everything on registers and not =
run on double standards.

I don't think there's anyone who says CVQ is problematic.

>
> I captured all the reasoning and thoughts. I don=E2=80=99t have much to s=
ay in support of infinite register scale.
>
> People who wants to push SIOV does not show single performance reason on =
why SIOV to be done.
> I have upstreamed SIOVs in Linux as SFs without PASID, and in all our sca=
le tests, before the device chocks, the system chocks.
>
> So when someone pushes the SIOV series, I will be the first one intereste=
d in reading the performance numbers to proceed with patches.
>
> > And now with 8MBytes
> > of on-device memory that's needed for migration and that's apparently f=
ine I
> > am even less interested in saving 256 bytes for config space.
>
> Again, not the right comparison.
> When and how to use 256 matters.

Do you know how much the config has grown in the past years since 1.0?

Virtio should be implemented easily from:

1) software device to hardware device
2) embedded to server

You can't say e.g migration is needed in all of the environments.

Thanks

> I haven=E2=80=99t come across any device that prefers infinite register s=
cale.


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

