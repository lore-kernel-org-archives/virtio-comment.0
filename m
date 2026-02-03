Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013037.outbound.protection.outlook.com [40.107.162.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7523D331B
	for <virtio-comment@lists.linux.dev>; Tue,  3 Feb 2026 16:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770135712; cv=fail; b=qWTof4rtWGgzqlc/yNPEUFnQ8+6cZ8MgxSSzVAxAR9aJjsd3C9d23Udl7XC2fKoqKBfHHBYkU1V9q9gqBKSJg7YT9ZCAmfXCFVIXEdDxl4nsZBWrkYFOoTTFxKBuWkeZc2Jc5FB4VczHLVlqT1zxzexwyV+Of4wEsEOmwNQHdow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770135712; c=relaxed/simple;
	bh=M+4GhFZbB3Zo6RZyl2ircdL2vkPZqjxX7mDqi2ek32c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oDw8OesAN1NJAjW6Bg17q5EVnRLbz6BjiYF/knYs4Cah3TWfWpA/UyLhqoNM7G5DLaYsitULtvFFNfbVMbNtND7bd2wbmSYZ5qQlfhDEsn1QJAiUX5m8iq4SEGJDP1F8mDYt2YMMxijMmvxAJ4hVcUddXEhurGAvTYIE7s5uRuo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=DMTIbd9G; arc=fail smtp.client-ip=40.107.162.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="DMTIbd9G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k4B/ByBZO0vLntQLnkTM/jaHkozIJZOPU1gXZUdaLL1s8UAOSv8xROMUjMSOLrsGyEeDxdJhxbQF3UBCweeA2gKTb0QrBKFLtOCSk/x6DPZigYSVl1Uq2hUztSuV8f5/r7FMjw+mgTgwE1rRKZ98ZGbPh2EJf8KTeAJ/a0b2lXsSQ2NR1gSnovIa7Gv3bTMyIV/dvLxBK4jktBv5KxJnxqnhAfF+LsY9PEqdMWjnR4SCUX50ifL5nrO/Ll8AzG2kWpVcPSEHc8ShEEzYdceyu3BSD1EvCzgYxkXofWe+Ihr2THSn+8W5wBYjcsEwC04DCcxEzy/X1JqnOfgLKVOZ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p8NU0ftnsBquXqzgeWJR9c9HxAQI6770ysLUPRekESc=;
 b=Y6xzo1Rylhh6neIARotMv2mdjLixya9cXayv+GI6dqEaBi8IM9x+dorVODEAW4CZdBgNfzEZhYXrpwBcVmd2pZpGpn501yqpo+sqqnJXBX+RlqtGTAOVuBEbB9iXambudqAFlC1Y1djip5re9uisuogBvERusV+3OKbJeJcyN76fm6VuaeGo1nRFf8X2MtXLp94WaANyIHObkRgzLSHUgj4Bxr8WD30iX4dDXPT9k41FuqcxuixR6C6+60DU5ZlaZkD0P3rWDKwyOkOpfKmJ3tqWAA8ehJ9X8B3NwnamLRfgrQ85lUHqb3OEKNVqlnTf2cBMg2tt4BYsRyz2OV1T5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.241) smtp.rcpttodomain=apple.com smtp.mailfrom=nokia-bell-labs.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nokia-bell-labs.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p8NU0ftnsBquXqzgeWJR9c9HxAQI6770ysLUPRekESc=;
 b=DMTIbd9GGWn6SAgq16JbfSJF9drTBJlidCwIO117k6+LOmmWB6qMMbX6kGOUWEQtGgsQ21Ob633JfceDXk64i+PspqxtOS1Mu0c/vpH4jTGGgZasm8uf1eL7re7C+4YvYdh86ZCaA7i4h/xu8EmF1CBML3qrBBJw5sivNN5Sm7M8n02JhNdWwqcbn3Q8NseTBXhpPxozG8zoBC1BsP2Z7L7DRwZafz5HtgGvyxCpDEizChUo2UGP0dai5IWeLoTqeFoE8tGgx43/PyCt20UHrqtsy75lWQ23HCcAk8dwmlQhPChzF1huuRAp9/eA3wdAFnt2iDfSND6XtTCaXz/tFA==
