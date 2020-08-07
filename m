Return-Path: virtio-comment-return-1385-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B7EC9985E71
	for <virtio-comment@lists.oasis-open.org>; Fri,  7 Aug 2020 13:18:55 +0000 (UTC)
Date: Fri, 7 Aug 2020 14:18:48 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20200807131848.GC609387@stefanha-x1.localdomain>
References: <20200724154251.12546-1-alex.bennee@linaro.org>
 <20200724154251.12546-7-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20200724154251.12546-7-alex.bennee@linaro.org>
Subject: [virtio-comment] Re: [PATCH  v2 6/7] introduction.tex: introduce a glossary of terms
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zCKi3GIZzVBPywwA"
Content-Disposition: inline
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: virtio-comment@lists.oasis-open.org, Nikos Dragazis <ndragazis@arrikto.com>
List-ID: <virtio-comment.lists.oasis-open.org>

--zCKi3GIZzVBPywwA
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 24, 2020 at 04:42:50PM +0100, Alex Benn=E9e wrote:
> +\subsection{Glossary}\label{intro:Glossary}
> +
> +The following are definitions of common terms used throughout the specif=
ication.
> +
> +\begin{description}
> +\item[Device] The series of configuration, control and operation
> +  mechanisms that make a Virtio device. The implementation details of

This definition is self-referential.

How about:

  The embodiment of a device type consisting of configuration space,
  virtqueues, and a transport.

This also requires defining "device type":

  A set of configuration space and virtqueue structure definitions that
  offer I/O functionality.

> +  the device should be transparent to the Driver.

I'm not sure about this "should" statement. Maybe this concept can be
worked into the first sentence or dropped. "May", "can", "should",
"must" are only used in the normative spec sections.

--zCKi3GIZzVBPywwA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl8tVLgACgkQnKSrs4Gr
c8gGxQf+IPX8OTCNOzUGex/3JumyL3p8Bswdi/8kPk5Kpzsdf4Td6V3dANWW1m57
Jd/BaKzQBg0u68pqstvMZU0JSyFhaxbrb4sHspLapGe5Kb/DsNrw8APPD6RZwy15
Fhd45zDIzX2iLAjBI/8Ai9Z6IQLbqWNgCIXCp+cxisU2sYmNw49TO4y/VsTguf1X
P3qLiMxYilm2sc+mz9PYvsjiLDqtSLNN/czlYcRTHKdEaz6XCUG1NE+eqO27ovWI
vawpaxVYDlzQwxNJ/9Y/dtSb5IgDqBnKCaFTMcuornyBeYFi2BOmg7GzTxprFDpO
6sXn20o8Vacda6/YEZlXJkH+v/TmRw==
=L6Ty
-----END PGP SIGNATURE-----

--zCKi3GIZzVBPywwA--

