Return-Path: virtio-comment-return-698-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C27E4985EA4
	for <virtio-comment@lists.oasis-open.org>; Thu,  7 Mar 2019 17:33:49 +0000 (UTC)
Date: Thu, 7 Mar 2019 17:33:39 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20190307173339.GD2915@stefanha-x1.localdomain>
References: <CAEkmjvW06XheSPNS6YtjoZzAsmOeSPSbwFwNr_1S1F=Mmy-+qw@mail.gmail.com>
 <20190306163616.GA29057@stefanha-x1.localdomain>
 <20190306122634-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bajzpZikUji1w+G9"
Content-Disposition: inline
In-Reply-To: <20190306122634-mutt-send-email-mst@kernel.org>
Subject: Re: [virtio-comment] RFC: virtio-hostmem (+ Continuation of
 discussion from [virtio-dev] Memory sharing device)
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Frank Yang <lfy@google.com>, virtio-comment@lists.oasis-open.org, Cornelia Huck <cohuck@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Roman Kiryanov <rkir@google.com>
List-ID: <virtio-comment.lists.oasis-open.org>

--bajzpZikUji1w+G9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 06, 2019 at 12:28:30PM -0500, Michael S. Tsirkin wrote:
> On Wed, Mar 06, 2019 at 04:36:16PM +0000, Stefan Hajnoczi wrote:
> > > \section{Host Memory Device}\label{sec:Device Types / Host Memory Dev=
ice}
> >=20
> > The Host Memory Device defines an entirely new device model that bypass=
es
> > VIRTIO.  Why make this a VIRTIO device if the VIRTIO device model is no=
t a good
> > fit for what you're trying to achieve?  This device seems out of scope =
to me.
>=20
> It's different from virtio pci.
> But this looks a bit like a special transport to me.
> I'll look at it more next week sometime.

It resembles ivshmem.

Frank: ivshmem is an existing (non-VIRTIO) PCI device that offers
similar functionality to what you're proposing.  It was not actively
maintained over the years and is not widely used, but you can look at
QEMU's docs/specs/ivshmem-spec.txt and hw/misc/ivshmem.c.

Stefan

--bajzpZikUji1w+G9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJcgVXzAAoJEJykq7OBq3PIM7kH/3kvNfkPWIZGZlgdGTSts98c
oLVZ+EmXAHCWA4d6Z6nt2eNPYh73CF+z8TqHJOvP/ggftMpqABc8v/s0LScm5IHX
S7hsB5bW0YMAoDWlVFT2OFTUD0BNfpm3QeLee/bM0TM4Z0yBYtECGSkoXBzajFIL
cWhItDl61YGrjIyvqM8OOeNigH8PE34Vbx4QBnlnDnmHtZIINYy07E4OUY1P+XRh
zMA05prnceX2Lj0LVAN0hUMFs36fN8qq1ywP4qqZjayerJyYt8HpYM/R4Zq0oIRM
HZi4rh75wunUMQpVlvvyCBtDEnF+S5ja1xTDHBQSfrTQA8v8sQktZqZ2gv0RlPA=
=5VNG
-----END PGP SIGNATURE-----

--bajzpZikUji1w+G9--
