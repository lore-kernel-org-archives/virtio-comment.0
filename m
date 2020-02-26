Return-Path: virtio-comment-return-1102-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AB9CD985DF6
	for <virtio-comment@lists.oasis-open.org>; Wed, 26 Feb 2020 03:13:13 +0000 (UTC)
References: <BN6PR1801MB20678805065085E44D173C74C5ED0@BN6PR1801MB2067.namprd18.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <65d7f621-f9d2-c4a5-f5dc-1c6256c6c7b1@redhat.com>
Date: Wed, 26 Feb 2020 11:12:54 +0800
MIME-Version: 1.0
In-Reply-To: <BN6PR1801MB20678805065085E44D173C74C5ED0@BN6PR1801MB2067.namprd18.prod.outlook.com>
Content-Language: en-US
Subject: Re: [virtio-comment] [PATCH v3] virtio-net: Add support for the
 flexible driver notification structure
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
To: Vitaly Mireyno <vmireyno@marvell.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Ariel Elior <aelior@marvell.com>
List-ID: <virtio-comment.lists.oasis-open.org>


On 2020/2/26 =E4=B8=8A=E5=8D=8812:30, Vitaly Mireyno wrote:
> Currently, the driver notification (available buffer notification) has a =
fixed structure.
> If VIRTIO_F_NOTIFICATION_DATA has been negotiated, it includes: vqn, next=
_off and next_wrap.
> If notify_off_multiplier > 0, the VQ number can be derived by the device =
from the Queue Notify address, so vqn may be redundant.
>
> Some devices benefit from receiving an additional data with driver notifi=
cations. This data can optionally replace the vqn field in the driver notif=
ication structure.
> In its simplest form, it would be sufficient for this data to be a per-de=
vice constant value.
>
> Changes from v2 - Defined a new feature flag instead of a PCI-specific fl=
ag.
>
> Signed-off-by: Vitaly Mireyno <vmireyno@marvell.com>
> ---
>   content.tex | 34 ++++++++++++++++++++++++++++++++++
>   1 file changed, 34 insertions(+)
>
> diff --git a/content.tex b/content.tex
> index b91a132..5223d5c 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -965,6 +965,8 @@ \subsubsection{Notification structure layout}\label{s=
ec:Virtio Transport Options
>   struct virtio_pci_notify_cap {
>           struct virtio_pci_cap cap;
>           le32 notify_off_multiplier; /* Multiplier for queue_notify_off.=
 */
> +        le16 notify_data; /* Data to be placed in the vqn field */
> +        le16 padding; /* Pad to a dword */
>   };
>   \end{lstlisting}
>  =20
> @@ -984,6 +986,21 @@ \subsubsection{Notification structure layout}\label{=
sec:Virtio Transport Options
>   the same Queue Notify address for all queues.
>   \end{note}
>  =20
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
> +redundant. Some devices benefit from receiving the additional data with =
driver
> +notifications. An example could be a hardware device implementing multip=
le
> +protocols (with virtio being one of them), so extra notification data co=
uld
> +serve as a notification type indication or a protocol indication.
> +Another example could be using shared hardware memory space for driver
> +notifications for multiple virtio devices in a trusted environment.
> +\end{note}
> +
>   \devicenormative{\paragraph}{Notification capability}{Virtio Transport =
Options / Virtio Over PCI Bus / PCI Device Layout / Notification capability=
}
>   The device MUST present at least one notification capability.
>  =20
> @@ -1020,6 +1037,10 @@ \subsubsection{Notification structure layout}\labe=
l{sec:Virtio Transport Options
>   cap.length >=3D queue_notify_off * notify_off_multiplier + 4
>   \end{lstlisting}
>  =20
> +If VIRTIO_NET_F_NOTIF_EXTRA_DATA has been negotiated, the device MUST se=
t
> +\field{notify_data} to a valid value, and SHOULD set
> +\field{notify_off_multiplier} > 0.
> +
>   \subsubsection{ISR status capability}\label{sec:Virtio Transport Option=
s / Virtio Over PCI Bus / PCI Device Layout / ISR status capability}
>  =20
>   The VIRTIO_PCI_CAP_ISR_CFG capability
> @@ -1519,6 +1540,14 @@ \subsubsection{Available Buffer Notifications}\lab=
el{sec:Virtio Transport Option
>   See \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Devic=
e Layout / Notification capability}
>   for how to calculate the Queue Notify address.
>  =20
> +\drivernormative{\paragraph}{Available Buffer Notifications}{Virtio Tran=
sport Options / Virtio Over PCI Bus / PCI-specific Initialization And Devic=
e Operation / Available Buffer Notifications}
> +The driver SHOULD accept the VIRTIO_NET_F_NOTIF_EXTRA_DATA feature if it=
 has
> +been offered.


I think we need use "MUST" here?

Other looks good to me.

Thanks


> +
> +If VIRTIO_NET_F_NOTIF_EXTRA_DATA has been negotiated, the driver MUST se=
t the
> +\field{vqn} field of the available buffer notification structure to the
> +\field{notify_data} value.
> +
>   \subsubsection{Used Buffer Notifications}\label{sec:Virtio Transport Op=
tions / Virtio Over PCI Bus / PCI-specific Initialization And Device Operat=
ion / Used Buffer Notifications}
>  =20
>   If a used buffer notification is necessary for a virtqueue, the device =
would typically act as follows:
> @@ -2895,6 +2924,10 @@ \subsection{Feature bits}\label{sec:Device Types /=
 Network Device / Feature bits
>   \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
>       channel.
>  =20
> +\item[VIRTIO_NET_F_NOTIF_EXTRA_DATA(57)] Driver provides an extra data w=
ith
> +    available buffer notifications, to aid in notification processing by=
 the
> +    device.
> +
>   \item[VIRTIO_NET_F_GUEST_HDRLEN(59)] Driver can provide the exact \fiel=
d{hdr_len}
>       value. Device benefits from knowing the exact header length.
>  =20
> @@ -2934,6 +2967,7 @@ \subsubsection{Feature bit requirements}\label{sec:=
Device Types / Network Device
>   \item[VIRTIO_NET_F_CTRL_MAC_ADDR] Requires VIRTIO_NET_F_CTRL_VQ.
>   \item[VIRTIO_NET_F_RSC_EXT] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_N=
ET_F_HOST_TSO6.
>   \item[VIRTIO_NET_F_RSS] Requires VIRTIO_NET_F_CTRL_VQ.
> +\item[VIRTIO_NET_F_NOTIF_EXTRA_DATA] Requires VIRTIO_F_NOTIFICATION_DATA=
.
>   \end{description}
>  =20
>   \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types /=
 Network Device / Feature bits / Legacy Interface: Feature bits}
> --
>
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
>


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=
=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

