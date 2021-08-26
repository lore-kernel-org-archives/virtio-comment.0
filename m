Return-Path: <jasowang@redhat.com>
MIME-Version: 1.0
References: <39536c3c-e455-5602-9391-0b21add7e22f@nvidia.com>
 <0d06c26e-f1e7-3cac-a017-059e8985bb44@redhat.com> <74151019-6f78-2bff-5b0a-b5a4da814787@nvidia.com>
 <CACGkMEsJ7oqxMPpLET2uPr_om=pQYkbtyEoig5J_KSwzOUEenQ@mail.gmail.com>
 <41fbd78a-f1d8-9056-3929-1e7b6b57a49b@nvidia.com> <CACGkMEvH9gna_bnghvA1o-xgK=Tru5xxr8nsUhEd9E0hsjkZiA@mail.gmail.com>
 <0252a058-f3d2-db34-08a0-02c3cdd0e0bb@nvidia.com> <CACGkMEuT-VZC6vvqOYMEHP7hapSw4Qh-t7_9JercB79ezi-TWg@mail.gmail.com>
 <20210824131007.GT1721383@nvidia.com> <CACGkMEvxmJcgjdTQHoN=cR5xkqT5-QvQV1vPbzif51im7s4hPQ@mail.gmail.com>
 <20210825181348.GL1721383@nvidia.com>
In-Reply-To: <20210825181348.GL1721383@nvidia.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 26 Aug 2021 11:15:25 +0800
Message-ID: <CACGkMEsnj-H4NirfnAdUE=2ArrVoUBoBMWspgD1X6DhLaS_F1g@mail.gmail.com>
Subject: Re: [virtio-comment] Live Migration of Virtio Virtual Function
Content-Type: text/plain; charset="UTF-8"
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Max Gurtovoy <mgurtovoy@nvidia.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "Michael S. Tsirkin" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>, Parav Pandit <parav@nvidia.com>, Shahaf Shuler <shahafs@nvidia.com>, Ariel Adam <aadam@redhat.com>, Amnon Ilan <ailan@redhat.com>, Bodong Wang <bodong@nvidia.com>, Stefan Hajnoczi <stefanha@redhat.com>, Eugenio Perez Martin <eperezma@redhat.com>, Liran Liss <liranl@nvidia.com>, Oren Duer <oren@nvidia.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Aug 26, 2021 at 2:13 AM Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> On Wed, Aug 25, 2021 at 12:58:01PM +0800, Jason Wang wrote:
> > On Tue, Aug 24, 2021 at 9:10 PM Jason Gunthorpe <jgg@nvidia.com> wrote:
> > >
> > > On Tue, Aug 24, 2021 at 10:41:54AM +0800, Jason Wang wrote:
> > >
> > > > > migration exposed to the guest ? No.
> > > >
> > > > Can you explain why?
> > >
> > > For the SRIOV case migration is a privileged operation of the
> > > hypervisor. The guest must not be allowed to interact with it in any
> > > way otherwise the hypervisor migration could be attacked from the
> > > guest and this has definite security implications.
> > >
> > > In practice this means that nothing related to migration can be
> > > located on the MMIO pages/queues/etc of the VF. The reasons for this
> > > are a bit complicated and has to do with the limitations of IO
> > > isolation with VFIO - eg you can't reliably split a single PCI BDF
> > > into hypervisor/guest security domains without PASID.
> >
> > So exposing the migration function can be done indirectly:
> >
> > In L0, the hardware implements the function via PF, Qemu will present
> > an emulated PCI device then Qemu can expose those functions via a
> > capability for L1 guests. When L1 driver tries to use those functions,
> > it goes:
> >
> > L1 virtio-net driver -(emulated PCI-E BAR)-> Qemu -(ioctl)-> L0 kernel
> > VF driver -> L0 kernel PF driver -(virtio interface)-> virtio PF
> >
> > In this approach, there's no way for the L1 driver to control the or
> > see what is implemented in the hardware (PF). The details were hidden
> > by Qemu. This works even if DMA is required for the L0 kernel PF
> > driver to talk with the hardware since for L1 we didn't present a DMA
> > interface. With the future PASID support, we can even present a DMA
> > interface to L1.
>
> Sure, you can do this, but that isn't what is being talked about here,
> and honestly seems like a highly contrived use case.

