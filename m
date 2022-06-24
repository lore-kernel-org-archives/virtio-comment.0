Return-Path: <virtio-comment-return-3177-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0E2B4986797
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 Jun 2022 15:51:03 +0000 (UTC)
Date: Fri, 24 Jun 2022 16:50:57 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <YrXdYRZ6wVqUAQah@stefanha-x1.localdomain>
References: <20220404134931.28697-1-lauralg@amazon.com>
 <YqnonNuBc/WMWha0@stefanha-x1.localdomain>
 <1625bc1c-5212-d017-5238-f190e40af66a@amazon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FBkJqd7/rXEdcakt"
Content-Disposition: inline
In-Reply-To: <1625bc1c-5212-d017-5238-f190e40af66a@amazon.com>
Subject: Re: [virtio-comment] [PATCH] virtio-vsock: add max payload size
 config field
To: Laura Loghin <lauralg@amazon.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

--FBkJqd7/rXEdcakt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 23, 2022 at 05:27:28PM +0300, Laura Loghin wrote:
> On 6/15/22 17:11, Stefan Hajnoczi wrote:
> > On Mon, Apr 04, 2022 at 04:49:31PM +0300, Laura Loghin wrote:
> > > @@ -57,6 +62,35 @@ \subsection{Device configuration layout}\label{sec=
:Device Types / Socket Device
> > >   \hline
> > >   \end{tabular}
> > > +The following driver-read-only field, \field{data_max_size} only exi=
sts if
> > > +VIRTIO_VSOCK_F_SIZE_MAX is set. This field specifies the maximum pac=
ket payload
> > > +size for the driver to use.
> > This wording can be misinterpreted but can be kept for now. This wording
> > should be updated when the next field is added in the future, indicating
> > that the field is only *used* when VIRTIO_VSOCK_F_SIZE_MAX has been
> > negotiated. Further fields will be located after data_max_size so the
> > field certainly *exists* even when VIRTIO_VSOCK_F_SIZE_MAX is not set.
> >=20
> > If someone misinterprets this they might think the config struct layout
> > depends on the combination of negotiated feature bits. That's not the
> > case, the layout is always the same. The size of the struct depends on
> > the features offered by the device.
> >=20
> > Similar wording is used elsewhere in the spec, so we may want to clarify
> > it for the entire spec.
> >=20
> > Stefan
>=20
> Yes, I agree with you. In fact when I added this section I had a look at
> the corresponding ones from other devices, and got confused by the wordin=
g.
> My understanding actually was that the field won't exist, but indeed I
> found it pretty weird, so it would be great if we can update all the spec
> sections that are propagating this misinterpretation. For now, I will
> update the section in this patch.

Thanks!

Stefan

--FBkJqd7/rXEdcakt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmK13WEACgkQnKSrs4Gr
c8hufgf/Tb17KC/2OFLurozK4C2ujo0gT/E9IAtvtW21zYb/6Sewq57wpkT2Noff
wi2BM5iKEPQEcSneBDRed5ZL5RkldZaZr/Ol/3X57JjP8pqfwqKzmGf9vdkQeSZj
7OGkzM0aQjvzDL9GcclaFEXe7M51CWNNkmxoq+e2/bNR2J8HJgKlgjv0ByKuWQiZ
wN4P5HlxiwitQxNpAhEoTYrQ9EOELgkFx6bH83tcaqDRrT20TGKJv1kl7dCwzm4r
Tk4+VoOYQNZ6vewpZ5haEw4tCzABxA8Lgjs8YgXiZ0cWi6UORAhTPmnT20U0uDpQ
JrqzIfWl4EyDxxCwLeSu4RH0+hyJDw==
=aqYu
-----END PGP SIGNATURE-----

--FBkJqd7/rXEdcakt--

