Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2047.outbound.protection.outlook.com [40.107.20.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD52E2063C2
	for <virtio-comment@lists.linux.dev>; Thu, 17 Apr 2025 21:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744927068; cv=fail; b=VXt8nweg7K1wivgY6GCoFEHec5wMWyffgtVNaEC5bhol65TcaYyOd67av7es5GpWnSNn5VMjnD/xAhOAGL9IhVyhvJHPfO3cnfFNlKm87R1MdaLW0OgkfyTCxBlzOVNeRT9J6DZPejh2ERGWKJRv7RJ3ZjiX9G/lDdFOHk9qR8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744927068; c=relaxed/simple;
	bh=LbUdSq19CePJHbHjUEnY1fDNBCTVBuccwoPScZ1Jt7E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GsXtYQOMH5apThmRrBcFfzSsUHxFesyUJud3D2MqVOZMsIkXttUtvcc8SZihjvzMlq3kYIFqwumgbN5rr8kMyWcVMZDyTjfoy8qvU+jSQG/JitLEw2haVL/1JxDPNyttYhnArX/70KZHbxU0lwHcR/+e+o5XuSC7GtytXutmILU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=r6m0sKAO; arc=fail smtp.client-ip=40.107.20.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="r6m0sKAO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SD9smGZ0738X7zV17mTAkjInaAcZRwvtz0i3v9dO+83xkQvTDtFcwcTnssvuXiC1p3ThJVCIUctcunnhoKWHeQwYEvpsapLkYtS8+OEvQoZ3gelmfYxARBlYy7rARQvV3Kk91bU8gJuRNrfFmQd+jIPnw06NiSBVXaEJkC46EHTyj9VCELcotGMITdopMgIQhy028Q+49QIAGAR2xoldJpgkrhxhbLWt1l9Op4k+QdFnmiLwi9s/fe9F+6EoAB/MtT3/BIyNJKpNj8fcABpQNJWy0jvVGhLAJ0p1eD4HWOGdyiITrZNkx/N/2vkZAFG0GURKQbJQDEnMJPX/CerMLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yOXV3fAlWEyEh2sWnLpbSRm7O0+Z3ApAa6qC9sQPxMA=;
 b=I0qRSLl8/vwDxnxHuyAQvNdOzpF+ENxIhYbuMh3mrWXgXXYpjgYwe3wNRoKoU7oro+eOT/h4WfE0TdyrRyAdp5seTrHTF5NuLGGhsHVouM1kLiugxMPSsKVTYuPXoU4YhxKjqqOVy3vhNL5NK+z+6RwpR8rIzjMe+HQTRZDP5O8Ts5wNtiBW1j6cIUKcEq/yST4Fpjf/S+OKZna+UmDbl3mnveghCp1Z97qbn6W/775D6zrIPO+4h7/cm8pqTb0L57YZ5uKkeh7hH7UKGituoZykPU3HH2megaAbqGDmITd6ZbZ2lUF5lCgy769icKJWOpp+2TZLgMuMSWZqA70Hew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.20) smtp.rcpttodomain=apple.com smtp.mailfrom=nokia-bell-labs.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nokia-bell-labs.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOXV3fAlWEyEh2sWnLpbSRm7O0+Z3ApAa6qC9sQPxMA=;
 b=r6m0sKAOizjkeN8YFs0Q8IcfTYr7AkLLzj82WLiDNyDckf97s3ToMaZwO3LQqk+7j3P7WygYHfuc6iwqA6rApOIiwWmYz96LFn0zoCUd8C5R1rOrARuZODgC+9DlEvvK2axLGRkyf9ADl7sEFFwybtrT6iFfyha8h9OqtKY5Cl4Eh15cH+IyZ0ISnUNQmIxinwPc0fJ/No7I7srAEtwE4w/QtKjHZpfrXEhv6DRPYproD4kTCnG0TZkaBZEybbBk67O2M/zTQSE44OvrLueZKwhKCNetxg8Fqqq980bTqHvcPBazZruOT5HXEWBiIilCdzodVu9bEmFtQVbPXGI8ww==
