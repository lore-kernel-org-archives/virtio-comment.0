Return-Path: virtio-comment-return-893-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 37E599860EF
	for <virtio-comment@lists.oasis-open.org>; Thu, 31 Oct 2019 10:15:19 +0000 (UTC)
References: <BN6PR1801MB2067AECC513B4700FB118541C5630@BN6PR1801MB2067.namprd18.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <4ee58390-152b-a9a0-8996-7234e2ba3bcc@redhat.com>
Date: Thu, 31 Oct 2019 18:14:56 +0800
MIME-Version: 1.0
In-Reply-To: <BN6PR1801MB2067AECC513B4700FB118541C5630@BN6PR1801MB2067.namprd18.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [PATCH] virtio-net: Add equal-sized receive buffers feature
To: Vitaly Mireyno <vmireyno@marvell.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>


On 2019/10/31 =E4=B8=8B=E5=8D=885:23, Vitaly Mireyno wrote:
> Some devices benefit from working with receive buffers of a predefined co=
nstant length.
> Add a feature for drivers that allocate equal-sized receive buffers, and =
devices that benefit from predefined receive buffers length.
>
> Signed-off-by: Vitaly Mireyno <vmireyno@marvell.com>
> ---
>   content.tex | 29 +++++++++++++++++++++++++++--
>   1 file changed, 27 insertions(+), 2 deletions(-)


Is there any other networking device that has this feature?


>
> diff --git a/content.tex b/content.tex
> index b1ea9b9..c9e67c8 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -2811,6 +2811,10 @@ \subsection{Feature bits}\label{sec:Device Types /=
 Network Device / Feature bits
>   \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
>       channel.
>  =20
> +\item[VIRTIO_NET_F_CONST_RXBUF_LEN(58)] Driver allocates all receive buf=
fers
> +    of the same constant length. Device benefits from working with
> +    receive buffers of equal length.
> +
>   \item[VIRTIO_NET_F_RSC_EXT(61)] Device can process duplicated ACKs
>       and report number of coalesced segments and duplicated ACKs
>  =20
> @@ -2854,8 +2858,8 @@ \subsubsection{Legacy Interface: Feature bits}\labe=
l{sec:Device Types / Network
>   \subsection{Device configuration layout}\label{sec:Device Types / Netwo=
rk Device / Device configuration layout}
>   \label{sec:Device Types / Block Device / Feature bits / Device configur=
ation layout}
>  =20
> -Three driver-read-only configuration fields are currently defined. The \=
field{mac} address field
> -always exists (though is only valid if VIRTIO_NET_F_MAC is set), and
> +The driver-read-only \field{mac} address field always exists
> +(though is only valid if VIRTIO_NET_F_MAC is set), and
>   \field{status} only exists if VIRTIO_NET_F_STATUS is set. Two
>   read-only bits (for the driver) are currently defined for the status fi=
eld:
>   VIRTIO_NET_S_LINK_UP and VIRTIO_NET_S_ANNOUNCE.
> @@ -2875,12 +2879,17 @@ \subsection{Device configuration layout}\label{se=
c:Device Types / Network Device
>   VIRTIO_NET_F_MTU is set. This field specifies the maximum MTU for the d=
river to
>   use.
>  =20
> +The device-read-only field \field{rx_buf_len} only exists if


Should be driver-read-only.


> +VIRTIO_NET_F_CONST_RXBUF_LEN is negotiated. This field specifies the rec=
eive
> +buffers length.
> +
>   \begin{lstlisting}
>   struct virtio_net_config {
>           u8 mac[6];
>           le16 status;
>           le16 max_virtqueue_pairs;
>           le16 mtu;
> +        le32 rx_buf_len;
>   };
>   \end{lstlisting}
>  =20
> @@ -2933,6 +2942,13 @@ \subsection{Device configuration layout}\label{sec=
:Device Types / Network Device
>  =20
>   A driver SHOULD negotiate the VIRTIO_NET_F_STANDBY feature if the devic=
e offers it.
>  =20
> +A driver SHOULD accept the VIRTIO_NET_F_CONST_RXBUF_LEN feature if offer=
ed.
> +
> +If VIRTIO_NET_F_CONST_RXBUF_LEN feature has been negotiated, the driver =
MUST
> +set \field{rx_buf_len}.


I think it's device that set the field?


> +
> +A driver MUST NOT modify \field{rx_buf_len} once it has been set.
> +
>   \subsubsection{Legacy Interface: Device configuration layout}\label{sec=
:Device Types / Network Device / Device configuration layout / Legacy Inter=
face: Device configuration layout}
>   \label{sec:Device Types / Block Device / Feature bits / Device configur=
ation layout / Legacy Interface: Device configuration layout}
>   When using the legacy interface, transitional devices and drivers
> @@ -3241,6 +3257,11 @@ \subsubsection{Setting Up Receive Buffers}\label{s=
ec:Device Types / Network Devi
>   If VIRTIO_NET_F_MQ is negotiated, each of receiveq1\ldots receiveqN
>   that will be used SHOULD be populated with receive buffers.
>  =20
> +If VIRTIO_NET_F_CONST_RXBUF_LEN feature has been negotiated, the driver
> +MUST initialize all receive virtqueue descriptors \field{len} field with
> +the value configured in \field{rx_buf_len} device configuration field,
> +and allocate receive buffers accordingly.
> +
>   \devicenormative{\paragraph}{Setting Up Receive Buffers}{Device Types /=
 Network Device / Device Operation / Setting Up Receive Buffers}
>  =20
>   The device MUST set \field{num_buffers} to the number of descriptors us=
ed to
> @@ -3396,6 +3417,10 @@ \subsubsection{Processing of Incoming Packets}\lab=
el{sec:Device Types / Network
>   checksum (in case of multiple encapsulated protocols, one level
>   of checksums is validated).
>  =20
> +If VIRTIO_NET_F_CONST_RXBUF_LEN has been negotiated, the device MAY
> +use \field{rx_buf_len} as a buffer length (instead of reading it from
> +virtqueue descriptor \field{len} field).


Is this safe? What if driver submit a small buffer, then device can read=20
more than what is allowed?

Thanks


> +
>   \drivernormative{\paragraph}{Processing of Incoming
>   Packets}{Device Types / Network Device / Device Operation /
>   Processing of Incoming Packets}
> --


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
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

