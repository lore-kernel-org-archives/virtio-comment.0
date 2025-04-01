Received: from mx0a-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128F73594F
	for <virtio-comment@lists.linux.dev>; Tue,  1 Apr 2025 19:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743537424; cv=none; b=opgTpu4PXav0kyOwbGBtmIo7TM48RPBDAXV61WfVDtWFYl6HffSI4AuvLqM90s6vfFaamodfq1qAyxLuj26i0rAcViEYCjSSjYo8a6LDuqI8Kwh7nWElvrza9PIF339Hfg2RAXgVrf3igd3CnAVuGzRxezQ4Ln9MGSBncyujQBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743537424; c=relaxed/simple;
	bh=c8hbBU1zy8iBfOuL4LAyxBAbqCQDg/W3cbGK/iRRxR0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Jr4+PVVI+w5CreoX0GHEtfWx7yQAFBal0p8GuKwcC2xQjgblmNVIChjPC81tHAVZ2RZrYsEvWIoFMb9ybDZWbt0VULxXySBZ+ZJbS/oYzqJODeK3wDQ7lEjoCftMyybL64YuFHc+GsQIToKnQkF6hXuwUlfhC6tdZgG5W4oIrN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=Bc2r4tcL; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="Bc2r4tcL"
Received: from pps.filterd (m0431384.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531GdgvO013704;
	Tue, 1 Apr 2025 12:57:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=o42e8a+7xf2Y9wQc3BHKRmL
	tcCXkSmfYGmvsYcnTgDs=; b=Bc2r4tcLN5L0EFPaUp2yiwgLyAiCIqcZwbB6YS8
	8qxJqWmvVRPRD8FvmJACsf05a45LiBNzvDWT9bOsSQJ6K0BKH4M6vihfA+o8fY3/
	BcFzboN4wU9S1EB5NS5tjBbeVHJ/5PKCWnNL28AF4c2ISNNlLzfzG7P0T6VaYMrp
	mQaSYi2VnP7lSzUiAKFfZ4YJXybqEgzCz6OiE06WbwtWLKQrNLyZYnk3Us5m5N9Q
	w+zL097Hx+g1JfVaMxbn7OadN3lxQ+JjnQ2bpK8PN4j/Lciq2FpZR90ev1nLd0WE
	t6ZM8LmtBzn7N2JgUPl3jl48sXDc2Lre/4O1CCs1h93yctA==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 45rbgq1pmt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Apr 2025 12:57:00 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 1 Apr 2025 12:56:59 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 1 Apr 2025 12:56:59 -0700
Received: from 5810.marvell.com (unknown [10.29.45.105])
	by maili.marvell.com (Postfix) with ESMTP id 67F975C68F1;
	Tue,  1 Apr 2025 12:56:56 -0700 (PDT)
From: Kommula Shiva Shankar <kshankar@marvell.com>
To: <pabeni@redhat.com>, <willemb@google.com>, <jasowang@redhat.com>,
        <parav@nvidia.com>, <virtio-comment@lists.linux.dev>
CC: <ndabilpuram@marvell.com>, <jerinj@marvell.com>, <rbhansali@marvell.com>
Subject: [PATCH v5] virtio-net: Introduce a new field to indicate outer network header offset
Date: Wed, 2 Apr 2025 01:26:55 +0530
Message-ID: <20250401195655.486230-1-kshankar@marvell.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=TLxFS0la c=1 sm=1 tr=0 ts=67ec450c cx=c_pps a=gIfcoYsirJbf48DBMSPrZA==:117 a=gIfcoYsirJbf48DBMSPrZA==:17 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=M5GUcnROAAAA:8 a=79TnrLaLj9gRDcMoekYA:9 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-GUID: RtMt9-5iCY856NHHe4DjBjvllL2AdqR8
X-Proofpoint-ORIG-GUID: RtMt9-5iCY856NHHe4DjBjvllL2AdqR8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_08,2025-04-01_01,2024-11-22_01

This patch introduces a new field in the virtio_net_hdr called outer_nh_offset, along with a new net device feature, VIRTIO_NET_F_OUT_NET_HEADER.

Currently, drivers lack a dedicated field to signal the start of the network header to the device when performing checksum offload
and segmentation offload. This requires the device to read the packet in data path, which significantly affects performance.
Additionally, some hardware implementations require knowledge of the outer L3 offset (aka L2 length) for inline IPsec hardware acceleration.

To address this limitation, we propose to introduce a new field in the virtio_net_hdr called
outer_nh_offset.

The outer_nh_offset represents the start byte offset of the outer network header from the beginning of the packet.

This issue was briefly discussed on the mailing list in a different thread, which can be found here.
https://lore.kernel.org/all/DM4PR18MB4269FAAC3CFC7E57E25DFBD2DF8B2@DM4PR18MB4269.namprd18.prod.outlook.com/

v4->v5
 - Added padding bytes to virtio_net_hdr to ensure 64b alignment
 - Addressed pending review comments
v4:https://lore.kernel.org/virtio-comment/20250304075955.208450-1-kshankar@marvell.com/

v3 -> v4
 - Removed the union of new flag with existing flags. Added as a separate field
   in the virtio net header
 - Renamed out_nh_offset to outer_nh_offset to maintain consistency with other fields
 - Spellchecks in commit message description
v3:https://lore.kernel.org/all/20250217172509.107212-1-kshankar@marvell.com

v2 -> v3:
 - Rebase to virtio-1.4
 - Addressed pending review comments related to wording.
v2:https://lore.kernel.org/all/20250128142152.3662988-1-kshankar@marvell.com/

v1 -> v2:
 - explicitly state that the out_nh_offset can be set only when a valid network header is present.
 - updated out_nh_offset usage in the RX direction.
 - minor word cleanup.
v1: https://lore.kernel.org/virtio-comment/20250114171636.3175670-1-kshankar@marvell.com/

Signed-off-by: Kommula Shiva Shankar <kshankar@marvell.com>
---
 device-types/net/description.tex | 37 +++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 1b6b54d..0bb1cef 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -136,6 +136,10 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
 
 \item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM (68)] Device handles packets
   carried by a UDP tunnel with partial csum for the outer header.
