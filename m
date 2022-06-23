Return-Path: <mst@redhat.com>
Date: Thu, 23 Jun 2022 12:22:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [virtio-comment] [PATCH v4] virtio-vsock: add max payload size
 config field
Message-ID: <20220623121838-mutt-send-email-mst@kernel.org>
References: <20220613104038.22010-1-lauralg@amazon.com>
 <20220614135734.534dbc0b.pasic@linux.ibm.com>
 <20220616123431-mutt-send-email-mst@kernel.org>
 <5b08165e-03b9-3583-711e-3380ce964616@amazon.com>
MIME-Version: 1.0
In-Reply-To: <5b08165e-03b9-3583-711e-3380ce964616@amazon.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Laura Loghin <lauralg@amazon.com>
Cc: Halil Pasic <pasic@linux.ibm.com>, virtio-comment@lists.oasis-open.org, Cornelia Huck <cohuck@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Jun 23, 2022 at 06:36:50PM +0300, Laura Loghin wrote:
> On 6/16/22 19:40, Michael S. Tsirkin wrote:
> 
>     CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> 
> 
> 
>     On Tue, Jun 14, 2022 at 01:57:34PM +0200, Halil Pasic wrote:
> 
>         On Mon, 13 Jun 2022 13:40:38 +0300
>         Laura Loghin <lauralg@amazon.com> wrote:
> 
> 
>             @@ -57,6 +62,25 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
>              \hline
>              \end{tabular}
> 
>             +The following driver-read-only field, \field{data_max_size} only exists if
>             +VIRTIO_VSOCK_F_SIZE_MAX is set. This field specifies the maximum packet payload
>             +size for the driver to use.
>             +
>             +\devicenormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
>             +
>             +The device MUST NOT change the value exposed through \field{data_max_size}.
>             +
>             +\drivernormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
>             +
>             +A driver SHOULD negotiate VIRTIO_VSOCK_F_SIZE_MAX if the device offers it.
>             +
>             +If the driver negotiates VIRTIO_VSOCK_F_SIZE_MAX, the receive buffers it
>             +supplies for a packet MUST have a total size that doesn't exceed the size
>             +\field{data_max_size} (plus header length).
>             +
>             +If the driver negotiates VIRTIO_VSOCK_F_SIZE_MAX, it MUST  NOT transmit packets
>             +of size exceeding the value of \field{data_max_size} (plus header length).
>             +
> 
>         Hi and sorry for being late to the party!
> 
>         I believe I do understand why do we want to put a restriction on the
>         size of the transmitted packets, but I would appreciate if you could
>         explain to me why do we want to limit the receive buffer size.
> 
>         Also I find the wording regarding a little bit ambiguous because
>         in a networking context it also makes sense to talk about the size of the
>         receive buffer. I guess hear we are talking about a single virtio buffer
>         (a descriptor chain described potentially non-continuous (or compact in
>         the mathematical sense of the word) which is composed from as many
>         continuous chunks of memory as many descriptors are contained within the
>         descriptor chain). If we are indeed talking about a single virtio buffer,
>         I don't understand the plural. If not, I'm not sure what are we talking
>         about.
> 
>     I think I agree here, I don't understand the mix of "buffers" and "a
>     packet" either.
> 
> The way I was understanding that while reading the spec is that a buffer
> is corresponding to one descriptor,

what gave this impression? buffers can use any number of descriptors.

> so a packet will correspond to
> multiple buffers (like for example in Linux one buffer for the packet
> header and one buffer for the payload). I wanted to limit the memory
> allocated by the driver for RX buffers and TX buffers, so that's why I
> used 'buffers' for RX. Does it make sense or did I misunderstand what
> was causing the confusion here?
> 
> Thanks,
> Laura


As above, a buffer can consist of many descriptors. See e.g.
Descriptor Chaining.
I think there are places in spec when say "descriptor" and we should
fix them to say one or more descriptors.

> 
>     I voted "no" on the ballot, though if others feel we should apply as
>     is and fix up later, that is not too bad.
> 
> 
> 
>         Also, do we have some sort of packets may not cross virtio buffer
>         boundaries, or even a single packet per single viritio buffer rule for
>         vsock. I did a quick search and could not find any. Did I overlook
>         something? Should we spell this out?
> 
>         @Michael, Conny: What do you think?
> 
>         Regards,
>         Halil
> 
> 
> 
> Amazon Development Center (Romania) S.R.L. registered office: 27A Sf. Lazar
> Street, UBC5, floor 2, Iasi, Iasi County, 700045, Romania. Registered in
> Romania. Registration number J22/2621/2005.
> 

