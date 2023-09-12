Return-Path: <virtio-comment-return-7323-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 449CACA0EC3
	for <virtio-comment@archiver.kernel.org>; Tue, 12 Sep 2023 03:35:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 75FFE26A3A
	for <virtio-comment@archiver.kernel.org>; Tue, 12 Sep 2023 03:35:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 50CFD9865A1
	for <virtio-comment@archiver.kernel.org>; Tue, 12 Sep 2023 03:35:31 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2D46C9843C1; Tue, 12 Sep 2023 03:35:31 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 767C398648C
	for <virtio-comment@lists.oasis-open.org>; Tue, 12 Sep 2023 03:35:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Le1jctgpN5mgr6C1BZXZEQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694489719; x=1695094519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6YDIIoPvcAq7I9D9J0yrVbl7SoUjdSy+1KyVvnxyNDc=;
        b=SSwu2043dpPYio+7Al1jxemjpON/DGOjZqRXJTNzv5XMhs2vSnUNayddo70WMA87QG
         YL22CeEhTZxWO93K12C2vQ66vZQNGgUiQqWjkNtMRzibJG2ry6A37uXm9hrOP4RRL6O1
         V+nGqS41hrgDbIZi2MlC73jSej5wf/hs9g6h7HK5lFzGqJvdBiFlqZA8+D2X8Kgezy2c
         T0QIh2sqO7REYeccs8o+3zuLc6EdG6wgoAJzVyCfqlVVyQxW1jid6fNgPMIp8CyytRWL
         HfgQ6W7y2EIh2QWOblN7NgzMIQ7WVgQ5fBRx7CazClAXrhCS49JqVDDkLQmif6Qf8kfQ
         aUMw==
X-Gm-Message-State: AOJu0YzG9hMxutefuhsNPAILsWRcufSCJMzA1DF6mFlj1PVRGkCr1NMG
	IAyjg+jZ/AcqUzHwudi9Gqsm3pQGK/t8/HtByI7LmQ8AtaNE3260zXo53TAq3lGQu2ln8NpTJhP
	Eji2PdlwfNrQmMSJixVRl3mZbvpFNRK1/isUsNIAWzh2km6bLZg==
X-Received: by 2002:a19:6707:0:b0:500:b891:779b with SMTP id b7-20020a196707000000b00500b891779bmr8684487lfc.51.1694489719765;
        Mon, 11 Sep 2023 20:35:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwfi0/gsq3dZ1QlsE81lZyGXOWqO49A0vC78MnQ5KJu3ycxIlXtK8sKCw1ARjr244abyI0DIYUftXpIB+oSjw=
X-Received: by 2002:a19:6707:0:b0:500:b891:779b with SMTP id
 b7-20020a196707000000b00500b891779bmr8684444lfc.51.1694489719485; Mon, 11 Sep
 2023 20:35:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230906081637.32185-1-lingshan.zhu@intel.com>
 <20230906081637.32185-6-lingshan.zhu@intel.com> <20230906043016-mutt-send-email-mst@kernel.org>
 <CACGkMEu4R_nUFmpoNesmjJ-PtoE5brpWh8NLruWhEWycm2K4yg@mail.gmail.com>
 <PH0PR12MB5481A50B1B13CE1756B98D0DDCF2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtMmwWGJDYe5BLvLCcetThv-yfPR2QbphNuuh+bp-+ikg@mail.gmail.com> <20230911061236-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230911061236-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 12 Sep 2023 11:35:08 +0800
Message-ID: <CACGkMEsXadEnJoNWtg8wRmuQkL=NXMfzoXzVFPLGgK+PuuG3+Q@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
	"eperezma@redhat.com" <eperezma@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>, 
	"stefanha@redhat.com" <stefanha@redhat.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH 5/5] virtio-pci: implement VIRTIO_F_QUEUE_STATE

On Mon, Sep 11, 2023 at 6:15=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Mon, Sep 11, 2023 at 02:30:31PM +0800, Jason Wang wrote:
> > Customers don't want to have admin stuff, SR-IOV or PASID in the guest
> > in order to migrate a single virtio device in the nest.
>
> Built an alternative facility to implement admin commands then.

I wonder if it could be built in an efficient way. For example the
length of admin commands is not fixed and we don't want to grow MMIO
areas as the admin command, this will result in something like
VIRTIO_PCI_CAP_PCI_CFG which is sub-optimal (much more registers
accesses than simply introducing new fields in common cfg).

> The advantage of admin commands is they are nicely contained.

If it want to be contained it needs to duplicate the functionality of
the existing facilities like common cfg and others (one example is to
setup the virtqueue after migration). Otherwise during live migration,
we will use both admin commands and existing configuration structure
which will end up with more issues.

As stated before, the best way is to decouple the basic facilities
(states like index, inflight, dirty page) from a specific
interface/transport and keep the flexibility at the transport layer.
Transport layer can choose to stick to the existing interfaces or
implement the admin commands. So we can have two ways in parallel:

1) live migration via the existing transport specific facilities, this
allows us to reuse the existing interfaces with minimal extensions or
take the advantages of the transport specific facilities like PASID
2) live migration via admin commands, but it needs to invent commands
to access existing facilities which is just a new transport interface
that LingShan is work (transport over admin commands)

Instead of focusing on a solution that only works for a specific setup
on a specific transport.

Thanks

> This proposal is way too intrusive.
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

