Return-Path: <virtio-comment-return-7701-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4763CDB474
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 01:18:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id EE2F38508A
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 01:18:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DA1B198683B
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 01:18:46 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D03A49842E5; Fri, 13 Oct 2023 01:18:46 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C1B03986835
	for <virtio-comment@lists.oasis-open.org>; Fri, 13 Oct 2023 01:18:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: hr3iYd6CNP6vjcRu8u4kTQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697159920; x=1697764720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=znggMoXBqodD10M5KZk3k9McjtpqmRqBeQSlQ8Ls0/0=;
        b=S9LTC1eXAeWwVZSRpNKGXjgmDZK0geMGWg4c2bB+CC7uwhCY84mF60srXub6rVetBX
         1Je2nYp57p9m/Hu4Wx13mYcEUh7YfikEuOfs4YR4O5UeldWAuMpRVbmBuPm/INqCFBXj
         Le4beVOlZej8KDykv6133jJr7hCjJKG8yq4jfv8noy3MIrdEkPOxhZM0VcbEZJ/FXsRp
         dG3houC38KKbDZVNIoWS7NJpA1izcn8jAVMJoi+09tv5agbsUICEU81pkhchmlm79TUn
         TkDr04oo5Jnin3G5KUq1TNC5XOCbA6hz3jo2TQ5G4cwRxnpBaJz5/V6Vr6JfCxZyTjBs
         s9Gw==
X-Gm-Message-State: AOJu0YzsxXu9d13Mq41BvmNcGRvMVzuZgXAwNbej6kF+aMMCMA+jmYCT
	kaKC55uf9iCUZVB3N4oNRkPIXkfTPws4Fs8PMUYOLs8eIxpkPfUn0OTyafQtCPXpHkoK8ZF4+ls
	aH0Xzh9d+6rvp9YmmRwl45s+Fb3Y402GN78P//2ZbgoIRS2P7lQ==
X-Received: by 2002:a05:6512:31c3:b0:500:9bbf:da17 with SMTP id j3-20020a05651231c300b005009bbfda17mr25945597lfe.51.1697159920708;
        Thu, 12 Oct 2023 18:18:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSvgveiW29UGL5iy1UiA+DgP3VY+woEzHQDyPEQMRpiqSCgbzE3/7ljoIP3hLwy/DQURVE5dWQolk5tWomX58=
X-Received: by 2002:a05:6512:31c3:b0:500:9bbf:da17 with SMTP id
 j3-20020a05651231c300b005009bbfda17mr25945498lfe.51.1697159916557; Thu, 12
 Oct 2023 18:18:36 -0700 (PDT)
MIME-Version: 1.0
References: <20231008112555.473895-1-parav@nvidia.com> <20231008112555.473895-4-parav@nvidia.com>
 <20231008073912-mutt-send-email-mst@kernel.org> <2fa89e37-a097-d785-e1ee-cda151b0d872@intel.com>
 <DM8PR12MB548001B88B5FA72B403A2AC9DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <85c59856-b68e-940c-08ed-a14e5a02554d@intel.com> <PH0PR12MB548135EDA034FDF7AE77C5FDDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <cbf6b0b4-c49f-6809-cac8-2d8336a8cc76@intel.com> <PH0PR12MB5481A03DDF43FCBD4184693FDCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <e2696020-8444-0ff3-a774-0b41151a18fb@intel.com> <PH0PR12MB548184740ED3C1011C2A85DEDCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <6fc4af28-67d9-781b-a243-a6c2ebf0244c@intel.com> <PH0PR12MB548125EFC96DE6640F9F4A34DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB548125EFC96DE6640F9F4A34DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 13 Oct 2023 09:18:25 +0800
Message-ID: <CACGkMEuw0qvrVSLXfT2KaCX-GYiw4o9=FifcYDnDHFidGhq23Q@mail.gmail.com>
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

On Thu, Oct 12, 2023 at 7:37=E2=80=AFPM Parav Pandit <parav@nvidia.com> wro=
te:>
> As Michael said, software based nesting is used..

I've pointed out in another thread when hardware has less abstraction
level than nesting, trap/emulation is a must.

> See if actual hw based devices can implement it or not. Many components o=
f cpu cannot do N level nesting either, but may be virtio can.
> I don=E2=80=99t know how yet.

I would not repeat the lessons given by Gerald J. Popek and Robert P.
Goldberg[1] in 1976, but I think you miss a lot of fundamental things
in the methodology of virtualization. For example, nesting is a very
important criteria to examine whether an architecture is well designed
for virtualization.

That is to say for any CPU/hypervisor vendors, the architecture should
be designed to run any levels of nesting instead of just an awkward 2
levels (but what you proposed can not work for even 2). For x86 and
KVM, any level of nesting has been done for about 10 years ago.

For virtio, it can do any level. So did for vhost/vDPA. For example, I
usually develop and test virtio/vDPA/vhost in a nesting environment.

Thanks

[1] https://dl.acm.org/doi/pdf/10.1145/361011.361073


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

