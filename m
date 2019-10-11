Return-Path: virtio-comment-return-859-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8F2F2985DBE
	for <virtio-comment@lists.oasis-open.org>; Fri, 11 Oct 2019 08:19:35 +0000 (UTC)
Date: Fri, 11 Oct 2019 09:19:29 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20191011081929.GB12360@stefanha-x1.localdomain>
References: <20190923161414.9129-1-eperezma@redhat.com>
 <20191009172920.GE13568@stefanha-x1.localdomain>
 <CAJaqyWehqbkk+jBc_SdauJEUOEHHxcapFeVWHxDqe7zc1wCUvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="O5XBE6gyVG5Rl6Rj"
Content-Disposition: inline
In-Reply-To: <CAJaqyWehqbkk+jBc_SdauJEUOEHHxcapFeVWHxDqe7zc1wCUvQ@mail.gmail.com>
Subject: Re: [virtio-comment] [PATCH v2] block: Add multiqueue
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, "Michael S. Tsirkin" <mst@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

--O5XBE6gyVG5Rl6Rj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2019 at 10:28:20AM +0200, Eugenio Perez Martin wrote:
> Github issue created:
>=20
> https://github.com/oasis-tcs/virtio-spec/issues/50

Michael: I think this issue is ready for a ballot.

Stefan

>=20
> Thanks!
>=20
> On Wed, Oct 9, 2019 at 7:29 PM Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
> >
> > On Mon, Sep 23, 2019 at 06:14:14PM +0200, Eugenio P=E9rez wrote:
> > > The spec miss that field. Add the field, some description around.
> > >
> > > I've followed the network device's multiqueue mentions, and copied /
> > > adapted when needed.
> > >
> > > v2: Delete implementation detail about CPUs used.
> > >
> > > Signed-off-by: Eugenio P=E9rez <eperezma@redhat.com>
> > > ---
> > >  content.tex | 23 +++++++++++++++++++----
> > >  1 file changed, 19 insertions(+), 4 deletions(-)
> >
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> >
> > Please create a GitHub Issue proposing a vote for this patch:
> > https://github.com/oasis-tcs/virtio-spec/issues/

--O5XBE6gyVG5Rl6Rj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl2gOxEACgkQnKSrs4Gr
c8j4cgf/Q9V8Lwa9Zsul2iuWc3Y9oCkR1do6o+AI1y61GTiSXibSbZYI1DoHDPVh
KehYC5cHRZ4WBiZmRF0WSFWuHi71Q9SuZfX42OG/AMuK3MC5tdxHUYbAvGRb/urk
0f36HraTbb8Ov5HshmW3++RAX/nfva8fMdHMZ2RYtb1fG0T0RIdSPDGR3b//XaiB
E+roaMAVs2L29tNaZ+vyAS6KFP3wugNDthmBpGIMTX96DrpCYNYBari0Q9dwejY5
MFyRp3TOj+j0iQjUcJK/18uyTgYe8RnGVBBuNExcEA8H3NKdXwdJj4VXbWerAERA
CHZm+AwuEoYZAqSV1zrlirHrBtoHMw==
=E+UH
-----END PGP SIGNATURE-----

--O5XBE6gyVG5Rl6Rj--
