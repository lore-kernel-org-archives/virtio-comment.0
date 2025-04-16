Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011023.outbound.protection.outlook.com [52.101.65.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833F717B50F
	for <virtio-comment@lists.linux.dev>; Wed, 16 Apr 2025 15:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744818759; cv=fail; b=oAcOd0dydGuF0ZPeUIUE/Z94ZC4Onxtzpl3xOsAP3rCp1+YICo/IwIq5PvRxSk+dQV2oCvYFnpopa47plTZfdnPwsAOclC4ASspBValNySlJCy/cAR/xWWuVhjWvhxg23xgIAIGrLo0pq5CLOX07yL2zDeELinKcBlaXQkjUT1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744818759; c=relaxed/simple;
	bh=DtF733RKBdTeBAAwsOdVm9CJA85qa+3cfqwh3lxonK4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FCBHnrJKBiWfZi+Dj2NTM27O0PG20N5cSgJERQugzeS07IpnvGYLVrLQOQTzgKKMLePpk8UiVM2UdsKa3Qg8Dg2OIOYOAERfbPjhs5leMTCkN7hnW7leIY0jyYeH0/Yd5Zm+1WKyts+69YgviFScq/6rz+dm8YK3mXxUENsu4v0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=DbmBhpfa; arc=fail smtp.client-ip=52.101.65.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="DbmBhpfa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B8thKfVZ5Jn56d+0m34mnVbhZzCDDuDPzMjZ6/GnSWsbK53TeYAZAHE4a0eGBh/nBGREHpwgiYdwdpBtH6Rs0hbX19et6uAo3jmWTj4HQ6pcvLMrRaoF90e9z+A+IGkSkPOsCb+rtHiq70J5JjQmXp+F19FB40AkKT95ODeSXwbEYZxDbqKxgkuHuLK9Pum6Sz/Oj+KqyJYvGbw832HWmKKTy0fBtO3eAbmq9DVflXbWPAfYlhQo+QtpIgFMRtaKyj9WQlzh0kvU5VHtgVHu4revFoVYNdoXHbDXaokCRNiuB+hX9zkuakLsFGpIZEjZdG0gHcDGmXGSVdzoxgdZVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nZv9WaFgy00VN0h4aueR1bWOnLJFPFAF38KhSyMC7Os=;
 b=lceEVTHkp+AT36C5DL+NQ7e8MykMAT4isPvye45y0wU+0zPsUP3tIY5ijBfjNmyUHRhBB8xAf8OMgvlZEcSiJjh/Pe7HDN/3EcaaIVmzXW06bFLdEQShVe4AkiRjvOWSCzKPTS+gk7eUsm4hUu7F/ST5V0Iiy9pLXzdGa2fcYKyvvC3xlXJOTG9s8OVy20TduQiIxsOdbyxYB3RsI+d3BDy9KjWFI2UFrIXhsoSOKEEIv7NYKst6QxvbD2qc8+OWfY2AJSFHvv+I5qePOKy/m1tcWgvOd6Wt3nbO2f08k5LwRO824ajFrlSpUDOtgxaCbj+aoNar7ifWM+I6eYDA1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 131.228.2.29) smtp.rcpttodomain=apple.com
 smtp.mailfrom=nokia-bell-labs.com; dmarc=temperror action=none
 header.from=nokia-bell-labs.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZv9WaFgy00VN0h4aueR1bWOnLJFPFAF38KhSyMC7Os=;
 b=DbmBhpfahqhq8OizOCwd9ndnPRLJ/dPwE3ALHYqimq9PJBv5S95feRd5DrlUq7vMesMxM4D6+Jk9Guk8BOuhWsL9IsuHadK2PKQDh7pZueXAJMjrAXwCEHbZhEhbnO8eOR6Ai0pOojL8/tFiqtK7Gu9vrsoKzzymxMVSWdtorwOsgJKCLWE0dVBo93bSEbCL4/6ZjA5um6DwTXX73vouy22Dc1GOhrBNlpMaN4SckfNPTtlTYQ/N/LlUNrIuqI+MmOfNf/qYvNZpK7S20aQYdkhui0xz1fyIwwZbpG0o+d9q7DVv+G7AEApJ8tJF2kIbEA/1p0pyGJb6+9hh2vq1WQ==
Received: from DB8PR06CA0020.eurprd06.prod.outlook.com (2603:10a6:10:100::33)
 by AS8PR07MB7095.eurprd07.prod.outlook.com (2603:10a6:20b:257::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Wed, 16 Apr
 2025 15:52:33 +0000
Received: from DU6PEPF0000A7E0.eurprd02.prod.outlook.com
 (2603:10a6:10:100:cafe::3) by DB8PR06CA0020.outlook.office365.com
 (2603:10a6:10:100::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.22 via Frontend Transport; Wed,
 16 Apr 2025 15:52:33 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 131.228.2.29) smtp.mailfrom=nokia-bell-labs.com; dkim=none (message not
 signed) header.d=none;dmarc=temperror action=none
 header.from=nokia-bell-labs.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of nokia-bell-labs.com: DNS Timeout)
