Return-Path: <tstark@linux.microsoft.com>
Date: Thu, 11 Nov 2021 10:17:38 -0800
From: Taylor Stark <tstark@linux.microsoft.com>
Subject: Re: [virtio-comment] [PATCH v5 1/1] virtio-pmem: Support describing
 pmem as shared memory region
Message-ID: <20211111181738.GA24167@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <20211110185555.190-1-tstark@linux.microsoft.com>
 <20211110185555.190-2-tstark@linux.microsoft.com>
 <87sfw37ymd.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87sfw37ymd.fsf@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Cornelia Huck <cohuck@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, grahamwo@microsoft.com, benhill@microsoft.com, tstark@microsoft.com, pankaj.gupta.linux@gmail.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Nov 11, 2021 at 11:52:42AM +0100, Cornelia Huck wrote:
> On Wed, Nov 10 2021, tstark@linux.microsoft.com wrote:
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
> >  virtio-pmem.tex | 40 +++++++++++++++++++++++++++++++++-------
> >  2 files changed, 45 insertions(+), 9 deletions(-)
> 
> This looks good to me now.
> 
> Could you please open an issue at
> https://github.com/oasis-tcs/virtio-spec/issues to get this included? If
> nobody has any further comments, I think we could start the voting
> process soon.

Sounds good, thanks Cornelia!

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/121

