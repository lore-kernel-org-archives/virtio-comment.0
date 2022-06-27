Return-Path: <pasic@linux.ibm.com>
Date: Mon, 27 Jun 2022 14:59:07 +0200
From: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [virtio-comment] [PATCH v4] virtio-vsock: add max payload size
 config field
Message-ID: <20220627145907.2f659a75.pasic@linux.ibm.com>
In-Reply-To: <715340c6-5bda-ca5b-48d4-368ccc0ae846@amazon.com>
References: <20220613104038.22010-1-lauralg@amazon.com>
	<20220614135734.534dbc0b.pasic@linux.ibm.com>
	<20220616123431-mutt-send-email-mst@kernel.org>
	<5b08165e-03b9-3583-711e-3380ce964616@amazon.com>
	<20220623121838-mutt-send-email-mst@kernel.org>
	<715340c6-5bda-ca5b-48d4-368ccc0ae846@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: Laura Loghin <lauralg@amazon.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, virtio-comment@lists.oasis-open.org, Cornelia Huck <cohuck@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Fri, 24 Jun 2022 11:23:31 +0300
Laura Loghin <lauralg@amazon.com> wrote:

> On 6/23/22 19:22, Michael S. Tsirkin wrote:
> > CAUTION: This email originated from outside of the organization. Do not=
 click links or open attachments unless you can confirm the sender and know=
 the content is safe.
