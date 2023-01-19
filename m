Return-Path: <virtio-comment-return-3890-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 936CD986671
	for <virtio-comment@lists.oasis-open.org>; Thu, 19 Jan 2023 17:16:02 +0000 (UTC)
Date: Thu, 19 Jan 2023 12:15:54 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <Y8l6yurBJ4VzqDyM@fedora>
References: <961D315C9D3A523B+202301111121345064138@sudoinfotech.com>
 <Y77S5+YK31f6QKaN@fedora>
 <E0D19197FBCBB3B9+2023011710040633577713@sudoinfotech.com>
 <40a63ca5-1273-d334-8d81-d5880e4fdff1@nvidia.com>
 <1DDD350DC1DCE386+2023011811234242045568@sudoinfotech.com>
 <9b0655f9-cf97-8d9a-cfd9-bf756821d7e3@nvidia.com>
 <528ED8FCD32C3FF2+2023011918190209488153@sudoinfotech.com>
 <603fa6fd-5ee5-88f8-6b57-36d29b9c6fdb@nvidia.com>
 <ABE92B73F195657E+2023011919020006654763@sudoinfotech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lxMhmGxghkPR2DJm"
Content-Disposition: inline
In-Reply-To: <ABE92B73F195657E+2023011919020006654763@sudoinfotech.com>
Subject: Re: Re: [virtio-comment] About adding a new device type virtio-nvme
To: =?utf-8?B?5L6v6Iux5LmQ?= <houyingle@sudoinfotech.com>
Cc: Max Gurtovoy <mgurtovoy@nvidia.com>, virtio-comment <virtio-comment@lists.oasis-open.org>, Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>, sgarzare <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

--lxMhmGxghkPR2DJm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 19, 2023 at 07:02:00PM +0800, =E4=BE=AF=E8=8B=B1=E4=B9=90 wrote:
> Thu, 19 Jan 2023 12:33:54 +0200, Max Gurtovoy wrote:
> >On 19/01/2023 12:19, =E4=BE=AF=E8=8B=B1=E4=B9=90 wrote:
>=20
> >> Wed, 18 Jan 2023 12:09:59 +0200, Max Gurtovoy wrote:
>=20
> >>> On 18/01/2023 5:23, =E4=BE=AF=E8=8B=B1=E4=B9=90 wrote:
>=20
> >>>> On=C2=A0 Tue, 17 Jan 2023 19:19:59 +0200, Max Gurtovoy wrote:
>=20
> >>>>> On 17/01/2023 4:04, =E4=BE=AF=E8=8B=B1=E4=B9=90 wrote:
>=20
> >>>>>> On Wed, 11 Jan 2023 10:16:55 -0500, Stefan wrote:
>=20
> >>>>>>>> On Wed, Jan 11, 2023 at 11:21:35AM +0800, =E4=BE=AF=E8=8B=B1=E4=
=B9=90 wrote:
>=20
> >>>>>>>> As we know, nvme has more features than virtio-blk. For example,=
 with the development of virtualization IO offloading to hardware, virtio-b=
lk and NVME-OF offloading to hardware >are developing rapidly.=C2=A0 So if =
virtio and nvme are combined into Virtio-NvMe, Is it necessary to add a dev=
ice type Virtio-NvMe ?
>=20
> >>>>>>=C2=A0=C2=A0=C2=A0=C2=A0
>=20
> >>>>>>> Hi,
>=20
> >>>>>>> In theory, yes, virtio-nvme can be done. The question is why do i=
t?
>=20
> >>>>>>> NVMe already provides a PCI hardware spec for software and hardwa=
re
>=20
> >>>>>>> implementations to follow. An NVMe PCI device can be exposed to t=
he
>=20
> >>>>>>> guest and modern operating systems recognize it without requiring=
 new
>=20
> >>>>>>> drivers.
>=20
> >>>>>>> The value of VIRTIO here is probably in the deep integration into=
 the
>=20
> >>>>>>> virtualization stack with vDPA, vhost, etc. A virtio-nvme device =
can use
>=20
> >>>>>>> all these things whereas a PCI device needs to do everything from
>=20
> >>>>>>> scratch.
>=20
> >>>>>> The NVME technology and ecosystem are complete. However, in virtua=
lization scenarios, NVME devices can only use PCIe pass-through . When NVME=
 and virtio combine to connect to the vDPA ecosystem, live migration is sup=
ported.
>=20
> >>>>>>> Let's not forget that virtio-blk is widely used and new commands =
are
>=20
> >>>>>>> being added as needed. Which NVMe features are you missing in
>=20
> >>>>>>> virtio-blk?
>=20
> >>>>>> With the introduction of the concept of DPU, a large number of ven=
dors are offloading virtual devices to hardware. The back-end of Virtio-blk=
 does not support remote storage. Therefore, Virtio-Nvme-of can well combin=
