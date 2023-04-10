Return-Path: <virtio-comment-return-5333-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BA8C77B61
	for <virtio-comment@archiver.kernel.org>; Mon, 10 Apr 2023 07:21:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B012142A8C
	for <virtio-comment@archiver.kernel.org>; Mon, 10 Apr 2023 07:21:09 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A7EDA98636D
	for <virtio-comment@archiver.kernel.org>; Mon, 10 Apr 2023 07:21:09 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A05F89862A5; Mon, 10 Apr 2023 07:21:09 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 91564986319
	for <virtio-comment@lists.oasis-open.org>; Mon, 10 Apr 2023 07:21:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: fEHR69PFP_-hp0QduNy1ew-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681111263; x=1683703263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pOnZM4oKYtv08VMvJswhLPik1/4GCmtKrTym0UUElAg=;
        b=aJidXbedlpKqpwgE8rUXfgb1FbmOZAXizrvwxTtLlG2E4X6jEsPKZ3PaKQHYTHZWOs
         IDEWyEi79MFS0boWlbziDPHo5kyZHSmNOOvdHxFbM4wI034kIQtDosL8GjLf9hTggPFb
         1Ok/XRWFsr3Q0NLTLGFMcbzpmrQy6WTW/It6Q53fGE0Cgs79jj/gh1LEhujAHp8hIN4V
         HLHvd4UZ/2BqHZHvVrfG8msPXUgGt23JpUeX5jxNKKBsy39YEfMZJqpBo3E0wRiVYdSF
         OHv3tiZbsUz8wq6e+BbwfYTppUxvThmLE4SQxtJJW86oAQJOc4zRUpKa9TG6W5v15MNf
         rg4w==
X-Gm-Message-State: AAQBX9dku/MEdbBWjhwKf2s1EdRpBq8Ay3niAcHz6Vp4C+ctAlM1WXmi
	6YBMJpWMYyEn8gfCXUUPGIa8k2J9wGV9g5H7NiCkgaqXRqgdwVPRi6lrkWV+knpoumP1vg57MAv
	NmRBWpmwJhbI9FShHirv2XgxaBtNHgONdQTV9UHbWXHmsurHriA==
X-Received: by 2002:a05:6870:c22c:b0:17e:7674:8df0 with SMTP id z44-20020a056870c22c00b0017e76748df0mr3118437oae.9.1681111263076;
        Mon, 10 Apr 2023 00:21:03 -0700 (PDT)
X-Google-Smtp-Source: AKy350aOjXMKA+ZYBvRiZ7hg3IxdqxSrKXPv26P3Vt3E05uAC224RKOWHhvUvreoiCs+FrbIKrCsr8x70XvIoq+TXMQ=
X-Received: by 2002:a05:6870:c22c:b0:17e:7674:8df0 with SMTP id
 z44-20020a056870c22c00b0017e76748df0mr3118434oae.9.1681111262866; Mon, 10 Apr
 2023 00:21:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230330225834.506969-1-parav@nvidia.com> <20230330225834.506969-10-parav@nvidia.com>
 <20230407043841-mutt-send-email-mst@kernel.org> <CACGkMEtkOdwixxaRz2Pv9xP75vb13ncboX5XRs8NqFCUsS16aQ@mail.gmail.com>
 <20230410020906-mutt-send-email-mst@kernel.org> <CACGkMEtiROwuB+ECJqd13qdpMJSTMoDOzi1u_i85==42C0XSXw@mail.gmail.com>
 <20230410023715-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230410023715-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 10 Apr 2023 15:20:52 +0800
Message-ID: <CACGkMEs+E_OarQxP3NmLk3iSi7U0WgAn-m3b4eX7ULu1+v=sOw@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, virtio-dev@lists.oasis-open.org, cohuck@redhat.com, 
	virtio-comment@lists.oasis-open.org, shahafs@nvidia.com, 
	Satananda Burla <sburla@marvell.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [PATCH 09/11] transport-pci: Describe PCI
 MMR dev config registers

On Mon, Apr 10, 2023 at 2:40=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Mon, Apr 10, 2023 at 02:20:16PM +0800, Jason Wang wrote:
> > On Mon, Apr 10, 2023 at 2:15=E2=80=AFPM Michael S. Tsirkin <mst@redhat.=
com> wrote:
> > >
> > > On Mon, Apr 10, 2023 at 09:33:32AM +0800, Jason Wang wrote:
> > > > This is fine for vDPA but not for virtio if the design can only wor=
k
> > > > for some specific setups (OSes/archs).
> > > >
> > > > Thanks
> > >
> > > Well virtio legacy has a long history of documenting existing hacks :=
)
> >
> > Exactly, so the legacy behaviour is not (or can't be) defined by the
> > spec but the codes.
>
> I mean driver behaviour derives from the code but we do document it in
> the spec to help people build devices.
>
>
> > > But yes, VIRTIO_F_ORDER_PLATFORM has to be documented.
> > > And we have to decide what to do about ACCESS_PLATFORM since
> > > there's a security problem if device allows not acking it.
> > > Two options:
> > > - relax the rules a bit and say device will assume ACCESS_PLATFORM
> > >   is acked anyway
> >
> > This will break legacy drivers which assume physical addresses.
>
> not that they are not already broken.

I may miss something, the whole point is to allow legacy drivers to
run otherwise a modern device is sufficient?

>
> > > - a new flag that is insecure (so useful for sec but useless for dpdk=
) but optional
> >
> > This looks like a new "hack" for the legacy hacks.
>
> it's not just for legacy.

We have the ACCESS_PLATFORM feature bit, what is the useage for this new fl=
ag?

>
> > And what about ORDER_PLATFORM, I don't think we can modify legacy drive=
rs...
> >
> > Thanks
>
> You play some tricks with shadow VQ I guess.

Do we really want to add a new feature in the virtio spec that can
only work with the datapath mediation?

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

