Return-Path: <stefanha@redhat.com>
Date: Tue, 7 Dec 2021 09:58:05 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v4] virtio-blk: add secure erase feature to specification
Message-ID: <Ya8wLTE+44J8Q+JH@stefanha-x1.localdomain>
References: <20211207012222.1308123-1-yadong.qi@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CWG7fs9KmATKVkD6"
Content-Disposition: inline
In-Reply-To: <20211207012222.1308123-1-yadong.qi@intel.com>
To: yadong.qi@intel.com
Cc: virtio-comment@lists.oasis-open.org, hch@lst.de, cohuck@redhat.com, luhai.chen@intel.com, kai.z.wang@intel.com
List-ID: <virtio-comment.lists.oasis-open.org>


--CWG7fs9KmATKVkD6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 07, 2021 at 09:22:22AM +0800, yadong.qi@intel.com wrote:
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
> Introduced new fileds in virtio_blk_config for secure erase commands:

s/fileds/fields/

> struct virtio_blk_config {
>     ...
>     max_secure_erase_sectors;
>     max_secure_erase_seg;
>     secure_erase_sector_alignment;
> };
>=20
> v1 -> v2:
> - add separated queue limits for secure discard.
>=20
> v2 -> v3:
> - reword "secure discard" to "secure erase".
> - adjust offset of new fields
>=20
> v3 -> v4
> - unify the wording to "secure erase"

Changelog entries go below the '---' line because they don't need to be
recorded in the git log.

>=20
> Signed-off-by: Yadong Qi <yadong.qi@intel.com>
> ---
>  content.tex | 41 +++++++++++++++++++++++++++++++++--------
>  1 file changed, 33 insertions(+), 8 deletions(-)

Don't worry about the minor things above. Looks good to me:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--CWG7fs9KmATKVkD6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGvMC0ACgkQnKSrs4Gr
c8jFmggAqa+jtr9G1KKhIwvDafSbIsRuXlsvcfAcZrJTvfotQAGwWOFjuWUUKZbp
VXLWqV2c9/SeVjn6z/LyMfntvHV9MxrvQM3kxZJrTjoaseicI4rLIweJ+2zRtTsG
3oKZQcvDgIWgmmukMoY9mLRh/0CrYPwcvfiFGmcatWpMNzuKavPz1LmBvnG5ldnY
uzR44vy/m/XwGmIMwsMC4zMQR9qMB7FBDf7aVrufe0GXoDI0t/yh3Duju6paSFk8
J8bQHo6PxMS92kOo735atH2nPp0+jRMKf2MHpIQCLPbi6McIsR+AwYMs1lPnf4bL
P/2VGW4RYtcUblUJpD8moJLSNh2LSA==
=Xp3t
-----END PGP SIGNATURE-----

--CWG7fs9KmATKVkD6--

