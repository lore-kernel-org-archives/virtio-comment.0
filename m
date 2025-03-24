Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAC2EEAB
	for <virtio-comment@lists.linux.dev>; Mon, 24 Mar 2025 06:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742798801; cv=none; b=oh9g7Tv/5qxLFjymata5KLcIik16JKzupPRaLzBPKsbzqa65w95+00uQqA8sG6DuWbhUwRgWlpMobKaj9xm/dYXJ1QboJXvumjH/MedmnwxEkzeu7jtx3ugAL7IjYZJX0AUZ2QX4AIb1hTYzC0waLL6AgPniZ4in6ZvU93sY8Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742798801; c=relaxed/simple;
	bh=kySSSF54YWLffm5cqHfqwFK0hvZ4hla2djLRyrdDsc4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=utsQ9k6GEtZr+Y8FoYxLbejEwcEbwV/nkmhETRM9keE0T9xLbrlTZFmhfQJE8MEw8XEjmdFXLN9HGV+4k/h4QY0zkf5DGD4AgwdJHF71Ul7fS9KNQwIt5MjIFhwdrXZVzSqCU9bUcftDOJKDa12nHFor/6xzjGeM17fKlVo4ILM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=jlI59POd; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="jlI59POd"
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O65xAR017767;
	Sun, 23 Mar 2025 23:46:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=l
	2u6cuQ/j8owh07yba6lUSR9W+y6tthAW4V/Xzcu5Ig=; b=jlI59POdzUhOuYhCD
	S8apX9poIoqdSYV9dIecSS+gDOqI5OnefL+qlPuMzoiFgw95BLXEb1RBG7EZMzpU
	tjyIBIngo0vHSFXqOrkEVpZpldnW8viQmDFh8p4mhkd+6m4hlPOFyPVDGvhVLUK1
	49EGCY4IZcD2DlLFAtn1SAlZrLeHeA/iPeXU7PZoV1tavt+qwbBHZnyIbZIGX0Z7
	hTuKbbK0r8X+H5jJmmmNlS6UMIPPTo3r+oxjR0dmJbcmvofmHZPvp/1/DvrAhlxl
	q86rVXQH+IncXwuWRqjRQM7lA37/5GDU6aWXYPBUvxZyWCBYEeU4g1vI/e3Z1guY
	m0NVA==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 45hvqjjgen-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Mar 2025 23:46:38 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sun, 23 Mar 2025 23:46:37 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Sun, 23 Mar 2025 23:46:37 -0700
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id EC5DD3F70DE;
	Sun, 23 Mar 2025 23:46:34 -0700 (PDT)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <pabeni@redhat.com>, <jasowang@redhat.com>,
        <parav@nvidia.com>, <sburla@marvell.com>, <ndabilpuram@marvell.com>,
        <jerinj@marvell.com>, <schalla@marvell.com>
Subject: [PATCH RFC v3 1/4] virtio-net: Add IPsec operation, capabilities and resource objects
Date: Mon, 24 Mar 2025 12:16:27 +0530
Message-ID: <20250324064630.1601356-2-schalla@marvell.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250324064630.1601356-1-schalla@marvell.com>
References: <20250324064630.1601356-1-schalla@marvell.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: NrZ3eB_dPJuhrevVkDN6QoM2YhKGfuZl
X-Proofpoint-GUID: NrZ3eB_dPJuhrevVkDN6QoM2YhKGfuZl
X-Authority-Analysis: v=2.4 cv=YYO95xRf c=1 sm=1 tr=0 ts=67e0ffce cx=c_pps a=gIfcoYsirJbf48DBMSPrZA==:117 a=gIfcoYsirJbf48DBMSPrZA==:17 a=Vs1iUdzkB0EA:10 a=M5GUcnROAAAA:8 a=sjxAdrQaq5AirhYvySEA:9 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_03,2025-03-21_01,2024-11-22_01

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
---
 device-types/net/description.tex | 50 ++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 1b6b54d..fb25c6a 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -136,6 +136,9 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
 
 \item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM (68)] Device handles packets
   carried by a UDP tunnel with partial csum for the outer header.
+
+\item[VIRTIO_NET_F_IPSEC(69)] Device supports inline IPsec processing.
+
 \end{description}
 
 \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device / Feature bits / Feature bit requirements}
@@ -458,6 +461,10 @@ \subsection{Device and driver capabilities}\label{sec:Device Types / Network Dev
 \hline
 0x0802 & \hyperref[par:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO-NET-FF-ACTION-CAP]{VIRTIO_NET_FF_ACTION_CAP} & Flow filter action capability \\
 \hline
+0x0803 & \hyperref[par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Device and driver capabilities / VIRTIO-CRYPTO-IPSEC-RESOURCE-CAP]{VIRTIO_NET_IPSEC_RESOURCE_CAP} & IPsec resource capability \\
+\hline
+0x0804 & \hyperref[par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Device and driver capabilities / VIRTIO-CRYPTO-IPSEC-SA-CAP]{VIRTIO_NET_IPSEC_SA_CAP} & IPsec Security Association(SA) capability \\
+\hline
 \end{tabularx}
 
 \subsection{Device resource objects}\label{sec:Device Types / Network Device / Device resource objects}
@@ -474,6 +481,10 @@ \subsection{Device resource objects}\label{sec:Device Types / Network Device / D
 \hline
 0x0202 & \hyperref[par:Device Types / Network Device / Device Operation / Flow filter / Resource objects / VIRTIO-NET-RESOURCE-OBJ-FF-RULE]{VIRTIO_NET_RESOURCE_OBJ_FF_RULE} & Flow filter rule object \\
 \hline
+0x0203 & \hyperref[par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Resource objects / VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-OUTBOUND-SA]{VIRTIO_NET_RESOURCE_OBJ_IPSEC_OUTB_SA} & IPsec outbound SA resource object \\
+\hline
+0x0204 & \hyperref[par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Resource objects / VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-INBOUND-SA]{VIRTIO_NET_RESOURCE_OBJ_IPSEC_INB_SA} & IPsec inbound SA resource object \\
+\hline
 \end{tabularx}
 
 \subsection{Device parts}\label{sec:Device Types / Network Device / Device parts}
@@ -3445,6 +3456,45 @@ \subsubsection{Flow filter}\label{sec:Device Types / Network Device / Device Ope
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

