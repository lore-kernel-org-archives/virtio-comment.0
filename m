Return-Path: <stefanha@redhat.com>
Date: Mon, 24 Jan 2022 13:53:45 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 2/2] Add common configuration field "queue_indirect_size"
Message-ID: <Ye6vaQZauiY7xsMB@stefanha-x1.localdomain>
References: <cover.1639494803.git.qemu_oss@crudebyte.com>
 <55b04c584638393050bc76467439550d87e24696.1639494803.git.qemu_oss@crudebyte.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HIhnsOgnJjduQrcS"
Content-Disposition: inline
In-Reply-To: <55b04c584638393050bc76467439550d87e24696.1639494803.git.qemu_oss@crudebyte.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: virtio-comment@lists.oasis-open.org, Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>
List-ID: <virtio-comment.lists.oasis-open.org>


--HIhnsOgnJjduQrcS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 14, 2021 at 04:13:17PM +0100, Christian Schoenebeck wrote:
> This new common configuration field allows to negotiate a more fine
> graded maximum lenght of indirect descriptor chains.
>=20
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/122
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  content.tex    | 25 ++++++++++++++++++++++++-
>  split-ring.tex |  3 +++
>  2 files changed, 27 insertions(+), 1 deletion(-)
>=20
> diff --git a/content.tex b/content.tex
> index 0aa4842..e3cfcae 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -859,6 +859,7 @@ \subsubsection{Common configuration structure layout}=
\label{sec:Virtio Transport
>          le64 queue_driver;              /* read-write */
>          le64 queue_device;              /* read-write */
>          le16 queue_notify_data;         /* read-only for driver */
> +        le32 queue_indirect_size;       /* read-write */

I see no other unaligned fields in this struct, so I think a le16
padding field is needed for safety:

           le64 queue_device;              /* read-write */
           le16 queue_notify_data;         /* read-only for driver */
  +        le16 reserved;                  /* no access */
  +        le32 queue_indirect_size;       /* read-write */

>  };
>  \end{lstlisting}
> =20
> @@ -938,6 +939,16 @@ \subsubsection{Common configuration structure layout=
}\label{sec:Virtio Transport
>          may benefit from providing another value, for example an interna=
l virtqueue
>          identifier, or an internal offset related to the virtqueue numbe=
r.
>          \end{note}
> +
> +\item[\field{queue_indirect_size}]
> +        This field is used to negotiate the maximum amount of descriptor=
s per
> +        vring slot as in \ref{sec:Basic Facilities of a Virtio Device /
> +        Virtqueues / The Virtqueue Descriptor Table / Indirect Descripto=
rs} if
> +        and only if the VIRTIO_RING_F_INDIRECT_SIZE feature has been neg=
otiated.
> +
> +        The device specifies its maximum supported number of descriptors=
 per
> +        vring slot. If the driver requires fewer descriptors, it writes =
its
> +        lower value to inform the device of the reduced resource require=
ments.

"vring slot" is a little vague, it means "indirect descriptor
table"? The two paragraphs could use "maximum number of descriptors per
indirect descriptor table" instead of referring to vring slots to imply
indirect descriptor tables.

--HIhnsOgnJjduQrcS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHur2kACgkQnKSrs4Gr
c8hyxAgAwW6A5SZIOK/Kayew5eIh4NBb5Yt9wY1Uj530YROwLXgtPvNsK0LONbkD
PMWgCvJbZRuor2nGVHws7jiwGdqq/X0ZcXSzOfZ3+A5B+XW08+Wt5xRkg+zzOPoA
zOcxzH2FpsBhh2zSjXUiQF2Eh9YRpKBhb0VhVQslSKVnBzf2ioTLndShDUwJukKR
ItJCsT7dIzylpU5Tg8FJi+mU8mLErKTKTA+nPBUIbO3b/8qGHGD/UEBW2IECAz8Z
B4Tbx3ZaBWJfFd7fI5t6EatE98+uTqh1azzCgY0+al5WbeczkWccVrQWHLxjjbpe
ImLrtKZ0xi2/i9MZIKQI+eUsUGsWfA==
=fIqV
-----END PGP SIGNATURE-----

--HIhnsOgnJjduQrcS--

