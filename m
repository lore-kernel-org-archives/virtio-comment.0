Return-Path: virtio-comment-return-1359-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8EE6A985DD8
	for <virtio-comment@lists.oasis-open.org>; Thu, 23 Jul 2020 06:54:33 +0000 (UTC)
Date: Thu, 23 Jul 2020 07:54:23 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20200723065423.GE268427@stefanha-x1.localdomain>
References: <f109fe5a-92eb-e5a5-bb83-ada42b3a9b61@siemens.com>
 <20200715132748.GA20677@stefanha-x1.localdomain>
 <88a33034-783a-07d2-85e0-c1a1ecd2721f@siemens.com>
MIME-Version: 1.0
In-Reply-To: <88a33034-783a-07d2-85e0-c1a1ecd2721f@siemens.com>
Subject: Re: [virtio-comment] [RFC] ivshmem v2: Shared memory device
 specification
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0H629O+sVkh21xTi"
Content-Disposition: inline
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Jailhouse <jailhouse-dev@googlegroups.com>, qemu-devel <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>, Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, liang yan <lyan@suse.com>
List-ID: <virtio-comment.lists.oasis-open.org>

--0H629O+sVkh21xTi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2020 at 06:15:58PM +0200, Jan Kiszka wrote:
> On 15.07.20 15:27, Stefan Hajnoczi wrote:
> > On Mon, May 25, 2020 at 09:58:28AM +0200, Jan Kiszka wrote:

Thanks for the responses. It would be great to update the spec with
these clarifications.

> > > If BAR 2 is not present, the shared memory region is not relocatable
> > > by the user. In that case, the hypervisor has to implement the Base
> > > Address register in the vendor-specific capability.
> >=20
> > What does relocatable mean in this context?
>=20
> That the guest can decide (via BAR) where the resource should show up in =
the
> physical guest address space. We do not want to support this in setups li=
ke
> for static partitioning hypervisors, and then we use that side-channel
> read-only configuration.

I see. I'm not sure what is vendor-specific about non-relocatable shared
memory. I guess it could be added to the spec too?

In any case, since "relocatable" hasn't been fully defined, I suggest
making the statement more general:

  If BAR 2 is not present the hypervisor has to implement the Base
  Address Register in the vendor-specific capability. This can be used
  for vendor-specific shared memory functionality.

--0H629O+sVkh21xTi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl8ZNB8ACgkQnKSrs4Gr
c8hi6QgArR1ztVQRUCI/zFwqALXQy51hWMFUA+NSJfdRpFEYsMrCeF2dvpqW73++
PNSI2bqn1BrDwR8gnA8djoRSTk30D0pCH52U4lXR5CcmErlg/z8eLwNpezNzO2gS
dwIoQUlRHnezozBBbu308MLp9bx7UB9y0Ds0K4n33N7Ntm3rCRDjjIas7nYv9jNs
X67im89ptEIaYQ3dNIOp58RrOl16zjSsWod1nV3BFmBWQFmoiFx+4eVwCf3N9AoE
2Bh3WkTfj4sL53oFdfOlrNVfLrOzbSO+UJRyJK9n01mH+FlJxbJeE81kMgvwyBU+
gTBcaaNYoG9eIM2ea55aX/rOsFc2gg==
=T30T
-----END PGP SIGNATURE-----

--0H629O+sVkh21xTi--

