Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776E71172A
	for <virtio-comment@lists.linux.dev>; Tue, 20 May 2025 12:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747743588; cv=none; b=UQEOQGuXwvCbProeXifkMaP8pNxfTp79jEM7e2miQETFEY72KwhDd9Y+YE75gBv1lkPiNvjrvh9TPi5QfoauT762aVOSZtCoNppzoPWpoceekrJmfl6XfZUc8NNO1L5/Q9hFl8WK7sa8isc2n2oFVF0zCCejeOJkRT0lfeyK290=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747743588; c=relaxed/simple;
	bh=clp0c2IlCD2Ba9yB7yFfPcfsJ0dkTkeIY+8EtVYyI+c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lsXU3k1DgDPzm2gN9VPihZ8Fx+wcXdtrIIBfddkcWv547OPbpOAYCe05SBdooybQOWfwnKEryzV6NQCSsxGMAtflnSy/yzjLNTSH6LLGNOZdFlnLZOlDWONXgz9lU/pKoLw7cOzfecwdY3VX2nb/MfHzB+so+AwUuOkFpjL1xfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=MBEJel8r; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="MBEJel8r"
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K6iIkA007933;
	Tue, 20 May 2025 05:19:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=K
	iSUAomEyredNJluneZmIXuORXNl6fSeLNUgXEjd+pw=; b=MBEJel8rTgan+LOL9
	3WxflLM4Rr/wwditjmOeS+l5fVVoEhMSxZ/o5L2nrpMmE3D/YKhMwE0+GKF1Gpie
	9ivLI/S9iUGHM6AgnSs32rAy/KD5RODDi4CXTnmzOC4HVkZNZlIYFcLaVg84HeQ+
	khBE4u72krSoObAcWAEi3dAU7CsKA5J6DilEFM0QPWB2Id0Rdgl0gzeFeqYzBMme
	HcsWp2X+9gE4PAWnnJhZVc+1MKorwX3azGHaGUeh9ehUDCRYprAFeTCBmOEPZ75M
	34y/w9MYzS504eubu0wz263k3pnmTiobC49prG7TlLYYMZMB0/kzBIkHldCln1o0
	SbKGg==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 46rmqxgh04-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 05:19:45 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 20 May 2025 05:19:44 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 20 May 2025 05:19:44 -0700
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id E06B93F7061;
	Tue, 20 May 2025 05:19:40 -0700 (PDT)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <pabeni@redhat.com>, <jasowang@redhat.com>,
        <parav@nvidia.com>, <sburla@marvell.com>, <ndabilpuram@marvell.com>,
        <jerinj@marvell.com>, <kshankar@marvell.com>, <schalla@marvell.com>
Subject: [PATCH v7 4/4] virtio-net: Add IPsec operation device and driver requirements
Date: Tue, 20 May 2025 17:49:24 +0530
Message-ID: <20250520121924.2169258-5-schalla@marvell.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250520121924.2169258-1-schalla@marvell.com>
References: <20250520121924.2169258-1-schalla@marvell.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: VXfJfHQQKPC0X6nHjFO-xC8ffZ2WKIHJ
X-Authority-Analysis: v=2.4 cv=MMtgmNZl c=1 sm=1 tr=0 ts=682c7361 cx=c_pps a=gIfcoYsirJbf48DBMSPrZA==:117 a=gIfcoYsirJbf48DBMSPrZA==:17 a=dt9VzEwgFbYA:10 a=M5GUcnROAAAA:8 a=Ikd4Dj_1AAAA:8 a=QX9oew5WznxAzni0h4MA:9 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-ORIG-GUID: VXfJfHQQKPC0X6nHjFO-xC8ffZ2WKIHJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA5OSBTYWx0ZWRfXz7unCQliPhYw OY8KYI5/FRvgdfww9Gsyuf2uqEGJXw0cPqQ4N7bpjNWd8rmxlDmuMKHOY/A73FIUaEsjzZbUUD1 cVLGf8Y+L66rthmDeFfnkvVVtwuFw/4+npt17AunlDcU27P+q+pjrDlBrU330HjoSDQViUPL58m
 9/jq/Jg2MYXuofq0xLVSPbtojB5H1TpZ9w4TFTAYyF/d7b4KTZdJLykQqo2itFZe5yMnpdCMWo0 fpXimiVwDzvcYEaMFoThyubbrc3EretDVw5XsLcuPkLSa3yyE0RSSVH1IdhY+Ay5M52euisypIF De7k+c7j/eVnZIu4X3V96hKVZFV+zY49xESZu7JZTIj7IuVUsHDQLN4+92W9uXWNoX/MbHnVe3g
 6qFwNKWvErM0yp6tssgyIDdDoilnK9UiENCooTcycdTidO8fTSqQVi0X+pyT1COWL7U+0u2Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_05,2025-05-16_03,2025-03-28_01

Add device and driver requirements for IPsec Operation.

Signed-off-by: Srujana Challa <schalla@marvell.com>
Reviewed-by: Parav Pandit <parav@nvidia.com>
---
 device-types/net/description.tex        | 83 +++++++++++++++++++++++++
 device-types/net/device-conformance.tex |  1 +
 device-types/net/driver-conformance.tex |  1 +
 3 files changed, 85 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index a2a1753..415c7fd 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -3599,6 +3599,89 @@ \subsubsection{IPsec Operation}\label{sec:Device Types / Network Device / Device
 
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
+In the outbound data path, the driver MUST ensure that packets do
+not exceed the PMTU prior to transmission to the device.
+(Refer to \hyperref[intro:IPSEC]{[IPSEC]} for a detailed description of PMTU)
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

