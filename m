Return-Path: <virtio-comment-return-4997-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20322C6FD1F
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Mar 2023 23:05:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 83A5E2AD66
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Mar 2023 23:05:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7125198648C
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Mar 2023 23:05:28 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 65C6B983EB6; Wed, 22 Mar 2023 23:05:28 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 48971986456
	for <virtio-comment@lists.oasis-open.org>; Wed, 22 Mar 2023 23:04:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: oOt_nCa4OqK5wWwMdVBN-A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679526272;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ISj799JirOayjigJ3MM537c0xFFEZu5R8XPxHSW/SC4=;
        b=uCGZodwLgD4tSq8q94vxMYad4Fzm9L1Qrn4/rhFOrKAAYLJHutu753FNQd1n298Kp4
         njNV/NUWUG6qUCA4f90v3E6xjNVAj8hxFtfu72D0Qt2k7iIJYn6BADrImYTyJaPj6LTD
         LoRmrbF9YIN0BwOILPACZttOUa2RcE7blo1dAvurXvS3uJXSZzlwW8G36c6e4CdPsfn8
         6u7B/dSXacnwAoY7LezcMetfaGXl+zXpnh0EkJTqqNCViRQSt/xippOys2d88IkeG5nX
         aZmghQyAuGs2Vn4oqMdMQEzAjYyM5AU+sYVSmYH5odnvBCP62gPJ7+ntkoKTDHXZbeEs
         puMg==
X-Gm-Message-State: AO0yUKVVUN4R2cHLSc04fGuOtSNFTqeOWS6L4OKVysvSO1BMLhJxEhb5
	ItVQuJubAgg3o3mUZbT5tj6Pf1UQ39YEldKRaM61xAKEWllvqVjbcN4pWFdGTtcaKzq3mvI8gIp
	qXJi8vCCThY2FunQIZaZ+mAVDZHGXUKlxsQ==
X-Received: by 2002:a17:906:d8c7:b0:88d:ba89:1837 with SMTP id re7-20020a170906d8c700b0088dba891837mr3726694ejb.8.1679526272210;
        Wed, 22 Mar 2023 16:04:32 -0700 (PDT)
X-Google-Smtp-Source: AK7set8PtGFSnPCa/DSRidcxkXvXOXD997C/rdxidFF6Jiiv478MoZAZ1cf4rUJ1gg0Ol+rMHQfDCA==
X-Received: by 2002:a17:906:d8c7:b0:88d:ba89:1837 with SMTP id re7-20020a170906d8c700b0088dba891837mr3726683ejb.8.1679526271995;
        Wed, 22 Mar 2023 16:04:31 -0700 (PDT)
Date: Wed, 22 Mar 2023 19:04:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-dev@lists.oasis-open.org, pasic@linux.ibm.com, cohuck@redhat.com,
	virtio-comment@lists.oasis-open.org, shahafs@nvidia.com
Message-ID: <20230322190416-mutt-send-email-mst@kernel.org>
References: <20230322215243.249524-1-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20230322215243.249524-1-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v4 0/8] Rename queue index to queue number

On Wed, Mar 22, 2023 at 11:52:35PM +0200, Parav Pandit wrote:
> 1. Currently, virtqueue is identified between driver and device
> interchangeably using either number of index terminology.
> 
> 2. Between PCI and MMIO transport the queue size (depth) is
> defined as queue_size and QueueNum respectively.
> 
> To avoid confusion and to have consistency, unify them to use as Number.


Looks good, some comments on 8/8.

> Solution:
> a. Use virtqueue number description, and rename MMIO register as QueueSize.
> b. Replace virtqueue index to virtqueue number
> c. RSS area of virtio net has inherited some logic, describe it
> using abstract rq_handle.
> 
> Patch summary:
> patch-1 introduce vq number as generic term
> patch-2 renames index to number for pci transport
> patch-3 renames mmio register from Num to Size
> patch-4 renames index to number for mmio transport
> patch-5 renames num field to size for ccw transport
> patch-6 renames index field to queue_select for ccw transport
> patch-7 for virtio-net removes duplicate example from requirements
> patch-8 for virtio-net updates rss description to use vq number
> 
> This series only improves the documentation, it does not change any
> transport or device functionality.
> 
> Please review.
> This series fixes the issue [1].
> 
> [1] https://github.com/oasis-tcs/virtio-spec/issues/163
> 
> ---
> changelog:
> v3->v4:
> - moved note to comment for ccw
> - renamed rq_handle to rss_rq_id
> - moved rss_rq_id next to rss_config structure
> - define rss_config structure using rss_rq_id
> v2->v3:
> - addressed comments from Michael
> - added previous definitions for ccw fields
> - moved rq_handle definition before using it
> - added first patch to describe vq number
> - updated pci for available buffer notification section
> v1->v2:
> - added patches for virtio net for rss area
> - added patches for covering ccw transport
> - added missing entries to refer in mmio transport
> 
> Parav Pandit (8):
>   content: Add vq number text
>   transport-pci: Refer to the vq by its number
>   transport-mmio: Rename QueueNum register
>   transport-mmio: Refer to the vq by its number
>   transport-ccw: Rename queue depth/size to other transports
>   transport-ccw: Refer to the vq by its number
>   virtio-net: Avoid duplicate receive queue example
>   virtio-net: Describe RSS using receive queue handle
> 
>  content.tex                      |  3 ++
>  device-types/net/description.tex | 29 ++++++++++++-----
>  transport-ccw.tex                | 27 ++++++++-------
>  transport-mmio.tex               | 56 +++++++++++++++++++-------------
>  transport-pci.tex                | 14 ++++----
>  5 files changed, 81 insertions(+), 48 deletions(-)
> 
> -- 
> 2.26.2


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

