Return-Path: <qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: [virtio-comment] Re: [PATCH v2 0/2] Add VIRTIO_RING_F_LARGE_INDIRECT_DESC
Date: Tue, 30 Nov 2021 19:47:20 +0100
Message-ID: <3298108.H8ur0sk1vH@silver>
In-Reply-To: <8735ndiwjh.fsf@redhat.com>
References: <cover.1638192251.git.qemu_oss@crudebyte.com> <9053000.DQESySOnJA@silver> <8735ndiwjh.fsf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
To: Cornelia Huck <cohuck@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Dienstag, 30. November 2021 14:48:50 CET Cornelia Huck wrote:
> On Tue, Nov 30 2021, Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > On Dienstag, 30. November 2021 13:06:31 CET Cornelia Huck wrote:
> >> On Mon, Nov 29 2021, Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> >> > This is a follow-up of:
> >> > https://lists.oasis-open.org/archives/virtio-comment/202111/msg00059.ht
> >> > ml
> >> > 
> >> > These two patches introduce a more fine graded control over the maximum
> >> > length of an indirect descriptor table.
> >> > 
> >> > Associated Github Task:
> >> > https://github.com/oasis-tcs/virtio-spec/issues/122
> >> > 
> >> > v1 -> v2:
> >> >   * "active/pending message(s)" -> "vring slot(s)"
> >> >   
> >> >     NOTE: I decided to use the term "vring slot(s)" over the previously
> >> >     suggested term "buffer(s)" as I found tha latter too ambiguous in
> >> >     this
> >> >     context. [patch 1]
> >> >   
> >> >   * "... but does not oppose a limit to the actual bulk data size
> >> >   
> >> >     being transmitted."
> >> >     ->
> >> >     " ... but does not oppose a limit to the actual bulk data size
> >> >     being transmitted when indirect descriptors are used." [patch 1]
> >> >   
> >> >   * Add common configuration field "queue_indirect_size" and make it
> >> >   
> >> >     mandatory as of revision 3. [NEW patch 2]
> >> 
> >> Now you have me confused: 'revision' is a ccw transport concept, but you
> >> only add support on the pci transport? It's fine to leave out ccw (and
> >> mmio) for now, but you should not talk about revision 3...
> > 
> > Looks like I was too quick on this one. Right, the name
> > virtio_pci_common_cfg should have suggested to me that this was PCI
> > specific. :) I simply assumed this was a common config structure shared
> > by all bus types.
> > 
> > And I had no idea that you were referring with "revision" to a bus
> > specific
> > mechanism either. I assumed virtio v1.0 = rev1, virtio v1.1 = rev2 and
> > that
> > the upcoming spec to become v1.2 = rev3 (i.e. for all bus tyes).
> 
> Apologies if I was too confusing with my comments :(

My bad. :)

> > So what is the desired approach to proceed on this overall task, should
> > this just be addressed on PCI for now as first step?
> 
> Yes, I'd concentrate on PCI first. It should not be too hard to add this
> for the other transports.

Ok

> > And what about the intended availability of this new virtio_pci_common_cfg
> > field "queue_indirect_size", should it be optional per se, independent of
> > the virtio version or rather a mandatory field in upcoming virtio
> > version?
> We should keep that field depending upon the feature bit IMHO.

So you are suggesting the existence of "queue_indirect_size" field to be 
dependent on feature flag VIRTIO_RING_F_LARGE_INDIRECT_DESC instead of being 
dependent on the virtio version.

Stefan, would that also suit your intended 2nd use case of lowering the max. 
descriptor count *below* Queue Size? It would be somewhat different from what 
I suggested here in patch 2 [which was min(QueueSize, queue_indirect_size) if 
VIRTIO_RING_F_LARGE_INDIRECT_DESC not set], but it could be fine as well. 
Maybe the name VIRTIO_RING_F_LARGE_INDIRECT_DESC might then a bit misleading 
though, because the flag would also be set for forcing small limits.

Another issue I just realized: there is also an ambiguity in this v2 what the 
maximum descriptor count actually relates to. Should it be

1. max. indirect descriptor count per indirect descriptor table

or

2. max. indirect descriptor count per vring slot (i.e. the sum from multiple 
indirect descriptor tables within the same message)

Case 2 applies to QEMU's implementation right now AFAICS. The max. possible 
bulk transfer size is lower in case 2 accordingly.

> >> > Christian Schoenebeck (2):
> >> >   Add VIRTIO_RING_F_LARGE_INDIRECT_DESC
> >> >   Add common configuration field "queue_indirect_size"
> >> >  
> >> >  content.tex    | 56 ++++++++++++++++++++++++++++++++++++++++++++++++++
> >> >  split-ring.tex |  7 ++++++-
> >> >  2 files changed, 62 insertions(+), 1 deletion(-)


