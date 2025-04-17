Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2086.outbound.protection.outlook.com [40.107.22.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D64215186
	for <virtio-comment@lists.linux.dev>; Thu, 17 Apr 2025 22:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744929658; cv=fail; b=lYujw2YBp8j4ucmXHRb1YBFpovpIG9N4m6+Q+LKTzFDiZofbq0cnlVIVSHphyx34VuAWdDsj5/B5ouA4FbHDWi38iFSg19M5oGiOBk6QBLTSd35Mk7QIEk/lHB2a2/rsfTufOLFZGBcm+dWimLoI0PVbaEF5ZZaz96akIUnizM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744929658; c=relaxed/simple;
	bh=/YbXyGtBTH4wN1BhKAPqfX5NSacZb+ZaPfhZ+2xPMzg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FzI6DNHoo/3gawLlIZlJI+tiBNQTu0NudQG9Lh2EJ3aiBW34O2wSI4CfcvjbE9edG5TGfOPzZZRyJhAhY3V3Cv033mAZhdLzCiSa5xlmTjI1QL2GK9TwHe8+Sn4uD9MZ/zGwmzgGlMC+BHEdmeNau/MoTf6xC3pszasprDBZv6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=pwslQSv9; arc=fail smtp.client-ip=40.107.22.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="pwslQSv9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RZVHc1/z3KoA2vKxP8fSfejUlkorAhWn8GM0cIWn+5GL/1/koNbvAwYV1tNG10xjRFSPRzwjbZ3CYiICK8ySxILZakBmVYLHQelHts3mSvrCH2knvKWstkmytd3Cq827CExc50aRBenDEBxE9teOQokiv2X0IZtsPD5o9/kUi+o0yFGJEtOxchUhGTCqAMZBuVLWhBpS9hj50TSWFDqoOGrZr/gxmxMb8bAzjhDfWPCuCTQ+GHC21lIZxbPet/rOU8HdgenLMwGvuZo+u2mKjP2lhYSt7FF911A7eFC6ZRFudEmXD/kD+qI2Go2ZkygX/noWqjMiIQbiV7Z2eBrnMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GtCmBOj6NOBcw0IoQyoATQt8E3P9pRA1vRk3u3Zm65o=;
 b=opuHAyZ2PTbLtzzYjES3zA9JDAKjUbsd4tlbJAPtVRmrA+1R2em2m30FiXsJKXiUkjOUIp0z4hJy+NSsNtoZlzJe7iLJEp3We5mSSNA5KBI3OWOU3k+MUSlre65qmvZUN+Y/hYfLj9GSB8gV6YEVwGtplENd4qqcjXHRp6mr7j4pxaPXGrGNhopSIb44mkRb8zteOJY3AdNnH9omPqW3umrgmUjEyQuJahfr968FC9C3cMgGvRx+9J/T1YKmobO2sT0DXc6MAUcFWcQsnZvnT+zxXTQ9l35mb3J/4mbxtRkaqufaaDy276AEL/sqXfPL42apOG/mJCPRgNDhmwS/SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.20) smtp.rcpttodomain=apple.com smtp.mailfrom=nokia-bell-labs.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nokia-bell-labs.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GtCmBOj6NOBcw0IoQyoATQt8E3P9pRA1vRk3u3Zm65o=;
 b=pwslQSv9ogDEKflRftCtwvHyga5io7oEKxPiMVsoLfQtdk0f2+lcxMPxIDI0S7crKHJURtdnBk2ekKkdKwvaaekca9eOJrAxH6htsP7+tTqlRoAK6j92kh1qb0hNzW34bd9HN6bAbOehdMeCnCqRZqYGOZSGIhy+kfW9bHzue2XLxq5n4VqLYQPWCPz43t74cqDksy4R/pbs94eTgzeX2Qwyeo/TRUU8z5PSMHtXMbH/lsSfE0UREY0QHUJQNp095SsRFVrI4cu9Al5k0fSjAxoVxY+Wfzj7MenBhHRIZxxSWjXRR+MRsD9SuzNR0AeYPWIxMJPbNZCmQLx67G9JHQ==
