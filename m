Return-Path: virtio-comment-return-1366-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 256C998600C
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 Jul 2020 15:43:13 +0000 (UTC)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Date: Fri, 24 Jul 2020 16:42:50 +0100
Message-Id: <20200724154251.12546-7-alex.bennee@linaro.org>
In-Reply-To: <20200724154251.12546-1-alex.bennee@linaro.org>
References: <20200724154251.12546-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH  v2 6/7] introduction.tex: introduce a glossary of terms
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, Nikos Dragazis <ndragazis@arrikto.com>, Stefan Hajnoczi <stefanha@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

It is useful to have a glossary of common terms at the front of the
document to define common terms we are going to use throughout the
specification.

Cc: Nikos Dragazis <ndragazis@arrikto.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

---
v2
  - drop host/guest terminology
  - clarify Device/Driver
  - add Transport
---
 introduction.tex | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/introduction.tex b/introduction.tex
index 33da3ec..292b78c 100644
--- a/introduction.tex
+++ b/introduction.tex
@@ -81,6 +81,27 @@ \section{Terminology}\label{Terminology}
=20
 The key words ``MUST'', ``MUST NOT'', ``REQUIRED'', ``SHALL'', ``SHALL NOT=
'', ``SHOULD'', ``SHOULD NOT'', ``RECOMMENDED'', ``MAY'', and ``OPTIONAL'' =
in this document are to be interpreted as described in \hyperref[intro:rfc2=
119]{[RFC2119]}.
=20
+\subsection{Glossary}\label{intro:Glossary}
+
+The following are definitions of common terms used throughout the specific=
ation.
+
+\begin{description}
+\item[Device] The series of configuration, control and operation
+  mechanisms that make a Virtio device. The implementation details of
+  the device should be transparent to the Driver.
+\item[Driver] The software (usually part of a kernel) which accesses
+  the device interface.
+\item[Notification] An asynchronous signal sent to either the Device
+  or the Driver to indicate an event has occurred. For Device to
+  Driver notifications this is typically an device interrupt although
+  the details are a function of the transport.
+\item[Doorbell] A mechanism for the Driver to trigger a notification
+  to the device. The mechanism is a function of the transport but it
+  is typically an MMIO register.
+\item[Transport] The bus level abstraction that the Driver and Device
+  interface with.
+\end{description}
+
 \subsection{Legacy Interface: Terminology}\label{intro:Legacy
 Interface: Terminology}
=20
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

