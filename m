Return-Path: <virtio-comment-return-7303-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C895DEE7FF4
	for <virtio-comment@archiver.kernel.org>; Mon, 11 Sep 2023 06:30:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1FD217B508
	for <virtio-comment@archiver.kernel.org>; Mon, 11 Sep 2023 06:30:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 080C0986466
	for <virtio-comment@archiver.kernel.org>; Mon, 11 Sep 2023 06:30:47 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E7FA398635C; Mon, 11 Sep 2023 06:30:46 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D56729863B6
	for <virtio-comment@lists.oasis-open.org>; Mon, 11 Sep 2023 06:30:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 49BOhypMN6Ob89Y4zTUIKw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694413842; x=1695018642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zs6opqtgpDNVgyyoPb5IDKMXXIryVQLxq3I5A/AjfQg=;
        b=FzY0fg1lp5/WRZ4umrDUWe2B0eRUCNewcbhXoamVV0f53JIHsCm7OIVS6rHQaGjeid
         QHpI6RK++7EiP5tmCfikVNa6+IoR7v622sypSJT5naa2YS5thc5ICgcLNkHum67Jkjra
         DG+tqwqymzS6LUXfc6tU8nCbCWvTe7h7QcafKJmKjiap61qrPcsLO8JvMOE/nWS0Mijp
         RKszPtEHjZhKvx2LnN2Dankyc0vIaeT5ZAh9/Rek3JzK0xK8Ae5uoTcPbGaJvQhorDYR
         q2x7LaMWx63yY6FxPxRVum2Dz2fUd9w/TkJFn0imwJtXFO9DX19Q9cbug4NYBM+Z8Q5w
         RHfA==
X-Gm-Message-State: AOJu0YwRXnPecgUacsqQPolguBzHHfnHvVPotEWFwLVAvDzs3yqXreJt
	SO+rXQs48Q3bUr77xsd5/w3yx4dfx2YGaFrtvRe4EkxJZF63QvX+A6KxZxbzWh7MA1hKn6RK/hW
	8R7Kbey6vc87teLqhVymX7xukIusZKCljP3ETfotVtnwev1PbCQ==
X-Received: by 2002:a05:6512:239e:b0:4f8:4512:c846 with SMTP id c30-20020a056512239e00b004f84512c846mr8195845lfv.49.1694413842687;
        Sun, 10 Sep 2023 23:30:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE77Emf1/xwl41eUsNG+hRogwnpcthgoltjJZmC+PL0mzwqljAh+hSZyo541WOIoLIXYXryn9mb23XA9rlOj7c=
X-Received: by 2002:a05:6512:239e:b0:4f8:4512:c846 with SMTP id
 c30-20020a056512239e00b004f84512c846mr8195820lfv.49.1694413842325; Sun, 10
 Sep 2023 23:30:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230906081637.32185-1-lingshan.zhu@intel.com>
 <20230906081637.32185-6-lingshan.zhu@intel.com> <20230906043016-mutt-send-email-mst@kernel.org>
 <CACGkMEu4R_nUFmpoNesmjJ-PtoE5brpWh8NLruWhEWycm2K4yg@mail.gmail.com> <PH0PR12MB5481A50B1B13CE1756B98D0DDCF2A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481A50B1B13CE1756B98D0DDCF2A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 11 Sep 2023 14:30:31 +0800
Message-ID: <CACGkMEtMmwWGJDYe5BLvLCcetThv-yfPR2QbphNuuh+bp-+ikg@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
	"eperezma@redhat.com" <eperezma@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>, 
	"stefanha@redhat.com" <stefanha@redhat.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH 5/5] virtio-pci: implement VIRTIO_F_QUEUE_STATE

On Mon, Sep 11, 2023 at 12:12=E2=80=AFPM Parav Pandit <parav@nvidia.com> wr=
ote:
>
> Hi Michael,
>
> > From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
> > open.org> On Behalf Of Jason Wang
> > Sent: Monday, September 11, 2023 8:31 AM
> >
> > On Wed, Sep 6, 2023 at 4:33=E2=80=AFPM Michael S. Tsirkin <mst@redhat.c=
om> wrote:
> > >
> > > On Wed, Sep 06, 2023 at 04:16:37PM +0800, Zhu Lingshan wrote:
> > > > This patch adds two new le16 fields to common configuration
> > > > structure to support VIRTIO_F_QUEUE_STATE in PCI transport layer.
> > > >
> > > > Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> > >
> > >
> > > I do not see why this would be pci specific at all.
> >
> > This is the PCI interface for live migration. The facility is not speci=
fic to PCI.
> >
> > It can choose to reuse the common configuration or not, but the semanti=
c is
> > general enough to be used by other transports. We can introduce one for
> > MMIO for sure.
> >
> > >
> > > But besides I thought work on live migration will use admin queue.
> > > This was explicitly one of the motivators.
> >
> Please find the proposal that uses administration commands for device mig=
ration at [1] for passthrough devices.
>
> [1] https://lists.oasis-open.org/archives/virtio-comment/202309/msg00061.=
html

This proposal couples live migration with several requirements, and
suffers from the exact issues I've mentioned below.

In some cases, it's even worse (coupling with PCI/SR-IOV, second state
machine other than the device status).

>
>  > I think not. Using admin virtqueue will end up with several problems:
> >
> > 1) the feature is not self contained so at the end we need transport sp=
ecific
> > facility to migrate the admin virtqueue
>
> You mixed up.
> Admin queue of the owner device is not migrated.

Why not? Ling Shan's proposal makes everything work including
migrating the owner or in the case there's even no owner.

In this proposal, the facility (suspending, queue state, inflight
descriptors) is decoupled from the transport specific API. Each
transport can implement one or more types of interfaces. A MMIO based
interface is proposed but It doesn't prevent you from adding admin
commands for those facilities on top.

> Admin queue of the member device is migrated like any other queue using a=
bove [1].
>
> > 2) won't work in the nested environment, or we need complicated SR-IOV
> > emulation in order to work
> >
> > >
> > > Poking at the device from the driver to migrate it is not going to
> > > work if the driver lives within guest.
> >
> > This is by design to allow live migration to work in the nested layer.
> > And it's the way we've used for CPU and MMU. Anything may virtio differ=
ent
> > here?
>
> Nested and non-nested use cases likely cannot be addressed by single solu=
tion/interface.

I think Ling Shan's proposal addressed them both.

> So both are orthogonal requirements to me.
>
> One can defined some administration commands to issue on the AQ of the me=
mber device itself for nested case.

This is not easy, DMA needs to be isolated so this means you need to
either emulate SR-IOV and use AQ on virtual PF in the guest or using
PASID.

Customers don't want to have admin stuff, SR-IOV or PASID in the guest
in order to migrate a single virtio device in the nest.

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

