Return-Path: <virtio-comment-return-3190-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 218839863FE
	for <virtio-comment@lists.oasis-open.org>; Mon, 27 Jun 2022 15:23:16 +0000 (UTC)
Date: Mon, 27 Jun 2022 11:23:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20220627112045-mutt-send-email-mst@kernel.org>
References: <20220627100737.16118-1-lauralg@amazon.com>
 <20220627074428-mutt-send-email-mst@kernel.org>
 <75f7af88-25b4-f698-80fe-72264ec290a3@amazon.com>
MIME-Version: 1.0
In-Reply-To: <75f7af88-25b4-f698-80fe-72264ec290a3@amazon.com>
Subject: [virtio-comment] Re: [PATCH v5] virtio-vsock: add max payload size config field
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Laura Loghin <lauralg@amazon.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Jun 27, 2022 at 04:25:21PM +0300, Laura Loghin wrote:
> On 6/27/22 14:45, Michael S. Tsirkin wrote:
> 
>     CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> 
> 
> 
>     On Mon, Jun 27, 2022 at 01:07:37PM +0300, Laura Loghin wrote:
> 
>         Added a new field to the vsock device config space that
>         is limiting the size of the packet payload. This way
>         the driver is not allowed to allocate huge buffers, and
>         potentially fill up the entire memory.
> 
>     Could we discuss the motivation a bit more? Are we talking about
>     device or driver memory? What about allocating huge buffers
>     allows filling up entire memory which isn't possible with
>     lots of small buffers?
> 
> I was talking about the driver memory here. Having such limit is
> also useful in case the driver is sending packets that are bigger
> than what the device can handle in a timely fashion and with its
> available memory. So, negotiating this size can improve the
> performance.
> Should I send a new version with a more detailed commit message?
> 

Can you answer the second part of the question then?

     What about allocating huge buffers
     allows filling up entire memory which isn't possible with
     lots of small buffers?


More specifically, credit accounting already limits memory for buffers
in the vq, why is further limiting per packet memory necessary?

> 
>         Also defined a new feature bit for this, VIRTIO_VSOCK_F_SIZE_MAX,
>         in order to keep backwards compatibility.
> 
>         Fixes: https://github.com/oasis-tcs/virtio-spec/issues/140
> 
>         Signed-off-by: Laura Loghin <lauralg@amazon.com>
>         ---
>          conformance.tex  |  2 ++
>          virtio-vsock.tex | 24 ++++++++++++++++++++++++
>          2 files changed, 26 insertions(+)
> 
>         diff --git a/conformance.tex b/conformance.tex
>         index 42f8537..77f7583 100644
>         --- a/conformance.tex
>         +++ b/conformance.tex
>         @@ -222,6 +222,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>          A socket driver MUST conform to the following normative statements:
> 
>          \begin{itemize}
>         +\item \ref{drivernormative:Device Types / Socket Device / Device configuration layout}
>          \item \ref{drivernormative:Device Types / Socket Device / Device Operation / Buffer Space Management}
>          \item \ref{drivernormative:Device Types / Socket Device / Device Operation / Receive and Transmit}
>          \item \ref{drivernormative:Device Types / Socket Device / Device Operation / Device Events}
>         @@ -481,6 +482,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>          A socket device MUST conform to the following normative statements:
> 
>          \begin{itemize}
>         +\item \ref{devicenormative:Device Types / Socket Device / Device configuration layout}
>          \item \ref{devicenormative:Device Types / Socket Device / Device Operation / Buffer Space Management}
>          \item \ref{devicenormative:Device Types / Socket Device / Device Operation / Receive and Transmit}
>          \end{itemize}
>         diff --git a/virtio-vsock.tex b/virtio-vsock.tex
>         index d79984d..9cbf8c4 100644
>         --- a/virtio-vsock.tex
>         +++ b/virtio-vsock.tex
>         @@ -23,6 +23,10 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
>          \begin{description}
>          \item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is supported.
>          \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is supported.
>         +\item[VIRTIO_VSOCK_F_SIZE_MAX (2)] Maximum size of the packet payload is in
>         +     \field{data_max_size}. If offered by the device, device advises driver
>         +     about the value of its maximum payload size. If negotiated, the driver uses
>         +     \field{data_max_size} as the maximum packet payload size value.
>          \end{description}
> 
>          \subsection{Device configuration layout}\label{sec:Device Types / Socket Device / Device configuration layout}
>         @@ -32,6 +36,7 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
>          \begin{lstlisting}
>          struct virtio_vsock_config {
>               le64 guest_cid;
>         +     le32 data_max_size;
>          };
>          \end{lstlisting}
> 
>         @@ -57,6 +62,25 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
>          \hline
>          \end{tabular}
> 
>         +The following driver-read-only field, \field{data_max_size} can be used only if
>         +VIRTIO_VSOCK_F_SIZE_MAX is negotiated. This field specifies the maximum packet
>         +payload size for the driver to use.
>         +
>         +\devicenormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
>         +
>         +The device MUST NOT change the value exposed through \field{data_max_size}.
>         +
>         +\drivernormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
>         +
>         +A driver SHOULD negotiate VIRTIO_VSOCK_F_SIZE_MAX if the device offers it.
>         +
>         +If the driver negotiates VIRTIO_VSOCK_F_SIZE_MAX, the size of each receive
>         +buffer it supplies MUST not exceed the size \field{data_max_size} (plus header
>         +length).
>         +
>         +If the driver negotiates VIRTIO_VSOCK_F_SIZE_MAX, it MUST NOT transmit packets
>         +of size exceeding the value of \field{data_max_size} (plus header length).
>         +
>          \subsection{Device Initialization}\label{sec:Device Types / Socket Device / Device Initialization}
> 
>          \begin{enumerate}
>         --
>         2.17.1
> 
> 
> 
> 
>         Amazon Development Center (Romania) S.R.L. registered office: 27A Sf. Lazar Street, UBC5, floor 2, Iasi, Iasi County, 700045, Romania. Registered in Romania. Registration number J22/2621/2005.
> 
> 
> 
> Amazon Development Center (Romania) S.R.L. registered office: 27A Sf. Lazar
> Street, UBC5, floor 2, Iasi, Iasi County, 700045, Romania. Registered in
> Romania. Registration number J22/2621/2005.
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

