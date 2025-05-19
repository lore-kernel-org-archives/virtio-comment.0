Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2078.outbound.protection.outlook.com [40.107.105.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0709E283CBA
	for <virtio-comment@lists.linux.dev>; Mon, 19 May 2025 13:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747662285; cv=fail; b=DYh/LdwubJrfRSQvrP1TTYApe1UajEUIe/EH98aMH+t5YWOIIxOlx5KIhBUcXnVnzXZf3ZEzJSTeG2dkPx3W+I5ZyZ1dCAqcSSew2DRSGviTrzWmBnvwfGcvFUXLQccdiCckKXnZAmbs+XIjAxcoOzyyOJ6oaXysCau2xcu5FrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747662285; c=relaxed/simple;
	bh=6zPTIDwgDmcY2lJSuSyrxgt+jFoNiNB2GJNg+xUC5ic=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PO8GBL5u1A0WLrDtfQlp34ipTlnNtXjme/jVdtxRqiiiXRca/sIYrCaoU/PF1ULL8i70RkHOznZBFoKrDgcGgH0UGp48KEuy3nYQu9a//a8xIQamf0O9nVY9wnI0y+66azX1FrM55//Xt/tfcfqSjYqQ6j0GJ0ct3zv9a0BqKQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=aayT5bnF; arc=fail smtp.client-ip=40.107.105.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="aayT5bnF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ut0v7OweM0ieW7zYiwAzCiEqV5+S4W1hv7HX5AchsWYmpqN+irNcVmboStbhaKKpKtaQilE/NQyD93VH0KQ0/KlNi11xm5Hua2iprDEViaGXqWD9hrWHko9M7KNeTNCi2QvG8LfK5L6c72e/34bDVljfIc5kLhUZNfwdBX27JCjxWlz8Sh0fG5PXTS6nQj6cXhlzd9uDXEJ818a267VvFmPqZLKWJNRvcn6GsiKlXTVcSuxhBQp+I4VN90RgbhIvHi4VSVmEhdZJYGCvx/4tDPFU+S3er5EObCjR77pV3b4W0iVx3js78P2khLJ+DoZHQqDfODWjVjlvxiw4JjX4QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RV9mjydsfiuDqCVSPPUSTYyngjB25XxmMVLXbuffZ7w=;
 b=zIGQviSpCJsiMhFxv6EwEzKQqCsbmnlMSndgRMpOo7tfRsXD9oPyNUiamqej/YmfGTHQY6cyboqfmKfHKs8u9cyStNM18JZnkLlB+gAEXiih5hfc2qUsKGDtohevSLZY79x1KlijFI0nx0XCZAIYmnYfvkR8/VV9sD4Fui4D8SAt+XncSXSLIQfRcF22sFGmFUDMeNz9nANQY485aili7ghT+UCi46z0tUWN7lcb+5iCqtqryeES9yd8DD8BDKK/0NXF6Jg6WKmx62UalFAlheA5+UA6hsgl8v/GNSy2YLaavTjjRp/KKavxUmFegzKPLZvbUTpxmEY/E7LP8eGv6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 131.228.6.101) smtp.rcpttodomain=nokia-bell-labs.com
 smtp.mailfrom=nokia-bell-labs.com; dmarc=temperror action=none
 header.from=nokia-bell-labs.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RV9mjydsfiuDqCVSPPUSTYyngjB25XxmMVLXbuffZ7w=;
 b=aayT5bnFpKzlo97K6FNTW6JEAKzqMRs+om1t1L+BPrkrY8tm7PFrO7Ai32vJC9I81WDr+CkYovabPX7tlqWUDqye/3yrClXe21Tvr3YpiT1W2ORebtlD157b1x6kiuqj7MWHGGcLUv/actUhwH099mzdHtP3ISQaFBlIlIWAjelITmXRgYRVeeO9/5CpWTr4YVcqE2WXYvwM3H0yTxo1soil46y1Deaxg1ploG5tgboqHNHh91xP+Cgv13jRvWFRoVz1kAmg+LvpU8aQ5nDyY8hM6bBq9p7TcExQdt8aMWv5j5qSxDT8hvjvb+YAWCVubPLZY3EAdDDx7nkW1+agAQ==
Received: from AS9PR06CA0737.eurprd06.prod.outlook.com (2603:10a6:20b:487::13)
 by AM8PR07MB8122.eurprd07.prod.outlook.com (2603:10a6:20b:36d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 13:44:39 +0000
Received: from AMS0EPF000001B6.eurprd05.prod.outlook.com
 (2603:10a6:20b:487:cafe::c8) by AS9PR06CA0737.outlook.office365.com
 (2603:10a6:20b:487::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.29 via Frontend Transport; Mon,
 19 May 2025 13:44:39 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 131.228.6.101) smtp.mailfrom=nokia-bell-labs.com; dkim=none (message not
 signed) header.d=none;dmarc=temperror action=none
 header.from=nokia-bell-labs.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of nokia-bell-labs.com: DNS Timeout)
