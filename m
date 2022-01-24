Return-Path: <virtio-comment-return-2618-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 672FF986442
	for <virtio-comment@lists.oasis-open.org>; Mon, 24 Jan 2022 12:57:42 +0000 (UTC)
From: David Stevens <stevensd@chromium.org>
Date: Mon, 24 Jan 2022 21:56:25 +0900
Message-Id: <20220124125625.3706347-3-stevensd@chromium.org>
In-Reply-To: <20220124125625.3706347-1-stevensd@chromium.org>
References: <20220124125625.3706347-1-stevensd@chromium.org>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH 2/2] virtio-balloon: add a responsive host feature
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"
To: virtio-comment@lists.oasis-open.org
Cc: David Stevens <stevensd@chromium.org>
List-ID: <virtio-comment.lists.oasis-open.org>

Add a feature bit that the device can use to indicate that it will
monitor and respond to memory pressure in the guest. This flag allows
the driver to assume that the device will provide memory when necessary
and will not permanently remove memory from the guest via inflating the
balloon.

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 content.tex | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/content.tex b/content.tex
index 3aeb319d31a7..dcb2b71a2b6a 100644
--- a/content.tex
+++ b/content.tex
@@ -5451,6 +5451,8 @@ \subsection{Feature bits}\label{sec:Device Types / Me=
mory Balloon Device / Featu
     page reporting. A virtqueue for reporting free guest memory is present=
.
 \item[ VIRTIO_BALLOON_F_EVENT_VQ(6) ] A virtqueue for sending events from
     the driver to the device.
+\item[ VIRTIO_BALLOON_F_RESPONSIVE_HOST(7) ] The device will respond to me=
mory
+    pressure in the guest by deflating the balloon.
=20
 \end{description}
=20
@@ -5471,6 +5473,14 @@ \subsection{Feature bits}\label{sec:Device Types / M=
emory Balloon Device / Featu
 bit, and if the driver did not accept this feature bit, the
 device MAY signal failure by failing to set FEATURES_OK
 \field{device status} bit when the driver writes it.
+
+If the device offers the VIRTIO_BALLOON_F_RESPONSIVE_HOST feature
+bit, it MUST also offer the VIRTIO_BALLOON_F_STATS_VQ and
+VIRTIO_BALLOON_F_EVENT_VQ feature bits. Although the device may not
+always be able to immediately respond to memory pressure in the
+guest, the device SHOULD be able to fully deflate the balloon if
+memory pressure persists in the guest.
+
 \subparagraph{Legacy Interface: Feature bits}\label{sec:Device
 Types / Memory Balloon Device / Feature bits / Legacy Interface:
 Feature bits}
@@ -6087,8 +6097,14 @@ \subsubsection{Events}\label{sec:Device Types / Memo=
ry Balloon Device / Device O
=20
 \devicenormative{\paragraph}{Events}{Device Types / Memory Balloon Device =
/ Device Operation / Events}
=20
-When the device receives a VIRTIO_BALLOON_EVENT_OOM event, it SHOULD defla=
te
-the balloon by \field{data} pages before acknowledging the event.
+If VIRTIO_BALLOON_F_RESPONSIVE_HOST has not been negotiated, when the devi=
ce
+receives a VIRTIO_BALLOON_EVENT_OOM event, it SHOULD deflate the balloon b=
y
+\field{data} pages before acknowledging the event.
+
+If VIRTIO_BALLOON_F_RESPONSIVE_HOST has been negotiated, when the device
+receives a VIRTIO_BALLOON_EVENT_OOM event, it MUST deflate the balloon
+by \field{data} pages before acknowledging the event, unless doing so
+would jeopardize stability of the host.
=20
 \section{SCSI Host Device}\label{sec:Device Types / SCSI Host Device}
=20
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

