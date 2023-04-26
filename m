Return-Path: <virtio-comment-return-5650-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78EB5C77B73
	for <virtio-comment@archiver.kernel.org>; Wed, 26 Apr 2023 03:03:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 8BF61330A7
	for <virtio-comment@archiver.kernel.org>; Wed, 26 Apr 2023 03:03:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6D6EF986642
	for <virtio-comment@archiver.kernel.org>; Wed, 26 Apr 2023 03:03:45 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5304A983D70; Wed, 26 Apr 2023 03:03:45 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3A7C49864A2
	for <virtio-comment@lists.oasis-open.org>; Wed, 26 Apr 2023 03:03:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: qoR6J9W5MReWSlWIbwrNyQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682478221; x=1685070221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=veN78nQ8ynyiy9us883OttMEFcRypLuEY7eMRjOcxSE=;
        b=Bmu2inX1mQNm0qWQMvqXulubWDpEPG9EgAtpYbpwh8OWq+mJfQNajd5XsuJyXoErsQ
         3wWsIoO6t2SR5TNF51as8/+G05TOo0/4NAZ+UghwrtUobnlWF9wcz4nN75xK5pJXuBS7
         /vOAv1nmz9Y+EvHq8hQW7sCaaPowZNWtHd9moEVDs0+46ZEhBDR8KbmNKLWSdId5wB3P
         kIqbFgh1YQyGWURBebQ1GGxYc7HbyqPMGw7Lt69QH7FE6hUByQYCPv8+UvrKa0OZ+jrk
         CAzYktDsb0Tzn8Ulu8LIpuFiSuDX1NFceQzPA3hJojLj9O1QPXb/wGB00rkdtnaPw6TL
         R3gA==
X-Gm-Message-State: AAQBX9fYamMcWLLC0JyuvY1eXrfjOdxEmLf/sXztCgZkSFy0HkV85JZh
	8ZlT3BvS/+a/4E6fsXtnNeqTjHDmh2zdGskm5p2YN4ks4pd9oXzLX6BvyFxtEz5CG/jA3LBljP2
	/uQozGyjztRfIYervAb59d7taST28p29jqCPPySxUU9vsBUA1NQ==
X-Received: by 2002:a2e:88cd:0:b0:2a8:b076:3877 with SMTP id a13-20020a2e88cd000000b002a8b0763877mr3859005ljk.10.1682478221444;
        Tue, 25 Apr 2023 20:03:41 -0700 (PDT)
X-Google-Smtp-Source: AKy350b8dgbOoKwCv/5NH9dYzFTFpkckqz6KviKVdF+hi1aY6DtqEB8vxxjYVMTshI320AF0wpBhF7yVOeRQbQqRqN0=
X-Received: by 2002:a2e:88cd:0:b0:2a8:b076:3877 with SMTP id
 a13-20020a2e88cd000000b002a8b0763877mr3858993ljk.10.1682478221058; Tue, 25
 Apr 2023 20:03:41 -0700 (PDT)
MIME-Version: 1.0
References: <1ab0beff-8b18-7a94-1a68-6bf36bcd0394@bytedance.com>
 <CACGkMEvh+G2Tm=WDTOK3K2GO8c2dQ4y=UiKAk_kvsid2MGzbGg@mail.gmail.com> <20230425140942.GB697094@fedora>
In-Reply-To: <20230425140942.GB697094@fedora>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 26 Apr 2023 11:03:29 +0800
Message-ID: <CACGkMEvJhoM=BzVUAYaBjdkuAsY2fVijL1p8LzC63F1RGoKC5g@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: zhenwei pi <pizhenwei@bytedance.com>, "Michael S . Tsirkin" <mst@redhat.com>, 
	Cornelia Huck <cohuck@redhat.com>, parav@nvidia.com, virtio-dev@lists.oasis-open.org, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"helei.sig11@bytedance.com" <helei.sig11@bytedance.com>, houp@yusur.tech
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PROPOSAL] Virtio Over Fabrics(TCP/RDMA)

On Tue, Apr 25, 2023 at 10:09=E2=80=AFPM Stefan Hajnoczi <stefanha@redhat.c=
om> wrote:
>
> On Mon, Apr 24, 2023 at 11:40:02AM +0800, Jason Wang wrote:
> > On Sun, Apr 23, 2023 at 7:31=E2=80=AFPM zhenwei pi <pizhenwei@bytedance=
.com> wrote:
> > > I develop an kernel initiator(unstable, WIP version, currently TCP/RD=
MA
> > > supported):
> > > https://github.com/pizhenwei/linux/tree/virtio-of-github
> >
> > A quick glance at the code told me it's a mediation layer that convert
> > descriptors in the vring to the fabric specific packet. This is the
> > vDPA way.
> >
> > If we agree virtio of fabic is useful, we need invent facilities to
> > allow building packet directly without bothering the virtqueue (the
> > API is layout independent anyhow).
>
> I agree. vrings makes sense for RDMA, but I think virtio_fabrics.c
> should not be dependent on vrings.
>
> Linux struct virtqueue is independent of vrings but the implementation
> currently lives in virtio_ring.c because there has never been a
> non-vring transport before.
>
> It would be nice to implement virtqueue_add_sgs() specifically for
> virtio_tcp.c without the use of vrings. Is a new struct
> virtqueue_ops needed with with .add_sgs() and related callbacks?
>
> Luckily the <linux/virtio.h> API already supports this abstraction and
> changes to existing device drivers should be unnecessary or minimal.

That's my understanding.

Btw, I'm also ok if we start with vring and optimize on top.

Thanks

>
> Stefan


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

