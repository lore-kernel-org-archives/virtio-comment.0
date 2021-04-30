Return-Path: virtio-comment-return-1840-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A0FEC98654C
	for <virtio-comment@lists.oasis-open.org>; Fri, 30 Apr 2021 11:27:53 +0000 (UTC)
Date: Fri, 30 Apr 2021 13:27:46 +0200
From: Cornelia Huck <cohuck@redhat.com>
Message-ID: <20210430132746.599ed57f.cohuck@redhat.com>
In-Reply-To: <20210429231016.561553-1-joel@nider.org>
References: <20210429231016.561553-1-joel@nider.org>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH] Update VIRTIO_F_EVENT_IDX throughout
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: Joel Nider <joel@nider.org>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, 29 Apr 2021 16:10:16 -0700
Joel Nider <joel@nider.org> wrote:

> This flag has been called by many names in the past
> (VIRTIO_RING_F_EVENT_IDX, VIRTIO_F_RING_EVENT_IDX) and there are
> just a few stragglers left to clean up.
> 
> Signed-off-by: Joel Nider <joel@nider.org>
> ---
>  content.tex     | 2 +-
>  packed-ring.tex | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/content.tex b/content.tex
> index 9232d5c..5a803dc 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -6581,7 +6581,7 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>  Descriptors}~\nameref{sec:Basic Facilities of a Virtio Device /
>  Virtqueues / The Virtqueue Descriptor Table / Indirect
>  Descriptors} and \ref{sec:Packed Virtqueues / Indirect Flag: Scatter-Gather Support}~\nameref{sec:Packed Virtqueues / Indirect Flag: Scatter-Gather Support}.
> -  \item[VIRTIO_F_RING_EVENT_IDX(29)] This feature enables the \field{used_event}
> +  \item[VIRTIO_F_EVENT_IDX(29)] This feature enables the \field{used_event}

Hm. The VIRTIO_F_RING_ version actually matches well with
VIRTIO_F_RING_INDIRECT_DESC and VIRTIO_F_RING_PACKED. While the latter
is used consistently throughout the spec, we seem to use
VIRTIO_F_INDIRECT_DESC in other places. For added variety, Linux and
QEMU use VIRTIO_RING_F_INDIRECT_DESC and VIRTIO_RING_F_EVENT_IDX (but
VIRTIO_F_RING_PACKED.)

We should be consistent within the spec, so I'd vote for using the
VIRTIO_F_RING_ versions everywhere here. (The Linux/QEMU variants are
still easily recognizable, so there's actually not much potential for
confusion.) The only downside is that this would mean more changes.

Opinions?

>    and the \field{avail_event} fields as described in
>  \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Used Buffer Notification Suppression}, \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / The Virtqueue Used Ring} and \ref{sec:Packed Virtqueues / Driver and Device Event Suppression}.
>  
> diff --git a/packed-ring.tex b/packed-ring.tex
> index ea92543..a9e6c16 100644
> --- a/packed-ring.tex
> +++ b/packed-ring.tex
> @@ -336,7 +336,7 @@ \subsection{Driver and Device Event Suppression}
>  /*
>   * Enable events for a specific descriptor
>   * (as specified by Descriptor Ring Change Event Offset/Wrap Counter).
> - * Only valid if VIRTIO_F_RING_EVENT_IDX has been negotiated.
> + * Only valid if VIRTIO_F_EVENT_IDX has been negotiated.
>   */
>  #define RING_EVENT_FLAGS_DESC 0x2
>  /* The value 0x3 is reserved */
> @@ -597,7 +597,7 @@ \subsubsection{Implementation Example}\label{sec:Basic Facilities of a Virtio De
>  
>  Below is a driver code example. It does not attempt to reduce
>  the number of available buffer notifications, neither does it support
> -the VIRTIO_F_RING_EVENT_IDX feature.
> +the VIRTIO_F_EVENT_IDX feature.
>  
>  \begin{lstlisting}
>  /* Note: vq->avail_wrap_count is initialized to 1 */


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

