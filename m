Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC99203D53
	for <virtio-comment@lists.linux.dev>; Mon, 16 Dec 2024 10:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734346150; cv=none; b=esGm4ViYUFjdUbxK4U1dnbkpkyq0y9O/A0z1HvxLCDI5nxI5Q76WzjSXET9NIdV+MRm3G+tEXZlZcKk25rcxK6t76fAuR7+O/F3lr4WR3RKiYkUIZat1vWIzKQdHu8H1ZZX+rybvdMI3st1aj6cyYpfupq/nWCaXkjlZNGN7s5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734346150; c=relaxed/simple;
	bh=tOBVMNU8ZAacm/tfrBKfBs6CNiAwk2RPT7Rys0J94lo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L676Y2mfB/rPW4H72mkBFMKBtw/HPBexCoFwwlUjYff1M3g7owSoyvYP3FBz9cFoIy7pjA+piCR7bdGdEFG/OYCLUFiIUexH4ZqV+x/MXhwX9M1ovy8HfXR7FU6uHK9i9tu4MeXiIZbO0ZXGsZoF04ltczvIrFnVIPVY/Es0zGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=bztlIdLM; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="bztlIdLM"
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGAZrko022932;
	Mon, 16 Dec 2024 02:49:08 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=C
	rd7UOeXLk6uZqP5u7a+z2u64FGoc5PNi24jCgVmPa4=; b=bztlIdLMSyxYsRYLo
	QbGt6RwlbOjnCvCM6MdVrSn2835DnuJ9HPfw8+L765AozjkUWO7LoSm5l0SYLxn6
	Jcyt969yn+foo4tb09Mr4yvnh5Fo2XkbdIIy8+tm4Z4F+G+rJWXyyV1m5wq2RGFh
	YH8M7vSHDr1sVa8XC65aLk7p/leWNyGISoiNaY/N6g7w6iF4HWdqMsZn/cf9e9PG
	K/mRPN9tTugeG3iXgg9RsF7mROxWEyKNGrt2qLHbfRFLCSfWhPxDSV2Wec0IKdgC
	gGPqzVkRJGeVMfXvhLUdZVFEqsGIHmPEJvx0QZTPimprbP1ka2hGu8PhCokT7Xql
	ysa+g==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 43jjkb80pb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 02:49:07 -0800 (PST)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 16 Dec 2024 02:49:06 -0800
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 16 Dec 2024 02:49:06 -0800
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id 860DA3F7045;
	Mon, 16 Dec 2024 02:49:03 -0800 (PST)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <pabeni@redhat.com>, <jasowang@redhat.com>,
        <parav@nvidia.com>, <sburla@marvell.com>, <ndabilpuram@marvell.com>,
        <jerinj@marvell.com>, <schalla@marvell.com>
Subject: [PATCH RFC 1/4] virtio-net: Add IPsec operation, capabilities and resource objects
Date: Mon, 16 Dec 2024 16:18:56 +0530
Message-ID: <20241216104859.2720719-2-schalla@marvell.com>
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
X-Proofpoint-GUID: EzcUS7YHs1RPtBEz6d-hOUB22eeYvaF-
X-Proofpoint-ORIG-GUID: EzcUS7YHs1RPtBEz6d-hOUB22eeYvaF-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

This commit introduces the IPsec Operation to the Net device
along with the capabilities and resource objects. This enables
the offloading of IPsec processing, both before transmission
and after reception, thereby providing inline offload
capabilities.

Capbilities:

1. IPsec Resource Capability (VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP):
   Indicates the device's IPsec resource limits, such as the number of
   encryption and decryption Security Associations (SAs).
2. IPsec SA Capability (VIRTIO_CRYPTO_IPSEC_SA_CAP): Specifies the
   supported IPsec modes, along with the supported cryptographic
   algorithms, authentication algorithms, IPsec options and
   anti-replay window size.

Resource objects:
1. VIRTIO_NET_RESOURCE_OBJ_IPSEC_OUTB_SA
2. VIRTIO_NET_RESOURCE_OBJ_IPSEC_INB_SA

These IPsec SA resource objects encompass parameters necessary
for packet encryption and decryption. These include the SPI,
tunnel headers, IPsec mode, IPsec options, and data specific to cipher
and authentication.

This patch refers the Virtio-crypto IPsec service operation
capabilities and resource objects data structures and crypto algorithm
definitions to avoid duplication, however the admin command type vaule
differs between Virtio-crypto and Virtio-net.

