Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C656D13791E
	for <virtio-comment@lists.linux.dev>; Mon, 24 Jun 2024 11:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719227351; cv=none; b=ClGaKbTti91/Q++X8bp+UvLKgJW802wyCziaKqMFLGX7cN2j8j4OKCbVPjhPEMQfKjcMSMsVLYnWgDUjFQv9FXJhLRmZRJDdDoMGJskpuCjdXHwUQ/aiDeOHGDuWVbyFXBkHDDdOUQyPBvSOTYOwsff5atDgpprSnd+HkrHOuCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719227351; c=relaxed/simple;
	bh=6emKOvYwZuL3A5xBRK2Y5Qrg1v0YAc/4YRg4Bq7CTtA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lpwzljQxDSw9D8q3PU62p2hVKPhoqK8bbhbLTUMbNIxsW7G+7bwMBaR2OB2lfafcUJhPY6+1flIkh6xLfjGNJyqXy1b77EI9RZrrwuJjf3E0D2j+u8ioU8xMjQQoRQ8FQXLhIWU3G5bXZacbbGbnf7sBIaXkF3vxM2eFIlcbVbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1sLhZM-0006Ss-1K; Mon, 24 Jun 2024 13:09:08 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Mon, 24 Jun 2024 13:09:06 +0200
Subject: [PATCH RESEND 3/4] virtio-net: support transmit ptp timestamps
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-v1-4-topic-virtio-net-timestamping-v1-3-fa3c163e4aa9@pengutronix.de>
References: <20240624-v1-4-topic-virtio-net-timestamping-v1-0-fa3c163e4aa9@pengutronix.de>
In-Reply-To: <20240624-v1-4-topic-virtio-net-timestamping-v1-0-fa3c163e4aa9@pengutronix.de>
To: virtio-comment@lists.linux.dev, kernel@pengutronix.de
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.13.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: virtio-comment@lists.linux.dev

Add optional PTP hardware tx timestamp offload for virtio-net.

Accurate RTT measurement requires timestamps close to the wire.
Introduce virtio feature VIRTIO_NET_F_TX_TSTAMP, the transmit
equivalent to VIRTIO_NET_F_RX_TSTAMP.

The driver sets VIRTIO_NET_HDR_F_TSTAMP to request a timestamp
returned on completion. If the feature is negotiated, the device
either places the timestamp or clears the feature bit.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 device-types/net/description.tex | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 09d9c28..c438b0b 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -88,6 +88,8 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
 \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
     channel.
 
+\item[VIRTIO_NET_F_TX_TSTAMP(47)] Device sends TAI transmit time
+
 \item[VIRTIO_NET_F_RX_TSTAMP(48)] Device sends TAI receive time
 
 \item[VIRTIO_NET_F_TX_HASH(49)] Driver sends hash report
@@ -532,6 +534,12 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 \item The header and packet are added as one output descriptor to the
   transmitq, and the device is notified of the new entry
   (see \ref{sec:Device Types / Network Device / Device Initialization}~\nameref{sec:Device Types / Network Device / Device Initialization}).
+
+\item If the driver negotiated the VIRTIO_NET_F_TX_TSTAMP and hardware
+  timestamping is supported on the device, the VIRTIO_NET_HDR_F_TSTAMP
+  flag is set. One writable input descriptor with the size of a timestamp,
+  i.e. \field{tstamp} in virtio_net_hdr_hash_ts,
+  is appended to the output descriptor.
 \end{enumerate}
 
 \drivernormative{\paragraph}{Packet Transmission}{Device Types / Network Device / Device Operation / Packet Transmission}
@@ -675,6 +683,17 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 #define VIRTIO_NET_HASH_REPORT_OTHER          (1 << 11)
 \end{lstlisting}
 
+\paragraph{Timestamping for outgoing packets}
+\label{sec:Device Types / Network Device / Device Operation / Packet Transmission / Timestamping for outgoing packets}
+
+If the feature VIRTIO_NET_F_TX_TSTAMP is negotiated, the driver sets \field{hdr_len} to the virtio_net_hdr_hash_ts.
+
+The driver sets VIRTIO_NET_HDR_F_STAMP to request a timestamp returned on completion in \field{tstamp}.
+
+The device gets the second, writable descriptor, generates a timestamp and writes it to the \field{tstamp}.
+
+Finally, after transmitting the packet, the driver gets the \field{tstamp} from the packet.
+
 \paragraph{Packet Transmission Interrupt}\label{sec:Device Types / Network Device / Device Operation / Packet Transmission / Packet Transmission Interrupt}
 
 Often a driver will suppress transmission virtqueue interrupts

-- 
2.42.0

