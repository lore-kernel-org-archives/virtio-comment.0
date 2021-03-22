Return-Path: virtio-comment-return-1770-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 86E8D985E5A
	for <virtio-comment@lists.oasis-open.org>; Mon, 22 Mar 2021 11:52:33 +0000 (UTC)
Date: Mon, 22 Mar 2021 11:52:22 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <YFiE9opnZ976hwbP@stefanha-x1.localdomain>
References: <20210322063804.641923-1-arseny.krasnov@kaspersky.com>
MIME-Version: 1.0
In-Reply-To: <20210322063804.641923-1-arseny.krasnov@kaspersky.com>
Subject: [virtio-comment] Re: [RFC PATCH v1] virtio-vsock: use C style defines for constants
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AohRnOcLqTUwnZup"
Content-Disposition: inline
To: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Cc: cohuck@redhat.com, virtio-comment@lists.oasis-open.org, Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Jorgen Hansen <jhansen@vmware.com>, Norbert Slusarek <nslusarek@gmx.net>, Andra Paraschiv <andraprs@amazon.com>, Colin Ian King <colin.king@canonical.com>, virtualization@lists.linux-foundation.org, oxffffaa@gmail.com
List-ID: <virtio-comment.lists.oasis-open.org>

--AohRnOcLqTUwnZup
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 22, 2021 at 09:37:59AM +0300, Arseny Krasnov wrote:
> This:
> 1) Replaces enums with C style defines.

Why?

> 2) Adds defines for some constants.

Definitions need to be referenced somewhere to explain their use. It's
not enough to add a constant, some text in the spec should mention that
constant. (The exception to this might be a group of constants where
individual constants don't need to be mentioned explicitly.)

> Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
> ---
>  virtio-vsock.tex | 42 ++++++++++++++++++++++--------------------
>  1 file changed, 22 insertions(+), 20 deletions(-)
>=20
> diff --git a/virtio-vsock.tex b/virtio-vsock.tex
> index da7e641..62ab6b3 100644
> --- a/virtio-vsock.tex
> +++ b/virtio-vsock.tex
> @@ -86,23 +86,18 @@ \subsection{Device Operation}\label{sec:Device Types =
/ Socket Device / Device Op
>  operation constants:
> =20
>  \begin{lstlisting}
> -enum {
> -=09VIRTIO_VSOCK_OP_INVALID =3D 0,
> -
> -=09/* Connect operations */
> -=09VIRTIO_VSOCK_OP_REQUEST =3D 1,
> -=09VIRTIO_VSOCK_OP_RESPONSE =3D 2,
> -=09VIRTIO_VSOCK_OP_RST =3D 3,
> -=09VIRTIO_VSOCK_OP_SHUTDOWN =3D 4,
> -
> -=09/* To send payload */
> -=09VIRTIO_VSOCK_OP_RW =3D 5,
> -
> -=09/* Tell the peer our credit info */
> -=09VIRTIO_VSOCK_OP_CREDIT_UPDATE =3D 6,
> -=09/* Request the peer to send the credit info to us */
> -=09VIRTIO_VSOCK_OP_CREDIT_REQUEST =3D 7,
> -};
> +#define VIRTIO_VSOCK_OP_INVALID        0
> +/* Connect operations */
> +#define VIRTIO_VSOCK_OP_REQUEST        1
> +#define VIRTIO_VSOCK_OP_RESPONSE       2
> +#define VIRTIO_VSOCK_OP_RST            3
> +#define VIRTIO_VSOCK_OP_SHUTDOWN       4
> +/* To send payload */
> +#define VIRTIO_VSOCK_OP_RW             5
> +/* Tell the peer our credit info */
> +#define VIRTIO_VSOCK_OP_CREDIT_UPDATE  6
> +/* Request the peer to send the credit info to us */
> +#define VIRTIO_VSOCK_OP_CREDIT_REQUEST 7
>  \end{lstlisting}
> =20
>  \subsubsection{Virtqueue Flow Control}\label{sec:Device Types / Socket D=
evice / Device Operation / Virtqueue Flow Control}
> @@ -143,6 +138,10 @@ \subsubsection{Addressing}\label{sec:Device Types / =
Socket Device / Device Opera
>  Currently only stream sockets are supported. \field{type} is 1 for strea=
m
>  socket types.
> =20
> +\begin{lstlisting}
> +#define VIRTIO_VSOCK_TYPE_STREAM 1
> +\end{lstlisting}
> +
>  Stream sockets provide in-order, guaranteed, connection-oriented deliver=
y
>  without message boundaries.
> =20
> @@ -227,6 +226,11 @@ \subsubsection{Stream Sockets}\label{sec:Device Type=
s / Socket Device / Device O
>  hints are permanent once sent and successive packets with bits clear do =
not
>  reset them.
> =20
> +\begin{lstlisting}
> +#define VIRTIO_VSOCK_SHUTDOWN_RECEIVE_BIT 0
> +#define VIRTIO_VSOCK_SHUTDOWN_SEND_BIT    1
> +\end{lstlisting}

The spec has no other _BIT constants. It uses bitmasks instead. I
suggest following that for consistency:

  #define VIRTIO_VSOCK_SHUTDOWN_RECEIVE (1 << 0)
  #define VIRTIO_VSOCK_SHUTDOWN_SEND    (1 << 1)

--AohRnOcLqTUwnZup
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBYhPUACgkQnKSrs4Gr
c8hHHgf/Y+oGWc7oJ7zvInvvxLX96EynLgt56Btj0GMeOSp4PKh/tVSp50F8d4QU
oj7ABFDmUOMUoO8UXf0ZYb02j9/XwlAJ2409hEIsR7H+fdapjvXlz3EEECKK+kTj
B+bcI+wYNfmVnFp1Q/JHgdTje2CeObGWiJdzIi8qwE80aNZvsd4hSSQ2os7LkGpR
bxe8rzPi10vQw2OfjDeCg/gdRrEFZ1041f+IKyAiyjbXMm5pFmwtzgB6akNBX55f
jxqSTAAhEHQg0ST+KSxDmkeedeeccoLvQOBXeDyb4kitPb/vXtw73pWeNftrGm1T
XsY7nW7bsQP6FZFoeivvUbfL1kPgUQ==
=DTps
-----END PGP SIGNATURE-----

--AohRnOcLqTUwnZup--

