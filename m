Return-Path: <virtio-comment-return-3194-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7C3A1986600
	for <virtio-comment@lists.oasis-open.org>; Tue, 28 Jun 2022 14:32:04 +0000 (UTC)
Date: Tue, 28 Jun 2022 10:31:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20220628102505-mutt-send-email-mst@kernel.org>
References: <20220627100737.16118-1-lauralg@amazon.com>
 <20220627074428-mutt-send-email-mst@kernel.org>
 <75f7af88-25b4-f698-80fe-72264ec290a3@amazon.com>
 <20220628161812.27c61933.pasic@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20220628161812.27c61933.pasic@linux.ibm.com>
Subject: Re: [virtio-comment] Re: [PATCH v5] virtio-vsock: add max payload
 size config field
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Halil Pasic <pasic@linux.ibm.com>
Cc: Laura Loghin <lauralg@amazon.com>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, Jun 28, 2022 at 04:18:12PM +0200, Halil Pasic wrote:
> On Mon, 27 Jun 2022 16:25:21 +0300
> Laura Loghin <lauralg@amazon.com> wrote:
> 
> > On 6/27/22 14:45, Michael S. Tsirkin wrote:
> > > CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> > >
> > >
> > >
> > > On Mon, Jun 27, 2022 at 01:07:37PM +0300, Laura Loghin wrote:  
> > >> Added a new field to the vsock device config space that
> > >> is limiting the size of the packet payload. This way
> > >> the driver is not allowed to allocate huge buffers, and
> > >> potentially fill up the entire memory.  
> > > Could we discuss the motivation a bit more? Are we talking about
> > > device or driver memory? What about allocating huge buffers
> > > allows filling up entire memory which isn't possible with
> > > lots of small buffers?  
> > 
> > I was talking about the driver memory here. 
> 
> What I don't really understand is the following: it is the discretion of
> the driver what it allocates, right? Sorry if I'm asking stupid
> questions. When you say "fill up the entire memory" do you mean the
> memory of the guest or do you mean the memory of the device? When you
> said that you were talking about the driver memory here,
> you mean guest RAM right?
> 
> 
> > Having such limit is
> > also useful in case the driver is sending packets that are bigger
> > than what the device can handle in a timely fashion and with its
> > available memory. So, negotiating this size can improve the
> > performance.
> 
> 
> I do understand that part. It makes perfect sense to me for the
> device to tell the driver what is the largest packet it can handle. The
> why isn't that important I guess.
> 
> AFAIU vsock is a full duplex socket, where packets originate from
> the sender side and are delivered to the receiver. On the
> tx queue it does not make sense to attempt to send packets that
> are so large that the device can handle. On the rx queue it does
> not make sense to make buffers available that are larger than the
> largest packet we can possibly receive.
> > Should I send a new version with a more detailed commit message?
> > 
> 
> I find the message a little confusing. So if we can make it less
> confusing I would not mind.

Well this exists as e.g. MTU for IP. MTU has good reasons to exist
however, since it reflects hardware capabilities.
I can't but feel the motivation is missing here, and without knowing
the why of the change it's hard to judge whether it's going
to be effective in achieving the purpose.

