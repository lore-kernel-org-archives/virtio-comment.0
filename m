Return-Path: <virtio-comment-return-2664-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CAD9F98659C
	for <virtio-comment@lists.oasis-open.org>; Fri, 28 Jan 2022 15:46:26 +0000 (UTC)
Message-ID: <bc90737b-1e4d-31a2-178e-d8c2b8982d45@redhat.com>
Date: Fri, 28 Jan 2022 16:46:17 +0100
MIME-Version: 1.0
References: <20220124125625.3706347-1-stevensd@chromium.org>
 <20220124125625.3706347-2-stevensd@chromium.org>
From: David Hildenbrand <david@redhat.com>
In-Reply-To: <20220124125625.3706347-2-stevensd@chromium.org>
Subject: Re: [virtio-comment] [PATCH 1/2] virtio-balloon: add an event queue
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: David Stevens <stevensd@chromium.org>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On 24.01.22 13:56, David Stevens wrote:
> Add an event queue to the balloon to allow the driver to send events to
> the device, which allows the device to be more responsive to the memory
> needs of the guest.
> 
> There are two defined events. The first event is an out of memory event.
> This event provides a way for the guest to handle out of memory events
> on a system where the host does not support deflate-on-oom. The second
> event is an out of puff event, which the guest can send when it fails to
> allocate memory while trying to inflate the balloon. This serves as an
> indication to the device that the driver may not be able to inflate the
> balloon in a timely manner.

Do we actually need a queue for that or could a simple member in the
config space be sufficient?

Something like a "logical driver state". By storing specific value, the
the driver can notify the hypervisor about such events.

Just an idea.

Of course, you cannot really come up with an additional payload, but my
guess is that "The \field{data} value indicates how many pages the
driver requires to maintain system stability." will be wrong in 99.999%
of all cases. Relying on anything provided by the shrinker or the OOM
handler does not give you an idea what the system needs overall to "
maintain system stability".

[...]

> +
> +\begin{itemize}
> +\item Out of memory
> +\begin{lstlisting}
> +#define VIRTIO_BALLOON_EVENT_OOM        1
> +\end{lstlisting}
> +The driver has encountered a situation in which using pages from the balloon
> +is necessary for system stability (e.g. if memory is required by applications
> +running within the guest). The \field{data} value indicates how many pages
> +the driver requires to maintain system stability.
> +\item Out of puff
> +\begin{lstlisting}
> +#define VIRTIO_BALLOON_EVENT_OOPUFF     2
> +\end{lstlisting}
> +The driver has encountered an allocation failure when trying to inflate
> +the balloon. The \field{data} value is unused. This event serves as a signal
> +that the balloon may not be able to inflate in a timely manner.
> +\end{itemize}
> +
> +\drivernormative{\paragraph}{Events}{Device Types / Memory Balloon Device / Device Operation / Events}
> +
> +The driver MUST update \field{actual} with any allocated pages before
> +sending a VIRTIO_BALLOON_EVENT_OOPUFF event.
> +
> +The driver SHOULD wait for the device to acknowledge the event
> +before trying to further inflate or deflate the balloon.
> +
> +If VIRTIO_BALLOON_F_DEFLATE_ON_OOM has been negotiated, the driver
> +SHOULD send an OOM event before using pages from the balloon.
> +
> +\devicenormative{\paragraph}{Events}{Device Types / Memory Balloon Device / Device Operation / Events}
> +
> +When the device receives a VIRTIO_BALLOON_EVENT_OOM event, it SHOULD deflate
> +the balloon by \field{data} pages before acknowledging the event.

The issue is that this is asynchronous. You won't really be able to stop
OOM from killing processes as you usually won't be able to get back
pages fast enough.

Even deflate-on-oom is flawed in that regard. If you run in the OOM
handler you're pretty much screwed already. But I mean, having it is not
making the situation worse :)

-- 
Thanks,

David / dhildenb


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

