Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642B82522BC
	for <virtio-comment@lists.linux.dev>; Thu, 24 Apr 2025 09:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487116; cv=none; b=dHaFl3pt42JCS6UxVadJJecuty8nATT25M7TMMXGxAYXH61X7zPA8GtMD7xXuaKeiAXEujp9Gsz1AgP1qXi8EDdDWYBQmav49x2VAkAWs/J0tzQA0fCkQk5qaW418uILbheSuef97rZcwxZzAg8xH8JQyT0SGNQMJoXx89PqJCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487116; c=relaxed/simple;
	bh=yTlC03+MBl3P+0nHNA8oOzz6dWtrs+YOp4FfB0rrS5w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CnBz7q5ub5DfMrlZQR4l8PTsRVzbbpwjW1uFG6+eWz6tuhoyr0LHphxfpq1hQgAZ6qUnR7f7X+6Tcglgnj0wCLxVLT7QzxTKLdxscENzDQKdn5FVz6Lf5N6Hu2PnYc3xES8x3iFjjCD5c8s4TRsUtyJaiQ7ojNysvUM7APbvFHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=VJom53bM; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="VJom53bM"
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O9Vmko013317;
	Thu, 24 Apr 2025 02:31:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=V
	mX/avhJEyY8a79K0rHCblvNtGFBKC7otB8K2Z8cfZ4=; b=VJom53bMjg080qE8A
	SXP6GozCNckOcFIW6YQJLY4/CExtBnFc71+RGDhzazSsyqZIgfSlpiBVuUBLXVMI
	3NvwWZ2mYli5/T8BBhU4FdLNq5a8FSGm8caNDggU3d2dO/3TpudMQb5oDZs2UlKh
	eRoocMswjRKSQEbyKm6+Xnp+2csvyJKfvm2edWfu2WJZCyCsUl9aVyqL5wdxhJBy
	fQ9+ZLuQXG3zLJ/OgA3FDaH4YZkP9VQ2qAUpItKNRfcAPL8ody/6/ApXyjtXo/O8
	KTSRtf/nt8z9spFoyiv7xPlhFVCznU5dn9TYOs+EHIiU95TS+rIEi3QB86PHyYnO
	wTbfw==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 466jk3464u-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 02:31:49 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 24 Apr 2025 02:31:07 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 24 Apr 2025 02:31:07 -0700
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id E217A3F7097;
	Thu, 24 Apr 2025 02:31:03 -0700 (PDT)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <cohuck@redhat.com>, <mvaralar@redhat.com>,
        <parav@nvidia.com>, <sma@napatech.com>, <sburla@marvell.com>,
        <ndabilpuram@marvell.com>, <jerinj@marvell.com>, <anoobj@marvell.com>,
        <schalla@marvell.com>
Subject: [PATCH RFC v6 4/4] virtio-crypto: Add device and driver requirements for IPsec operation
Date: Thu, 24 Apr 2025 15:00:46 +0530
Message-ID: <20250424093046.1927395-5-schalla@marvell.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250424093046.1927395-1-schalla@marvell.com>
References: <20250424093046.1927395-1-schalla@marvell.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX9p/PgnoQMWyA ofSKfYET4QbrsfpD/qoTrFj5eTex7i37Lc2yIdw1LkYB/N8zkW9S2ylXXv9RWY1+AVDpVwe5Ou7 hwHJqvCpVpEveKqhahhS/5mtrartaJfG6KG+/HNmbRZ7QH17KV0gSIjsUW+ZLN5h4QDE9+jsT/l
 a4x2843pxHKqyC5DDfq5TMnlkQCR7Ml8braCl3y6Thecow3ZhJSG04cvb3NcCP2UAGNm7Jv/bAT v2PUPFDmOlP1MNtpmZcutYen+earueHRqh6Eu2HLsrB4+a9/HpWQTfACZLpN7BaWLOG/XaLlte4 sCL7YXjvna+oXS4gvMfrWq4ji/wfAPFJVNLuMJEK0y5/nlPW0CvOeE0juQZue4E3XDvHPlnWija
 G8sYdMyxltZXDIBtrwHVJWbP6SxlXEevfU2kv9WYfPF9G/CW49MCoEBvgTsDB0HM2WRw6BzQ
