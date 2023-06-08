Return-Path: <virtio-comment-return-6251-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B74BC7EE23
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 15:11:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E883C4282A
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 15:11:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CF16C986671
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 15:11:20 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C4E6B986655; Thu,  8 Jun 2023 15:11:20 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B30CF98666B
	for <virtio-comment@lists.oasis-open.org>; Thu,  8 Jun 2023 15:11:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: BaLZzV4tPXafPDSaFU1P0g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686237077; x=1688829077;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+NFCRFQdshMnbZjvBtV5csQMk26wTGvsFRJOPbUgmj8=;
        b=PxvPn4PqxfKPi2aEBG5RnNM/IHYFRyxue0LOJ2+hdYb4R+rv1OohOnyYC+iWEMzhV1
         pfPnQcvMQltPJcHuftyiX4ogFl33qAzczO4S6ayre+oJlG56gtD00oqHwbygno5aRlcy
         Lxhv0ByeqpzNsaW06rIMdi28PhAB4cYTsfcut/MwTU+4Mk/uxohkQHaGFL88B3YLwdhl
         XyhaJqUhG9IkkCDZIHlVLPSIQ5gGmw6y3TYJVRAVAKpIpvQF/tvapB2vwKupe0WgcsTu
         nPKK/RkboUuJLhcqGkFgXRkNNVzmGiSRGkabZ0EbSXj60Ujbdn3LJw3kfpzDyCnTBk4J
         UMNA==
X-Gm-Message-State: AC+VfDxlhqlVa3fxD76fZYesTaL13EfCtr0J0VMEY8qzyZEuQ+JGqIxS
	IwScCpJwfGxOfnjcqpP5z0/0iQVSInOvSecjozU4KYRMcwapFfnAIp6B5AqtqXL2JwKPsTAVFt9
	DmJ/brlrDk7VE0QUsiS05O/nx7ztYwcTAAQ==
X-Received: by 2002:a7b:c7cf:0:b0:3f7:e6be:bba5 with SMTP id z15-20020a7bc7cf000000b003f7e6bebba5mr1801265wmk.28.1686237077603;
        Thu, 08 Jun 2023 08:11:17 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5KPVm1Les08WcxptIehJniKifcfyqpcKlHROJYDSdWyeLej3MCu1IzWySzXKf/bKadTgkYZw==
X-Received: by 2002:a7b:c7cf:0:b0:3f7:e6be:bba5 with SMTP id z15-20020a7bc7cf000000b003f7e6bebba5mr1801237wmk.28.1686237077258;
        Thu, 08 Jun 2023 08:11:17 -0700 (PDT)
Date: Thu, 8 Jun 2023 11:11:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Laurent Vivier <lvivier@redhat.com>, Cindy Lu <lulu@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"alvaro.karsz@solid-run.com" <alvaro.karsz@solid-run.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
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
	"si-wei.liu@oracle.com" <si-wei.liu@oracle.com>
Message-ID: <20230608110649-mutt-send-email-mst@kernel.org>
References: <20230606175511.2337208-1-eperezma@redhat.com>
 <20230606175511.2337208-2-eperezma@redhat.com>
 <PH0PR12MB5481D1ACC60311CE48D622CFDC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230606151520-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54815243B0C6942A0E5B6B5FDC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CAJaqyWdKsbCiZqp=kNQOoaD6ooB+m2pcUB+nSLU3e5gCyLL1bQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWdKsbCiZqp=kNQOoaD6ooB+m2pcUB+nSLU3e5gCyLL1bQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] RE: [PATCH 1/2] virtio: introduce selective
 queue enabling

On Thu, Jun 08, 2023 at 01:53:32PM +0200, Eugenio Perez Martin wrote:
> On Tue, Jun 6, 2023 at 9:25 PM Parav Pandit <parav@nvidia.com> wrote:
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Tuesday, June 6, 2023 3:20 PM
> > > >
> > > > Can you please highlight, current spec normative which indicates that
> > > > all queues must be enabled before DRIVER_OK and more queues cannot be
> > > > enabled after DRIVER_OK?
> > >
> > >
> > > This one:
> > > \drivernormative{\subsection}{Device Initialization}{General Initialization And
> > > Device Operation / Device Initialization}
> > >
> > > it does not say "all queues" if you want to split hairs but I think assuming it's
> > > safe to enable queues later is dangerous.
> > >
> > Yes, I have read it few times and every time I concluded that:
> > it does not say that it must be done before DRIVER_OK and cannot be done after DRIVER_OK.
> >
> 
> I also read it this way to be honest.

You have been doing spec lawyering for too long, take a step
back, take a walk, then look at it from common sense POV.


Well spec says: you MUST follow this order:
- A
- B
- C

can one conclude that if C triggers then B already happened?

I would conclude yes.



and just because it does not say *and do not do it in any other
order* you are saying
- A
- C
- B

is also allowed?

MUST follow this rule to me means "and do not violate this rule".




> From a POV, to allow it if a
> device does not handle it could be considered a fix, rather than an
> addition.

I think vhost user at least is started at DRIVER_OK and at
that point it looks at # of enabled Qs and allocates a bunch
of arrays to match.


> I'm assuming we need to modify the standard just because it was not
> explicitly allowed. To explicitly allow it before DRIVER_OK was not
> needed because it was already widespread.
> 
> It would be great for me if we agree the device must support it, but
> maybe it is just too late for that.
> 
> Thanks!
> 
> > > E.g. vhost user backends tend to assume no new queues appear after
> > > DRIVER_OK.
> >
> > This backend implementation can be improved without introducing new bits on the guest side.
> > Q reset is already a second example that demonstrates that queues will be disabled/enabled after DRIVER_OK.
> >
> > And for PCI transport, PCI device and driver do not restrict queue_enable access after DRIVER_OK.
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

