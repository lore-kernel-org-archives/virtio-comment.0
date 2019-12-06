Return-Path: virtio-comment-return-984-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1FE42986097
	for <virtio-comment@lists.oasis-open.org>; Fri,  6 Dec 2019 12:20:19 +0000 (UTC)
From: Keiichi Watanabe <keiichiw@chromium.org>
Date: Fri,  6 Dec 2019 21:20:04 +0900
Message-Id: <20191206122004.64374-1-keiichiw@chromium.org>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH] content: Reserve device ID for video device
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: kraxel@redhat.com, tfiga@chromium.org, keiichiw@chromium.org, posciak@chromium.org, stevensd@chromium.org, dmitry.sepp@opensynergy.com, egranata@google.com
List-ID: <virtio-comment.lists.oasis-open.org>

Reserve device ID 30 for virtio-video device.

Signed-off-by: Keiichi Watanabe <keiichiw@chromium.org>
---
 content.tex | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/content.tex b/content.tex
index d68cfaf..3183db5 100644
--- a/content.tex
+++ b/content.tex
@@ -2721,6 +2721,8 @@ \chapter{Device Types}\label{sec:Device Types}
 \hline
 28         &   RPMB device \\
 \hline
+30         &   Video device \\
+\hline
 \end{tabular}
=20
 Some of the devices above are unspecified by this document,
--=20
2.24.0.393.g34dc348eaf-goog


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

