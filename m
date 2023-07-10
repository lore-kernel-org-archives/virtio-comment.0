Return-Path: <virtio-comment-return-6804-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B489EB64D9
	for <virtio-comment@archiver.kernel.org>; Mon, 10 Jul 2023 05:50:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A40B82B005
	for <virtio-comment@archiver.kernel.org>; Mon, 10 Jul 2023 05:50:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8CB4C986462
	for <virtio-comment@archiver.kernel.org>; Mon, 10 Jul 2023 05:50:21 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 72419983FEA; Mon, 10 Jul 2023 05:50:21 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0242498640C
	for <virtio-comment@lists.oasis-open.org>; Mon, 10 Jul 2023 05:49:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: DaebEid-NouJL8nzCr9Jtg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688968146; x=1691560146;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KZvYUtBh4bNEBR83pVZ33X6bY50MRuPTK33QZ+iRiNM=;
        b=ZslgiETqJOYIBD13fuTYe3G+ltRfyJ7X8v4E682dJ654tchs4roYjmFa0A06Uw+f+p
         Sx3BbdmvRjlxN3S0R2yTVaMi5nLFNrVbD+M383atfdGo70LEZwq55iUgpvgjcOfM5PrT
         sMOullQzMC9aXZxVp20qmdd5V5HEQcX6sper2btr/Wjq5yl1+r5HqOT9ee8Uc/75V18n
         xS9Nz1jp3gaY+uKvwB0olgjQcBJuNPqFbh+cz0zj9c5AuVzSwu3B4dFny2NWIsRQ0rNs
         M6K1e6OktErR3V9j+rzJSmfVk7IPpLjav9VdrFAIxAjBNtYj1h1CIKF0SUrCe3CskzsH
         GuWA==
X-Gm-Message-State: ABy/qLZ5qDtm3Bxapk/KgL09FxnNr3CZ6ZD3JwMs6hVfs7vRCLmaiMjN
	IpLjlhPI6jtD8l6iUfaLXkiAZrqmmNkGAqjg4J9c8lf5jYtsjVnYsDPh8tQuVBBGPs34kiJNFKk
	kvoLwxNd5BkeNY7DFl2HaPgmmPtxMYMd3nA==
X-Received: by 2002:a05:600c:2186:b0:3fc:e00:5282 with SMTP id e6-20020a05600c218600b003fc0e005282mr2668747wme.0.1688968146573;
        Sun, 09 Jul 2023 22:49:06 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEE45qTU+54f4VFD17ephQn0Zw5LXsB+d8IT/pF7N/xnHqy+mrdi/A+ZOg3QybWMsprzFPyVg==
X-Received: by 2002:a05:600c:2186:b0:3fc:e00:5282 with SMTP id e6-20020a05600c218600b003fc0e005282mr2668726wme.0.1688968146287;
        Sun, 09 Jul 2023 22:49:06 -0700 (PDT)
Date: Mon, 10 Jul 2023 01:49:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>,
	virtio-comment@lists.oasis-open.org,
	Laurent Vivier <lvivier@redhat.com>, Cindy Lu <lulu@redhat.com>,
	cohuck@redhat.com, alvaro.karsz@solid-run.com,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Liuxiangdong <liuxiangdong5@huawei.com>,
	Gautam Dawar <gdawar@xilinx.com>, longpeng2@huawei.com,
	Dragos Tatulea <dtatulea@nvidia.com>, parav@nvidia.com,
	stefanha@redhat.com, Harpreet Singh Anand <hanand@xilinx.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Heng Qi <hengqi@linux.alibaba.com>,
	Zhu Lingshan <lingshan.zhu@intel.com>,
	Shannon Nelson <snelson@pensando.io>, mgurtovoy@nvidia.com,
	si-wei.liu@oracle.com, Yan Vugenfirer <yvugenfi@redhat.com>
Message-ID: <20230710014740-mutt-send-email-mst@kernel.org>
References: <20230606175511.2337208-1-eperezma@redhat.com>
 <CAJaqyWe6nR_5bAfuqBfDJY8T-OPfHcjoYbXMyEQEEgL5Oko8WQ@mail.gmail.com>
 <CACGkMEub3RmrXfagZk9CH1t9r=-vaVu6anqEREqw4nphh9PxPQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEub3RmrXfagZk9CH1t9r=-vaVu6anqEREqw4nphh9PxPQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] [PATCH 0/2] Selective queue enabling

On Mon, Jul 10, 2023 at 11:55:50AM +0800, Jason Wang wrote:
> On Fri, Jul 7, 2023 at 2:19 AM Eugenio Perez Martin <eperezma@redhat.com> wrote:
> >
> > On Tue, Jun 6, 2023 at 7:55 PM Eugenio Pérez <eperezma@redhat.com> wrote:
> > >
> > > This series allows the driver to start the device (as set DRIVER_OK) with only
> > > some queues enabled, and then enable another queues later.
> > >
> > > This is the current way to migrate net device state through control
> > > virtqueue, in a software assisted framework with vDPA:
> > > * First, only net CVQ is enabled at DRIVER_OK
> > > * All the control commands (mac address, mq, etc) needed for the device
> > > to behave the same as the source of migration are sent
> > > * Finally all the dataplane queues are enabled.
> > >
> >
> > Adding Yan to the thread, who mentioned that he is looking for
> > something similar in the virtio-networking upstream meeting.
> 
> Would there be a V2?
> 
> Thanks

I'm not sure we need to bother at this point. In linux
we seem to have agreed to use a mix of RING_RESET and
a vdpa specific thing. Non-vdpa solutions don't seem to
need this. Right Parav?

> >
> > > Eugenio Pérez (2):
> > >   virtio: introduce selective queue enabling
> > >   virtio: pci support virtqueue selective enabling
> > >
> > >  content.tex       | 15 +++++++++++++--
> > >  transport-pci.tex |  4 ++++
> > >  2 files changed, 17 insertions(+), 2 deletions(-)
> > >
> > > --
> > > 2.31.1
> > >
> > >
> > >
> > > This publicly archived list offers a means to provide input to the
> > > OASIS Virtual I/O Device (VIRTIO) TC.
> > >
> > > In order to verify user consent to the Feedback License terms and
> > > to minimize spam in the list archive, subscription is required
> > > before posting.
> > >
> > > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > > List help: virtio-comment-help@lists.oasis-open.org
> > > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > > Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> > > List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> > > Committee: https://www.oasis-open.org/committees/virtio/
> > > Join OASIS: https://www.oasis-open.org/join/
> > >
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

