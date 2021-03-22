Return-Path: virtio-comment-return-1771-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5F923985E63
	for <virtio-comment@lists.oasis-open.org>; Mon, 22 Mar 2021 13:35:09 +0000 (UTC)
Date: Mon, 22 Mar 2021 09:34:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20210322092547-mutt-send-email-mst@kernel.org>
References: <20210322063804.641923-1-arseny.krasnov@kaspersky.com>
 <YFiE9opnZ976hwbP@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YFiE9opnZ976hwbP@stefanha-x1.localdomain>
Subject: [virtio-comment] Re: [RFC PATCH v1] virtio-vsock: use C style defines for constants
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Arseny Krasnov <arseny.krasnov@kaspersky.com>, cohuck@redhat.com, virtio-comment@lists.oasis-open.org, Stefano Garzarella <sgarzare@redhat.com>, Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Jorgen Hansen <jhansen@vmware.com>, Norbert Slusarek <nslusarek@gmx.net>, Andra Paraschiv <andraprs@amazon.com>, Colin Ian King <colin.king@canonical.com>, virtualization@lists.linux-foundation.org, oxffffaa@gmail.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Mar 22, 2021 at 11:52:22AM +0000, Stefan Hajnoczi wrote:
> On Mon, Mar 22, 2021 at 09:37:59AM +0300, Arseny Krasnov wrote:
> > This:
> > 1) Replaces enums with C style defines.
> 
> Why?

I am guessing this is referencing
[PATCH] introduction: document #define syntax


> > 2) Adds defines for some constants.
> 
> Definitions need to be referenced somewhere to explain their use. It's
> not enough to add a constant, some text in the spec should mention that
> constant. (The exception to this might be a group of constants where
> individual constants don't need to be mentioned explicitly.)
> 
> > Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
> > ---
> >  virtio-vsock.tex | 42 ++++++++++++++++++++++--------------------
> >  1 file changed, 22 insertions(+), 20 deletions(-)
> > 
> > diff --git a/virtio-vsock.tex b/virtio-vsock.tex
> > index da7e641..62ab6b3 100644
> > --- a/virtio-vsock.tex
> > +++ b/virtio-vsock.tex
> > @@ -86,23 +86,18 @@ \subsection{Device Operation}\label{sec:Device Types / Socket Device / Device Op
> >  operation constants:
> >  
> >  \begin{lstlisting}
> > -enum {
> > -	VIRTIO_VSOCK_OP_INVALID = 0,
> > -
> > -	/* Connect operations */
> > -	VIRTIO_VSOCK_OP_REQUEST = 1,
> > -	VIRTIO_VSOCK_OP_RESPONSE = 2,
> > -	VIRTIO_VSOCK_OP_RST = 3,
> > -	VIRTIO_VSOCK_OP_SHUTDOWN = 4,
> > -
> > -	/* To send payload */
> > -	VIRTIO_VSOCK_OP_RW = 5,
> > -
> > -	/* Tell the peer our credit info */
> > -	VIRTIO_VSOCK_OP_CREDIT_UPDATE = 6,
> > -	/* Request the peer to send the credit info to us */
> > -	VIRTIO_VSOCK_OP_CREDIT_REQUEST = 7,
> > -};
> > +#define VIRTIO_VSOCK_OP_INVALID        0
> > +/* Connect operations */
> > +#define VIRTIO_VSOCK_OP_REQUEST        1
> > +#define VIRTIO_VSOCK_OP_RESPONSE       2
> > +#define VIRTIO_VSOCK_OP_RST            3
> > +#define VIRTIO_VSOCK_OP_SHUTDOWN       4
> > +/* To send payload */
> > +#define VIRTIO_VSOCK_OP_RW             5
> > +/* Tell the peer our credit info */
> > +#define VIRTIO_VSOCK_OP_CREDIT_UPDATE  6
> > +/* Request the peer to send the credit info to us */
> > +#define VIRTIO_VSOCK_OP_CREDIT_REQUEST 7
> >  \end{lstlisting}
> >  
> >  \subsubsection{Virtqueue Flow Control}\label{sec:Device Types / Socket Device / Device Operation / Virtqueue Flow Control}
> > @@ -143,6 +138,10 @@ \subsubsection{Addressing}\label{sec:Device Types / Socket Device / Device Opera
> >  Currently only stream sockets are supported. \field{type} is 1 for stream

So e.g.

Currently only stream sockets are supported. \field{type} is 1 (VIRTIO_VSOCK_TYPE_STREAM) for stream


> >  socket types.
> >  
> > +\begin{lstlisting}
> > +#define VIRTIO_VSOCK_TYPE_STREAM 1
> > +\end{lstlisting}
> > +
> >  Stream sockets provide in-order, guaranteed, connection-oriented delivery
> >  without message boundaries.
> >  
> > @@ -227,6 +226,11 @@ \subsubsection{Stream Sockets}\label{sec:Device Types / Socket Device / Device O
> >  hints are permanent once sent and successive packets with bits clear do not
> >  reset them.
> >  
> > +\begin{lstlisting}
> > +#define VIRTIO_VSOCK_SHUTDOWN_RECEIVE_BIT 0
> > +#define VIRTIO_VSOCK_SHUTDOWN_SEND_BIT    1
> > +\end{lstlisting}
> 
> The spec has no other _BIT constants.

True. Sometimes there's an _F_ somewhere there instead.

Also, it is possible to put the defines near the flags
field. Compare, for example:

\begin{lstlisting}
struct virtq_desc {
        /* Address (guest-physical). */
        le64 addr;
        /* Length. */
        le32 len;

/* This marks a buffer as continuing via the next field. */
#define VIRTQ_DESC_F_NEXT   1
/* This marks a buffer as device write-only (otherwise device read-only). */
#define VIRTQ_DESC_F_WRITE     2
/* This means the buffer contains a list of buffer descriptors. */
#define VIRTQ_DESC_F_INDIRECT   4
        /* The flags as indicated above. */
        le16 flags;
        /* Next field if flags & NEXT */
        le16 next;
};
\end{lstlisting}


> It uses bitmasks instead.

Not universally.

> I
> suggest following that for consistency:
> 
>   #define VIRTIO_VSOCK_SHUTDOWN_RECEIVE (1 << 0)
>   #define VIRTIO_VSOCK_SHUTDOWN_SEND    (1 << 1)



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

