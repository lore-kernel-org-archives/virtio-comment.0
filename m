Return-Path: virtio-comment-return-882-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 968F79860CD
	for <virtio-comment@lists.oasis-open.org>; Fri, 25 Oct 2019 02:08:53 +0000 (UTC)
References: <BN6PR1801MB2067F10E2D69ABBC2E22A2F2C56A0@BN6PR1801MB2067.namprd18.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <9986e638-be7c-57ee-da7e-2583b304cb02@redhat.com>
Date: Fri, 25 Oct 2019 10:08:41 +0800
MIME-Version: 1.0
In-Reply-To: <BN6PR1801MB2067F10E2D69ABBC2E22A2F2C56A0@BN6PR1801MB2067.namprd18.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [PATCH] virtio-net: Add support for correct hdr_len field.
To: Vitaly Mireyno <vmireyno@marvell.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>


On 2019/10/24 =E4=B8=8B=E5=8D=8811:24, Vitaly Mireyno wrote:
> Some devices benefit from the knowledge of the exact header length for TS=
O processing.
> Add a feature bit for a driver that is capable of providing the correct h=
eader length for TSO packets.


I think it's better to not mention TSO or refer it as an example to make=20
the feature can be used by other protocol.


>
> Signed-off-by: Vitaly Mireyno <vmireyno@marvell.com>
> ---
>   content.tex | 49 +++++++++++++++++++++++++++++++++++++++----------
>   1 file changed, 39 insertions(+), 10 deletions(-)
>
> diff --git a/content.tex b/content.tex
> index 679391e..dac6921 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -2811,6 +2811,9 @@ \subsection{Feature bits}\label{sec:Device Types / =
Network Device / Feature bits
>   \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
>       channel.
>  =20
> +\item[VIRTIO_NET_F_GUEST_HDRLEN(59)] Driver can provide the exact \field=
{hdr_len}
> +    value.
> +
>   \item[VIRTIO_NET_F_RSC_EXT(61)] Device can process duplicated ACKs
>       and report number of coalesced segments and duplicated ACKs
>  =20
> @@ -2840,6 +2843,7 @@ \subsubsection{Feature bit requirements}\label{sec:=
Device Types / Network Device
>   \item[VIRTIO_NET_F_MQ] Requires VIRTIO_NET_F_CTRL_VQ.
>   \item[VIRTIO_NET_F_CTRL_MAC_ADDR] Requires VIRTIO_NET_F_CTRL_VQ.
>   \item[VIRTIO_NET_F_RSC_EXT] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_N=
ET_F_HOST_TSO6.
> +\item[VIRTIO_NET_F_GUEST_HDRLEN] Requires VIRTIO_NET_F_HOST_TSO4 or VIRT=
IO_NET_F_HOST_TSO6 or VIRTIO_NET_F_HOST_UFO.
>   \end{description}
>  =20
>   \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types /=
 Network Device / Feature bits / Legacy Interface: Feature bits}
> @@ -3095,12 +3099,21 @@ \subsubsection{Packet Transmission}\label{sec:Dev=
ice Types / Network Device / De
>     into smaller packets. The other gso fields are set:
>  =20
>     \begin{itemize}
> -  \item \field{hdr_len} is a hint to the device as to how much of the he=
ader
> +  \item If the VIRTIO_NET_F_GUEST_HDRLEN feature has been negotiated,
> +    \field{hdr_len} indicates the header length that needs to be replica=
ted
> +    for each packet. It's a number of bytes from beginning of the packet
> +    to beginning of the transport payload.
> +    Otherwise, if the VIRTIO_NET_F_GUEST_HDRLEN feature has not been neg=
otiated,
> +    \field{hdr_len} is a hint to the device as to how much of the header
>       needs to be kept to copy into each packet, usually set to the
>       length of the headers, including the transport header\footnote{Due =
to various bugs in implementations, this field is not useful
>   as a guarantee of the transport header size.
>   }.
>  =20
> +  \begin{note}
> +  Some devices benefit from the knowledge of the exact header length, fo=
r TSO processing.
> +  \end{note}


"E.g TSO processing" is better I think.


> +
>     \item \field{gso_size} is the maximum size of each packet beyond that
>       header (ie. MSS).
>  =20
> @@ -3173,9 +3186,17 @@ \subsubsection{Packet Transmission}\label{sec:Devi=
ce Types / Network Device / De
>   desired MSS.
>  =20
>   If one of the VIRTIO_NET_F_HOST_TSO4, TSO6 or UFO options have
> -been negotiated, the driver SHOULD set \field{hdr_len} to a value
> -not less than the length of the headers, including the transport
> -header.
> +been negotiated:
> +\begin{itemize}
> +\item If the VIRTIO_NET_F_GUEST_HDRLEN feature has been negotiated,
> +=09the driver MUST set \field{hdr_len} to a value equal to the length
> +=09of the headers, including the transport header.
> +
> +\item If the VIRTIO_NET_F_GUEST_HDRLEN feature has not been negotiated,
> +=09the driver SHOULD set \field{hdr_len} to a value
> +=09not less than the length of the headers, including the transport
> +=09header.
> +\end{itemize}
>  =20
>   The driver MUST NOT set the VIRTIO_NET_HDR_F_DATA_VALID and
>   VIRTIO_NET_HDR_F_RSC_INFO bits in \field{flags}.
> @@ -3187,12 +3208,20 @@ \subsubsection{Packet Transmission}\label{sec:Dev=
ice Types / Network Device / De
>   device MUST NOT use the \field{csum_start} and \field{csum_offset}.
>  =20
>   If one of the VIRTIO_NET_F_HOST_TSO4, TSO6 or UFO options have
> -been negotiated, the device MAY use \field{hdr_len} only as a hint about=
 the
> -transport header size.
> -The device MUST NOT rely on \field{hdr_len} to be correct.
> -\begin{note}
> -This is due to various bugs in implementations.
> -\end{note}
> +been negotiated:
> +\begin{itemize}
> +\item If the VIRTIO_NET_F_GUEST_HDRLEN feature has been negotiated,
> +=09the device MAY use \field{hdr_len} as the transport header size.


I think it's better to claim device must not rely on this value like=20
when it was negotiated.

Thanks


> +
> +\item If the VIRTIO_NET_F_GUEST_HDRLEN feature has not been negotiated,
> +=09the device MAY use \field{hdr_len} only as a hint about the
> +=09transport header size.
> +=09The device MUST NOT rely on \field{hdr_len} to be correct.
> +
> +=09\begin{note}
> +=09This is due to various bugs in implementations.
> +=09\end{note}
> +\end{itemize}
>  =20
>   If VIRTIO_NET_HDR_F_NEEDS_CSUM is not set, the device MUST NOT
>   rely on the packet checksum being correct.


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

