Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE252C374B
	for <virtio-comment@lists.linux.dev>; Tue, 29 Apr 2025 13:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745933122; cv=none; b=MTpaCdzo1wSYMGPFJvnn62DvneZGPyKDMgTPNF0mXpdbHdtkp+hgym1xf2fD3U7IOtBCqi02h04cz0fK6YTrv6JWZsWw62DphTug6o8ugugm0lIuNLvXOgZssn2KuvQnMh12trjhLYiuyNDnhinyH3FT3GHif6Qfh1UUyNLn4lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745933122; c=relaxed/simple;
	bh=svrxgAPiY1pPY2bLr3t1f8JAyYROCXFVknlA82VraxM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h3OznOrynNQILCGD+Ccw58abbM58wOpuzvrcpIGQHx4L7Y4ZJvYAvEFK9piaEi+Yykz/LCi+Q6SRT1eKW2LK3L0kBLq05BwqjfaSTqd9orzCz5qoBRCPVlAdulqqrdbXa3PFmZFe6HBWd/92RUizzrwHLDMbiawEWHeMYh7mn9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=i66BbsMp; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="i66BbsMp"
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TClnGt024259;
	Tue, 29 Apr 2025 06:25:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=B
	NMGTHsvg5gNqKKkqw1oqDly5hGIcoQCpcD91KZzovg=; b=i66BbsMpaVInh1LUa
	fQwR4zrBaXyDPl9Fxqn4CBkQQJTZsFPzMFajPlz2uFrAescQO23/ffQLg14g6mRR
	LIcgy78l1m0AcSqBlBbJ9RzSvwZjo2ilL8cArKSXd3EnsX+OVOmOAMHd4CFRTtx1
	8LVGtn98fXwewQzo/MXXuySjZN+F5MFqBShhK75pCRsZslB9v2aYZ4TU0OHgP5DQ
	GCUXXG0lf8QOP7NeCnIzDds28vfJBuOH5GNuNro1QSi8D9Y0t9Zy+l8flAMarxj1
	i4UP7EJycfsicMs0mq4DyEvcW839PMKH+sK66YQjQkbTcaN7ghXduECRbZQxphGZ
	VcxBQ==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 468vuq65yf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 06:25:19 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 29 Apr 2025 06:25:18 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 29 Apr 2025 06:25:18 -0700
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id 8252A3F70C3;
	Tue, 29 Apr 2025 06:25:15 -0700 (PDT)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <pabeni@redhat.com>, <jasowang@redhat.com>,
        <parav@nvidia.com>, <sburla@marvell.com>, <ndabilpuram@marvell.com>,
        <jerinj@marvell.com>, <kshankar@marvell.com>, <schalla@marvell.com>
Subject: [PATCH v6 1/4] virtio-net: Add IPsec operation, capabilities and resource objects
Date: Tue, 29 Apr 2025 18:55:07 +0530
Message-ID: <20250429132510.1949946-2-schalla@marvell.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA5OSBTYWx0ZWRfX3ckiry9zqC4p 8W8WysHy8aYi+Hffwk7CEJ5TbCFrz4ev5M+WWbPz3gkOb+1u2khpSpYUUmJjRDwQxFrmW5VBrR8 83/ZM3PfLypl1wvWmyNhfB/T3CqJ1wXrbMg/LTuNNr/2cQ6VwYpNxvWS13CYLU+oH1YoU/fPttC
 OKkkhmtHCZaEFezukWBhYT8KCX53jS2ZOZESd8RWv5WRiS4ja65rt3pWD7pxb+bSOsA01Rd8nGw ehlaMhQHejuIvGwkFxz0kQdSsxHFFs2Y6AMAYRMn7Pd1oScnVOf10ShWJXx3HA/xWp90rsjUl91 YZ3LwgLLoCHYXZkXthG9/5GuRO0mZQTDHhyLpS4g4fB32J/daUt09y6Z2sUl2ZMUitwqKksYjrS
 +b6I9RUfQlObfQCRGLeQyEsgAqNdglZrDfk692+M+mJnkNDUzK7A51mL6uninpxWftDjgvyw
X-Authority-Analysis: v=2.4 cv=L60dQ/T8 c=1 sm=1 tr=0 ts=6810d33f cx=c_pps a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17 a=XR8D0OoHHMoA:10 a=M5GUcnROAAAA:8 a=Ikd4Dj_1AAAA:8 a=tL5DaOeHnXsxyfyq8M4A:9 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-ORIG-GUID: EPUXXR_8uLmM7Eo8PGhQtcL9zy7uJNt1
X-Proofpoint-GUID: EPUXXR_8uLmM7Eo8PGhQtcL9zy7uJNt1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01

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
tunnel headers, IPsec mode, IPsec options, and metadata specific
to cipher and authentication.