Received: from PA7P264CA0206.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:36d::12)
 by DU0PR07MB8667.eurprd07.prod.outlook.com (2603:10a6:10:320::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 16:21:44 +0000
Received: from AM4PEPF00025F9B.EURPRD83.prod.outlook.com
 (2603:10a6:102:36d:cafe::a4) by PA7P264CA0206.outlook.office365.com
 (2603:10a6:102:36d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 16:21:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.2.241)
 smtp.mailfrom=nokia-bell-labs.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nokia-bell-labs.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia-bell-labs.com
 designates 131.228.2.241 as permitted sender)
 receiver=protection.outlook.com; client-ip=131.228.2.241;
 helo=fihe3nok0734.emea.nsn-net.net; pr=C
Received: from fihe3nok0734.emea.nsn-net.net (131.228.2.241) by
 AM4PEPF00025F9B.mail.protection.outlook.com (10.167.16.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.0
 via Frontend Transport; Tue, 3 Feb 2026 16:21:43 +0000
Received: from sarah.nbl.nsn-rdnet.net (sarah.nbl.nsn-rdnet.net [10.0.73.150])
	by fihe3nok0734.emea.nsn-net.net (Postfix) with ESMTP id A0ACC20335;
	Tue,  3 Feb 2026 18:21:42 +0200 (EET)
From: chia-yu.chang@nokia-bell-labs.com
To: parav@nvidia.com,
	virtio-comment@lists.linux.dev,
	jasowang@redhat.com,
	mst@redhat.com,
	cohuck@redhat.com,
	mvaralar@redhat.com,
	xuanzhuo@linux.alibaba.com,
	eperezma@redhat.com,
	ij@kernel.org,
	ncardwell@google.com,
	koen.de_schepper@nokia-bell-labs.com,
	g.white@cablelabs.com,
	ingemar.s.johansson@ericsson.com,
	mirja.kuehlewind@ericsson.com,
	cheshire@apple.com,
	rs.ietf@gmx.at,
	Jason_Livingood@comcast.com,
	vidhi_goel@apple.com
Cc: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
Subject: [PATCH v11 2/2] virtio-net: Add Accurate ECN support to virtio specification
Date: Tue,  3 Feb 2026 17:21:34 +0100
Message-Id: <20260203162134.2765-3-chia-yu.chang@nokia-bell-labs.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260203162134.2765-1-chia-yu.chang@nokia-bell-labs.com>
References: <20260203162134.2765-1-chia-yu.chang@nokia-bell-labs.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F9B:EE_|DU0PR07MB8667:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a78bdeab-f34c-49ee-a670-08de634051fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013|921020|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wOO6LEPh3Fnub673hiOu5bqvcmUEW7WZ7I+1gB0vnCbrJ8CDeLx391E1UULU?=
 =?us-ascii?Q?YkvIZ0J1qXuggr1SBtE+/AIktzC8vZqUI+tdlzjcIrt9IdhC6N1AXLtWItBT?=
 =?us-ascii?Q?GXZuyCMRq9LqVo/dR07h8mrd+glbk2nXLl+Cb2lMFHe6nuiS7Zs9Ac3fuQiu?=
 =?us-ascii?Q?T1S+ULErkpl6oveNLgbHUHE9ql6sTxmNjFiAWVYURbfnqHlXIriSTRILSwRh?=
 =?us-ascii?Q?cmUMsVIadJ5C4iCuvISF2kipKTStN8ef4CdurgCdVkYRx2OCwfTU+zTMjLCC?=
 =?us-ascii?Q?Ot7SKnU6BJvFr3AQKHdNTPU3mBSAsPEuS0hLKtkB4zbn+yEdQZVk5lomN/uG?=
 =?us-ascii?Q?IK2qRmKrSqdHKrX5IeJlyZsx7ZYQ5BnUq2NgH02f233cj1ISZWD+1ngRlVDv?=
 =?us-ascii?Q?Varpz85omtlJGWPS84iip/B+3UZ36vQOzEgNQvgTY7yqo2fkNF34jKRI6gcS?=
 =?us-ascii?Q?+uZERfL8zoadTL19gRvZ445dyYa2n6lCqJhCkWr8/4enL3pCki8FJl+K3DOF?=
 =?us-ascii?Q?vMj4jdjTsf4HTuTFIXeGqQD+ofesTJXQsuIjUZpi05RoJnVh7qNgfOXJIz31?=
 =?us-ascii?Q?HIdm/Gb5hU/ebOyK5YeEQY/JnUlLum5yslkyNqMH8YzkRJUY1X1BftZJ5Ay4?=
 =?us-ascii?Q?ShErVrIBXeY/ATXsbAxUQqiHaWN1ir3In0pAZCcLQ5amhgE1iW8Vm0HGmy8+?=
 =?us-ascii?Q?kS8Z/enVkd4YuRRtgQJfJOXds9E+EbA9w2AkykhWO+DA8WVc9NGraTh0esFw?=
 =?us-ascii?Q?yqe/4z7JaUyV2/tfYczhQVyAar0auG25kqOaI/+8cUuqhdXCit/e/xKaYUBx?=
 =?us-ascii?Q?rjdqrgXsT+AXgIIE76G3dMXIyURRYzmIw7ZGmV9hldbzKZZ9JIpbvVKM+9gh?=
 =?us-ascii?Q?j/wvJjD+7xIwzuRdglM8Hd4A/d6Azg0chZ9eZyXvdbbx6vFtj0oEj2FYW1iv?=
 =?us-ascii?Q?BaaXhikaJBGuek8lm35Ty/t125ipi8Zzz5N9mT1vg9J9gNqI6aq1HJF4TV6H?=
 =?us-ascii?Q?O914ZGsr2kJzmOA8R0eeNJxX/n2qEcdbJCGmnUpmSUfwG4PZcYTXHXZ7XbMH?=
 =?us-ascii?Q?rn0mqnqw7bhbkdsbhjW1OOigaiIhQuitlwjgwosv941TpS8pI45oKdHMm/hc?=
 =?us-ascii?Q?2iU5RovxfRCZlU5dF1qiAj4mkxl3lQtiPwLkh6znNwVqYacKJNbkfoonYN+h?=
 =?us-ascii?Q?pqyNxZoJWu/bA506cIoWtCi33Ne2xWR4Wir9JUGEA1ex44998YYq+H8gYYhm?=
 =?us-ascii?Q?nX36TQ9l3VJIEjh0oJIIxkYZEixi1lzFxZZ2W6ZybwByD0MLOQce29uVpeA5?=
 =?us-ascii?Q?ej8iMZkLXEE81K2wSiQseHyTSSErK/kCpvH5dVPpDWPaGIjzTUT+s6jZTSTM?=
 =?us-ascii?Q?twraoD8MlHfAstS2ZNs3NeGoJlkmO3wz1tD9kuMiDeuhNfdraW/PsjkBOQwu?=
 =?us-ascii?Q?B+Xog000jHsulx4zsQ++IZiYO6j7O8YVipt4o6y4adLvpNrP6nKvP+/iGQBJ?=
 =?us-ascii?Q?IMDHt/zfvt+ieH5JjpY1JCHGFQ/ewckDGNz7cHxHKX28+yrkHnJh4y3YIyP4?=
 =?us-ascii?Q?sLuRqSPCB/yrRUHW++OdwiTlSVGNEH1xE0Z8sC+wA8G43FqWFHfYkdTNV+nj?=
 =?us-ascii?Q?1k2tjg66xEOGn1vOxnwHYpv6k7v6yZdsrKaPcNo8OaZRgCmKE6a3PMJnN71Y?=
 =?us-ascii?Q?xDHnpKO0z9KCQiAZ1b9iUbjCNRM=3D?=
X-Forefront-Antispam-Report:
	CIP:131.228.2.241;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe3nok0734.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013)(921020)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ax4UZJf/dMRSh1qNWRrOAX62gTW4ssgTlLj1v8qsIcVTFIr+I1lOLen25qWoS56wG3+HkhaRmHpcDOvrLRAvSCBiaaeZ5agSDFuQSVlBfZEs4uaD7m67CefN6z8fHmShhrAFlFbS5DLHfUASlwIEbKg+pH1nyDuNLaFZSU1yBMxz7EHFYOmjibJ8GbZqkGtUs1R2TcuEb02QoM+0FzAqxZxLmtKGmUoaz5fnUqZFat5959o+ng+1pTK9tvmXMVCm7PshfDZCoZ1gCDQj2yU2IUt5cD9g/E9j5gzwm1hyIPEKheNngmlyYLIwcqaSYaccPhoHbAFtymC8hQkDW20qsXLU8o5zp/7LP5pHMZ0nbv5ccPsijeUUBMUDJGuYaSscPEJMYId3pN9i/M/NJS1Y1fP8KPbk4oow+3m52lfomR+l2mlyFQ4o2xtI1/YL4mL0
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 16:21:43.6733
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a78bdeab-f34c-49ee-a670-08de634051fa
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.241];Helo=[fihe3nok0734.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-AM4PEPF00025F9B.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR07MB8667

From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

This patch adds support for Accurate ECN (AccECN), as defined in RFC9768.
Unlike RFC3168 ECN, AccECN uses the ACE field and requires that TCP CWR flag
is preserved across all segments, while existing RFC3168 ECN offload logic
clears the CWR flag from the second segments, corrupting the ACE signal.

To support this, new host and guest feature bits are introduced, along
with a new GSO flag (VIRTIO_NET_HDR_GSO_ACCECN). This allows drivers and
devices to negotiate AccECN capabilities and avoid incorrect modification
of the CWR bit.

Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
---
 device-types/net/description.tex | 54 +++++++++++++++++++++++++-------
 introduction.tex                 |  3 ++
 2 files changed, 46 insertions(+), 11 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 0da8f9f..463b092 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -150,6 +150,15 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
  when VIRTIO_NET_F_IPSEC is negotiated. When a device offers IPsec feature, it SHOULD
  also offer the VIRTIO_NET_F_OUT_NET_HEADER feature.
 
+\item[VIRTIO_NET_F_HOST_ACCECN (71)] Device can receive TSO and follow
+  the requirements of the ACE field described in
+  ``Section 3.3.4 Requirements for TCP Segmentation Offload and Large Receive Offload''
+  of \hyperref[intro:accecn]{[AccECN]}.
+
+\item[VIRTIO_NET_F_GUEST_ACCECN (72)] Driver can receive TSO and follow
+  the requirements of the ACE field described in
+  ``Section 3.3.4 Requirements for TCP Segmentation Offload and Large Receive Offload''
+  of \hyperref[intro:accecn]{[AccECN]}.
 \end{description}
 
 \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device / Feature bits / Feature bit requirements}
