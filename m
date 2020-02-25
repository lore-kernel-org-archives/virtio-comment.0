Return-Path: virtio-comment-return-1097-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A66B6985D30
	for <virtio-comment@lists.oasis-open.org>; Tue, 25 Feb 2020 03:55:58 +0000 (UTC)
References: <BN6PR1801MB20676FB0CE1EE794D81B177EC5EC0@BN6PR1801MB2067.namprd18.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <72f287ae-7fc8-c714-0915-8beb130bbb47@redhat.com>
Date: Tue, 25 Feb 2020 11:55:41 +0800
MIME-Version: 1.0
In-Reply-To: <BN6PR1801MB20676FB0CE1EE794D81B177EC5EC0@BN6PR1801MB2067.namprd18.prod.outlook.com>
Content-Language: en-US
Subject: Re: [virtio-comment] [PATCH v2] virtio-net: Add support for the
 flexible driver notification
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
To: Vitaly Mireyno <vmireyno@marvell.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Ariel Elior <aelior@marvell.com>
List-ID: <virtio-comment.lists.oasis-open.org>


On 2020/2/25 =E4=B8=8A=E5=8D=881:32, Vitaly Mireyno wrote:
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
> Changes from v1 - added more details about motivation and usage examples.
>
> Signed-off-by: Vitaly Mireyno <vmireyno@marvell.com>
> ---
>   content.tex | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
>
> diff --git a/content.tex b/content.tex
> index b91a132..5abff30 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -965,6 +965,9 @@ \subsubsection{Notification structure layout}\label{s=
ec:Virtio Transport Options
>   struct virtio_pci_notify_cap {
>           struct virtio_pci_cap cap;
>           le32 notify_off_multiplier; /* Multiplier for queue_notify_off.=
 */
> +        le16 notify_data; /* Data to be placed in the vqn field */
> +        u8 notify_data_valid;
> +        u8 padding; /* Pad to a dword */


I wonder whether we need a new feature flag then we can make it use for=20
transport other than PCI.

E.g using MMIO transport for vDPA seems attractive anyhow.


>   };
>   \end{lstlisting}
>  =20
> @@ -984,6 +987,20 @@ \subsubsection{Notification structure layout}\label{=
sec:Virtio Transport Options
>   the same Queue Notify address for all queues.
>   \end{note}
>  =20
> +If \field{notify_data_valid} !=3D 0, the driver will set the \field{vqn}=
 field
> +in the available buffer notification structure to the \field{notify_data=
} value.
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
uld serve as
> +a notification type indication or a protocol indication.


A silly question. If virtqueue number can be derived by the device,=20
device should already know itself a virtio device. Then the type=20
indication seems redundant?

Thanks


> +Another example could be using shared hardware memory space for driver n=
otifications
> +for multiple virtio devices in a trusted environment.
> +\end{note}
> +
>   \devicenormative{\paragraph}{Notification capability}{Virtio Transport =
Options / Virtio Over PCI Bus / PCI Device Layout / Notification capability=
}
>   The device MUST present at least one notification capability.
>  =20
> @@ -1020,6 +1037,12 @@ \subsubsection{Notification structure layout}\labe=
l{sec:Virtio Transport Options
>   cap.length >=3D queue_notify_off * notify_off_multiplier + 4
>   \end{lstlisting}
>  =20
> +The device MAY set \field{notify_data_valid} to any non-zero value, to r=
equest
> +the driver to set the \field{vqn} to the \field{notify_data} value.
> +If the device sets \field{notify_data_valid} to a non-zero value, it MUS=
T set
> +\field{notify_data} to a valid value.
> +For a normal operation, the device MUST set \field{notify_data_valid} to=
 zero.
> +
>   \subsubsection{ISR status capability}\label{sec:Virtio Transport Option=
s / Virtio Over PCI Bus / PCI Device Layout / ISR status capability}
>  =20
>   The VIRTIO_PCI_CAP_ISR_CFG capability
> @@ -1519,6 +1542,11 @@ \subsubsection{Available Buffer Notifications}\lab=
el{sec:Virtio Transport Option
>   See \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Devic=
e Layout / Notification capability}
>   for how to calculate the Queue Notify address.
>  =20
> +\drivernormative{\paragraph}{Available Buffer Notifications}{Virtio Tran=
sport Options / Virtio Over PCI Bus / PCI-specific Initialization And Devic=
e Operation / Available Buffer Notifications}
> +If VIRTIO_F_NOTIFICATION_DATA has been negotiated, and if
> +\field{notify_data_valid} !=3D 0, the driver MUST set the \field{vqn} fi=
eld of
> +the available buffer notification structure to the \field{notify_data} v=
alue.
> +
>   \subsubsection{Used Buffer Notifications}\label{sec:Virtio Transport Op=
tions / Virtio Over PCI Bus / PCI-specific Initialization And Device Operat=
ion / Used Buffer Notifications}
>  =20
>   If a used buffer notification is necessary for a virtqueue, the device =
would typically act as follows:
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

