Return-Path: <virtio-comment-return-6202-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1BD7C7EE23
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 05:36:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CB6D5E6948
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 05:36:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id ACB8A986650
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 05:36:38 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 99038986642; Wed,  7 Jun 2023 05:36:38 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 82068986644
	for <virtio-comment@lists.oasis-open.org>; Wed,  7 Jun 2023 05:36:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: ouiDZkJ_OHa1cenEYSbNGg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686116195; x=1688708195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ZxkfcL8b9LfxMH+ekkuGcrVTXMMR3aNmFl6fFWSOzk=;
        b=k+ycTAeM95ibHL/ZPQTY8jrm7Pf9UQyloF8LlnXtaUjgMcj82VGwJ8cINvB8pUTf99
         qlcj+H8E1cf7JVHcTnBA5k+XkwJO+dwp5YR6fDIeOQZIQXMGiq2953uXXkTpWRMfvUfR
         lRNR/WVWC7niNyeZjCKiSmyzs0Bkd8ToihD/U7i28Bg1f/j5BBDIenVzZ3nAIDxgPYoU
         7+rbsbUAgqXNxV+H2hCBJ9Td6ggi9t67AADXXV+691ClrrS0+M90C347ZSaiBWY0igof
         gogduayN63cNv6besEfjPdeVdr4toM5LrtozDRodeRkY2ML96ajh8ZgJpxwSWPAsacRC
         zuSA==
X-Gm-Message-State: AC+VfDzrHF7aTGLiM5JZ3DsjP40GThtXygU6kSrUzIMzTTayWrS7z96G
	fcmNIPspo/NNgoEbFkq4WAROvvSQNekx2KB2cWZ2U5K/PgIQif6CbCnh+YfSzQRYkbobBP/W1WA
	HUYmJFmVHkpsZVdiX4EBY9wqp/DlEaqcMMbmWvdGgOHCW77zRrg==
X-Received: by 2002:a0d:e610:0:b0:561:c147:1d46 with SMTP id p16-20020a0de610000000b00561c1471d46mr5246896ywe.9.1686116195676;
        Tue, 06 Jun 2023 22:36:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5ha2a2jJi4Mv6ExgNqMSDm6ia+6N0yCnagVtvd7RhFXsyRILgUbmIvM1sSabdi4ZKSoRGRQhQTiCcLObQ7ucw=
X-Received: by 2002:a0d:e610:0:b0:561:c147:1d46 with SMTP id
 p16-20020a0de610000000b00561c1471d46mr5246879ywe.9.1686116195400; Tue, 06 Jun
 2023 22:36:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230606175511.2337208-1-eperezma@redhat.com> <20230606150920-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230606150920-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 7 Jun 2023 07:35:58 +0200
Message-ID: <CAJaqyWd2o+++24dF5ab44a_rCUpBTHNwgxd3tQAeJZyh09M+wg@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Laurent Vivier <lvivier@redhat.com>, 
	Cindy Lu <lulu@redhat.com>, cohuck@redhat.com, alvaro.karsz@solid-run.com, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
	Gautam Dawar <gdawar@xilinx.com>, longpeng2@huawei.com, 
	Dragos Tatulea <dtatulea@nvidia.com>, parav@nvidia.com, stefanha@redhat.com, 
	Harpreet Singh Anand <hanand@xilinx.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	Heng Qi <hengqi@linux.alibaba.com>, jasowang@redhat.com, 
	Zhu Lingshan <lingshan.zhu@intel.com>, Shannon Nelson <snelson@pensando.io>, mgurtovoy@nvidia.com, 
	si-wei.liu@oracle.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [PATCH 0/2] Selective queue enabling

On Tue, Jun 6, 2023 at 9:10=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com> =
wrote:
>
> On Tue, Jun 06, 2023 at 07:55:09PM +0200, Eugenio P=C3=A9rez wrote:
> > This series allows the driver to start the device (as set DRIVER_OK) wi=
th only
> > some queues enabled, and then enable another queues later.
> >
> > This is the current way to migrate net device state through control
> > virtqueue, in a software assisted framework with vDPA:
> > * First, only net CVQ is enabled at DRIVER_OK
> > * All the control commands (mac address, mq, etc) needed for the device
> > to behave the same as the source of migration are sent
> > * Finally all the dataplane queues are enabled.
>
> In my opinion, this is somewhat problematic. Specifically, currently
> devices tend to deduce how many queues are needed by looking
> at the state at DRIVER_OK time.
>
> Question: what is wrong with enabling queues initially and then
> doing a reset right after DRIVER_OK? You can even allocate
> memory for just one queue (zeroing it out).
>
> Granted this looks kind of ugly but side-steps this problem with
> no need for spec changes.
>

The problem is that the rx queues can start receiving, as the guest
already has buffers there. Apart from that, the back and forth
introduces latencies.

Maybe a better angle is to start all the queues as if they're reset,
write 1 just to CVQ, configure the device, and then write 1 to all
dataplane vqs?

Thanks!

> > Eugenio P=C3=A9rez (2):
> >   virtio: introduce selective queue enabling
> >   virtio: pci support virtqueue selective enabling
> >
> >  content.tex       | 15 +++++++++++++--
> >  transport-pci.tex |  4 ++++
> >  2 files changed, 17 insertions(+), 2 deletions(-)
> >
> > --
> > 2.31.1
> >
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

