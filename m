Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5422C2AB0
	for <virtio-comment@lists.linux.dev>; Tue, 29 Apr 2025 12:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745930426; cv=none; b=lFsqlt9gl3aiqjWvQka5P6RyBk1pVDDZLBcFjwx0aRCHVCWcsuSJQrhxdmqS7i7OQy9FDu3tL26LZArbf1+PG4yWh9dp97NDiCaeI8SSAq080yp9hM1/Lldt28jZeoIQ2mI1t+8+1YbJIy0fSPEDufSO5MWq8oHyU/52wL2I7ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745930426; c=relaxed/simple;
	bh=HYuwOoENFcwA5+9rxpoufcmGMy7WM264X1QBxOjzjKc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=luPOpAE4EoWHFXRjiUbVwUTNm2ga54cwsWO3xntFf60Qh0EeolJ6u9e1ZAmhViGL647EyI56ZIdaJtQcqf7+GQnq+py/SjfxpdvAHMe+nsli0L7Djl7wDmfV1UZUjgl5mNYQzjK3PGxvBWKTWRubQExtejSb0KRm+4GrRjb1v3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=PvEhLpPN; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="PvEhLpPN"
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T1d8D4024259;
	Tue, 29 Apr 2025 05:40:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=i
	fsPCsMMQO4QKRjnsuOS3QDnSyMq9BsUcD6HIiaCW3o=; b=PvEhLpPN/bjcqly2P
	SyEi39ofLFKo+U0i5n6Zwpw2c9Vf+Pf2nlekDB5RN65Byz9EO0QOk03U6QoWWmkM
	hvVwMzOPyR4buF0fk347M90PFjnj64tGu9zgpVGakew0fJD2m+aoen53aQPuNJR3
	rtIzzffcqGUV3oBhVxKnaCUcbPiz0QP5QhuGAv3HxViol5vQblQRjp4Dl2Fg4MQJ
	xsaoCKjCLZt8JSGIHldcfMD7VuowlagyKGRahwPgLaPveZFWDz6wDSUQFvk+bMpa
	atBHAoJzHTDdzylDNgXJro9b9cjjzLA5T6IY4mKDqW4P/ZMBpRT+zZGRi/SEHF77
	dyqlw==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 468vuq60n6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 05:40:23 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 29 Apr 2025 05:40:22 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 29 Apr 2025 05:40:22 -0700
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id C17A45B6949;
	Tue, 29 Apr 2025 05:40:18 -0700 (PDT)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <pabeni@redhat.com>, <jasowang@redhat.com>,
        <parav@nvidia.com>, <sburla@marvell.com>, <ndabilpuram@marvell.com>,
        <jerinj@marvell.com>, <kshankar@marvell.com>, <schalla@marvell.com>
Subject: [PATCH RFC v6 2/4] virtio-net: Add new flow filter selector and action for IPsec
Date: Tue, 29 Apr 2025 18:10:08 +0530
Message-ID: <20250429124010.1949371-3-schalla@marvell.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250429124010.1949371-1-schalla@marvell.com>
References: <20250429124010.1949371-1-schalla@marvell.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA5NCBTYWx0ZWRfX5ygumQCLjlFa N7/wHtK/7WtEdlZC0SpjboCnxDOwBzcGEm60UaDtUFj2UBOqUfzpP4dEpv9bb7RJsnmGPV4d56C 31g/Zm8YmXiF0651PU4w130/fcsT2vSrREhi9SF++nE7QHZ2sua+x3bXE7ndQXIadRDdaBYtVdQ
 JSaA10j/gdVVv71Va4cif5OErRdsdEXBh8wmKL2YAX4+aRB2SpVNgU00w/eF4Rxo/iR8DqXutWw ZxW5o+MPQHDbuYc1kDXF0VhjkBoSxqru0DFL9cUR8s3vQXg+Yn/2LFMWvOkNTeSaLzBjsqszr1K 1fML+/2tF962YyU4ZTtoP/0Rft0JOSvywzQVuwGjskExjU7sZ1po6lq2gcz1dZ2A7AffYnGoqA6
 y3viXyKnZDvfcNdpyfzH6Wi/ROwgHJKngIR/cN0l6Uby8HlwVP09fEDzBpixAd7OYgyw7/YC
X-Authority-Analysis: v=2.4 cv=L60dQ/T8 c=1 sm=1 tr=0 ts=6810c8b7 cx=c_pps a=gIfcoYsirJbf48DBMSPrZA==:117 a=gIfcoYsirJbf48DBMSPrZA==:17 a=XR8D0OoHHMoA:10 a=M5GUcnROAAAA:8 a=Ikd4Dj_1AAAA:8 a=0KcJUZKQnbyiNB3AGd4A:9 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-ORIG-GUID: e77hi_A6Wyo24pkVhv0wGVfbS-C11MpM
X-Proofpoint-GUID: e77hi_A6Wyo24pkVhv0wGVfbS-C11MpM
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

