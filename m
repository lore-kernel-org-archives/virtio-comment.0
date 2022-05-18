Return-Path: <virtio-comment-return-3048-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3E123986509
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 May 2022 12:08:09 +0000 (UTC)
MIME-Version: 1.0
References: <20220516103256.896922-1-alvaro.karsz@solid-run.com>
 <YoJxfLJLwn28i+Pz@stefanha-x1.localdomain> <CAJs=3_D=yqKzCdWwW+CY93rzGZYJEZ5twKbYgLaKpgTSNv0WVw@mail.gmail.com>
 <4a24ee12-4a53-b7de-d810-3719be28a5da@redhat.com> <CAJs=3_ChH_8eQfyj3Hj2BWXT+iLJN+vz6g9pUvx+-3+AbNDSXQ@mail.gmail.com>
In-Reply-To: <CAJs=3_ChH_8eQfyj3Hj2BWXT+iLJN+vz6g9pUvx+-3+AbNDSXQ@mail.gmail.com>
From: Alvaro Karsz <alvaro.karsz@solid-run.com>
Date: Wed, 18 May 2022 15:07:32 +0300
Message-ID: <CAJs=3_BGYmjaWPk82qi+qLvf52i=PZJT+O3WjvsDOSqyqEuf4A@mail.gmail.com>
Subject: Re: [virtio-comment] [PATCH v2] Introduction of Virtio Network device
 notifications coalescing feature
Content-Type: text/plain; charset="UTF-8"
To: Jason Wang <jasowang@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, virtio-comment@lists.oasis-open.org, Rabeeh Khoury <rabeeh@solid-run.com>, "Michael S. Tsirkin" <mst@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

> I don't want to
> distract you though, I think the virtio-net-level coalescing makes sense
> since it counts Ethernet frames rather than virtqueue buffers.

I'm not sure it should count ethernet frames, I think that it should
count descriptors.
Assume the following example:

tx-max-frames = 5
The driver wants to send a 64k packet, and VIRTIO_NET_F_HOST_TSO4 is negotiated.
The driver will write a 64K description on the descriptor area.
The device will segment the payload and will send more than 40 frames
(with standard MTU) in a very short time (so the timer is not a
factor).
The device will send more than 8 notifications to the driver for just
1 used descriptor.

I think that speaking of descriptors instead of ethernet frames makes
more sense.

This is relevant for RX as well.
Assume that VIRTIO_NET_F_GUEST_TSO4 is negotiated, and
VIRTIO_NET_F_MRG_RXBUF is not.
We could receive many frames that will be written in the same
descriptor chain, and we are in the same situation as described for
TX.


I think that this feature should be at a "higher level".

The device operates normally, ignoring the coalescing parameters.

If the device "decides" that it should send a notification according
to VirtIO "rules" (before checking if the events are suppressed by the
driver), it will then increase the internal coalescing counters, and
decide if it should send the notification.
So, in the case of GSO, it will increase the internal tx-fames counter
by 1 if the descriptor is of a 64B packet, or a 64KB  packet.


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

