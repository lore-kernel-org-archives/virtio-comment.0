Return-Path: virtio-comment-return-776-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 038BB985C55
	for <virtio-comment@lists.oasis-open.org>; Fri, 28 Jun 2019 15:57:06 +0000 (UTC)
Date: Fri, 28 Jun 2019 16:56:57 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20190628155657.GB8800@stefanha-x1.localdomain>
References: <20190616120137.7835-1-ybettan@redhat.com>
 <20190616222843-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wzJLGUyc3ArbnUjN"
Content-Disposition: inline
In-Reply-To: <20190616222843-mutt-send-email-mst@kernel.org>
Subject: Re: [virtio-comment] Re: [PATCH] Introducing virtio-increment-edu.
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Yoni Bettan <ybettan@redhat.com>, virtio-comment@lists.oasis-open.org, ehabkost@redhat.com, ailan@redhat.com, aadam@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

--wzJLGUyc3ArbnUjN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 16, 2019 at 10:37:05PM -0400, Michael S. Tsirkin wrote:
> On Sun, Jun 16, 2019 at 03:01:37PM +0300, Yoni Bettan wrote:
> > The main goal is to create an educational example to be used as templat=
e or
> > guideline for contributors when they wish to create a new virtio
> > device and to document "the right way" to do so.
> >=20
> > The device functionality is simple as possible so contributors can have
> > their focus on the virtio protocol rather on the device functionality to
> > give them an "easy start".
> >=20
> > It consists of several parts:
> >=20
> >     1. The device specification
> >         * this patch content
> >=20
> >     2. The device implementation for Qemu-KVM hypervisor
> >         * it will hopefully be added to the Qemu project
> >         * for now it can be found at https://github.com/ybettan/qemu/bl=
ob/\
> >                 virtio/hw/virtio/virtio-example.c
> >=20
> >     3. The device driver for linux
> >         * it will hopefully be added to linux
> >         * for now it can be found at https://github.com/ybettan/\
> >                 QemuDeviceDrivers/blob/master/virtio/virtio_example_dri=
ver.c
> >=20
> >     4. A blog on virtio
> >         * introducing the virtio concept
> >         * gives some motivation for virtio-devices to be used
> >         * bring extra documentation on "how to write":
> >             - device specification
> >             - device implementation
> >             - device driver for linux
> >         * it can be found at https://howtovms.wordpress.com
> >=20
> > Signed-off-by: Yoni Bettan <ybettan@redhat.com>
> > ---
> >=20
> >=20
> > Here are some questions I would like to here your opinion on:
> >=20
> >     * do you think such device should be included in the virtio-specifi=
cation ?
>=20
> Not necessarily. But I think it's a good excercise and lessons
> learned can be added to a spec section explaining how to do this
> and what are the common mistakes to avoid.

I agree.  The ./newdevice.tex file can be extended based on lessons from
this device.

I think a virtio-net code commentary would be valuable, too.  It's a
real-world device with non-trivial features.  Anyone who spends some
time on that will be equipped to design new devices.

Stefan

--wzJLGUyc3ArbnUjN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl0WOMkACgkQnKSrs4Gr
c8iu3Qf8DJtAwOVEOWB5EDw6m3O21zmj7D9hiyOrbaW2PMVQAuDULpqvZudeJvjP
SZiXPlHa4EtM5xbOAtvwNfnGL2Bv/5VetIydn+H3TlPhhE55EsueMjJTHit3xGfY
iaM+fi7GWebdP0wqXRQGBSE5KjsWxMcr2WGZYvl3w65QEdi3AXy5zJlixlWIhbRc
j54u1gNbF5+wjfYXLH6HL1CfdIcxveKG5eEHoNEFxR30HypRrVjHFNVc6KmskuiR
dcDTKFn4iF404bfDqX8ELAXy+UEMS9aGWayUhkVKfkWXedf/G/nepZRKhgiVC2oa
5rWI3QSC9l0zU5xyMDS94nrQB3Zl3A==
=qvY1
-----END PGP SIGNATURE-----

--wzJLGUyc3ArbnUjN--
