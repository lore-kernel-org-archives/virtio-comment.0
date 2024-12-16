Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBC7203D5F
	for <virtio-comment@lists.linux.dev>; Mon, 16 Dec 2024 10:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734346156; cv=none; b=jh9yT5YthT0GnZAGnyyOed5RZLXERGwi0OH1PC/vP4LM9g80t8zKqe4ZzBjZ4qixgY0QjbnATGKdfXg6fupki46E+NtytnXC+Fo90KbEsVXgLJWItG/nZASk6b2B2suWbdtmfIOk/TQ8MwxvWporHKVUuvGxZ6C1xNfdHx5LziY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734346156; c=relaxed/simple;
	bh=vt0Nx3fBeLOLJtehkFqBuYRfuXrU6qYn9uZacen9gOM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a+RSyjjJ+zqBgiSW2/onJEPDE6g2X2fy326AxO+m5MRYF7bDYMiMe9lrN3UdySHAcZCso8YA87cU2KqrIpxVXKZ/vF2783RK82YZytNsGKrpop4szRZ+Napm4h14toPbO+C58h8A2+oKYKrR4jdkpQXQN+iD2CunsapzMT1GDc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=RkkSYIWs; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="RkkSYIWs"
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGAZd5Y022836;
	Mon, 16 Dec 2024 02:49:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=e
	ao3kxWN1KMddpfib9r2zR8jypxFujZEG49im1GC5rQ=; b=RkkSYIWs/f3HG2/r1
	0S888Eytg+GCwqS/29rScLw9fJntpqRdDf9yBGlVt0vgqqtd5Jl5Iwkn1rMUiGTm
	k4g37xGSdZtfP4hEhjqchsHq4lfFE5XIYiRtONgw3e+FXf1RYSzssN5FzbZiSHT8
	lQaYFW0DMp/Sy8zVDoRmEwloM8NetVCn9htC+lmX/V2bQ41xMSj8OH/3KWpLTcKy
	YXauWKASh18bdjryYW+Bxqs59nXdj8UGUlo8+2zX1V3/JsuP5QWAHTw64MtF0DSF
	pqac1P92xA43nV47u6tHI8drrgW8kE8lI2D4mn/kbIWA926nOvn4k11lq7M5gZd2
	420bg==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 43jjkb80ph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 02:49:13 -0800 (PST)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 16 Dec 2024 02:49:12 -0800
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 16 Dec 2024 02:49:12 -0800
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id D6BEC3F7045;
	Mon, 16 Dec 2024 02:49:09 -0800 (PST)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <pabeni@redhat.com>, <jasowang@redhat.com>,
        <parav@nvidia.com>, <sburla@marvell.com>, <ndabilpuram@marvell.com>,
        <jerinj@marvell.com>, <schalla@marvell.com>
Subject: [PATCH RFC 3/4] virtio-net: updates to virtio_net_hdr for IPsec support
Date: Mon, 16 Dec 2024 16:18:58 +0530
Message-ID: <20241216104859.2720719-4-schalla@marvell.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241216104859.2720719-1-schalla@marvell.com>
References: <20241216104859.2720719-1-schalla@marvell.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 00ZwyliqnoHEyMYrjbw3PMsJapr5qcul
X-Proofpoint-ORIG-GUID: 00ZwyliqnoHEyMYrjbw3PMsJapr5qcul
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Introduces new fields(8 bytes) to the the virtio_net_hdr
structure, enabling IPsec processing.

