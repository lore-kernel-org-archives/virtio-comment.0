Return-Path: virtio-comment-return-1772-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B5D41985E7A
	for <virtio-comment@lists.oasis-open.org>; Mon, 22 Mar 2021 14:30:18 +0000 (UTC)
Date: Mon, 22 Mar 2021 14:30:09 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <YFip8VVJOXy2EpjH@stefanha-x1.localdomain>
References: <20210322063804.641923-1-arseny.krasnov@kaspersky.com>
 <YFiE9opnZ976hwbP@stefanha-x1.localdomain>
 <20210322092547-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210322092547-mutt-send-email-mst@kernel.org>
Subject: [virtio-comment] Re: [RFC PATCH v1] virtio-vsock: use C style defines for constants
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="m0kjr1Hpbh7R4BU3"
Content-Disposition: inline
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Arseny Krasnov <arseny.krasnov@kaspersky.com>, cohuck@redhat.com, virtio-comment@lists.oasis-open.org, Stefano Garzarella <sgarzare@redhat.com>, Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Jorgen Hansen <jhansen@vmware.com>, Norbert Slusarek <nslusarek@gmx.net>, Andra Paraschiv <andraprs@amazon.com>, Colin Ian King <colin.king@canonical.com>, virtualization@lists.linux-foundation.org, oxffffaa@gmail.com
List-ID: <virtio-comment.lists.oasis-open.org>

--m0kjr1Hpbh7R4BU3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 22, 2021 at 09:34:58AM -0400, Michael S. Tsirkin wrote:
> On Mon, Mar 22, 2021 at 11:52:22AM +0000, Stefan Hajnoczi wrote:
> > On Mon, Mar 22, 2021 at 09:37:59AM +0300, Arseny Krasnov wrote:
> > > @@ -227,6 +226,11 @@ \subsubsection{Stream Sockets}\label{sec:Device =
Types / Socket Device / Device O
> > >  hints are permanent once sent and successive packets with bits clear=
 do not
> > >  reset them.
> > > =20
> > > +\begin{lstlisting}
> > > +#define VIRTIO_VSOCK_SHUTDOWN_RECEIVE_BIT 0
> > > +#define VIRTIO_VSOCK_SHUTDOWN_SEND_BIT    1
> > > +\end{lstlisting}
> >=20
> > The spec has no other _BIT constants.
>=20
> True. Sometimes there's an _F_ somewhere there instead.

You're right, I missed the virtio-net bit constants:

  #define VIRTIO_NET_F_GUEST_TSO4 7

Compared to:

  #define VIRTQ_DESC_F_AVAIL     (1 << 7)

or

  #define VIRTQ_DESC_F_WRITE     2

It's an inconsistent mix :). Hard to tell them apart when they aren't
bitmask constants with '<<'.

Can we use '<<' for clarity on new constants?

--m0kjr1Hpbh7R4BU3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBYqfEACgkQnKSrs4Gr
c8jGwwf/VHvg4GcJFI4sGd8lRQb16ehd3TeYlmvchAeSZrJQWyxpuCoLsyCHgX7k
naA9dJOdp7WLduYgjOlpkS6jV1iX9Wwe1yKnMMEdJ27+SD8Q9FQlTYgOg5UkrBJb
gHSeRX4lneVDmWublPBAHaKnQuMQp+0z4y+sqaPRYJOQZDwcetJ1aXELOzDL9tt1
2f0qLskrnns+tt9UrIqqvvtPYU4O//dF8fgxN17bemA94lxjVMu+Kkg4JXPjR3Gq
/QpmmJrD7Bg4urDB/xNdvTS2j6pYMP+BPckPeGQphweyxhZ4gxBEoHK40l8C570G
nkn6UVafkUdooCHM91TDcdTW4ZQ6zQ==
=T+k4
-----END PGP SIGNATURE-----

--m0kjr1Hpbh7R4BU3--

