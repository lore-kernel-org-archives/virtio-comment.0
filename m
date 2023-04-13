Return-Path: <virtio-comment-return-5459-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F250C77B6E
	for <virtio-comment@archiver.kernel.org>; Thu, 13 Apr 2023 17:20:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 992961FF80
	for <virtio-comment@archiver.kernel.org>; Thu, 13 Apr 2023 17:20:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 79C3F986602
	for <virtio-comment@archiver.kernel.org>; Thu, 13 Apr 2023 17:20:25 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 61EC09865FD; Thu, 13 Apr 2023 17:20:25 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1DB33986600
	for <virtio-comment@lists.oasis-open.org>; Thu, 13 Apr 2023 17:19:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: z0be7Ml9NIG2bK1eOX5dAQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681406388; x=1683998388;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jncgUJ/B0Vp+9U2pj78BUyTcKZQC5hyOuOS4128HBoM=;
        b=RZKIqeoFa+Wja5xyxlDJpT1x0g7j9je7Uf5L/2T0UZvwrw2mj/SceGLi65Ho0mGwQa
         NzAUon2jApYtQ7eL7a3jrtdNdXPjbifKHf/Ub/b5sSRuKlSFMDNkmMTZlc9GXVaE/3XV
         8taSgkp4GNhqFgbYdOc7jH2/sNXA1uRr5kMoBbarfYaXLawCyTCOMDnillIIhagKPYBC
         mRs5AVs0jUSDNE7r53m2xQk89BhlBtmuq6pm4rDLb8LCaV5plnaqGl7ew5+dk6frceQx
         KZYKfW0pDeOqNI4WA8Pu/g7anY1FoVso98Y00Knq8QP22Ju0hvrAEuVUBOMqzXHFfNLw
         EoBg==
X-Gm-Message-State: AAQBX9f7kT9ZlDpLKx6FW1kr49lM+7B8i7rbPphgKuW6y4mH3F3FoxHW
	idLcqwvCU7J1r2T2oizXXmoSV4qnU/nGXJvVw0gC/fNMHYh0etiyJEFX7duq6IZ/XAhaISGqR9S
	7VZowZPvWEdowSCtJB19Z+wu36gAGgdcqYw==
X-Received: by 2002:a7b:c8ce:0:b0:3f0:ad5a:d69f with SMTP id f14-20020a7bc8ce000000b003f0ad5ad69fmr1523065wml.25.1681406388132;
        Thu, 13 Apr 2023 10:19:48 -0700 (PDT)
X-Google-Smtp-Source: AKy350YxVwTJKdJ5rGCVg2oKRRyL7OQzNbk5+os+U4MC+dYgVrQbL4ZDwdZxH/6tkhX2lhD0bYQVjQ==
X-Received: by 2002:a7b:c8ce:0:b0:3f0:ad5a:d69f with SMTP id f14-20020a7bc8ce000000b003f0ad5ad69fmr1523056wml.25.1681406387872;
        Thu, 13 Apr 2023 10:19:47 -0700 (PDT)
Date: Thu, 13 Apr 2023 13:19:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Satananda Burla <sburla@marvell.com>,
	Maxime Coquelin <maxime.coquelin@redhat.com>,
	Yan Vugenfirer <yan@daynix.com>
Message-ID: <20230413130326-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB548118F57BB4B4A4F8DC9D7ADC9B9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvYsz1fSPG+fKpRaZ05Ut7ffKwvMPvR8xbRBsXA_6vGQw@mail.gmail.com>
 <PH0PR12MB548137D7A25C99EAA42B4D12DC9B9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEshW82qztmGw8YJWJ8=QCoRd6cPxQ+ySazxsO_o+U6c4Q@mail.gmail.com>
 <PH0PR12MB548147CF939CB9C2A0586310DC9B9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu2B_GogDR9HUwB7mT8fkGh+Q_buPLz4nhwhK7h9k6BQQ@mail.gmail.com>
 <PH0PR12MB5481F0CF5A555A6BB2CE856CDC9B9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEuNOYOxvcSzrs0UFEyk+xOkGUpOfhK8rOy_Mebz5b5wdg@mail.gmail.com>
 <a74d3107-d38c-df15-e2ff-f848635f24bd@nvidia.com>
 <CACGkMEt+bGN7UYEopXPj0+deAnYm1VUNp05VvGHcJnkd8LzbGg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEt+bGN7UYEopXPj0+deAnYm1VUNp05VvGHcJnkd8LzbGg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH 09/11] transport-pci: Describe PCI
 MMR dev config registers

On Thu, Apr 13, 2023 at 01:14:15PM +0800, Jason Wang wrote:
> > >>>> The proposed solution in this series enables it and avoid per field sw
> > >>> interpretation and mediation in parsing values etc.

... except for reset, notifications, and maybe more down the road.


> > >>> I don't think it's possible. See the discussion about ORDER_PLATFORM and
> > >>> ACCESS_PLATFORM in previous threads.
> > >>>
> > >> I have read the previous thread.
> > >> Hypervisor will be limiting to those platforms where ORDER_PLATFORM is not needed.
> > >
> > > So you introduce a bunch of new facilities that only work on some
> > > specific archs. This breaks the architecture independence of virtio
> > > since 1.0.
> > The defined spec for PCI device does not work today for transitional
> > device for virtualization. Only works in limited PF case.
> > Hence this update.
> 
> I fully understand the motivation. I just want to say
> 
> 1) compare to the MMIO ar BAR0, this proposal doesn't provide much advantages
> 2) mediate on top of modern devices allows us to not worry about the
> device design which is hard for legacy

I begin to think so, too. When I proposed this it looked like just a
single capability will be enough, without a lot of mess.  But it seems
that addressing this fully is getting more and more complex.
The one thing we can't do in software is different header size for
virtio net. For starters, let's add a capability to address that?

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

