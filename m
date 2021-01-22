Return-Path: virtio-comment-return-1658-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 54682986560
	for <virtio-comment@lists.oasis-open.org>; Fri, 22 Jan 2021 10:25:13 +0000 (UTC)
From: Felipe Franciosi <felipe@nutanix.com>
Date: Fri, 22 Jan 2021 10:25:02 +0000
Message-Id: <20210122102502.90036-1-felipe@nutanix.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH] content: Fix driver/device wording on ISR bits
Content-Type: text/plain
To: virtio-comment@lists.oasis-open.org
Cc: mst@redhat.com, Felipe Franciosi <felipe@nutanix.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Section "ISR status capability" incorrectly worded that the bits part of
the register allows the device to distinguish between interrupt types.
It is the driver that needs access to that distinction, not the device.

Signed-off-by: Felipe Franciosi <felipe@nutanix.com>
---
 content.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/content.tex b/content.tex
index 620c0e2..17f0540 100644
--- a/content.tex
+++ b/content.tex
@@ -1054,7 +1054,7 @@ \subsubsection{ISR status capability}\label{sec:Virtio Transport Options / Virti
 
 The \field{offset} for the \field{ISR status} has no alignment requirements.
 
-The ISR bits allow the device to distinguish between device-specific configuration
+The ISR bits allow the driver to distinguish between device-specific configuration
 change interrupts and normal virtqueue interrupts:
 
 \begin{tabular}{ |l||l|l|l| }
-- 
2.18.4


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

