Return-Path: virtio-comment-return-879-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6285A9860BF
	for <virtio-comment@lists.oasis-open.org>; Thu, 24 Oct 2019 15:31:54 +0000 (UTC)
Date: Thu, 24 Oct 2019 11:31:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20191024113000-mutt-send-email-mst@kernel.org>
References: <BN6PR1801MB2067F10E2D69ABBC2E22A2F2C56A0@BN6PR1801MB2067.namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN6PR1801MB2067F10E2D69ABBC2E22A2F2C56A0@BN6PR1801MB2067.namprd18.prod.outlook.com>
Subject: [virtio-comment] Re: [PATCH] virtio-net: Add support for correct hdr_len field.
To: Vitaly Mireyno <vmireyno@marvell.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "jasowang@redhat.com" <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Oct 24, 2019 at 03:24:43PM +0000, Vitaly Mireyno wrote:
> Some devices benefit from the knowledge of the exact header length for TSO processing.
> Add a feature bit for a driver that is capable of providing the correct header length for TSO packets.
> 
> Signed-off-by: Vitaly Mireyno <vmireyno@marvell.com>
> ---
>  content.tex | 49 +++++++++++++++++++++++++++++++++++++++----------
>  1 file changed, 39 insertions(+), 10 deletions(-)
> 
> diff --git a/content.tex b/content.tex
> index 679391e..dac6921 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -2811,6 +2811,9 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
>  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
>      channel.
>  
> +\item[VIRTIO_NET_F_GUEST_HDRLEN(59)] Driver can provide the exact \field{hdr_len}
> +    value.
> +

Does this also imply that device would benefit from knowing the
exact header length?

>  \item[VIRTIO_NET_F_RSC_EXT(61)] Device can process duplicated ACKs
>      and report number of coalesced segments and duplicated ACKs
>  
> @@ -2840,6 +2843,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
>  \item[VIRTIO_NET_F_MQ] Requires VIRTIO_NET_F_CTRL_VQ.
>  \item[VIRTIO_NET_F_CTRL_MAC_ADDR] Requires VIRTIO_NET_F_CTRL_VQ.
>  \item[VIRTIO_NET_F_RSC_EXT] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_NET_F_HOST_TSO6.
> +\item[VIRTIO_NET_F_GUEST_HDRLEN] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_NET_F_HOST_TSO6 or VIRTIO_NET_F_HOST_UFO.
>  \end{description}
>  
>  \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types / Network Device / Feature bits / Legacy Interface: Feature bits}
> @@ -3095,12 +3099,21 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
>    into smaller packets. The other gso fields are set:
>  
>    \begin{itemize}
> -  \item \field{hdr_len} is a hint to the device as to how much of the header
> +  \item If the VIRTIO_NET_F_GUEST_HDRLEN feature has been negotiated,
> +    \field{hdr_len} indicates the header length that needs to be replicated
> +    for each packet. It's a number of bytes from beginning of the packet
> +    to beginning of the transport payload.
> +    Otherwise, if the VIRTIO_NET_F_GUEST_HDRLEN feature has not been negotiated,
> +    \field{hdr_len} is a hint to the device as to how much of the header
>      needs to be kept to copy into each packet, usually set to the
>      length of the headers, including the transport header\footnote{Due to various bugs in implementations, this field is not useful
>  as a guarantee of the transport header size.
>  }.
>  
> +  \begin{note}
> +  Some devices benefit from the knowledge of the exact header length, for TSO processing.
> +  \end{note}
> +
>    \item \field{gso_size} is the maximum size of each packet beyond that
>      header (ie. MSS).
>  
> @@ -3173,9 +3186,17 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
>  desired MSS.
>  
>  If one of the VIRTIO_NET_F_HOST_TSO4, TSO6 or UFO options have
> -been negotiated, the driver SHOULD set \field{hdr_len} to a value
> -not less than the length of the headers, including the transport
> -header.
> +been negotiated:
> +\begin{itemize}
> +\item If the VIRTIO_NET_F_GUEST_HDRLEN feature has been negotiated,
> +	the driver MUST set \field{hdr_len} to a value equal to the length
> +	of the headers, including the transport header.
> +
> +\item If the VIRTIO_NET_F_GUEST_HDRLEN feature has not been negotiated,
> +	the driver SHOULD set \field{hdr_len} to a value
> +	not less than the length of the headers, including the transport
> +	header.
> +\end{itemize}
>  
>  The driver MUST NOT set the VIRTIO_NET_HDR_F_DATA_VALID and
>  VIRTIO_NET_HDR_F_RSC_INFO bits in \field{flags}.

And maybe say that driver SHOULD accept VIRTIO_NET_F_GUEST_HDRLEN if
it has been offered?

> @@ -3187,12 +3208,20 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
>  device MUST NOT use the \field{csum_start} and \field{csum_offset}.
>  
>  If one of the VIRTIO_NET_F_HOST_TSO4, TSO6 or UFO options have
> -been negotiated, the device MAY use \field{hdr_len} only as a hint about the
> -transport header size.
> -The device MUST NOT rely on \field{hdr_len} to be correct.
> -\begin{note}
> -This is due to various bugs in implementations.
> -\end{note}
> +been negotiated:
> +\begin{itemize}
> +\item If the VIRTIO_NET_F_GUEST_HDRLEN feature has been negotiated,
> +	the device MAY use \field{hdr_len} as the transport header size.
> +
> +\item If the VIRTIO_NET_F_GUEST_HDRLEN feature has not been negotiated,
> +	the device MAY use \field{hdr_len} only as a hint about the
> +	transport header size.
> +	The device MUST NOT rely on \field{hdr_len} to be correct.
> +
> +	\begin{note}
> +	This is due to various bugs in implementations.
> +	\end{note}
> +\end{itemize}
>  
>  If VIRTIO_NET_HDR_F_NEEDS_CSUM is not set, the device MUST NOT
>  rely on the packet checksum being correct.
> -- 

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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

