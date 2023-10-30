Return-Path: <virtio-comment-return-8027-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1364C4332F
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 04:06:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3F1BE33585
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 04:06:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 28BA2986B1E
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 04:06:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1D246986A42; Mon, 30 Oct 2023 04:06:33 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0FB95986A7E
	for <virtio-comment@lists.oasis-open.org>; Mon, 30 Oct 2023 04:06:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: VffSgevnMfWxKJwPmJVzwQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698638789; x=1699243589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ivAFSadeExFTZHGQHeBDu5ppPJbqpzJMm1fsYJvT4Fo=;
        b=KR8fR/EDBEiGK3if7r0mh2Vm9tBWdhrYJo2jAk03V//65uVjP9gJlF1idIV/8pFuew
         9sz+7oxMc6081FlacPhy/XbFjAY68XGBVRYMb5IR8SKH2ADBYCCa0zKwuTH/l9GNP80S
         +aDK8kd6LWv6c2UBInISBhCu/Y+LiNXMVDDEqLvKqw7EVDlzBiLI6kxtvMGXe9s8Q2C3
         pbY3y20CpUXeRb1+w1GD211RdIkbxsvsBcq5IbRoEzQo+/7pu6nZMTTcSxTOtjoCQMub
         aZvQ3bo4FS2hW8B/oU2t1xtSCW8PXby2TEl2CX34GsS81yvkVIhXo5DqI88gpm8i3h7q
         v/Rw==
X-Gm-Message-State: AOJu0YyjBZV1uNnqAE8AUnpOgk54HsVnXMhVF311477tPu5HuPFEQu6g
	PSwv0INsmjyxM+d5lUZ9K1e0kwBwXxmOCJSGP/kEdDerh6se4HWg+dUsVOhDE9kfRyqARTRtnqN
	X55pv9Z76Z2FoHyyaEWQVOv59U9ojQqFGKpLLYyYWX8rWx0T/GA==
X-Received: by 2002:ac2:5448:0:b0:507:a1e5:74fe with SMTP id d8-20020ac25448000000b00507a1e574femr6206476lfn.54.1698638788744;
        Sun, 29 Oct 2023 21:06:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGh3gjwuaHvQAGVTjIOPC7eXkMB0jFbf3CF0593LKjmWLHO/wKJjsKmlMar8W7sxLZB6aStCQOE0A4U7wwAWxg=
X-Received: by 2002:ac2:5448:0:b0:507:a1e5:74fe with SMTP id
 d8-20020ac25448000000b00507a1e574femr6206469lfn.54.1698638788369; Sun, 29 Oct
 2023 21:06:28 -0700 (PDT)
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
 <CACGkMEu_uRcL293Dd+vo2VvYJfUiCaPYF0dAjk-s6=RUtw-PEQ@mail.gmail.com>
 <PH0PR12MB54813820D9800B4F62C5784FDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsMF4JVEQJ6skT2DrEWjop6wjKS6ad6dW2UNOA1oRuPKQ@mail.gmail.com>
 <PH0PR12MB548109DEAE4B6C76025BD57ADCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEv2fNa_vqbqQmu3ys5tbB4-S-onXvr-pT9U9cd8iut7sA@mail.gmail.com>
 <PH0PR12MB5481EA6A4D0C64C5AF6D3A57DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsfyOCf-qCxr7kGM7WPco3YgeBsbOXbDT9AtigZpXF6Tg@mail.gmail.com>
 <PH0PR12MB5481A39FADD3A19F0CBF1B66DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEt_aVfMgYQo3uMy-_DXrYDpgkWHtSq_qfr-tXs289pQWg@mail.gmail.com>
 <PH0PR12MB54817E76866D0E98863F6C5DDCDFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEs+M+z0HoBo9i_w5qjNt7=MxViSu2PYbTSyfe+Pm-dnqQ@mail.gmail.com>
 <PH0PR12MB5481C28D6E1C3C9490AF682BDCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEt7F6VHiam7bNxK8EqqR6vyyGxrETP7s9b3DHiDktxtHQ@mail.gmail.com> <DM8PR12MB5480FD897C13FCB2CBE15268DCDDA@DM8PR12MB5480.namprd12.prod.outlook.com>
In-Reply-To: <DM8PR12MB5480FD897C13FCB2CBE15268DCDDA@DM8PR12MB5480.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 30 Oct 2023 12:06:17 +0800
Message-ID: <CACGkMEuKoamb1bn-9stEsZTA3nHwAw4jrd=jWPS6SGuUzH67FA@mail.gmail.com>
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

On Thu, Oct 26, 2023 at 11:45=E2=80=AFAM Parav Pandit <parav@nvidia.com> wr=
ote:
>
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Thursday, October 26, 2023 6:16 AM
> >
> > On Wed, Oct 25, 2023 at 3:03=E2=80=AFPM Parav Pandit <parav@nvidia.com>=
 wrote:
