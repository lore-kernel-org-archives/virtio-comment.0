Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917497261B
	for <virtio-comment@lists.linux.dev>; Tue, 20 May 2025 12:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747743581; cv=none; b=HRn0abFBNPD/8fNiqF9/cEwoOpPvtJbfQVPGlQoZ+4MhRNo/0+XzAgrePcM6bj/d56o6iRYXfHIlC5HVdclyuZcq5hnz51eTta3lFv+ndzw0g3++wLWYxIMDGBNtp7p8qypWz7JKhvt1SPICgwlaUU1NqhFvN0T+skJBYCQzyRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747743581; c=relaxed/simple;
	bh=HYuwOoENFcwA5+9rxpoufcmGMy7WM264X1QBxOjzjKc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nbl6JtbwWqoi1ZivQiOZuoIfSAoZOVbY09LcX1ni6+pshKA3znaCglzQKXk7L4Ocm5bZjpX2p+2xrP5sTdCdrMTaEodU+5/MUUonvzlp1yIPzU9a0roo8Bnugxxsi8bx+SXEWhAOnAxguveWs+aY8li0zaLAsMfdNS5W4i4ZuVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=ftMUOpaD; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="ftMUOpaD"
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KAHf6F005535;
	Tue, 20 May 2025 05:19:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=i
	fsPCsMMQO4QKRjnsuOS3QDnSyMq9BsUcD6HIiaCW3o=; b=ftMUOpaDQbmO6WnDN
	k11NZgJ/kz/JlxKoSnT7l7QnMy3j70H573AJNurwMYDMsZvaALshA8IKQu4CmO3f
	tTAEBHMKDBcCWKLkow+BcuPfyfBlU0VK2imy9deWAqb2OC6+tkJQHEI9iew1zsPX
	4jdvsxIS3tcBTZ/lJn6jVTeS8ThoHSMYR36l1xCUN9+hWgopcOWeH8XkIq1NWlLr
	t+IMGGkLV7zu9go4XUfT66DuLQFyg7vREms7K72SOXSueETrnYgHVKjEKkQHivqJ
	idI5greFJr4/KBX9lBs9sjcHtLCB637bolJTZROkQ4wTeLnh8VU2D7XkdY0kN4Or
	5YH1Q==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 46q46fcsp6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 05:19:38 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 20 May 2025 05:19:36 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 20 May 2025 05:19:36 -0700
Received: from localhost.localdomain (unknown [10.28.36.175])
	by maili.marvell.com (Postfix) with ESMTP id 36FFF3F7061;
	Tue, 20 May 2025 05:19:32 -0700 (PDT)
From: Srujana Challa <schalla@marvell.com>
To: <virtio-comment@lists.linux.dev>
CC: <mst@redhat.com>, <pabeni@redhat.com>, <jasowang@redhat.com>,
        <parav@nvidia.com>, <sburla@marvell.com>, <ndabilpuram@marvell.com>,
        <jerinj@marvell.com>, <kshankar@marvell.com>, <schalla@marvell.com>
Subject: [PATCH v7 2/4] virtio-net: Add new flow filter selector and action for IPsec
Date: Tue, 20 May 2025 17:49:22 +0530
Message-ID: <20250520121924.2169258-3-schalla@marvell.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250520121924.2169258-1-schalla@marvell.com>
References: <20250520121924.2169258-1-schalla@marvell.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=b8uy4sGx c=1 sm=1 tr=0 ts=682c735a cx=c_pps a=gIfcoYsirJbf48DBMSPrZA==:117 a=gIfcoYsirJbf48DBMSPrZA==:17 a=dt9VzEwgFbYA:10 a=M5GUcnROAAAA:8 a=Ikd4Dj_1AAAA:8 a=0KcJUZKQnbyiNB3AGd4A:9 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-GUID: uLHXYF60PL4XX6IbYBv1ewd1EmC1f-u3
X-Proofpoint-ORIG-GUID: uLHXYF60PL4XX6IbYBv1ewd1EmC1f-u3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA5OSBTYWx0ZWRfX9LOo2Xh/PgQd r0lfLDrfK12DbJX+fWEyKTm4gNfHoAU63DO3V25V3fNW2uvwhM27Keuhc61H7H6d+tkhxdUA6SO Cw15HR7WtssUoGtxKBB3b6gBTM16yr/ancK8AGeCY9m1aNdGT/zRaVMcBvWSkh97780UFhw7jcV
 OV/rkng1DpJW43cwnaGfow69GbddgDRmq2bbwHQJLC7qiy24RTlyba7pqzPn2lHcZIiXM48RSsC sgPUVPd1OOQMiNxFHEZXsYSi6XOp60CVm5veHLVoYi+LM6mIrrOJ7zErhEHj2BLoYxqkxx1I4Iv Sr+qiAfIQZsoeAUjVgQUC2ls1ao1rHEms/mqe2zx6okYq10ppSN9WZdsuMIbfoqTzgAS+YGatK9
 y/URuoM011OPNibCj2Z5YFoEl2GFMlkTJ73cPj62TwTQ2ZV+8JOmudVZOEMvuipK7R6ndtw/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_05,2025-05-16_03,2025-03-28_01

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

