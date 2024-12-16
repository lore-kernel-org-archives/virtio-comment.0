Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE672010EF
	for <virtio-comment@lists.linux.dev>; Mon, 16 Dec 2024 10:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734344484; cv=none; b=KCTeqGdo/JXHUtrotz5ZEbcsER3K7Ef0vBisbhQJ01hl7qhneZGjRwjgWTqbrO5fxQNiZ5sHicLAFyO7UHqpyUwWKsXOcNwuS1/G6FlS2fUx6kjMFqwt2/5WT1u6kZHslcJBdnbPLeL6oLKpJSMrELvZdjiWTWTANampjnHhkxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734344484; c=relaxed/simple;
	bh=cagto4eJoFS7av53MaUw3RuiAyVSbX6O9RQu5qhWKTw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qKVHOOrFHifcLEXsQP3m/hbzmoHOy01Luyb9XDPlUylwIknganSUJfYU17zEy3mVSbsICrLXtzPlKp886W9GsiDu/pVNhosj7AlDHzrULEH8kfbEDlMgknlJLn49jG0/XzpAVHVEsyDm8I5+GlPIQqmi9wjf6wocwxGb+phKWN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=Qr+3xv+6; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="Qr+3xv+6"
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BG9YBX7025216;
	Mon, 16 Dec 2024 02:21:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=r
	0qKYdC2msBJzwqpfGlzdHszDEeG/8UpHfUP6QSDnis=; b=Qr+3xv+613Joqa6qc
	oUge8jDij3Q6gtHUZJl/8HoeBVGV0+NBXuhx913TxwWi9aHej7/Ai3FKYm9hUJuh
	5LRf1Tg4cdHt0Etp1wFO3TZ6h1nlOBlrRXNDQUa8d+5aWKn9FsKkC3xkb8ObqJ6I
	8DWlG4+KujXsCup1JldSDvkibgzhLTRmY9xUt/F904tyl8LmSfhANhKEE5JuN7C8
	4kJweGePG1jV0ZYL8ss12wodbP+tOmbG48b27LSBPdq5omkkeXEBIX0xCESljJcA
	KBC8WiP7vb0IQYN/0UjnJHS7mTBwsedF5bTnm6KjAEbbmRS86hUyTMuqNXEcT8mG
	BQZXQ==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 43jhpdr2vx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 02:21:21 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 16 Dec 2024 02:21:20 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 16 Dec 2024 02:21:20 -0800
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id 3066A3F7097;
	Mon, 16 Dec 2024 02:21:16 -0800 (PST)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <cohuck@redhat.com>, <mvaralar@redhat.com>,
        <parav@nvidia.com>, <sburla@marvell.com>, <ndabilpuram@marvell.com>,
        <jerinj@marvell.com>, <anoobj@marvell.com>, <schalla@marvell.com>
Subject: [PATCH RFC v2 4/4] virtio-crypto: Add device and driver requirements for IPsec operation
Date: Mon, 16 Dec 2024 15:51:02 +0530
Message-ID: <20241216102102.2720453-5-schalla@marvell.com>
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
X-Proofpoint-GUID: 43Qkh7AQAcKJlJnAJCL82kO2-j0SWd5O
X-Proofpoint-ORIG-GUID: 43Qkh7AQAcKJlJnAJCL82kO2-j0SWd5O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.687,Hydra:6.0.235,FMLib:17.0.607.475
 definitions=2020-10-13_15,2020-10-13_02,2020-04-07_01

Add device and driver requirements for IPsec Operation.

Signed-off-by: Srujana Challa <schalla@marvell.com>
---
 device-types/crypto/description.tex        | 100 +++++++++++++++++++++
 device-types/crypto/device-conformance.tex |   1 +
 device-types/crypto/driver-conformance.tex |   1 +
 3 files changed, 102 insertions(+)

diff --git a/device-types/crypto/description.tex b/device-types/crypto/description.tex
index e644861..dc359da 100644
--- a/device-types/crypto/description.tex
+++ b/device-types/crypto/description.tex
@@ -2235,3 +2235,103 @@ \subsubsection{IPSEC Service Operation}\label{sec:Device Types / Crypto Device /
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
+and VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY.
+
+The device MUST set \field{status} to VIRTIO_ADMIN_STATUS_EEXIST for the
+command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE when the resource \field{type}
+is VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTBOUND_SA or VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INBOUND_SA,
+if the object already exists with the supplied \field{id}.
+
+The device MUST set \field{status} to VIRTIO_ADMIN_STATUS_EBUSY for the
+command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY when the resource \field{type}
+is VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTBOUND_SA or VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INBOUND_SA,
+if the object is in use.
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
+in \field struct virtio_crypto_resource_obj_ipsec_sa with relevant values.
+And when create a resource object VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INBOUND_SA,
+the driver MUST set all the parameters except
+\field struct virtio_crypto_ipsec_tunnel_param.
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

