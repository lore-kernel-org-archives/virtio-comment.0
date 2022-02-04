Return-Path: <virtio-comment-return-2714-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 62DD498661C
	for <virtio-comment@lists.oasis-open.org>; Fri,  4 Feb 2022 01:41:52 +0000 (UTC)
MIME-Version: 1.0
References: <20220124125625.3706347-1-stevensd@chromium.org>
 <20220124125625.3706347-2-stevensd@chromium.org> <bc90737b-1e4d-31a2-178e-d8c2b8982d45@redhat.com>
 <CAD=HUj6rj3bvGYGpoJZNLcA=YFRbj5nKxiZko9VbNfJ-_LFeFQ@mail.gmail.com> <c4e211ae-8dec-c5de-880a-b92b202e0116@redhat.com>
In-Reply-To: <c4e211ae-8dec-c5de-880a-b92b202e0116@redhat.com>
From: David Stevens <stevensd@chromium.org>
Date: Fri, 4 Feb 2022 10:41:39 +0900
Message-ID: <CAD=HUj7y8gD6Aah8=vEqugnAcDcaqwpP_uGJR=MkT8oa89V3qw@mail.gmail.com>
Subject: Re: [virtio-comment] [PATCH 1/2] virtio-balloon: add an event queue
Content-Type: text/plain; charset="UTF-8"
To: David Hildenbrand <david@redhat.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

> >>> +
> >>> +\drivernormative{\paragraph}{Events}{Device Types / Memory Balloon Device / Device Operation / Events}
> >>> +
> >>> +The driver MUST update \field{actual} with any allocated pages before
> >>> +sending a VIRTIO_BALLOON_EVENT_OOPUFF event.
> >>> +
> >>> +The driver SHOULD wait for the device to acknowledge the event
> >>> +before trying to further inflate or deflate the balloon.
> >>> +
> >>> +If VIRTIO_BALLOON_F_DEFLATE_ON_OOM has been negotiated, the driver
> >>> +SHOULD send an OOM event before using pages from the balloon.
> >>> +
> >>> +\devicenormative{\paragraph}{Events}{Device Types / Memory Balloon Device / Device Operation / Events}
> >>> +
> >>> +When the device receives a VIRTIO_BALLOON_EVENT_OOM event, it SHOULD deflate
> >>> +the balloon by \field{data} pages before acknowledging the event.
> >>
> >> The issue is that this is asynchronous. You won't really be able to stop
> >> OOM from killing processes as you usually won't be able to get back
> >> pages fast enough.
> >
> > If the device reduces num_pages before acking the message, then the
> > driver can wait for the ack and deflate the balloon synchronously. For
> > Linux specifically, blocking in the OOM notifier is fine (at least the
> > balloon driver already acquires a mutex here). And while it's true
> > that reclaiming memory might not be fast, my understanding is that
> > anywhere that could invoke the OOM killer can also invoke swap to
> > disk, which is also not fast.
>
> And that's the main issue IIRC. Allocation paths that *cannot* do that
> (sleep, trigger the OOM killer) will fail the allocation instead,
> essentially destabilizing your system or just crashing with unexpected
> behavior. Reclaim can be done mostly synchronous if need be IIRC.
>
> So once *some* path triggers the OOM killer and you try to keep up,
> other parts of the system can already start falling apart.
>
> Hooking into the shrinker interface is better, however, has some ugly
> side-effects that random memory pressure will completely deflate the
> balloon.
>
> See 71994620bb25 ("virtio_balloon: replace oom notifier with shrinker")
> followed by da10329cb057 ("virtio-balloon: switch back to OOM handler
> for VIRTIO_BALLOON_F_DEFLATE_ON_OOM")
>
> Especially my note about "The shrinker does not have a concept of
> priorities yet, so this behavior cannot be configured."
>
>
> Long story short: we should avoid hooking into the OOM killer for all
> new features.

In that case, this could be a more generic
VIRTIO_BALLOON_EVENT_PRESSURE event, which the driver is free to send
at any point where it detects memory pressure. For the Linux driver,
that would be during reclaim. For device requirements, something like:

"The device SHOULD deflate the balloon before acknowledging the event
if it determines that the driver is under severe memory pressure."

Since the device is the one that determines how much to actually
deflate, the balloon could still be used to apply memory pressure to
the guest when needed. Because the device would need stats information
to be able to handle the pressure event in any meaningful way, it
would probably be useful to include memory stats in the event itself
to avoid the need for a round trip back to the driver. That would make
the event struct look something like this:

struct virtio_balloon_event {
  u32 type;
  union {
     struct virtio_balloon_event_pressure pressure;
  };
};

struct virtio_balloon_event_pressure {
  struct virtio_balloon_stat stats[];
};

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

