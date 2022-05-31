Return-Path: <virtio-comment-return-3083-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 71D759861B0
	for <virtio-comment@lists.oasis-open.org>; Tue, 31 May 2022 04:36:27 +0000 (UTC)
MIME-Version: 1.0
References: <20220519084551.18119-1-alvaro.karsz@solid-run.com>
 <CACGkMEuzk_dyZPnNc7UeYFfyxDABXA5+Lj6iMGUUMesJQyf77A@mail.gmail.com>
 <CAJs=3_Bd8GZt1X4bjFnqT_c=cG6s0bg-prbtj0NZoMKAARDttw@mail.gmail.com>
 <CAJs=3_BX+AEdOxNYD=KGHWHn11G=a6+_40Rk6CJnFk1fJAnyMQ@mail.gmail.com>
 <CACGkMEu05SK+eVgXmfLPGb+fWJnpj-7zk13+P9x2rDW3sa8-Zg@mail.gmail.com> <CAJs=3_BfPANXQW0mfpQcA64dqVJ2SUy-J2Uw97PMYDH_3PK2Gg@mail.gmail.com>
In-Reply-To: <CAJs=3_BfPANXQW0mfpQcA64dqVJ2SUy-J2Uw97PMYDH_3PK2Gg@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 31 May 2022 12:35:31 +0800
Message-ID: <CACGkMEsagbT8GakEFf1sMM0sr0CmwpV1Zrx9bFviqwk8cXVEkA@mail.gmail.com>
Subject: Re: [virtio-comment] [PATCH v3] Introduction of Virtio Network device
 notifications coalescing feature.
Content-Type: text/plain; charset="UTF-8"
To: Alvaro Karsz <alvaro.karsz@solid-run.com>
Cc: virtio-comment@lists.oasis-open.org, Rabeeh Khoury <rabeeh@solid-run.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, May 30, 2022 at 3:22 PM Alvaro Karsz <alvaro.karsz@solid-run.com> wrote:
>
> > The description here looks more like GUEST_RSC instead of GUEST_GSO.
> > The difference is GUEST_GSO doesn't coalesce packets.
>
> If I understand correctly, VIRTIO_NET_F_GUEST_TSO/UFO means that the
> device should coalesce ethernet frames into packets, and that's what I
> meant.
> Something like GRO.
> Which part is not clear in the patch?
> Maybe the "received frames" part?
> I meant received from the "outside world" and not from the host.

So according to the name of the feature, it tries to coalesce
notification. But from what you said here, it counts by frames. This
seems to be a conflict:

We never had per frame notification in the past but per packet used
buffer notification.

What's more, looking at the spec of real hardware NIC like e810 or the
ancient e1000, I don't see any per frame interrupt. They only have per
TX/RX descriptor writeback interrupt which signals the completion of
TX/RX pacekt.

>
>
> >
> > So we need clarify the "packet" definition:
> >
> > 1) is it the packet that the device saw on the wire (before coalescing)
> >
> > or
> > 2) it's the packet that has been coalesced by the the device and put
> > in the buffer
> > And when the device is expected to increase the counter
>
>
> I think that it should be based on ethernet frames (1).

What's the advantage of counting frames here? In the case of GSO,
those frames were invisible to the software, so we can't make use of
the per frame notification or its coalescing.

> So, the driver should increase the packet counter after
> receiving/sending an ethernet frame.
> Meaning that the counter may be increased many times handling just one
> driver buffer (if GSO/GRO are negotiated).
> This is why I added the following part:
>
> > +\item The device will check if at least one descriptor was used from the descriptor area, if not, it will continue to accumulate frames until one descriptor is used.\\
> > +An example is if any of the VIRTIO_NET_F_GUEST_TSO/UFO features are negotiated, a device could receive more than 15 frames, and write all in the same buffer.
> > +\item The device will reset its internal coalescing counters.

An example, if we tx-frames to 16, but we transmit 64K GSO on 1500
MSS. The packets were segmented to ~43 frames. If we send a
notification every 16 frames, the first 2 notifications are
meaningless, there's nothing that a guest driver can do. So did the
receiving. I don't get why not simply coalescing the used buffer
notification.

>
>
>
>
> > I think we need first understand what's the advantage of using packet
> > based interrupt coalescing over event index?
>
>
> I think that there are some advantages:
> - More flexible, It's easier to configure the device to send
> notifications every X packets/events.
> - Allows you to set a timeout using the rx/tx-usecs parameters.
> - For a HW device, it is more easy to get control commands through the
> control virtqueue than polling the driver area using PCI transactions.
>
> > And if the answer is yes, is it worthwhile to make coalescing and
> > event index work in parallel?
> >
> > The notification is sent when any of the following condition is met:
> >
> > - If the idx field in the used ring (which determined where that
> > descriptor index was placed) was equal to used_event
> > - If we hit the coalescing limit
> >
> > For the driver that want to use interrupt coalescing only, it can choose:
> >
> > 1) avoid negotiating event index
> >
> > or
> >
> > 2) do not publish new used_event
> >
> > Thanks
>
>
> In this case, the coalescing parameters could be set to 1
> (tx/rx_frames_max) and it will neutralize the event_idx effect, since
> a notification will be sent for every packet.
> This could be done the other way around, the driver could set
> event_idx to X, then increase it by 1 every notification, and it will
> neutralize the coalescing.
>
> In my opinion, the user should have control over the coalescing
> parameters using ethtool, and the driver could suppress all
> notifications, but I can't see what we'll benefit from allowing both
> coalescing and EVENT_IDX to work in parallel.
>
> What do you think?
>

So I think they don't conflict with each other. E.g some drivers like
Linux can benefit from this.

If we count by frames, see above reply, we may have some conflict.

Assuming we count by used buffers (packets), at least the TX could benefit:

- under normal load, notification coalescing can help to moderate interrupt rate
- under extremely heavy load (the virtqueue is about to be full),  we
can use event idx to delay the tx interrupt until e.g 3/4 of the queue
were drained

So I feel counting by used buffer is simpler and more useful than
counting by frames. In order to make them work in parallel, we can
simply say: when the coalescing condition is not met, the event
notification will be delayed until we meet the coalescing condition
otherwise the notification is armed and raised.

Thanks


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

