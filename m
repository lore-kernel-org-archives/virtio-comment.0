Return-Path: <virtio-comment-return-7403-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6B4EDEC71
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Sep 2023 15:05:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7982921688
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Sep 2023 15:05:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 68A5A986641
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Sep 2023 15:05:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 53235986633; Wed, 13 Sep 2023 15:05:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 40144986634
	for <virtio-comment@lists.oasis-open.org>; Wed, 13 Sep 2023 15:04:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: tXAVgrs8P3-hK8f4Muhj5A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694617467; x=1695222267;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rwIQDXNs82qD7q4ewNp//4ii4InYSIsRfhTkCMfwRtA=;
        b=ptMjimKPa9xondTReM36Q6pIWUfM8TOMwECnp2++aBGySdIN2EyBz82zLbrQHm+NOg
         0VC7U6x8fb6Nheb9vEO8yN6G9IQi+5q/H5E7mF2VDEJIVj4lXhDtP+8h1+7gWNvvrNBx
         /RH42XBELQwLSXQEaLe8XcUku/prp40rle7rAi0IMyqJqDAEWu7ADmX7ovXXfTfPIhne
         6SVUeMnxZRWVaFQTsUCj0ZBfyVB4Tb5UoUEWYRimczpf/4qyiZg70b/sQJGn3Vu/676Z
         9x3Pi6Pwj3yvJMkBMBqKRhc0RrvIAGN/d06YEA+zAwVjUJUiD66MAbqdqqZq4CxMIg4y
         rH9w==
X-Gm-Message-State: AOJu0YzXD78Hpxjb+bPKmA0fXGpsLQe9vdpYydkE4Kl2JhMzncRLiwZ2
	/w7kDuFdvDOtAU98V/SPLVFqjDP1RiM+C/zeVyZEn0WwS6+WvycNVSWlvMVokMkHsrqSLLsskIY
	LHzpxuXc05NlOweUFDs+FJSww9NNBgGG4Ww==
X-Received: by 2002:a05:600c:219a:b0:3fe:1f93:8cf4 with SMTP id e26-20020a05600c219a00b003fe1f938cf4mr2261402wme.8.1694617467237;
        Wed, 13 Sep 2023 08:04:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFN+UQjHyCh0ekVnuJZMdgO2BSQZ+Kan1s0gLV7d+40D696dEdZr2S/+2XZZU4ZvTo8eys71w==
X-Received: by 2002:a05:600c:219a:b0:3fe:1f93:8cf4 with SMTP id e26-20020a05600c219a00b003fe1f938cf4mr2261383wme.8.1694617466913;
        Wed, 13 Sep 2023 08:04:26 -0700 (PDT)
Date: Wed, 13 Sep 2023 17:04:24 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: virtualization@lists.linux-foundation.org
Cc: virtio-comment@lists.oasis-open.org, anton.yakovlev@opensynergy.com,
	stefanha@redhat.com, mst@redhat.com, jasowang@redhat.com
Message-ID: <ZQHPeD0fds9sYzHO@pc-79.home>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] virtio-sound linux driver conformance to spec

Hello,

This email is to report a behavior of the Linux virtio-sound driver that
looks like it is not conforming to the VirtIO specification. The kernel
driver is moving buffers from the used ring to the available ring
without knowing if the content has been updated from the user. If the
device picks up buffers from the available ring just after it is
notified, it happens that the content is old. This problem can be fixed
by waiting a period of time after the device dequeues a buffer from the
available ring. The driver should not be allowed to change the content
of a buffer in the available ring. When buffers are enqueued in the
available ring, the device can consume them immediately.

1. Is the actual driver implementation following the spec?  
2. Shall the spec be extended to support such a use-case?

Thanks, Matias


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

