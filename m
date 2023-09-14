Return-Path: <virtio-comment-return-7413-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 922CFEE0213
	for <virtio-comment@archiver.kernel.org>; Thu, 14 Sep 2023 03:12:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0943B2AEDD
	for <virtio-comment@archiver.kernel.org>; Thu, 14 Sep 2023 03:12:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E97A998664C
	for <virtio-comment@archiver.kernel.org>; Thu, 14 Sep 2023 03:12:23 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E002E983D42; Thu, 14 Sep 2023 03:12:23 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D18E4986640
	for <virtio-comment@lists.oasis-open.org>; Thu, 14 Sep 2023 03:12:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: nVKfBcwdOq-ot1yLonxpHw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694661140; x=1695265940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gGk0P8mrZhXfKqNTrvvfQbQy7vK6KMnwGnSgheVxUvw=;
        b=AlZS8MuuTtpCHagiuA1XEwUfbUuDKLfDoQo+XgFYK+B5nE+M3uugCUqrxwWLL4fTZo
         5ZvnbZ/Dr6XRSt7Nu6LitYXT50CLzWVebZlDIwgNJINLtJf9axCDv6Mss0dUecIfY4iA
         nKCRwyq/YixLrACfQm9d+nG0ox/Hz3g5JhgzG4rEEWAtCy+91PIvGbaO3I08TzV6Gyhz
         LJprpTTsSseR21r075fh1MEKdyv2iMnT77jSUWKar/8KCBRqO7bZl1O1cS3snDfAJC4b
         QMFXl3/DlhGnt5Z8ldngoTRYNmk8DlO853/FYtPyGFFdCmFhM9jch0MdqFNzyhsTHH2I
         h5zQ==
X-Gm-Message-State: AOJu0Yy2Gkge1TeuJa6/4+55lc4ud24kPC83/IgM0Gpz72WGAOxkaxHw
	QlP/UBrgKfMEirFQD+DQ7wp1bIxxLgc5oXIeOnr82y/RtX4zGG5opr5Z0/N1W53BkII4MqCJrFf
	SI8FiqcGlTugo/St54rsqjhAM9vawVk4xuecfi1dzDn6stEAn8A==
X-Received: by 2002:a19:ca1a:0:b0:500:d8d6:fbe4 with SMTP id a26-20020a19ca1a000000b00500d8d6fbe4mr2988230lfg.49.1694661140480;
        Wed, 13 Sep 2023 20:12:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeilcxmV8AZ7l3+orGOpNyXOSknvxaX5xdFtIaO7Z2fVfs1CitrQPSON2n5b1telnZ73iVr+GT0CfgFWL9q1w=
X-Received: by 2002:a19:ca1a:0:b0:500:d8d6:fbe4 with SMTP id
 a26-20020a19ca1a000000b00500d8d6fbe4mr2988228lfg.49.1694661140260; Wed, 13
 Sep 2023 20:12:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230906081637.32185-1-lingshan.zhu@intel.com>
 <20230906081637.32185-6-lingshan.zhu@intel.com> <20230906043016-mutt-send-email-mst@kernel.org>
 <CACGkMEu4R_nUFmpoNesmjJ-PtoE5brpWh8NLruWhEWycm2K4yg@mail.gmail.com>
 <PH0PR12MB5481A50B1B13CE1756B98D0DDCF2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtMmwWGJDYe5BLvLCcetThv-yfPR2QbphNuuh+bp-+ikg@mail.gmail.com>
 <PH0PR12MB5481ED8DC23DC6D42665FB8EDCF2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEt9ATuU_OwtE_9rF1XHKCd9GavWCHx6_dFXCZibMKzJjA@mail.gmail.com>
 <PH0PR12MB5481D538B4F3F76B393C5757DCF1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEs+5AjGzeDbWZYSkOMw65d6g6oDfgbOapa1G3EbtLUy7A@mail.gmail.com> <PH0PR12MB54811C3EC1618E413695D8FDDCF0A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB54811C3EC1618E413695D8FDDCF0A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 14 Sep 2023 11:12:09 +0800
Message-ID: <CACGkMEtMz3KShVbxpf_DLSx8qde=8JAdPPYOnA_udEfQ8UU+uQ@mail.gmail.com>
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

On Wed, Sep 13, 2023 at 12:46=E2=80=AFPM Parav Pandit <parav@nvidia.com> wr=
ote:
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Wednesday, September 13, 2023 10:14 AM
>
> > It's not about how many states in a single state machine, it's about ho=
w many
> > state machines that exist for device status. Having more than one creat=
es big
> > obstacles and complexity in the device. You need to define the interact=
ion of
> > each state otherwise you leave undefined behaviours.
> The device mode has zero relation to the device status.

You will soon get this issue when you want to do nesting.

> It does not mess with it at all.
> In fact the new bits in device status is making it more complex for the d=
evice to handle.

Are you challenging the design of the device status? It's definitely
too late to do this.

This proposal increases just one bit and that worries you? Or you
think one more state is much more complicated than a new state machine
with two states?

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