This patch refers the Virtio-crypto IPsec service operation
capabilities and resource objects data structures and crypto algorithm
definitions to avoid duplication, however the admin command type vaule
differs between Virtio-crypto and Virtio-net.

Signed-off-by: Srujana Challa <schalla@marvell.com>
Reviewed-by: Parav Pandit <parav@nvidia.com>
---
 device-types/net/description.tex | 53 ++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 0bb1cef..9def4d2 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -140,6 +140,12 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
 \item[VIRTIO_NET_F_OUT_NET_HEADER(69)] Driver can provide the start of
  \field{outer_nh_offset} value. Device gains advantage by not reading packet
   to calculate outer network header offset.
+
+\item[VIRTIO_NET_F_IPSEC(70)] Device supports inline IPsec processing.
+ \field{struct virtio_net_hdr} size expands upto field \field{sturct ipsec_resource_hdr}
+ when VIRTIO_NET_F_IPSEC is negotiated. When a device offers IPsec feature, it SHOULD
+ also offer the VIRTIO_NET_F_OUT_NET_HEADER feature.
+
 \end{description}
 
 \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device / Feature bits / Feature bit requirements}
@@ -462,6 +468,10 @@ \subsection{Device and driver capabilities}\label{sec:Device Types / Network Dev
 \hline
 0x0802 & \hyperref[par:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO-NET-FF-ACTION-CAP]{VIRTIO_NET_FF_ACTION_CAP} & Flow filter action capability \\
 \hline
+0x0803 & \hyperref[par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Device and driver capabilities / VIRTIO-CRYPTO-IPSEC-RESOURCE-CAP]{VIRTIO_NET_IPSEC_RESOURCE_CAP} & IPsec resource capability \\
+\hline
+0x0804 & \hyperref[par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Device and driver capabilities / VIRTIO-CRYPTO-IPSEC-SA-CAP]{VIRTIO_NET_IPSEC_SA_CAP} & IPsec Security Association(SA) capability \\
+\hline
 \end{tabularx}
 
 \subsection{Device resource objects}\label{sec:Device Types / Network Device / Device resource objects}
@@ -478,6 +488,10 @@ \subsection{Device resource objects}\label{sec:Device Types / Network Device / D
 \hline
 0x0202 & \hyperref[par:Device Types / Network Device / Device Operation / Flow filter / Resource objects / VIRTIO-NET-RESOURCE-OBJ-FF-RULE]{VIRTIO_NET_RESOURCE_OBJ_FF_RULE} & Flow filter rule object \\
 \hline
+0x0203 & \hyperref[par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Resource objects / VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-OUTBOUND-SA]{VIRTIO_NET_RESOURCE_OBJ_IPSEC_OUTB_SA} & IPsec outbound SA resource object \\
+\hline
+0x0204 & \hyperref[par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Resource objects / VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-INBOUND-SA]{VIRTIO_NET_RESOURCE_OBJ_IPSEC_INB_SA} & IPsec inbound SA resource object \\
+\hline
 \end{tabularx}
 
 \subsection{Device parts}\label{sec:Device Types / Network Device / Device parts}
@@ -3480,6 +3494,45 @@ \subsubsection{Flow filter}\label{sec:Device Types / Network Device / Device Ope
 capability and the classifier object, unless the VIRTIO_NET_FF_MASK_F_PARTIAL_MASK
 is enabled.
 
+\subsubsection{IPsec Operation}\label{sec:Device Types / Network Device / Device Operation / IPsec Operation}
+
+A network device can support the processing of IPsec operations when
+VIRTIO_NET_F_IPSEC feature is negotiated. In addition to standard packet
+processing, the IPsec protocol processing is also handled by the network device.
+This occurs both pre-transmit and post-receive, providing inline IPsec capabilities.
+
+IPsec Inbound processing: In receive path the device performs decryption,
+authentication, integrity checking and remove additional headers, including
+tunnel header if in tunnel mode, as well as the ESP/AH header from the packet
+(See \hyperref[intro:IPSEC]{[IPSEC]}). The resulting packet contains only the plain data.
+
+IPsec Outbound processing: In transmit path the device performs encryption,
+attach ICV, update/add IP header and add ESP/AH header/trailer to the packet
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
+The driver controls the IPsec SA resource object using administration commands described in
+\ref{sec:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects}.
+
+The IPsec SA resource object contains necessary parameters for packet
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

