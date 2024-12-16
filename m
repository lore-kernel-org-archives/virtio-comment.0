Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B022203D60
	for <virtio-comment@lists.linux.dev>; Mon, 16 Dec 2024 10:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734346153; cv=none; b=mYai5MBvUfvtgygBLxcxNolPIODdvGkvqNnV1KCkcfXAN4stiKMR7LI6gv85lEdafKOY4vzb1DGSnxRs38QzNtqOvYaCY9q4ymtFOJ3INRuMFzYuVVCVamDDYcNeaChcvdeEsw4sAZP9U65MW2mRLk0A83feNPbV41IHChVYn0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734346153; c=relaxed/simple;
	bh=K8q+OD1S03vSvHXHxCkYzcnqO3oNHxpQGWrVL7hwnpQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Aq9O6pYqpUSczLm8yWXyvX9NmF3id7WwYdqx9YLvJIkq0x9SYtdQmhFI727PN2e9L1gR+tuajtnew1a0EXR0y+EeMnEYe7vGjUqcRkR736mivnFDZeRdjdN2+7XI/3MlX3SVOgH3aGX+42w7/+iVJEQY0OhVmsCQhpzI5EnWJ+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=EiDV5hCs; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="EiDV5hCs"
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BG9bXuY004878;
	Mon, 16 Dec 2024 02:49:11 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=7
	O+HKtaYgsX39xwf+6TXbwMf4+4J/xSJRZVxq5BpV2Q=; b=EiDV5hCs9eLP6kak5
	ErlKjzEmon2kSXH4TEbdLSMrMzGwULmYsnAb2MUh+UNSCubHlFo1oi8fVMFQNnPh
	v0BnIf5Y5VgzAX9gj0ka/7eslUlwc22EaXzsQ2SWGNNOCELBzCD0CNxad9xi7NO/
	+UTBgfXemf93Iofonce0ktzcwF/3V+Kwh/7S52QFqp/fDqpNZYTCTQYNuqBuF5/T
	Xmo9mOol4Qc9A/PKhEeO7eHxXWrdZ+jKYBqYhCChfASP3+4VEbwxsOZR2Zk4Lo4p
	3VLCJwtgTgS2DQMthWW5I8Utg6/vpZHU9nk49NFkW/4ZOXbRCxOmvhG/dmCiELvb
	cnH5Q==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 43jhqtr3xj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 02:49:10 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 16 Dec 2024 02:49:09 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 16 Dec 2024 02:49:09 -0800
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id AE60A3F7045;
	Mon, 16 Dec 2024 02:49:06 -0800 (PST)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <pabeni@redhat.com>, <jasowang@redhat.com>,
        <parav@nvidia.com>, <sburla@marvell.com>, <ndabilpuram@marvell.com>,
        <jerinj@marvell.com>, <schalla@marvell.com>
Subject: [PATCH RFC 2/4] virtio-net: Add new flow filter selector and action for IPsec
Date: Mon, 16 Dec 2024 16:18:57 +0530
Message-ID: <20241216104859.2720719-3-schalla@marvell.com>
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
X-Proofpoint-ORIG-GUID: Th63IuFpSYPOSe63OULKawx-du5u4Auq
X-Proofpoint-GUID: Th63IuFpSYPOSe63OULKawx-du5u4Auq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

This update introduces a new flow filter selector to match
the ESP header and adds a new flow filter action for IPsec
processing.

