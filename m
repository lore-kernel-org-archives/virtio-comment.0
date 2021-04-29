Return-Path: virtio-comment-return-1839-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9C899986295
	for <virtio-comment@lists.oasis-open.org>; Thu, 29 Apr 2021 23:10:27 +0000 (UTC)
From: Joel Nider <joel@nider.org>
Date: Thu, 29 Apr 2021 16:10:16 -0700
Message-Id: <20210429231016.561553-1-joel@nider.org>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH] Update VIRTIO_F_EVENT_IDX throughout
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"
To: virtio-comment@lists.oasis-open.org
Cc: Joel Nider <joel@nider.org>
List-ID: <virtio-comment.lists.oasis-open.org>

This flag has been called by many names in the past
(VIRTIO_RING_F_EVENT_IDX, VIRTIO_F_RING_EVENT_IDX) and there are
just a few stragglers left to clean up.

Signed-off-by: Joel Nider <joel@nider.org>
---
 content.tex     | 2 +-
 packed-ring.tex | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/content.tex b/content.tex
index 9232d5c..5a803dc 100644
--- a/content.tex
+++ b/content.tex
@@ -6581,7 +6581,7 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Fe=
ature Bits}
 Descriptors}~\nameref{sec:Basic Facilities of a Virtio Device /
 Virtqueues / The Virtqueue Descriptor Table / Indirect
 Descriptors} and \ref{sec:Packed Virtqueues / Indirect Flag: Scatter-Gathe=
r Support}~\nameref{sec:Packed Virtqueues / Indirect Flag: Scatter-Gather S=
upport}.
-  \item[VIRTIO_F_RING_EVENT_IDX(29)] This feature enables the \field{used_=
event}
+  \item[VIRTIO_F_EVENT_IDX(29)] This feature enables the \field{used_event=
}
   and the \field{avail_event} fields as described in
 \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Used Buffer No=
tification Suppression}, \ref{sec:Basic Facilities of a Virtio Device / Vir=
tqueues / The Virtqueue Used Ring} and \ref{sec:Packed Virtqueues / Driver =
and Device Event Suppression}.
=20
diff --git a/packed-ring.tex b/packed-ring.tex
index ea92543..a9e6c16 100644
--- a/packed-ring.tex
+++ b/packed-ring.tex
@@ -336,7 +336,7 @@ \subsection{Driver and Device Event Suppression}
 /*
  * Enable events for a specific descriptor
  * (as specified by Descriptor Ring Change Event Offset/Wrap Counter).
- * Only valid if VIRTIO_F_RING_EVENT_IDX has been negotiated.
+ * Only valid if VIRTIO_F_EVENT_IDX has been negotiated.
  */
 #define RING_EVENT_FLAGS_DESC 0x2
 /* The value 0x3 is reserved */
@@ -597,7 +597,7 @@ \subsubsection{Implementation Example}\label{sec:Basic =
Facilities of a Virtio De
=20
 Below is a driver code example. It does not attempt to reduce
 the number of available buffer notifications, neither does it support
-the VIRTIO_F_RING_EVENT_IDX feature.
+the VIRTIO_F_EVENT_IDX feature.
=20
 \begin{lstlisting}
 /* Note: vq->avail_wrap_count is initialized to 1 */
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

