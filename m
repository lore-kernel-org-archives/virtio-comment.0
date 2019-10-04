Return-Path: virtio-comment-return-855-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5091E985FFF
	for <virtio-comment@lists.oasis-open.org>; Fri,  4 Oct 2019 09:08:57 +0000 (UTC)
Date: Fri, 4 Oct 2019 10:08:54 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20191004090854.GE505@stefanha-x1.localdomain>
References: <CAH3CmKCZUXDa6-Dtao6hGTFCN2B+i9vvP5+C6sUt=OFhHd77qg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LSp5EJdfMPwZcMS1"
Content-Disposition: inline
In-Reply-To: <CAH3CmKCZUXDa6-Dtao6hGTFCN2B+i9vvP5+C6sUt=OFhHd77qg@mail.gmail.com>
Subject: Re: [virtio-comment] VIRTIO_NET_F_CTRL_RX_EXTRA (bit 20) missing
 from Feature Bits Section
To: Morgan Lombard <morgan.lombard@netronome.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

--LSp5EJdfMPwZcMS1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 02, 2019 at 10:17:36AM +0200, Morgan Lombard wrote:
> Reading through Virtio-v1.0 and V1.1 Specs I noticed that
> *VIRTIO_NET_F_CTRL_RX_EXTRA* is mentioned 3 times in Section 5.1.6.5
> Control Virtqueue, but *VIRTIO_NET_F_CTRL_RX_EXTRA (bit 20)* does not
> appear in the Section 5.1.3 Feature Bits
>=20
> Referenced following documents
> http://docs.oasis-open.org/virtio/virtio/v1.0/cs04/virtio-v1.0-cs04.pdf
> https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.pdf

Thanks for pointing this out!

Would you like to send a patch to fix it?  From the README file:

"A patch can be generated and sent by cloning the spec repository, creating=
 a commit, formatting it as a patch and then sending it. For example:

git clone https://github.com/oasis-tcs/virtio-spec.git ... edit spec text, =
and save ...

git commit -a ... describe the proposed change, in the following format: si=
ngle line summary detailed description, including motivation for the change=
 Signed-off-by: Name <email> ... then save and close the editor ...

git format-patch -o proposal1/ HEAD~1.. ... generates a new directory propo=
sal1/ and a file starting with 0001- ...

git send-email --to=3Dvirtio-comment@lists.oasis-open.org
proposal1/0001-*"

Stefan

--LSp5EJdfMPwZcMS1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl2XDCYACgkQnKSrs4Gr
c8hEewf8DOWm38tNE3jIIl3hfKqIz4Mc2Ns3EIu5z09xc/MiT2+GpTg7QB/Lx4zF
sLkYpd9siKeUQA/1cOTgRTQgP1nVIYZRM+kJqiQ9E9aX0gPN0eqAvpfSdfW72rTW
ouhpymIou0QssBmUC1HN3JqYSNEZJ/Br0PoAPLtdzXiTtOmMwOhkT2JkabG5qePz
QA81EzJCAWtJjMQsxiXENSFAp2z4zVeerTm4U6nQQuOQNqFSXGBHOBQAmAw3kkSe
3VdYYnxo2I6j+A5USQJ8+e1fxXrnayVdiJsmD26XTaoWcOKp2b1bqzlRKDIljGr/
Y8dkN82W5Nc4h4AXKu3DqVRhCzUuRw==
=j6r+
-----END PGP SIGNATURE-----

--LSp5EJdfMPwZcMS1--
