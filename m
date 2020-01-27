Return-Path: virtio-comment-return-1030-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F24C3985BDE
	for <virtio-comment@lists.oasis-open.org>; Mon, 27 Jan 2020 09:50:01 +0000 (UTC)
Date: Mon, 27 Jan 2020 09:49:51 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20200127094951.GD18565@stefanha-x1.localdomain>
References: <BN6PR1801MB2067D952D58B2561DD501794C5080@BN6PR1801MB2067.namprd18.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BN6PR1801MB2067D952D58B2561DD501794C5080@BN6PR1801MB2067.namprd18.prod.outlook.com>
Subject: Re: [virtio-comment] [PATCH] virtio-net: Add support for the
 flexible driver notification
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RhUH2Ysw6aD5utA4"
Content-Disposition: inline
To: Vitaly Mireyno <vmireyno@marvell.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

--RhUH2Ysw6aD5utA4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 26, 2020 at 12:10:28PM +0000, Vitaly Mireyno wrote:
> Currently, the driver notification (available buffer notification) has a =
fixed structure.
> If VIRTIO_F_NOTIFICATION_DATA has been negotiated, it includes: vqn, next=
_off and next_wrap.
> If notify_off_multiplier > 0, the VQ number can be derived by the device =
from the Queue Notify address, so vqn may be redundant.
>=20
> Some devices benefit from receiving an additional data with driver notifi=
cations (because of the specific hardware implementation). This data can op=
tionally replace the vqn field in the driver notification structure.
> In its simplest form, it would be sufficient for this data to be a per-de=
vice constant value.
>=20
>=20
> Signed-off-by: Vitaly Mireyno <vmireyno@marvell.com>
> ---
>  content.tex | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)

Hi Vitaly,
Can you give a concrete example of how devices can use this feature?

The reason I'm a little unsure is that the PCI capability only provides
a single notify_data value per device.  That same value is then passed
back to the device in the notify write.

If there is just a single constant value per device, why is it necessary
to involve the driver at all?  Doesn't the device already know its own
magic value and it doesn't really need the driver to pass the value back
to it?

Stefan

> diff --git a/content.tex b/content.tex
> index 06bb4ca..265dc12 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -965,6 +965,9 @@ \subsubsection{Notification structure layout}\label{s=
ec:Virtio Transport Options
>  struct virtio_pci_notify_cap {
>          struct virtio_pci_cap cap;
>          le32 notify_off_multiplier; /* Multiplier for queue_notify_off. =
*/
> +        le16 notify_data; /* The data to be placed in the vqn field */
> +        u8 notify_data_valid;
> +        u8 padding; /* Pad to a dword */
>  };
>  \end{lstlisting}
> =20
> @@ -984,6 +987,9 @@ \subsubsection{Notification structure layout}\label{s=
ec:Virtio Transport Options
>  the same Queue Notify address for all queues.
>  \end{note}
> =20
> +If \field{notify_data_valid} !=3D 0, the driver will set the \field{vqn}=
 field
> +in the available buffer notification structure to the \field{notify_data=
} value.
> +
>  \devicenormative{\paragraph}{Notification capability}{Virtio Transport O=
ptions / Virtio Over PCI Bus / PCI Device Layout / Notification capability}
>  The device MUST present at least one notification capability.
> =20
> @@ -1020,6 +1026,12 @@ \subsubsection{Notification structure layout}\labe=
l{sec:Virtio Transport Options
>  cap.length >=3D queue_notify_off * notify_off_multiplier + 4
>  \end{lstlisting}
> =20
> +The device MAY set \field{notify_data_valid} to any non-zero value, to r=
equest
> +the driver to set the \field{vqn} to the \field{notify_data} value.
> +If the device sets \field{notify_data_valid} to a non-zero value, it MUS=
T set
> +\field{notify_data} to a valid value.
> +For a normal operation, the device MUST set \field{notify_data_valid} to=
 zero.
> +
>  \subsubsection{ISR status capability}\label{sec:Virtio Transport Options=
 / Virtio Over PCI Bus / PCI Device Layout / ISR status capability}
> =20
>  The VIRTIO_PCI_CAP_ISR_CFG capability
> @@ -1519,6 +1531,18 @@ \subsubsection{Available Buffer Notifications}\lab=
el{sec:Virtio Transport Option
>  See \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device=
 Layout / Notification capability}
>  for how to calculate the Queue Notify address.
> =20
> +\drivernormative{\paragraph}{Available Buffer Notifications}{Virtio Tran=
sport Options / Virtio Over PCI Bus / PCI-specific Initialization And Devic=
e Operation / Available Buffer Notifications}
> +If VIRTIO_F_NOTIFICATION_DATA has been negotiated, and if
> +\field{notify_data_valid} !=3D 0, the driver MUST set the \field{vqn} fi=
eld of
> +the available buffer notification structure to the \field{notify_data} v=
alue.
> +
> +\begin{note}
> +If \field{notify_off_multiplier} > 0, the virtqueue number can potential=
ly be
> +derived by the device from the Queue Notify address, so \field{vqn} may =
be
> +redundant. Some devices benefit from receiving the additional data with =
driver
> +notifications (because of the specific hardware implementation).
> +\end{note}
> +
>  \subsubsection{Used Buffer Notifications}\label{sec:Virtio Transport Opt=
ions / Virtio Over PCI Bus / PCI-specific Initialization And Device Operati=
on / Used Buffer Notifications}
> =20
>  If a used buffer notification is necessary for a virtqueue, the device w=
ould typically act as follows:
> --
>=20
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>=20
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>=20
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
>=20

--RhUH2Ysw6aD5utA4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl4usj8ACgkQnKSrs4Gr
c8jAugf/dvfdkJx4ef9EN6nOgOal0JF9t4Du4AOxYCly70u7TdpPhFIlHnAQmkmA
HIZsOkn31tMyTuLjUTD6eO0v6s8T3OUToRA/GS2KzVZXyFjonBWfidN/nwervcHO
YejfJyRQw+kzTKKzT66W6jk+mnxtbEHX/w3Cuf8L3L4rPVrobkPesNOKoV9r/T3A
++CrnK/JUN4MF+9rIpPCWhlXpsy8mYtwBlFmuNiiJGbjdjyYAnySer1K3rUq7Fdu
PtD8WbEeIqPGhaDrI+5ep5klQWiKXXY8NML18rEEu6r1mesKZXKSkTfUFGSE38I0
YnQ69dTmdGguKwI5iVv6vNA29stEKg==
=r3bn
-----END PGP SIGNATURE-----

--RhUH2Ysw6aD5utA4--

