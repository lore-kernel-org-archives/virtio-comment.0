Return-Path: virtio-comment-return-845-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 36F5C985DC0
	for <virtio-comment@lists.oasis-open.org>; Tue, 17 Sep 2019 07:18:08 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
Date: Tue, 17 Sep 2019 09:18:03 +0200
Message-Id: <20190917071803.446-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH] virtio-blk: typo: Capitalization in Device Initialization item
To: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 content.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/content.tex b/content.tex
index 37a2190..2d33c7b 100644
--- a/content.tex
+++ b/content.tex
@@ -3969,7 +3969,7 @@ \subsection{Device Initialization}\label{sec:Device Types / Block Device / Devic
     segments for the block driver to use. \field{discard_sector_alignment}
     can be used by OS when splitting a request based on alignment.
 
-\item if the VIRTIO_BLK_F_WRITE_ZEROES feature is negotiated,
+\item If the VIRTIO_BLK_F_WRITE_ZEROES feature is negotiated,
     \field{max_write_zeroes_sectors} and \field{max_write_zeroes_seg} can
     be read to determine the maximum write zeroes sectors and maximum
     number of write zeroes segments for the block driver to use.
-- 
2.16.5


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

