Return-Path: virtio-comment-return-573-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E67FE985D1C
	for <virtio-comment@lists.oasis-open.org>; Wed, 28 Nov 2018 20:17:05 +0000 (UTC)
Date: Wed, 28 Nov 2018 15:16:57 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20181128151352-mutt-send-email-mst@kernel.org>
References: <20180921095459.GA2842@work-vm>
 <20181126111612.GG15869@stefanha-x1.localdomain>
 <20181126135245.v4lklw6qwa2ggv4t@sirius.home.kraxel.org>
 <20181126140338.GC2547@work-vm>
 <20181126145145.cbuzccf3qo4z2nau@sirius.home.kraxel.org>
 <20181127100904-mutt-send-email-mst@kernel.org>
 <20181128171836.GA2453@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181128171836.GA2453@work-vm>
Subject: Re: [virtio-comment] Re: PCI cap for larger offsets/lengths
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, Nov 28, 2018 at 05:18:37PM +0000, Dr. David Alan Gilbert wrote:
> * Michael S. Tsirkin (mst@redhat.com) wrote:
> > On Mon, Nov 26, 2018 at 03:51:45PM +0100, Gerd Hoffmann wrote:
> > >   Hi,
> > > 
> > > > > So, I'm wondering whenever it makes sense to just do the same for your
> > > > > device.  Just use one pci bar as shared memory umbrella, specify that
> > > > > one using the virtio vendor cap, then have sub-regions within that bar
> > > > > for the various regions you have.  Manage them dynamically (using
> > > > > device-specific virtio commands) or just have a static configuration (in
> > > > > device-specific config space).
> > > > 
> > > > Ours are static subdivisions; so it felt easier to declare them; it's a
> > > > shame to make that device specific.
> > > 
> > > Shared memory handling is device specific anyway, so I fail to see why
> > > this is a problem.  Or do you want place virtio queues there (which
> > > could be common ground for multiple device types) ?
> > > 
> > > > > That avoids the problem with multiple capabilities of the same kind, and
> > > > > it also avoids exhausting the cap IDs quicky if every device defines
> > > > > their own VIRTIO_FOO_DEVICE_PCI_SHMCAP_ID_BAR_REGION.
> > > > 
> > > > Is having multiple capabilities of the same type actually a problem, or
> > > > is it just historical in the defitinition of virtio?
> > > 
> > > I think the reason is that you can in theory have the same region twice,
> > > once in an IO bar and once in an MMIO bar, and then the guest could
> > > prefer the IO bar if possible and use the MMIO bar otherwise (PCIe slot
> > > without IO address window for example).  I think that was never actually
> > > done in practice,
> > 
> > There's an option to enable that for AMD CPUs where MMIO
> > faults are slower than on intel CPUs.
> > 
> > > and for (prefetchable) memory bars it doesn't make
> > > sense at all.  So that would unlikely be a problem in practice.
> > > 
> > > Running out of capability IDs could become a real problem though.
> > > 
> > > cheers,
> > >   Gerd
> > 
> > We can always add more bits if we run out of these. there's
> > no real limit on capability size.
> 
> I thought it was defined as 8 bits by the capability-linked list
> structure in PCI?
> 
> Dave

Maybe I misunderstand. Don't you mean u8 cfg_type field type in struct
virtio_pci_cap? If so then what I was pointing out is that
if we ever need more than 256 types then we
can always have a special cfg_type value(s) meaning
"different format" and add more types this way.


> > -- 
> > MST
> > 
> > This publicly archived list offers a means to provide input to the
> > OASIS Virtual I/O Device (VIRTIO) TC.
> > 
> > In order to verify user consent to the Feedback License terms and
> > to minimize spam in the list archive, subscription is required
> > before posting.
> > 
> > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > List help: virtio-comment-help@lists.oasis-open.org
> > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> > List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> > Committee: https://www.oasis-open.org/committees/virtio/
> > Join OASIS: https://www.oasis-open.org/join/
> > 
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

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

