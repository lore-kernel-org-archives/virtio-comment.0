Return-Path: virtio-comment-return-996-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4C354985EFE
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Dec 2019 13:12:04 +0000 (UTC)
From: Keiichi Watanabe <keiichiw@chromium.org>
Date: Wed, 18 Dec 2019 22:11:51 +0900
Message-Id: <20191218131151.177694-1-keiichiw@chromium.org>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH v2] content: Reserve device ID for video encoder and decoder device
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: acourbot@chromium.org, alexlau@chromium.org, dmitry.sepp@opensynergy.com, egranata@google.com, keiichiw@chromium.org, kraxel@redhat.com, posciak@chromium.org, stevensd@chromium.org, tfiga@chromium.org
List-ID: <virtio-comment.lists.oasis-open.org>

Reserve device ID 30 for video encoder device and 31 for video decoder devi=
ce.

Signed-off-by: Keiichi Watanabe <keiichiw@chromium.org>
---
 content.tex | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/content.tex b/content.tex
index d68cfaf..556b373 100644
--- a/content.tex
+++ b/content.tex
@@ -2721,6 +2721,10 @@ \chapter{Device Types}\label{sec:Device Types}
 \hline
 28         &   RPMB device \\
 \hline
+30         &   Video encoder device \\
+\hline
+31         &   Video decoder device \\
+\hline
 \end{tabular}
=20
 Some of the devices above are unspecified by this document,
--=20
2.24.1.735.g03f4e72817-goog


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

