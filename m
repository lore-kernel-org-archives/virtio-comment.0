Return-Path: virtio-comment-return-1780-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 48D0D986088
	for <virtio-comment@lists.oasis-open.org>; Tue, 23 Mar 2021 10:40:47 +0000 (UTC)
Date: Tue, 23 Mar 2021 10:40:37 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <YFnFpcaAg0atjwTt@stefanha-x1.localdomain>
References: <20210322034717.35135-1-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210322034717.35135-1-jasowang@redhat.com>
Subject: Re: [virtio-comment] [PATCH V2 0/2] Introduce VIRTIO_F_QUEUE_STATE
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rzf5wWNLD+b+4R9Z"
Content-Disposition: inline
To: Jason Wang <jasowang@redhat.com>
Cc: mst@redhat.com, virtio-comment@lists.oasis-open.org, eperezma@redhat.com, lulu@redhat.com, rob.miller@broadcom.com, pasic@linux.ibm.com, sgarzare@redhat.com, cohuck@redhat.com, jim.harford@broadcom.com
List-ID: <virtio-comment.lists.oasis-open.org>

--rzf5wWNLD+b+4R9Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 22, 2021 at 11:47:15AM +0800, Jason Wang wrote:
> This is a new version to support VIRTIO_F_QUEUE_STATE. The feautre
> extends the basic facility to allow the driver to set and get device
> internal virtqueue state. This main motivation is to support live
> migration of virtio devices.

Can you describe the use cases that this interface covers as well as the
steps involved in migrating a device? Traditionally live migration was
transparent to the VIRTIO driver because it was performed by the
hypervisor.

I know you're aware but I think it's worth mentioning that this only
supports stateless devices. Even the simple virtio-blk device has state
in QEMU's implementation. If an I/O request fails it can be held by the
device and resumed after live migration instead of failing the request
immediately. The list of held requests needs to be migrated with the
device and is not part of the virtqueue state.

I'm concerned that using device reset will not work once this interface
is extended to support device-specific state (e.g. the virtio-blk failed
request list). There could be situations where reset really needs to
reset (e.g. freeing I/O resources) and the device therefore cannot hold
on to state across reset.

Stefan

--rzf5wWNLD+b+4R9Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBZxaUACgkQnKSrs4Gr
c8hm9gf/XbpLAwR6Eelp7wyejpJabrrM6S7fCHFwwqIlRz3iI+eIcuA4sE8kKKrC
ES3BOGDDVkzaCjZeOVO6wvm/3b8DhD4G3eYm260Mknxs+v8uxKoZ+Iwy+e4Lyw6P
nG3P7Afncpl8d4dVtFW7F2AsCUyyiuIEyP1V4PrmeiOnZ12LbW0/1ToU1txhRNZt
oJsKY3IMwY1sBUyzQeSQTa2bfILjfXv9WvJDMUQkGPRChhcJEOw8tlLQWzJfqHp5
evIYlkMAI2FzQ0Yv5mSRGK8mVAjzCAa/pPev0VNAyIvT8vf//b8CAZex8JvG/2wY
zoJIqajygT3tRpN4OL5L2XvL2xpqIQ==
=mKAR
-----END PGP SIGNATURE-----

--rzf5wWNLD+b+4R9Z--

