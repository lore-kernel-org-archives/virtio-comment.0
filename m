Return-Path: <tstark@linux.microsoft.com>
Date: Wed, 28 Jul 2021 22:04:12 -0700
From: Taylor Stark <tstark@linux.microsoft.com>
Subject: Re: [PATCH v2 1/1] virtio-pmem: Support describing pmem as shared
 memory region
Message-ID: <20210729050412.GA9892@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <20210727042907.24315-1-tstark@linux.microsoft.com>
 <20210727042907.24315-2-tstark@linux.microsoft.com>
 <87fsvz4wzg.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87fsvz4wzg.fsf@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Cornelia Huck <cohuck@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, grahamwo@microsoft.com, benhill@microsoft.com, mst@redhat.com, pankaj.gupta@ionos.com, tstark@microsoft.com, david@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, Jul 27, 2021 at 05:06:43PM +0200, Cornelia Huck wrote:
> On Mon, Jul 26 2021, tstark@linux.microsoft.com wrote:
> 
> > @@ -50,12 +53,29 @@ \subsection{Device Initialization}\label{sec:Device Types / PMEM Device / Device
> >  File backed memory SHOULD be memory mapped to guest address space with SHARED
> >  memory mapping.
> >  
> > +If VIRTIO_PMEM_F_SHMEM_REGION has been negotiated, the device MUST indicate the
> > +guest physical address as a shared memory region. The device MUST use shared
> > +memory region ID 0. The device SHOULD set \field{start} and \field{size} to zero.
> > +
> > +If VIRTIO_PMEM_F_SHMEM_REGION has not been negotiated, the device MUST indicate
> > +the guest physical address as a guest absolute address. The device MUST set
> > +\field{start} to the absolute address and \field{size} to the size of the
> > +address range, in bytes.
> > +
> >  \subsection{Driver Initialization}\label{sec:Device Types / PMEM Driver / Driver Initialization}
> >  
> >  Driver hotplugs the physical memory and registers associated
> >  region with the pmem API. Also, configures a flush callback
> >  function with the corresponding region.
> >  
> > +\drivernormative{\subsubsection}{Driver Initialization}{Device Types / PMEM Driver / Driver Initialization}
> > +
> > +The driver SHOULD query the physical address ranges where the pmem was mapped.
> 
> Isn't the driver quite useless if it doesn't discover where the pmem can
> be found? I'm not sure we need that sentence.

It's about as useful as a paperweight if it doesn't discover where the pmem
was mapped :) Agreed, this isn't necessary.
 
> > +If VIRTIO_PMEM_F_SHMEM_REGION has been negotiated, the driver SHOULD query
> > +shared memory ID 0 for the physical address ranges and MUST NOT use \field{start}
> > +or \field{size}. Else, the driver SHOULD read the physical address ranges from
> > +\field{start} and \field{size}.
> 
> 'SHOULD' is probably not the right way to specify this. What about the
> following:
> 
> "In order to discover the physical address ranges where the pmem was
> mapped:
> 
> If VIRTIO_PMEM_F_SHMEM_REGION has been negotiated, the driver MUST query
> shared memory ID 0 for the physical address ranges, and MUST NOT use
> \field{start} or \field{stop}.
> 
> If VIRTIO_PMEM_F_SHMEM_REGION has not been negotiated, the driver MUST
> read the physical address ranges from \field{start} and \field{stop}."

Sounds great to me. Will update in v3. Thanks again for the advice.

Thanks,
Taylor

