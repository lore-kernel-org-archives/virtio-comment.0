Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B5F19F11B
	for <virtio-comment@lists.linux.dev>; Tue, 28 Jan 2025 14:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738075364; cv=none; b=Nq/tF6vgolCKmvM4H7TkshdQB1VWsF9iRQscnQRKYqg6yRCfUaOKw+wNFKb9YJVrSnCu93RuOqzPv0xeIsG9GOUV4HbxcjmU0tVkFKsj3fCAWLToKjRfCMAui3eAwu0FFLcqYYb1zoudxsF1o57sjuToqURbFJJUnDQkFiKg3Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738075364; c=relaxed/simple;
	bh=4sHJyHlZumGbica9mqnkTCIDNUR8WwmPEk8YcezFccc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UyP2dbYpTFYMgKb2iXui5nFwbO/qEM7GcJlDFLB4uQuj3PXK7RIqghGfRAVPWr9I3/MbxTDqJKqZUTs11KxiFUrD8egT3Zei/44UsSvPFS40b4yebGOqmPMvyPufcxXuFsdlOB6vr0UwCHmx/vh8EeIDnRzgfM1solSwgMRTY2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=OJ/u/X05; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="OJ/u/X05"
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50SC8CmX004988;
	Tue, 28 Jan 2025 06:21:57 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=oLTNyh32BmOz08NHoCC7n6e
	X4o/qjHhY5wGw20ea248=; b=OJ/u/X05eLSJTVYWZIEFkcC33SFFh+wh605dDBl
	i370nETwgrWQ7OcH73HJQPavwpQq6/w+ryTl2mMPEdKypV0jum0SM2VvdG0TdvMe
	9DxHT8uLiNG5IacOKBs/h6JxALWvrz3INC3KDn0IljbOM6vBv7SFwGqL6xe5x4Da
	qQbsALRZXzwbWA0lIMrN3b6qxBPqBhPPnkCSpI9sB7exsnBXvNTnMdt6jhBfMmGg
	SRcjxKvoC+mJMU+l0MmTk7Ptt5z/FLjUHijmbYYfoyy6hPdp8iA08agx1PaylHW4
	sl5hflxIMut4jnyjuO0GJ3NNOu7q5tn0fEjpaBPLY4Ljefg==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 44exyfg6jq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 06:21:57 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 28 Jan 2025 06:21:56 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 28 Jan 2025 06:21:56 -0800
Received: from 5810.caveonetworks.com (unknown [10.29.45.105])
	by maili.marvell.com (Postfix) with ESMTP id A87D43F7084;
	Tue, 28 Jan 2025 06:21:53 -0800 (PST)
From: Kommula Shiva Shankar <kshankar@marvell.com>
To: <pabeni@redhat.com>, <willemb@google.com>, <jasowang@redhat.com>,
        <parav@nvidia.com>, <virtio-comment@lists.linux.dev>
CC: <ndabilpuram@marvell.com>, <jerinj@marvell.com>, <rbhansali@marvell.com>
Subject: [PATCH v2] virtio-net: Introduce a new field to indicate outer network header offset
Date: Tue, 28 Jan 2025 19:51:52 +0530
Message-ID: <20250128142152.3662988-1-kshankar@marvell.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 9tdP6bdC55XB3KBRyB-v2-nj23OcHOx_
X-Proofpoint-ORIG-GUID: 9tdP6bdC55XB3KBRyB-v2-nj23OcHOx_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01

This patch introduces a new field in the virtio_net_header called out_nh_offset, along with a new net device feature, VIRTIO_NET_F_OUT_NET_HEADER.

Currently, there is no field available to directly read the outer network header offset in case of segmentation offload.
This requires reading packet data, which significantly affects performance in datapath.
Additionally, some hardware implementations requrie knowledege of the outer L3 offset (aka L2 length) for inline IPSec hardware acceleration.

To address this limitation, we propose splitting the csum_offset field into two 8-bit fields named csum_offset and out_nh_offset.
The csum_offset indicates the offset value from the csum_start and  may not exceed 256B bits(2^8) for protocols that use a 16-bit one's complement checksum

Following table lists such protocols and their checksum offset fields within their headers

+-----+--------+
|Proto|csum_off|
+-----+--------+
| IPV4| 10B    |
| ICMP| 2B     |
| IGMP| 2B     |
|  TCP| 16B    |
|  UDP| 6B     |
+-----+--------+

The out_nh_offset represents the start offset of the outer network header from the beginning of the packet data

This issue was briefly discussed on the mailing list in a different thread, which can be found here https://lore.kernel.org/all/DM4PR18MB4269FAAC3CFC7E57E25DFBD2DF8B2@DM4PR18MB4269.namprd18.prod.outlook.com/

 v1 -> v2:
 - explicitly state that the out_nh_offset can be set only when a valid network header is present.
 - updated out_nh_offset usage in the RX direction.
 - minor word cleanup.

