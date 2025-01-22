Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E8218CC1D
	for <virtio-comment@lists.linux.dev>; Wed, 22 Jan 2025 06:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737526629; cv=none; b=pBWAUS5pTMLsan17sETp2z18rq4k4CoXl1yBucPKL4ZBFLZBaKgRX++HsBCpAo0EUA4qQQsTYQvvo+0HAw/9o0GRUETcYNPN1hqqF68yl/hNwHV/NYCBoyzHwhHJvJ+3GZm/SfIStqqRr2n/Xn+M4boLUH5JfjElBt7Hfan3yo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737526629; c=relaxed/simple;
	bh=RKBagqR9Ghd8dwVC0paSFxB4tRHC/lyVi3dCIa5m+h0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bswJsCpB4W3auPfI2zi1tbXs/O3gSumMabaq9AzpOIQgceoajs0boODuW56oagauiAQQil+jE9+RbUd0rlLtC27ahnCFPQp1OTaJl6A0FrKbMEBLhezfrgA5a8EPl4KlUfgGNGWPKeRGPENvgE/X6ujReFF6vxMUbweX1OXwF7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=GNbnWJDY; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="GNbnWJDY"
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M4YqIC024259;
	Tue, 21 Jan 2025 22:17:00 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=M
	oVrz55dBKlMXontpbbJ16FWqZ+5qXwIllqyMKBUvAM=; b=GNbnWJDYKQ4xYNnLq
	8sMBpKbYGHB+MS0RUIQjzjso5ebU+YFKhCOVCIYMH6tMVOQ04U3o4IOMVruXzm/S
	1yfuzmJHU6+kMKvQG6w9hOw/2UFqwNXrrJoN/f4dnhGlj/dFLA4G8U8NU8vyJ9X4
	OTONC4fn86Mnl1XlvSndHGOlfMnS52aVSHuy6iqxPUw7PM0nVnltnWjrY4dhPB1j
	b98wIGeg5l+VMSKxJQCiUmrslOqD+be/q/bsbnRGqcYBXKVsroKUZCt8FAmOE+ax
	nhC+HfYtmMUMbvaZvzyt1T1M2luTrNZJQx2vDtCb5BDQeYoym3I6ImSxHO1n+S/h
	BOXkQ==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 44asrrr4v9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 22:16:59 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 21 Jan 2025 22:16:59 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 21 Jan 2025 22:16:59 -0800
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id EED393F70B4;
	Tue, 21 Jan 2025 22:16:55 -0800 (PST)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <cohuck@redhat.com>, <mvaralar@redhat.com>,
        <parav@nvidia.com>, <sburla@marvell.com>, <ndabilpuram@marvell.com>,
        <jerinj@marvell.com>, <anoobj@marvell.com>, <schalla@marvell.com>
Subject: [PATCH RFC v3 3/4] virtio-crypto: Add new IPsec opcodes to data request
Date: Wed, 22 Jan 2025 11:46:43 +0530
Message-ID: <20250122061644.266560-4-schalla@marvell.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250122061644.266560-1-schalla@marvell.com>
References: <20250122061644.266560-1-schalla@marvell.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: RJvo3Hudr4HILjROIK_7NAj0q_LJfnSS
X-Proofpoint-ORIG-GUID: RJvo3Hudr4HILjROIK_7NAj0q_LJfnSS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_02,2025-01-22_01,2024-11-22_01

Adds new IPsec opcodes, VIRTIO_CRYPTO_IPSEC_OUTBOUND and
VIRTIO_CRYPTO_IPSEC_INBOUND and defines opcode specific
data structures for IPsec data processing.

Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Signed-off-by: Srujana Challa <schalla@marvell.com>
---
 device-types/crypto/description.tex | 80 +++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/device-types/crypto/description.tex b/device-types/crypto/description.tex
index 0ba09df..cf5de23 100644
--- a/device-types/crypto/description.tex
+++ b/device-types/crypto/description.tex
@@ -992,6 +992,10 @@ \subsubsection{Data Virtqueue}\label{sec:Device Types / Crypto Device / Device O
     VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AKCIPHER, 0x02)
 #define VIRTIO_CRYPTO_AKCIPHER_VERIFY \
     VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AKCIPHER, 0x03)
+#define VIRTIO_CRYPTO_IPSEC_OUTBOUND \
+    VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_IPSEC, 0x00)
+#define VIRTIO_CRYPTO_IPSEC_INBOUND \
+    VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_IPSEC, 0x01)
     le32 opcode;
     /* algo should be service-specific algorithms */
     le32 algo;
