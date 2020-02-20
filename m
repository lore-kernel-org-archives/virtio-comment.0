Return-Path: virtio-comment-return-1081-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id ADC39985EF2
	for <virtio-comment@lists.oasis-open.org>; Thu, 20 Feb 2020 08:12:03 +0000 (UTC)
Date: Thu, 20 Feb 2020 03:11:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20200220030256-mutt-send-email-mst@kernel.org>
References: <BN6PR1801MB2067F10E2D69ABBC2E22A2F2C56A0@BN6PR1801MB2067.namprd18.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BN6PR1801MB2067F10E2D69ABBC2E22A2F2C56A0@BN6PR1801MB2067.namprd18.prod.outlook.com>
Subject: Re: [virtio-comment] [PATCH] virtio-net: Add support for correct
 hdr_len field.
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: Vitaly Mireyno <vmireyno@marvell.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "jasowang@redhat.com" <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Oct 24, 2019 at 03:24:43PM +0000, Vitaly Mireyno wrote:
> Some devices benefit from the knowledge of the exact header length for TS=
O processing.
> Add a feature bit for a driver that is capable of providing the correct h=
eader length for TSO packets.
>=20
> Signed-off-by: Vitaly Mireyno <vmireyno@marvell.com>

So I looked at implementing this and maybe this was not such a good idea
after all.

How would we implement this in Linux?
Current code just puts skb_headlen there which is
# of bytes in the linear buffer.
Which I guess it often the header, but not at all always.

Should this have been limited to TSO packets?

I also could not figure out how this is useful for the host.
Could you enlighten me pls?

> ---
>  content.tex | 49 +++++++++++++++++++++++++++++++++++++++----------
>  1 file changed, 39 insertions(+), 10 deletions(-)
>=20
> diff --git a/content.tex b/content.tex
> index 679391e..dac6921 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -2811,6 +2811,9 @@ \subsection{Feature bits}\label{sec:Device Types / =
Network Device / Feature bits
>  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
>      channel.
> =20
> +\item[VIRTIO_NET_F_GUEST_HDRLEN(59)] Driver can provide the exact \field=
{hdr_len}
> +    value.
> +
>  \item[VIRTIO_NET_F_RSC_EXT(61)] Device can process duplicated ACKs
>      and report number of coalesced segments and duplicated ACKs
> =20
> @@ -2840,6 +2843,7 @@ \subsubsection{Feature bit requirements}\label{sec:=
Device Types / Network Device
>  \item[VIRTIO_NET_F_MQ] Requires VIRTIO_NET_F_CTRL_VQ.
>  \item[VIRTIO_NET_F_CTRL_MAC_ADDR] Requires VIRTIO_NET_F_CTRL_VQ.
>  \item[VIRTIO_NET_F_RSC_EXT] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_NE=
T_F_HOST_TSO6.
> +\item[VIRTIO_NET_F_GUEST_HDRLEN] Requires VIRTIO_NET_F_HOST_TSO4 or VIRT=
IO_NET_F_HOST_TSO6 or VIRTIO_NET_F_HOST_UFO.
>  \end{description}
> =20
>  \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types / =
Network Device / Feature bits / Legacy Interface: Feature bits}
> @@ -3095,12 +3099,21 @@ \subsubsection{Packet Transmission}\label{sec:Dev=
ice Types / Network Device / De
>    into smaller packets. The other gso fields are set:
> =20
>    \begin{itemize}
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
>      needs to be kept to copy into each packet, usually set to the
>      length of the headers, including the transport header\footnote{Due t=
o various bugs in implementations, this field is not useful
>  as a guarantee of the transport header size.
>  }.
> =20
> +  \begin{note}
> +  Some devices benefit from the knowledge of the exact header length, fo=
r TSO processing.
> +  \end{note}
> +
>    \item \field{gso_size} is the maximum size of each packet beyond that
>      header (ie. MSS).
> =20
> @@ -3173,9 +3186,17 @@ \subsubsection{Packet Transmission}\label{sec:Devi=
ce Types / Network Device / De
>  desired MSS.
> =20
>  If one of the VIRTIO_NET_F_HOST_TSO4, TSO6 or UFO options have
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
> =20
>  The driver MUST NOT set the VIRTIO_NET_HDR_F_DATA_VALID and
>  VIRTIO_NET_HDR_F_RSC_INFO bits in \field{flags}.
> @@ -3187,12 +3208,20 @@ \subsubsection{Packet Transmission}\label{sec:Dev=
ice Types / Network Device / De
>  device MUST NOT use the \field{csum_start} and \field{csum_offset}.
> =20
>  If one of the VIRTIO_NET_F_HOST_TSO4, TSO6 or UFO options have
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
> =20
>  If VIRTIO_NET_HDR_F_NEEDS_CSUM is not set, the device MUST NOT
>  rely on the packet checksum being correct.
> --=20
>=20
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

