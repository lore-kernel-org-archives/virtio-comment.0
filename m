Return-Path: <virtio-comment-return-3076-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 26D0E986546
	for <virtio-comment@lists.oasis-open.org>; Thu, 19 May 2022 08:46:13 +0000 (UTC)
From: Alvaro Karsz <alvaro.karsz@solid-run.com>
Date: Thu, 19 May 2022 11:45:51 +0300
Message-Id: <20220519084551.18119-1-alvaro.karsz@solid-run.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH v3] Introduction of Virtio Network device notifications coalescing feature.
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true
To: virtio-comment@lists.oasis-open.org
Cc: rabeeh@solid-run.com, Alvaro Karsz <alvaro.karsz@solid-run.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Control a network device notifications coalescing parameters using the cont=
rol virtqueue.
A new control class was added: VIRTIO_NET_CTRL_NOTF_COAL.

This class provides 2 commands:
- VIRTIO_NET_CTRL_NOTF_COAL_USECS_SET:
  Ask the network device to change the rx-usecs and tx-usecs parameters.
  rx-usecs - Time to delay an RX notification after packet arrival in micro=
seconds.
  tx-usecs - Time to delay a TX notification after a sending a packet in mi=
croseconds.

- VIRTIO_NET_CTRL_NOTF_COAL_FRAMES_SET:
  Ask the network device to change the rx-max-frames and tx-max-frames para=
meters.
  rx-max-frames - Number of packets to delay an RX notification after packe=
t arrival.
  tx-max-frames - Number of packets to delay a TX notification after sendin=
g a packet.

--
v2:
=09- Usage of notification terminology.
=09- Add a few lines on what device should do when driver asked to
=09  suppress notifications.

v3:
=09- Remove whitespaces.
=09- Explain with examples how the device should act.

--

Signed-off-by: Alvaro Karsz <alvaro.karsz@solid-run.com>
---
 content.tex | 68 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/content.tex b/content.tex
index 7508dd1..b0ee98d 100644
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
@@ -4464,6 +4467,71 @@ \subsubsection{Control Virtqueue}\label{sec:Device T=
ypes / Network Device / Devi
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
+struct virtio_net_ctrl_coal_usec {
+    le32 tx_usecs;
+    le32 rx_usecs;
+};
+
+struct virtio_net_ctrl_coal_frames {
+    le32 tx_frames_max;
+    le32 rx_frames_max;
+};
+
+#define VIRTIO_NET_CTRL_NOTF_COAL 6
+ #define VIRTIO_NET_CTRL_NOTF_COAL_USECS_SET  0
+ #define VIRTIO_NET_CTRL_NOTF_COAL_FRAMES_SET 1
+\end{lstlisting}
+
+The class VIRTIO_NET_CTRL_NOTF_COAL has 2 commands:
+\begin{itemize}
+\item VIRTIO_NET_CTRL_NOTF_COAL_USECS_SET: set the rx-usecs (time to delay=
 an RX notification after frame arrival in microseconds) and tx-usecs (time=
 to delay a TX notification after a sending a frame in microseconds) parame=
ters.
+\item VIRTIO_NET_CTRL_NOTF_COAL_FRAMES_SET: set the rx-max-frames (number =
of frames to delay an RX notification after frame arrival) and tx-max-frame=
s (number of frames to delay a TX notification after sending a frame) param=
eters.
+\end{itemize}
+
+\paragraph{RX notifications}\label{sec:Device Types / Network Device / Dev=
ice Operation / Control Virtqueue / Notifications Coalescing / RX notificat=
ions}
+
+If, for example, rx_usecs =3D 10 and rx_frames_max =3D 15.
+
+\begin{itemize}
+\item The device will count received frames until it accumulates 15 frames=
, or until 10 usecs elapsed since the arrival of the first frame.
+\item The device will check if at least one descriptor was used from the d=
escriptor area, if not, it will continue to accumulate frames until one des=
criptor is used.\\
+An example is if any of the VIRTIO_NET_F_GUEST_TSO/UFO features are negoti=
ated, a device could receive more than 15 frames, and write all in the same=
 buffer.
+\item The device will reset its internal coalescing counters.
+\item The device will send a notification to the driver only if the driver=
 hasn't suppressed notifications.
+\end{itemize}
+
+
+\paragraph{TX notifications}\label{sec:Device Types / Network Device / Dev=
ice Operation / Control Virtqueue / Notifications Coalescing / TX notificat=
ions}
+
+If, for example, tx_usecs =3D 10 and tx_frames_max =3D 15.
+
+\begin{itemize}
+\item The device will count sent frames until it accumulates 15 frames, or=
 until 10 usecs elapsed since first frame was sent.
+\item The device will check if at least one descriptor was used from the d=
escriptor area, if not, it will continue to accumulate frames until one des=
criptor is used.\\
+An example is if any of the VIRTIO_NET_F_HOST_TSO/UFO features are negotia=
ted, a device could receive a big buffer, which will take more than 15 fram=
es to send.
+\item The device will reset its internal coalescing counters.
+\item The device will send a notification to the driver only if the driver=
 hasn't suppressed notifications.
+\end{itemize}
+
+\drivernormative{\subparagraph}{Notifications Coalescing}{Device Types / N=
etwork Device / Device Operation / Control Virtqueue / Notifications Coales=
cing}
+
+
+If the VIRTIO_NET_F_NOTF_COAL feature has not been negotiated, the driver =
MUST NOT issue VIRTIO_NET_CTRL_NOTF_COAL commands.
+
+\devicenormative{\subparagraph}{Notifications Coalescing}{Device Types / N=
etwork Device / Device Operation / Control Virtqueue / Notifications Coales=
cing}
+
+A device SHOULD respond to the VIRTIO_NET_CTRL_NOTF_COAL commands with VIR=
TIO_NET_ERR if was not able to change the parameters.\\ \\
+A device MUST NOT accept tx_frames_max/rx_frames_max values bigger than th=
e queue size.\\ \\
+A device SHOULD NOT send notifications to the driver, if the driver asked =
to suppress notifications.\\ \\
+A device SHOULD initialize all coalescing values to 0. \\ \\
+
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

