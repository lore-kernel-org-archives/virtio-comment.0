Return-Path: <virtio-comment-return-8489-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788D6C54FB9
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 05:17:05 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A5C562AEDC
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 05:17:04 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 828EC986879
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 05:17:04 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 68C69986191; Tue, 21 Nov 2023 05:17:04 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 58EF6986875
	for <virtio-comment@lists.oasis-open.org>; Tue, 21 Nov 2023 05:17:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: XsTAQB23N7qBptj-J03cHQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700543820; x=1701148620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RzsmrAFZnwmdmHQvUAZMUImU7HGN7uizXWQhvPd3vH0=;
        b=UAaR1E788oKPxkbbKOiEeEaYwMZKVuSjEBWCSh7bty5UbU0NjTW0hpqIVjskiykcVS
         FWC9zzKxzaBTAKL4R9v6UM9VIhE6LNBAf+phsNHQtropbeph9v/pnNzzcdA/HJtKNez7
         6LbdfeUqUN7fiRdCVqAIXEqFTlprC1mD/PKN4LTD63cxQO5Tq2SsxZgIq5EuAYOP1jDP
         y8V8C5xA+iDBTJdjoAtmGDFw2zE82cDyVpblXZHhnB5zfBvn2sgAwvUAGY1DNImJ3EhL
         92Pfkpqs60INMo/wTyy4yq7Qv8vMEb9ZTKQxDw6nE3Zk+2jxW9uuDvNVEeFk1kJxNvj6
         V+CQ==
X-Gm-Message-State: AOJu0YyAAcqCsngUtkQVVYF9hmegFONP/caiiUOUyT8bEYiktVVNlYgK
	XLg0lGTSQGPaLRWvSNFKAR240DYaQv8iWyGNby+k/6RP70eFcxruuUBxXTPYurLghbjjN9+DbIY
	ON7z64uo6p/Yag6Ouwyg9dckB2N9rTCJGeIa4Fh6PEjVbkb0WBQ==
X-Received: by 2002:a05:6512:3e08:b0:50a:a6b4:de49 with SMTP id i8-20020a0565123e0800b0050aa6b4de49mr8903271lfv.61.1700543820585;
        Mon, 20 Nov 2023 21:17:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEhCIG3gtx9UxGJmXSGapa4bCqpmmgj+SG3SNSTW7U5XHgf76Cb2eW6vuTl/tkNSXN9S3/ncVqsx9xIeRCvNIU=
X-Received: by 2002:a05:6512:3e08:b0:50a:a6b4:de49 with SMTP id
 i8-20020a0565123e0800b0050aa6b4de49mr8903263lfv.61.1700543820243; Mon, 20 Nov
 2023 21:17:00 -0800 (PST)
MIME-Version: 1.0
References: <20231117031251-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D7C85F006AE7292E1D82DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117042446-mutt-send-email-mst@kernel.org> <PH0PR12MB54813F2F62F87E42CD5DB4B0DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117044428-mutt-send-email-mst@kernel.org> <PH0PR12MB5481E8342B26739B852B592FDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117053117-mutt-send-email-mst@kernel.org> <PH0PR12MB5481632B9E440DDCBEEA7B75DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117062003-mutt-send-email-mst@kernel.org> <PH0PR12MB548133582D377B3FE4BB9F6CDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117073917-mutt-send-email-mst@kernel.org> <PH0PR12MB5481CD9329189829A8A6B6D1DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481CD9329189829A8A6B6D1DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 21 Nov 2023 13:16:49 +0800
Message-ID: <CACGkMEtEEj8jXeE7JHyFk6UkBkEP5vpYzXPHHSGpSjDKQivJAg@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>, 
	"lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands

On Fri, Nov 17, 2023 at 8:51=E2=80=AFPM Parav Pandit <parav@nvidia.com> wro=
te:
>
>
> > From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
> > open.org> On Behalf Of Michael S. Tsirkin
> > Sent: Friday, November 17, 2023 6:11 PM
> >
> > On Fri, Nov 17, 2023 at 12:22:59PM +0000, Parav Pandit wrote:
> > >
> > >
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Friday, November 17, 2023 5:03 PM
> > > > To: Parav Pandit <parav@nvidia.com>
> > >
> > > > > Somehow the claim of shadow vq is great without sharing any
> > > > > performance
> > > > numbers is what I don't agree with.
> > > >
> > > > It's upstream in QEMU. Test it youself.
> > > >
> > > We did few minutes back.
> > > It results in a call trace.
> > > Vhost_vdpa_setup_vq_irq crashes on list corruption on net-next.
> >
> > Wrong list for this bug report.
> >
> > > We are stopping any shadow vq tests on unstable stuff.
> >
> > If you don't want to benchmark against alternatives how are you going t=
o prove
> > your stuff is worth everyone's time?
>
> Comparing performance of the functional things count.
> You suggest shadow vq, frankly you should post the grand numbers of shado=
w vq.

We need an apple to apple comparison. Otherwise you may argue with that, no=
?

>
> It is really not my role to report bug of unstable stuff and compare the =
perf against.

Qemu/KVM is highly relevant here no? And it's the way to develop the
community. The shadow vq code is handy.

Just an email to Qemu should be fine, we're not asking you to fix the bug.

Btw, how do you define stable? E.g do you think the Linus tree is stable?

Thanks

>
> We propose device context and provided the numbers you asked. Mostly wont=
 be able to go farther than this.
>
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
>


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

