Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181CB135A7C
	for <virtio-comment@lists.linux.dev>; Mon, 24 Jun 2024 11:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719227351; cv=none; b=WpZp02iMQKtawI285RAhluLe1NcgyBEx2sXGEuWJeulaaBaKrZEGGS9JoN1+7NLxzJ90Z0FyFWQL6hADXqR24+RH4SxmunwjZXUWxbSN3VIe/uEERafjH+03PGkkF6xgNNHJWuymcFjH7dJpQuiTWBEraQaKslZLR7Bb97sAp5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719227351; c=relaxed/simple;
	bh=HjgwTg/GbWBqobNnvk+K673lnBhX+suk0bY5SkvqD2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aaEqLTGMYDV3TPMoSIyIpspIgVkXU76mFEofgszNndk021LUgmCd3Iqnofzu+xnC+PTgzhx74GoioFFBdTdpQZxUC3ugm2bz6PXxWJvNc980iwUd7TYv0e2TdHtUgEsZIPG7bJYFyH3gs4KcAds831gIg3ijuMuGP0BUpav+/Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1sLhZM-0006Ss-8u; Mon, 24 Jun 2024 13:09:08 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Mon, 24 Jun 2024 13:09:07 +0200
Subject: [PATCH RESEND 4/4] virtio-net: support future packet transmit time
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-v1-4-topic-virtio-net-timestamping-v1-4-fa3c163e4aa9@pengutronix.de>
References: <20240624-v1-4-topic-virtio-net-timestamping-v1-0-fa3c163e4aa9@pengutronix.de>
In-Reply-To: <20240624-v1-4-topic-virtio-net-timestamping-v1-0-fa3c163e4aa9@pengutronix.de>
To: virtio-comment@lists.linux.dev, kernel@pengutronix.de
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.13.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: virtio-comment@lists.linux.dev

Add optional transmit time (SO_TXTIME) offload for virtio-net.

The Linux TCP/IP stack tries to avoid bursty transmission and network
congestion through pacing: computing an skb delivery time based on
congestion information. Userspace protocol implementations can achieve
the same with SO_TXTIME. This may also reduce scheduling jitter and
improve RTT estimation.

Pacing can be implemented in ETF or FQ qdiscs or offloaded to NIC
hardware. Allow virtio-net driver to offload for the same reasons.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 device-types/net/description.tex | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index c438b0b..bae1a59 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -88,6 +88,8 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
 \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
     channel.
 
+\item[VIRTIO_NET_F_TX_TIME(46)] Driver sets TAI delivery time
+
 \item[VIRTIO_NET_F_TX_TSTAMP(47)] Device sends TAI transmit time
 
 \item[VIRTIO_NET_F_RX_TSTAMP(48)] Device sends TAI receive time
@@ -540,6 +542,9 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
   flag is set. One writable input descriptor with the size of a timestamp,
   i.e. \field{tstamp} in virtio_net_hdr_hash_ts,
   is appended to the output descriptor.
+
+\item If the driver negotiated the VIRTIO_NET_F_TX_TIME the transmit time
+of the packet is written to the \field{tstamp}.
 \end{enumerate}
 
 \drivernormative{\paragraph}{Packet Transmission}{Device Types / Network Device / Device Operation / Packet Transmission}

-- 
2.42.0

