Return-Path: <virtio-comment-return-2509-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 999FE9864E5
	for <virtio-comment@lists.oasis-open.org>; Thu, 13 Jan 2022 10:50:46 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <20220112170936.245410-1-sgarzare@redhat.com>
References: <20220112170936.245410-1-sgarzare@redhat.com>
Date: Thu, 13 Jan 2022 11:50:09 +0100
Message-ID: <87fsprx63i.fsf@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] Re: [PATCH v11 0/3] virtio-vsock: SOCK_SEQPACKET description
Content-Type: text/plain
To: Stefano Garzarella <sgarzare@redhat.com>, virtio-comment@lists.oasis-open.org
Cc: mst@redhat.com, arseny.krasnov@kaspersky.com, stefanha@redhat.com, sgarzare@redhat.com, jasowang@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, Jan 12 2022, Stefano Garzarella <sgarzare@redhat.com> wrote:

> v11:
> - reworked "Message and record boundaries" paragraph [stefanha]
>
> v10: https://markmail.org/message/aebu4zqp4kxdm4ej
>
> Linux kernel and QEMU already merged SOCK_SEQPACKET support,
> so I'm resending Arseny's patches to have consistent virtio-spec
> and implementation.

It really should not have been merged without a spec :( But now that it
has happened already, we need to get a proper spec added sooner rather
than later, and it would be nice if it could make virtio 1.2, which
would mean that voting needs to start this week.

(I don't see an issue at https://github.com/oasis-tcs/virtio-spec/issues
yet; creating one would be an obvious pre-req.)

>
> I added patch 2, following the discussion about F_STREAM feature bit:
> https://markmail.org/message/aoaspjy2jhidwbuo#query:+page:1+mid:obw54zzikgqimhjk+state:results
>
> About patch 2, the vhost-vsock device in the Linux kernel doesn't set bit 0
> (F_STREAM), so at this point I don't know if it's better to use a negative
> feature flag (e.g. F_NO_STREAM) or we go for F_STREAM and send a patch to
> linux-stable (and QEMU?) to solve this issue.

I fear that even with a patch for stable, there can still be old setups
around for which "only F_SEQPACKET set" translates to "supports both
stream and seqpacket"... so I guess it mostly becomes a question of
whether ignoring those broken setups is tolerable. (The old setups not
setting any feature bits are fine with the proposed patch.) Using a
negative feature bit is uglier, but also clearer. I suppose we want to
be able to make stream sockets optional? If so, I think the negative
approach is the better option, unless we can live with some broken
setups.


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

