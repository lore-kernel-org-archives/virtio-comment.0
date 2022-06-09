Return-Path: <virtio-comment-return-3111-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DC53D986569
	for <virtio-comment@lists.oasis-open.org>; Thu,  9 Jun 2022 07:17:14 +0000 (UTC)
MIME-Version: 1.0
References: <20220601073330.2468384-1-alvaro.karsz@solid-run.com> <CACGkMEvHG78xA5phUVeFM-+k6ZZk68TABHRKP_WdtL3_=r-qyA@mail.gmail.com>
In-Reply-To: <CACGkMEvHG78xA5phUVeFM-+k6ZZk68TABHRKP_WdtL3_=r-qyA@mail.gmail.com>
From: Alvaro Karsz <alvaro.karsz@solid-run.com>
Date: Thu, 9 Jun 2022 10:16:37 +0300
Message-ID: <CAJs=3_CLa0J2w2bLd6fhT-zzHGsugrote-a=3eDw60GiVVEvRQ@mail.gmail.com>
Subject: [virtio-comment] Re: [PATCH v4] Introduction of Virtio Network device notifications
 coalescing feature.
Content-Type: text/plain; charset="UTF-8"
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Rabeeh Khoury <rabeeh@solid-run.com>
List-ID: <virtio-comment.lists.oasis-open.org>

> Considering RX may use multiple buffers per packet, I wonder if it's
> better to stick to "packet" here.

Noted.

> Does this work like: if we set rx_max_buffers to 10, it means after 1
> buffers is used, we still need another 10 buffers?

No, if  rx_max_buffers=10, we should send a notification on the #10
packet. I will clarify that.

> I think we should explicitly say mergeable rx buffers here. And that's
> why I think mentioning "packet is sent/received" is probably better
> than the buffer used here.

I meant when the host writes a packet in several buffers, and the NEXT
flag is set on the descriptor.
But you're right, I should mention the mergeable rx buffers as well.

> It's better to clarify it in the part of coalescing parameters, or we
> can just borrow the comments of kernel's ethtool_coalesce, then it
> should explain itself like:
>
>
> @rx_usecs: How many usecs to delay an RX notification after a packet arrives
> @rx_max_buffers: Maximum number of packets to receive before an RX notification
>
>
> Not a native speaker but then rx_usecs=0 it means the notification is
> sent immediately and by saying "maximum number" it means best effort.

Noted. I will move the coalescing parameters explanation to this subparagraph.

> Let's clarify what happens if notification is suppressed.

I will add that in this case, the device should not send a notification.

> I think there's probably no need to mention the implementation details
> like counters here. The definition of rx_usecs and rx_max_buffers
> should be sufficient.

Noted.

> What's the reason for this?

Because if (tx/rx)_buffers_max is bigger than the virtqueue size, this
condition will never be met.
Do you think that we should allow this to happen?

> I think we need use MUST here, something like:
>
>
> Upon reset, the device must present all zero values ...

Noted.

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

