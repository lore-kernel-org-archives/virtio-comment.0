Return-Path: <virtio-comment-return-3220-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DB5D298645F
	for <virtio-comment@lists.oasis-open.org>; Fri,  8 Jul 2022 13:39:34 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Fri,  8 Jul 2022 15:39:23 +0200
Message-Id: <20220708133923.46608-1-sgarzare@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH] virtio-vsock: add VIRTIO_VSOCK_F_NO_IMPLIED_STREAM feature bit
Content-type: text/plain
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: bobby.eshleman@bytedance.com, Arseny Krasnov <arseny.krasnov@kaspersky.com>, Stefan Hajnoczi <stefanha@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, jiang.wang@bytedance.com, Stefano Garzarella <sgarzare@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Initially virtio-vsock only supported the stream type, which is why
there was no feature. Later we added the seqpacket type and in the future
we may have other types (e.g. datagram).

seqpacket is an extension of stream, so it might be implied that if
seqpacket is supported, stream is too, but this might not be true for
other types.

As we discussed here [1] should be better to add a new
VIRTIO_VSOCK_F_NO_IMPLIED_STREAM feature bit to avoid this implication.

Let's also add normative sections to better define the behavior when
VIRTIO_VSOCK_F_NO_IMPLIED_STREAM is negotiated or not.

[1] http://markmail.org/message/2s3qd74drgjxkvte

Suggested-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---

The two normative sections seem repetitive, I don't know whether it's
better to have the "If ..." parts only in one section.

Suggestions?
---
 virtio-vsock.tex | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/virtio-vsock.tex b/virtio-vsock.tex
index d79984d..45f041a 100644
--- a/virtio-vsock.tex
+++ b/virtio-vsock.tex
@@ -16,15 +16,37 @@ \subsection{Virtqueues}\label{sec:Device Types / Socket=
 Device / Virtqueues}
=20
 \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature=
 bits}
=20
-If no feature bit is set, only stream socket type is supported.
-If VIRTIO_VSOCK_F_SEQPACKET has been negotiated, the device MAY act
-as if VIRTIO_VSOCK_F_STREAM has also been negotiated.
-
 \begin{description}
 \item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is supported.
 \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is supported.
+\item[VIRTIO_VSOCK_F_NO_IMPLIED_STREAM (2)] stream socket type is not impl=
ied.
 \end{description}
=20
+\drivernormative{\subsubsection}{Feature bits}{Device Types / Socket Devic=
e / Feature bits}
+
+The driver SHOULD accept the VIRTIO_VSOCK_F_NO_IMPLIED_STREAM feature if
+offered by the device.
+
+If the device does not offer the VIRTIO_VSOCK_F_NO_IMPLIED_STREAM feature
+bit, and if no feature bit has been negotiated, the driver SHOULD act as i=
f
+VIRTIO_VSOCK_F_STREAM has been negotiated.
+
+If the device does not offer the VIRTIO_VSOCK_F_NO_IMPLIED_STREAM feature
+bit, and if VIRTIO_VSOCK_F_SEQPACKET has been negotiated, the driver MAY a=
ct
+as if VIRTIO_VSOCK_F_STREAM has also been negotiated.
+
+\devicenormative{\subsubsection}{Feature bits}{Device Types / Socket Devic=
e / Feature bits}
+
+The device SHOULD offer the VIRTIO_VSOCK_F_NO_IMPLIED_STREAM feature.
+
+If the driver does not accept the VIRTIO_VSOCK_F_NO_IMPLIED_STREAM feature
+bit, and if no feature bit has been negotiated, the device SHOULD act as i=
f
+VIRTIO_VSOCK_F_STREAM has been negotiated.
+
+If the driver does not accept the VIRTIO_VSOCK_F_NO_IMPLIED_STREAM feature
+bit, and if VIRTIO_VSOCK_F_SEQPACKET has been negotiated, the device MAY a=
ct
+as if VIRTIO_VSOCK_F_STREAM has also been negotiated.
+
 \subsection{Device configuration layout}\label{sec:Device Types / Socket D=
evice / Device configuration layout}
=20
 Socket device configuration uses the following layout structure:
--=20
2.36.1


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

