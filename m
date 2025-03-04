Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0100D1FAC42
	for <virtio-comment@lists.linux.dev>; Tue,  4 Mar 2025 08:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741075205; cv=none; b=tE8MLs+25NLkNvCu/vAxzITXnGG60yY4zkkW+eAsgxBI0nMyYv7O8svwHY+rnPkGID4j3BsiRor6utH4FpcL8D5eHwVgjvd96t1SRMz4juCt34EFru8uzC++kHaueUynogoh5bZeJP0xCAXLbKyy4PJnrLY+regskUHW68iyPpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741075205; c=relaxed/simple;
	bh=E394ffyTDhiWuK5pANsvyBp3au8GOTsTGEa/3NBJsRA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=P1hwQweYvVTamfvxYj5pvj+z4NJ9NHK7t375GdSDR2YTryv7522ocVWruA7ciMtc/5AQA7pke6gnrBMJ4sO7zGjRtLTLuqNcvniUkhaGFXRTg525K3ycr0on+SdeGuou7S492vVNDZWt20eVT4zyqXPvqo6cCJeVQfQLKq/ajl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=ZWTWMQc9; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="ZWTWMQc9"
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 523MDA2U000672;
	Tue, 4 Mar 2025 00:00:01 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=UVo0xYBZSV3IXdrHm1oEMP2
	rTuDwOm3Gy6+Hqj6yH5o=; b=ZWTWMQc9tfDlnSwQnxnO6CkDpfkjUKlda19vguj
	LDgB/VqqI2GLdn2E2nGdUPAA6n9gxS+UFKJMQNspfE3M3UOZc2TIq97ST7/Qtij1
	+6MS759cpdcIoy9yamyKulY5SOZVmN/+vrOQ1F9pF2NXY63nOFSejLlRdBlk4Nzw
	1x/DYObI6ouxEl2HJ4JP23/xCl9EzqBQ+lXqZE7knbPP1VOWEPfxTqnNhL7GNq5e
	dHWDjcWMI/XMip89MWzm4RUXwDuwS0Dj+Pi8u8A7gMIe86qb0L3e6tj8vOS+Aoqo
	NX1gLtTH2WvJgehciMjPGBtFrVsEgpkZnDzcIax647v0zSQ==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 4542mudmcu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 00:00:00 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 3 Mar 2025 23:59:59 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 3 Mar 2025 23:59:59 -0800
Received: from 5810.marvell.com (unknown [10.29.45.105])
	by maili.marvell.com (Postfix) with ESMTP id 01FD13F707A;
	Mon,  3 Mar 2025 23:59:56 -0800 (PST)
From: Kommula Shiva Shankar <kshankar@marvell.com>
To: <pabeni@redhat.com>, <willemb@google.com>, <jasowang@redhat.com>,
        <parav@nvidia.com>, <virtio-comment@lists.linux.dev>
CC: <ndabilpuram@marvell.com>, <jerinj@marvell.com>, <rbhansali@marvell.com>
Subject: [PATCH v4] virtio-net: Introduce a new field to indicate outer network header offset
Date: Tue, 4 Mar 2025 13:29:55 +0530
Message-ID: <20250304075955.208450-1-kshankar@marvell.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ZWeHQ2jwhTBk03vaGQHipTXj4GC8SoIW
X-Authority-Analysis: v=2.4 cv=H6Ihw/Yi c=1 sm=1 tr=0 ts=67c6b300 cx=c_pps a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=M5GUcnROAAAA:8 a=pkRBN4AxHTzZ1_YWFoAA:9 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-GUID: ZWeHQ2jwhTBk03vaGQHipTXj4GC8SoIW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_04,2025-03-03_04,2024-11-22_01

This patch introduces a new field in the virtio_net_header called outer_nh_offset, along with a new net device feature, VIRTIO_NET_F_OUT_NET_HEADER.

Currently, drivers lack a dedicated field to signal the start of the network header to the device when performing checksum offload
and segmentation offload. This requires reading packet, which significantly affects performance in data path.
Additionally, some hardware implementations require knowledge of the outer L3 offset (aka L2 length) for inline IPsec hardware acceleration.

To address this limitation, we propose to introduce a new field in the virtio_net_header called
outer_nh_offset

The outer_nh_offset represents the start byte offset of the outer network header from the beginning of the packet

This issue was briefly discussed on the mailing list in a different thread, which can be found here
https://lore.kernel.org/all/DM4PR18MB4269FAAC3CFC7E57E25DFBD2DF8B2@DM4PR18MB4269.namprd18.prod.outlook.com/

v3 -> v4
 - Removed the union of new flag with existing flags. Added as a separate field
   in the virtio net header
 - Renamed out_nh_offset to outer_nh_offset to maintain consistency with other fields
 - Spellchecks in commit message description
v3: https://lore.kernel.org/all/20250217172509.107212-1-kshankar@marvell.com

v2 -> v3:
 - Rebase to virtio-1.4
 - Addressed pending review comments related to wording.
