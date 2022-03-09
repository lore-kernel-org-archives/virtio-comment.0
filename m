Return-Path: <virtio-comment-return-2795-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4B757986597
	for <virtio-comment@lists.oasis-open.org>; Wed,  9 Mar 2022 14:59:00 +0000 (UTC)
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Wed, 09 Mar 2022 15:58:56 +0100
Message-ID: <3382929.hzA3DnVQDd@silver>
In-Reply-To: <2255414.aXzeqRvSCW@silver>
References: <2255414.aXzeqRvSCW@silver>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH v2 0/4] Add VIRTIO_RING_F_INDIRECT_SIZE and queue_indirect_size
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
To: virtio-comment@lists.oasis-open.org
Cc: Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>, "Michael S. Tsirkin" <mst@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Montag, 21. Februar 2022 17:22:18 CET Christian Schoenebeck wrote:
> This is a follow-up of:
> [1/2]:
> https://lists.oasis-open.org/archives/virtio-comment/202112/msg00034.html
> [2/2]:
> https://lists.oasis-open.org/archives/virtio-comment/202112/msg00035.html
> 
> These 4 patches introduce a more fine graded control over the maximum length
> of indirect descriptor tables.
> 
> Associated Github Task:
> https://github.com/oasis-tcs/virtio-spec/issues/122
> 
> Latest Version (all patches):
> https://github.com/cschoenebeck/virtio-spec/commits/long_indirect_descr

Ping.

Best regards,
Christian Schoenebeck

> v1 -> v2:
> 
>   * Update reserved bits section [patch 1].
> 
>   * Add requirement to device normative section [patch 1].
> 
>   * Use the general new term "Queue Indirect Size" where possible instead of
> mentioning a bus specific field name [patch 1].
> 
>   * Simplified phrasing of requirements in split ring section [patch 1].
> 
>   * Move bus-independent changes from patch 2 to patch 1.
> 
>   * There is only one indirect descriptor table allowed per buffer
>     (round-trip message), so use the term "per indirect descriptor table"
> for the semantic of "Queue Indirect Size" in patch 2.
> 
>   * Simplify phrasing of requirements in patch 2.
> 
>   * MMIO: First shot [NEW patch 3].
> 
>   * CCW: First shot [NEW patch 4].
> 
> Christian Schoenebeck (4):
>   Add VIRTIO_RING_F_INDIRECT_SIZE
>   Add PCI configuration field "queue_indirect_size"
>   Add MMIO configuration register "QueueIndirectNum"
>   Add CCW configuration field "indirect_num" to vq_info_block
> 
>  content.tex     | 77 ++++++++++++++++++++++++++++++++++++++++++++++---
>  packed-ring.tex |  2 +-
>  split-ring.tex  |  8 +++--
>  3 files changed, 80 insertions(+), 7 deletions(-)





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