@@ -1009,6 +1013,17 @@ \subsubsection{Data Virtqueue}\label{sec:Device Types / Crypto Device / Device O
 If VIRTIO_CRYPTO_F_REVISION_1 is negotiated but VIRTIO_CRYPTO_F_<SERVICE>_STATELESS_MODE
 is not negotiated, then the device SHOULD reject <SERVICE> requests if
 VIRTIO_CRYPTO_FLAG_SESSION_MODE is not set (in \field{flag}).
+
+For VIRTIO_CRYPTO_IPSEC_OUTBOUND and VIRTIO_CRYPTO_IPSEC_INBOUND opcodes,
+\field{algo} is ignored.
+
+For VIRTIO_CRYPTO_IPSEC_OUTBOUND opcode, \field{session_id} MUST be set to
+one of the resource objects \field{id} created using
+VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTBOUND_SA resource type.
+
+For VIRTIO_CRYPTO_IPSEC_INBOUND opcode, \field{session_id} MUST be set to
+one of the resource objects \field{id} created using
+VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INBOUND_SA resource type.
 \end{note}
 
 The dataq request is composed of four parts:
@@ -1096,6 +1111,13 @@ \subsubsection{Data Virtqueue}\label{sec:Device Types / Crypto Device / Device O
         and struct virtio_crypto_akcipher_data_flf is padded to 48 bytes if NOT negotiated,
         and \field{op_vlf} is struct virtio_crypto_akcipher_data_vlf.
     \end{itemize*}
+\item If the the opcode (in \field{header}) is VIRTIO_CRYPTO_IPSEC_OUTBOUND
+    or VIRTIO_CRYPTO_IPSEC_INBOUND then:
+    \begin{itemize*}
+    \item \field{op_flf} is struct virtio_crypto_ipsec_data_flf and
+        \field{op_vlf} is struct virtio_crypto_ipsec_data_vlf.
+	Works only for session mode.
+    \end{itemize*}
 \end{itemize*}
 
 \field{inhdr} is a unified input header that used to return the status of
@@ -1916,11 +1938,27 @@ \subsubsection{IPSEC Service Operation}\label{sec:Device Types / Crypto Device /
 in tunnel mode, as well as the ESP/AH header from the packet(See \hyperref[intro:IPSEC]{IPSEC} RFC).
 The resulting packet contains only the plain data.
 
+The driver can request IPsec Inbound processing by
+\begin{itemize*}
+\item Creating inbound SAs using the VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INBOUND_SA command.
+\item Setting the \field{opcode} in struct virtio_crypto_op_data_req to
+VIRTIO_CRYPTO_IPSEC_INBOUND.
+\end{itemize*}
+
 IPsec Outbound processing: The device will perform encryption, attach ICV,
 update/add IP header, add ESP/AH header/trailer.
 
+The driver can request IPsec outbound processing by
+\begin{itemize*}
+\item Creating outbound SAs using the VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTBOUND_SA command.
+\item Setting the \field{opcode} in struct virtio_crypto_op_data_req to
+VIRTIO_CRYPTO_IPSEC_OUTBOUND.
+\end{itemize*}
+
 A crypto device can support number of IPsec SAs, allowing it to manage multiple secure
 connections simultaneously.
+See \ref{sec:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Resource objects}
+for IPsec SA information.
 
 The device and the driver indicate IPsec SA resource limits using the
 VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP capability specifying the limits on the number of
@@ -2173,3 +2211,45 @@ \subsubsection{IPSEC Service Operation}\label{sec:Device Types / Crypto Device /
 capability VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP. For the IPsec inbound SA resource object
 \field{resource_obj_specific_data} is in the format
 \field{struct virtio_crypto_resource_obj_ipsec_sa}.
+
+\paragraph{Data processing}
+\label{par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Data processing}
+
+Data requests for IPsec processing are as follows:
+
+\begin{lstlisting}
+struct virtio_crypto_ipsec_data_flf {
+        /* length of source data, full IP/IPsec packet */
+        le32 src_data_len;
+        /* length of dst data */
+        le32 dst_data_len;
+};
+
+struct virtio_crypto_ipsec_data_vlf {
+        /* Device read only portion */
+        /* Source data */
+        u8 src_data[src_data_len];
+
+        /* Device write only portion */
+        /* Pointer to output data */
+        u8 dst_data[dst_data_len];
+};
+\end{lstlisting}
+
+Each data request uses the virtio_crypto_ipsec_data_flf structure and
+the virtio_crypto_ipsec_data_vlf structure to store information used to
+run the IPSEC operations.
+
+For IPsec encryption:
+\field{src_data} is the full IP packet that will be processed.
+\field{src_data_len} is the length of source data.
+\field{dst_result} is the result ESP encrypted packet and
+\field{dst_data_len} is the length of it. Please note,
+dst_data_len MUST include additional header and trailer
+lengths.
+
+For IPsec decryption:
+\field{src_data} is the IPsec packet that will be processed.
+\field{src_data_len} is the length of source data.
+\field{dst_result} is the result plain IP packet and
+\field{dst_data_len} is the length of it.
-- 
2.25.1

