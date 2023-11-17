Return-Path: <virtio-comment-return-8471-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D04F1C197A0
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 13:58:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2D95541F28
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 13:58:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0D54A986E2D
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 13:58:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E9635986E21; Fri, 17 Nov 2023 13:58:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D965A986E24
	for <virtio-comment@lists.oasis-open.org>; Fri, 17 Nov 2023 13:58:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: crS659MyMFCD8yO3p_pBmw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700229512; x=1700834312;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ACM1TKIgPA9pTXMR2IifAs9QbgzJs67mlDwFcVDGRmk=;
        b=q0mZHf35+cxYfOhomSUgAI6+5ZqtEWOuRnmDmj5jInfPzOs7Zh02gGFXsWinIH4jot
         fpiD4M3iY2O9zEusJTn7gOCMd1dwbhtgwptpfLjCUQ+uqRje+FL6/jhf18eUL6Frme3Z
         57ygBf/MS9JtKu3KtiRT8YkI5gecKh63K2cGeRki+lRAHb1ibwBzIfoPmaAZL/x4Ysvo
         F0qPUxLepcwWgxu0MU5iM46xamnHk/h+G+bw76U8756QTQjUA846lZz6JbR9leh0Pgvu
         cauyWpbQMfEX0He0SlXAul5KSZZubHr4bnV3yu/wL6X/oOHoYxDNbS0CtfppFFzC2K9D
         8oJg==
X-Gm-Message-State: AOJu0YzKJbfcxphOF8gUjUUz0vaharA5QHIKAZaeGygKBSnA8KravBoI
	o3hmM7sU34UVQ8Fxfh76MH2uaUzQc9SEl4Uyk5P4+jdlzBS+kgZVOWTMBgdyMtEtP7r1v7mt4G2
	1cg86ZgIHnd5yQZ8GQQB3QKQ9sDQYpEfq6w==
X-Received: by 2002:adf:f392:0:b0:32d:570b:c0a4 with SMTP id m18-20020adff392000000b0032d570bc0a4mr12135983wro.27.1700229512666;
        Fri, 17 Nov 2023 05:58:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZUSLerJt7Jo8iDNGD0pL0uKhKOOkG0i/5Kx97Wxe5PNvpMpvW8NeIiWZ87Xz8KaOtwF2Wcg==
X-Received: by 2002:adf:f392:0:b0:32d:570b:c0a4 with SMTP id m18-20020adff392000000b0032d570bc0a4mr12135963wro.27.1700229512352;
        Fri, 17 Nov 2023 05:58:32 -0800 (PST)
Date: Fri, 17 Nov 2023 08:58:25 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
	"lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Message-ID: <20231117085422-mutt-send-email-mst@kernel.org>
References: <CACGkMEuSpZ0Y8kxXv26b38pvX--OCdvWm5KvMniqo=W10ruBTA@mail.gmail.com>
 <PH0PR12MB5481170EBDD5A8EBFF6C84C7DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117050838-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481101F980800BDAB4EB24CDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117061122-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54819ACE638B70505B131B28DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117064344-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481BEBAA57399B3A9CF2795DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117073250-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481473DCF72D2CB13AC61C6DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481473DCF72D2CB13AC61C6DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands

On Fri, Nov 17, 2023 at 12:49:36PM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Friday, November 17, 2023 6:07 PM
> > To: Parav Pandit <parav@nvidia.com>
> > 
> > On Fri, Nov 17, 2023 at 12:15:54PM +0000, Parav Pandit wrote:
> > > Hi Alex, Jason,
> > >
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Friday, November 17, 2023 5:20 PM
> > > > To: Parav Pandit <parav@nvidia.com>
> > >
> > > > > > Allocating resources on outgoing migration is a very bad idea.
> > > > > > It is common to migrate prcisely because you are out of resources.
> > > > > > Incoming is a different story, less of a problem.
> > > > > >
> > > > > The resource allocated may not be on same system.
> > > > > Also the resource allocated while the VM is running, so I don’t see a
> > problem.
> > > >
> > > > > Additionally, this is not what the Linux kernel maintainers of
> > > > > iommu subsystem
> > > > told us either.
> > > > > Let me know if you check with Alex W and Jason who build this interface.
> > > >
> > > > VFIO guys have their own ideas, if they want to talk to virtio guys
> > > > they can come here and do that.
> > >
> > > Since one of the use cases would have accepted to let dirty tracking to fail, I
> > dont see a problem.
> > > This is not the only command on source that fails.
> > > So I anticipate that QEMU and libvirt or any vfio user would build the
> > orchestration around the possible failure because the UAPI is well defined.
> > >
> > > When there is hypervisor, that must have zero failures on src side, such kernel
> > + device can build everything reserved upfront.
> > >
> > > Do you say, QEMU has zero memory allocations on source side for migration?
> > > That would be interesting to know.
> > 
> > More or less yes. More precisely while in theory allocations it's doing can fail in
> > practice it happens rarely enough that QEMU does not even bother checking
> > and will immediately crash if they do. The reason is that it's using virtual
> > memory, so it scales to a huge number of VMs.
> > Migrating a single VM at a time is not even worth discussing.
> 
> Wow that is even much worse to crash the running VM, instead of failing the migration.

I am telling you.  It does not practically crash because it does not
allocate physical memory.

> I have live migrated VMs one by one and have seen customers migrate on hyperconverged systems. Ofcourse it was not QEMU.
> Single VM migration is real and used by cloud operators.
> Why would you ignore it?

I guess they only have single tenant hosts then? Because each tenant
might request migration at any time.
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

