Return-Path: virtio-comment-return-1136-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BC775985FDA
	for <virtio-comment@lists.oasis-open.org>; Wed, 11 Mar 2020 17:43:51 +0000 (UTC)
Date: Wed, 11 Mar 2020 18:43:41 +0100
From: Halil Pasic <pasic@linux.ibm.com>
In-Reply-To: <BN6PR1801MB2067993A8BB5520AEEC18D66C5FF0@BN6PR1801MB2067.namprd18.prod.outlook.com>
References: <BN6PR1801MB2067993A8BB5520AEEC18D66C5FF0@BN6PR1801MB2067.namprd18.prod.outlook.com>
MIME-Version: 1.0
Message-Id: <20200311184341.3ebe55af.pasic@linux.ibm.com>
Subject: Re: [virtio-comment] [PATCH v5] virtio-net: Add support for the
 flexible driver notification structure
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
To: Vitaly Mireyno <vmireyno@marvell.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Ariel Elior <aelior@marvell.com>, Cornelia Huck <cohuck@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, 10 Mar 2020 08:42:14 +0000
Vitaly Mireyno <vmireyno@marvell.com> wrote:

> Currently, the driver notification (available buffer notification) has a =
fixed structure.
> If VIRTIO_F_NOTIFICATION_DATA has been negotiated, it includes: vqn, next=
_off and next_wrap.
> If notify_off_multiplier > 0, the VQ number can be derived by the device =
from the Queue Notify address, so vqn may be redundant.

May or may not be redundant depending on what transport is used! For the
Channel I/O transport it is not redundant, because there is no such
thing like Qeueue Notify address or notify_off_multiplier.

We do have space left in GPR3 which host the notification data, but for
the VIRTIO_NET_F_NOTIF_EXTRA_DATA feature to work with ccw, we would
need to introduce yet another notification data format.

For that silicone whose features Vitaly is trying to bring into the
spec, ccw is very unlikely to matter. But then there was a discussion on
other future uses, which make me worry.

BTW the normative statements for VIRTIO_NET_F_NOTIF_EXTRA_DATA seem to
be all PCI specific. How are other transports supposed to react? Not
accept the feature?

Conny, what is your opinion on this new feature and mechanism?=20

Actually my knowledge of PCI is not sufficient to understand why would a
device play this strange cookie game (making the driver send some device
specific constant for each notification). But that does not matter.

I guess there will be kernel patches for this. Or are there some
already? Can the implementer please put me in cc?

Regards,
Halil

