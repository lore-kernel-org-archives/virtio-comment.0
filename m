Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA102641D6
	for <virtio-comment@lists.linux.dev>; Tue,  8 Apr 2025 07:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097735; cv=none; b=R12RI0ka6mEanVH43IcvW/8n7gg6109S9cpMc8lHfWFKOxKl7sAu6pjOZuwZsy0ZzzZmo/T9y/x6gsJdWwIGB2dwcKY/rMI4cPcCNWHhWfblCWdHRAcNMXO70+ZIVnmjmjAz5abJDRVAL5APU5tVGUqKULYY2LvGmbq9tvNa2lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097735; c=relaxed/simple;
	bh=P8rV01hIK05Lt7Fya4fdz2X8+2pFTvtX8JkL/yx5eh4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uIHdgPtxjTCx167F780MTI8PfO+Q7dNJCfznoqzqZD5QUL6dmqEDdpKF1jpaJkRoSjXGsfe6m53VdzW1dxWegvW2MPEA2uxzmGjWPvrWdpISCehO4pWacW7b8Rn1imh2m12D3XtRRlSUAFCoCUASqsK9OVFnnQSarUTW+Ipm4ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=E3T9ses8; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="E3T9ses8"
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5387UXvj027080;
	Tue, 8 Apr 2025 00:35:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=W
	2WYYy4i7mljTXML36uUXZc1jEDn3ETpHmUzqkIp7Dk=; b=E3T9ses8g5N/lPkoo
	xqViAFExqwx64NmS6BjKZpHNJvaf1ZxJPL4BYJ/X18VAF9AfjbXt9UCrSwzte7Kl
	s90ni5qNRG7JJ7CmyKXrOpZHtZ/bR65QXDl+qC3D61RutIEpT2RJBsCRxSYQoEG6
	3XjoiPRBZuJaVyvM/rmtHxoup7dwM9KAdiuhfPbKNpHO4VJhnBd4rt4at2UjkcUB
	XVhD0udDUNb7dlJzxKw4F0uuyJBIwl2cuZ9muFHiow9aCwe2z4lG6GYAD9JG95vF
	fU+5vtsmhexwOfMM6lFAYqX5fPkqIS0NFhEPCK9c8diuGxJOPJS3L46lWSip25OM
	Hmnog==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 45u1vp5mbp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 00:35:31 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 8 Apr 2025 00:35:30 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 8 Apr 2025 00:35:30 -0700
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id 7A3FB3F7114;
	Tue,  8 Apr 2025 00:35:27 -0700 (PDT)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <cohuck@redhat.com>, <mvaralar@redhat.com>,
        <parav@nvidia.com>, <sma@napatech.com>, <sburla@marvell.com>,
        <ndabilpuram@marvell.com>, <jerinj@marvell.com>, <anoobj@marvell.com>,
        <schalla@marvell.com>
Subject: [PATCH RFC v5 4/4] virtio-crypto: Add device and driver requirements for IPsec operation
Date: Tue, 8 Apr 2025 13:05:12 +0530
Message-ID: <20250408073512.1783641-5-schalla@marvell.com>
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
X-Proofpoint-ORIG-GUID: XvZa4ybts3hI429pRlKmqIcZPovOqIm1
X-Authority-Analysis: v=2.4 cv=YbC95xRf c=1 sm=1 tr=0 ts=67f4d1c3 cx=c_pps a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17 a=XR8D0OoHHMoA:10 a=Ikd4Dj_1AAAA:8 a=M5GUcnROAAAA:8 a=I2nkbDfs0ME7We_epX0A:9 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-GUID: XvZa4ybts3hI429pRlKmqIcZPovOqIm1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_02,2025-04-07_01,2024-11-22_01

Add device and driver requirements for IPsec Operation.

Reviewed-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Srujana Challa <schalla@marvell.com>
---
 device-types/crypto/description.tex        | 97 ++++++++++++++++++++++
 device-types/crypto/device-conformance.tex |  1 +
 device-types/crypto/driver-conformance.tex |  1 +
 3 files changed, 99 insertions(+)

diff --git a/device-types/crypto/description.tex b/device-types/crypto/description.tex
index 4ccdd33..42f53e6 100644
--- a/device-types/crypto/description.tex
+++ b/device-types/crypto/description.tex
@@ -2277,3 +2277,100 @@ \subsubsection{IPSEC Service Operation}\label{sec:Device Types / Crypto Device /
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

