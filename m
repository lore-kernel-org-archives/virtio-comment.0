Return-Path: <stefanha@redhat.com>
Date: Mon, 29 Nov 2021 10:16:50 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [virtio-comment] [PATCH 1/1] split-ring: clarify the field len
 in the used ring
Message-ID: <YaSokleLquXepxI4@stefanha-x1.localdomain>
References: <20211126171233.16083-1-pasic@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QPlo9ODRaDbRu6qn"
Content-Disposition: inline
In-Reply-To: <20211126171233.16083-1-pasic@linux.ibm.com>
To: Halil Pasic <pasic@linux.ibm.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, virtio@lists.oasis-open.org, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>


--QPlo9ODRaDbRu6qn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 26, 2021 at 06:12:33PM +0100, Halil Pasic wrote:
> The current descriptor is misleading: "the descriptor chain which was

s/current descriptor/current description/?

> used" generally includes both the descriptors that map the device read
> only, and descriptors that  map the device write only portions of the
> buffer described by the descriptor chain. The argument that "used" means
> "written to" does not stand because one has to "use" the descriptor
> chain even when the whole buffer is device read only.
>=20
> One can argue, that the most straightforward way to interpret the phrase
> "total length of that descriptor chain" (without context) like the
> length of the  list is usually defined: i.e. like the number of
> descriptors that constitute the chain. This is clearly not what we want
> here. Another intuitive way to interpret "total length of that
> descriptor chain" is size of the buffer mapped by the descriptor chain.
> This is not what we want either. In fact such wrongful interpretations
> have caused bugs in the wild.
>=20
> On the other hand, the text below the listing that gets modified here
> clearly describes the semantics of \field{len}. So let us replace
> the ambiguous explanation in the listing, with a hopefully non-ambiguous
> one.
>=20
> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> ---
>  split-ring.tex | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/split-ring.tex b/split-ring.tex
> index bfef62d..68dca07 100644
> --- a/split-ring.tex
> +++ b/split-ring.tex
> @@ -402,7 +402,10 @@ \subsection{The Virtqueue Used Ring}\label{sec:Basic=
 Facilities of a Virtio Devi
>  struct virtq_used_elem {
>          /* Index of start of used descriptor chain. */
>          le32 id;
> -        /* Total length of the descriptor chain which was used (written =
to) */
> +        /*
> +	 * The number of bytes written into the device writable portion of
> +	 * the buffer described by the descriptor chain.
> +	 */

Spaces vs tabs. It looks like 8 spaces should be used here.

Otherwise:
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--QPlo9ODRaDbRu6qn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGkqJIACgkQnKSrs4Gr
c8hc4Qf/eu2cbBK0gFKzJeSDrd46LZfDv+E6fHrxc+KOVJFJepY9jBRu/ekrM649
crzLFw/OA9GnuUpHJmH/hQozXjV5WYKW2N136pkGQZA4SySzvvrTiGb3z7FulW5v
p+tj5FdIb80c2pWPQ516MvH25lOlyHvrXEhg/1HkEKPntX5PFKRmFdnwlyJLRX2k
zDSmgoLvA41KGN+75QiAyqRPJn+voiTquOAh3/FPq6Zl+5P5KYBRu2Jkc9koVkCY
/7GMGy9r9Q4LMZwugdKpPGUqWqNu/dGtSTY7n+iUDPgNQMX1WQ2oIsPX8m/S7Jel
LfnWHS1y81Lyl+nhiu1UrQOmQ8QwZA==
=txbN
-----END PGP SIGNATURE-----

--QPlo9ODRaDbRu6qn--

