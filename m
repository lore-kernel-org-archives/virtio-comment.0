Return-Path: virtio-comment-return-1443-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5BDBB985ED7
	for <virtio-comment@lists.oasis-open.org>; Fri,  4 Sep 2020 04:19:30 +0000 (UTC)
References: <BN6PR1801MB20673C85E4585FCB53C17927C5500@BN6PR1801MB2067.namprd18.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <0d675bfe-0f94-9c81-5dd3-b5a0406c1d97@redhat.com>
Date: Fri, 4 Sep 2020 12:19:18 +0800
MIME-Version: 1.0
In-Reply-To: <BN6PR1801MB20673C85E4585FCB53C17927C5500@BN6PR1801MB2067.namprd18.prod.outlook.com>
Subject: [virtio-comment] Re: [PATCH v8] virtio-net: Add support for the flexible driver
 notification structure.
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
To: Vitaly Mireyno <vmireyno@marvell.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Ariel Elior <aelior@marvell.com>
List-ID: <virtio-comment.lists.oasis-open.org>


On 2020/8/31 =E4=B8=8A=E5=8D=885:16, Vitaly Mireyno wrote:
> When the driver is required to send an available buffer notification to t=
he device, it sends the virtqueue number to be notified.
> With this new feature, the device can optionally provide a per-virtqueue =
value for the driver to use in driver notifications, instead of the virtque=
ue number.
> Some devices may benefit from this flexibility by providing, for example,=
 an internal virtqueue identifier, or an internal offset related to the vir=