@@ -161,6 +170,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
 \item[VIRTIO_NET_F_GUEST_TSO4] Requires VIRTIO_NET_F_GUEST_CSUM.
 \item[VIRTIO_NET_F_GUEST_TSO6] Requires VIRTIO_NET_F_GUEST_CSUM.
 \item[VIRTIO_NET_F_GUEST_ECN] Requires VIRTIO_NET_F_GUEST_TSO4 or VIRTIO_NET_F_GUEST_TSO6.
+\item[VIRTIO_NET_F_GUEST_ACCECN] Requires VIRTIO_NET_F_GUEST_TSO4 or VIRTIO_NET_F_GUEST_TSO6.
 \item[VIRTIO_NET_F_GUEST_UFO] Requires VIRTIO_NET_F_GUEST_CSUM.
 \item[VIRTIO_NET_F_GUEST_USO4] Requires VIRTIO_NET_F_GUEST_CSUM.
 \item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM.
@@ -171,6 +181,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
 \item[VIRTIO_NET_F_HOST_TSO4] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_TSO6] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_ECN] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_NET_F_HOST_TSO6.
+\item[VIRTIO_NET_F_HOST_ACCECN] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_NET_F_HOST_TSO6.
 \item[VIRTIO_NET_F_HOST_UFO] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_USO] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO] Requires VIRTIO_NET_F_HOST_TSO4, VIRTIO_NET_F_HOST_TSO6
