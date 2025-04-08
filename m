Received: from mx0a-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E7926139C
	for <virtio-comment@lists.linux.dev>; Tue,  8 Apr 2025 07:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097952; cv=none; b=hwqh+/Z1NRNb6RUTYlV1604JkInKOcKa6sFVSR3SENoO+eOE8zDhu2bkwdBdDE/w8ehy90XTt3isblwH3g7h8HiHGznQMv2QOqczrUp3osAm+xmpc8u3TvZwo1uW+T9eqFgoEU1EWkNcDZtHTxWB3pILeNj30oi3+gAmL/EvatM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097952; c=relaxed/simple;
	bh=XTYAfRsK6lHALArMErao3KxO/lCifuBG7bm/DZWR3Es=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ka4g6WDmcaC4c1lU8zZlIjFRZtOUT/PdyQeykyskRZw3V4Xe80/u8daCdV6BS0D6Ac5DT3m73fuiIZxn6CRRd//NYdk8RrQrMfAB5h9SEcCBSD/tCe825TREk7/vPWo426vgBdIJ6a9qHLY2TrUWGv76x2EH+NE2HZYysJlHbvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=FiD2fIqK; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="FiD2fIqK"
Received: from pps.filterd (m0431384.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5385OuE3007747;
	Tue, 8 Apr 2025 00:39:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=J
	bPvZO95u+lEQbA9Dn6d/7TS9QebbnqFKmp+WdpElzs=; b=FiD2fIqKw/IRJvFd8
	tD/fnumeIljNhw/6vSqmPmkbyf/jBWTMvweTwdgqfTuswy+2p+XMYXwGjsnnBT9S
	kbIyQqhN4OLAGJSJINOm16AKPdJmSpPwEWhPq6v+FkdRTzDqRaRUI/RXiEREqdfy
	SHTg9zLGMOhYx7wajgowWarghqdQSxyUyDGCzR5bskyHNUqwgmZSJ5En1DsTutJi
	z8YrH0/pgQmt/OjXj4gRIzGgvhWuZavSOzeR2yx9L3WfUJn+opnwlfx66IOdVfLV
	sRlGbRepHJmjNX7NkXP719IECYw9kCp6GxDUwxxm9ZA3e3DjdsOhI68s/jBPLQti
	V1wsA==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 45ursc44kq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 00:39:09 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 8 Apr 2025 00:39:08 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 8 Apr 2025 00:39:08 -0700
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id 8115C3F7114;
	Tue,  8 Apr 2025 00:39:05 -0700 (PDT)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <pabeni@redhat.com>, <jasowang@redhat.com>,
        <parav@nvidia.com>, <sburla@marvell.com>, <ndabilpuram@marvell.com>,
        <jerinj@marvell.com>, <kshankar@marvell.com>, <schalla@marvell.com>
Subject: [PATCH RFC v4 2/4] virtio-net: Add new flow filter selector and action for IPsec
Date: Tue, 8 Apr 2025 13:08:55 +0530
Message-ID: <20250408073857.1783779-3-schalla@marvell.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250408073857.1783779-1-schalla@marvell.com>
References: <20250408073857.1783779-1-schalla@marvell.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: hBIvysivAqcslCIaAF7ug_t2CXUsnVKz
X-Authority-Analysis: v=2.4 cv=M85NKzws c=1 sm=1 tr=0 ts=67f4d29d cx=c_pps a=gIfcoYsirJbf48DBMSPrZA==:117 a=gIfcoYsirJbf48DBMSPrZA==:17 a=XR8D0OoHHMoA:10 a=M5GUcnROAAAA:8 a=0KcJUZKQnbyiNB3AGd4A:9 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-ORIG-GUID: hBIvysivAqcslCIaAF7ug_t2CXUsnVKz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_02,2025-04-07_01,2024-11-22_01

This update introduces a new flow filter selector to match
the ESP header and adds a new flow filter action for IPsec
processing.

Signed-off-by: Srujana Challa <schalla@marvell.com>
---
 device-types/net/description.tex | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index d918c55..ea70c6f 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -3097,7 +3097,9 @@ \subsubsection{Flow filter}\label{sec:Device Types / Network Device / Device Ope
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
@@ -3157,7 +3159,11 @@ \subsubsection{Flow filter}\label{sec:Device Types / Network Device / Device Ope
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
@@ -3210,8 +3216,8 @@ \subsubsection{Flow filter}\label{sec:Device Types / Network Device / Device Ope
 
 The first selector is always VIRTIO_NET_FF_MASK_TYPE_ETH. When there are multiple
 selectors, a second selector can be either VIRTIO_NET_FF_MASK_TYPE_IPV4
-or VIRTIO_NET_FF_MASK_TYPE_IPV6. If the third selector exists, the third
-selector can be either VIRTIO_NET_FF_MASK_TYPE_UDP or VIRTIO_NET_FF_MASK_TYPE_TCP.
+or VIRTIO_NET_FF_MASK_TYPE_IPV6. If the third selector exists, it can be set to
+VIRTIO_NET_FF_MASK_TYPE_UDP, VIRTIO_NET_FF_MASK_TYPE_TCP and VIRTIO_NET_FF_MASK_TYPE_ESP.
 For example, to match a Ethernet IPv6 UDP packet,
 \field{selectors[0].type} is set to VIRTIO_NET_FF_MASK_TYPE_ETH, \field{selectors[1].type}
 is set to VIRTIO_NET_FF_MASK_TYPE_IPV6 and \field{selectors[2].type} is
@@ -3509,6 +3515,17 @@ \subsubsection{IPsec Operation}\label{sec:Device Types / Network Device / Device
 attach ICV, update/add IP header and add ESP/AH header/trailer to the packet
 and transmit.
 
+\paragraph{Packet processing order}
+\label{par:Device Types / Network Device / Device Operation / IPsec Operation / Packet processing order}
+
+If an IPsec action rule, either VIRTIO_NET_FF_ACTION_IPSEC or VIRTIO_NET_FF_ACTION_IPSEC_RECIRCULATE,
+is matched during flow filter processing, IPsec processing is applied on the packet.
+In the case of VIRTIO_NET_FF_ACTION_IPSEC_RECIRCULATE, the packet goes through IPsec processing and
+is then recirculated only once to avoid the infinite loops in the device.
+
+See \ref{sec:Device Types / Network Device / Device Operation / Flow filter}
+for details about flow filter.
+
 \paragraph{Device and driver capabilities}
 \label{par:Device Types / Network Device / Device Operation / IPsec Operation / Device and driver capabilities}
 
-- 
2.25.1