> >
> >
> >
> > On Thu, Jun 23, 2022 at 06:36:50PM +0300, Laura Loghin wrote: =20
> >> On 6/16/22 19:40, Michael S. Tsirkin wrote:
> >>
> >>      CAUTION: This email originated from outside of the organization. =
Do not click links or open attachments unless you can confirm the sender an=
d know the content is safe.
> >>
> >>
> >>
> >>      On Tue, Jun 14, 2022 at 01:57:34PM +0200, Halil Pasic wrote:
> >>
> >>          On Mon, 13 Jun 2022 13:40:38 +0300
> >>          Laura Loghin<lauralg@amazon.com>  wrote:
> >>
> >>
> >>              @@ -57,6 +62,25 @@ \subsection{Device configuration layou=
t}\label{sec:Device Types / Socket Device
> >>               \hline
> >>               \end{tabular}
> >>
> >>              +The following driver-read-only field, \field{data_max_si=
ze} only exists if
> >>              +VIRTIO_VSOCK_F_SIZE_MAX is set. This field specifies the=
 maximum packet payload
> >>              +size for the driver to use.
> >>              +
> >>              +\devicenormative{\subsubsection}{Device configuration la=
yout}{Device Types / Socket Device / Device configuration layout}
> >>              +
> >>              +The device MUST NOT change the value exposed through \fi=
eld{data_max_size}.
> >>              +
> >>              +\drivernormative{\subsubsection}{Device configuration la=
yout}{Device Types / Socket Device / Device configuration layout}
> >>              +
> >>              +A driver SHOULD negotiate VIRTIO_VSOCK_F_SIZE_MAX if the=
 device offers it.
> >>              +
> >>              +If the driver negotiates VIRTIO_VSOCK_F_SIZE_MAX, the re=
ceive buffers it
> >>              +supplies for a packet MUST have a total size that doesn'=
t exceed the size
> >>              +\field{data_max_size} (plus header length).
> >>              +
> >>              +If the driver negotiates VIRTIO_VSOCK_F_SIZE_MAX, it MUS=
T  NOT transmit packets
> >>              +of size exceeding the value of \field{data_max_size} (pl=
us header length).
> >>              +
> >>
> >>          Hi and sorry for being late to the party!
> >>
> >>          I believe I do understand why do we want to put a restriction=
 on the
> >>          size of the transmitted packets, but I would appreciate if yo=
u could
> >>          explain to me why do we want to limit the receive buffer size=
.
> >>
> >>          Also I find the wording regarding a little bit ambiguous beca=
use
> >>          in a networking context it also makes sense to talk about the=
 size of the
> >>          receive buffer. I guess hear we are talking about a single vi=
rtio buffer
> >>          (a descriptor chain described potentially non-continuous (or =
compact in
> >>          the mathematical sense of the word) which is composed from as=
 many
> >>          continuous chunks of memory as many descriptors are contained=
 within the
> >>          descriptor chain). If we are indeed talking about a single vi=
rtio buffer,
> >>          I don't understand the plural. If not, I'm not sure what are =
we talking
> >>          about.
> >>
> >>      I think I agree here, I don't understand the mix of "buffers" and=
 "a
> >>      packet" either.
> >>
> >> The way I was understanding that while reading the spec is that a buff=
er
> >> is corresponding to one descriptor, =20
> > what gave this impression? buffers can use any number of descriptors.
> > =20
> There are sections in the spec that make you think of a buffer as
> corresponding to a descriptor chain, and others that don't, for example:
> 2.6.5=C2=A0=C2=A0=C2=A0 The Virtqueue Descriptor Table: Each descriptor d=
escribes a
> buffer which is read-only for the device (=E2=80=9Cdevice-readable=E2=80=
=9D) or
> write-only for the device (=E2=80=9Cdevice-writable=E2=80=9D), but a chai=
n of descriptors
> can contain both device-readable and device-writable buffers.
> I remember while reading the spec I was always confused about the buffer
> - descriptor (chain) relation, but in the end concluded that the buffer
> is the memory region to which a single descriptor is pointing to (probabl=
y
> also because when you think of a buffer you would at first assume it is
> contiguous in memory).

I think in the distant past I have pointed out that the usage of the word
buffer in the virtio spec is somewhat confusing. But I never took the
time to make a patch which attempts to set it strait.

IMHO eve if we were to use "buffer" consistently in a sense that, it is
a portion of the RAM which may or may not be continuous in the address
space used by virtio (guest physical or DMA depending on ...) where
chained descriptors describe continuous pieces of the same, we would
still have the problem, that in the normal CS world AFAIK a buffer is
usually a continuous piece of memory used for a certain purpose.
https://en.wikipedia.org/wiki/Data_buffer

Well actually our buffers are continuous in a sense that each descriptor
chain defines and has an address space of its own. In a sense that we
can talk about the N-th byte of the L long buffer (N < L), but that
the difference between addresses of the 0-th and the N-th byte of an
virtio buffer described by a descriptor chain in DMA/guest physical
address space isn't guaranteed to be N.

One solution would be to define the terms:
virtqueue buffer: a portion of a RAM that is composed by one or more
primitive buffers and a descriptor chain such that at least one
descriptor in the chain is pointed to each primitive buffer
primitive buffer: a byte array in RAM which is continuous in
the address space used by the spec
and use this terms consistently. That is never use buffer without
a qualifier.


BTW I don't remember if the our primitive buffers are allowed to cross
page boundaries.

> This doesn't seem to be the right understanding, so I will update the
> patch.
>=20
> >> so a packet will correspond to
> >> multiple buffers (like for example in Linux one buffer for the packet
> >> header and one buffer for the payload). I wanted to limit the memory
> >> allocated by the driver for RX buffers and TX buffers, so that's why I
> >> used 'buffers' for RX. Does it make sense or did I misunderstand what
> >> was causing the confusion here?
> >>
> >> Thanks,
> >> Laura =20
> >
> > As above, a buffer can consist of many descriptors. See e.g.
> > Descriptor Chaining.
> > I think there are places in spec when say "descriptor" and we should
> > fix them to say one or more descriptors. =20
>=20
> It would be great if we could fix the spec, so that the relation between
> a descriptor and a buffer becomes more clear and doesn't leave room for
> interpretations.

+1

Regards,
Halil

>=20
>=20
> Laura
>=20
> >>      I voted "no" on the ballot, though if others feel we should apply=
 as
> >>      is and fix up later, that is not too bad.
> >>
> >>
> >>
> >>          Also, do we have some sort of packets may not cross virtio bu=
ffer
> >>          boundaries, or even a single packet per single viritio buffer=
 rule for
> >>          vsock. I did a quick search and could not find any. Did I ove=
rlook
> >>          something? Should we spell this out?
> >>
> >>          @Michael, Conny: What do you think?
> >>
> >>          Regards,
> >>          Halil
> >>
> >>
> >>
> >> Amazon Development Center (Romania) S.R.L. registered office: 27A Sf. =
Lazar
> >> Street, UBC5, floor 2, Iasi, Iasi County, 700045, Romania. Registered =
in
> >> Romania. Registration number J22/2621/2005.
> >> =20
>=20
>=20
>=20
> Amazon Development Center (Romania) S.R.L. registered office: 27A Sf. Laz=
ar Street, UBC5, floor 2, Iasi, Iasi County, 700045, Romania. Registered in=
 Romania. Registration number J22/2621/2005.

