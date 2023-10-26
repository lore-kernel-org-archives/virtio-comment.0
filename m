Return-Path: <virtio-comment-return-7961-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60BAAC0032E
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 00:46:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 970112B07B
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 00:46:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 65A18986A44
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 00:46:20 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4737A986A38; Thu, 26 Oct 2023 00:46:20 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 323F1986A39
	for <virtio-comment@lists.oasis-open.org>; Thu, 26 Oct 2023 00:46:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: vv6HlejKPPqrubP7Rr0W4A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698281176; x=1698885976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PrRi6Xx+qZ/QB1u+RigQ6XdnVfHwT7LZHdBLDrnRwP8=;
        b=s1n7jiCsoAQfvUFN+Zgco21wEMeWnUg/fXNJ3weKGQB4Md3wgb1WwU6lFatvAsxEXS
         a7UCYGg2NLoADm7JMETtOsctKecQ4SX+yKm5ZasPTrwJFR4Ve2OYYo6TvFDyS1NneanO
         ZFy3rX7RfwqPWJie/oDWFsXJNUFmu6fnzJjh57xf3lIL/jOfNUd+GbFwki6CegUfxXds
         CHaCpbF3SjUg5Skwg5hH+xivVGeE/q7LnIjfqBKjP6PGBCSySgsnmW/EoNT8jNBAcWmt
         uY/xkNLMARscNCFFTnUdWfSMTaBAjnaQhzobD9NbGNks4zbzYRIoyhfokRklalJqKtfw
         jAfw==
X-Gm-Message-State: AOJu0YwkUZjh9SlgNHCmMNB5eHXFf/NpAp7JDVMInwvF4gB2iZZf88Uu
	qhkQVVqCTvo3iKmdDknDYz4M9Ds57zcgIfbt7W2Sp6NgF1tNvna4wCSc1b3OOA1llD12S/+irtt
	wvxcLd6cg0aQrX59IV8bREKXK1zp6ZPIqrAc+mpm192mYu5NCCw==
X-Received: by 2002:a05:6512:250e:b0:508:19d6:d520 with SMTP id be14-20020a056512250e00b0050819d6d520mr2085268lfb.44.1698281176007;
        Wed, 25 Oct 2023 17:46:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdNpW2YIN5wMk3bLlySnGQ8D6E1PQgddSDLhclkxql6AJVKrAzK87atb/GLxydGYlknsGYybYJdgWoGpsTEpQ=
X-Received: by 2002:a05:6512:250e:b0:508:19d6:d520 with SMTP id
 be14-20020a056512250e00b0050819d6d520mr2085257lfb.44.1698281175671; Wed, 25
 Oct 2023 17:46:15 -0700 (PDT)
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
 <CACGkMEs+M+z0HoBo9i_w5qjNt7=MxViSu2PYbTSyfe+Pm-dnqQ@mail.gmail.com> <PH0PR12MB5481C28D6E1C3C9490AF682BDCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481C28D6E1C3C9490AF682BDCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 26 Oct 2023 08:46:04 +0800
Message-ID: <CACGkMEt7F6VHiam7bNxK8EqqR6vyyGxrETP7s9b3DHiDktxtHQ@mail.gmail.com>
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

On Wed, Oct 25, 2023 at 3:03=E2=80=AFPM Parav Pandit <parav@nvidia.com> wro=
te:
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Wednesday, October 25, 2023 6:59 AM
> > > For passthrough PASID assignment vq is not needed.
> >
> > How do you know that?
> Because for passthrough, the hypervisor is not involved in dealing with V=
Q at all.

Ok, so if I understand correctly, you are saying your design can't
work for the case of PASID assignment.

>
> > There are works ongoing to make vPASID work for the
> > guest like vSVA. Virtio doesn't differ from other devices.
> Passthrough do not run like SVA.

Great, you find another limitation of "passthrough" by yourself.

> Each passthrough device has PASID from its own space fully managed by the=
 guest.
> Some cpu required vPASID and SIOV is not going this way anmore.

Then how to migrate? Invent a full set of something else through
another giant series like this to migrate to the SIOV thing? That's a
mess for sure.

>
> >
> > > If at all it is done, it will be done from the guest by the driver us=
ing virtio
> > interface.
> >
> > Then you need to trap. Such things couldn't be passed through to guests=
 directly.
> >
> Only PASID capability is trapped. PASID allocation and usage is directly =
from guest.

How can you achieve this? Assigning a PAISD to a device is completely
device(virtio) specific. How can you use a general layer without the
knowledge of virtio to trap that?

> Regardless it is not relevant to passthrough mode as PASID is yet another=
 resource.
> And for some cpu if it is trapped, it is generic layer, that does not req=
uire virtio involvement.
> So virtio interface asking to trap something because generic facility has=
 done in not the approach.

This misses the point of PASID. How to use PASID is totally device specific=
.

>
> > > Capabilities of #2 is generic across all pci devices, so it will be h=
andled by the
> > HV.
> > > ATS/PRI cap is also generic manner handled by the HV and PCI device.
> >
> > No, ATS/PRI requires the cooperation from the vIOMMU. You can simply do
> > ATS/PRI passthrough but with an emulated vIOMMU.
> And that is not the reason for virtio device to build trap+emulation for =
passthrough member devices.

vIOMMU is emulated by hypervisor with a PRI queue, how can you pass
through a hardware PRI request to a guest directly without trapping it
then? What's more, PCIE allows the PRI to be done in a vendor (virtio)
specific way, so you want to break this rule? Or you want to blacklist
ATS/PRI for virtio?

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

