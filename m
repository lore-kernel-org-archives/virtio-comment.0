Return-Path: <virtio-comment-return-2496-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 51C3F98645C
	for <virtio-comment@lists.oasis-open.org>; Thu,  6 Jan 2022 11:08:31 +0000 (UTC)
References: <20220105163505.192146-1-sgarzare@redhat.com>
From: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Message-ID: <f1948cda-9f58-06cc-e817-dc0afe896481@kaspersky.com>
Date: Thu, 6 Jan 2022 14:08:21 +0300
MIME-Version: 1.0
In-Reply-To: <20220105163505.192146-1-sgarzare@redhat.com>
Subject: [virtio-comment] Re: [!!Mass Mail KSE][MASSMAIL KLMS] [virtio-comment] [PATCH v10 0/3]
 virtio-vsock: SOCK_SEQPACKET description
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Stefano Garzarella <sgarzare@redhat.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Cc: "jasowang@redhat.com" <jasowang@redhat.com>, "mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>, "stefanha@redhat.com" <stefanha@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Thank You for this resend!

On 05.01.2022 19:35, Stefano Garzarella wrote:
> v9: https://markmail.org/message/4s6kfbeblxw4vzk4
>
> Linux kernel and QEMU already merged SOCK_SEQPACKET support,
> so I'm resending Arseny's patches to have consistent virtio-spec
> and implementation.
>
> I added patch 2, following the discussion about F_STREAM feature bit:
> https://markmail.org/message/aoaspjy2jhidwbuo#query:+page:1+mid:obw54zzikgqimhjk+state:results
>
> About patch 2, the vhost-vsock device in the Linux kernel doesn't set bit 0
> (F_STREAM), so at this point I don't know if it's better to use a negative
> feature flag (e.g. F_NO_STREAM) or we go for F_STREAM and send a patch to
> linux-stable (and QEMU?) to solve this issue.
>
> Thanks,
> Stefano
>
> Arseny Krasnov (2):
>   virtio-vsock: use C style defines for constants
>   virtio-vsock: SOCK_SEQPACKET description
>
> Stefano Garzarella (1):
>   virtio-vsock: add VIRTIO_VSOCK_F_STREAM feature bit
>
>  virtio-vsock.tex | 93 +++++++++++++++++++++++++++++++++---------------
>  1 file changed, 65 insertions(+), 28 deletions(-)
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