@@ -294,11 +305,11 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
 The device MUST NOT modify \field{mtu} once it has been set.
 
 The device MUST NOT pass received packets that exceed \field{mtu} (plus low
-level ethernet header length) size with \field{gso_type} NONE or ECN
+level ethernet header length) size with \field{gso_type} NONE, ECN or ACCECN
 after VIRTIO_NET_F_MTU has been successfully negotiated.
 
 The device MUST forward transmitted packets of up to \field{mtu} (plus low
-level ethernet header length) size with \field{gso_type} NONE or ECN, and do
+level ethernet header length) size with \field{gso_type} NONE, ECN or ACCECN, and do
 so without fragmentation, after VIRTIO_NET_F_MTU has been successfully
 negotiated.
 
@@ -348,11 +359,11 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
 
 If the driver negotiates VIRTIO_NET_F_MTU, it MUST supply enough receive
 buffers to receive at least one receive packet of size \field{mtu} (plus low
-level ethernet header length) with \field{gso_type} NONE or ECN.
+level ethernet header length) with \field{gso_type} NONE, ECN or ACCECN.
 
 If the driver negotiates VIRTIO_NET_F_MTU, it MUST NOT transmit packets of
 size exceeding the value of \field{mtu} (plus low level ethernet header length)
-with \field{gso_type} NONE or ECN.
+with \field{gso_type} NONE, ECN or ACCECN.
 
 A driver SHOULD negotiate the VIRTIO_NET_F_STANDBY feature if the device offers it.
 
