Return-Path: virtio-comment-return-568-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8D1389842C2
	for <virtio-comment@lists.oasis-open.org>; Mon, 26 Nov 2018 14:03:48 +0000 (UTC)
Date: Mon, 26 Nov 2018 14:03:38 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Message-ID: <20181126140338.GC2547@work-vm>
References: <20180921095459.GA2842@work-vm>
 <20181126111612.GG15869@stefanha-x1.localdomain>
 <20181126135245.v4lklw6qwa2ggv4t@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181126135245.v4lklw6qwa2ggv4t@sirius.home.kraxel.org>
Subject: [virtio-comment] Re: PCI cap for larger offsets/lengths
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, virtio-comment@lists.oasis-open.org, "Michael S. Tsirkin" <mst@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

* Gerd Hoffmann (kraxel@redhat.com) wrote:
> On Mon, Nov 26, 2018 at 11:16:12AM +0000, Stefan Hajnoczi wrote:
> > On Fri, Sep 21, 2018 at 10:54:59AM +0100, Dr. David Alan Gilbert wrote:
> > > Hi,
> > >   We've got an experimental virtio device (using vhost-user) we're playing with
> > > that would like to share multiple large mappings from the client back to qemu.
> > 
> > CCing Michael Tsirkin and Gerd Hoffman.  Gerd could use this for
> > virtio-gpu where some memory must be owned by the host.
> 
> Yep.  For virtio-gpu I want be able to map host gpu resources (which
> must be allocated by the host gpu driver) into the guest address space.
> 
> > > 'virtio_pci_cap' only has 32bit offset and length fields and so
> > > I've got a different capability to express larger regions:
> > > 
> > > 
> > > /* Additional shared memory capability */
> > > #define VIRTIO_PCI_CAP_SHARED_MEMORY_CFG 8
> > > 
> > > struct virtio_pci_shm_cap {
> > >        struct virtio_pci_cap cap;
> > >        le32 offset_hi;             /* Most sig 32 bits of offset */
> > >        le32 length_hi;             /* Most sig 32 bits of length */
> > >        u8   id;                    /* To distinguish shm chunks */
> > > };
> > > 
> > > One oddity is that I'm allowing multiple instances of this capability
> > > on one device, distinguished by their 'id' field which I've made device
> > > type specific, e.g.:
> > > 
> > > #define VIRTIO_MYDEV_PCI_SHMCAP_ID_CACHE   0
> > > #define VIRTIO_MYDEV_PCI_SHMCAP_ID_JOURNAL 1
> 
> For my experimental virtio-gpu code I use one pci bar to reserve address
> space.  It is a separate pci bar.  First, because it is a 64bit bar.
> Second, because it is declared as prefetchable (unlike the mmio bar
> which is not).  I also simply use the whole bar, so no offset/length is
> needed.
> 
> gpu resources are sub-regions within that pci bar, and they are managed
> using device-specific commands.
> 
> So, I'm wondering whenever it makes sense to just do the same for your
> device.  Just use one pci bar as shared memory umbrella, specify that
> one using the virtio vendor cap, then have sub-regions within that bar
> for the various regions you have.  Manage them dynamically (using
> device-specific virtio commands) or just have a static configuration (in
> device-specific config space).

Ours are static subdivisions; so it felt easier to declare them; it's a
shame to make that device specific.

> That avoids the problem with multiple capabilities of the same kind, and
> it also avoids exhausting the cap IDs quicky if every device defines
> their own VIRTIO_FOO_DEVICE_PCI_SHMCAP_ID_BAR_REGION.

Is having multiple capabilities of the same type actually a problem, or
is it just historical in the defitinition of virtio?

Dave

> cheers,
>   Gerd
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

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

