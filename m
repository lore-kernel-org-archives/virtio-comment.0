Return-Path: <stefanha@redhat.com>
Date: Mon, 10 Jan 2022 11:19:27 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v10 3/3] virtio-vsock: SOCK_SEQPACKET description
Message-ID: <YdwWP9QezIinC2HB@stefanha-x1.localdomain>
References: <20220105163505.192146-1-sgarzare@redhat.com>
 <20220105163505.192146-4-sgarzare@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Z6yB9vv5YSDj7sYC"
Content-Disposition: inline
In-Reply-To: <20220105163505.192146-4-sgarzare@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, jasowang@redhat.com, mst@redhat.com, cohuck@redhat.com, arseny.krasnov@kaspersky.com
List-ID: <virtio-comment.lists.oasis-open.org>


--Z6yB9vv5YSDj7sYC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 05, 2022 at 05:35:05PM +0100, Stefano Garzarella wrote:
> From: Arseny Krasnov <arseny.krasnov@kaspersky.com>
>=20
> This adds description of SOCK_SEQPACKET socket type
> support for virtio-vsock.
>=20
> Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  virtio-vsock.tex | 39 +++++++++++++++++++++++++++++++++++----
>  1 file changed, 35 insertions(+), 4 deletions(-)
>=20
> diff --git a/virtio-vsock.tex b/virtio-vsock.tex
> index bf015ac..9fa93f2 100644
> --- a/virtio-vsock.tex
> +++ b/virtio-vsock.tex
> @@ -20,6 +20,7 @@ \subsection{Feature bits}\label{sec:Device Types / Sock=
et Device / Feature bits}
> =20
>  \begin{description}
>  \item VIRTIO_VSOCK_F_STREAM (0) stream socket type is supported.
> +\item VIRTIO_VSOCK_F_SEQPACKET (1) seqpacket socket type is supported.
>  \end{description}
> =20
>  \subsection{Device configuration layout}\label{sec:Device Types / Socket=
 Device / Device configuration layout}
> @@ -139,15 +140,17 @@ \subsubsection{Addressing}\label{sec:Device Types /=
 Socket Device / Device Opera
>  consists of a (cid, port number) tuple. The header fields used for this =
are
>  \field{src_cid}, \field{src_port}, \field{dst_cid}, and \field{dst_port}.
> =20
> -Currently only stream sockets are supported. \field{type} is 1 (VIRTIO_V=
SOCK_TYPE_STREAM)
> -for stream socket types.
> +Currently stream and seqpacket sockets are supported. \field{type} is 1 =
(VIRTIO_VSOCK_TYPE_STREAM)
> +for stream socket types, and 2 (VIRTIO_VSOCK_TYPE_SEQPACKET) for seqpack=
et socket types.
> =20
>  \begin{lstlisting}
> -#define VIRTIO_VSOCK_TYPE_STREAM 1
> +#define VIRTIO_VSOCK_TYPE_STREAM    1
> +#define VIRTIO_VSOCK_TYPE_SEQPACKET 2
>  \end{lstlisting}
> =20
>  Stream sockets provide in-order, guaranteed, connection-oriented delivery
> -without message boundaries.
> +without message boundaries. Seqpacket sockets provide in-order, guarante=
ed,
> +connection-oriented delivery with message and record boundaries.
> =20
>  \subsubsection{Buffer Space Management}\label{sec:Device Types / Socket =
Device / Device Operation / Buffer Space Management}
>  \field{buf_alloc} and \field{fwd_cnt} are used for buffer space manageme=
nt of
> @@ -248,6 +251,34 @@ \subsubsection{Stream Sockets}\label{sec:Device Type=
s / Socket Device / Device O
>  destination) address tuple for a new connection while the other peer is =
still
>  processing the old connection.
> =20
> +\subsubsection{Seqpacket Sockets}\label{sec:Device Types / Socket Device=
 / Device Operation / Seqpacket Sockets}
> +
> +\paragraph{Message and record boundaries}\label{sec:Device Types / Socke=
t Device / Device Operation / Seqpacket Sockets / Boundaries}
> +Two types of boundaries supported: message and record boundaries.

s/boundaries supported/boundaries are supported/

> +
> +A message contains data sent by a single system call. Message boundary m=
eans
> +that data of single send system call is guaranteed to be read wholly by =
single
> +receive system call. If receive buffer is not enough, then out of size d=
ata
> +will be dropped.

The VIRTIO spec tends to focus on the hardware interface and avoids
implementation details and application APIs like system calls. Maybe
system calls are an important concept here but I think this could be
rephrased in terms of "operations":

  A message contains data sent in a single operation. ...

The "Message boundary" sentence isn't clear to me. I guess it's saying
that messages are never split into smaller pieces from the perspective
of read operations? This seems like an implementation detail and the
device would work fine if a different implementation supported read
operations that split messages into multiple read buffers - it doesn't
make a different from the hardware interface perspective.

"If receive buffer is not enough, then out of size data ..." -> "If the
receive buffer is not large enough, then data exceeding the buffer is
dropped."

I think this receive buffer refers to the read(2)/recv(2) syscall data
buffer and not the virtio-vsock credit limit? So this statement relates
to the behavior of SOCK_SEQPACKET, which is outside the scope of the
VIRTIO spec (it's not part of the hardware interface and it's a
Linux/POSIX-specific Sockets API feature). I think it can be dropped
=66rom the spec.

> +
> +Record is any number of subsequent messages, where last message is sent =
with POSIX
> +MSG_EOR flag set. Record boundary means that receiver gets MSG_EOR flag =
set
> +in the corresponding message where sender set it.
> +
> +To provide message boundaries, last RW packet of each message has VIRTIO=
_VSOCK_SEQ_EOM
> +bit (bit 0) set in the \field{flags} of packet's header.
> +
> +\begin{lstlisting}
> +#define VIRTIO_VSOCK_SEQ_EOM (1 << 0)
> +\end{lstlisting}
> +
> +To provide record boundaries, last RW packet of each record has VIRTIO_V=
SOCK_SEQ_EOR
> +bit (bit 1) set in the \field{flags} of packet's header.
> +
> +\begin{lstlisting}
> +#define VIRTIO_VSOCK_SEQ_EOR (1 << 1)
> +\end{lstlisting}
> +
>  \subsubsection{Device Events}\label{sec:Device Types / Socket Device / D=
evice Operation / Device Events}
> =20
>  Certain events are communicated by the device to the driver using the ev=
ent
> --=20
> 2.31.1
>=20

--Z6yB9vv5YSDj7sYC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHcFj4ACgkQnKSrs4Gr
c8jB4wf9FyAubrkyjN2phsrJadHU1BV7zZi+lkGaftspU+jaPAUZ0g35ngSYSTht
MKhXFTK5J7+Tp6R6O576LKXEA6ByOYrNwl6cEdx565wUws/8YACZgrZM985CT3j9
1L9oYdwuDIGf+YSXeyAI+bMwDU0VWfyKiteG+Vwppo+15bZoFlfHHEg1TQpXqiMt
LaV72Xwy8TKvM7HtVLyiSthlTQhmAqrDSMPhb0E/7ZZZsgsAY3+UTjauQG49PZGB
vf4f/ErhattnQOhGnnurcZ+RXECj9t/fLP6BSimVpysXtHVyLE84riw8Nb7sSTcf
jQAxKiKgUoZYLISGFAeh08PrAySKJw==
=+hBn
-----END PGP SIGNATURE-----

--Z6yB9vv5YSDj7sYC--