Received: from AM9P195CA0010.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::15)
 by PA1PR07MB10210.eurprd07.prod.outlook.com (2603:10a6:102:491::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Thu, 17 Apr
 2025 22:40:52 +0000
Received: from AM4PEPF00027A60.eurprd04.prod.outlook.com
 (2603:10a6:20b:21f:cafe::e1) by AM9P195CA0010.outlook.office365.com
 (2603:10a6:20b:21f::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.18 via Frontend Transport; Thu,
 17 Apr 2025 22:40:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.2.20)
 smtp.mailfrom=nokia-bell-labs.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nokia-bell-labs.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia-bell-labs.com
 designates 131.228.2.20 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.2.20; helo=fihe3nok0734.emea.nsn-net.net; pr=C
Received: from fihe3nok0734.emea.nsn-net.net (131.228.2.20) by
 AM4PEPF00027A60.mail.protection.outlook.com (10.167.16.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Thu, 17 Apr 2025 22:40:51 +0000
Received: from sarah.nbl.nsn-rdnet.net (sarah.nbl.nsn-rdnet.net [10.0.73.150])
	by fihe3nok0734.emea.nsn-net.net (Postfix) with ESMTP id A9F062004B;
	Fri, 18 Apr 2025 01:40:50 +0300 (EEST)
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
Subject: [PATCH v8 1/2] virtio-net: Fix ECN feature descriptions
Date: Fri, 18 Apr 2025 00:40:43 +0200
Message-Id: <20250417224044.21348-2-chia-yu.chang@nokia-bell-labs.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417224044.21348-1-chia-yu.chang@nokia-bell-labs.com>
References: <20250417224044.21348-1-chia-yu.chang@nokia-bell-labs.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A60:EE_|PA1PR07MB10210:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 486051e3-7f28-4cb7-7ec2-08dd7e00e844
X-LD-Processed: 5d471751-9675-428d-917b-70f44f9630b0,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700013|13003099007|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?9hYdWh0Tul+Rk7+Yq6OOgTDXbCDChta4EpGgmO3SfqZaj5BLPp0xvFJVG4Dr?=
 =?us-ascii?Q?3X1G1SmVh5k+iSQR2EH8ywbnnti1AO59kSgtvGX5DIYzhz98WelGm33eamoi?=
 =?us-ascii?Q?/ohyO6Y0o7zx3ba5YqSnjIVirzr8c73nXaZKx/Rpb7fbpHPwBW6IKbd3RnKD?=
 =?us-ascii?Q?ddnEdGDRjRHDEFL0hdVeLfVALSyNZQYsNQwO5fB89Mn+iXEIjrvOeImacolv?=
 =?us-ascii?Q?//53p5fDjnUJ6Zv3PVtzxlLkjSBCUWSCJ9CXZO6NVb6pnyne7P2gcrdH5/A4?=
 =?us-ascii?Q?iKm70ZLavBnlX4vyYZP7QlK8WU4K4cd/0UP/8wObh++vUjtCFH6zsJguq/Bs?=
 =?us-ascii?Q?xAEnfTlDfvVkGWP+DvCuqLgUOMc0Xb86DnxJ4Ks51RVO0Lkx+L0HnYmFpLAw?=
 =?us-ascii?Q?//SbuqoOdyqLYrnvQlBSZ6IS76TkIzH4OMR4ctT+V+x3NGFR2mTri17OVZz7?=
 =?us-ascii?Q?iwUyHE/HxGdOPnMT7ZfmfPk3Ig1RpHUxIjwfjldYlKQPaa0YnjJVR8V6nuFh?=
 =?us-ascii?Q?HhH6BnqwmzlQ/CA2xVZz3aFF1fU0E/xZhh5J9Xf59ku0Cgn14MKgp9n7UmzO?=
 =?us-ascii?Q?RcniMOCaNgIVvh6LcoV4O3vYY7AxZdVVfAsElTeWndq/oUWDFS47QAc6IESf?=
 =?us-ascii?Q?sN1e/mUeL008PhFGR9BN5e6i46Bxdo4MxR9zelLeMtS3k+VJvXJBuef0VHgL?=
 =?us-ascii?Q?yKrAQ8O6C+yIeBYdI3I27cgCOkSKYPDHEXpgFzkMuZRfSjPZipww/nsQAY1g?=
 =?us-ascii?Q?mCP8BC9wbwj/Bcty2jTHLjm7Ff3GrqjETiaI/2B8vg524+OAxWOhcIugLYPl?=
 =?us-ascii?Q?2j/h2CnObCLM5R75cEE5xK/jsOahutXHlA4aNNksCY25iPVeCFsvS86yRj9U?=
 =?us-ascii?Q?HetzUftN5OSNbivAvV91SQ6qoT1vQJis7lraTghfg9SupWTyHtB36qaTr69X?=
 =?us-ascii?Q?/l1UfS9/h7bau+Jkzy0RkGWydhakq1wU7+9ZmrHYm5wonWxBovlSkTm1Xv1E?=
 =?us-ascii?Q?rpE+ba8Yd2zWcL/Ee3TwNGgRzT5aiqjUuPv1A3XRUTZAqDlCPP1ZyZYcqPZh?=
 =?us-ascii?Q?ctdlf0QJqyRwFfYX7ZMsPKbE8cYUoF34LOfotKmzepd7/tYK9IH/KD2UfPYF?=
 =?us-ascii?Q?Q8Jye/hRdECkkkG14vVRgiJQPb1P+zUz0bq/58wAJhlcHw8xz7BLGcEb4eL3?=
 =?us-ascii?Q?hErDnG61znNOdm7HvWa06X/YtI76WRy3w57KUkfSQ1XqRN7HP0Hs+vld2Jss?=
 =?us-ascii?Q?jiSJyRT2HUR9gTzRceEa/OzSN/2DJlTQltTCohL4LcvosZcXqnjoqK6WF4hi?=
 =?us-ascii?Q?7bkF0Fb/t1CV1aDepnK1j9WfZP7zOz3LQ+xkwfJMRIO5IH9oL9hrUa7mvI/6?=
 =?us-ascii?Q?32+W9GxdVAQ/MyXhfvEzuvpQK/vTYBLhsBOHnSjhhy/Ut2vBKGHh4FLblQzQ?=
 =?us-ascii?Q?UABH6v8kuBs4dT7B1HnA1NARiuEb97FVau95TFCLdsxnTpDLzuDLGPIensNE?=
 =?us-ascii?Q?TAG8i8oYd6NOSj0B9CIWCWapjywra5TeTK0XJEUdg5W5mt9lAITj9GHNq97u?=
 =?us-ascii?Q?PvX/iCmQqONfM3jXOAU=3D?=
X-Forefront-Antispam-Report:
 CIP:131.228.2.20;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe3nok0734.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013)(13003099007)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 22:40:51.6818
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 486051e3-7f28-4cb7-7ec2-08dd7e00e844
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.20];Helo=[fihe3nok0734.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A60.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR07MB10210

From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

Clarify that the VIRTIO_NET_HDR_GSO_ECN gso_type flag does not mean that
TCP has IP-ECN set; instead, it identifies that the TCP CWR flag is set
and will be cleared from the second segment of an aggregated segment.
This is used to offload the TCP CWR flag in a way that is compatible with
RFC3168 ECN but is problematic for non-RFC3168 use of the TCP CWR flag.

Foe detailed requirements, please refer to IETF RFC3168:
https://datatracker.ietf.org/doc/html/rfc3168

Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
---
 device-types/net/description.tex | 33 +++++++++++++++++---------------
 introduction.tex                 |  3 +++
 2 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 1b6b54d..6b09f0a 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -54,7 +54,9 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
 
 \item[VIRTIO_NET_F_GUEST_TSO6 (8)] Driver can receive TSOv6.
 
-\item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with ECN.
+\item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with TCP CWR flag set
+    and follow the ACE bits handling approach mentioned in
+    \hyperref[intro:rfc3168]{[RFC3168]}.
 
 \item[VIRTIO_NET_F_GUEST_UFO (10)] Driver can receive UFO.
 
@@ -62,7 +64,9 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
 
 \item[VIRTIO_NET_F_HOST_TSO6 (12)] Device can receive TSOv6.
 
-\item[VIRTIO_NET_F_HOST_ECN (13)] Device can receive TSO with ECN.
+\item[VIRTIO_NET_F_HOST_ECN (13)] Device can receive TSO with TCP CWR flag set
+    and follow the ACE bits handling approach mentioned in
+    \hyperref[intro:rfc3168]{[RFC3168]}.
 
 \item[VIRTIO_NET_F_HOST_UFO (14)] Device can receive UFO.
 
@@ -695,8 +699,9 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 
   \item If the driver negotiated the VIRTIO_NET_F_HOST_ECN feature,
     the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}
