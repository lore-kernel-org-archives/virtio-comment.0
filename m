Return-Path: <virtio-comment-return-2529-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 36443986503
	for <virtio-comment@lists.oasis-open.org>; Thu, 13 Jan 2022 16:52:50 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Thu, 13 Jan 2022 17:52:01 +0100
Message-Id: <20220113165202.250429-3-sgarzare@redhat.com>
In-Reply-To: <20220113165202.250429-1-sgarzare@redhat.com>
References: <20220113165202.250429-1-sgarzare@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH v12 2/3] virtio-vsock: add VIRTIO_VSOCK_F_STREAM feature bit
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: jasowang@redhat.com, mst@redhat.com, sgarzare@redhat.com, cohuck@redhat.com, stefanha@redhat.com, arseny.krasnov@kaspersky.com
List-ID: <virtio-comment.lists.oasis-open.org>

Initially vsock devices only supported stream sockets, but now
we are adding support for new types (i.e. SEQPACKET, DGRAM).

Since some devices may not want to support stream sockets, we add
a feature bit for this type.

For backward compatibility, if no feature bit is set, only stream
socket type is supported.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 virtio-vsock.tex | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/virtio-vsock.tex b/virtio-vsock.tex
index ad57f9d..23a1eeb 100644
--- a/virtio-vsock.tex
+++ b/virtio-vsock.tex
@@ -16,7 +16,11 @@ \subsection{Virtqueues}\label{sec:Device Types / Socket =
Device / Virtqueues}
=20
 \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature=
 bits}
=20
-There are currently no feature bits defined for this device.
+If no feature bit is set, only stream socket type is supported.
+
+\begin{description}
+\item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is supported.
+\end{description}
=20
 \subsection{Device configuration layout}\label{sec:Device Types / Socket D=
evice / Device configuration layout}
=20
--=20
2.31.1


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

