Return-Path: <jiang.wang@bytedance.com>
MIME-Version: 1.0
References: <20210610181203.979686-1-jiang.wang@bytedance.com> <YTDam7jdjRz686bp@stefanha-x1.localdomain>
In-Reply-To: <YTDam7jdjRz686bp@stefanha-x1.localdomain>
From: "Jiang Wang ." <jiang.wang@bytedance.com>
Date: Thu, 2 Sep 2021 17:08:01 -0700
Message-ID: <CAP_N_Z_hHFbmd4tVMNYMrGiUt43Rs0N9rwM6F3Q_Wu1MTyfeKA@mail.gmail.com>
Subject: Re: [virtio-comment] Re: [PATCH v5] virtio-vsock: add description for
 datagram type
Content-Type: text/plain; charset="UTF-8"
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, cohuck@redhat.com, virtio-comment@lists.oasis-open.org, virtualization@lists.linux-foundation.org, asias@redhat.com, Stefano Garzarella <sgarzare@redhat.com>, Arseny Krasnov <arseny.krasnov@kaspersky.com>, Cong Wang <cong.wang@bytedance.com>, Xiongchun Duan <duanxiongchun@bytedance.com>, Yongji Xie <xieyongji@bytedance.com>, =?UTF-8?B?5p+056iz?= <chaiwen.cc@bytedance.com>, Jorgen Hansen <jhansen@vmware.com>, Jason Wang <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Sep 2, 2021 at 7:07 AM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Thu, Jun 10, 2021 at 06:12:03PM +0000, Jiang Wang wrote:
> > Add supports for datagram type for virtio-vsock. Datagram
> > sockets are connectionless and unreliable. To avoid contention
> > with stream and other sockets, add two more virtqueues and
> > a new feature bit to identify if those two new queues exist or not.
> >
> > Also add descriptions for resource management of datagram, which
> > does not use the existing credit update mechanism associated with
> > stream sockets.
> >
> > Signed-off-by: Jiang Wang <jiang.wang@bytedance.com>
> > ---
>
> Overall this looks good. The tricky thing will be implementing dgram
> sockets in a way that minimizes dropped packets and provides some degree
> of fairness between senders. Those are implementation issues though and
> not visible at the device specification level.
>
> > diff --git a/virtio-vsock.tex b/virtio-vsock.tex
> > index da7e641..26a62ac 100644
> > --- a/virtio-vsock.tex
> > +++ b/virtio-vsock.tex
> > @@ -9,14 +9,37 @@ \subsection{Device ID}\label{sec:Device Types / Socket Device / Device ID}
> >
> >  \subsection{Virtqueues}\label{sec:Device Types / Socket Device / Virtqueues}
> >  \begin{description}
> > -\item[0] rx
> > -\item[1] tx
> > +\item[0] stream rx
> > +\item[1] stream tx
> > +\item[2] datagram rx
> > +\item[3] datagram tx
> > +\item[4] event
> > +\end{description}
> > +The virtio socket device uses 5 queues if feature bit VIRTIO_VSOCK_F_DRGAM is set. Otherwise, it
> > +only uses 3 queues, as the following.
>
> s/as the following/as follows:/
>
Will do.

> > +
> > +\begin{description}
> > +\item[0] stream rx
> > +\item[1] stream tx
> >  \item[2] event
> >  \end{description}
> >
> > +When behavior differs between stream and datagram rx/tx virtqueues
> > +their full names are used. Common behavior is simply described in
> > +terms of rx/tx virtqueues and applies to both stream and datagram
> > +virtqueues.
> > +
> >  \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
> >
> > -There are currently no feature bits defined for this device.
> > +\begin{description}
> > +\item[VIRTIO_VSOCK_F_STREAM (0)] Device has support for stream socket type.
> > +\end{description}
> > +
> > +\begin{description}
> > +\item[VIRTIO_VSOCK_F_DGRAM (2)] Device has support for datagram socket type.
>
> Is this really bit 2 or did you mean bit 1 (value 0x2)?
>
I left bit 1 for SEQPACKET feature bit.  That will probably merge
before this patch.

> What happens to the virtqueue layout when VIRTIO_VSOCK_F_DGRAM is
> present and VIRTIO_VSOCK_F_STREAM is absent? The virtqueue section above
> implies that VIRTIO_VSOCK_F_STREAM is always present.
>
yeah, good question. I  think then it means the first two queues will be used
for dgram?

> > +\end{description}
> > +
> > +If no feature bits are defined, assume device only supports stream socket type.
>
> It's cleaner to define VIRTIO_VSOCK_F_NO_STREAM (0) instead. When the
> bit is set the stream socket type is not available and the stream_rx/tx
> virtqueues are absent.
>
> This way it's not necessary to define special behavior depending on
> certain combinations of feature bits.
>
Agree. I went back and read old emails again and found I missed the
negative bit part. So repeating the previous question, if
VIRTIO_VSOCK_F_NO_STREAM  and VIRTIO_VSOCK_F_DGRAM
present, then we will only have 3 queues and the first two are for dgram, right?

Also, I am wondering what if an implementation only sets
VIRTIO_VSOCK_F_NO_STREAM bit, but somehow forgot (or for whatever
reason) to set VIRTIO_VSOCK_F_DGRAM bit? Does that mean there will
be no virtqueues? The implementation is a mistake? Because it will not
do anything.
Do we need to explicitly add a sentence in the spec to say something like
"Don't set VIRTIO_VSOCK_F_NO_STREAM alone" etc?


> >  \subsubsection{Receive and Transmit}\label{sec:Device Types / Socket Device / Device Operation / Receive and Transmit}
> > -The driver queues outgoing packets on the tx virtqueue and incoming packet
> > +The driver queues outgoing packets on the tx virtqueue and allocates incoming packet
> >  receive buffers on the rx virtqueue. Packets are of the following form:
>
> This change seems unrelated to dgram sockets. I don't think adding the
> word "allocates" makes things clearer or more precise. The driver may
> reuse receive buffers rather than allocating fresh buffers. I suggest
> dropping this change.
>
Got it. Will do.

> >
> >  \begin{lstlisting}
> > @@ -195,6 +235,7 @@ \subsubsection{Receive and Transmit}\label{sec:Device Types / Socket Device / De
> >  };
> >  \end{lstlisting}
> >
> > +
> >  Virtqueue buffers for outgoing packets are read-only. Virtqueue buffers for
> >  incoming packets are write-only.
> >
>
> Unnecessary whitespace change. Please drop.

Sure.

