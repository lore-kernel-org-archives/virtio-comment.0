Return-Path: virtio-comment-return-1334-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7E9CF985F23
	for <virtio-comment@lists.oasis-open.org>; Thu, 25 Jun 2020 14:33:05 +0000 (UTC)
From: Szymon Lukasz <noh4hss@gmail.com>
Date: Thu, 25 Jun 2020 16:32:22 +0200
Message-Id: <20200625143222.127151-1-noh4hss@gmail.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH] virtio-console: swap cols,rows fields in struct virtio_console_resize
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: Szymon Lukasz <noh4hss@gmail.com>
List-ID: <virtio-comment.lists.oasis-open.org>

I would like to propose a change to the order of these fields to match
the implementation in the Linux Kernel. I checked that FreeBSD and
OpenBSD do not implement the virtio feature using this struct.

If there is some less popular implementation of virtio driver that uses
the same order as the current version of the spec then I would like to
leave it to a hypervisor to deal with this issue, i.e. it should be
outside the scope of the virtio spec.

Signed-off-by: Szymon Lukasz <noh4hss@gmail.com>
---
 content.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/content.tex b/content.tex
index 91735e3..f95e708 100644
--- a/content.tex
+++ b/content.tex
@@ -4886,8 +4886,8 @@ \subsubsection{Multiport Device Operation}\label{sec:=
Device Types / Console Devi
   a console size change.  \field{value} is unused.  The buffer is followed=
 by the number of columns and rows:
 \begin{lstlisting}
 struct virtio_console_resize {
-        le16 cols;
         le16 rows;
+        le16 cols;
 };
 \end{lstlisting}
 \item [VIRTIO_CONSOLE_PORT_OPEN (6)] This message is sent by both the
--=20
2.27.0


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

