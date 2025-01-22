Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E77C15B546
	for <virtio-comment@lists.linux.dev>; Wed, 22 Jan 2025 06:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737526925; cv=none; b=YUWrmnF4ZFb3ymEH1Mdyj94ZsUXvCfzS282Mvolt+uDlhH3NFUZtOhSpSxz3NZHst7BPqx6E+lr3OirND3svLV4leLRyDux5nMZde7/DsAUh/+ohlFDgCfrKVkCiRQllYrtwf2bn6lksKEqE9zCQsz4RmRT5tclBwGs5SbsSaqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737526925; c=relaxed/simple;
	bh=jDnTxk00ahb2cLWu8dTDFEhZ0oKFrOX+tBdJIT0G5c8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e6ok2dtlKGyoOBlkgFh47iyD2rCdKtbN2lnDtgh6HU90Q87aDLb1zlik0zKRps2MqiYTnrUAOdKpO19NzVIMqzzTM4cSRTaiWYYEDTGE87yfLmQ0CE4wrEhcVx03XUx4NVRFxE0V0p2X0L/Q5E0a9rW83wHVewQ4/NKQrTrxZGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=Mw15iMne; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="Mw15iMne"
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M6Lc3c021013;
	Tue, 21 Jan 2025 22:22:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=Q
	UrffRezehaXS40UjUeikOvpK6nzVlRV88xKXLmo4vI=; b=Mw15iMnexO/WI+iqq
	h7F85MLvrBO9rTrQcyLIGLe596b/aYBAsMFo7tc2UrVA0dQ2aL1RFCoYCPP9cSKF
	SqhcODBCiIN2YBFaHfDQiaLy49dUOg2iqI542dwq0+h5610AvubKuuB31/nD/G1I
	/Xx3jI1N+NXIm4AhQXJnZzo8YrPBFNztlZCvK8+pe0Z1f17eISHwUIeDBtisG/op
	17wj7yStPWARYURPTi2qe7lUAEvwXesPLmS2LXS3Bcm1M2HVYUXgAu3CC6y03Q7s
	bY4E4AP6t/Q70TdxG5fQAQHdRI7+5ymZiae+rGfDb24MO/BJ8cBU7TMZOx30OU3u
	+zp2Q==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 44aub9001j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 22:22:02 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 21 Jan 2025 22:22:01 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 21 Jan 2025 22:22:01 -0800
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id DD8743F70B4;
	Tue, 21 Jan 2025 22:21:58 -0800 (PST)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <pabeni@redhat.com>, <jasowang@redhat.com>,
        <parav@nvidia.com>, <sburla@marvell.com>, <ndabilpuram@marvell.com>,
        <jerinj@marvell.com>, <schalla@marvell.com>
Subject: [PATCH RFC v2 4/4] virtio-net: Add IPsec operation device and driver requirements
Date: Wed, 22 Jan 2025 11:51:44 +0530
Message-ID: <20250122062144.266725-5-schalla@marvell.com>
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
X-Proofpoint-GUID: 6esIzE1pyeJ1m6g4T0ZNJYehcyzffa2W
X-Proofpoint-ORIG-GUID: 6esIzE1pyeJ1m6g4T0ZNJYehcyzffa2W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_02,2025-01-22_01,2024-11-22_01

Add device and driver requirements for IPsec Operation.

