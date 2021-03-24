Return-Path: virtio-comment-return-1789-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7C511986574
	for <virtio-comment@lists.oasis-open.org>; Wed, 24 Mar 2021 09:39:00 +0000 (UTC)
Date: Wed, 24 Mar 2021 09:38:52 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <YFsIrC6KigOjFxli@stefanha-x1.localdomain>
References: <20210322034717.35135-1-jasowang@redhat.com>
 <20210322034717.35135-2-jasowang@redhat.com>
 <YFnCpdO4F9zkTjd9@stefanha-x1.localdomain>
 <be5b2622-f676-ddf0-2261-837e348c8a96@redhat.com>
MIME-Version: 1.0
In-Reply-To: <be5b2622-f676-ddf0-2261-837e348c8a96@redhat.com>
Subject: Re: [virtio-comment] [PATCH V2 1/2] virtio: introduce virtqueue
 state as basic facility
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sCOlMpZDG261hWbm"
Content-Disposition: inline
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

--sCOlMpZDG261hWbm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 24, 2021 at 04:15:55PM +0800, Jason Wang wrote:
> =E5=9C=A8 2021/3/23 =E4=B8=8B=E5=8D=886:27, Stefan Hajnoczi =E5=86=99=E9=
=81=93:
> > On Mon, Mar 22, 2021 at 11:47:16AM +0800, Jason Wang wrote:
> > > +The \field{used_wrap_counter} field is the wrap counter that is used
> > > +by the device.
> > > +
> > > +The used state is unnecessary when VIRTIO_RING_F_PACKED is not
> > > +negotiated.
> > > +
> > > +See also \ref{sec:Packed Virtqueues / Driver and Device Ring Wrap Co=
unters}.
> > > +
> > > +\drivernormative{\subsection}{Virtqueue State}{Basic Facilities of a=
 Virtio Device / Virtqueue State}
> > > +
> > > +If VIRTIO_F_QUEUE_STATE has been negotiated, a driver MUST set the
> > > +state of each virtqueue after setting the FEATURE_OK status bit but
> > > +before setting the DRIVER_OK status bit.
> > > +
> > > +If VIRTIO_F_QUEUE_STATE has been negotiated. a driver MUST reset the
> > s/negotiated./negotiated,/
> >=20
> > > +device before getting the virtqueue state.
> > Interesting approach, but it makes sense that the device must be stoppe=
d
> > before we mess with the queue state :).
> >=20
> > I wonder whether requiring the device to keep state across reset will
> > cause issues in the future or for testing/fuzzing.
> >=20
> > Another approach would have been to add a new status register bit for
> > pausing the device. That reminds me of vhost.
>=20
>=20
> That's the way I did here:
> https://lists.oasis-open.org/archives/virtio-comment/202012/msg00027.html

That design seems less risky. I think modifying the semantics of device
reset might end up being a problem. Defining an explicit paused state
for saving/loading state seems cleaner.

Why did you end up switching approaches?

Stefan

--sCOlMpZDG261hWbm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBbCKsACgkQnKSrs4Gr
c8jOfgf8Duv9iYoZ4ZPRYpkGHIbf0hoYr4F4Yf/+EhYtTsGL/Xxe9UiRKmsDIHbt
bbW/nVOMWAUJyLjjYsbsGOMuJmAugrb0qBbmTgjQQ927BjQybjfJU+g5AIVIVmkY
7sF1PCdtcR66gjAtiEccacPjhlmuLLqV3IsVXBTaWfiTWxPdzWw7kA14xknIyc49
L/+lBq8nXeUvnPjtJV4CxFFuwQ8rgdG5OX3JUMt7ywnhz8ZU7j9DIL8pS9Td1RXs
eW+FxFrTubRN8a/9ccd3zDUDFCAkmmMmFCcQ3GyML+vLmK47X6Keam5JL7toYw7y
l6TVZG5FQpdaJavS5pRJFfKiTwxWAg==
=PAyU
-----END PGP SIGNATURE-----

--sCOlMpZDG261hWbm--

