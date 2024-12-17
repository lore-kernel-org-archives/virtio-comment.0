Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9BF1DF24B
	for <virtio-comment@lists.linux.dev>; Tue, 17 Dec 2024 11:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734433697; cv=none; b=SwEq+ODz4AkBqIVojVX3AgmYcTPUKcxruH8SK2xV/X1ThgJ1BR1ZAVJCTo5JFGmLlxygrHNlbG3GXETC5fwIOjg0Nqjo17QR9+KHoOqc/IAROnGDqftPSvL3F7ybOMWJvQ14UpdKn8upUurXS57ZzS9p/djk3O9WO4+1pdB0JXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734433697; c=relaxed/simple;
	bh=uwFuAf/tC60ky3UCqq5ScCiIjZljJddtLeRunVyeO9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P75EcCXIu3Zww+Xbza3eWhfnoIsj2HrSYl+guqcaRonSzFsRuCrgbgUADSdFZ+4hIR78R/ZnqCGcnCkvoZJIvrBDH2hMiOevpNgsebLxeLuLbZ/efL+1drz5u79G7zBMVQipzgwbI5UHP1KDJUUJWSchj3D0tt+CJrWJv3GIStE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1tNVQz-0000KN-2J; Tue, 17 Dec 2024 12:08:13 +0100
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Tue, 17 Dec 2024 12:07:56 +0100
Subject: [PATCH v2 2/2] virtio-net: support receive ptp timestamps
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-v1-4-topic-virtio-net-rx-timestamping-v2-2-4d9935910280@pengutronix.de>
References: <20241217-v1-4-topic-virtio-net-rx-timestamping-v2-0-4d9935910280@pengutronix.de>
In-Reply-To: <20241217-v1-4-topic-virtio-net-rx-timestamping-v2-0-4d9935910280@pengutronix.de>
To: virtio-comment@lists.linux.dev
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, kernel@pengutronix.de, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.14.2
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
 device-types/net/description.tex | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 08736b6804eafb303a5cfb2f27ec200cec8bd942..dbd8438a8a897838d7a4b1d2a94ab1d3dde053d7 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -88,6 +88,8 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
 \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
     channel.
 
+\item[VIRTIO_NET_F_RX_TSTAMP(49)] Device sends TAI receive time
+
 \item[VIRTIO_NET_F_DEVICE_STATS(50)] Device can provide device-level statistics
     to the driver through the control virtqueue.
 
@@ -535,6 +537,7 @@ \subsection{Device Operation}\label{sec:Device Types / Network Device / Device O
 #define VIRTIO_NET_HDR_F_NEEDS_CSUM    1
 #define VIRTIO_NET_HDR_F_DATA_VALID    2
 #define VIRTIO_NET_HDR_F_RSC_INFO      4
+#define VIRTIO_NET_HDR_F_TSTAMP        8
         u8 flags;
 #define VIRTIO_NET_HDR_GSO_NONE        0
 #define VIRTIO_NET_HDR_GSO_TCPV4       1
@@ -551,6 +554,7 @@ \subsection{Device Operation}\label{sec:Device Types / Network Device / Device O
         le32 hash_value;        (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
         le16 hash_report;       (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
         le16 padding_reserved;  (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
+        le64 tstamp;            (Only if VIRTIO_NET_F_RX_TSTAMP negotiated)
 };
 \end{lstlisting}
 
@@ -794,6 +798,8 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network Devi
 When VIRTIO_NET_F_HASH_REPORT is negotiated, the required receive buffer
 size is either 65609 or 1534 bytes accounting for 20 bytes of
 \field{struct virtio_net_hdr} followed by receive packet.
+When VIRTIO_NET_F_RX_TSTAMP is negotiated, the sizes increase by 8 byte to 65609 or 1534
+without VIRTIO_NET_F_HASH_REPORT, and 65617 or 1542 with VIRTIO_NET_F_HASH_REPORT respectively.
 
 \drivernormative{\paragraph}{Setting Up Receive Buffers}{Device Types / Network Device / Device Operation / Setting Up Receive Buffers}
 
@@ -804,13 +810,16 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network Devi
 	VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6 are negotiated, the driver SHOULD populate
       the receive queue(s) with buffers of at least 65609 bytes if
       VIRTIO_NET_F_HASH_REPORT is negotiated, and of at least 65601 bytes if not.
+      With VIRTIO_NET_F_RX_TSTAMP negotiated, add 8 bytes to this minimal buffer sizes.
     \item Otherwise, the driver SHOULD populate the receive queue(s)
       with buffers of at least 1534 bytes if VIRTIO_NET_F_HASH_REPORT
       is negotiated, and of at least 1526 bytes if not.
+      With VIRTIO_NET_F_RX_TSTAMP negotiated, add 8 bytes to this minimal buffer sizes.
   \end{itemize}
 \item If VIRTIO_NET_F_MRG_RXBUF is negotiated, each buffer MUST be at
 least size of \field{struct virtio_net_hdr},
-i.e. 20 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated, and 12 bytes if not.
+i.e. 20 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated, and 12 bytes if not and
+28 bytes or 20 bytes if VIRTIO_NET_F_RX_TSTAMP is also negotiated.
 \end{itemize}
 
 \begin{note}
@@ -819,7 +828,8 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network Devi
 
 When calculating the size of \field{struct virtio_net_hdr}, the driver
 MUST consider all the fields inclusive up to \field{padding_reserved},
-i.e. 20 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated, and 12 bytes if not.
+i.e. 20 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated, and 12 bytes if not and
+28 bytes or 20 bytes if VIRTIO_NET_F_RX_TSTAMP is also negotiated.
 
 If VIRTIO_NET_F_MQ is negotiated, each of receiveq1\ldots receiveqN
 that will be used SHOULD be populated with receive buffers.
@@ -1284,6 +1294,12 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 #define VIRTIO_NET_HASH_REPORT_UDPv6_EX        9
 \end{lstlisting}
 
+\paragraph{Timestamping for incoming packets}
+\label{sec:Device Types / Network Device / Device Operation / Processing of Incoming Packets / Timestamping for incoming packets}
+
+If the feature VIRTIO_NET_F_RX_TSTAMP is negotiated, the device may pass receive timestamps for incoming packets via \field{tstamp}
+in the \field{struct virtio_net_hdr} and signals this with the VIRTIO_NET_HDR_F_TSTAMP bit in \field{flags}.
+
 \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue}
 
 The driver uses the control virtqueue (if VIRTIO_NET_F_CTRL_VQ is

-- 
2.47.0

