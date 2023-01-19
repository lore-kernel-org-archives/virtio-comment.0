Return-Path: <virtio-comment-return-3886-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D61C7986668
	for <virtio-comment@lists.oasis-open.org>; Thu, 19 Jan 2023 11:42:59 +0000 (UTC)
Date: Thu, 19 Jan 2023 06:42:49 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20230119064213-mutt-send-email-mst@kernel.org>
References: <961D315C9D3A523B+202301111121345064138@sudoinfotech.com>
 <Y77S5+YK31f6QKaN@fedora>
 <E0D19197FBCBB3B9+2023011710040633577713@sudoinfotech.com>
 <Y8bGYRN69UOv2o29@fedora>
MIME-Version: 1.0
In-Reply-To: <Y8bGYRN69UOv2o29@fedora>
Subject: Re: Re: [virtio-comment] About adding a new device type virtio-nvme
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: =?utf-8?B?5L6v6Iux5LmQ?= <houyingle@sudoinfotech.com>, virtio-comment <virtio-comment@lists.oasis-open.org>, Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>, sgarzare <sgarzare@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, Jan 17, 2023 at 11:01:37AM -0500, Stefan Hajnoczi wrote:
> > The NVME technology and ecosystem are complete. However, in virtualizat=
ion scenarios, NVME devices can only use PCIe pass-through . When NVME and =
virtio combine to connect to the vDPA ecosystem, live migration is supporte=
d.
> >=20
> >=20
> > >Let's not forget that virtio-blk is widely used and new commands are
> > >being added as needed. Which NVMe features are you missing in
> > >virtio-blk?
> >=20
> > With the introduction of the concept of DPU, a large number of vendors =
are offloading virtual devices to hardware. The back-end of Virtio-blk does=
 not support remote storage. Therefore, Virtio-Nvme-of can well combine the=
 advantages of remote storage and virtio live migration
>=20
> virtio-blk is just a storage interface, whether that storage is local or
> remote is up to the device implementation. The block device could be
> located on Ceph, NFS, etc.
>=20
> Each virtio-blk device is a single block device. There is no
> standardized management protocol in virtio-blk for connecting to remote
> block devices. I'm aware of hardware virtio-blk devices that connect to
> remote storage. Configuration is performed through an out-of-band
> management interface.
>=20
> Maybe when you say virtio-blk doesn't support remote storage this is
> what you mean?
>=20
> Stefan

=E4=BE=AF=E8=8B=B1=E4=B9=90 you never answered this question.

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

