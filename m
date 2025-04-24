Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757C222127B
	for <virtio-comment@lists.linux.dev>; Thu, 24 Apr 2025 09:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487825; cv=none; b=ZNgu0sjGoNcpkuRrPVkGblenbZkwZ+XMYeDKXYX/OKzAk5LbPdT8A/yw+JFvPSVV4FphSk0H04FVEsoC+9xGWdYB9lohwLsIHXmIiT1gUJFGbZ/OT4N3/g7x8SrBw4xTH79LppG3hns5IV/p81fShp/B+jlqqWEQJoDsCDrieIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487825; c=relaxed/simple;
	bh=cCZwpqFaER9zPfnv5/m8cZOoprP3xBJUnYIX5PeqiNw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uY4WmpQhxaWEAIfxJAJ2k1C6mBi/G96L4g6f69phjKfFlghhkU5rdHeS9LI93ZAoy+oG1nCbNk++3cM/HdAsCPfGrneklcdjqvgJU2bkTQJbSFeWC3rUHwfbvj2ql2yu5A/yVntVMKDAWTJ2pDcumEQq+a5C2toRPRBRvJX8yUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=SjlHngbi; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="SjlHngbi"
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O8nGN1013232;
	Thu, 24 Apr 2025 02:43:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=L
	iM2uDzuKYQTytqae8UnVzicdweev3oZHSqarWZOubk=; b=SjlHngbismanddGIW
	h81lXr8riLKbVssva0S0KfxxqTrD3pq7MP8THUrz8GU+5lwp2wnvw4ffYQyw8t1k
	p0+g4hbx169gqWNmqeyhXNdWJKX6tTjZ7yMcU/PgqCpZJ7oy/q6cxfkmTcr6Xadc
	le3LUwzeEE/87bANtrbSESRuAAPaGYgGWSL+oCb3+eXjhaR3nv5MC8iuXzFmiXKC
	6TM08PRhD9I14+THVT6XIgN2HrstoGd5jzsuwI49VYCSApAv3wkhepLsbNixnoQh
	e1CLm+Kq390wwWQopVKjXjnP16pB9bJliOY202ViRIqYXVQ+ZrtI7v1zjCPH+/UW
	ZgSdw==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 466jk346v8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 02:43:41 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 24 Apr 2025 02:43:41 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 24 Apr 2025 02:43:40 -0700
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id 7BDCF3F7097;
	Thu, 24 Apr 2025 02:43:37 -0700 (PDT)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <pabeni@redhat.com>, <jasowang@redhat.com>,
        <parav@nvidia.com>, <sburla@marvell.com>, <ndabilpuram@marvell.com>,
        <jerinj@marvell.com>, <kshankar@marvell.com>, <schalla@marvell.com>
Subject: [PATCH RFC v5 1/4] virtio-net: Add IPsec operation, capabilities and resource objects
Date: Thu, 24 Apr 2025 15:13:29 +0530
Message-ID: <20250424094332.1927688-2-schalla@marvell.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250424094332.1927688-1-schalla@marvell.com>
References: <20250424094332.1927688-1-schalla@marvell.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2NCBTYWx0ZWRfX/ut2x6EQkH4S OH5aE/29VoTCrEX1sIm1vsefieCRVhUqlVf0JXkhrzQZxlquF9VSzi6gI0LlIQ3Il0EHT7Zl1Q0 UK0w2W8FZrC7h2PSKTwVIyNptWhURZkDSR5ca221E89HeLaGipW4RWpvLW7mOxH6sj8loQV95B1
 RppzfD4cwG91Bx1544NUhCzBU6+V7oORsROMsIAkweGkGFSx8fRvlQW3zjlKa/X+lTOWdRnPDhR J7W792Myyd1fqFk5b1cziCJ1PoSCdmMercJ163l+cnrZik2/YqH5Y/COWmTrNV1xQiyDYSZWc45 kGlWZK6q0c6VEt+y5Bk9skTzE0Y57RZd0n4chxnD3rBt3maQAXz9JRS3/9sJYOTvDe17UMsZmJk
 Rx1itf0itoR9lx/q/oIPsy3qe4gPlJhgBDnR5Z8Ki9GwUPaqGa9N/44rygPujyHATufx+VwW
X-Proofpoint-GUID: q5e-jWImvvn21jD4AEDK1AFwdu8UYj1_
X-Proofpoint-ORIG-GUID: q5e-jWImvvn21jD4AEDK1AFwdu8UYj1_
X-Authority-Analysis: v=2.4 cv=M89NKzws c=1 sm=1 tr=0 ts=680a07cd cx=c_pps a=gIfcoYsirJbf48DBMSPrZA==:117 a=gIfcoYsirJbf48DBMSPrZA==:17 a=XR8D0OoHHMoA:10 a=M5GUcnROAAAA:8 a=tL5DaOeHnXsxyfyq8M4A:9 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01

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
 device-types/net/description.tex | 52 ++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 0bb1cef..d918c55 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -140,6 +140,11 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
 \item[VIRTIO_NET_F_OUT_NET_HEADER(69)] Driver can provide the start of
  \field{outer_nh_offset} value. Device gains advantage by not reading packet
   to calculate outer network header offset.
+
+\item[VIRTIO_NET_F_IPSEC(70)] Device supports inline IPsec processing.
+ \field{struct virtio_net_hdr} size expands upto field \field{sturct ipsec_resource_hdr}
+ when VIRTIO_NET_F_IPSEC is negotiated.
+
 \end{description}
 
 \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device / Feature bits / Feature bit requirements}
@@ -462,6 +467,10 @@ \subsection{Device and driver capabilities}\label{sec:Device Types / Network Dev
 \hline
 0x0802 & \hyperref[par:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO-NET-FF-ACTION-CAP]{VIRTIO_NET_FF_ACTION_CAP} & Flow filter action capability \\
 \hline
+0x0803 & \hyperref[par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Device and driver capabilities / VIRTIO-CRYPTO-IPSEC-RESOURCE-CAP]{VIRTIO_NET_IPSEC_RESOURCE_CAP} & IPsec resource capability \\
+\hline
+0x0804 & \hyperref[par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Device and driver capabilities / VIRTIO-CRYPTO-IPSEC-SA-CAP]{VIRTIO_NET_IPSEC_SA_CAP} & IPsec Security Association(SA) capability \\
+\hline
 \end{tabularx}
 
 \subsection{Device resource objects}\label{sec:Device Types / Network Device / Device resource objects}
@@ -478,6 +487,10 @@ \subsection{Device resource objects}\label{sec:Device Types / Network Device / D
 \hline
 0x0202 & \hyperref[par:Device Types / Network Device / Device Operation / Flow filter / Resource objects / VIRTIO-NET-RESOURCE-OBJ-FF-RULE]{VIRTIO_NET_RESOURCE_OBJ_FF_RULE} & Flow filter rule object \\
 \hline
+0x0203 & \hyperref[par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Resource objects / VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-OUTBOUND-SA]{VIRTIO_NET_RESOURCE_OBJ_IPSEC_OUTB_SA} & IPsec outbound SA resource object \\
+\hline
+0x0204 & \hyperref[par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Resource objects / VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-INBOUND-SA]{VIRTIO_NET_RESOURCE_OBJ_IPSEC_INB_SA} & IPsec inbound SA resource object \\
+\hline
 \end{tabularx}
 
 \subsection{Device parts}\label{sec:Device Types / Network Device / Device parts}
@@ -3480,6 +3493,45 @@ \subsubsection{Flow filter}\label{sec:Device Types / Network Device / Device Ope
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

