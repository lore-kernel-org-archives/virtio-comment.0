Return-Path: <virtio-comment-return-3031-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EB19E9863A4
	for <virtio-comment@lists.oasis-open.org>; Mon, 16 May 2022 19:01:16 +0000 (UTC)
MIME-Version: 1.0
References: <20220516103256.896922-1-alvaro.karsz@solid-run.com> <YoJxfLJLwn28i+Pz@stefanha-x1.localdomain>
In-Reply-To: <YoJxfLJLwn28i+Pz@stefanha-x1.localdomain>
From: Alvaro Karsz <alvaro.karsz@solid-run.com>
Date: Mon, 16 May 2022 22:00:38 +0300
Message-ID: <CAJs=3_D=yqKzCdWwW+CY93rzGZYJEZ5twKbYgLaKpgTSNv0WVw@mail.gmail.com>
Subject: Re: [virtio-comment] [PATCH v2] Introduction of Virtio Network device
 notifications coalescing feature
Content-Type: text/plain; charset="UTF-8"
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Rabeeh Khoury <rabeeh@solid-run.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

> There are whitespace changes in this patch that should probably be
> dropped. If you want to clean up whitespace, please submit a separate
> patch so that this patch only does one thing.

Sorry, I will remove the white spaces from the patch in the next version.

> I can't parse the last sentence

What I meant, using your example:
- Device's next buffer to consume is #0.
- EVENT_IDX  is #20, meaning that the driver doesn't want to be
interrupted on #0-19 buffers.
-  max-frames is 10.

In this case, the device should not interrupt the driver on #10,
neither on #20, just on #30, or any number above #19, after the usecs
value elapsed.


> add_used_buf(rx_buf)
>  if coal_notf(RX): # coalescing happens here
>     notify_used_buf() # Used Buffer Notification Suppression here

I guess you are talking about the code on the device's side, seems right.
The device should reset the coalescing parameters in coal_notf
function, I guess we don't want it to trigger an interrupt immediately
after the notification suppression is removed.

> I guess there's a danger of receiving no interrupts or at least weird
> suppression patterns when both these mechanisms are enabled
> simultaneously. Should drivers avoid using both at the same time?

I'm not sure how using both mechanisms at the same time will lead to
problems, can you please give an example?

The only scenarios that I can imagine when no interrupts will be
received at all are when:

1) Driver suppress all events.

2) Driver suppress events, then enables them and suppress again before
device sent any interrupt, because max-frames and usecs values not
meet.
This seems fine to me, since if driver enables events, then suppresses
them again, it is aware of the new buffers, and doesn't want to be
interrupted.


Another point is the coalescing default values.
A device can have default coalescing values, even without receiving a
command from the driver asking to change the parameters.

In this case, you could use ethtool to read the coalescing parameters
and see 0, although the device is using the default values, which may
not be 0.

The initial values could be added in the virtio_net_config struct.

What do you think? is this necessary?

It won't change the functionality, it will only show false data when
using ethtool before a VIRTIO_NET_CTRL_NOTF_COAL was sent, and if the
device has default values that aren't 0 (interrupt every packet).

We could specifying that the device should not use default parameters
without receiving a VIRTIO_NET_CTRL_NOTF_COAL command instead of using
the default values.


Regards, Alvaro

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

