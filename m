Return-Path: <virtio-comment-return-7872-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E515DCDB474
	for <virtio-comment@archiver.kernel.org>; Fri, 20 Oct 2023 09:41:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2576B72347
	for <virtio-comment@archiver.kernel.org>; Fri, 20 Oct 2023 09:41:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0B45098692E
	for <virtio-comment@archiver.kernel.org>; Fri, 20 Oct 2023 09:41:24 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id EA864986926; Fri, 20 Oct 2023 09:41:23 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DB8B4986927
	for <virtio-comment@lists.oasis-open.org>; Fri, 20 Oct 2023 09:41:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: umXeeelQO5qwlqWa2tyisQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697794880; x=1698399680;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yFIe8tGgFQgyHxFbKzlT909jBWuY9zrmqMAWSUskPBo=;
        b=L4F11jiVXt5kaptN2AugVzb9qBpwLYgbHsAjJ9b2ZxBMCZckQiC4lXrZDn1y+Oh3Cc
         0nh4LNEAbWud17Y8hBcDfItJjrURI2fGPw5ZmqLiQpUsfRI8Q9lUa1pKUD8Ccpxf5MUU
         /XQVFduqI8OA34eeegvsQwgAq+MMV2mUHskR7hVkbBrxwUPYDr5NWkY+ZIdOLhaJzk8Y
         m9xJjc3XJIMGsn2JiZOYa0X4tK7RcZuGqiCpDzMqjLRJlsPYYxvr6pVdptaHBlpGEiQo
         YXM+j/w9qBa9H2eh9mxwbCNEYTL04huKeYgUqraanJfiLw4Lxz21gqjFfGL7WulZCOuv
         4GjQ==
X-Gm-Message-State: AOJu0YxplQc2NC4ZLjpqrkW3LC/bHimN97ayHBFSet0WVpOI1qSjNWyy
	kTdMXCee5wcIqVmU9VNIjIGgmv6y0+xLjbmRnGdt60CBfrEGTilx0S3aXeh/NGa1heGImvOwrMb
	Uwt+pu6T6UwBAl1RM0XBzLCi+RG9kPLt5FQ==
X-Received: by 2002:a05:6000:1f07:b0:32d:9cd3:6a9d with SMTP id bv7-20020a0560001f0700b0032d9cd36a9dmr990435wrb.25.1697794880025;
        Fri, 20 Oct 2023 02:41:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaHigs6on2m9VE2r4Y6/oC7V8dE/6z+gqAVO/ntssKJ27C3R/lHj5L57TRHWR16CFscPQmyg==
X-Received: by 2002:a05:6000:1f07:b0:32d:9cd3:6a9d with SMTP id bv7-20020a0560001f0700b0032d9cd36a9dmr990420wrb.25.1697794879647;
        Fri, 20 Oct 2023 02:41:19 -0700 (PDT)
Date: Fri, 20 Oct 2023 05:41:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231020053534-mutt-send-email-mst@kernel.org>
References: <860e52ef-8cfc-408a-b3cc-2551ef6118d1@intel.com>
 <PH0PR12MB5481F6F9BC5158481EC36AE9DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <cd9431cc-a5ed-4b11-a341-dc129e8ea630@intel.com>
 <PH0PR12MB54819087A0B542F587A4BEC2DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <7bc82c01-19ad-4180-914b-9304e10ef7c3@intel.com>
 <PH0PR12MB5481E858791CA8FD97C7F35EDCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019051406-mutt-send-email-mst@kernel.org>
 <daea1f54-1c85-4a4a-ac3a-c5ae97180e03@intel.com>
 <PH0PR12MB5481BE51210D429FA12EAB45DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fb012148-a71e-4856-95fe-6e75f011f3fb@intel.com>
MIME-Version: 1.0
In-Reply-To: <fb012148-a71e-4856-95fe-6e75f011f3fb@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

On Fri, Oct 20, 2023 at 05:31:01PM +0800, Zhu, Lingshan wrote:
> 
> 
> On 10/19/2023 6:33 PM, Parav Pandit wrote:
> > > From: Zhu, Lingshan <lingshan.zhu@intel.com>
> > > Sent: Thursday, October 19, 2023 2:48 PM
> > > 
> > > On 10/19/2023 5:14 PM, Michael S. Tsirkin wrote:
> > > > On Thu, Oct 19, 2023 at 09:13:16AM +0000, Parav Pandit wrote:
> > > > > > Oh, really? Quite interesting, do you want to move all config space
> > > > > > fields in VF to admin vq? Have a plan?
> > > > > Not in my plan for spec 1.4 time frame.
> > > > > I do not want to divert the discussion, would like to focus on device
> > > migration phases.
> > > > > Lets please discuss in some other dedicated thread.
> > > > Possibly, if there's a way to send admin commands to vf itself then
> > > > Lingshan will be happy?
> > > still need to prove why admin commands are better than registers.
> > Virtio spec development is not proof based approach. Please stop asking for it.
> > 
> > I tried my best to have technical answer in [1].
> > I explained that registers simply do not work for passthrough mode
> > (if this is what you are asking when you are asking prove its better).
> > They can work for non_passthrough mediated mode.
> > 
> > A member device may do admin commands using registers. Michael and I are discussing presently in the same thread.
> > 
> > Since there are multiple things to be done for device migration, dedicated register set for each functionality do not scale well, hard to maintain and extend.
> > A register holding a command content make sense.
> > 
> > Now, with that, if this can be useful only for non_passthrough, I made humble request to transport them using AQ, this way, you get all benefits of AQ.
> > And trying to understand, why AQ cannot possible or inferior?
> > 
> > If you have commands like suspend/resume device, register or queue transport simply don’t work, because it's wrong to bifurcate the device with such weird API.
> > If you want to biferacate for mediation software, it probably makes sense to operate at each VQ level, config space level. Such are very different commands than passthrough.
> > I think vdpa has demonstrated that very well on how to do specific work for specific device type. So some of those work can be done using AQ.
> > 
> > [1] https://lore.kernel.org/virtio-comment/870ace02-f99c-4582-932f-bd103362dae9@intel.com/T/#m37743aa924536d0256d6b3b8e83a11c750f28794
> We have been through your statement for many times.
> This is not about how many times you repeated, if you think this is true,
> you need to prove that with solid evidence.
> 
> 
> For pass-through, I still recommend you to take a reference of current
> virito-pci implementation, it works for pass-through, right?

Current migration implementation in e.g. QEMU? It does but it
traps data path accesses. That, I think we can agree,
should not be the only option to migrate.

> For scale, I already told you for many times that they are per-device
> facilities. How can a per-device facility not scale?
> vDPA works fine on config space.
> 
> So, if you still insist admin vq is better than config space like in other
> thread you have concluded, you may imply that config space interfaces should
> be re-factored to admin vq.

There are good arguments that yes, virtio needs a transport for config space
that is DMA based as opposed to memory mapped based.  This is one of the
things all vendors seem to prefer in IDPF so virtio should have the option.


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

