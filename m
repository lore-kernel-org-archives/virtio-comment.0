Return-Path: <virtio-comment-return-3359-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 823F9986360
	for <virtio-comment@lists.oasis-open.org>; Wed, 10 Aug 2022 09:10:44 +0000 (UTC)
Date: Wed, 10 Aug 2022 05:10:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20220810050636-mutt-send-email-mst@kernel.org>
References: <20220124125625.3706347-1-stevensd@chromium.org>
 <20220124125625.3706347-2-stevensd@chromium.org>
 <20220809164654-mutt-send-email-mst@kernel.org>
 <CAD=HUj4pmSEo0qhcDCTmoMTfbGLic3aUiMeoxQeB3NVH47GKyg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD=HUj4pmSEo0qhcDCTmoMTfbGLic3aUiMeoxQeB3NVH47GKyg@mail.gmail.com>
Subject: Re: [virtio-comment] [PATCH 1/2] virtio-balloon: add an event queue
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: David Stevens <stevensd@chromium.org>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, Aug 10, 2022 at 04:54:01PM +0900, David Stevens wrote:
> On Wed, Aug 10, 2022 at 5:52 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Mon, Jan 24, 2022 at 09:56:24PM +0900, David Stevens wrote:
> > > Add an event queue to the balloon to allow the driver to send events to
> > > the device, which allows the device to be more responsive to the memory
> > > needs of the guest.
> > >
> > > There are two defined events. The first event is an out of memory event.
> > > This event provides a way for the guest to handle out of memory events
> > > on a system where the host does not support deflate-on-oom. The second
> > > event is an out of puff event, which the guest can send when it fails to
> > > allocate memory while trying to inflate the balloon. This serves as an
> > > indication to the device that the driver may not be able to inflate the
> > > balloon in a timely manner.

Thanks for the answers! Pls include them in the spec too.

