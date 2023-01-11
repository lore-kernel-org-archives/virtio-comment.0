Return-Path: <virtio-comment-return-3796-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DEFB09863A6
	for <virtio-comment@lists.oasis-open.org>; Wed, 11 Jan 2023 15:17:18 +0000 (UTC)
Date: Wed, 11 Jan 2023 10:16:55 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <Y77S5+YK31f6QKaN@fedora>
References: <961D315C9D3A523B+202301111121345064138@sudoinfotech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xIYdnryT+A59PaCb"
Content-Disposition: inline
In-Reply-To: <961D315C9D3A523B+202301111121345064138@sudoinfotech.com>
Subject: Re: [virtio-comment] About adding a new device type virtio-nvme
To: =?utf-8?B?5L6v6Iux5LmQ?= <houyingle@sudoinfotech.com>
Cc: virtio-comment <virtio-comment@lists.oasis-open.org>, Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>, sgarzare@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

--xIYdnryT+A59PaCb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 11, 2023 at 11:21:35AM +0800, =E4=BE=AF=E8=8B=B1=E4=B9=90 wrote:
> As we know, nvme has more features than virtio-blk. For example, with the=
 development of virtualization IO offloading to hardware, virtio-blk and NV=
ME-OF offloading to hardware are developing rapidly.  So if virtio and nvme=
 are combined into Virtio-NvMe, Is it necessary to add a device type Virtio=
-NvMe ?=20

Hi,
In theory, yes, virtio-nvme can be done. The question is why do it?

NVMe already provides a PCI hardware spec for software and hardware
implementations to follow. An NVMe PCI device can be exposed to the
guest and modern operating systems recognize it without requiring new
drivers.

The value of VIRTIO here is probably in the deep integration into the
virtualization stack with vDPA, vhost, etc. A virtio-nvme device can use
all these things whereas a PCI device needs to do everything from
scratch.

Let's not forget that virtio-blk is widely used and new commands are
being added as needed. Which NVMe features are you missing in
virtio-blk?

I guess this is why virtio-nvme hasn't been done before: people who want
NVMe can already do NVMe PCI, people who want VIRTIO can use virtio-blk,
and so there hasn't been a great need to combine VIRTIO and NVMe yet.
What advantages do you see in having virtio-nvme?

Stefan

--xIYdnryT+A59PaCb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmO+0ucACgkQnKSrs4Gr
c8iI2wf8CMsdod1AI/mhUMW3YI30ZXmaOKebdx/tmO0ngfQWnEPRRvYh2m6TCNYy
ZDJOsBp9IgaVSHB4K6piGntPInCujVNKGCIkrCynAPL1T0wOH5WIEVvbHqBovvDm
3y2rWhThHgQ0uGiyL7aD8c2jyqXSxgL0u3aw7wL35Fdv+7o9pQ8IHWLmBmrUMycR
IYHain4VgHUEMTFfJeVjuaAIyy4svqZOImODdwAZ1j1XL3kNl1Be5fZstH0RGI+t
Iegb+JUaeXppbhKh1B3423kFTiZI/L8+Kx9g9xwyIkjqUj33nGMeNiq/Kj39P45c
4TaBoPK6YT+L55pz1Skoyw2ot+y8xQ==
=+5Et
-----END PGP SIGNATURE-----

--xIYdnryT+A59PaCb--

