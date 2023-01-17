Return-Path: <virtio-comment-return-3859-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C7266986594
	for <virtio-comment@lists.oasis-open.org>; Tue, 17 Jan 2023 15:35:30 +0000 (UTC)
Date: Tue, 17 Jan 2023 10:34:09 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <Y8a/8SH6sk3rgqcr@fedora>
References: <961D315C9D3A523B+202301111121345064138@sudoinfotech.com>
 <Y77S5+YK31f6QKaN@fedora>
 <E0D19197FBCBB3B9+2023011710040633577713@sudoinfotech.com>
 <96c93361-1497-1eb2-7fcb-452696ae6a56@redhat.com>
 <202301171730174296359@sudoinfotech.com>
 <EE1B180C7FB41197+2023011717415699763014@sudoinfotech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="W3Sb8ni3iKMcy1+n"
Content-Disposition: inline
In-Reply-To: <EE1B180C7FB41197+2023011717415699763014@sudoinfotech.com>
Subject: Re: Re: [virtio-comment] About adding a new device type virtio-nvme
To: =?utf-8?B?5L6v6Iux5LmQ?= <houyingle@sudoinfotech.com>
Cc: David Hildenbrand <david@redhat.com>, virtio-comment <virtio-comment@lists.oasis-open.org>, Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>, sgarzare <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

--W3Sb8ni3iKMcy1+n
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 17, 2023 at 05:41:57PM +0800, =E4=BE=AF=E8=8B=B1=E4=B9=90 wrote:
> On Tue, 17 Jan 2023 09:32:05 +0100=EF=BC=8CDavid wrote=EF=BC=9A
> >On 17.01.23 03:04, =E4=BE=AF=E8=8B=B1=E4=B9=90 wrote:
>=20
>=20
>=20
> >> virtio-nvme=C2=A0advantages :
> >> 1)=C2=A0 live migration
> >> 2)=C2=A0 support remote storage
>=20
>=20
>=20
> >At least 1) is an implementation detail in the NVME implementation in
> >the hypervisor. I suspect 2) in a similar way, or is there a fundamental
> >issue with that?
>=20
>=20
>=20
> >One problematic thing about the NVME implementation in QEMU is that it
> >will pin (via vfio) all guest RAM. Could that be avoided using
> >virtio-NVME, or what exactly would be the difference between virtio-nvme
> >and ordinary NVME?
>=20
>=20
>=20
> In the virtualization scenario where devices are offload to hardware=EF=
=BC=9A
>=20
>=20
> NVME=EF=BC=9A
> -------------------------------------------------------------------------=
--------------------------------------------
>            ______________________________________________________________=
_______________                            =20
>           |             _________________________________________________=
__________     |                           =20
>           |            |    _____________________________________________=
________  |    |                           =20
>           |            |    |                                            =
        | |    |                           =20
>           |            |    |             _______________________________=
___     | |    |                           =20
>           |            |    |            |    ______                     =
   |    | |    |        ______             =20
>           |            |    |   User     |   | Mem  |--------------------=
---|----|-|----|-----> |      |            =20
>           |            |    |            |   |______|        SPDK        =
   |    | |    | (gVA) |______|            =20
>           |            |    |            |    (gVA)                      =
   |    | |    |        |    |             =20
>           |            |    |            |______|________________________=
___|    | |    |        |    |             =20
>           |            |    |--GuestOS----------|------------------------=
--------| |    |        |    |             =20
>           |            |    |             ______\/_______________________=
___     | |    |        |    |             =20
>           |            | VM |            |                VFIO           =
   |    | |    |        |    |             =20
>           |   User     |    |   Kernel   |___________     _______________=
___|    | |    |        |    |             =20
>           |            |    |            | vfio-pci  |   |               =
   |    | |    |        |    |             =20
>           |            |    |            |  (gIOVA)  |   | vfio_iommu_typ=
e1 |    | |    |        |    |             =20
> Software  |            |    |            |______|____|___|_______________=
___|    | |    |        |    |             =20
>           |            |    |___________________|________________________=
________| |    |        |    |             =20
>           |            |     ___________________|________________________=
________  |    |        |    |             =20
>           |            |    |             ______|____     _______________=
___     | |    |        \/   \/            =20
>           |            |    |            |      \/   |   |               =
   |    | |    |        ______             =20
