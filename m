Return-Path: <virtio-comment-return-6236-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A13CC7EE25
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 13:44:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7EBD379125
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 13:44:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6E1E098666D
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 13:44:31 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5D40B986351; Thu,  8 Jun 2023 13:44:31 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4A48A98666A
	for <virtio-comment@lists.oasis-open.org>; Thu,  8 Jun 2023 13:44:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: q1p48r9RMbuq8nP8WVOq9g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686231866; x=1688823866;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HqAvU35dHKfvE9FatM6eftsU1Xi8MHKIHBc1PUHjdmI=;
        b=GkB7/gYFuTcUcWg/4qGEpXmYVVUkVt+ptdW8xvNvzCXZLlezeHd3uh1Ft+NORjxloQ
         SCgxqS7brbW+1A9xI14cw6jrtYoKVlc475ck3dW39PnZwS4VdnrI8tcmVEqW4842LOMb
         1U/2sYpMAPi2lDCLXowae8R9DJ3L/+jnJLmfR/oXdL6JORT5UX3eqrckev2ldhnsvZwq
         vkwSse4vw4VAn4B8TzlZl63gsLmZUVhP+w+nEnrfBPieA3651ih+D+eb/qBTt7sFkoAH
         EsGSbY+z9WWcBxkAyrJmmFVdykYKLFSKMgRttKY0jSIS4VstNplOj9zVXC5US0AmBF8n
         FJrg==
X-Gm-Message-State: AC+VfDzZXfCKcrJJ0GO+NmIIWAqSdQpm7lrqqZVt44m8qRzTjnU18n2s
	CLrVw57m+yxieWy2QmMpFqhYNEJlOVngYUO9yAkWiC1Kvktc+PwU5IUXaV/QIhJRx6e2c4D0GjN
	zSDGWxCmkAty9YIaykbakr819a58eVq05rg==
X-Received: by 2002:a17:907:6ea3:b0:966:2123:e0ca with SMTP id sh35-20020a1709076ea300b009662123e0camr11908465ejc.34.1686231865927;
        Thu, 08 Jun 2023 06:44:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ77KgJx9IP5ucEUZI02h49ACqfxhDg3jZEjsxELEP5+LLUF9Pwv3c3YjysLfcpUMjAGGWxGng==
X-Received: by 2002:a17:907:6ea3:b0:966:2123:e0ca with SMTP id sh35-20020a1709076ea300b009662123e0camr11908441ejc.34.1686231865608;
        Thu, 08 Jun 2023 06:44:25 -0700 (PDT)
Date: Thu, 8 Jun 2023 09:44:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>,
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
Message-ID: <20230608094347-mutt-send-email-mst@kernel.org>
References: <1686126137.3070245-1-xuanzhuo@linux.alibaba.com>
 <CAJaqyWeA40JgZfaynT2S4B9JY-bwrz3Exs9iD98AUPYvsZBgpg@mail.gmail.com>
 <20230607045741-mutt-send-email-mst@kernel.org>
 <CAJaqyWfVN1i3F-m81=5=UMOq0ZEn=pU2SOO0QVmE4VjrHGit1w@mail.gmail.com>
 <20230607162529-mutt-send-email-mst@kernel.org>
 <CACGkMEsjJHOcx+D5V=oiQ25Efro-etADmbpDdDXS4Ufk5guoEA@mail.gmail.com>
 <20230608020335-mutt-send-email-mst@kernel.org>
 <CAJaqyWfC0nhQJiwH4iuE_+L+55G=4=P_5HXwMVyGjeUJqa392Q@mail.gmail.com>
 <20230608031325-mutt-send-email-mst@kernel.org>
 <CACGkMEv7SDGsqxH7=YubNVhuCbq2WVO7ghuhAGOriyQoHE3Agw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEv7SDGsqxH7=YubNVhuCbq2WVO7ghuhAGOriyQoHE3Agw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH 0/2] Selective queue enabling

