Return-Path: <virtio-comment-return-7385-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A9ACA0ED1
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Sep 2023 04:44:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0B0152118C
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Sep 2023 04:44:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DFB8A986637
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Sep 2023 04:44:09 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id CE2E298403A; Wed, 13 Sep 2023 04:44:09 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BC919986630
	for <virtio-comment@lists.oasis-open.org>; Wed, 13 Sep 2023 04:44:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: D0za2Ns-PMKV2L6uFI6tKQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694580245; x=1695185045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5SlvEAlZZiITc30O3DKiypG6JE2qMXp3x9vVY54N1Lg=;
        b=kURktxlu32nyFpSf4fQ1vfqe/Wxs3iwpzk1Igp7txhWnFDrpvvBoiqfQT93qXw/mTl
         Rf++g/G4vX3wQuNDj86gBQca0qF44Uya9DDthCJ2dD7ShW+ryZyVuXGgrf/KBSJpFISY
         mDrnC5qxHusGGs382JC++bLSFsgZVHHY7U9Rpx+hI51GoFzDPkmOWEiADjdMFhTe3AWt
         COIlMWs20YEK7+63IsHcpZEHfHKXbqZdZsGnwVn2l2ai04srutKPDC4DZiftfU326zmR
         ImF8rJkIN3vUoUnvT41syVTcX6lV4fmEp62NK5IJ+dmpAbMgbc4PwfkwPcX/HMKowsig
         xx+g==
X-Gm-Message-State: AOJu0Yw0YW4/eJqqyUnhIVLIujTCvAbZKQEmk107/3o966kQ1uJA1M0s
	In2eInkA8e2SgRZjZkiA7wsYG6NwNG50ccFTuNL+fbMoP+dgOdUw6vKxOhPPUON8ajHVrDI724V
	BWH7QPAN2XAVHlzLlV8STZqzMA9enHFULfniWq3zFzyLXM3JCLQ==
X-Received: by 2002:a19:c50e:0:b0:4fd:c715:5667 with SMTP id w14-20020a19c50e000000b004fdc7155667mr973540lfe.20.1694580245478;
        Tue, 12 Sep 2023 21:44:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlLxFdEy4QH5JLUg2VFM8iyUEPzql0CPkGbu34eDGoeRc4SfHQDqpjBim1s8LgBW/ublkdSkYkSES6s84LlHY=
X-Received: by 2002:a19:c50e:0:b0:4fd:c715:5667 with SMTP id
 w14-20020a19c50e000000b004fdc7155667mr973524lfe.20.1694580245162; Tue, 12 Sep
 2023 21:44:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230906081637.32185-1-lingshan.zhu@intel.com>
 <20230906081637.32185-6-lingshan.zhu@intel.com> <20230906043016-mutt-send-email-mst@kernel.org>
 <CACGkMEu4R_nUFmpoNesmjJ-PtoE5brpWh8NLruWhEWycm2K4yg@mail.gmail.com>
 <PH0PR12MB5481A50B1B13CE1756B98D0DDCF2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtMmwWGJDYe5BLvLCcetThv-yfPR2QbphNuuh+bp-+ikg@mail.gmail.com>
 <PH0PR12MB5481ED8DC23DC6D42665FB8EDCF2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEt9ATuU_OwtE_9rF1XHKCd9GavWCHx6_dFXCZibMKzJjA@mail.gmail.com> <PH0PR12MB5481D538B4F3F76B393C5757DCF1A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481D538B4F3F76B393C5757DCF1A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 13 Sep 2023 12:43:53 +0800
Message-ID: <CACGkMEs+5AjGzeDbWZYSkOMw65d6g6oDfgbOapa1G3EbtLUy7A@mail.gmail.com>
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

On Tue, Sep 12, 2023 at 2:11=E2=80=AFPM Parav Pandit <parav@nvidia.com> wro=
te:
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Tuesday, September 12, 2023 9:48 AM
> >
> > On Mon, Sep 11, 2023 at 2:47=E2=80=AFPM Parav Pandit <parav@nvidia.com>=
 wrote:
> > >
> > >
> > >
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Monday, September 11, 2023 12:01 PM
> > > >
> > > > On Mon, Sep 11, 2023 at 12:12=E2=80=AFPM Parav Pandit <parav@nvidia=
.com>
> > wrote:
> > > > >
> > > > > Hi Michael,
> > > > >
> > > > > > From: virtio-comment@lists.oasis-open.org
> > > > > > <virtio-comment@lists.oasis- open.org> On Behalf Of Jason Wang
> > > > > > Sent: Monday, September 11, 2023 8:31 AM
> > > > > >
> > > > > > On Wed, Sep 6, 2023 at 4:33=E2=80=AFPM Michael S. Tsirkin
> > > > > > <mst@redhat.com>
> > > > wrote:
> > > > > > >
> > > > > > > On Wed, Sep 06, 2023 at 04:16:37PM +0800, Zhu Lingshan wrote:
> > > > > > > > This patch adds two new le16 fields to common configuration
> > > > > > > > structure to support VIRTIO_F_QUEUE_STATE in PCI transport =
layer.
> > > > > > > >
> > > > > > > > Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> > > > > > >
> > > > > > >
> > > > > > > I do not see why this would be pci specific at all.
> > > > > >
> > > > > > This is the PCI interface for live migration. The facility is n=
ot specific to
> > PCI.
> > > > > >
> > > > > > It can choose to reuse the common configuration or not, but the
> > > > > > semantic is general enough to be used by other transports. We
> > > > > > can introduce one for MMIO for sure.
> > > > > >
> > > > > > >
> > > > > > > But besides I thought work on live migration will use admin q=
ueue.
> > > > > > > This was explicitly one of the motivators.
> > > > > >
> > > > > Please find the proposal that uses administration commands for
> > > > > device
> > > > migration at [1] for passthrough devices.
> > > > >
> > > > > [1]
> > > > > https://lists.oasis-open.org/archives/virtio-comment/202309/msg00=
0
> > > > > 61.h
> > > > > tml
> > > >
> > > > This proposal couples live migration with several requirements, and
> > > > suffers from the exact issues I've mentioned below.
> > > >
> > > It does not.
> > > Can you please list which one?
> > >
> > > > In some cases, it's even worse (coupling with PCI/SR-IOV, second
> > > > state machine other than the device status).
> > > >
> > > There is no state machine in [1].
> >
> > Isn't the migration modes of "active, stop, freeze" a state machine?
> >
> Huh, no. Each mode stops/starts specific thing.
> Just because one series is missing this and did only suspend/resume and o=
ther series covered P2P mode with modes, it does not make it state machine.
> If you call suspend resume as states, it is still 2 state state machines.=
 :)

It's not about how many states in a single state machine, it's about
how many state machines that exist for device status. Having more than
one creates big obstacles and complexity in the device. You need to
define the interaction of each state otherwise you leave undefined
behaviours.

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

