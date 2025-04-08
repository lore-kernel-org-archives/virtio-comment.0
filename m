Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B63263C69
	for <virtio-comment@lists.linux.dev>; Tue,  8 Apr 2025 07:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097731; cv=none; b=VZwbdRKaZc2K8jLYTyXx8kY1aJyx7xyHBqpQ5HPB4Tnwe1mAwijPZaCfzacHvbgrenSonChKJnNDJBdOKOL+1JDXh6hz74GLv4zYovpA2hrVDzs0Bd+C4pVA6V8L7j0LW7xCUPV2GX98pLurkpjnGH4ZS9daSDb2+Cqs669cjMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097731; c=relaxed/simple;
	bh=haRYTYgH+APfbinB8kt/MNYXH9U8RgRfQBStvtEtQuU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QvXfmkrifFJkNU1JMJ1QK/KrT1tl2MV3zTUVPwcgNw86eR/lSkR3u5UZimC5/L+WEgY96BbsFR/cnznwM/p9oSzzUa1rUQIvecXc86uV+WEP/alBrLA0PkjErWXp0u0uduj1Fh9t7GeB0rxlrd6bu1lIXFcZpIMr1OWLxWX4j9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=PWdLtPA5; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="PWdLtPA5"
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5387JBHs002628;
	Tue, 8 Apr 2025 00:35:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=b
	O30/kYUytVa9+4iPHNqF1/b5d26ovYt89H30ITxdlo=; b=PWdLtPA5JgjKsAWIq
	i6PcNqY6SvK/8I+sQxSwwpbgmCECVH6bxVeV8nee0PqTJ87Kmp4l+qSpUx96tE79
	S1Ihx3gDjlY182sMwUQR/IGQy0vJY9aM0sZh8w2GxUaaJ4HcotUscOXJ7UeChhWz
	oYf5NgJVgjP+NeQaPAPPVF5SgF2E6oXAfuwkm1rvyFhBnxUlp27vTXoS/eat+yqA
	KAyy3kJH9DMga+x+z5MkfZY7cWlNA9wcRvaisGgfxgN/SaXeuyQf/4eDlpA9uvdk
	szzFtzSi8RIr2Ax7AiknHASHs4N2xO52Ebs5Afwc9kt0qk9Unc4UtzrYFeANVMuP
	awKig==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 45un99v6xs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 00:35:28 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 8 Apr 2025 00:35:27 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 8 Apr 2025 00:35:27 -0700
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id DD13B3F7114;
	Tue,  8 Apr 2025 00:35:23 -0700 (PDT)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <cohuck@redhat.com>, <mvaralar@redhat.com>,
        <parav@nvidia.com>, <sma@napatech.com>, <sburla@marvell.com>,
        <ndabilpuram@marvell.com>, <jerinj@marvell.com>, <anoobj@marvell.com>,
        <schalla@marvell.com>
Subject: [PATCH RFC v5 3/4] virtio-crypto: Add new IPsec opcodes to data request
Date: Tue, 8 Apr 2025 13:05:11 +0530
Message-ID: <20250408073512.1783641-4-schalla@marvell.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250408073512.1783641-1-schalla@marvell.com>
References: <20250408073512.1783641-1-schalla@marvell.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=I/JlRMgg c=1 sm=1 tr=0 ts=67f4d1c0 cx=c_pps a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17 a=XR8D0OoHHMoA:10 a=20KFwNOVAAAA:8 a=Ikd4Dj_1AAAA:8 a=M5GUcnROAAAA:8 a=V1_YsNtwiUteIygTLawA:9 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-GUID: aaqH6WFT3_ruFiBO6L1J-7kQImgZJCHR
X-Proofpoint-ORIG-GUID: aaqH6WFT3_ruFiBO6L1J-7kQImgZJCHR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_02,2025-04-07_01,2024-11-22_01

Adds new IPsec opcodes, VIRTIO_CRYPTO_IPSEC_OUTBOUND and
VIRTIO_CRYPTO_IPSEC_INBOUND and defines opcode specific
data structures for IPsec data processing.

Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Reviewed-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Srujana Challa <schalla@marvell.com>
---
 device-types/crypto/description.tex | 84 +++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/device-types/crypto/description.tex b/device-types/crypto/description.tex
index 15b1d1d..4ccdd33 100644
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
@@ -391,6 +392,9 @@ \subsubsection{Operation Status}\label{sec:Device Types / Crypto Device / Device
 \item VIRTIO_CRYPTO_NOSPC: no free session ID (only when the VIRTIO_CRYPTO_F_REVISION_1
     feature bit is negotiated).
 \item VIRTIO_CRYPTO_KEY_REJECTED: signature verification failed (only when AKCIPHER verification).
+\item VIRTIO_CRYPTO_IPSEC_SA_SOFT_EXPIRY: IPsec SA lifetime soft limits are reached.
+    When VIRTIO_CRYPTO_IPSEC_SA_SOFT_EXPIRY occurs, the request is completed successfully,
+    but one or all of the soft limits are reached. This is applicable only for IPsec service operations.
 \item VIRTIO_CRYPTO_ERR: any failure not mentioned above occurs.
 \end{itemize*}
 
@@ -992,6 +996,10 @@ \subsubsection{Data Virtqueue}\label{sec:Device Types / Crypto Device / Device O
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
@@ -1009,6 +1017,17 @@ \subsubsection{Data Virtqueue}\label{sec:Device Types / Crypto Device / Device O
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
@@ -1096,6 +1115,13 @@ \subsubsection{Data Virtqueue}\label{sec:Device Types / Crypto Device / Device O
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
@@ -1916,12 +1942,28 @@ \subsubsection{IPSEC Service Operation}\label{sec:Device Types / Crypto Device /
 in tunnel mode, as well as the ESP/AH header on the given packet(See \hyperref[intro:IPSEC]{IPSEC} RFC).
 The resulting packet contains only the plain data.
 
+The driver can request IPsec Inbound processing by
+\begin{itemize*}
+\item Creating inbound SAs using the VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INBOUND_SA command.
+\item Setting the \field{opcode} in struct virtio_crypto_op_data_req to
+VIRTIO_CRYPTO_IPSEC_INBOUND.
+\end{itemize*}
+
 IPsec Outbound processing: The device performs encryption, attach ICV,
 update/add IP header and add ESP/AH header/trailer. The resulting packet
 contains encrypted data along with the IPsec header and trailer.
 
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
@@ -2193,3 +2235,45 @@ \subsubsection{IPSEC Service Operation}\label{sec:Device Types / Crypto Device /
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

