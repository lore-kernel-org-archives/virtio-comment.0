Return-Path: <stefanha@redhat.com>
Date: Wed, 4 Aug 2021 13:56:08 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC PATCH] Introduce admin virtqueue as a new transport
Message-ID: <YQqOaA6/PHNmfFV+@stefanha-x1.localdomain>
References: <20210803032006.48881-1-jasowang@redhat.com>
 <YQlX4XCJ+dVA/zFR@stefanha-x1.localdomain>
 <6cc4603e-2c82-4ff5-fb0a-fbfaaac25663@redhat.com>
 <YQo2LmjnfW/fa2eT@stefanha-x1.localdomain>
 <ff1d8d47-390a-1428-532d-8a7349f0e664@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hlF7BslAQxVTFAPs"
Content-Disposition: inline
In-Reply-To: <ff1d8d47-390a-1428-532d-8a7349f0e664@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, mst@redhat.com, cohuck@redhat.com, mgurtovoy@nvidia.com, eperezma@redhat.com, lulu@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>


--hlF7BslAQxVTFAPs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 04, 2021 at 04:39:24PM +0800, Jason Wang wrote:
> =E5=9C=A8 2021/8/4 =E4=B8=8B=E5=8D=882:39, Stefan Hajnoczi =E5=86=99=E9=
=81=93:
> > On Wed, Aug 04, 2021 at 11:01:39AM +0800, Jason Wang wrote:
> > > =E5=9C=A8 2021/8/3 =E4=B8=8B=E5=8D=8810:51, Stefan Hajnoczi =E5=86=99=
=E9=81=93:
> > > > On Tue, Aug 03, 2021 at 11:20:06AM +0800, Jason Wang wrote:
> > > > > +\subsection{Admin Virtqueue Capabilities}\label{sec:Virtio Trans=
port Options / Virtio Over Admin Virtqueue / Admin Virtqueue Capabilities}
> > > > > +
> > > > > +The capabilites that are supported by the admin virtqueue could =
be
> > > > > +fetched through the following commands:
> > > > > +
> > > > > +\begin{lstlisting}
> > > > > +#define VIRTIO_ADMIN_CTRL_CAP    0
> > > > > + #define VIRTIO_ADMIN_CTRL_CAP_GET        0
> > > > > +\end{lstlisting}
> > > > > +
> > > > > +The VIRTIO_ADMIN_CTRL_CAP_GET is used to get the capabilites tha=
t are
> > > > > +supported by the admin virtqueue through a u64 which is a bit ma=
sk of
> > > > > +the capabilies in command-in-data. There's no command-out-data.
> > > > I'm not sure what this paragraph is describing. Is VIRTIO_ADMIN_CTR=
L_CAP
> > > > a struct virtio_admin_ctrl::command value?
> > >=20
> > > VIRTIO_ADMIN_CTRL_CAP is the class, VIRTIO_ADMIN_CTRL_CAP_GET is the
> > > command.
> > Okay. I found the admin virtqueue command descriptions hard to read, not
> > just because the class/command definitions weren't obvious to me, but
> > also because the command/response layout is described in English instead
> > of a table or C-like notation.
> >=20
> > I think something like this would make the commands easier to
> > understand:
> >=20
> >    Capabilities supported by the admin virtqueue are fetched as follows:
> >=20
> >    Driver->Device:
> >    Field       Value                          Type
> >    -----------------------------------------------
> >    device_id   0                              u64
> >    class       VIRTIO_ADMIN_CTRL_CAP (0)      u16
> >    command     VIRTIO_ADMIN_CTRL_CAP_GET (0)  u16
> >=20
> >    Device->Driver:
> >    Field         Value                        Type
> >    -----------------------------------------------
> >    ack           VIRTIO_ADMIN_OK (0)          u8
> >    capabilities  <supported capability bits>  u64
>=20
>=20
> I just follows styles that is used in virtio-net control vq:
>=20
>=20
> \begin{lstlisting}
> #define VIRTIO_NET_CTRL_MQ=C2=A0=C2=A0=C2=A0 4
> =C2=A0#define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0 (for automatic receive
> steering)
> =C2=A0#define VIRTIO_NET_CTRL_MQ_RSS_CONFIG=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 1 (for configurable receive
> steering)
> =C2=A0#define VIRTIO_NET_CTRL_MQ_HASH_CONFIG=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 2 (for configurable hash
> calculation)
> \end{lstlisting}
>=20
> ...
>=20
> Do you suggest to change that as well?

My preference is to change it because I think describing inputs/outputs
in English makes it hard to understand the exact binary layout.

>=20
>=20
> >=20
> > > > Another question: I wonder why there is an admin virtqueue feature =
bit
> > > > instead of a new VIRTIO device ID for the management device? Does t=
his
> > > > mean regular virtio-net, virtio-blk, etc devices can have an admin =
queue
> > > > in addition to their normal role?
> > >=20
> > > I think so, I just follow the normal networking PF role which is usua=
lly a
> > > network device which allows some kind of remote management.
> > >=20
> > > But it doesn't forbid us to create the management device.
> > >=20
> > > I think it's better to not mandate the management device for now, or =
is
> > > there any reason for doing that?
> > Since the admin virtqueue is generic infrastructure (not specific to
> > vdev management) I think it makes sense to use a feature bit and not a
> > separate management device. This wasn't obvious to me from this
> > document, maybe the text can be tweaked to clearly separate the
> > (generic) admin virtqueue from vdev management.
>=20
>=20
> Maybe adding a device normative like
>=20
> "
>=20
> The management device MUST offer the admin virtqueue is a device specific
> virtqueue.
>=20
> "

Yes, with
s/is/as/

--hlF7BslAQxVTFAPs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEKjmgACgkQnKSrs4Gr
c8hNDAgAhNjkIDEGL18Oik06vLGgvhiqvKL/aAzD0r5RBwF+kwgQVwgtNF6pJ3tP
53DrXjYNq1F7lsCzjHtPAlyu4vvWAAzcmfl2lHlUJvm90Mhx26KHmNTS+9YPm4+9
KuYFwzSI+E85JcZ1BL6OvVnaDU2AwBePvp8iFToqkhG8WPbSchM2WMBHRvvd0zo0
6oYI4WplpB5LiB0pO+u0ULMWsANK8ALtj2ifVXYla65qnElwWtXecChjNiBGTyK1
RBKyg2/5EZ+rpyb1WHBL+6PNEgOtpTqZWpJN5GpoCvoXlKq9FL1GupFGzhGGJrXl
NIIVpF/ZEvoyzKVEGh/dNWufV00SvA==
=+9rE
-----END PGP SIGNATURE-----

--hlF7BslAQxVTFAPs--

