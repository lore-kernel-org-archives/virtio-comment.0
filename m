Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579451E282D
	for <virtio-comment@lists.linux.dev>; Tue, 17 Dec 2024 11:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734433696; cv=none; b=hCRcjnjejkdnqzpgIUJb8hxrRyV1++CZR5EuPTHXcEUau5zTxlCuVOLgho2xqmxgl9g76+t3N6DvD6PA9mYeGOf4T+AGhNYrqS9iAgS97oMjaFOZAHiu8CVS/sY7hROO/B1XkIVUfZR0QKQOV1mNFfZXTunTmN+CecbzG3E5Ff4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734433696; c=relaxed/simple;
	bh=cnc8zIEbfUuGI33948RqG/RS8b/YgAH+tRVxLbxjAlM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HbXNMVRQsiLYvpM9boIC0jXSVfHNkIwgQsRUYAqR2Gmfe00p9rHuuUkU4TEmLe7a6ttQyrv5Xbq44E2M1GzW0SX5eC50fMaO+hGr0eX+nhb1SGlDLwhDphq3aHeYIbp3BRT0usZKSNjb67ws8mRGep6ktZhWxo4Xw3AaATyR8h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1tNVQy-0000KN-JQ; Tue, 17 Dec 2024 12:08:12 +0100
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Tue, 17 Dec 2024 12:07:55 +0100
Subject: [PATCH v2 1/2] virtio-net: Fix receive buffer size typo
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-v1-4-topic-virtio-net-rx-timestamping-v2-1-4d9935910280@pengutronix.de>
References: <20241217-v1-4-topic-virtio-net-rx-timestamping-v2-0-4d9935910280@pengutronix.de>
In-Reply-To: <20241217-v1-4-topic-virtio-net-rx-timestamping-v2-0-4d9935910280@pengutronix.de>
To: virtio-comment@lists.linux.dev
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, kernel@pengutronix.de, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 Parav Pandit <parav@nvidia.com>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: virtio-comment@lists.linux.dev

The commit 00806815385340dd411cc67df3f6837935bb5e26 introduced a slight
typo in the struct virtio_net_hdr size calculation depending on
VIRTIO_NET_F_HASH_REPORT negotiation.

Without VIRTIO_NET_F_HASH_REPORT the struct is smaller than with the
feature. This mix up only occurs in one instance; sizes are correct in
all other occurences.

Fix this typo.

Fixes: 008068153853 ("virtio-net: Fix receive buffer size calculation text")
Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Reviewed-by: Parav Pandit <parav@nvidia.com>
---
 device-types/net/description.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 4e4ffdb6e04e346af491edf65886fa096e506abc..08736b6804eafb303a5cfb2f27ec200cec8bd942 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -789,10 +789,10 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network Devi
 the IPv6 header, plus 65535 bytes of maximum IPv6 payload including any
 extension header), otherwise 1514 bytes.
 When VIRTIO_NET_F_HASH_REPORT is not negotiated, the required receive buffer
-size is either 65601 or 1526 bytes accounting for 20 bytes of
+size is either 65601 or 1526 bytes accounting for 12 bytes of
 \field{struct virtio_net_hdr} followed by receive packet.
 When VIRTIO_NET_F_HASH_REPORT is negotiated, the required receive buffer
-size is either 65609 or 1534 bytes accounting for 12 bytes of
+size is either 65609 or 1534 bytes accounting for 20 bytes of
 \field{struct virtio_net_hdr} followed by receive packet.
 
 \drivernormative{\paragraph}{Setting Up Receive Buffers}{Device Types / Network Device / Device Operation / Setting Up Receive Buffers}

-- 
2.47.0

