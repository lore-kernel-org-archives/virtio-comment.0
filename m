Return-Path: <virtio-comment-return-2397-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D879B9864A7
	for <virtio-comment@lists.oasis-open.org>; Thu, 25 Nov 2021 14:58:39 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <3085786.hZH81LJa6W@silver>
References: <E1mpa34-0008EK-Di@lizzy.crudebyte.com>
 <YZ5zEwIGpudE8cjB@stefanha-x1.localdomain> <3085786.hZH81LJa6W@silver>
Date: Thu, 25 Nov 2021 15:58:32 +0100
Message-ID: <877dcwjn8n.fsf@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] Re: [PATCH] Add VIRTIO_RING_F_LARGE_INDIRECT_DESC
Content-Type: text/plain
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, Stefan Hajnoczi <stefanha@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Greg Kurz <groug@kaod.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Nov 25 2021, Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Mittwoch, 24. November 2021 18:14:59 CET Stefan Hajnoczi wrote:
>> On Fri, Nov 19, 2021 at 02:21:12PM +0100, Christian Schoenebeck wrote:
>> > This new feature flag allows indirect descriptor tables to
>> > exceed the queue size.
>> > 
>> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
>> > ---
>> > Stefan noted that there should also be a numeric configuration field
>> > reflecting a precise limit of indirect descriptors. The question is where
>> > should that go to exactly? Some devices currently handle this in their
>> > device specific configuration space. Wouldn't it make sense to handle that
>> > in the common configuration space instead?
>> 
>> It could be added as a read-only struct virtio_pci_common_cfg le16
>> queue_indirect_size field. The same needs to be done for the other
>> transports.
>
> OK, do I have to make it clear that it is an optional field in 
> virtio_pci_common_cfg?

It would need to be something like "this field only exists if
VIRTIO_RING_F_LARGE_INDIRECT_DESC has been negotiated".

I'm not quite sure how MMIO expresses optional registers.

For CCW, it's a bit more complicated: You would need to extend two
command payloads (vq_config_block and vq_info_block, assuming you want
to make this read/write); to do that, we will likely want to introduce
revision 3 (and make the feature bit dependent on revision 3).

>
> Are you sure about read-only? QEMU currently reserves the worst case expected 
> amount of descriptors on stack on every vring entry being processed. If that 
> field was read-write instead, and if guest driver never uses the amount of 
> descriptors as advertised by host device being support, guest driver could 
> simply lower that value and reduce the pressure on host device.
>
> So maybe it would make sense making it read-write with the requirement that 
> guest driver must not increase the value? In the end that write option would 
> be a soft feature, device could still ignore it and allocate more, it wouldn't 
> hurt IMO and avoids another feature flag being required for this in future.

I agree, this should be read/write. It's similar to the queue size,
where the driver may also configure a lower number.


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