tqueue number.
>
> Changes from v6:
>   * Changed the feature definition such that the value, that the driver s=
ets in the vqn field, is per-virtqueue
>
> Signed-off-by: Vitaly Mireyno <vmireyno@marvell.com>
> ---
>   content.tex | 45 ++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 44 insertions(+), 1 deletion(-)
>
> diff --git a/content.tex b/content.tex
> index 91735e3..09043e6 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -824,6 +824,8 @@ \subsubsection{Common configuration structure layout}=
\label{sec:Virtio Transport
>           le64 queue_desc;                /* read-write */
>           le64 queue_driver;              /* read-write */
>           le64 queue_device;              /* read-write */
> +        le16 queue_notify_data;         /* read-only for driver */


Do we need to mention this field only exists when=20
VIRTIO_NET_F_NOTIF_CONFIG_DATA is negotiated?


> +        le16 padding;


Any reason for intruding the padding here?


>   };
>   \end{lstlisting}
>  =20
> @@ -890,6 +892,18 @@ \subsubsection{Common configuration structure layout=
}\label{sec:Virtio Transport
>  =20
>   \item[\field{queue_device}]
>           The driver writes the physical address of Device Area here.  Se=
e section \ref{sec:Basic Facilities of a Virtio Device / Virtqueues}.
> +
> +\item[\field{queue_notify_data}]
> +        If VIRTIO_NET_F_NOTIF_CONFIG_DATA has been negotiated, the drive=
r will use this value


The feature should work for other types of devices, so there's probably=20
no need for "NET" prefix.


> +        to put it in the 'virtqueue number' field in the available buffe=
r notification structure.
> +        See section \ref{sec:Virtio Transport Options / Virtio Over PCI =
Bus / PCI-specific Initialization And Device Operation / Available Buffer N=
otifications}.
> +        \begin{note}
> +        This field provides the device with flexibility to determine how=
 virtqueues
> +        will be referred to in available buffer notifications.
> +        In a trivial case the device can set \field{queue_notify_data}=
=3Dvqn. Some devices
> +        may benefit from providing another value, for example an interna=
l virtqueue
> +        identifier, or an internal offset related to the virtqueue numbe=
r.
> +        \end{note}
>   \end{description}
>  =20
>   \devicenormative{\paragraph}{Common configuration structure layout}{Vir=
tio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common co=
nfiguration structure layout}
> @@ -940,7 +954,7 @@ \subsubsection{Common configuration structure layout}=
\label{sec:Virtio Transport
>  =20
>   \drivernormative{\paragraph}{Common configuration structure layout}{Vir=
tio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common co=
nfiguration structure layout}
>  =20
> -The driver MUST NOT write to \field{device_feature}, \field{num_queues},=
 \field{config_generation} or \field{queue_notify_off}.
> +The driver MUST NOT write to \field{device_feature}, \field{num_queues},=
 \field{config_generation}, \field{queue_notify_off} or \field{queue_notify=
_data}.
>  =20
>   If VIRTIO_F_RING_PACKED has been negotiated,
>   the driver MUST NOT write the value 0 to \field{queue_size}.
> @@ -1519,6 +1533,10 @@ \subsubsection{Available Buffer Notifications}\lab=
el{sec:Virtio Transport Option
>   See \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Devic=
e Layout / Notification capability}
>   for how to calculate the Queue Notify address.
>  =20
> +\drivernormative{\paragraph}{Available Buffer Notifications}{Virtio Tran=
sport Options / Virtio Over PCI Bus / PCI-specific Initialization And Devic=
e Operation / Available Buffer Notifications}
> +If VIRTIO_NET_F_NOTIF_CONFIG_DATA has been negotiated, the driver MUST s=
et the 'virtqueue number'
> +field of the available buffer notification structure to the \field{queue=
_notify_data} value.
> +
>   \subsubsection{Used Buffer Notifications}\label{sec:Virtio Transport Op=
tions / Virtio Over PCI Bus / PCI-specific Initialization And Device Operat=
ion / Used Buffer Notifications}
>  =20
>   If a used buffer notification is necessary for a virtqueue, the device =
would typically act as follows:
> @@ -2895,6 +2913,9 @@ \subsection{Feature bits}\label{sec:Device Types / =
Network Device / Feature bits
>   \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
>       channel.
>  =20
> +\item[VIRTIO_NET_F_NOTIF_CONFIG_DATA(57)] Driver uses the data provided =
by the
> +    device as a virtqueue identifier in available buffer notifications.
> +
>   \item[VIRTIO_NET_F_GUEST_HDRLEN(59)] Driver can provide the exact \fiel=
d{hdr_len}
>       value. Device benefits from knowing the exact header length.
>  =20
> @@ -4180,6 +4201,28 @@ \subsubsection{Legacy Interface: Framing Requireme=
nts}\label{sec:Device
>   See \ref{sec:Basic
>   Facilities of a Virtio Device / Virtqueues / Message Framing}.
>  =20
> +\subsubsection{Driver Notifications}\label{sec:Device Types / Network De=
vice / Device Operation / Driver Notifications}
> +As mentioned in section \ref{sec:Virtqueues / Driver notifications}, whe=
n the
> +driver is required to send an available buffer notification to the devic=
e, it
> +sends the virtqueue number to be notified. The method of delivering noti=
fications
> +is transport specific.
> +With the PCI transport, the device can optionally provide a per-virtqueu=
e value
> +for the driver to use in driver notifications, instead of the virtqueue =
number.
> +Some devices may benefit from this flexibility by providing, for example=
,
> +an internal virtqueue identifier, or an internal offset related to the v=
irtqueue number.
> +
> +The VIRTIO_NET_F_NOTIF_CONFIG_DATA feature indicates the availability of=
 such value.
> +The definition of the data to be provided by the driver in driver notifi=
cation and
> +the method for delivering it is transport specific.
> +
> +For more details about driver notifications over PCI see \ref{sec:Virtio=
 Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And =
Device Operation / Available Buffer Notifications}.
> +
> +\drivernormative{\paragraph}{Driver Notifications}{Device Types / Networ=
k Device / Device Operation / Driver Notifications}
> +The driver SHOULD accept the VIRTIO_NET_F_NOTIF_CONFIG_DATA feature if i=
t has
> +been offered.
> +
> +If the VIRTIO_NET_F_NOTIF_CONFIG_DATA feature has been negotiated, the d=
river MUST provide the transport-specific value for the virtqueue number wi=
th driver notifications.
> +


Do we need to clarify that the NOTIFICATION_DATA and NOTIF_CONFIG_DATA=20
is mutually exclusive?

Thanks


>   \section{Block Device}\label{sec:Device Types / Block Device}
>  =20
>   The virtio block device is a simple virtual block device (ie.
> --
>


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

