Return-Path: <virtio-comment-return-3888-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5A30A986671
	for <virtio-comment@lists.oasis-open.org>; Thu, 19 Jan 2023 16:59:58 +0000 (UTC)
Date: Thu, 19 Jan 2023 11:59:51 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <Y8l3B61V1nGOYA+u@fedora>
References: <961D315C9D3A523B+202301111121345064138@sudoinfotech.com>
 <Y77S5+YK31f6QKaN@fedora>
 <E0D19197FBCBB3B9+2023011710040633577713@sudoinfotech.com>
 <96c93361-1497-1eb2-7fcb-452696ae6a56@redhat.com>
 <202301171730174296359@sudoinfotech.com>
 <EE1B180C7FB41197+2023011717415699763014@sudoinfotech.com>
 <Y8a/8SH6sk3rgqcr@fedora>
 <CB1D0D0BB5D3E5E6+2023011810151168808928@sudoinfotech.com>
 <Y8f+0fTh1KYXhXSC@fedora>
 <c85a2341-2402-cc2c-9c8e-2d2dc1cb6876@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PvAyYKQMnf7CylXt"
Content-Disposition: inline
In-Reply-To: <c85a2341-2402-cc2c-9c8e-2d2dc1cb6876@redhat.com>
Subject: Re: [virtio-comment] About adding a new device type virtio-nvme
To: Jason Wang <jasowang@redhat.com>
Cc: =?utf-8?B?5L6v6Iux5LmQ?= <houyingle@sudoinfotech.com>, David Hildenbrand <david@redhat.com>, virtio-comment <virtio-comment@lists.oasis-open.org>, Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>, sgarzare <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

--PvAyYKQMnf7CylXt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 19, 2023 at 11:40:02AM +0800, Jason Wang wrote:
>=20
> =E5=9C=A8 2023/1/18 22:14, Stefan Hajnoczi =E5=86=99=E9=81=93:
> > On Wed, Jan 18, 2023 at 10:15:12AM +0800, =E4=BE=AF=E8=8B=B1=E4=B9=90 w=
rote:
> > > On Tue, 17 Jan 2023 10:34:09 -0500, Stefan wrote:
> > > > On Tue, Jan 17, 2023 at 05:41:57PM +0800, =E4=BE=AF=E8=8B=B1=E4=B9=
=90 wrote:
> > > > > On Tue, 17 Jan 2023 09:32:05 +0100=EF=BC=8CDavid wrote=EF=BC=9A
> > > > > > On 17.01.23 03:04, =E4=BE=AF=E8=8B=B1=E4=B9=90 wrote:
> > > > The two diagrams are quite similar. Did you want to highlight a
> > > > difference between the two approaches in the diagram?
> > > The biggest difference is the VFIO and vDPA frameworks. The vDPA (vir=
tio data path acceleration) kernel framework
> > > is a pillar in productizing the end-to-end vDPA solution and it enabl=
es NIC vendors to integrate their vDPA NIC kernel
> > > drivers into the framework as part of their productization efforts.
> > > Detailed information reference=EF=BC=9Ahttps://www.redhat.com/en/blog=
/introduction-vdpa-kernel-framework
> > For the sake of the argument, let's assume VFIO can't be used in your
> > situation so vDPA is required. The part I don't understand is which
> > specific NVMe features you need that virtio-blk lacks?
>=20
>=20
> I can think one:
>=20
> Avoid guest application migration from NVMe to virtio-blk?

To get the best fidelity in that situation NVMe PCI would be the natural
choice. For example, if the application is SPDK then it won't just work
with virtio-nvme because it has a userspace NVMe PCI driver.

There might be applications that break when moving from NVMe to
virtio-blk but don't depend on NVMe PCI, but it seems like a very niche
case.

Most applications don't use NVMe directly or if they do, then they speak
NVMe PCI or NVME over TCP directly, so they won't work with virtio-nvme.

Stefan

--PvAyYKQMnf7CylXt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmPJdwcACgkQnKSrs4Gr
c8geXwf/Tfr1JhltLtmW5SwLFTB8ZGt7dJPi3DWYgbreIaFqrCucxerv9lo3SAkl
6u0/XlKVzS+I4KJsISVmGn8Vr4DVKLT3vbM7rv5bRol5R8HJe682jVpMq3iNSdVQ
vdacB6hVxZdcU/2dEqu7AHm+/5V4HXS7oNUikvczU+kwL0IN7g015j0HWlpqp9xz
8Kr56m7k8KhULpsW9Y4T2zVm7tLOqvg9IF6Nkd9AB5Z4SW8yttWhBnzsM1WJ6fNo
j/Nz5RwPZPVm0HU3a1z+8BZBbzH5Y7UfdkzA8l3i5KkvmHkam/WYhUHeJ+454P4Y
CvIAxygIOk5eRqUAmAetYSyWmO8L9g==
=+wYk
-----END PGP SIGNATURE-----

--PvAyYKQMnf7CylXt--

