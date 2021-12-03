Return-Path: <qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [virtio-comment] Re: [PATCH v2 0/2] Add VIRTIO_RING_F_LARGE_INDIRECT_DESC
Date: Fri, 03 Dec 2021 15:47:22 +0100
Message-ID: <10998256.R4olcV2hQn@silver>
In-Reply-To: <87wnkngv3u.fsf@redhat.com>
References: <cover.1638192251.git.qemu_oss@crudebyte.com> <3298108.H8ur0sk1vH@silver> <87wnkngv3u.fsf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
To: Cornelia Huck <cohuck@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Donnerstag, 2. Dezember 2021 11:27:17 CET Cornelia Huck wrote:
> On Tue, Nov 30 2021, Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > On Dienstag, 30. November 2021 14:48:50 CET Cornelia Huck wrote:
> >> On Tue, Nov 30 2021, Christian Schoenebeck <qemu_oss@crudebyte.com> 
wrote:
> >> > And what about the intended availability of this new
> >> > virtio_pci_common_cfg
> >> > field "queue_indirect_size", should it be optional per se, independent
> >> > of
> >> > the virtio version or rather a mandatory field in upcoming virtio
> >> > version?
> >> 
> >> We should keep that field depending upon the feature bit IMHO.
> > 
> > So you are suggesting the existence of "queue_indirect_size" field to be
> > dependent on feature flag VIRTIO_RING_F_LARGE_INDIRECT_DESC instead of
> > being dependent on the virtio version.
> 
> Yes.
> 
> > Stefan, would that also suit your intended 2nd use case of lowering the
> > max. descriptor count *below* Queue Size? It would be somewhat different
> > from what I suggested here in patch 2 [which was min(QueueSize,
> > queue_indirect_size) if VIRTIO_RING_F_LARGE_INDIRECT_DESC not set], but
> > it could be fine as well.
> I think that a configurable value for the descriptor count needs to
> depend on the feature bit as well.
> 
> > Maybe the name VIRTIO_RING_F_LARGE_INDIRECT_DESC might then a bit
> > misleading though, because the flag would also be set for forcing small
> > limits.
> VIRTIO_RING_F_CONFIGURABLE_INDIRECT_DESC ?

As the suggested common config field is "queue_indirect_size", what about 
VIRTIO_RING_F_INDIRECT_SIZE ?

> > Another issue I just realized: there is also an ambiguity in this v2 what
> > the maximum descriptor count actually relates to. Should it be
> > 
> > 1. max. indirect descriptor count per indirect descriptor table
> > 
> > or
> > 
> > 2. max. indirect descriptor count per vring slot (i.e. the sum from
> > multiple indirect descriptor tables within the same message)
> > 
> > Case 2 applies to QEMU's implementation right now AFAICS. The max.
> > possible
> > bulk transfer size is lower in case 2 accordingly.

After reviewing virtio code on QEMU side again, I suggest to go for (2.). 
Otherwise a large portion of QEMU's virtio code would need quite a bunch of 
changes to support (1.). I assume that resistence for such changes in QEMU 
would be high, and I currently don't care enough to work on and defend those 
changes that (1.) would need.

In practice that would mean for many devices: the theoretical absolute max. 
virtio transfer size might be cut into half with (2.) in comparison to (1.), 
which is (2^16 * PAGE_SIZE) / 2 = 128 MB with a typical page size of 4k, 
because one indirect descriptor table is usually used for sending to device 
and another table for receiving from device. But that's use case dependent and 
(1.) is still a huge step forward IMO.

Best regards,
Christian Schoenebeck


