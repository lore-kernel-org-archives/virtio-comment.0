Return-Path: <virtio-comment-return-7328-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB744CA0EC3
	for <virtio-comment@archiver.kernel.org>; Tue, 12 Sep 2023 04:10:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 58C112236B
	for <virtio-comment@archiver.kernel.org>; Tue, 12 Sep 2023 04:10:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4F99998663F
	for <virtio-comment@archiver.kernel.org>; Tue, 12 Sep 2023 04:10:48 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 46447986490; Tue, 12 Sep 2023 04:10:48 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3862D9864A4
	for <virtio-comment@lists.oasis-open.org>; Tue, 12 Sep 2023 04:10:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: uDnoErBAO-2ipPCM024KqA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694491838; x=1695096638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wq8Hc0alkbdHW3+INYdNnvFkAqGCe1aKNNsQgH6vSYc=;
        b=gkaKOIx7fIoLk6ax6gOcBUx+HOc7n3F0GH8LUhg2nNbYKXybhdir8iGkGY3JVWstWu
         xTZrQ4vx6UVZ152wv3tnGoKA5eTrw4Db8RMAwGeLmmlmuyrPfP6rTEqVN5KnuKs3UU0S
         x9ZcA2opOaQS2zCpDSKAdrjHp0wmZOTD/fgAdLza5F85TSJ/7gQ5VTlzqiMIhx9t3GF6
         KiPzCvMLo2v2ygEku8YROcmrqdNzbThOfypoDsVes3Kip5BX8ucJsk6A81XBNA9PbUrc
         eZnP6GrX4FO/SgJH/AYk4v6hd9rXfugfnPSSwSRCZyj75XFPaNMQPs8m0AdiVr3a5Trq
         5ruw==
X-Gm-Message-State: AOJu0YzHzxb7n63lCiOv7YVwVI+dLZPt7SaOrd/QldBiv9/RBlv5eMLK
	JWTjLbSIZDMR5a8Zpyezde5A6fVp7ILrPi41e3IgsfyDm0eQaCHS65a8L0Q6MNQ8N2S9Us6Zpc5
	kMhfz/OvZ7taSQ3kNN1snJmf1UMoAT4Kjr+6nvkZf+5+uiMVFSg==
X-Received: by 2002:a05:6512:3482:b0:502:d35b:5058 with SMTP id v2-20020a056512348200b00502d35b5058mr167885lfr.4.1694491838303;
        Mon, 11 Sep 2023 21:10:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFi0y558CFQn08AYHp35OrhyJ4TKMg34EVB8hoibWZ9Fv3P03Fkzzf/nVTa5cMddnO2B/v2YEhqexgTuoeMQjM=
X-Received: by 2002:a05:6512:3482:b0:502:d35b:5058 with SMTP id
 v2-20020a056512348200b00502d35b5058mr167879lfr.4.1694491838019; Mon, 11 Sep
 2023 21:10:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230906081637.32185-1-lingshan.zhu@intel.com>
 <20230906081637.32185-6-lingshan.zhu@intel.com> <20230906043016-mutt-send-email-mst@kernel.org>
 <CACGkMEu4R_nUFmpoNesmjJ-PtoE5brpWh8NLruWhEWycm2K4yg@mail.gmail.com>
 <PH0PR12MB5481A50B1B13CE1756B98D0DDCF2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtMmwWGJDYe5BLvLCcetThv-yfPR2QbphNuuh+bp-+ikg@mail.gmail.com>
 <PH0PR12MB5481ED8DC23DC6D42665FB8EDCF2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <eb6c350e-1198-7d83-a553-99c9c8c21edc@intel.com> <PH0PR12MB5481760E00AD18DB8BF91636DCF2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <ad1dd3a6-7c11-5c6b-b50f-d608ec027dcd@intel.com> <PH0PR12MB54819C4A4220712DCD57AD56DCF2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fff7720f-6019-bd87-b14b-c0bf996f3959@intel.com> <PH0PR12MB5481D11A7DF45292103D9290DCF2A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481D11A7DF45292103D9290DCF2A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 12 Sep 2023 12:10:26 +0800
Message-ID: <CACGkMEt6=AC4pYEoxNn2dpbLLEKTLj-SYV2eSUAi1ZA1LWR3qg@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	"eperezma@redhat.com" <eperezma@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>, 
	"stefanha@redhat.com" <stefanha@redhat.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH 5/5] virtio-pci: implement VIRTIO_F_QUEUE_STATE

>
> > Why this series can not support nested?
> I don=E2=80=99t see all the aspects that I covered in series [1] ranging =
from flr, device context migration, virtio level reset, dirty page tracking=
, p2p support, etc. covered in some device, vq suspend resume piece.
>
> [1] https://lists.oasis-open.org/archives/virtio-comment/202309/msg00061.=
html

The series works for stateless devices. Before we introduce device
states in the spec, we can't migrate stateful devices. So the device
context doesn't make much sense right now.

Dirty page tracking in virtio is not a must for live migration to
work. It can be done via platform facilities or even software. And to
make it more efficient, it needs to utilize transport facilities
instead of a general one.

The FLR, P2P demonstrates the fragility of a simple passthrough method
and how it conflicts with live migration and complicates the device
implementation. And it means you need to audit all PCI features and do
workaround if there're any possible issues (or using a whitelist).
This is tricky and we are migrating virtio not virtio-pci. If we don't
use simple passthrough we don't need to care about this.

Since the functionality proposed in this series focus on the minimal
set of the functionality for migration, it is virtio specific and self
contained so nothing special is required to work in the nest.

Thanks

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

