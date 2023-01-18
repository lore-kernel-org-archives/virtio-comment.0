Return-Path: <virtio-comment-return-3876-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EF35A986653
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Jan 2023 14:14:46 +0000 (UTC)
Date: Wed, 18 Jan 2023 09:14:41 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <Y8f+0fTh1KYXhXSC@fedora>
References: <961D315C9D3A523B+202301111121345064138@sudoinfotech.com>
 <Y77S5+YK31f6QKaN@fedora>
 <E0D19197FBCBB3B9+2023011710040633577713@sudoinfotech.com>
 <96c93361-1497-1eb2-7fcb-452696ae6a56@redhat.com>
 <202301171730174296359@sudoinfotech.com>
 <EE1B180C7FB41197+2023011717415699763014@sudoinfotech.com>
 <Y8a/8SH6sk3rgqcr@fedora>
 <CB1D0D0BB5D3E5E6+2023011810151168808928@sudoinfotech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="C0vD5Iyh0pUB1OV8"
Content-Disposition: inline
In-Reply-To: <CB1D0D0BB5D3E5E6+2023011810151168808928@sudoinfotech.com>
Subject: Re: Re: [virtio-comment] About adding a new device type virtio-nvme
To: =?utf-8?B?5L6v6Iux5LmQ?= <houyingle@sudoinfotech.com>
Cc: jasowang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>, virtio-comment <virtio-comment@lists.oasis-open.org>, Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>, sgarzare <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

--C0vD5Iyh0pUB1OV8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 18, 2023 at 10:15:12AM +0800, =E4=BE=AF=E8=8B=B1=E4=B9=90 wrote:
> On Tue, 17 Jan 2023 10:34:09 -0500, Stefan wrote:
> >On Tue, Jan 17, 2023 at 05:41:57PM +0800, =E4=BE=AF=E8=8B=B1=E4=B9=90 wr=
ote:
> >> On Tue, 17 Jan 2023 09:32:05 +0100=EF=BC=8CDavid wrote=EF=BC=9A
> >> >On 17.01.23 03:04, =E4=BE=AF=E8=8B=B1=E4=B9=90 wrote:
> >The two diagrams are quite similar. Did you want to highlight a
>=20
> >difference between the two approaches in the diagram?
>=20
> The biggest difference is the VFIO and vDPA frameworks. The vDPA (virtio =
data path acceleration) kernel framework
> is a pillar in productizing the end-to-end vDPA solution and it enables N=
IC vendors to integrate their vDPA NIC kernel=20
> drivers into the framework as part of their productization efforts.=C2=A0
> Detailed information reference=EF=BC=9Ahttps://www.redhat.com/en/blog/int=
roduction-vdpa-kernel-framework

For the sake of the argument, let's assume VFIO can't be used in your
situation so vDPA is required. The part I don't understand is which
specific NVMe features you need that virtio-blk lacks?

Stefan

--C0vD5Iyh0pUB1OV8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmPH/tEACgkQnKSrs4Gr
c8jiyggApsqne4isbriVovh7FmeB4FeFFTwke0igSZ9FFwa5YPmXAMiIZZNzH1sz
FICwLz3jyDDzK9jiKHdb7JZ1s/cjKjLrnj7w5IwY69OZtx85jB4+7aK//rLPfW+V
c+NVVqRf4pF8nzHOmEzj/Y8eUWMh890tCceyF0XQaMm/69v472dVrCl1f2hfs64A
g+EQvAxd1lwwz5XKNQLBB+AQ/JOJx880J5swqMlUjb7/qHklKSN/NXNPJ3NQSEhB
pBprM+tRJUZvLEiFzpbV99jrvKjrBBkY1wByrmvXoKb5P0KSUfSB+jEHeZKUqyse
C4yWweka4DpFybj52BxPq7+io6WSJw==
=JGiS
-----END PGP SIGNATURE-----

--C0vD5Iyh0pUB1OV8--

