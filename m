Return-Path: <mst@redhat.com>
Date: Fri, 14 Jan 2022 12:58:45 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v12 0/3] virtio-vsock: SOCK_SEQPACKET description
Message-ID: <20220114112936-mutt-send-email-mst@kernel.org>
References: <20220113165202.250429-1-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220113165202.250429-1-sgarzare@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, jasowang@redhat.com, cohuck@redhat.com, stefanha@redhat.com, arseny.krasnov@kaspersky.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Jan 13, 2022 at 05:51:59PM +0100, Stefano Garzarella wrote:
> v12:
> - added statement about supporting F_STREAM when F_SEQPACKET is negotiated
>   [cohuck, mst]
> 
> v11: https://lists.oasis-open.org/archives/virtio-comment/202201/msg00027.html
> - reworked "Message and record boundaries" paragraph [stefanha]
> 
> Linux kernel and QEMU already merged SOCK_SEQPACKET support,
> so I'm resending Arseny's patches to have consistent virtio-spec
> and implementation.
> 
> I added patch 2, following the discussion about F_STREAM feature bit:
> https://markmail.org/message/aoaspjy2jhidwbuo#query:+page:1+mid:obw54zzikgqimhjk+state:results
> 
> Thanks,
> Stefano

Was going to vote on this and was reviewing for the last time, when I
detected a problem with SEQPACKET.

Specifically, with STREAM for flow control management purposes we only
count payload bytes since it is always possible to copy all data into a
single buffer.

Not so with SEQPACKET where in the worst case it is possible to have
single byte messages, each consuming multiple bytes of meta-data to
track message boundaries.  This does work with the current proposal
simply by publishing a smaller buffer to the other side, e.g. with a 64
byte header we'd publish a 1K buffer and in practice it will occupy up
to 65K. Tolerable, and there's nothing new here. OK.


However, just today I noticed this in the unix man page for SEQPACKET:

 SOCK_SEQPACKET
              Provides a sequenced, reliable, two-way connection-based
              data transmission path for datagrams of fixed maximum
              length; 


The point here being that it needs to be limited so userspace knows how
large is a message it can send - since dropping messages is not allowed
this has to happen upfront.
And I noticed that our text does not mention the maximum length.
So I asked myself what is the maximum length for vsock.

After some poking around I realized that the largest message we can
accept has to be capped to buf_alloc. However this makes the buffer size
visible to userspace and so conflicts with the idea of limiting
it for memory management purposes as described above.

So it looks like we need to add a seqpacket message header overhead
field in the config space, and if present take that into account.

I am not sure what to do about it at this point.
Together with guests assuming this implies stream this looks a bit much.

Sorry that I just noticed this part now, I guess better late than never.
Given it's deployed anyway, I guess we can put it in the spec as is,
however in that case I guess we should just document what's there,
maybe add some text explaining that it will be superceded
in a future version. But that *also* will mean we should
make it imply STREAM support since that is what happens in
the field. Maybe rename this to VIRTIO_VSOCK_F_SEQPACKET_COMPAT
or something like this.

Thoughts?


> Arseny Krasnov (2):
>   virtio-vsock: use C style defines for constants
>   virtio-vsock: SOCK_SEQPACKET description
> 
> Stefano Garzarella (1):
>   virtio-vsock: add VIRTIO_VSOCK_F_STREAM feature bit
> 
>  virtio-vsock.tex | 88 +++++++++++++++++++++++++++++++++---------------
>  1 file changed, 60 insertions(+), 28 deletions(-)
> 
> -- 
> 2.31.1

