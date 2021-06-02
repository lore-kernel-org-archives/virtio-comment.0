Return-Path: virtio-comment-return-1871-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C815A986523
	for <virtio-comment@lists.oasis-open.org>; Wed,  2 Jun 2021 06:42:22 +0000 (UTC)
From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Wed,  2 Jun 2021 12:12:13 +0530
Message-Id: <fe497091797c31f8b59a989fbd34b93fd07adce4.1622615811.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH] Reserve device id for GPIO device
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"
To: virtio-comment@lists.oasis-open.org
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Vincent Guittot <vincent.guittot@linaro.org>, Bill Mills <bill.mills@linaro.org>, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, "Enrico Weigelt, metux IT consult" <info@metux.net>
List-ID: <virtio-comment.lists.oasis-open.org>

Use device ID 41

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 content.tex | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/content.tex b/content.tex
index b9934b4fa05c..d9913d056317 100644
--- a/content.tex
+++ b/content.tex
@@ -2876,6 +2876,8 @@ \chapter{Device Types}\label{sec:Device Types}
 \hline
 40         &   Bluetooth device \\
 \hline
+41         &   GPIO device \\
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

