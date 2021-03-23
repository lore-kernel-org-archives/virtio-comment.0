Return-Path: virtio-comment-return-1775-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A3C1F986087
	for <virtio-comment@lists.oasis-open.org>; Tue, 23 Mar 2021 08:34:35 +0000 (UTC)
Date: Tue, 23 Mar 2021 08:34:25 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <YFmoESIM64aiF5sk@stefanha-x1.localdomain>
References: <20210322063804.641923-1-arseny.krasnov@kaspersky.com>
 <YFiE9opnZ976hwbP@stefanha-x1.localdomain>
 <20210322092547-mutt-send-email-mst@kernel.org>
 <YFip8VVJOXy2EpjH@stefanha-x1.localdomain>
 <71e16d33-b5f5-d551-ad5a-22b45e946b9a@kaspersky.com>
MIME-Version: 1.0
In-Reply-To: <71e16d33-b5f5-d551-ad5a-22b45e946b9a@kaspersky.com>
Subject: Re: [virtio-comment] Re: [RFC PATCH v1] virtio-vsock: use C style
 defines for constants
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KuhFm2qSGF4L7ua9"
Content-Disposition: inline
To: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, cohuck@redhat.com, virtio-comment@lists.oasis-open.org, Stefano Garzarella <sgarzare@redhat.com>, Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Jorgen Hansen <jhansen@vmware.com>, Norbert Slusarek <nslusarek@gmx.net>, Andra Paraschiv <andraprs@amazon.com>, Colin Ian King <colin.king@canonical.com>, virtualization@lists.linux-foundation.org, oxffffaa@gmail.com
List-ID: <virtio-comment.lists.oasis-open.org>

--KuhFm2qSGF4L7ua9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2021 at 09:18:34AM +0300, Arseny Krasnov wrote:
>=20
> On 22.03.2021 17:30, Stefan Hajnoczi wrote:
> > On Mon, Mar 22, 2021 at 09:34:58AM -0400, Michael S. Tsirkin wrote:
> >> On Mon, Mar 22, 2021 at 11:52:22AM +0000, Stefan Hajnoczi wrote:
> >>> On Mon, Mar 22, 2021 at 09:37:59AM +0300, Arseny Krasnov wrote:
> >>>> @@ -227,6 +226,11 @@ \subsubsection{Stream Sockets}\label{sec:Device=
 Types / Socket Device / Device O
> >>>>  hints are permanent once sent and successive packets with bits clea=
r do not
> >>>>  reset them.
> >>>> =20
> >>>> +\begin{lstlisting}
> >>>> +#define VIRTIO_VSOCK_SHUTDOWN_RECEIVE_BIT 0
> >>>> +#define VIRTIO_VSOCK_SHUTDOWN_SEND_BIT    1
> >>>> +\end{lstlisting}
> >>> The spec has no other _BIT constants.
> >> True. Sometimes there's an _F_ somewhere there instead.
> > You're right, I missed the virtio-net bit constants:
> >
> >   #define VIRTIO_NET_F_GUEST_TSO4 7
> >
> > Compared to:
> >
> >   #define VIRTQ_DESC_F_AVAIL     (1 << 7)
> >
> > or
> >
> >   #define VIRTQ_DESC_F_WRITE     2
> >
> > It's an inconsistent mix :). Hard to tell them apart when they aren't
> > bitmask constants with '<<'.
> >
> > Can we use '<<' for clarity on new constants?
>=20
> So for bit constants, i can use:
>=20
> #define VIRTIO_VSOCK_SHUTDOWN_RECEIVE (1 << 0)
> #define VIRTIO_VSOCK_SHUTDOWN_SEND    (1 << 1)
>=20
> for this case and all other next cases, when i'll add SEQPACKET
> description in spec?

Personally I think that's clearest. Michael pointed out that the spec is
not consistent though, so I won't complain if you prefer to keep the
_BIT numbering.

Stefan

--KuhFm2qSGF4L7ua9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBZqBEACgkQnKSrs4Gr
c8isxAgAoWCvHA3XJZ2rRVEts+n5e2d96jYiolhYn0bAbZxY6w318IIVO14czZlY
JrEuzbF5WAHY8rSuTfFiyF9wREsjhDRg0Wvc+c05mHxwN2pMLPmPGk53uZ+i0efV
+Krzp/e3kONpYaGhyUzmArNRCRJ3e+PJEAVY/snwlVivTM1gHIT0MsNanHVzErED
t/C3tzB508QCeJBoO4LZuqQiMNWvk4W68+bc8/NRNTJVrccvq+Ae2NkWFmnqqy0y
jChVEke8Zc8JY52WpP6uWtiaORQWRGUzT6J0eCok9zxZ/G4XJDC9BdUBx9Xgzfxk
IXqK/3h2cQogJ0URXvKJN40z/fk2mg==
=fvqJ
-----END PGP SIGNATURE-----

--KuhFm2qSGF4L7ua9--

