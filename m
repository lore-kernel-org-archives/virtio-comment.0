Return-Path: virtio-comment-return-1751-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4782B9864A9
	for <virtio-comment@lists.oasis-open.org>; Tue, 16 Mar 2021 13:39:02 +0000 (UTC)
Date: Tue, 16 Mar 2021 14:38:43 +0100
From: Cornelia Huck <cohuck@redhat.com>
Message-ID: <20210316143843.4a37b52d.cohuck@redhat.com>
In-Reply-To: <20210316090945-mutt-send-email-mst@kernel.org>
References: <20210315083547.2283420-1-arseny.krasnov@kaspersky.com>
	<20210315165350.7377478e.cohuck@redhat.com>
	<25dbb0d6-9e3d-515c-0a6f-10686b76a31a@kaspersky.com>
	<20210316091140.51e26cf5.cohuck@redhat.com>
	<20210316090945-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Subject: [virtio-comment] Re: [MASSMAIL KLMS] [virtio-comment] Re: [RFC PATCH v1]
 virtio-vsock: use enums instead of hardcoded constants
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Arseny Krasnov <arseny.krasnov@kaspersky.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Stefan Hajnoczi <stefanha@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Jorgen Hansen <jhansen@vmware.com>, Norbert Slusarek <nslusarek@gmx.net>, Colin Ian King <colin.king@canonical.com>, Andra Paraschiv <andraprs@amazon.com>, "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>, "oxffffaa@gmail.com" <oxffffaa@gmail.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, 16 Mar 2021 09:23:39 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Tue, Mar 16, 2021 at 09:11:40AM +0100, Cornelia Huck wrote:
> > On Tue, 16 Mar 2021 06:35:11 +0300
> > Arseny Krasnov <arseny.krasnov@kaspersky.com> wrote:
> >   
> > > On 15.03.2021 18:53, Cornelia Huck wrote:  
> > > > On Mon, 15 Mar 2021 11:35:41 +0300
> > > > Arseny Krasnov <arseny.krasnov@kaspersky.com> wrote:
> > > >    
> > > >> This replaces constants defined in "bit X set to Y" manner
> > > >> with enums from Linux kernel uapi headers.
> > > >> ---
> > > >>  virtio-vsock.tex | 29 ++++++++++++++++++++++-------
> > > >>  1 file changed, 22 insertions(+), 7 deletions(-)
> > > >>
> > > >> diff --git a/virtio-vsock.tex b/virtio-vsock.tex
> > > >> index da7e641..a97a81e 100644
> > > >> --- a/virtio-vsock.tex
> > > >> +++ b/virtio-vsock.tex
> > > >> @@ -140,8 +140,14 @@ \subsubsection{Addressing}\label{sec:Device Types / Socket Device / Device Opera
> > > >>  consists of a (cid, port number) tuple. The header fields used for this are
> > > >>  \field{src_cid}, \field{src_port}, \field{dst_cid}, and \field{dst_port}.
> > > >>  
> > > >> -Currently only stream sockets are supported. \field{type} is 1 for stream
> > > >> -socket types.
> > > >> +Currently only stream sockets are supported. \field{type} is one of the
> > > >> +following constants:
> > > >> +
> > > >> +\begin{lstlisting}
> > > >> +enum virtio_vsock_type {
> > > >> +	VIRTIO_VSOCK_TYPE_STREAM = 1,
> > > >> +};
> > > >> +\end{lstlisting}  
> 
> Constants is kind of weird here, and this just makes the reader jump
> through more hoops to figure out the value for little gain.
> How about more clarity at cost of a bit of repetition:
> 
> ---
> Currently only stream sockets are supported. \field{type} is 1 for stream
> socket types.
> 
> \begin{lstlisting}
> #define VIRTIO_VSOCK_TYPE_STREAM 1
> \end{lstlisting}
> ---
> 
> > > >>  
> > > >>  Stream sockets provide in-order, guaranteed, connection-oriented delivery
> > > >>  without message boundaries.  
> 
> 
> The use of enum seems questionable. Rest of spec except for sound uses
> #define which while not documented is at least an english word.
> I'd say it is easier to convert sound for consistency.

It's also used for gpu, input, and crypto.

> 
> BTW we should probably document the use of #define in introduction.tex

Maybe we should also document 'enum'? Or do we want to convert all
existing uses?

> 
> 
> 
> > > >> @@ -221,11 +227,20 @@ \subsubsection{Stream Sockets}\label{sec:Device Types / Socket Device / Device O
> > > >>  a listening socket does not exist on the destination or the destination has
> > > >>  insufficient resources to establish the connection.
> > > >>  
> > > >> -When a connected socket receives VIRTIO_VSOCK_OP_SHUTDOWN the header
> > > >> -\field{flags} field bit 0 indicates that the peer will not receive any more
> > > >> -data and bit 1 indicates that the peer will not send any more data.  These
> > > >> -hints are permanent once sent and successive packets with bits clear do not
> > > >> -reset them.
> > > >> +When a connected socket receives VIRTIO_VSOCK_OP_SHUTDOWN, header \field{flags}
> > > >> +field is one of the following constants:    
> > > > I don't think these two are required to be mutually exclusive (i.e.
> > > > both can be indicated at the same time?)    
> > > 
> > > I'm not sure, in Linux driver there are several cases when these constants are used
> > > 
> > > independently from each over, but I think, this is question to implementation of virtio
> > > 
> > > vsock protocol, while this patch is cosmetic for specification.  
> > 
> > Yes, even if Linux doesn't use it like that, we allow it in the spec.
> > What about:
> > 
> > "When a connected socked receives VIRTIO_VSOCK_OP_SHUTDOWN, the header
> > \field{flags} contains a combination of one or more of the following
> > constants:"
> > 
> > ?  
> 
> combination is kind of vague ...  Also, bit numbers are generally more
> useful than masks.  Also, let's eschew abbreviation. And again a bit of
> repetition here will just make things easier to read imho.
> 
> So how about e.g.
> 
> \field{flags} field bit 0 indicates that the peer will not receive any more
> data and bit 1 indicates that the peer will not send
> any more data.
> 
> +#define VIRTIO_VSOCK_SHUTDOWN_RECEIVE_BIT 0
> +#define VIRTIO_VSOCK_SHUTDOWN_SEND_BIT 1
> 
> then teach linux about VIRTIO_VSOCK_SHUTDOWN_RECEIVE_BIT and VIRTIO_VSOCK_SHUTDOWN_SEND_BIT

I'm not opposed to introducing defines for bits, but wouldn't it be
easier to say that the following bits can be set, then define the bits,
and then explain what the bits mean? Just in case we come up with
something in the future that needs another bit.

> 
> > >   
> > > >    
> > > >> +
> > > >> +\begin{lstlisting}
> > > >> +enum virtio_vsock_shutdown {
> > > >> +	VIRTIO_VSOCK_SHUTDOWN_RCV = 1,
> > > >> +	VIRTIO_VSOCK_SHUTDOWN_SEND = 2,
> > > >> +};
> > > >> +\end{lstlisting}
> > > >> +
> > > >> +VIRTIO_VSOCK_SHUTDOWN_RCV indicates that the peer will not receive any more
> > > >> +data and VIRTIO_VSOCK_SHUTDOWN_SEND indicates that the peer will not send
> > > >> +any more data.  These hints are permanent once sent and successive packets
> > > >> +with bits clear do not reset them.
> > > >>  
> > > >>  The VIRTIO_VSOCK_OP_RST packet aborts the connection process or forcibly
> > > >>  disconnects a connected socket.    
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

