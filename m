Return-Path: <virtio-comment-return-3027-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9D4F798639D
	for <virtio-comment@lists.oasis-open.org>; Mon, 16 May 2022 09:02:07 +0000 (UTC)
MIME-Version: 1.0
References: <20220512080739.1952344-1-alvaro.karsz@solid-run.com> <YoISJYWGYvmLgpmm@stefanha-x1.localdomain>
In-Reply-To: <YoISJYWGYvmLgpmm@stefanha-x1.localdomain>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 16 May 2022 17:01:52 +0800
Message-ID: <CACGkMEuhhxR_J1rg_gSDzCtE_qjWfhArJ+civJGgGBGXw0Ctsw@mail.gmail.com>
Subject: Re: [virtio-comment] [PATCH] Introduction of Virtio Network device
 interrupt coalescing feature
Content-Type: text/plain; charset="UTF-8"
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Alvaro Karsz <alvaro.karsz@solid-run.com>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, May 16, 2022 at 4:58 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Thu, May 12, 2022 at 11:07:39AM +0300, Alvaro Karsz wrote:
> > Control a network device interrupt coalescing parameters using the control virtqueue.
> > A new control class was added: VIRTIO_NET_CTRL_INTR_COAL.
> >
> > This class provides 2 commands:
> > - VIRTIO_NET_CTRL_INTR_COAL_USECS_SET:
> >   Ask the network device to change the rx-usecs and tx-usecs parameters.
> >   rx-usecs - Time to delay an RX interrupt after packet arrival in microseconds.
> >   tx-usecs - Time to delay a TX interrupt after a sending a packet in microseconds.
> >
> > - VIRTIO_NET_CTRL_INTR_COAL_FRAMES_SET:
> >   Ask the network device to change the rx-max-frames and tx-max-frames parameters.
> >   rx-max-frames - Number of packets to delay an RX interrupt after packet arrival.
> >   tx-max-frames - Number of packets to delay a TX interrupt after sending a packet.
> >
> >
> > Signed-off-by: Alvaro Karsz <alvaro.karsz@solid-run.com>
> > ---
> >  content.tex | 41 +++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 41 insertions(+)
>
> Please add a sentence about how this interacts with Used Buffer
> Notification Suppression. My guess is that suppression takes effect in
> addition to virtio-net-specific coalescing, so it's possible that the
> notification will be suppressed even after the timer expires or frame
> count is exceeded?

My understanding is that, as you suggest, it's actually a coalsing of
notification. So this should work after

1) Notification Suppression: if driver doesn't want notification, the
device does not care about coalescing
2) Event idx: the notification sent for event must still be coalesced

Anyhow, I agree we need to clarify these.

Thanks

>
> Also, since the VIRTIO specification usually talks about Notifications
> instead of "interrupts" (see 2.3 Notifications) I think it makes sense
> to use that terminology instead of "interrupts". Interrupts are more of
> transport-level (e.g. PCI, MMIO) concept than a VIRTIO device model
> concept.


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

