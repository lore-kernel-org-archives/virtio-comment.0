Return-Path: <jgg@nvidia.com>
Date: Thu, 26 Aug 2021 09:27:50 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [virtio-comment] Live Migration of Virtio Virtual Function
Message-ID: <20210826122750.GO1721383@nvidia.com>
References: <74151019-6f78-2bff-5b0a-b5a4da814787@nvidia.com>
 <CACGkMEsJ7oqxMPpLET2uPr_om=pQYkbtyEoig5J_KSwzOUEenQ@mail.gmail.com>
 <41fbd78a-f1d8-9056-3929-1e7b6b57a49b@nvidia.com>
 <CACGkMEvH9gna_bnghvA1o-xgK=Tru5xxr8nsUhEd9E0hsjkZiA@mail.gmail.com>
 <0252a058-f3d2-db34-08a0-02c3cdd0e0bb@nvidia.com>
 <CACGkMEuT-VZC6vvqOYMEHP7hapSw4Qh-t7_9JercB79ezi-TWg@mail.gmail.com>
 <20210824131007.GT1721383@nvidia.com>
 <CACGkMEvxmJcgjdTQHoN=cR5xkqT5-QvQV1vPbzif51im7s4hPQ@mail.gmail.com>
 <20210825181348.GL1721383@nvidia.com>
 <CACGkMEsnj-H4NirfnAdUE=2ArrVoUBoBMWspgD1X6DhLaS_F1g@mail.gmail.com>
In-Reply-To: <CACGkMEsnj-H4NirfnAdUE=2ArrVoUBoBMWspgD1X6DhLaS_F1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Jason Wang <jasowang@redhat.com>
Cc: Max Gurtovoy <mgurtovoy@nvidia.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "Michael S. Tsirkin" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>, Parav Pandit <parav@nvidia.com>, Shahaf Shuler <shahafs@nvidia.com>, Ariel Adam <aadam@redhat.com>, Amnon Ilan <ailan@redhat.com>, Bodong Wang <bodong@nvidia.com>, Stefan Hajnoczi <stefanha@redhat.com>, Eugenio Perez Martin <eperezma@redhat.com>, Liran Liss <liranl@nvidia.com>, Oren Duer <oren@nvidia.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Aug 26, 2021 at 11:15:25AM +0800, Jason Wang wrote:
> On Thu, Aug 26, 2021 at 2:13 AM Jason Gunthorpe <jgg@nvidia.com> wrote:
> >
> > On Wed, Aug 25, 2021 at 12:58:01PM +0800, Jason Wang wrote:
> > > On Tue, Aug 24, 2021 at 9:10 PM Jason Gunthorpe <jgg@nvidia.com> wrote:
> > > >
> > > > On Tue, Aug 24, 2021 at 10:41:54AM +0800, Jason Wang wrote:
> > > >
> > > > > > migration exposed to the guest ? No.
> > > > >
> > > > > Can you explain why?
> > > >
> > > > For the SRIOV case migration is a privileged operation of the
> > > > hypervisor. The guest must not be allowed to interact with it in any
> > > > way otherwise the hypervisor migration could be attacked from the
> > > > guest and this has definite security implications.
> > > >
> > > > In practice this means that nothing related to migration can be
> > > > located on the MMIO pages/queues/etc of the VF. The reasons for this
> > > > are a bit complicated and has to do with the limitations of IO
> > > > isolation with VFIO - eg you can't reliably split a single PCI BDF
> > > > into hypervisor/guest security domains without PASID.
> > >
> > > So exposing the migration function can be done indirectly:
> > >
> > > In L0, the hardware implements the function via PF, Qemu will present
> > > an emulated PCI device then Qemu can expose those functions via a
> > > capability for L1 guests. When L1 driver tries to use those functions,
> > > it goes:
> > >
> > > L1 virtio-net driver -(emulated PCI-E BAR)-> Qemu -(ioctl)-> L0 kernel
> > > VF driver -> L0 kernel PF driver -(virtio interface)-> virtio PF
> > >
> > > In this approach, there's no way for the L1 driver to control the or
> > > see what is implemented in the hardware (PF). The details were hidden
> > > by Qemu. This works even if DMA is required for the L0 kernel PF
> > > driver to talk with the hardware since for L1 we didn't present a DMA
> > > interface. With the future PASID support, we can even present a DMA
> > > interface to L1.
> >
> > Sure, you can do this, but that isn't what is being talked about here,
> > and honestly seems like a highly contrived use case.
> 
> It's basically how virtio-net / vhost is implemented so far in Qemu.

Well, a "L1 no DMA interface" is completely not interesting for this
work. People that want a "no DMA" workflow can use the existing netdev
mechanisms and don't need HW assisted migration.

> And if we want to do this sometime in the future, we need another
> interface (e.g BAR or capability) in the spec for the emulated device
> to allow the L1 to access those functions. That's another reason I
> think we need to describe the migration in the chapter "basic device
> facility". It eases the future extension of the spec.

The L1 has the same issue as the bare metal, the migration function is
secure and how the two security domains are exposed and interact with
the vIOMMU must be defined.

The L0/L1 scenario above doesn't change anything, you still cannot
expose the migration function in the bar or capability block of the
virtio function because it becomes bundled with the security domain of
the function and rendered useless for its purpose.

> > Further, in this mode I'd expect the hypervisor kernel driver to
> > provide the migration support without requiring any special HW
> > function.
> 
> For 'special HW function' do you mean PASID? If yes, I agree. But I
> think we know that the PASID will be ready in the near future.

I mean the HW support to execute virtio suspend/resume/dirty page
tracking. If you have no DMA and a SW layer in the middle the
hypervisor driver can just do this directly in SW.

> I think it depends on how we view vDPA. If we treat vDPA as a vendor
> specific control path and think the virtio spec is a "vendor" then
> virtio can go within vDPA.

It can, but why? The whole point of vDPA is to create a virtio
interface, if I already have a perfectly functional virtio interface
why would I want to wrapper more software around it just to get back
to where I started?

This can only create problems in the long run.

Jason

