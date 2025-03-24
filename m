Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7658D36D
	for <virtio-comment@lists.linux.dev>; Mon, 24 Mar 2025 06:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742798468; cv=none; b=WHuHH9P780VYXecEoEKe1LpW9a0IV94ZKuUzNW2k6KmLCEXtEf1Y+aVg7G2FinM4eo+v/TD/b0sW9klYpJupPLnPWAFfyaUf58GjW3fjxO3kbdmYaQQnAV5DX8mpe9+CJmPn21uzBJIPu37yt+HLRdb46iYxFGZ0xYBqoAGNTSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742798468; c=relaxed/simple;
	bh=OobffkERqizuuXRrZHITOhXaqFsOjgU7F4eK5MGrXto=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zfa8hKwv3zFhVBEF0BzPcqS3mqqhJ1JPj1TFCWEeydbHuh+ldq6SG+5fYKGSRNHa7/qZwDDgGteiSUdJwFR2dU20MhO66o+HhBebDTHyegU9pl7x4jqR2om0IKjFc3yAoRaZOhiRc9vHwe53bgNigvaxay3GnmrDhG7HT9ZBXr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=lKN6udew; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="lKN6udew"
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O2pQYL006013;
	Sun, 23 Mar 2025 23:38:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=y
	F9RCu1W1OBEYXK1PLlL672Z+yFE+tHmkaF29rimM1w=; b=lKN6udewhkuJpIxKW
	+lh5ZZiXIQPKVk52hUihygzCCzNtnhu+YMgQniV9fT5iU5DIcvQjYJ2UuZMlN7uo
	KOZ0sTpQ0vZ0DbBKhWs6EWnVOvxGQtQNHNxvyvpN3F/LNKf2QFoYCHwiYmluDxDa
	MnKsyq9Gp7l5vVfP7MFlOS4vOBRAGTCW6P7wzVa/DOsT+x9P8xknDlhlbrWCCijI
	Sfp6QpuY089i4qPXGT1CKwW3wZc2boGJY7Mz2tIL4art0L7SCuoN+tHkCXkhiPsz
	WFDBBkQOF/u1noZATk2FqpZHlnCSmUWAjTp1/u1B0m9rb97Zu75bMgEvptpJsd2O
	7hi/Q==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 45jxyq8a9r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Mar 2025 23:38:59 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sun, 23 Mar 2025 23:38:58 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Sun, 23 Mar 2025 23:38:58 -0700
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id 6F6E73F70DE;
	Sun, 23 Mar 2025 23:38:55 -0700 (PDT)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <cohuck@redhat.com>, <mvaralar@redhat.com>,
        <parav@nvidia.com>, <sma@napatech.com>, <sburla@marvell.com>,
        <ndabilpuram@marvell.com>, <jerinj@marvell.com>, <anoobj@marvell.com>,
        <schalla@marvell.com>
Subject: [PATCH RFC v4 3/4] virtio-crypto: Add new IPsec opcodes to data request
Date: Mon, 24 Mar 2025 12:08:42 +0530
Message-ID: <20250324063843.1599512-4-schalla@marvell.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250324063843.1599512-1-schalla@marvell.com>
References: <20250324063843.1599512-1-schalla@marvell.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: uO2M55Z_7yc_sJSU_R6gdpLWscAxLaNv
X-Proofpoint-GUID: uO2M55Z_7yc_sJSU_R6gdpLWscAxLaNv
X-Authority-Analysis: v=2.4 cv=atyyCTZV c=1 sm=1 tr=0 ts=67e0fe03 cx=c_pps a=gIfcoYsirJbf48DBMSPrZA==:117 a=gIfcoYsirJbf48DBMSPrZA==:17 a=Vs1iUdzkB0EA:10 a=20KFwNOVAAAA:8 a=M5GUcnROAAAA:8 a=V1_YsNtwiUteIygTLawA:9 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_03,2025-03-21_01,2024-11-22_01

Adds new IPsec opcodes, VIRTIO_CRYPTO_IPSEC_OUTBOUND and
VIRTIO_CRYPTO_IPSEC_INBOUND and defines opcode specific
data structures for IPsec data processing.

Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Signed-off-by: Srujana Challa <schalla@marvell.com>
---
 device-types/crypto/description.tex | 83 +++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/device-types/crypto/description.tex b/device-types/crypto/description.tex
index da1f193..08aeed6 100644
--- a/device-types/crypto/description.tex
+++ b/device-types/crypto/description.tex
@@ -379,6 +379,7 @@ \subsubsection{Operation Status}\label{sec:Device Types / Crypto Device / Device
     VIRTIO_CRYPTO_INVSESS = 4,
     VIRTIO_CRYPTO_NOSPC = 5,
     VIRTIO_CRYPTO_KEY_REJECTED = 6,
+    VIRTIO_CRYPTO_IPSEC_SA_SOFT_EXPIRY = 7,
     VIRTIO_CRYPTO_MAX
 };
 \end{lstlisting}
@@ -391,6 +392,8 @@ \subsubsection{Operation Status}\label{sec:Device Types / Crypto Device / Device
 \item VIRTIO_CRYPTO_NOSPC: no free session ID (only when the VIRTIO_CRYPTO_F_REVISION_1
     feature bit is negotiated).
 \item VIRTIO_CRYPTO_KEY_REJECTED: signature verification failed (only when AKCIPHER verification).
+\item VIRTIO_CRYPTO_IPSEC_SA_SOFT_EXPIRY: IPsec SA lifetime soft limits are reached
+    (only during the operation of the IPsec service).
 \item VIRTIO_CRYPTO_ERR: any failure not mentioned above occurs.
 \end{itemize*}
 
@@ -992,6 +995,10 @@ \subsubsection{Data Virtqueue}\label{sec:Device Types / Crypto Device / Device O
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
@@ -1009,6 +1016,17 @@ \subsubsection{Data Virtqueue}\label{sec:Device Types / Crypto Device / Device O
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
@@ -1096,6 +1114,13 @@ \subsubsection{Data Virtqueue}\label{sec:Device Types / Crypto Device / Device O
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
@@ -1916,11 +1941,27 @@ \subsubsection{IPSEC Service Operation}\label{sec:Device Types / Crypto Device /
 in tunnel mode, as well as the ESP/AH header from the packet(See \hyperref[intro:IPSEC]{IPSEC} RFC).
 The resulting packet contains only the plain data.
 
+The driver can request IPsec Inbound processing by
+\begin{itemize*}
+\item Creating inbound SAs using the VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INBOUND_SA command.
+\item Setting the \field{opcode} in struct virtio_crypto_op_data_req to
+VIRTIO_CRYPTO_IPSEC_INBOUND.
+\end{itemize*}
+
 IPsec Outbound processing: The device performs encryption, attach ICV,
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
@@ -2192,3 +2233,45 @@ \subsubsection{IPSEC Service Operation}\label{sec:Device Types / Crypto Device /
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

