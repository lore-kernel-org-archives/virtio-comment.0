Return-Path: virtio-comment-return-1364-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5D77C9860ED
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 Jul 2020 15:43:12 +0000 (UTC)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Date: Fri, 24 Jul 2020 16:42:51 +0100
Message-Id: <20200724154251.12546-8-alex.bennee@linaro.org>
In-Reply-To: <20200724154251.12546-1-alex.bennee@linaro.org>
References: <20200724154251.12546-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH  v2 7/7] content.tex: tighten up the definition of notification.
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, Nikos Dragazis <ndragazis@arrikto.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Repeat the language from the Terminology section and slightly reword
the remaining section of the paragraph.

Suggested-by: Nikos Dragazis <ndragazis@arrikto.com>
Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
---
 content.tex | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/content.tex b/content.tex
index 91735e3..d2c9a48 100644
--- a/content.tex
+++ b/content.tex
@@ -161,9 +161,11 @@ \subsection{Legacy Interface: A Note on Feature
 \section{Notifications}\label{sec:Basic Facilities of a Virtio Device
 / Notifications}
=20
-The notion of sending a notification (driver to device or device
-to driver) plays an important role in this specification. The
-modus operandi of the notifications is transport specific.
+A notification is a asynchronous signal sent to either the Device or
+the Driver to indicate an event has occurred. The mechanism of how a
+notification is triggered (from driver to device or from device to
+driver) is transport specific. Notifications play an important role in
+this specification.
=20
 There are three types of notifications:=20
 \begin{itemize}
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