Signed-off-by: Srujana Challa <schalla@marvell.com>
---
 device-types/net/description.tex | 38 +++++++++++++++++++++++++++++---
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index ace2538..5ebb28a 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -453,6 +453,7 @@ \subsection{Device Operation}\label{sec:Device Types / Network Device / Device O
 #define VIRTIO_NET_HDR_F_NEEDS_CSUM    1
 #define VIRTIO_NET_HDR_F_DATA_VALID    2
 #define VIRTIO_NET_HDR_F_RSC_INFO      4
+#define VIRTIO_NET_HDR_F_SECURITY      8
         u8 flags;
 #define VIRTIO_NET_HDR_GSO_NONE        0
 #define VIRTIO_NET_HDR_GSO_TCPV4       1
@@ -469,6 +470,10 @@ \subsection{Device Operation}\label{sec:Device Types / Network Device / Device O
         le32 hash_value;        (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
         le16 hash_report;       (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
         le16 padding_reserved;  (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
+        struct security_hdr {
+                le32 resource_id;
+                le16 resource_type;
+        };
 };
 \end{lstlisting}
 
@@ -492,6 +497,8 @@ \subsubsection{Legacy Interface: Device Operation}\label{sec:Device Types / Netw
 Historically, some devices put
 the total descriptor length there, even though no data was
 actually written.
+
+\field{resource_id} and \field{resource_type} are valid only when IPsec is enabled.
 \end{note}
 
 \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / Device Operation / Packet Transmission}
@@ -653,6 +660,15 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 The driver MUST NOT set the VIRTIO_NET_HDR_F_DATA_VALID and
 VIRTIO_NET_HDR_F_RSC_INFO bits in \field{flags}.
 
+If the device supports \hyperref[par:Device Types / Network Device / Device Operation / IPsec Operation]{IPsec Operation},
+the driver may set VIRTIO_NET_HDR_F_SECURITY bit in \field{flags}, if so:
+\begin{enumerate}
+\item the driver MUST create IPsec Outbound resource object
+\hyperref[par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Resource objects / VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-ENC-SA]{VIRTIO_NET_RESOURCE_OBJ_IPSEC_OUTB_SA}
+\item the driver MUST set \field{resource_id} to a valid IPsec outbound
+      resource object ID.
+\end{enumerate}
+
 \devicenormative{\paragraph}{Packet Transmission}{Device Types / Network Device / Device Operation / Packet Transmission}
 The device MUST ignore \field{flag} bits that it does not recognize.
 
@@ -684,6 +700,10 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 
 If VIRTIO_NET_HDR_F_NEEDS_CSUM is not set, the device MUST NOT
 rely on the packet checksum being correct.
+
+If VIRTIO_NET_HDR_F_SECURITY bit in \field{flags} is not set, the
+device MUST NOT use the \field{resource_id} and \field{resource_type}.
+
 \paragraph{Packet Transmission Interrupt}\label{sec:Device Types / Network Device / Device Operation / Packet Transmission / Packet Transmission Interrupt}
 
 Often a driver will suppress transmission virtqueue interrupts
@@ -728,7 +748,7 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network Devi
   \end{itemize}
 \item If VIRTIO_NET_F_MRG_RXBUF is negotiated, each buffer MUST be at
 least size of \field{struct virtio_net_hdr},
-i.e. 20 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated, and 12 bytes if not.
+i.e. 28 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated, and 20 bytes if not.
 \end{itemize}
 
 \begin{note}
@@ -736,8 +756,8 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network Devi
 \end{note}
 
 When calculating the size of \field{struct virtio_net_hdr}, the driver
-MUST consider all the fields inclusive up to \field{padding_reserved},
-i.e. 20 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated, and 12 bytes if not.
+MUST consider all the fields inclusive up to \field{security_hdr},
+i.e. 28 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated, and 20 bytes if not.
 
 If VIRTIO_NET_F_MQ is negotiated, each of receiveq1\ldots receiveqN
 that will be used SHOULD be populated with receive buffers.
@@ -906,6 +926,14 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 checksum (in case of multiple encapsulated protocols, one level
 of checksums is validated).
 
+The device SHOULD set the VIRTIO_NET_HDR_F_SECURITY bit in the \field{flags}
+if the packet is gone through the IPsec processing. Otherwise, it should
+be cleared.
+
+The device SHOULD set the VIRTIO_NET_HDR_F_DATA_VALID bit in the \field{flags}
+for IPsec packets only upon successful completion of IPsec processing.
+Otherwise, it should be cleared.
+
 \drivernormative{\paragraph}{Processing of Incoming
 Packets}{Device Types / Network Device / Device Operation /
 Processing of Incoming Packets}
@@ -928,6 +956,10 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 VIRTIO_NET_HDR_F_DATA_VALID is set, the driver MUST NOT
 rely on the packet checksum being correct.
 
+If VIRTIO_NET_HDR_F_SECURITY bit is set in the \field{flags},
+the driver SHOULD treat the packet as an error packet if the
+VIRTIO_NET_HDR_F_DATA_VALID bit is not set in the \field{flags}.
+
 \paragraph{Hash calculation for incoming packets}
 \label{sec:Device Types / Network Device / Device Operation / Processing of Incoming Packets / Hash calculation for incoming packets}
 
-- 
2.25.1

