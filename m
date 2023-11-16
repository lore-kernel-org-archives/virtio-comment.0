Return-Path: <virtio-comment-return-8389-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD6EC197A0
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 06:38:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3BC8F1AA3CB
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 06:38:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 188BB986DDB
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 06:38:53 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id F10F6986DD0; Thu, 16 Nov 2023 06:38:52 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E0732986DD1
	for <virtio-comment@lists.oasis-open.org>; Thu, 16 Nov 2023 06:38:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: kUciE7sVN4yDW4mifxZYtg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700116729; x=1700721529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7S1Vieo73ysVUGT8+kwpD3Sgf5KygR9Ud7boMnH9x4c=;
        b=PqMngRi0oA+tH6XS7hcGXNuoKfFZ1/0Dff/jvnEmUIAfL0OaTr8tNUK5s8C2drgB8f
         P5npfLvJ49fY5pNDLEyngi7Rvcj/zzeUVGEqI0gm/dOsHHACyh2LKUkwYQc8rrg6RRfh
         UuCw1ur2P3jXpTYva8g/tMXeRCaYoyTB5lZyoYyIO46v4JRGg64HxUaXNcdsacxJsmAn
         g1VzVGab0eybUDAI1ULA1MwIv+kmhU9NzjfpScEOINxtei7g0g+HVJlNYQNmYuSGNv+U
         mOmjtfPoYOwmPybCLQFwsuWUmV0FFKqqyMRSUZWV8dxhlUeuQKSSDG6T8sFlNRMWcFvo
         jPmQ==
X-Gm-Message-State: AOJu0Yx0b+7UUuxvSTefryvTvmN/v8ou4K8KGn3de+Mk6qxiJRThOw5S
	160ovDyke3uGdHzrjaOnPQj/eAZ2tmqH2x+6DFyAX9yqaQZFtWqXIIteLr8Yho5AcN2C05FPPkU
	PRxooTZnWpZjrFhoZOEUzCv6uZ6VWa9okWQ==
X-Received: by 2002:a05:6000:184c:b0:32f:64f2:815 with SMTP id c12-20020a056000184c00b0032f64f20815mr500780wri.33.1700116729752;
        Wed, 15 Nov 2023 22:38:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEE0bxYvRcxvbXgURI7ey9Fhc4a3LfTLLzbn2x7bMpY5POFN6cRWvo5NT9tf0gWrVE4sp7hqw==
X-Received: by 2002:a05:6000:184c:b0:32f:64f2:815 with SMTP id c12-20020a056000184c00b0032f64f20815mr500768wri.33.1700116729451;
        Wed, 15 Nov 2023 22:38:49 -0800 (PST)
Date: Thu, 16 Nov 2023 01:38:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231116013650-mutt-send-email-mst@kernel.org>
References: <CACGkMEsR56_C2b6-YQFpEOPt4sjJKyqcqrdhi9G0vU9ytezFLQ@mail.gmail.com>
 <PH0PR12MB54811373EA43BEDB4E159E0BDCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsMzp7DjDkQcO4RZ0H0HfxSrytUJrSyDj6gnPWV9cTZow@mail.gmail.com>
 <DM8PR12MB548085F25849CF1E055826E6DCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEsfcEjue1UZmuNs8k65o3HSM94VsweSbWLH3383STR97A@mail.gmail.com>
 <PH0PR12MB548149E1E51DA9C1C094ABCADCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEt277yYUHf98dCkypS-PXzu7JrRSVBAQ2cCRg4XzCLPzw@mail.gmail.com>
 <PH0PR12MB5481DB04DEB1A540185ED1ECDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116012208-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54811F4CE5686AE4BEA826C1DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54811F4CE5686AE4BEA826C1DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Thu, Nov 16, 2023 at 06:34:23AM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Thursday, November 16, 2023 11:53 AM
> > 
> > On Thu, Nov 16, 2023 at 05:28:19AM +0000, Parav Pandit wrote:
> > > You continue to want to overload admin commands for dual purpose, does
> > not make sense to me.
> > 
> > dual -> as a transport and for migration? why can't they be used for this? I was
> > really hoping to cover these two cases when I proposed them.
> For following reasons.
> 
> 1. migration needs incremental reads of only changed context between two reads
> 
> 2. migration writes covers large part of the configurations not just virtio common config and device config.
> Such as configuration occurred through the CVQ. All of these is not needed when done from guest directly via member's own CVQ.
> 
> For backward compatible SIOV transport, one may need them to transport without above two properties.
> 
> 3. None of this transport is needed for PFs, VFs and non-backward compatible SIOVs.
> Each device to have its own transport that is not intercepted by the hypervisor and follow the equivalency principle uniformly for all 3 device types.
> 

To clarify. Above seems to justify why the admin commands for migration
must be distinct from admin commands for transport. But I don't see why
(e.g. two sets of) admin commands can not be used for both. Do you?

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