>           |            |    |            |    NVME   |   |      vIOMMU   =
   |    | |    |       |      |            =20
>           |            |    |   QEMU     |  Instance |   |               =
 --|----|-|----|-----> |______|            =20
>           |            |    |            |  (gIOVA)  |   |   (gIOVA-->gPA=
)  |    | |    | (gPA)  |    |             =20
>           |            |    |            |_____|_____|   |_______________=
___|    | |    |        |    |             =20
>           |            |    |__________________|_________________________=
________| |    |        |    |             =20
>           |            |_______________________|_________________________=
__________|    |        |    |             =20
>           |---HostOS---------------------------|-------------------------=
---------------|        |    |             =20
>           |             _______________________|_________________________=
__________     |        |    |             =20
>           |            |                       |                         =
          |    |        |    |             =20
>           |            |                       |    VFIO                 =
          |    |        |    |             =20
>           |   Kernel   |_______________________|_____     _______________=
__________|    |        |    |             =20
>           |            |                       \/    |   |               =
          |    |        |    |             =20
>           |            |        vfio-pci             |   |    vfio_iommu_=
type1     |    |        |    |             =20
>           |            |                       |     |   |               =
          |    |        |    |             =20
>           |            |_______________________|_____|___|_______________=
__________|    |        |    |             =20
>           |____________________________________|_________________________=
_______________|        |    |             =20
> -----------------------------------------------|-------------------------=
------------------------|----|--------------
>            ____________________________________\/____     _______________=
__________           ___\/___\/___________ =20
>           |       |    |                             |   |               =
          |         |  |      |           |=20
> Hardware  |       |    |          DMA     (gIOVA)  --|---|->        IOMMU=
        --|---------|->|______|           |=20
>           |       |    |_____________________________|   |      (gIOVA-->=
hPA)      |   (hPA) |   Physical Memory   |=20
>           | DPU   |                                  |   |_______________=
__________|         |_____________________|=20
>           |       |        NVME-of                   |
>           |       |__________________________________|
>           |                           |              |
>           |___________________________|______________|
> --------------------------------------|----------------------------------=
--------------------------------------------
>                                       | TCP (RDMA, and so on)
>                         ______________v__________=20
>                        |                         |
> Remote storage         |                         |
>                        |     Network Storage     |
>                        |                         |
>                        |_________________________|
>                       =20
> -------------------------------------------------------------------------=
--------------------------------------------
>=20
>=20
> It is difficult to implement PCIe passthrough live migration.

