Return-Path: <virtio-comment-return-2296-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7251F9863E1
	for <virtio-comment@lists.oasis-open.org>; Thu, 23 Sep 2021 11:55:53 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <20210920134653.16412-2-david@redhat.com>
References: <20210920134653.16412-1-david@redhat.com>
 <20210920134653.16412-2-david@redhat.com>
Date: Thu, 23 Sep 2021 13:55:10 +0200
Message-ID: <87v92recbl.fsf@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] Re: [PATCH RESEND v2 1/5] virtio-mem: simplify statements that
 express unexpected behavior on memory access
Content-Type: text/plain
To: David Hildenbrand <david@redhat.com>, virtio-comment@lists.oasis-open.org
Cc: David Hildenbrand <david@redhat.com>, Hui Zhu <teawater@gmail.com>, Marek Kedzierski <mkedzier@redhat.com>, Sebastien Boeuf <sebastien.boeuf@intel.com>, Halil Pasic <pasic@linux.ibm.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Wei Yang <richard.weiyang@linux.alibaba.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Sep 20 2021, David Hildenbrand <david@redhat.com> wrote:

> Some statements express that the device MAY allow access to memory inside
> unplugged memory blocks, although it's really just unexpected behavior and
> conforming drivers MUST NOT perform such access.
>
> Clarify that, and move the special CPU vs. DMA handling for some
> unplugged memory blocks to the driver section instead.
>
> While at it, start rephrasing our statements to clarify and prepare for
> further changes.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  virtio-mem.tex | 23 +++++++++--------------
>  1 file changed, 9 insertions(+), 14 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


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

