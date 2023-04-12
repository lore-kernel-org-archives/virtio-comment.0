Return-Path: <virtio-comment-return-5421-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75265C7619A
	for <virtio-comment@archiver.kernel.org>; Wed, 12 Apr 2023 04:48:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3B8C726A2C
	for <virtio-comment@archiver.kernel.org>; Wed, 12 Apr 2023 04:48:16 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 33ADA986514
	for <virtio-comment@archiver.kernel.org>; Wed, 12 Apr 2023 04:48:16 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2C6939841AB; Wed, 12 Apr 2023 04:48:16 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 18CDD986509
	for <virtio-comment@lists.oasis-open.org>; Wed, 12 Apr 2023 04:48:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: CdeoVhjRMnmlHuASnjInfw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681274891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZIKmPylf3sFjSfOHV6g9Jf9ASmh8fn/latWBRQAJmAM=;
        b=Zjt6r+IQSILyX2j0NwTx7oX40GJWQCDbPatn6gNN/Tac8Oh+K1ykA07jHfio2WraTA
         trYofGtFUWap8DJBqvmJcVUK3N8/U6pR51NQUJQBXLhA3U54ulvWEY0ecpc2R9iogNBo
         Iu13VnxxozgFdTNRR3i/rRWZu0GFov6JvL3TjYw5UEDSCQ6DqcVTaaiH1IDDJ1O1e47V
         z9SYNBM5Po2aPapveMNfLUY+95EdosxFtvuNLZaRNOAQhi2baYWGn1aFN3q1q79YGmcB
         ziGGyydteMyRJoNCLs08vEMzxXz7dnqkD+a5h9eAm1KAPt9jWSwq5BfDnLjUZRL72VKh
         JRrQ==
X-Gm-Message-State: AAQBX9cQUJj7lc1f0lfceE78rfpWmPMqJYPA9RPI1arEnppUBTxAx+aq
	ZTvLxJBDQ9528yxW7Ra28oQ6/B3ZvGrNnoJ7eaVwQov4cmvy7qo8MyhDH5JUW6gwXBA2tAJBEOt
	6Ft5at6YQOvNLcif29kZCS+PU0WAKP9cIvw==
X-Received: by 2002:a7b:c354:0:b0:3ed:301c:375c with SMTP id l20-20020a7bc354000000b003ed301c375cmr8815872wmj.21.1681274891128;
        Tue, 11 Apr 2023 21:48:11 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZQPnv2JCLITbSwIVm35/QPQT73sbjRJ0IlVk8NIDdb3y2z75fHIYXESmtSToucyrEohjy3Rg==
X-Received: by 2002:a7b:c354:0:b0:3ed:301c:375c with SMTP id l20-20020a7bc354000000b003ed301c375cmr8815861wmj.21.1681274890805;
        Tue, 11 Apr 2023 21:48:10 -0700 (PDT)
Date: Wed, 12 Apr 2023 00:48:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-dev@lists.oasis-open.org, cohuck@redhat.com,
	virtio-comment@lists.oasis-open.org, shahafs@nvidia.com
Message-ID: <20230412004331-mutt-send-email-mst@kernel.org>
References: <20230330225834.506969-1-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20230330225834.506969-1-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH 00/11] Introduce transitional mmr pci device

On Fri, Mar 31, 2023 at 01:58:23AM +0300, Parav Pandit wrote:
> Overview:
> ---------
> The Transitional MMR device is a variant of the transitional PCI device.
> It has its own small Device ID range. It does not have I/O
> region BAR; instead it exposes legacy configuration and device
> specific registers at an offset in the memory region BAR.
> 
> Such transitional MMR devices will be used at the scale of
> thousands of devices using PCI SR-IOV and/or future scalable
> virtualization technology to provide backward
> compatibility (for legacy devices) and also future
> compatibility with new features.
> 
> Usecase:
> --------
> 1. A hypervisor/system needs to provide transitional
>    virtio devices to the guest VM at scale of thousands,
>    typically, one to eight devices per VM.
> 
> 2. A hypervisor/system needs to provide such devices using a
>    vendor agnostic driver in the hypervisor system.
> 
> 3. A hypervisor system prefers to have single stack regardless of
>    virtio device type (net/blk) and be future compatible with a
>    single vfio stack using SR-IOV or other scalable device
>    virtualization technology to map PCI devices to the guest VM.
>    (as transitional or otherwise)


The more I look at it the more issues I see.

Here is a counter proposal:

#define VIRTIO_NET_F_LEGACY_HEADER  52      /* Use the legacy 10 byte header for all packets */


Yes, sorry to say, you need to emulate legacy pci in software.

With notification hacks, and reset hacks, and legacy interrupt hacks,
and writeable mac ...  this thing best belongs in vdpa anyway.


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