Linux commit 115dcec65f61d53e25e1bed5e380468b30f98b14 ("vfio: Define
device migration protocol v2") defines the VFIO migration API and it's
implemented by several drivers in the kernel.

Can you explain the difficulty of implementing PCIe passthrough live
migration in more detail?

>=20
>=20
>=20
> =C2=A0
> virtio-nvme:
> -------------------------------------------------------------------------=
--------------------------------------------
>            ______________________________________________________________=
_______________                            =20
>           |             _________________________________________________=
__________     |                           =20
>           |            |    _____________________________________________=
________  |    |                           =20
>           |            |    |                                            =
        | |    |                           =20
>           |            |    |             _______________________________=
___     | |    |                           =20
>           |            |    |            |    ______                     =
   |    | |    |        ______             =20
>           |            |    |   User     |   | Mem  |--------------------=
---|----|-|----|-----> |      |            =20
>           |            |    |            |   |______|        SPDK        =
   |    | |    | (gVA) |______|            =20
>           |            |    |            |    (gVA)                      =
   |    | |    |        |    |             =20
>           |            |    |            |______|________________________=
___|    | |    |        |    |             =20
>           |            |    |--GuestOS----------|------------------------=
--------| |    |        |    |             =20
>           |            |    |             ______v________________________=
___     | |    |        |    |             =20
>           |            | VM |            |                VFIO           =
   |    | |    |        |    |             =20
>           |   User     |    |   Kernel   |___________     _______________=
___|    | |    |        |    |             =20
>           |            |    |            | vfio-pci  |   |               =
   |    | |    |        |    |             =20
>           |            |    |            |  (gIOVA)  |   | vfio_iommu_typ=
e1 |    | |    |        |    |             =20
> Software  |            |    |            |______|____|___|_______________=
___|    | |    |        |    |             =20
>           |            |    |___________________|________________________=
________| |    |        |    |             =20
>           |            |     ___________________|________________________=
________  |    |        |    |             =20
>           |            |    |             ______v____     _______________=
___     | |    |        v    v          =20
>           |            |    |            |virtio-NVME|   |               =
   |    | |    |        ______             =20
>           |            |    |            |  Instance |   |      vIOMMU   =
   |    | |    |       |      |            =20
>           |            |    |   QEMU     |           |   |               =
 --|----|-|----|-----> |______|            =20
>           |            |    |            | vhost-vdpa|   |   (gIOVA-->gPA=
)  |    | |    | (gPA)  |    |             =20
>           |            |    |            |__(gIOVA)__|   |_______________=
___|    | |    |        |    |             =20
>           |            |    |__________________|_________________________=
________| |    |        |    |             =20
>           |            |_______________________|_________________________=
__________|    |        |    |             =20
>           |---HostOS---------------------------|-------------------------=
---------------|        |    |             =20
>           |             _______________________|_________________________=
__________     |        |    |             =20
>           |            |                       |                         =
          |    |        |    |             =20
>           |            |                       |    vDPA                 =
          |    |        |    |             =20
>           |   Kernel   |_______________________v_____     _______________=
__________|    |        |    |             =20
>           |            |                       |     |   |               =
          |    |        |    |             =20
>           |            |   vdpa-device         |     |   |               =
          |    |        |    |             =20
>           |            | (Virtual device)      |     |   |               =
          |    |        |    |             =20
>           |            |_______________________|_____|___|_______________=
__________|    |        |    |             =20
>           |____________________________________|_________________________=
_______________|        |    |             =20
> -----------------------------------------------|-------------------------=
------------------------|----|--------------
>            ____________________________________v_____     _______________=
__________           ___v____v____________ =20
>           |       |    |                             |   |               =
          |         |  |      |           |=20
> Hardware  |       |    |          DMA     (gIOVA)  --|---|->        IOMMU=
        --|---------|->|______|           |=20
>           |       |    |_____________________________|   |      (gIOVA-->=
hPA)      |   (hPA) |   Physical Memory   |=20
>           |  DPU  |                                  |   |_______________=
__________|         |_____________________|=20
>           |       |        virtio-nvme-of            |
>           |       |__________________________________|
>           |                           |              |
>           |___________________________|______________|
> --------------------------------------|----------------------------------=
--------------------------------------------
>                                       | TCP (RDMA, and so on)
>                         ______________v__________=20
>                        |                         |
> Remote storage         |                         |
>                        |     Network Storage     |
>                        |                         |
>                        |_________________________|
>                       =20
> -------------------------------------------------------------------------=
--------------------------------------------
> Based on the vDPA framework, it supports live migration.

The two diagrams are quite similar. Did you want to highlight a
difference between the two approaches in the diagram?

Stefan

--W3Sb8ni3iKMcy1+n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmPGv/EACgkQnKSrs4Gr
c8ijTwgAn7vnwtlijx+1i+PcTjaQ6kkeeq/YVqqHPIIYa02CzrvDtplOOicRbYog
N6fm1MnHRdSwh+KDxSjf30+DJw7QCv8P3Cor3GSRwOnU11lwlpmX2+PxExBeZnvc
r/lAyur97lq1MGOdjYMIVekrsu5sJqP32OQK66NB+dMzw8kuiqeVHEpsT//0tzQs
VZNrJthCt2hx/jqmdL88zpKaC0gz9v9PJJIkB0DI0LfDPAjJFxEGmBChNCZ4p2i7
Ub8QK+a8I1fp5pxGg4lkyqDumSMhk80E+QVesyoWOcOje7Ij4BdOycEV3/i6ux3V
hlAG4dWu7cIifVeCZKEBlj3STfbAZA==
=jShk
-----END PGP SIGNATURE-----

--W3Sb8ni3iKMcy1+n--

