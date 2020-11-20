Return-Path: virtio-comment-return-1531-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BA5ED98619A
	for <virtio-comment@lists.oasis-open.org>; Fri, 20 Nov 2020 15:13:44 +0000 (UTC)
Date: Fri, 20 Nov 2020 16:13:30 +0100
From: Cornelia Huck <cohuck@redhat.com>
Message-ID: <20201120161330.740d694e.cohuck@redhat.com>
In-Reply-To: <20201116191629.47661-1-david@redhat.com>
References: <20201116191629.47661-1-david@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] Re: [PATCH v1] virtio-mem: minor clarification regarding
 read-access to unplugged blocks
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: David Hildenbrand <david@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, teawater <teawaterz@linux.alibaba.com>, Marek Kedzierski <mkedzier@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, 16 Nov 2020 20:16:29 +0100
David Hildenbrand <david@redhat.com> wrote:

> Let's clarify that we don't expect all DMA to work with unplugged blocks.
> We really only give guarantees when reading from unplugged memory blocks
> via the CPU, e.g., as done by Linux when creating a system dump via
> kdump: the new kernel will copy the content of the old (crashed) kernel
> via the CPU to user space, from where it will find its final destination
> inside the dump file. Note that dumping via makedumpfile under Linux will
> avoid reading unplugged blocks completely.
> 
> This is a preparation for device passthrough to VMs, whereby such
> dedicated devices might not be able to read from unplugged memory blocks.
> 
> Let's document that this scenario is possible, and why this handling is
> in place at all.
> 
> Cc: teawater <teawaterz@linux.alibaba.com>
> Cc: Marek Kedzierski <mkedzier@redhat.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  virtio-mem.tex | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

Looks reasonable to me.

Acked-by: Cornelia Huck <cohuck@redhat.com>


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