> 
> > >  
> > >> Also defined a new feature bit for this, VIRTIO_VSOCK_F_SIZE_MAX,
> > >> in order to keep backwards compatibility.
> > >>
> > >> Fixes:https://github.com/oasis-tcs/virtio-spec/issues/140
> > >>
> > >> Signed-off-by: Laura Loghin<lauralg@amazon.com>
> > >> ---
> > >>   conformance.tex  |  2 ++
> > >>   virtio-vsock.tex | 24 ++++++++++++++++++++++++
> > >>   2 files changed, 26 insertions(+)
> > >>
> > >> diff --git a/conformance.tex b/conformance.tex
> > >> index 42f8537..77f7583 100644
> > >> --- a/conformance.tex
> > >> +++ b/conformance.tex
> > >> @@ -222,6 +222,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
> > >>   A socket driver MUST conform to the following normative statements:
> > >>
> > >>   \begin{itemize}
> > >> +\item \ref{drivernormative:Device Types / Socket Device / Device configuration layout}
> > >>   \item \ref{drivernormative:Device Types / Socket Device / Device Operation / Buffer Space Management}
> > >>   \item \ref{drivernormative:Device Types / Socket Device / Device Operation / Receive and Transmit}
> > >>   \item \ref{drivernormative:Device Types / Socket Device / Device Operation / Device Events}
> > >> @@ -481,6 +482,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
> > >>   A socket device MUST conform to the following normative statements:
> > >>
> > >>   \begin{itemize}
> > >> +\item \ref{devicenormative:Device Types / Socket Device / Device configuration layout}
> > >>   \item \ref{devicenormative:Device Types / Socket Device / Device Operation / Buffer Space Management}
> > >>   \item \ref{devicenormative:Device Types / Socket Device / Device Operation / Receive and Transmit}
> > >>   \end{itemize}
> > >> diff --git a/virtio-vsock.tex b/virtio-vsock.tex
> > >> index d79984d..9cbf8c4 100644
> > >> --- a/virtio-vsock.tex
> > >> +++ b/virtio-vsock.tex
> > >> @@ -23,6 +23,10 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
> > >>   \begin{description}
> > >>   \item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is supported.
> > >>   \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is supported.
> > >> +\item[VIRTIO_VSOCK_F_SIZE_MAX (2)] Maximum size of the packet payload is in
> > >> +     \field{data_max_size}. If offered by the device, device advises driver
> > >> +     about the value of its maximum payload size. If negotiated, the driver uses
> > >> +     \field{data_max_size} as the maximum packet payload size value.
> > >>   \end{description}
> > >>
> > >>   \subsection{Device configuration layout}\label{sec:Device Types / Socket Device / Device configuration layout}
> > >> @@ -32,6 +36,7 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
> > >>   \begin{lstlisting}
> > >>   struct virtio_vsock_config {
> > >>        le64 guest_cid;
> > >> +     le32 data_max_size;
> > >>   };
> > >>   \end{lstlisting}
> > >>
> > >> @@ -57,6 +62,25 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
> > >>   \hline
> > >>   \end{tabular}
> > >>
> > >> +The following driver-read-only field, \field{data_max_size} can be used only if
> > >> +VIRTIO_VSOCK_F_SIZE_MAX is negotiated. This field specifies the maximum packet
> > >> +payload size for the driver to use.
> > >> +
> > >> +\devicenormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
> > >> +
> > >> +The device MUST NOT change the value exposed through \field{data_max_size}.
> > >> +
> > >> +\drivernormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
> > >> +
> > >> +A driver SHOULD negotiate VIRTIO_VSOCK_F_SIZE_MAX if the device offers it.
> > >> +
> > >> +If the driver negotiates VIRTIO_VSOCK_F_SIZE_MAX, the size of each receive
> > >> +buffer it supplies MUST not exceed the size \field{data_max_size} (plus header
> > >> +length).
> 
> I would make this a SHOULD. What heavy harm do we expect from bigger
> receive buffers? For example one could place a canary for test purposes
> in the extra portion of the buffer.

Not sure about the canary, it is legal for device to write more
and report less to the driver.

> I would also avoid that parenthesis construct because what is in there
> is actually important information.
> 
> Also I would s/size of each receive buffer it supplied/size of each
> buffer made available on the rx queue/
> 
> IMHO it is less ambiguous than receive buffer. Please notice
> that "buf_alloc is the total receive buffer space, in bytes, for this
> socket. This includes both free and in-use buffers." is also a part of
> "5.10 Socket Device". 

Heh, an annoying reuse of the word "buffer". I guess it's "buffer space"
here. Let's replace with "memory space" or even "memory allocation space"?


> > >> +
> > >> +If the driver negotiates VIRTIO_VSOCK_F_SIZE_MAX, it MUST NOT transmit packets
> > >> +of size exceeding the value of \field{data_max_size} (plus header length).
> > >> +
> 
> Here it looks like the driver is still allowed to supply buffers that
> exceed \field{data_max_size} + header_length. The length of the packet
> is I guess determined by the length that is stored in the header.
> 
> Is this intended?
> 
> > >>   \subsection{Device Initialization}\label{sec:Device Types / Socket Device / Device Initialization}
> > >>
> > >>   \begin{enumerate}
> > >> --
> > >> 2.17.1
> > >>
> > >>
> > >>
> > >>
> > >> Amazon Development Center (Romania) S.R.L. registered office: 27A Sf. Lazar Street, UBC5, floor 2, Iasi, Iasi County, 700045, Romania. Registered in Romania. Registration number J22/2621/2005.  
> > 
> > 
> > 
> > 
> > Amazon Development Center (Romania) S.R.L. registered office: 27A Sf. Lazar Street, UBC5, floor 2, Iasi, Iasi County, 700045, Romania. Registered in Romania. Registration number J22/2621/2005.


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

