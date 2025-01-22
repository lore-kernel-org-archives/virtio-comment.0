Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B78415B546
	for <virtio-comment@lists.linux.dev>; Wed, 22 Jan 2025 06:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737526921; cv=none; b=j7exMITQ/40XwKa1Rsr4qqZa3/mhQ/R7zQQ+5Q9scw1Zb/Yk1flKDExF5PZQzpJeeiIqgZ7PfQHJ509JYFxpYTbU95FDzMZHNVWZtzIKJxa6OT5yuHst3D+1VgY1v+jXyqwbwBkXsNvu24zkxmpbazrZRH6BcTYgXeQVBrrfang=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737526921; c=relaxed/simple;
	bh=MK6Eq/AmdGYKM1YJOmCFWGpb3LK9wxqS2szXGr94NtM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kLtD244CLSzV/qTvedyFQjl5ODkkzlhZ5dZEd5t5vXbCMmIJykDNVcgDAlqCSUUUQJInRLOQZy4tr2Nne37iP0L/cx/lXZ19ZSwAi2ovnjtHXvP8JGvqx3Op58uSxM6kweNXUB2xJIhkW6m0sQJQOKvORoG+VnxNLchEtl7Oge8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=FARtQ0SJ; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="FARtQ0SJ"
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M4Xwq8022884;
	Tue, 21 Jan 2025 22:21:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=M
	V6xba5s66co+Rok9DpJB+rFORAx92SLexbn5TUMFiY=; b=FARtQ0SJCb7TDrLsU
	NtN7KgF2BkGkTYV5UVdHyIPIRAI7VUAbBnVKcL9cw90T1SpG+2v2O7o5Urj5wBpf
	NvXkQpmcolxKMn799f6bUmWE0gnbZ2KDBI6SQV85uas02aZ+r96imCDf94QTHF0H
	uFDaSLAcyC0CuSFJdu+a2wyMB8yTvyXmmx0xYRzRPV2tuR/HhRpwjt7ze3AlW2+X
	SqZ4vZmqW/r+4vBIWVIJBym4QaeHWnNulY44Wm5mqQuq04LdjWNK3B6eFhtBkryF
	CGra1UqB4T2854KbKev+Ncfw2qzKnGU9AKTeXE5BGvG/P3z+zdGXTgTpHg5msdh1
	CNRBw==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 44asrrr550-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 22:21:59 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 21 Jan 2025 22:21:58 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 21 Jan 2025 22:21:58 -0800
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id A569E3F70B4;
	Tue, 21 Jan 2025 22:21:55 -0800 (PST)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <pabeni@redhat.com>, <jasowang@redhat.com>,
        <parav@nvidia.com>, <sburla@marvell.com>, <ndabilpuram@marvell.com>,
        <jerinj@marvell.com>, <schalla@marvell.com>
Subject: [PATCH RFC v2 3/4] virtio-net: extend virtio_net_hdr for IPsec support
Date: Wed, 22 Jan 2025 11:51:43 +0530
Message-ID: <20250122062144.266725-4-schalla@marvell.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250122062144.266725-1-schalla@marvell.com>
References: <20250122062144.266725-1-schalla@marvell.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 3_7WeemdwECvJcdyW0GOLSR0tRwajo6E
X-Proofpoint-ORIG-GUID: 3_7WeemdwECvJcdyW0GOLSR0tRwajo6E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_02,2025-01-22_01,2024-11-22_01

Add IPsec resource object identifiers to the virtio_net_hdr for
identifying encryption/decryption operations on tx and rx side
respectively, along with flags.

