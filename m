Return-Path: <virtio-comment-return-2456-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 40ADE986454
	for <virtio-comment@lists.oasis-open.org>; Tue, 14 Dec 2021 17:20:47 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <55b04c584638393050bc76467439550d87e24696.1639494803.git.qemu_oss@crudebyte.com>
References: <cover.1639494803.git.qemu_oss@crudebyte.com>
 <55b04c584638393050bc76467439550d87e24696.1639494803.git.qemu_oss@crudebyte.com>
Date: Tue, 14 Dec 2021 18:20:28 +0100
Message-ID: <87zgp3qf1f.fsf@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] Re: [PATCH 2/2] Add common configuration field "queue_indirect_size"
Content-Type: text/plain
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, virtio-comment@lists.oasis-open.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, Dec 14 2021, Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> This new common configuration field allows to negotiate a more fine
> graded maximum lenght of indirect descriptor chains.
>
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/122
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  content.tex    | 25 ++++++++++++++++++++++++-
>  split-ring.tex |  3 +++
>  2 files changed, 27 insertions(+), 1 deletion(-)
>
> diff --git a/content.tex b/content.tex
> index 0aa4842..e3cfcae 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -859,6 +859,7 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
>          le64 queue_driver;              /* read-write */
>          le64 queue_device;              /* read-write */
>          le16 queue_notify_data;         /* read-only for driver */
> +        le32 queue_indirect_size;       /* read-write */

[Note for below: this "common" configuration structure layout is
actually PCI-specific, it is only common between the different device
types.]

>  };
>  \end{lstlisting}
>  
> @@ -938,6 +939,16 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
>          may benefit from providing another value, for example an internal virtqueue
>          identifier, or an internal offset related to the virtqueue number.
>          \end{note}
> +
> +\item[\field{queue_indirect_size}]
> +        This field is used to negotiate the maximum amount of descriptors per
> +        vring slot as in \ref{sec:Basic Facilities of a Virtio Device /
> +        Virtqueues / The Virtqueue Descriptor Table / Indirect Descriptors} if
> +        and only if the VIRTIO_RING_F_INDIRECT_SIZE feature has been negotiated.
> +
> +        The device specifies its maximum supported number of descriptors per
> +        vring slot. If the driver requires fewer descriptors, it writes its
> +        lower value to inform the device of the reduced resource requirements.
>  \end{description}
>  
>  \devicenormative{\paragraph}{Common configuration structure layout}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout}
> @@ -1003,6 +1014,12 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
>  
>  The driver MUST NOT write a 0 to \field{queue_enable}.
>  
> +The driver SHOULD write to \field{queue_indirect_size} if its maximum number of
> +descriptors per vring slot is lower than that reported by the device.

Maybe

"If the driver's maximum number of descriptors per vring slot is lower
than the maximum value reported by the device, it SHOULD write that
number to \field{queue_indirect_size}."

?

> +
> +The driver MUST NOT write a higher value to \field{queue_indirect_size} than the
> +one it reads from the device.
> +
>  \subsubsection{Notification structure layout}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Notification capability}
>  
>  The notification location is found using the VIRTIO_PCI_CAP_NOTIFY_CFG
> @@ -6712,7 +6729,13 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>    being transferred per vring slot, but also avoids complicated synchronization
>    mechanisms if the device only supports a very small amount of vring slots. Due
>    to the 16-bit size of a descriptor's "next" field there is still an absolute
> -  limit of $2^{16}$ descriptors per indirect descriptor table.
> +  limit of $2^{16}$ descriptors per indirect descriptor table. However the
> +  actual maximum amount supported by either device or driver might be less,
> +  and therefore the common configuration field "queue_indirect_size" MUST exist
> +  if VIRTIO_RING_F_INDIRECT_SIZE was negotiated to subsequently
> +  negotiate the actual amount of maximum indirect descriptors supported
> +  by both sides, as described in \ref{sec:Virtio Transport Options / Virtio
> +  Over PCI Bus / PCI Device Layout / Common configuration structure layout}.
>  
>  \end{description}
>  
> diff --git a/split-ring.tex b/split-ring.tex
> index ae2aeb8..d8f66c1 100644
> --- a/split-ring.tex
> +++ b/split-ring.tex
> @@ -270,6 +270,9 @@ \subsubsection{Indirect Descriptors}\label{sec:Basic Facilities of a Virtio Devi
>  
>  A driver MUST NOT create a descriptor chain longer than the Queue Size of
>  the device unless VIRTIO_RING_F_INDIRECT_SIZE has been negotiated.
> +Furthermore if VIRTIO_RING_F_INDIRECT_SIZE has been negotiated then the number
> +of descriptors per vring slot MUST NOT exceed the value negotiated by common
> +configuration field "queue_indirect_size".

As mentioned above, the "common configuration layout" is actually
PCI-specific; other transports will use different mechanism. Maybe it
would make sense to reword the whole paragraph and add it in patch 1?

"If VIRTIO_RING_F_INDIRECT_SIZE has not been negotiated, the driver MUST
NOT create a descriptor chain longer than the Queue Size of the device.

If VIRTIO_RING_F_INDIRECT_SIZE has been negotiated, the number of
descriptors per vring slot MUST NOT exceed the negotiated Queue Indirect
Size."

I also wonder whether we need a device normative statement as well,
something like:

"With VIRTIO_RING_F_INDIRECT_SIZE, the device MUST provide the maximum
Queue Indirect Size for the number of descriptors per vring slot. It
MUST allow the driver to set a lower value."

Maybe we also need to mention that the mechanism is transport specific?

Also, this is only for split ring; does packed ring need any updates?

>  
>  A driver MUST NOT set both VIRTQ_DESC_F_INDIRECT and VIRTQ_DESC_F_NEXT
>  in \field{flags}.


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

