Return-Path: <virtio-comment-return-3114-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AA0719865B9
	for <virtio-comment@lists.oasis-open.org>; Thu,  9 Jun 2022 14:00:23 +0000 (UTC)
From: Alvaro Karsz <alvaro.karsz@solid-run.com>
Date: Thu,  9 Jun 2022 17:00:15 +0300
Message-Id: <20220609140015.3061361-1-alvaro.karsz@solid-run.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH v6] Introduction of Virtio Network device notifications coalescing feature.
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true
To: virtio-comment@lists.oasis-open.org
Cc: rabeeh@solid-run.com, Alvaro Karsz <alvaro.karsz@solid-run.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Control a network device notifications coalescing parameters using the cont=
rol virtqueue.
A new control class was added: VIRTIO_NET_CTRL_NOTF_COAL.

This class provides 2 commands:
- VIRTIO_NET_CTRL_NOTF_COAL_TX_SET:
  Ask the network device to change the tx_usecs and tx_max_packets paramete=
rs.
  - tx_usecs: How many usecs to delay an TX notification after a packet is =
sent.
  - tx_max_packets: Maximum number of packets to send before an TX notifica=
tion.

- VIRTIO_NET_CTRL_NOTF_COAL_RX_SET:
  Ask the network device to change the rx_usecs and rx_max_packets paramete=
rs.
  - rx_usecs: How many usecs to delay an RX notification after a packet arr=
ives.
  - rx_max_packets: Maximum number of packets to receive before an RX notif=
ication.

--

v2:
=09- Usage of notification terminology.
=09- Add a few lines on what device should do when driver asked to
=09  suppress notifications.

v3:
=09- Remove whitespaces.
=09- Explain with examples how the device should act.

v4:
=09- Example of a scenarion when VIRTIO_F_EVENT_IDX is negotiated.
=09- Usage of separate commands for RX coalescing and TX  coalescing.

v5:
=09- Usage of subparagraphs.
=09- Add driver requirements and device requirements references in conforma=
nce.tex.

v6:
=09- LaTex formatting fixes.
=09- Clarify the meaning of every coalescing parameter.
=09- Usage of packets terminology instead of used buffers.
--

Signed-off-by: Alvaro Karsz <alvaro.karsz@solid-run.com>
---
 conformance.tex |   2 +
 content.tex     | 103 ++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 105 insertions(+)

diff --git a/conformance.tex b/conformance.tex
index 663e7c3..c9ccc89 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -149,6 +149,7 @@ \section{Conformance Targets}\label{sec:Conformance / C=
onformance Targets}
 \item \ref{drivernormative:Device Types / Network Device / Device Operatio=
n / Control Virtqueue / Automatic receive steering in multiqueue mode}
 \item \ref{drivernormative:Device Types / Network Device / Device Operatio=
n / Control Virtqueue / Offloads State Configuration / Setting Offloads Sta=
te}
 \item \ref{drivernormative:Device Types / Network Device / Device Operatio=
n / Control Virtqueue / Receive-side scaling (RSS) }
+\item \ref{drivernormative:Device Types / Network Device / Device Operatio=
n / Control Virtqueue / Notifications Coalescing}
 \end{itemize}
=20
 \conformance{\subsection}{Block Driver Conformance}\label{sec:Conformance =
/ Driver Conformance / Block Driver Conformance}
@@ -411,6 +412,7 @@ \section{Conformance Targets}\label{sec:Conformance / C=
onformance Targets}
 \item \ref{devicenormative:Device Types / Network Device / Device Operatio=
n / Control Virtqueue / Gratuitous Packet Sending}
 \item \ref{devicenormative:Device Types / Network Device / Device Operatio=
n / Control Virtqueue / Automatic receive steering in multiqueue mode}
 \item \ref{devicenormative:Device Types / Network Device / Device Operatio=
n / Control Virtqueue / Receive-side scaling (RSS) / RSS processing}
+\item \ref{devicenormative:Device Types / Network Device / Device Operatio=
n / Control Virtqueue / Notifications Coalescing}
 \end{itemize}
