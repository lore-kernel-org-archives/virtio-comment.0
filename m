Return-Path: virtio-comment-return-1779-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 56AAA986088
	for <virtio-comment@lists.oasis-open.org>; Tue, 23 Mar 2021 10:28:00 +0000 (UTC)
Date: Tue, 23 Mar 2021 10:27:49 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <YFnCpdO4F9zkTjd9@stefanha-x1.localdomain>
References: <20210322034717.35135-1-jasowang@redhat.com>
 <20210322034717.35135-2-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210322034717.35135-2-jasowang@redhat.com>
Subject: Re: [virtio-comment] [PATCH V2 1/2] virtio: introduce virtqueue
 state as basic facility
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iPHLVN6MVo0CBlK3"
Content-Disposition: inline
To: Jason Wang <jasowang@redhat.com>
Cc: mst@redhat.com, virtio-comment@lists.oasis-open.org, eperezma@redhat.com, lulu@redhat.com, rob.miller@broadcom.com, pasic@linux.ibm.com, sgarzare@redhat.com, cohuck@redhat.com, jim.harford@broadcom.com
List-ID: <virtio-comment.lists.oasis-open.org>

--iPHLVN6MVo0CBlK3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 22, 2021 at 11:47:16AM +0800, Jason Wang wrote:
> This patch adds new device facility to save and restore virtqueue
> state. The virtqueue state is split into two parts:
>=20
> - The available state: The state that is used for read the next
>   available buffer.
> - The used state: The state that is used for make buffer used.
>=20
> This will simply the transport specific method implemention. E.g two
> le16 could be used instead of a single le32). For split virtqueue, we
> only need the available state since the used state is implemented in
> the virtqueue itself (the used index). For packed virtqueue, we need
> both the available state and the used state.
>=20
> Those states are required to implement live migration support for
> virtio device.
>=20
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  content.tex | 81 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
>=20
> diff --git a/content.tex b/content.tex
> index 620c0e2..af39111 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -385,6 +385,83 @@ \section{Exporting Objects}\label{sec:Basic Faciliti=
es of a Virtio Device / Expo
>  types. It is RECOMMENDED that devices generate version 4
>  UUIDs as specified by \hyperref[intro:rfc4122]{[RFC4122]}.
> =20
> +\section{Virtqueue State}\label{sec:Virtqueues / Virtqueue State}
> +
> +When VIRTIO_F_QUEUE_STATE is negotiated, the driver can set and
> +get the device internal virtqueue state through the following
> +fields. The way to access those fields is transport specific.
> +
> +\subsection{\field{Available State} Field}
> +
> +The availabe state field is two bytes virtqueue state that is used by

s/availabe/available/

s/bytes virtqueue state/bytes of virtqueue state/

> +the device to read for the next available buffer.
> +
> +When VIRTIO_RING_F_PACKED is not negotiated, it contains:
> +
> +\begin{lstlisting}
> +le16 last_avail_idx;
> +\end{lstlisting}
> +
> +The \field{last_avail_idx} field is the location where the device read
> +for the next index from the virtqueue available ring.

Perhaps this field can be defined in more detail:

  The \field{last_avail_idx} field is the free-running available ring
  index where the device will read the next available head of a
  descriptor chain.

  See also \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / The =
Virtqueue Available Ring}.

> +
> +When VIRTIO_RING_F_PACKED is negotiated, it contains:
> +
> +\begin{lstlisting}
> +le16 {
> +  last_avail_idx : 15;
> +  last_avail_wrap_counter : 1;
> +};
> +\end{lstlisting}
> +
> +The \field{last_avail_idx} field is the location where the device read
> +for the next descriptor from the virtqueue descriptor ring.

Similar wording as above can be used.

> +
> +The \field{last_avail_wrap_counter} field is the last driver ring wrap
> +counter that is observed by the device.

s/is/was/?

> +
> +See also \ref{sec:Packed Virtqueues / Driver and Device Ring Wrap Counte=
rs}.
> +
> +\subsection{\field{Used State} Field}
> +
> +The availabe state field is two bytes virtqueue state that is used by

s/availabe/used/

s/bytes virtqueue state/bytes of virtqueue state/

> +the device to make buffer used.

s/to make buffer used/when marking a buffer used/

> +
> +When VIRTIO_RING_F_PACKED is negotiated, the used state contains:
> +
> +\begin{lstlisting}
> +le16 {
> +  used_idx : 15;
> +  used_wrap_counter : 1;
> +};
> +\end{lstlisting}
> +
> +The \field{used_idx} field is the location where the device write next
> +used descriptor to the descriptor ring.

Similar as above. It should at least mention whether this is a
free-running index or always less than queue size.

> +
> +The \field{used_wrap_counter} field is the wrap counter that is used
> +by the device.
> +
> +The used state is unnecessary when VIRTIO_RING_F_PACKED is not
> +negotiated.
> +
> +See also \ref{sec:Packed Virtqueues / Driver and Device Ring Wrap Counte=
rs}.
> +
> +\drivernormative{\subsection}{Virtqueue State}{Basic Facilities of a Vir=
tio Device / Virtqueue State}
> +
> +If VIRTIO_F_QUEUE_STATE has been negotiated, a driver MUST set the
> +state of each virtqueue after setting the FEATURE_OK status bit but
> +before setting the DRIVER_OK status bit.
> +
> +If VIRTIO_F_QUEUE_STATE has been negotiated. a driver MUST reset the

s/negotiated./negotiated,/

> +device before getting the virtqueue state.

Interesting approach, but it makes sense that the device must be stopped
before we mess with the queue state :).

I wonder whether requiring the device to keep state across reset will
cause issues in the future or for testing/fuzzing.

Another approach would have been to add a new status register bit for
pausing the device. That reminds me of vhost.

> +
> +\devicenormative{\subsection}{Virtqueue State}{Basic Facilities of a Vir=
tio Device / Virtqueue State}
> +
> +If VIRTIO_F_QUEUE_STATE has been negotiated, a device MUST NOT clear
> +the queue state upon reset and MUST reset the queue state when the
> +driver sets ACKNOWLEDGE status bit.

I only see normative sections mentioning getting the virtqueue state but
not setting it. Please explain how setting works.

--iPHLVN6MVo0CBlK3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBZwqUACgkQnKSrs4Gr
c8hl2Af/TfwzOeUK4QFgh8MhkDKK04SFGlOIHO0cXWKjYKpi5W8Tboak5IFWyLTS
HB90DcBAOTOdTSZKSpo3hINABQ8EiHMt867+TPZzzDrRLLn278sIxmE9C/CJzKZ2
bPJfo0D4f64oy3OhRpMu+RPlb64MwGftguqJfu8cVDyIWQwwcTvTrQ0FkNc/55AN
3Uk4ID+cGTUjrifiW0gJRcXcU90R4iaF7SwGIBv79R+zMvMcVc8EOMeWN1nk4ZRt
f2rL4cvegE3VGxHpv7ORq/jdFTS3FJiE6sieoppJtsoR3QpNIfSXw/cs7bFccGUf
ePE8OEY7mviqPYIe8p1vhlH91RwzEA==
=hNyo
-----END PGP SIGNATURE-----

--iPHLVN6MVo0CBlK3--

