Return-Path: virtio-comment-return-1124-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D8D5D985FBD
	for <virtio-comment@lists.oasis-open.org>; Fri,  6 Mar 2020 17:01:46 +0000 (UTC)
From: Peter Hilber <peter.hilber@opensynergy.com>
Date: Fri, 6 Mar 2020 18:00:32 +0100
Message-ID: <20200306170032.13651-1-peter.hilber@opensynergy.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH] Reserve device ID 32 for SCMI device
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: Peter Hilber <peter.hilber@opensynergy.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Signed-off-by: Peter Hilber <peter.hilber@opensynergy.com>
---
 content.tex | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/content.tex b/content.tex
index b91a132..937689b 100644
--- a/content.tex
+++ b/content.tex
@@ -2801,6 +2801,8 @@ \chapter{Device Types}\label{sec:Device Types}
 \hline
 31         &   Video decoder device \\
 \hline
+32         &   SCMI device \\
+\hline
 \end{tabular}
=20
 Some of the devices above are unspecified by this document,
--=20
2.20.1


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

