Return-Path: <virtio-comment-return-2424-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 738B79864E3
	for <virtio-comment@lists.oasis-open.org>; Thu,  2 Dec 2021 10:27:24 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <3298108.H8ur0sk1vH@silver>
References: <cover.1638192251.git.qemu_oss@crudebyte.com>
 <9053000.DQESySOnJA@silver> <8735ndiwjh.fsf@redhat.com>
 <3298108.H8ur0sk1vH@silver>
Date: Thu, 02 Dec 2021 11:27:17 +0100
Message-ID: <87wnkngv3u.fsf@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] Re: [PATCH v2 0/2] Add
 VIRTIO_RING_F_LARGE_INDIRECT_DESC
Content-Type: text/plain
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, Nov 30 2021, Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Dienstag, 30. November 2021 14:48:50 CET Cornelia Huck wrote:
>> On Tue, Nov 30 2021, Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

>> > And what about the intended availability of this new virtio_pci_common_cfg
>> > field "queue_indirect_size", should it be optional per se, independent of
>> > the virtio version or rather a mandatory field in upcoming virtio
>> > version?
>> We should keep that field depending upon the feature bit IMHO.
>
> So you are suggesting the existence of "queue_indirect_size" field to be 
> dependent on feature flag VIRTIO_RING_F_LARGE_INDIRECT_DESC instead of being 
> dependent on the virtio version.

Yes.

> Stefan, would that also suit your intended 2nd use case of lowering the max. 
> descriptor count *below* Queue Size? It would be somewhat different from what 
> I suggested here in patch 2 [which was min(QueueSize, queue_indirect_size) if 
> VIRTIO_RING_F_LARGE_INDIRECT_DESC not set], but it could be fine as well. 

I think that a configurable value for the descriptor count needs to
depend on the feature bit as well.

> Maybe the name VIRTIO_RING_F_LARGE_INDIRECT_DESC might then a bit misleading 
> though, because the flag would also be set for forcing small limits.

VIRTIO_RING_F_CONFIGURABLE_INDIRECT_DESC ?

>
> Another issue I just realized: there is also an ambiguity in this v2 what the 
> maximum descriptor count actually relates to. Should it be
>
> 1. max. indirect descriptor count per indirect descriptor table
>
> or
>
> 2. max. indirect descriptor count per vring slot (i.e. the sum from multiple 
> indirect descriptor tables within the same message)
>
> Case 2 applies to QEMU's implementation right now AFAICS. The max. possible 
> bulk transfer size is lower in case 2 accordingly.


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

