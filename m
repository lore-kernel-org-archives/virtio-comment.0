Return-Path: <stefanha@redhat.com>
Date: Wed, 24 Nov 2021 17:14:59 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] Add VIRTIO_RING_F_LARGE_INDIRECT_DESC
Message-ID: <YZ5zEwIGpudE8cjB@stefanha-x1.localdomain>
References: <E1mpa34-0008EK-Di@lizzy.crudebyte.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xuh8gxVCjZ3tkyR9"
Content-Disposition: inline
In-Reply-To: <E1mpa34-0008EK-Di@lizzy.crudebyte.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: virtio-comment@lists.oasis-open.org, Greg Kurz <groug@kaod.org>, Cornelia Huck <cohuck@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>


--xuh8gxVCjZ3tkyR9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 19, 2021 at 02:21:12PM +0100, Christian Schoenebeck wrote:
> This new feature flag allows indirect descriptor tables to
> exceed the queue size.
>=20
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
> Stefan noted that there should also be a numeric configuration field
> reflecting a precise limit of indirect descriptors. The question is where
> should that go to exactly? Some devices currently handle this in their
> device specific configuration space. Wouldn't it make sense to handle that
> in the common configuration space instead?

It could be added as a read-only struct virtio_pci_common_cfg le16
queue_indirect_size field. The same needs to be done for the other
transports.

> ---
>  content.tex    | 21 +++++++++++++++++++++
>  split-ring.tex |  2 +-
>  2 files changed, 22 insertions(+), 1 deletion(-)
>=20
> diff --git a/content.tex b/content.tex
> index 5d112af..b42a26b 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -6693,6 +6693,27 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved=
 Feature Bits}
>    transport specific.
>    For more details about driver notifications over PCI see \ref{sec:Virt=
io Transport Options / Virtio Over PCI Bus / PCI-specific Initialization An=
d Device Operation / Available Buffer Notifications}.
> =20
> +  \item[VIRTIO_RING_F_LARGE_INDIRECT_DESC(40)] This feature indicates th=
at the
> +  amount of descriptors in an indirect descriptor table is allowed to ex=
ceed
> +  the Queue Size.
> +
> +  If this feature bit is not negotiated, then a driver MUST NOT create a
> +  descriptor chain longer than the Queue Size, which then also applies to
> +  indirect descriptor tables as in \ref{sec:Basic Facilities of a Virtio
> +  Device / Virtqueues / The Virtqueue Descriptor Table / Indirect
> +  Descriptors}. Which means without this feature, the Queue Size limits
> +  both the maximum amount of pending messages being emplaced in the vrin=
g,

The word "buffers" is typically used instead of "messages".

> +  as well as the actual bulk data size being transmitted.
> +
> +  With this feature enabled, the Queue Size only limits the maximum amou=
nt
> +  of pending messages in the vring, but does not oppose a limit to the a=
ctual
> +  bulk data size being transmitted. Decoupling these two configuration

I think we're still limited by Queue Size in the virtqueue descriptor
table so this statement only applies when indirect descriptors are used:

  "... build data size being transmitted when indirect descriptors are used=
=2E"

> +  parameters this way not only allows much larger bulk data being transf=
erred
> +  per message, but also avoids complicated synchronization mechanisms if
> +  device only supports a very small amount of pending/active messages.
> +  Due to the 16-bit size of a descriptor's "next" field there is still an
> +  absolute limit of $2^{16}$ descriptors per indirect descriptor table.
> +
>  \end{description}
> =20
>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
> diff --git a/split-ring.tex b/split-ring.tex
> index bfef62d..5284635 100644
> --- a/split-ring.tex
> +++ b/split-ring.tex
> @@ -269,7 +269,7 @@ \subsubsection{Indirect Descriptors}\label{sec:Basic =
Facilities of a Virtio Devi
>  one table per descriptor).
> =20
>  A driver MUST NOT create a descriptor chain longer than the Queue Size of
> -the device.
> +the device unless VIRTIO_RING_F_LARGE_INDIRECT_DESC has been negotiated.
> =20
>  A driver MUST NOT set both VIRTQ_DESC_F_INDIRECT and VIRTQ_DESC_F_NEXT
>  in \field{flags}.
> --=20
> 2.20.1
>=20

--xuh8gxVCjZ3tkyR9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGecxMACgkQnKSrs4Gr
c8jvmAf/WJ8J0EMn5EKuiHT4Okkej4WLY6BDseRjROHxTwGumQXa8Bh8XoLWOoUX
PJWya/rB3QA4nZosm8Iiv40BtspiAs9dqA3AMMDn5jVXqQ/5MW8mWsJqteyORWTD
efMJuREHsgMI+E/5i7iYxFtA4oO2+PieZrjYPUwGozTtwMkGW5QOIFd9/3hxjw8J
cHxSycp45QhgYCvY30HgvjTjoASDJ6KwQaGfRNMtjeg+qA357VoG2tMkwCxuDkBr
+hdhBBz5dV1NyG0fslLk7LUYovRVSwy6mdFZRNSQuHmIpyGqKT66tLewa1O9fro4
K6z7lEIwlfj2eDoU/O8Bz4sAdGxcYg==
=Dc04
-----END PGP SIGNATURE-----

--xuh8gxVCjZ3tkyR9--

