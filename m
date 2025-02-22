Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2041.outbound.protection.outlook.com [40.107.249.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AFF18EB0
	for <virtio-comment@lists.linux.dev>; Sat, 22 Feb 2025 23:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740267059; cv=fail; b=tvBEH9NhVVnN1Es811GzfW2FQ1i0i8Q4MvcfRYEXpium/NiFd1/9x3FzB6Ybv/fPOdTnIuXj0VRP8KHfLdr94fX8ap12W8eRbvXY+FAPMQMsCy5c3WCK+1SPBSMPf40VSqqR7XZrBWDGU6/CqAKbg41lFKrUsMz5g9o8OEJZQEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740267059; c=relaxed/simple;
	bh=/PdmYwwnzw/GMVR69jHUKEP/n7Itrn7Fj/NVSEivQQg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k1ydStXFD3y93PguN9NYYSVkea0a8UX20rbuVs2l8Gh8pAVHbXvm4y1DRLSgh/dxviAy2a1GXKYfRA+5Ik25mLgaQDbczrXKkFiB/kXmUUmvuhd69bbjb+Lb/kcR09bb6p7YHFVO0QASiVD8yCKjGx2+LLSspCCOwt16iokmv1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=t9w5OCqr; arc=fail smtp.client-ip=40.107.249.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="t9w5OCqr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zWNqKQhuvufMU+w8175m1Q1B1vuRoWMxalQQ55HwiIoMjlHLCN6OZlAfA37/mCxgKNaMCXTg4DJB5Sd8u/ecBzy7Tmkpq/YAmvuVelng1Prb5iWxPS9kzNczmFMCbF74PpRLQkvAs901cwUl59JGmBuvziR1ddpxhyFG4ljjxMVdXcR+lpde5GFowM2rxXUqbveYNU9dqfOpVJjwwfhND/antQv+1XJbd5joAoCEcpZZ/oYprdzhOeh+MH5Iych6q5tNo5yv0IzaXe+gmolapywVDwMVq7F5y+rnLwelxid6g4Fb2shU1GzflBNgO4nmJDylOuMAJgxKt3jwIzUahg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOqe9lVXj/AwFKMRuDK+RQ2t9aQJvFlSQUUd+iiVncw=;
 b=r83W99VNJP8TQOynIJXi6bX2/1j5hbF+P6RZCTLsc6l/O6e26TmXkRiz4uxIPYcFmpY0bTFiemTXI9r4K0PFmQg6epq1Y4/ccURxoHal2lNkymV8J+9Dnlm7tE3QGozDXlk4Vj0k/qssAhUR0TrPQKcrHMLAtUHw4xoMgU+EsVYohkkPyVlOjfNpqi6ekHPS1I9XpZLYJ+6MzSKXyKn0oMLW7KNdJHcl1PsQ8bgw+LVFMz2VQn3kjNJm7z0APqnSx1pnnxCXC6JUUHd17wC9DV+pALFE3EVDtYULE/mV1F5uxpBaWjzfmUbuSd8nIrbxIcfBV9d7Y7uZJ37SQlmQGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 131.228.2.29) smtp.rcpttodomain=apple.com
 smtp.mailfrom=nokia-bell-labs.com; dmarc=temperror action=none
 header.from=nokia-bell-labs.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOqe9lVXj/AwFKMRuDK+RQ2t9aQJvFlSQUUd+iiVncw=;
 b=t9w5OCqr1c39W3WL/TdzC9Wq+d6ShtFZ0yzJ7uDygB0qtSBZyI3ZvFJI2fDlZNNfMgYRrA/wxnTpiJRBdeEfCxf3N/knvr++32J3HJTzfl4Dvyo97WEg+GHTWixMDX+OBFyOLxFAqzG276Mdz3X5zcFX4mXprjIx5dk4VBbhTCYjrFP30L1KIYER6ovkbhDcl+kaW0b7t4aGfSgnjYr02lAqGq6V2kCtE0LLl9HCS2sjBbSP41xKPjpdIquScWAggrGl5XzbhV9QmdIt09oO0VmDNYb/3Mi94GbKfbQyHKrvZmmkUuii+Dtj1LnP99I/avSEXJKuCUggW2tfgvDU7A==
Received: from DUZPR01CA0081.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::6) by DB8PR07MB6220.eurprd07.prod.outlook.com
 (2603:10a6:10:137::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.18; Sat, 22 Feb
 2025 23:30:53 +0000
Received: from DU6PEPF00009529.eurprd02.prod.outlook.com
 (2603:10a6:10:46a:cafe::b5) by DUZPR01CA0081.outlook.office365.com
 (2603:10a6:10:46a::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.19 via Frontend Transport; Sat,
 22 Feb 2025 23:30:53 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 131.228.2.29) smtp.mailfrom=nokia-bell-labs.com; dkim=none (message not
 signed) header.d=none;dmarc=temperror action=none
 header.from=nokia-bell-labs.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of nokia-bell-labs.com: DNS Timeout)