Signed-off-by: Srujana Challa <schalla@marvell.com>
---
 device-types/net/description.tex | 23 ++++++++++++++++++++---
 introduction.tex                 |  3 +++
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 2a5f635..ace2538 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -2632,7 +2632,9 @@ \subsubsection{Flow filter}\label{sec:Device Types / Network Device / Device Ope
 \hline
 0x5 & VIRTIO_NET_FF_MASK_TYPE_UDP & 8 bytes of UDP header described in \hyperref[intro:UDP]{UDP} \\
 \hline
-0x6 - 0xFF & & Reserved for future \\
+0x6 & VIRTIO_NET_FF_MASK_TYPE_ESP & 8 bytes of ESP header described in \hyperref[intro:ESP]{ESP} \\
+\hline
+0x7 - 0xFF & & Reserved for future \\
 \hline
 \end{tabularx}
 \end{table}
@@ -2692,7 +2694,11 @@ \subsubsection{Flow filter}\label{sec:Device Types / Network Device / Device Ope
 \hline
 0x2 & VIRTIO_NET_FF_ACTION_DIRECT_RX_VQ & Matching packet will be directed to a receive queue \\
 \hline
-0x3 - 0xFF & & Reserved for future \\
+0x3 & VIRTIO_NET_FF_ACTION_SECURITY & Matching packet will undergo IPsec processing \\
+\hline
+0x4 & VIRTIO_NET_FF_ACTION_SECURITY_RECIRCULATE & Matching packet will first undergo IPsec processing, followed by the flow filter rules again \\
+\hline
+0x5 - 0xFF & & Reserved for future \\
 \hline
 \end{tabularx}
 \end{table}
@@ -2746,7 +2752,8 @@ \subsubsection{Flow filter}\label{sec:Device Types / Network Device / Device Ope
 The first selector is always VIRTIO_NET_FF_MASK_TYPE_ETH. When there are multiple
 selectors, a second selector can be either VIRTIO_NET_FF_MASK_TYPE_IPV4
 or VIRTIO_NET_FF_MASK_TYPE_IPV6. If the third selector exists, the third
-selector can be either VIRTIO_NET_FF_MASK_TYPE_UDP or VIRTIO_NET_FF_MASK_TYPE_TCP.
+selector can be one of VIRTIO_NET_FF_MASK_TYPE_UDP, VIRTIO_NET_FF_MASK_TYPE_TCP
+and VIRTIO_NET_FF_MASK_TYPE_ESP.
 For example, to match a Ethernet IPv6 UDP packet,
 \field{selectors[0].type} is set to VIRTIO_NET_FF_MASK_TYPE_ETH, \field{selectors[1].type}
 is set to VIRTIO_NET_FF_MASK_TYPE_IPV6 and \field{selectors[2].type} is
@@ -3044,6 +3051,16 @@ \subsubsection{IPsec Operation}\label{sec:Device Types / Network Device / Device
 attach ICV, update/add IP headers and add ESP/AH headers/trailers to the packet
 and transmit.
 
+\paragraph{Packet processing order}
+\label{par:Device Types / Network Device / Device Operation / IPsec Operation / Packet processing order}
+
+When the flow filter is enabled, the flow filter rules are applied
+before IPsec processing and the packet will undergo IPsec processing
+only when it matches with one of the flow filter rules and the rule
+specifies the action VIRTIO_NET_FF_ACTION_SECURITY.
+See \ref{sec:Device Types / Network Device / Device Operation / Flow filter}
+for details about flow filter.
+
 \paragraph{Device and driver capabilities}
 \label{par:Device Types / Network Device / Device Operation / IPsec Operation / Device and driver capabilities}
 
diff --git a/introduction.tex b/introduction.tex
index e60298a..a7db418 100644
--- a/introduction.tex
+++ b/introduction.tex
@@ -162,6 +162,9 @@ \section{Normative References}\label{sec:Normative References}
 	\phantomsection\label{intro:TCP-Header-Format}\textbf{[TCP Header Format]} &
     TCP Header Format
 	\newline\url{https://www.rfc-editor.org/rfc/rfc9293#name-header-format}\\
+	\phantomsection\label{intro:ESP}\textbf{[ESP]} &
+    IPsec Protocol
+	\newline\url{https://www.rfc-editor.org/rfc/rfc4303}\\
 	\phantomsection\label{intro:CAN}\textbf{[CAN]} &
     ISO 11898-1:2015 Road vehicles -- Controller area network (CAN) -- Part 1: Data link layer and physical signalling\\
 	\phantomsection\label{intro:rfc8174}\textbf{[RFC8174]} &
-- 
2.25.1

