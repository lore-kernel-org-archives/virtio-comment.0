Return-Path: <stefanha@redhat.com>
Date: Thu, 19 Aug 2021 13:54:51 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC PATCH] Introduce admin virtqueue as a new transport
Message-ID: <YR5Um4ghahOFOKak@stefanha-x1.localdomain>
References: <20210803032006.48881-1-jasowang@redhat.com>
 <YQpLP/NofUOMIsOA@stefanha-x1.localdomain>
 <67baffcb-1719-3909-9496-7eee1dde99af@redhat.com>
 <YQqNCMTwyubfNIkb@stefanha-x1.localdomain>
 <d9cdd16a-43dd-4ae4-4423-8de333abb803@redhat.com>
 <YQvuqDPr/meoRJNB@stefanha-x1.localdomain>
 <20210805150748-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Y2izWqODFGJhImjD"
Content-Disposition: inline
In-Reply-To: <20210805150748-mutt-send-email-mst@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, virtio-comment@lists.oasis-open.org, cohuck@redhat.com, mgurtovoy@nvidia.com, eperezma@redhat.com, lulu@redhat.com, Parav Pandit <parav@nvidia.com>
List-ID: <virtio-comment.lists.oasis-open.org>


--Y2izWqODFGJhImjD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 05, 2021 at 03:19:31PM -0400, Michael S. Tsirkin wrote:
> On Thu, Aug 05, 2021 at 02:59:04PM +0100, Stefan Hajnoczi wrote:
> > On Thu, Aug 05, 2021 at 02:32:31PM +0800, Jason Wang wrote:
> > >=20
> > > =E5=9C=A8 2021/8/4 =E4=B8=8B=E5=8D=888:50, Stefan Hajnoczi =E5=86=99=
=E9=81=93:
> > > > On Wed, Aug 04, 2021 at 04:51:15PM +0800, Jason Wang wrote:
> > > > > =E5=9C=A8 2021/8/4 =E4=B8=8B=E5=8D=884:09, Stefan Hajnoczi =E5=86=
=99=E9=81=93:
> > > > > > On Tue, Aug 03, 2021 at 11:20:06AM +0800, Jason Wang wrote:
> > > > > > I tried to imagine what the virtio-blk vdev creation parameters=
 need to
> > > > > > look like. Here is what I came up with:
> > > > > >=20
> > > > > >     Virtual Device Creation Parameters for Block Devices
> > > > > >     ----------------------------------------------------
> > > > > >     The following creation parameters specify the details of a =
new virtual
> > > > > >     block device:
> > > > > >=20
> > > > > >     Field        Type   Meaning
> > > > > >     -----------------------------------------------------------=
-----------
> > > > > >     blkdev_id    u64    Identifier of the underlying block devi=
ce that
> > > > > >                         provides storage. The enumeration and c=
reation of
> > > > > >                         underlying block devices is
> > > > > >                         implementation-specific.
> > > > > >     num_queues   u16    Number of request virtqueues.
> > > > > >     features_len u8     Number of elements in features[].
> > > > >=20
> > > > > For 'elements' do you mean the 'u32 elements'?
> > > > Yes, u32 array elements.
> > > >=20
> > > > > >     features[]   u32    Device feature bits to report.
> > > > > >=20
> > > > > >     Creation error codes are as follows:
> > > > > >=20
> > > > > >     Error               Meaning
> > > > > >     -----------------------------------------------------------=
-----------
> > > > > >     INVALID_BLKDEV_ID   The underlying block device does not ex=
ist.
> > > > > >     BLKDEV_BUSY         The underlying block device is already =
in use.
> > > > > >     BLKDEV_READ_ONLY    The underlying block device is read-onl=
y.
> > > > > >     INVALID_NUM_QUEUES  The number of request queues was 0 or t=
oo large.
> > > > > >     UNSUPPORTED_FEATURE A feature bit was given that the device=
 does not