Received: from fihe3nok0735.emea.nsn-net.net (131.228.2.29) by
 DU6PEPF0000A7E0.mail.protection.outlook.com (10.167.8.39) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12 via
 Frontend Transport; Wed, 16 Apr 2025 15:52:32 +0000
Received: from sarah.nbl.nsn-rdnet.net (sarah.nbl.nsn-rdnet.net [10.0.73.150])
	by fihe3nok0735.emea.nsn-net.net (Postfix) with ESMTP id 5E7DB20174;
	Wed, 16 Apr 2025 18:52:31 +0300 (EEST)
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
Subject: [PATCH v1 1/1] virtio-net: Fix ECN feature descritpion
Date: Wed, 16 Apr 2025 17:52:23 +0200
Message-Id: <20250416155223.16422-2-chia-yu.chang@nokia-bell-labs.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250416155223.16422-1-chia-yu.chang@nokia-bell-labs.com>
References: <20250416155223.16422-1-chia-yu.chang@nokia-bell-labs.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E0:EE_|AS8PR07MB7095:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 68a8359d-d350-416d-e9c7-08dd7cfeb310
X-LD-Processed: 5d471751-9675-428d-917b-70f44f9630b0,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|36860700013|7416014|82310400026|376014|921020|13003099007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?YhdIzGzQLbGZNpW1zPl0O5suBtcI1EKVFhNFgvRSxVuUtKqCRAdaUgjU68rG?=
 =?us-ascii?Q?yoN7Vu0KMBlej1awTTBRFHyXC16M4SqhBaXbS2Yxm4USj/8Dh7j6IevEWFIJ?=
 =?us-ascii?Q?9NToCbQ0sez9cGM6bBYOLiEy8paF7klULTMh/r7yliyiu7s0mD1ixKDoLhBh?=
 =?us-ascii?Q?cnbRjeSvhC81glQ4FTTVSI4b7UOVutMiMXOVzPH9VJQZLjAWx9RqpinTHRC3?=
 =?us-ascii?Q?E1ZeLuExc4OkSleTlRvtkFLiDQNHVtNxNDIwl9P0hMduw/BoKhX49FFK1xyB?=
 =?us-ascii?Q?WY+00dxMXwz0Nx9rHFisqSdW7MGlZSSL7CjFulDLKSZCZ6k/t96REevsOYll?=
 =?us-ascii?Q?6qnaqLa3gofHUzez4+mlso1LMT/x36N66pt0t67p/rp7Y8gFglLSHN6bBCUC?=
 =?us-ascii?Q?1R9eyyC4wrRpxp8bNptAV+eaqSkk/zaaaxIaNtw7YJlPj1zDZXkMN2QeY3+z?=
 =?us-ascii?Q?wkO0gZNoPbusLf6hEVnZGMyRQhl7wpLuXi9LESGGBOcNrcTjLj3ljVzfA6Tm?=
 =?us-ascii?Q?ID4X00M0PkVJSfwdwzDW0e7EUNudUIGM8/IYj+AJE4w/2vvQou9dlHnlq8FQ?=
 =?us-ascii?Q?Xo+ebEwUboYqzVhVvz3zZ9Mi/njoN31MbH17c03x/oiWqkUwd/+owTU2/yDn?=
 =?us-ascii?Q?DXuPtuU6duAbZCQhooay4fOn9jThY6qQgOTSu+2NCobO/PeH/Qimc8wWyqsI?=
 =?us-ascii?Q?1WzOA9zcu7ZE4CdB/6DG4KnCYbDFxi2Lkc7tNoQa+NQaCynz/Grm9iss5KMV?=
 =?us-ascii?Q?3ILFaYIIuGEEIIK8MS5tRKc7BNRAdr8RTup4NE5VrWe6YB80M7IqynRmg246?=
 =?us-ascii?Q?G9FP8Vxj/2t0hyRQ4RgHSnnbRoFpgl5jCYOkMyVBmEHn5y5BYIv28BoQzMdj?=
 =?us-ascii?Q?s1evy4A8M1VxQO5u3XF+qrEteN5C3GODJ24TMYGd2EctOyvsG2B1UlxXl68U?=
 =?us-ascii?Q?Ml9xvAgL4lGjEdujzZezLdrYkLMX4QLyhKrCfSFnran08Z5qf8R1nBWW5Lr/?=
 =?us-ascii?Q?SeUs0ouiHJaTNsdpz671mdx9LyjsyRMAan5DpXFviqURoV06QmIfIMF75dWe?=
 =?us-ascii?Q?9Ak0jGZSJ7uO9HvCZG4QssluXH7nO6krhm9QMseFh6zgzcAqsvhnjYfE1LyL?=
 =?us-ascii?Q?YQKnvrjffd7NQ2INGytRlEwnldCO//L4g0ZPXmFcSFRN1+i0MHZhA89ftceg?=
 =?us-ascii?Q?GcAIdXEra3swoDP/iXw6gFL8b4juhFex+cQrdbToD/8RFtkqBGKfR81kxZ7o?=
 =?us-ascii?Q?gkWIRY9nCrsx3k0j9L/ZLWSDox318oZtIFNugUxJqsKgQEPvKBTPVAb3Nfh+?=
 =?us-ascii?Q?G5Q1tmKlbRiQ84TkSRCbs9KmAClVzLeDkQDZlZLlLa2rZWJJy5g0MpNnMWkb?=
 =?us-ascii?Q?iXpV3JZZyepAQ37GTp66+0p9kO+b8JLy2Xh79mO8xBB9WsBqk6Y3HZtLqmoI?=
 =?us-ascii?Q?quCAhAXL6ha3YgIpNnrNG3Jay6ED2oHMzCg5xwgZ7agqOZAM3fxq5osbVUiy?=
 =?us-ascii?Q?77IP7QefNm77F2gI8DNedPl5C3L/tae9Xl0MrJ1Z2jUCE462eSuN2sFogQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:131.228.2.29;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe3nok0735.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(82310400026)(376014)(921020)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 15:52:32.3152
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68a8359d-d350-416d-e9c7-08dd7cfeb310
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.29];Helo=[fihe3nok0735.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7E0.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB7095

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
index 4494633..f15b74a 100644
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
 
@@ -512,8 +516,9 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 
   \item If the driver negotiated the VIRTIO_NET_F_HOST_ECN feature,
     the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}
