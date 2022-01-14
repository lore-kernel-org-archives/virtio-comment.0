Return-Path: <sgarzare@redhat.com>
Date: Fri, 14 Jan 2022 10:39:52 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v12 0/3] virtio-vsock: SOCK_SEQPACKET description
Message-ID: <20220114093952.gjn3mm6mg6wlyibv@steredhat>
References: <20220113165202.250429-1-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220113165202.250429-1-sgarzare@redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
To: cohuck@redhat.com, mst@redhat.com
Cc: virtio-comment@lists.oasis-open.org, jasowang@redhat.com, stefanha@redhat.com, arseny.krasnov@kaspersky.com
List-ID: <virtio-comment.lists.oasis-open.org>

Cornelia, Michael,
if you are happy with this version, can we start the vote to have these 
changes in virtio-spec 1.2?

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/132

Thanks,
Stefano

On Thu, Jan 13, 2022 at 05:51:59PM +0100, Stefano Garzarella wrote:
>v12:
>- added statement about supporting F_STREAM when F_SEQPACKET is negotiated
>  [cohuck, mst]
>
>v11: https://lists.oasis-open.org/archives/virtio-comment/202201/msg00027.html
>- reworked "Message and record boundaries" paragraph [stefanha]
>
>Linux kernel and QEMU already merged SOCK_SEQPACKET support,
>so I'm resending Arseny's patches to have consistent virtio-spec
>and implementation.
>
>I added patch 2, following the discussion about F_STREAM feature bit:
>https://markmail.org/message/aoaspjy2jhidwbuo#query:+page:1+mid:obw54zzikgqimhjk+state:results
>
>Thanks,
>Stefano
>
>Arseny Krasnov (2):
>  virtio-vsock: use C style defines for constants
>  virtio-vsock: SOCK_SEQPACKET description
>
>Stefano Garzarella (1):
>  virtio-vsock: add VIRTIO_VSOCK_F_STREAM feature bit
>
> virtio-vsock.tex | 88 +++++++++++++++++++++++++++++++++---------------
> 1 file changed, 60 insertions(+), 28 deletions(-)
>
>-- 
>2.31.1
>

