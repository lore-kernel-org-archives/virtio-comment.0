Return-Path: <jgg@nvidia.com>
Date: Wed, 25 Aug 2021 15:13:48 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [virtio-comment] Live Migration of Virtio Virtual Function
Message-ID: <20210825181348.GL1721383@nvidia.com>
References: <39536c3c-e455-5602-9391-0b21add7e22f@nvidia.com>
 <0d06c26e-f1e7-3cac-a017-059e8985bb44@redhat.com>
 <74151019-6f78-2bff-5b0a-b5a4da814787@nvidia.com>
 <CACGkMEsJ7oqxMPpLET2uPr_om=pQYkbtyEoig5J_KSwzOUEenQ@mail.gmail.com>
 <41fbd78a-f1d8-9056-3929-1e7b6b57a49b@nvidia.com>
 <CACGkMEvH9gna_bnghvA1o-xgK=Tru5xxr8nsUhEd9E0hsjkZiA@mail.gmail.com>
 <0252a058-f3d2-db34-08a0-02c3cdd0e0bb@nvidia.com>
 <CACGkMEuT-VZC6vvqOYMEHP7hapSw4Qh-t7_9JercB79ezi-TWg@mail.gmail.com>
 <20210824131007.GT1721383@nvidia.com>
 <CACGkMEvxmJcgjdTQHoN=cR5xkqT5-QvQV1vPbzif51im7s4hPQ@mail.gmail.com>
In-Reply-To: <CACGkMEvxmJcgjdTQHoN=cR5xkqT5-QvQV1vPbzif51im7s4hPQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Jason Wang <jasowang@redhat.com>
Cc: Max Gurtovoy <mgurtovoy@nvidia.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "Michael S. Tsirkin" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>, Parav Pandit <parav@nvidia.com>, Shahaf Shuler <shahafs@nvidia.com>, Ariel Adam <aadam@redhat.com>, Amnon Ilan <ailan@redhat.com>, Bodong Wang <bodong@nvidia.com>, Stefan Hajnoczi <stefanha@redhat.com>, Eugenio Perez Martin <eperezma@redhat.com>, Liran Liss <liranl@nvidia.com>, Oren Duer <oren@nvidia.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, Aug 25, 2021 at 12:58:01PM +0800, Jason Wang wrote:
> On Tue, Aug 24, 2021 at 9:10 PM Jason Gunthorpe <jgg@nvidia.com> wrote:
> >
> > On Tue, Aug 24, 2021 at 10:41:54AM +0800, Jason Wang wrote:
> >
> > > > migration exposed to the guest ? No.
> > >
> > > Can you explain why?
> >
> > For the SRIOV case migration is a privileged operation of the
> > hypervisor. The guest must not be allowed to interact with it in any
> > way otherwise the hypervisor migration could be attacked from the
> > guest and this has definite security implications.
> >
> > In practice this means that nothing related to migration can be
> > located on the MMIO pages/queues/etc of the VF. The reasons for this
> > are a bit complicated and has to do with the limitations of IO
> > isolation with VFIO - eg you can't reliably split a single PCI BDF
> > into hypervisor/guest security domains without PASID.
> 
> So exposing the migration function can be done indirectly:
> 
> In L0, the hardware implements the function via PF, Qemu will present
> an emulated PCI device then Qemu can expose those functions via a
> capability for L1 guests. When L1 driver tries to use those functions,
> it goes:
> 
> L1 virtio-net driver -(emulated PCI-E BAR)-> Qemu -(ioctl)-> L0 kernel
> VF driver -> L0 kernel PF driver -(virtio interface)-> virtio PF
> 
> In this approach, there's no way for the L1 driver to control the or
> see what is implemented in the hardware (PF). The details were hidden
> by Qemu. This works even if DMA is required for the L0 kernel PF
> driver to talk with the hardware since for L1 we didn't present a DMA
> interface. With the future PASID support, we can even present a DMA
> interface to L1.

Sure, you can do this, but that isn't what is being talked about here,
and honestly seems like a highly contrived use case.

Further, in this mode I'd expect the hypervisor kernel driver to
provide the migration support without requiring any special HW
function.

> > I see in this thread that these two things are becoming quite
> > confused. They are very different, have different security postures
> > and use different parts of the hypervisor stack, and intended for
> > quite different use cases.
> 
> It looks like the full PCI VF could go via the virtio-pci vDPA driver
> as well (drivers/vdpa/virtio-pci). So what's the advantages of
> exposing the migration of virtio via vfio instead of vhost-vDPA? 

Can't say, both are possibly valid approaches with different trade
offs.

Off hand I think it is just unneeded complexity to use VDPA if the
device is already exposing a fully functional virtio-pci interface. I
see VDPA as being useful to create HW accelerated virtio interface
from HW that does not natively speak full virtio.

> 1) migration compatibility with the existing software virtio and
> vhost/vDPA implementations

IMHO the the virtio spec should define the format of the migration
state and I'd expect interworking between all the different
implementations.

> > I agree it would be good spec design to have a general concept of a
> > secure and guest world and specific sections that defines how it works
> > for different scenarios, but that seems like a language remark and not
> > one about the design. For instance the admin queue Max is adding is
> > clearly part of the secure world and putting it on the PF is the only
> > option for the SRIOV mode.
> 
> Yes, but let's move common functionality that is required for all
> transports to the chapter of "basic device facility". We don't need to
> define how it works in other different scenarios now.

It seems like a reasonable way to write the spec. I'd define a secure
admin queue and define how the ops on that queue work

Then seperately define how to instantiate the secure admin queue in
all the relevant scenarios.

Jason