Signed-off-by: Srujana Challa <schalla@marvell.com>
---
 device-types/net/description.tex | 47 ++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index b2a0d39..2a5f635 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -415,6 +415,10 @@ \subsection{Device and driver capabilities}\label{sec:Device Types / Network Dev
 \hline
 0x0802 & \hyperref[par:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO-NET-FF-ACTION-CAP]{VIRTIO_NET_FF_ACTION_CAP} & Flow filter action capability \\
 \hline
+0x0803 & \hyperref[par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Device and driver capabilities / VIRTIO-CRYPTO-IPSEC-RESOURCE-CAP]{VIRTIO_NET_IPSEC_RESOURCE_CAP} & IPsec resource capability \\
+\hline
+0x0804 & \hyperref[par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Device and driver capabilities / VIRTIO-CRYPTO-IPSEC-SA-CAP]{VIRTIO_NET_IPSEC_SA_CAP} & IPsec Security Association(SA) capability \\
+\hline
 \end{tabularx}
 
 \subsection{Device resource objects}\label{sec:Device Types / Network Device / Device resource objects}
@@ -431,6 +435,10 @@ \subsection{Device resource objects}\label{sec:Device Types / Network Device / D
 \hline
 0x0202 & \hyperref[par:Device Types / Network Device / Device Operation / Flow filter / Resource objects / VIRTIO-NET-RESOURCE-OBJ-FF-RULE]{VIRTIO_NET_RESOURCE_OBJ_FF_RULE} & Flow filter rule object \\
 \hline
+0x0203 & \hyperref[par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Resource objects / VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-OUTBOUND-SA]{VIRTIO_NET_RESOURCE_OBJ_IPSEC_OUTB_SA} & IPsec outbound SA resource object \\
+\hline
+0x0204 & \hyperref[par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Resource objects / VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-INBOUND-SA]{VIRTIO_NET_RESOURCE_OBJ_IPSEC_INB_SA} & IPsec inbound SA resource object \\
+\hline
 \end{tabularx}
 
 \subsection{Device Operation}\label{sec:Device Types / Network Device / Device Operation}
@@ -3020,6 +3028,45 @@ \subsubsection{Flow filter}\label{sec:Device Types / Network Device / Device Ope
 capability and the classifier object, unless the VIRTIO_NET_FF_MASK_F_PARTIAL_MASK
 is enabled.
 
+\subsubsection{IPsec Operation}\label{sec:Device Types / Network Device / Device Operation / IPsec Operation}
+
+A network device can support the programming of IPsec Security Associations (SAs).
+In addition to standard packet processing, the IPsec protocol processing is also
+offloaded to the network device. This offloading occurs both pre-transmit and
+post-receive, providing inline offload capabilities.
+
+IPsec Inbound processing: In receive path the device will perform decryption,
+authentication, integrity checking and remove additional headers, including
+tunnel headers if in tunnel mode, as well as the ESP/AH header from the packet.
+The resulting packet contains only the plain data.
+
+IPsec Outbound processing: In transmit path the device will perform encryption,
+attach ICV, update/add IP headers and add ESP/AH headers/trailers to the packet
+and transmit.
+
+\paragraph{Device and driver capabilities}
+\label{par:Device Types / Network Device / Device Operation / IPsec Operation / Device and driver capabilities}
+
+The device and the driver indicate IPsec SA resource limits using the capability
+\hyperref[par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Device and driver capabilities / VIRTIO-CRYPTO-IPSEC-RESOURCE-CAP]{VIRTIO_NET_IPSEC_RESOURCE_CAP}
+The \hyperref[par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Device and driver capabilities / VIRTIO-CRYPTO-IPSEC-SA-CAP]{VIRTIO_NET_IPSEC_SA_CAP}
+capability specifies which IPsec protocol capabilities the device supports. The driver indicates
+the IPsec parameters by setting the IPsec SA capability prior to adding any resource objects.
+
+\paragraph{Resource objects}
+\label{par:Device Types / Network Device / Device Operation / IPsec Operation / Resource objects}
+
+The driver controls the IPsec SA resource objects using administration commands described in
+\ref{sec:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects}.
+
+The IPsec SA resource objects encompass crucial parameters necessary for packet
+encryption and decryption. These include the SPI, tunnel headers, IPsec mode,
+IPsec options, and data specific to cipher and authentication.
+
+See \hyperref[par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Resource objects / VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-OUTBOUND-SA]{VIRTIO_NET_RESOURCE_OBJ_IPSEC_OUTB_SA}.
+
+See \hyperref[par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Resource objects / VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-INBOUND-SA]{VIRTIO_NET_RESOURCE_OBJ_IPSEC_INB_SA}.
+
 \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
 Types / Network Device / Legacy Interface: Framing Requirements}
 
-- 
2.25.1

