Return-Path: virtio-comment-return-634-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D3FC8985D1F
	for <virtio-comment@lists.oasis-open.org>; Thu, 21 Feb 2019 15:29:18 +0000 (UTC)
From: Don Wallwork <don.wallwork@broadcom.com>
Message-ID: <3230056b-f78b-9671-8705-b3e508201d49@broadcom.com>
Date: Thu, 21 Feb 2019 10:29:14 -0500
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Subject: [virtio-comment] virtio 1.1 features question
To: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

Is there an expectation that feature names in the spec would match 
implementation in code?
I presume not, since features like VIRTIO_F_EVENT_IDX and 
VIRTIO_F_INDIRECT_DESC do not
appear in Linux kernel or QEMU code; VIRTIO_RING_F_EVENT_IDX and 
VIRTIO_RING_F_INDIRECT_DESC
are used instead.

Also noticed that there seems to be an inconsistency in the spec in that 
VIRTIO_F_EVENT_IDX is
used in some places and VIRTIO_F_RING_EVENT_IDX is used in others.. Is 
this intended?

Thanks,

Don


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

