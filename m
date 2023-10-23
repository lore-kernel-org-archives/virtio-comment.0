Return-Path: <virtio-comment-return-7891-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DBFDCDB474
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 03:44:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id BEB5B2AFFA
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 03:44:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A46B398666B
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 03:44:51 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 89E85986659; Mon, 23 Oct 2023 03:44:51 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 756BF986662
	for <virtio-comment@lists.oasis-open.org>; Mon, 23 Oct 2023 03:44:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 72yD1aWoPli-3D7gyWw20w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698032687; x=1698637487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=32mEtO6NR8BEhJCKo+pOffXPkeI2/J5QV8rSVJ+M9X8=;
        b=WmF8AAWq5Qx3AO61sstJT4MTzsP7vO5GtOqBttnppgMCJXTDie459U+VfNytrLLrmx
         W2W3s2BLYzQfTM0j/Cs1mhswRhUFFKoPXEJ4ApN5KXaZl1TsBPpd/mg3eFCQPg6Bo935
         6IANxnHt8ONrogE/xO4rZNn8fvfSlGVc69vOVXaXiPgZFdcbtCzD0qMOM4etfHX0RXNh
         SS039H1IeaDBW1ePSkW1akD046Q4iVTwVsM6iyrGlhvKwlyhIZZSZjH5YnJlBS4hCP0W
         YFE66z06XQtCo+BYgsTZnBJDu5WxQlUdk5dcW27iNXEPKZ0tF9rY13PMNTIbgvMGRU8o
         Q29g==
X-Gm-Message-State: AOJu0YzI8SVi5cDv7WMLQdm+ANqecBsyGtw6///hMmQFqwYQ4w0CU93q
	bdruBt0Mi254oQarlprRLYNi64CO2XhF74Xib+07Yu48oz5i41af9uXL1J4SVXM4q5L41Xybgxn
	Kerih/Lgc0aTbE8OWxII0fAyd69b2latFB5HXOXot97KDETcJ9g==
X-Received: by 2002:a05:6512:2085:b0:503:9c2:e44e with SMTP id t5-20020a056512208500b0050309c2e44emr5301375lfr.55.1698032687512;
        Sun, 22 Oct 2023 20:44:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAs1pYhq1epVcn0zY9TjsSyFd116UQ1TWnYNGwOhqUrzKepf27TW1svMIfLD8oYD6xhlTPa6QAE2J4Fe90flI=
X-Received: by 2002:a05:6512:2085:b0:503:9c2:e44e with SMTP id
 t5-20020a056512208500b0050309c2e44emr5301371lfr.55.1698032687226; Sun, 22 Oct
 2023 20:44:47 -0700 (PDT)
MIME-Version: 1.0
References: <db0719f9-7dc2-4a96-b10b-ecc3dac1a82b@intel.com>
 <PH0PR12MB548139B50AD2D1B86AC9A127DCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f7083379-e76c-42f4-8355-ea4ae28eb52c@intel.com> <PH0PR12MB548119E2C2EDB212B56E9FACDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <829d27f8-1d9b-4a1e-93a8-a14da626f4a7@intel.com> <PH0PR12MB54819FC5A77A46C649CD5B6DDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <0948cfa4-da02-43d5-a099-424f209f814f@intel.com> <PH0PR12MB5481546E859578DE97D9E152DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <860e52ef-8cfc-408a-b3cc-2551ef6118d1@intel.com> <PH0PR12MB5481F6F9BC5158481EC36AE9DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231018055422-mutt-send-email-mst@kernel.org> <PH0PR12MB548106B7225BAF351241EA8ADCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB548106B7225BAF351241EA8ADCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 23 Oct 2023 11:44:36 +0800
Message-ID: <CACGkMEsJVxPuxCGjKs3R-kaVGfDMNjtAovM7PpBt3TVd8HON0g@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, "Zhu, Lingshan" <lingshan.zhu@intel.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

On Wed, Oct 18, 2023 at 6:23=E2=80=AFPM Parav Pandit <parav@nvidia.com> wro=
te:
>
>
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Wednesday, October 18, 2023 3:26 PM
>
> > For completeness, and to shorten the thread, can you please list known
> > issues/use cases that are addressed by the status bit interface and how=
 you plan
> > for them to be addressed?
>
> I will avoid listing known issues for a moment for status bit in this ema=
il.
>
> Status bit interface helps in following good ways.
> 1. suspend/resume the device fully by the guest by negotiating the new fe=
ature.
> This can be useful in the guest-controlled PM flows of suspend/resume.
> I still think for this, only feature bit is necessary, and device_status =
modification is not needed.

Which feature bit did you mean here?

> D0->D3 and D3->D0 transition of the pci can suspend and resume the device=
 which can preserve the last device_status value before entering D3.

It's not only about the device status. I would not repeat the question
I've asked in another thread.

What's more, if you really want to suspend/freeze at PCI level and
deal with PCI specific issues like P2P.  You should really try to
leverage or invent a PCI mechanism instead of trying to carry such
semantics via a virtio specific stuff like adminq. Solving transport
specific problems at the virtio level is a layer violation.

> (Like preserving all rest of the fields of common and other device config=
).
> This is orthogonal and needed regardless of device migration.
>
> 2. If one does not want to passthrough a member device, but build a media=
tion-based device on top of existing virtio device,
> It can be useful with mediating software.
> Here the mediating software has ample duplicated knowledge of what the me=
mber device already has.

It is the way the hypervisors are doing for not only virtio but also
for CPU and MMU as well.

> This can fulfil the nested requirement differently provided a platform su=
pport it.
> (PASID limitation will be practical blocker here).

I don't think PASID is a blocker. It is only a blocker if you want to
do passthrough.

>
> How to I plan to address above two?
> a. #1 to be addressed by having the _F_PM bit, when the bit is negotiated=
 PCI PM drives the state.

We can't duplicate every transport specific feature in virtio. This is
a layer violation again. We should reuse the PCI facility here.

> This will work orthogonal to VMM side migration and will co-exist with VM=
M based device migration.
>
> b. nested use case:
> L0 VMM maps a VF to L1 guest as PF with emulated SR-IOV capability.
> L1 guest to enable SR-IOV and mapping the VF to L2 guest.

Let me ask it again here, how can you migrate L2 using L1 "emulated"
PF? Emulation?

Thanks




> Consulting industry ecosystem to support nested outside of virtio.


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

