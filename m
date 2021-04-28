Return-Path: virtio-comment-return-1838-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2F442986584
	for <virtio-comment@lists.oasis-open.org>; Wed, 28 Apr 2021 06:35:22 +0000 (UTC)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Wed, 28 Apr 2021 09:35:10 +0300
Message-Id: <20210428063511.4638-2-yuri.benditovich@daynix.com>
In-Reply-To: <20210428063511.4638-1-yuri.benditovich@daynix.com>
References: <20210428063511.4638-1-yuri.benditovich@daynix.com>
Subject: [virtio-comment] [PATCH v2 1/2] virtio-net: fix mistake: segmentation -> fragmentation
Content-Type: text/plain; charset="US-ASCII"
To: virtio-comment@lists.oasis-open.org
Cc: yan@daynix.com
List-ID: <virtio-comment.lists.oasis-open.org>

The VIRTIO_NET_F_HOST_UFO feature fragments the packet. Only
first fragment has a UDP header.

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
---
 content.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/content.tex b/content.tex
index e536fd4..63a5c52 100644
--- a/content.tex
+++ b/content.tex
@@ -3372,7 +3372,7 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 
 If VIRTIO_NET_F_HOST_UFO is negotiated, the driver MAY set
 \field{gso_type} to VIRTIO_NET_HDR_GSO_UDP to request UDP
-segmentation, otherwise the driver MUST NOT set
+fragmentation, otherwise the driver MUST NOT set
 \field{gso_type} to VIRTIO_NET_HDR_GSO_UDP.
 
 The driver SHOULD NOT send to the device TCP packets requiring segmentation offload
-- 
2.25.1


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

