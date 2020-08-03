Return-Path: virtio-comment-return-1380-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4A937984633
	for <virtio-comment@lists.oasis-open.org>; Mon,  3 Aug 2020 16:23:29 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
Date: Mon,  3 Aug 2020 18:23:13 +0200
Message-Id: <20200803162313.157148-1-lvivier@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH v2] virtio-rng: add a control queue
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: Cornelia Huck <cohuck@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>, Amit Shah <amit@kernel.org>, Laurent Vivier <lvivier@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

A control queue is needed to send command to ask the device to
release the request buffers if it cannot provide data.

Changes:

  5.4.2 Virtqueues
  0 requestq
  1 controlq
  controlq only exists if VIRTIO_RNG_F_CTRL_VQ set.

  5.4.3 Feature bits
  VIRTIO_RNG_F_CTRL_VQ (0)
  Device has a control queue

  5.4.5 Device Initialization
  Identify and initialize the request virtqueue.
  If the VIRTIO_RNG_F_CTRL_VQ feature bit is negotiated,
  identify the control virtqueue.

  5.4.6.3 Control Virtqueue
  The driver uses the control virtqueue (if VIRTIO_RNG_F_CTRL_VQ is
  negotiated) to send commands to control the device.
  All commands are of the following form:
  struct virtio_rng_ctrl_hdr {
         u8 cmd;
  };

  5.4.6.4 Device Requirements: Control Virtqueue
  If VIRTIO_RNG_F_CTRL_VQ is negotiated, the device MUST implement the
  flush command.
  Any other value of cmd MUST be ignored by the device.

  5.4.6.4.1 Request Virtqueue Flushing
  When the device is not able to provide enough entropy to the driver, the
  driver may be stuck waiting for the device returning buffers, and cannot
  be removed to switch to another one. The flush command allows the driver
  to ask the device to release all the buffers sent to the device. This
  allows the driver to release resources allocated to receive data from
  the device.
  #define VIRTIO_RNG_CMD_FLUSH 0

  5.4.6.5 Device Requirements: Request Virtqueue Flushing
  When the driver sends a flush request, the device MUST release all
  outstanding buffers.

Bug-Link: https://github.com/oasis-tcs/virtio-spec/issues/83
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---

Notes:
    v2: Add devicenormative for the Control Virtqueue
        Add devicenormative for the Request Virtqueue Flushing
        Reword paragraph Request Virtqueue Flushing

 content.tex | 47 +++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/content.tex b/content.tex
index 91735e3eb018..8013eae8851c 100644
--- a/content.tex
+++ b/content.tex
@@ -4952,10 +4952,16 @@ \subsection{Device ID}\label{sec:Device Types / Ent=
ropy Device / Device ID}
 \subsection{Virtqueues}\label{sec:Device Types / Entropy Device / Virtqueu=
es}
 \begin{description}
 \item[0] requestq
+\item[1] controlq
 \end{description}
=20
+controlq only exists if VIRTIO_RNG_F_CTRL_VQ set.
+
 \subsection{Feature bits}\label{sec:Device Types / Entropy Device / Featur=
e bits}
-  None currently defined
+
+\begin{description}
+\item[VIRTIO_RNG_F_CTRL_VQ (0)] Device has a control queue
+\end{description}
=20
 \subsection{Device configuration layout}\label{sec:Device Types / Entropy =
Device / Device configuration layout}
   None currently defined.
@@ -4963,7 +4969,11 @@ \subsection{Device configuration layout}\label{sec:D=
evice Types / Entropy Device
 \subsection{Device Initialization}\label{sec:Device Types / Entropy Device=
 / Device Initialization}
=20
 \begin{enumerate}
-\item The virtqueue is initialized
+\item Identify and initialize the request virtqueue.
+
+\item If the VIRTIO_RNG_F_CTRL_VQ feature bit is negotiated,
+  identify the control virtqueue.
+
 \end{enumerate}
=20
 \subsection{Device Operation}\label{sec:Device Types / Entropy Device / De=
vice Operation}
@@ -4984,6 +4994,39 @@ \subsection{Device Operation}\label{sec:Device Types=
 / Entropy Device / Device O
 The device MUST place one or more random bytes into the buffer, but it
 MAY use less than the entire buffer length.
=20
+\subsubsection{Control Virtqueue}\label{sec:Device Types / Entropy Device =
/ Device Operation / Control Virtqueue}
+
+The driver uses the control virtqueue (if VIRTIO_RNG_F_CTRL_VQ is
+negotiated) to send commands to control the device.
+
+All commands are of the following form:
+
+\begin{lstlisting}
+struct virtio_rng_ctrl_hdr {
+       u8 cmd;
+};
+\end{lstlisting}
+
+\devicenormative{\subsubsection}{Control Virtqueue}{Device Types / Entropy=
 Device / Device Operation / Control Virtqueue}
+
+If VIRTIO_RNG_F_CTRL_VQ is negotiated, the device MUST implement the flush=
 command.
+
+Any other value of cmd MUST be ignored by the device.
+
+\paragraph{Request Virtqueue Flushing}\label{sec:Device Types / Entropy De=
vice / Device Operation / Control Virtqueue / Request Virtqueue Flushing}
+
+When the device is not able to provide enough entropy to the driver, the d=
river may be stuck waiting for the device returning buffers, and cannot be =
removed to switch to another one.
+The flush command allows the driver to ask the device to release all the b=
uffers sent to the
+device. This allows the driver to release resources allocated to receive d=
ata from the device.
+
+\begin{lstlisting}
+#define VIRTIO_RNG_CMD_FLUSH 0
+\end{lstlisting}
+
+\devicenormative{\subsubsection}{Request Virtqueue Flushing}{Device Types =
/ Entropy Device / Device Operation / Control Virtqueue / Request Virtqueue=
 Flushing}
+
+When the driver sends a flush request, the device MUST release all outstan=
ding buffers.
+
 \section{Traditional Memory Balloon Device}\label{sec:Device Types / Memor=
y Balloon Device}
=20
 This is the traditional balloon device.  The device number 13 is
--=20
2.26.2


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

