Received: from mx0a-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78EF4EB51
	for <virtio-comment@lists.linux.dev>; Mon, 17 Feb 2025 17:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739813118; cv=none; b=J+Fna9gTkpf7Sv5E8vDs2ZAUmovn5U9WrpY2ZyVn3RqBzP8JhKlh85W/MhEcIoEb+ZJJ9UJG4EWCEZEnzbyn14WJj3zY2YZx1UjwNavjUSlofJJu4im3gcHR4X83uGDuwjkp2C78yUgPy1d2afdCaANEHAWDLJdbBserpS8VtJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739813118; c=relaxed/simple;
	bh=gQ46g5IqNamse0Lh+Hf3DpLFQTeTf+hAz8h3Li73Qi8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=J1MrpTmjfzpZMBZuhG7ii8I9j7dKH+d2eVb8BQIRnorvjw+QQqMQESX27WyNvAX4S2w1DopL1gPMiCVS9NRNcINzdTd2cUfI5cFfYRMGvQnyHHOKjxuNIzroD9GDSOZAtUt2mEI7x2N1k74b8bosyI2lxB4prj1y6AjT2oM5M5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=IuJIoM1D; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="IuJIoM1D"
Received: from pps.filterd (m0431384.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51HGqWTr009206;
	Mon, 17 Feb 2025 09:25:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=Edw4P7BKf6QXQdf6GTYfIX2
	YxU24Fzk0TMTZigtiXBw=; b=IuJIoM1Dvf4g/QVLlQwx1VpWtmplzhtYe3oex61
	fmCKj6JbDDW5O5uvDz8SP0izVXjUKAjA2UKW5AiNMTJCU9DxUraOyVZMutkjihPf
	riQUWvi8bLS92QnUfJ5pxvOO7CvVB2s8vUMvN0pTYUhcwP5v1swhGSgMttgJ592h
	UtRyi9ceKu87UTbsqullc0HhBiMLkMO9mo7Ds664TI56vSjEjw1JekOi4+wnxelJ
	rK0cQYSuY+N99h2q5qsxz9yqG6hXEaWua+QvRSZ28XGq5HrrNg0DqZwgNHhLh0OG
	UcQukAepGJBWHF8MVFj1+26WEBUenFD7vfCKfmQY7Li5bog==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 44v2vjrpfg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 09:25:14 -0800 (PST)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 17 Feb 2025 09:25:13 -0800
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 17 Feb 2025 09:25:13 -0800
Received: from 5810.marvell.com (unknown [10.29.45.105])
	by maili.marvell.com (Postfix) with ESMTP id D6A1E3F706D;
	Mon, 17 Feb 2025 09:25:09 -0800 (PST)
From: Kommula Shiva Shankar <kshankar@marvell.com>
To: <pabeni@redhat.com>, <willemb@google.com>, <jasowang@redhat.com>,
        <parav@nvidia.com>, <virtio-comment@lists.linux.dev>
CC: <ndabilpuram@marvell.com>, <jerinj@marvell.com>, <rbhansali@marvell.com>
Subject: [PATCH v3] virtio-net: Introduce a new field to indicate outer network header offset
Date: Mon, 17 Feb 2025 22:55:09 +0530
Message-ID: <20250217172509.107212-1-kshankar@marvell.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: vhdBn5mMq06zB2OK7H-ZVoGeGbgo5v3S
X-Proofpoint-ORIG-GUID: vhdBn5mMq06zB2OK7H-ZVoGeGbgo5v3S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_07,2025-02-13_01,2024-11-22_01

This patch introduces a new field in the virtio_net_header called out_nh_offset, along with a new net device feature, VIRTIO_NET_F_OUT_NET_HEADER.

Currently, drivers lack a dedicated field to signal the start of the network header to the device when performing checksum offload
and segmentation offload. This requires reading packet, which significantly affects performance in datapath.
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

The out_nh_offset represents the start byte offset of the outer network header from the beginning of the packet

This issue was briefly discussed on the mailing list in a different thread, which can be found here
https://lore.kernel.org/all/DM4PR18MB4269FAAC3CFC7E57E25DFBD2DF8B2@DM4PR18MB4269.namprd18.prod.outlook.com/

v2 -> v3:
 - Rebase to virtio-1.4
 - Addressed pending review commnets related to wording.

v2 - https://lore.kernel.org/all/20250128142152.3662988-1-kshankar@marvell.com/

v1 -> v2:
 - explicitly state that the out_nh_offset can be set only when a valid network header is present.
 - updated out_nh_offset usage in the RX direction.
 - minor word cleanup.

v1 - https://lore.kernel.org/virtio-comment/20250114171636.3175670-1-kshankar@marvell.com/

Signed-off-by: Kommula Shiva Shankar <kshankar@marvell.com>
---
 device-types/net/description.tex | 37 ++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index b546cd7..2a4aa66 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -136,6 +136,10 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
 
 \item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM (68)] Device handles packets
   carried by a UDP tunnel with partial csum for the outer header.
