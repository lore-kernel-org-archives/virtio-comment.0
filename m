Return-Path: <virtio-comment-return-8477-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 291A4C072A2
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 15:00:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 845F045B2A
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 15:00:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7C621986E30
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 15:00:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 714DB986E25; Fri, 17 Nov 2023 15:00:33 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 62F9A986E26
	for <virtio-comment@lists.oasis-open.org>; Fri, 17 Nov 2023 15:00:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: VurcIcLnNi2UAWL0k8MGQg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700233229; x=1700838029;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QoAD1VxzirPcrbSQARFeLfb+VXy+wTXYre9Jh9kLdTI=;
        b=CqfvPSfzPq3hAfs2b7rAxwlsl2nhTw4+bi6ye0QXZjydpYDj4RWF7x9BPMBSPcg94H
         6wUDUAH9e8YKUPIOXX376Xs1Ih/VKyTTgvZRVOC4xII4Ls8P9J0MvtLvhSAiTkY2CLBT
         RiW9q4FzefA2EBm1dr9tRMdDvdES2YLenVxWHj6mXiUV6zpHCF6NpMbvzXFsauPTjT5M
         H6/V00v8oZZbUXrcxV+36w5LSZAuer39PcHbXvTxKKGL59aTKvfIYdaO8LMNdNnFXYZQ
         ojcTvoMJZdPECVBvhn5ckdpJCdAszJIGyl9OxtZgOvJF7RaQ8hvba6IuubQuk+bvNqiX
         xaZw==
X-Gm-Message-State: AOJu0YwLuGAtQ3rb+q3ZaTNsG3jS3JIlVlWLac2WEHzFmX5kgKmB+qGh
	xlJvxp6FtOy30cooPCEAhSHvllKYWeNt3Ln47VWm4isV4Jm+3B/bWtD0+JOwtLqGADNTQnNS6MH
	NdqxthXjZXaNHF3wvOPSNMNMRtca6kt/HfQ==
X-Received: by 2002:a2e:9e99:0:b0:2c7:a8a7:9f54 with SMTP id f25-20020a2e9e99000000b002c7a8a79f54mr9143722ljk.47.1700233229291;
        Fri, 17 Nov 2023 07:00:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEl7WgI9DgHHphORD8jpLl/bb0PBBZX7eW6XfRG0dPvLiJltyzjdVrtiGfH9TN8QC/SsILs9Q==
X-Received: by 2002:a2e:9e99:0:b0:2c7:a8a7:9f54 with SMTP id f25-20020a2e9e99000000b002c7a8a79f54mr9143684ljk.47.1700233228698;
        Fri, 17 Nov 2023 07:00:28 -0800 (PST)
Date: Fri, 17 Nov 2023 10:00:24 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
	"lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Message-ID: <20231117095945-mutt-send-email-mst@kernel.org>
References: <20231117050838-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481101F980800BDAB4EB24CDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117061122-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54819ACE638B70505B131B28DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117064344-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481BEBAA57399B3A9CF2795DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117073250-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481473DCF72D2CB13AC61C6DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117085422-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481F53F5B5C932C874498FBDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481F53F5B5C932C874498FBDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands

On Fri, Nov 17, 2023 at 02:49:03PM +0000, Parav Pandit wrote:
> > I guess they only have single tenant hosts then? Because each tenant might
> > request migration at any time.
> Typically, tenant do not initiate the migration. The cloud operator initiates the migration.

Can be at tenant's request.

> And there is some agent in-between to throttle the number of VMs migrating. It also needs to carve some bw on physical network and more.
> 

you are presumably paying for that.

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

