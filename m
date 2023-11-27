Return-Path: <virtio-comment-return-8636-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBDE3C4167B
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 11:28:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1D52E3E577
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 11:28:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DC5B89863D8
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 11:28:16 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B5FF398638E; Mon, 27 Nov 2023 11:28:16 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A7E48986394
	for <virtio-comment@lists.oasis-open.org>; Mon, 27 Nov 2023 11:28:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 5CNX0A9MNs6jZQKj2yaNlQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701084491; x=1701689291;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ngxi6z1Lv9plKIMezJS8QgcaY2bgVa8MJURVLVx9e0=;
        b=nQMUKmArTtUowPBAiS55uGhSqVObkGHqw4xeyYQOUwj5aD8arG21jGK1hyRMYI/VhP
         rWla2y/T9RXmJNOADx6AiMw7CwwojbTl4wL/gahpMQr3LDpVSuyAAWT2M9wzUJuNumcJ
         yWgPXn+bifLoeNh8cMeHWBteE16ZB8KFM2/7xmStMvv6i0yq0k8cnBqXbzX3QvKjx25q
         +49oLf/BR7ZB+JobCnS97iKZE4WNXZYfkntp5MSmH+m8LjvviAGeG2T2UvhVwICpDpi8
         hoPxtFULpAz82SkSjTg4UWzNIunK8Yo1TwUyeJOYK4lGAJogPQNlSgjOLcGkfmGUqHVd
         VEQg==
X-Gm-Message-State: AOJu0YwCs6VJrYcs55jfdzJg6qT1aR8o8UTESH8E3fcib0eU+5HkcsGy
	AdyM+g7C9WtdDJgjAtb2nvcSkbQs26nOMUARsDPGSFdb7ZGRZJ9qqE0L0dAm4MwLKmTVcIa3/Ok
	0AJ+PWaNIJ0yj9mCeJSh0Kt+gZoRc843rPQ==
X-Received: by 2002:a17:906:6811:b0:a02:f424:f817 with SMTP id k17-20020a170906681100b00a02f424f817mr7568663ejr.30.1701084491036;
        Mon, 27 Nov 2023 03:28:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWLWhNC50m4xnNEy4eWXqafqhI/CnUbq0aGEkzmwFLYfQb8VoH4t9i8deHOaYi0xTOz6S2OA==
X-Received: by 2002:a17:906:6811:b0:a02:f424:f817 with SMTP id k17-20020a170906681100b00a02f424f817mr7568649ejr.30.1701084490743;
        Mon, 27 Nov 2023 03:28:10 -0800 (PST)
Date: Mon, 27 Nov 2023 06:28:06 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	"si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	Heng Qi <hengqi@linux.alibaba.com>
Message-ID: <20231127062256-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB5481FF2A00B58060D9D69812DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231122094431-mutt-send-email-mst@kernel.org>
 <CACGkMEuEFsByRwTf_hAAZ+7-UuyYz-1wCP4vTpMAW6DbHQzVag@mail.gmail.com>
 <PH0PR12MB5481592754EE68E6F6A79EEEDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124002357-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54812482A68AC708A4E0764BDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124011125-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481437B4AA6C4CD4F1CED5BDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124062907-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548179FEF8CEFA3D509FF471DCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB548179FEF8CEFA3D509FF471DCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v6 2/5] virtio-net: Add flow filter
 capabilities read commands

On Mon, Nov 27, 2023 at 10:19:49AM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Friday, November 24, 2023 5:04 PM
> > 
> > On Fri, Nov 24, 2023 at 06:31:03AM +0000, Parav Pandit wrote:
> > >
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Friday, November 24, 2023 11:48 AM
> > > >
> > > > On Fri, Nov 24, 2023 at 05:40:26AM +0000, Parav Pandit wrote:
> > > > > > we
> > > > > > strongly suggest that *drivers* support both old and new
> > > > > > mechanism, and then *devices* will only implement what's required.
> > > > > There are other examples in the same document that makes things
> > > > > worst
> > > > with old and new.
> > > > >
> > > > > Also there is literally no way to enforce that driver supports
> > > > > both and new. It is just sounds like an excuse to force infinite
> > > > > config space.
> > > >
> > > > There is a very simple method though.  We allow devices to expose a
> > > > subset of features when DMA is not used. So drivers that want
> > > > maximum features will always opt for DMA. We can also strongly
> > > > recommend that all drivers support DMA if available.
> > > Yeah, don't see how this is elegant at all with all mixed bits.
> > 
> > It's elegant because simple low end devices can cheaply implement MMIO and
> > not worry about DMA.
> > 
> It is not of much help in this case because any low end cheap device which want to support flow filter commands need to have CVQ anyway.
> And hence reusing the same CVQ is more elegant that already does the DMA.
> 
> So CVQ is fulfilling all the below needs.
> 1. Single interface for the get/set config flow filters
> 2. DMA the data
> 3. Not have any partial issues

I don't know what these are.

> 4. provides consistent structures that provisioning side will be able to use

Problem for provisioning is extra definitions will be needed, in a
device specific way.

> > > Nor do I see any enforcement, single method via cvq still holds strong.
> > 
> > You don't need to enforce things, if people want to put a lot of RAM on device
> > and put it in a register let them.
> > 
> Not enforced. It uses the CVQ for flow group and flow filter life cycles and for the sharing this config as well.
> Also aligns with stats that rest also agreed on.

I am talking about your attempt to generally say "no more config fields
everything must be in CVQ". I think it's wrong definitiely for non
network devices must sometimes for network too and generally we need
a solution for config over DMA. This specific thing - whether it
fits in CVQ is a separate discussion.


> > >
> > > >
> > > >
> > > >
> > > > > The method proposed here is elegant and clearly promote one way to
> > > > > do
> > > > things for driver and device with predictability.
> > > > >
> > > >
> > > > I don't see it as elegant at all. What is elegant is *a single tag*
> > > > that describes each property of the device. And this single tag should be
> > good for everything:
> > > > driver, provisioning, migration. And config space offset serves as such.
> > > The single tag is the set of structures.
> > 
> > I have no idea how this will work. If migration format i started reviewing is
> > anything to go by then there will be a huge elaborate structure nothing single
> > or simple. By comparison there's already a proposal how provisioning can
> > work by supplying config space.
> > it is just a clean model to grasp.
> > 
> The provisioning model is simple is to supply all the configuration.
> To draw parallels to some sw side,
> 
> There is per functionality socket option to set things, instead of one giant structure.
> There is per functionality ethtool option/cmd instead of Set ALL/get ALL enforcement.

I'm not sure how much of a parallel one can draw.
Do not see a lot of similarity.
Devices commonly use register map. Everyone understands
this paradigm.


I am not altogether happy with the way you are making
migration generate duplicate definitions for lots of
things we already have definitions for.
Having a 3rd one for provisioning? Gimme a break.


> > > Provisioning access them via owner device.
> > > Member driver access them via CVQ or 1.2 legacy config space.
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

