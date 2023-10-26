Return-Path: <virtio-comment-return-7973-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42561C25B6B
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 06:24:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 98A0D2A828
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 06:24:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8183C986A4F
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 06:24:47 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 74907986A46; Thu, 26 Oct 2023 06:24:47 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 65FAF986A47
	for <virtio-comment@lists.oasis-open.org>; Thu, 26 Oct 2023 06:24:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: -hU7Ohf4MxOkWsULBD_YAg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698301451; x=1698906251;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NLdsBO7JBK/0anQJHAtgoGvEQhyQwoRYwBVJpVbdAGY=;
        b=nwia0yKPrKYrVn7QjJyR84m67PVb++m+tmqasVpJD9mcFsgZP4DcfLbPMNr5IE3rIe
         jIY5MxNluWRQUjAUxw57gzqvSeOo5E7nnCdng8pmYxxUGNjJ2hEm80Qp7ettrCBfKPLN
         5c5ao9232Vs9dq7okJq4X570C1icrm/TOaG5Kk9Tnse82p/fYhwHdIZfyDtuRT2FNa83
         7qk6P15vTubAtOAEIBHrRUaVvFgqdYV/4I8ZaEDjnoVx1Qmo3TlpQyjL9ln5fQhWbVPe
         N8grb0D/GX836QioErEUNlH76HRDwbgH095RyNDBasv2Hw10/hKrJ0NniHfI2RjMJDzv
         49dA==
X-Gm-Message-State: AOJu0YxgLdTjaY95qns+QJOkYFK8B8kBhXO25FlmBITYeoV3lOul1nrq
	akKZiNa2u0ZWX6f979+z+GxM+uCOtXfOgqXqv7ipZs3nG++eGgCH34cQH7Hp00M1WzcN+PBV14y
	if+sJ89O/T3MzsoN/tz+OZPgZ30tQ8NgFng==
X-Received: by 2002:a05:600c:198a:b0:408:40e2:773b with SMTP id t10-20020a05600c198a00b0040840e2773bmr13356415wmq.34.1698301451536;
        Wed, 25 Oct 2023 23:24:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkpC0X/onri7JsN2JP/+jmWO90nyta4weGQlQ/Lii/zn8t51fz2l+gZzvHUwNcb8CmBltETQ==
X-Received: by 2002:a05:600c:198a:b0:408:40e2:773b with SMTP id t10-20020a05600c198a00b0040840e2773bmr13356400wmq.34.1698301451130;
        Wed, 25 Oct 2023 23:24:11 -0700 (PDT)
Date: Thu, 26 Oct 2023 02:24:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Cornelia Huck <cohuck@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20231026022349-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB5481A3846046A484EFE20408DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87wmvdbehg.fsf@redhat.com>
 <PH0PR12MB548172C89C0213867F765012DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87ttqhbcy7.fsf@redhat.com>
 <PH0PR12MB5481723C85AF5B80689C9084DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB548149234F6B8F894387FAAADCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231025062207-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5480246A4E61D071C4C60A69DCDDA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231026013059-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54811806D9195E8611DBF7F3DCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54811806D9195E8611DBF7F3DCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage

On Thu, Oct 26, 2023 at 06:02:28AM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Thursday, October 26, 2023 11:10 AM
> 
> > 
> > shorter: i.e. after FEATURES_OK is set and before DRIVER_OK is set.
> 
> Ok.
> 
> > If VIRTIO_F_RING_DYNAMIC is negotiated,
> > the driver can choose to enable some virtqueues after DRIVER_OK is set.
> Ok. will take this simpler version.
> 
> > 
> > 
> > >
> > > > > > +enable every virtqueue it wants to use before setting the
> > > > > > +DRIVER_OK status bit; the driver can choose to enable a
> > > > > > +virtqueue even after the driver has set the DRIVER_OK status bit.
> > 
> > 
> > 
> > 
> > >> The virtqueue enable
> > > > > > +mechanism is
> > > > > > transport specific.
> > 
> > 
> > 
> > 
> > I still feel there is no real explanation in a transport agnostic manner what does
> > it mean to "enable" virtqueue. Do you maybe just mean "configure virtqueue"?
> > 
> There is explanation of "re-enabling" a virtqueue in section " Virtqueue Re-enable".
> 
> There is no good example of "configured" in generic section either, other than cleanup and mmio section.
> 
> > 
> > Can we just avoid talking about "enabling"?
> > Is it true that you can basically change anything you want about the vq not just
> > the enable bit? If so talking about enabling is just confusing I think.
> Not really.
> Enabling sequence of a virtqueue for pci and mmio transport is:
> 
> 1. select a q
> 2. program the addresses
> 3. set the enable bit
> 
> However, as I think more, this one-way interface of driver instructing the device without any error code and without any response is just too limiting interface.
> I will be dropping this series that misuses the config registers beyond its intended init time use.
> 
> Let me work on more mature interface that solves following challenges.
> 1. ability to create a virtqueue dynamically after driver_ok
> 2. ability to create virtqueue with one or multiple physical addresses
> 3. ability for the device to return error if it cannot create dynamic vq creation
> 
> The question is, do we need this generic facility beyond virtio-net?

Wow, sounds rather complex.

-- 
MST


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