Received: from fihe3nok0735.emea.nsn-net.net (131.228.2.29) by
 DU6PEPF00009529.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.11 via
 Frontend Transport; Sat, 22 Feb 2025 23:30:52 +0000
Received: from sarah.nbl.nsn-rdnet.net (sarah.nbl.nsn-rdnet.net [10.0.73.150])
	by fihe3nok0735.emea.nsn-net.net (Postfix) with ESMTP id 025FD22540;
	Sun, 23 Feb 2025 01:30:51 +0200 (EET)
From: chia-yu.chang@nokia-bell-labs.com
To: virtio-comment@lists.linux.dev,
	mst@redhat.com,
	cohuck@redhat.com,
	mvaralar@redhat.com,
	jasowang@redhat.com,
	xuanzhuo@linux.alibaba.com,
	eperezma@redhat.com,
	ij@kernel.org,
	ncardwell@google.com,
	koen.de_schepper@nokia-bell-labs.com,
	g.white@cablelabs.com,
	vidhi_goel@apple.com,
	ingemar.s.johansson@ericsson.com,
	mirja.kuehlewind@ericsson.com
Cc: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
Subject: [PATCH v3 1/2] virtio-net: Fix ECN feature descritpion
Date: Sun, 23 Feb 2025 00:30:39 +0100
Message-Id: <20250222233040.29738-2-chia-yu.chang@nokia-bell-labs.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250222233040.29738-1-chia-yu.chang@nokia-bell-labs.com>
References: <20250222233040.29738-1-chia-yu.chang@nokia-bell-labs.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009529:EE_|DB8PR07MB6220:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 031c25cc-7a29-4c6b-f3df-08dd5398f2da
X-LD-Processed: 5d471751-9675-428d-917b-70f44f9630b0,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|36860700013|376014|7416014|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?aD/pc1T0ZG68PWT4/Z9pxMi2sr0UXRoMbIQmxqFg/qvPGXQYXHfoSi7cdoZw?=
 =?us-ascii?Q?MwEQMgGbM9V20YXcMLXIhcoD9vTwvlEIWiJuYUOjXdG7K0nKA+nCHiFx/pck?=
 =?us-ascii?Q?3OPh8utd01dqaL4XkCUnGPOjrdR8M3WZ73A1h/7ZQg3jw9vz67D5IADj1mn3?=
 =?us-ascii?Q?Ev7jrFR1H5cQRNrzZDr8JlYsVP5CKuIsLKiGas8KAeBdKHk5AjhClI+Y4tDJ?=
 =?us-ascii?Q?K5of0CVqPPKRIUGUQs0UVyoOrrN9sp39yiXVeHMfYpGx7qi171IL2mIV7RZQ?=
 =?us-ascii?Q?em0dl9Et8npsup1EzCJvc9sE/1l4+bgYJrY43UcFY8Lh4I11Cr+fA2Hu4/7a?=
 =?us-ascii?Q?r7rc/i0bHvUBKWGpK40HYwVFEvGPrA3uUC57egzBOTEK7FyOtFF0nv6vjQlg?=
 =?us-ascii?Q?U8XGMeZJ8zOLZb6iHxT3rzv76Lre6JHuAwDYIW9vKS9F8lz0p8v+6nUJdLXM?=
 =?us-ascii?Q?wNt2JgzKZpYMVrR4PuSyL4Sy9cMfWJfPbxESBfufQqUgXLWd+A0esBE+BP6K?=
 =?us-ascii?Q?VXILFc/2eIbZ+oNynr7DcUZzLoPSePiDUCkGWtmN3Kl8tJokSXehK0xKBCcF?=
 =?us-ascii?Q?dZWQV5QplJUIe7OqE+d8wD8FVoahr1EKGr1HsZc4br28gy7CBccTCGlq0mb0?=
 =?us-ascii?Q?YrRcj+Pwg/9Y2+NMsLvzu+r6rfuNZrrS8yrZ5V26KXa4OTYAfVvt2yFd21pE?=
 =?us-ascii?Q?aU+GyN2MflGrB6nnW/Ity6gdoPnN9CsPFMDCQGf4DutVmoRmKjS4oxzlAj2O?=
 =?us-ascii?Q?l8f2vAPGLQYGnCKVLR+vb2ILClnM9px0c5NVCYyfuBGKp+19RjIsPfNyiv9d?=
 =?us-ascii?Q?c5Af0+56Qu1lVLfhn3yqxJRZVL4PReUMlOZoXcDvfTXrMkMWIAz21SaG5CKE?=
 =?us-ascii?Q?q4qFnJfXEWIlTF2AhRnkAVYyLKPjLHY277ye/flP2xVLHb3FvfHT515P4ztl?=
 =?us-ascii?Q?n8MIhKj7RGepkLzq3A0Yo6Shis6msu/HP9RveBi15E2zg3PQWqZdxfDpU160?=
 =?us-ascii?Q?fQxcIjjmNde/WlR7Lv5ZMVOa9WmKcHMedT66x+WFZrT7U7gEQbp4RuNZbIQN?=
 =?us-ascii?Q?gRnHBZROxo52rjhJW5iWEJwmQYA9chnL0zV3WJFGyjuD4ULy2dDqnMRPNY/P?=
 =?us-ascii?Q?ch1uSRT48imtQqgGr6Qup0x33T3U9g+LeGFMEgf5KS1dnlPXvfOgCEfRO+Em?=
 =?us-ascii?Q?1qeUuvn91NR1j9Y4GiFS18h5taOVExSPv905JTLpsfY+2WuGR+AKff6f9m6Z?=
 =?us-ascii?Q?M+2g3p2V/phh81UjjuJZGPx/crKXtvo5Uaghxs2QpKkUE1uaebar280lebiO?=
 =?us-ascii?Q?ithZiwSvAD6mD2bKiumxT7lW32u3hRIyUXXGUihCyIhu+AAURggZRTCvJTiH?=
 =?us-ascii?Q?+trFOv42hdQu5b5n31NBTtkOYRPr7hin8gANoYxXgCK1BpTSEBySbQSYJneZ?=
 =?us-ascii?Q?12qedj0fpvht5J6i9/Pcn7L0TGMyKcTgu/QimhF1yEO6uqrapJjsNWdR8AMR?=
 =?us-ascii?Q?n4iLli09Ph4gj14=3D?=