-    indicates that the TCP packet has the ECN bit set\footnote{This case is not handled by some older hardware, so is called out
-specifically in the protocol.}.
+    indicates that the TCP packet has TCP CWR flag set, and the flag will be handled differently for all segments of
+    an aggregated segment, as mentioned in \hyperref[intro:rfc3168]{[RFC3168]}
+    \footnote{This case is not handled by some older hardware, so is called out specifically in the protocol.}.
    \end{itemize}
 
 \item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feature and the
@@ -788,10 +793,9 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 \field{gso_type} to VIRTIO_NET_HDR_GSO_UDP_L4.
 
 The driver SHOULD NOT send to the device TCP packets requiring segmentation offload
-which have the Explicit Congestion Notification bit set, unless the
-VIRTIO_NET_F_HOST_ECN feature is negotiated, in which case the
-driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
-\field{gso_type}.
+which have the TCP CWR flag set and require the flag be handled as mentioned in
+\hyperref[intro:rfc3168]{[RFC3168]}, unless the VIRTIO_NET_F_HOST_ECN feature is
+negotiated, in which case the driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
 
 If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, the driver MAY set
 VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit
@@ -1105,9 +1109,9 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 \end{enumerate}
 
 Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, UDP_TUNNEL
-and ECN features enable receive checksum, large receive offload and ECN
-support which are the input equivalents of the transmit checksum,
-transmit segmentation offloading and ECN features, as described
+and ECN features enable receive checksum, large receive offload and RFC3168
+ECN support which are the input equivalents of the transmit checksum,
+transmit segmentation offloading and RFC3168 ECN features, as described
 in \ref{sec:Device Types / Network Device / Device Operation /
 Packet Transmission}:
 \begin{enumerate}
