Return-Path: <virtio-comment-return-2307-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D954B986495
	for <virtio-comment@lists.oasis-open.org>; Wed,  6 Oct 2021 12:48:40 +0000 (UTC)
References: <20210920134653.16412-1-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Message-ID: <300fb20d-77c4-c9f7-654d-11169058bcea@redhat.com>
Date: Wed, 6 Oct 2021 14:48:34 +0200
MIME-Version: 1.0
In-Reply-To: <20210920134653.16412-1-david@redhat.com>
Subject: [virtio-comment] Re: [PATCH RESEND v2 0/5] virtio-mem:
 VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE and interaction with memory properties
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: virtio-comment@lists.oasis-open.org
Cc: Hui Zhu <teawater@gmail.com>, Marek Kedzierski <mkedzier@redhat.com>, Sebastien Boeuf <sebastien.boeuf@intel.com>, Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Wei Yang <richard.weiyang@linux.alibaba.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On 20.09.21 15:46, David Hildenbrand wrote:
> Looking into supporting virtio-mem
> a) without a shared zeropage for the memory backing of the device --
>     not allowing the driver to read unplugged memory
> b) on architectures with memory properties for RAM (e.g., s390x with
>     storage keys and storage attributes)
> requires extension of the spec to handle both cases cleanly and describe
> the expected semantics.
> 
> I'll open a github issue soon; in the meantime, I'll work on the actual
> implementation in QEMU and Linux.

Okay, let's request a vote to get this integrated:

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/118

Thanks for the review Conny!

-- 
Thanks,

David / dhildenb


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

