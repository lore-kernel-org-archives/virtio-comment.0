Return-Path: <virtio-comment-return-3081-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3EAAC9862D9
	for <virtio-comment@lists.oasis-open.org>; Mon, 30 May 2022 03:38:13 +0000 (UTC)
MIME-Version: 1.0
References: <20220519084551.18119-1-alvaro.karsz@solid-run.com>
 <CACGkMEuzk_dyZPnNc7UeYFfyxDABXA5+Lj6iMGUUMesJQyf77A@mail.gmail.com>
 <CAJs=3_Bd8GZt1X4bjFnqT_c=cG6s0bg-prbtj0NZoMKAARDttw@mail.gmail.com> <CAJs=3_BX+AEdOxNYD=KGHWHn11G=a6+_40Rk6CJnFk1fJAnyMQ@mail.gmail.com>
In-Reply-To: <CAJs=3_BX+AEdOxNYD=KGHWHn11G=a6+_40Rk6CJnFk1fJAnyMQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 30 May 2022 11:37:56 +0800
Message-ID: <CACGkMEu05SK+eVgXmfLPGb+fWJnpj-7zk13+P9x2rDW3sa8-Zg@mail.gmail.com>
Subject: Re: [virtio-comment] [PATCH v3] Introduction of Virtio Network device
 notifications coalescing feature.
Content-Type: text/plain; charset="UTF-8"
To: Alvaro Karsz <alvaro.karsz@solid-run.com>
Cc: virtio-comment@lists.oasis-open.org, Rabeeh Khoury <rabeeh@solid-run.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, May 26, 2022 at 10:48 PM Alvaro Karsz
<alvaro.karsz@solid-run.com> wrote:
>
> After some more thought, I'm not sure that the notifications
> coalescing feature can work if VIRTIO_F_EVENT_IDX is negotiated.
>
> Quoting Virtio Spec:
> > Note: For example, if used_event is 0, then a device using VIRTIO_F_EVENT_IDX would send a used buffer notification to the driver after the first buffer is used (and again after the 65536th buffer, etc).
>
> So, if the driver sets the event index to #X and doesn't change the
> value after receiving the notification, it is meaningless to use the
> interrupt coalescing parameters. since it will anyway receive a
> notification every 65536 packets (uint16_t overflow).

It's not a conflict since we can add more conditions when the device
needs to send a notification.

>
> I'm thinking of adding a constraint that the driver MUST NOT accept
> this feature if VIRTIO_F_EVENT_IDX is offered by the device.
> What do you think?

I think we need first understand what's the advantage of using packet
based interrupt coalescing over event index?

And if the answer is yes, is it worthwhile to make coalescing and
event index work in parallel?

The notification is sent when any of the following condition is met:

- If the idx field in the used ring (which determined where that
descriptor index was placed) was equal to used_event
- If we hit the coalescing limit

For the driver that want to use interrupt coalescing only, it can choose:

1) avoid negotiating event index

or

2) do not publish new used_event

Thanks

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

