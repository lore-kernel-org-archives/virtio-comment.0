Return-Path: <virtio-comment-return-2617-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 46EB998642F
	for <virtio-comment@lists.oasis-open.org>; Mon, 24 Jan 2022 12:57:40 +0000 (UTC)
From: David Stevens <stevensd@chromium.org>
Date: Mon, 24 Jan 2022 21:56:24 +0900
Message-Id: <20220124125625.3706347-2-stevensd@chromium.org>
In-Reply-To: <20220124125625.3706347-1-stevensd@chromium.org>
References: <20220124125625.3706347-1-stevensd@chromium.org>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH 1/2] virtio-balloon: add an event queue
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"
To: virtio-comment@lists.oasis-open.org
Cc: David Stevens <stevensd@chromium.org>
List-ID: <virtio-comment.lists.oasis-open.org>

Add an event queue to the balloon to allow the driver to send events to
the device, which allows the device to be more responsive to the memory
needs of the guest.

There are two defined events. The first event is an out of memory event.
This event provides a way for the guest to handle out of memory events
on a system where the host does not support deflate-on-oom. The second
event is an out of puff event, which the guest can send when it fails to
allocate memory while trying to inflate the balloon. This serves as an
indication to the device that the driver may not be able to inflate the
balloon in a timely manner.

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 conformance.tex |  2 ++
 content.tex     | 59 +++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/conformance.tex b/conformance.tex
index 42f853762ebe..5e0baa5ae7df 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -181,6 +181,7 @@ \section{Conformance Targets}\label{sec:Conformance / C=
onformance Targets}
 \item \ref{drivernormative:Device Types / Memory Balloon Device / Device O=
peration / Free Page Hinting}
 \item \ref{drivernormative:Device Types / Memory Balloon Device / Device O=
peration / Page Poison}
 \item \ref{drivernormative:Device Types / Memory Balloon Device / Device O=
peration / Free Page Reporting}
+\item \ref{drivernormative:Device Types / Memory Balloon Device / Device O=
peration / Events}
 \end{itemize}
=20
 \conformance{\subsection}{SCSI Host Driver Conformance}\label{sec:Conforma=
nce / Driver Conformance / SCSI Host Driver Conformance}
@@ -440,6 +441,7 @@ \section{Conformance Targets}\label{sec:Conformance / C=
onformance Targets}
 \item \ref{devicenormative:Device Types / Memory Balloon Device / Device O=
peration / Free Page Hinting}
 \item \ref{devicenormative:Device Types / Memory Balloon Device / Device O=
peration / Page Poison}
 \item \ref{devicenormative:Device Types / Memory Balloon Device / Device O=
peration / Free Page Reporting}
+\item \ref{devicenormative:Device Types / Memory Balloon Device / Device O=
peration / Events}
 \end{itemize}
