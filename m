Return-Path: virtio-comment-return-1870-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 177B9986292
	for <virtio-comment@lists.oasis-open.org>; Tue,  1 Jun 2021 17:22:13 +0000 (UTC)
From: Jiang Wang <jiang.wang@bytedance.com>
Date: Tue,  1 Jun 2021 17:21:39 +0000
Message-Id: <20210601172139.3725854-1-jiang.wang@bytedance.com>
Subject: [virtio-comment] [PATCH v2] virtio-net: fix a display for num_buffers
Content-Type: text/plain; charset="US-ASCII"
To: virtio-comment@lists.oasis-open.org, cohuck@redhat.com
Cc: Jiang Wang <jiang.wang@bytedance.com>
List-ID: <virtio-comment.lists.oasis-open.org>

One of num_buffers does not display correctly in
the html. The _b becomes a subscript b. This will
prevent it from being searched by using keyword num_buffers.

Fix it by adding a field keyword.

Signed-off-by: Jiang Wang <jiang.wang@bytedance.com>
---
v1 -> v2: use field keyword instead of adding an escape char.

 content.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/content.tex b/content.tex
index b72bad0..2f65c60 100644
--- a/content.tex
+++ b/content.tex
@@ -3595,8 +3595,8 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 the packet (including the header) is spread over.
 
 If a receive packet is spread over multiple buffers, the device
-MUST use all buffers but the last (i.e. the first $num_buffers -
-1$ buffers) completely up to the full length of each buffer
+MUST use all buffers but the last (i.e. the first \field{num_buffers} -
+1 buffers) completely up to the full length of each buffer
 supplied by the driver.
 
 The device MUST use all buffers used by a single receive
-- 
2.11.0


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

