Return-Path: <virtio-comment-return-5256-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF1BC7619A
	for <virtio-comment@archiver.kernel.org>; Wed,  5 Apr 2023 09:20:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 903491EAF6
	for <virtio-comment@archiver.kernel.org>; Wed,  5 Apr 2023 09:20:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 10AB3986629
	for <virtio-comment@archiver.kernel.org>; Wed,  5 Apr 2023 09:20:46 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C73389865DF; Wed,  5 Apr 2023 09:20:45 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A6BD898660F
	for <virtio-comment@lists.oasis-open.org>; Wed,  5 Apr 2023 09:20:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: cKQg8cSfNzG07lQdZE5axQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680686442;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AertOvicbcMUutJU4B9NvKlbZElwSeMpOEOESo/YkiA=;
        b=bmr7BVWdnMzGfO0skTNq6SFjwh6U3LIDES45YzgtRzQBsRchrCcBUFbcxXOKhb3M6f
         j8U9P7NqvmJe0/42f+xg7NI4jTQcHLFWeTr8DeaJwGXv+5Yt81DlsL8VfCOmc6u6Nexk
         kscJZm8yExmicIY+sZDAVANSQdZicWED4G1MCH4JczmhnD2dLtXOJo2BIq/hS2A8dRrJ
         VrRcJS1Q1fzPUiENUCJRSTEzyUPyORzc3FHPYLYTfFUOME+IjTOT2ttQQmsCO0H1omkm
         g039/LieZz/D3TAMGGbjFH6NAILMoNQrekZKcn/v44Ibq4wsQLx/BxlYlQoXtmk4WI95
         6FyA==
X-Gm-Message-State: AAQBX9d4iqNerLllrJ19e8qOyTDuMvKZ0r1Qn3H48EXgsUI2kitVksgJ
	7L0+rORabRe40I/a1Z9K59kUiUYDhbIfkZQn6GHYPo+X1NRNZWwTVB0Liu7el05IwmvA1haON7Z
	wLRr90ze2Edqiwi1JDnA6VpScTaO5cH5N4A==
X-Received: by 2002:a17:906:3b07:b0:944:8c30:830d with SMTP id g7-20020a1709063b0700b009448c30830dmr1897074ejf.42.1680686442468;
        Wed, 05 Apr 2023 02:20:42 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zdlr+x3aRWCXwMfkpOGtsibQAwU9pSpb5Y/XI+7IJQh1VbDX+g8dWmD8IJr3iawD6zzuCx/A==
X-Received: by 2002:a17:906:3b07:b0:944:8c30:830d with SMTP id g7-20020a1709063b0700b009448c30830dmr1897054ejf.42.1680686442188;
        Wed, 05 Apr 2023 02:20:42 -0700 (PDT)
Date: Wed, 5 Apr 2023 05:20:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-dev@lists.oasis-open.org, cohuck@redhat.com, sgarzare@redhat.com,
	pasic@linux.ibm.com, virtio-comment@lists.oasis-open.org,
	shahafs@nvidia.com
Message-ID: <20230405051855-mutt-send-email-mst@kernel.org>
References: <20230405010657.612529-1-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20230405010657.612529-1-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v12 00/10] Rename queue number to queue index

On Wed, Apr 05, 2023 at 04:06:47AM +0300, Parav Pandit wrote:
> 1. Currently, virtqueue is identified between driver and device
> interchangeably using either number or index terminology.
> 
> 2. Between PCI and MMIO transport the queue size (depth) is
> defined as queue_size and QueueNum respectively.
> 
> To avoid confusion and to have consistency, unify them to use
> index.
> 
> 3. Filed name vqn in the driver notification structure is
> ambiguous as it is supposed to hold either vq index or device
> supplied vq identifier.
> 
> 4. Device is really supplying queue identifier in the 
> queue_notify_data register, and this often get confused with
> very similar looking feature bit NOTIFICATION_DATA.
> 
> Solution:
> a. Use virtqueue index description, and rename MMIO register as QueueSize.
> b. Replace virtqueue number with virtqueue index
> c. RSS area of virtio net has inherited some logic, describe it
> using abstract rss_rq_id.
> d. rename queue_notifify_data to queue_notify_id
> e. rename vqn to vq_notify_id to reflect it can hold either vq
> index of device supplied some id.
> 
> Patch summary:
> patch-1 introduce vq number as generic term
> patch-2 renames index to number for pci transport
> patch-3 rename queue_notify_data to queue_notify_id
> patch-4 remove first vq index reference
> patch-5 renames mmio register from Num to Size
> patch-6 renames index to number for mmio transport
> patch-7 renames num field to size for ccw transport
> patch-8 renames vq by its index for ccw transport
> patch-9 for virtio-net removes duplicate example from requirements
> patch-10 for virtio-net updates rss description to use vq index
> 
> This series only improves the documentation, it does not change any
> transport or device functionality.
> 
> Please review.
> This series fixes the issue [1].
> 
> [1] https://github.com/oasis-tcs/virtio-spec/issues/163

I feel there are now two patchsets here:
1. renaming of queue num to queue size
2. virtqueue index and rss clarification depending on it

1 seems mostly ready, for 2 I don't yet know how long it will take.
Split them up, also from POV of github issues?


> ---
> changelog:
> v11->v12:
> - replace number to index
> - avoid confusion around vqn field and rename to vq_notify_id
> - rename queue_notify_data to avoid confusing with NOTIFY_DATA
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
> 
> Parav Pandit (10):
>   content: Add vq index text
>   content.tex Replace virtqueue number with index
>   content: Rename confusing queue_notify_data and vqn names
>   transport-pci: Avoid first vq index reference
>   transport-mmio: Rename QueueNum register
>   transport-mmio: Avoid referring to zero based index
>   transport-ccw: Rename queue depth/size to other transports
>   transport-ccw: Refer to the vq by its index
>   virtio-net: Avoid duplicate receive queue example
>   virtio-net: Describe RSS using rss rq id
> 
>  content.tex                      | 27 ++++++++++++----
>  device-types/net/description.tex | 29 ++++++++++++-----
>  notifications-be.c               |  2 +-
>  notifications-le.c               |  2 +-
>  transport-ccw.tex                | 15 +++++----
>  transport-mmio.tex               | 55 +++++++++++++++++++-------------
>  transport-pci.tex                | 26 ++++++++-------
>  7 files changed, 99 insertions(+), 57 deletions(-)
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

