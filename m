Return-Path: <virtio-comment-return-8422-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6895C197A0
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 09:51:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 35D73D46F3
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 09:51:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2FF5C986E26
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 09:51:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 24710986E1A; Fri, 17 Nov 2023 09:51:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1624F986E1B
	for <virtio-comment@lists.oasis-open.org>; Fri, 17 Nov 2023 09:51:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: PNKM67IyMcaFKSFacuIO4Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700214693; x=1700819493;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FaEq7CE/1naCecb3yAG7H4F8hKMPws7e9uqzw8l+Za0=;
        b=EoYmBT/m9/lOL4OmOGpkZze0/EQ48BcuR5XpeT8irqOMFqclxWi6PXuaYOYfeMdhpD
         yRmdqPANMIsdF5p+RDXr7PdU1uJMu/FKKSWM2n007IRbklR/59HqPzBZo9gdI71Sr/U5
         oIYAeAiMv9m5SilnDQOHP2Zu6I5xRupy3P3EBe2uP1wa3yTaYPvrUvm1rmJBERrZFLxE
         GzkhajufK5kqqlHJ0Dwgk1Zqkbab3mGfSAGQSrcQ6WFUbp/ARk6sU/+masWUclzH4c6T
         wchLk/PqfHf7fryvHWa4LdzaWd2EVDCspyJO95eLerSnxk9tkyrvpqlVychX+Os9drgj
         YC6A==
X-Gm-Message-State: AOJu0YyvZCYxpzbVfIBsYYof7wbcP6PPYWncxfg+UiYQWqF1HdKWpvLA
	G0Dh0ykJhdKfYOKQxFnu5YzmUDyRbMdHm74+ENMqyVrplQ0f/XjbJpKhqezSlG6knmT0WF+4h/U
	MeUhbbpL7n8CCKUQcmxEdec6KBi3Qv6WUhA==
X-Received: by 2002:a05:600c:1991:b0:405:3e9a:f1e3 with SMTP id t17-20020a05600c199100b004053e9af1e3mr3990551wmq.11.1700214692985;
        Fri, 17 Nov 2023 01:51:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEadrmnKqYynI6YeMzf2Tap7zwjj4jn1avDH+fEUn+IQAtP9k9l4U9THHoA69z8vZAvNwjnsg==
X-Received: by 2002:a05:600c:1991:b0:405:3e9a:f1e3 with SMTP id t17-20020a05600c199100b004053e9af1e3mr3990527wmq.11.1700214692604;
        Fri, 17 Nov 2023 01:51:32 -0800 (PST)
Date: Fri, 17 Nov 2023 04:51:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
	"lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Message-ID: <20231117044428-mutt-send-email-mst@kernel.org>
References: <20231116064611-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54814EC9577B1197E2A13BDBDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116121958-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481F4D1B07F2809AA7D7C9BDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116131303-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54818DBAE43A566C807E1AE9DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117031251-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D7C85F006AE7292E1D82DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117042446-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54813F2F62F87E42CD5DB4B0DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54813F2F62F87E42CD5DB4B0DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of operation for write
 recording commands

On Fri, Nov 17, 2023 at 09:41:40AM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Friday, November 17, 2023 3:08 PM
> > 
> > On Fri, Nov 17, 2023 at 09:14:21AM +0000, Parav Pandit wrote:
> > >
> > >
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Friday, November 17, 2023 2:16 PM In any case you can safely
> > > > assume that many users will have migration that takes seconds and
> > > > minutes.
> > >
> > > Strange, but ok. I don't see any problem with current method.
> > > 8MB is used for very large VM of 1TB takes minutes. Should be fine.
> > 
> > The problem is simple: vendors selling devices have no idea how large the VM
> > will be. So you have to over-provision for the max VM size.
> > If there was a way to instead allocate that in host memory, that would improve
> > on this.
> 
> Not sure what to over provision for max VM size.
> Vendor does not know how many vcpus will be needed. It is no different problem.
> 
> When the VM migration is started, the individual tracking range is supplied by the hypervisor to device.
> Device allocates necessary memory on this instruction.
> 
> When the VM with certain size is provisioned, the member device can be provisioned for the VM size.
> And if it cannot be provisioned, possibly this may not the right member device to use at that point in time.

For someone who keeps arguing against adding single bit registers
"because it does not scale" you seem very nonchalant about adding
8Mbytes.

I thought we have a nicely contained and orthogonal feature, so if it's
optional it's not a problem.

But with such costs and corner cases what exactly is the motivation for
the feature here?  Do you have a PoC showing how this works better than
e.g. shadow VQ?

Maybe IOMMU based and shadow VQ based tracking are the way to go
initially, and if there's a problem then we should add this later, on
top.

I really want us to finally make progress merging features and anything
that reduces scope initially is good for that.

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

