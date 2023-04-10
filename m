Return-Path: <virtio-comment-return-5329-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA298C77B61
	for <virtio-comment@archiver.kernel.org>; Mon, 10 Apr 2023 06:20:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 01F9AB85
	for <virtio-comment@archiver.kernel.org>; Mon, 10 Apr 2023 06:20:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EA2E098632A
	for <virtio-comment@archiver.kernel.org>; Mon, 10 Apr 2023 06:20:30 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DAE47984216; Mon, 10 Apr 2023 06:20:30 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CAAF19862A5
	for <virtio-comment@lists.oasis-open.org>; Mon, 10 Apr 2023 06:20:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: aXfJojp3Nm-9PciMEds9Cg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681107627; x=1683699627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gQFO1bMA7Kgv2xL5DEouetN0N//LrjsKoKYuczpNxFM=;
        b=BfnNBnFd82H3Oe/D1fAvdOUaOfPq+9+RbJgsXGfZjI4eZemuRBd1x/lcQ1ztr/a2Ib
         Ohtu3jZ8S8t06oFbvugaEvNgOKUJ+svlyoUfVfFBd80lhYbIHJDzScnFph3wLaK/bI/p
         GQDP12NAhL6z+FpVhviA6wKczNHlGXGTUSq2MC4aRa32epd08+2UNX95Fmw40EqEGOTx
         1q7YHxP/QFbnRzHwvttLncEsBnv8bEmcxHL9kHbgeLCp3BnWUGDbuykOK6XwMl7BzWHq
         AqUvAgDDR9vOyre9BKua1joiDmgBwdBFxV656c2QNcBNvhwKMcG6vaRL4FgZhAXfDHwx
         umzA==
X-Gm-Message-State: AAQBX9e+v7aOcJj6wAob+d0WMIyXDDFqeAi9KXSXp1Yz6USQ75Lv4yUB
	Bl5cgmvJ2O9zBxChVqJbDYm1dBvNSgm+ShIh5TtDb4XYBAjUKdB0CCs2Y+lKx1BNyH1J1exV4Ys
	6yqU8pwTd4LZA8BS3XAByeBs0AcX1FV8nXNsUt7FFUNW1p9bXeQ==
X-Received: by 2002:a05:6870:6587:b0:17f:1723:fc82 with SMTP id fp7-20020a056870658700b0017f1723fc82mr4777739oab.9.1681107627668;
        Sun, 09 Apr 2023 23:20:27 -0700 (PDT)
X-Google-Smtp-Source: AKy350YJdlIqWpsQC0sebHj85pAPO8SRWJDhR62UTB7MEA4Qxk7uLxGq0heW2g9rA1Ux10vRZuPYvHmhKCwi0bvpt0Q=
X-Received: by 2002:a05:6870:6587:b0:17f:1723:fc82 with SMTP id
 fp7-20020a056870658700b0017f1723fc82mr4777720oab.9.1681107627480; Sun, 09 Apr
 2023 23:20:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230330225834.506969-1-parav@nvidia.com> <20230330225834.506969-10-parav@nvidia.com>
 <20230407043841-mutt-send-email-mst@kernel.org> <CACGkMEtkOdwixxaRz2Pv9xP75vb13ncboX5XRs8NqFCUsS16aQ@mail.gmail.com>
 <20230410020906-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230410020906-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 10 Apr 2023 14:20:16 +0800
Message-ID: <CACGkMEtiROwuB+ECJqd13qdpMJSTMoDOzi1u_i85==42C0XSXw@mail.gmail.com>
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

On Mon, Apr 10, 2023 at 2:15=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Mon, Apr 10, 2023 at 09:33:32AM +0800, Jason Wang wrote:
> > This is fine for vDPA but not for virtio if the design can only work
> > for some specific setups (OSes/archs).
> >
> > Thanks
>
> Well virtio legacy has a long history of documenting existing hacks :)

Exactly, so the legacy behaviour is not (or can't be) defined by the
spec but the codes.

> But yes, VIRTIO_F_ORDER_PLATFORM has to be documented.
> And we have to decide what to do about ACCESS_PLATFORM since
> there's a security problem if device allows not acking it.
> Two options:
> - relax the rules a bit and say device will assume ACCESS_PLATFORM
>   is acked anyway

This will break legacy drivers which assume physical addresses.

> - a new flag that is insecure (so useful for sec but useless for dpdk) bu=
t optional

This looks like a new "hack" for the legacy hacks.

And what about ORDER_PLATFORM, I don't think we can modify legacy drivers..=
.

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

