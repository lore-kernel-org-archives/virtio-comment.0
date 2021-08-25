Return-Path: <jasowang@redhat.com>
MIME-Version: 1.0
References: <755ff192-33ac-9f6a-a7ad-b44b14afd5d2@nvidia.com>
 <YR5pgsRf3p4rBwnc@work-vm> <39536c3c-e455-5602-9391-0b21add7e22f@nvidia.com>
 <0d06c26e-f1e7-3cac-a017-059e8985bb44@redhat.com> <74151019-6f78-2bff-5b0a-b5a4da814787@nvidia.com>
 <CACGkMEsJ7oqxMPpLET2uPr_om=pQYkbtyEoig5J_KSwzOUEenQ@mail.gmail.com>
 <41fbd78a-f1d8-9056-3929-1e7b6b57a49b@nvidia.com> <CACGkMEvH9gna_bnghvA1o-xgK=Tru5xxr8nsUhEd9E0hsjkZiA@mail.gmail.com>
 <0252a058-f3d2-db34-08a0-02c3cdd0e0bb@nvidia.com> <CACGkMEuT-VZC6vvqOYMEHP7hapSw4Qh-t7_9JercB79ezi-TWg@mail.gmail.com>
 <20210824131007.GT1721383@nvidia.com>
In-Reply-To: <20210824131007.GT1721383@nvidia.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 25 Aug 2021 12:58:01 +0800
Message-ID: <CACGkMEvxmJcgjdTQHoN=cR5xkqT5-QvQV1vPbzif51im7s4hPQ@mail.gmail.com>
Subject: Re: [virtio-comment] Live Migration of Virtio Virtual Function
Content-Type: text/plain; charset="UTF-8"
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Max Gurtovoy <mgurtovoy@nvidia.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "Michael S. Tsirkin" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>, Parav Pandit <parav@nvidia.com>, Shahaf Shuler <shahafs@nvidia.com>, Ariel Adam <aadam@redhat.com>, Amnon Ilan <ailan@redhat.com>, Bodong Wang <bodong@nvidia.com>, Stefan Hajnoczi <stefanha@redhat.com>, Eugenio Perez Martin <eperezma@redhat.com>, Liran Liss <liranl@nvidia.com>, Oren Duer <oren@nvidia.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, Aug 24, 2021 at 9:10 PM Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> On Tue, Aug 24, 2021 at 10:41:54AM +0800, Jason Wang wrote:
>
> > > migration exposed to the guest ? No.
> >
> > Can you explain why?
>
> For the SRIOV case migration is a privileged operation of the
> hypervisor. The guest must not be allowed to interact with it in any
> way otherwise the hypervisor migration could be attacked from the
> guest and this has definite security implications.
>
> In practice this means that nothing related to migration can be
> located on the MMIO pages/queues/etc of the VF. The reasons for this
> are a bit complicated and has to do with the limitations of IO
> isolation with VFIO - eg you can't reliably split a single PCI BDF
> into hypervisor/guest security domains without PASID.

So exposing the migration function can be done indirectly:

In L0, the hardware implements the function via PF, Qemu will present
an emulated PCI device then Qemu can expose those functions via a
capability for L1 guests. When L1 driver tries to use those functions,
it goes:

L1 virtio-net driver -(emulated PCI-E BAR)-> Qemu -(ioctl)-> L0 kernel
VF driver -> L0 kernel PF driver -(virtio interface)-> virtio PF

In this approach, there's no way for the L1 driver to control the or
see what is implemented in the hardware (PF). The details were hidden
by Qemu. This works even if DMA is required for the L0 kernel PF
driver to talk with the hardware since for L1 we didn't present a DMA
interface. With the future PASID support, we can even present a DMA
interface to L1.

>
> We recently revisited this concept again with a HNS vfio driver. IIRC
> Intel messed it up in their mdev driver too.
>
> > > >>> Let's open another thread for this if you wish, it has nothing related
> > > >>> to the spec but how it is implemented in Linux. If you search the
> > > >>> archive, something similar to "vfio_virtio_pci" has been proposed
> > > >>> several years before by Intel. The idea has been rejected, and we have
> > > >>> leveraged Linux vDPA bus for virtio-pci devices.
>
> That was largely because Intel was proposing to use mdevs to create an
> entire VDPA subsystem hidden inside VFIO.
>
> We've invested in a pure VFIO solution which should be merged soon:
>
> https://lore.kernel.org/kvm/20210819161914.7ad2e80e.alex.williamson@redhat.com/
>
> It does not rely on mdevs. It is not trying to recreate VDPA. Instead
> the HW provides a fully functional virto VF and the solution uses
> normal SRIOV approaches.
>
> You can contrast this with the two virtio-net solutions mlx5 will
> support:
>
> - One is the existing hypervisor assisted VDPA solution where the mlx5
>   driver does HW accelerated queue processing.
>
> - The other one is a full PCI VF that provides a virtio-net function
>   without any hypervisor assistance. In this case we will have a VFIO
>   migration driver as above that to provide SRIOV VF live migration.

This part I understand.

>
> I see in this thread that these two things are becoming quite
> confused. They are very different, have different security postures
> and use different parts of the hypervisor stack, and intended for
> quite different use cases.

It looks like the full PCI VF could go via the virtio-pci vDPA driver
as well (drivers/vdpa/virtio-pci). So what's the advantages of
exposing the migration of virtio via vfio instead of vhost-vDPA? With
the vhost, we can have a lot of benefits:

1) migration compatibility with the existing software virtio and
vhost/vDPA implementations
2) presenting a virtio device instead of a virtio-pci device, this
makes it possible to be used by the case that guest doesn't need a PCI
at all  (firecracker or micro vm)
3) management infrastructure is almost ready (what Parav did)

>
> > Your proposal works only for PCI with SR-IOV. And I want to leverage
> > it to be useful for other platforms or transport. That's all my
> > motivation.
>
> I've read most of the emails here I still don't see what the use case
> is for this beyond PCI SRIOV.

So we have transports other than PCI. The basic functions for
migration is common:

- device freeze/stop
- device states
- dirty page tracking (not a must)

>
> In a general sense it requires virtio to specify how PASID works. No
> matter what we must create a split secure/guest world where DMAs from
> each world are uniquely tagged. In the pure PCI world this means
> either using PF/VF or VF/PASID.
>
> In general PASID still has a long road to go before it is working in
> Linux:
>
> https://lore.kernel.org/kvm/BN9PR11MB5433B1E4AE5B0480369F97178C189@BN9PR11MB5433.namprd11.prod.outlook.com/
>

Yes, I think we have agreed that it is something we want and vDPA will
support that for sure.

> So, IMHO, it make sense to focus on the PF/VF definition for spec
> purposes.

That's fine.

>
> I agree it would be good spec design to have a general concept of a
> secure and guest world and specific sections that defines how it works
> for different scenarios, but that seems like a language remark and not
> one about the design. For instance the admin queue Max is adding is
> clearly part of the secure world and putting it on the PF is the only
> option for the SRIOV mode.

Yes, but let's move common functionality that is required for all
transports to the chapter of "basic device facility". We don't need to
define how it works in other different scenarios now.

Thanks

>
> Jason
>

