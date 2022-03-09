Return-Path: <virtio-comment-return-2794-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2CC34986599
	for <virtio-comment@lists.oasis-open.org>; Wed,  9 Mar 2022 14:53:13 +0000 (UTC)
Date: Wed, 9 Mar 2022 14:53:02 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <Yii/ToLoR5t9KFjr@stefanha-x1.localdomain>
References: <CAJ3Dt_XZJX=f-WkbD_wESFLztFyKNW_3TUAPnG-H_SpL6H0YaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qiPv4fjWCftgffYh"
Content-Disposition: inline
In-Reply-To: <CAJ3Dt_XZJX=f-WkbD_wESFLztFyKNW_3TUAPnG-H_SpL6H0YaQ@mail.gmail.com>
Subject: Re: [virtio-comment] virtio-net : 5.1.6.2 descriptor-chains on
 transmitq
To: Awais Masood <awais@bedrocksystems.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

--qiPv4fjWCftgffYh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 09, 2022 at 06:00:08PM +0500, Awais Masood wrote:
> Hi,
>=20
> Seeking some clarity on:
>=20
>  5.1.6.2
>  Packet Transmission
>=20
>  5. The header and packet are added as one output descriptor to the
> transmitq, and the device is notified of the new entry
>=20
> Does it imply no descriptor-chains for packets in transmitq? If
> descriptor-chains are allowed on transmitq then why does it not state
> 'output buffer' instead of 'output descriptor'?

Good point, the spec is misleading.

TX buffers can be chains and/or use indirect descriptors. I think it
should read:

  The header and packet output descriptors are added as one buffer to
  the transmitq, and the device is notified of the new entry

There are no restrictions on descriptor framing, it would violate the
spec:

  2.6.4 Message Framing

  The framing of messages with descriptors is independent of the
  contents of the buffers. For example, a network transmit buffer
  consists of a 12 byte header followed by the network packet. This
  could be most simply placed in the descriptor table as a 12 byte
  output descriptor followed by a 1514 byte output descriptor, but it
  could also consist of a single 1526 byte output descriptor in the case
  where the header and packet are adjacent, or even three or more
  descriptors (possibly with loss of efficiency in that case).=20

Would you like to send a patch to update the spec? The guidelines for
contributing spec changes are here:
https://github.com/oasis-tcs/virtio-spec/blob/master/CONTRIBUTING.md

Stefan

--qiPv4fjWCftgffYh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIov00ACgkQnKSrs4Gr
c8g6zAgAkVXHm5nRY3LM68mY3duLF+cURuGHt2KRwjKiNw3dEVEomS0DaN4NL0U1
6Z7o80vfkfmHU0i492vcTxhtj3Q05dC4eOX8Ku2QaGPKYs3XUfE/2FnWrIfqa1ic
Q9b93wl3VZKK7yIvbu4sBsxZ3jc1XgJ5FtPOgv27oTdcOZbmO3myD8CTK3euCCtF
eXcNisHsVrI0okPtR/Qqr+Dki8M3tSMkVBDoDxZxrj8M3Pq5ApSGz+O7jhEYi96W
URlrysseWaHK/5Sju5ztO4wUF4EFkQY3o6a5ZqQESjRUQ3EmBzbJVZSAor8R1psZ
jW+wX34W78Drppjd3Dx13JAu5bTg1Q==
=pDji
-----END PGP SIGNATURE-----

--qiPv4fjWCftgffYh--

