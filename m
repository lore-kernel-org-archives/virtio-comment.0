Return-Path: virtio-comment-return-906-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2222F985D79
	for <virtio-comment@lists.oasis-open.org>; Mon, 11 Nov 2019 11:34:15 +0000 (UTC)
Date: Mon, 11 Nov 2019 11:34:10 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20191111113410.GF442334@stefanha-x1.localdomain>
References: <CA+dKekBHdNgwJJoqvLq5MdVG1ZHWMbyCKfOG8wFODqCW3t5Hkg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+dKekBHdNgwJJoqvLq5MdVG1ZHWMbyCKfOG8wFODqCW3t5Hkg@mail.gmail.com>
Subject: Re: [virtio-comment] Formal specification of virtIO
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gneEPciiIl/aKvOT"
Content-Disposition: inline
To: Matias Vara <matiasevara@gmail.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

--gneEPciiIl/aKvOT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 10, 2019 at 03:33:20PM +0100, Matias Vara wrote:
> I have started to think of the formalization of the virtIO specification.
> Roughly speaking, I could use a formal language to "code" the virtIO spec=
.
> As far as I can think, this has three benefits:
> 1. You can validate any implementation.
> 2. You can generate the implementation for a given target. For example, y=
ou
> could be able to generate the implementation of a virtIO device in VHDL.
> 3. You can provide simulation and verification before any implementation.
> In automotive, this is interesting because you ease the certification so
> formalization pays off.
>=20
> Do you think this may be interesting work to do to become the virtIO
> specification more robust?

As a starting point you could propose a formal model of an aspect of the
specification, like the device lifecycle VIRTIO_CONFIG_S_* status
register state machine (start easy!).

It would already offer the advantages you mentioned for a subset of the
specification and give the community a chance to get familiar with the
tools and workflow.

Even if it turns out to be impractical to formalize the entire VIRTIO
specification, it will certainly reveal things that can be improved in
the current spec.

Stefan

--gneEPciiIl/aKvOT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl3JRzIACgkQnKSrs4Gr
c8iRUgf9HzVHDyy3BSnkBzmd3DLDnM204qUN1SxrQ0lRKN8LwOJyiUra93ytxwnN
cTms3XWk4gps/dgPkpxLoUebCP7VFLExlikb6gB1Norw+SKxyd/TCm5s9bp6JqC4
qtTU/9YoV8PL9D+vYSEJdgz2uNnRD4AbtFrex3f9YyjWesDniOBHnBRFlkAoC43J
Nm39D9VmfE8Qt/51mTwkjCbYgOddxj+BFWZ+nFhVNbeZGkX2JddGEDOLg1f8OqPq
nXm8F7JBVfgftnAnPNB91scbdNVhmFnoYMxeki7WfNmm7C7lGA1gg7vLJ0UMJ4nO
8ERgwaS5OMqaF1Cfxvqepa6iwR4fpg==
=k43w
-----END PGP SIGNATURE-----

--gneEPciiIl/aKvOT--

