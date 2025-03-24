Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07698EEAB
	for <virtio-comment@lists.linux.dev>; Mon, 24 Mar 2025 06:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742798804; cv=none; b=UzRJjROtEkyZYM5rbEvDO4cQpx6ErBW3xbl8V1ijKIhurg4niWwkJkUzh/v0Bra+fQfK1QHvq1xki27dnJCFGNWSu4DK0u1zZYoKs+m3odYn7OQ7ufk5FXSvX4/vHuYo3356P4lE/QeGqRrTyY6xLfGzyDcaZouaOplaik2lYew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742798804; c=relaxed/simple;
	bh=D7lPwT5XIeS8gwrH4G1xVjp2b6rmLyXKYzcVAlAXYUQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t2hiv+1nnwKyamaKwhsJISsiD+so7M/aKMUjmf4k/Guk+FBXNWN+oHuee2Zf59jxMlCneTyLdtU5iyGEq52Q4NlPW6f2rRLTrZxrxyQYiSE1T6TReGdbcnQ0Q7CBmubW0fq5NhWP6yBcUyKLKUiXQzhJWwcjDamWb8XGZ3i7m1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=T3wXm/5w; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="T3wXm/5w"
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O3Cr8G006108;
	Sun, 23 Mar 2025 23:46:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=p
	uQ21TI5ix1In8HofiPhaiE1uEvz0CkA/O1pte8h0r4=; b=T3wXm/5wujFpl++lW
	NCJboGE5AC0tg40579LKdz1fqZR7xNJwsP6re3nz6zKoXYfuZKZRjdtPw3UnSobb
	2EEgcC6RQI3akZZmNMri72JLe5sYlrQ+JsjHZPBHhiAUF2ZuM8pWKFLGIMmyYCqy
	MgmzArffYlDQA6Y2VrSt1AKDcEBAoQGnGErnSAwbhRThe3Vf0zwV69fwNDnQXGDS
	b5sBliTtHkFaIa4TOOBDFxqVgaBcP5sYmLfOnJF0TsGtzve1/mMzC55q/Qt+PuxM
	wJeLgp2Sm+GEN2D3N1SMz5cb5UWJxJhrueY91fjR/cKkPnOB8an8tHmsixTcxxEs
	VZi7g==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 45jy9ng9tj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Mar 2025 23:46:41 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sun, 23 Mar 2025 23:46:40 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Sun, 23 Mar 2025 23:46:40 -0700
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id 1FF683F70DE;
	Sun, 23 Mar 2025 23:46:37 -0700 (PDT)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <pabeni@redhat.com>, <jasowang@redhat.com>,
        <parav@nvidia.com>, <sburla@marvell.com>, <ndabilpuram@marvell.com>,
        <jerinj@marvell.com>, <schalla@marvell.com>
Subject: [PATCH RFC v3 2/4] virtio-net: Add new flow filter selector and action for IPsec
Date: Mon, 24 Mar 2025 12:16:28 +0530
Message-ID: <20250324064630.1601356-3-schalla@marvell.com>
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
X-Authority-Analysis: v=2.4 cv=YvgPR5YX c=1 sm=1 tr=0 ts=67e0ffd1 cx=c_pps a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17 a=Vs1iUdzkB0EA:10 a=M5GUcnROAAAA:8 a=0KcJUZKQnbyiNB3AGd4A:9 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-GUID: Nngd7RAdMKbcMiy9SpzELNB2NfysV_F1
X-Proofpoint-ORIG-GUID: Nngd7RAdMKbcMiy9SpzELNB2NfysV_F1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_03,2025-03-21_01,2024-11-22_01

This update introduces a new flow filter selector to match
the ESP header and adds a new flow filter action for IPsec
processing.

Signed-off-by: Srujana Challa <schalla@marvell.com>
---
 device-types/net/description.tex | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index fb25c6a..c721bf4 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -3060,7 +3060,9 @@ \subsubsection{Flow filter}\label{sec:Device Types / Network Device / Device Ope
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
@@ -3120,7 +3122,11 @@ \subsubsection{Flow filter}\label{sec:Device Types / Network Device / Device Ope
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
@@ -3173,8 +3179,8 @@ \subsubsection{Flow filter}\label{sec:Device Types / Network Device / Device Ope
 
 The first selector is always VIRTIO_NET_FF_MASK_TYPE_ETH. When there are multiple
 selectors, a second selector can be either VIRTIO_NET_FF_MASK_TYPE_IPV4
-or VIRTIO_NET_FF_MASK_TYPE_IPV6. If the third selector exists, the third
-selector can be either VIRTIO_NET_FF_MASK_TYPE_UDP or VIRTIO_NET_FF_MASK_TYPE_TCP.
+or VIRTIO_NET_FF_MASK_TYPE_IPV6. If the third selector exists, it can be set to
+VIRTIO_NET_FF_MASK_TYPE_UDP, VIRTIO_NET_FF_MASK_TYPE_TCP and VIRTIO_NET_FF_MASK_TYPE_ESP.
 For example, to match a Ethernet IPv6 UDP packet,
 \field{selectors[0].type} is set to VIRTIO_NET_FF_MASK_TYPE_ETH, \field{selectors[1].type}
 is set to VIRTIO_NET_FF_MASK_TYPE_IPV6 and \field{selectors[2].type} is
@@ -3472,6 +3478,17 @@ \subsubsection{IPsec Operation}\label{sec:Device Types / Network Device / Device
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

