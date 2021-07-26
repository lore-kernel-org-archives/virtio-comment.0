Return-Path: <virtio-comment-return-2062-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 20AA5986402
	for <virtio-comment@lists.oasis-open.org>; Mon, 26 Jul 2021 16:39:06 +0000 (UTC)
From: Gaetan Harter <gaetan.harter@opensynergy.com>
Date: Mon, 26 Jul 2021 18:38:49 +0200
Message-Id: <20210726163850.201851-3-gaetan.harter@opensynergy.com>
In-Reply-To: <20210726163850.201851-1-gaetan.harter@opensynergy.com>
References: <20210726163850.201851-1-gaetan.harter@opensynergy.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH 2/3] virtio-gpu: fix a typo
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
To: virtio-comment@lists.oasis-open.org
Cc: Gaetan Harter <gaetan.harter@opensynergy.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Signed-off-by: Gaetan Harter <gaetan.harter@opensynergy.com>
---
 virtio-gpu.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/virtio-gpu.tex b/virtio-gpu.tex
index a6afeda..7bfb8dd 100644
--- a/virtio-gpu.tex
+++ b/virtio-gpu.tex
@@ -27,7 +27,7 @@ \subsection{Virtqueues}\label{sec:Device Types / GPU Devi=
ce / Virtqueues}
 a fixed header, followed by command specific data fields.  The
 separate cursor queue is the "fast track" for cursor commands
 (VIRTIO_GPU_CMD_UPDATE_CURSOR and VIRTIO_GPU_CMD_MOVE_CURSOR), so they
-go though without being delayed by time-consuming commands in the
+go through without being delayed by time-consuming commands in the
 control queue.

 \subsection{Feature bits}\label{sec:Device Types / GPU Device / Feature bi=
ts}
--
2.25.1


Please mind our privacy notice<https://www.opensynergy.com/datenschutzerkla=
erung/privacy-notice-for-business-partners-pursuant-to-article-13-of-the-ge=
neral-data-protection-regulation-gdpr/> pursuant to Art. 13 GDPR. // Unsere=
 Hinweise zum Datenschutz gem. Art. 13 DSGVO finden Sie hier.<https://www.o=
pensynergy.com/de/datenschutzerklaerung/datenschutzhinweise-fuer-geschaefts=
partner-gem-art-13-dsgvo/>

This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=
=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

