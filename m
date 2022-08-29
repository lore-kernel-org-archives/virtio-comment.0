Return-Path: <virtio-comment-return-3416-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 36A1898639D
	for <virtio-comment@lists.oasis-open.org>; Mon, 29 Aug 2022 10:33:09 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <20220825121807.348-1-cgermond@kalray.eu>
References: <20220825121807.348-1-cgermond@kalray.eu>
Date: Mon, 29 Aug 2022 12:33:04 +0200
Message-ID: <87a67nfifz.fsf@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH] Fix virtio_net_hdr struct size when
 VIRTIO_NET_F_HASH_REPORT is negociated.
Content-Type: text/plain
To: Cyril Germond <cgermond@kalray.eu>, virtio-comment@lists.oasis-open.org
Cc: Cyril Germond <cgermond@kalray.eu>
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Aug 25 2022, Cyril Germond <cgermond@kalray.eu> wrote:

> Hard-coded references to the size of virtio_net_hdr strut are wrong when
> VIRTIO_NET_HASH_REPORT feature is negociated.

s/negociated/negotiated/ (here and in the subject)

Also, please keep an empty line before the s-o-b.

> Signed-off-by: Cyril Germond <cgermond@kalray.eu>
> ---
>  content.tex    | 3 +--
>  split-ring.tex | 2 +-
>  2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/content.tex b/content.tex
> index e863709..b900f35 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -3620,8 +3620,7 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network Devi
>  features are used, the maximum incoming packet
>  will be to 65550 bytes long (the maximum size of a
>  TCP or UDP packet, plus the 14 byte ethernet header), otherwise
> -1514 bytes.  The 12-byte struct virtio_net_hdr is prepended to this,
> -making for 65562 or 1526 bytes.
> +1514 bytes.  The struct virtio_net_hdr (which length depends on VIRTIO_NET_F_HASH_REPORT feature negotiation) is prepended to this.

The normative statement right below also cites the 65562/1526 numbers; I
assume that we want to adjust them as well? In that case, I don't think
we can get around mentioning concrete numbers for all four cases
(with/without offloads x with/without HASH_REPORT).

Any other opinions?

>  
>  \drivernormative{\paragraph}{Setting Up Receive Buffers}{Device Types / Network Device / Device Operation / Setting Up Receive Buffers}
>  
> diff --git a/split-ring.tex b/split-ring.tex
> index de94038..9487918 100644
> --- a/split-ring.tex
> +++ b/split-ring.tex
> @@ -127,7 +127,7 @@ \subsection{Legacy Interfaces: A Note on Virtqueue Endianness}\label{sec:Basic F
>  
>  \subsection{Message Framing}\label{sec:Basic Facilities of a Virtio Device / Virtqueues / Message Framing}
>  The framing of messages with descriptors is
> -independent of the contents of the buffers. For example, a network
> +independent of the contents of the buffers. For example, if VIRTIO_NET_F_HASH_REPORT has not been negotiated, a network

This looks good, but personally I'd prefer to keep more-or-less to the
existing line length, even though that doesn't affect the generated
document.

>  transmit buffer consists of a 12 byte header followed by the network
>  packet. This could be most simply placed in the descriptor table as a
>  12 byte output descriptor followed by a 1514 byte output descriptor,


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

