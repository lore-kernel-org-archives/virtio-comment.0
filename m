Return-Path: <mgurtovoy@nvidia.com>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
Subject: [PATCH v2 1/1] Fix reserved Feature bits numbering
Date: Mon, 3 Jan 2022 19:03:44 +0200
Message-ID: <20220103170344.3696-1-mgurtovoy@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: virtio-comment@lists.oasis-open.org, mst@redhat.com, cohuck@redhat.com
Cc: oren@nvidia.com, stefanha@redhat.com, eperezma@redhat.com, Max
 Gurtovoy <mgurtovoy@nvidia.com>
List-ID: <virtio-comment.lists.oasis-open.org>

This should have been updated during VIRTIO_F_NOTIFICATION_DATA,
VIRTIO_F_NOTIF_CONFIG_DATA and VIRTIO_F_RING_RESET standartization.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
---

changes from v1:
 - added "Reviewed-by" signature (Stefan)
 - include VIRTIO_F_RING_RESET feature bit (Cornelia)

---
 content.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/content.tex b/content.tex
index cf20570..32de668 100644
--- a/content.tex
+++ b/content.tex
@@ -99,10 +99,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
 \begin{description}
 \item[0 to 23] Feature bits for the specific device type
 
-\item[24 to 37] Feature bits reserved for extensions to the queue and
+\item[24 to 40] Feature bits reserved for extensions to the queue and
   feature negotiation mechanisms
 
-\item[38 and above] Feature bits reserved for future extensions.
+\item[41 and above] Feature bits reserved for future extensions.
 \end{description}
 
 \begin{note}
-- 
2.21.0

