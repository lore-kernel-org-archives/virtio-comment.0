Return-Path: <mgurtovoy@nvidia.com>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
Subject: [RFC PATCH v2 2/2] virtio-blk: add support for VIRTIO_F_ADMIN_VQ
Date: Mon, 26 Jul 2021 19:52:54 +0300
Message-ID: <20210726165254.8529-2-mgurtovoy@nvidia.com>
In-Reply-To: <20210726165254.8529-1-mgurtovoy@nvidia.com>
References: <20210726165254.8529-1-mgurtovoy@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: virtio-comment@lists.oasis-open.org, mst@redhat.com, jasowang@redhat.com, cohuck@redhat.com, stefanha@redhat.com
Cc: oren@nvidia.com, parav@nvidia.com, shahafs@nvidia.com, eperezma@redhat.com, aadam@redhat.com, bodong@nvidia.com, amikheev@nvidia.com, Max Gurtovoy <mgurtovoy@nvidia.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Set the relevant index in case of VIRTIO_F_ADMIN_VQ negotiation. Also
restrict the negotiation of VIRTIO_F_ADMIN_VQ to be possible only if
VIRTIO_BLK_F_MQ is negotiated.

Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
---
 content.tex | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/content.tex b/content.tex
index d350175..03e25da 100644
--- a/content.tex
+++ b/content.tex
@@ -4406,6 +4406,16 @@ \subsection{Virtqueues}\label{sec:Device Types / Block Device / Virtqueues}
  N=1 if VIRTIO_BLK_F_MQ is not negotiated, otherwise N is set by
  \field{num_queues}.
 
+ If VIRTIO_F_ADMIN_VQ is negotiated, queue0 is an admin virtqueue and the
+ request queues are shifted as the following:
+\begin{description}
+\item[1] requestq1
+\item[\ldots]
+\item[N] requestqN
+\end{description}
+
+ if VIRTIO_BLK_F_MQ is not negotiated, VIRTIO_F_ADMIN_VQ MUST NOT be
+ negotiated.
 \subsection{Feature bits}\label{sec:Device Types / Block Device / Feature bits}
 
 \begin{description}
@@ -4574,6 +4584,9 @@ \subsection{Device Initialization}\label{sec:Device Types / Block Device / Devic
 The driver MUST NOT read \field{writeback} before setting
 the FEATURES_OK \field{device status} bit.
 
+The driver MUST NOT negotiate VIRTIO_F_ADMIN_VQ, unless VIRTIO_BLK_F_MQ
+is negotiated.
+
 \devicenormative{\subsubsection}{Device Initialization}{Device Types / Block Device / Device Initialization}
 
 Devices SHOULD always offer VIRTIO_BLK_F_FLUSH, and MUST offer it
@@ -4585,6 +4598,9 @@ \subsection{Device Initialization}\label{sec:Device Types / Block Device / Devic
 The device MUST initialize padding bytes \field{unused0} and
 \field{unused1} to 0.
 
+The device MUST NOT offer VIRTIO_F_ADMIN_VQ, unless it offer
+VIRTIO_BLK_F_MQ.
+
 \subsubsection{Legacy Interface: Device Initialization}\label{sec:Device Types / Block Device / Device Initialization / Legacy Interface: Device Initialization}
 
 Because legacy devices do not have FEATURES_OK, transitional devices
-- 
2.21.0

