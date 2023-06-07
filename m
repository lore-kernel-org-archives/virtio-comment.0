Return-Path: <virtio-comment-return-6210-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB18C77B7A
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 08:59:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6BD1AF3F43
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 08:59:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 59D05986653
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 08:59:37 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 49A1698664C; Wed,  7 Jun 2023 08:59:37 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3749098664F
	for <virtio-comment@lists.oasis-open.org>; Wed,  7 Jun 2023 08:59:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 23xMiA4ON166TecyV_mzBQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686128374; x=1688720374;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Ptz7uJo2T2Z3myZXJHs7+VBXCP0YE3/BUN9ZukGtSE=;
        b=irAFzsBOQXkg4WeO8Dl3n8i1VK0YsnvhlKY8XkTvmhsyVNi68p9meXTxknhG8oXUTr
         zyv6eLwqCJROHikL3kiQBdkY2T9xzTPi5+DUm0sQPj0v2YTBSsDmFa2zxJ/xvDwg8t9c
         cwYdec9ybcWeWzPAeWJbUV8qo26aMtCqZptYtZ6g17cNy6fX3oL3qnfs+Om5nr8YebN1
         uPdtH0rrpIGHWy/WiQE62MZxQH4FKviY6plgBewueyQ+xBbH+Cb7eTpGFL7G9b96g4yj
         lnGKPqg3np9PkQrRAwHzT0fX/jQyAhd3byPmatPMnUoCQPrpoziV282SvSF4I6blMv8i
         BeoQ==
X-Gm-Message-State: AC+VfDxtMGoivpX25c7l6T9jKMzYLqQtYk2UzC4NIQ233yqC6FuymSq5
	8hWPE+12nVKt/A8eCjAMmvzxgrKo2X9R9MmkZTbyn7Sqwac+WAGjEWE6IByYZCHZH7xRi15wb9a
	mVEgwhorbO8LdtJ13gVObZHLgAxpubmqJog==
X-Received: by 2002:adf:fdc8:0:b0:306:36ef:2e3b with SMTP id i8-20020adffdc8000000b0030636ef2e3bmr3306889wrs.70.1686128374042;
        Wed, 07 Jun 2023 01:59:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6RkJ/YdlyHsfjX7Q8soFeFbrRpUkDc05974VXrwq5hJGK/MQW6j42F6R3hmkqXiAJpcGa2mw==
X-Received: by 2002:adf:fdc8:0:b0:306:36ef:2e3b with SMTP id i8-20020adffdc8000000b0030636ef2e3bmr3306870wrs.70.1686128373695;
        Wed, 07 Jun 2023 01:59:33 -0700 (PDT)
Date: Wed, 7 Jun 2023 04:59:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	virtio-comment@lists.oasis-open.org,
	Laurent Vivier <lvivier@redhat.com>, Cindy Lu <lulu@redhat.com>,
	cohuck@redhat.com, alvaro.karsz@solid-run.com,
	Liuxiangdong <liuxiangdong5@huawei.com>,
	Gautam Dawar <gdawar@xilinx.com>, longpeng2@huawei.com,
	Dragos Tatulea <dtatulea@nvidia.com>, parav@nvidia.com,
	stefanha@redhat.com, Harpreet Singh Anand <hanand@xilinx.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Heng Qi <hengqi@linux.alibaba.com>, jasowang@redhat.com,
	Zhu Lingshan <lingshan.zhu@intel.com>,
	Shannon Nelson <snelson@pensando.io>, mgurtovoy@nvidia.com,
	si-wei.liu@oracle.com
Message-ID: <20230607045741-mutt-send-email-mst@kernel.org>
References: <20230606175511.2337208-1-eperezma@redhat.com>
 <20230606150920-mutt-send-email-mst@kernel.org>
 <CAJaqyWd2o+++24dF5ab44a_rCUpBTHNwgxd3tQAeJZyh09M+wg@mail.gmail.com>
 <1686126137.3070245-1-xuanzhuo@linux.alibaba.com>
 <CAJaqyWeA40JgZfaynT2S4B9JY-bwrz3Exs9iD98AUPYvsZBgpg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWeA40JgZfaynT2S4B9JY-bwrz3Exs9iD98AUPYvsZBgpg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH 0/2] Selective queue enabling

On Wed, Jun 07, 2023 at 10:47:12AM +0200, Eugenio Perez Martin wrote:
> On Wed, Jun 7, 2023 at 10:23 AM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
> >
> > On Wed, 7 Jun 2023 07:35:58 +0200, Eugenio Perez Martin <eperezma@redhat.com> wrote:
> > > On Tue, Jun 6, 2023 at 9:10 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Tue, Jun 06, 2023 at 07:55:09PM +0200, Eugenio Pérez wrote:
> > > > > This series allows the driver to start the device (as set DRIVER_OK) with only
> > > > > some queues enabled, and then enable another queues later.
> > > > >
> > > > > This is the current way to migrate net device state through control
> > > > > virtqueue, in a software assisted framework with vDPA:
> > > > > * First, only net CVQ is enabled at DRIVER_OK
> > > > > * All the control commands (mac address, mq, etc) needed for the device
> > > > > to behave the same as the source of migration are sent
> > > > > * Finally all the dataplane queues are enabled.
> > > >
> > > > In my opinion, this is somewhat problematic. Specifically, currently
> > > > devices tend to deduce how many queues are needed by looking
> > > > at the state at DRIVER_OK time.
> > > >
> > > > Question: what is wrong with enabling queues initially and then
> > > > doing a reset right after DRIVER_OK? You can even allocate
> > > > memory for just one queue (zeroing it out).
> > > >
> > > > Granted this looks kind of ugly but side-steps this problem with
> > > > no need for spec changes.
> > > >
> > >
> > > The problem is that the rx queues can start receiving, as the guest
> > > already has buffers there.
> >
> > Can we reset the vq before filling buffers to it?
> >
> 
> They are passthrough from the guest so there is a window where the
> device can process rx descriptors.

Not if there are no descriptors there.


> > > Apart from that, the back and forth
> > > introduces latencies.
> > >
> > > Maybe a better angle is to start all the queues as if they're reset,
> > > write 1 just to CVQ, configure the device, and then write 1 to all
> > > dataplane vqs?
> >
> > write to what?
> >
> 
> Sorry I was unclear, I mean to enable the vqs writing 1 to queue_enable.
> 
> Thanks!
> 
> > Thanks.
> >
> > >
> > > Thanks!
> > >
> > > > > Eugenio Pérez (2):
> > > > >   virtio: introduce selective queue enabling
> > > > >   virtio: pci support virtqueue selective enabling
> > > > >
> > > > >  content.tex       | 15 +++++++++++++--
> > > > >  transport-pci.tex |  4 ++++
> > > > >  2 files changed, 17 insertions(+), 2 deletions(-)
> > > > >
> > > > > --
> > > > > 2.31.1
> > > > >
> > > >
> > >
> >
> > This publicly archived list offers a means to provide input to the
> > OASIS Virtual I/O Device (VIRTIO) TC.
> >
> > In order to verify user consent to the Feedback License terms and
> > to minimize spam in the list archive, subscription is required
> > before posting.
> >
> > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > List help: virtio-comment-help@lists.oasis-open.org
> > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> > List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> > Committee: https://www.oasis-open.org/committees/virtio/
> > Join OASIS: https://www.oasis-open.org/join/
> >


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

