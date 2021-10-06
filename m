Return-Path: <virtio-comment-return-2304-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BD9EA986495
	for <virtio-comment@lists.oasis-open.org>; Wed,  6 Oct 2021 10:59:27 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <843ec36a-e682-017c-2343-7571ac7b3fcb@redhat.com>
References: <20210920134653.16412-1-david@redhat.com>
 <87h7ebe2b9.fsf@redhat.com>
 <843ec36a-e682-017c-2343-7571ac7b3fcb@redhat.com>
Date: Wed, 06 Oct 2021 12:59:15 +0200
Message-ID: <87mtnmzaf0.fsf@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] Re: [PATCH RESEND v2 0/5] virtio-mem:
 VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE and interaction with memory properties
Content-Type: text/plain
To: David Hildenbrand <david@redhat.com>, virtio-comment@lists.oasis-open.org
Cc: Hui Zhu <teawater@gmail.com>, Marek Kedzierski <mkedzier@redhat.com>, Sebastien Boeuf <sebastien.boeuf@intel.com>, Halil Pasic <pasic@linux.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Wei Yang <richard.weiyang@linux.alibaba.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Fri, Sep 24 2021, David Hildenbrand <david@redhat.com> wrote:

> On 23.09.21 17:31, Cornelia Huck wrote:
>> On Mon, Sep 20 2021, David Hildenbrand <david@redhat.com> wrote:
>> 
>>> Looking into supporting virtio-mem
>>> a) without a shared zeropage for the memory backing of the device --
>>>     not allowing the driver to read unplugged memory
>>> b) on architectures with memory properties for RAM (e.g., s390x with
>>>     storage keys and storage attributes)
>>> requires extension of the spec to handle both cases cleanly and describe
>>> the expected semantics.
>>>
>>> I'll open a github issue soon; in the meantime, I'll work on the actual
>>> implementation in QEMU and Linux.
>> 
>> LGTM, but would like a second opinion.
> Thanks Conny! I'll wait for more feedback before I open a github issue / 
> request a vote.

Anyone else interested in looking at this?

Otherwise, I'd say just open an issue and request a vote.


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

