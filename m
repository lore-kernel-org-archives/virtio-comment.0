Return-Path: <virtio-comment-return-4939-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A2EEC6FD1D
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Mar 2023 09:05:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CBADD29FC3
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Mar 2023 09:05:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AE60D986449
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Mar 2023 09:05:57 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9E124983DFC; Tue, 21 Mar 2023 09:05:57 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8A06998642A
	for <virtio-comment@lists.oasis-open.org>; Tue, 21 Mar 2023 09:05:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: W8vDqwx_NLm0vGl7OcZtxQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679389554;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4Fl/1d9Rvh8rETH9822Klufr7ZEtmXiSFNUPC5+ccY=;
        b=jh/fW9XaCKZC/ry8sb1+RdiMfXDa6J7IhtmSHBTb/qZWbZe9HpnivsK1uL2ZvdO03L
         cH6HbIBXDJ8bEK6HdhHxkxsmdqpi5LGbpUeYf4+Q55j0oeP9NFyihgYOMyt5o/ab5QIO
         5XPkBOcTp4LR3Jn4vxgZeEuSKNLd7SqZ2C7mJH36pet9FFNOpyJFxDkIZb4+lyEGTO9s
         9NUZ8xFRnW2LurHQ5dW6ojDsjNxdK381+D8jZUJOcjpTqgIONoFASTplZ7U7JPWYyxLI
         LWBEQJBTM1fa3p6uMh0ZHy6PFjjhVA3Gqzwx/YB3Onfxueva7Ok4En7NOPRF16+VEt4Z
         PcWg==
X-Gm-Message-State: AO0yUKWpTznCDH9+jXjZHSeXcO0AYhv8ARcjBfCvTR0mHr/3su8/Fc5M
	SmnDFzyid6tQ5bvUIWA1i2M9uLyRoxz0lWy++PkapeGHsPNd59ZKj7Fa7UuyTceg8s6zDm5ZTBB
	SHTQySH83zD04UNG+pw2+/5rbLGVd7j1e+Q==
X-Received: by 2002:a5d:53c5:0:b0:2d0:8d4e:43c6 with SMTP id a5-20020a5d53c5000000b002d08d4e43c6mr1429517wrw.65.1679389554399;
        Tue, 21 Mar 2023 02:05:54 -0700 (PDT)
X-Google-Smtp-Source: AK7set+cSkwKQq0QjcjVr/BadhyvadHKT6J8YqL0HqpGA/KVTHOTVaXlma9Wp+JEmo9EEMF3PZKp9w==
X-Received: by 2002:a5d:53c5:0:b0:2d0:8d4e:43c6 with SMTP id a5-20020a5d53c5000000b002d08d4e43c6mr1429501wrw.65.1679389554094;
        Tue, 21 Mar 2023 02:05:54 -0700 (PDT)
Date: Tue, 21 Mar 2023 05:05:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-dev@lists.oasis-open.org, pasic@linux.ibm.com, cohuck@redhat.com,
	virtio-comment@lists.oasis-open.org, shahafs@nvidia.com
Message-ID: <20230321050119-mutt-send-email-mst@kernel.org>
References: <20230321041036.201439-1-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20230321041036.201439-1-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v2 0/7] Rename queue index to queue number

On Tue, Mar 21, 2023 at 06:10:29AM +0200, Parav Pandit wrote:
> 1. Currently, virtqueue is identified between driver and device
> interchangeably using either number of index terminology.
> 
> 2. Between PCI and MMIO transport the queue size (depth) is
> defined as queue_size and QueueNum respectively.
> 
> To avoid confusion and to have consistency, unify them to use as Number.
> 
> Solution:
> a. Use virtqueue number description, and rename MMIO register as QueueSize.
> b. Replace virtqueue index to virtqueue number
> c. RSS area of virtio net has inherited some logic, describe it
> using abstract rq_handle.
> 
> Patch summary:
> patch-1 renames index to number for pci transport
> patch-2 renames mmio register from Num to Size
> patch-3 renames index to number for mmio transport
> patch-4 renames num field to size for ccw transport
> patch-5 renames index field to queue_select for ccw transport
> patch-6 for virtio-net removes duplicate example from requirements
> patch-7 for virtio-net updates rss description to use vq number
> 
> This series only improves the documentation, it does not change any
> transport or device functionality.
> 
> Please review.
> This series fixes the issue [1].
> 
> [1] https://github.com/oasis-tcs/virtio-spec/issues/163

OK overall but I feel this lacks a definition of what a virtqueue number
is in some transport and device independent place.
Maybe in the virtqueues chapter?
Just "
Each virtqueue is identified by a 0 based virtqueue number. Thus
virtqueues are numbered 0,1,2 and so on.
"

will do.

> ---
> changelog:
> v1->v2:
> - added patches for virtio net for rss area
> - added patches for covering ccw transport
> - added missing entries to refer in mmio transport
> 
> Parav Pandit (7):
>   transport-pci: Refer to the vq by its number
>   transport-mmio: Rename QueueNum register
>   transport-mmio: Refer to the vq by its number
>   transport-ccw: Rename queue depth/size to other transports
>   transport-ccw: Refer to the vq by its number
>   virtio-net: Avoid duplicate receive queue example
>   virtio-net: Describe RSS using receive queue handle
> 
>  device-types/net/description.tex | 26 +++++++++++----
>  transport-ccw.tex                | 39 +++++++++++++++-------
>  transport-mmio.tex               | 56 +++++++++++++++++++-------------
>  transport-pci.tex                |  6 ++--
>  4 files changed, 84 insertions(+), 43 deletions(-)
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

