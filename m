Received: from mx0a-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D491DE4F3
	for <virtio-comment@lists.linux.dev>; Tue, 29 Apr 2025 13:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745933126; cv=none; b=ileewFLb/kBOHrG69dnSbD3xQJcfHv74ekanS4pL/QAa0mYPfEs2HnP78JvWndpVhie+BZeHvz4B8NaqtkQlpLvkna9U/BYg78IUf9sNxuWCXil4BFs66KR1sb0ZoKXJljM3jonuwF5uo5Z/XZ9fwlS/ORbMmBp9r8t3ldn0DZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745933126; c=relaxed/simple;
	bh=HYuwOoENFcwA5+9rxpoufcmGMy7WM264X1QBxOjzjKc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KE3XnuOYzohI8ebE7eDbYZSFoOQInY/Q+/dDhB7WXDYd84wqlplY27iON6k62w0EWSFstZ3rP6HcRy+lMiyEGAcBKFgnnZ1j93VVqsKDSJLZ+ETBWfz1Ft7cpm8Xi9GFUxQs/bFY4qXwO2dAvdlkDPI3TccOvej0IbvbC3RPcnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=k0+2bRif; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="k0+2bRif"
Received: from pps.filterd (m0431384.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T6VIdJ024834;
	Tue, 29 Apr 2025 06:25:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=i
	fsPCsMMQO4QKRjnsuOS3QDnSyMq9BsUcD6HIiaCW3o=; b=k0+2bRifsl5OEIXPw
	niOGi9XAuk+xr0zcZvb+GNhj73p3AsyvTIOF7igMwxPykDYxQbh4UzbFN1ubkhse
	x09OU4yawcozxXRKDuYlRawNsL1h9eWtHeFd7HVTB29gUzJS9ImYHMmv+7MmCDrJ
	9thDhuuD9kZzIWhZChoAR1NA8H13eEW61yUvZ6u2LT9b2ByZe/2C1iBfy6oyq9o8
	XJkTzAws8WrfO8aMF3IhsNiCIAS/ZuPGMWUpULhD1vamcYvPrKMZgUQkTcdou5Be
	+8rRjcNn1KJENC/FdX8wW4mlaRpjkqu9ijn/Pk0b1U7bYGVdL70kz7cJvn32y5Ud
	h8OSA==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 469krccn43-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 06:25:23 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 29 Apr 2025 06:25:22 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 29 Apr 2025 06:25:22 -0700
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id 5017D3F70C3;
	Tue, 29 Apr 2025 06:25:19 -0700 (PDT)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <pabeni@redhat.com>, <jasowang@redhat.com>,
        <parav@nvidia.com>, <sburla@marvell.com>, <ndabilpuram@marvell.com>,
        <jerinj@marvell.com>, <kshankar@marvell.com>, <schalla@marvell.com>
Subject: [PATCH v6 2/4] virtio-net: Add new flow filter selector and action for IPsec
Date: Tue, 29 Apr 2025 18:55:08 +0530
Message-ID: <20250429132510.1949946-3-schalla@marvell.com>
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
X-Proofpoint-GUID: OIFdt2st2o0_H0DteOvXoxzufxrDtxqC
X-Authority-Analysis: v=2.4 cv=f61IBPyM c=1 sm=1 tr=0 ts=6810d343 cx=c_pps a=gIfcoYsirJbf48DBMSPrZA==:117 a=gIfcoYsirJbf48DBMSPrZA==:17 a=XR8D0OoHHMoA:10 a=M5GUcnROAAAA:8 a=Ikd4Dj_1AAAA:8 a=0KcJUZKQnbyiNB3AGd4A:9 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA5OSBTYWx0ZWRfXxPhGQBu9hNVJ nqxTAoGHfd4JO3IVPsdHrSwsHn9j6cggR7Vc7TrATeHUGH3vBMCQZOAydchv81JIFuI00CgRgDo t0KMNoXuYHE/mkwZvFFb2oq3gAHq0jtFX4X/u2RUwg9S/opKy8QbDDMo4KfuIioUVNleRWKbW1P
 1v7iprHh/EKfEfucN4fRIUiQtNtPYwa2Dq3w1CvX2gHn2BhNeVy1hBxZkHY7S1oxsVwJTX/EQan 69/jCNk0GdOMktiBPctxwqHhFCI+4vIE2NBOON70x+tpZxVMyhtpzrvrd5ENbvZpGHBkITNdf7G /TqkOn8zxNSIgvxOGQyUpc+ih8HJGT0+mOxFzjlBfAIYkuFEJlrl8fEx/yIoiDYDerovP5aRM3h
 uzXoDTLR6zuoOVOw/Fo33QSU7kr7pVSNWiS1wun/W7M1FizDSm/loK89DqfPkStwIkWjRGFQ
X-Proofpoint-ORIG-GUID: OIFdt2st2o0_H0DteOvXoxzufxrDtxqC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01

This update introduces a new flow filter selector to match
the ESP header and adds a new flow filter action for IPsec
processing.

Signed-off-by: Srujana Challa <schalla@marvell.com>
Reviewed-by: Parav Pandit <parav@nvidia.com>
---
 device-types/net/description.tex | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 9def4d2..105a002 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -3098,7 +3098,9 @@ \subsubsection{Flow filter}\label{sec:Device Types / Network Device / Device Ope
 \hline
 0x5 & VIRTIO_NET_FF_MASK_TYPE_UDP & 8 bytes of UDP header described in \hyperref[intro:UDP]{UDP} \\
 \hline
-0x6 - 0xFF & & Reserved for future \\
+0x6 & VIRTIO_NET_FF_MASK_TYPE_ESP & 8 bytes of ESP header \\
+\hline
+0x7 - 0xFF & & Reserved for future \\
 \hline
 \end{tabularx}
 \end{table}
@@ -3158,7 +3160,11 @@ \subsubsection{Flow filter}\label{sec:Device Types / Network Device / Device Ope
 \hline
 0x2 & VIRTIO_NET_FF_ACTION_DIRECT_RX_VQ & Matching packet will be directed to a receive queue \\
 \hline
-0x3 - 0xFF & & Reserved for future \\
+0x3 & VIRTIO_NET_FF_ACTION_IPSEC & Matching packet will undergo IPsec processing \\
+\hline
+0x4 & VIRTIO_NET_FF_ACTION_IPSEC_RECIRCULATE & Matching packet will first undergo IPsec processing, followed by the flow filter rules again \\
+\hline
+0x5 - 0xFF & & Reserved for future \\
 \hline
 \end{tabularx}
 \end{table}
@@ -3211,8 +3217,8 @@ \subsubsection{Flow filter}\label{sec:Device Types / Network Device / Device Ope
 
 The first selector is always VIRTIO_NET_FF_MASK_TYPE_ETH. When there are multiple
 selectors, a second selector can be either VIRTIO_NET_FF_MASK_TYPE_IPV4
-or VIRTIO_NET_FF_MASK_TYPE_IPV6. If the third selector exists, the third
-selector can be either VIRTIO_NET_FF_MASK_TYPE_UDP or VIRTIO_NET_FF_MASK_TYPE_TCP.
+or VIRTIO_NET_FF_MASK_TYPE_IPV6. If the third selector exists, it can be set to
+VIRTIO_NET_FF_MASK_TYPE_UDP, VIRTIO_NET_FF_MASK_TYPE_TCP and VIRTIO_NET_FF_MASK_TYPE_ESP.
 For example, to match a Ethernet IPv6 UDP packet,
 \field{selectors[0].type} is set to VIRTIO_NET_FF_MASK_TYPE_ETH, \field{selectors[1].type}
 is set to VIRTIO_NET_FF_MASK_TYPE_IPV6 and \field{selectors[2].type} is
@@ -3510,6 +3516,18 @@ \subsubsection{IPsec Operation}\label{sec:Device Types / Network Device / Device
 attach ICV, update/add IP header and add ESP/AH header/trailer to the packet
 and transmit.
 
+\paragraph{Packet processing order}
+\label{par:Device Types / Network Device / Device Operation / IPsec Operation / Packet processing order}
+
+If an IPsec action rule, either VIRTIO_NET_FF_ACTION_IPSEC or VIRTIO_NET_FF_ACTION_IPSEC_RECIRCULATE,
+is matched during flow filter processing, IPsec processing is applied on the packet.
+In the case of VIRTIO_NET_FF_ACTION_IPSEC_RECIRCULATE, the packet goes through IPsec processing and
+is then recirculated only once to avoid the infinite loops in the device. When a packet is
+recirculated, it undergoes flow filters processing again with the updated packet content.
+
+See \ref{sec:Device Types / Network Device / Device Operation / Flow filter}
+for details about flow filter.
+
 \paragraph{Device and driver capabilities}
 \label{par:Device Types / Network Device / Device Operation / IPsec Operation / Device and driver capabilities}
 
-- 
2.25.1