>=20
> Some devices benefit from receiving an additional data with driver notifi=
cations. This data can optionally replace the vqn field in the driver notif=
ication structure.
> In its simplest form, it would be sufficient for this data to be a per-de=
vice constant value.
>=20
> Changes from v4 - articles fix-up.
>=20
> Signed-off-by: Vitaly Mireyno <vmireyno@marvell.com>
> ---
>  content.tex | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>=20
> diff --git a/content.tex b/content.tex
> index b91a132..08e6111 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -965,6 +965,8 @@ \subsubsection{Notification structure layout}\label{s=
ec:Virtio Transport Options
>  struct virtio_pci_notify_cap {
>          struct virtio_pci_cap cap;
>          le32 notify_off_multiplier; /* Multiplier for queue_notify_off. =
*/
> +        le16 notify_data; /* Data to be placed in the vqn field */
> +        le16 padding; /* Pad to a dword */
>  };
>  \end{lstlisting}
> =20
> @@ -984,6 +986,21 @@ \subsubsection{Notification structure layout}\label{=
sec:Virtio Transport Options
>  the same Queue Notify address for all queues.
>  \end{note}
> =20
> +\field{notify_data} is the data that the driver will set in the \field{v=
qn}
> +field in the available buffer notification, if
> +VIRTIO_NET_F_NOTIF_EXTRA_DATA has been negotiated.
> +
> +\begin{note}
> +If \field{notify_off_multiplier} > 0, the virtqueue number can potential=
ly be
> +derived by the device from the Queue Notify address, so \field{vqn} may =
be
> +redundant. Some devices benefit from receiving additional data with driv=
er
> +notifications. An example could be a hardware device implementing multip=
le
> +protocols (with virtio being one of them), so the extra notification dat=
a could
> +serve as a notification type indication or a protocol indication.
> +Another example could be using shared hardware memory space for driver
> +notifications for multiple virtio devices in a trusted environment.
> +\end{note}
> +
>  \devicenormative{\paragraph}{Notification capability}{Virtio Transport O=
ptions / Virtio Over PCI Bus / PCI Device Layout / Notification capability}
>  The device MUST present at least one notification capability.
> =20
> @@ -1020,6 +1037,9 @@ \subsubsection{Notification structure layout}\label=
{sec:Virtio Transport Options
>  cap.length >=3D queue_notify_off * notify_off_multiplier + 4
>  \end{lstlisting}
> =20
> +If the device offers VIRTIO_NET_F_NOTIF_EXTRA_DATA, it MUST set
> +\field{notify_off_multiplier} > 0 in at least one capability.
> +
>  \subsubsection{ISR status capability}\label{sec:Virtio Transport Options=
 / Virtio Over PCI Bus / PCI Device Layout / ISR status capability}
> =20
>  The VIRTIO_PCI_CAP_ISR_CFG capability
> @@ -1519,6 +1539,14 @@ \subsubsection{Available Buffer Notifications}\lab=
el{sec:Virtio Transport Option
>  See \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device=
 Layout / Notification capability}
>  for how to calculate the Queue Notify address.
> =20
> +\drivernormative{\paragraph}{Available Buffer Notifications}{Virtio Tran=
sport Options / Virtio Over PCI Bus / PCI-specific Initialization And Devic=
e Operation / Available Buffer Notifications}
> +The driver SHOULD accept the VIRTIO_NET_F_NOTIF_EXTRA_DATA feature if it=
 has
> +been offered.
> +
> +If VIRTIO_NET_F_NOTIF_EXTRA_DATA has been negotiated and
> +\field{notify_off_multiplier} > 0, the driver MUST set the \field{vqn} f=
ield of
> +the available buffer notification structure to the \field{notify_data} v=
alue.
> +
>  \subsubsection{Used Buffer Notifications}\label{sec:Virtio Transport Opt=
ions / Virtio Over PCI Bus / PCI-specific Initialization And Device Operati=
on / Used Buffer Notifications}
> =20
>  If a used buffer notification is necessary for a virtqueue, the device w=
ould typically act as follows:
> @@ -2895,6 +2923,10 @@ \subsection{Feature bits}\label{sec:Device Types /=
 Network Device / Feature bits
>  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
>      channel.
> =20
> +\item[VIRTIO_NET_F_NOTIF_EXTRA_DATA(57)] Driver provides extra data with
> +    available buffer notifications, to aid in notification processing by=
 the
> +    device.
> +
>  \item[VIRTIO_NET_F_GUEST_HDRLEN(59)] Driver can provide the exact \field=
{hdr_len}
>      value. Device benefits from knowing the exact header length.
> =20
> @@ -2934,6 +2966,7 @@ \subsubsection{Feature bit requirements}\label{sec:=
Device Types / Network Device
>  \item[VIRTIO_NET_F_CTRL_MAC_ADDR] Requires VIRTIO_NET_F_CTRL_VQ.
>  \item[VIRTIO_NET_F_RSC_EXT] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_NE=
T_F_HOST_TSO6.
>  \item[VIRTIO_NET_F_RSS] Requires VIRTIO_NET_F_CTRL_VQ.
> +\item[VIRTIO_NET_F_NOTIF_EXTRA_DATA] Requires VIRTIO_F_NOTIFICATION_DATA=
.
>  \end{description}
> =20
>  \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types / =
Network Device / Feature bits / Legacy Interface: Feature bits}
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


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