Received: from DB8PR03CA0030.eurprd03.prod.outlook.com (2603:10a6:10:be::43)
 by DB9PR07MB9125.eurprd07.prod.outlook.com (2603:10a6:10:3d7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Thu, 17 Apr
 2025 21:57:40 +0000
Received: from DB1PEPF000509ED.eurprd03.prod.outlook.com
 (2603:10a6:10:be:cafe::e7) by DB8PR03CA0030.outlook.office365.com
 (2603:10a6:10:be::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.18 via Frontend Transport; Thu,
 17 Apr 2025 21:57:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.2.20)
 smtp.mailfrom=nokia-bell-labs.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nokia-bell-labs.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia-bell-labs.com
 designates 131.228.2.20 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.2.20; helo=fihe3nok0734.emea.nsn-net.net; pr=C
Received: from fihe3nok0734.emea.nsn-net.net (131.228.2.20) by
 DB1PEPF000509ED.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Thu, 17 Apr 2025 21:57:40 +0000
Received: from sarah.nbl.nsn-rdnet.net (sarah.nbl.nsn-rdnet.net [10.0.73.150])
	by fihe3nok0734.emea.nsn-net.net (Postfix) with ESMTP id 90FBE2004B;
	Fri, 18 Apr 2025 00:57:39 +0300 (EEST)
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
Subject: [PATCH v7 1/2] virtio-net: Fix ECN feature descritpion
Date: Thu, 17 Apr 2025 23:57:34 +0200
Message-Id: <20250417215735.20982-2-chia-yu.chang@nokia-bell-labs.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417215735.20982-1-chia-yu.chang@nokia-bell-labs.com>
References: <20250417215735.20982-1-chia-yu.chang@nokia-bell-labs.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509ED:EE_|DB9PR07MB9125:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4278eb65-7012-459e-2afd-08dd7dfadfd5
X-LD-Processed: 5d471751-9675-428d-917b-70f44f9630b0,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|82310400026|36860700013|7416014|376014|1800799024|921020|13003099007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?WtO517ooYoFFSy6GBGog6grJVJPs/s1lpgyKjKDrJsM712EH934ZIMYOo/kg?=
 =?us-ascii?Q?f/MqFsiQbg+s3UAcanYClJ6pxM/0DR713kacOo7BL2FACiuU4D2jgMAKJnZF?=
 =?us-ascii?Q?Hn8YZEm3U0/UADgb8jZvHuUlS/gnpxKHIEpHBPWb23jgo82JVFE3Zperuaz0?=
 =?us-ascii?Q?KPCUY1wzyDsEyH164WIaAcbn5/iAgLUGoIowNc/mAnX8akg8k1uSQ5SsePEm?=
 =?us-ascii?Q?w/KO8t59z4sIzw4Dx9ddh+1XW1v+97qObSDTmpnaetN+kqhvHmOKSDfgLJW2?=
 =?us-ascii?Q?f7NCRk1zwO+xpXNX5mOOkehfW0ZQDP8LMVrwqG6FKEOE5acmh17AvPjp27G/?=
 =?us-ascii?Q?8P2oFK3VY8dMwA8L5vaQ92VAhxyfDhcIa8hGKN5saJQrFAuY8m9QJ7QEE/W7?=
 =?us-ascii?Q?GskymnG6FsBPLQO7li964UkWmewI8zqRpaAPbJGJBFYZEVfVXYKXIv+Ef8WS?=
 =?us-ascii?Q?LyPb+bClzK/YL3pO8y/aFwU39QGLNNIZE5IQoklac10OYBIXFTQZaV1ioCJk?=
 =?us-ascii?Q?NzLpy/8gSIwC02KckSow/ZlMprNHo6C3t39thVp22WqtopqRpHTi2Z9RtplG?=
 =?us-ascii?Q?+EwmCraVq8xS75bdO7qnZYjhEuPxMsd3JgPuDdueb2DeBhEfmZ8P3zJTGi9G?=
 =?us-ascii?Q?+izMwhZdkkLZvgbM80yG0GZ3oQhbSQ4jDQH+EgLSm50ZXLXstXPAmpyugUO1?=
 =?us-ascii?Q?EDauTiqV06IiGChPa3q65OgutHD0B++j9o+hrL2iPOCbVpRfRn/JDuevFoKK?=
 =?us-ascii?Q?bm9DXnD38azymTbbcsjWlPOzDnlmiuCg2+tQdDwzCskSBj4PbwgAs0CeYKhm?=
 =?us-ascii?Q?tm2locinxOo6sFEVSqAYFO+L9hTZBM/GffY4mvTk1q1io7QgjQSSCvPylFi6?=
 =?us-ascii?Q?IabDTS4LWAD0PAmckbUb+ZxB3lc2hRu2HeMkWxGCOQeUXTpPKwaa/5JHZU+R?=
 =?us-ascii?Q?H+q7SOHEzakVtWdiro2RaSb1bV03jJXCdy+PbfXij66eIwBxBoJRrtsX8Ysh?=
 =?us-ascii?Q?OZ5VIgshH93Sg11pEt93PbwFMOrD+DLB3SwgIfxOMo0JxhQlOHas5jD1k8Ns?=
 =?us-ascii?Q?JsPHL+VAgF2GB5QTF858cE8lsAreQXMpMtbV8SDZJtwCgq7wKspM4AtLHie5?=
 =?us-ascii?Q?MkJft7E0yU8Wb/yZX6zwVJkFS0TcxbFamDSE1lUc1BHflNINz2fcgrEIv8DW?=
 =?us-ascii?Q?ftmwJQpwxQ4DL07/BwaCbKP3vzZgyNXBhGZISwMy5GLi0PF5nNRjKFtA75vO?=
 =?us-ascii?Q?UqIfOEcY60wD0+N9NcMFQ7KZuLHlOqDmycD9r3FSEhXR1/ysSa/RLaxR0TYZ?=
 =?us-ascii?Q?OYpgXtBd0/4detP5zQvpfQejXcCuubuYlyRbH1rr0oaS6o1k/E8yf+uJj1LE?=
 =?us-ascii?Q?/Ns5wRkvxCxnrtrn/C1nbz1bdknniBM3KgJq2GWezK6qUeCRhzAGg99BoN9U?=
 =?us-ascii?Q?OyOtMRGu+1fqLE/Id1QmgNaVGMIATfaS7OkQMtXi/8HezJvgTVOXNggxXYMB?=
 =?us-ascii?Q?PhpSCPvio54MiK7GYYO/3njzgr5/kqEgKev9gyRyq+JAbfLLKqRIC0cQeg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:131.228.2.20;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe3nok0734.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(7416014)(376014)(1800799024)(921020)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 21:57:40.5970
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4278eb65-7012-459e-2afd-08dd7dfadfd5
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.20];Helo=[fihe3nok0734.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509ED.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR07MB9125

From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

Clarify that the VIRTIO_NET_HDR_GSO_ECN gso_type flag does not mean that
TCP has IP-ECN set, instead it identifies TCP CWR flag is set and will be
cleared from the second segment. This is used to offload TCP CWR flag in a
way that is compatible with RFC3168 ECN but is problematic for non-RFC3168
use of CWR flag.

Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
---
 device-types/net/description.tex | 33 +++++++++++++++++---------------
 introduction.tex                 |  3 +++
 2 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 1b6b54d..a2c9de8 100644
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
+    and follow the ACE bits handling approach mentioend in
+    \hyperref[intro:rfc3168]{[RFC3168]}.
 
 \item[VIRTIO_NET_F_HOST_UFO (14)] Device can receive UFO.
 
@@ -695,8 +699,9 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 
   \item If the driver negotiated the VIRTIO_NET_F_HOST_ECN feature,
     the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}
-    indicates that the TCP packet has the ECN bit set\footnote{This case is not handled by some older hardware, so is called out
-specifically in the protocol.}.
+    indicates that the TCP packet has TCP CWR flag set and the flag will be handled differently to all segements of
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

