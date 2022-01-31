Return-Path: <virtio-comment-return-2685-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3C3DA9864DD
	for <virtio-comment@lists.oasis-open.org>; Mon, 31 Jan 2022 07:10:39 +0000 (UTC)
MIME-Version: 1.0
References: <20220124125625.3706347-1-stevensd@chromium.org>
 <20220124125625.3706347-2-stevensd@chromium.org> <bc90737b-1e4d-31a2-178e-d8c2b8982d45@redhat.com>
In-Reply-To: <bc90737b-1e4d-31a2-178e-d8c2b8982d45@redhat.com>
From: David Stevens <stevensd@chromium.org>
Date: Mon, 31 Jan 2022 16:10:27 +0900
Message-ID: <CAD=HUj6rj3bvGYGpoJZNLcA=YFRbj5nKxiZko9VbNfJ-_LFeFQ@mail.gmail.com>
Subject: Re: [virtio-comment] [PATCH 1/2] virtio-balloon: add an event queue
Content-Type: text/plain; charset="UTF-8"
To: David Hildenbrand <david@redhat.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Sat, Jan 29, 2022 at 12:46 AM David Hildenbrand <david@redhat.com> wrote:
>
> On 24.01.22 13:56, David Stevens wrote:
> > Add an event queue to the balloon to allow the driver to send events to
> > the device, which allows the device to be more responsive to the memory
> > needs of the guest.
> >
> > There are two defined events. The first event is an out of memory event.
> > This event provides a way for the guest to handle out of memory events
> > on a system where the host does not support deflate-on-oom. The second
> > event is an out of puff event, which the guest can send when it fails to
> > allocate memory while trying to inflate the balloon. This serves as an
> > indication to the device that the driver may not be able to inflate the
> > balloon in a timely manner.
>
> Do we actually need a queue for that or could a simple member in the
> config space be sufficient?
>
> Something like a "logical driver state". By storing specific value, the
> the driver can notify the hypervisor about such events.
>
> Just an idea.

Having an event field in the config space should work. I do think
having an ack is important, but that could be done via the device
clearing the event field and triggering a config change callback.

The one drawback of this approach I can think of is that it requires
that the driver writing to the device config space generates events
for the device. At least based on my understanding of the balloon
spec, the device can completely ignore any writes to the device config
space after the DRIVER_OK bit is set. That allows the device to put
the device config on its own page and use KVM to map that page into
the guest, which then skips the need for any vmexits when
reading/writing num_pages or actual in the guest. I guess this would
still technically be achievable even with the event field by making
the offset of the device config non-page-aligned, so that the event
field lies on a new page. However, if any new fields get added after
the event field, they would generate vmexits as well. I don't know if
that's a concern to worry about, though.

> Of course, you cannot really come up with an additional payload, but my
> guess is that "The \field{data} value indicates how many pages the
> driver requires to maintain system stability." will be wrong in 99.999%
> of all cases. Relying on anything provided by the shrinker or the OOM
> handler does not give you an idea what the system needs overall to "
> maintain system stability".

One of the device or the driver needs to determine how much to deflate
the balloon in response to the OOM. It's true that the driver probably
can't guess exactly how much memory is needed, but it's definitely
going to be able to make a better guess than the device. In the end,
the device can do whatever it wants with the request, but I think it's
still useful for the driver to be able to provide a hint.

> [...]
>
> > +
> > +\begin{itemize}
> > +\item Out of memory
> > +\begin{lstlisting}
> > +#define VIRTIO_BALLOON_EVENT_OOM        1
> > +\end{lstlisting}
> > +The driver has encountered a situation in which using pages from the balloon
> > +is necessary for system stability (e.g. if memory is required by applications
> > +running within the guest). The \field{data} value indicates how many pages
> > +the driver requires to maintain system stability.
> > +\item Out of puff
> > +\begin{lstlisting}
> > +#define VIRTIO_BALLOON_EVENT_OOPUFF     2
> > +\end{lstlisting}
> > +The driver has encountered an allocation failure when trying to inflate
> > +the balloon. The \field{data} value is unused. This event serves as a signal
> > +that the balloon may not be able to inflate in a timely manner.
> > +\end{itemize}
> > +
> > +\drivernormative{\paragraph}{Events}{Device Types / Memory Balloon Device / Device Operation / Events}
> > +
> > +The driver MUST update \field{actual} with any allocated pages before
> > +sending a VIRTIO_BALLOON_EVENT_OOPUFF event.
> > +
> > +The driver SHOULD wait for the device to acknowledge the event
> > +before trying to further inflate or deflate the balloon.
> > +
> > +If VIRTIO_BALLOON_F_DEFLATE_ON_OOM has been negotiated, the driver
> > +SHOULD send an OOM event before using pages from the balloon.
> > +
> > +\devicenormative{\paragraph}{Events}{Device Types / Memory Balloon Device / Device Operation / Events}
> > +
> > +When the device receives a VIRTIO_BALLOON_EVENT_OOM event, it SHOULD deflate
> > +the balloon by \field{data} pages before acknowledging the event.
>
> The issue is that this is asynchronous. You won't really be able to stop
> OOM from killing processes as you usually won't be able to get back
> pages fast enough.

If the device reduces num_pages before acking the message, then the
driver can wait for the ack and deflate the balloon synchronously. For
Linux specifically, blocking in the OOM notifier is fine (at least the
balloon driver already acquires a mutex here). And while it's true
that reclaiming memory might not be fast, my understanding is that
anywhere that could invoke the OOM killer can also invoke swap to
disk, which is also not fast.

-David

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

