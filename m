Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9655A442C
	for <virtio-comment@lists.linux.dev>; Tue, 29 Apr 2025 13:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745933133; cv=none; b=URKNWWVZhJhTj6K8hiZMvwTOAdwoe/HRVy1hvJTxNaYuGWCrRXWVPI/sR8Dc3C8sdPObPgmcsdI/HSLXigiVJ5hZox0lXegWzIZNLXUZWk5IkY2a5EgBbLDxoC/PLlHJxsHpz7LhrRGgQFqJqN5+yxQNryTGoZ+JipvsfkuO/BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745933133; c=relaxed/simple;
	bh=T22sTD6XPRXWxnNxgg2yG52bQI3mVlSFd56LAYjPoIQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TGC5Kwfscnuu2+0Mx4p0yUrQNOvcM+b+LU6mbT1xt2r6sdQk8M0F4LXwDSCMEFZaQTweHEqx1bV9pIeTkO1HFN+b8VbGflkoSAFnc2MwkewZSxVNm3yLygrzU/OEDLtuHWFRL7Ga2LfsfORZ+Gynhgkn8RMuTjrKISdtM26ugg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=YCFrLKCp; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="YCFrLKCp"
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TClnH0024259;
	Tue, 29 Apr 2025 06:25:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=e
	bi8mmtKAW0U1/kKZHUIQrc8j9y2i5XRm1YWKqd8g5s=; b=YCFrLKCpUC2bAf/7J
	ldVYTcSdRB9kk94/eqvrXRfNYG6vbmNQ1eZsk/Az45rrwYgXGp28g5vN7FMn+ZRr
	obOh1p+i3VdfMJAEuc2Q3rpOwfu4Sbpk/CTAU1P2RpxsD1l2TFeQPX8FvokZf53I
	36czlv5S1gSGOXtw6P7Onyq3+oZh0ACCZyU/uvpDKV7mJEhRJnUgFEZDKJeLTb3y
	HluWRZy5uQ2EyKmfqwcMYMHO2ZvHUJrGMJrQMkLMfY8+xEtA5/Fl8wHguXsN1pCP
	5Ev3V7d6oR6lYfx3owqZ0cc226J9Wa8W0F8Clq8f0tHLVb5SFCxJf1AmbFTZk8PG
	cmjWA==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 468vuq6602-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 06:25:30 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 29 Apr 2025 06:25:30 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 29 Apr 2025 06:25:30 -0700
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id D93CE3F70C3;
	Tue, 29 Apr 2025 06:25:26 -0700 (PDT)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <pabeni@redhat.com>, <jasowang@redhat.com>,
        <parav@nvidia.com>, <sburla@marvell.com>, <ndabilpuram@marvell.com>,
        <jerinj@marvell.com>, <kshankar@marvell.com>, <schalla@marvell.com>
Subject: [PATCH v6 4/4] virtio-net: Add IPsec operation device and driver requirements
Date: Tue, 29 Apr 2025 18:55:10 +0530
Message-ID: <20250429132510.1949946-5-schalla@marvell.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250429132510.1949946-1-schalla@marvell.com>
References: <20250429132510.1949946-1-schalla@marvell.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA5OSBTYWx0ZWRfX+cVZ1Rw6tyqL VK1cydhNq2DeFUUX6CuX0YgZQG+43YERLhyp5eQYbOPkGfD7RmVI0Dvx43lNy6+t42rmQtEmYBW avQdDjR2SN6CgpaZakikydo/97dvV1a5KcKR0DVlpXF4wVYwCSKMBfy71jnM26NxFoTCuCAkzYb
 vBbkO+9kfEdIte7JYlZu75a7mplznDS96zM8rgwmZ4dNIjnN8tz2vjIV7BUurCILbCzRkXGisdR HT4KCoJ37bxYKUeV0J4iBNeY157KRzXXqm2XvH69wcEBSCRMQfDhv6VQzxyiNJ4S87LxuVbzzCI Oa8OEFBwieuJDlHXEg4zP0QySu09uAkvUjUgu5fGjjyashkxwDrDIO28+TmYtqtKqTZiPz/tUKy
 Dm4XJ6vAKMEP7vn8idkFfEb37FCmZEB9AvxWOPBcR3qcozAg4d9dGVMziNKykfpdyhcywxfb
X-Authority-Analysis: v=2.4 cv=L60dQ/T8 c=1 sm=1 tr=0 ts=6810d34a cx=c_pps a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17 a=XR8D0OoHHMoA:10 a=M5GUcnROAAAA:8 a=Ikd4Dj_1AAAA:8 a=QX9oew5WznxAzni0h4MA:9 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-ORIG-GUID: QR36kELyw9MZ2stcjSMyYevB8nkMdXjQ
X-Proofpoint-GUID: QR36kELyw9MZ2stcjSMyYevB8nkMdXjQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01

Add device and driver requirements for IPsec Operation.

Signed-off-by: Srujana Challa <schalla@marvell.com>
Reviewed-by: Parav Pandit <parav@nvidia.com>
---
 device-types/net/description.tex        | 83 +++++++++++++++++++++++++
 device-types/net/device-conformance.tex |  1 +
 device-types/net/driver-conformance.tex |  1 +
 3 files changed, 85 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 2540f2b..36b2a80 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -3596,6 +3596,89 @@ \subsubsection{IPsec Operation}\label{sec:Device Types / Network Device / Device
 
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

