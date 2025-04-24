Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2467B221283
	for <virtio-comment@lists.linux.dev>; Thu, 24 Apr 2025 09:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487828; cv=none; b=ZqpzmKBmOvnxCyGLoCLt9N2fO35lGh8djVZwu1y4RhurNtBqXmNP6AEbPBfNX4sqq59CH0azLb8T/GnzXWkcu/BAk4bV2Vn9wn6XUlKpw94aRbBRH79WprcepREZdRxZfMSDCaxC1aK2NgKFPXL7n09RZNpiM1LmYs/eSgDO+9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487828; c=relaxed/simple;
	bh=XTYAfRsK6lHALArMErao3KxO/lCifuBG7bm/DZWR3Es=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oov1T8Tz5hGDzR/mlc5T/CrIT8yGI4zhPvWg9JdM47hepU1Pm73okGkIl/wE5B1OucQVsfN//nwHNHvvbJ9kwtRGKYuc3KXO2Bn4ne2Xc6VuVwxeHs4TDWJVw6kX1g8tZwpC2BEh0LNcbhBi+Uql3tblra4i2kE0MH7qpN+Wik0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=GymGVi82; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="GymGVi82"
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O9Xc2I025172;
	Thu, 24 Apr 2025 02:43:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=J
	bPvZO95u+lEQbA9Dn6d/7TS9QebbnqFKmp+WdpElzs=; b=GymGVi82jfdniFth+
	eH/+rD9h/s3bJEP9XWLpfE6ZCdUQWIvLxXCBXhvE/Te76lJIZ3kSlmdyi57INCXm
	rES2BwRXWG/UWr2oADEaLvS0yskIqLO98rzbGUOLbZfih2G6GFJhO4m6kI0i04f9
	i8l9ORdJqZJR6CMVeUrr0nwMKaSPNZGLF7Kp/q/XVFTlPXNI8TPZYoa26VFVKoo2
	8J4VHAIKQpNUr1Gbzd8q3QgwMgGkhuFjcEaAHhEHqRcawkXxzS1BQM9ZF+9XGK47
	Non/ihEsSI0LXySran7tqh2vhKiKTmiRgKlLi/q0yKwqN3QYuwfYgRNjnjBzv0ET
	6d7UQ==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 466jk1m65c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 02:43:45 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 24 Apr 2025 02:43:44 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 24 Apr 2025 02:43:44 -0700
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id 515803F7097;
	Thu, 24 Apr 2025 02:43:41 -0700 (PDT)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <pabeni@redhat.com>, <jasowang@redhat.com>,
        <parav@nvidia.com>, <sburla@marvell.com>, <ndabilpuram@marvell.com>,
        <jerinj@marvell.com>, <kshankar@marvell.com>, <schalla@marvell.com>
Subject: [PATCH RFC v5 2/4] virtio-net: Add new flow filter selector and action for IPsec
Date: Thu, 24 Apr 2025 15:13:30 +0530
Message-ID: <20250424094332.1927688-3-schalla@marvell.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2NCBTYWx0ZWRfX+rZDrAscr143 imX/jmpWq1tuPQqmDuwZeBrVf9Arr2IBbOT5FltAZHk6FC5v8kKpfxiuf0QTsfcqNIjPSH4eGPX VfG+Y6zoQ5T9b314fE+edOIIDRegihmHsuCJpMwdB7NMIzx9BOHXubiNm4mlKKo3Gi50luhYvm+
 z3svk94s7NkSue6EoxrEgzaXKoCGOzNechqlXIJViKRc+0qt02BPKQz1MCsd6vmux84QuRfo7Z9 p0/zUuDGzHpfiBe9RCP8f/zvAb02i/FKyn3louNz276+zCk0ZHA30OU+rglyp1t+WaGgwdaOZRA tQljSNaTz1ay1yO2v7tZaACrG2uQQAST4B0BJa/4lE7q1cElTQhUVHvgtwPUQbJko9KtEnv5iyH
 msS84x+SH+Tf9zFN90T6xR3M+w3PWkubjUHF4rap941DgzMlsFeQsDpKEQEMr8dGzOoy8OTN
X-Authority-Analysis: v=2.4 cv=C+vpyRP+ c=1 sm=1 tr=0 ts=680a07d1 cx=c_pps a=gIfcoYsirJbf48DBMSPrZA==:117 a=gIfcoYsirJbf48DBMSPrZA==:17 a=XR8D0OoHHMoA:10 a=M5GUcnROAAAA:8 a=0KcJUZKQnbyiNB3AGd4A:9 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-GUID: kPKhODGxfnASfG7nK6kl3hwgfbRpKhqX
X-Proofpoint-ORIG-GUID: kPKhODGxfnASfG7nK6kl3hwgfbRpKhqX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01

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

