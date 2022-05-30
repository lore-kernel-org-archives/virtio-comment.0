Return-Path: <virtio-comment-return-3082-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B958198633A
	for <virtio-comment@lists.oasis-open.org>; Mon, 30 May 2022 07:22:03 +0000 (UTC)
MIME-Version: 1.0
References: <20220519084551.18119-1-alvaro.karsz@solid-run.com>
 <CACGkMEuzk_dyZPnNc7UeYFfyxDABXA5+Lj6iMGUUMesJQyf77A@mail.gmail.com>
 <CAJs=3_Bd8GZt1X4bjFnqT_c=cG6s0bg-prbtj0NZoMKAARDttw@mail.gmail.com>
 <CAJs=3_BX+AEdOxNYD=KGHWHn11G=a6+_40Rk6CJnFk1fJAnyMQ@mail.gmail.com> <CACGkMEu05SK+eVgXmfLPGb+fWJnpj-7zk13+P9x2rDW3sa8-Zg@mail.gmail.com>
In-Reply-To: <CACGkMEu05SK+eVgXmfLPGb+fWJnpj-7zk13+P9x2rDW3sa8-Zg@mail.gmail.com>
From: Alvaro Karsz <alvaro.karsz@solid-run.com>
Date: Mon, 30 May 2022 10:21:25 +0300
Message-ID: <CAJs=3_BfPANXQW0mfpQcA64dqVJ2SUy-J2Uw97PMYDH_3PK2Gg@mail.gmail.com>
Subject: Re: [virtio-comment] [PATCH v3] Introduction of Virtio Network device
 notifications coalescing feature.
Content-Type: text/plain; charset="UTF-8"
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Rabeeh Khoury <rabeeh@solid-run.com>
List-ID: <virtio-comment.lists.oasis-open.org>

> The description here looks more like GUEST_RSC instead of GUEST_GSO.
> The difference is GUEST_GSO doesn't coalesce packets.

If I understand correctly, VIRTIO_NET_F_GUEST_TSO/UFO means that the
device should coalesce ethernet frames into packets, and that's what I
meant.
Something like GRO.
Which part is not clear in the patch?
Maybe the "received frames" part?
I meant received from the "outside world" and not from the host.


>
> So we need clarify the "packet" definition:
>
> 1) is it the packet that the device saw on the wire (before coalescing)
>
> or
> 2) it's the packet that has been coalesced by the the device and put
> in the buffer
> And when the device is expected to increase the counter


I think that it should be based on ethernet frames (1).
So, the driver should increase the packet counter after
receiving/sending an ethernet frame.
Meaning that the counter may be increased many times handling just one
driver buffer (if GSO/GRO are negotiated).
This is why I added the following part:

> +\item The device will check if at least one descriptor was used from the descriptor area, if not, it will continue to accumulate frames until one descriptor is used.\\
> +An example is if any of the VIRTIO_NET_F_GUEST_TSO/UFO features are negotiated, a device could receive more than 15 frames, and write all in the same buffer.
> +\item The device will reset its internal coalescing counters.




> I think we need first understand what's the advantage of using packet
> based interrupt coalescing over event index?


I think that there are some advantages:
- More flexible, It's easier to configure the device to send
notifications every X packets/events.
- Allows you to set a timeout using the rx/tx-usecs parameters.
- For a HW device, it is more easy to get control commands through the
control virtqueue than polling the driver area using PCI transactions.

> And if the answer is yes, is it worthwhile to make coalescing and
> event index work in parallel?
>
> The notification is sent when any of the following condition is met:
>
> - If the idx field in the used ring (which determined where that
> descriptor index was placed) was equal to used_event
> - If we hit the coalescing limit
>
> For the driver that want to use interrupt coalescing only, it can choose:
>
> 1) avoid negotiating event index
>
> or
>
> 2) do not publish new used_event
>
> Thanks


In this case, the coalescing parameters could be set to 1
(tx/rx_frames_max) and it will neutralize the event_idx effect, since
a notification will be sent for every packet.
This could be done the other way around, the driver could set
event_idx to X, then increase it by 1 every notification, and it will
neutralize the coalescing.

In my opinion, the user should have control over the coalescing
parameters using ethtool, and the driver could suppress all
notifications, but I can't see what we'll benefit from allowing both
coalescing and EVENT_IDX to work in parallel.

What do you think?

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

