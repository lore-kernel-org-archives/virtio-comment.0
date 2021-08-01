Return-Path: <mgurtovoy@nvidia.com>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
Subject: [PATCH 1/1] Fix reserved Feature bits numbering
Date: Sun, 1 Aug 2021 15:45:27 +0300
Message-ID: <20210801124527.35655-1-mgurtovoy@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: virtio-comment@lists.oasis-open.org, mst@redhat.com, cohuck@redhat.com
Cc: stefanha@redhat.com, eperezma@redhat.com, oren@nvidia.com, Max
 Gurtovoy <mgurtovoy@nvidia.com>
List-ID: <virtio-comment.lists.oasis-open.org>

This should have been updated during VIRTIO_F_NOTIFICATION_DATA and
VIRTIO_F_NOTIF_CONFIG_DATA standartization.

Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
---
 content.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/content.tex b/content.tex
index 5c70a3c..e9a32fa 100644
--- a/content.tex
+++ b/content.tex
@@ -99,10 +99,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
 \begin{description}
 \item[0 to 23] Feature bits for the specific device type
 
-\item[24 to 37] Feature bits reserved for extensions to the queue and
+\item[24 to 39] Feature bits reserved for extensions to the queue and
   feature negotiation mechanisms
 
-\item[38 and above] Feature bits reserved for future extensions.
+\item[40 and above] Feature bits reserved for future extensions.
 \end{description}
 
 \begin{note}
-- 
2.21.0

