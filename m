Return-Path: <virtio-comment-return-6497-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE4E6EB64DA
	for <virtio-comment@archiver.kernel.org>; Mon, 26 Jun 2023 03:50:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 350AF7C665
	for <virtio-comment@archiver.kernel.org>; Mon, 26 Jun 2023 03:50:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1D31A98636F
	for <virtio-comment@archiver.kernel.org>; Mon, 26 Jun 2023 03:50:41 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0B52098635B; Mon, 26 Jun 2023 03:50:41 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EBC9F986364
	for <virtio-comment@lists.oasis-open.org>; Mon, 26 Jun 2023 03:50:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: xr54S4_-PGmZlZRq3af1CA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687751435; x=1690343435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mnnlSBSITLWqgUZbsKRR9LQib65igNjFa13IWGtgrMI=;
        b=Er+zJsDlGtZjdsvOK/RwxjcO8KHI5AxE6SJc4TBQU6YrfUKhr5zWQGAo+m5FcsJiNG
         i6NrqjiFEy77dHp2U5Y8bZTB3zIJCoSF67PYnjKTCoPHQBuWB7hMAS6d7wzjslNM2Cxw
         i9z2uFXP+oDCeGUQxXoamqDil2Oy94E+FvIU+dagaHDP3s0ZV9nNr/Y9i3GeuUH+Kd98
         haRkVLi9X49rIyDHEIsU43/sx0uD4M5bmV1MIkuUyk3mM/q4CYxp7LaPVowLiTl8caqt
         W+6YugIQQfIOHtVmNxtaNOMgyiLwLo/Jew1s75wAwgs4gW1LydcgGIsul64SBr0REdB+
         crrg==
X-Gm-Message-State: AC+VfDy/+RbGHD3VCEG/IbzzdR2m3CKw6A12g4EXccaawpAxMVLRQbU7
	zawTt2JgcQ7UhRKRL+M4mM+89onsSYFw9t1b2YAF0r6FbOnIb5ZFY9DxfLwY3Fh33yifY+xqFKx
	/GHFmGqbmQtlzVUD+WjVOWsGNecUIS48OeN0GoRHylUolq/HJbA==
X-Received: by 2002:a2e:8810:0:b0:2b4:74e2:afa8 with SMTP id x16-20020a2e8810000000b002b474e2afa8mr7878346ljh.9.1687751435387;
        Sun, 25 Jun 2023 20:50:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4pCZGwbBU0QQJIvIEfDxg9BnFyQCmI9ZAebEceop9JMvokyhY3amEyAHqpLffZGR49BmHRcxoR7HGhU25HErQ=
X-Received: by 2002:a2e:8810:0:b0:2b4:74e2:afa8 with SMTP id
 x16-20020a2e8810000000b002b474e2afa8mr7878338ljh.9.1687751435136; Sun, 25 Jun
 2023 20:50:35 -0700 (PDT)
MIME-Version: 1.0
References: <PH0PR12MB54810313CA6DD1995F52745DDC50A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsy=pG=LT0hOT-PO3HTkk3NOAu6qA_GaZpKwqq8B996cA@mail.gmail.com>
 <PH0PR12MB5481B197049376E7C4D0112EDC51A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsPjwgx=atOC1ww+RnfJcrg7m2CmMXWQCCoreCwsWVpLg@mail.gmail.com>
 <PH0PR12MB54817C027CB2B7BB74BD35EDDC51A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsGA4ZhOPn5OCTZEZkja2UrLpJ8DXH+d62Fp5rtdicseg@mail.gmail.com>
 <PH0PR12MB5481F1BE96B1CE71F4FBD2D8DC51A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu+LDKUkg5ZZjcRsztrL1QGY2a6wto8r93Ddwc6L=a63w@mail.gmail.com>
 <PH0PR12MB5481175A9D915E3BF396AFFBDC51A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsN=5DcMsZa5hHGKb9kCRUVA2CcwZ4uif-E0HKaXiJ-fA@mail.gmail.com> <20230609031923-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230609031923-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 26 Jun 2023 11:50:24 +0800
Message-ID: <CACGkMEtPKh-fEkjPu2iPeV5uXus0W7J1V94q1VHVWv-jJHYWGQ@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, 
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>, "cohuck@redhat.com" <cohuck@redhat.com>, 
	"david.edmondson@oracle.com" <david.edmondson@oracle.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [virtio-dev] Re: [PATCH v3 0/3]
 transport-pci: Introduce legacy registers access using AQ

On Fri, Jun 9, 2023 at 3:22=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com> =
wrote:
>
> On Fri, Jun 09, 2023 at 02:27:01PM +0800, Jason Wang wrote:
> > > I would like to keep the stateful interactions of 1.x device outside =
of 0.9.5.
> >
> > I don't think this is a real problem, but let's see the drawbacks of
> > this proposal:
> >
> > 1) non-trivial changes of full new transport alike ABI
> > 2) can't work for nesting
> > 3) require vendor to implement legacy behaviour which can't be
> > documented precisely
> > 4) require admin virtqueue to work
> >
> > We won't have the above issues if we use modern + legacy header/mac.
> >
> > Thanks
>
>
> All this is true. But it's by design. It makes the legacy thing
> as isolated as possible.

Only the device ABI but not the implementation I think.

> Because let's be frank we won't be
> able to drop legacy support in like 10 years.

Another question is, current modern PCI layout could become "legacy"
in the future. So should then the hardware stick the two legacy
interfaces?

> But hardware
> vendors will do that quickly if they can't sell hardware.

It looks to me that producing a modern only device will be more quick and e=
asy?

Thanks

>
> --
> MST
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

