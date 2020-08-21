Return-Path: virtio-comment-return-1418-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8EEA3985E87
	for <virtio-comment@lists.oasis-open.org>; Fri, 21 Aug 2020 12:37:14 +0000 (UTC)
Date: Fri, 21 Aug 2020 13:37:05 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20200821123705.GF205318@stefanha-x1.localdomain>
References: <20200804154127.245313-1-lvivier@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200804154127.245313-1-lvivier@redhat.com>
Subject: Re: [virtio-comment] [PATCH v3] virtio-rng: add a control queue
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3yNHWXBV/QO9xKNm"
Content-Disposition: inline
To: Laurent Vivier <lvivier@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Amit Shah <amit@kernel.org>, "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>
List-ID: <virtio-comment.lists.oasis-open.org>

--3yNHWXBV/QO9xKNm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 04, 2020 at 05:41:27PM +0200, Laurent Vivier wrote:

Why can't the driver reset the device so that the buffers are no longer
owned by the device?

> +\subsubsection{Request Virtqueue Flushing}\label{sec:Device Types / Entropy Device / Device Operation / Control Virtqueue / Request Virtqueue Flushing}
> +
> +When the device is not able to provide enough entropy to the driver, the driver may be stuck waiting for the device returning buffers, and cannot be removed to switch to another one.

s/returning/to return/

"cannot be removed to switch to another one"? Is this referring to
hot unplug?

> +The flush command allows the driver to ask the device to release all the buffers sent to the
> +device. This allows the driver to release resources allocated to receive data from the device.
> +
> +\begin{lstlisting}
> +#define VIRTIO_RNG_CMD_FLUSH 0
> +\end{lstlisting}
> +
> +\devicenormative{\paragraph}{Request Virtqueue Flushing}{Device Types / Entropy Device / Device Operation / Control Virtqueue / Request Virtqueue Flushing}
> +
> +When the driver sends a flush request, the device MUST release all outstanding buffers.

"releasing" a buffer is not term defined by the VIRTIO. I guess the full
explanation is:

  When the driver sends a flush request, the device MUST use all
  available requestq buffers and set the used length to 0.

?

--3yNHWXBV/QO9xKNm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl8/v/AACgkQnKSrs4Gr
c8gFHAgAvXCDR/Yf+jx6FMYjWzzpm3nLVYU7CoYBaFSooQwi1jpvZniS6wt8ZKYy
5rc5DkRuiLphDJpyw9OZGcO+tFNza629Z2b0Md1iG5EO+06PIqg3p97QiJ619gvL
m0kLZ7nmLicYzs37Dkp9BSdgS8v+ob8T87jVzbLtBM656tgifIhAWQkCJj8JLHAc
dqlw0B8TUv0XsiaBN1qsOLasdG1U2OZl17yEXOOa7ai7bMK5eYk4bb/9T7Zdi0dK
ndxNm9fLAIXy4p7YWrAyM4O/Bhwwp3HQ9L1NaqR3JUHM6G3OauVL/wh4tnGBCH21
AI8y+ONIVc7ycIbmU0ElPxXORbVFQg==
=WHu/
-----END PGP SIGNATURE-----

--3yNHWXBV/QO9xKNm--

