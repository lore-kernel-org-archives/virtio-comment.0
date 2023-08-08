Return-Path: <virtio-comment-return-7042-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB48AC001DB
	for <virtio-comment@archiver.kernel.org>; Tue,  8 Aug 2023 03:51:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2DD58157F07
	for <virtio-comment@archiver.kernel.org>; Tue,  8 Aug 2023 03:51:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 278CC986485
	for <virtio-comment@archiver.kernel.org>; Tue,  8 Aug 2023 03:51:01 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0F4F5983EB3; Tue,  8 Aug 2023 03:51:01 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EA90F986460
	for <virtio-comment@lists.oasis-open.org>; Tue,  8 Aug 2023 03:50:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Tsd8RRXUOw2z09h-BBU2zg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691466650; x=1692071450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SZfAtvyIGztDmM2HsrB4Ax0u/S2FUFbZg6Oj0bqZ4PA=;
        b=V9Pb/n5xl5/lZK0JeC9rwNObRKLWZZwnPnDrlEru06GF3LMM8f0LfEhf42mi57NnPs
         wXHaLbndqt1l+E6lBXyIem0BpunfRXZM4/Cm//c4nOqTHdVtHuSyfyb7pgEFaw4ovHHb
         pXgZPowjezWEhVjzuYpaOSoP8lZUwB9+1y8Lb0jEHb+eya5VXhZtzF4PbTiPGb5SEvAu
         d1fAkXUJ1fG2rCc/uUmfMa2vAQgSc6vFQnmX9OiEwYqEoigWV2m11+QAQShGWEMxl1XJ
         FMu0jOcV96kBZRw3SoiCuKJjaObQ8is7QDuK6Ej8DjEaOXT96InTqXtMgyLmIEDvEh/f
         njVg==
X-Gm-Message-State: AOJu0Yyeb7RfiTopZTDvYFWWHTqPCs05cBhtGAJQ1EZxg87ib6WZcsY4
	W2Ahsx1ATFr/Zgscdz6+TtByjqu0J6s3c70n1Pkw8uTUl/s24/B7elIQ0EQbjw/6w3q0aryxT3A
	nc6Xl+v63g+Q6EQNPM7m9BylaSOMWrzNTQOlUkeR0keKK3NCxPg==
X-Received: by 2002:a2e:8395:0:b0:2b9:20fe:4bc4 with SMTP id x21-20020a2e8395000000b002b920fe4bc4mr7189357ljg.40.1691466650110;
        Mon, 07 Aug 2023 20:50:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/eUaJClNGSdaVl8rZN/51opbyG7xq1fWQvoBjeDbdXJjD65mh8PaYEj+k3bJxdDkJqNwJxtlpnuSmsg8pXoY=
X-Received: by 2002:a2e:8395:0:b0:2b9:20fe:4bc4 with SMTP id
 x21-20020a2e8395000000b002b920fe4bc4mr7189346ljg.40.1691466649750; Mon, 07
 Aug 2023 20:50:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230803083150.46745-1-xuanzhuo@linux.alibaba.com>
 <20230803054333-mutt-send-email-mst@kernel.org> <1691059929.235804-1-xuanzhuo@linux.alibaba.com>
 <PH0PR12MB5481B5B3C5366CCACB221083DC08A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1691060652.3764465-2-xuanzhuo@linux.alibaba.com> <PH0PR12MB548191AE225B08BACFC0C350DC08A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1691061508.9066079-5-xuanzhuo@linux.alibaba.com> <PH0PR12MB5481CB7BE555F4672394A6ECDC08A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1691062204.2378864-7-xuanzhuo@linux.alibaba.com> <PH0PR12MB5481E104793F9E68E1DC95CADC08A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1691062877.0013635-8-xuanzhuo@linux.alibaba.com> <PH0PR12MB5481C3CE21016385BF7D6FF0DC08A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1691129914.3255427-1-xuanzhuo@linux.alibaba.com> <PH0PR12MB5481F521F146049E5E483B7DDC09A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1691132049.7182267-2-xuanzhuo@linux.alibaba.com> <PH0PR12MB5481BE16AC810CD3A6D64832DC09A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1691135097.4908528-3-xuanzhuo@linux.alibaba.com> <20230804053958-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548152A5677F0508A62587AFDC09A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1691388171.3192031-1-xuanzhuo@linux.alibaba.com> <CACGkMEtKcmvBqSJac4aNQMtvE+fYnOeLxeeXz1vtP5d2PM69bQ@mail.gmail.com>
 <1691462188.324996-1-xuanzhuo@linux.alibaba.com> <CACGkMEszg7nUNH2bW+EQLVxnPvUzT66D8=V8x7JKw+DL=RzsiQ@mail.gmail.com>
 <PH0PR12MB5481D3BDFB943D7856D846A9DC0DA@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481D3BDFB943D7856D846A9DC0DA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 8 Aug 2023 11:50:36 +0800
Message-ID: <CACGkMEvzU4SE8wBoTE6A56S9bGM_rtv=nU113WhEUL2EBEBaug@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "Michael S. Tsirkin" <mst@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: RE: RE: RE: RE: [virtio-comment] RE: RE: RE: RE: [RFC]
 virtio-net: support access and control the member devices

On Tue, Aug 8, 2023 at 11:16=E2=80=AFAM Parav Pandit <parav@nvidia.com> wro=
te:
>
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Tuesday, August 8, 2023 8:39 AM
>
> >
> > Yes, but even for TX, would it be better to filter the IP as early as p=
ossible in the
> > TX path other than depend on the switch to do that?
>
> The idea is to introduce filters on the new virtio switch object for tx a=
nd rx both.

It can be done in this way for sure but the question is why it must be
done in this way. A drawback of using switch is that it introduces
dependencies.

> A virtio switch object can be part of a existing virtio device or a new v=
irtio device type in itself.

That's fine.

>
> Xuan,
> As we discussed, since the owner device packets also needs to be filtered=
, potentially outside of the owner device itself,

This seems the admin request out of the scope of virtio.

Thanks

>
> Do you see the need to introduce virtio switch object now, or can it wait=
?


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

