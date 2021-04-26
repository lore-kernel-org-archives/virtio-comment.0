Return-Path: virtio-comment-return-1834-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BF999985FD3
	for <virtio-comment@lists.oasis-open.org>; Mon, 26 Apr 2021 12:36:25 +0000 (UTC)
MIME-Version: 1.0
References: <20210410092715.14397-1-yuri.benditovich@daynix.com>
In-Reply-To: <20210410092715.14397-1-yuri.benditovich@daynix.com>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Mon, 26 Apr 2021 15:36:12 +0300
Message-ID: <CAOEp5OfUyTVyP_ZuT2rf1Lmwa36p6-Yb0qKyh3XwBs6qTvXfFg@mail.gmail.com>
Subject: [virtio-comment] Re: [PATCH] virtio-net: define USO feature
Content-Type: text/plain; charset="UTF-8"
To: virtio-comment@lists.oasis-open.org
Cc: Yan Vugenfirer <yan@daynix.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Ping


On Sat, Apr 10, 2021 at 12:27 PM Yuri Benditovich
<yuri.benditovich@daynix.com> wrote:
>
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/104
>
> Unlike UFO (fragmenting the packet) the USO splits large UDP packet
> to several segments when each of these smaller packets has UDP
> header. In Linux see SKB_GSO_UDP_L4.
>
> Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
> ---
>  content.tex | 31 ++++++++++++++++++++-----------
>  1 file changed, 20 insertions(+), 11 deletions(-)
>
> diff --git a/content.tex b/content.tex
> index e536fd4..2708386 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -2964,6 +2964,8 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
>  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
>      channel.
>
> +\item[VIRTIO_NET_F_HOST_USO (56)] Device can receive USO.
> +
>  \item[VIRTIO_NET_F_HASH_REPORT(57)] Device can report per-packet hash
>      value and a type of calculated hash.
>
> @@ -2998,6 +3000,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
>  \item[VIRTIO_NET_F_HOST_TSO6] Requires VIRTIO_NET_F_CSUM.
>  \item[VIRTIO_NET_F_HOST_ECN] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_NET_F_HOST_TSO6.
>  \item[VIRTIO_NET_F_HOST_UFO] Requires VIRTIO_NET_F_CSUM.
> +\item[VIRTIO_NET_F_HOST_USO] Requires VIRTIO_NET_F_CSUM.
>
>  \item[VIRTIO_NET_F_CTRL_RX] Requires VIRTIO_NET_F_CTRL_VQ.
>  \item[VIRTIO_NET_F_CTRL_VLAN] Requires VIRTIO_NET_F_CTRL_VQ.
> @@ -3200,10 +3203,10 @@ \subsection{Device Initialization}\label{sec:Device Types / Network Device / Dev
>  \item A performant driver would indicate that it will generate checksumless
>    packets by negotating the VIRTIO_NET_F_CSUM feature.
>
> -\item If that feature is negotiated, a driver can use TCP or UDP
> -  segmentation offload by negotiating the VIRTIO_NET_F_HOST_TSO4 (IPv4
> -  TCP), VIRTIO_NET_F_HOST_TSO6 (IPv6 TCP) and VIRTIO_NET_F_HOST_UFO
> -  (UDP fragmentation) features.
> +\item If that feature is negotiated, a driver can use TCP segmentation or UDP
> +  segmentation/fragmentation offload by negotiating the VIRTIO_NET_F_HOST_TSO4 (IPv4
> +  TCP), VIRTIO_NET_F_HOST_TSO6 (IPv6 TCP), VIRTIO_NET_F_HOST_UFO
> +  (UDP fragmentation) and VIRTIO_NET_F_HOST_USO (UDP segmentation) features.
>
>  \item The converse features are also available: a driver can save
>    the virtual device some work by negotiating these features.\note{For example, a network packet transported between two guests on
> @@ -3242,6 +3245,7 @@ \subsection{Device Operation}\label{sec:Device Types / Network Device / Device O
>  #define VIRTIO_NET_HDR_GSO_TCPV4       1
>  #define VIRTIO_NET_HDR_GSO_UDP         3
>  #define VIRTIO_NET_HDR_GSO_TCPV6       4
> +#define VIRTIO_NET_HDR_GSO_UDP_L4      5
>  #define VIRTIO_NET_HDR_GSO_ECN      0x80
>          u8 gso_type;
>          le16 hdr_len;
> @@ -3312,9 +3316,9 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
>  \end{note}
>
>  \item If the driver negotiated
> -  VIRTIO_NET_F_HOST_TSO4, TSO6 or UFO, and the packet requires
> -  TCP segmentation or UDP fragmentation, then \field{gso_type}
> -  is set to VIRTIO_NET_HDR_GSO_TCPV4, TCPV6 or UDP.
> +  VIRTIO_NET_F_HOST_TSO4, TSO6, USO or UFO, and the packet requires
> +  TCP segmentation, UDP segmentation or fragmentation, then \field{gso_type}
> +  is set to VIRTIO_NET_HDR_GSO_TCPV4, TCPV6, UDP_L4 or UDP.
>    (Otherwise, it is set to VIRTIO_NET_HDR_GSO_NONE). In this
>    case, packets larger than 1514 bytes can be transmitted: the
>    metadata indicates how to replicate the packet header to cut it
> @@ -3372,9 +3376,14 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
>
>  If VIRTIO_NET_F_HOST_UFO is negotiated, the driver MAY set
>  \field{gso_type} to VIRTIO_NET_HDR_GSO_UDP to request UDP
> -segmentation, otherwise the driver MUST NOT set
> +fragmentation, otherwise the driver MUST NOT set
>  \field{gso_type} to VIRTIO_NET_HDR_GSO_UDP.
>
> +If VIRTIO_NET_F_HOST_USO is negotiated, the driver MAY set
> +\field{gso_type} to VIRTIO_NET_HDR_GSO_UDP_L4 to request UDP
> +segmentation, otherwise the driver MUST NOT set
> +\field{gso_type} to VIRTIO_NET_HDR_GSO_UDP_L4.
> +
>  The driver SHOULD NOT send to the device TCP packets requiring segmentation offload
>  which have the Explicit Congestion Notification bit set, unless the
>  VIRTIO_NET_F_HOST_ECN feature is negotiated, in which case the
> @@ -3398,7 +3407,7 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
>         packet;
>  \end{enumerate}
>
> -If none of the VIRTIO_NET_F_HOST_TSO4, TSO6 or UFO options have
> +If none of the VIRTIO_NET_F_HOST_TSO4, TSO6, USO or UFO options have
>  been negotiated, the driver MUST set \field{gso_type} to
>  VIRTIO_NET_HDR_GSO_NONE.
>
> @@ -3407,7 +3416,7 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
>  \field{flags} and MUST set \field{gso_size} to indicate the
>  desired MSS.
>
> -If one of the VIRTIO_NET_F_HOST_TSO4, TSO6 or UFO options have
> +If one of the VIRTIO_NET_F_HOST_TSO4, TSO6, USO or UFO options have
>  been negotiated:
>  \begin{itemize}
>  \item If the VIRTIO_NET_F_GUEST_HDRLEN feature has been negotiated,
> @@ -3434,7 +3443,7 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
>  If VIRTIO_NET_HDR_F_NEEDS_CSUM bit in \field{flags} is not set, the
>  device MUST NOT use the \field{csum_start} and \field{csum_offset}.
>
> -If one of the VIRTIO_NET_F_HOST_TSO4, TSO6 or UFO options have
> +If one of the VIRTIO_NET_F_HOST_TSO4, TSO6, USO or UFO options have
>  been negotiated:
>  \begin{itemize}
>  \item If the VIRTIO_NET_F_GUEST_HDRLEN feature has been negotiated,
> --
> 2.25.1
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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

