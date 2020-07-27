Return-Path: virtio-comment-return-1370-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7413C985B4C
	for <virtio-comment@lists.oasis-open.org>; Mon, 27 Jul 2020 12:29:51 +0000 (UTC)
Date: Mon, 27 Jul 2020 13:29:39 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20200727122939.GB386429@stefanha-x1.localdomain>
References: <f109fe5a-92eb-e5a5-bb83-ada42b3a9b61@siemens.com>
 <20200715132748.GA20677@stefanha-x1.localdomain>
 <88a33034-783a-07d2-85e0-c1a1ecd2721f@siemens.com>
 <20200723065423.GE268427@stefanha-x1.localdomain>
 <10df6427-eab0-d3b8-4624-ede98ff7ef09@siemens.com>
MIME-Version: 1.0
In-Reply-To: <10df6427-eab0-d3b8-4624-ede98ff7ef09@siemens.com>
Subject: Re: [virtio-comment] [RFC] ivshmem v2: Shared memory device
 specification
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4SFOXa2GPu3tIq4H"
Content-Disposition: inline
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Jailhouse <jailhouse-dev@googlegroups.com>, qemu-devel <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>, Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, liang yan <lyan@suse.com>
List-ID: <virtio-comment.lists.oasis-open.org>

--4SFOXa2GPu3tIq4H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2020 at 09:02:09AM +0200, Jan Kiszka wrote:
> On 23.07.20 08:54, Stefan Hajnoczi wrote:
> > On Fri, Jul 17, 2020 at 06:15:58PM +0200, Jan Kiszka wrote:
> > > On 15.07.20 15:27, Stefan Hajnoczi wrote:
> > > > On Mon, May 25, 2020 at 09:58:28AM +0200, Jan Kiszka wrote:
> >=20
> > Thanks for the responses. It would be great to update the spec with
> > these clarifications.
> >=20
> > > > > If BAR 2 is not present, the shared memory region is not relocata=
ble
> > > > > by the user. In that case, the hypervisor has to implement the Ba=
se
> > > > > Address register in the vendor-specific capability.
> > > >=20
> > > > What does relocatable mean in this context?
> > >=20
> > > That the guest can decide (via BAR) where the resource should show up=
 in the
> > > physical guest address space. We do not want to support this in setup=
s like
> > > for static partitioning hypervisors, and then we use that side-channe=
l
> > > read-only configuration.
> >=20
> > I see. I'm not sure what is vendor-specific about non-relocatable share=
d
> > memory. I guess it could be added to the spec too?
>=20
> That "vendor-specific" comes from the PCI spec which - to my understandin=
g -
> provides us no other means to introduce registers to the config space tha=
t
> are outside of the PCI spec. I could introduce a name for the ivshmem ven=
dor
> cap and use that name here - would that be better?

Sounds good.

--4SFOXa2GPu3tIq4H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl8eyLMACgkQnKSrs4Gr
c8iz3gf+PR7V8VCympAWs+Z7xHZgGlFUy375IgC6F5z+6fundn/iK0s7G4F+x5yO
H3NmnoiUpdobJ52yzuTaft5DEsdL8GZ3AoDeCNp0TzU+89PFsXzDeozT9v3FGagz
GLnwzyCpWZ8qfbEJSUeKk549gfdqunLm6liqo3h6yiBlAs6dYAnh9RppXFxVdmLw
ydiDM+1kLBmsU5SCM8x1Uq2DNyPPySQukuCqUMQe8ssbI3L52y5+k/xverd44fUR
rGYc2n3Z6pZ+prPkRRkUKycP0H9csQyTIcIs7PKGMhPKOMqoXCe174y4dro4GrAb
+HGBBvp2fW5ztZHRP20XjqrWhotyow==
=AR2l
-----END PGP SIGNATURE-----

--4SFOXa2GPu3tIq4H--

