Return-Path: <virtio-comment-return-3038-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 308459863C5
	for <virtio-comment@lists.oasis-open.org>; Tue, 17 May 2022 10:02:31 +0000 (UTC)
MIME-Version: 1.0
References: <20220516103256.896922-1-alvaro.karsz@solid-run.com>
 <YoJxfLJLwn28i+Pz@stefanha-x1.localdomain> <CAJs=3_D=yqKzCdWwW+CY93rzGZYJEZ5twKbYgLaKpgTSNv0WVw@mail.gmail.com>
 <YoNr0jTiqtW8XYDX@stefanha-x1.localdomain>
In-Reply-To: <YoNr0jTiqtW8XYDX@stefanha-x1.localdomain>
From: Alvaro Karsz <alvaro.karsz@solid-run.com>
Date: Tue, 17 May 2022 13:01:54 +0300
Message-ID: <CAJs=3_DudKej_CxdtVDsc_ePJEEr24fQv3uS-XWDCZ8OzRxMBQ@mail.gmail.com>
Subject: Re: [virtio-comment] [PATCH v2] Introduction of Virtio Network device
 notifications coalescing feature
Content-Type: text/plain; charset="UTF-8"
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Rabeeh Khoury <rabeeh@solid-run.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

I forgot to address this point in your previous  email:

> My guess is that VIRTIO_F_EVENT_IDX and
> *-max-frames have similar effects in suppressing notifications.

One big difference is that if you want to ask the device to send an
interrupt every 20 packets, you should set VIRTIO_F_EVENT_IDX to 20.
Then when an interrupt is received, change it to 40, then to 60..

Using the notifications coalescing feature, you just need to set the
max-frames values once, and that's it.

> I'm thinking about the scenario where EVENT_IDX and max-frames are not
> multiples and the coalesce timer is disabled (0). Can the driver be in a
> situation where is waits forever?

The timer can't be disabled.
Without the timer, you'll have problems even without  EVENT_IDX/
notification suppressions.
Assume a scenario when max-frames is 10, and the device receives only
5 packets, and then the network is silent.
In this case, these packets will never reach the driver.

So, the timer must always work if a device supports this feature.

timer=0 should mean that an interrupt is sent if 0 usecs elapsed since
the last interrupt, which always will be "yes".


> I think the max-frames state should only be reset when the Used Buffer
> Notification is sent. That way a notification is sent after 3 tx buffers
> have been used and the driver will be able to make progress.

It's possible to ask the device to reset the coalescing counters only
when an interrupt is sent, but I think that it is not required because
of the coalescing timer.


Alvaro

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