v2: https://lore.kernel.org/all/20250128142152.3662988-1-kshankar@marvell.com/

v1 -> v2:
 - explicitly state that the out_nh_offset can be set only when a valid network header is present.
 - updated out_nh_offset usage in the RX direction.
 - minor word cleanup.
v1: https://lore.kernel.org/virtio-comment/20250114171636.3175670-1-kshankar@marvell.com/

Signed-off-by: Kommula Shiva Shankar <kshankar@marvell.com>
---
 device-types/net/description.tex | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 8d30673..ca1242f 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -136,6 +136,10 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
 
 \item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM (68)] Device handles packets
   carried by a UDP tunnel with partial csum for the outer header.
+
+\item[VIRTIO_NET_F_OUT_NET_HEADER(69)] Driver can provide the start of \field{outer_nh_offset}
+ value. Device gains advantage by not reading packet to calculate outer network
+ header offset
 \end{description}
 
 \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device / Feature bits / Feature bit requirements}
@@ -599,6 +603,7 @@ \subsection{Device Operation}\label{sec:Device Types / Network Device / Device O
         le16 padding_reserved;  (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
         le16 outer_th_offset    (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
         le16 inner_nh_offset;   (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
+        le16 outer_nh_offset;   /* Only if VIRTIO_NET_F_OUT_NET_HEADER negotiated */
 };
 \end{lstlisting}
 
@@ -633,6 +638,11 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 \item The driver can send a completely checksummed packet.  In this case,
   \field{flags} will be zero, and \field{gso_type} will be VIRTIO_NET_HDR_GSO_NONE.
 
+\item When VIRTIO_NET_F_OUT_NET_HEADER is negotiated, the driver MAY optionally provide
+   the \field{outer_nh_offset} value. A nonzero value of \field{outer_nh_offset} indicates
+   a valid outer network header with in the packet, and specifies the offset in bytes from
+   the beginning of the packet. Otherwise \field{outer_nh_offset} MUST not be used.
+
 \item If the driver negotiated VIRTIO_NET_F_CSUM, it can skip
   checksumming the packet:
   \begin{itemize}
@@ -767,6 +777,11 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 \field{flags} to zero and SHOULD supply a fully checksummed
 packet to the device.
 
+If the VIRTIO_NET_F_OUT_NET_HEADER feature has been negotiated,
+the driver MAY set \field{outer_nh_offset} to indicate the start of the
+outer network header offset, if the packet contains a valid network header.
+Otherwise, \field{outer_nh_offset} is not used.
+
 If VIRTIO_NET_F_HOST_TSO4 is negotiated, the driver MAY set
 \field{gso_type} to VIRTIO_NET_HDR_GSO_TCPV4 to request TCPv4
 segmentation, otherwise the driver MUST NOT set
@@ -948,6 +963,11 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 If VIRTIO_NET_HDR_F_NEEDS_CSUM bit in \field{flags} is not set, the
 device MUST NOT use the \field{csum_start} and \field{csum_offset}.
 
+If the VIRTIO_NET_F_OUT_NET_HEADER feature has been negotiated,
+and \field{outer_nh_offset} is not zero, the device MAY use \field{outer_nh_offset}
+as the outer network header offset. Otherwise, device MUST NOT use
+the \field{outer_nh_offset}.
+
 If one of the VIRTIO_NET_F_HOST_TSO4, TSO6, USO or UFO options have
 been negotiated:
 \begin{itemize}
@@ -1102,6 +1122,9 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
   both the outer UDP checksum and the inner transport checksum
   have been validated, otherwise only one level of checksums (the outer one
   in case of tunnels) has been validated.
+\item If the VIRTIO_NET_F_OUT_NET_HEADER has been negotiated, and if the packet
+  contains a valid network header, \field{outer_nh_offset} MAY be set to indicate the
+  outer network header offset in packet.
 \end{enumerate}
 
 Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, UDP_TUNNEL
@@ -1215,6 +1238,10 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 device MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
 \field{gso_type}.
 
+If VIRTIO_NET_F_OUT_NET_HEADER has been negotiated, the device MAY
+set the \field{outer_nh_offset} to indicate outer network header offset, if packet contains
+a valid network header. Otherwise, the device MUST not use \field{outer_nh_offset}.
+
 If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the
 device MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
 \field{flags}, if so:
@@ -1302,6 +1329,10 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 
 The driver MUST ignore \field{flag} bits that it does not recognize.
 
+If VIRTIO_NET_F_OUT_NET_HEADER has been negotiated, and if \field{outer_nh_offset}
+is nonzero, the driver MAY use \field{outer_nh_offset} as outer network header
+offset. Otherwise, the driver MUST not use the \field{outer_nh_offset}.
+
 If VIRTIO_NET_HDR_F_NEEDS_CSUM bit in \field{flags} is not set or
 if VIRTIO_NET_HDR_F_RSC_INFO bit \field{flags} is set, the
 driver MUST NOT use the \field{csum_start} and \field{csum_offset}.
-- 
2.43.0

