Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC521A4E70
	for <virtio-comment@lists.linux.dev>; Fri,  7 Feb 2025 07:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738914550; cv=none; b=jpxoPt/b4SLli1dTssacLUTQMeuelVIdBkOz6e8+r4xzVhpiTpQlfP5Def3ylO0SsW+g9SZBZHMpoRMhpUcd0EjNUlA0/J5kyJbE03Ssgq5R976cEosbpisrdYmMpI/TMrflJDvOnXonUFvDU0sZ+qhw0VWzvb9rsZSWDzW78Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738914550; c=relaxed/simple;
	bh=RNIGLw9ZJc2sp+glTOdwuZ/3KOYNpOTBviXp+AmL+l8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pLsfomRFzcBKILLSpGR0Cvw+4DE/dYIGPgG3YOnZ3vyMixGcjNLVRwCxeBQM5aNq5np27eTsT4UsfGptHge9NPTx8i9ybgaQkkCEm7pyKj0ZoVWc8YRAiFQT6xyz3XVAUaZ50EOihEJbZT+VXAjk9Nezx4mEFYMa9tfvs49BkAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1tgJ6m-0004CD-6e; Fri, 07 Feb 2025 08:49:04 +0100
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Fri, 07 Feb 2025 08:48:47 +0100
Subject: [PATCH] virtio-net: Fix receive buffer size typo
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-v1-4-topic-virtio-net-receive-buffer-fix-v1-1-efcef167d6bc@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAN66pWcC/x2NwQ7CIBAFf6XZs5sAtpb4K8aD4EP3As2CxKTpv
 0s8zhxmdqpQQaXrtJOiS5WSB9jTRPH9yC+wPAeTM24xzqzcLc/cyiaRu2iTwhmNFRHSweGTEpS
 TfDlcZr+GxXt7jjRym2Lo/+p2P44fdvDJenoAAAA=
X-Change-ID: 20250207-v1-4-topic-virtio-net-receive-buffer-fix-b6487b58813c
To: virtio-comment@lists.linux.dev
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
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

---
base-commit: b2990c8a6642e696d6f269d1db991b2c928d3a9f
change-id: 20250207-v1-4-topic-virtio-net-receive-buffer-fix-b6487b58813c

Best regards,
-- 
Steffen Trumtrar <s.trumtrar@pengutronix.de>

