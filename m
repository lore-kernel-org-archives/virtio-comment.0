Return-Path: <virtio-comment-return-6241-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA062C7EE23
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 14:40:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3B1D233584
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 14:40:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2E555986674
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 14:40:02 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 21E5A98666B; Thu,  8 Jun 2023 14:40:02 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 112A898666C
	for <virtio-comment@lists.oasis-open.org>; Thu,  8 Jun 2023 14:40:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: tOPZ79bbNyG7xVzdQJcltQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686235196; x=1688827196;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D0adNSk4aRec7uNpag7SGyjCtwD/VQ6iyWKiYmBavMA=;
        b=QSXWWCgYNk4e82Et8IPbezRCGpDQ+eBPdYLYfqR/+7T+OtifIjsqrBlBJB9Bj7NBvY
         hyk6i0+60PLnv8sKt7jD7gajml4Oy/obccRJRAaDEFtrZAD2A7qXyu4KqBXO6b21Num0
         uoYWVqhy19ps/AWUQv8o2y8WDonqkNxmqT7Z8voDJluODQ2J5W5NOpOEX456BFHBEGro
         euhxGW/m7jcS5n4FCtsbh0wVEwn0hORTKMrGsFEbC4qbHv8/H9QyOqnHrNgValjDPKLu
         HuR3XZ+JRZER+UyTjV2lQno1P++jcJoH9TLySx6Np9x/y3S7/C+UgkMTUWoVO7BjPfff
         riaQ==
X-Gm-Message-State: AC+VfDxO5DoJlVrMrlfKk6qhB9TV3rbH0aQh9PEjHLEFfQNEUDQZS/Wu
	DsZqcIWu0joV/Hnfeng4oaQ1cxkgYQdbQniz84bmWBf2QJZ4Y00kveRcjnM1n8CKAk/+UM08zme
	04h6JGK/Z16k64JrR9G4yfXj36T2vSSC+Sg==
X-Received: by 2002:a05:6512:942:b0:4f3:bb93:4c8b with SMTP id u2-20020a056512094200b004f3bb934c8bmr2773083lft.19.1686235195995;
        Thu, 08 Jun 2023 07:39:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ681rAr4WEKG2SvU3zJUapmgBkwze6iaFy1S7cc/QdSR49MnwPwtCfWD/BxYeOiaxlTDpolQA==
X-Received: by 2002:a05:6512:942:b0:4f3:bb93:4c8b with SMTP id u2-20020a056512094200b004f3bb934c8bmr2773075lft.19.1686235195596;
        Thu, 08 Jun 2023 07:39:55 -0700 (PDT)
Date: Thu, 8 Jun 2023 10:39:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Laurent Vivier <lvivier@redhat.com>, Cindy Lu <lulu@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"alvaro.karsz@solid-run.com" <alvaro.karsz@solid-run.com>,
	Liuxiangdong <liuxiangdong5@huawei.com>,
	Gautam Dawar <gdawar@xilinx.com>,
	"longpeng2@huawei.com" <longpeng2@huawei.com>,
	Dragos Tatulea <dtatulea@nvidia.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	Harpreet Singh Anand <hanand@xilinx.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Heng Qi <hengqi@linux.alibaba.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	Zhu Lingshan <lingshan.zhu@intel.com>,
	Shannon Nelson <snelson@pensando.io>,
	Max Gurtovoy <mgurtovoy@nvidia.com>,
	"si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	Parav Pandit <parav@nvidia.com>
Message-ID: <20230608103816-mutt-send-email-mst@kernel.org>
References: <20230606175511.2337208-1-eperezma@redhat.com>
 <20230606175511.2337208-2-eperezma@redhat.com>
 <PH0PR12MB5481D1ACC60311CE48D622CFDC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230606151520-mutt-send-email-mst@kernel.org>
 <1686226293.022929-1-xuanzhuo@linux.alibaba.com>
 <CAJaqyWdusP1DXGV4==ddVRjh9FaTcu2u-4d03_4kOaf2Zom+GQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWdusP1DXGV4==ddVRjh9FaTcu2u-4d03_4kOaf2Zom+GQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH 1/2] virtio: introduce selective
 queue enabling

