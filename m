Return-Path: <virtio-comment-return-5201-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC1FC7618D
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Apr 2023 07:05:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 359282AF9F
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Apr 2023 07:05:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2219C9863EF
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Apr 2023 07:05:21 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1081A9863E4; Tue,  4 Apr 2023 07:05:21 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 963609863E6
	for <virtio-comment@lists.oasis-open.org>; Tue,  4 Apr 2023 07:04:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: IEtmVDqwM6iFmHtaSwCjrg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680591841;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zwHFJghfOM2kGQNN8h4CrMcCtPdD/NJ+5qTp60nF0WE=;
        b=W9uGek2d6Ufe1iaLyxm79YBYzrVtx11Toaua4iQS9k8+GHdiSGADQoOi/GYrki5IAc
         RGVa4C3jp9Lg6ZKpZ3jWUCcNvQ19UzeWL2OYRB22ma/zdNUBLM8hToq0CqH/YSg9KBF9
         z6mQXhBm1Yuf7O3equmTdVIK1pnZ+ytPBxpFKOd8u5iZBIxmT2MDDxQt3LR6WmVECTG6
         SpYny4EAujvx5hM3lNUYMys96JKaI3bkYDRxtGoi7LR7Ap2r9OUm7ihG6r2pLN2qOg5A
         mfVqZDqXBbhh6twqKw0eHxJmBILJCzXUiz706P8nNGIig5DWLdqe04qMyDAZBMbQI1Ty
         gHUg==
X-Gm-Message-State: AAQBX9e/COYnoaiULZzgSZQZitV0Hm1JQvxTq8kpXIN9caFd/tygb6yz
	frcf54jHAGIu/2UH/1saKT6ko22J2V+ICf/KsxzqRqqslEiAxjmVNIq4kxQVZbPl7ujejhQkatX
	brAWkXwRr1uMyAS6Ld44REHoKNj+Yexvjrw==
X-Received: by 2002:a17:907:628a:b0:931:c2f0:9437 with SMTP id nd10-20020a170907628a00b00931c2f09437mr1393639ejc.8.1680591841777;
        Tue, 04 Apr 2023 00:04:01 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZiVKcnoHmulOULjj63fu4e2xi8Gci/b8a2YGGQcGSb04//CNgsHLa2RQ0qxeS3Q1pCDCW8nQ==
X-Received: by 2002:a17:907:628a:b0:931:c2f0:9437 with SMTP id nd10-20020a170907628a00b00931c2f09437mr1393624ejc.8.1680591841492;
        Tue, 04 Apr 2023 00:04:01 -0700 (PDT)
Date: Tue, 4 Apr 2023 03:03:57 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-dev@lists.oasis-open.org, pasic@linux.ibm.com, cohuck@redhat.com,
	sgarzare@redhat.com, virtio-comment@lists.oasis-open.org,
	shahafs@nvidia.com
Message-ID: <20230404030244-mutt-send-email-mst@kernel.org>
References: <20230403225052.585498-1-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20230403225052.585498-1-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v11 0/8] Rename queue index to queue number

On Tue, Apr 04, 2023 at 01:50:44AM +0300, Parav Pandit wrote:
> 1. Currently, virtqueue is identified between driver and device
> interchangeably using either number or index terminology.
> 
> 2. Between PCI and MMIO transport the queue size (depth) is
> defined as queue_size and QueueNum respectively.
> 
> To avoid confusion and to have consistency, unify them to use Number.
> 
> Solution:
> a. Use virtqueue number description, and rename MMIO register as QueueSize.
> b. Replace virtqueue index with virtqueue number
> c. RSS area of virtio net has inherited some logic, describe it
> using abstract rss_rq_id.
> 
> Patch summary:
> patch-1 introduce vq number as generic term
> patch-2 renames index to number for pci transport
> patch-3 renames mmio register from Num to Size
> patch-4 renames index to number for mmio transport
> patch-5 renames num field to size for ccw transport
> patch-6 renames index field to vqn for ccw transport
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

Could you knock out a version based on Halil's suggestion of using index
throughout?

> ---
> changelog:
> v10->v11:
> - added Reviewed-by for all the reviewed patches
> - updated commit log of patch-8 to drop rq_handle reference
> - skipped comment to further use rss_rq_id, as rss_rq_id usage
>   and structure are self describing
> v9->v10:
> - added virtqueue number part in content in braces
> - replaced queue_select to vqn in ccw
> - avoided aggrasive alignment of 65 chars
> - updated commit log to drop reference to already merged patches
> - added review-by tag for already reviewed patches
> v8->v9:
> - addressed comments from David
> - few corrections with article
> - renaming 'virtqueue number' to 'vq number'
> - improving text and wording for rss_rq_id, avail notification
> - commit log of specific change in individual patches
> v7->v8:
> - remove note about first virtqueue number
> - skipped Max's comment to put word 'structure' in same line as its
>   crosses 65 chars limit per line
> - reworded queue_notification data set line, as '=' and vq number
>   wording was odd
> v6->v7:
> - remove text around first vq as it is already covered in the basic
>   virtqueues facility section
> v5->v6:
> - moved the vq number description from middle of vq operation
>   to beginning of vq introduction
> v4->v5:
> - fixed accidental removal of "unclassifed packets".
> - simplfied text around indirection_table mask
> - removed rss_rq_id references as indirection table and
>   unclassified_queue data type is self explanatory
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
>   virtio-net: Describe RSS using rss rq id
> 
>  content.tex                      |  4 ++
>  device-types/net/description.tex | 29 ++++++++++----
>  transport-ccw.tex                | 26 +++++++------
>  transport-mmio.tex               | 65 ++++++++++++++++++--------------
>  transport-pci.tex                | 13 ++++---
>  5 files changed, 84 insertions(+), 53 deletions(-)
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

