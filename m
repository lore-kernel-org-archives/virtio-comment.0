Return-Path: virtio-comment-return-1365-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6403E985F10
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 Jul 2020 15:43:12 +0000 (UTC)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Date: Fri, 24 Jul 2020 16:42:48 +0100
Message-Id: <20200724154251.12546-5-alex.bennee@linaro.org>
In-Reply-To: <20200724154251.12546-1-alex.bennee@linaro.org>
References: <20200724154251.12546-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH  v2 4/7] Makefile: add some simple make automations
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
List-ID: <virtio-comment.lists.oasis-open.org>

This is just a helpful shortcut, especially when editing the documents
within an IDE which will offer up make targets to build the documents.

Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
---
 Makefile | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Makefile

diff --git a/Makefile b/Makefile
new file mode 100644
index 0000000..4c7dc66
--- /dev/null
+++ b/Makefile
@@ -0,0 +1,26 @@
+# -*- Mode: makefile -*-
+#
+# Basic Makefile to aid automation of document building
+#
+
+.PHONY: all
+all:
+=09./makeall.sh
+
+.PHONY: html
+html:
+=09./makehtml.sh
+
+.PHONY: clean
+clean:
+=09git clean -fd
+
+.PHONY: help
+help:
+=09@echo "Build the VIRTIO specification documents."
+=09@echo ""
+=09@echo "Possible operations are:"
+=09@echo
+=09@echo " $(MAKE)         Build everything"
+=09@echo " $(MAKE) html    Build local html"
+=09@echo " $(MAKE) clean   Remove all intermediate files"
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

