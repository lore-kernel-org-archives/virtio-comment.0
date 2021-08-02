Return-Path: <stefanha@redhat.com>
Date: Mon, 2 Aug 2021 14:22:52 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC PATCH v2 1/2] Add virtio Admin Virtqueue specification
Message-ID: <YQfxrGg0V9iyOD03@stefanha-x1.localdomain>
References: <20210726165254.8529-1-mgurtovoy@nvidia.com>
 <20210728083306-mutt-send-email-mst@kernel.org>
 <f79c6f8f-04c7-3ca7-432a-b23e6eb09ce8@nvidia.com>
 <20210730032625-mutt-send-email-mst@kernel.org>
 <0bffb13f-4e88-266d-e072-bafa44ec86fe@nvidia.com>
 <20210731175617-mutt-send-email-mst@kernel.org>
 <8360728a-68e7-3727-be2c-20b3a259a633@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hFZsCdvzPP4geP+B"
Content-Disposition: inline
In-Reply-To: <8360728a-68e7-3727-be2c-20b3a259a633@nvidia.com>
To: Max Gurtovoy <mgurtovoy@nvidia.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, virtio-comment@lists.oasis-open.org, jasowang@redhat.com, cohuck@redhat.com, oren@nvidia.com, parav@nvidia.com, shahafs@nvidia.com, eperezma@redhat.com, aadam@redhat.com, bodong@nvidia.com, amikheev@nvidia.com
List-ID: <virtio-comment.lists.oasis-open.org>


--hFZsCdvzPP4geP+B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 01, 2021 at 02:46:13AM +0300, Max Gurtovoy wrote:
>=20
> On 8/1/2021 1:17 AM, Michael S. Tsirkin wrote:
> > On Sat, Jul 31, 2021 at 02:53:45PM +0300, Max Gurtovoy wrote:
> > > On 7/30/2021 10:36 AM, Michael S. Tsirkin wrote:
> > > > On Thu, Jul 29, 2021 at 05:51:07PM +0300, Max Gurtovoy wrote:
> > > > > On 7/28/2021 3:48 PM, Michael S. Tsirkin wrote:
> > > > > > On Mon, Jul 26, 2021 at 07:52:53PM +0300, Max Gurtovoy wrote:
> > > > > > > Admin virtqueues will be used to send administrative commands=
 to
> > > > > > > manipulate various features of the device which would not eas=
ily map
> > > > > > > into the configuration space.
> > > > > > >=20
> > > > > > > The same Admin command format will be used for all virtio dev=
ices. The
> > > > > > > Admin command set will include 4 types of command classes:
> > > > > > > 1. The generic common class
> > > > > > > 2. The transport specific class
> > > > > > > 3. The device specific class
> > > > > > > 4. The vendor specific class
> > > > > > >=20
> > > > > > > The above mechanism will enable adding various features to th=
e virtio
> > > > > > > specification, e.g.:
> > > > > > > 1. Format virtio-blk devices in various configurations (512B =
block size,
> > > > > > >       512B + 8B T10-DIF, 4K block size, 4k + 8B T10-DIF, etc.=
=2E).
> > > > > > > 2. Live migration management.
> > > > > > > 3. Encrypt/Decrypt descriptors.
> > > > > > > 4. Virtualization management.
> > > > > > > 5. Get device error logs.
> > > > > > > 6. Implement advanced vendor/device/transport specific featur=
es.
> > > > > > > 7. Run device health test.
> > > > > > > 8. More.
> > I still don't really see what do all these things have in common?
>=20
> I don't think you need to look on this in that direction.
>=20
> This is a queue for administration.
>=20
> Cornelia and Stefan already agreed on this approach.

We're discussing these patches and I'm trying to understand what you're
proposing. It's a bit early to say I've agreed to anything.

Stefan

--hFZsCdvzPP4geP+B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEH8awACgkQnKSrs4Gr
c8gz1Qf/S4Hs4N+2YAOU4ozPRg/Rghui3pk1bv13ONALOt/foLOPUa4T0sU6tWrt
Zb8kZtPayoLakS1VbMJL7b1hOkIsvYLGtTzfiNSNDsKAvDXrGyanE0tZnWRMHPh7
DsekOWGtbuA1XqOfs18DCgQPGUTkbk7LshJ9+ikPyp1C9jCLdLL+wZwgVq1VBcxL
eosBr1odMUJWzrt46d+m8O0E7ytIXvNmYfodUub6KUU1mnw4AMjqwgR6yL9ZuBkK
0NDYO0BA2UGcPItcE9FaAMgClRK/q38Qg4T94FVV7YuZHgFe0L0sZxVMUO3Ej+KB
8aZGBg+6c24FPZopRP+vaE1ehzbRrA==
=WpAp
-----END PGP SIGNATURE-----

--hFZsCdvzPP4geP+B--