X-Forefront-Antispam-Report:
 CIP:131.228.2.29;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe3nok0735.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2025 23:30:52.9954
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 031c25cc-7a29-4c6b-f3df-08dd5398f2da
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.29];Helo=[fihe3nok0735.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009529.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR07MB6220

From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

Clarify that the VIRTIO_NET_HDR_GSO_ECN gso_type flag does not mean that
TCP has IP-ECN set, instead it identifies TCP CWR flag is set and will be
cleared from the second segment. This is used to offload TCP CWR flag in a
way that is compatible with RFC3168 ECN but is problematic for non-RFC3168
use of CWR flag.

Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
---
 device-types/net/description.tex | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index b546cd7..104a32f 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -54,7 +54,9 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
 
 \item[VIRTIO_NET_F_GUEST_TSO6 (8)] Driver can receive TSOv6.
 
-\item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with ECN.
+\item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with TCP CWR flag set,
+    which will be applied to the 1st segment of an aggregated segment and
+    be cleared from the 2nd segment of an aggregated segment.
 
 \item[VIRTIO_NET_F_GUEST_UFO (10)] Driver can receive UFO.
 
@@ -62,7 +64,9 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
 
 \item[VIRTIO_NET_F_HOST_TSO6 (12)] Device can receive TSOv6.
 
-\item[VIRTIO_NET_F_HOST_ECN (13)] Device can receive TSO with ECN.
+\item[VIRTIO_NET_F_HOST_ECN (13)] Device can receive TSO with TCP CWR flag set,
+    which will be applied to the 1st segemnt of an aggregated segment and
+    be cleared from the 2nd segment of an aggregated segment.
 
 \item[VIRTIO_NET_F_HOST_UFO (14)] Device can receive UFO.
 
@@ -695,8 +699,9 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 
   \item If the driver negotiated the VIRTIO_NET_F_HOST_ECN feature,
     the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}
-    indicates that the TCP packet has the ECN bit set\footnote{This case is not handled by some older hardware, so is called out
-specifically in the protocol.}.
+    indicates that the TCP packet has TCP CWR flag set and the flag will be applied to the 1st segment of an
+    aggregated segment and be cleared from the 2nd segment of an aggregated
+    segment\footnote{This case is not handled by some older hardware, so is called out specifically in the protocol.}.
    \end{itemize}
 
 \item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feature and the
@@ -788,10 +793,10 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 \field{gso_type} to VIRTIO_NET_HDR_GSO_UDP_L4.
 
 The driver SHOULD NOT send to the device TCP packets requiring segmentation offload
-which have the Explicit Congestion Notification bit set, unless the
-VIRTIO_NET_F_HOST_ECN feature is negotiated, in which case the
-driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
-\field{gso_type}.
+which have the TCP CWR flag set and require the flag be applied to the 1st segment of
+an aggregated segment and be clared from the 2nd segment of an aggregated segment,
+unless the VIRTIO_NET_F_HOST_ECN feature is negotiated, in which case the driver MUST
+set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
 
 If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, the driver MAY set
 VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit
@@ -1210,10 +1215,10 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in \field{flags}.
 
 The device SHOULD NOT send to the driver TCP packets requiring segmentation offload
-which have the Explicit Congestion Notification bit set, unless the
-VIRTIO_NET_F_GUEST_ECN feature is negotiated, in which case the
-device MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
-\field{gso_type}.
+which have the TCP CWR flag set and require the flag be applied to the 1st segment
+of an aggregated segment and be cleared from the 2nd segment of an aggregated segment,
+unless the VIRTIO_NET_F_GUEST_ECN feature is negotiated, in which case the device MUST
+set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
 
 If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the
 device MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
-- 
2.34.1

