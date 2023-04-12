Return-Path: <virtio-comment-return-5434-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE397C77B73
	for <virtio-comment@archiver.kernel.org>; Wed, 12 Apr 2023 05:17:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4F3A942B68
	for <virtio-comment@archiver.kernel.org>; Wed, 12 Apr 2023 05:17:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 47B7E986520
	for <virtio-comment@archiver.kernel.org>; Wed, 12 Apr 2023 05:17:10 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3E55A98650E; Wed, 12 Apr 2023 05:17:10 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2EAC098650F
	for <virtio-comment@lists.oasis-open.org>; Wed, 12 Apr 2023 05:17:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: D5PfGfPONNq02U15lkbGig-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681276627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zRWvovlSBjnAK75vdU/qypXHIkReoHAfqmY3XHghr0E=;
        b=AaL7LlBKQKC3EO0onQVnzam+S+VwgoEUx++Vc/m0IXNT60MSjLgB2FPef6cOKKBUrh
         laz/A2XNgwrBN9vpRl7mjVOMxhZTn1zDOCimIONq9ka2MoxRvYAIhNXr27UpV9Bx/KYW
         3Q7nwgBGE5/Fa8+L5inBkC6pPZwErv2s40sCbjDAopahF7H2jkf2Oxf9bawNzcE3gf+N
         sqVH6PawiVU4M5n2sjYlLGPf8eh13pHis60VLSo914t+cpgLPWtykSfA1S8flKyypCiY
         JDxuzjblUGx3mrmunyNm6+GgxC9IZUvXJoqOgoafMMvWYkr72Z+8bwvrADqqrQFfBRCp
         GT1Q==
X-Gm-Message-State: AAQBX9ehZjl5EWLoo+1A0eNvsQJnZZQTSJdnHowTFJyG/F9ri4Iz1lKj
	5WdypXs2d9GVvXC/YXVHa4Dp9ksE9nT28gWdvsyARIFtOr55DS7ILgu/TARSEFoGhyGA0u3DLvG
	lqS8voPiGPgqqJxRl90qDTLeg6zzlhDn4zQ==
X-Received: by 2002:a05:600c:2247:b0:3eb:2b88:a69a with SMTP id a7-20020a05600c224700b003eb2b88a69amr8296767wmm.14.1681276627241;
        Tue, 11 Apr 2023 22:17:07 -0700 (PDT)
X-Google-Smtp-Source: AKy350bImKrhWp/WA9TY0H5mJOS1hKB072X249wrw1onVdhUY9TCWogJuSVklexVvC+G9Pmp/V4M6A==
X-Received: by 2002:a05:600c:2247:b0:3eb:2b88:a69a with SMTP id a7-20020a05600c224700b003eb2b88a69amr8296754wmm.14.1681276626912;
        Tue, 11 Apr 2023 22:17:06 -0700 (PDT)
Date: Wed, 12 Apr 2023 01:17:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Satananda Burla <sburla@marvell.com>
Message-ID: <20230412011222-mutt-send-email-mst@kernel.org>
References: <20230330225834.506969-1-parav@nvidia.com>
 <20230330225834.506969-11-parav@nvidia.com>
 <20230412003006-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481394D07C5CFBB2347B5F0DC9B9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230412004152-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548170E8002F19709C6D55ADDC9B9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230412010224-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481843F73EA11341608A1B6DC9B9@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481843F73EA11341608A1B6DC9B9@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH 10/11] transport-pci: Use driver
 notification PCI capability

On Wed, Apr 12, 2023 at 05:06:09AM +0000, Parav Pandit wrote:
> 
> 
> > From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
> > open.org> On Behalf Of Michael S. Tsirkin
> 
> > > On that occurrence, hypervisor driver forwards the q notification using the q
> > notification region which is defined by struct virtio_pci_notify_cap.
> > 
> > What is wrong with forwarding it on the legacy window?
> Legacy window is configuration registers.
> One has sandwitched q notification register in middle of all the config registers.
> Such registers do not start the VQ data path engines.
> 1.x spec has done the right thing to have dedicated notification region which something an actual pci hw can implement.

okay so.. in fact it turns out existing hardware is not
really happy to emulate legacy. it does not really fit that well.
so maybe we should stop propagating the legacy interface to
modern hardware then.
Add the legacy net header size feature and be done with it.

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

