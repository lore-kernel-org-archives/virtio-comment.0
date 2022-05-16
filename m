Return-Path: <virtio-comment-return-3026-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4827A98639D
	for <virtio-comment@lists.oasis-open.org>; Mon, 16 May 2022 08:58:20 +0000 (UTC)
Date: Mon, 16 May 2022 09:58:13 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <YoISJYWGYvmLgpmm@stefanha-x1.localdomain>
References: <20220512080739.1952344-1-alvaro.karsz@solid-run.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dvgQq0gmmx4TdppD"
Content-Disposition: inline
In-Reply-To: <20220512080739.1952344-1-alvaro.karsz@solid-run.com>
Subject: Re: [virtio-comment] [PATCH] Introduction of Virtio Network device
 interrupt coalescing feature
To: Alvaro Karsz <alvaro.karsz@solid-run.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

--dvgQq0gmmx4TdppD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 12, 2022 at 11:07:39AM +0300, Alvaro Karsz wrote:
> Control a network device interrupt coalescing parameters using the contro=
l virtqueue.
> A new control class was added: VIRTIO_NET_CTRL_INTR_COAL.
>=20
> This class provides 2 commands:
> - VIRTIO_NET_CTRL_INTR_COAL_USECS_SET:
>   Ask the network device to change the rx-usecs and tx-usecs parameters.
>   rx-usecs - Time to delay an RX interrupt after packet arrival in micros=
econds.
>   tx-usecs - Time to delay a TX interrupt after a sending a packet in mic=
roseconds.
>=20
> - VIRTIO_NET_CTRL_INTR_COAL_FRAMES_SET:
>   Ask the network device to change the rx-max-frames and tx-max-frames pa=
rameters.
>   rx-max-frames - Number of packets to delay an RX interrupt after packet=
 arrival.
>   tx-max-frames - Number of packets to delay a TX interrupt after sending=
 a packet.
>=20
>=20
> Signed-off-by: Alvaro Karsz <alvaro.karsz@solid-run.com>
> ---
>  content.tex | 41 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)

Please add a sentence about how this interacts with Used Buffer
Notification Suppression. My guess is that suppression takes effect in
addition to virtio-net-specific coalescing, so it's possible that the
notification will be suppressed even after the timer expires or frame
count is exceeded?

Also, since the VIRTIO specification usually talks about Notifications
instead of "interrupts" (see 2.3 Notifications) I think it makes sense
to use that terminology instead of "interrupts". Interrupts are more of
transport-level (e.g. PCI, MMIO) concept than a VIRTIO device model
concept.

--dvgQq0gmmx4TdppD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKCEiUACgkQnKSrs4Gr
c8icqgf/UQVQllV9D72CXnRxHkITWUYoxxsH+9jgZh+gkCkpQq6SHU7vrOoru8Ez
Jh8+evTATDg26aCDRBySmQU1o62x23XVAh9kAnu6/iwbzRBLqXF7733AeVzw+zbt
icOgye1nLJe8EDhbRAl/1au7YAKC4DcfDgqNhs9OW96ewhJMJvJsdbujkrSw/B71
PuRKFGpkmJvsKJdT0U9yPtoiSJoqsEGeTz0Qpw1O2Xm9a+rhTU3Tc9RvvTFe8TIk
so7EB+eLoGiUMCoHbTdPJuS3MF3qJcktn9fGgKZpFqv9axvlbOtsbiPUS3ndxM+5
Oeh0qF4wkiHZj+hqY8hYFSYtyzS9IA==
=wnRa
-----END PGP SIGNATURE-----

--dvgQq0gmmx4TdppD--

