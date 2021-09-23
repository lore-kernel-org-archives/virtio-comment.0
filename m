Return-Path: <virtio-comment-return-2301-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A4EBB9863FC
	for <virtio-comment@lists.oasis-open.org>; Thu, 23 Sep 2021 15:31:31 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <20210920134653.16412-1-david@redhat.com>
References: <20210920134653.16412-1-david@redhat.com>
Date: Thu, 23 Sep 2021 17:31:22 +0200
Message-ID: <87h7ebe2b9.fsf@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] Re: [PATCH RESEND v2 0/5] virtio-mem:
 VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE and interaction with memory properties
Content-Type: text/plain
To: David Hildenbrand <david@redhat.com>, virtio-comment@lists.oasis-open.org
Cc: David Hildenbrand <david@redhat.com>, Hui Zhu <teawater@gmail.com>, Marek Kedzierski <mkedzier@redhat.com>, Sebastien Boeuf <sebastien.boeuf@intel.com>, Halil Pasic <pasic@linux.ibm.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Wei Yang <richard.weiyang@linux.alibaba.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Sep 20 2021, David Hildenbrand <david@redhat.com> wrote:

> Looking into supporting virtio-mem
> a) without a shared zeropage for the memory backing of the device --
>    not allowing the driver to read unplugged memory
> b) on architectures with memory properties for RAM (e.g., s390x with
>    storage keys and storage attributes)
> requires extension of the spec to handle both cases cleanly and describe
> the expected semantics.
>
> I'll open a github issue soon; in the meantime, I'll work on the actual
> implementation in QEMU and Linux.

LGTM, but would like a second opinion.

>
> For a), I already shared a Linux implementation in the past [1], which will
> be simplified once virito-mem memory can no longer be mapped via /dev/mem
> [2].
>
> For b), it's actually unlocking virtio-mem on s390x in QEMU/Linux,
> initially supporting storage keys but not supporting storage attributes
> for simplicity.
>
> [1] https://lkml.kernel.org/r/20210215122421.27964-1-david@redhat.com
> [2] https://lkml.kernel.org/r/20210902160919.25683-1-david@redhat.com


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

