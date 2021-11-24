Return-Path: <stefanha@redhat.com>
Date: Wed, 24 Nov 2021 15:36:52 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [virtio-comment] [PATCH v5 1/1] virtio-pmem: Support describing
 pmem as shared memory region
Message-ID: <YZ5cFOva0Er3IJYe@stefanha-x1.localdomain>
References: <20211110185555.190-1-tstark@linux.microsoft.com>
 <20211110185555.190-2-tstark@linux.microsoft.com>
 <87sfw37ymd.fsf@redhat.com>
 <YZ0Z/ks4ZoHHZRJK@stefanha-x1.localdomain>
 <87tug2kea1.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nauj5a142tnJqrvT"
Content-Disposition: inline
In-Reply-To: <87tug2kea1.fsf@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: tstark@linux.microsoft.com, virtio-comment@lists.oasis-open.org, grahamwo@microsoft.com, benhill@microsoft.com, tstark@microsoft.com, pankaj.gupta.linux@gmail.com
List-ID: <virtio-comment.lists.oasis-open.org>


--nauj5a142tnJqrvT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 23, 2021 at 05:49:58PM +0100, Cornelia Huck wrote:
> On Tue, Nov 23 2021, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>=20
> > On Thu, Nov 11, 2021 at 11:52:42AM +0100, Cornelia Huck wrote:
> >> On Wed, Nov 10 2021, tstark@linux.microsoft.com wrote:
> >>=20
> >> > From: Taylor Stark <tstark@microsoft.com>
> >> >
> >> > Update the virtio-pmem spec to add support for describing the pmem r=
egion as a
> >> > shared memory window. This is required to support virtio-pmem in Hyp=
er-V, since
> >> > Hyper-V only allows PCI devices to operate on memory ranges defined =
via BARs.
> >> > When using the virtio PCI transport, shared memory regions are descr=
ibed via
> >> > PCI BARs.
> >> >
> >> > Signed-off-by: Taylor Stark <tstark@microsoft.com>
> >> > ---
> >> >  conformance.tex | 14 ++++++++++++--
> >> >  virtio-pmem.tex | 40 +++++++++++++++++++++++++++++++++-------
> >> >  2 files changed, 45 insertions(+), 9 deletions(-)
> >>=20
> >> This looks good to me now.
> >
> > I noticed the patch uses "guest absolute address" instead of "physical
> > address". This terminology was fixed in the original pmem patch and I
> > guess the shared memory patch wasn't updated. Please don't use "guest".
>=20
> So s/guest absolute/physical/ ? That can be fixed as an editorial update
> on top.
>=20

Yes, please.

Stefan

--nauj5a142tnJqrvT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGeXBQACgkQnKSrs4Gr
c8hmjwf/YhC+pqiQug1UVbIf92EYnUG8bXE/iKAzEM1x7vhmP1tv70r6qtJqF0I/
Uv77f1TT+ooVluKjGNIgT3r1ePYJRsfo+NLZaaOFfzXPHCVRLOCAdPoHgb5E5gty
IUiUXho69ocMy0RqxRIh7/AFzHLtrXB/x/q1+W2Vc0Jq/1VTPPf/6konI8I1v+Al
Z6U2Sx1ZLwdsG8H1XLq+UhstIMMHp+StgRKVYNqK+h9pWraM1eVL3sLd7EOdiNSW
RXdxdSnDPbrrnqu3xJ6cHjWrftZpL2TMWy93ojPOeMuZRg8RRQW7fl/6JadwOGCo
7YCKNT/0U+qFGY20G+ZRWsbaLW8fAg==
=6WGG
-----END PGP SIGNATURE-----

--nauj5a142tnJqrvT--