Signed-off-by: Srujana Challa <schalla@marvell.com>
---
 device-types/net/description.tex | 44 ++++++++++++++++++++++++++++++--
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index cef109d..3616917 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -455,6 +455,8 @@ \subsection{Device Operation}\label{sec:Device Types / Network Device / Device O
 #define VIRTIO_NET_HDR_F_NEEDS_CSUM    1
 #define VIRTIO_NET_HDR_F_DATA_VALID    2
 #define VIRTIO_NET_HDR_F_RSC_INFO      4
+#define VIRTIO_NET_HDR_F_SECURITY      8
+#define VIRTIO_NET_HDR_F_SECURITY_ERR  16
         u8 flags;
 #define VIRTIO_NET_HDR_GSO_NONE        0
 #define VIRTIO_NET_HDR_GSO_TCPV4       1
@@ -471,6 +473,11 @@ \subsection{Device Operation}\label{sec:Device Types / Network Device / Device O
         le32 hash_value;        (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
         le16 hash_report;       (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
         le16 padding_reserved;  (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
+        /* Present only if VIRTIO_NET_F_IPSEC negotiated */
+        struct ipsec_resource_hdr {
+                le32 resource_id;
+                le16 resource_type;
+        };
 };
 \end{lstlisting}
 
@@ -655,6 +662,15 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
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
 
@@ -686,6 +702,10 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 
 If VIRTIO_NET_HDR_F_NEEDS_CSUM is not set, the device MUST NOT
 rely on the packet checksum being correct.
+
+If VIRTIO_NET_HDR_F_SECURITY bit in \field{flags} is not set, the
+device MUST NOT use the \field{resource_id} and \field{resource_type}.
+
 \paragraph{Packet Transmission Interrupt}\label{sec:Device Types / Network Device / Device Operation / Packet Transmission / Packet Transmission Interrupt}
 
 Often a driver will suppress transmission virtqueue interrupts
@@ -738,8 +758,13 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network Devi
 \end{note}
 
 When calculating the size of \field{struct virtio_net_hdr}, the driver
-MUST consider all the fields inclusive up to \field{padding_reserved},
-i.e. 20 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated, and 12 bytes if not.
+MUST consider all the fields inclusive up to \field{ipsec_resource_hdr},
+\begin{itemize}
+\item 28 bytes if VIRTIO_NET_F_HASH_REPORT and VIRTIO_NET_F_IPSEC both are negotiated.
+\item 20 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated and VIRTIO_NET_F_IPSEC is not negotiated.
+\item 20 bytes if VIRTIO_NET_F_IPSEC is negotiated and VIRTIO_NET_F_HASH_REPORT is not negotiated.
+\item 12 bytes if VIRTIO_NET_F_IPSEC and VIRTIO_NET_F_HASH_REPORT both are not negotiated.
+\end{itemize}
 
 If VIRTIO_NET_F_MQ is negotiated, each of receiveq1\ldots receiveqN
 that will be used SHOULD be populated with receive buffers.
@@ -908,6 +933,13 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 checksum (in case of multiple encapsulated protocols, one level
 of checksums is validated).
 
+The device MUST set the VIRTIO_NET_HDR_F_SECURITY bit in the \field{flags}
+if the packet is gone through the IPsec processing. Otherwise, it must
+be cleared.
+
+The device MUST set the VIRTIO_NET_HDR_F_SECURITY_ERR bit in the \field{flags}
+if any error is encountered during IPsec processing. Otherwise, this bit must be cleared.
+
 \drivernormative{\paragraph}{Processing of Incoming
 Packets}{Device Types / Network Device / Device Operation /
 Processing of Incoming Packets}
@@ -930,6 +962,10 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 VIRTIO_NET_HDR_F_DATA_VALID is set, the driver MUST NOT
 rely on the packet checksum being correct.
 
+If VIRTIO_NET_HDR_F_SECURITY bit is set in the \field{flags},
+the driver MUST treat the packet as an error packet if the
+VIRTIO_NET_HDR_F_SECURITY_ERR bit is also set in the \field{flags}.
+
 \paragraph{Hash calculation for incoming packets}
 \label{sec:Device Types / Network Device / Device Operation / Processing of Incoming Packets / Hash calculation for incoming packets}
 
@@ -3063,6 +3099,10 @@ \subsubsection{IPsec Operation}\label{sec:Device Types / Network Device / Device
 See \ref{sec:Device Types / Network Device / Device Operation / Flow filter}
 for details about flow filter.
 
+Note that there is a small race condition where a SA object might be destroyed
+while a recieve packet is still inflight. The driver should handle this situation
+appropriately.
+
 \paragraph{Device and driver capabilities}
 \label{par:Device Types / Network Device / Device Operation / IPsec Operation / Device and driver capabilities}
 
-- 
2.25.1

