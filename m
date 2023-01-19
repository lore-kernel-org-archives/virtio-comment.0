Return-Path: <virtio-comment-return-3889-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 04AEA986671
	for <virtio-comment@lists.oasis-open.org>; Thu, 19 Jan 2023 17:03:25 +0000 (UTC)
Date: Thu, 19 Jan 2023 12:03:02 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <Y8l3xu7ZdXVgD84C@fedora>
References: <961D315C9D3A523B+202301111121345064138@sudoinfotech.com>
 <Y77S5+YK31f6QKaN@fedora>
 <E0D19197FBCBB3B9+2023011710040633577713@sudoinfotech.com>
 <96c93361-1497-1eb2-7fcb-452696ae6a56@redhat.com>
 <202301171730174296359@sudoinfotech.com>
 <EE1B180C7FB41197+2023011717415699763014@sudoinfotech.com>
 <Y8a/8SH6sk3rgqcr@fedora>
 <CB1D0D0BB5D3E5E6+2023011810151168808928@sudoinfotech.com>
 <Y8f+0fTh1KYXhXSC@fedora>
 <9E1AD7FE8906C9F0+2023011917033819334533@sudoinfotech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/Tx6aOJOLEjVJ1En"
Content-Disposition: inline
In-Reply-To: <9E1AD7FE8906C9F0+2023011917033819334533@sudoinfotech.com>
Subject: Re: Re: [virtio-comment] About adding a new device type virtio-nvme
To: =?utf-8?B?5L6v6Iux5LmQ?= <houyingle@sudoinfotech.com>
Cc: jasowang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>, virtio-comment <virtio-comment@lists.oasis-open.org>, Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>, sgarzare <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

--/Tx6aOJOLEjVJ1En
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 19, 2023 at 05:03:38PM +0800, =E4=BE=AF=E8=8B=B1=E4=B9=90 wrote:
> Wed, 18 Jan 2023 09:14:41 -0500, Stefan wrote:
>=20
> >On Wed, Jan 18, 2023 at 10:15:12AM +0800, =E4=BE=AF=E8=8B=B1=E4=B9=90 wr=
ote:
>=20
> >> On Tue, 17 Jan 2023 10:34:09 -0500, Stefan wrote:
>=20
> >> >On Tue, Jan 17, 2023 at 05:41:57PM +0800, =E4=BE=AF=E8=8B=B1=E4=B9=90=
 wrote:
>=20
> >> >> On Tue, 17 Jan 2023 09:32:05 +0100=EF=BC=8CDavid wrote=EF=BC=9A
>=20
> >> >> >On 17.01.23 03:04, =E4=BE=AF=E8=8B=B1=E4=B9=90 wrote:
>=20
> >> >The two diagrams are quite similar. Did you want to highlight a
>=20
> >>
>=20
> >> >difference between the two approaches in the diagram?
>=20
> >>
>=20
> >> The biggest difference is the VFIO and vDPA frameworks. The vDPA (virt=
io data path acceleration) kernel framework
>=20
> >> is a pillar in productizing the end-to-end vDPA solution and it enable=
s NIC vendors to integrate their vDPA NIC kernel
>=20
> >> drivers into the framework as part of their productization efforts.=C2=
=A0
>=20
> >> Detailed information reference=EF=BC=9Ahttps://www.redhat.com/en/blog/=
introduction-vdpa-kernel-framework
>=20
> =C2=A0
>=20
> >For the sake of the argument, let's assume VFIO can't be used in your
>=20
> >situation so vDPA is required. The part I don't understand is which
>=20
> >specific NVMe features you need that virtio-blk lacks?
>=20
>=20
>=20
> During the DPU chip design process, "Fabrics connect" commands are not su=
pported on standard nvme-pci devices,
> but I can be delivered to remote storage at the back-end of the nvme-pci =
device.
>=20
> In the case of a virtio-blk device, I am not clear how the back-end of vi=
rtio-blk connects to remote storage.Although
> NVIDIA claims to support virtio-blk SNAP (Software-defined Network Accele=
rated Processing), their implementation
> is not expected to be an open source standard, other vendors may have dev=
eloped based on proprietary specifications.
>
> All of this is from a hardware offloading perspective. There are two solu=
tions to the problem I'm facing:

Wait, what is the problem you are facing? Why do you need NVMe?

> 1) virtio combines nvme, add a new virtio-nvme device.
> 2) virtio-blk Adds Fabrics related commands to enable virtio-blk to suppo=
rt Virtio-blk-of (over Fabric).
>=20
>=20

--/Tx6aOJOLEjVJ1En
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmPJd8YACgkQnKSrs4Gr
c8gYngf/UHlAcuHOdro+wTX53pEiResEdiaAPkDzVN0xn1m3XjVoP030v2BqH7qT
Zw795DGKnkJwFXhrhL21upSOsukqYSsAgAtmchBX8Eoht6bnIw/rEnvvuMywFxKq
hvR1Wc4d5dSEns4ViY92fE5CxVooE1cM5NyOyn0fgWVleA6ZyzUSvMAfapghfh1t
H70lAnFgXpboBzGWhtrHBgbmrH6JbiznXBoD0Ot7mxf0AP1QW+6BX5ghnodSpcAL
0/ustxDgTp+oNWXOe9VRytxJrJPVAlEzyNvco1qFZ+8/4e4/DEsi+TF1OT0w7eam
S/Co244LLtbti8iMo2CaHEr/iunPcg==
=WaZL
-----END PGP SIGNATURE-----

--/Tx6aOJOLEjVJ1En--

