Return-Path: <lingshan.zhu@intel.com>
From: Zhu Lingshan <lingshan.zhu@intel.com>
Subject: [PATCH V3 3/4] Describe the process to present a managed device
Date: Fri,  5 Aug 2022 17:41:13 +0800
Message-Id: <20220805094114.486005-4-lingshan.zhu@intel.com>
In-Reply-To: <20220805094114.486005-1-lingshan.zhu@intel.com>
References: <20220805094114.486005-1-lingshan.zhu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
To: jasowang@redhat.com, mst@redhat.com, cohuck@redhat.com, sgarzare@redhat.com, stefanha@redhat.com, nrupal.jani@intel.com, Piotr.Uminski@intel.com, hang.yuan@intel.com
Cc: virtio-comment@lists.oasis-open.org, Zhu Lingshan <lingshan.zhu@intel.com>
List-ID: <virtio-comment.lists.oasis-open.org>

This commit describes the process to present a manage
device, including device creation, config and virtqueue config

Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
---
 content.tex | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/content.tex b/content.tex
index df2979b..f492eb9 100644
--- a/content.tex
+++ b/content.tex
@@ -3613,6 +3613,43 @@ \subsection{Virtqueue Reset}\label{sec:Virtio Transport Options / Virtio Over
 done (by verifying virtio_transportq_ctrl.ack == VIRTIO_TRANSPTQ_OK)
 before re-enabling it.
 
+\subsection{Presenting Managed Devices}\label{sec:Virtio Transport Options /
+Virtio Over Transport Virtqueue / Presenting Managed Device}
+
+If VIRTIO_F_TRANSPT_VQ is negotiated with the management device.
+The presenting of the managed devices requires cooperation between
+the management device driver, the transport virtqueue and the managed device driver.
+
+The management device driver typically takes the following steps to create a
+managed device:
+
+\begin{enumerate}
+\item Determine the virtio device id and device specific configuration.
+\item Create the managed devices by VIRTIO_TRANSPORTQ_CTRL_DEV_CREATE command.
+\item Optionally, configure the MSI entries by VIRTIO_TRANSPTQ_CTRL_MSI class commands
+\item The managed device driver probes the managed device.
+\end{enumerate}
+
+The management device driver will then use the transport virtqueue to
+process the requests from the managed device driver.
+
+Managed device setup performed by the managde device driver:
+\begin{itemize*}
+\item Features negotiation by VIRTIO_TRANSPTQ_CTRL_FEAT class commands.
+\item Device status management by VIRTIO_TRANSPTQ_CTRL_STATUS class commands.
+\item Device configuration space access by VIRTIO_TRANSPTQ_CTRL_CONFIG class commands.
+\end{itemize*}
+
+Virtqueues setup performed by the managed driver:
+\begin{itemize*}
+\item Set the virtqueue address by VIRTIO_TRANSPTQ_CTRL_VQ_ADDR_SET command.
+\item Set the virtqueue size by VIRTIO_TRANSPTQ_CTRL_VQ_SIZE class commands.
+\item Get the virtqueue notification area by VIRTIO_TRANSPTQ_CTRL_VQ_NOTIFY_GET command.
+\item Set the virtqueue state by VIRTIO_TRANSPTQ_CTRL_VQ_STATE_SET command.
+\item Optionally, set virtqueue asid by VIRTIO_TRANSPTQ_CTRL_VQ_ASID_SET command.
+\item Enable the virtqueue by VIRTIO_TRANSPTQ_CTRL_VQ_ENABLE_SET command.
+\end{itemize*}
+
 \chapter{Device Types}\label{sec:Device Types}
 
 On top of the queues, config space and feature negotiation facilities
-- 
2.35.3

