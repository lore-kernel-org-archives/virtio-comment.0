Return-Path: virtio-comment-return-1637-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E8B5B98614E
	for <virtio-comment@lists.oasis-open.org>; Wed, 13 Jan 2021 17:01:04 +0000 (UTC)
From: Peter Hilber <peter.hilber@opensynergy.com>
Date: Wed, 13 Jan 2021 17:57:46 +0100
Message-ID: <20210113165746.14758-1-peter.hilber@opensynergy.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH] content: reserve device ID 36 for CAN device
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: Peter Hilber <peter.hilber@opensynergy.com>
List-ID: <virtio-comment.lists.oasis-open.org>

The CAN device sends and receives CAN (Controller Area Network)
messages. CAN is a communication protocol used in embedded systems.

Signed-off-by: Peter Hilber <peter.hilber@opensynergy.com>
---
 content.tex | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/content.tex b/content.tex
index 620c0e2..e94469c 100644
--- a/content.tex
+++ b/content.tex
@@ -2846,6 +2846,8 @@ \chapter{Device Types}\label{sec:Device Types}
 \hline
 35         &   Watchdog \\
 \hline
+36         &   CAN device \\
+\hline
 \end{tabular}
=20
 Some of the devices above are unspecified by this document,
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

