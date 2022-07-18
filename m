Return-Path: <virtio-comment-return-3237-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DE29598646C
	for <virtio-comment@lists.oasis-open.org>; Mon, 18 Jul 2022 17:14:57 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <20220718142653.42310-1-sgarzare@redhat.com>
References: <20220718142653.42310-1-sgarzare@redhat.com>
Date: Mon, 18 Jul 2022 19:14:50 +0200
Message-ID: <87fsiypcl1.fsf@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] Re: [PATCH v2] virtio-vsock: add VIRTIO_VSOCK_F_NO_IMPLIED_STREAM
 feature bit
Content-Type: text/plain
To: Stefano Garzarella <sgarzare@redhat.com>, virtio-comment@lists.oasis-open.org
Cc: jiang.wang@bytedance.com, Stefan Hajnoczi <stefanha@redhat.com>, Arseniy Krasnov <AVKrasnov@sberdevices.ru>, "Michael S . Tsirkin" <mst@redhat.com>, bobby.eshleman@bytedance.com, Stefano Garzarella <sgarzare@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Jul 18 2022, Stefano Garzarella <sgarzare@redhat.com> wrote:

> Initially virtio-vsock only supported the stream type, which is why
> there was no feature. Later we added the seqpacket type and in the future
> we may have other types (e.g. datagram).
>
> seqpacket is an extension of stream, so it might be implied that if
> seqpacket is supported, stream is too, but this might not be true for
> other types.
>
> As we discussed here [1] should be better to add a new
> VIRTIO_VSOCK_F_NO_IMPLIED_STREAM feature bit to avoid this implication.
>
> Let's also add normative sections to better define the behavior when
> VIRTIO_VSOCK_F_NO_IMPLIED_STREAM is negotiated or not.
>
> [1] http://markmail.org/message/2s3qd74drgjxkvte
>
> Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
> v2:
> - rewrote better normative statements [Cornelia]
> - updated conformance.tex with the new sections [Cornelia]
>
> v1: https://markmail.org/message/ybtl4trifrhjnkfe
> ---
>  conformance.tex  |  2 ++
>  virtio-vsock.tex | 28 ++++++++++++++++++++++++----
>  2 files changed, 26 insertions(+), 4 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


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

