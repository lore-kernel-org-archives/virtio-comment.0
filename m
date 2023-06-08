Return-Path: <virtio-comment-return-6225-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB4AC7EE2E
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 06:05:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 669C12AC47
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 06:05:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4869A986668
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 06:05:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 33099986259; Thu,  8 Jun 2023 06:05:33 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DE664986667
	for <virtio-comment@lists.oasis-open.org>; Thu,  8 Jun 2023 06:04:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: a5xseTPVMCCpIVkE3wOF8g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686204294; x=1688796294;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zQeontaLAKwt1Bx2FzE/24ZBsVrbg6XS/WO5m4M1b80=;
        b=EHDRWPDGhhMi22A0xBQ/3MyXZPxhk1wcWcfl6gxfZ6DXNAUjgm3AhYi3DStJbfotF/
         oMSpaokuOBsdXWscMoga1YEZHA2w3acs0rRtoLgDcNdApTYLW7AOrcf/8YYe3C7qSqI9
         sjpFscfl+lSHeqBkef3IyPc2i/+bAAHgGTBmkeC1qOijPd0CGEos0SBUIGF+9rMd75v6
         HsvNMs1uuUVTxr8oPTvwS1HaifGa8fvfylh6KNFW4G5a3e0994SLJpIU9NP91sQ1P1R7
         LDbl1iPGDfU5/SHEVwCFh0Wy9Pxy6oHgLXgg3kvmWJsnfKaM4/+/dyUo6eBribSAwe7h
         KPjA==
X-Gm-Message-State: AC+VfDz6MVR9TjhDPxoh9dxyHzVYMiRKVS1G6lF51z01h9i0BngGkW0r
	w5kVvApOmtJcdkvaPPTdv1xvuFHSVzcHYqT0JG0Grxk3GF1QnILRbHAespl2CGjgS5kvtdB8KFs
	UeZoD6rBCENGSPAL/ngNcqr+UMcPfct9mbA==
X-Received: by 2002:a5d:564a:0:b0:30e:47e2:7eca with SMTP id j10-20020a5d564a000000b0030e47e27ecamr746665wrw.3.1686204294449;
        Wed, 07 Jun 2023 23:04:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4x//Io3CJNvny/MaxSIM6DZb8UsRAmxbUpuGl8NQsN0AjF4bL6pFILZBrBYbEk/Py0I88qHw==
X-Received: by 2002:a5d:564a:0:b0:30e:47e2:7eca with SMTP id j10-20020a5d564a000000b0030e47e27ecamr746649wrw.3.1686204294150;
        Wed, 07 Jun 2023 23:04:54 -0700 (PDT)
Date: Thu, 8 Jun 2023 02:04:48 -0400
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
Message-ID: <20230608020335-mutt-send-email-mst@kernel.org>
References: <20230606175511.2337208-1-eperezma@redhat.com>
 <20230606150920-mutt-send-email-mst@kernel.org>
 <CAJaqyWd2o+++24dF5ab44a_rCUpBTHNwgxd3tQAeJZyh09M+wg@mail.gmail.com>
 <1686126137.3070245-1-xuanzhuo@linux.alibaba.com>
 <CAJaqyWeA40JgZfaynT2S4B9JY-bwrz3Exs9iD98AUPYvsZBgpg@mail.gmail.com>
 <20230607045741-mutt-send-email-mst@kernel.org>
 <CAJaqyWfVN1i3F-m81=5=UMOq0ZEn=pU2SOO0QVmE4VjrHGit1w@mail.gmail.com>
 <20230607162529-mutt-send-email-mst@kernel.org>
 <CACGkMEsjJHOcx+D5V=oiQ25Efro-etADmbpDdDXS4Ufk5guoEA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEsjJHOcx+D5V=oiQ25Efro-etADmbpDdDXS4Ufk5guoEA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH 0/2] Selective queue enabling

