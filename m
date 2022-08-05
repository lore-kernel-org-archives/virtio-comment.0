Return-Path: <virtio-comment-return-3329-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5FD0798658A
	for <virtio-comment@lists.oasis-open.org>; Fri,  5 Aug 2022 10:02:37 +0000 (UTC)
From: Zhu Lingshan <lingshan.zhu@intel.com>
Date: Fri,  5 Aug 2022 17:53:42 +0800
Message-Id: <20220805095343.486546-4-lingshan.zhu@intel.com>
In-Reply-To: <20220805095343.486546-1-lingshan.zhu@intel.com>
References: <20220805095343.486546-1-lingshan.zhu@intel.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH V3 RESEND 3/4] Describe the process to present a managed device
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true
To: jasowang@redhat.com, mst@redhat.com, cohuck@redhat.com, sgarzare@redhat.com, stefanha@redhat.com, nrupal.jani@intel.com, Piotr.Uminski@intel.com, hang.yuan@intel.com
Cc: virtio-comment@lists.oasis-open.org, Zhu Lingshan <lingshan.zhu@intel.com>
List-ID: <virtio-comment.lists.oasis-open.org>

This commit describes the process to present a manage
device, including device creation, config and virtqueue config

Signed-off-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
---
 content.tex | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/content.tex b/content.tex
index 190f3a0..be632d1 100644
--- a/content.tex
+++ b/content.tex
@@ -3612,6 +3612,43 @@ \subsection{Virtqueue Reset}\label{sec:Virtio Transp=
ort Options / Virtio Over
 done (by verifying virtio_transportq_ctrl.ack =3D=3D VIRTIO_TRANSPTQ_OK)
 before re-enabling it.
=20
+\subsection{Presenting Managed Devices}\label{sec:Virtio Transport Options=
 /
+Virtio Over Transport Virtqueue / Presenting Managed Device}
+
+If VIRTIO_F_TRANSPT_VQ is negotiated with the management device.
+The presenting of the managed devices requires cooperation between
+the management device driver, the transport virtqueue and the managed devi=
ce driver.
+
+The management device driver typically takes the following steps to create=
 a
+managed device:
+
+\begin{enumerate}
+\item Determine the virtio device id and device specific configuration.
+\item Create the managed devices by VIRTIO_TRANSPORTQ_CTRL_DEV_CREATE comm=
and.
+\item Optionally, configure the MSI entries by VIRTIO_TRANSPTQ_CTRL_MSI cl=
ass commands
+\item The managed device driver probes the managed device.
+\end{enumerate}
+
+The management device driver will then use the transport virtqueue to
+process the requests from the managed device driver.
+
+Managed device setup performed by the managde device driver:
+\begin{itemize*}
+\item Features negotiation by VIRTIO_TRANSPTQ_CTRL_FEAT class commands.
+\item Device status management by VIRTIO_TRANSPTQ_CTRL_STATUS class comman=
ds.
+\item Device configuration space access by VIRTIO_TRANSPTQ_CTRL_CONFIG cla=
ss commands.
+\end{itemize*}
+
+Virtqueues setup performed by the managed driver:
+\begin{itemize*}
+\item Set the virtqueue address by VIRTIO_TRANSPTQ_CTRL_VQ_ADDR_SET comman=
d.
+\item Set the virtqueue size by VIRTIO_TRANSPTQ_CTRL_VQ_SIZE class command=
s.
+\item Get the virtqueue notification area by VIRTIO_TRANSPTQ_CTRL_VQ_NOTIF=
Y_GET command.
+\item Set the virtqueue state by VIRTIO_TRANSPTQ_CTRL_VQ_STATE_SET command=
.
+\item Optionally, set virtqueue asid by VIRTIO_TRANSPTQ_CTRL_VQ_ASID_SET c=
ommand.
+\item Enable the virtqueue by VIRTIO_TRANSPTQ_CTRL_VQ_ENABLE_SET command.
+\end{itemize*}
+
 \chapter{Device Types}\label{sec:Device Types}
=20
 On top of the queues, config space and feature negotiation facilities
--=20
2.35.3


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

