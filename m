Return-Path: <stefanha@redhat.com>
Date: Mon, 2 Aug 2021 17:39:05 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC PATCH v2 1/2] Add virtio Admin Virtqueue specification
Message-ID: <YQgfqXpVwlcgD5rH@stefanha-x1.localdomain>
References: <20210726165254.8529-1-mgurtovoy@nvidia.com>
 <20210728083306-mutt-send-email-mst@kernel.org>
 <f79c6f8f-04c7-3ca7-432a-b23e6eb09ce8@nvidia.com>
 <20210730032625-mutt-send-email-mst@kernel.org>
 <0bffb13f-4e88-266d-e072-bafa44ec86fe@nvidia.com>
 <20210731175617-mutt-send-email-mst@kernel.org>
 <8360728a-68e7-3727-be2c-20b3a259a633@nvidia.com>
 <YQfxrGg0V9iyOD03@stefanha-x1.localdomain>
 <87a6lz29we.fsf@redhat.com>
 <174f633c-d150-d4cd-be3e-ba0a5772d387@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VWbv2FdELWly8jtp"
Content-Disposition: inline
In-Reply-To: <174f633c-d150-d4cd-be3e-ba0a5772d387@nvidia.com>
To: Max Gurtovoy <mgurtovoy@nvidia.com>
Cc: Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, virtio-comment@lists.oasis-open.org, jasowang@redhat.com, oren@nvidia.com, parav@nvidia.com, shahafs@nvidia.com, eperezma@redhat.com, aadam@redhat.com, bodong@nvidia.com, amikheev@nvidia.com
List-ID: <virtio-comment.lists.oasis-open.org>


--VWbv2FdELWly8jtp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 02, 2021 at 05:58:19PM +0300, Max Gurtovoy wrote:
>=20
> On 8/2/2021 5:34 PM, Cornelia Huck wrote:
> > On Mon, Aug 02 2021, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >=20
> > > On Sun, Aug 01, 2021 at 02:46:13AM +0300, Max Gurtovoy wrote:
> > > > On 8/1/2021 1:17 AM, Michael S. Tsirkin wrote:
> > > > > On Sat, Jul 31, 2021 at 02:53:45PM +0300, Max Gurtovoy wrote:
> > > > > > On 7/30/2021 10:36 AM, Michael S. Tsirkin wrote:
> > > > > > > On Thu, Jul 29, 2021 at 05:51:07PM +0300, Max Gurtovoy wrote:
> > > > > > > > On 7/28/2021 3:48 PM, Michael S. Tsirkin wrote:
> > > > > > > > > On Mon, Jul 26, 2021 at 07:52:53PM +0300, Max Gurtovoy wr=
ote:
> > > > > > > > > > Admin virtqueues will be used to send administrative co=
mmands to
> > > > > > > > > > manipulate various features of the device which would n=
ot easily map
> > > > > > > > > > into the configuration space.
> > > > > > > > > >=20
> > > > > > > > > > The same Admin command format will be used for all virt=
io devices. The
> > > > > > > > > > Admin command set will include 4 types of command class=
es:
> > > > > > > > > > 1. The generic common class
> > > > > > > > > > 2. The transport specific class
> > > > > > > > > > 3. The device specific class
> > > > > > > > > > 4. The vendor specific class
> > > > > > > > > >=20
> > > > > > > > > > The above mechanism will enable adding various features=
 to the virtio
> > > > > > > > > > specification, e.g.:
> > > > > > > > > > 1. Format virtio-blk devices in various configurations =
(512B block size,
> > > > > > > > > >        512B + 8B T10-DIF, 4K block size, 4k + 8B T10-DI=
F, etc..).
> > > > > > > > > > 2. Live migration management.
> > > > > > > > > > 3. Encrypt/Decrypt descriptors.
> > > > > > > > > > 4. Virtualization management.
> > > > > > > > > > 5. Get device error logs.
> > > > > > > > > > 6. Implement advanced vendor/device/transport specific =
features.
> > > > > > > > > > 7. Run device health test.
> > > > > > > > > > 8. More.
> > > > > I still don't really see what do all these things have in common?
> > > > I don't think you need to look on this in that direction.
> > > >=20
> > > > This is a queue for administration.
> > > >=20
> > > > Cornelia and Stefan already agreed on this approach.
> > > We're discussing these patches and I'm trying to understand what you'=
re
> > > proposing. It's a bit early to say I've agreed to anything.
> > For the record, same for me.
>=20
> didn't you agree on admin q approach ?
>=20
> I'm not talking about the command set.

I like the idea of a common admin virtqueue but it's still necessary to
answer questions that have been raised. If someone identifies a
significant issue or suggests an alternative then that needs to be dealt
with on its technical merit.

Stefan

--VWbv2FdELWly8jtp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEIH6kACgkQnKSrs4Gr
c8hZfwf9FjrWE53HeYgxizqaB9VNf2ucVpPj+LtNn0/b1T3stdgco4mv9fgCRJvW
7Mnmao9bcFzsGUNlGI4wQt0p/CdG6jVFeKQqjD03JE3yEWN46S2YjRVuBUB276M7
69dVqmxwXcs6VlFJIjrQQp7tGZo44cwwnY8VOKoVP8TfsD7E7LsDb6GCjq+DsKW1
UYTP1UqtpB7eJnr3IPAWaCgrZrC2pglwnZix4pcG4rYb+gMr3VurG2QbzcAFBcPi
XcUnSpT5+Ygg++KxuGRtAP0dewOha2Kf7SuTfD64uAx0xvXQd6aGYbpePaFaJIso
MuVwKApypBa2YbuTzuOLE3MtiQ0rRw==
=zz6Z
-----END PGP SIGNATURE-----

--VWbv2FdELWly8jtp--

