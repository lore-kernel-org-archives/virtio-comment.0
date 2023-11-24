Return-Path: <virtio-comment-return-8587-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8A5C61DF4
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 03:56:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 308B62AEE3
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 03:56:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 126F59868B3
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 03:56:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E90E7986890; Fri, 24 Nov 2023 03:56:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D91D49868A5
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 Nov 2023 03:56:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: hbSIc3HSPjyevyGIXIK-ug-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700798188; x=1701402988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dI1qMxSoB3bY9ka3BAqJDltjLP3l4eK7iUeS57sktW0=;
        b=oaXyq0GnA7aV38mJZ3SjHE/dIOakevPvwl0ntuxGljST2zmGWsS7SEkFyOmtUT+D/Y
         7M+ICFAEvPijGEOQfUtFkHeuoR4Ho14ad+Vrs6TXLy4yYS37J8fSbd+STzlC7x0F9I9d
         hRg73v7D+yPEtBkHzJKrfdITUCAW/PpDnyyDIUKEWRKs5zVHUY2VMW3XFkNEKLGEkPU3
         Xapbp0WqH0UYLLW8brqcE1OoK0VcC8xMaUZmUC87v5YnXFuLm/2P55Gm2glhWtpXtGlW
         4qXkLgsCIEkdbh3hOmtcynYdyKdMH3gG6vDS+BTBPgYqotk/oNeQSp6XRU6sd28W6teT
         gpAg==
X-Gm-Message-State: AOJu0YzOcYh6cNdZzcDcMkrR9xYl/QWRKCsJqtaNFlNDAH0p1mOllYmN
	Bz8vj80AcNW64nEvyXd6Vu8qqWtDuJVbD8edhKKR47H278WxYXBbXOmLBBoRK3j7ItkVUYpAfp3
	zPtq2mF1GVaBbKuJche5dzubwb4K3qdC6PiYk+PoQFL60FdSdJQ==
X-Received: by 2002:a19:f80f:0:b0:50a:6fbe:fec4 with SMTP id a15-20020a19f80f000000b0050a6fbefec4mr700143lff.33.1700798188635;
        Thu, 23 Nov 2023 19:56:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFO9/MM6H+7Ql2flhaD0gopdaRh7dRrloxl5lE7YeGKXltHEmWKVPMitCF5eDHlq+jG0lqNvEnhJgyK17fa8Zc=
X-Received: by 2002:a19:f80f:0:b0:50a:6fbe:fec4 with SMTP id
 a15-20020a19f80f000000b0050a6fbefec4mr700132lff.33.1700798188352; Thu, 23 Nov
 2023 19:56:28 -0800 (PST)
MIME-Version: 1.0
References: <DM8PR12MB548085F25849CF1E055826E6DCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEsfcEjue1UZmuNs8k65o3HSM94VsweSbWLH3383STR97A@mail.gmail.com>
 <PH0PR12MB548149E1E51DA9C1C094ABCADCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEt277yYUHf98dCkypS-PXzu7JrRSVBAQ2cCRg4XzCLPzw@mail.gmail.com>
 <PH0PR12MB5481DB04DEB1A540185ED1ECDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116012208-mutt-send-email-mst@kernel.org> <PH0PR12MB54811F4CE5686AE4BEA826C1DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvU2sqVXAeEUykia2M-6rP1_nMemPH8eNZTEoHR0wUfog@mail.gmail.com>
 <PH0PR12MB5481FEDBA21656E29452AC78DCBBA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEudhoDfY2ZcuA3J0ww=9Pm7qcMRasvZ8CvBeGVL9SPMDw@mail.gmail.com> <20231122024459-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231122024459-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 24 Nov 2023 11:56:16 +0800
Message-ID: <CACGkMEvgwg7hA52gHdgu_i1wtKtRgUjuHWO0xgvpogQBTLbZhw@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, "Zhu, Lingshan" <lingshan.zhu@intel.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Wed, Nov 22, 2023 at 3:48=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Wed, Nov 22, 2023 at 12:13:34PM +0800, Jason Wang wrote:
> > > > What's wrong if we just allow them to be R/W over adminq/cmmands?
> > > >
> > > As explained before,
> > > Each guest has its own dedicated non mediated interface as defined in=
 virtio spec to not involve hypervisor.
> >
> > So what's wrong with inventing per VF queue to do that? For example
> > transport virtqueue.
>
> Nothing is wrong with this.
>
> But what is problematic is just re-using config space for migration becau=
se

It's not a reusing, it works exactly like this proposal:

1) VF config space is assigned to guest
2) using PF queue to migrate

The only difference is the command:

In this proposal, it is

1) virtio_dev_ctx_pci_vq_cfg structure
2) in transport virtqueue, it introduce a set of commands to access
one or several fields on the common cfg

Thanks

> it means we can not just say "don't access device after it is stopped"
> because yes you need to access it to save/restore state.
> And a new interface over admin cmds just for this side-steps the
> issue nicely.
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

