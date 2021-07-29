Return-Path: <stefanha@redhat.com>
Date: Thu, 29 Jul 2021 09:48:59 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC PATCH v2 1/2] Add virtio Admin Virtqueue specification
Message-ID: <YQJrewVjjoSQeHWm@stefanha-x1.localdomain>
References: <20210726165254.8529-1-mgurtovoy@nvidia.com>
 <YP/ffFbeJpDJ3sTG@stefanha-x1.localdomain>
 <87im0v4yrj.fsf@redhat.com>
 <3657bbc8-3299-97a5-b45a-04030da35c51@nvidia.com>
 <YQEa1b2QfW05e0iZ@stefanha-x1.localdomain>
 <8c0b3927-0c10-e688-33f4-f9fa99f57f02@nvidia.com>
 <YQFev1vXVFLlvW0w@stefanha-x1.localdomain>
 <eedd595d-77b9-2921-bbcc-ced2618bccc9@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zz2jbwMVODeMzB2s"
Content-Disposition: inline
In-Reply-To: <eedd595d-77b9-2921-bbcc-ced2618bccc9@nvidia.com>
To: Max Gurtovoy <mgurtovoy@nvidia.com>
Cc: Cornelia Huck <cohuck@redhat.com>, virtio-comment@lists.oasis-open.org, mst@redhat.com, jasowang@redhat.com, oren@nvidia.com, parav@nvidia.com, shahafs@nvidia.com, eperezma@redhat.com, aadam@redhat.com, bodong@nvidia.com, amikheev@nvidia.com
List-ID: <virtio-comment.lists.oasis-open.org>


--zz2jbwMVODeMzB2s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 28, 2021 at 05:20:29PM +0300, Max Gurtovoy wrote:
> On 7/28/2021 4:42 PM, Stefan Hajnoczi wrote:
> > On Wed, Jul 28, 2021 at 01:59:26PM +0300, Max Gurtovoy wrote:
> > > On 7/28/2021 11:52 AM, Stefan Hajnoczi wrote:
> > > > On Tue, Jul 27, 2021 at 06:29:49PM +0300, Max Gurtovoy wrote:
> > > > > On 7/27/2021 5:28 PM, Cornelia Huck wrote:
> > > > > > On Tue, Jul 27 2021, Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
> > > > > > > On Mon, Jul 26, 2021 at 07:52:53PM +0300, Max Gurtovoy wrote:
> > > > > > How many different (groups of) commands can we reasonably expec=
t? Do we
> > > > > > need a generic discovery command, or can we get away with a fea=
ture bit
> > > > > > covering each new group of commands?
> > > > > I can't predict the future but IMO we need a discovery command.
> > > > >=20
> > > > > We have many devices and more can be added in the future.
> > > > A <u8 class, u8 command> space is 65536 bits or 8KB. I think admin
> > > > commands would not be included in VIRTIO Feature Bits but instead
> > > > reported via a separate admin command that returns up to 8KB of dat=
a:
> > > >=20
> > > >     struct virtio_admin_report_cmds {
> > > >         /* Bitmap of available admin commands [Device->Driver]
> > > >          * bool command_present =3D
> > > >          *        command_bits[class * 32 + command / 8] & (command=
 % 8);
> > > >          */
> > > >         u8 command_bits[8192];
> > > >     };
> > > Yes, I divided it to multiple commands per class to cover the case we=
 will
> > > need more than 1 bit to describe a command.
> > >=20
> > > But I guess we can add it later on.
> > >=20
> > > I think the above should be:
> > >=20
> > > bool command_present =3D command_bits[class * 32 + command / 8] & (1 =
<< (command % 8));
> > >=20
> > > isn't it ?
> > You're right. I forgot to shift the bit :D.
> >=20
> > > Also what do you think about renaming <class, command> to <opcode, op=
mod> ?
> > I need to understand how opcode and opmod values are used. I'm not sure.
>=20
> Same as class and command just with different naming.

Is opcode the same as command? What does opmod do?

Stefan

--zz2jbwMVODeMzB2s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmECa3oACgkQnKSrs4Gr
c8hKdQf+JsmjgE+HM4HubAVi0RMx2OpMRYDYzlD4rxRvgZIh8IhM58A5di7Kf5N5
rL2WvzViQdq2t9br0124UR8LMzfFoTe24DIEGJWGeeWc8P5h2p+66DAuXA7g61/H
Q6n0YoT0VvyndXj78mPVmHyT2tRv88v1oPysJYVJyjQ2DRY7hHiXY1sxS1gRcGvY
Iv//lrAwy0BQ3r8BJ/930NHRwxeO0m51CNbXxHSvutszb5xhyoSY625XJH6c2O4G
u+urhQrbdrf7MNk/9v3hMQnImUg6TFi6UQM56vtYRiVYgk2N5z4B9Z8C2lmjOw4D
UWDVeyWJtwDM7qS6VVRKzSmaA1Ivlg==
=a4/r
-----END PGP SIGNATURE-----

--zz2jbwMVODeMzB2s--

