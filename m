Return-Path: <virtio-comment-return-6207-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C000C7EE23
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 08:47:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2AA854282A
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 08:47:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0CDAA986655
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 08:47:52 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id F1B2B98664C; Wed,  7 Jun 2023 08:47:51 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DE1C098664F
	for <virtio-comment@lists.oasis-open.org>; Wed,  7 Jun 2023 08:47:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: sE2Hyg1iOwGi3wEEC1TfHw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686127668; x=1688719668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3o7Ee7VDbiuE+bPODgm9jDKoqZi/mK2L/PrghwqhIH0=;
        b=kuW20dl3wehWPsFZjUPEpFcd4xPtBMdqnYcO6HVjfAb7l0pSiYdtg4gItpuLtEbE+x
         yow1iFkk83cf1slLDU3h1M31wXF7Zj+nopMV59R3gGHMdD7ARqCWv6T0WqxoE8ra3aDG
         xGjH+mcwIWhyVn26wXU+Jb0TM0biYcKjSbZ6Olym0P/r0v6DoKWmBLmPovTwmFqBWrSB
         veh6u++mqLUvn17zwOq/veErqVEUqoc9u3+ksR8VCqmSEVIpCPSXSE7W7z23wfN1dKaR
         UrA1lvZ5OKa/tAjyPl8ePqvsO5Hb41GBkL2+6oZezuhzRrSOQQudlDfepYJFQDtXpUNd
         P3wQ==
X-Gm-Message-State: AC+VfDxiNmmlgZVsRCm4+6hju64MtpSzABBAafGr5r0odxYS1aPSju7w
	YTsWb83q6aIigq5vGptIvGyAOOJvuByDZGS1i6AN3yxgfUUqZEOnmQ7GTf8XmKbBJHGHQDnwjEE
	zM3JEVvwtIwwXUb1q9unUheMmD+9BoEhjTU/NUiQzvgznJCRld0fQ+asHEA==
X-Received: by 2002:a05:6214:d6b:b0:625:aa49:9abc with SMTP id 11-20020a0562140d6b00b00625aa499abcmr2055769qvs.64.1686127668632;
        Wed, 07 Jun 2023 01:47:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6y3aKbkWt/7qZ7jWj+hCXKFD6DXX6vkOVbG5e65zJEiCWJdOQrMC/jGtiOfOItFG4AX623KT1YGh2WzEzGh6M=
X-Received: by 2002:a05:6214:d6b:b0:625:aa49:9abc with SMTP id
 11-20020a0562140d6b00b00625aa499abcmr2055760qvs.64.1686127668384; Wed, 07 Jun
 2023 01:47:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230606175511.2337208-1-eperezma@redhat.com> <20230606150920-mutt-send-email-mst@kernel.org>
 <CAJaqyWd2o+++24dF5ab44a_rCUpBTHNwgxd3tQAeJZyh09M+wg@mail.gmail.com> <1686126137.3070245-1-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1686126137.3070245-1-xuanzhuo@linux.alibaba.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 7 Jun 2023 10:47:12 +0200
Message-ID: <CAJaqyWeA40JgZfaynT2S4B9JY-bwrz3Exs9iD98AUPYvsZBgpg@mail.gmail.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: virtio-comment@lists.oasis-open.org, Laurent Vivier <lvivier@redhat.com>, 
	Cindy Lu <lulu@redhat.com>, cohuck@redhat.com, alvaro.karsz@solid-run.com, 
	Liuxiangdong <liuxiangdong5@huawei.com>, Gautam Dawar <gdawar@xilinx.com>, longpeng2@huawei.com, 
	Dragos Tatulea <dtatulea@nvidia.com>, parav@nvidia.com, stefanha@redhat.com, 
	Harpreet Singh Anand <hanand@xilinx.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	Heng Qi <hengqi@linux.alibaba.com>, jasowang@redhat.com, 
	Zhu Lingshan <lingshan.zhu@intel.com>, Shannon Nelson <snelson@pensando.io>, mgurtovoy@nvidia.com, 
	si-wei.liu@oracle.com, "Michael S. Tsirkin" <mst@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [PATCH 0/2] Selective queue enabling

On Wed, Jun 7, 2023 at 10:23=E2=80=AFAM Xuan Zhuo <xuanzhuo@linux.alibaba.c=
om> wrote:
>
> On Wed, 7 Jun 2023 07:35:58 +0200, Eugenio Perez Martin <eperezma@redhat.=
com> wrote:
> > On Tue, Jun 6, 2023 at 9:10=E2=80=AFPM Michael S. Tsirkin <mst@redhat.c=
om> wrote:
> > >
> > > On Tue, Jun 06, 2023 at 07:55:09PM +0200, Eugenio P=C3=A9rez wrote:
> > > > This series allows the driver to start the device (as set DRIVER_OK=
) with only
> > > > some queues enabled, and then enable another queues later.
> > > >
> > > > This is the current way to migrate net device state through control
> > > > virtqueue, in a software assisted framework with vDPA:
> > > > * First, only net CVQ is enabled at DRIVER_OK
> > > > * All the control commands (mac address, mq, etc) needed for the de=
vice
> > > > to behave the same as the source of migration are sent
> > > > * Finally all the dataplane queues are enabled.
> > >
> > > In my opinion, this is somewhat problematic. Specifically, currently
> > > devices tend to deduce how many queues are needed by looking
> > > at the state at DRIVER_OK time.
> > >
> > > Question: what is wrong with enabling queues initially and then
> > > doing a reset right after DRIVER_OK? You can even allocate
> > > memory for just one queue (zeroing it out).
> > >
> > > Granted this looks kind of ugly but side-steps this problem with
> > > no need for spec changes.
> > >
> >
> > The problem is that the rx queues can start receiving, as the guest
> > already has buffers there.
>
> Can we reset the vq before filling buffers to it?
>

They are passthrough from the guest so there is a window where the
device can process rx descriptors.

> > Apart from that, the back and forth
> > introduces latencies.
> >
> > Maybe a better angle is to start all the queues as if they're reset,
> > write 1 just to CVQ, configure the device, and then write 1 to all
> > dataplane vqs?
>
> write to what?
>

Sorry I was unclear, I mean to enable the vqs writing 1 to queue_enable.

Thanks!

> Thanks.
>
> >
> > Thanks!
> >
> > > > Eugenio P=C3=A9rez (2):
> > > >   virtio: introduce selective queue enabling
> > > >   virtio: pci support virtqueue selective enabling
> > > >
> > > >  content.tex       | 15 +++++++++++++--
> > > >  transport-pci.tex |  4 ++++
> > > >  2 files changed, 17 insertions(+), 2 deletions(-)
> > > >
> > > > --
> > > > 2.31.1
> > > >
> > >
> >
>
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
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

