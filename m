Return-Path: virtio-comment-return-1796-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E89459865CD
	for <virtio-comment@lists.oasis-open.org>; Thu, 25 Mar 2021 09:59:37 +0000 (UTC)
Date: Thu, 25 Mar 2021 09:59:30 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <YFxfApEcJUaMJC6F@stefanha-x1.localdomain>
References: <20210322034717.35135-1-jasowang@redhat.com>
 <20210322034717.35135-2-jasowang@redhat.com>
 <YFnCpdO4F9zkTjd9@stefanha-x1.localdomain>
 <be5b2622-f676-ddf0-2261-837e348c8a96@redhat.com>
 <YFsIrC6KigOjFxli@stefanha-x1.localdomain>
 <2274873f-68a3-0d4b-8bd4-0fca77dffcb1@redhat.com>
MIME-Version: 1.0
In-Reply-To: <2274873f-68a3-0d4b-8bd4-0fca77dffcb1@redhat.com>
Subject: Re: [virtio-comment] [PATCH V2 1/2] virtio: introduce virtqueue
 state as basic facility
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JECL6nQHZd9mejcg"
Content-Disposition: inline
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

--JECL6nQHZd9mejcg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 25, 2021 at 10:42:38AM +0800, Jason Wang wrote:
>=20
> =E5=9C=A8 2021/3/24 =E4=B8=8B=E5=8D=885:38, Stefan Hajnoczi =E5=86=99=E9=
=81=93:
> > On Wed, Mar 24, 2021 at 04:15:55PM +0800, Jason Wang wrote:
> > > =E5=9C=A8 2021/3/23 =E4=B8=8B=E5=8D=886:27, Stefan Hajnoczi =E5=86=99=
=E9=81=93:
> > > > On Mon, Mar 22, 2021 at 11:47:16AM +0800, Jason Wang wrote:
> > > > > +The \field{used_wrap_counter} field is the wrap counter that is =
used
> > > > > +by the device.
> > > > > +
> > > > > +The used state is unnecessary when VIRTIO_RING_F_PACKED is not
> > > > > +negotiated.
> > > > > +
> > > > > +See also \ref{sec:Packed Virtqueues / Driver and Device Ring Wra=
p Counters}.
> > > > > +
> > > > > +\drivernormative{\subsection}{Virtqueue State}{Basic Facilities =
of a Virtio Device / Virtqueue State}
> > > > > +
> > > > > +If VIRTIO_F_QUEUE_STATE has been negotiated, a driver MUST set t=
he
> > > > > +state of each virtqueue after setting the FEATURE_OK status bit =
but
> > > > > +before setting the DRIVER_OK status bit.
> > > > > +
> > > > > +If VIRTIO_F_QUEUE_STATE has been negotiated. a driver MUST reset=
 the
> > > > s/negotiated./negotiated,/
> > > >=20
> > > > > +device before getting the virtqueue state.
> > > > Interesting approach, but it makes sense that the device must be st=
opped
> > > > before we mess with the queue state :).
> > > >=20
> > > > I wonder whether requiring the device to keep state across reset wi=
ll
> > > > cause issues in the future or for testing/fuzzing.
> > > >=20
> > > > Another approach would have been to add a new status register bit f=
or
> > > > pausing the device. That reminds me of vhost.
> > >=20
> > > That's the way I did here:
> > > https://lists.oasis-open.org/archives/virtio-comment/202012/msg00027.=
html
> > That design seems less risky. I think modifying the semantics of device
> > reset might end up being a problem. Defining an explicit paused state
> > for saving/loading state seems cleaner.
> >=20
> > Why did you end up switching approaches?
>=20
>=20
> I try to seek some short-cut withut introducing new status bit but I end =
up
> realizing it might not work as expected.
>=20
> Another reason is that, by using new status bit, we need to ability to
> resume the device by clearing the bit which is somehow conflict with what
> spec requries:
>=20
> "
>=20
> 2.1.1 Driver Requirements: Device Status Field
>=20
> The driver MUST NOT clear adevice statusbit.
>=20
> "
>=20
> Maybe we can have an exception for the device stop/pause in this case.

Yes, I think that is simply because the VIRTIO device lifecycle never
needed to go back to a previous lifecycle state. It was a unidirectional
state machine.

The device stop/pause state seems like a valid case of going back to a
previous lifecycle state and I don't think it breaks anything in the
device model.

Stefan

--JECL6nQHZd9mejcg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBcXwIACgkQnKSrs4Gr
c8hrGwf/Wbav5J0D1zoC0d5a0BSot5dSmO4R0Lcs4JFPeuq1FhZZQ9GwhLZJBteo
FWhN2bl4D0jpcdIyqr7dK49nca0FJkU6WNVHVQZI+a7NSfvyX/bJTskjdb1w1MVL
oVy+LdIWoKsYL/TnmdzQ8BIC1DCcitPP93TF6/tjLqy1MVEJupeoKOCCUER1rjzM
9vPAzxYLpqm+vwrloRqF3XNRb0POPBf8so/sqvQnI7gl++CU9qKL+4chwlgNhQ8A
LW50ncZwSSfB2GUg6gGfPqdQeQYwCCfM5vaxdzIImCUpSHkZMByinb8DJtV2QKDX
wv6RJUaXI4djGj1kMeFLqxZpeuOFtw==
=dz0b
-----END PGP SIGNATURE-----

--JECL6nQHZd9mejcg--

