Return-Path: <virtio-comment-return-6228-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713A9C7EE23
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 07:20:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A28A744343
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 07:20:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8B30C986668
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 07:20:20 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 78FB6986259; Thu,  8 Jun 2023 07:20:20 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3BB26986667
	for <virtio-comment@lists.oasis-open.org>; Thu,  8 Jun 2023 07:19:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: L_oUsnb-NBqc8x_W45oDxg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686208743; x=1688800743;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BFw8/CF6Jek9BYf+DrmuKN4Cx0WBUrQty9c/r2Tax5w=;
        b=LFzVC0DhiZQjbaSMWOo9oIhXfaTsBb0coMspiEpjLfeW/ar18DC8Ow7kufCAovXP94
         NHFlK2jQpE0wLrHVP2fitmwYgUUyWy5T3EX/SeHqUdaM7bgg/QA8Ncy0EYVsXkLMTaiu
         l/7VrsVAFRhMpa6Vawq79/xXV+h8y5TPsmSgU+7FS5dtGZfwxhqJ3jzOyQHtxSu9p8ey
         qY6Mmq7H9U96fOMzI/C5hqEILgHkpoMoXNZe7rZtZJS0A28SVIYr5yML1nlDWf9/RLdq
         sCtTfTmoipHolATG28cjhqlKRpyGlrQ6cW7tUN+PUu+rmn93j52VJI4R1YShUffd7kWz
         Wo0g==
X-Gm-Message-State: AC+VfDyQSJ4kLG2Sn8w4pmYFZZKjYQFLStQ8Bp0p9D1A7vhudCDq8zFs
	ksCbeFoUqAo2IgxPhO8P9d9jYi5yG9eQhfVMOIauyvsZhtjakDwu5sgCt3BnzR/z0agp/qCLnbL
	GsUcC3JA2juu4mA/pjFSQE1FAKNndqEw3mA==
X-Received: by 2002:a5d:53d2:0:b0:30a:e3d6:fcac with SMTP id a18-20020a5d53d2000000b0030ae3d6fcacmr6085238wrw.19.1686208743393;
        Thu, 08 Jun 2023 00:19:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7SyYDscqUpxKaHVDCT9tHMWpyotrUR6Iv39u4fpRRkJY6Snj397GfKhPWFbRrF25OaBQWC3Q==
X-Received: by 2002:a5d:53d2:0:b0:30a:e3d6:fcac with SMTP id a18-20020a5d53d2000000b0030ae3d6fcacmr6085205wrw.19.1686208743032;
        Thu, 08 Jun 2023 00:19:03 -0700 (PDT)
Date: Thu, 8 Jun 2023 03:18:57 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	virtio-comment@lists.oasis-open.org,
	Laurent Vivier <lvivier@redhat.com>, Cindy Lu <lulu@redhat.com>,
	cohuck@redhat.com, alvaro.karsz@solid-run.com,
	Liuxiangdong <liuxiangdong5@huawei.com>,
	Gautam Dawar <gdawar@xilinx.com>, longpeng2@huawei.com,
	Dragos Tatulea <dtatulea@nvidia.com>, parav@nvidia.com,
	stefanha@redhat.com, Harpreet Singh Anand <hanand@xilinx.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Heng Qi <hengqi@linux.alibaba.com>,
	Zhu Lingshan <lingshan.zhu@intel.com>,
	Shannon Nelson <snelson@pensando.io>, mgurtovoy@nvidia.com,
	si-wei.liu@oracle.com
Message-ID: <20230608031325-mutt-send-email-mst@kernel.org>
References: <20230606150920-mutt-send-email-mst@kernel.org>
 <CAJaqyWd2o+++24dF5ab44a_rCUpBTHNwgxd3tQAeJZyh09M+wg@mail.gmail.com>
 <1686126137.3070245-1-xuanzhuo@linux.alibaba.com>
 <CAJaqyWeA40JgZfaynT2S4B9JY-bwrz3Exs9iD98AUPYvsZBgpg@mail.gmail.com>
 <20230607045741-mutt-send-email-mst@kernel.org>
 <CAJaqyWfVN1i3F-m81=5=UMOq0ZEn=pU2SOO0QVmE4VjrHGit1w@mail.gmail.com>
 <20230607162529-mutt-send-email-mst@kernel.org>
 <CACGkMEsjJHOcx+D5V=oiQ25Efro-etADmbpDdDXS4Ufk5guoEA@mail.gmail.com>
 <20230608020335-mutt-send-email-mst@kernel.org>
 <CAJaqyWfC0nhQJiwH4iuE_+L+55G=4=P_5HXwMVyGjeUJqa392Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWfC0nhQJiwH4iuE_+L+55G=4=P_5HXwMVyGjeUJqa392Q@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH 0/2] Selective queue enabling

