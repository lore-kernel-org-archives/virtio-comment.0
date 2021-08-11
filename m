Return-Path: <virtio-comment-return-2195-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D7AA8986070
	for <virtio-comment@lists.oasis-open.org>; Wed, 11 Aug 2021 11:43:28 +0000 (UTC)
From: Max Gurtovoy <mgurtovoy@nvidia.com>
Date: Wed, 11 Aug 2021 14:43:08 +0300
Message-ID: <20210811114309.7941-4-mgurtovoy@nvidia.com>
In-Reply-To: <20210811114309.7941-1-mgurtovoy@nvidia.com>
References: <20210811114309.7941-1-mgurtovoy@nvidia.com>
MIME-Version: 1.0
Subject: [virtio-comment] [RFC PATCH v3 3/4] virtio-blk: add support for VIRTIO_F_ADMIN_VQ
Content-Type: text/plain
To: virtio-comment@lists.oasis-open.org, jasowang@redhat.com, mst@redhat.com, cohuck@redhat.com
Cc: parav@nvidia.com, shahafs@nvidia.com, aadam@redhat.com, bodong@nvidia.com, amikheev@nvidia.com, nitzanc@nvidia.com, jgg@nvidia.com, stefanha@redhat.com, eperezma@redhat.com, oren@nvidia.com, Max Gurtovoy <mgurtovoy@nvidia.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Set the relevant index in case of VIRTIO_F_ADMIN_VQ negotiation.

Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
---
 content.tex | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/content.tex b/content.tex
index bc4c01d..6c029d5 100644
--- a/content.tex
+++ b/content.tex
@@ -4398,10 +4398,21 @@ \subsection{Device ID}\label{sec:Device Types / Block Device / Device ID}
   2
 
 \subsection{Virtqueues}\label{sec:Device Types / Block Device / Virtqueues}
+ if VIRTIO_F_ADMIN_VQ is not negotiated, the request queues layout is as
+ follows:
 \begin{description}
 \item[0] requestq1
 \item[\ldots]
 \item[N-1] requestqN
+\end{description}
+
+ If VIRTIO_F_ADMIN_VQ is negotiated, queue0 is an admin virtqueue and the
+ request queues are shifted as follows:
+\begin{description}
+\item[0] adminq
+\item[1] requestq1
+\item[\ldots]
+\item[N] requestqN
 \end{description}
 
  N=1 if VIRTIO_BLK_F_MQ is not negotiated, otherwise N is set by
-- 
2.21.0


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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

