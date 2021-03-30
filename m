Return-Path: virtio-comment-return-1809-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BB935986299
	for <virtio-comment@lists.oasis-open.org>; Tue, 30 Mar 2021 13:57:56 +0000 (UTC)
Date: Tue, 30 Mar 2021 14:57:41 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <YGMuVWL1waLpTkFI@stefanha-x1.localdomain>
References: <20210326090154.1144100-1-arseny.krasnov@kaspersky.com>
 <20210326090254.1144486-1-arseny.krasnov@kaspersky.com>
 <YGH8IqLRdh5JCZyT@stefanha-x1.localdomain>
 <230d95fd-29e8-465b-0ab2-b406d614c11b@kaspersky.com>
 <20210329212818.qdeprjhep745yeur@steredhat>
 <d6d92105-f7d4-74a3-4acc-fcfb40872b76@kaspersky.com>
 <YGLnfAxvy83jLkmG@stefanha-x1.localdomain>
 <2061f2ab-f3fc-c059-7cfc-a34b06f061fe@kaspersky.com>
MIME-Version: 1.0
In-Reply-To: <2061f2ab-f3fc-c059-7cfc-a34b06f061fe@kaspersky.com>
Subject: Re: [virtio-comment] Re: [MASSMAIL KLMS] Re: [virtio-comment] [RFC
 PATCH v4 2/2] virtio-vsock: SOCK_SEQPACKET description
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jM1+QQW1BZA1AWHV"
Content-Disposition: inline
To: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Cc: Stefano Garzarella <sgarzare@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Jorgen Hansen <jhansen@vmware.com>, Andra Paraschiv <andraprs@amazon.com>, Norbert Slusarek <nslusarek@gmx.net>, Colin Ian King <colin.king@canonical.com>, Alexander Popov <alex.popov@linux.com>, "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>, "oxffffaa@gmail.com" <oxffffaa@gmail.com>
List-ID: <virtio-comment.lists.oasis-open.org>

--jM1+QQW1BZA1AWHV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 30, 2021 at 12:50:06PM +0300, Arseny Krasnov wrote:
>=20
> On 30.03.2021 11:55, Stefan Hajnoczi wrote:
> > On Tue, Mar 30, 2021 at 09:15:39AM +0300, Arseny Krasnov wrote:
> >> On 30.03.2021 00:28, Stefano Garzarella wrote:
> >>> On Mon, Mar 29, 2021 at 08:33:27PM +0300, Arseny Krasnov wrote:
> >>>> On 29.03.2021 19:11, Stefan Hajnoczi wrote:
> >>>>> On Fri, Mar 26, 2021 at 12:02:50PM +0300, Arseny Krasnov wrote:
> >>>>>> @@ -98,6 +102,10 @@ \subsection{Device Operation}\label{sec:Device=
 Types / Socket Device / Device Op
> >>>>>>  #define VIRTIO_VSOCK_OP_CREDIT_UPDATE  6
> >>>>>>  /* Request the peer to send the credit info to us */
> >>>>>>  #define VIRTIO_VSOCK_OP_CREDIT_REQUEST 7
> >>>>>> +/* Message begin for SOCK_SEQPACKET */
> >>>>>> +#define VIRTIO_VSOCK_OP_SEQ_BEGIN      8
> >>>>>> +/* Message end for SOCK_SEQPACKET */
> >>>>>> +#define VIRTIO_VSOCK_OP_SEQ_END        9
> >>>>> The struct virtio_vsock_hdr->flags field is le32 and currently unus=
ed.
> >>>>> Could 24 bits be used for a unique message id and 8 bits for flags?=
 1
> >>>>> flag bit could be used for end-of-message and the remaining 7 bits =
could
> >>>>> be reserved. That way SEQ_BEGIN and SEQ_END are not necessary. =20
> >>>>> Pressure
> >>>>> on the virtqueue would be reduced and performance should be compara=
ble
> >>>>> to SOCK_STREAM.
> >>>> Well, my first versions of SOCK_SEQPACKET implementation, worked
> >>>> something like this: i used flags field of header as length of whole
> >>>> message. I discussed it with Stefano Garzarella, and he told that it=
=20
> >>>> will
> >>>> be better to use special "header" in packet's payload, to keep some
> >>>> SOCK_SEQPACKET specific data, instead of reusing packet's header
> >>>> fields.
> >>> IIRC in the first implementation SEQ_BEGIN was an empty message and w=
e=20
> >>> didn't added the msg_id yet. So since we needed to carry both id and=
=20
> >>> total length, I suggested to use the payload to put these extra=20
> >>> information.
> >>>
> >>> IIUC what Stefan is suggesting is a bit different and I think it shou=
ld=20
> >>> be cool to implement: we can remove the boundary packets, use only 8=
=20
> >>> bits for the flags, and add a new field to reuse the 24 unused bits,=
=20
> >>> maybe also 16 bits would be enough.
> >>> At that point we will only use the EOR flag to know the last packet.
> >>>
> >>> The main difference will be that the receiver will know the total siz=
e=20
> >>> only when the last packet is received.
> >>>
> >>> Do you see any issue on that approach?
> >> It will work, except we can't check that any packet of message,
> >>
> >> except last(with EOR bit) was dropped, since receiver don't know
> >>
> >> real length of message. If it is ok, then i can implement it.
> > The credit mechanism ensures that packets are not dropped, so it's not
> > necessary to check for this condition.
> >
> > By the way, is a unique message ID needed? My understanding is:
> >
> > If two messages are being sent on a socket at the same time either thei=
r
> > order is serialized (whichever message began first) or it is undefined
> > (whichever message completes first).
>=20
> If we are talking about case, when two threads writes to one socket at th=
e same time,
>=20
> in Linux it is possible that two message will interleave(for vsock). But =
as i know, for example
>=20
> when TCP socket is used, both 'write()' calls will be serialized. May be =
it is bug of vsock: when
>=20
> first writer goes out of space, it will sleep. Then second writer tries t=
o send something, but
>=20
> as free space is over, it will sleep too. Then, credit update is received=
 from peer. Both sender's
>=20
> will be woken up, but sender which grab socket lock first will continue t=
o send it's message.
>=20
> So may be we can add something like semaphore to new/vmw_vsock/af_vsock.c=
 which will
>=20
> serialize two 'write()' calls: second sender enters 'write()' path, only =
when first left this path.
>=20
> My implementation doesn't care about that, because i wanted to add semaph=
ore later, by another
>=20
> patch.

Yes, that is definitely an issue that the driver needs to take care of
if we don't have unique message IDs. Thanks for explaining!

Stefan

--jM1+QQW1BZA1AWHV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBjLlUACgkQnKSrs4Gr
c8j6gQf/V0sfdvdDu0QFpdxzpG3TZeTN7q+Dbj47t8+dPhalzM1N9TN2K6UBIVB7
TU+Dpj3MVaoYB2qwrPcTIw/nU7SyVGgzXy6klyRWyUlCd3l6MJ8zvYhwd0uwEmkQ
B6CcgZV+0Dw/OGSoxAxK+PrK7akF7kKmmr5cQ/VNSxZFImlV8fJXRLXNEEA5i2cX
RLxrJc/2oKOxswiHF8JoEgy6sX0yJTL+vwY7WB2kncodmizbPNaJb8uKWvbGaify
G3zq7IPkiIj15qDGscnwUndZn7oKHoPhJNGpT/WgoPX886j5mQuBUYBSaRI5q16g
qUaqFY3sRnIB8PgUgSVx1RWt5TdxRA==
=I4oG
-----END PGP SIGNATURE-----

--jM1+QQW1BZA1AWHV--

