Return-Path: <qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [virtio-comment] Re: [PATCH v2 0/2] Add VIRTIO_RING_F_LARGE_INDIRECT_DESC
Date: Mon, 06 Dec 2021 20:12:14 +0100
Message-ID: <3659399.e9xYYRvpgZ@silver>
In-Reply-To: <875ys2uf14.fsf@redhat.com>
References: <cover.1638192251.git.qemu_oss@crudebyte.com> <10998256.R4olcV2hQn@silver> <875ys2uf14.fsf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
To: Cornelia Huck <cohuck@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Montag, 6. Dezember 2021 12:52:07 CET Cornelia Huck wrote:
> On Fri, Dec 03 2021, Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > On Donnerstag, 2. Dezember 2021 11:27:17 CET Cornelia Huck wrote:
> >> On Tue, Nov 30 2021, Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> >> > On Dienstag, 30. November 2021 14:48:50 CET Cornelia Huck wrote:
> >> >> On Tue, Nov 30 2021, Christian Schoenebeck <qemu_oss@crudebyte.com>
> > 
> > wrote:
> >> >> > And what about the intended availability of this new
> >> >> > virtio_pci_common_cfg
> >> >> > field "queue_indirect_size", should it be optional per se,
> >> >> > independent
> >> >> > of
> >> >> > the virtio version or rather a mandatory field in upcoming virtio
> >> >> > version?
> >> >> 
> >> >> We should keep that field depending upon the feature bit IMHO.
> >> > 
> >> > So you are suggesting the existence of "queue_indirect_size" field to
> >> > be
> >> > dependent on feature flag VIRTIO_RING_F_LARGE_INDIRECT_DESC instead of
> >> > being dependent on the virtio version.
> >> 
> >> Yes.
> >> 
> >> > Stefan, would that also suit your intended 2nd use case of lowering the
> >> > max. descriptor count *below* Queue Size? It would be somewhat
> >> > different
> >> > from what I suggested here in patch 2 [which was min(QueueSize,
> >> > queue_indirect_size) if VIRTIO_RING_F_LARGE_INDIRECT_DESC not set], but
> >> > it could be fine as well.
> >> 
> >> I think that a configurable value for the descriptor count needs to
> >> depend on the feature bit as well.
> >> 
> >> > Maybe the name VIRTIO_RING_F_LARGE_INDIRECT_DESC might then a bit
> >> > misleading though, because the flag would also be set for forcing small
> >> > limits.
> >> 
> >> VIRTIO_RING_F_CONFIGURABLE_INDIRECT_DESC ?
> > 
> > As the suggested common config field is "queue_indirect_size", what about
> > VIRTIO_RING_F_INDIRECT_SIZE ?
> 
> That would work for me as well.

Ok

> >> > Another issue I just realized: there is also an ambiguity in this v2
> >> > what
> >> > the maximum descriptor count actually relates to. Should it be
> >> > 
> >> > 1. max. indirect descriptor count per indirect descriptor table
> >> > 
> >> > or
> >> > 
> >> > 2. max. indirect descriptor count per vring slot (i.e. the sum from
> >> > multiple indirect descriptor tables within the same message)
> >> > 
> >> > Case 2 applies to QEMU's implementation right now AFAICS. The max.
> >> > possible
> >> > bulk transfer size is lower in case 2 accordingly.
> > 
> > After reviewing virtio code on QEMU side again, I suggest to go for (2.).
> > Otherwise a large portion of QEMU's virtio code would need quite a bunch
> > of
> > changes to support (1.). I assume that resistence for such changes in QEMU
> > would be high, and I currently don't care enough to work on and defend
> > those changes that (1.) would need.
> > 
> > In practice that would mean for many devices: the theoretical absolute
> > max.
> > virtio transfer size might be cut into half with (2.) in comparison to
> > (1.), which is (2^16 * PAGE_SIZE) / 2 = 128 MB with a typical page size
> > of 4k, because one indirect descriptor table is usually used for sending
> > to device and another table for receiving from device. But that's use
> > case dependent and (1.) is still a huge step forward IMO.
> 
> If the variant that is easier for QEMU to implement still gives you
> enough of what you need, I'm fine with going with that. (Is it
> future-proof enough?)

No crystal ball here, sorry. :)

Just to give you a feeling what I am talking about here for QEMU, you might
have a quick glimpse on the hw/virtio/virtio.c changes of following patch. It
is not exactly how the final changes would look like, but it should give a
rough idea of what is involved:
https://lore.kernel.org/all/c9dea2e27ae19b2b9a51e8f08687067bf3e47bd5.1633376313.git.qemu_oss@crudebyte.com/

As you can see, QEMU first reserves the max. expected descriptor count as
array memory on stack, then it gathers *all* descriptors from all indirect
descriptor tables of a vring slot all together into that array and finally
the vring slot's message is processed on device level:
https://github.com/qemu/qemu/blob/99fc08366b06282614daeda989d2fde6ab8a707f/hw/virtio/virtio.c#L1475

So a limit per vring slot would be much easier to implement in QEMU, as it is
more or less just refactoring of QEMU's current compile-time constant
VIRTQUEUE_MAX_SIZE into a runtime variable.
Implementing a limit per table instead would require substantial changes to
its current program flow.

Back to your question ...

Assuming that most devices have one or two tables per vring slot, and
considering that almost nobody cared for virtio's current descriptor count
limit so far, I would not expect that the new, much higher limit to be
questioned in the next few years or so. And if it was, you would probably also
start to question all those 16-bit fields in virtio as well and then this
specific aspect here would probably be the smallest issue to worry about.

OTOH if there are devices with like 10 descriptor tables or more per vring
slot, then they obviously would hit this limit much sooner. No idea if there
is any such device though.

> Do we know what other implementors of this standard are doing?

I don't know how this is handled in other implementations, nor who to ask
unfortunately. I assume these would be bhyve and VirtualBox.

Best regards,
Christian Schoenebeck


