Return-Path: <virtio-comment-return-2767-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B42839863B6
	for <virtio-comment@lists.oasis-open.org>; Tue, 22 Feb 2022 10:24:30 +0000 (UTC)
MIME-Version: 1.0
References: <20191125183430.1686620-1-yuri.benditovich@daynix.com> <20220220081428-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220220081428-mutt-send-email-mst@kernel.org>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Tue, 22 Feb 2022 12:24:17 +0200
Message-ID: <CAOEp5OfaNSCxkKH_BLSaFbMAsQ7pk+rLbeDoyKeA=8dkKZwUcA@mail.gmail.com>
Subject: [virtio-comment] Re: [PATCH] virtio-net: (spelling only) support for receive-side scaling
Content-Type: text/plain; charset="UTF-8"
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Sun, Feb 20, 2022 at 3:23 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Mon, Nov 25, 2019 at 08:34:30PM +0200, Yuri Benditovich wrote:
> > Additional patch for previous 'v4 virtio-net: define support for
> > receive-side scaling' - contains only spelling fixes.
> >
> > Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
>
> I just noticed that description of Device Initialization has not been
> updated with this patch.
>
> For example:
>
> \item Identify and initialize the receive and
>   transmission virtqueues, up to N of each kind. If
>   VIRTIO_NET_F_MQ feature bit is negotiated,
>   N=\field{max_virtqueue_pairs}, otherwise identify N=1.
>
> \item If the VIRTIO_NET_F_CTRL_VQ feature bit is negotiated,
>   identify the control virtqueue.
>
> \item Fill the receive queues with buffers: see \ref{sec:Device Types / Network Device / Device Operation / Setting Up Receive Buffers}.
>
> \item Even with VIRTIO_NET_F_MQ, only receiveq1, transmitq1 and
>   controlq are used by default.  The driver would send the
>   VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET command specifying the
>   number of the transmit and receive queues to use.
>
>
> there are some more instances of this.
>
> I created https://github.com/oasis-tcs/virtio-spec/issues/135
> to track this.
> Also, https://github.com/oasis-tcs/virtio-spec/issues/134 since
> VIRTIO_NET_F_MQ name is now confusing.
>
>
> Yuri, could you try to address these?

Yes, I will do that

>
> Thanks!
>
> --
> MST
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

