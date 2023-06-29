Return-Path: <virtio-comment-return-6627-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 113E1EB64D9
	for <virtio-comment@archiver.kernel.org>; Thu, 29 Jun 2023 21:57:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 607562B016
	for <virtio-comment@archiver.kernel.org>; Thu, 29 Jun 2023 21:57:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 295E89866EE
	for <virtio-comment@archiver.kernel.org>; Thu, 29 Jun 2023 21:57:01 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0FFA0986677; Thu, 29 Jun 2023 21:57:01 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F192698667F
	for <virtio-comment@lists.oasis-open.org>; Thu, 29 Jun 2023 21:57:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: cUBwhOM1OVCXm2UIihFRTQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688075818; x=1690667818;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mc0Ydp3t8193HZ67rOenwZem4LfL6tyyjqG/jodyl+c=;
        b=BjM5jdbEDi0AB1XHT5TNICySk0P5OhYUUqjaR74H584uNxtioLjerqrWYbnJ8mZtbh
         CXVW+0zRQOj0bVVmPXPWVyPrDRmD1bP1MMaSPbH53KhRedGwqei1WWcsFBhKZWY4K6nR
         XARFL3FGyFJJ15TJnOWlWVx4Qn8NwSP5Kl6F+KxNoOW4coPKPbQNuewhWOUD9ZG+M81D
         fZXDAjIiPp3MT3PbzA623IMx8OATrHtav08FEs1VltnlWXzAiALpkrBP/KD0X4jP1/tl
         +PPUwsc/yRrJf8kP162kCpYixBOJd45NkSAP3f/zRETdbJ0xv/wUI525D6eLJkj2Iu8u
         7Wdw==
X-Gm-Message-State: ABy/qLa83lYGL5mQZ+djG8tX2d80lxp7GsTlZY1iB07+Qcb7On/ILyz2
	4C5ZVyDksLha9UcDtZYcshD0aZaylxH5boTPjbmgAAGiR7sj53KRvzmd/GihEIIFq0LfWihcgw9
	mp+xgpnYSdLUeMysFS9/jwMWIfuB9X6M4dQ==
X-Received: by 2002:a5d:6445:0:b0:312:74a9:8262 with SMTP id d5-20020a5d6445000000b0031274a98262mr605744wrw.62.1688075817936;
        Thu, 29 Jun 2023 14:56:57 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFJNLCSWBsvbU5J0bQWC/tnB5lBv6cFsfcKQEHOPS7StnvMPPmNRwqRdBqMZbZ3LuA+1FiRjA==
X-Received: by 2002:a5d:6445:0:b0:312:74a9:8262 with SMTP id d5-20020a5d6445000000b0031274a98262mr605734wrw.62.1688075817648;
        Thu, 29 Jun 2023 14:56:57 -0700 (PDT)
Date: Thu, 29 Jun 2023 17:56:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"david.edmondson@oracle.com" <david.edmondson@oracle.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"sburla@marvell.com" <sburla@marvell.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230629175234-mutt-send-email-mst@kernel.org>
References: <20230627211050.1527507-1-parav@nvidia.com>
 <20230627211050.1527507-4-parav@nvidia.com>
 <20230629154634-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481E7610F4941C615617CA0DC25A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230629174443-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548102851D796A39FEC61275DC25A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB548102851D796A39FEC61275DC25A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v7 3/4] admin: Add group member legacy register access
 commands

On Thu, Jun 29, 2023 at 09:50:45PM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Thursday, June 29, 2023 5:46 PM
> 
> > > > Or preferably I would just include that tex right here to avoid the
> > > > need to jump back and forth.
> > > >
> > > We have vq notify config data as generic and transport specific
> > > listing,
> > 
> > But note how that is included directly in multiple places - not a link. In the
> > resulting PDF it appears inline.
> 
> For notify data structure is not defined, so its little simpler.
> Here for AQ command structure is defined in the generic section as just bytes.
> 
> I have mixed feelings; I think definition in transport and link in generic section is fine.
> Are you ok with that?

I am yet to focus on wording, can't tell you for sure.  My gut feeling
is that keeping everything in one place would be more readable, will
help us converge more quickly, and the next user of admin commands is
expected to be SIOV which would need the same structure anyway (it's
also PCI).

Also look at virtio_pci_notify_cap and check whether any
normative statements there should apply here. Alignment I guess?

> > 
> > > So will improve this part of text with link.
> > 
> > anyway, that's not part of ABI.


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

