Return-Path: <stefanha@redhat.com>
Date: Wed, 4 Aug 2021 07:39:42 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC PATCH] Introduce admin virtqueue as a new transport
Message-ID: <YQo2LmjnfW/fa2eT@stefanha-x1.localdomain>
References: <20210803032006.48881-1-jasowang@redhat.com>
 <YQlX4XCJ+dVA/zFR@stefanha-x1.localdomain>
 <6cc4603e-2c82-4ff5-fb0a-fbfaaac25663@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Mg+CWGR9b+Q7+IN6"
Content-Disposition: inline
In-Reply-To: <6cc4603e-2c82-4ff5-fb0a-fbfaaac25663@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, mst@redhat.com, cohuck@redhat.com, mgurtovoy@nvidia.com, eperezma@redhat.com, lulu@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>


--Mg+CWGR9b+Q7+IN6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 04, 2021 at 11:01:39AM +0800, Jason Wang wrote:
> =E5=9C=A8 2021/8/3 =E4=B8=8B=E5=8D=8810:51, Stefan Hajnoczi =E5=86=99=E9=
=81=93:
> > On Tue, Aug 03, 2021 at 11:20:06AM +0800, Jason Wang wrote:
> > > +\subsection{Admin Virtqueue Capabilities}\label{sec:Virtio Transport=
 Options / Virtio Over Admin Virtqueue / Admin Virtqueue Capabilities}
> > > +
> > > +The capabilites that are supported by the admin virtqueue could be
> > > +fetched through the following commands:
> > > +
> > > +\begin{lstlisting}
> > > +#define VIRTIO_ADMIN_CTRL_CAP    0
> > > + #define VIRTIO_ADMIN_CTRL_CAP_GET        0
> > > +\end{lstlisting}
> > > +
> > > +The VIRTIO_ADMIN_CTRL_CAP_GET is used to get the capabilites that are
> > > +supported by the admin virtqueue through a u64 which is a bit mask of
> > > +the capabilies in command-in-data. There's no command-out-data.
> > I'm not sure what this paragraph is describing. Is VIRTIO_ADMIN_CTRL_CAP
> > a struct virtio_admin_ctrl::command value?
>=20
>=20
> VIRTIO_ADMIN_CTRL_CAP is the class, VIRTIO_ADMIN_CTRL_CAP_GET is the
> command.

Okay. I found the admin virtqueue command descriptions hard to read, not
just because the class/command definitions weren't obvious to me, but
also because the command/response layout is described in English instead
of a table or C-like notation.

I think something like this would make the commands easier to
understand:

  Capabilities supported by the admin virtqueue are fetched as follows:

  Driver->Device:
  Field       Value                          Type
  -----------------------------------------------
  device_id   0                              u64
  class       VIRTIO_ADMIN_CTRL_CAP (0)      u16
  command     VIRTIO_ADMIN_CTRL_CAP_GET (0)  u16

  Device->Driver:
  Field         Value                        Type
  -----------------------------------------------
  ack           VIRTIO_ADMIN_OK (0)          u8
  capabilities  <supported capability bits>  u64

> > Another question: I wonder why there is an admin virtqueue feature bit
> > instead of a new VIRTIO device ID for the management device? Does this
> > mean regular virtio-net, virtio-blk, etc devices can have an admin queue
> > in addition to their normal role?
>=20
>=20
> I think so, I just follow the normal networking PF role which is usually a
> network device which allows some kind of remote management.
>=20
> But it doesn't forbid us to create the management device.
>=20
> I think it's better to not mandate the management device for now, or is
> there any reason for doing that?

Since the admin virtqueue is generic infrastructure (not specific to
vdev management) I think it makes sense to use a feature bit and not a
separate management device. This wasn't obvious to me from this
document, maybe the text can be tweaked to clearly separate the
(generic) admin virtqueue from vdev management.

>=20
>=20
> >=20
> > > +
> > > +\devicenormative{Admin Virtqueue Capabilities}\label{sec:Virtio Tran=
sport Options / Virtio Over Admin Virtqueue / Admin Virtqueue Capabilities}
> > > +
> > > +The management device MUST support VIRTIO_ADMIN_CTRL_CAP class when
> > Oh, VIRTIO_ADMIN_CTRL_CAP is a class value. That wasn't clear when the
> > constant value was defined.
>=20
>=20
> Any suggestion to make it clear? I just follow the style of the current
> virtio-net control vq command definitions.

#define VIRTIO_ADMIN_CLASS_CAP 0
 #define VIRTIO_ADMIN_CMD_CAP_GET 0

There are many other possible variations that would be equally clear, I
don't really mind.

> > > +virtual devices must be created and discovered through the admin
> > > +virtqueue.
> > Are management devices with statically pre-allocated virtual devices
> > supported?
>=20
>=20
> It is supported when I wrote the patch, but for simplicity I remove that
> part. I can add them back.

I guess the advantage is that static vdevs don't need creation
parameters. So they could be useful in cases where the hardware defines
the creation parameters (i.e. because they are fixed and unknown to the
management driver). But I don't know whether there is any real-world use
case...

I don't mind if only dynamic vdevs are supported, but please document it
so the scope/intent is clear.

> >=20
> > > +\begin{lstlisting}
> > > +struct virtio_admin_ctrl_vdev_attribute {
> > > +       u32 device_id;
> > This name is easy to confuse with the struct virtio_admin_ctrl's
> > device_id. They have different meanings. Want to rename struct
> > virtio_admin_ctrl's field to "vdev_id"?
>=20
>=20
> This is the virtio device id, but rethink of the design, it's meangless if
> we don't have a dedicated management device.
>=20
> Since we don't want a virtio-net management device to create a virtio-blk
> virtual device.

I see. This means that a physical device wishing to support multiple
device types needs to expose multiple management devices, even though
they may share resources (e.g. you can only instantiate 8 vdevs in total
regardless of their type).

I don't have enough experience with device splitting to say whether this
design is flexible enough. It seems okay to me.

--Mg+CWGR9b+Q7+IN6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEKNi4ACgkQnKSrs4Gr
c8jh/Af/bZub5PH7kbN0otCWWpDPCqS1odKl08LZTiLzVdEA62/SWGvJXzx7zUXO
md4lW5fiRiQV/m/JAQGBuZUoGwQWvLGoociqeyfv12nvc7TCynGVkkFDTvdlAZ3l
X5GtzU4eiFF/Rzz4oiZqsTJW/1Hb24REkrInUpbVHHyqWEoViDFXYxjtjnwQ9/v/
TN59rZleFtT2svaGTXj+wkEyOMADDI6PbFGkjwF2FStN0bgDQNPO+C571rkH+J2U
fzGNGpOW6P+jpckdPvnYxJN0DpfmXTRbvnk3CiU0ksPZL8Inz0g0gYDTFi0A56DX
RyeqpnM7gxhShPiPFuySi4IOjZT/Hg==
=HKK2
-----END PGP SIGNATURE-----

--Mg+CWGR9b+Q7+IN6--

