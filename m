Return-Path: <virtio-comment-return-5843-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9077CC77B7C
	for <virtio-comment@archiver.kernel.org>; Wed, 10 May 2023 03:52:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B11012AD47
	for <virtio-comment@archiver.kernel.org>; Wed, 10 May 2023 03:52:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7E4539865A1
	for <virtio-comment@archiver.kernel.org>; Wed, 10 May 2023 03:52:10 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 68034986264; Wed, 10 May 2023 03:52:10 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 49C5E98656B
	for <virtio-comment@lists.oasis-open.org>; Wed, 10 May 2023 03:52:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 1fZGKCvvMaCYybxfOc-wsw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683690726; x=1686282726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IvhUZRIKIkBUdL7sRVBp6k1t1uUHbnNTjzH+R3j/EFU=;
        b=aAdttMKqgk+9nB03qsNmCb0wByYv1/mxu40nydzrtEhaANi4pVZ5JIfOHTHUwgdYbS
         A/kACVj3WLfuVF/fwDYXsrfwHKCwjG03b4HfNF3YkHJ3LsEn87u2GZtmVCYn3KMfNGWY
         PY7R7uqpv4MQCQq0xXvvnF07FVcMPajbPA0/DToFT/AK3JGFtSeZncJg/6YFy4g57BcL
         np2iv4Oo1KyBKnvC+2OOcxgUvJfwqY8YJdW9mhIOvWlgI6pfmSltd88EWkk9Ul4YGQKR
         BmTAPc8VCeSYm70L+enddB3yfTIglW5DRUpo6zWmZpPz2IqocsL9aBO11D5Fh68W7/Qw
         xJNQ==
X-Gm-Message-State: AC+VfDyIWbuuk4UHySSLqOpTsukX4sF4pKl4Rl2s30G+uP/GlRtmmF87
	aosBI9HXF1tLwqekBrsY2LHrgb+bUfT6BwYT/TGV5I85jb6scTZWQKPW0cazdD0QennA79QP1By
	CkP/Gd+Me2QPvarykXS9Vr97DqqtJK6/TehDC+LrzhxKIBvqoYw==
X-Received: by 2002:ac2:5969:0:b0:4ea:e799:59f9 with SMTP id h9-20020ac25969000000b004eae79959f9mr1185872lfp.66.1683690726601;
        Tue, 09 May 2023 20:52:06 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5tsBLtAc8ANkSlM/XYho2cOqiCfiWcLkKeLZA2pIT+XFUVMepEcE8LBpUHHa+WP4yI4R3qxwmwZ79ZlIQe56E=
X-Received: by 2002:ac2:5969:0:b0:4ea:e799:59f9 with SMTP id
 h9-20020ac25969000000b004eae79959f9mr1185861lfp.66.1683690726282; Tue, 09 May
 2023 20:52:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230506000135.628899-1-parav@nvidia.com> <CACGkMEt_2B68a+BZ4-vfeDf_eYj5ZhxrDNd6dxuiF85qr0yN2g@mail.gmail.com>
 <20230507093959-mutt-send-email-mst@kernel.org> <CACGkMEtfMbcu2OPsH6P2tA1aHh2FKygv=xkJ-e1XQzb62nE1vQ@mail.gmail.com>
 <b33fe999-8491-30b4-5021-589a2fe87398@nvidia.com> <CACGkMEsSJVG8mzuo3BH1xQzz5TyNbO+o3GcYwoXchcYVOczTTg@mail.gmail.com>
 <PH0PR12MB5481AC52CCAE9636E17C7565DC769@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481AC52CCAE9636E17C7565DC769@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 10 May 2023 11:51:54 +0800
Message-ID: <CACGkMEu1oU0wzygicS0bApoWuRaWkWsPivKRiq-ghezB=hg+Fw@mail.gmail.com>
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
Subject: [virtio-comment] Re: [PATCH v2 0/2] transport-pci: Introduce legacy registers access
 using AQ

