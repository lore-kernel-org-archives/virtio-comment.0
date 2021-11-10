Return-Path: <tstark@linux.microsoft.com>
Date: Wed, 10 Nov 2021 10:53:33 -0800
From: Taylor Stark <tstark@linux.microsoft.com>
Subject: Re: [virtio-comment] [PATCH v4 1/1] virtio-pmem: Support describing
 pmem as shared memory region
Message-ID: <20211110185333.GA12229@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <20211105201105.2977-1-tstark@linux.microsoft.com>
 <20211105201105.2977-2-tstark@linux.microsoft.com>
 <87wnlivmd8.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87wnlivmd8.fsf@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Cornelia Huck <cohuck@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, grahamwo@microsoft.com, benhill@microsoft.com, tstark@microsoft.com, pankaj.gupta.linux@gmail.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Nov 08, 2021 at 01:54:27PM +0100, Cornelia Huck wrote:
> On Fri, Nov 05 2021, tstark@linux.microsoft.com wrote:
> 
> > From: Taylor Stark <tstark@microsoft.com>
> >
> > Update the virtio-pmem spec to add support for describing the pmem region as a
> > shared memory window. This is required to support virtio-pmem in Hyper-V, since
> > Hyper-V only allows PCI devices to operate on memory ranges defined via BARs.
> > When using the virtio PCI transport, shared memory regions are described via
> > PCI BARs.
> >
> > Signed-off-by: Taylor Stark <tstark@microsoft.com>
> > ---
> >  conformance.tex | 14 ++++++++++++--
> >  virtio-pmem.tex | 34 +++++++++++++++++++++++++++++-----
> >  2 files changed, 41 insertions(+), 7 deletions(-)
> 
> (...)
> 
> > @@ -41,17 +44,38 @@ \subsection{Device configuration layout}\label{sec:Device Types / PMEM Device /
> >  \item[\field{size}] contains the length of this address range.
> >  \end{description}
> 
> I wonder whether we should also amend the description of the config
> space fields to "contains (...), if VIRTIO_PMEM_F_SHMEM_REGION has not
> been negotiated". But maybe that is not really needed.

Sounds reasonable to me. I'll send an update with the changes.

