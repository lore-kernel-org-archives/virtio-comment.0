Return-Path: <virtio-comment-return-3447-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A6ABE986584
	for <virtio-comment@lists.oasis-open.org>; Fri,  9 Sep 2022 14:51:03 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <20220902110456.1411-1-cgermond@kalray.eu>
References: <20220902110456.1411-1-cgermond@kalray.eu>
Date: Fri, 09 Sep 2022 16:50:57 +0200
Message-ID: <87zgf8mwj2.fsf@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH] virtio-net: Fix virtio_net_hdr struct
 size when VIRTIO_NET_F_HASH_REPORT is negotiated.
Content-Type: text/plain
To: Cyril Germond <cgermond@kalray.eu>, virtio-comment@lists.oasis-open.org
Cc: Cyril Germond <cgermond@kalray.eu>
List-ID: <virtio-comment.lists.oasis-open.org>

On Fri, Sep 02 2022, Cyril Germond <cgermond@kalray.eu> wrote:

> Hard-coded references to the size of virtio_net_hdr strut are wrong when
> VIRTIO_NET_HASH_REPORT feature is negotiated.
>
> Signed-off-by: Cyril Germond <cgermond@kalray.eu>

Please add versioning (git format-patch -v<n>) in the subject, and a
changelog between the "---"; otherwise, this gets a bit hard to follow.

> ---
>  content.tex    | 10 ++++++----
>  split-ring.tex |  3 ++-
>  2 files changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/content.tex b/content.tex
> index e863709..f0d0696 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -3620,8 +3620,8 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network Devi
>  features are used, the maximum incoming packet
>  will be to 65550 bytes long (the maximum size of a
>  TCP or UDP packet, plus the 14 byte ethernet header), otherwise
> -1514 bytes.  The 12-byte struct virtio_net_hdr is prepended to this,
> -making for 65562 or 1526 bytes.
> +1514 bytes.  The struct virtio_net_hdr (which length depends on VIRTIO_NET_F_HASH_REPORT

s/which length/the length of which/ ?

> +feature negotiation) is prepended to this.
>  
>  \drivernormative{\paragraph}{Setting Up Receive Buffers}{Device Types / Network Device / Device Operation / Setting Up Receive Buffers}
>  
> @@ -3630,9 +3630,11 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network Devi
>    \begin{itemize}
>      \item If VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6, VIRTIO_NET_F_GUEST_UFO,
>  	VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6 are negotiated, the driver SHOULD populate
> -      the receive queue(s) with buffers of at least 65562 bytes.
> +      the receive queue(s) with buffers of at least 65570 bytes
> +      if VIRTIO_NET_F_HASH_REPORT is negotiated, 65562 bytes otherwise.
>      \item Otherwise, the driver SHOULD populate the receive queue(s)
> -      with buffers of at least 1526 bytes.
> +      with buffers of at least 1534 bytes if VIRTIO_NET_F_HASH_REPORT
> +      is negotiated, 1526 bytes otherwise.
>    \end{itemize}
>  \item If VIRTIO_NET_F_MRG_RXBUF is negotiated, each buffer MUST be at
>  least the size of the struct virtio_net_hdr.
> diff --git a/split-ring.tex b/split-ring.tex
> index de94038..82e910f 100644
> --- a/split-ring.tex
> +++ b/split-ring.tex
> @@ -127,7 +127,8 @@ \subsection{Legacy Interfaces: A Note on Virtqueue Endianness}\label{sec:Basic F
>  
>  \subsection{Message Framing}\label{sec:Basic Facilities of a Virtio Device / Virtqueues / Message Framing}
>  The framing of messages with descriptors is
> -independent of the contents of the buffers. For example, a network
> +independent of the contents of the buffers. For example, if
> +VIRTIO_NET_F_HASH_REPORT has not been negotiated, a network
>  transmit buffer consists of a 12 byte header followed by the network
>  packet. This could be most simply placed in the descriptor table as a
>  12 byte output descriptor followed by a 1514 byte output descriptor,

Looks good to me, but I'll let the virtio-net folks comment.


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

