Return-Path: <virtio-comment-return-3112-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C5383986569
	for <virtio-comment@lists.oasis-open.org>; Thu,  9 Jun 2022 07:30:24 +0000 (UTC)
MIME-Version: 1.0
References: <20220601073330.2468384-1-alvaro.karsz@solid-run.com>
 <CACGkMEvHG78xA5phUVeFM-+k6ZZk68TABHRKP_WdtL3_=r-qyA@mail.gmail.com> <CAJs=3_CLa0J2w2bLd6fhT-zzHGsugrote-a=3eDw60GiVVEvRQ@mail.gmail.com>
In-Reply-To: <CAJs=3_CLa0J2w2bLd6fhT-zzHGsugrote-a=3eDw60GiVVEvRQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 9 Jun 2022 15:30:08 +0800
Message-ID: <CACGkMEvLWR4xCYtFocqE2PdhpM_=MC3RMd42igdznx2-9Gczmg@mail.gmail.com>
Subject: [virtio-comment] Re: [PATCH v4] Introduction of Virtio Network device notifications
 coalescing feature.
Content-Type: text/plain; charset="UTF-8"
To: Alvaro Karsz <alvaro.karsz@solid-run.com>
Cc: virtio-comment@lists.oasis-open.org, Rabeeh Khoury <rabeeh@solid-run.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Jun 9, 2022 at 3:17 PM Alvaro Karsz <alvaro.karsz@solid-run.com> wrote:
>
> > Considering RX may use multiple buffers per packet, I wonder if it's
> > better to stick to "packet" here.
>
> Noted.
>
> > Does this work like: if we set rx_max_buffers to 10, it means after 1
> > buffers is used, we still need another 10 buffers?
>
> No, if  rx_max_buffers=10, we should send a notification on the #10
> packet. I will clarify that.
>
> > I think we should explicitly say mergeable rx buffers here. And that's
> > why I think mentioning "packet is sent/received" is probably better
> > than the buffer used here.
>
> I meant when the host writes a packet in several buffers, and the NEXT
> flag is set on the descriptor.
> But you're right, I should mention the mergeable rx buffers as well.
>
> > It's better to clarify it in the part of coalescing parameters, or we
> > can just borrow the comments of kernel's ethtool_coalesce, then it
> > should explain itself like:
> >
> >
> > @rx_usecs: How many usecs to delay an RX notification after a packet arrives
> > @rx_max_buffers: Maximum number of packets to receive before an RX notification
> >
> >
> > Not a native speaker but then rx_usecs=0 it means the notification is
> > sent immediately and by saying "maximum number" it means best effort.
>
> Noted. I will move the coalescing parameters explanation to this subparagraph.
>
> > Let's clarify what happens if notification is suppressed.
>
> I will add that in this case, the device should not send a notification.

Yes, and when the notification needs to be sent.

>
> > I think there's probably no need to mention the implementation details
> > like counters here. The definition of rx_usecs and rx_max_buffers
> > should be sufficient.
>
> Noted.
>
> > What's the reason for this?
>
> Because if (tx/rx)_buffers_max is bigger than the virtqueue size, this
> condition will never be met.

I don't understand here, the driver can poll for the used buffer actually.

> Do you think that we should allow this to happen?

Not sure but I just have a try with mlx4, it gives me:

# ethtool -g ens3d1
Ring parameters for ens3d1:
Pre-set maximums:
RX: 8192
RX Mini: n/a
RX Jumbo: n/a
TX: 8192
Current hardware settings:
RX: 1024
RX Mini: n/a
RX Jumbo: n/a
TX: 1024

# ethtool -c ens3d1
Coalesce parameters for ens3d1:
Adaptive RX: on  TX: n/a
stats-block-usecs: n/a
sample-interval: 0
pkt-rate-low: 400000
pkt-rate-high: 450000

rx-usecs: 16
rx-frames: 2048
rx-usecs-irq: n/a
rx-frames-irq: n/a

tx-usecs: 16
tx-frames: 16
tx-usecs-irq: n/a
tx-frames-irq: 256

rx-usecs-low: 0
rx-frame-low: n/a
tx-usecs-low: n/a
tx-frame-low: n/a

rx-usecs-high: 128
rx-frame-high: n/a
tx-usecs-high: n/a
tx-frame-high: n/a

It means rx-frames could be bigger than RX.

Thanks

>
> > I think we need use MUST here, something like:
> >
> >
> > Upon reset, the device must present all zero values ...
>
> Noted.
>


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

