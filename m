Return-Path: <stefanha@redhat.com>
Date: Wed, 28 Jul 2021 09:25:38 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [virtio-comment] Re: [RFC PATCH v2 2/2] virtio-blk: add support
 for VIRTIO_F_ADMIN_VQ
Message-ID: <YQEUgm8VTj6UpQL+@stefanha-x1.localdomain>
References: <20210726165254.8529-1-mgurtovoy@nvidia.com>
 <20210726165254.8529-2-mgurtovoy@nvidia.com>
 <YP/6/5Dw38qXPGHd@stefanha-x1.localdomain>
 <e64d3167-2673-2e03-a1e4-d1819522d345@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xNLBh2n5OTuQuQb/"
Content-Disposition: inline
In-Reply-To: <e64d3167-2673-2e03-a1e4-d1819522d345@nvidia.com>
To: Max Gurtovoy <mgurtovoy@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, mst@redhat.com, jasowang@redhat.com, cohuck@redhat.com, oren@nvidia.com, parav@nvidia.com, shahafs@nvidia.com, eperezma@redhat.com, aadam@redhat.com, bodong@nvidia.com, amikheev@nvidia.com
List-ID: <virtio-comment.lists.oasis-open.org>


--xNLBh2n5OTuQuQb/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 27, 2021 at 07:08:52PM +0300, Max Gurtovoy wrote:
>=20
> On 7/27/2021 3:24 PM, Stefan Hajnoczi wrote:
> > On Mon, Jul 26, 2021 at 07:52:54PM +0300, Max Gurtovoy wrote:
> > > Set the relevant index in case of VIRTIO_F_ADMIN_VQ negotiation. Also
> > > restrict the negotiation of VIRTIO_F_ADMIN_VQ to be possible only if
> > > VIRTIO_BLK_F_MQ is negotiated.
> > >=20
> > > Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
> > > ---
> > >   content.tex | 16 ++++++++++++++++
> > >   1 file changed, 16 insertions(+)
> > >=20
> > > diff --git a/content.tex b/content.tex
> > > index d350175..03e25da 100644
> > > --- a/content.tex
> > > +++ b/content.tex
> > > @@ -4406,6 +4406,16 @@ \subsection{Virtqueues}\label{sec:Device Types=
 / Block Device / Virtqueues}
> > >    N=3D1 if VIRTIO_BLK_F_MQ is not negotiated, otherwise N is set by
> > >    \field{num_queues}.
> > > + If VIRTIO_F_ADMIN_VQ is negotiated, queue0 is an admin virtqueue an=
d the
> > > + request queues are shifted as the following:
> > "as follows:"
> >=20
> > > +\begin{description}
> > > +\item[1] requestq1
> > > +\item[\ldots]
> > > +\item[N] requestqN
> > > +\end{description}
> > > +
> > > + if VIRTIO_BLK_F_MQ is not negotiated, VIRTIO_F_ADMIN_VQ MUST NOT be
> > > + negotiated.
> > Why?
>=20
> To distinguish between adminq and requestq.

I don't see a conflict between VIRTIO_BLK_F_MQ and VIRTIO_F_ADMIN_VQ.
VIRTIO_BLK_F_MQ just indicates to the driver that it can fetch the
num_queues device configuration field for the number of request queues.

In the case where VIRTIO_F_ADMIN_VQ is negotiated but VIRTIO_BLK_F_MQ is
not negotiated the device's virtqueue layout is still:
1. Admin queue
2. requestq1
=2E..
N+1. requestqN

The driver will probably only initialize the admin queue and requestq1.

Stefan

--xNLBh2n5OTuQuQb/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEBFIEACgkQnKSrs4Gr
c8gMAwf/WQuWRE6mW6zJvUrSnb6kBxyw5DNOfBul6GvcY3ZMlXQsR3tMy4mF3Iat
dac22/JQJls13Q/ykNd5s9vvqTaoORcr8OFC9IsA2aE2abDhHARJrCtRxJJg6lC/
yRT7x9OQZ6zscgwdNwpCYE3Ht00BddtNHKb4WtV1sOpP2SA1fUDQ8zslDilwfVdo
ABdXDfiT5DYWyVJM2ckF5vGSCX0mYTzzXKJBs7c4Xb5J+xE4zDQxbc4pydROCtQ/
cpKpr/K6kGc1BHgc1JonDywJayBkyEa9QD3Ok+VDdbzu3FckGHY5+0LcJ9kBb779
HPTxNGM4qSPDJnTsNxPLY8odZKrshw==
=kBmp
-----END PGP SIGNATURE-----

--xNLBh2n5OTuQuQb/--

