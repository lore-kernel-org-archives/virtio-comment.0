Return-Path: <virtio-comment-return-8621-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE6DC61DF4
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 12:20:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id DFA223E570
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 12:20:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C407E9868B0
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 12:20:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A8B909862D9; Fri, 24 Nov 2023 12:20:33 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 16DD39868A5
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 Nov 2023 12:19:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: sphIpB1wMryp2NC-JIq5oQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700828353; x=1701433153;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lMRakrPnJuvHyXW2lhkGU63tLx/MtyGusKz3g7ECEwg=;
        b=to33T3iR0gFlDjbKgvIGfoudVnoALuhm1FwBoUE1Mh20RgZEY7hgiAN3Fa5XSbyV5A
         kBjdAfgcK8B1UcgsA3THhMWC6GUj+JrYrt90siQDBCbqy837G/WuD8sJfXLYhPJKKRl4
         rS0ELTIactW5oby1t/bl43Hyp9ykGgNe0S9OOUe/TxV+dtYv/DQA9GXIZsraThfBre9I
         +T7yrV6elnyainzZinx4AXzQ42A0WcF9Xk575Z3xzmMx//WzxoX+LLjjvN+CC4IGj9yv
         a26PtUwh7KWOnoAlsZqsBg43YJFbqZe5Zwlz4plXMw+Xhdku5ONoaQ+pA+hzrTiHgT39
         KEfQ==
X-Gm-Message-State: AOJu0YzCZn7Y5/hYWfnE00M2HoL6Q0a4hs4ewo0BVXuNbsm9KMrBlD6a
	gRjBXdhHIX6mDgkQKoUTKUbJx0O4+dyZ/+PmM+b+gyANdrYCwmWJjXLE5MkWa6YF7S52qc+F9Qm
	UBzY7cV/QTaIxWXGedPnvo9vwixjnjRaa6Q==
X-Received: by 2002:a17:906:71cd:b0:a01:c7de:9704 with SMTP id i13-20020a17090671cd00b00a01c7de9704mr1962107ejk.68.1700828353346;
        Fri, 24 Nov 2023 04:19:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGhT+95kbs3UFuqAf9oJtoN/MLbWIIs4j5Qdgvmps3M00u2qMp7iHt28A1aN2elYboRtqasRA==
X-Received: by 2002:a17:906:71cd:b0:a01:c7de:9704 with SMTP id i13-20020a17090671cd00b00a01c7de9704mr1962089ejk.68.1700828353061;
        Fri, 24 Nov 2023 04:19:13 -0800 (PST)
Date: Fri, 24 Nov 2023 07:19:07 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231124071735-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB5481089119BAB97C8F4B7CE0DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsQorfXDUAv-oesSAVM4A4AdaGuutJ0-5uqGTe1f0kXQw@mail.gmail.com>
 <PH0PR12MB548197D801989844FAA702B5DCBBA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEuCMYYDss=Wmk=03Wpr3Gg2+Cy0tCf-X8r+N1PcjYayVg@mail.gmail.com>
 <PH0PR12MB5481C748270CCD8255ED869EDCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsYoC7wd70gNu1OXRh7nHGyyaTDm7-GQehJp6QOY8DmFQ@mail.gmail.com>
 <20231124063537-mutt-send-email-mst@kernel.org>
 <CACGkMEsc1879eONsvmOQhpRE0BZ1jRcrd1t-hKrTBLNmPbsDjg@mail.gmail.com>
 <20231124070519-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548162F9198208DE4569F032DCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB548162F9198208DE4569F032DCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Fri, Nov 24, 2023 at 12:13:07PM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Friday, November 24, 2023 5:40 PM
> > 
> > On Fri, Nov 24, 2023 at 07:51:06PM +0800, Jason Wang wrote:
> > > On Fri, Nov 24, 2023 at 7:38 PM Michael S. Tsirkin <mst@redhat.com>
> > wrote:
> > > >
> > > > On Fri, Nov 24, 2023 at 11:07:53AM +0800, Jason Wang wrote:
> > > > > How TDISP/attestation is related to a specific device driver? How
> > > > > can a legacy DPDK driver break things like attestation here?
> > > > >
> > > > > > Hence it is not applicable.
> > > > >
> > > > > Wow. The legacy tunnel was just invented by you for just several
> > > > > months and soon became a second-class citizen in the proposal here?
> > > >
> > > > Legacy is not going to be a 1st class citizen and that was a
> > > > concious decision the TC made.
> > > > In particular we know straight
> > > > away that there is no way to make them safely work while preserving
> > > > assumptions confidential computing guests make (which I guess is
> > > > what you mean here).
> > >
> > > Probably, but I think we need to support its migration without TD.
> > 
> > Ah, migration of legacy guests is an interesting point.
> > Bringing up TD was just confusing.
> > 
> > I expect this to be rather painless to add precisely because this proposal does
> > not reply on either modern or legacy pci layout. But details need to be
> > thought through, I agree. I don't see why this is not applicable - definitely
> > people are used to be able to migrate these guests.
> >
> The current layout in device context is for the modern.
> The legacy one will be just another enum and struct that will be added subsequently.

Worth adding. The difficulty is when to send which state for
transitional devices. E.g. do they just always send both?
Don't shoot from the hip, Think about this, please and
address in the next version.


> > 
> > > > The whole point of isolating legacy mess in the special commands was
> > > > so we don't try to support them going forward, don't try to add new
> > > > features for legacy interfaces please.
> > >
> > > Thanks
> > >
> > >
> > > >
> > > > --
> > > > MST
> > > >
> 


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

