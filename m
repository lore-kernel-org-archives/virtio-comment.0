Return-Path: <virtio-comment-return-2313-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E0FE2986442
	for <virtio-comment@lists.oasis-open.org>; Tue, 12 Oct 2021 15:25:42 +0000 (UTC)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Tue, 12 Oct 2021 18:25:29 +0300
Message-Id: <20211012152529.89091-1-yuri.benditovich@daynix.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH] virtio-net: define guest USO features
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"
To: virtio-comment@lists.oasis-open.org
Cc: yan@daynix.com
List-ID: <virtio-comment.lists.oasis-open.org>

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/120

Add definition for large UDP packets device-to-driver.

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
---
 content.tex | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/content.tex b/content.tex
index 5e71672..a13aa8a 100644
--- a/content.tex
+++ b/content.tex
@@ -2967,6 +2967,10 @@ \subsection{Feature bits}\label{sec:Device Types / N=
etwork Device / Feature bits
 \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
     channel.
=20
+\item[VIRTIO_NET_F_GUEST_USO4 (54)] Driver can receive USOv4 packets.
+
+\item[VIRTIO_NET_F_GUEST_USO6 (55)] Driver can receive USOv6 packets.
+
 \item[VIRTIO_NET_F_HOST_USO (56)] Device can receive USO packets. Unlike U=
FO
  (fragmenting the packet) the USO splits large UDP packet
  to several segments when each of these smaller packets has UDP header.
@@ -3000,6 +3004,8 @@ \subsubsection{Feature bit requirements}\label{sec:De=
vice Types / Network Device
 \item[VIRTIO_NET_F_GUEST_TSO6] Requires VIRTIO_NET_F_GUEST_CSUM.
 \item[VIRTIO_NET_F_GUEST_ECN] Requires VIRTIO_NET_F_GUEST_TSO4 or VIRTIO_N=
ET_F_GUEST_TSO6.
 \item[VIRTIO_NET_F_GUEST_UFO] Requires VIRTIO_NET_F_GUEST_CSUM.
+\item[VIRTIO_NET_F_GUEST_USO4] Requires VIRTIO_NET_F_GUEST_CSUM.
+\item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM.
=20
 \item[VIRTIO_NET_F_HOST_TSO4] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_TSO6] Requires VIRTIO_NET_F_CSUM.
@@ -3220,8 +3226,8 @@ \subsection{Device Initialization}\label{sec:Device T=
ypes / Network Device / Dev
    The VIRTIO_NET_F_GUEST_CSUM feature indicates that partially
   checksummed packets can be received, and if it can do that then
   the VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6,
-  VIRTIO_NET_F_GUEST_UFO and VIRTIO_NET_F_GUEST_ECN are the input
-  equivalents of the features described above.
+  VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_GUEST_USO4
+  and VIRTIO_NET_F_GUEST_USO6 are the input equivalents of the features de=
scribed above.
   See \ref{sec:Device Types / Network Device / Device Operation /
 Setting Up Receive Buffers}~\nameref{sec:Device Types / Network
 Device / Device Operation / Setting Up Receive Buffers} and
@@ -3489,8 +3495,9 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:=
Device Types / Network Devi
 fully populated as possible: if it runs out, network performance
 will suffer.
=20
-If the VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6 or
-VIRTIO_NET_F_GUEST_UFO features are used, the maximum incoming packet
+If the VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6,
+VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6
+features are used, the maximum incoming packet
 will be to 65550 bytes long (the maximum size of a
 TCP or UDP packet, plus the 14 byte ethernet header), otherwise
 1514 bytes.  The 12-byte struct virtio_net_hdr is prepended to this,
@@ -3501,8 +3508,8 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:=
Device Types / Network Devi
 \begin{itemize}
 \item If VIRTIO_NET_F_MRG_RXBUF is not negotiated:
   \begin{itemize}
-    \item If VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6 or
-      VIRTIO_NET_F_GUEST_UFO are negotiated, the driver SHOULD populate
+    \item If VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6, VIRTIO_NET_=
F_GUEST_UFO,
+=09VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6 are negotiated, the =
driver SHOULD populate
       the receive queue(s) with buffers of at least 65562 bytes.
     \item Otherwise, the driver SHOULD populate the receive queue(s)
       with buffers of at least 1526 bytes.
@@ -3571,7 +3578,7 @@ \subsubsection{Processing of Incoming Packets}\label{=
sec:Device Types / Network
 in \ref{sec:Device Types / Network Device / Device Operation /
 Packet Transmission}:
 \begin{enumerate}
-\item If the VIRTIO_NET_F_GUEST_TSO4, TSO6 or UFO options were
+\item If the VIRTIO_NET_F_GUEST_TSO4, TSO6, UFO, USO4 or USO6 options were
   negotiated, then \field{gso_type} MAY be something other than
   VIRTIO_NET_HDR_GSO_NONE, and \field{gso_size} field indicates the
   desired MSS (see Packet Transmission point 2).
@@ -3630,6 +3637,9 @@ \subsubsection{Processing of Incoming Packets}\label{=
sec:Device Types / Network
 If VIRTIO_NET_F_GUEST_TSO6 is not negotiated, the device MUST NOT set
 \field{gso_type} to VIRTIO_NET_HDR_GSO_TCPV6.
=20
+If none of VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6 have been ne=
gotiated,
+the device MUST NOT set \field{gso_type} to VIRTIO_NET_HDR_GSO_UDP_L4.
+
 The device SHOULD NOT send to the driver TCP packets requiring segmentatio=
n offload
 which have the Explicit Congestion Notification bit set, unless the
 VIRTIO_NET_F_GUEST_ECN feature is negotiated, in which case the
@@ -3653,7 +3663,7 @@ \subsubsection{Processing of Incoming Packets}\label{=
sec:Device Types / Network
 =09fully checksummed packet;
 \end{enumerate}
=20
-If none of the VIRTIO_NET_F_GUEST_TSO4, TSO6 or UFO options have
+If none of the VIRTIO_NET_F_GUEST_TSO4, TSO6, UFO, USO4 or USO6 options ha=
ve
 been negotiated, the device MUST set \field{gso_type} to
 VIRTIO_NET_HDR_GSO_NONE.
=20
@@ -3668,7 +3678,7 @@ \subsubsection{Processing of Incoming Packets}\label{=
sec:Device Types / Network
 If VIRTIO_NET_F_RSC_EXT was not negotiated, the device MUST
 not set VIRTIO_NET_HDR_F_RSC_INFO bit in \field{flags}.
=20
-If one of the VIRTIO_NET_F_GUEST_TSO4, TSO6 or UFO options have
+If one of the VIRTIO_NET_F_GUEST_TSO4, TSO6, UFO, USO4 or USO6 options hav=
e
 been negotiated, the device SHOULD set \field{hdr_len} to a value
 not less than the length of the headers, including the transport
 header.
@@ -3689,7 +3699,7 @@ \subsubsection{Processing of Incoming Packets}\label{=
sec:Device Types / Network
 if VIRTIO_NET_HDR_F_RSC_INFO bit \field{flags} is set, the
 driver MUST NOT use the \field{csum_start} and \field{csum_offset}.
=20
-If one of the VIRTIO_NET_F_GUEST_TSO4, TSO6 or UFO options have
+If one of the VIRTIO_NET_F_GUEST_TSO4, TSO6, UFO, USO4 or USO6 options hav=
e
 been negotiated, the driver MAY use \field{hdr_len} only as a hint about t=
he
 transport header size.
 The driver MUST NOT rely on \field{hdr_len} to be correct.
@@ -4320,6 +4330,8 @@ \subsubsection{Control Virtqueue}\label{sec:Device Ty=
pes / Network Device / Devi
 #define VIRTIO_NET_F_GUEST_TSO6       8
 #define VIRTIO_NET_F_GUEST_ECN        9
 #define VIRTIO_NET_F_GUEST_UFO        10
+#define VIRTIO_NET_F_GUEST_USO4       54
+#define VIRTIO_NET_F_GUEST_USO6       55
=20
 #define VIRTIO_NET_CTRL_GUEST_OFFLOADS       5
  #define VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET   0
--=20
2.25.1


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

