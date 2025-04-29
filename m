Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAC21E89C
	for <virtio-comment@lists.linux.dev>; Tue, 29 Apr 2025 13:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745932819; cv=none; b=cs5zxpAs/KhEo+V/ICS41SY2lblIZVJYn0uHjBMOfdH5R6dJAVtCAnkJarf3RmmICEoY8CsQznpDnLg6GQCe3wpXiEaBwBmehYN+i+2xL1vX69+f9IOFxmzf+y+rIfa0fYT3gomOBuDU6pkh3DBb5ZXW3qyyPgEZkLmRarfKpkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745932819; c=relaxed/simple;
	bh=oJSGttBZDocqY9JuMYq4mBfP3uXu2cIMd47j741ZuyA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ax0INUDFZNNACb65gbRGK+nb60ub1z/0XsXbqahE4xu0Mmmn5s7SZoxnslA7OrescxgApKLE8S1U3AkhoZeH0+97MHepBo6RgtImZ6swcpbDm6coKSHGWhJsCgxhzGE9YNc5SBpsYeBqedVgXid3ctIok/QkQm2a6fltfYluxdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=O15Y024y; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="O15Y024y"
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T5xp4V019073;
	Tue, 29 Apr 2025 06:20:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=k
	r6Y5y99814pEAiUsfR9R0+4BVPtemuuoVruLg5YNCo=; b=O15Y024yNFqijGkQS
	OraqdBPmPrDWRKKpvleznJ89Zkbwve4mN9g/CojmsyXnzIbdFKbozyLmT5Uw38mB
	kuVzYQ/7v4BJ6JplmSR4E5g4qJ1esV5QzcKr2VQvgjhoAZW7C04StfpuIDZyD14x
	EdmbI3WN3FTRiSTTeX+qVXrbPB9+pRv8T8h94BQoNP+Clw8rGJ8K7n/vl5VRA81A
	OJw8RShccy9dew2l2x3Jz9I1NCeB9SfHgG5wH2XXzrbiQ4IER5x7wXj+i55Bq1q6
	lfbYth6T2d/9mmcOVgrE1ZqVz6Qv8ki2oeXvnaNsYjjw86e0MkQLMdhr0Wk5e1jc
	ACFpg==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 468vuq65gc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 06:20:15 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 29 Apr 2025 06:20:14 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 29 Apr 2025 06:20:14 -0700
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id 1C5C75B6957;
	Tue, 29 Apr 2025 06:20:10 -0700 (PDT)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <cohuck@redhat.com>, <mvaralar@redhat.com>,
        <parav@nvidia.com>, <sma@napatech.com>, <sburla@marvell.com>,
        <ndabilpuram@marvell.com>, <jerinj@marvell.com>, <anoobj@marvell.com>,
        <schalla@marvell.com>
Subject: [PATCH v6 4/4] virtio-crypto: Add device and driver requirements for IPsec operation
Date: Tue, 29 Apr 2025 18:49:53 +0530
Message-ID: <20250429131953.1949757-5-schalla@marvell.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250429131953.1949757-1-schalla@marvell.com>
References: <20250429131953.1949757-1-schalla@marvell.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA5OSBTYWx0ZWRfX2DMGxxPMgllD GIt6O/TyJd31wlgyYaZwZqbQVuvfW0Goi8REQssxL327b8XkE3U4O+3kTJikjWkF7edFTaZbQ1+ fM7GJDAbEi1klEYGNhsFSIutHkar+ZiXm0JEcRstAhP+wzGfm4kXCF6O7MV1fpbrGR0q9K9oly1
 XYsFq8KSty61VATKZdCLDLf1x5TTzYIl7EDx3myJ3XnHaNIOwLBqJ7k3nmM/nYIYiqtiQzMi7m8 Lx2xCn1HlVJucYT3l5MoZVRf1VReDRBvutmH4cNUl22NEDFKIpXhgUzO111w2mN8qhSogN+GkzO QXEHw9vQPMb/TX9xiCKl81b12bQwPwLdR0U0F6C1lxG32v/6HIaJyuYHu3KX7M4WvJ5fqs1FNwC
 pwxckuulJgEr3oISxZz49IExuOsnc3eiiEvvp9AIakzdDXLSQ50fXza/hIqh6oDLe92QCWY5
X-Authority-Analysis: v=2.4 cv=L60dQ/T8 c=1 sm=1 tr=0 ts=6810d20f cx=c_pps a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17 a=XR8D0OoHHMoA:10 a=M5GUcnROAAAA:8 a=Ikd4Dj_1AAAA:8 a=I2nkbDfs0ME7We_epX0A:9 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-ORIG-GUID: lFrMrxx42M7e2T54jsCTW_VpxbB6MnQk
X-Proofpoint-GUID: lFrMrxx42M7e2T54jsCTW_VpxbB6MnQk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01

Add device and driver requirements for IPsec Operation.

Signed-off-by: Srujana Challa <schalla@marvell.com>
Reviewed-by: Parav Pandit <parav@nvidia.com>
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