e the advantages of remote storage and virtio live migration
>=20
> >>>>>>> I guess this is why virtio-nvme hasn't been done before: people w=
ho want
>=20
> >>>>>> NVMe can already do NVMe PCI, people who want VIRTIO can use virti=
o-blk,
>=20
> >>>>>>> and so there hasn't been a great need to combine VIRTIO and NVMe =
yet.
>=20
> >>>>>>> What advantages do you see in having virtio-nvme?
>=20
> >>>>>> virtio-nvme=C2=A0advantages :
>=20
> >>>>>> 1)=C2=A0 live migration
>=20
> >>>>>=C2=A0=C2=A0=C2=A0
>=20
> >>>>> This is WIP and will use VFIO live migration framework.
>=20
> >>>> Yes, VFIO live migration framework is WIP,=C2=A0 but I still think v=
dpa is a friendlier framework.
>=20
> >>
>=20
> >>
>=20
> >>> Not sure what you consider friendly ?
>=20
> >> My personal opinion: VFIO live migration requires device design requir=
ements.
>=20
> >> But vDPA-based live migration, the software-abstracted vDPA device in =
the vDPA
>=20
> >> framework can do some state recording, The design requirements for vir=
tio devices
>=20
> >> that are offloading to hardware may be lower.
>=20
> >>
>=20
> >>=C2=A0=C2=A0
>=20
> >>
>=20
> >>
>=20
> >>> The community agreed that in SR-IOV - VF migration is done via PF int=
erface.
>=20
> >>
>=20
> >>
>=20
> >>> Any device specific migration (e.g. vdpa/virtio)=C2=A0 is not as gene=
ric as
>=20
> >>> VFIO migration. Also it will be maintained by a smaller group of engi=
neers.
>=20
> >>
>=20
> >>> If you would like to use vdpa - I suggest using virtio-blk and not
>=20
> >>> inventing virtio-nvme device that will for sure be with less feature =
set
>=20
> >>> than pure NVMe.
>=20
> >>
>=20
> >>
>=20
> >>> In case you're missing some feature in virtio-blk that exist in NVMe,
>=20
> >>> you're welcome to submit a proposal to the technical group with that
>=20
> >>> feature.
>=20
> >>
>=20
> >> Yes, this is good advice.
>=20
> >> virtio-blk adds Fabrics related commands to enable virtio-blk to suppo=
rt
>=20
> >> virtio-blk-of (over Fabric), I wonder if it is feasible.
>=20
> >=C2=A0
>=20
> >I'm totally confused.
>=20
> >I thought you're are trying to build some virtualized environment and
>=20
> >you're looking for storage devices that support Live migration.
>=20
> >How does virtio-blk-of will assist here ?
>=20
>=20
>=20
> I would like to push virtio storage in hardware offloading scenarios,=20
> enabling open source solutions that support remote storage access.
> So we're talking about the need for virtio-nvme and virtio-blk-of.

If I understand correctly you're saying the guest driver needs to speak
the same protocol as the remote storage?

That's a good idea for local storage because it avoids extra layers of
software that parses/translates commands.

However, I don't understand why it matters for remote storage because
commands needs to be parsed by the DPU and sent as messages over a
fabric anyway. Whether you go virtio-blk<->NVMeoF,
virtio-blk<->virtio-blk-of, or nvme-pci<->NVMeoF, it's still the same
path. None of them presents a significant optimization opportunity.

The main optimization is to configure some sort of RDMA to avoid copying
around I/O buffers, but the buffers only contain data and are not
protocol-specific so virtio-blk<->NVMeoF should work.

Can you explain what you wrote in a bit more detail, I don't understand
why virtio-blk-of is needed?

Stefan

--lxMhmGxghkPR2DJm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmPJesoACgkQnKSrs4Gr
c8jDFQf/agX7wWx6l4oeo3HIVeGS78FMSrRSqY/TfhHjVmaMR7uU/jNXFRtBKi5N
usn9guD467oS9jZWkAeIb6eW+L2NHil3V9KFehFfdtOxnMZN2rcAP0Fmx0NeYG2D
+A6XZ1KrCoAqIvLlajg1e9i1mNssM261R+iCrIzXL7XX+p2Ky45Zob/pbJS5ebNK
TqGJIa4e7MlkO/vfSKTOcdIcf15e70Ep7yCk/erEE9zdXXJqBoPCmemW4wgnEZCo
wnvKZTE7AMyrrkgLHM4ZHglBoaELM4/1yGYNlm+E84FwUplJXj3VKbO+pEb4l8Dn
lqyJjuDiZDXlecsOslu5W/YZeDn65w==
=8bCR
-----END PGP SIGNATURE-----

--lxMhmGxghkPR2DJm--

