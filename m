Return-Path: virtio-comment-return-848-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4BD6A985DDE
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Sep 2019 10:24:34 +0000 (UTC)
Date: Wed, 18 Sep 2019 11:24:31 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20190918102431.GH26027@stefanha-x1.localdomain>
References: <20190917071812.529-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PNpeiK4tTqhYOExY"
Content-Disposition: inline
In-Reply-To: <20190917071812.529-1-eperezma@redhat.com>
Subject: Re: [virtio-comment] [PATCH] block: Add multiqueue
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

--PNpeiK4tTqhYOExY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2019 at 09:18:12AM +0200, Eugenio P=E9rez wrote:
> @@ -3973,6 +3984,11 @@ \subsection{Device Initialization}\label{sec:Devic=
e Types / Block Device / Devic
>      \field{max_write_zeroes_sectors} and \field{max_write_zeroes_seg} can
>      be read to determine the maximum write zeroes sectors and maximum
>      number of write zeroes segments for the block driver to use.
> +
> +\item If the VIRTIO_BLK_F_MQ feature is negotiated, \field{num_queues} f=
ield
> +    can be read to determine the number of queues. The driver does not u=
se more
> +    queues than guest's number of CPUs.

Why state that "the driver does not use more queues than guest's number
of CPUs"?  This seems like an implementation detail and it's up to the
driver author to decide the most effective way of using multiqueue.

--PNpeiK4tTqhYOExY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl2CBd8ACgkQnKSrs4Gr
c8h/ZAgAnyFkqSJpWiIkGc6q6pvpQRyE8rOTI/DBYmF9EybTfWY+At8SWpmUUYFb
4//HMBAQgxKw9jzM+/LHvi+yN6Ar35RLCxxBseoYMKWqdcASrRywhGN+ZbQsaliY
vobreRNrsSHHpu3OyVcwbnxu2GUoKSxx0qstZES/E6Kd5DtVK7rrekoxNAcoZjll
LJK69HVvZekUHyir6244JXgsaUYppBQczzaES8JhHKsLmUNZ1YlIp0RuYaPK8l7D
pa1/QEKixyMemCahG2+fyTepRub4oLLn/c/u/Y+ndQdI5+MZD0kYmYYHUnqAGck2
ERtkO2pZmtMez7Evn5z6BnxKykhwPA==
=L5Ev
-----END PGP SIGNATURE-----

--PNpeiK4tTqhYOExY--
