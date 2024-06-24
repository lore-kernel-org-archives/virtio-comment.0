Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7EE12F360
	for <virtio-comment@lists.linux.dev>; Mon, 24 Jun 2024 11:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719227351; cv=none; b=MXx+Xsk2mcIGqhH0M4UBpTHAspPmlPMAW8T+imusYzQN4Mtmx8hg2iUd6+nuNTMtXwkfk2RxyB6JCbTYR7Ry/bJhUnEcsXiBNG4ruMeCBU+NcIf+ow6smuw7ZfGoPUjTsqnooH+2AO4jMnBmAEVAqIH4k5/TKuTLjoBU3ec0vN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719227351; c=relaxed/simple;
	bh=vgkRFfRQEI/tT08RRJ2OxCJCWsX0SdhP5I4K07pQfqU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MGwlGRwAgUFmR2oaTjIPurYRziqIJlSTzSpV+IqSfcWk87/7DS2HGA/CCsSdGKVc676CNSihy7rsh1ZuKu2lZdbZD9O11L+jgik2b2qfEaYRSSdBB1faPbfMG9VVqg148YmcrekTywVldqTVWLaKNkdlln1Llp00ANhfZI3MeW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1sLhZL-0006Ss-P9; Mon, 24 Jun 2024 13:09:07 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Mon, 24 Jun 2024 13:09:05 +0200
Subject: [PATCH RESEND 2/4] virtio-net: support receive ptp timestamps
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-v1-4-topic-virtio-net-timestamping-v1-2-fa3c163e4aa9@pengutronix.de>
References: <20240624-v1-4-topic-virtio-net-timestamping-v1-0-fa3c163e4aa9@pengutronix.de>
In-Reply-To: <20240624-v1-4-topic-virtio-net-timestamping-v1-0-fa3c163e4aa9@pengutronix.de>
To: virtio-comment@lists.linux.dev, kernel@pengutronix.de
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.13.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: virtio-comment@lists.linux.dev

Accurate RTT measurement requires timestamps close to the wire.
Introduce virtio feature VIRTIO_NET_F_RX_TSTAMP. If negotiated, the
virtio-net header is expanded with room for a timestamp.

A device may pass receive timestamps for all or some packets. Flag
VIRTIO_NET_HDR_F_TSTAMP signals whether a timestamp is recorded.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 device-types/net/description.tex | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index eb2c08e..09d9c28 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -88,6 +88,8 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
 \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
     channel.
 
+\item[VIRTIO_NET_F_RX_TSTAMP(48)] Device sends TAI receive time
+
 \item[VIRTIO_NET_F_TX_HASH(49)] Driver sends hash report
 
 \item[VIRTIO_NET_F_DEVICE_STATS(50)] Device can provide device-level statistics
@@ -415,6 +417,7 @@ \subsection{Device Operation}\label{sec:Device Types / Network Device / Device O
 #define VIRTIO_NET_HDR_F_NEEDS_CSUM    1
 #define VIRTIO_NET_HDR_F_DATA_VALID    2
 #define VIRTIO_NET_HDR_F_RSC_INFO      4
+#define VIRTIO_NET_HDR_F_TSTAMP        8
         u8 flags;
 #define VIRTIO_NET_HDR_GSO_NONE        0
 #define VIRTIO_NET_HDR_GSO_TCPV4       1
@@ -659,6 +662,7 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
       __le16 flow_state;
     } hash;
     __u32 reserved;
+    __le64 tstamp;
   };
 \end{lstlisting}
 
@@ -1177,6 +1181,13 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 #define VIRTIO_NET_HASH_REPORT_UDPv6_EX        9
 \end{lstlisting}
 
+\paragraph{Timestamping for incoming packets}
+\label{sec:Device Types / Network Device / Device Operation / Processing of Incoming Packets / Timestamping for incoming packets}
+
+If the feature VIRTIO_NET_F_RX_TSTAMP is negotiated, the \field{hdr_len} is set to the size of the virtio_net_hdr_hash_ts struct.
+The device may pass receive timestamps for incoming packets via \field{tstamp} and signals this with the
+VIRTIO_NET_HDR_F_TSTAMP flag.
+
 \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue}
 
 The driver uses the control virtqueue (if VIRTIO_NET_F_CTRL_VQ is

-- 
2.42.0

