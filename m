Return-Path: <virtio-comment-return-2822-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 562909866E6
	for <virtio-comment@lists.oasis-open.org>; Thu, 17 Mar 2022 13:40:40 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <2620465.pcdoKKQM6k@silver>
References: <4735344.EBYxvr1mta@silver> <2620465.pcdoKKQM6k@silver>
Date: Thu, 17 Mar 2022 14:40:27 +0100
Message-ID: <87fsngsnn8.fsf@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] Re: [PATCH v3 1/4] Add VIRTIO_RING_F_INDIRECT_SIZE
Content-Type: text/plain
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, virtio-comment@lists.oasis-open.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, Mar 16 2022, Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> This new feature flag allows to decouple the maximum amount of
> descriptors in indirect descriptor tables from the Queue Size.
>
> The new term "Queue Indirect Size" is introduced for this purpose,
> which is a transport specific configuration whose negotiation is
> further specified for each transport with subsequent patches.
>
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/122
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  content.tex     | 32 ++++++++++++++++++++++++++++++--
>  packed-ring.tex |  2 +-
>  split-ring.tex  |  8 ++++++--
>  3 files changed, 37 insertions(+), 5 deletions(-)
>
> diff --git a/content.tex b/content.tex
> index c6f116c..685525d 100644
> --- a/content.tex
> +++ b/content.tex

(...)

> @@ -1051,6 +1051,10 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
>  present either a value of 0 or a power of 2 in
>  \field{queue_size}.
>  
> +If VIRTIO_RING_F_INDIRECT_SIZE has been negotiated, the device MUST provide the
> +Queue Indirect Size supported by device, which is a transport specific

"supported by the device", or maybe "it supports"?

> +configuration. It MUST allow the driver to set a lower value.

Maybe "It MUST allow the driver to specify a lower maximum size." ?

> +
>  \drivernormative{\paragraph}{Common configuration structure layout}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout}
>  
>  The driver MUST NOT write to \field{device_feature}, \field{num_queues}, \field{config_generation}, \field{queue_notify_off} or \field{queue_notify_data}.
> @@ -6847,6 +6851,30 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>    that the driver can reset a queue individually.
>    See \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset}.
>  
> +  \item[VIRTIO_RING_F_INDIRECT_SIZE(41)] This feature indicates that the
> +  Queue Indirect Size, i.e. the maximum amount of descriptors in indirect
> +  descriptor tables, is independent from the Queue Size.
> +
> +  Without this feature, the Queue Size limits the length of the descriptor
> +  chain, including indirect descriptor tables as in \ref{sec:Basic Facilities of
> +  a Virtio Device / Virtqueues / The Virtqueue Descriptor Table / Indirect
> +  Descriptors}, i.e. both the maximum amount of slots in the vring and the
> +  actual bulk data size transmitted per vring slot.
> +
> +  With this feature enabled, the Queue Size only limits the maximum amount

s/enabled/negotiated/ ?

> +  of slots in the vring, but does not limit the actual bulk data size
> +  being transmitted when indirect descriptors are used. Decoupling these
> +  two configuration parameters this way not only allows much larger bulk data
> +  being transferred per vring slot, but also avoids complicated synchronization
> +  mechanisms if the device only supports a very small amount of vring slots. Due
> +  to the 16-bit size of a descriptor's "next" field there is still an absolute
> +  limit of $2^{16}$ descriptors per indirect descriptor table. However the
> +  actual maximum amount supported by either device or driver might be less,
> +  and therefore the bus specific Queue Indirect Size value MUST additionally
> +  be negotiated if VIRTIO_RING_F_INDIRECT_SIZE was negotiated to subsequently
> +  negotiate the actual amount of maximum indirect descriptors supported
> +  by both sides.

No 'MUST' in non-normative sections, please. Maybe make that

"and therefore the device and the driver additionally need to negotiate
the transport specific Queue Indirect Size value if
VIRTIO_RING_F_INDIRECT_SIZE was negotiated in order to determine the
actual amount of maximum indirect descriptors supported by both."

I'm not sure whether we would actually need some normative statements in
the sections below, but probably not.

> +
>  \end{description}
>  
>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}


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