On Thu, Jun 08, 2023 at 03:47:41PM +0800, Jason Wang wrote:
> On Thu, Jun 8, 2023 at 3:19 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Thu, Jun 08, 2023 at 08:43:18AM +0200, Eugenio Perez Martin wrote:
> > > On Thu, Jun 8, 2023 at 8:04 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Thu, Jun 08, 2023 at 08:44:41AM +0800, Jason Wang wrote:
> > > > > On Thu, Jun 8, 2023 at 4:27 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > >
> > > > > > On Wed, Jun 07, 2023 at 11:41:39AM +0200, Eugenio Perez Martin wrote:
> > > > > > > On Wed, Jun 7, 2023 at 10:59 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > > > >
> > > > > > > > On Wed, Jun 07, 2023 at 10:47:12AM +0200, Eugenio Perez Martin wrote:
> > > > > > > > > On Wed, Jun 7, 2023 at 10:23 AM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
> > > > > > > > > >
> > > > > > > > > > On Wed, 7 Jun 2023 07:35:58 +0200, Eugenio Perez Martin <eperezma@redhat.com> wrote:
> > > > > > > > > > > On Tue, Jun 6, 2023 at 9:10 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > > > > > > > >
> > > > > > > > > > > > On Tue, Jun 06, 2023 at 07:55:09PM +0200, Eugenio Pérez wrote:
> > > > > > > > > > > > > This series allows the driver to start the device (as set DRIVER_OK) with only
> > > > > > > > > > > > > some queues enabled, and then enable another queues later.
> > > > > > > > > > > > >
> > > > > > > > > > > > > This is the current way to migrate net device state through control
> > > > > > > > > > > > > virtqueue, in a software assisted framework with vDPA:
> > > > > > > > > > > > > * First, only net CVQ is enabled at DRIVER_OK
> > > > > > > > > > > > > * All the control commands (mac address, mq, etc) needed for the device
> > > > > > > > > > > > > to behave the same as the source of migration are sent
> > > > > > > > > > > > > * Finally all the dataplane queues are enabled.
> > > > > > > > > > > >
> > > > > > > > > > > > In my opinion, this is somewhat problematic. Specifically, currently
> > > > > > > > > > > > devices tend to deduce how many queues are needed by looking
> > > > > > > > > > > > at the state at DRIVER_OK time.
> > > > > > > > > > > >
> > > > > > > > > > > > Question: what is wrong with enabling queues initially and then
> > > > > > > > > > > > doing a reset right after DRIVER_OK? You can even allocate
> > > > > > > > > > > > memory for just one queue (zeroing it out).
> > > > > > > > > > > >
> > > > > > > > > > > > Granted this looks kind of ugly but side-steps this problem with
> > > > > > > > > > > > no need for spec changes.
> > > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > The problem is that the rx queues can start receiving, as the guest
> > > > > > > > > > > already has buffers there.
> > > > > > > > > >
> > > > > > > > > > Can we reset the vq before filling buffers to it?
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > They are passthrough from the guest so there is a window where the
> > > > > > > > > device can process rx descriptors.
> > > > > > > >
> > > > > > > > Not if there are no descriptors there.
> > > > > > > >
> > > > > > >
> > > > > > > But the migration is driven by the hypervisor, and it cannot control
> > > > > > > that. The guest will likely have rx descriptors available.
> > > > > >
> > > > > > Maybe I misunderstand. Is hypervisor driving cvq while guest is driving
> > > > > > rx queues?
> > > > >
> > > > > No, hypervisor tries to restore virtqueue states via cvq before guest can drive.
> > > >
> > > > So cvq maps to hypervisor memory?
> > > >
> > >
> > > >From the device POV, yes, the CVQ vring is in hypervisor memory, not
> > > in the guest's one. That allows the hypervisor to send the CVQ
> > > commands to restore the device state in the destination, without the
> > > guest intervention.
> > >
> > > Data vqs, on the other hand, are passthrough. The device talks
> > > directly to the guest's vrings.
> > >
> > > Currently, this is done by emulating CVQ in the host's kernel and then
> > > translating the commands in the way that suits better the vdpa device,
> > > using its vendor vdpa driver in the host. Other methods like PASID are
> > > possible too.
> > >
> > > Thanks!
> >
> > OK. So my suggestion is simple: map data vrings to a zero page in
> > hypervisor memory initially. Later reset and map to guest.
> 
> Is there a spec section that guarantees the above behaviour? (I guess not).
> 
> Thanks


yes, the initialization section. driver MUST first setup vqs then
set DRIVER_OK.


> >
> >
> > If that does not work, then I am not sure this proposal is enough
> > since I think devices want to have a specific point in time
> > where they know which queues are going to be used.
> > Maybe we could use e.g. bit 1 in queue_enable to signal that?
> >
> >
> > > >
> > > >
> > > > > So in this case if RX queues are enabled at the same time, the device
> > > > > may try to queue packets to queue 0.
> > > > >
> > > > > Thanks
> > > > >
> > > > > > How do you do this - they are DMA from same VF no?
> > > > > >
> > > > > >
> > > > > > > >
> > > > > > > > > > > Apart from that, the back and forth
> > > > > > > > > > > introduces latencies.
> > > > > > > > > > >
> > > > > > > > > > > Maybe a better angle is to start all the queues as if they're reset,
> > > > > > > > > > > write 1 just to CVQ, configure the device, and then write 1 to all
> > > > > > > > > > > dataplane vqs?
> > > > > > > > > >
> > > > > > > > > > write to what?
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > Sorry I was unclear, I mean to enable the vqs writing 1 to queue_enable.
> > > > > > > > >
> > > > > > > > > Thanks!
> > > > > > > > >
> > > > > > > > > > Thanks.
> > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > Thanks!
> > > > > > > > > > >
> > > > > > > > > > > > > Eugenio Pérez (2):
> > > > > > > > > > > > >   virtio: introduce selective queue enabling
> > > > > > > > > > > > >   virtio: pci support virtqueue selective enabling
> > > > > > > > > > > > >
> > > > > > > > > > > > >  content.tex       | 15 +++++++++++++--
> > > > > > > > > > > > >  transport-pci.tex |  4 ++++
> > > > > > > > > > > > >  2 files changed, 17 insertions(+), 2 deletions(-)
> > > > > > > > > > > > >
> > > > > > > > > > > > > --
> > > > > > > > > > > > > 2.31.1
> > > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > This publicly archived list offers a means to provide input to the
> > > > > > > > > > OASIS Virtual I/O Device (VIRTIO) TC.
> > > > > > > > > >
> > > > > > > > > > In order to verify user consent to the Feedback License terms and
> > > > > > > > > > to minimize spam in the list archive, subscription is required
> > > > > > > > > > before posting.
> > > > > > > > > >
> > > > > > > > > > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > > > > > > > > > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > > > > > > > > > List help: virtio-comment-help@lists.oasis-open.org
> > > > > > > > > > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > > > > > > > > > Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> > > > > > > > > > List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> > > > > > > > > > Committee: https://www.oasis-open.org/committees/virtio/
> > > > > > > > > > Join OASIS: https://www.oasis-open.org/join/
> > > > > > > > > >
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

