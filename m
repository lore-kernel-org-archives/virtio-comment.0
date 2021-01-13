Return-Path: virtio-comment-return-1634-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 26930986142
	for <virtio-comment@lists.oasis-open.org>; Wed, 13 Jan 2021 11:35:18 +0000 (UTC)
Date: Wed, 13 Jan 2021 11:35:11 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20210113113511.GG250553@stefanha-x1.localdomain>
References: <20210112091611.19469-1-lauralg@amazon.com>
MIME-Version: 1.0
In-Reply-To: <20210112091611.19469-1-lauralg@amazon.com>
Subject: Re: [virtio-comment] [PATCH] virtio-blk: clarify descriptor-segment
 relation
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7lMq7vMTJT4tNk0a"
Content-Disposition: inline
To: Laura Loghin <lauralg@amazon.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

--7lMq7vMTJT4tNk0a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 11:16:11AM +0200, Laura Loghin wrote:
> Regarding the relation between data descriptors and segments, the
> commit that added discard and write zeroes to the spec, stated that
> the idea is "using 16 Bytes payload to support 1 descriptor" (not, for
> example, 32 bytes). There wasn't any mention in the spec about one data
> descriptor corresponding to exactly one segment. Added this constraint
> to block documentation.
>=20
> Signed-off-by: Laura Loghin <lauralg@amazon.com>
> ---
>  content.tex | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/content.tex b/content.tex
> index 620c0e2..6393b68 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -4599,8 +4599,9 @@ \subsection{Device Operation}\label{sec:Device Type=
s / Block Device / Device Ope
>  of 512 bytes).
> =20
>  The \field{data} used for discard or write zeroes commands consists of o=
ne or
> -more segments.  The maximum number of segments is \field{max_discard_seg=
} for
> -discard commands and \field{max_write_zeroes_seg} for write zeroes comma=
nds.
> +more segments, and one data descriptor corresponds to exactly one such s=
egment.
> +The maximum number of segments is \field{max_discard_seg} for discard co=
mmands
> +and \field{max_write_zeroes_seg} for write zeroes commands.
>  Each segment is of form:

I'm not sure what this means, could you clarify?

There is no concept of "descriptor" in virtio-blk write zeroes/discard.
There is only the "segment" (struct virtio_blk_discard_write_zeroes).

If you are referring to vring descriptors, then there is no relationship
between struct virtio_blk_req::data[] and vring descriptors. The driver
may choose any vring descriptor framing/layout (see 2.6.4 Message
Framing).

Stefan

--7lMq7vMTJT4tNk0a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/+2u8ACgkQnKSrs4Gr
c8g03Af4uL0gXg4tsVmFYgp1tgb8syIpwj/2NzzIV1nW4LohcoCFrpcNwkUm3kyf
4f920vKWWoW0pp5F0gUCRbB87Zpzfeiob6UFS2VKc4ph+SOPcgrvqF9AL1+i1RH8
uiWpsbnD0zrk4KMv/SXlkQLYEuFMmbkHtEG3E0wf4etfD3CpW9in+4t665lasM/g
Y4MyRCcUnecu7HVVf47xAq1A3ZPlOUEr1ZAEP3HAhEBBOSbgvayBdpq0XDAI6YLy
x0HbL1zdR+2GncCE5nc0eS5R3izaNYXWFAeoO1GoD7XRLpkinEjvx/Ul+FMazTdI
166Gm299GHpTnXbf6uafivKeiLGD
=tC7d
-----END PGP SIGNATURE-----

--7lMq7vMTJT4tNk0a--

