Return-Path: <virtio-comment-return-8248-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1815C4332F
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 11:33:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 713152CAEB
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 11:33:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 46FE9986B5D
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 11:33:46 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 373619867FD; Tue,  7 Nov 2023 11:33:46 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2734F9867FE
	for <virtio-comment@lists.oasis-open.org>; Tue,  7 Nov 2023 11:33:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: yfMhgSBAOPyGq2M-Tk0c_Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699356821; x=1699961621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GrHk8QmQharktyWHWurR7tUm0oOaGnO+LiEqzXy/eK0=;
        b=uNhhz3e91IeAS4lm9rkuWXU+DO5JXtYafSrIiD2Qtl+4bwVvnJMgPPurawyjjiGct0
         QrowkPxmaGiduSO4sxhHB+EejJOjSYsnvjki+L6QvsVl6XTMf07t+IPbLvMfViTgyCa6
         uAZR1rjF652Hz5nPGLOi24wSdX5vk55cM2fu+vS95vnFyJxN/LXIH0fXDy8f1fmYT3hA
         G0gaACo/TtK9MoCoBiu1QC8T+KJXQGLopkUX8Wy49zu2R+QK2IGhAoxJagaPE03dJDHl
         YUv6yPCka6LTiSHUWPxP4kU8AZrAYYjjv+Q3Af89WpkT/m5S5yEr4MG65C2G1VGS6kRR
         pILQ==
X-Gm-Message-State: AOJu0Yx55SPWK/TN809RXrjTl9lNAyZXeCWyfO9cKUl9kais7AnmHFbH
	TrEvkGsBl175TtwtWRXbfwTYJ2N+UsaAfXnIh+FISFkhUVQkMCHZryzP5rBlTUesurtRMFl5wxc
	DceBQMQQUt+Z5yyPDZFVO4wvF64abHI6lOQ==
X-Received: by 2002:a2e:918d:0:b0:2c5:ffa:375d with SMTP id f13-20020a2e918d000000b002c50ffa375dmr24171187ljg.11.1699356821389;
        Tue, 07 Nov 2023 03:33:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF9tydqsumApaLg6Pri0PmOOuWwIwtskiuPXSTby7/ibUtD3OyksgkNUSCMu/UBwHx4L1AC+A==
X-Received: by 2002:a2e:918d:0:b0:2c5:ffa:375d with SMTP id f13-20020a2e918d000000b002c50ffa375dmr24171172ljg.11.1699356821034;
        Tue, 07 Nov 2023 03:33:41 -0800 (PST)
Date: Tue, 7 Nov 2023 06:33:35 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Message-ID: <20231107063139-mutt-send-email-mst@kernel.org>
References: <20231103103437.72784-7-lingshan.zhu@intel.com>
 <20231103064730-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D028E63E6CB0AA7F4149DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fdfda658-e89c-41f4-9f4c-77d5d9b1b642@intel.com>
 <PH0PR12MB54818179419B06412D7A9C84DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <445ff573-72c3-4fe4-9e07-e7fdd2dc5750@intel.com>
 <PH0PR12MB54818BAE4BD33983E6108FE5DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2615baa2-9450-4504-aa8a-e46fdbb332b8@intel.com>
 <PH0PR12MB54813004E47B8F18DFAC1D57DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <c44782d2-6a87-4536-bd03-cd40d492ee8c@intel.com>
MIME-Version: 1.0
In-Reply-To: <c44782d2-6a87-4536-bd03-cd40d492ee8c@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH V2 6/6] virtio-pci: implement dirty page tracking

On Tue, Nov 07, 2023 at 05:52:41PM +0800, Zhu, Lingshan wrote:
> > > > > > 2. the PCI FLR is clearing all the registers you exposed here.
> > > > > see above
> > > > > > 3. Endless expansion of config registers of dirty tracking is not
> > > > > > scalable, as they
> > > > > are not init time registers not following the Appendix B guidelines.
> > > > > endless expansion?? It is a complete set of dirty page tracking, right????
> > > > > have you see this cap only controls? The device DMA writes the
> > > > > bitmap, not by registers.
> > > > Device dirty page tracking is start/stop command to be done by the
> > > hypervisor.
> > > > So when guest is resetting the device, it stopped the DMA initiated by the
> > > hypervisor.
> > > > This fundamentally breaks things.
> > > Why? When device resets, do you want to keep tracking dirty pages????
> > Yes, when the device resets, before that event occurred, all the pages which were dirtied, must be migrated.
> > And after reset also new page tracking to continue.
> That depends on whether there is an interrupt for the dirty pages.
> If there is an interrupt, then the guest owns the pages

Not in the virtio model, guest owns the memory once buffer has been used.

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

