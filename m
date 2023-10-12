Return-Path: <virtio-comment-return-7695-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30599CDB482
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 13:05:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 991EF190923
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 13:05:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7CED6986838
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 13:05:27 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6F91798660E; Thu, 12 Oct 2023 13:05:27 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6F5D298660F
	for <virtio-comment@lists.oasis-open.org>; Thu, 12 Oct 2023 13:05:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: yp2apzd7Mhq_-y96J8wLmg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697115910; x=1697720710;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DgQsDR68yHUgWFAQWrqCyW6XN4Rk0evSHuMUwQPbojc=;
        b=kRCeCh/46aVJt/KHX68c8Kehz6LPFfLSaT7RgDLpRXEFK5tqB4Lxq3+NHs5kcritGE
         AXi76XnZvNF9WvIqFUBeZadmQwWNteOgnyzYcBaoTQ4jzmwSuwaY4GXWI4i7GBi0HrHQ
         F9fsuaoIntEvZrZND/+YbsIuU8z2dWSBuKdbnPW7tQ7b84UWaCRh5Ehx2cgTb9jqSpH0
         JfsCOGauHYEtoo4DrNhqANUS3qIKm2hvE2FqNvNMaNjqOnDzSb6elrohtaqwSbEIEvuO
         +g0pkSfOio9D4n8Yti/QMavz9XaPNJ0rBP21n4qKWY9uzhqqk/xR+KKraigaIPHXsg3e
         siDg==
X-Gm-Message-State: AOJu0YxP2ARqWQJGwgrfb7w+M/s8p4WPmHLf1xMH2qMAZBcIyRCDmx/a
	7ZpEArogWQSPovt+IzsbR02VYGxPJRYEp6GpoXlceYklTdQIg+qd9EN/I7WBLgypKcYo+iD0l0J
	uu2gZzbrBgH6RL74xBRQ2TFotOYNXlX0KqA==
X-Received: by 2002:adf:e852:0:b0:315:9e1b:4ea6 with SMTP id d18-20020adfe852000000b003159e1b4ea6mr20268903wrn.58.1697115909847;
        Thu, 12 Oct 2023 06:05:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEV4dcUQQBSKW9E++vjLdAOR/4OEH/u4Urp9lQVqczDUvLyo0p7mr5A8+Dm/fB2P8lj1dGFwQ==
X-Received: by 2002:adf:e852:0:b0:315:9e1b:4ea6 with SMTP id d18-20020adfe852000000b003159e1b4ea6mr20268886wrn.58.1697115909530;
        Thu, 12 Oct 2023 06:05:09 -0700 (PDT)
Date: Thu, 12 Oct 2023 09:05:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>,
	Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231012090407-mutt-send-email-mst@kernel.org>
References: <20231009121638-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5480E0F15A1BBDD745EE3AF4DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <25375529-9c40-9ea9-692e-f557c514c72f@intel.com>
 <PH0PR12MB54812E59B581546FFB118F3FDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f875fa3b-4b33-71c2-e612-bc2a674a1e59@intel.com>
 <PH0PR12MB548171A06CCE458C913E4961DCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <97aa9108-0715-2483-f5cf-02698c745d60@intel.com>
 <PH0PR12MB5481F4F3B4FADD79770ADEA6DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231012071355-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481B9BBAF8141F1C606AA1BDCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481B9BBAF8141F1C606AA1BDCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Thu, Oct 12, 2023 at 11:47:05AM +0000, Parav Pandit wrote:
> 
> > From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
> > open.org> On Behalf Of Michael S. Tsirkin
> > Sent: Thursday, October 12, 2023 4:48 PM
> > On Thu, Oct 12, 2023 at 10:58:14AM +0000, Parav Pandit wrote:
> > > Sure, as I explained the config register method do not work for passthrough
> > mode, and does not scale.
> > 
> > And on the flip side, to be frank not everyone has huge guests and numbers of
> > VMs and a slower memory mapped interface for small devices might make
> > sense.  What we need to do though is make this a small non-intrusive part since
> > it's not clear such embedded cases even need live migration.
> 
> I almost sure, I am misunderstanding your point.
> 
> If the VM is small who may not need a performance, may be hypervisor can just offer
> VIRTIO_NET_F_STANDBY.
> 
> I recollect we even accelerated VIRTIO_NET_F_STANDBY flow as well.

standby hack is frankly problematic in that vm can not just be
migrated at any time.


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