X-Proofpoint-GUID: w5kLe43VxgdNCYs2d1n8rS4EJij_cad2
X-Proofpoint-ORIG-GUID: w5kLe43VxgdNCYs2d1n8rS4EJij_cad2
X-Authority-Analysis: v=2.4 cv=M89NKzws c=1 sm=1 tr=0 ts=680a0505 cx=c_pps a=gIfcoYsirJbf48DBMSPrZA==:117 a=gIfcoYsirJbf48DBMSPrZA==:17 a=XR8D0OoHHMoA:10 a=Ikd4Dj_1AAAA:8 a=M5GUcnROAAAA:8 a=I2nkbDfs0ME7We_epX0A:9 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01

Add device and driver requirements for IPsec Operation.

Reviewed-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Srujana Challa <schalla@marvell.com>
---
 device-types/crypto/description.tex        | 97 ++++++++++++++++++++++
 device-types/crypto/device-conformance.tex |  1 +
 device-types/crypto/driver-conformance.tex |  1 +
 3 files changed, 99 insertions(+)

diff --git a/device-types/crypto/description.tex b/device-types/crypto/description.tex
index 794b9b4..c952fd1 100644
--- a/device-types/crypto/description.tex
+++ b/device-types/crypto/description.tex
@@ -2275,3 +2275,100 @@ \subsubsection{IPSEC Service Operation}\label{sec:Device Types / Crypto Device /
 \field{src_data_len} is the length of source data.
 \field{dst_result} is the result plain IP packet and
 \field{dst_data_len} is the length of it.
+
+\devicenormative{\paragraph}{IPsec Service Operation}{Device Types / Crypto Device / Device Operation / IPsec Service Operation}
+
+When the device supports IPsec operations,
+\begin{itemize}
+\item the device MUST set VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP, VIRTIO_CRYPTO_IPSEC_SA_CAP
+capability in the \field{supported_caps} in the command VIRTIO_ADMIN_CMD_CAP_SUPPORT_QUERY.
+\item the device MUST support the administration commands
+VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE,
+VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY, VIRTIO_ADMIN_CMD_RESOURCE_OBJ_QUERY,
+VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY for the resource types
+VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTBOUND_SA and VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INBOUND_SA.
+\end{itemize}
+
+When any of the VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP or VIRTIO_CRYPTO_IPSEC_SA_CAP
+capability is disabled, the device MUST set \field{status} to
+VIRTIO_ADMIN_STATUS_Q_INVALID_OPCODE for the commands
+VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE,
+VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY, VIRTIO_ADMIN_CMD_RESOURCE_OBJ_QUERY,
+and VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY for the resource types
+VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTBOUND_SA and VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INBOUND_SA.
+
+The device MUST set \field{status} to VIRTIO_ADMIN_STATUS_EEXIST for the
+command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE when the resource \field{type}
+is VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTBOUND_SA or VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INBOUND_SA,
+if the object already exists with the supplied \field{id}.
+
+The device MUST fail the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE with
+the \field{status} set to VIRTIO_ADMIN_STATUS_EINVAL, for the
+VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTBOUND_SA object if,
+\begin{itemize}
+\item \field{id} is greater than or equal to \field{outb_sa_limit}.
+\item the supplied SA parameters, such as mode, options, cipher and authentication
+      algorithms are not supported in the capabitlity VIRTIO_CRYPTO_IPSEC_SA_CAP.
+\end{itemize}
+
+The device MUST fail the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE with
+the \field{status} set to VIRTIO_ADMIN_STATUS_EINVAL, for the
+VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INBOUND_SA object if,
+\begin{itemize}
+\item \field{id} is greater than or equal to \field{inb_sa_limit}.
+\item the supplied SA parameters, such as mode, options, cipher and authentication
+      algorithms are not supported in the capabitlity VIRTIO_CRYPTO_IPSEC_SA_CAP.
+\end{itemize}
+
+The device SHOULD maintain a table for subsequent lookups for inbound/outbound data
+processing with the corresponding SA based on the supplied \field{id}.
+
+The device MUST allow recreating the resource objects using the command
+VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE which was previously destroyed using
+the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY respectively without
+undergoing a device reset.
+
+The device MAY fail the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE with
+the \field{status} set to VIRTIO_ADMIN_STATUS_EINVAL for the
+VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTBOUND_SA or VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INBOUND_SA
+commands if the resource object with the same \field{spi} already exists.
+
+On device reset, the device MUST destroy all the resource objects which have been created.
+
+The device MUST copy the result of IPsec operation in the \field{dst_data[]}.
+The device MUST set the \field{status} field in struct virtio_crypto_inhdr to
+one of the following values of enum VIRTIO_CRYPTO_STATUS:
+\begin{itemize*}
+\item VIRTIO_CRYPTO_OK if the operation success.
+\item VIRTIO_CRYPTO_NOTSUPP if the requested algorithm or operation is unsupported.
+\item VIRTIO_CRYPTO_BADMSG if the integrity check is failed for IPsec decryption.
+\item VIRTIO_CRYPTO_INVSESS if the session ID invalid.
+\item VIRTIO_CRYPTO_ERR if any failure not mentioned above occurs.
+\item VIRTIO_CRYPTO_IPSEC_SA_SOFT_EXPIRY if an IPsec SA reaches the SA soft expiry limit
+configured in \field{struct virtio_crypto_ipsec_lifetime}.
+\end{itemize*}
+
+\drivernormative{\paragraph}{IPsec Service Operation}{Device Types / Crypto Device / Device Operation / IPsec Service Operation}
+
+The driver MUST query the capabilities using VIRTIO_ADMIN_CMD_CAP_ID_LIST_QUERY
+to discover the capability types the device offers.
+
+The driver MUST get VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP and VIRTIO_CRYPTO_IPSEC_SA_CAP
+if listed in VIRTIO_ADMIN_CMD_CAP_ID_LIST_QUERY command result, using
+VIRTION_ADMIN_CMD_DEVICE_CAP_GET to discover the capabilities the device is
+able to offer.
+The driver MUST set VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP and VIRTIO_CRYPTO_IPSEC_SA_CAP
+using VIRTIO_ADMIN_CMD_DEVICE_CAP_SET to indicate the device which capability
+the driver uses.
+
+For the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE, when creating a resource
+VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTBOUND_SA, the driver MUST set all the parameters
+in \field{struct virtio_crypto_resource_obj_ipsec_sa} with relevant values.
+And when create a resource object VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INBOUND_SA,
+the driver MUST set all the parameters except \field{struct virtio_crypto_ipsec_tunnel_param}.
+
+The driver MUST set \field{session_id} in struct virtio_crypto_op_header to a
+valid VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTBOUND_SA or
+VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INBOUND_SA \field{id}.
+The driver MUST set the \field{opcode} field in struct virtio_crypto_op_header
+to one of VIRTIO_CRYPTO_IPSEC_OUTBOUND and VIRTIO_CRYPTO_IPSEC_INBOUND.
diff --git a/device-types/crypto/device-conformance.tex b/device-types/crypto/device-conformance.tex
index 1667120..5d1c59f 100644
--- a/device-types/crypto/device-conformance.tex
+++ b/device-types/crypto/device-conformance.tex
@@ -10,4 +10,5 @@
 \item \ref{devicenormative:Device Types / Crypto Device / Device Operation / MAC Service Operation}
 \item \ref{devicenormative:Device Types / Crypto Device / Device Operation / Symmetric algorithms Operation}
 \item \ref{devicenormative:Device Types / Crypto Device / Device Operation / AEAD Service Operation}
+\item \ref{devicenormative:Device Types / Crypto Device / Device Operation / IPsec Service Operation}
 \end{itemize}
diff --git a/device-types/crypto/driver-conformance.tex b/device-types/crypto/driver-conformance.tex
index 672d0f6..4083ea4 100644
--- a/device-types/crypto/driver-conformance.tex
+++ b/device-types/crypto/driver-conformance.tex
@@ -11,4 +11,5 @@
 \item \ref{drivernormative:Device Types / Crypto Device / Device Operation / MAC Service Operation}
 \item \ref{drivernormative:Device Types / Crypto Device / Device Operation / Symmetric algorithms Operation}
 \item \ref{drivernormative:Device Types / Crypto Device / Device Operation / AEAD Service Operation}
+\item \ref{drivernormative:Device Types / Crypto Device / Device Operation / IPsec Service Operation}
 \end{itemize}
-- 
2.25.1

