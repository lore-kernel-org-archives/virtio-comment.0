Return-Path: <virtio-comment-return-3348-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 47A1E986304
	for <virtio-comment@lists.oasis-open.org>; Tue,  9 Aug 2022 11:51:01 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <003401d8a895$974e1560$c5ea4020$@kalray.eu>
References: <001a01d8a828$df564200$9e02c600$@kalray.eu>
 <CAJs=3_Ax+LoPT-SXbFFcRhuEQ+eyMrqxc8PMkJMQkRgt_1qqEQ@mail.gmail.com>
 <003401d8a895$974e1560$c5ea4020$@kalray.eu>
Date: Tue, 09 Aug 2022 13:50:56 +0200
Message-ID: <87zggdd49r.fsf@redhat.com>
MIME-Version: 1.0
Subject: RE: [virtio-comment] [PATCH] virtio-net : Fix virtio_net_hdr struct
 size when VIRTIO_NET_F_HASH_REPORT feature is negociated.
Content-Type: text/plain
To: Cyril Germond <cgermond@kalray.eu>, Alvaro Karsz <alvaro.karsz@solid-run.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Fri, Aug 05 2022, Cyril Germond <cgermond@kalray.eu> wrote:

> Hello
> You are right indeed - my mistake.
> It might even be better (at least less error-prone)  to refer to the 
> sifeof(virtio_net_hdr) in case new fields get added in the future.
>
> In the meantime, here is updated proposal.
> BR
> Cyril
> ---
>  content.tex    | 4 ++--
>  split-ring.tex | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/content.tex b/content.tex
> index e863709..95b0425 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -3620,8 +3620,8 @@ \subsubsection{Setting Up Receive 
> Buffers}\label{sec:Device Types / Network Devi
>  features are used, the maximum incoming packet
>  will be to 65550 bytes long (the maximum size of a
>  TCP or UDP packet, plus the 14 byte ethernet header), otherwise
> -1514 bytes.  The 12-byte struct virtio_net_hdr is prepended to this,
> -making for 65562 or 1526 bytes.
> +1514 bytes.  The 12-byte (or 20-byte if VIRTIO_NET_F_HASH_REPORT feature 
> has been negotiated) struct virtio_net_hdr is prepended to this,
> +making for 65562 or 1526 bytes (respectively 65570 and 1534 bytes if 
> VIRTIO_NET_F_HASH_REPORT has been negotiated).

Your mail client seems to add line wraps, which means that the patch
cannot be applied by git am (and it makes the change hard to
read). Please consider using git send-email, as described in
https://github.com/oasis-tcs/virtio-spec#providing-feedback.

>
>  \drivernormative{\paragraph}{Setting Up Receive Buffers}{Device Types / 
> Network Device / Device Operation / Setting Up Receive Buffers}
>
> diff --git a/split-ring.tex b/split-ring.tex
> index de94038..6f93c9e 100644
> --- a/split-ring.tex
> +++ b/split-ring.tex
> @@ -128,10 +128,10 @@ \subsection{Legacy Interfaces: A Note on Virtqueue 
> Endianness}\label{sec:Basic F
>  \subsection{Message Framing}\label{sec:Basic Facilities of a Virtio Device 
> / Virtqueues / Message Framing}
>  The framing of messages with descriptors is
>  independent of the contents of the buffers. For example, a network
> -transmit buffer consists of a 12 byte header followed by the network
> +transmit buffer consists of a 12 (or 20 if VIRTIO_NET_F_HASH_REPORT feature 
> has been negociated) byte header followed by the network
>  packet. This could be most simply placed in the descriptor table as a
> -12 byte output descriptor followed by a 1514 byte output descriptor,
> -but it could also consist of a single 1526 byte output descriptor in
> +12 (or 20) byte output descriptor followed by a 1514 byte output 
> descriptor,
> +but it could also consist of a single 1526 (or 1534) byte output descriptor 
> in
>  the case where the header and packet are adjacent, or even three or
>  more descriptors (possibly with loss of efficiency in that case).

As this is only an example, maybe it is better to simply prefix it with

"For example, if VIRTIO_NET_F_HASH_REPORT has not been negotiated, a
network transmit buffer consists of..."

so that you don't need to consider the separate cases, which make the
example harder to read (and don't help to illustrate the process of
deciding on a descriptor layout).


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