@@ -1210,10 +1214,9 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in \field{flags}.
 
 The device SHOULD NOT send to the driver TCP packets requiring segmentation offload
-which have the Explicit Congestion Notification bit set, unless the
-VIRTIO_NET_F_GUEST_ECN feature is negotiated, in which case the
-device MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
-\field{gso_type}.
+which have the TCP CWR flag set and require the flag be handled as mentioned in
+\hyperref[intro:rfc3168]{[RFC3168]}, unless the VIRTIO_NET_F_GUEST_ECN feature is
+negotiated, in which case the device MUST set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
 
 If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the
 device MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
diff --git a/introduction.tex b/introduction.tex
index e60298a..d52622e 100644
--- a/introduction.tex
+++ b/introduction.tex
@@ -168,6 +168,9 @@ \section{Normative References}\label{sec:Normative References}
     Leiba, B., "Ambiguity of Uppercase vs Lowercase in RFC 2119 Key Words", BCP
     14, RFC 8174, DOI 10.17487/RFC8174, May 2017
         \newline\url{http://www.ietf.org/rfc/rfc8174.txt}\\
+	\phantomsection\label{intro:rfc3168}\textbf{[RFC3168]} &
+    S. Floyd., ``The Addition of Explicit Congestion Notification (ECN) to IP'', September 2001.
+	\newline\url{http://www.ietf.org/rfc/rfc3168.txt}\\
 \end{longtable}
 
 \section{Non-Normative References}
-- 
2.34.1

