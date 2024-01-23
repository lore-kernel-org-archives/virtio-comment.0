Return-Path: <virtio-comment-return-8999-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B575CC47258
	for <virtio-comment@archiver.kernel.org>; Tue, 23 Jan 2024 07:15:23 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0CA90339BE
	for <virtio-comment@archiver.kernel.org>; Tue, 23 Jan 2024 07:15:23 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DFCC39866E2
	for <virtio-comment@archiver.kernel.org>; Tue, 23 Jan 2024 07:15:22 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C3172986689; Tue, 23 Jan 2024 07:15:22 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B1F469866BA
	for <virtio-comment@lists.oasis-open.org>; Tue, 23 Jan 2024 07:15:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: CEH-Ho5DMgWRhb6Wyhi8Rg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705994118; x=1706598918;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xwFJ1ADOjQ8lVh70pLq8arFz+FxFCQwVqeEtXQGd7Ok=;
        b=gVnebb9C8ljNrLO8zhsykcqkO/qtuqxGxBAmE8cLz/KwVYJ/go7WE0e1loDHz2BDV5
         LJHknXuALb3VYu7au/RDsICoBlAXBYpa93BF+hWnGkwDLfklv5upH3uSa6WNlwDf6YBo
         8sGdKgZhLx5VkhMIUdLew43brIClE9VaXgH5a3NAHa9vrPin7a6wmt7tlAvR4tRMS8Un
         Hw9VUkkD4iBnryGKWLbhmY2CoNFqtHLgq+VgPXRV/6MB5pZXKwen0CImDOW5bAimDdzF
         5Lj2LHV7SgbaYntjKP9nSlnTI+/bhcmolzTMvykjNFx2xHMAjaEGmI7dPDFg8prmuTWY
         gBxg==
X-Gm-Message-State: AOJu0YxzWYyQqO6Nfbx2FLpgUvVrXNQu3+qBFAQZGmU5+6ozv+H3v6M6
	AgzHjHlQhyBA6zWhwyYf728hm8ObNULDHI6akOumsbZCxm4hq+pmRDD+Q9Lsq+2X8mik3qcA9RF
	16W4Rziqj6qzgKLR3ea/CPdhm7mCrcWWcME3iz5nYwSE/XuzGxuHtB/okr3YTdCdARzjIPTI=
X-Received: by 2002:a05:600c:3ba4:b0:40e:691f:23ad with SMTP id n36-20020a05600c3ba400b0040e691f23admr251609wms.10.1705994118401;
        Mon, 22 Jan 2024 23:15:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQctnYBQ1fX9BnI1MrYzj8ygCfLvduh9NnnfykI2A+03XKHP/8w0BZmehicLlykPyUulkFHQ==
X-Received: by 2002:a05:600c:3ba4:b0:40e:691f:23ad with SMTP id n36-20020a05600c3ba400b0040e691f23admr251601wms.10.1705994118067;
        Mon, 22 Jan 2024 23:15:18 -0800 (PST)
Date: Tue, 23 Jan 2024 02:15:15 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Heng Qi <hengqi@linux.alibaba.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Message-ID: <20240123020653-mutt-send-email-mst@kernel.org>
References: <1705323962-96063-1-git-send-email-hengqi@linux.alibaba.com>
 <PH0PR12MB5481EA21646CEA571FF2D3F9DC6C2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <3977e2c2-f514-4b51-a646-6f729df7403d@linux.alibaba.com>
 <DM8PR12MB5480872B5E7A67D65325485BDC772@DM8PR12MB5480.namprd12.prod.outlook.com>
 <db56402e-2432-4902-b58d-6b43a4f1dd0e@linux.alibaba.com>
 <PH0PR12MB5481E1A236C868B671275DCBDC752@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240122022002-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481AB6AAB87DEDC345B1A0EDC742@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481AB6AAB87DEDC345B1A0EDC742@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] RE: [virtio-dev] RE: [virtio-comment] [PATCH
 v2] virtio-net: support setting coalescing params for multiple vqs

On Tue, Jan 23, 2024 at 05:55:02AM +0000, Parav Pandit wrote:
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Monday, January 22, 2024 1:06 PM
> > 
> > On Mon, Jan 22, 2024 at 05:03:38AM +0000, Parav Pandit wrote:
> > > > >>> The right test on Linux to do without rtnl lock which is anyway
> > > > >>> ugly and
> > > > >> wrong semantic to use blocking the whole netdev stack.
> > > > >>> (in case if you used that).
> > > > >> Do you have any good directions and attempts to remove rtnl_lock?
> > > > >>
> > > > > I think per device lock instead of rtnl is first step that we can start with.
> > > >
> > > Wil check internally who if someone already started working on it.
> > 
> > I feel the issue is at the conceptual level. 
> Not for requests which are initiated by the kernel stack (non user initiated).

So how is this different? Is it basically just because
tweaking coalescing in unexpected ways is considered mostly
harmless?

> > Yes some drivers will take a command
> > and just queue it for execution later, but this means that errors can not be
> > propagated back at all. Imagine device with mac
> > 0x123 in promisc mode. Now commands:
> > 
> > 1- program MAC 0xabcdef
> > 2- disable promisc mode
> > 
> User initiated commands error can be propagated when the command completes.
> Enqueuing command is at the different bottom level in the driver.
> 
> > If command 1 fails but 2 proceeds then packets with MAC 0xabc will be
> > dropped.
> > 
> > Any attempts to batch arbitrary commands will have this issue - be it at driver
> > or device level.
> > 
> There is no suggestion to batch arbitrary commands from the driver side.
> The suggestion is to batch VQs notification coalescing from the driver side.
> 
> > So, here's my question: what exactly is the guest behaviour that is driving this
> > work? Is it with a linux guest? 
> At least looks to me yes based on the partial patches which are taking rtnl lock on netdim's worker callbacks.
> 
> > which commands does userspace issue that we
> > need to send multiple vq coalescing commands?
> None.
> 
> >  If all you want is to send
> > same config to all VQs then why not just use
> > VIRTIO_NET_CTRL_NOTF_COAL_RX_SET as opposed to
> > VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET ?
> Only kernel stack initiated VQ notification coalescing changes.
> Since every VQ has different values, VIRTIO_NET_CTRL_NOTF_COAL_RX_SET is not sufficient.


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

