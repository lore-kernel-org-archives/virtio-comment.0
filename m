Return-Path: <beshleman.devbox@gmail.com>
Date: Sat, 5 Mar 2022 01:25:57 +0000
From: Bobby Eshleman <beshleman.devbox@gmail.com>
Subject: Re: [virtio-comment] [PATCH v5 1/2] virtio-vsock: add description
 for datagram type
Message-ID: <20220305012042.f7hyhjjdy563mcn2@ip-10-100-118-60.ec2.internal>
References: <20210528040118.3253836-1-jiang.wang@bytedance.com>
 <20220224221547.2436395-1-beshleman.devbox@gmail.com>
 <20220224221547.2436395-2-beshleman.devbox@gmail.com>
 <20220302160958.62s34i2n2tccsscz@sgarzare-redhat>
 <20220303032801.yvlfu5vqqibu7eyo@ip-10-100-118-60.ec2.internal>
 <20220303102339.gd4yverxjb5mt3fb@sgarzare-redhat>
MIME-Version: 1.0
In-Reply-To: <20220303102339.gd4yverxjb5mt3fb@sgarzare-redhat>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: mst@redhat.com, cohuck@redhat.com, virtio-comment@lists.oasis-open.org, cong.wang@bytedance.com, duanxiongchun@bytedance.com, jiang.wang@bytedance.com, virtualization@lists.linux-foundation.org, xieyongji@bytedance.com, chaiwen.cc@bytedance.com, stefanha@redhat.com, asias@redhat.com, arseny.krasnov@kaspersky.com, jhansen@vmware.com, bobby.eshleman@bytedance.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Mar 03, 2022 at 11:23:39AM +0100, Stefano Garzarella wrote:
> On Thu, Mar 03, 2022 at 03:29:31AM +0000, Bobby Eshleman wrote:
> > 
> > > > \drivernormative{\paragraph}{Device Operation: Receive and Transmit}{Device Types / Socket Device / Device Operation / Receive and Transmit}
> > > >
> > > > The \field{guest_cid} configuration field MUST be used as the source CID when
> > > > @@ -274,6 +309,14 @@ \subsubsection{Seqpacket Sockets}\label{sec:Device Types / Socket Device / Devic
> > > > #define VIRTIO_VSOCK_SEQ_EOR (1 << 1)
> > > > \end{lstlisting}
> > > >
> > > > +\subsubsection{Datagram Sockets}\label{sec:Device Types / Socket Device / Device Operation / Datagram Sockets}
> > > > +
> > > > +Datagram (dgram) sockets are connectionless and unreliable. The sender just sends
> > > > +a message to the peer and hopes it will be delivered. A VIRTIO_VSOCK_OP_RST reply is sent if
> > > > +a receiving socket does not exist on the destination.
> > > > +If the transmission or receiving buffers are full, the packets
> > > > +are dropped.
> > > > +
> > > 
> > > I'm not sure we should respond with RST if there's no socket bind on
> > > the port.
> > > 
> > > What happens with UDP if we do a sendto to a closed port?
> > > 
> > > Thanks,
> > > Stefano
> > > 
> > 
> > With UDP this results in an ICMP Destination Unreachable message, which
> > is explicitly not UDP but is experienced by the application nonetheless.
> > There was some discussion from v1, and the design choice essentially
> > came down to "how much do we want to be emulating of ICMP inside
> > vsock?"
> 
> Okay, I see, but how this is propagate to the userspace?
> 
> IIUC for UDP the user should open a RAW socket with IPPROTO_ICMP and wait
> for an error message.
> 

I'll write a sample test for this and get back to you, just to be certain.

... snip ...

> Have you taken a look at a possible implementation with AF_VSOCK yet?
> 
> In any case if it can be useful we could include it in the spec and then
> implement it later in Linux.

I have not yet, and from my reading of the code it was not in Jiang's Linux
series yet.

Although I understand the logic behind it, I can't say I'm totally confident in
this yet. It is carry over from v4 and has roots in a discussion between
stefanha and cong.wong in the RFC thread "[RFC PATCH] virtio-vsock: add
description for datagram type" (sorry I don't have the Message-Id, it was just
forwarded to me, and it is missing from lore.kernel.org for some reason).

I'll look into it more deeply in terms of a potential AF_VSOCK implementation
and build a stronger case for/against in the next rev.

Thanks,
Bobby

