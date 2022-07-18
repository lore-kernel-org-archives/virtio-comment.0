Return-Path: <sgarzare@redhat.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v2] virtio-vsock: add VIRTIO_VSOCK_F_NO_IMPLIED_STREAM feature bit
Date: Mon, 18 Jul 2022 16:26:53 +0200
Message-Id: <20220718142653.42310-1-sgarzare@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
To: virtio-comment@lists.oasis-open.org
Cc: jiang.wang@bytedance.com, Stefan Hajnoczi <stefanha@redhat.com>, Arseniy Krasnov <AVKrasnov@sberdevices.ru>, "Michael S . Tsirkin" <mst@redhat.com>, bobby.eshleman@bytedance.com, Cornelia Huck <cohuck@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
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
v2:
- rewrote better normative statements [Cornelia]
- updated conformance.tex with the new sections [Cornelia]

v1: https://markmail.org/message/ybtl4trifrhjnkfe
---
 conformance.tex  |  2 ++
 virtio-vsock.tex | 28 ++++++++++++++++++++++++----
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/conformance.tex b/conformance.tex
index 663e7c3..98626ba 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -229,6 +229,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 A socket driver MUST conform to the following normative statements:
 
 \begin{itemize}
+\item \ref{drivernormative:Device Types / Socket Device / Feature bits}
 \item \ref{drivernormative:Device Types / Socket Device / Device Operation / Buffer Space Management}
 \item \ref{drivernormative:Device Types / Socket Device / Device Operation / Receive and Transmit}
 \item \ref{drivernormative:Device Types / Socket Device / Device Operation / Device Events}
@@ -500,6 +501,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 A socket device MUST conform to the following normative statements:
 
 \begin{itemize}
+\item \ref{devicenormative:Device Types / Socket Device / Feature bits}
 \item \ref{devicenormative:Device Types / Socket Device / Device Operation / Buffer Space Management}
 \item \ref{devicenormative:Device Types / Socket Device / Device Operation / Receive and Transmit}
 \end{itemize}
diff --git a/virtio-vsock.tex b/virtio-vsock.tex
index d79984d..b3ff45a 100644
--- a/virtio-vsock.tex
+++ b/virtio-vsock.tex
@@ -16,15 +16,35 @@ \subsection{Virtqueues}\label{sec:Device Types / Socket Device / Virtqueues}
 
 \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
 
-If no feature bit is set, only stream socket type is supported.
-If VIRTIO_VSOCK_F_SEQPACKET has been negotiated, the device MAY act
-as if VIRTIO_VSOCK_F_STREAM has also been negotiated.
-
 \begin{description}
 \item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is supported.
 \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is supported.
+\item[VIRTIO_VSOCK_F_NO_IMPLIED_STREAM (2)] stream socket type is not implied.
 \end{description}
 
+\drivernormative{\subsubsection}{Feature bits}{Device Types / Socket Device / Feature bits}
+
+The driver SHOULD accept the VIRTIO_VSOCK_F_NO_IMPLIED_STREAM feature if
+offered by the device.
+
+If no feature bit has been negotiated, the driver SHOULD act as if
+VIRTIO_VSOCK_F_STREAM has been negotiated.
+
+If VIRTIO_VSOCK_F_SEQPACKET has been negotiated, but not
+VIRTIO_VSOCK_F_NO_IMPLIED_STREAM, the driver MAY act as if
+VIRTIO_VSOCK_F_STREAM has also been negotiated.
+
+\devicenormative{\subsubsection}{Feature bits}{Device Types / Socket Device / Feature bits}
+
+The device SHOULD offer the VIRTIO_VSOCK_F_NO_IMPLIED_STREAM feature.
+
+If no feature bit has been negotiated, the device SHOULD act as if
+VIRTIO_VSOCK_F_STREAM has been negotiated.
+
+If VIRTIO_VSOCK_F_SEQPACKET has been negotiated, but not
+VIRTIO_VSOCK_F_NO_IMPLIED_STREAM, the device MAY act as if
+VIRTIO_VSOCK_F_STREAM has also been negotiated.
+
 \subsection{Device configuration layout}\label{sec:Device Types / Socket Device / Device configuration layout}
 
 Socket device configuration uses the following layout structure:
-- 
2.36.1