> > >
> > > Signed-off-by: David Stevens <stevensd@chromium.org>
> > > ---
> > >  conformance.tex |  2 ++
> > >  content.tex     | 59 +++++++++++++++++++++++++++++++++++++++++++++++++
> > >  2 files changed, 61 insertions(+)
> > >
> > > diff --git a/conformance.tex b/conformance.tex
> > > index 42f853762ebe..5e0baa5ae7df 100644
> > > --- a/conformance.tex
> > > +++ b/conformance.tex
> > > @@ -181,6 +181,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
> > >  \item \ref{drivernormative:Device Types / Memory Balloon Device / Device Operation / Free Page Hinting}
> > >  \item \ref{drivernormative:Device Types / Memory Balloon Device / Device Operation / Page Poison}
> > >  \item \ref{drivernormative:Device Types / Memory Balloon Device / Device Operation / Free Page Reporting}
> > > +\item \ref{drivernormative:Device Types / Memory Balloon Device / Device Operation / Events}
> > >  \end{itemize}
> > >
> > >  \conformance{\subsection}{SCSI Host Driver Conformance}\label{sec:Conformance / Driver Conformance / SCSI Host Driver Conformance}
> > > @@ -440,6 +441,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
> > >  \item \ref{devicenormative:Device Types / Memory Balloon Device / Device Operation / Free Page Hinting}
> > >  \item \ref{devicenormative:Device Types / Memory Balloon Device / Device Operation / Page Poison}
> > >  \item \ref{devicenormative:Device Types / Memory Balloon Device / Device Operation / Free Page Reporting}
> > > +\item \ref{devicenormative:Device Types / Memory Balloon Device / Device Operation / Events}
> > >  \end{itemize}
> > >
> > >  \conformance{\subsection}{SCSI Host Device Conformance}\label{sec:Conformance / Device Conformance / SCSI Host Device Conformance}
> > > diff --git a/content.tex b/content.tex
> > > index 32de6685c50b..3aeb319d31a7 100644
> > > --- a/content.tex
> > > +++ b/content.tex
> > > @@ -5420,6 +5420,7 @@ \subsection{Virtqueues}\label{sec:Device Types / Memory Balloon Device / Virtque
> > >  \item[2] statsq
> > >  \item[3] free_page_vq
> > >  \item[4] reporting_vq
> > > +\item[5] event_vq
> > >  \end{description}
> > >
> > >    statsq only exists if VIRTIO_BALLOON_F_STATS_VQ is set.
> > > @@ -5428,6 +5429,8 @@ \subsection{Virtqueues}\label{sec:Device Types / Memory Balloon Device / Virtque
> > >
> > >    reporting_vq only exists if VIRTIO_BALLOON_F_PAGE_REPORTING is set.
> > >
> > > +  event_vq only exists if VIRTIO_BALLOON_F_EVENT_VQ is set.
> > > +
> > >  \subsection{Feature bits}\label{sec:Device Types / Memory Balloon Device / Feature bits}
> > >  \begin{description}
> > >  \item[VIRTIO_BALLOON_F_MUST_TELL_HOST (0)] Host has to be told before
> > > @@ -5446,6 +5449,8 @@ \subsection{Feature bits}\label{sec:Device Types / Memory Balloon Device / Featu
> > >      Configuration field \field{poison_val} is valid.
> > >  \item[ VIRTIO_BALLOON_F_PAGE_REPORTING(5) ] The device has support for free
> > >      page reporting. A virtqueue for reporting free guest memory is present.
> > > +\item[ VIRTIO_BALLOON_F_EVENT_VQ(6) ] A virtqueue for sending events from
> > > +    the driver to the device.
> > >
> > >  \end{description}
> > >
> > > @@ -5529,6 +5534,8 @@ \subsection{Device Initialization}\label{sec:Device Types / Memory Balloon Devic
> > >    notify the device about the stats virtqueue buffer.
> > >  \item If the VIRTIO_BALLOON_F_PAGE_REPORTING feature bit is negotiated, then
> > >    begin reporting free pages to the device.
> > > +\item If the VIRTIO_BALLOON_F_EVENT_VQ feature bit is negotiated, then
> > > +  begin reporting events to the device.
> > >  \end{enumerate}
> > >
> > >  \subsection{Device Operation}\label{sec:Device Types / Memory Balloon Device / Device Operation}
> > > @@ -6031,6 +6038,58 @@ \subsubsection{Free Page Reporting}\label{sec:Device Types / Memory Balloon Devi
> > >  MUST NOT modify the the content of a reported page to a value other than
> > >  \field{poison_val}.
> > >
> > > +\subsubsection{Events}\label{sec:Device Types / Memory Balloon Device / Device Operation / Events}
> > > +
> > > +The events virtqueue allows the driver to signal events to the
> > > +device.
> >
> > and the following is the format used for buffers added
> > to this vq? write or read buffers?
> 
> It's the format for messages sent to the virtqueue. Written by the
> driver, read-only from the device.
> 
> >
> > > +
> > > +\begin{lstlisting}
> > > +struct virtio_balloon_event {
> > > +        u32 type;
> > > +        u32 data;
> > > +};
> > > +
> > > +#define VIRTIO_BALLOON_EVENT_OOM        1
> > > +#define VIRTIO_BALLOON_EVENT_OOPUFF     2
> > > +\end{lstlisting}
> > > +
> > > +The \field{type} determines how to interpret the event. The following
> > > +events are defined:
> > > +
> > > +\begin{itemize}
> > > +\item Out of memory
> > > +\begin{lstlisting}
> > > +#define VIRTIO_BALLOON_EVENT_OOM        1
> > > +\end{lstlisting}
> > > +The driver has encountered a situation in which using pages from the balloon
> > > +is necessary for system stability (e.g. if memory is required by applications
> > > +running within the guest). The \field{data} value indicates how many pages
> > > +the driver requires to maintain system stability.
> >
> > I'd prefer that we report info in bytes or another portable metric
> > please. Down the road we should switch balloon away from
> > using pages, too. This might mean we need to make data and type u64.
> >
> > > +\item Out of puff
> > > +\begin{lstlisting}
> > > +#define VIRTIO_BALLOON_EVENT_OOPUFF     2
> > > +\end{lstlisting}
> > > +The driver has encountered an allocation failure when trying to inflate
> > > +the balloon. The \field{data} value is unused. This event serves as a signal
> > > +that the balloon may not be able to inflate in a timely manner.
> > > +\end{itemize}
> > > +
> > > +\drivernormative{\paragraph}{Events}{Device Types / Memory Balloon Device / Device Operation / Events}
> > > +
> > > +The driver MUST update \field{actual} with any allocated pages before
> > > +sending a VIRTIO_BALLOON_EVENT_OOPUFF event.
> > > +
> > > +The driver SHOULD wait for the device to acknowledge the event
> > > +before trying to further inflate or deflate the balloon.
> >
> > Hmm what is the motivation for this?
> 
> Having the driver wait gives the device the option to respond to the
> event synchronously. For example, since a puff failure when inflating
> signals high memory pressure in the guest, the device might want to
> reduce num_pages to stop further attempts to inflate the balloon.
> And
> if the device wants to respond asynchronously, it can always do that
> after acking the event.

Question: how does device know by how much to reduce the num_pages?
Should the current balloon size be sent with this event?


> >
> > > +
> > > +If VIRTIO_BALLOON_F_DEFLATE_ON_OOM has been negotiated, the driver
> > > +SHOULD send an OOM event before using pages from the balloon.
> >
> > what does using mean here? You mean without MUST_TELL_HOST?
> >
> 
> With DEFLATE_ON_OOM, "the driver MAY use pages from the balloon when
> num_pages is less than or equal to the actual number of pages in the
> balloon if this is required for system stability". When the event
> queue is enabled, the driver should send a VIRTIO_BALLOON_EVENT_OOM
> before doing that and using pages in the balloon.

> That said, I've been
> convinced that deflate-on-oom is questionable at best, so I think it's
> better to replace the OOM event with a more generic memory pressure
> event.




> > > +
> > > +\devicenormative{\paragraph}{Events}{Device Types / Memory Balloon Device / Device Operation / Events}
> > > +
> > > +When the device receives a VIRTIO_BALLOON_EVENT_OOM event, it SHOULD deflate
> > > +the balloon by \field{data} pages before acknowledging the event.
> >
> > ... by modifying the config space field I guess?
> >
> 
> Yes, by reducing num_pages.
> 
> > > +
> > >  \section{SCSI Host Device}\label{sec:Device Types / SCSI Host Device}
> > >
> > >  The virtio SCSI host device groups together one or more virtual
> > > --
> > > 2.35.0.rc0.227.g00780c9af4-goog
> > >
> > >
> > > This publicly archived list offers a means to provide input to the
> > > OASIS Virtual I/O Device (VIRTIO) TC.
> > >
> > > In order to verify user consent to the Feedback License terms and
> > > to minimize spam in the list archive, subscription is required
> > > before posting.
> > >
> > > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > > List help: virtio-comment-help@lists.oasis-open.org
> > > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > > Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> > > List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> > > Committee: https://www.oasis-open.org/committees/virtio/
> > > Join OASIS: https://www.oasis-open.org/join/
> >


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