Signed-off-by: Srujana Challa <schalla@marvell.com>
---
 device-types/net/description.tex        | 79 +++++++++++++++++++++++++
 device-types/net/device-conformance.tex |  1 +
 device-types/net/driver-conformance.tex |  1 +
 3 files changed, 81 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 3616917..52e5c4c 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -3126,6 +3126,85 @@ \subsubsection{IPsec Operation}\label{sec:Device Types / Network Device / Device
 
 See \hyperref[par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Resource objects / VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-INBOUND-SA]{VIRTIO_NET_RESOURCE_OBJ_IPSEC_INB_SA}.
 
+\devicenormative{\paragraph}{IPsec Operation}{Device Types / Net Device / Device Operation / IPsec Operation}
+
+When the device supports IPsec operations,
+\begin{itemize}
+\item the device MUST set VIRTIO_NET_IPSEC_RESOURCE_CAP, VIRTIO_NET_IPSEC_SA_CAP
+capability in the \field{supported_caps} in the command VIRTIO_ADMIN_CMD_CAP_SUPPORT_QUERY.
+\item the device MUST support the administration commands
+VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE,
+VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY, VIRTIO_ADMIN_CMD_RESOURCE_OBJ_QUERY,
+VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY for the resource types
+VIRTIO_NET_RESOURCE_OBJ_IPSEC_OUTB_SA and VIRTIO_NET_RESOURCE_OBJ_IPSEC_INB_SA.
+\end{itemize}
+
+When any of the VIRTIO_NET_IPSEC_RESOURCE_CAP or VIRTIO_NET_IPSEC_SA_CAP
+capability is disabled, the device MUST set \field{status} to
+VIRTIO_ADMIN_STATUS_Q_INVALID_OPCODE for the commands
+VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE,
+VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY, VIRTIO_ADMIN_CMD_RESOURCE_OBJ_QUERY,
+and VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY for the resource types
+VIRTIO_NET_RESOURCE_OBJ_IPSEC_OUTB_SA and VIRTIO_NET_RESOURCE_OBJ_IPSEC_INB_SA.
+
+The device MUST set \field{status} to VIRTIO_ADMIN_STATUS_EEXIT for the
+command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE when the resource \field{type}
+is VIRTIO_NET_RESOURCE_OBJ_IPSEC_OUTB_SA or VIRTIO_NET_RESOURCE_OBJ_IPSEC_INB_SA,
+if the object already exists with the supplied \field{id}.
+
+The device MUST fail the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE for the
+VIRTIO_NET_RESOURCE_OBJ_IPSEC_OUTB_SA object if,
+\begin{itemize}
+\item \field{id} is greater than or equal to \field{outb_sa_limit}.
+\item the supplied SA parameters, such as mode, options, cipher and authentication
+      algorithms are not supported in the capabitlity VIRTIO_NET_IPSEC_SA_CAP.
+\end{itemize}
+
+The device MUST fail the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE for the
+VIRTIO_NET_RESOURCE_OBJ_IPSEC_INB_SA object if,
+\begin{itemize}
+\item \field{id} is greater than or equal to \field{inb_sa_limit}.
+\item the supplied SA parameters, such as mode, options, cipher and authentication
+      algorithms are not supported in the capabitlity VIRTIO_NET_IPSEC_SA_CAP.
+\end{itemize}
+
+The device SHOULD maintain a table for subsequent lookups to inbound/outbound data
+with the corresponding SA based on the supplied \field{id}.
+
+The device MUST allow recreating the resource objects using the command
+VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE which was previously destroyed using
+the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY respectively without
+undergoing a device reset.
+
+The device MAY fail the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE with
+the \field{status} set to VIRTIO_ADMIN_STATUS_EINVAL for the
+VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTB_SA or VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INB_SA
+commands if the resource object with the same \field{spi} already exists.
+
+On device reset, the device MUST destroy all the resource objects which have been created.
+
+\drivernormative{\paragraph}{IPsec Operation}{Device Types / Net Device / Device Operation / IPsec Operation}
+
+The driver MUST query the capabilities using VIRTIO_ADMIN_CMD_CAP_ID_LIST_QUERY
+to discover the capability types the device offers.
+
+The driver MUST get VIRTIO_NET_IPSEC_RESOURCE_CAP and VIRTIO_NET_IPSEC_SA_CAP
+if listed in VIRTIO_ADMIN_CMD_CAP_ID_LIST_QUERY command result, using
+VIRTION_ADMIN_CMD_DEVICE_CAP_GET to discover the capabilities the device is
+able to offer.
+The driver MUST set VIRTIO_NET_IPSEC_RESOURCE_CAP and VIRTIO_NET_IPSEC_SA_CAP
+using VIRTIO_ADMIN_CMD_DEVICE_CAP_SET to indicate the device which capability
+the driver uses.
+
+For the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE, when creating a resource
+VIRTIO_NET_RESOURCE_OBJ_IPSEC_OUTB_SA, the driver MUST set all the parameters
+in \field{struct virtio_crypto_resource_obj_ipsec_sa} with relevant values.
+And when create a resource object VIRTIO_NET_RESOURCE_OBJ_IPSEC_INB_SA,
+the driver MUST set all the parameters except
+\field{struct virtio_crypto_ipsec_tunnel_param}.
+
+The driver SHOULD NOT add multiple inbound SA objects with the same \field{spi}.
+
 \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
 Types / Network Device / Legacy Interface: Framing Requirements}
 
diff --git a/device-types/net/device-conformance.tex b/device-types/net/device-conformance.tex
index d88484c..7fe8505 100644
--- a/device-types/net/device-conformance.tex
+++ b/device-types/net/device-conformance.tex
@@ -18,4 +18,5 @@
 \item \ref{devicenormative:Device Types / Network Device / Device Operation / Control Virtqueue / Device Statistics}
 \item \ref{devicenormative:Device Types / Network Device / Device Operation / Control Virtqueue / RSS Context}
 \item \ref{devicenormative:Device Types / Network Device / Device Operation / Flow filter}
+\item \ref{devicenormative:Device Types / Network Device / Device Operation / IPsec Operation}
 \end{itemize}
diff --git a/device-types/net/driver-conformance.tex b/device-types/net/driver-conformance.tex
index d346b88..0d20190 100644
--- a/device-types/net/driver-conformance.tex
+++ b/device-types/net/driver-conformance.tex
@@ -18,4 +18,5 @@
 \item \ref{drivernormative:Device Types / Network Device / Device Operation / Control Virtqueue / Device Statistics}
 \item \ref{drivernormative:Device Types / Network Device / Device Operation / Control Virtqueue / RSS Context}
 \item \ref{drivernormative:Device Types / Network Device / Device Operation / Flow filter}
+\item \ref{drivernormative:Device Types / Network Device / Device Operation / IPsec Operation}
 \end{itemize}
-- 
2.25.1

