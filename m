Return-Path: <virtio-comment-return-3962-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 421C89862AE
	for <virtio-comment@lists.oasis-open.org>; Sun,  5 Feb 2023 12:33:25 +0000 (UTC)
Date: Sun, 5 Feb 2023 07:33:17 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20230205073219-mutt-send-email-mst@kernel.org>
References: <961D315C9D3A523B+202301111121345064138@sudoinfotech.com>
 <Y77S5+YK31f6QKaN@fedora>
 <E0D19197FBCBB3B9+2023011710040633577713@sudoinfotech.com>
 <Y8bGYRN69UOv2o29@fedora>
 <06E22D1C69A02418+2023011810492308135755@sudoinfotech.com>
MIME-Version: 1.0
In-Reply-To: <06E22D1C69A02418+2023011810492308135755@sudoinfotech.com>
Subject: Re: Re: [virtio-comment] About adding a new device type virtio-nvme
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
To: =?utf-8?B?5L6v6Iux5LmQ?= <houyingle@sudoinfotech.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, virtio-comment <virtio-comment@lists.oasis-open.org>, Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>, sgarzare <sgarzare@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, Jan 18, 2023 at 10:49:23AM +0800, =E4=BE=AF=E8=8B=B1=E4=B9=90 wrote=
:
> On Tue, 17 Jan 2023 11:01:37 -0500, Stefan wrote:
>=20
> >On Tue, Jan 17, 2023 at 10:04:07AM +0800, =E4=BE=AF=E8=8B=B1=E4=B9=90 wr=
ote:
>=20
> >> On Wed, 11 Jan 2023 10:16:55 -0500, Stefan wrote:
> >>
> >>
> >> >>On Wed, Jan 11, 2023 at 11:21:35AM +0800, =E4=BE=AF=E8=8B=B1=E4=B9=
=90 wrote:
> >> >> As we know, nvme has more features than virtio-blk. For example, wi=
th the development of virtualization IO offloading to hardware, virtio-blk =
and NVME-OF offloading to hardware >are developing rapidly.=C2=A0 So if vir=
tio and nvme are combined into Virtio-NvMe, Is it necessary to add a device=
 type Virtio-NvMe ?
> >>
> >>
> >>
> >> =C2=A0
> >>
> >>
> >>
> >> >Hi,
> >> >In theory, yes, virtio-nvme can be done. The question is why do it?
> >>
> >>
> >>
> >> >NVMe already provides a PCI hardware spec for software and hardware
> >> >implementations to follow. An NVMe PCI device can be exposed to the
> >> >guest and modern operating systems recognize it without requiring new
> >> >drivers.
> >>
> >>
> >> >The value of VIRTIO here is probably in the deep integration into the
> >> >virtualization stack with vDPA, vhost, etc. A virtio-nvme device can =
use
> >> >all these things whereas a PCI device needs to do everything from
> >> >scratch.
> >>
> >> The NVME technology and ecosystem are complete. However, in virtualiza=
tion scenarios, NVME devices can only use PCIe pass-through . When NVME and=
 virtio combine to connect to the vDPA ecosystem, live migration is support=
ed.
> >>
> >>
> >> >Let's not forget that virtio-blk is widely used and new commands are
> >> >being added as needed. Which NVMe features are you missing in
> >> >virtio-blk?
> >>
> >> With the introduction of the concept of DPU, a large number of vendors=
 are offloading virtual devices to hardware. The back-end of Virtio-blk doe=
s not support remote storage. Therefore, Virtio-Nvme-of can well combine th=
e advantages of remote storage and virtio live migration
> >
> >virtio-blk is just a storage interface, whether that storage is local or
> >remote is up to the device implementation. The block device could be
> >located on Ceph, NFS, etc.
> >=C2=A0
> >Each virtio-blk device is a single block device. There is no
> >standardized management protocol in virtio-blk for connecting to remote
> >block devices. I'm aware of hardware virtio-blk devices that connect to
> >remote storage. Configuration is performed through an out-of-band
> >management interface.
> >=C2=A0
> >Maybe when you say virtio-blk doesn't support remote storage this is
> >what you mean?
>=20
>=20
>=20
> Yes, virtio-blk devices offlaod to hardware, For example, DPU and SmartNI=
C.
> So, compare virtio-nvme with virtio-blk and NVME.
>=20
>=20
>=20
>=20
>=20
> Stefan
>=20


Let's circle back a bit. You asked:
=09So if virtio and nvme are combined into Virtio-NvMe, Is it
=09necessary to add a device type Virtio-NvMe ?
And the answer seems to be:
=09not without much more in the way of motivation.

--=20
MST


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

