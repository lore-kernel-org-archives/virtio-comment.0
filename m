Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2052.outbound.protection.outlook.com [40.107.247.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9756F4A33
	for <virtio-comment@lists.linux.dev>; Wed,  5 Mar 2025 22:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741214175; cv=fail; b=N6tq3kqarzRRi7/jRdQXfcQMMT91RffI4cwjQCNhU9prB88QO1xzFNr+DCWlFIPDHvsx142sTZMkCuSBgIMG5OozNswtsY3cl/LrByXxY2i40H/idFOvHHkHiUOBOLD2fp1twjJmB52PQC/gC7FTZyckieZhSLpFrqc5Uj4afaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741214175; c=relaxed/simple;
	bh=OQ5f2GKc/s+i3gKmzFPha1+PdbBchh+4F6fSia4V89U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oqxKeom3OmZxCfMNDkkhmbWAqWA+VSF4/RT6bjbJJHfhirQrDsLe/kpLabPdaCAbIPegcRuS1gfxeG9K+Pjpx10MDM6OIU5LhLwnVMDDnAOudtVaGzeTh9/kAy/RkfzublDDJHJe5oemaC3E6fvz7vMXMm64iuUCuib9rjS9wg4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=VEvwgVTM; arc=fail smtp.client-ip=40.107.247.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="VEvwgVTM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UDp18SUrp7bTTHF9a7yIQcflBXKq/mLlcAxp3XhURJJJtwcacLOVoehBfifz9crZj55xvGYDpF02vfYj9XsneygC4QWxFN33kxfER9wCORud/BoLZdA2q2t5r9UNX5zol7w4Jr28/3hOuVkVnrM7lazYHWCjWE39qRyO2wZB4rnifYUy/6pbxOzEtU5vV7/UzersnKTOPr+Vhb06B2w9/HEM9wjjA0coGFMPoKTEB8/zBi4XEBU40LvllwoyPLblwGKT2LdRKmISv+4DYamspkPJ4vOQxZPBrLYkg3OUXfyFQiMfGg+/BibzA42ZUGFyqSvbVKnLNTsj9FTlAfeHmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FAgboqN1w3WHy6O+h1YU55M/QFbm4vRBjHljaIJcb34=;
 b=GEwYLeVKRA3MDjB9OKIXlu8bUJCmVhksBWQ5SmdJSujGa5JRgiuvWSQpJ9GguDY7cA/WtU9f1jd7v36QPgnMJyjAf7uRFC3hbt0eP6na2TjP/MmE4v5C8xs79OtEQiz++dJyAWh2YKTkX/peiDAp3O4b6u1ARi2MF1JcdCqUWU4m9gFlbNeEqnp3z8/aIzTofSZU/LjWCWknvW2+vQajoqs5qMK6TglneEmYzYyUP29f5rf3vHcvm62qbF4pfXExDGhQCfKi89GRMKqkJbXax3KDPVviusJLVVPl9GQvqqv5TCbLD+5JjWojXYfmBXsDcobaB5dmF38cGNAhne4FcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 131.228.2.29) smtp.rcpttodomain=apple.com
 smtp.mailfrom=nokia-bell-labs.com; dmarc=temperror action=none
 header.from=nokia-bell-labs.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FAgboqN1w3WHy6O+h1YU55M/QFbm4vRBjHljaIJcb34=;
 b=VEvwgVTMuv78ueAKRYsdjfUwR7aO0aBmsAmNk6ibCmdOZhDXci844PjG4mBSjWxdKio28abuj8dBRmmS8/bo7+9xvM2F3S1f2P0uQa3wGrIy+m4W4ItZ7GWjPF0uu5j5gMWwdFue2A7YsyV7Zf1aI/6RjjnVJMSHLQHC5aHU6efCuP7SY4E/DGkYqTwP1b7IJ3O4jB7YRW+2uk6vD02BkziBhzz84y6kuvsTNPt3YabEYz7HwckQnpph3OYYQwAteY4fHyoUMq1z8+0SsEJG8xjU/nX9oFQOA+ohvN+6cZnqu9CmO4qGVjKcIas9dlEHhlTJx7FEc7/irL5z0Ieuig==
Received: from AS4P192CA0022.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::20)
 by DB8PR07MB6364.eurprd07.prod.outlook.com (2603:10a6:10:132::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 22:36:08 +0000
Received: from AM1PEPF000252E0.eurprd07.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::ec) by AS4P192CA0022.outlook.office365.com
 (2603:10a6:20b:5e1::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.16 via Frontend Transport; Wed,
 5 Mar 2025 22:36:08 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 131.228.2.29) smtp.mailfrom=nokia-bell-labs.com; dkim=none (message not
 signed) header.d=none;dmarc=temperror action=none
 header.from=nokia-bell-labs.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of nokia-bell-labs.com: DNS Timeout)
Received: from fihe3nok0735.emea.nsn-net.net (131.228.2.29) by
 AM1PEPF000252E0.mail.protection.outlook.com (10.167.16.58) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.15
 via Frontend Transport; Wed, 5 Mar 2025 22:36:06 +0000
