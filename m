Return-Path: <stefanha@redhat.com>
Date: Thu, 2 Dec 2021 16:21:05 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v2 2/2] Add common configuration field
 "queue_indirect_size"
Message-ID: <YajycS/6kFMgTDVy@stefanha-x1.localdomain>
References: <cover.1638192251.git.qemu_oss@crudebyte.com>
 <4f5146a4bcbe59a76698e276216ef4a4d2270b61.1638192251.git.qemu_oss@crudebyte.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IR9AGpGC/+MjNKfK"
Content-Disposition: inline
In-Reply-To: <4f5146a4bcbe59a76698e276216ef4a4d2270b61.1638192251.git.qemu_oss@crudebyte.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: virtio-comment@lists.oasis-open.org, Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>
List-ID: <virtio-comment.lists.oasis-open.org>


--IR9AGpGC/+MjNKfK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 29, 2021 at 02:23:01PM +0100, Christian Schoenebeck wrote:
> This new common configuration field allows to negotiate a more fine
> graded numeric maximum length of indirect descriptor chains.
>=20
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/122
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  content.tex    | 37 ++++++++++++++++++++++++++++++++++++-
>  split-ring.tex |  5 +++++
>  2 files changed, 41 insertions(+), 1 deletion(-)
>=20
> diff --git a/content.tex b/content.tex
> index 34fa23e..25861f3 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -859,6 +859,7 @@ \subsubsection{Common configuration structure layout}=
\label{sec:Virtio Transport
>          le64 queue_driver;              /* read-write */
>          le64 queue_device;              /* read-write */
>          le16 queue_notify_data;         /* read-only for driver */
> +        le16 queue_indirect_size;       /* read-write */
>  };
>  \end{lstlisting}
> =20
> @@ -938,6 +939,34 @@ \subsubsection{Common configuration structure layout=
}\label{sec:Virtio Transport
>          may benefit from providing another value, for example an interna=
l virtqueue
>          identifier, or an internal offset related to the virtqueue numbe=
r.
>          \end{note}
> +
> +\item[\field{queue_indirect_size}]
> +        This field was added in revision 3 and MUST exist if revision 3
> +        has been negotiated. This field is used to negotiate the maximum
> +        amount of indirect descriptors per indirect descriptor table as =
in
> +        \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / The
> +        Virtqueue Descriptor Table / Indirect Descriptors}.
> +
> +        The device specifies its supported maximum amount here first,
> +        subsequently driver may read and then SHOULD write this field to
> +        lower the value if driver's maximum amount of indirect descripto=
rs
> +        ever being emplaced by driver per vring slot is less than what
> +        device supports. However driver MUST NOT increase this value.

may/SHOULD/MUST NOT statements need to go into drivernormative or
devicenormative sections.

I suggest phrasing it so functionality is described here and normative
sections don't repeat what was already covered:

  The device specifies its maximum supported number of descriptors per
  indirect descriptor table. If the driver requires fewer descriptors,
  it writes its lower value to inform the device of the reduced resource
  requirements.

The drivernormative section would say:

- The driver SHOULD write the field if its maximum number of descriptors
  per indirect descriptor table is lower than that reported by the
  device.
- The driver MUST NOT write a higher value than the one it reads from
  the device.

> +
> +        Two different semantics evolve for the value of this field, depe=
nding on
> +        whether VIRTIO_RING_F_LARGE_INDIRECT_DESC (see section
> +        \ref{sec:Reserved Feature Bits}) has been negotiated:
> +
> +        If VIRTIO_RING_F_LARGE_INDIRECT_DESC has not been negotiated, th=
en the
> +        effective maximum amount of indirect descriptors per indirect de=
scriptor
> +        table is min(Queue Size, \field{queue_indirect_size}). So in thi=
s case
> +        this field allows driver to indicate if its supported maximum am=
ount of
> +        indirect descriptors is less than Queue Size.

I expected the !VIRTIO_RING_F_LARGE_INDIRECT_DESC case to preserve
existing behavior to avoid breaking existing drivers/devices. An
existing driver that honors Queue Size and doesn't know about
queue_indirect_size now violates the spec when a new device reports a
queue_indirect_size value less than Queue Size.

I expected drivers to only check queue_indirect_size when
VIRTIO_RING_F_LARGE_INDIRECT_DESC is negotiated.

> +
> +        If VIRTIO_RING_F_LARGE_INDIRECT_DESC has been negotiated, then t=
he
> +        effective maximum amount of indirect descriptors per indirect de=
scriptor
> +        table is directly and solely reflected by \field{queue_indirect_=
size}
> +        field here.
>  \end{description}
> =20
>  \devicenormative{\paragraph}{Common configuration structure layout}{Virt=
io Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common con=
figuration structure layout}
> @@ -6712,7 +6741,13 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved=
 Feature Bits}
>    being transferred per vring slot, but also avoids complicated synchron=
ization
>    mechanisms if device only supports a very small amount of vring slots.=
 Due to
>    the 16-bit size of a descriptor's "next" field there is still an absol=
ute
> -  limit of $2^{16}$ descriptors per indirect descriptor table.
> +  limit of $2^{16}$ descriptors per indirect descriptor table. However t=
he
> +  actual maximum amount supported by either device or driver might be le=
ss,
> +  and therefore the common configuration field "queue_indirect_size" MUS=
T exist
> +  if VIRTIO_RING_F_LARGE_INDIRECT_DESC had been negotiated to subsequent=
ly

s/had been/was/

--IR9AGpGC/+MjNKfK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGo8nEACgkQnKSrs4Gr
c8isRAf+OhyxaYzwXD8/31H5bWoAmxpwZyNq2M9pKvLqv5uz+bVgWrVnQOwM+bJX
YMlZcaEmx2nnpQLwlC76R0vLJmeO2o2z+kQEig+yKROsOsP+3jMuDwnna+w0MAhi
iL+41oohgNM43r/QqMhxEhOI9hutfGFQn1NWKdJmA+t7+ju/8kAITcLLby7VRglQ
dwVSwSKHk0wopChjUYb+aILzz83/X+rb6cUsT+1LqtFYDToZNnoVf74/0GvQ0/Z4
FbLX7EeF4xEZ9lPxr41z7cFpEROCZ7ASgROhX7xgSFdT3Ah5cGmt6yJbqyzKQ2fr
fUhd9LJOsmpxjsm7ZelDskafuM3wuQ==
=rePM
-----END PGP SIGNATURE-----

--IR9AGpGC/+MjNKfK--

