Return-Path: <virtio-comment-return-7036-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 189C5C001DB
	for <virtio-comment@archiver.kernel.org>; Tue,  8 Aug 2023 02:30:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5E9C36034F
	for <virtio-comment@archiver.kernel.org>; Tue,  8 Aug 2023 02:30:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 36770986485
	for <virtio-comment@archiver.kernel.org>; Tue,  8 Aug 2023 02:30:41 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 22526986460; Tue,  8 Aug 2023 02:30:41 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0CE4F986461
	for <virtio-comment@lists.oasis-open.org>; Tue,  8 Aug 2023 02:30:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: wckTQrZMPjipP4aJJGMS8Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691461837; x=1692066637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xaNspgpLdRo8ZigJihjxrI5TLAylk17gtHYl0h+dC3c=;
        b=f4sFxNTBg1geM0o6+ovmgXHJ2FS+1YGgzfn5EQvLW+tkKP7r4LIsKXPN9Jg1DQjJ8w
         pD/D3Wr9BBcgLmi/ZC+JYFNORMrT/wWGqMUVx2OC65K6aWidUzf7sTKM5SiTCdapmFPR
         ES7dMVPjdmQ8qYwGgQfeHU2WD5k7IZ8K0/Gx+59D4j8pBYihG5nELGI3+gzixq89MahB
         9hAlPINsa11X3LzRosFC2eZRyqrsQAahPalH9DeFEWN0OM8gPaf9DnUwwJHnfUe4pKKu
         nS6H7ihDZVU3JaXJsY/VrGUeLsmWGSgvZrh/a6ZEoPuajxA9BU+JGxzuNXaebnfqvURB
         Wzhw==
X-Gm-Message-State: AOJu0Yw6cyyggrohAwYoBm4Mco+OYCv9g5KHwCmSEdyyBn794ijR3VdZ
	7Fu4bKcZbgk2ZjD+Do13mgKhvrLKWoJdNWvGh/Q+I/gyKjjbSRAw5K2yvz0aCyhhPssU7EdJuep
	rlObTg3IosNhv7fwiaU6UcfKKNI9L6AkuAFSzElYkoJh55JheqQ==
X-Received: by 2002:a2e:7004:0:b0:2b9:d19c:2ad9 with SMTP id l4-20020a2e7004000000b002b9d19c2ad9mr7147123ljc.35.1691461837413;
        Mon, 07 Aug 2023 19:30:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyqEOgZp2TPDZ48OmwkeoI8HMoAGbxtWMkP5nMCwuCvmmJnWl+aFyhm4bAbz+DGleWMg14PSbXHEv0T6Uxjfk=
X-Received: by 2002:a2e:7004:0:b0:2b9:d19c:2ad9 with SMTP id
 l4-20020a2e7004000000b002b9d19c2ad9mr7147119ljc.35.1691461837133; Mon, 07 Aug
 2023 19:30:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230803083150.46745-1-xuanzhuo@linux.alibaba.com>
 <20230803054333-mutt-send-email-mst@kernel.org> <CACGkMEsdM+bi_scj6kgo7FrRDNGwF-=37bT8tOC6DXg9fTuNRw@mail.gmail.com>
 <PH0PR12MB5481EBFEB23938CDC765DA54DC09A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481EBFEB23938CDC765DA54DC09A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 8 Aug 2023 10:30:26 +0800
Message-ID: <CACGkMEvKoZ21tJEDn-hgEzjDcixbxiyejtm_=RD7zebaCnuxxQ@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [RFC] virtio-net: support access and control the member devices

On Fri, Aug 4, 2023 at 12:05=E2=80=AFPM Parav Pandit <parav@nvidia.com> wro=
te:
>
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Friday, August 4, 2023 9:02 AM
>
> > I think we probably need some split here.
> >
> > E.g the fields belonging to configuration space might go with a more ge=
neral
> > interface like admin command/queue.
> >
> > The net specific ones need to go through a net specific interface.
> > (cvq of PF or reps)
>
> I don=E2=80=99t see the need of such split.
> Why do you think that?

It's simply because part of the fields belong to config space.

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

