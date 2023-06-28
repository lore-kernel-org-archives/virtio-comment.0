Return-Path: <virtio-comment-return-6571-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350A9EB64DC
	for <virtio-comment@archiver.kernel.org>; Wed, 28 Jun 2023 10:48:09 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5BBE3F3F47
	for <virtio-comment@archiver.kernel.org>; Wed, 28 Jun 2023 10:48:08 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 396F698658B
	for <virtio-comment@archiver.kernel.org>; Wed, 28 Jun 2023 10:48:08 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 22D0098656E; Wed, 28 Jun 2023 10:48:08 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0EF1198656F
	for <virtio-comment@lists.oasis-open.org>; Wed, 28 Jun 2023 10:48:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 23zdanB9NDa61Xwy9Lpmeg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687949284; x=1690541284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SVxinU5f7dlDhe327Sb9bJFETxerMLKi0MYEXgxQWng=;
        b=YjHrIYxViXm+pM4EkpW3HglyTPsZlgYnP+liaE0lCkAvmmgs6LwYlhY7usAb0IdnuX
         A2DTgn7bKNURxryuTgFSkg0nTZ3TMv2TU0S57SPk84LRUEZ9SkR1O56AOHAhPKPlk+Dx
         HU7GzNcIzSgYPFRriyy6IxaXVg7DGI76sOylqt90gVfEYvRqlSztV/w0UJQ2v/mc38KY
         2QZ4fuWDfM8eLg/V4LTxJ6c8q2Z4xgqNrk4fh7b2AlLjMoqoa44Db3nbe9oLxnlsvKBi
         S1B1APAqfZ8bVk/QZ6wBEFmj2ZgJUevyxl+KgK6VzHNE3PbKu1NCkkbBIG/VTjOD8qY/
         6row==
X-Gm-Message-State: AC+VfDzOdExAzG6KYa4Dg++0GkV2KBoR0Bm+tNq0ELRWzODQLBBNvk6s
	6zFDGIFqZSdeUg/xFBRNS1WrfBPcT8aQjT5pyFrfCf6wzwbkZRM0KFdNkjB2hSIcMDxHnw/Be6n
	vSjsGlTYRE7CEf4iXc0ibGuYVciP2MmarlA==
X-Received: by 2002:a7b:c7d8:0:b0:3fa:935e:e185 with SMTP id z24-20020a7bc7d8000000b003fa935ee185mr11181518wmk.22.1687949284582;
        Wed, 28 Jun 2023 03:48:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7dmNCWj9wdsmbEhmxG64LQaiP37Eh///9ClSfeYAUTL+IVfHWRq6vXVq2kx2a6kzey4XnRPg==
X-Received: by 2002:a7b:c7d8:0:b0:3fa:935e:e185 with SMTP id z24-20020a7bc7d8000000b003fa935ee185mr11181490wmk.22.1687949284207;
        Wed, 28 Jun 2023 03:48:04 -0700 (PDT)
Date: Wed, 28 Jun 2023 06:47:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Heng Qi <hengqi@linux.alibaba.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	Jason Wang <jasowang@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Cornelia Huck <cohuck@redhat.com>
Message-ID: <20230628064137-mutt-send-email-mst@kernel.org>
References: <20230622130359-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481367BAA5DE0BAA33DBAA8DC22A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230622132837-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481B65F624B16200B91B0AADC22A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230622140412-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481BE907C0BBACC00389091DC22A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230622143626-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54812621EAFA660735B3A8F0DC22A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230622145052-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481532370A0525D0B4AB30EDC22A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481532370A0525D0B4AB30EDC22A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [virtio-dev] Re: [virtio-comment] Re:
 [PATCH v18] virtio-net: support inner header hash

On Thu, Jun 22, 2023 at 08:27:48PM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Thursday, June 22, 2023 3:02 PM
> 
> 
> > > Existing fields used by existing drivers must be in MMIO.
> > > Device does not have a choice.
> > 
> > They can if they like mask some less important features reducing the footprint.
> How do to that? How would device know to not have existing fields on MMIO?

As you said yourself, feature bits also have cost. They must be
accessed with DMA too, not through MMIO.
This set of features can have more bits than the one in MMIO.


> > This will be the cost/benefit analysis each vendor does separately.
> > 
> > Case in point, if inner hash support is in 1.3, and linux drivers don't really use
> > that at all for a year or two because it's only used by alibaba in their stack, and
> > by the time linux starts using them it also supports the new commands, then
> > practically devices do not care and can just mask the feature bit in MMIO.
> > 
> Once it lands to config space, it becomes existing fields.

What's in which version of the spec is immaterial.  If all guests using
it also support config space through DMA then it does not matter that
technically there was a spec version which had inner hash but not DMA.

> More below.
> > 
> 
> > > > If they want to cut at 1.3 time, they can, but they also can cut it
> > > > at 1.2 time, this means some features will not be accessible through
> > > > MMIO only through the new commands.
> > > >
> > > New commands services new fields by newer driver.
> > > Newer driver can call new command to get new and old fields both.
> > 
> > yes.
> > 
> > > So 1.3 and 1.4 devices cannot optimize for older drivers.
> > 
> > 
> > I don't know what this means.
> > 
> I guess next below question answers it.

I still don't know what did you mean by "So 1.3 and 1.4 devices cannot
optimize for older drivers". If it's immaterial, fine.

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