> > > > > >                         support.
> > > > > >=20
> > > > > >     If the VIRTIO_BLK_F_RO bit is set in features[] then the un=
derlying
> > > > > >     block device is made available for read-only access.
> > > > > >=20
> > > > > >     Creation MAY fail with BLKDEV_BUSY if a blkdev_id value tha=
t is
> > > > > >     already in use is given.
> > > > > >=20
> > > > > >     Creation MAY fail with BLKDEV_READ_ONLY if the underlying b=
lock device
> > > > > >     does not support writes and the VIRTIO_BLK_F_RO bit is not =
set in
> > > > > >     features[].
> > > > > >=20
> > > > > >     The configuration space parameters (see 5.2.4 Device config=
uration
> > > > > >     layout) are determined by the device based on the underlyin=
g block
> > > > > >     device capacity, block size, etc.
> > > > > >=20
> > > > > > Note that this doesn't allow overriding configuration space par=
ameters
> > > > > > (e.g. block size). We probably need to support that in the futu=
re for
> > > > > > live migration compatibility.
> > > > >=20
> > > > > I wonder do we need those configuration to be self-descriptive? E=
=2Eg how did
> > > > > the device know that the config contains the blk_size. (I guess i=
t's not a
> > > > > good practice to infer this from the config len).
> > > > The device configuration space size and layout is determined by the
> > > > device feature bits.
> > >=20
> > >=20
> > > So blk_size doesn't belong to any feature. I guess it means we should=
 start
> > > the support of blk_size from day 0.
> >=20
> > The device creation parameters can either include a full configuration
> > space-sized blob:
> >=20
> >   Field        Type                      Meaning
> >   ----------------------------------------------------------------------
> >   init_config  struct virtio_blk_config  Initial contents of the
> >                                          configuration space.
> >=20
> > or they can include individual fields (basically
> > re-define them outside struct virtio_foo_config):
> >=20
> >   Field        Type        Meaning
> >   ----------------------------------------------------------------------
> >   blk_size     u32         Block size.
> >=20
> > Which approach to use depends on how much of the configuration space
> > should be settable at device creation time. If most of it will be
> > initialized by the device and isn't configurable, then embedding the
> > entire struct is not necessary.
> > Additionally, there must be a flags field in the device creation
> > parameters for indicating which configuration space fields or individual
> > fields described above to use. This allows you to accept the default
> > blk_size value instead of providing your own value:
> >=20
> >   Field       Type         Meaning
> >   ----------------------------------------------------------------------
> >   init_flags  u64          Use the corresponding field value to
> >                            initialize the device configuration space if
> > 			   the flag is set:
> >=20
> > 			     INIT_BLK_SIZE (1 << 0)
> >=20
> > > I had some discussion with Parav about this in the series that introd=
uces
> > > the netlink extension for setting up the device.
> > >=20
> > > I guess this is what we want:
> > >=20
> > > struct virtio_config {
> > > attribute_X; //only exist when feature X existing
> > > attribute_Y; //only exist when feature Y existing
> > > ...
> > > };
> >=20
> > That's more or less how configuration space layout works today. We don't
> > have explicit comments in the header file but when feature X is enabled
> > the driver may access virtio_config::attribute_X.
> >=20
> > Stefan
>=20
>=20
> Two things I know about network devices
> - some VF configuration isn't in config space at all
>   since config space describes guest visible fields.
>   E.g. a vlan tag to be attached to all packets.

blk has additional configuration that is not visible in struct
virtio_blk_config. For example, the request virtqueue size.

Such device creation parameters can be defined as fields just like the
ones from struct virtio_blk_config that I showed above, so I think we're
fine there.

> - some VF configuration is normally settable by PF without
>   destroying/recreating the VF.
>   E.g. the default MAC address.

Sounds like a job for an admin virtqueue :).

Stefan

--Y2izWqODFGJhImjD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEeVJsACgkQnKSrs4Gr
c8jxxwgAkHnmI/2vKO3vPKQhFZUTyMwysvmtGrCgya2gF+Fe9wsHj7jpGP2pP0mm
X6AwOQVYuKPUkq1k4gQ5ZtdcOyajzAAkw3DTcagfPK4blE72ja6u1BH+C4SqVQNg
4r3KitHxf7IryYqULoqsdKZIZkVAaCofSRPj1tYDxa6khyeB/1JJGwoJkhKSChPx
6YavHRyLbg14S/OWKF0hG/6ihUNpAPwDmKQeeBaaSYIYYL/fK9DjBcEuF6v8S9u0
kBIxlgQ3mWd26RJJNDbk+r9eeihyb/rxp0dM+DABh8g3kNGuuS+2IKyt3S8B+/d7
PIRoTpBPWUR6Lprf+nxorSu2dPX2/A==
=bwOM
-----END PGP SIGNATURE-----

--Y2izWqODFGJhImjD--