+
+\item[VIRTIO_NET_F_OUT_NET_HEADER(69)] Driver can provide the start of
+ \field{outer_nh_offset} value. Device gains advantage by not reading packet
+  to calculate outer network header offset.
 \end{description}
 
 \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device / Feature bits / Feature bit requirements}
@@ -599,6 +603,8 @@ \subsection{Device Operation}\label{sec:Device Types / Network Device / Device O
         le16 padding_reserved;  (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
         le16 outer_th_offset    (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
         le16 inner_nh_offset;   (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
+        le16 outer_nh_offset;   /* Only if VIRTIO_NET_F_OUT_NET_HEADER negotiated */
+        u8 padding_reserved_2[6]; /* Only if VIRTIO_NET_F_OUT_NET_HEADER negotiated */
 };
 \end{lstlisting}
 
@@ -633,6 +639,11 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
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
@@ -767,6 +778,11 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 \field{flags} to zero and SHOULD supply a fully checksummed
 packet to the device.
 
+If the VIRTIO_NET_F_OUT_NET_HEADER feature has been negotiated,
+the driver MAY set \field{outer_nh_offset} to nonzero value to indicate
+the start of the outer network header offset, if the packet contains a
+valid network header. Otherwise, \field{outer_nh_offset} is not used.
+
 If VIRTIO_NET_F_HOST_TSO4 is negotiated, the driver MAY set
 \field{gso_type} to VIRTIO_NET_HDR_GSO_TCPV4 to request TCPv4
 segmentation, otherwise the driver MUST NOT set
@@ -948,6 +964,11 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 If VIRTIO_NET_HDR_F_NEEDS_CSUM bit in \field{flags} is not set, the
 device MUST NOT use the \field{csum_start} and \field{csum_offset}.
 
+If the VIRTIO_NET_F_OUT_NET_HEADER feature has been negotiated,
+and \field{outer_nh_offset} is nonzero, the device MAY use \field{outer_nh_offset}
+as the outer network header offset. Otherwise, device MUST NOT use
+the \field{outer_nh_offset}.
+
 If one of the VIRTIO_NET_F_HOST_TSO4, TSO6, USO or UFO options have
 been negotiated:
 \begin{itemize}
@@ -1049,7 +1070,9 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network Devi
 \end{note}
 
 When calculating the size of \field{struct virtio_net_hdr}, the driver
-MUST consider all the fields inclusive up to \field{padding_reserved},
+MUST consider all the fields inclusive up to \field{padding_reserved_2},
+i.e. 32 bytes if VIRTIO_NET_F_OUT_NET_HEADER is negotiated or up to \field{inner_nh_offset}
+i.e. 24 bytes if VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated or up to \field{padding_reserved}
 i.e. 20 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated, and 12 bytes if not.
 
 If VIRTIO_NET_F_MQ is negotiated, each of receiveq1\ldots receiveqN
@@ -1102,6 +1125,9 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
   both the outer UDP checksum and the inner transport checksum
   have been validated, otherwise only one level of checksums (the outer one
   in case of tunnels) has been validated.
+\item If the VIRTIO_NET_F_OUT_NET_HEADER has been negotiated, and if the packet
+  contains a valid network header, \field{outer_nh_offset} MAY be set to nonzero
+  value to indicate the outer network header offset in packet.
 \end{enumerate}
 
 Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, UDP_TUNNEL
@@ -1215,6 +1241,11 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 device MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
 \field{gso_type}.
 
+If VIRTIO_NET_F_OUT_NET_HEADER has been negotiated, the device MAY
+set the \field{outer_nh_offset} to nonzero value to indicate outer network header offset,
+if packet contains a valid network header. Otherwise, the device MUST not
+use \field{outer_nh_offset}.
+
 If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the
 device MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
 \field{flags}, if so:
@@ -1302,6 +1333,10 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 
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

