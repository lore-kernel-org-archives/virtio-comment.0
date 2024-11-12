Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948FE19F115
	for <virtio-comment@lists.linux.dev>; Tue, 12 Nov 2024 06:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731393938; cv=none; b=Ov8s2QlzSJSqY06twRVQCMdp/8XH1nAW1wGJA1mRy2phjvsstVkYL5Oa3nIYlxplEobuaI3SX+YhAr0Jtr44IfoW2yCHyJEwkMRmRqOHoPKk2r3HJxmd11h6Zb5L5HJziWDiaTUJuuy48QghKJSzC0Kp9rPnx28xpNzWP5NDEPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731393938; c=relaxed/simple;
	bh=koowyZmgO+H3HmUxpyjU9DALhDf/JOOyqVpGCG2XWmo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VrGN239O32ftEUHdOZJNq6QcJvd5xah9P7mrRcuOZEoKpiRZEabN0loc8WlnYU1eLHBfodKS13/d/Zvy+WBT0TpqQA2cJLEkG7o4fCKQtyVJ/vZ1b7a0AgVxNgQ0+S0jPa8wTsAIyLtSBcWK5IdQaplwwJgrkLEwFi2RuG+gwVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=UqL4UUL1; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="UqL4UUL1"
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AC2V7A9026896;
	Mon, 11 Nov 2024 22:45:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=STzVOGFOscSrKNmg7DgVIfy
	ItQP7T84sFunIYkTJ0HU=; b=UqL4UUL1eIn5Yzf6Mzxprj4Qw4Y1tmYETDDI7Wm
	105xQLzjqF9VgMD2Ljuoe+rHA163pJim1GDQRZL6NAsQvgyIky/o1fFCDeJWjuUL
	+f/iWcR/mmUuPZ4XLEd0/weoffXz/fkc0p5AHZwf9wfp8v2g+EpMwW4Kfr9coITf
	2kDobXdanJY7szkszO9BJC0JSiN6rpetskzpGM0O4i/VWnUtFwGTWQ4ZVUZvu+g7
	/WfRh3/96Op1TY5ict8v7VDmWUhjEQczpXpDRPI8U3t7dYIXAH+LbXRGxGD1ElrS
	OAoWLHiNmvTzL+oiwa3h3mgv7Yi6FIZufvFgzK//venHdQg==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 42uxa40bc1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 22:45:27 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 11 Nov 2024 22:45:26 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 11 Nov 2024 22:45:26 -0800
Received: from 5810.caveonetworks.com (unknown [10.29.45.105])
	by maili.marvell.com (Postfix) with ESMTP id E1ABD3F7079;
	Mon, 11 Nov 2024 22:45:23 -0800 (PST)
From: Kommula Shiva Shankar <kshankar@marvell.com>
To: <pabeni@redhat.com>, <willemb@google.com>, <jasowang@redhat.com>,
        <parav@nvidia.com>, <virtio-comment@lists.linux.dev>
CC: <ndabilpuram@marvell.com>, <jerinj@marvell.com>, <rbhansali@marvell.com>
Subject: [RESEND RFC PATCH] virtio-net: Introduce a new field to indicate outer network header offset
Date: Tue, 12 Nov 2024 12:15:22 +0530
Message-ID: <20241112064522.2360882-1-kshankar@marvell.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: QOFiA2mi_YZUDgkTKYuJ-cyIHpRDUgUF
X-Proofpoint-ORIG-GUID: QOFiA2mi_YZUDgkTKYuJ-cyIHpRDUgUF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Hi Everyone,
It has been some time since this patch was sent. I am resending it for your review and look forward to your feedback.

This patch introduces a new field in the virtio_net_header called out_nh_offset,
along with a new net device feature, VIRTIO_NET_F_OUT_NET_HEADER.

Currently, there is no field available to directly read the outer network header offset in case of segmentation offload.
This requires reading packet data, which significantly affects performance in datapath.
Additionally, some hardware implementations requrie knowledege of the outer L3 offset (aka L2 length) for inline IPSec hardware acceleration.

To address this limitation, we propose splitting the csum_offset field into two 8-bit fields named csum_offset and out_nh_offset.
The csum_offset indicates the offset value from the csum_start and  may not exceed 256B bits(2^8) for protocols that use a
16-bit one's complement checksum

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

The out_nh_offset represents the start offset of the outer network header from
the beginning of the packet data

This issue was briefly discussed on the mailing list in a different thread, which can be found here
https://lore.kernel.org/all/DM4PR18MB4269FAAC3CFC7E57E25DFBD2DF8B2@DM4PR18MB4269.namprd18.prod.outlook.com/

Signed-off-by: Kommula Shiva Shankar <kshankar@marvell.com>
---
 device-types/net/description.tex | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 76585b0..48c081b 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -88,6 +88,10 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
 \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
     channel.
 
+\item[VIRTIO_NET_F_OUT_NET_HEADER(50)] Driver can provide the start of \field{out_nh_offset}
+    value. Device gains advantage by not reading packet data to calculate outer network
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
@@ -457,6 +467,10 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 \item The driver can send a completely checksummed packet.  In this case,
   \field{flags} will be zero, and \field{gso_type} will be VIRTIO_NET_HDR_GSO_NONE.
 
+\item If the driver negotiated VIRTIO_NET_F_OUT_NET_HEADER,
+   \field{out_nh_offset} indicates the outer network header offset in bytes
+    from the beginning of the packet.
+
 \item If the driver negotiated VIRTIO_NET_F_CSUM, it can skip
   checksumming the packet:
   \begin{itemize}
@@ -531,6 +545,10 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 \field{flags} to zero and SHOULD supply a fully checksummed
 packet to the device.
 
+If the VIRTIO_NET_F_OUT_NET_HEADER feature has been negotiated,
+the driver MUST set \field{out_nh_offset} to point outer
+network header start, otherwise to zero.
+
 If VIRTIO_NET_F_HOST_TSO4 is negotiated, the driver MAY set
 \field{gso_type} to VIRTIO_NET_HDR_GSO_TCPV4 to request TCPv4
 segmentation, otherwise the driver MUST NOT set
@@ -596,6 +614,7 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 	the driver SHOULD set \field{hdr_len} to a value
 	not less than the length of the headers, including the transport
 	header.
+
 \end{itemize}
 
 The driver SHOULD accept the VIRTIO_NET_F_GUEST_HDRLEN feature if it has
@@ -610,6 +629,10 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 If VIRTIO_NET_HDR_F_NEEDS_CSUM bit in \field{flags} is not set, the
 device MUST NOT use the \field{csum_start} and \field{csum_offset}.
 
+If the VIRTIO_NET_F_OUT_NET_HEADER feature has been negotiated,
+the device MAY use \field{out_nh_offset} as the outer network header
+offset, otherwise device MUST NOT use the \field{out_nh_offset} value.
+
 If one of the VIRTIO_NET_F_HOST_TSO4, TSO6, USO or UFO options have
 been negotiated:
 \begin{itemize}
@@ -631,6 +654,7 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 	\begin{note}
 	This is due to various bugs in implementations.
 	\end{note}
+
 \end{itemize}
 
 If VIRTIO_NET_HDR_F_NEEDS_CSUM is not set, the device MUST NOT
-- 
2.43.0

