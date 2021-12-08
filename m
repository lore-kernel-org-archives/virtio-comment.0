Return-Path: <stefanha@redhat.com>
Date: Wed, 8 Dec 2021 15:38:10 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v5] virtio-blk: add secure erase feature to specification
Message-ID: <YbDRYkT4xTqsHrhL@stefanha-x1.localdomain>
References: <20211208040549.57531-1-yadong.qi@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="y/4DalKCWJ+Vft/e"
Content-Disposition: inline
In-Reply-To: <20211208040549.57531-1-yadong.qi@intel.com>
To: yadong.qi@intel.com
Cc: virtio-comment@lists.oasis-open.org, hch@lst.de, cohuck@redhat.com, luhai.chen@intel.com, kai.z.wang@intel.com
List-ID: <virtio-comment.lists.oasis-open.org>


--y/4DalKCWJ+Vft/e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 08, 2021 at 12:05:49PM +0800, yadong.qi@intel.com wrote:
> From: Yadong Qi <yadong.qi@intel.com>
>=20
> There are user requests to use the Linux BLKSECDISCARD ioctl on
> virtio-blk device. A secure discard is the same as a regular discard
> except that all copies of the discarded blocks that were possibly
> created by garbage collection must also be erased. This requires
> support from the device. And "secure erase" is more commonly used
> in industry to name this feature. Hence in this proposal, extend
> virtio-blk protocol to support secure erase command.
>=20
> Introduced new feature flag and command type:
>     VIRTIO_BLK_F_SECURE_ERASE
>     VIRTIO_BLK_T_SECURE_ERASE
>=20
> This feature is a passthrough feature on backend because it is hard
> to emulate a secure erase. So virtio-blk will report this feature
> to guest OS if backend device support such kind of feature. And
> when guest OS issues a secure erase command, backend driver will
> passthrough the command to host device blocks.
>=20
> Introduced new fields in virtio_blk_config for secure erase commands:
> struct virtio_blk_config {
>     ...
>     max_secure_erase_sectors;
>     max_secure_erase_seg;
>     secure_erase_sector_alignment;
> };
>=20
> Signed-off-by: Yadong Qi <yadong.qi@intel.com>
> ---
> v1 -> v2:
> - add separated queue limits for secure discard.
>=20
> v2 -> v3:
> - reword "secure discard" to "secure erase".
> - adjust offset of new fields
>=20
> v3 -> v4
> - unify the wording to "secure erase"
>=20
> v4 -> v5
> - fix typo
> - adjust position of changelog
>=20
> ---
>  content.tex | 41 +++++++++++++++++++++++++++++++++--------
>  1 file changed, 33 insertions(+), 8 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--y/4DalKCWJ+Vft/e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGw0WIACgkQnKSrs4Gr
c8j/+wf/YS4aUIDorlOqS5pTPRtoRZWt6Ubzimnp6kh2Wil9JJxf17khFBF6WSKo
KZTa6BLqjvTLQYoVWo2KPM4XK5UTYmt1x2AgL7+Wf57pqIW9TH3ZhvDXCKpAomG4
KZq6LCvOj+q3rUhu6S65S2D/eHdDdkLRogSvK72kFaZf7gYjAPSirg436r1IPvKD
AZhSk5qoWOqR/YqkpQEgn5o6WWsJE/FhyvpkNsQekInSVM2vuf9Y29ufA5a+tVD3
murC/TOKD53fpZgqxqeWxwRPx7NoLfU51G2kFqSvO6MvQn9gIY5U/s4l7014T0Df
581WkmTh7V7vOocHzuva1On+BN6F+w==
=Esmt
-----END PGP SIGNATURE-----

--y/4DalKCWJ+Vft/e--

