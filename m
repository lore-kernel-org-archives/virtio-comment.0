Return-Path: <sgarzare@redhat.com>
Date: Mon, 17 Jan 2022 10:33:18 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v12 0/3] virtio-vsock: SOCK_SEQPACKET description
Message-ID: <CAGxU2F5der2-HiuwyZDJWgOjdBzOkBnveH6FT=zS-5K957OrqA@mail.gmail.com>
References: <20220113165202.250429-1-sgarzare@redhat.com>
 <20220114112936-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20220114112936-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: "Michael S. Tsirkin" <mst@redhat.com>, Arseny Krasnov <arseny.krasnov@kaspersky.com>
Cc: virtio-comment@lists.oasis-open.org, Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>



On Fri, Jan 14, 2022 at 6:58 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Jan 13, 2022 at 05:51:59PM +0100, Stefano Garzarella wrote:
> > v12:
> > - added statement about supporting F_STREAM when F_SEQPACKET is negotiated
> >   [cohuck, mst]
> >
> > v11: https://lists.oasis-open.org/archives/virtio-comment/202201/msg00027.html
> > - reworked "Message and record boundaries" paragraph [stefanha]
> >
> > Linux kernel and QEMU already merged SOCK_SEQPACKET support,
> > so I'm resending Arseny's patches to have consistent virtio-spec
> > and implementation.
> >
> > I added patch 2, following the discussion about F_STREAM feature bit:
> > https://markmail.org/message/aoaspjy2jhidwbuo#query:+page:1+mid:obw54zzikgqimhjk+state:results
> >
> > Thanks,
> > Stefano
>
> Was going to vote on this and was reviewing for the last time, when I
> detected a problem with SEQPACKET.
>
> Specifically, with STREAM for flow control management purposes we only
> count payload bytes since it is always possible to copy all data into a
> single buffer.
>
> Not so with SEQPACKET where in the worst case it is possible to have
> single byte messages, each consuming multiple bytes of meta-data to
> track message boundaries.  This does work with the current proposal
> simply by publishing a smaller buffer to the other side, e.g. with a 64
> byte header we'd publish a 1K buffer and in practice it will occupy up
> to 65K. Tolerable, and there's nothing new here. OK.
>
>
> However, just today I noticed this in the unix man page for SEQPACKET:
>
>  SOCK_SEQPACKET
>               Provides a sequenced, reliable, two-way connection-based
>               data transmission path for datagrams of fixed maximum
>               length;
>
>
> The point here being that it needs to be limited so userspace knows how
> large is a message it can send - since dropping messages is not allowed
> this has to happen upfront.
> And I noticed that our text does not mention the maximum length.
> So I asked myself what is the maximum length for vsock.

@Arseny feel free to correct me, but IIRC we had a discussion about it.  
I can't find the thread, but I remember Arseny found something different 
in the POSIX spec.

https://pubs.opengroup.org/onlinepubs/9699919799/functions/socket.html

SOCK_SEQPACKET
    Provides sequenced, reliable, bidirectional, connection-mode 
    transmission paths for records. A record can be sent using one or 
    more output operations and received using one or more input 
    operations, but a single operation never transfers part of more than 
    one record. Record boundaries are visible to the receiver via the 
    MSG_EOR flag.

https://pubs.opengroup.org/onlinepubs/9699919799/functions/recvmsg.html

    The recvmsg() function shall return the total length of the message.  
    For message-based sockets, such as SOCK_DGRAM and SOCK_SEQPACKET, 
    the entire message shall be read in a single operation. If a message 
    is too long to fit in the supplied buffers, and MSG_PEEK is not set 
    in the flags argument, the excess bytes shall be discarded, and 
    MSG_TRUNC shall be set in the msg_flags member of the msghdr 
    structure. For stream-based sockets, such as SOCK_STREAM, message 
    boundaries shall be ignored. In this case, data shall be returned to 
    the user as soon as it becomes available, and no data shall be 
    discarded.

From this description it seems that SEQPACKET has no fixed size and 
receiver if it is not sure that its buffer is big enough, it can use 
MSG_PEEK. However MSG_TRUNC would allow to take only a part of it.

>
> After some poking around I realized that the largest message we can
> accept has to be capped to buf_alloc. However this makes the buffer size
> visible to userspace and so conflicts with the idea of limiting
> it for memory management purposes as described above.

Yep, I think this is the real limit and IIRC the current implementation 
checks how much space is available in the other peer before queuing the 
packet, if there is no space it returns an error to the user.

The user can control it (also for STREAM) through the 
SO_VM_SOCKETS_BUFFER_SIZE sockopt.
(there is a maximum allowed, but it seems to high... I'll check it)

>
> So it looks like we need to add a seqpacket message header overhead
> field in the config space, and if present take that into account.

Yes, and we should do that with stream as well when we don't merge 
packets into a single buffer, there's a bug reported about that that we 
need to fix sooner or later:
    https://bugzilla.kernel.org/show_bug.cgi?id=215329

>
> I am not sure what to do about it at this point.
> Together with guests assuming this implies stream this looks a bit much.
>
> Sorry that I just noticed this part now, I guess better late than never.

Sure :-)

> Given it's deployed anyway, I guess we can put it in the spec as is,
> however in that case I guess we should just document what's there,
> maybe add some text explaining that it will be superceded
> in a future version. But that *also* will mean we should
> make it imply STREAM support since that is what happens in
> the field. Maybe rename this to VIRTIO_VSOCK_F_SEQPACKET_COMPAT
> or something like this.
>
> Thoughts?

Aside from the issue of accounting for the header in memory consumption, 
I think the rest is fine, so maybe we can leave it that way and in the 
future add header overhead field in the config space like you said.

Stefano

