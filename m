Return-Path: virtio-comment-return-1564-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6B8A7986158
	for <virtio-comment@lists.oasis-open.org>; Thu, 17 Dec 2020 15:29:24 +0000 (UTC)
Date: Thu, 17 Dec 2020 15:28:11 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20201217152811.GA24632@stefanha-x1.localdomain>
References: <20201204054615.26124-1-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201204054615.26124-1-jasowang@redhat.com>
Subject: Re: [virtio-comment] [RFC PATCH] virtio-pci: introduce device state
 capability
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
Content-Disposition: inline
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, mst@redhat.com, eperezma@redhat.com, sgarzare@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 04, 2020 at 01:46:15PM +0800, Jason Wang wrote:
> @@ -1247,6 +1249,55 @@ \subsubsection{PCI configuration access capability=
}\label{sec:Virtio Transport O
>  specified by some other Virtio Structure PCI Capability
>  of type other than \field{VIRTIO_PCI_CAP_PCI_CFG}.
> =20
> +\subsubsection{Device State capability}\label{sec:Virtio Transport Optio=
ns / Virtio Over PCI Bus / PCI Device Layout / Device state capability}
> +
> +The device state structure is found at the \field{bar} and \field{offset=
} within the VIRTIO_PCI_CAP_DEVICE_STATE_CFG capability; its layout is belo=
w.
> +
> +\begin{lstlisting}
> +struct virtio_pci_device_state {
> +        /* About a specific virtqueue. */
> +        le16 queue_select;              /* read-write */
> +        le16 last_avail_idx;            /* read-write */
> +        u8 queue_status;                /* read-write */

Starting/stopping queues is useful for managing multiqueue across CPU
hotplug. Perhaps the queue_status functionality should be generic and
not related to device state save/load?

> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +\item[\field{queue_select}]
> +        Queue Select. The driver selects which virtqueue the following
> +        fields refer to.
> +
> +\item[\field{last_avail_idx}]
> +        Last avail index for this virtqueue that is used by the device.

This is only sufficient to save/load devices where all device state is
visible to the driver (I would call them "stateless"). virtio-gpu,
virtio-crypto, and virtio-fs are "stateful" devices in the sense that
devices contain internal state that is not directly visible to the
driver but is needed to save/load the device.

If we want to save/load stateful devices then an additional interface is
needed for this data. It can be large in size (e.g. imagine graphics
buffers or many thousands of inodes) and should therefore probably
support iterative saving.

> +\item[\field{queue_status}]
> +        The driver uses this to stop the executing request for this virt=
queue.
> +        1 - running; 0 - stopped.
> +\end{description}

A per-virtqueue stopped state is not enough to stop a device because
some devices have global behavior like config change events. It must be
possible to completely stop the device to prevent further activity
(VIRTIO config space changes, interrupts, etc).

Maybe a Device Status register bit can be added for that?

> +
> +\devicenormative{\paragraph}{PCI Device State capability}{Virtio Transpo=
rt Options / Virtio Over PCI Bus / PCI Device Layout / PCI Device State cap=
ability}
> +
> +The device MUST present a 0 in \field{queue_status} on reset.
> +
> +The device MUST present a 1 in \field{queue_status} upon writing 1
> +to \field{queue_enable} from common configuration structure by driver.
> +
> +The device MUST complete all inflight requests before presenting a 0
> +in \field{queue_status}.

Is there a definition of "inflight requests"? I think the precise
meaning here is avail requests that the device is processing. It does
not include avail requests that the device has not yet started
processing.

Is there any notification when the queue_status bit transitions from 1
to 0? If not, then drivers must poll the register to detect completion.

Is it possible to resume a virtqueue that is in the process of stopping
(for example, if the guest driver decides a timeout has been reached and
it no longer wishes to stop the virtqueue)?

--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/beQsACgkQnKSrs4Gr
c8jGfwf/bu1tpKfokdPUSuNta3jXkb8YnBSaf4jqkxsYH8Bh/y4/qYn5hcazjdvC
A8wR0JF5o7kotwj98uwFnXqZo33AKz6O3pt5f8pAfpeyfl5sW8M2Re+pW3FvSqrj
d9bzAeq/SIznktjxz1DjpFUT5xaP3E3HvSZ+hpjOz1UWg86otSa4FPtmYpfswjGR
zdJ1dHVM2ajyPEINUU+8oZLyeqidgXv2JlVsaWTcFVjRVyabXtjP6LkyXzJArCHR
BH8WHVaQEq9q45jSK20Gj9iC8hlfjpVj/EXJutAJvD0jUjr4Z9EV5ZWVrhaZlApI
00NWDOzsC2AEkyIlcXmgcbbRh3fRnw==
=Ifm9
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--

