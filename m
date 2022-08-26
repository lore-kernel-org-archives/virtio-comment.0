Return-Path: <lingshan.zhu@intel.com>
From: Zhu Lingshan <lingshan.zhu@intel.com>
Subject: [PATCH V4 4/4] Add transport vq number for virtio blk and net
Date: Fri, 26 Aug 2022 18:00:33 +0800
Message-Id: <20220826100034.200432-5-lingshan.zhu@intel.com>
In-Reply-To: <20220826100034.200432-1-lingshan.zhu@intel.com>
References: <20220826100034.200432-1-lingshan.zhu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
To: mst@redhat.com, cohuck@redhat.com, sgarzare@redhat.com, stefanha@redhat.com, nrupal.jani@intel.com, Piotr.Uminski@intel.com, hang.yuan@intel.com
Cc: virtio-comment@lists.oasis-open.org, Zhu Lingshan <lingshan.zhu@intel.com>, Jason Wang <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

This commit add the queue number of the transport virtqueue
for virtio_blk and virtio_net

Signed-off-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
---
 content.tex | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/content.tex b/content.tex
index fdb7231..287695c 100644
--- a/content.tex
+++ b/content.tex
@@ -3875,6 +3875,7 @@ \subsection{Virtqueues}\label{sec:Device Types / Network Device / Virtqueues}
 \item[2(N-1)] receiveqN
 \item[2(N-1)+1] transmitqN
 \item[2N] controlq
+\item[2N+1] transportq
 \end{description}
 
  N=1 if neither VIRTIO_NET_F_MQ nor VIRTIO_NET_F_RSS are negotiated, otherwise N is set by
@@ -3882,6 +3883,8 @@ \subsection{Virtqueues}\label{sec:Device Types / Network Device / Virtqueues}
 
  controlq only exists if VIRTIO_NET_F_CTRL_VQ set.
 
+ transportq only exists if VIRTIO_F_TRANSPT_VQ set
+
 \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits}
 
 \begin{description}
@@ -5461,11 +5464,14 @@ \subsection{Virtqueues}\label{sec:Device Types / Block Device / Virtqueues}
 \item[0] requestq1
 \item[\ldots]
 \item[N-1] requestqN
+\item[N] transportq
 \end{description}
 
  N=1 if VIRTIO_BLK_F_MQ is not negotiated, otherwise N is set by
  \field{num_queues}.
 
+ transportq only exists if VIRTIO_F_TRANSPT_VQ set.
+
 \subsection{Feature bits}\label{sec:Device Types / Block Device / Feature bits}
 
 \begin{description}
-- 
2.35.3