On Thu, Jun 08, 2023 at 08:43:18AM +0200, Eugenio Perez Martin wrote:
> On Thu, Jun 8, 2023 at 8:04 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Thu, Jun 08, 2023 at 08:44:41AM +0800, Jason Wang wrote:
> > > On Thu, Jun 8, 2023 at 4:27 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Wed, Jun 07, 2023 at 11:41:39AM +0200, Eugenio Perez Martin wrote:
> > > > > On Wed, Jun 7, 2023 at 10:59 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > >
> > > > > > On Wed, Jun 07, 2023 at 10:47:12AM +0200, Eugenio Perez Martin wrote:
> > > > > > > On Wed, Jun 7, 2023 at 10:23 AM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
> > > > > > > >
> > > > > > > > On Wed, 7 Jun 2023 07:35:58 +0200, Eugenio Perez Martin <eperezma@redhat.com> wrote:
> > > > > > > > > On Tue, Jun 6, 2023 at 9:10 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > > > > > >
> > > > > > > > > > On Tue, Jun 06, 2023 at 07:55:09PM +0200, Eugenio Pérez wrote:
> > > > > > > > > > > This series allows the driver to start the device (as set DRIVER_OK) with only
> > > > > > > > > > > some queues enabled, and then enable another queues later.
> > > > > > > > > > >
> > > > > > > > > > > This is the current way to migrate net device state through control
> > > > > > > > > > > virtqueue, in a software assisted framework with vDPA:
> > > > > > > > > > > * First, only net CVQ is enabled at DRIVER_OK
> > > > > > > > > > > * All the control commands (mac address, mq, etc) needed for the device
> > > > > > > > > > > to behave the same as the source of migration are sent
> > > > > > > > > > > * Finally all the dataplane queues are enabled.
> > > > > > > > > >
> > > > > > > > > > In my opinion, this is somewhat problematic. Specifically, currently
> > > > > > > > > > devices tend to deduce how many queues are needed by looking
> > > > > > > > > > at the state at DRIVER_OK time.
> > > > > > > > > >
> > > > > > > > > > Question: what is wrong with enabling queues initially and then
> > > > > > > > > > doing a reset right after DRIVER_OK? You can even allocate
> > > > > > > > > > memory for just one queue (zeroing it out).
> > > > > > > > > >
> > > > > > > > > > Granted this looks kind of ugly but side-steps this problem with
> > > > > > > > > > no need for spec changes.
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > The problem is that the rx queues can start receiving, as the guest
> > > > > > > > > already has buffers there.
> > > > > > > >
> > > > > > > > Can we reset the vq before filling buffers to it?
> > > > > > > >
> > > > > > >
> > > > > > > They are passthrough from the guest so there is a window where the
> > > > > > > device can process rx descriptors.
> > > > > >
> > > > > > Not if there are no descriptors there.
> > > > > >
> > > > >
> > > > > But the migration is driven by the hypervisor, and it cannot control
> > > > > that. The guest will likely have rx descriptors available.
> > > >
> > > > Maybe I misunderstand. Is hypervisor driving cvq while guest is driving
> > > > rx queues?
> > >
> > > No, hypervisor tries to restore virtqueue states via cvq before guest can drive.
> >
> > So cvq maps to hypervisor memory?
> >
> 
> >From the device POV, yes, the CVQ vring is in hypervisor memory, not
> in the guest's one. That allows the hypervisor to send the CVQ
> commands to restore the device state in the destination, without the
> guest intervention.
> 
> Data vqs, on the other hand, are passthrough. The device talks
> directly to the guest's vrings.
> 
> Currently, this is done by emulating CVQ in the host's kernel and then
> translating the commands in the way that suits better the vdpa device,
> using its vendor vdpa driver in the host. Other methods like PASID are
> possible too.
> 
> Thanks!

OK. So my suggestion is simple: map data vrings to a zero page in
hypervisor memory initially. Later reset and map to guest.


If that does not work, then I am not sure this proposal is enough
since I think devices want to have a specific point in time
where they know which queues are going to be used.
Maybe we could use e.g. bit 1 in queue_enable to signal that?


> >
> >
> > > So in this case if RX queues are enabled at the same time, the device
> > > may try to queue packets to queue 0.
> > >
> > > Thanks
> > >
> > > > How do you do this - they are DMA from same VF no?
> > > >
> > > >
> > > > > >
> > > > > > > > > Apart from that, the back and forth
> > > > > > > > > introduces latencies.
> > > > > > > > >
> > > > > > > > > Maybe a better angle is to start all the queues as if they're reset,
> > > > > > > > > write 1 just to CVQ, configure the device, and then write 1 to all
> > > > > > > > > dataplane vqs?
> > > > > > > >
> > > > > > > > write to what?
> > > > > > > >
> > > > > > >
> > > > > > > Sorry I was unclear, I mean to enable the vqs writing 1 to queue_enable.
> > > > > > >
> > > > > > > Thanks!
> > > > > > >
> > > > > > > > Thanks.
> > > > > > > >
> > > > > > > > >
> > > > > > > > > Thanks!
> > > > > > > > >
> > > > > > > > > > > Eugenio Pérez (2):
> > > > > > > > > > >   virtio: introduce selective queue enabling
> > > > > > > > > > >   virtio: pci support virtqueue selective enabling
> > > > > > > > > > >
> > > > > > > > > > >  content.tex       | 15 +++++++++++++--
> > > > > > > > > > >  transport-pci.tex |  4 ++++
> > > > > > > > > > >  2 files changed, 17 insertions(+), 2 deletions(-)
> > > > > > > > > > >
> > > > > > > > > > > --
> > > > > > > > > > > 2.31.1
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > >
> > > > > > > >
> > > > > > > > This publicly archived list offers a means to provide input to the
> > > > > > > > OASIS Virtual I/O Device (VIRTIO) TC.
> > > > > > > >
> > > > > > > > In order to verify user consent to the Feedback License terms and
> > > > > > > > to minimize spam in the list archive, subscription is required
> > > > > > > > before posting.
> > > > > > > >
> > > > > > > > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > > > > > > > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > > > > > > > List help: virtio-comment-help@lists.oasis-open.org
> > > > > > > > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > > > > > > > Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> > > > > > > > List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> > > > > > > > Committee: https://www.oasis-open.org/committees/virtio/
> > > > > > > > Join OASIS: https://www.oasis-open.org/join/
> > > > > > > >
> > > > > >
> > > >
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

