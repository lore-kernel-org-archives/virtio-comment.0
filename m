Return-Path: virtio-comment-return-1781-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 06A7F9860DD
	for <virtio-comment@lists.oasis-open.org>; Tue, 23 Mar 2021 12:43:57 +0000 (UTC)
Date: Tue, 23 Mar 2021 12:43:44 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <YFnigCXUZrOUzi+G@stefanha-x1.localdomain>
References: <20210323090449.527947-1-arseny.krasnov@kaspersky.com>
MIME-Version: 1.0
In-Reply-To: <20210323090449.527947-1-arseny.krasnov@kaspersky.com>
Subject: [virtio-comment] Re: [RFC PATCH v2] virtio-vsock: use C style defines for constants
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7++bOigjThu86mds"
Content-Disposition: inline
To: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Cc: cohuck@redhat.com, virtio-comment@lists.oasis-open.org, Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Jorgen Hansen <jhansen@vmware.com>, Norbert Slusarek <nslusarek@gmx.net>, Colin Ian King <colin.king@canonical.com>, Andra Paraschiv <andraprs@amazon.com>, Jeff Vander Stoep <jeffv@google.com>, Alexander Popov <alex.popov@linux.com>, virtualization@lists.linux-foundation.org, oxffffaa@gmail.com
List-ID: <virtio-comment.lists.oasis-open.org>

--7++bOigjThu86mds
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2021 at 12:04:44PM +0300, Arseny Krasnov wrote:
> This:
> 1) Replaces enums with C style defines.

Why? Please include the rationale for this change in the commit
description.

> @@ -227,6 +226,11 @@ \subsubsection{Stream Sockets}\label{sec:Device Type=
s / Socket Device / Device O
>  hints are permanent once sent and successive packets with bits clear do =
not
>  reset them.
> =20
> +\begin{lstlisting}
> +#define VIRTIO_VSOCK_SHUTDOWN_RECEIVE_BIT 0
> +#define VIRTIO_VSOCK_SHUTDOWN_SEND_BIT    1
> +\end{lstlisting}

Please reference these constants in the text.

--7++bOigjThu86mds
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBZ4oAACgkQnKSrs4Gr
c8grbwf/QpQv0yclIltRjvbToaCHTiL/3nYDrNvSutUYYhF2GBLL9EHgW6XB0OzT
4hxEChT5d/LfUmcab8CIZ87k2W2y+mjQls08EsByAHAE26LQBqkXp7vI02H7oaWe
jf5DUL6he4WujzbJ0q351tIKEcZ0mFpu7F1td95MRWtvqB0gWLy1TIYrS7VOUD1F
+pxF98q5UaDUJ14cas8hPZLLbxILlUrISR9518eszizN0lXW3r2FW8y7lxyMwGZY
48ar0mhlEZRljR+BBiKDIHMv42YUOYEFII/4QtwuXdsbckgajA+xJWAOaB7H0HeK
m1aQVN4/RghQSpDxRnS6mrvr8weEQg==
=hbs5
-----END PGP SIGNATURE-----

--7++bOigjThu86mds--

