Return-Path: <sgarzare@redhat.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v11 2/3] virtio-vsock: add VIRTIO_VSOCK_F_STREAM feature bit
Date: Wed, 12 Jan 2022 18:09:35 +0100
Message-Id: <20220112170936.245410-3-sgarzare@redhat.com>
In-Reply-To: <20220112170936.245410-1-sgarzare@redhat.com>
References: <20220112170936.245410-1-sgarzare@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
To: virtio-comment@lists.oasis-open.org
Cc: mst@redhat.com, arseny.krasnov@kaspersky.com, stefanha@redhat.com, cohuck@redhat.com, sgarzare@redhat.com, jasowang@redhat.com
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
index ad57f9d..bf015ac 100644
--- a/virtio-vsock.tex
+++ b/virtio-vsock.tex
@@ -16,7 +16,11 @@ \subsection{Virtqueues}\label{sec:Device Types / Socket Device / Virtqueues}
 
 \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
 
-There are currently no feature bits defined for this device.
+If no feature bit is set, only stream socket type is supported.
+
+\begin{description}
+\item VIRTIO_VSOCK_F_STREAM (0) stream socket type is supported.
+\end{description}
 
 \subsection{Device configuration layout}\label{sec:Device Types / Socket Device / Device configuration layout}
 
-- 
2.31.1

