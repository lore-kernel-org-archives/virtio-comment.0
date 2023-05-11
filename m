Return-Path: <virtio-comment-return-5867-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B9AC77B7F
	for <virtio-comment@archiver.kernel.org>; Thu, 11 May 2023 07:21:14 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3F33E2A8E9
	for <virtio-comment@archiver.kernel.org>; Thu, 11 May 2023 07:21:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3A55C9866CD
	for <virtio-comment@archiver.kernel.org>; Thu, 11 May 2023 07:21:13 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2BC4C9865E1; Thu, 11 May 2023 07:21:13 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 17B9C9865CF
	for <virtio-comment@lists.oasis-open.org>; Thu, 11 May 2023 07:21:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: ALWq9UlpOCyJEFgMK-L0TA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683789664; x=1686381664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K5CMx+jUOk+l/P4dI0JM1XmdQ8x/ucwQA1xScIkMVsQ=;
        b=jx5KYZ1cW7QITQVrpIXP1+OOTMk3Y3H6jGCrtYob3Z68d1IUQPDI7IS8x9bS5n+M4g
         nE2sed8fdHvtjztPHtqDi6YT2lzjnZnWY8Bk4zDrrQHCV/nPnNr6NCTCW5WJbgZCgvjT
         OA62gik+sTxS+/5y8GD6zhmSz8b0Qa9lR50rdTIzOm5CDrg2EubZWjwi5aaAlv/kMCSp
         kDt6mLAMwVBK3MjlUMCvFnAHkIBWmyS0rINa0K7Z48AjdLtBYL1AbQxUJ1IY0MlZQrxz
         d0E+fyvBQTWQtWORdEa8tAZvcvUIF37n0B2XL5bwxGJE7of4xmsHYgX8AlvXc5/6/h8V
         epXA==
X-Gm-Message-State: AC+VfDxqxohccos6l9qz2yOlzPtnTVdJ++K+ncrSgaLimWoJgX5+7JHP
	56EB13oawmUgEqPc2RZiuzJzPUFFy9srCdIcFB7nbfHpxsI0/TLVu9gqhh5gRA8k70dZMH0Rv7P
	dPMLrr2ymsQ/mQtZdycTZMRQSEQ0qu5l9gx/nwM2ky0C35TyhnA==
X-Received: by 2002:a2e:9053:0:b0:2a9:f584:659a with SMTP id n19-20020a2e9053000000b002a9f584659amr2962693ljg.23.1683789663969;
        Thu, 11 May 2023 00:21:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6crYxaPfg+ElD2IjsD7taJxNTIiZyaQPcPGmu2OypssiIJ4XQJIpmQhsqhXyY5ElBjKGRc3RDIurh3BA0MaIc=
X-Received: by 2002:a2e:9053:0:b0:2a9:f584:659a with SMTP id
 n19-20020a2e9053000000b002a9f584659amr2962684ljg.23.1683789663671; Thu, 11
 May 2023 00:21:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230506000135.628899-1-parav@nvidia.com> <CACGkMEt_2B68a+BZ4-vfeDf_eYj5ZhxrDNd6dxuiF85qr0yN2g@mail.gmail.com>
 <20230507093959-mutt-send-email-mst@kernel.org> <CACGkMEtfMbcu2OPsH6P2tA1aHh2FKygv=xkJ-e1XQzb62nE1vQ@mail.gmail.com>
 <b33fe999-8491-30b4-5021-589a2fe87398@nvidia.com> <CACGkMEsSJVG8mzuo3BH1xQzz5TyNbO+o3GcYwoXchcYVOczTTg@mail.gmail.com>
 <PH0PR12MB5481AC52CCAE9636E17C7565DC769@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu1oU0wzygicS0bApoWuRaWkWsPivKRiq-ghezB=hg+Fw@mail.gmail.com>
 <CACGkMEuqGtJP3vXoHrXOBgvPz3woo900+U9kYX1xZnM5h_qXWg@mail.gmail.com> <03c8f7ca-8235-a5a7-5367-b6fd59ad0447@nvidia.com>
In-Reply-To: <03c8f7ca-8235-a5a7-5367-b6fd59ad0447@nvidia.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 11 May 2023 15:20:52 +0800
Message-ID: <CACGkMEv3XBXB_i_PUwxgvY8_UWipGVu8xuGQATp+kHOx3Vdnsg@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, 
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>, "cohuck@redhat.com" <cohuck@redhat.com>, 
	"david.edmondson@oracle.com" <david.edmondson@oracle.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [PATCH v2 0/2] transport-pci: Introduce
 legacy registers access using AQ

On Thu, May 11, 2023 at 12:08=E2=80=AFAM Parav Pandit <parav@nvidia.com> wr=
ote:
>
>
>
> On 5/10/2023 12:22 AM, Jason Wang wrote:
> > On Wed, May 10, 2023 at 11:51=E2=80=AFAM Jason Wang <jasowang@redhat.co=
m> wrote:
>
> >
> > Just to make sure we are at the same page.
> >
> > 1) if the hardware has configq and we need to make it work for current
> > virtio-pci driver, hypervisor needs to trap guest PCI access and
> > translate it to configq command. This means the hypervisor needs to
> > hide the configq from guests. In this case the configq needs a
> > dedicated DMA address which is what PASID can help.
>
> > 2) if the hardware can report the device states, unless we want to
> > migrate L2 guest, hypervisor should hide it from L1, so PASID is
> > required to isolate the DMA for guest traffic and device state.
>
> A configq negotiates + discovers new fields for the PCI PF, VF, SF/SIOV
> devices over PCIe or other transports.
> So no need to hide/mediate for hw based devices, like cvq and like data v=
qs.

As discussed, I may misunderstand the function of the configq. If it
works like cvq, then yes. We don't need PASID.

But if we want to report device state via let's say migration q, it
requires PASID since it is used by the hypervisor.

Thanks

>
> For vdpa kind of use case it can work like cvq mediation, which I
> believe is happening without PASID today.
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

