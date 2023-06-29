Return-Path: <virtio-comment-return-6593-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10256EB64DA
	for <virtio-comment@archiver.kernel.org>; Thu, 29 Jun 2023 03:17:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 88C9C7606F
	for <virtio-comment@archiver.kernel.org>; Thu, 29 Jun 2023 03:17:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7DB429865CE
	for <virtio-comment@archiver.kernel.org>; Thu, 29 Jun 2023 03:17:53 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 744C4986317; Thu, 29 Jun 2023 03:17:53 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5C0DC98658B
	for <virtio-comment@lists.oasis-open.org>; Thu, 29 Jun 2023 03:17:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: LJ6TygAFMg-Z1O0fmWVDRA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688008666; x=1690600666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P/L1vqN6tztYqvMoNwM1vhPnJrcwSqwmW06TnqPTNF8=;
        b=KfSJrUdWWu3du/cEqqg9NAqDEgjYRmNi1RvtIG4EfnJjNap7H8XQzwBIvLiE/GlDlo
         Fbu1xvYUFhmOp4mtfIS6mqd/64v8J8fSYqbxOquW+LAG+bZv1D7VDWQMU6aZq/UPx+ZD
         OAWT7BTEwWIdc0uvKjNBE7+VBVR302I9rQGuHnPZ+OxLaVdQ8a5iHDtEivSemXSVYRPb
         mMyZ0joZEQC6pwfmzEuFGTcs6spbvGvMPtF0Yh+dSpKOhS1KYZXHEsLaDc43sWWgI7Ed
         pB3caHJFKf516rkXxu5TqqcgIH1pHAv6EtkDOefJR000Xis0yPVcsGQKz7+6rkJyK2/o
         e7kg==
X-Gm-Message-State: AC+VfDxfezmJB40Kr8FwqJ4jgISP2388DJinabFOT18Fbhvajzhej3K8
	3+qSTdexcihubEib//zw2XR1qJ8D4CFFACr3aUvXcDuOuyyR6Jo3qnKjTL1f/7k2hvmghAiIKPA
	5DIa3nB7Scq83/7wcbkuLieiFkUtRm+2LMVfrj7icab9ZjP+9fQ==
X-Received: by 2002:a2e:3202:0:b0:2b5:9d78:213e with SMTP id y2-20020a2e3202000000b002b59d78213emr11171843ljy.22.1688008666368;
        Wed, 28 Jun 2023 20:17:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Pkia1M7ilXuWTQiJmb1wTinrFEydGB4WEL/YHZeml5sKKv3SS8D5KmiNLf60JT4w4AORq+BQoHVQ8Y51QvrY=
X-Received: by 2002:a2e:3202:0:b0:2b5:9d78:213e with SMTP id
 y2-20020a2e3202000000b002b59d78213emr11171831ljy.22.1688008666048; Wed, 28
 Jun 2023 20:17:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230627163549.40028-1-hengqi@linux.alibaba.com>
 <CACGkMEvFmAiWDp8w=ytin21Oi+PcTb1X3Eve7Kt2NVr_RkhgmA@mail.gmail.com>
 <PH0PR12MB54811123CFCDEFE3B48D4381DC24A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtgomh1EGNLqhXQssRW02nnHkamxT5rV5eZZ9BZFH=uJA@mail.gmail.com> <PH0PR12MB548102A43104218F481B8679DC24A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB548102A43104218F481B8679DC24A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 29 Jun 2023 11:17:34 +0800
Message-ID: <CACGkMEsk-eH19bdBgMvxrX-xqpOX=RELv-BadZdGq+K0_6xh+A@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Heng Qi <hengqi@linux.alibaba.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>, "Michael S . Tsirkin" <mst@redhat.com>, 
	Yuri Benditovich <yuri.benditovich@daynix.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [PATCH v19] virtio-net: support inner header hash

On Thu, Jun 29, 2023 at 12:00=E2=80=AFAM Parav Pandit <parav@nvidia.com> wr=
ote:
>
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Wednesday, June 28, 2023 1:38 AM
>
> [..]
> > > Provisioning is far simpler thing to do in device specific way than a=
sking device
> > to store this value in onchip area which is rarely accessed.
> >
> > Are you suggesting to not place any new fields in the config space?
> >
> Yes.

It's not the fault of config space itself, but the way to access the
config space, more below.

>
> > struct virtio_net_config {
> >         u8 mac[6];
> >         le16 status;
> >         le16 max_virtqueue_pairs;
> >         le16 mtu;
> >         le32 speed;
> >         u8 duplex;
> >         u8 rss_max_key_size;
> >         le16 rss_max_indirection_table_length;
> >         le32 supported_hash_types;
> > };
> >
> > Which of the above do you think can be accessed frequently and which pa=
rt of
> > the spec says it must be stored in the onchip area?
> >
> Most are not accessed frequently.
> The fact that they are in MMIO a device needs to place in a memory with t=
ight latency budget.

This really depends on the implementation and vendor architectures.
For example,

1) MSI BAR might require much more resources than a simple device
configuration space
2) I was told my some vendors that the virtqueue is much more valuable than=
 MMIO
3) We can introduce new ways to access the device configuration space

> Spec is not going to talk on onchip area, it is the reflection of spec th=
at forces certain inefficient implementation .

Exactly, it's implementation specific, so config space is fine, we
just need to invent new methods to access them that fit for your
hardware.

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