On Tue, May 9, 2023 at 11:56=E2=80=AFAM Parav Pandit <parav@nvidia.com> wro=
te:
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Monday, May 8, 2023 11:45 PM
>
> > > The fundamental reason for not accessing the 1.x VF and SIOV device
> > > registers, config space, feature bits through PF is: it requires PF
> > > device mediation. VF and SIOV devices are first class citizen in PCIe
> > > spec and deserve direct interaction with the device.
> >
> > Unless I miss something obvious, SIOV requires mediation (or
> > composition) for sure. Otherwise you break the compatibility.
> >
> SIOV does not require mediation.
> Composition is optional like VFs.

This is not what I read from SIOV spec.

>
> > >
> > > Hence, the transport we built is to consider this in mind for the
> > > coming future.
> >
> > For transport virtqueue, it's not specific to PCI. It could be used in =
a much
> > broader use case.
> >
> May be.
> More below.
>
> > > So if each VF has its own configq, or cmdq, it totally make sense to
> > > me which is bootstrap interface to transport existing config space in=
terface.
> > > The problem is: it is not backward compatible; Hence a device has no
> > > way of when to support both or only new configq.
> >
> > Providing compatibility in software is much more simpler than inventing=
 new
> > hardware interfaces. Isn't it? (e.g if we want to provide compatibility=
 for VF on
> > a SIOV device). And inventing a new hardware interface for compatibilit=
y might
> > not always work, it may break the advantages of the new hardware (like
> > scalability).
> >
> What I proposed below is new hardware interface for new features.
> Not for compatibility.

I'm confused, the proposal is for legacy drives so it's for
compatibility for sure. No?

> Compatibility is coming at a cost which is not scaling.
> If you attempt to scale, it breaks the future path forward to go without =
mediation.
>
> > >
> > > So eve growing these fields and optionally placement on configq
> > > doesn't really help and device builder to build it efficiently
> > > (without much predictability).
> >
> > Config queue is not the only choice, we have a lot of other choices (fo=
r example
> > PASID may help to reduce the on-chip resources).
> >
> PASID is for process isolation security construct, it is not for transpor=
tation.

I meant with PASID you don't even need a BAR.

>
> > >
> > > Instead of we say, that what exists today in config space stays in
> > > config space, anything additional on new q, than its deterministic
> > > behavior to size up the scale.
> >
> > Just to be clear, if we have PCI over adminq, VF's config space could b=
e the
> > minimal one for PCI spec complaint. The real config space is accessed v=
ia the
> > admin virtqueue.
> >
> Yeah I understood what you are saying. We don=E2=80=99t see a path forwar=
d with such mediation.
> VF and PF to have same level of direct access to the device.
>
> > >
> > > For example, a PCI device who wants to support 100 VFs, can easily
> > > size its memory to 30 bytes * 100 reserved for supporting config spac=
e.
> >
> > Those capabilities (30 bytes) can be accessed via admin virtqueue. So w=
e don't
> > need to place them in the config space.
> >
> Same, SIOV and VFs do not prefer mediation going forward in the use cases=
 we come across.

Unless you don't want to provide VF compatibility for SIOV.

>
> > > And new 40 bytes * 100 fields doesn't have to be in the resident memo=
ry.
> > >
> > > If we have optional configq/cmdq for transport, than 30*100 bytes are
> > > used (reserved) as 3000/(30+40) =3D 42 VFs.
> > >
> > > Only if some VFs use configq, more VFs can be deployed.
> >
> > I don't understand here.
> >
> Lets first clarify the non-mediated passthrough model of the VF first tha=
n come to above scale example.
>
> > > It is hard to
> > > build scale this way. Therefore suggestion is to place new attributes
> > > on new config/cmd/transport q, and old to stay as-is.
> >
> > Just to be sure we're on the same page. The proposal of both you and mi=
ne are
> > based on the adminq for PF not VF. The reason is obvious:
> > adminq per VF won't work without PASID, since it would have security is=
sues.
> >
> The current proposal for legacy should be seen as separate and not to int=
ermix with per VF based configuration queue.
>
> adminvq/config/control vq per VF and SIOV both devices will work without =
PASID (unrelated to legacy).
> Because they are like any other queue, such as txq, rxq, cvq. All of thes=
e queues are non-mediated today for PF, VF devices.
> (And so additional configq follows the natural model for config space acc=
ess).

This is only true if:

1) you don't want to provide any backward compatibility for current
PCI transport, this means you need to use new drivers in the guest
2) you don't want to do live migration

If you need one of the above, PASID is a must.

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

