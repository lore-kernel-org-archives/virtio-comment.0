Return-Path: <virtio-comment-return-3474-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 05AC09862D3
	for <virtio-comment@lists.oasis-open.org>; Mon, 21 Nov 2022 09:04:38 +0000 (UTC)
From: Cyril Germond <cgermond@kalray.eu>
Date: Mon, 21 Nov 2022 10:02:12 +0100
Message-ID: <20221121090212.645-1-cgermond@kalray.eu>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH] virtio-net: Fix virtio_net_hdr struct size when
 VIRTIO_NET_F_HASH_REPORT is negotiated.
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: Cyril Germond <cgermond@kalray.eu>
List-ID: <virtio-comment.lists.oasis-open.org>

Hard-coded references to the size of virtio_net_hdr strut are wrong when
VIRTIO_NET_HASH_REPORT feature is negotiated.

Changelog:
v1->v2: Fixed wording syntax
v2->v3: Rebase

Signed-off-by: Cyril Germond <cgermond@kalray.eu>
---
 content.tex    | 10 ++++++----
 split-ring.tex |  3 ++-
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/content.tex b/content.tex
index 91ba76c..61bc09c 100644
--- a/content.tex
+++ b/content.tex
@@ -3622,8 +3622,8 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:=
Device Types / Network Devi
 features are used, the maximum incoming packet
 will be to 65550 bytes long (the maximum size of a
 TCP or UDP packet, plus the 14 byte ethernet header), otherwise
-1514 bytes.  The 12-byte struct virtio_net_hdr is prepended to this,
-making for 65562 or 1526 bytes.
+1514 bytes.  The struct virtio_net_hdr (the length of which depends on VIR=
TIO_NET_F_HASH_REPORT
+feature negotiation) is prepended to this.
=20
 \drivernormative{\paragraph}{Setting Up Receive Buffers}{Device Types / Ne=
twork Device / Device Operation / Setting Up Receive Buffers}
=20
@@ -3632,9 +3632,11 @@ \subsubsection{Setting Up Receive Buffers}\label{sec=
:Device Types / Network Devi
   \begin{itemize}
     \item If VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6, VIRTIO_NET_=
F_GUEST_UFO,
 =09VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6 are negotiated, the =
driver SHOULD populate
-      the receive queue(s) with buffers of at least 65562 bytes.
+      the receive queue(s) with buffers of at least 65570 bytes
+      if VIRTIO_NET_F_HASH_REPORT is negotiated, 65562 bytes otherwise.
     \item Otherwise, the driver SHOULD populate the receive queue(s)
-      with buffers of at least 1526 bytes.
+      with buffers of at least 1534 bytes if VIRTIO_NET_F_HASH_REPORT
+      is negotiated, 1526 bytes otherwise.
   \end{itemize}
 \item If VIRTIO_NET_F_MRG_RXBUF is negotiated, each buffer MUST be at
 least the size of the struct virtio_net_hdr.
diff --git a/split-ring.tex b/split-ring.tex
index de94038..82e910f 100644
--- a/split-ring.tex
+++ b/split-ring.tex
@@ -127,7 +127,8 @@ \subsection{Legacy Interfaces: A Note on Virtqueue Endi=
anness}\label{sec:Basic F
=20
 \subsection{Message Framing}\label{sec:Basic Facilities of a Virtio Device=
 / Virtqueues / Message Framing}
 The framing of messages with descriptors is
-independent of the contents of the buffers. For example, a network
+independent of the contents of the buffers. For example, if
+VIRTIO_NET_F_HASH_REPORT has not been negotiated, a network
 transmit buffer consists of a 12 byte header followed by the network
 packet. This could be most simply placed in the descriptor table as a
 12 byte output descriptor followed by a 1514 byte output descriptor,
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

