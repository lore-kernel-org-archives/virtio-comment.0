Return-Path: virtio-comment-return-605-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3485B985E0B
	for <virtio-comment@lists.oasis-open.org>; Wed, 13 Feb 2019 02:25:53 +0000 (UTC)
Date: Wed, 13 Feb 2019 10:25:49 +0800
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20190213022549.GB14307@stefanha-x1.localdomain>
References: <20190111114200.10026-1-dgilbert@redhat.com>
 <20190111114200.10026-2-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O5XBE6gyVG5Rl6Rj"
Content-Disposition: inline
In-Reply-To: <20190111114200.10026-2-dgilbert@redhat.com>
Subject: [virtio-comment] Re: [PATCH 1/3] shared memory: Define shared memory regions
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

--O5XBE6gyVG5Rl6Rj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 11, 2019 at 11:41:58AM +0000, Dr. David Alan Gilbert (git) wrot=
e:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>=20
> Define the requirements and idea behind shared memory regions.
>=20
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  content.tex    |  3 +++
>  shared-mem.tex | 25 +++++++++++++++++++++++++
>  2 files changed, 28 insertions(+)
>  create mode 100644 shared-mem.tex
>=20
> diff --git a/content.tex b/content.tex
> index b101d1b..321a2f4 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -331,6 +331,9 @@ Virtqueue format, or both.
>  \input{split-ring.tex}
> =20
>  \input{packed-ring.tex}
> +
> +\input{shared-mem.tex}
> +
>  \chapter{General Initialization And Device Operation}\label{sec:General =
Initialization And Device Operation}
> =20
>  We start with an overview of device initialization, then expand on the
> diff --git a/shared-mem.tex b/shared-mem.tex
> new file mode 100644
> index 0000000..6da249c
> --- /dev/null
> +++ b/shared-mem.tex
> @@ -0,0 +1,25 @@
> +\section{Shared Memory Regions}\label{sec:Basic Facilities of a Virtio D=
evice / Shared Memory Regions}
> +
> +Shared memory regions are an additional facility
> +available to devices that need a region of memory that's
> +continuously shared between the host and the guest, rather
> +than passed between them in the way virtqueue elements are.
> +
> +Example uses include shared caches and version pools for versioned
> +data structures.

Another motivation for shared memory regions is to accommodate memory
resources that must be allocated by the device rather than the driver.

For example, some GPU hardware restrictions make it impossible for the
driver to select a suitable RAM region.

> +
> +Shared memory regions MUST NOT be used to control the operation
> +of the device, nor to stream data; those should still be performed
> +using virtqueues.
> +
> +A device may have multiple shared memory regions associated with
> +it.  Each region has a \field{shmid} to identify it, the meaning
> +of which is device specific.

s/device specific/device-specific/

--O5XBE6gyVG5Rl6Rj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJcY4AtAAoJEJykq7OBq3PIuDMIAKbsQvtBQvX4lgJef8xFrwEb
8kuOMkig63b6wxiBk9opfrU1AOu++RopqzKVVveeAszgWIp2FDKcXtKwvLNZBNcC
0AI4Pn7Q9RkO2I39ZO3r+d47HPgnTImsQXIoPL3Oon2bcQ50WE4iPBz00ksWftV6
UBLpvsKJ3fxjuoSaYKAA2t3lVI+/nZmzZBpMlO0ykLbDPeMxAG5gBy5fhm4IPabb
nN5rEYDAdBS7B5UKSTNtshRECbwpIa0D3+MFbttIJtlxKoLOlnrNjcVkhgQ5Tq3C
S0K0YLEQiRornRwtODESR24XwBG+vW30ofHR4L3CjYM0E8KYSwHPwZKLRynAAsE=
=MhHZ
-----END PGP SIGNATURE-----

--O5XBE6gyVG5Rl6Rj--