> > >
> > >
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Wednesday, October 25, 2023 6:59 AM
> > > > > For passthrough PASID assignment vq is not needed.
> > > >
> > > > How do you know that?
> > > Because for passthrough, the hypervisor is not involved in dealing wi=
th VQ at
> > all.
> >
> > Ok, so if I understand correctly, you are saying your design can't work=
 for the
> > case of PASID assignment.
> >
> No. PASID assignment will happen from the guest for its own use and devic=
e migration will just work fine because device context will capture this.

It's not about device context. We're discussing "passthrough", no?

You want all virtio stuff to be "passthrough", but assigning a PASID
to a specific virtqueue in the guest must be trapped.

>
> > >
> > > > There are works ongoing to make vPASID work for the guest like vSVA=
.
> > > > Virtio doesn't differ from other devices.
> > > Passthrough do not run like SVA.
> >
> > Great, you find another limitation of "passthrough" by yourself.
> >
> No. it is not the limitation it is just the way it does not need complex =
SVA to split the device for unrelated usage.

How can you limit the user in the guest to not use vSVA?

>
> > > Each passthrough device has PASID from its own space fully managed by=
 the
> > guest.
> > > Some cpu required vPASID and SIOV is not going this way anmore.
> >
> > Then how to migrate? Invent a full set of something else through anothe=
r giant
> > series like this to migrate to the SIOV thing? That's a mess for sure.
> >
> SIOV will for sure reuse most or all parts of this work, almost entirely =
as_is.
> vPASID is cpu/platform specific things not part of the SIOV devices.
>
> > >
> > > >
> > > > > If at all it is done, it will be done from the guest by the drive=
r
> > > > > using virtio
> > > > interface.
> > > >
> > > > Then you need to trap. Such things couldn't be passed through to gu=
ests
> > directly.
> > > >
> > > Only PASID capability is trapped. PASID allocation and usage is direc=
tly from
> > guest.
> >
> > How can you achieve this? Assigning a PAISD to a device is completely
> > device(virtio) specific. How can you use a general layer without the kn=
owledge
> > of virtio to trap that?
> When one wants to map vPASID to pPASID a platform needs to be involved.

I'm not talking about how to map vPASID to pPASID, it's out of the
scope of virtio. I'm talking about assigning a vPASID to a specific
virtqueue or other virtio function in the guest.

You need a virtio specific queue or capability to assign a PASID to a
specific virtqueue, and that can't be done without trapping and
without virito specific knowledge.

> When virtio passthrough device is in guest, it has all its PASID accessib=
le.
>
> All these is large deviation from current discussion of this series, so I=
 will keep it short.
>
> >
> > > Regardless it is not relevant to passthrough mode as PASID is yet ano=
ther
> > resource.
> > > And for some cpu if it is trapped, it is generic layer, that does not=
 require virtio
> > involvement.
> > > So virtio interface asking to trap something because generic facility=
 has done
> > in not the approach.
> >
> > This misses the point of PASID. How to use PASID is totally device spec=
ific.
> Sure, and how to virtualize vPASID/pPASID is platform specific as single =
PASID can be used by multiple devices and process.

See above, I think we're talking about different things.

>
> >
> > >
> > > > > Capabilities of #2 is generic across all pci devices, so it will
> > > > > be handled by the
> > > > HV.
> > > > > ATS/PRI cap is also generic manner handled by the HV and PCI devi=
ce.
> > > >
> > > > No, ATS/PRI requires the cooperation from the vIOMMU. You can simpl=
y
> > > > do ATS/PRI passthrough but with an emulated vIOMMU.
> > > And that is not the reason for virtio device to build trap+emulation =
for
> > passthrough member devices.
> >
> > vIOMMU is emulated by hypervisor with a PRI queue,
> PRI requests arrive on the PF for the VF.

Shouldn't it arrive at platform IOMMU first? The path should be PRI ->
RC -> IOMMU -> host -> Hypervisor -> vIOMMU PRI -> guest IOMMU.

And things will be more complicated when (v)PASID is used. So you
can't simply let PRI go directly to the guest with the current
architecture.

>
> > how can you pass
> > through a hardware PRI request to a guest directly without trapping it =
then?
> > What's more, PCIE allows the PRI to be done in a vendor (virtio) specif=
ic way, so
> > you want to break this rule? Or you want to blacklist ATS/PRI for virti=
o?
> >
> I was aware of only pci-sig way of PRI.
> Do you have a reference to the ECN that enables vendor specific way of PR=
I? I would like to read it.

I mean it doesn't forbid us to build a virtio specific interface for
I/O page fault report and recovery.

> This will be very good to eliminate IOMMU PRI limitations.

Probably.

> PRI will directly go to the guest driver, and guest would interact with I=
OMMU to service the paging request through IOMMU APIs.

With PASID, it can't go directly.

> For PRI in vendor specific way needs a separate discussion. It is not rel=
ated to live migration.

PRI itself is not related. But the point is, you can't simply pass
through ATS/PRI now.

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

