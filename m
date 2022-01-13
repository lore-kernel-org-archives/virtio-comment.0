Return-Path: <sgarzare@redhat.com>
Date: Thu, 13 Jan 2022 14:52:28 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v11 0/3] virtio-vsock: SOCK_SEQPACKET description
Message-ID: <20220113135228.w2pmabjmxlt3sq34@steredhat>
References: <20220112170936.245410-1-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220112170936.245410-1-sgarzare@redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
To: virtio-comment@lists.oasis-open.org
Cc: mst@redhat.com, arseny.krasnov@kaspersky.com, stefanha@redhat.com, cohuck@redhat.com, jasowang@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, Jan 12, 2022 at 06:09:33PM +0100, Stefano Garzarella wrote:
>v11:
>- reworked "Message and record boundaries" paragraph [stefanha]
>
>v10: https://markmail.org/message/aebu4zqp4kxdm4ej
>
>Linux kernel and QEMU already merged SOCK_SEQPACKET support,
>so I'm resending Arseny's patches to have consistent virtio-spec
>and implementation.
>
>I added patch 2, following the discussion about F_STREAM feature bit:
>https://markmail.org/message/aoaspjy2jhidwbuo#query:+page:1+mid:obw54zzikgqimhjk+state:results
>
>About patch 2, the vhost-vsock device in the Linux kernel doesn't set bit 0
>(F_STREAM), so at this point I don't know if it's better to use a negative
>feature flag (e.g. F_NO_STREAM) or we go for F_STREAM and send a patch to
>linux-stable (and QEMU?) to solve this issue.
>
>Thanks,
>Stefano

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/132

>
>Arseny Krasnov (2):
>  virtio-vsock: use C style defines for constants
>  virtio-vsock: SOCK_SEQPACKET description
>
>Stefano Garzarella (1):
>  virtio-vsock: add VIRTIO_VSOCK_F_STREAM feature bit
>
> virtio-vsock.tex | 86 ++++++++++++++++++++++++++++++++----------------
> 1 file changed, 58 insertions(+), 28 deletions(-)
>
>-- 
>2.31.1
>