=20
 \conformance{\subsection}{Block Device Conformance}\label{sec:Conformance =
/ Device Conformance / Block Device Conformance}
diff --git a/content.tex b/content.tex
index 7508dd1..f5447a7 100644
--- a/content.tex
+++ b/content.tex
@@ -3084,6 +3084,8 @@ \subsection{Feature bits}\label{sec:Device Types / Ne=
twork Device / Feature bits
 \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
     channel.
=20
+\item[VIRTIO_NET_F_NOTF_COAL(55)] Device supports notifications coalescing=
.
+
 \item[VIRTIO_NET_F_HOST_USO (56)] Device can receive USO packets. Unlike U=
FO
  (fragmenting the packet) the USO splits large UDP packet
  to several segments when each of these smaller packets has UDP header.
@@ -3129,6 +3131,7 @@ \subsubsection{Feature bit requirements}\label{sec:De=
vice Types / Network Device
 \item[VIRTIO_NET_F_GUEST_ANNOUNCE] Requires VIRTIO_NET_F_CTRL_VQ.
 \item[VIRTIO_NET_F_MQ] Requires VIRTIO_NET_F_CTRL_VQ.
 \item[VIRTIO_NET_F_CTRL_MAC_ADDR] Requires VIRTIO_NET_F_CTRL_VQ.
+\item[VIRTIO_NET_F_NOTF_COAL] Requires VIRTIO_NET_F_CTRL_VQ.
 \item[VIRTIO_NET_F_RSC_EXT] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_NET_=
F_HOST_TSO6.
 \item[VIRTIO_NET_F_RSS] Requires VIRTIO_NET_F_CTRL_VQ.
 \end{description}
@@ -4464,6 +4467,106 @@ \subsubsection{Control Virtqueue}\label{sec:Device =
Types / Network Device / Devi
 (necessarily when not using the legacy interface) little-endian.
=20
=20
+\paragraph{Notifications Coalescing}\label{sec:Device Types / Network Devi=
ce / Device Operation / Control Virtqueue / Notifications Coalescing}
+
+If the VIRTIO_NET_F_NOTF_COAL feature is negotiated, the driver can
+send control commands for dynamically changing the coalescing parameters.
+
+\begin{lstlisting}
+struct virtio_net_ctrl_coal_rx {
+    le32 rx_max_packets;
+    le32 rx_usecs;
+};
+
+struct virtio_net_ctrl_coal_tx {
+    le32 tx_max_packets;
+    le32 tx_usecs;
+};
+
+#define VIRTIO_NET_CTRL_NOTF_COAL 6
+ #define VIRTIO_NET_CTRL_NOTF_COAL_TX_SET  0
+ #define VIRTIO_NET_CTRL_NOTF_COAL_RX_SET 1
+\end{lstlisting}
+
+Coalescing parameters:
+\begin{itemize}
+\item \field{rx_usecs}: How many usecs to delay an RX notification after a=
 packet arrives.
+\item \field{tx_usecs}: How many usecs to delay an TX notification after a=
 packet is sent.
+\item \field{rx_max_packets}: Maximum number of packets to receive before =
an RX notification.
+\item \field{tx_max_packets}: Maximum number of packets to send before an =
TX notification.
+\end{itemize}
+
+
+The class VIRTIO_NET_CTRL_NOTF_COAL has 2 commands:
+\begin{enumerate}
+\item VIRTIO_NET_CTRL_NOTF_COAL_TX_SET: set the \field{tx_usecs} and \fiel=
d{tx_max_packets} parameters.
+\item VIRTIO_NET_CTRL_NOTF_COAL_RX_SET: set the \field{rx_usecs} and \fiel=
d{rx_max_packets} parameters.
+\end{enumerate}
+
+\subparagraph{RX Notifications}\label{sec:Device Types / Network Device / =
Device Operation / Control Virtqueue / Notifications Coalescing / RX Notifi=
cations}
+
+If, for example:
+\begin{itemize}
+\item \field{rx_usecs} =3D 10.
+\item \field{rx_max_packets} =3D 15.
+\end{itemize}
+
+The device will operate as follows:
+
+\begin{itemize}
+\item The device will count received packets until it accumulates 15, or u=
ntil 10 usecs elapsed since the first one arrived.
+\item If the nofitications are not suppressed by the driver, the device wi=
ll send a notification, otherwise, the device will not send a notification.
+\end{itemize}
+
+Note: If VIRTIO_NET_F_MRG_RXBUF feature is negotiated, all merged buffers =
together count as one packet.
+
+\subparagraph{TX Notifications}\label{sec:Device Types / Network Device / =
Device Operation / Control Virtqueue / Notifications Coalescing / TX Notifi=
cations}
+
+If, for example:
+\begin{itemize}
+\item \field{tx_usecs} =3D 10.
+\item \field{tx_max_packets} =3D 15.
+\end{itemize}
+
+The device will operate as follows:
+
+\begin{itemize}
+\item The device will count sent packets until it accumulates 15, or until=
 10 usecs elapsed since the first one was sent.
+\item If the nofitications are not suppressed by the driver, the device wi=
ll send a notification, otherwise, the device will not send a notification.
+\end{itemize}
+
+Note: A chain of buffers, chained by the driver using the \field{next} fla=
g, count as one packet.
+
+\subparagraph{Coalescing and Notifications Suppression}\label{sec:Device T=
ypes / Network Device / Device Operation / Control Virtqueue / Notification=
s Coalescing / Coalescing and Notifications Suppression}
+
+If the driver sets the VIRTQ_AVAIL_F_NO_INTERRUPT flag, the device should =
not send notifications to the driver.
+In this case, the device will increase the coalescing counters until the f=
lag is cleared, and only then the device will send a notification and clear=
 the coalescing counters.
+
+If the VIRTIO_F_EVENT_IDX feature is negotiated, and \field{used_event} fi=
eld is set, the device will send a notification only after \field{used_even=
t} index is reached, even if the coalescing counters expired before.
+
+For example:
+\begin{itemize}
+\item \field{rx_usecs} =3D 10.
+\item \field{rx_max_packets} =3D 7.
+\item \field{used_event} =3D 5.
+\item Current virtqueue location is 0.
+\end{itemize}
+
+If the timer elapses before the \#5 packet arrives, the device will send a=
 notification only after the \#5 packet arrives.
+If the \#5 packet arrives before the timer elapses, the device will send a=
 notification after the \#7 packet arrives, or after the timer elapses, whi=
chever occurs first.
+
+\drivernormative{\subparagraph}{Notifications Coalescing}{Device Types / N=
etwork Device / Device Operation / Control Virtqueue / Notifications Coales=
cing}
+
+If the VIRTIO_NET_F_NOTF_COAL feature has not been negotiated, the driver =
MUST NOT issue VIRTIO_NET_CTRL_NOTF_COAL commands.
+
+\devicenormative{\subparagraph}{Notifications Coalescing}{Device Types / N=
etwork Device / Device Operation / Control Virtqueue / Notifications Coales=
cing}
+
+A device SHOULD respond to the VIRTIO_NET_CTRL_NOTF_COAL commands with VIR=
TIO_NET_ERR if it was not able to change the parameters.
+
+A device SHOULD NOT send notifications to the driver, if the notifications=
 are suppressed.
+
+Upon reset, a device MUST initialize all coalescing parameters to 0.
+
 \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
 Types / Network Device / Legacy Interface: Framing Requirements}
=20
--=20
2.32.0


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

