Return-Path: <stefanha@redhat.com>
Date: Thu, 2 Dec 2021 16:04:13 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v2 1/2] Add VIRTIO_RING_F_LARGE_INDIRECT_DESC
Message-ID: <YajufTI4Kue2Jnue@stefanha-x1.localdomain>
References: <cover.1638192251.git.qemu_oss@crudebyte.com>
 <c68c30bd357298563a60810e81f431e94785c024.1638192251.git.qemu_oss@crudebyte.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FLK3B3qx7QkGIVpp"
Content-Disposition: inline
In-Reply-To: <c68c30bd357298563a60810e81f431e94785c024.1638192251.git.qemu_oss@crudebyte.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: virtio-comment@lists.oasis-open.org, Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>
List-ID: <virtio-comment.lists.oasis-open.org>


--FLK3B3qx7QkGIVpp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 29, 2021 at 02:22:52PM +0100, Christian Schoenebeck wrote:
> This new feature flag allows indirect descriptor tables to
> exceed the queue size.
>=20
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/122
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  content.tex    | 21 +++++++++++++++++++++
>  split-ring.tex |  2 +-
>  2 files changed, 22 insertions(+), 1 deletion(-)
>=20
> diff --git a/content.tex b/content.tex
> index 5d112af..34fa23e 100644
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
> +  both the maximum amount of slots in the vring, as well as the actual
> +  bulk data size being transmitted per vring slot.
> +
> +  With this feature enabled, the Queue Size only limits the maximum amou=
nt
> +  of slots in the vring, but does not oppose a limit to the actual bulk =
data

s/oppose a limit to/impose a limit on/ but a more concise version is:

  ... does not limit the actual bulk data size ...

> +  size being transmitted when indirect descriptors are used. Decoupling =
these
> +  two configuration parameters this way not only allows much larger bulk=
 data
> +  being transferred per vring slot, but also avoids complicated synchron=
ization
> +  mechanisms if device only supports a very small amount of vring slots.=
 Due to

s/if device/if the device/

--FLK3B3qx7QkGIVpp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGo7n0ACgkQnKSrs4Gr
c8gt9ggAl6qJx1ESj61lwbLEeWPCe3t3JYgl2Psk1f1rxkwkSTOHL15ReQp/8ojL
GeyCUJG1fsYI3MRGrKk6BbdwU7INqNI+ann/crWwzoUWMy0zk5rpRVOdaooDErza
rmAmfrleKbUsD9PIzDzZMsQ0UbBc7CDL8EoWTvaVNPEiq5lu8of4j3TjZ8VKD9h/
gzmDBsdBQ+7jI7aerzYeve1hpWffaR6eXmht8hD72bFm84QBfIn5rxw/eCVbneAn
EiguZCqI804WjrfFCTs+6VD55KXQTWio9tTDZEMuFC9hJFmOirRijhdtrIi2Me4Z
TMQt+mY2tLtbKOFUJCyhhLTzGtodcQ==
=dRhp
-----END PGP SIGNATURE-----

--FLK3B3qx7QkGIVpp--

