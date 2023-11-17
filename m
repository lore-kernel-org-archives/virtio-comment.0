Return-Path: <virtio-comment-return-8476-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E70C197A0
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 14:59:14 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id DC3F542A77
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 14:59:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B2EAC986E33
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 14:59:13 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 92FA4986E25; Fri, 17 Nov 2023 14:59:13 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 82DD8986E26
	for <virtio-comment@lists.oasis-open.org>; Fri, 17 Nov 2023 14:59:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: WvRr_vgAOUyRbX3DVmZvrQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700233150; x=1700837950;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9I1pRynjeOn0LIXy+7kVHHvYyo7wC9t0LAKzaKCJ0Og=;
        b=KvbMAM6db8RWi8v9erzootkmJL6nBWB+0SndRk0F2Xv/Nm2eZ7Z3dxDDL4Itzl8tNP
         f9Hc9Ke746hhysWkXa+jR+3ofknp1mfWQY3AhVmWUfcAdzeMbAQS7QJyKmMWEimgTMsB
         0wQeiz6fUFDPA4k2E8dEGxIH3q6mKVGYkMQj34l55uGccH2+Xewe+GDD24Sk0u7HhzON
         CDNlNSTzcmJGD8u8GIN599eizrYNeX77dqDt3CyuihDOFKuJ0qYpw9+gLyKkeeFm03M4
         5JcubAz9Bb51WqRsYoStICz5DrXBgKcNw8a76gzC1n6Ma2XyxUvslxc33H4G3lonUwVV
         KWVg==
X-Gm-Message-State: AOJu0YyiSxJL27J6v0zulbEY5TQhaQsDo3JLSAAJEb/ATw7QbP5KVBt5
	XB6VTC8O7JguTCUCjOu2o0g1W0EXe1jpJBt+1B8GaIE7TVHnbmBiGoMVB+e+99Kq4tEXSO3OsLn
	I7L4PBqefJaJn2Bgoj2HGnROzDobv/z9YNA==
X-Received: by 2002:a05:6000:120c:b0:32d:857c:d51d with SMTP id e12-20020a056000120c00b0032d857cd51dmr11814513wrx.60.1700233150080;
        Fri, 17 Nov 2023 06:59:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQwY4WizzQxDJfgDBkks8OzllKOOjdjxKD4PWV85XA2eXhw04XfjnYkIY+Cr9gsAMGS13NKA==
X-Received: by 2002:a05:6000:120c:b0:32d:857c:d51d with SMTP id e12-20020a056000120c00b0032d857cd51dmr11814498wrx.60.1700233149686;
        Fri, 17 Nov 2023 06:59:09 -0800 (PST)
Date: Fri, 17 Nov 2023 09:59:05 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>,
	Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231117095755-mutt-send-email-mst@kernel.org>
References: <20231117054650-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54813446F8F2BBDBC74BF393DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117063304-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548179702B4F7B460E09681CDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117065740-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C905833821171814CB13DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117073031-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548103A393411CF8357B85DEDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117085848-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481E5431DFCF96F622A7696DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481E5431DFCF96F622A7696DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands

On Fri, Nov 17, 2023 at 02:48:37PM +0000, Parav Pandit wrote:
> > Could you post some numbers too then?  I want to know whether that would
> > imply that VM boot is slowed down significantly too. If yes that's another
> > motivation for pci transport 2.0.
> It was 1.8 sec down to 480msec.
> The time didn't come from pci side or boot side.
> 
> For pci side of things you would want to compare the pci vs non pci device based VM boot time.

I mean setup currently requires same config as vm load. so it will take
about 1 second? That's very bad.
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

