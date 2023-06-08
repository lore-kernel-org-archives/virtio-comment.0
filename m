Return-Path: <virtio-comment-return-6266-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EFE3C7EE25
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 22:08:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A078C2AED2
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 22:08:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9169198668B
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 22:08:49 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 819B298666C; Thu,  8 Jun 2023 22:08:49 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6B75098668A
	for <virtio-comment@lists.oasis-open.org>; Thu,  8 Jun 2023 22:08:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: g2_mrRxuNLeG1Q3yDDYktQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686262125; x=1688854125;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mV3glw4RSIcpuD+EgQX8i0rAL6hVv3uHMOFUSRrW+ug=;
        b=IpWnG0WFOy3Uy667XRg3ZJ6Y6wGAJ3C3xaMpu379dDrcF/25/N1j/d4cjdb6IXJ5q5
         iBU4Bz67GYSIJy91qmbYqYK+zhou+I9N68KEmz8Uk++PqgSEVWVKgo+yBwY7xqYe8VT1
         cMftlDkxcUnAiwqu4Kh5woEwO4V+skPkXN0zkTQ1sldqJ1LDr655qcFj5sBqj8LbWU4e
         r0X4I5RCouxzLjLASC2rOfPBnA2mRbMOrhN7ZqkZjSnlCLe8tkwakrZ9PDl5zLTwZqWz
         sUmdBzm3j/9Bzq0QTN+TrtoSnlkbXhSabE0O7hhtUsWvwZX61ARQAjrK3TecVxhDqk2+
         5ykA==
X-Gm-Message-State: AC+VfDzDSyhhvL9uO5oAcCzL+MJaO0jEyDUXNuSwCljRm+XaNgkKuSR4
	9eeVb9Y0/7zQvoMM2r7IJsQjCR5IAcQJ61n9UAkLxVgBNrWHHS607mo9wFIu5iUztogiPSiFgG3
	ziLzI/XK2/cTPXhWFT5Sw6uF+264B6fc14g==
X-Received: by 2002:a05:6000:128b:b0:30a:e465:5b29 with SMTP id f11-20020a056000128b00b0030ae4655b29mr7654472wrx.57.1686262125348;
        Thu, 08 Jun 2023 15:08:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7gLC1qrDDKequzZDVnsTawTC2MnWEWDDmrItngiIdWdpdi45qkmze0FjzT7lSAh2CXlptncg==
X-Received: by 2002:a05:6000:128b:b0:30a:e465:5b29 with SMTP id f11-20020a056000128b00b0030ae4655b29mr7654453wrx.57.1686262124945;
        Thu, 08 Jun 2023 15:08:44 -0700 (PDT)
Date: Thu, 8 Jun 2023 18:08:39 -0400
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
Message-ID: <20230608180617-mutt-send-email-mst@kernel.org>
References: <1686126137.3070245-1-xuanzhuo@linux.alibaba.com>
 <CAJaqyWeA40JgZfaynT2S4B9JY-bwrz3Exs9iD98AUPYvsZBgpg@mail.gmail.com>
 <20230607045741-mutt-send-email-mst@kernel.org>
 <CAJaqyWfVN1i3F-m81=5=UMOq0ZEn=pU2SOO0QVmE4VjrHGit1w@mail.gmail.com>
 <20230607162529-mutt-send-email-mst@kernel.org>
 <CACGkMEsjJHOcx+D5V=oiQ25Efro-etADmbpDdDXS4Ufk5guoEA@mail.gmail.com>
 <20230608020335-mutt-send-email-mst@kernel.org>
 <CAJaqyWfC0nhQJiwH4iuE_+L+55G=4=P_5HXwMVyGjeUJqa392Q@mail.gmail.com>
 <20230608031325-mutt-send-email-mst@kernel.org>
 <CAJaqyWf+vn06NHcQY208dwyB=WH3PQ3A7z53o0BTy102XrT+3Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWf+vn06NHcQY208dwyB=WH3PQ3A7z53o0BTy102XrT+3Q@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH 0/2] Selective queue enabling

On Thu, Jun 08, 2023 at 10:36:19AM +0200, Eugenio Perez Martin wrote:
> On Thu, Jun 8, 2023 at 9:19 AM Michael S. Tsirkin <mst@redhat.com> wrote:
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
> >
> 
> The idea is interesting, but we lose the net configuration in a device
> reset, so we need to send it again.

Ring reset, not device reset.

> In the case of qemu+vDPA maybe it is possible with queue_reset, like:
> * Map all the guest pages as usual.
> * Map a new zero page, forbid the guest to write on that page. Even in
> vIOMMU case, we can send all the CVQ commands before allowing the
> guest to modify mappings. The guest has no way to write on that page
> through the device as, well, dataplane is not initialized. It's the
> way DPDK shadow virtqueues worked, so it should be valid.
> * Reset the queues to the guest passthrough.
> 
> I don't like the complexity of it but I like it does require even less
> changes to the device / spec.

This is exactly what I meant.

> >
> > If that does not work, then I am not sure this proposal is enough
> > since I think devices want to have a specific point in time
> > where they know which queues are going to be used.
> 
> In the case of net, this should not be a problem since the spec
> mandates 2 if !cvq, 3 if cvq but !mq, and max_virtqueue_pairs*2+1 if
> cvq and mq. virtio-blk also has num_queues.

This is max, not how many there are in practice.

> Is it even valid to not enable some of the queues?

Yes and linux will do that if max_virtqueue_pairs > #CPUs.

> I've always felt that queue_enable has been redundant before
> queue_reset for this reason actually.
> 
> > Maybe we could use e.g. bit 1 in queue_enable to signal that?
> >
> 
> I'm totally ok to go in that direction.
> 
> Thanks!
> 
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