@@ -443,7 +454,7 @@ \subsection{Device Initialization}\label{sec:Device Types / Network Device / Dev
    The VIRTIO_NET_F_GUEST_CSUM feature indicates that partially
   checksummed packets can be received, and if it can do that then
   the VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6,
-  VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_GUEST_USO4,
+  VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_GUEST_ACCECN, VIRTIO_NET_F_GUEST_USO4,
   VIRTIO_NET_F_GUEST_USO6 VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO and
   VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM are the input equivalents of
   the features described above.
@@ -613,6 +624,7 @@ \subsection{Device Operation}\label{sec:Device Types / Network Device / Device O
 #define VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 0x20
 #define VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 0x40
 #define VIRTIO_NET_HDR_GSO_ECN      0x80
+#define VIRTIO_NET_HDR_GSO_ACCECN   0x10
         u8 gso_type;
         le16 hdr_len;
         le16 gso_size;
@@ -737,6 +749,13 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
     has the CWR flag set and follows the requirements of the CWR flag described in
     ``Section 6.1.2. The TCP Sender'' of \hyperref[intro:rfc3168]{[RFC3168]}.
     \footnote{This case is not handled by some older hardware, so is called out specifically in the protocol.}.
+
+  \item If the driver negotiated the VIRTIO_NET_F_HOST_ACCECN feature,
+    the VIRTIO_NET_HDR_GSO_ACCECN bit in \field{gso_type} indicates that the TCP packet
+    follows the requirements of the ACE field described in
+    ``Section 3.3.4 . Requirements for TCP Segmentation Offload and Large Receive Offload''
+    of \hyperref[intro:accecn]{[AccECN]}.
+    \footnote{This case is not handled by some older hardware, so is called out specifically in the protocol.}.
    \end{itemize}
 
 \item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feature and the
@@ -837,6 +856,12 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 of \hyperref[intro:rfc3168]{[RFC3168]}, unless the VIRTIO_NET_F_HOST_ECN feature is
 negotiated, in which case the driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
 
+The driver SHOULD NOT send to the device TCP packets requiring segmentation offload
+which need to follow the ACE field requirements described in
+``Section 3.3.4 . Requirements for TCP Segmentation Offload and Large Receive Offload''
+of \hyperref[intro:accecn]{[AccECN]}, unless the VIRTIO_NET_F_HOST_ACCECN feature is
+negotiated, in which case the driver MUST set the VIRTIO_NET_HDR_GSO_ACCECN bit in \field{gso_type}.
+
 If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, the driver MAY set
 VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit
 in \field{gso_type} according to the inner network header protocol type
@@ -1171,12 +1196,12 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
   value to indicate the outer network header offset in packet.
 \end{enumerate}
 
-Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, UDP_TUNNEL
-and ECN features enable receive checksum, large receive offload and RFC3168
-ECN support which are the input equivalents of the transmit checksum,
-transmit segmentation offloading and RFC3168 ECN features, as described
-in \ref{sec:Device Types / Network Device / Device Operation /
-Packet Transmission}:
+Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, UDP_TUNNEL, ECN and
+ACCECN features enable receive checksum, large receive offload, RFC3168 ECN
+and Accurate ECN support which are the input equivalents of the transmit
+checksum, transmit segmentation offloading, RFC3168 ECN and Accurate ECN
+features, as described in \ref{sec:Device Types / Network Device /
+Device Operation / Packet Transmission}:
 \begin{enumerate}
 \item If the VIRTIO_NET_F_GUEST_TSO4, TSO6, UFO, USO4 or USO6 options were
   negotiated, then \field{gso_type} MAY be something other than
@@ -1286,6 +1311,12 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 if packet contains a valid network header. Otherwise, the device MUST not
 use \field{outer_nh_offset}.
 
+The device SHOULD NOT send to the driver TCP packets requiring segmentation offload
+which need to follow the ACE field requirements described in
+``Section 3.3.4 . Requirements for TCP Segmentation Offload and Large Receive Offload''
+of \hyperref[intro:accecn]{[AccECN]}, unless the VIRTIO_NET_F_GUEST_ACCECN feature is
+negotiated, in which case the device MUST set the VIRTIO_NET_HDR_GSO_ACCECN bit in \field{gso_type}.
+
 If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the
 device MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
 \field{flags}, if so:
@@ -2286,6 +2317,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 #define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM 47
 #define VIRTIO_NET_F_GUEST_USO4       54
 #define VIRTIO_NET_F_GUEST_USO6       55
+#define VIRTIO_NET_F_GUEST_ACCECN     70
 
 #define VIRTIO_NET_CTRL_GUEST_OFFLOADS       5
  #define VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET   0
diff --git a/introduction.tex b/introduction.tex
index ddbad93..85861ab 100644
--- a/introduction.tex
+++ b/introduction.tex
@@ -189,6 +189,9 @@ \section{Normative References}\label{sec:Normative References}
 	\phantomsection\label{intro:rfc3168}\textbf{[RFC3168]} &
     S. Floyd., ``The Addition of Explicit Congestion Notification (ECN) to IP'', September 2001.
 	\newline\url{http://www.ietf.org/rfc/rfc3168.txt}\\
+        \phantomsection\label{intro:accecn}\textbf{[AccECN]} &
+    B. Briscoe., ``More Accurate Explicit Congestion Notification (AccECN) Feedback in TCP'', March 2025.
+        \newline\url{https://www.ietf.org/archive/id/draft-ietf-tcpm-accurate-ecn-34.txt}\\
 \end{longtable}
 
 \section{Non-Normative References}
-- 
2.34.1