Received: from fr712usmtp1.zeu.alcatel-lucent.com (131.228.6.101) by
 AMS0EPF000001B6.mail.protection.outlook.com (10.167.16.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.18 via Frontend Transport; Mon, 19 May 2025 13:44:38 +0000
Received: from sarah.nbl.nsn-rdnet.net (sarah.nbl.nsn-rdnet.net [10.0.73.150])
	by fr712usmtp1.zeu.alcatel-lucent.com (GMO) with ESMTP id 54JDiXAg011659;
	Mon, 19 May 2025 13:44:37 GMT
From: chia-yu.chang@nokia-bell-labs.com
To: virtio-comment@lists.linux.dev, mst@redhat.com, cohuck@redhat.com,
        mvaralar@redhat.com, jasowang@redhat.com, xuanzhuo@linux.alibaba.com,
        eperezma@redhat.com, ij@kernel.org, ncardwell@google.com,
        koen.de_schepper@nokia-bell-labs.com, g.white@cablelabs.com,
        vidhi_goel@apple.com, ingemar.s.johansson@ericsson.com,
        mirja.kuehlewind@ericsson.com
Cc: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
Subject: [PATCH v9 1/2] virtio-net: Fix ECN feature descriptions
Date: Mon, 19 May 2025 15:44:31 +0200
Message-Id: <20250519134432.27406-2-chia-yu.chang@nokia-bell-labs.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250519134432.27406-1-chia-yu.chang@nokia-bell-labs.com>
References: <20250519134432.27406-1-chia-yu.chang@nokia-bell-labs.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B6:EE_|AM8PR07MB8122:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0259408d-c4c4-4042-eae8-08dd96db4cab
X-LD-Processed: 5d471751-9675-428d-917b-70f44f9630b0,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|36860700013|376014|7416014|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?0s4lqV7qluXGEPlFP58NJDJWymd05xgABIHUeY5qhWT7c+qUHcvEBvk+7z3O?=
 =?us-ascii?Q?Rj5rfDiBuYvWcwcXRlsFb0Vu4SqNNzbDJuHnHm+ZPaDwMCjm97ykTpFGze/p?=
 =?us-ascii?Q?CmlANNMjHkXAvSpyb3ywzl676l+PNkMJrfJhTQ8jhPSpy3/28MPzsv+RdS4k?=
 =?us-ascii?Q?+riap88Dyi8x4YYRzXwJmqgL2kCROpy3FLOVsgxN8HCpHw1mXczvXb0EQ5pS?=
 =?us-ascii?Q?EjmTh25210Qp2KgTNHa/hrZ59C/2JT5WQ3Sv+luSnfVoGbAOTu/GSiTTYMJv?=
 =?us-ascii?Q?tm5Sp81NtZTRYn8imBkhfZ8ciL0R66BdCEoPDD1nolvHwlKOLbvogNolqSAd?=
 =?us-ascii?Q?TSoGaVOgubsE/R2d8Jk/1l6quQoA07jXESrWOCAqlk5PS+zdDp/DEjaCsahm?=
 =?us-ascii?Q?pFWnuRTqeaUVdGK3jlYxEdLn4qX4Yhlqbjv5YX81WasuKNiU+doUtfZRxBy5?=
 =?us-ascii?Q?MVbsqcigpjJSlkHQzLqTawe2tkBIV3PwP4bXFUERv/X7zr+mbvpiuV15tLDJ?=
 =?us-ascii?Q?b7+cu/+2sLB3bpiUtviAuUDuL20IzPFTtlbYXJFCBSRVN4ZDJb/tHda11S7I?=
 =?us-ascii?Q?GMBGtgWZCL/oYsXDV99ASroNE/AiIbvRW+gFF/twU1/DRz7aUt01YhfUF+V5?=
 =?us-ascii?Q?aHT9cEIb/UKd+YUFw9yRX037e0RBQMT9j9s4IDcgDkmDU9P0s0BBlSrYl8j2?=
 =?us-ascii?Q?W6MjvoEIeT7SLpJfER8mxZvVMbnICWORqWRI2xJ3Z02KYYR8waSDuLlVuAfG?=
 =?us-ascii?Q?N8KYa1AF6ycBfZwr0kOUukUgrgLUY8DnBFHAXzUMsvRAArGzyrqHHvYCaIDs?=
 =?us-ascii?Q?3JNHnL3yR7ORZ7Wl+lxNkNZKJMMNGaywq+CjpBur6lDGWlOIaTEGPHpw0Mng?=
 =?us-ascii?Q?ryp/aeB7tSWU0uUb4qGaNY5z9BCPuuAxmnP9f6x2juYN9Y544shbDlUJLHme?=
 =?us-ascii?Q?diohrHYzwFtaRI7RVFtkjui2s33bKlwW0Qy7/gvhx7O2+yIp8nTCz9uH02b8?=
 =?us-ascii?Q?gl00M/1fF1FlaTJWd750g/nhzO6iv7hVVYJzoaqXmAFJcmZLDIBBkCSv0hgO?=
 =?us-ascii?Q?sisFqfgSDHMLLL6zd91+SVZsomeoEdrUIPRQE+OfeP690CqbxFeTmMJ1mDuC?=
 =?us-ascii?Q?gPEZB5UXf5HpixL0fr3rCca+/e9Y5YFWHe3wOvfZlcPK7xfuwq+UDqx/xqb1?=
 =?us-ascii?Q?Bj+r22vklKuxmv6iexjRKJFjBbpnqvPFIRYp+mcYEy6ac+PEwwGBA7VxOvgR?=
 =?us-ascii?Q?onZRkhrxl30kuoqtEBptj4TaU7yO2o93ruzdAYx6778Nl0rYHm0UQulgeiMv?=
 =?us-ascii?Q?MUFBInk4XAACaBvwWq8LNsMP+NoAOH7zlD/34LDT9xtAbULm9vhn1qoOlYlG?=
 =?us-ascii?Q?lU8y+2WrwUmh2+MBTyOqnMEjXetZ/juxhe5Hb/Wo9OfHIn0i9k4pCs4diGcF?=
 =?us-ascii?Q?cA2jpUGRYt+GJo0b1brPb/BhdZtNorCWbep269Rm1KG8jfApLg6xFg2YlKa4?=
 =?us-ascii?Q?Upc/fLkmZMzbJTc=3D?=
X-Forefront-Antispam-Report:
 CIP:131.228.6.101;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fr712usmtp1.zeu.alcatel-lucent.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 13:44:38.3349
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0259408d-c4c4-4042-eae8-08dd96db4cab
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.6.101];Helo=[fr712usmtp1.zeu.alcatel-lucent.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001B6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR07MB8122

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
 device-types/net/description.tex | 35 +++++++++++++++++---------------
 introduction.tex                 |  3 +++
 2 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 1b6b54d..931b80b 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -54,7 +54,9 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
 
 \item[VIRTIO_NET_F_GUEST_TSO6 (8)] Driver can receive TSOv6.
 
-\item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with ECN.
+\item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with the CWR flag set
+    and follow the requirements of the CWR bit described in
+    ``Section 6.1.2. The TCP Sender'' of \hyperref[intro:rfc3168]{[RFC3168]}.
 
 \item[VIRTIO_NET_F_GUEST_UFO (10)] Driver can receive UFO.
 
@@ -62,7 +64,9 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
 
 \item[VIRTIO_NET_F_HOST_TSO6 (12)] Device can receive TSOv6.
 
-\item[VIRTIO_NET_F_HOST_ECN (13)] Device can receive TSO with ECN.
+\item[VIRTIO_NET_F_HOST_ECN (13)] Device can receive TSO with the CWR flag set
+    and follow the requirements of the CWR bit described in
+    ``Section 6.1.2. The TCP Sender'' of \hyperref[intro:rfc3168]{[RFC3168]}.
 
 \item[VIRTIO_NET_F_HOST_UFO (14)] Device can receive UFO.
 
@@ -694,9 +698,10 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
     header (ie. MSS).
 
   \item If the driver negotiated the VIRTIO_NET_F_HOST_ECN feature,
-    the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}
-    indicates that the TCP packet has the ECN bit set\footnote{This case is not handled by some older hardware, so is called out
-specifically in the protocol.}.
+    the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type} indicates that the TCP packet
+    has the CWR flag set and follows the requirements of the CWR flag described in
+    ``Section 6.1.2. The TCP Sender'' of \hyperref[intro:rfc3168]{[RFC3168]}.
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
+which need to follow the CWR flag requirements described in ``Section 6.1.2. The TCP Sender''
+of \hyperref[intro:rfc3168]{[RFC3168]}, unless the VIRTIO_NET_F_HOST_ECN feature is
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
+which need to follow the CWR flag requirements described in ``Section 6.1.2. The TCP Sender''
+of \hyperref[intro:rfc3168]{[RFC3168]}, unless the VIRTIO_NET_F_GUEST_ECN feature is
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