https://lore.kernel.org/virtio-comment/20250114171636.3175670-1-kshankar@marvell.com/

Signed-off-by: Kommula Shiva Shankar <kshankar@marvell.com>
---
 device-types/net/description.tex | 38 +++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 76585b0..529b7b9 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -88,6 +88,10 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
 \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
     channel.
 
+\item[VIRTIO_NET_F_OUT_NET_HEADER(50)] The Driver can provide the start of \field{out_nh_offset}
+    value. The Device gains advantage by not reading packet to calculate outer network
+    header offset.
+
 \item[VIRTIO_NET_F_HASH_TUNNEL(51)] Device supports inner header hash for encapsulated packets.
 
 \item[VIRTIO_NET_F_VQ_NOTF_COAL(52)] Device supports virtqueue notification coalescing.
@@ -418,7 +422,13 @@ \subsection{Device Operation}\label{sec:Device Types / Network Device / Device O
         le16 hdr_len;
         le16 gso_size;
         le16 csum_start;
-        le16 csum_offset;
+        union {
+                le16 csum_offset;
+                struct { (Only if VIRTIO_NET_F_OUT_NET_HEADER negotiated)
+                        le8 csum_offset;
+                        le8 out_nh_offset;
+                };
+        };
         le16 num_buffers;
         le32 hash_value;        (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
         le16 hash_report;       (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
@@ -457,6 +467,11 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 \item The driver can send a completely checksummed packet.  In this case,
   \field{flags} will be zero, and \field{gso_type} will be VIRTIO_NET_HDR_GSO_NONE.
 
+\item The driver MAY optionally provide the \field{out_nh_offset} value, which is negotiated
+   using the VIRTIO_NET_F_OUT_NET_HEADER. If \field{out_nh_offset} is nonzero, it indicates
+   a valid outer network header with in the packet, and specifies the offset in bytes from
+   the beginning of the packet. Otherwise \field{out_nh_offset} MUST be set to zero.
+
 \item If the driver negotiated VIRTIO_NET_F_CSUM, it can skip
   checksumming the packet:
   \begin{itemize}
@@ -531,6 +546,11 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 \field{flags} to zero and SHOULD supply a fully checksummed
 packet to the device.
 
+If the VIRTIO_NET_F_OUT_NET_HEADER feature has been negotiated,
+the driver MAY set \field{out_nh_offset} to indicate the start of the
+outer network header offset, if the packet contains a valid network header.
+Otherwise, \field{out_nh_offset} MUST be set to zero.
+
 If VIRTIO_NET_F_HOST_TSO4 is negotiated, the driver MAY set
 \field{gso_type} to VIRTIO_NET_HDR_GSO_TCPV4 to request TCPv4
 segmentation, otherwise the driver MUST NOT set
@@ -610,6 +630,11 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 If VIRTIO_NET_HDR_F_NEEDS_CSUM bit in \field{flags} is not set, the
 device MUST NOT use the \field{csum_start} and \field{csum_offset}.
 
+If the VIRTIO_NET_F_OUT_NET_HEADER feature has been negotiated,
+and \field{out_nh_offset} is not zero, the device MAY use \field{out_nh_offset}
+as the outer network header offset. Otherwise, device MUST NOT use
+the \field{out_nh_offset}.
+
 If one of the VIRTIO_NET_F_HOST_TSO4, TSO6, USO or UFO options have
 been negotiated:
 \begin{itemize}
@@ -725,6 +750,9 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
   set: if so, device has validated the packet checksum.
   In case of multiple encapsulated protocols, one level of checksums
   has been validated.
+\item If the VIRTIO_NET_F_OUT_NET_HEADER has been negotiated, and if the packet
+  contains a valid network header, \field{out_nh_offset} MAY be set to indicate the
+  outer network header offset in packet.
 \end{enumerate}
 
 Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP and ECN
@@ -802,6 +830,10 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 device MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
 \field{gso_type}.
 
+If VIRTIO_NET_F_OUT_NET_HEADER has been negotiated, the device MAY
+set the \field{out_nh_offset} to indicate outer network header offset, if packet contains
+a valid network header. Otherwise, the device MUST set \field{out_nh_offset} to zero.
+
 If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the
 device MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
 \field{flags}, if so:
@@ -851,6 +883,10 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 
 The driver MUST ignore \field{flag} bits that it does not recognize.
 
+If VIRTIO_NET_F_OUT_NET_HEADER has been negotiated, and if \field{out_nh_offset}
+is nonzero, the driver MAY use \field{out_nh_offset} as outer network header
+offset. Otherwise, the driver MUST not use the \field{out_nh_offset}.
+
 If VIRTIO_NET_HDR_F_NEEDS_CSUM bit in \field{flags} is not set or
 if VIRTIO_NET_HDR_F_RSC_INFO bit \field{flags} is set, the
 driver MUST NOT use the \field{csum_start} and \field{csum_offset}.
-- 
2.43.0

