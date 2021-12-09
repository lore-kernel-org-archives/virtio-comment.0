Return-Path: <qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [virtio-comment] Re: [PATCH v2 0/2] Add VIRTIO_RING_F_LARGE_INDIRECT_DESC
Date: Thu, 09 Dec 2021 13:33:20 +0100
Message-ID: <2346601.RvB5glhVSD@silver>
In-Reply-To: <877dcft8u0.fsf@redhat.com>
References: <cover.1638192251.git.qemu_oss@crudebyte.com> <YbDLDt6Cn+qonnmr@stefanha-x1.localdomain> <877dcft8u0.fsf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
To: Cornelia Huck <cohuck@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, virtio-comment@lists.oasis-open.org, Greg Kurz <groug@kaod.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Mittwoch, 8. Dezember 2021 16:28:07 CET Cornelia Huck wrote:
> On Wed, Dec 08 2021, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > On Wed, Dec 08, 2021 at 01:26:54PM +0100, Christian Schoenebeck wrote:
> >> One more thought: what about making the new 'queue_indirect_size' config
> >> field 32 bit wide instead of 16 bit? That would easily mitigate the
> >> issue of the aggregated limit discussed here, and would in general be
> >> more future safe, i.e. considering that there might be either
> >> nested/multi-level indirect descriptor tables or chained tables in
> >> future? The cost would be low, right?> 
> > The MMIO transport has 32-bit fields, so there doesn't seem to be a
> > strict requirement to use 16 bits for descriptor counts.
> > 
> > I think you're right that the cost is low. Usually it's the access
> > itself that carries a cost (a VM exit or bus transaction) and 2 vs 4
> > byte transfers don't really matter.
> 
> For ccw, I think we'd simply include the value in a control block, and
> it does not really matter whether that control block is 2 bytes
> longer. So, no objection from me.

Sounds like a plan!

I will send a new version next week. Thanks guys!

Best regards,
Christian Schoenebeck


