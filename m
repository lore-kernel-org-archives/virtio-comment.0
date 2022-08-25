Return-Path: <virtio-comment-return-3408-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 53B059864B9
	for <virtio-comment@lists.oasis-open.org>; Thu, 25 Aug 2022 12:18:54 +0000 (UTC)
From: Cyril Germond <cgermond@kalray.eu>
Date: Thu, 25 Aug 2022 14:18:07 +0200
Message-ID: <20220825121807.348-1-cgermond@kalray.eu>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH] Fix virtio_net_hdr struct size when
 VIRTIO_NET_F_HASH_REPORT is negociated.
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: Cyril Germond <cgermond@kalray.eu>
List-ID: <virtio-comment.lists.oasis-open.org>

Hard-coded references to the size of virtio_net_hdr strut are wrong when
VIRTIO_NET_HASH_REPORT feature is negociated.
Signed-off-by: Cyril Germond <cgermond@kalray.eu>
---
 content.tex    | 3 +--
 split-ring.tex | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/content.tex b/content.tex
index e863709..b900f35 100644
--- a/content.tex
+++ b/content.tex
@@ -3620,8 +3620,7 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:=
Device Types / Network Devi
 features are used, the maximum incoming packet
 will be to 65550 bytes long (the maximum size of a
 TCP or UDP packet, plus the 14 byte ethernet header), otherwise
-1514 bytes.  The 12-byte struct virtio_net_hdr is prepended to this,
-making for 65562 or 1526 bytes.
+1514 bytes.  The struct virtio_net_hdr (which length depends on VIRTIO_NET=
_F_HASH_REPORT feature negotiation) is prepended to this.
=20
 \drivernormative{\paragraph}{Setting Up Receive Buffers}{Device Types / Ne=
twork Device / Device Operation / Setting Up Receive Buffers}
=20
diff --git a/split-ring.tex b/split-ring.tex
index de94038..9487918 100644
--- a/split-ring.tex
+++ b/split-ring.tex
@@ -127,7 +127,7 @@ \subsection{Legacy Interfaces: A Note on Virtqueue Endi=
anness}\label{sec:Basic F
=20
 \subsection{Message Framing}\label{sec:Basic Facilities of a Virtio Device=
 / Virtqueues / Message Framing}
 The framing of messages with descriptors is
-independent of the contents of the buffers. For example, a network
+independent of the contents of the buffers. For example, if VIRTIO_NET_F_H=
ASH_REPORT has not been negotiated, a network
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