-    indicates that the TCP packet has the ECN bit set\footnote{This case is not handled by some older hardware, so is called out
-specifically in the protocol.}.
+    indicates that the TCP packet has TCP CWR flag set and the flag will be handled differently to all segements of
+    an aggregated segment, as mentioned in \hyperref[intro:rfc3168]{[RFC3168]}
+    \footnote{This case is not handled by some older hardware, so is called out specifically in the protocol.}.
    \end{itemize}
 
 \item \field{num_buffers} is set to zero.  This field is unused on transmitted packets.
@@ -555,10 +560,9 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 \field{gso_type} to VIRTIO_NET_HDR_GSO_UDP_L4.
 
 The driver SHOULD NOT send to the device TCP packets requiring segmentation offload
-which have the Explicit Congestion Notification bit set, unless the
-VIRTIO_NET_F_HOST_ECN feature is negotiated, in which case the
-driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
-\field{gso_type}.
+which have the TCP CWR flag set and require the flag be handled as mentioned in
+\hyperref[intro:rfc3168]{[RFC3168]}, unless the VIRTIO_NET_F_HOST_ECN feature is
+negotiated, in which case the driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
 
 If the VIRTIO_NET_F_CSUM feature has been negotiated, the
 driver MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
@@ -748,9 +752,9 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 \end{enumerate}
 
 Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP and ECN
-features enable receive checksum, large receive offload and ECN
-support which are the input equivalents of the transmit checksum,
-transmit segmentation offloading and ECN features, as described
+features enable receive checksum, large receive offload and RFC3168
+ECN support which are the input equivalents of the transmit checksum,
+transmit segmentation offloading and RFC3168 ECN features, as described
 in \ref{sec:Device Types / Network Device / Device Operation /
 Packet Transmission}:
 \begin{enumerate}
@@ -821,10 +825,9 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 the device MUST NOT set \field{gso_type} to VIRTIO_NET_HDR_GSO_UDP_L4.
 
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
index 44c4ca4..8b79cba 100644
--- a/introduction.tex
+++ b/introduction.tex
@@ -145,6 +145,9 @@ \section{Normative References}\label{sec:Normative References}
     Leiba, B., "Ambiguity of Uppercase vs Lowercase in RFC 2119 Key Words", BCP
     14, RFC 8174, DOI 10.17487/RFC8174, May 2017
         \newline\url{http://www.ietf.org/rfc/rfc8174.txt}\\
+        \phantomsection\label{intro:rfc3168}\textbf{[RFC3168]} &
+    S. Floyd., ``The Addition of Explicit Congestion Notification (ECN) to IP'', September 2001.
+        \newline\url{http://www.ietf.org/rfc/rfc3168.txt}\\
 \end{longtable}
 
 \section{Non-Normative References}
-- 
2.34.1

