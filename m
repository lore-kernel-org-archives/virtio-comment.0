Return-Path: virtio-comment-return-913-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7D182985E61
	for <virtio-comment@lists.oasis-open.org>; Tue, 12 Nov 2019 10:29:34 +0000 (UTC)
Date: Tue, 12 Nov 2019 10:29:29 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20191112102929.GD463128@stefanha-x1.localdomain>
References: <CA+dKekBHdNgwJJoqvLq5MdVG1ZHWMbyCKfOG8wFODqCW3t5Hkg@mail.gmail.com>
 <20191111113410.GF442334@stefanha-x1.localdomain>
 <CA+dKekDZsJXd_xhmWFtSypncBRe_CZBxSmK8J5Orn3vMPkHVUg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+dKekDZsJXd_xhmWFtSypncBRe_CZBxSmK8J5Orn3vMPkHVUg@mail.gmail.com>
Subject: Re: [virtio-comment] Formal specification of virtIO
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rqzD5py0kzyFAOWN"
Content-Disposition: inline
To: Matias Vara <matiasevara@gmail.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

--rqzD5py0kzyFAOWN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2019 at 08:07:06PM +0100, Matias Vara wrote:
> On Mon, 11 Nov 2019 at 12:34, Stefan Hajnoczi <stefanha@redhat.com> wrote=
:
>=20
> > On Sun, Nov 10, 2019 at 03:33:20PM +0100, Matias Vara wrote:
> > > I have started to think of the formalization of the virtIO specificat=
ion.
> > > Roughly speaking, I could use a formal language to "code" the virtIO
> > spec.
> > > As far as I can think, this has three benefits:
> > > 1. You can validate any implementation.
> > > 2. You can generate the implementation for a given target. For exampl=
e,
> > you
> > > could be able to generate the implementation of a virtIO device in VH=
DL.
> > > 3. You can provide simulation and verification before any implementat=
ion.
> > > In automotive, this is interesting because you ease the certification=
 so
> > > formalization pays off.
> > >
> > > Do you think this may be interesting work to do to become the virtIO
> > > specification more robust?
> >
> > As a starting point you could propose a formal model of an aspect of th=
e
> > specification, like the device lifecycle VIRTIO_CONFIG_S_* status
> > register state machine (start easy!).
> >
> > It would already offer the advantages you mentioned for a subset of the
> > specification and give the community a chance to get familiar with the
> > tools and workflow.
> >
> > Even if it turns out to be impractical to formalize the entire VIRTIO
> > specification, it will certainly reveal things that can be improved in
> > the current spec.
> >
> > Stefan
> >
>=20
> Thanks for the comments. First, I would capture data structures by using =
a
> metamodel. This would allow generating the structures depending on the
> target language, e.g., C, Rust, Latex. To do this, it is needed a
> model-to-text transformation. Then, I would base on a subset of the
> specification to describe the behavior by using a formal language. The
> VIRTIO_CONFIG_S_* status register state machine may be a good candidate f=
or
> starting. I will keep you updated on the progress.

By the way, the virtqueue is the most interesting aspect of VIRTIO.
Formalizing the split and packed virtqueue layouts would do the most to
ensure correctness.  They are non-trivial though :).

Stefan

--rqzD5py0kzyFAOWN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl3KiYkACgkQnKSrs4Gr
c8jlNggAqQvCz5NPO+LGp4C+oRMp3pNPF+s/kxSv2nphASpNCg28L+cr62QCuACE
qw/VmHlcnJhiFzVo3eqYgyo18lwCRgFwHiHXRCtELJnozfNJJjwcb5Y9cqW4JySy
eJw0cXSFNdF1wwZjQ3qPa2t3O4LGhIPrevYFTfdukCi57UndwIAzjRuc6zjk3I0N
BgGUwwZmnRxjA1T91KOgv2sJgFUk9QtPniIXKbfrSO7Lo2mEG8icNh07Nd2Zoeeg
NErUe1pHabc7v/kC/Lxpkm5X2efP6iDpv4HcoiWTHe2R14oCc+NqPra6rxgvU3xV
j/NqousTJWgGMJJ7wz0EdOZ8wDi8aQ==
=VKXa
-----END PGP SIGNATURE-----

--rqzD5py0kzyFAOWN--

