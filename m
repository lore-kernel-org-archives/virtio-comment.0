Return-Path: <virtio-comment-return-3084-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0F2729862CC
	for <virtio-comment@lists.oasis-open.org>; Tue, 31 May 2022 07:02:16 +0000 (UTC)
MIME-Version: 1.0
References: <20220519084551.18119-1-alvaro.karsz@solid-run.com>
 <CACGkMEuzk_dyZPnNc7UeYFfyxDABXA5+Lj6iMGUUMesJQyf77A@mail.gmail.com>
 <CAJs=3_Bd8GZt1X4bjFnqT_c=cG6s0bg-prbtj0NZoMKAARDttw@mail.gmail.com>
 <CAJs=3_BX+AEdOxNYD=KGHWHn11G=a6+_40Rk6CJnFk1fJAnyMQ@mail.gmail.com>
 <CACGkMEu05SK+eVgXmfLPGb+fWJnpj-7zk13+P9x2rDW3sa8-Zg@mail.gmail.com>
 <CAJs=3_BfPANXQW0mfpQcA64dqVJ2SUy-J2Uw97PMYDH_3PK2Gg@mail.gmail.com> <CACGkMEsagbT8GakEFf1sMM0sr0CmwpV1Zrx9bFviqwk8cXVEkA@mail.gmail.com>
In-Reply-To: <CACGkMEsagbT8GakEFf1sMM0sr0CmwpV1Zrx9bFviqwk8cXVEkA@mail.gmail.com>
From: Alvaro Karsz <alvaro.karsz@solid-run.com>
Date: Tue, 31 May 2022 10:01:38 +0300
Message-ID: <CAJs=3_BjUgGeCNLvRX-vKU7wHx=iqA_+XXPngaPHCvOQa8cRXg@mail.gmail.com>
Subject: Re: [virtio-comment] [PATCH v3] Introduction of Virtio Network device
 notifications coalescing feature.
Content-Type: text/plain; charset="UTF-8"
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Rabeeh Khoury <rabeeh@solid-run.com>, Stefan Hajnoczi <stefanha@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

> So according to the name of the feature, it tries to coalesce
> notification. But from what you said here, it counts by frames. This
> seems to be a conflict:
>
>
> We never had per frame notification in the past but per packet used
> buffer notification.
>
>
> What's more, looking at the spec of real hardware NIC like e810 or the
> ancient e1000, I don't see any per frame interrupt. They only have per
> TX/RX descriptor writeback interrupt which signals the completion of
> TX/RX pacekt.


You're right, coalescing packets was my initial intention, but I
understood from the comments on V2 that is should count ethernet
frames from Stefan's comment:

>  I think the virtio-net-level coalescing makes sense
> since it counts Ethernet frames rather than virtqueue buffers.


Anyway, I think that counting packets makes more sense, and I will
change it accordingly if you all are Ok with that.

>
> An example, if we tx-frames to 16, but we transmit 64K GSO on 1500
> MSS. The packets were segmented to ~43 frames. If we send a
> notification every 16 frames, the first 2 notifications are
> meaningless, there's nothing that a guest driver can do. So did the
> receiving. I don't get why not simply coalescing the used buffer
> notification.


You're right, that was my point in V2:
>
> x-max-frames = 5
> The driver wants to send a 64k packet, and VIRTIO_NET_F_HOST_TSO4 is negotiated.
> The driver will write a 64K description on the descriptor area.
> The device will segment the payload and will send more than 40 frames
> (with standard MTU) in a very short time (so the timer is not a
> factor).
> The device will send more than 8 notifications to the driver for just
> 1 used descriptor.



> So I feel counting by used buffer is simpler and more useful than
> counting by frames. In order to make them work in parallel, we can
> simply say: when the coalescing condition is not met, the event
> notification will be delayed until we meet the coalescing condition
> otherwise the notification is armed and raised.


We have 2 approaches in implementing the device's side:

Approach 1:
The device should always count packets, even if notifications are not enabled:
Something like:
- Device uses a buffer.
- Device increases the packet counter.
- Device checks if coalescing conditions are met.
If coalescing conditions indeed met:
- Device resets the coalescing counters.
- Device sends a notification, only if notifications are enabled.

Code example:

mark_desc_as_used()
update_coal_counters()
if (coal_cond_met) {
    reset_coal_counters()
    if (events_enabled)
        send_notification()
}

Approach 2:
The device counts packets only if notifications are enabled.
Something like:
- Device uses a buffer.
- Device checks if notifications are enabled, if not, it just resets
coalescing counters.
If notifications are enabled:
- Device increases the packet counter.
- Device checks if coalescing conditions are met.
- Device reset the coalescing counters.
- Device sends a notification.

Code example:

mark_desc_as_used()
if (events_enabled) {
    update_coal_counters()
    if (coal_cond_met) {
        reset_coal_counters()
        send_notification()
    }
} else {
    reset_coal_counters()
}

Approach 1 is simpler, specially for a Real HW device, which needs to
make a PCI transaction and wait for completion to check if
notifications are enabled.
But, we may have a minor issue with EVENT_IDX using the first approach:
Assume:
ring current location #0
EVENT_IDX #9
max-frames 10

Using approach 1: A notification will be sent to the driver on buffer
#10, not #19.
Using approach 2: A notification will be sent to the driver on buffer #19.

I think that we should use approach 1, and it's not a big deal to send
on #10 in this example.

What do you think?


Another point with EVENT_IDX is that the device should "remember" if
it already sent a notification for a given event_idx.
If the driver sets event_idx to #20, and never changes it, the device
should send a notification after #20, then should not send any
notification until the 16bit counter overflows, and it passes #20
again.

Do you agree?

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

