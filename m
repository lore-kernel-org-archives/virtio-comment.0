Return-Path: virtio-comment-return-968-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C2BBE985A85
	for <virtio-comment@lists.oasis-open.org>; Mon,  2 Dec 2019 01:20:52 +0000 (UTC)
From: Wei Wang <wei.w.wang@intel.com>
Date: Mon,  2 Dec 2019 08:33:25 +0800
Message-Id: <1575246805-1210-1-git-send-email-wei.w.wang@intel.com>
Subject: [virtio-comment] [PATCH v2 RESEND] content/virtio-balloon: VIRTIO_BALLOON_F_FREE_PAGE_HINT
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org, mst@redhat.com
Cc: dgilbert@redhat.co
List-ID: <virtio-comment.lists.oasis-open.org>

The VIRTIO_BALLOON_F_FREE_PAGE_HINT feature supports driver reporting
free memory hints to the device. The VIRTIO_BALLOON_F_PAGE_POISON feature
supports guest to report the memory poison value to host.

Live migration can use the virtio-balloon device to get the guest free
memory hints, and avoid sending those free pages. It is not concerned that
the memory pages are used (e.g. guest reclaimed some of them due to memory
pressure) after they are given to the device as hints of free pages,
because they will be tracked by the hypervisor and transferred in the
subsequent round if they are used and written.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/33
Suggested-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Wei Wang <wei.w.wang@intel.com>
---
 content.tex | 121 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+---
 1 file changed, 115 insertions(+), 6 deletions(-)

diff --git a/content.tex b/content.tex
index 836ee52..21b2339 100644
--- a/content.tex
+++ b/content.tex
@@ -4493,9 +4493,9 @@ The traditional virtio memory balloon device is a pri=
mitive device for
 managing guest memory: the device asks for a certain amount of
 memory, and the driver supplies it (or withdraws it, if the device
 has more than it asks for). This allows the guest to adapt to
-changes in allowance of underlying physical memory. If the
-feature is negotiated, the device can also be used to communicate
-guest memory statistics to the host.
+changes in allowance of underlying physical memory. The device can
+also be used to communicate guest memory statistics and guest free
+memory to the host when the related features are negotiated.
=20
 \subsection{Device ID}\label{sec:Device Types / Memory Balloon Device / De=
vice ID}
   5
@@ -4504,11 +4504,14 @@ guest memory statistics to the host.
 \begin{description}
 \item[0] inflateq
 \item[1] deflateq
-\item[2] statsq.
+\item[2] statsq
+\item[3] freememq.
 \end{description}
=20
   Virtqueue 2 only exists if VIRTIO_BALLON_F_STATS_VQ set.
=20
+  Virtqueue 3 only exists if VIRTIO_BALLON_F_FREE_PAGE_HINT set.
+
 \subsection{Feature bits}\label{sec:Device Types / Memory Balloon Device /=
 Feature bits}
 \begin{description}
 \item[VIRTIO_BALLOON_F_MUST_TELL_HOST (0)] Host has to be told before
@@ -4518,6 +4521,10 @@ guest memory statistics to the host.
     memory statistics is present.
 \item[VIRTIO_BALLOON_F_DEFLATE_ON_OOM (2) ] Deflate balloon on
     guest out of memory condition.
+\item[VIRTIO_BALLOON_F_FREE_PAGE_HINT(3) ] Guest reports free memory
+    to host.
+\item[VIRTIO_BALLOON_F_PAGE_POISON(4) ] Guest uses memory poisoning
+    and reports the memory poisoning value to host.
=20
 \end{description}
=20
@@ -4525,6 +4532,14 @@ guest memory statistics to the host.
 The driver SHOULD accept the VIRTIO_BALLOON_F_MUST_TELL_HOST
 feature if offered by the device.
=20
+If the device offers VIRTIO_BALLOON_F_PAGE_POISON, then
+\begin{description}
+\item the driver MUST NOT accept it if the guest is not using memory
+    poisoning.
+\item the driver SHOULD accept it if the guest is using memory
+    poisoning.
+\end{description}
+
 \devicenormative{\subsubsection}{Feature bits}{Device Types / Memory Ballo=
on Device / Feature bits}
 If the device offers the VIRTIO_BALLOON_F_MUST_TELL_HOST feature
 bit, and if the driver did not accept this feature bit, the
@@ -4541,16 +4556,44 @@ allow guest to use memory before notifying host if
 VIRTIO_BALLOON_F_MUST_TELL_HOST is not negotiated.
=20
 \subsection{Device configuration layout}\label{sec:Device Types / Memory B=
alloon Device / Device configuration layout}
-  Both fields of this configuration
-  are always available.
+
+\begin{lstlisting}
+#define VIRTIO_BALLOON_CMD_ID_MIN 0x80000000
+#define VIRTIO_BALLOON_CMD_ID_MAX 0xFFFFFFFF
+#define VIRTIO_BALLOON_CMD_ID_STOP 0x0
+#define VIRTIO_BALLOON_CMD_ID_DONE 0x1
+\end{lstlisting}
=20
 \begin{lstlisting}
 struct virtio_balloon_config {
         le32 num_pages;
         le32 actual;
+        le32 free_page_report_cmd_id;
+        le32 poison_val;
 };
 \end{lstlisting}
