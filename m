Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A926E203707
	for <virtio-comment@lists.linux.dev>; Mon, 16 Dec 2024 10:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734346160; cv=none; b=j68AqwAHL0Qm8TFRdUr5+3E+FgMeacAiZsZd1F0ptR/KxLtsUQ5s5ZF8ExK1kkhiFNaMusGWrtsMgWvdnIP6nxJ//Q8COCmwfGxMcWdirmWXYsRNkldg+vDlouH7mC7SKNSXthHv6CFpdPqzSn3XIj0i6kcnARN+FkLsqTAaLIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734346160; c=relaxed/simple;
	bh=jOji91tVJoN9vyrqgvGy/vkx43pGCXTRkyf8D8Ac9lg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C6bex/x/ChQNWHuWuhrC3V97tJLnqMW1kKrME7ahy1+/5fpFDSYyyb7RUiWP9ivs2kr2HWvptwjIOx/MYfGlBfmQly+ZxFI22/JDsd34fvXI2MJ3Kdin3BVVamvRJhEca9qLkI47ddpRrYoOqSKywiBDz/rm4ctwi+G5RaYR3wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=PGCZ006I; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="PGCZ006I"
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGAioEp006997;
	Mon, 16 Dec 2024 02:49:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=e
	ruzJK7T2P9RQeqkuxFDaZqFKRVM/U5nN8qsg1vaHto=; b=PGCZ006Iv7owE+LHk
	JyWbdhOBAFfWZY7iB2YwOBwQ/vn8ic/EbVevlt3cvuCWQUDBaF1SVLBHIpBni1HI
	Ro9KKPxsdn+gyESTkICJRdnV9aMiD82y/hSvw+1/S87JkIHY3FPEnZCSlQuekcZm
	V3AixVAEJi9t0GFoXsnFvseD/kDtOWgMKo1PMCWxEDVWJ8EumS107+F7y0VNYjeM
	97gXyp44qTRJ1Dpp/7lmww3y15C1GFatYYJef2LFyeC2lDUo1CY37NqKdj8C6e0g
	gXG1dGMcNwijXhrEt3gEQ4BKO0xTNfJFkkGmNrtY2jf2hXdfMURm1ZjHqnFR3EzJ
	Nkyew==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 43jjqn807w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 02:49:17 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 16 Dec 2024 02:49:15 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 16 Dec 2024 02:49:15 -0800
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id 0D92D3F7045;
	Mon, 16 Dec 2024 02:49:12 -0800 (PST)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <pabeni@redhat.com>, <jasowang@redhat.com>,
        <parav@nvidia.com>, <sburla@marvell.com>, <ndabilpuram@marvell.com>,
        <jerinj@marvell.com>, <schalla@marvell.com>
Subject: [PATCH RFC 4/4] virtio-net: Add IPsec operation device and driver requirements
Date: Mon, 16 Dec 2024 16:18:59 +0530
Message-ID: <20241216104859.2720719-5-schalla@marvell.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241216104859.2720719-1-schalla@marvell.com>
References: <20241216104859.2720719-1-schalla@marvell.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: sIUbnw_lDFtgv4tHSj4N_X6HRZCq3PEo
X-Proofpoint-ORIG-GUID: sIUbnw_lDFtgv4tHSj4N_X6HRZCq3PEo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.687,Hydra:6.0.235,FMLib:17.0.607.475
 definitions=2020-10-13_15,2020-10-13_02,2020-04-07_01

Add device and driver requirements for IPsec Operation.

Signed-off-by: Srujana Challa <schalla@marvell.com>
---
 device-types/net/description.tex        | 83 +++++++++++++++++++++++++
 device-types/net/device-conformance.tex |  1 +
 device-types/net/driver-conformance.tex |  1 +
 3 files changed, 85 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 5ebb28a..a686c69 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -3116,6 +3116,89 @@ \subsubsection{IPsec Operation}\label{sec:Device Types / Network Device / Device
 
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
+and VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY.
+
+The device MUST set \field{status} to VIRTIO_ADMIN_STATUS_EEXIT for the
+command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE when the resource \field{type}
+is VIRTIO_NET_RESOURCE_OBJ_IPSEC_OUTB_SA or VIRTIO_NET_RESOURCE_OBJ_IPSEC_INB_SA,
+if the object already exists with the supplied \field{id}.
+
+The device MUST set \field{status} to VIRTIO_ADMIN_STATUS_EBUSY for the
+command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY when the resource \field{type}
+is VIRTIO_NET_RESOURCE_OBJ_IPSEC_OUTB_SA or VIRTIO_NET_RESOURCE_OBJ_IPSEC_INB_SA,
+if the object is in use.
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
+in \field struct virtio_crypto_resource_obj_ipsec_sa with relevant values.
+And when create a resource object VIRTIO_NET_RESOURCE_OBJ_IPSEC_INB_SA,
+the driver MUST set all the parameters except
+\field struct virtio_crypto_ipsec_tunnel_param.
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