On Thu, Jun 08, 2023 at 08:44:41AM +0800, Jason Wang wrote:
> On Thu, Jun 8, 2023 at 4:27 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Wed, Jun 07, 2023 at 11:41:39AM +0200, Eugenio Perez Martin wrote:
> > > On Wed, Jun 7, 2023 at 10:59 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Wed, Jun 07, 2023 at 10:47:12AM +0200, Eugenio Perez Martin wrote:
> > > > > On Wed, Jun 7, 2023 at 10:23 AM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
> > > > > >
> > > > > > On Wed, 7 Jun 2023 07:35:58 +0200, Eugenio Perez Martin <eperezma@redhat.com> wrote:
> > > > > > > On Tue, Jun 6, 2023 at 9:10 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > > > >
> > > > > > > > On Tue, Jun 06, 2023 at 07:55:09PM +0200, Eugenio Pérez wrote:
> > > > > > > > > This series allows the driver to start the device (as set DRIVER_OK) with only
> > > > > > > > > some queues enabled, and then enable another queues later.
> > > > > > > > >
> > > > > > > > > This is the current way to migrate net device state through control
> > > > > > > > > virtqueue, in a software assisted framework with vDPA:
> > > > > > > > > * First, only net CVQ is enabled at DRIVER_OK
> > > > > > > > > * All the control commands (mac address, mq, etc) needed for the device
> > > > > > > > > to behave the same as the source of migration are sent
> > > > > > > > > * Finally all the dataplane queues are enabled.
> > > > > > > >
> > > > > > > > In my opinion, this is somewhat problematic. Specifically, currently
> > > > > > > > devices tend to deduce how many queues are needed by looking
> > > > > > > > at the state at DRIVER_OK time.
> > > > > > > >
> > > > > > > > Question: what is wrong with enabling queues initially and then
> > > > > > > > doing a reset right after DRIVER_OK? You can even allocate
> > > > > > > > memory for just one queue (zeroing it out).
> > > > > > > >
> > > > > > > > Granted this looks kind of ugly but side-steps this problem with
> > > > > > > > no need for spec changes.
> > > > > > > >
> > > > > > >
> > > > > > > The problem is that the rx queues can start receiving, as the guest
> > > > > > > already has buffers there.
> > > > > >
> > > > > > Can we reset the vq before filling buffers to it?
> > > > > >
> > > > >
> > > > > They are passthrough from the guest so there is a window where the
> > > > > device can process rx descriptors.
> > > >
> > > > Not if there are no descriptors there.
> > > >
> > >
> > > But the migration is driven by the hypervisor, and it cannot control
> > > that. The guest will likely have rx descriptors available.
> >
> > Maybe I misunderstand. Is hypervisor driving cvq while guest is driving
> > rx queues?
> 
> No, hypervisor tries to restore virtqueue states via cvq before guest can drive.

So cvq maps to hypervisor memory?


> So in this case if RX queues are enabled at the same time, the device
> may try to queue packets to queue 0.
> 
> Thanks
> 
> > How do you do this - they are DMA from same VF no?
> >
> >
> > > >
> > > > > > > Apart from that, the back and forth
> > > > > > > introduces latencies.
> > > > > > >
> > > > > > > Maybe a better angle is to start all the queues as if they're reset,
> > > > > > > write 1 just to CVQ, configure the device, and then write 1 to all
> > > > > > > dataplane vqs?
> > > > > >
> > > > > > write to what?
> > > > > >
> > > > >
> > > > > Sorry I was unclear, I mean to enable the vqs writing 1 to queue_enable.
> > > > >
> > > > > Thanks!
> > > > >
> > > > > > Thanks.
> > > > > >
> > > > > > >
> > > > > > > Thanks!
> > > > > > >
> > > > > > > > > Eugenio Pérez (2):
> > > > > > > > >   virtio: introduce selective queue enabling
> > > > > > > > >   virtio: pci support virtqueue selective enabling
> > > > > > > > >
> > > > > > > > >  content.tex       | 15 +++++++++++++--
> > > > > > > > >  transport-pci.tex |  4 ++++
> > > > > > > > >  2 files changed, 17 insertions(+), 2 deletions(-)
> > > > > > > > >
> > > > > > > > > --
> > > > > > > > > 2.31.1
> > > > > > > > >
> > > > > > > >
> > > > > > >
> > > > > >
> > > > > > This publicly archived list offers a means to provide input to the
> > > > > > OASIS Virtual I/O Device (VIRTIO) TC.
> > > > > >
> > > > > > In order to verify user consent to the Feedback License terms and
> > > > > > to minimize spam in the list archive, subscription is required
> > > > > > before posting.
> > > > > >
> > > > > > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > > > > > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > > > > > List help: virtio-comment-help@lists.oasis-open.org
> > > > > > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > > > > > Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> > > > > > List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> > > > > > Committee: https://www.oasis-open.org/committees/virtio/
> > > > > > Join OASIS: https://www.oasis-open.org/join/
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

