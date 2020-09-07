Return-Path: virtio-comment-return-1446-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 148759844F2
	for <virtio-comment@lists.oasis-open.org>; Mon,  7 Sep 2020 01:52:04 +0000 (UTC)
From: Jie Deng <jie.deng@intel.com>
Date: Mon,  7 Sep 2020 09:51:53 +0800
Message-Id: <bac6805b1dd346d655df2c9a946f897fc5876216.1599442886.git.jie.deng@intel.com>
Subject: [virtio-comment] [PATCH] content: Reserve device ID 34 for I2C adapter
Content-Type: text/plain; charset=US-ASCII
To: virtio-comment@lists.oasis-open.org
Cc: mst@redhat.com, Jie Deng <jie.deng@intel.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Request the ID 34 for I2C adapter.

Signed-off-by: Jie Deng <jie.deng@intel.com>
---
 content.tex | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/content.tex b/content.tex
index bc26674..91855b4 100644
--- a/content.tex
+++ b/content.tex
@@ -2819,6 +2819,8 @@ \chapter{Device Types}\label{sec:Device Types}
 \hline
 33         &   NitroSecureModule \\
 \hline
+34         &   I2C adapter \\
+\hline
 \end{tabular}
 
 Some of the devices above are unspecified by this document,
-- 
2.7.4


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

