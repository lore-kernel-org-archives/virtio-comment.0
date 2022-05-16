Return-Path: <virtio-comment-return-3030-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 063859863A3
	for <virtio-comment@lists.oasis-open.org>; Mon, 16 May 2022 15:45:08 +0000 (UTC)
Date: Mon, 16 May 2022 16:45:00 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <YoJxfLJLwn28i+Pz@stefanha-x1.localdomain>
References: <20220516103256.896922-1-alvaro.karsz@solid-run.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zJhoNXh48rgK/Yuf"
Content-Disposition: inline
In-Reply-To: <20220516103256.896922-1-alvaro.karsz@solid-run.com>
Subject: Re: [virtio-comment] [PATCH v2] Introduction of Virtio Network
 device notifications coalescing feature
To: Alvaro Karsz <alvaro.karsz@solid-run.com>
Cc: virtio-comment@lists.oasis-open.org, rabeeh@solid-run.com, "Michael S. Tsirkin" <mst@redhat.com>, jasowang@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

--zJhoNXh48rgK/Yuf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 16, 2022 at 01:32:56PM +0300, Alvaro Karsz wrote:
> Control a network device notifications coalescing parameters using the co=
ntrol virtqueue.
> A new control class was added: VIRTIO_NET_CTRL_NOTF_COAL.
>=20
> This class provides 2 commands:
> - VIRTIO_NET_CTRL_NOTF_COAL_USECS_SET:
>   Ask the network device to change the rx-usecs and tx-usecs parameters.
>   rx-usecs - Time to delay an RX notification after packet arrival in mic=
roseconds.
>   tx-usecs - Time to delay a TX notification after a sending a packet in =
microseconds.
>=20
> - VIRTIO_NET_CTRL_NOTF_COAL_FRAMES_SET:
>   Ask the network device to change the rx-max-frames and tx-max-frames pa=
rameters.
>   rx-max-frames - Number of packets to delay an RX notification after pac=
ket arrival.
>   tx-max-frames - Number of packets to delay a TX notification after send=
ing a packet.
>=20
> --
> v2:
> 	- Usage of notification terminology.
> 	- Add a few lines on what device should do when driver asked to
> 	  suppress notifications.
>=20
> Signed-off-by: Alvaro Karsz <alvaro.karsz@solid-run.com>
> ---
>  content.tex | 148 +++++++++++++++++++++++++++++++++-------------------
>  1 file changed, 95 insertions(+), 53 deletions(-)
>=20
> diff --git a/content.tex b/content.tex
> index 7508dd1..161acc0 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -167,11 +167,11 @@ \section{Notifications}\label{sec:Basic Facilities =
of a Virtio Device
>  to driver) plays an important role in this specification. The
>  modus operandi of the notifications is transport specific.
> =20
> -There are three types of notifications:=20
> +There are three types of notifications:

There are whitespace changes in this patch that should probably be
dropped. If you want to clean up whitespace, please submit a separate
patch so that this patch only does one thing.

> +\devicenormative{\subparagraph}{Notifications Coalescing}{Device Types /=
 Network Device / Device Operation / Control Virtqueue / Notifications Coal=
escing}
> +
> +A device SHOULD respond to the VIRTIO_NET_CTRL_NOTF_COAL commands with V=
IRTIO_NET_ERR if was not able to change the parameters.\\ \\
> +A device SHOULD NOT send notifications to the driver, if the driver aske=
d to suppress notifications by setting the suppress notifications flag in t=
he driver area.\\ \\
> +If VIRTIO_F_EVENT_IDX feature was negotiated, the device SHOULD start co=
unting the coalescing parameters from the point it reached to the buffer sp=
ecified by the driver.

I can't parse the last sentence. My guess is that VIRTIO_F_EVENT_IDX and
*-max-frames have similar effects in suppressing notifications. However,
*-max-frames counts packets (I guess the driver's view of
pre-TSO/GSO/etc packets, not actual packets on the network), while
VIRTIO_F_EVENT_IDX counts virtqueue buffers and therefore diverges due
to VIRTIO_NET_F_MRG_RXBUF (multiple virtqueue buffers can be used to
represent one rx packet).

The rx code would be something like:

  add_used_buf(rx_buf)
  if coal_notf(RX): # coalescing happens here
      notify_used_buf() # Used Buffer Notification Suppression here

This means drivers that poll will already see used buffers. They just
don't get notifications until both coalescing and Used Buffer
Notification Suppression raise an interrupt.

If rx-max-frames =3D 10 and EVENT_IDX is +20 then the driver sees no
notification after 10 frames because EVENT_IDX will suppress the
notification.

I guess there's a danger of receiving no interrupts or at least weird
suppression patterns when both these mechanisms are enabled
simultaneously. Should drivers avoid using both at the same time?

Stefan

--zJhoNXh48rgK/Yuf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKCcXwACgkQnKSrs4Gr
c8gFdggAwExhrYaGVG6nTEXVOzlm4IKzbgGqhFqQq57K/8+2Q+1iumyHI8oLjo0V
nBGl/WxMjNLRO4oSItiyE080Z1pGZiJO/m2ncBayy05vJvwXJm+f03XdAPFssogZ
mJbhHOo2VuEgAILFPSNO3tdCr+CrF4DXBwDARZrPJ3ZizXAjiu5nw31DET34qXRv
Z30PqayFqAO9Sa+i0RnZiXyjUUyGR1RF+YxjQG7qb0LcnwWfP9eP5/IfGbqk2b7j
SGWGfOmwpa4JtgAz9lVFh2o4g/XBooX/viOwmtooYTJZQVuvxnopnma2rKfWZzCv
0yKgJ//GSYCKkQlSQcEhZExPXnKy0w==
=CeKf
-----END PGP SIGNATURE-----

--zJhoNXh48rgK/Yuf--

