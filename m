Return-Path: virtio-comment-return-786-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2DD46985D40
	for <virtio-comment@lists.oasis-open.org>; Tue,  9 Jul 2019 10:29:42 +0000 (UTC)
Date: Tue, 9 Jul 2019 12:29:33 +0200
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20190709102933.GB345@stefanha-x1.localdomain>
References: <54DB94AE64EDA14BAB6A1E9641A26B011AE0AF0B@hasmsx109.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QTprm0S8XgL7H0Dt"
Content-Disposition: inline
In-Reply-To: <54DB94AE64EDA14BAB6A1E9641A26B011AE0AF0B@hasmsx109.ger.corp.intel.com>
Subject: Re: [virtio-comment] Missing net feature definition -
 VIRTIO_NET_F_CTRL_RX_EXTRA
To: "Savir, Gil" <gil.savir@intel.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

--QTprm0S8XgL7H0Dt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 02, 2019 at 08:56:49AM +0000, Savir, Gil wrote:
> Net-device feature VIRTIO_NET_F_CTRL_RX_EXTRA is mentioned few times in the spec (both v1.0, v1.1).
> However, it's definition is missing from Section 5.1.3 Feature bits<https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.html#x1-1970003> .

Hi Gil,
Thanks for the feedback.  Patches to the spec are welcome.  Would you
like to send a patch?

The Linux guest driver does not use this feature.  Maybe that's why
feature slipped by and wasn't fully specced.

Stefan

--QTprm0S8XgL7H0Dt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl0kbIwACgkQnKSrs4Gr
c8g4Nwf/VJ7dJMAWgHZs9RBp3GT0WbKSY9S0zmj9RrwhN6nxz6GtsDa+envzyRO4
ioRmSAsaap5Qjrc4sXbZkmmY7L+Uh4f2T5FMYEldwVkqHvZ8yL1YKk6ioQS0lfiU
b1CjFjJHonXIH9UG4BbhhwqmTr65EawB/+yv5q13A1kQZwSbEKZaDfz6Tlcn7PlA
o+RZCDt2f0tSzBaynXqcvfJk0rmtam+LCVnk8yLV320QCgrNCcN1oHiGwMgsRtfK
A98jQkXxKO/jGZvyL4nWUpi3enh4BjHpochmp13UDzxhJJP3dPN9WRksZfHOA9E/
bF4O+HazNC5mgXlm6b6TXUG3doddOQ==
=b2+y
-----END PGP SIGNATURE-----

--QTprm0S8XgL7H0Dt--