=20
 \conformance{\subsection}{SCSI Host Device Conformance}\label{sec:Conforma=
nce / Device Conformance / SCSI Host Device Conformance}
diff --git a/content.tex b/content.tex
index 32de6685c50b..3aeb319d31a7 100644
--- a/content.tex
+++ b/content.tex
@@ -5420,6 +5420,7 @@ \subsection{Virtqueues}\label{sec:Device Types / Memo=
ry Balloon Device / Virtque
 \item[2] statsq
 \item[3] free_page_vq
 \item[4] reporting_vq
+\item[5] event_vq
 \end{description}
=20
   statsq only exists if VIRTIO_BALLOON_F_STATS_VQ is set.
@@ -5428,6 +5429,8 @@ \subsection{Virtqueues}\label{sec:Device Types / Memo=
ry Balloon Device / Virtque
=20
   reporting_vq only exists if VIRTIO_BALLOON_F_PAGE_REPORTING is set.
=20
+  event_vq only exists if VIRTIO_BALLOON_F_EVENT_VQ is set.
+
 \subsection{Feature bits}\label{sec:Device Types / Memory Balloon Device /=
 Feature bits}
 \begin{description}
 \item[VIRTIO_BALLOON_F_MUST_TELL_HOST (0)] Host has to be told before
@@ -5446,6 +5449,8 @@ \subsection{Feature bits}\label{sec:Device Types / Me=
mory Balloon Device / Featu
     Configuration field \field{poison_val} is valid.
 \item[ VIRTIO_BALLOON_F_PAGE_REPORTING(5) ] The device has support for fre=
e
     page reporting. A virtqueue for reporting free guest memory is present=
.
+\item[ VIRTIO_BALLOON_F_EVENT_VQ(6) ] A virtqueue for sending events from
+    the driver to the device.
=20
 \end{description}
=20
@@ -5529,6 +5534,8 @@ \subsection{Device Initialization}\label{sec:Device T=
ypes / Memory Balloon Devic
   notify the device about the stats virtqueue buffer.
 \item If the VIRTIO_BALLOON_F_PAGE_REPORTING feature bit is negotiated, th=
en
   begin reporting free pages to the device.
+\item If the VIRTIO_BALLOON_F_EVENT_VQ feature bit is negotiated, then
+  begin reporting events to the device.
 \end{enumerate}
=20
 \subsection{Device Operation}\label{sec:Device Types / Memory Balloon Devi=
ce / Device Operation}
@@ -6031,6 +6038,58 @@ \subsubsection{Free Page Reporting}\label{sec:Device=
 Types / Memory Balloon Devi
 MUST NOT modify the the content of a reported page to a value other than
 \field{poison_val}.
=20
+\subsubsection{Events}\label{sec:Device Types / Memory Balloon Device / De=
vice Operation / Events}
+
+The events virtqueue allows the driver to signal events to the
+device.
+
+\begin{lstlisting}
+struct virtio_balloon_event {
+        u32 type;
+        u32 data;
+};
+
+#define VIRTIO_BALLOON_EVENT_OOM        1
+#define VIRTIO_BALLOON_EVENT_OOPUFF     2
+\end{lstlisting}
+
+The \field{type} determines how to interpret the event. The following
+events are defined:
+
+\begin{itemize}
+\item Out of memory
+\begin{lstlisting}
+#define VIRTIO_BALLOON_EVENT_OOM        1
+\end{lstlisting}
+The driver has encountered a situation in which using pages from the ballo=
on
+is necessary for system stability (e.g. if memory is required by applicati=
ons
+running within the guest). The \field{data} value indicates how many pages
+the driver requires to maintain system stability.
+\item Out of puff
+\begin{lstlisting}
+#define VIRTIO_BALLOON_EVENT_OOPUFF     2
+\end{lstlisting}
+The driver has encountered an allocation failure when trying to inflate
+the balloon. The \field{data} value is unused. This event serves as a sign=
al
+that the balloon may not be able to inflate in a timely manner.
+\end{itemize}
+
+\drivernormative{\paragraph}{Events}{Device Types / Memory Balloon Device =
/ Device Operation / Events}
+
+The driver MUST update \field{actual} with any allocated pages before
+sending a VIRTIO_BALLOON_EVENT_OOPUFF event.
+
+The driver SHOULD wait for the device to acknowledge the event
+before trying to further inflate or deflate the balloon.
+
+If VIRTIO_BALLOON_F_DEFLATE_ON_OOM has been negotiated, the driver
+SHOULD send an OOM event before using pages from the balloon.
+
+\devicenormative{\paragraph}{Events}{Device Types / Memory Balloon Device =
/ Device Operation / Events}
+
+When the device receives a VIRTIO_BALLOON_EVENT_OOM event, it SHOULD defla=
te
+the balloon by \field{data} pages before acknowledging the event.
+
 \section{SCSI Host Device}\label{sec:Device Types / SCSI Host Device}
=20
 The virtio SCSI host device groups together one or more virtual
--=20
2.35.0.rc0.227.g00780c9af4-goog


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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