+
+\item[VIRTIO_NET_F_OUT_NET_HEADER(69)] Driver can provide the start of \field{out_nh_offset}
+ value. Device gains advantage by not reading packet to calculate outer network
+ header offset
 \end{description}
 
 \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device / Feature bits / Feature bit requirements}
@@ -592,6 +596,13 @@ \subsection{Device Operation}\label{sec:Device Types / Network Device / Device O
         le16 hdr_len;
         le16 gso_size;
         le16 csum_start;
+        union {
+                le16 csum_offset;
+                struct {        /* Only if VIRTIO_NET_F_OUT_NET_HEADER negotiated */
+                        le8 csum_offset;
+                        le8 out_nh_offset;
+                };
+        };
         le16 csum_offset;
         le16 num_buffers;
         le32 hash_value;        (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
@@ -633,6 +644,11 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 \item The driver can send a completely checksummed packet.  In this case,
   \field{flags} will be zero, and \field{gso_type} will be VIRTIO_NET_HDR_GSO_NONE.
 
+\item When VIRTIO_NET_F_OUT_NET_HEADER is negotiated, the driver MAY optionally provide
+   the \field{out_nh_offset} value. A nonzero value of \field{out_nh_offset} indicates
+   a valid outer network header with in the packet, and specifies the offset in bytes from
+   the beginning of the packet. Otherwise \field{out_nh_offset} MUST not be used.
+
 \item If the driver negotiated VIRTIO_NET_F_CSUM, it can skip
   checksumming the packet:
   \begin{itemize}
@@ -767,6 +783,11 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 \field{flags} to zero and SHOULD supply a fully checksummed
 packet to the device.
 
+If the VIRTIO_NET_F_OUT_NET_HEADER feature has been negotiated,
+the driver MAY set \field{out_nh_offset} to indicate the start of the
+outer network header offset, if the packet contains a valid network header.
+Otherwise, \field{out_nh_offset} is not used.
+
 If VIRTIO_NET_F_HOST_TSO4 is negotiated, the driver MAY set
 \field{gso_type} to VIRTIO_NET_HDR_GSO_TCPV4 to request TCPv4
 segmentation, otherwise the driver MUST NOT set
@@ -948,6 +969,11 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
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
@@ -1102,6 +1128,9 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
   both the outer UDP checksum and the inner transport checksum
   have been validated, otherwise only one level of checksums (the outer one
   in case of tunnels) has been validated.
+\item If the VIRTIO_NET_F_OUT_NET_HEADER has been negotiated, and if the packet
+  contains a valid network header, \field{out_nh_offset} MAY be set to indicate the
+  outer network header offset in packet.
 \end{enumerate}
 
 Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, UDP_TUNNEL
@@ -1215,6 +1244,10 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 device MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
 \field{gso_type}.
 
+If VIRTIO_NET_F_OUT_NET_HEADER has been negotiated, the device MAY
+set the \field{out_nh_offset} to indicate outer network header offset, if packet contains
+a valid network header. Otherwise, the device MUST not use \field{out_nh_offset}.
+
 If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the
 device MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
 \field{flags}, if so:
@@ -1302,6 +1335,10 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 
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