It's basically how virtio-net / vhost is implemented so far in Qemu.
And if we want to do this sometime in the future, we need another
interface (e.g BAR or capability) in the spec for the emulated device
to allow the L1 to access those functions. That's another reason I
think we need to describe the migration in the chapter "basic device
facility". It eases the future extension of the spec.

>
> Further, in this mode I'd expect the hypervisor kernel driver to
> provide the migration support without requiring any special HW
> function.

For 'special HW function' do you mean PASID? If yes, I agree. But I
think we know that the PASID will be ready in the near future.

>
> > > I see in this thread that these two things are becoming quite
> > > confused. They are very different, have different security postures
> > > and use different parts of the hypervisor stack, and intended for
> > > quite different use cases.
> >
> > It looks like the full PCI VF could go via the virtio-pci vDPA driver
> > as well (drivers/vdpa/virtio-pci). So what's the advantages of
> > exposing the migration of virtio via vfio instead of vhost-vDPA?
>
> Can't say, both are possibly valid approaches with different trade
> offs.
>
> Off hand I think it is just unneeded complexity to use VDPA if the
> device is already exposing a fully functional virtio-pci interface. I
> see VDPA as being useful to create HW accelerated virtio interface
> from HW that does not natively speak full virtio.

I think it depends on how we view vDPA. If we treat vDPA as a vendor
specific control path and think the virtio spec is a "vendor" then
virtio can go within vDPA. For the complexity, it's true that we need
to build everything from scratch. But the virtio/vhost model has been
implemented in Qemu for more than 10 years, and the kernel has already
supported vhost-vDPA. So it's not a lot of engineering effort . Hiding
the hardware details via vhost may have broader use cases.
>
> > 1) migration compatibility with the existing software virtio and
> > vhost/vDPA implementations
>
> IMHO the the virtio spec should define the format of the migration
> state and I'd expect interworking between all the different
> implementations.

Yes, so assuming spec has defined the device state, the hypervisor
still can choose to convert them into another byte stream. Qemu has
already defined the migration stream format for the virtio-pci device,
and it works seamlessly with vhost(vDPA). For the vfio way, this means
it requires extra work in the Qemu (a dedicated migration module or
other) to make the migration work to convert the state to the existing
virtio-pci, and it needs to care about the migration compatibility
among different Qemu machine types and versions. And it needs to teach
the management to know that a migration between "-device vfio-pci" and
"-device virtio-net-pci" can work which is not easy.

>
> > > I agree it would be good spec design to have a general concept of a
> > > secure and guest world and specific sections that defines how it works
> > > for different scenarios, but that seems like a language remark and not
> > > one about the design. For instance the admin queue Max is adding is
> > > clearly part of the secure world and putting it on the PF is the only
> > > option for the SRIOV mode.
> >
> > Yes, but let's move common functionality that is required for all
> > transports to the chapter of "basic device facility". We don't need to
> > define how it works in other different scenarios now.
>
> It seems like a reasonable way to write the spec. I'd define a secure
> admin queue and define how the ops on that queue work
>

Yes.

> Then seperately define how to instantiate the secure admin queue in
> all the relevant scenarios.

I don't object to this. So just to clarify, what I meant is:

1) having one subsection in the "basic device facility" to describe
migration related functions: the dirty page tracking, device states.
2) having another subsection in the "basic device facility" to
describe the admin virtqueue and the ops for the migration functions
mentioned above

I think it doesn't conflict with what Max and you propose here. And it
eases the future extensions and makes sure the core migration facility
is stable.

Thanks

>
> Jason
>

