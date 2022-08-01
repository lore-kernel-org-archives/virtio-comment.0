Return-Path: <lingshan.zhu@intel.com>
From: Zhu Lingshan <lingshan.zhu@intel.com>
Subject: [PATCH V2 2/5] Introduce feature bit VIRTIO_F_TRANSPT_VQ_MDEV
Date: Mon,  1 Aug 2022 17:32:13 +0800
Message-Id: <20220801093216.362119-3-lingshan.zhu@intel.com>
In-Reply-To: <20220801093216.362119-1-lingshan.zhu@intel.com>
References: <20220801093216.362119-1-lingshan.zhu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
To: jasowang@redhat.com, mst@redhat.com, cohuck@redhat.com, sgarzare@redhat.com, stefanha@redhat.com, nrupal.jani@intel.com, Piotr.Uminski@intel.com
Cc: virtio-comment@lists.oasis-open.org, Zhu Lingshan <lingshan.zhu@intel.com>
List-ID: <virtio-comment.lists.oasis-open.org>

This commit introduces feature bit VIRTIO_F_TRANSPT_VQ_MDEV,
which depends on VIRTIO_F_TRANSPT_VQ.

Feature bit VIRTIO_F_TRANSPT_VQ_MDEV indicates that the managed
devices are created, configured and destroyed through the
transport virtqueue, the transport virtqueue is the
transport layer for the managed devices.

Signed-off-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
---
 content.tex | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/content.tex b/content.tex
index 969ca46..143949e 100644
--- a/content.tex
+++ b/content.tex
@@ -2968,6 +2968,18 @@ \subsection{Managed Devices Dscovery}\label{sec:Virtio Transport Options /Virtio
 
 Managed devices are created and discovered through a transport virtqueue.
 
+\subsection{Transport Virtqueue Features}\label{sec:Virtio Transport Options /Virtio Over Transport Virtqueue / Transport Virtqueue Features}
+
+Feature bit VIRTIO_F_TRANSPT_VQ_MDEV indicates that the managed devices are created, configured
+and destroyed through the transport virtqueue.
+This means the transport virtqueue is the transport layer for the managed devices.
+
+Feature bit VIRTIO_F_TRANSPT_VQ_MDEV depends on VIRTIO_F_TRANSPT_VQ
+
+\devicenormative{\subsubsection}{Transport Virtqueue Features}{Virtio Transport Options / Virtio Over Transport Virtqueue / Transport Virtqueue Features}
+
+The management device MUST not accept VIRTIO_F_TRANSPT_VQ_MDEV if VIRTIO_F_TRANSPT_VQ is not negotiated.
+
 \chapter{Device Types}\label{sec:Device Types}
 
 On top of the queues, config space and feature negotiation facilities
-- 
2.35.3

