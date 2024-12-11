Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECA9236FA9
	for <virtio-comment@lists.linux.dev>; Wed, 11 Dec 2024 10:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733911517; cv=none; b=ITtgQRUEU8qyDQK4PtEJftDmpmm0bV7T0oeW7oj8ChE6Yd6iQOHxuyJFD5cekVXaIzR3lw0JQsBbzBppoBu7p4CNP6BJ4VT1IQ0d8iflXRHaum25IxMqchG3531JHdMRKk8MWZtsMdfK7JUIF7O/ExE96MQYesS7M7WzNm1rIHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733911517; c=relaxed/simple;
	bh=V/2vQtw9dVJ9o6NbRgPUIV09SuSoEk2ExMcmp9IYuto=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mZn4rHbLriDFn14vCIax49UWjqi3+SHoJyhmx8QpDbuO8nXBVMeBVQH2WQnWztYoSvqycAcYGMEwApenlaLXcUoRbywlxV/3kFm06buvX8XtyY9t+IaKHqNcRqzG5QKLgzz80QihH0i/1v3UhQjQ9ElHg2VhMnOL+Cr/NmxozQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1tLJaj-0002sL-0P; Wed, 11 Dec 2024 11:05:13 +0100
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Wed, 11 Dec 2024 11:05:03 +0100
Subject: [PATCH 1/2] virtio-net: Fix receive buffer size typo
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-v1-4-topic-virtio-net-rx-timestamping-v1-1-bdd882e7b53f@pengutronix.de>
References: <20241211-v1-4-topic-virtio-net-rx-timestamping-v1-0-bdd882e7b53f@pengutronix.de>
In-Reply-To: <20241211-v1-4-topic-virtio-net-rx-timestamping-v1-0-bdd882e7b53f@pengutronix.de>
To: virtio-comment@lists.linux.dev
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, kernel@pengutronix.de, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
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

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
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

