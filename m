Return-Path: <virtio-comment-return-8418-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD4ABC072A2
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 09:37:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1E4089344C
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 09:37:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F1622986E24
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 09:37:53 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D7FEE986E1A; Fri, 17 Nov 2023 09:37:53 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C76A6986E1B
	for <virtio-comment@lists.oasis-open.org>; Fri, 17 Nov 2023 09:37:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: I4wBYq93OB2JqEX743wBNA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700213869; x=1700818669;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31LYPsZ53S4jcmhtwlFirKuSbGrD8Lkk0VCtvdCaMCc=;
        b=G67F2tBBIcrSvPdHZtzPTQ/RJx6s8f8RyD9IV6CBlvd7ZEZTLFNHVDWek+mHbjV81Y
         L9/3k9pp5LLu4vbbg8F4XB6NOW87owM50chX2tZngHchDnVES+x7sbDd+7TbzgoRuPfi
         0dIvx09EvZOnRKRIBZpNc8DkwwgWmtx1PjvJQdjthOkMJkM/iQX9GLxdSURougmiA5i8
         VsK6Bi6moUcalm32Siy721viv/9UPsCpZrdacsp6C2KgY0GfARn1RXLe64dymLPZ4ufJ
         c2Hev6AOzrWDIeb+CHtQMfwy6BbYRg7+6DN54QY2chQWZySHnNs68zFQwcG9uTLVaxuD
         4unw==
X-Gm-Message-State: AOJu0YyEr779QHwYI5MQxS9hWRdZiGNqzVEU4nTzdczxMYRGCEEToeJd
	+gP0cpnifuOFikwyXfEp5cK3cVplHWA37Dbu39w1p69RK5+fU2iawzKUttUT7DsJlbohHPixQmL
	2gf531raE2WUeia9ZvnfueT6A/8VZoQ2fmQ==
X-Received: by 2002:adf:e589:0:b0:32f:8a1e:6ed9 with SMTP id l9-20020adfe589000000b0032f8a1e6ed9mr12854332wrm.23.1700213869737;
        Fri, 17 Nov 2023 01:37:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGz5NOcKWeNiBL8yO+OPNh6dMD4Ek/wln9+7RpONP93Vv4JYYhFhwVJ84CenPZbIfkYL6sf4Q==
X-Received: by 2002:adf:e589:0:b0:32f:8a1e:6ed9 with SMTP id l9-20020adfe589000000b0032f8a1e6ed9mr12854322wrm.23.1700213869392;
        Fri, 17 Nov 2023 01:37:49 -0800 (PST)
Date: Fri, 17 Nov 2023 04:37:44 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
	"lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Message-ID: <20231117042446-mutt-send-email-mst@kernel.org>
References: <20231116023443-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548118E76BAFD5FA470B92A1DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116064611-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54814EC9577B1197E2A13BDBDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116121958-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481F4D1B07F2809AA7D7C9BDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116131303-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54818DBAE43A566C807E1AE9DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117031251-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D7C85F006AE7292E1D82DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481D7C85F006AE7292E1D82DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of operation for write
 recording commands

On Fri, Nov 17, 2023 at 09:14:21AM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Friday, November 17, 2023 2:16 PM
> > In any case you can safely assume that many users will have migration that takes
> > seconds and minutes.
> 
> Strange, but ok. I don't see any problem with current method.
> 8MB is used for very large VM of 1TB takes minutes. Should be fine.

The problem is simple: vendors selling devices have no idea how large
the VM will be. So you have to over-provision for the max VM size.
If there was a way to instead allocate that in host memory, that
would improve on this.

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