Received: from sarah.nbl.nsn-rdnet.net (sarah.nbl.nsn-rdnet.net [10.0.73.150])
	by fihe3nok0735.emea.nsn-net.net (Postfix) with ESMTP id 89AD6205D6;
	Thu,  6 Mar 2025 00:36:05 +0200 (EET)
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
Subject: [PATCH v4 1/2] virtio-net: Fix ECN feature descritpion
Date: Wed,  5 Mar 2025 23:35:43 +0100
Message-Id: <20250305223544.85812-2-chia-yu.chang@nokia-bell-labs.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305223544.85812-1-chia-yu.chang@nokia-bell-labs.com>
References: <20250305223544.85812-1-chia-yu.chang@nokia-bell-labs.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252E0:EE_|DB8PR07MB6364:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d26ef37b-5947-4830-97d0-08dd5c361e85
X-LD-Processed: 5d471751-9675-428d-917b-70f44f9630b0,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|82310400026|376014|36860700013|7416014|1800799024|921020|13003099007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?bUjCUkOesgJLwPjD9eLdyAnskBdy8UF591BodbWyi5EgZ+svEGusovltx4df?=
 =?us-ascii?Q?YOLM0LHUc8V//BBR0vAvoh7qkhwpiJR3ov0H0APU6K2V3k44FYssOpUthLdL?=
 =?us-ascii?Q?RuVlkc/mQRnnVz8FWevYPCWtN6uZNXxcDhZlg20fNj0iID/TrVotwPTXeo/2?=
 =?us-ascii?Q?6vVw3CGc8nOgLM1xtUm0HqgCeaUdeivHZm0KN1BdPiCnY0rgUHloUjCHl3P6?=
 =?us-ascii?Q?UaZ6nWeDv0LUBCH5WSRp2OQgmyRCaarOda3uBeomP6DK/S4BKVTcy9EvV/nr?=
 =?us-ascii?Q?+yyiwhqRR4wbxV7x6U8xmanEYc8gQb+GdXhOXNfoqBVLHUYQmJEXdYrk+gT0?=
 =?us-ascii?Q?YtIHpwf6nrGQ32xGCnTkO4P++fEdgocC/3rrEoWFk+FoL15vAB2qV5pl1Yqm?=
 =?us-ascii?Q?YO7hyyr7Aff2jdrYT2n/FYEm11EeUAOKso/E78UyizzkhisHaFOyjzDPa8jb?=
 =?us-ascii?Q?rXJVGQYgWS2bZLqnowok+AU0zd4uUo1tAYvdarNCXrjwZQX7lZsX39+LP7Bt?=
 =?us-ascii?Q?4HQPAWRiTtwxSb+yXb3u2otegyGS6BDOYhOt+byRbfgi6ODqChrnNT0yh+xw?=
 =?us-ascii?Q?+XeAO+iWeeu0hnkwtrSITyUNRSJtIm4eToggUh95sW1zfLU4hPdNZizgLdpV?=
 =?us-ascii?Q?+h94cTi1d3UW2CePP/BwwU1vr/ybBSh1GG3TF62sFv4onIMZPM0IjRzMP27y?=
 =?us-ascii?Q?qqSebcuQFbNyvgKZJFM2rZpO4x6lTS3n8lWyO6YhNxbJ33JGjYCZ5ipMLW5s?=
 =?us-ascii?Q?6vKFfwPFl6T2PfBGkXtfM3J1/LkVGfKStmYMm0++v9xRGhkzJ1kdJuLHGeDj?=
 =?us-ascii?Q?XLKczuV+aHNgZOMgjsMBkeOe20zqxVetVmOOyJKWBolDy+0y2b+dI298UUNS?=
 =?us-ascii?Q?cGplFXU4mY+cKxKzTGIMOvNi3YfsEnZMXSySP9u2vCXg2CBNRENnXgmPmN0h?=
 =?us-ascii?Q?XpCdeSVX4WEW3xLGVx64bnwRBfvw+5E2Rw1ljR3qoLtvjMbYCyJN3js+Ps+C?=
 =?us-ascii?Q?djq1AzOUW0iSvuVcJpU+wPhojPmmMbRcnFF9SvkvWO0atQIxrTpH4fJdGul6?=
 =?us-ascii?Q?iH79M7K+9+PxyDsnbb6iz0mnqpcVqXjBXKzRqCzKzQBQUdpY3Yn30F3WYh4y?=
 =?us-ascii?Q?GcHGdY7ZNYINf8WDi6KO6zZ7WAn5y+Za+iksqiANkXXtGhmOQaO4hOhz10lW?=
 =?us-ascii?Q?1Ct7LvXxTHMc0McG+dtAxDVf9tCmq3y+Ba97omEsMnB4JA95LcXrBHB+cTD7?=
 =?us-ascii?Q?E9ANqTADvS1EPUkyC5jNSsEeFT6I9ZT3wuApkp3Hw/AxIEx1VbY3HMLHqkM5?=
 =?us-ascii?Q?nQkJ+yXUWv8YlojjuCN+WTeLei+D30qH4quI2sFKF/f8hjFMrQz7OzooOsRk?=
 =?us-ascii?Q?8/Bbbpa65wOgZmi88s0eKQdtvSJEbR8QS7UurbhGjsVx4hx6GrrzLFAR4Fu0?=
 =?us-ascii?Q?90ho+0DcAWaJbr5EI8+gbiKv1dNMO4GD?=
X-Forefront-Antispam-Report:
 CIP:131.228.2.29;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe3nok0735.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(7416014)(1800799024)(921020)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 22:36:06.5601
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d26ef37b-5947-4830-97d0-08dd5c361e85
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.29];Helo=[fihe3nok0735.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000252E0.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR07MB6364

From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

Clarify that the VIRTIO_NET_HDR_GSO_ECN gso_type flag does not mean that
TCP has IP-ECN set, instead it identifies TCP CWR flag is set and will be
cleared from the second segment. This is used to offload TCP CWR flag in a
way that is compatible with RFC3168 ECN but is problematic for non-RFC3168
use of CWR flag.

Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
---
 device-types/net/description.tex | 35 ++++++++++++++++++--------------
 introduction.tex                 |  3 +++
 2 files changed, 23 insertions(+), 15 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 8d30673..50b1372 100644
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
@@ -1105,9 +1110,9 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
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

