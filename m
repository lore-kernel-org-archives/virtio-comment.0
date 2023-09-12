Return-Path: <virtio-comment-return-7329-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3344CCA0ED5
	for <virtio-comment@archiver.kernel.org>; Tue, 12 Sep 2023 04:18:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2CE4366DC7
	for <virtio-comment@archiver.kernel.org>; Tue, 12 Sep 2023 04:18:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A86A3986630
	for <virtio-comment@archiver.kernel.org>; Tue, 12 Sep 2023 04:18:39 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 99FEA986485; Tue, 12 Sep 2023 04:18:39 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8541898666F
	for <virtio-comment@lists.oasis-open.org>; Tue, 12 Sep 2023 04:18:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: -PWgR-OIOa6fimuqfwEH9Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694492315; x=1695097115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SuvK1EMvT6qeTKE901d8UUQo7Wj7N1+c63nvel2kBMo=;
        b=YtWW9kMpjq8gYXKLLSInzEjTgEAPkUVksmJavzMqGtexc5Rdq20gsT7guNa16hqjxS
         d3+RQ4P4BbLeXN5SE07H2ly027JqNvo1nu9bvMa9fPMM7IUpH0xJKPiuAdn/X24WV0/v
         GaBGMqxKmI942DrdWUUaBpVzfA37t++xR8s998ZI2ccBUITMEbdsWr1HLE3KCtGYqK13
         qKoeHVYm0g/4mtaHVQBeF3GmfDBxn/KBzOH9gbXk5GSMwURzAmE0DQC23axh0Jcbbbw0
         i1MoDXTeyhHJF+SBmA+1pbMuYopbSC6Qc71r9uJnO1jhokIG2JjsBhVIxVJPkpzVQNKP
         ORgA==
X-Gm-Message-State: AOJu0YyIuTug/PlpV3GlgYoRWd5wTWvG9DvL5TjRHpXC59WwkZxKB4aJ
	OlhB05CkCvFwFcQdl7tVNCNP5QQ3WRL8XlhiOid+3shdJj86W8XNdVNI5T/GD8tEr31BtLILpuU
	2l+YU4HXLpL8bJoVBCs6+6FK9HYabRmpY9/bt2N7zPL9pW+9k/w==
X-Received: by 2002:a05:6512:488a:b0:501:b97a:9f50 with SMTP id eq10-20020a056512488a00b00501b97a9f50mr8576986lfb.65.1694492315072;
        Mon, 11 Sep 2023 21:18:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1wh+5G9lxhX+H7/TzNIG885+g3NS4ja5cXlPJ3LCAIVjTXfjU++nh24LvhOBO7E3Z4XVa5QL5zuMzEnxJp64=
X-Received: by 2002:a05:6512:488a:b0:501:b97a:9f50 with SMTP id
 eq10-20020a056512488a00b00501b97a9f50mr8576967lfb.65.1694492314662; Mon, 11
 Sep 2023 21:18:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230906081637.32185-1-lingshan.zhu@intel.com>
 <20230906081637.32185-6-lingshan.zhu@intel.com> <20230906043016-mutt-send-email-mst@kernel.org>
 <CACGkMEu4R_nUFmpoNesmjJ-PtoE5brpWh8NLruWhEWycm2K4yg@mail.gmail.com>
 <PH0PR12MB5481A50B1B13CE1756B98D0DDCF2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtMmwWGJDYe5BLvLCcetThv-yfPR2QbphNuuh+bp-+ikg@mail.gmail.com> <PH0PR12MB5481ED8DC23DC6D42665FB8EDCF2A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481ED8DC23DC6D42665FB8EDCF2A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 12 Sep 2023 12:18:23 +0800
Message-ID: <CACGkMEt9ATuU_OwtE_9rF1XHKCd9GavWCHx6_dFXCZibMKzJjA@mail.gmail.com>
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

On Mon, Sep 11, 2023 at 2:47=E2=80=AFPM Parav Pandit <parav@nvidia.com> wro=
te:
>
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Monday, September 11, 2023 12:01 PM
> >
> > On Mon, Sep 11, 2023 at 12:12=E2=80=AFPM Parav Pandit <parav@nvidia.com=
> wrote:
> > >
> > > Hi Michael,
> > >
> > > > From: virtio-comment@lists.oasis-open.org
> > > > <virtio-comment@lists.oasis- open.org> On Behalf Of Jason Wang
> > > > Sent: Monday, September 11, 2023 8:31 AM
> > > >
> > > > On Wed, Sep 6, 2023 at 4:33=E2=80=AFPM Michael S. Tsirkin <mst@redh=
at.com>
> > wrote:
> > > > >
> > > > > On Wed, Sep 06, 2023 at 04:16:37PM +0800, Zhu Lingshan wrote:
> > > > > > This patch adds two new le16 fields to common configuration
> > > > > > structure to support VIRTIO_F_QUEUE_STATE in PCI transport laye=
r.
> > > > > >
> > > > > > Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> > > > >
> > > > >
> > > > > I do not see why this would be pci specific at all.
> > > >
> > > > This is the PCI interface for live migration. The facility is not s=
pecific to PCI.
> > > >
> > > > It can choose to reuse the common configuration or not, but the
> > > > semantic is general enough to be used by other transports. We can
> > > > introduce one for MMIO for sure.
> > > >
> > > > >
> > > > > But besides I thought work on live migration will use admin queue=
.
> > > > > This was explicitly one of the motivators.
> > > >
> > > Please find the proposal that uses administration commands for device
> > migration at [1] for passthrough devices.
> > >
> > > [1]
> > > https://lists.oasis-open.org/archives/virtio-comment/202309/msg00061.=
h
> > > tml
> >
> > This proposal couples live migration with several requirements, and suf=
fers from
> > the exact issues I've mentioned below.
> >
> It does not.
> Can you please list which one?
>
> > In some cases, it's even worse (coupling with PCI/SR-IOV, second state =
machine
> > other than the device status).
> >
> There is no state machine in [1].

Isn't the migration modes of "active, stop, freeze" a state machine?

> It is not coupled with PCI/SR-IOV either.
> It supports PCI/SR-IOV transport and in future other transports too when =
they evolve.
>

For example:

+struct virtio_dev_ctx_pci_vq_cfg {
+ le16 vq_index;
+        le16 queue_size;
+        le16 queue_msix_vector;
+ le64 queue_desc=C3=8D
+        le64 queue_driver=C3=8D
+        le64 queue_device=C3=8D
+};
+\end{lstlisting}

And does this mean we will have commands for MMIO and other transport?
(Most of the fields except the msix are general enough). And it's just
a partial implementation of the queue related functionality of the
common cfg, so I wonder how it can work.

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

