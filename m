Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CD1137760
	for <virtio-comment@lists.linux.dev>; Mon, 24 Jun 2024 11:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719227350; cv=none; b=i49jp5bmkoXXOqzFr7HKcovQTPKGWDtb8rmc2n7OFx8Y2M5o2MCQqMNWLcIKlh+9Z/TtVT9g/5Lp6bbMsnu9yBrb70m7lpXLBXAk2I/UBWa+qC6hU25n3Arxb/c1NFmghA6U0tMtLgJYH2D4Hd1ksB5S2ajVNeHUbnlFADxdnh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719227350; c=relaxed/simple;
	bh=nShH8is7RsuDJDfWNOMHU+GlMiIj5mmQGyDPKM3618I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fGbCwXt1FM2lIdbYKd6Cy0JX+d/B5ffjBkYAVQR1Iy2zlI/HX1HA+putUT/NAd7nT+bKOKFzJ1T86D5+E6eav0l5bNmxWF4K5OX2mV3uYWbneKzuM4l0sX3t01WBbqgzgtSqzRkJY1ih/X1yRZ+4Ny3hMM7fafcvgRryVXvelAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1sLhZL-0006Ss-HB; Mon, 24 Jun 2024 13:09:07 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Mon, 24 Jun 2024 13:09:04 +0200
Subject: [PATCH RESEND 1/4] virtio-net: support transmit hash report
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-v1-4-topic-virtio-net-timestamping-v1-1-fa3c163e4aa9@pengutronix.de>
References: <20240624-v1-4-topic-virtio-net-timestamping-v1-0-fa3c163e4aa9@pengutronix.de>
In-Reply-To: <20240624-v1-4-topic-virtio-net-timestamping-v1-0-fa3c163e4aa9@pengutronix.de>
To: virtio-comment@lists.linux.dev, kernel@pengutronix.de
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.13.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: virtio-comment@lists.linux.dev

Virtio-net supports sharing the flow hash from device to driver on rx.
Do the same in the other direction for robust routing and telemetry.

Experimental results mirror what the theory suggests: where IPv6
FlowLabel is included in path selection (e.g., LAG/ECMP), flowlabel
rotation on TCP timeout avoids the vast majority of TCP disconnects
that would otherwise have occurred during link failures in long-haul
backbones, when an alternative path is available.

Rotation can be applied to various bad connection signals, such as
timeouts and spurious retransmissions. In aggregate, such flow level
signals can help locate network issues.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 device-types/net/description.tex | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 61cce1f..eb2c08e 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -88,6 +88,8 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
 \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
     channel.
 
+\item[VIRTIO_NET_F_TX_HASH(49)] Driver sends hash report
+
 \item[VIRTIO_NET_F_DEVICE_STATS(50)] Device can provide device-level statistics
     to the driver through the control virtqueue.
 
@@ -641,6 +643,34 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 
 If VIRTIO_NET_HDR_F_NEEDS_CSUM is not set, the device MUST NOT
 rely on the packet checksum being correct.
+
+\paragraph{Hash calculation for outgoing packets}
+\label{sec:Device Types / Network Device / Device Operation / Packet Transmission / Hash calculation for outgoing packets }
+
+If the VIRTIO_NET_F_TX_HASH was negotiated and the packet includes a hash, the driver uses
+the structure virtio_net_hdr_hash_ts instead of virtio_net_hdr and increases the \field{hdr_len} accordingly.
+
+\begin{lstlisting}
+  struct virtio_net_hdr_hash_ts {
+    struct {
+      struct virtio_net_hdr hdr;
+      __le33 value;
+      __le16 report;
+      __le16 flow_state;
+    } hash;
+    __u32 reserved;
+  };
+\end{lstlisting}
+
+The driver fills \field{hash_value} with the value of the calculated hash and \field{hash_report} with the report type of the calculated hash.
+
+Possible values that the driver supports in \field{hash_report} are defined below.
+
+\begin{lstlisting}
+#define VIRTIO_NET_HASH_REPORT_L4             (1 << 10)
+#define VIRTIO_NET_HASH_REPORT_OTHER          (1 << 11)
+\end{lstlisting}
+
 \paragraph{Packet Transmission Interrupt}\label{sec:Device Types / Network Device / Device Operation / Packet Transmission / Packet Transmission Interrupt}
 
 Often a driver will suppress transmission virtqueue interrupts

-- 
2.42.0