On Thu, Jun 08, 2023 at 04:18:23PM +0200, Eugenio Perez Martin wrote:
> On Thu, Jun 8, 2023 at 2:24 PM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
> >
> > On Tue, 6 Jun 2023 15:19:53 -0400, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > On Tue, Jun 06, 2023 at 06:04:32PM +0000, Parav Pandit wrote:
> > > > Hi Eugenio,
> > > >
> > > > > From: Eugenio P閞ez <eperezma@redhat.com>
> > > > > Sent: Tuesday, June 6, 2023 1:55 PM
> > > > >
> > > > > This patch allows the driver to start the device (as set DRIVER_OK) with only
> > > > > some queues enabled, and then enable another queues later.
> > > > >
> > > > > This is the current way to migrate net device state through control virtqueue, in
> > > > > a software assisted framework with vDPA:
> > > > > * First, only net CVQ is enabled at DRIVER_OK
> > > > > * All the control commands (mac address, mq, etc) needed for the device to
> > > > > behave the same as the source of migration are sent
> > > > > * Finally all the dataplane queues are enabled.
> > > > >
> > > > > Signed-off-by: Eugenio P閞ez <eperezma@redhat.com>
> > > > > ---
> > > > >  content.tex | 15 +++++++++++++--
> > > > >  1 file changed, 13 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/content.tex b/content.tex
> > > > > index d2ab9eb..ea4a6d8 100644
> > > > > --- a/content.tex
> > > > > +++ b/content.tex
> > > > > @@ -99,10 +99,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a
> > > > > Virtio Device / Feature B  \begin{description}
> > > > >  \item[0 to 23, and 50 to 127] Feature bits for the specific device type
> > > > >
> > > > > -\item[24 to 41] Feature bits reserved for extensions to the queue and
> > > > > +\item[24 to 42] Feature bits reserved for extensions to the queue and
> > > > >    feature negotiation mechanisms
> > > > >
> > > > > -\item[42 to 49, and 128 and above] Feature bits reserved for future extensions.
> > > > > +\item[43 to 49, and 128 and above] Feature bits reserved for future
> > > > > extensions.
> > > > >  \end{description}
> > > > >
> > > > >  \begin{note}
> > > > > @@ -398,6 +398,13 @@ \section{Virtqueues}\label{sec:Basic Facilities of a
> > > > > Virtio Device / Virtqueues}  Every driver and device supports either the Packed
> > > > > or the Split  Virtqueue format, or both.
> > > > >
> > > > > +\subsection{Virtqueue selective enabling}\label{sec:Basic Facilities of
> > > > > +a Virtio Device / Virtqueues / Selective Virtqueue Enable}
> > > > > +
> > > > > +If the driver negotiates VIRTIO\_F\_RING\_ENABLE\_ANYTIME, it can
> > > > > +enable individual virtqueues both before and after the DRIVER\_OK. The
> > > > > +way to enable a virtqueue is transport specific, but it mimics the
> > > > > +re-enabling after an hypothetical reset.
> > > > > +
> > > > >  \subsection{Virtqueue Reset}\label{sec:Basic Facilities of a Virtio Device /
> > > > > Virtqueues / Virtqueue Reset}
> > > > >
> > > > >  When VIRTIO_F_RING_RESET is negotiated, the driver can reset a virtqueue
> > > > > @@ -870,6 +877,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved
> > > > > Feature Bits}
> > > > >   \ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits} for
> > > > >   handling features reserved for future use.
> > > > >
> > > > > +  \item[VIRTIO_F_RING_ENABLE_ANYTIME(42)] This feature indicates  that
> > > > > + the driver can enable a queue both before and after DRIVER\_OK.
> > > > > +  See \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Selective
> > > > > Virtqueue Enable}.
> > > > > +
> > > >
> > > > Can you please highlight, current spec normative which indicates that
> > > > all queues must be enabled before DRIVER_OK and more queues cannot be
> > > > enabled after DRIVER_OK?
> > >
> > >
> > > This one:
> > > \drivernormative{\subsection}{Device Initialization}{General Initialization And Device Operation / Device Initialization}
> > >
> > > it does not say "all queues" if you want to split hairs but I think
> > > assuming it's safe to enable queues later is dangerous.
> >
> > Although there is no "all queues" here, if the queue is not ready, the device
> > may use all the queues after "Device OK". So I also think it might be dangerous.
> >
> > But I also ran into this problem. We want the device to support 100 queues, but
> > we also want to use only 16 queues by default. The user can then manually scale
> > up to 100, if the user has a large memory.
> >
> > So I think, the point is that "num_queues" is the max and default value. Can we
> > change "num_queues" to default, then we introduced a new value as max.
> >
> > Does this way solve your problem? @Eugenio
> >
> 
> It would need a tweak, but it gives me an idea.
> 
> I think you're talking about what the device offers, isn't it? I would
> need to modify it from the driver.
> 
> But it has an interesting question, how to allocate "less vrings" than
> virtio_pci_common_cfg.num_queues?

Just allocate less, don't configure what you do not use.

> I guess it is ok to set all vq
> addresses to a vring that never increments avail_idx? The driver still
> needs to allocate memory for that one and lose start time configuring
> them.
> 
> Maybe for net is valid to leave them unconfigured? it should only use
> one vq pair and CVQ by default.

It's ok for all devices, and this is how it always worked.

> My proposal could be done at the virtio-net level, allowing
> max_virtqueue_pairs to be 0 from the beginning. For example, allowing
> the driver to write it before DRIVER_OK. In that case, no data vq is
> enabled and only CVQ process requests after DRIVER_OK. After all the
> config is written, the driver changes the number of active queues with
> VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET.
> 
> I think it is better solved in a generic way, but I'm ok with this
> -net specific too.
> 
> Thanks!
> 
> > Thanks.
> >
> >
> >
> > >
> > > E.g. vhost user backends tend to assume no new queues appear
> > > after DRIVER_OK.
> > >
> > > --
> > > MST
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

