Return-Path: virtio-comment-return-1629-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 59641985E33
	for <virtio-comment@lists.oasis-open.org>; Tue, 12 Jan 2021 09:16:47 +0000 (UTC)
From: Laura Loghin <lauralg@amazon.com>
Date: Tue, 12 Jan 2021 11:16:11 +0200
Message-ID: <20210112091611.19469-1-lauralg@amazon.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH] virtio-blk: clarify descriptor-segment relation
Content-Type: text/plain
To: virtio-comment@lists.oasis-open.org
Cc: Laura Loghin <lauralg@amazon.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Regarding the relation between data descriptors and segments, the
commit that added discard and write zeroes to the spec, stated that
the idea is "using 16 Bytes payload to support 1 descriptor" (not, for
example, 32 bytes). There wasn't any mention in the spec about one data
descriptor corresponding to exactly one segment. Added this constraint
to block documentation.

Signed-off-by: Laura Loghin <lauralg@amazon.com>
---
 content.tex | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/content.tex b/content.tex
index 620c0e2..6393b68 100644
--- a/content.tex
+++ b/content.tex
@@ -4599,8 +4599,9 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
 of 512 bytes).
 
 The \field{data} used for discard or write zeroes commands consists of one or
-more segments.  The maximum number of segments is \field{max_discard_seg} for
-discard commands and \field{max_write_zeroes_seg} for write zeroes commands.
+more segments, and one data descriptor corresponds to exactly one such segment.
+The maximum number of segments is \field{max_discard_seg} for discard commands
+and \field{max_write_zeroes_seg} for write zeroes commands.
 Each segment is of form:
 
 \begin{lstlisting}
-- 
2.17.1




Amazon Development Center (Romania) S.R.L. registered office: 27A Sf. Lazar Street, UBC5, floor 2, Iasi, Iasi County, 700045, Romania. Registered in Romania. Registration number J22/2621/2005.


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

