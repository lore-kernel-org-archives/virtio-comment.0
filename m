Return-Path: virtio-comment-return-1807-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C499C986299
	for <virtio-comment@lists.oasis-open.org>; Tue, 30 Mar 2021 08:55:35 +0000 (UTC)
Date: Tue, 30 Mar 2021 09:55:24 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <YGLnfAxvy83jLkmG@stefanha-x1.localdomain>
References: <20210326090154.1144100-1-arseny.krasnov@kaspersky.com>
 <20210326090254.1144486-1-arseny.krasnov@kaspersky.com>
 <YGH8IqLRdh5JCZyT@stefanha-x1.localdomain>
 <230d95fd-29e8-465b-0ab2-b406d614c11b@kaspersky.com>
 <20210329212818.qdeprjhep745yeur@steredhat>
 <d6d92105-f7d4-74a3-4acc-fcfb40872b76@kaspersky.com>
MIME-Version: 1.0
In-Reply-To: <d6d92105-f7d4-74a3-4acc-fcfb40872b76@kaspersky.com>
Subject: Re: [virtio-comment] Re: [MASSMAIL KLMS] Re: [virtio-comment] [RFC
 PATCH v4 2/2] virtio-vsock: SOCK_SEQPACKET description
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6deGiYCe1WgmvBoX"
Content-Disposition: inline
To: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Cc: Stefano Garzarella <sgarzare@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Jorgen Hansen <jhansen@vmware.com>, Andra Paraschiv <andraprs@amazon.com>, Norbert Slusarek <nslusarek@gmx.net>, Colin Ian King <colin.king@canonical.com>, Alexander Popov <alex.popov@linux.com>, "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>, "oxffffaa@gmail.com" <oxffffaa@gmail.com>
List-ID: <virtio-comment.lists.oasis-open.org>

--6deGiYCe1WgmvBoX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 30, 2021 at 09:15:39AM +0300, Arseny Krasnov wrote:
> On 30.03.2021 00:28, Stefano Garzarella wrote:
> > On Mon, Mar 29, 2021 at 08:33:27PM +0300, Arseny Krasnov wrote:
> >> On 29.03.2021 19:11, Stefan Hajnoczi wrote:
> >>> On Fri, Mar 26, 2021 at 12:02:50PM +0300, Arseny Krasnov wrote:
> >>>> @@ -98,6 +102,10 @@ \subsection{Device Operation}\label{sec:Device T=
ypes / Socket Device / Device Op
> >>>>  #define VIRTIO_VSOCK_OP_CREDIT_UPDATE  6
> >>>>  /* Request the peer to send the credit info to us */
> >>>>  #define VIRTIO_VSOCK_OP_CREDIT_REQUEST 7
> >>>> +/* Message begin for SOCK_SEQPACKET */
> >>>> +#define VIRTIO_VSOCK_OP_SEQ_BEGIN      8
> >>>> +/* Message end for SOCK_SEQPACKET */
> >>>> +#define VIRTIO_VSOCK_OP_SEQ_END        9
> >>> The struct virtio_vsock_hdr->flags field is le32 and currently unused=
.
> >>> Could 24 bits be used for a unique message id and 8 bits for flags? 1
> >>> flag bit could be used for end-of-message and the remaining 7 bits co=
uld
> >>> be reserved. That way SEQ_BEGIN and SEQ_END are not necessary. =20
> >>> Pressure
> >>> on the virtqueue would be reduced and performance should be comparabl=
e
> >>> to SOCK_STREAM.
> >> Well, my first versions of SOCK_SEQPACKET implementation, worked
> >> something like this: i used flags field of header as length of whole
> >> message. I discussed it with Stefano Garzarella, and he told that it=
=20
> >> will
> >> be better to use special "header" in packet's payload, to keep some
> >> SOCK_SEQPACKET specific data, instead of reusing packet's header
> >> fields.
> > IIRC in the first implementation SEQ_BEGIN was an empty message and we=
=20
> > didn't added the msg_id yet. So since we needed to carry both id and=20
> > total length, I suggested to use the payload to put these extra=20
> > information.
> >
> > IIUC what Stefan is suggesting is a bit different and I think it should=
=20
> > be cool to implement: we can remove the boundary packets, use only 8=20
> > bits for the flags, and add a new field to reuse the 24 unused bits,=20
> > maybe also 16 bits would be enough.
> > At that point we will only use the EOR flag to know the last packet.
> >
> > The main difference will be that the receiver will know the total size=
=20
> > only when the last packet is received.
> >
> > Do you see any issue on that approach?
>=20
> It will work, except we can't check that any packet of message,
>=20
> except last(with EOR bit) was dropped, since receiver don't know
>=20
> real length of message. If it is ok, then i can implement it.

The credit mechanism ensures that packets are not dropped, so it's not
necessary to check for this condition.

By the way, is a unique message ID needed? My understanding is:

If two messages are being sent on a socket at the same time either their
order is serialized (whichever message began first) or it is undefined
(whichever message completes first). I wonder if POSIX specifies this
and if Linux implements it (e.g. with AF_UNIX SOCK_SEQPACKET messages
that are multiple pages long and exceed sndbuf)?

Depending on these semantics maybe we don't need a unique message ID.
Instead the driver transmits messages sequentially. RW packets for
different messages on the same socket will never be interleaved.
Therefore the unique message ID is not needed and just the MSG_EOR flag
is enough to indicate message boundaries.

What do you think?

Stefan

--6deGiYCe1WgmvBoX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBi53wACgkQnKSrs4Gr
c8ifHQf8CKnbLpRILKG1ZVpNXsVCthEv1thsDIjNenxUvXs97ghmwYpXjbDx+YKD
mjVbuORgW2HjfjJ5NBdvr+lPVBQS35I9FeVwtAKNeVkkIn2Vpnrc8nzrFKFpriGK
/wcGo1VGcIqJo4GHfhjYB0s/dc3N7FyFpDy+egS7Mdkjju/79fjGJCvy/U50fVA/
3TidGRbFp4n7IcIQSRVcdX/6Fdfr+r76rI/kRtoz/72IMwj3VA/PyerKB14O3A6F
pU4EO+hIp47hJBUXjpdM7a5p+GdgJfLopO26OX7OTRZx0ljB3DcCz4s1h9Jefshy
LyHLjg7MdDZVKes0R+R74u5VxVJLxQ==
=+7lq
-----END PGP SIGNATURE-----

--6deGiYCe1WgmvBoX--

