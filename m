Return-Path: <stefanha@redhat.com>
Date: Tue, 23 Nov 2021 16:42:38 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [virtio-comment] [PATCH v5 1/1] virtio-pmem: Support describing
 pmem as shared memory region
Message-ID: <YZ0Z/ks4ZoHHZRJK@stefanha-x1.localdomain>
References: <20211110185555.190-1-tstark@linux.microsoft.com>
 <20211110185555.190-2-tstark@linux.microsoft.com>
 <87sfw37ymd.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0JqTLPEkWxDAIEAP"
Content-Disposition: inline
In-Reply-To: <87sfw37ymd.fsf@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: tstark@linux.microsoft.com, virtio-comment@lists.oasis-open.org, grahamwo@microsoft.com, benhill@microsoft.com, tstark@microsoft.com, pankaj.gupta.linux@gmail.com
List-ID: <virtio-comment.lists.oasis-open.org>


--0JqTLPEkWxDAIEAP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 11, 2021 at 11:52:42AM +0100, Cornelia Huck wrote:
> On Wed, Nov 10 2021, tstark@linux.microsoft.com wrote:
>=20
> > From: Taylor Stark <tstark@microsoft.com>
> >
> > Update the virtio-pmem spec to add support for describing the pmem regi=
on as a
> > shared memory window. This is required to support virtio-pmem in Hyper-=
V, since
> > Hyper-V only allows PCI devices to operate on memory ranges defined via=
 BARs.
> > When using the virtio PCI transport, shared memory regions are describe=
d via
> > PCI BARs.
> >
> > Signed-off-by: Taylor Stark <tstark@microsoft.com>
> > ---
> >  conformance.tex | 14 ++++++++++++--
> >  virtio-pmem.tex | 40 +++++++++++++++++++++++++++++++++-------
> >  2 files changed, 45 insertions(+), 9 deletions(-)
>=20
> This looks good to me now.

I noticed the patch uses "guest absolute address" instead of "physical
address". This terminology was fixed in the original pmem patch and I
guess the shared memory patch wasn't updated. Please don't use "guest".

Stefan

--0JqTLPEkWxDAIEAP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGdGf4ACgkQnKSrs4Gr
c8gZdgf+OyoaVEltTDadwkolm0rt+H4+4kBEZqZg8k2yjk+keN7GBAtWRmzcb51Y
7oPgvjl7XpvRIti7w3zsr8VuuM2qpWefgyM0wxZxLOC8xp9JHANNe4qzV+O+QPFQ
5MH9nV2Y3Kl26UGREMYTvQdhuDaM5TtxeC3a6VgQNvS6XH0ksjq3YnPpPTrD6kip
Hum6Chs7y1gMZ/FVVgSoILhIU5dl/cxofEzPnChyHB4KJmOa4v2IdoLyaXGyXiJA
lX5dMpinkctScChDWb8+gAIivKI7j0l4C3fCl1pD4CHXcrbaaDpk7v6fJ735QP71
LV5YBUF25s7ONW/Wu+Jgh/yFCyYPog==
=Blem
-----END PGP SIGNATURE-----

--0JqTLPEkWxDAIEAP--

