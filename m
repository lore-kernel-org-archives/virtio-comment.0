Return-Path: <virtio-comment-return-2216-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9E4B59863B9
	for <virtio-comment@lists.oasis-open.org>; Tue, 17 Aug 2021 09:23:21 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <d924385f-fc8f-4069-e6d5-664514320816@redhat.com>
References: <20210812133150.36146-1-david@redhat.com>
 <20210812133150.36146-2-david@redhat.com> <87mtpgtpye.fsf@redhat.com>
 <d924385f-fc8f-4069-e6d5-664514320816@redhat.com>
Date: Tue, 17 Aug 2021 11:23:12 +0200
Message-ID: <87h7fotofz.fsf@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH v1 1/2] virtio-mem: introduce
 VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE
Content-Type: text/plain
To: David Hildenbrand <david@redhat.com>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, Aug 17 2021, David Hildenbrand <david@redhat.com> wrote:

> On 17.08.21 10:50, Cornelia Huck wrote:
>> On Thu, Aug 12 2021, David Hildenbrand <david@redhat.com> wrote:
>>> +With VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE, the device MAY allow the CPU to
>> 
>> "If VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE has been negotiated, ..."
>> 
>
> ack
>
>>> +read memory of unplugged memory blocks inside \field{usable_region_size}.
>> 
>> A compliant driver would not read that memory, would it?
>
> Indeed. The device could decide to allow for reading, but it's pretty 
> much undefined behavior.

Maybe make it "SHOULD NOT"? Less strong than "MUST NOT", but still makes
clear that a driver reading it is pretty much doing the wrong thing.


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