=20
+\field{num_pages} and \field{actual} are always available.
+
+\field{free_page_report_cmd_id} is available if
+VIRTIO_BALLON_F_FREE_PAGE_HINT negotiated.
+
+\field{poison_val} is available if VIRTIO_BALLOON_F_PAGE_POISON
+negotiated.
+
+\devicenormative{\subsubsection}{Device configuration layout}{Device Types=
 / Traditional Memory Balloon Device / Device configuration layout}
+
+The device MUST set a legal value to \field{free_page_report_cmd_id}:
+a value between \field{VIRTIO_BALLOON_CMD_ID_MIN} and
+\field{VIRTIO_BALLOON_CMD_ID_MAX} inclusive,
+\field{VIRTIO_BALLOON_CMD_ID_STOP}, or
+\field{VIRTIO_BALLOON_CMD_ID_DONE}.
+
+\drivernormative{\subsubsection}{Device configuration layout}{Device Types=
 / Traditional Memory Balloon Device / Device configuration layout}
+
+The driver MUST write the guest used poison value to
+\field{poison_val} if VIRTIO_BALLOON_F_PAGE_POISON negotiated.
+
 \subparagraph{Legacy Interface: Device configuration layout}\label{sec:Dev=
ice Types / Memory Balloon Device / Device
 configuration layout / Legacy Interface: Device configuration layout}
 When using the legacy interface, transitional devices and drivers
@@ -4574,6 +4617,17 @@ The device initialization process is outlined below:
   \item DRIVER_OK is set: device operation begins.
   \item Notify the device about the stats virtqueue buffer.
   \end{enumerate}
+
+\item If the VIRTIO_BALLOON_F_FREE_PAGE_HINT feature bit is
+  negotiated:
+  \begin{enumerate}
+  \item Identify the free memory virtqueue.
+  \item Set \field{free_page_report_cmd_id} to
+    \field{VIRTIO_BALLOON_CMD_ID_STOP}.
+  \end{enumerate}
+
+\item If the VIRTIO_BALLOON_F_PAGE_POISON feature bit is negotiated,
+  write the guest used poison value to \field{poison_val}.
 \end{enumerate}
=20
 \subsection{Device Operation}\label{sec:Device Types / Memory Balloon Devi=
ce / Device Operation}
@@ -4844,6 +4898,61 @@ first buffer.
   allocations in the guest.
 \end{description}
=20
+\subsubsection{Free Memory Reporting}\label{sec:Device Types / Memory Ball=
oon Device / Device Operation / Free Memory Reporting}
+
+The free memory reporting is driven by the device. The device MAY
+request the driver to start or stop the free memory reporting.
+
+A request to start the free memory reporting proceeds as follows:
+
+\begin{enumerate}
+\item The device updates \field{free_page_report_cmd_id}: if it has
+  reached \field{VIRTIO_BALLOON_CMD_ID_MAX}, resets it to
+  \field{VIRTIO_BALLOON_CMD_ID_MIN}. Otherwise, increments it by 1.
+\item The device sends a configuration change notification to the
+  driver.
+\item The driver reads \field{free_page_report_cmd_id}: if it is not
+  \field{VIRTIO_BALLOON_CMD_ID_STOP},
+  \field{VIRTIO_BALLOON_CMD_ID_DONE}, and different from the value it
+  read last time, start free memory reporting as follows:
+  \begin{enumerate}
+  \item Write the received \field{free_page_report_cmd_id} to a
+    buffer from the free memory virtqueue.
+  \item Write addresses of guest free memory to buffers from the free
+    page virtqueue.
+  \item Write \field{VIRTIO_BALLOON_CMD_ID_STOP} to a buffer from the
+    free memory virtqueue, which signifies that the guest free memory
+    reporting is complete.
+  \end{enumerate}
+    A driver to device notification is sent in the above steps after
+    writing a buffer from the free memory virtqueue if the notification
+    is not suppressed.
+\item The device processes available buffers from the virtqueue and
+  stops the processing after it reads a buffer which stores
+  \field{VIRTIO_BALLOON_CMD_ID_STOP}.
+\end{enumerate}
+
+A request to actively stop the free memory reporting proceeds as
+follows:
+
+\begin{enumerate}
+\item The device sets \field{free_page_report_cmd_id} to
+  \field{VIRTIO_BALLOON_CMD_ID_STOP}, followed by a configuration
+  change notification to the driver if not suppressed.
+\item The driver reads \field{free_page_report_cmd_id} and identifies
+  that it is \field{VIRTIO_BALLOON_CMD_ID_STOP}, then it stops
+  adding buffers to the free memory virtqueue.
+\item The driver writes \field{VIRTIO_BALLOON_CMD_ID_STOP} into a
+  buffer from virtqueue.
+\item The device stops processing the available buffers from the
+  virtqueue after receiving the buffer that stores
+  \field{VIRTIO_BALLOON_CMD_ID_STOP}.
+\end{enumerate}
+
+The device can end the free memory reporting by setting
+\field{free_page_report_cmd_id} to \field{VIRTIO_BALLOON_CMD_ID_DONE},
+followed by a configuration notification to the driver.
+
 \section{SCSI Host Device}\label{sec:Device Types / SCSI Host Device}
=20
 The virtio SCSI host device groups together one or more virtual
--=20
2.7.4


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

