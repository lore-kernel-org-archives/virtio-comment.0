Return-Path: virtio-comment-return-1731-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1DF6F986428
	for <virtio-comment@lists.oasis-open.org>; Wed,  3 Mar 2021 16:52:59 +0000 (UTC)
Date: Wed, 3 Mar 2021 11:52:43 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20210303114831-mutt-send-email-mst@kernel.org>
References: <20210218060715.1075547-1-arseny.krasnov@kaspersky.com>
 <20210218060827.1075863-1-arseny.krasnov@kaspersky.com>
 <20210224093200.tpflaqgoap4fe5ax@steredhat>
 <20210303130843.6b457503.cohuck@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210303130843.6b457503.cohuck@redhat.com>
Subject: Re: [virtio-comment] [RFC PATCH v1 1/1] virtio-vsock: add
 SOCK_SEQPACKET description
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Cornelia Huck <cohuck@redhat.com>
Cc: Stefano Garzarella <sgarzare@redhat.com>, Arseny Krasnov <arseny.krasnov@kaspersky.com>, virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>, Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Jorgen Hansen <jhansen@vmware.com>, Andra Paraschiv <andraprs@amazon.com>, Norbert Slusarek <nslusarek@gmx.net>, Colin Ian King <colin.king@canonical.com>, virtualization@lists.linux-foundation.org, oxffffaa@gmail.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, Mar 03, 2021 at 01:08:43PM +0100, Cornelia Huck wrote:
> On Wed, 24 Feb 2021 10:32:00 +0100
> Stefano Garzarella <sgarzare@redhat.com> wrote:
> 
> > On Thu, Feb 18, 2021 at 09:08:23AM +0300, Arseny Krasnov wrote:
> > >Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
> > >---
> > > virtio-vsock.tex | 40 +++++++++++++++++++++++++++++++++++++---
> > > 1 file changed, 37 insertions(+), 3 deletions(-)
> > >
> > >diff --git a/virtio-vsock.tex b/virtio-vsock.tex
> > >index da7e641..1ee8f99 100644
> > >--- a/virtio-vsock.tex
> > >+++ b/virtio-vsock.tex
> > >@@ -102,6 +102,11 @@ \subsection{Device Operation}\label{sec:Device Types / Socket Device / Device Op
> > > 	VIRTIO_VSOCK_OP_CREDIT_UPDATE = 6,
> > > 	/* Request the peer to send the credit info to us */
> > > 	VIRTIO_VSOCK_OP_CREDIT_REQUEST = 7,
> > >+
> > >+	/* Message begin for SOCK_SEQPACKET */
> > >+	VIRTIO_VSOCK_OP_SEQ_BEGIN = 8,
> > >+	/* Message end for SOCK_SEQPACKET */
> > >+	VIRTIO_VSOCK_OP_SEQ_END = 9,
> > > };
> > > \end{lstlisting}
> > >
> > >@@ -140,11 +145,11 @@ \subsubsection{Addressing}\label{sec:Device Types / Socket Device / Device Opera
> > > consists of a (cid, port number) tuple. The header fields used for this are
> > > \field{src_cid}, \field{src_port}, \field{dst_cid}, and \field{dst_port}.
> > >
> > >-Currently only stream sockets are supported. \field{type} is 1 for stream
> > >-socket types.
> > >+Currently stream and seqpacket sockets are supported. \field{type} is 1 for
> > >+stream socket types. \field{type} is 2 for seqpacket socket types.
> > >
> > > Stream sockets provide in-order, guaranteed, connection-oriented delivery
> > >-without message boundaries.
> > >+without message boundaries. Seqpacket sockets also provide message boundaries.
> > >
> > > \subsubsection{Buffer Space Management}\label{sec:Device Types / Socket Device / Device Operation / Buffer Space Management}
> > > \field{buf_alloc} and \field{fwd_cnt} are used for buffer space management of
> > >@@ -240,6 +245,35 @@ \subsubsection{Stream Sockets}\label{sec:Device Types / Socket Device / Device O
> > > destination) address tuple for a new connection while the other peer is still
> > > processing the old connection.
> > >
> > >+\subsubsection{Seqpacket Sockets}\label{sec:Device Types / Socket Device / Device Operation / Seqpacket Sockets}
> > >+
> > >+Seqpacket sockets differ from stream sockets only in data transmission way: in
> > >+stream sockets all data is sent using only VIRTIO_VSOCK_OP_RW packets. In
> > >+seqpacket sockets, to provide message boundaries, every sequence of
> > >+VIRTIO_VSOCK_OP_RW packets of each message is headed with  
> >                                               ^
> > Since this is a spec, I think we should use MUST when something must be 
> > respected by the peer, for example here we can say "MUST be headed"
> > 
> > >+VIRTIO_VSOCK_OP_SEQ_BEGIN and tailed with VIRTIO_VSOCK_OP_SEQ_END packets.
> > >+Both VIRTIO_VSOCK_OP_SEQ_BEGIN and VIRTIO_VSOCK_OP_SEQ_END packets carry  
> >                                                                       ^
> > Same here "MUST carry" and in the rest of the patch.
> 
> Actually, MUST and friends are really for normative sections; I'd
> advise to have a description of how this feature works and then some
> device/driver normative clauses with MUST statements (like "the device
> MUST reject <malformed packets>" or so).

I agree we do want normative sections but please don't add MUST etc elsewhere.
Also vague text saying "malformed" isn't all that helpful if it's a
MUST. How does driver know for sure it's malformed? easy to miss
some requirement.
Therefore easiest thing it just to do some copy-pasting.

E.g. You start with above and add a normative section saying:
Driver MUST use XYZ in VIRTIO_VSOCK_OP_SEQ_END packets.

We typically don't specify behaviour when out of spec,
if we should here then please make a separate chapter
for this explaining the how and the why.

-- 
MST


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

