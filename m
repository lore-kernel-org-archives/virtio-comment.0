Return-Path: virtio-comment-return-1353-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B3D16984927
	for <virtio-comment@lists.oasis-open.org>; Mon, 20 Jul 2020 14:55:02 +0000 (UTC)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Date: Mon, 20 Jul 2020 15:54:51 +0100
Message-Id: <20200720145451.23883-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Subject: [virtio-comment] [RFC PATCH] introduction.tex: introduce a glossary of terms
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, Nikos Dragazis <ndragazis@arrikto.com>, Stefan Hajnoczi <stefanha@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

It is useful to have a glossary of common terms at the front of the
document to define common terms we are going to use throughout the
specification. Whilst writing this list I notice we refer to a device
in host terms - perhaps we need slightly tighter definitions of what a
device is? For discussion I've defined a Device Interface in terms of
the guest visible side and a Device Backend in terms of what runs on
the host.

Cc: Nikos Dragazis <ndragazis@arrikto.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
---
 introduction.tex | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/introduction.tex b/introduction.tex
index 33da3ec..c84a112 100644
--- a/introduction.tex
+++ b/introduction.tex
@@ -81,6 +81,36 @@ \section{Terminology}\label{Terminology}
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
+\item[Guest]
+  A virtual machine hosted by a hypervisor.
+\item[Host]
+  The system hosting a virtual machine. It may consist of multiple
+  components including a hypervisor, primary OS and it's user-space.
+\item[Device Interface]
+  The series of configuration, control and operation mechanisms
+  visible to the guest that make a Virtio device.
+\item[Device Driver]
+  The software (usually part of a kernel) running on the guest which
+  accesses the device interface.
+\item[Device Backend]
+  The software running on the host that services requests made of the
+  device interface. The implementation details of the backend should
+  be transparent to the guest.
+\item[Notification]
+  An asynchronous signal sent to either the device backend or the
+  device driver to indicate a virtqueue has been updated. For guests
+  this is typically a device interrupt.
+\item[Doorbell Register]
+  A guest visible register that when accessed will trigger a
+  notification to the backend via some implementation defined
+  mechanism.
+\end{description}
+
 \subsection{Legacy Interface: Terminology}\label{intro:Legacy
 Interface: Terminology}
=20
--=20
2.26.0.103.g3bab5d5625


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

