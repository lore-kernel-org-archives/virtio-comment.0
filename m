Return-Path: <mst@redhat.com>
Date: Thu, 16 Jun 2022 12:40:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [virtio-comment] [PATCH v4] virtio-vsock: add max payload size
 config field
Message-ID: <20220616123431-mutt-send-email-mst@kernel.org>
References: <20220613104038.22010-1-lauralg@amazon.com>
 <20220614135734.534dbc0b.pasic@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20220614135734.534dbc0b.pasic@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Halil Pasic <pasic@linux.ibm.com>
Cc: Laura Loghin <lauralg@amazon.com>, virtio-comment@lists.oasis-open.org, Cornelia Huck <cohuck@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, Jun 14, 2022 at 01:57:34PM +0200, Halil Pasic wrote:
> On Mon, 13 Jun 2022 13:40:38 +0300
> Laura Loghin <lauralg@amazon.com> wrote:
> 
> > @@ -57,6 +62,25 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
> >  \hline
> >  \end{tabular}
> >  
> > +The following driver-read-only field, \field{data_max_size} only exists if
> > +VIRTIO_VSOCK_F_SIZE_MAX is set. This field specifies the maximum packet payload
> > +size for the driver to use.
> > +
> > +\devicenormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
> > +
> > +The device MUST NOT change the value exposed through \field{data_max_size}.
> > +
> > +\drivernormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
> > +
> > +A driver SHOULD negotiate VIRTIO_VSOCK_F_SIZE_MAX if the device offers it.
> > +
> > +If the driver negotiates VIRTIO_VSOCK_F_SIZE_MAX, the receive buffers it
> > +supplies for a packet MUST have a total size that doesn't exceed the size
> > +\field{data_max_size} (plus header length).
> > +
> > +If the driver negotiates VIRTIO_VSOCK_F_SIZE_MAX, it MUST  NOT transmit packets
> > +of size exceeding the value of \field{data_max_size} (plus header length).
> > +
> 
> Hi and sorry for being late to the party!
> 
> I believe I do understand why do we want to put a restriction on the
> size of the transmitted packets, but I would appreciate if you could
> explain to me why do we want to limit the receive buffer size.
> 
> Also I find the wording regarding a little bit ambiguous because
> in a networking context it also makes sense to talk about the size of the
> receive buffer. I guess hear we are talking about a single virtio buffer
> (a descriptor chain described potentially non-continuous (or compact in
> the mathematical sense of the word) which is composed from as many
> continuous chunks of memory as many descriptors are contained within the
> descriptor chain). If we are indeed talking about a single virtio buffer,
> I don't understand the plural. If not, I'm not sure what are we talking
> about.

I think I agree here, I don't understand the mix of "buffers" and "a
packet" either.

I voted "no" on the ballot, though if others feel we should apply as
is and fix up later, that is not too bad.


> Also, do we have some sort of packets may not cross virtio buffer
> boundaries, or even a single packet per single viritio buffer rule for
> vsock. I did a quick search and could not find any. Did I overlook
> something? Should we spell this out?
> 
> @Michael, Conny: What do you think? 
> 
> Regards,
> Halil

