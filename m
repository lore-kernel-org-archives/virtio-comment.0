Return-Path: <stefanha@redhat.com>
Date: Thu, 2 Sep 2021 15:07:23 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v5] virtio-vsock: add description for datagram type
Message-ID: <YTDam7jdjRz686bp@stefanha-x1.localdomain>
References: <20210610181203.979686-1-jiang.wang@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xHaviDlxe6Te8LV4"
Content-Disposition: inline
In-Reply-To: <20210610181203.979686-1-jiang.wang@bytedance.com>
To: Jiang Wang <jiang.wang@bytedance.com>
Cc: mst@redhat.com, cohuck@redhat.com, virtio-comment@lists.oasis-open.org, virtualization@lists.linux-foundation.org, asias@redhat.com, sgarzare@redhat.com, arseny.krasnov@kaspersky.com, cong.wang@bytedance.com, duanxiongchun@bytedance.com, xieyongji@bytedance.com, chaiwen.cc@bytedance.com, jhansen@vmware.com, jasowang@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>


--xHaviDlxe6Te8LV4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 10, 2021 at 06:12:03PM +0000, Jiang Wang wrote:
> Add supports for datagram type for virtio-vsock. Datagram
> sockets are connectionless and unreliable. To avoid contention
> with stream and other sockets, add two more virtqueues and
> a new feature bit to identify if those two new queues exist or not.
>=20
> Also add descriptions for resource management of datagram, which
> does not use the existing credit update mechanism associated with
> stream sockets.
>=20
> Signed-off-by: Jiang Wang <jiang.wang@bytedance.com>
> ---

Overall this looks good. The tricky thing will be implementing dgram
sockets in a way that minimizes dropped packets and provides some degree
of fairness between senders. Those are implementation issues though and
not visible at the device specification level.

> diff --git a/virtio-vsock.tex b/virtio-vsock.tex
> index da7e641..26a62ac 100644
> --- a/virtio-vsock.tex
> +++ b/virtio-vsock.tex
> @@ -9,14 +9,37 @@ \subsection{Device ID}\label{sec:Device Types / Socket =
Device / Device ID}
> =20
>  \subsection{Virtqueues}\label{sec:Device Types / Socket Device / Virtque=
ues}
>  \begin{description}
> -\item[0] rx
> -\item[1] tx
> +\item[0] stream rx
> +\item[1] stream tx
> +\item[2] datagram rx
> +\item[3] datagram tx
> +\item[4] event
> +\end{description}
> +The virtio socket device uses 5 queues if feature bit VIRTIO_VSOCK_F_DRG=
AM is set. Otherwise, it
> +only uses 3 queues, as the following.

s/as the following/as follows:/

> +
> +\begin{description}
> +\item[0] stream rx
> +\item[1] stream tx
>  \item[2] event
>  \end{description}
> =20
> +When behavior differs between stream and datagram rx/tx virtqueues
> +their full names are used. Common behavior is simply described in
> +terms of rx/tx virtqueues and applies to both stream and datagram
> +virtqueues.
> +
>  \subsection{Feature bits}\label{sec:Device Types / Socket Device / Featu=
re bits}
> =20
> -There are currently no feature bits defined for this device.
> +\begin{description}
> +\item[VIRTIO_VSOCK_F_STREAM (0)] Device has support for stream socket ty=
pe.
> +\end{description}
> +
> +\begin{description}
> +\item[VIRTIO_VSOCK_F_DGRAM (2)] Device has support for datagram socket t=
ype.

Is this really bit 2 or did you mean bit 1 (value 0x2)?

What happens to the virtqueue layout when VIRTIO_VSOCK_F_DGRAM is
present and VIRTIO_VSOCK_F_STREAM is absent? The virtqueue section above
implies that VIRTIO_VSOCK_F_STREAM is always present.

> +\end{description}
> +
> +If no feature bits are defined, assume device only supports stream socke=
t type.

It's cleaner to define VIRTIO_VSOCK_F_NO_STREAM (0) instead. When the
bit is set the stream socket type is not available and the stream_rx/tx
virtqueues are absent.

This way it's not necessary to define special behavior depending on
certain combinations of feature bits.

>  \subsubsection{Receive and Transmit}\label{sec:Device Types / Socket Dev=
ice / Device Operation / Receive and Transmit}
> -The driver queues outgoing packets on the tx virtqueue and incoming pack=
et
> +The driver queues outgoing packets on the tx virtqueue and allocates inc=
oming packet
>  receive buffers on the rx virtqueue. Packets are of the following form:

This change seems unrelated to dgram sockets. I don't think adding the
word "allocates" makes things clearer or more precise. The driver may
reuse receive buffers rather than allocating fresh buffers. I suggest
dropping this change.

> =20
>  \begin{lstlisting}
> @@ -195,6 +235,7 @@ \subsubsection{Receive and Transmit}\label{sec:Device=
 Types / Socket Device / De
>  };
>  \end{lstlisting}
> =20
> +
>  Virtqueue buffers for outgoing packets are read-only. Virtqueue buffers =
for
>  incoming packets are write-only.
> =20

Unnecessary whitespace change. Please drop.

--xHaviDlxe6Te8LV4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEw2poACgkQnKSrs4Gr
c8jACAgAvWJK8PjstqxPl8/1Pq9uERWqlGzHJXHhwqwtbZpANKpmvKYA/JJrWUfZ
Qs4zBtlpWQw4q8GcUG/c0MYtTxuhqaMbgmEPWlu1jxnQbgndrZp/K1VdHxpHacON
hqZugtMkiqGF7+zppwU8BX3eS4Jz6Omoddds7JkSXaQ2Y0AK6Xn3Rq2dig2S+CZp
synKbLsBYrEm+9CCO0UkCgSfOrO1MdO9UZj9Jv3NeMkXtrk1OYSpF4vA/lHlt177
ye6urw3lIyNvQY9D7qKLIg8ZrH9KB1Vx01UobCaOLdW09E7B5dyDGENWz22KoAbC
rLIPLc5GGmsvsA9WpZmFEX/ZmM9y/g==
=x61w
-----END PGP SIGNATURE-----

--xHaviDlxe6Te8LV4--

