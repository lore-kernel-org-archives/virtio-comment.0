Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE3E3EA66
	for <virtio-comment@lists.linux.dev>; Thu, 23 May 2024 03:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716434621; cv=none; b=gARJ9jlAkrxFCQ0W3HtDFh0x7ry7uo5iuZPDIzoEU3/VDwsmwut6hz2Aqq/uaEczaGytpdN9BkOm+m0SSlK6WPZ121SnID3C52CARVYbTxHI8/4nPReMdFVKdnXq7YWKGr3pqwQUAZLDdbjNye3pwHL4VpxjSCsa2TrnpibAA44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716434621; c=relaxed/simple;
	bh=GoiiZNWQoQmGReQMe3J+0eidcpngkTdbybfCu0TMbDs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tz9T+/+IqWN9EfYdFn3MwzP9dbY/winKkFQWv9O2Z2fqj6BlimR+VMAider066s4coEStM38VoCmjj0seCTQcx/F9VSI+rXpdjICuFVsIKVuC7LtLqnKK+yMmXCy0ddVX6GHLjYWeGcVGY8yvC+6GKAeG3F6lbmCvxP2pYhkIe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Qm1EYlrl; arc=none smtp.client-ip=115.124.30.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Qm1EYlrl"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1716434615; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=DP4bqhMIepgowll/NqWXnJz8FLkmEe53mwd7z98W78k=;
	b=Qm1EYlrl/qkvods0dcr12c/0RgRw2BAR9c+B5583O2RMGa9sK/9Bk8mL46dFqXny7Szu5Rhn2lhGZ488djLqX9/lyBCYgXSoy1rdHxgRBB8wnoirqUDcRBJ1HB8dSHPxMMOCm28ZJqBEMN2AeZZL9QLbCXXLN3cYCVG/aMLqGBQ=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R601e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045075189;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0W71CNbI_1716434612;
Received: from localhost(mailfrom:hengqi@linux.alibaba.com fp:SMTPD_---0W71CNbI_1716434612)
          by smtp.aliyun-inc.com;
          Thu, 23 May 2024 11:23:34 +0800
From: Heng Qi <hengqi@linux.alibaba.com>
To: virtio-comment@lists.linux.dev
Cc: Jason Wang <jasowang@redhat.com>,
	Parav Pandit <parav@nvidia.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: [PATCH v3] virtio-net: clarify coalescing parameters settings
Date: Thu, 23 May 2024 11:23:32 +0800
Message-Id: <20240523032332.50995-1-hengqi@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The device can set any initial coalescing parameters (0 or non-zero)
for the receive/send queue before the setting command is executed,
not just 0, enhancing device performance even without DIM enabled.

So we need to clarify descriptions that don't fit the behavior.

Suggested-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
---
v2->v3:
  - Clarify description to be more generic. @Parav

v1->v2:
  - Update description. @Jason

 device-types/net/description.tex | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 61cce1f..f51e0d8 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -1803,6 +1803,14 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
                                         for an enabled transmit/receive virtqueue whose index is \field{vq_index}.
 \end{enumerate}
 
+If the VIRTIO_NET_F_NOTF_COAL or VIRTIO_NET_F_VQ_NOTF_COAL feature is negotiated,
+the device may apply any coalescing parameters to each transmit/receive virtqueue
+before the driver successfully performs one of the VIRTIO_NET_CTRL_NOTF_COAL set commands.
+
+The driver can query the current coalescing parameters of any enabled transmit/receive
+virtqueue using the VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET command, before or after any
+VIRTIO_NET_CTRL_NOTF_COAL set command is done.
+
 The device may generate notifications more or less frequently than specified by set commands of the VIRTIO_NET_CTRL_NOTF_COAL class.
 
 If coalescing parameters are being set, the device applies the last coalescing parameters set for a
@@ -1884,18 +1892,16 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 The device MUST respond to VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET and VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET commands with
 VIRTIO_NET_ERR if the designated virtqueue is not an enabled transmit or receive virtqueue.
 
-Upon disabling and re-enabling a transmit virtqueue, the device MUST set the coalescing parameters of the virtqueue
-to those configured through the VIRTIO_NET_CTRL_NOTF_COAL_TX_SET command, or, if the driver did not set any TX coalescing parameters, to 0.
-
-Upon disabling and re-enabling a receive virtqueue, the device MUST set the coalescing parameters of the virtqueue
-to those configured through the VIRTIO_NET_CTRL_NOTF_COAL_RX_SET command, or, if the driver did not set any RX coalescing parameters, to 0.
-
 The behavior of the device in response to set commands of the VIRTIO_NET_CTRL_NOTF_COAL class is best-effort:
 the device MAY generate notifications more or less frequently than specified.
 
 A device SHOULD NOT send used buffer notifications to the driver if the notifications are suppressed, even if the notification conditions are met.
 
-Upon reset, a device MUST initialize all coalescing parameters to 0.
+Upon disabling and then re-enabling a transmit or receive virtqueue, the device
+MUST apply the same coalescing parameters to the virtqueue as were set before
+it was disabled.
+
+Upon reset, a device MAY set any coalescing parameters for all transmit or receive virtqueues.
 
 \paragraph{Device Statistics}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Device Statistics}
 
-- 
2.32.0.3.g01195cf9f

