Return-Path: <virtio-comment-return-2446-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 44D2B986553
	for <virtio-comment@lists.oasis-open.org>; Wed,  8 Dec 2021 15:28:31 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <YbDLDt6Cn+qonnmr@stefanha-x1.localdomain>
References: <cover.1638192251.git.qemu_oss@crudebyte.com>
 <Ya8udCHO9bXiWd4P@stefanha-x1.localdomain> <87fsr4thvo.fsf@redhat.com>
 <10245090.BqRs5aQnp2@silver> <YbDLDt6Cn+qonnmr@stefanha-x1.localdomain>
Date: Wed, 08 Dec 2021 16:28:07 +0100
Message-ID: <877dcft8u0.fsf@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] Re: [PATCH v2 0/2] Add
 VIRTIO_RING_F_LARGE_INDIRECT_DESC
Content-Type: text/plain
To: Stefan Hajnoczi <stefanha@redhat.com>, Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: virtio-comment@lists.oasis-open.org, Greg Kurz <groug@kaod.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, Dec 08 2021, Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Wed, Dec 08, 2021 at 01:26:54PM +0100, Christian Schoenebeck wrote:

>> One more thought: what about making the new 'queue_indirect_size' config field 
>> 32 bit wide instead of 16 bit? That would easily mitigate the issue of the 
>> aggregated limit discussed here, and would in general be more future safe, 
>> i.e. considering that there might be either nested/multi-level indirect 
>> descriptor tables or chained tables in future? The cost would be low, right?
>
> The MMIO transport has 32-bit fields, so there doesn't seem to be a
> strict requirement to use 16 bits for descriptor counts.
>
> I think you're right that the cost is low. Usually it's the access
> itself that carries a cost (a VM exit or bus transaction) and 2 vs 4
> byte transfers don't really matter.

For ccw, I think we'd simply include the value in a control block, and
it does not really matter whether that control block is 2 bytes
longer. So, no objection from me.


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

