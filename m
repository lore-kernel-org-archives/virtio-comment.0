Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE7B2010EF
	for <virtio-comment@lists.linux.dev>; Mon, 16 Dec 2024 10:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734344481; cv=none; b=UAkRy/cUJkCn8GLDUZIjvtLlHEf02TTsT1IHeVxItiXHpvUw3fia9JZ+NeZ2LoiW8fevEnApcMYS6djVkbUw4BwVwTS3qv4XfaHN1CZLIBSUHaxAAzJRNKdDBspjKpepn945dd3v1ec4AbfqdkR78yZSEn3T1o8YziJzOKU+rLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734344481; c=relaxed/simple;
	bh=gwJJd0lRQPrLgo0cc1x924vEymay6L3nge8a/tzK/Bs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uvEBJFNc+sH58YvqaQuf9wfqolRhU5fq0PmM0L8txaLUKq1B4K/9NrYeDPsnCIZ+pt8Nm4KKerbEQ5O18WSIWvs8LaNPPgu9xKC0aZHbGAC1C6JKoXrfi5c46HTWnqRAZRXxznEtUXdsXnUNzdBLVyrodggGo+fojsk4r9lmTTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=H80prfPI; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="H80prfPI"
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BG9YBX6025216;
	Mon, 16 Dec 2024 02:21:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=1
	gKQ6ZAKoLqMHIPu/tAld/dqCL7GSrq83B9N0QUNTd0=; b=H80prfPIdzes/pEI6
	gVfRqSi2I1UJtOGJIWaYBLokoS+GhEWp6RssaFkEyx0mMLw5vsUI/gxAqaO1RjTe
	ESCo5/HmUDaYRThal20HqTRAlkp24hsRHFkTdlh1hbVrUS+zA0WcNOYYhzimqJev
	6W3cnK0YFzhA6L1sPpNiL7TH+Ja9UuukE1H+/WctdaQ/jqmkdkBEfgvMgu0SjCc0
	WMe32JBRlQIsUSIYih2V1zFVXfLpMaetMupdvR+14toneVauqOK3yPcP4H1Td+s6
	yfyPn0TRF0F+7tcVzR8TOwHMm4DrhGWuHpWYJvtjGcZW71jIkTwVex554avMqo21
	r/AVQ==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 43jhpdr2vq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 02:21:18 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 16 Dec 2024 02:21:16 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 16 Dec 2024 02:21:16 -0800
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id BDF3F3F708E;
	Mon, 16 Dec 2024 02:21:13 -0800 (PST)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <cohuck@redhat.com>, <mvaralar@redhat.com>,
        <parav@nvidia.com>, <sburla@marvell.com>, <ndabilpuram@marvell.com>,
        <jerinj@marvell.com>, <anoobj@marvell.com>, <schalla@marvell.com>
Subject: [PATCH RFC v2 3/4] virtio-crypto: Add new IPsec opcodes to data request
Date: Mon, 16 Dec 2024 15:51:01 +0530
Message-ID: <20241216102102.2720453-4-schalla@marvell.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241216102102.2720453-1-schalla@marvell.com>
References: <20241216102102.2720453-1-schalla@marvell.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: HOQYBuuf89rPrvmrh2JLfU2oeaveUad4
X-Proofpoint-ORIG-GUID: HOQYBuuf89rPrvmrh2JLfU2oeaveUad4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.687,Hydra:6.0.235,FMLib:17.0.607.475
 definitions=2020-10-13_15,2020-10-13_02,2020-04-07_01

Adds new IPsec opcodes, VIRTIO_CRYPTO_IPSEC_OUTBOUND and
VIRTIO_CRYPTO_IPSEC_INBOUND and defines opcode specific
data structures for IPsec data processing.

Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Signed-off-by: Srujana Challa <schalla@marvell.com>
---
 device-types/crypto/description.tex | 81 ++++++++++++++++++++++++++++-
 1 file changed, 80 insertions(+), 1 deletion(-)

diff --git a/device-types/crypto/description.tex b/device-types/crypto/description.tex
index 23128da..5f73039 100644
--- a/device-types/crypto/description.tex
+++ b/device-types/crypto/description.tex
@@ -990,6 +990,10 @@ \subsubsection{Data Virtqueue}\label{sec:Device Types / Crypto Device / Device O
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
@@ -1007,6 +1011,17 @@ \subsubsection{Data Virtqueue}\label{sec:Device Types / Crypto Device / Device O
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
@@ -1094,6 +1109,13 @@ \subsubsection{Data Virtqueue}\label{sec:Device Types / Crypto Device / Device O
         and struct virtio_crypto_akcipher_data_flf is padded to 48 bytes if NOT negotiated,
         and \field{op_vlf} is struct virtio_crypto_akcipher_data_vlf.
     \end{itemize*}
+\item If the the opcode (in \field{header}) is VIRTIO_CRYPTO_IPSEC_OUTBOUND
+    or VIRTIO_CRYPTO_IPSEC_INBOUND then:
+    \begin{itemize*}
+    \item \field{op_flf} is struct virtio_crypto_ipsec_data_flf.
+        and \field{op_vlf} is struct virtio_crypto_ipsec_data_vlf.
+	Works only for session mode.
+    \end{itemize*}
 \end{itemize*}
 
 \field{inhdr} is a unified input header that used to return the status of
@@ -1914,8 +1936,23 @@ \subsubsection{IPSEC Service Operation}\label{sec:Device Types / Crypto Device /
 in tunnel mode, as well as the ESP/AH header from the packet. The resulting
 packet contains only the plain data.
 
+The driver can offload IPsec Inbound processing by
+\begin{itemize*}
+\item Creating inbound SAs using the VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INBOUND_SA command.
+\item Setting the \field{opcode} in struct virtio_crypto_op_data_req to
+VIRTIO_CRYPTO_IPSEC_INBOUND.
+\end{itemize*}
+
 IPsec Outbound processing: The device will perform encryption, attach ICV,
-update/add IP headers, add ESP/AH headers/trailers.
+update/add IP headers, add ESP/AH headers/trailers during data processing.
+
+The driver can offload IPsec outbound processing by creating outbound SAs
+\begin{itemize*}
+\item Creating outbound SAs using the VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTBOUND_SA command.
+\item Setting the \field{opcode} in struct virtio_crypto_op_data_req to
+VIRTIO_CRYPTO_IPSEC_OUTBOUND.
+\end{itemize*}
+See \ref{sec:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Data processing}
 
 A crypto device can support number of IPsec SAs, allowing it to manage multiple secure
 connections simultaneously.
@@ -2156,3 +2193,45 @@ \subsubsection{IPSEC Service Operation}\label{sec:Device Types / Crypto Device /
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
+dst_data_len SHOULD include additional header and trailer
+lengths.
+
+For IPsec decryption:
+\field{src_data} is the IPsec packet that will be processed.
+\field{src_data_len} is the length of source data.
+\field{dst_result} is the result plain IP packet and
+\field{dst_data_len} is the length of it.
-- 
2.25.1

