Return-Path: <virtio-comment-return-6752-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD396EB64D9
	for <virtio-comment@archiver.kernel.org>; Thu,  6 Jul 2023 16:51:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B3A4660363
	for <virtio-comment@archiver.kernel.org>; Thu,  6 Jul 2023 16:51:08 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 49063986919
	for <virtio-comment@archiver.kernel.org>; Thu,  6 Jul 2023 16:51:08 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2BB499868D5; Thu,  6 Jul 2023 16:51:08 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EA72D98687E
	for <virtio-comment@lists.oasis-open.org>; Thu,  6 Jul 2023 16:51:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 0eUwX0m2NSyTmWht6CbyGQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688662264; x=1691254264;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QpzNEdxIKJZ+BQlN6Ca3peKTKi8NtfhLIxeAN1kxlko=;
        b=ixbtZnSP/pkgPiKeCwuD2RwJGK7k5aR/yiMiyJaO2FwsGpUwPImFRM+syS0IDwfp9R
         C5D/PicUKXh7YHyEInTeKVZgEEpPpFAY1iABHYRZPwhnP1wy/WjGKiFSuISLLC6MRFQK
         6XEFhTAjtuN8VHprdYQzp/+4li0GmU3qXmSYLNvOJqDxCeT/7mmzU0LdZgIf9bTGxNmg
         X60U28FCR0GSYI4PCVitNPtDxB0KYuPfnt4yAvH9QrlQAI+szjDEAUjaG0nx8T/3mzal
         U/dfa4/3QlG3k0zLWPvMG/SQf2O6It8gRCdC6A9hzLGzLcSj6pdAsiLgF3Nduw6eJ9T0
         VFTw==
X-Gm-Message-State: ABy/qLZI1Jc5EOeRFY6wTiT1C64d4KmZ3LJGI8acT3mT98Q7mCF8L5E1
	14Uxd/3J1WsLI5Gru0uxZRx0hBPtPkJlKj6IPktMI+85RyiVi9rchk49FTnQETvCzhTccS3Hrra
	ICF0BQtz2oLCvMXYf6AVO6+BOCtY2KklfNQ==
X-Received: by 2002:a05:600c:1d04:b0:3fb:b075:8239 with SMTP id l4-20020a05600c1d0400b003fbb0758239mr5487550wms.4.1688662264305;
        Thu, 06 Jul 2023 09:51:04 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE/ea7m5TWVG0LLBFRUY6jPQ9MDI/bBYQ5plHSWiKXi3BN9+VIFvfw9g9xWA6ZGz2BLzUrepw==
X-Received: by 2002:a05:600c:1d04:b0:3fb:b075:8239 with SMTP id l4-20020a05600c1d0400b003fbb0758239mr5487533wms.4.1688662263908;
        Thu, 06 Jul 2023 09:51:03 -0700 (PDT)
Date: Thu, 6 Jul 2023 12:50:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Cornelia Huck <cohuck@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"david.edmondson@oracle.com" <david.edmondson@oracle.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"sburla@marvell.com" <sburla@marvell.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230706125001-mutt-send-email-mst@kernel.org>
References: <20230706041714.65600-1-parav@nvidia.com>
 <20230706041714.65600-5-parav@nvidia.com>
 <87r0pluhqy.fsf@redhat.com>
 <20230706123220-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481FC84712B83663691BB5FDC2CA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481FC84712B83663691BB5FDC2CA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v10 4/4] transport-pci: Introduce group legacy group
 member config region access

On Thu, Jul 06, 2023 at 04:45:50PM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Thursday, July 6, 2023 12:39 PM
> 
> > > > +The group owner device or the group member device or both MAY
> > > > +support driver notifications region.
> > >
> > > Make this "a driver notification region"?
> > 
> > I think in fact for conformance we can just refer to supporting the command.
> > The command can return an array of structures, each referring to the memory
> > of the owner device or the member device.
> >
> Array and referring to owner/member is already present in this patch.


I don't see a statement that devices MAY support VIRTIO_ADMIN_CMD_LEGACY_NOTIFY_QUERY
with entries returning just owner, just member, or both.

> Do you suggest to drop above statement?

> > 
> > > > +
> > > > +For the SR-IOV group type, the owner device supporting
> > > > +VIRTIO_ADMIN_CMD_LEGACY_COMMON_CFG_READ,
> > > > +VIRTIO_ADMIN_CMD_LEGACY_COMMON_CFG_WRITE,
> > > > +VIRTIO_ADMIN_CMD_LEGACY_DEV_CFG_READ,
> > > > +VIRTIO_ADMIN_CMD_LEGACY_DEV_CFG_WRITE and
> > > > +VIRTIO_ADMIN_CMD_LEGACY_NOTIFY_QUERY
> > > > +commands and its member device SHOULD follow the rules for the PCI
> > > > +Device ID,
> > 
> > what does "its" mean here? Of the group?
> Yes, will change to the member device of the group.
> 
> > Members of the SR-IOV group type are VFs. They can not follow the rules for
> > the Device ID: the spec says:
> > This field in all VFs returns FFFFh when read.
> > 
> > Even if you somehow refer to the software it's extraneous anyway since the
> > spec proceeds: VI software should return the Vendor ID value from the
> > associated PF as the Vendor ID value for the VF.
> > 
> > We'll need a separate statement for Device ID.
> >
> Will split the line for Device ID.
>  
> > > > +Revision ID and Subsystem Device ID of the non-transitional devices
> > > > +documented in section \ref{sec:Virtio Transport Options / Virtio Over PCI
> > Bus / PCI Device Discovery}.


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

