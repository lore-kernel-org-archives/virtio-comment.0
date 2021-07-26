Return-Path: <cohuck@redhat.com>
From: Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH] Reserved feature bits: fix missing verb
Date: Mon, 26 Jul 2021 12:53:02 +0200
Message-Id: <20210726105302.1404894-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
To: virtio@lists.oasis-open.org, virtio-comment@lists.oasis-open.org
Cc: Cornelia Huck <cohuck@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---

Will push as editorial update.

---
 content.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/content.tex b/content.tex
index 5c70a3c415a3..ceb25628010d 100644
--- a/content.tex
+++ b/content.tex
@@ -6586,7 +6586,7 @@ \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
 
 \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 
-Currently these device-independent feature bits defined:
+Currently these device-independent feature bits are defined:
 
 \begin{description}
   \item[VIRTIO_F_INDIRECT_DESC (28)] Negotiating this feature indicates
-- 
2.31.1

