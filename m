Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011005.outbound.protection.outlook.com [40.107.130.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55ED2A945
	for <virtio-comment@lists.linux.dev>; Mon, 23 Jun 2025 08:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750666745; cv=fail; b=EnSLFdrIOl1NzwC1GzVeRrOsbhECquWNtqegeCraM9tet9desYRvhGtEJOrzp9XCPZfRn242XNLPXptPbKTVKGW5haEgIcjoWeGAvwlEqgLXUPFcNhZ++9kbZ71Qs3caLXDHwAFFDPEdfkrbP5FSv0ZZ7k8l0vP4obAkx9p/Lgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750666745; c=relaxed/simple;
	bh=5GQf3JDN40RxTr1Nr7W4/f2axtOsUfNxOROmMjOJNPE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qFPVjcFbg3udNdS2JgTVvBIbdam3zLTYReyTQPMZNWU++pVADRhmBbGdmxxQverXhNe3Rk5P/pmjrLwrE3xHMChXyGTWl5bPB0q2iJKLQZDH3GZl3XesKN3pvB9q0CNHS/d5ygZLiSjRxHlAmjW/80aa05yYegRN6kZKKGyyg04=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=EFYLuQFu; arc=fail smtp.client-ip=40.107.130.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="EFYLuQFu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SVs5wSXvhza3OnQyesbo245sJunPEzPjcuVyZO6IJHm7l/tKI8RkZ6dDSdiamrr54CHL3gRrqssTvEB9kDQU+6SAiv+uVOiKMqREfYHligQeeOnxET+Xz/psz22Lu+1/dgp9FPJZSCb1Hr7rtcB2h5/RlPzSw9MpjfxbeoNW9/LrUxnjUklAGQOXsC9MyoMexe+USDjEVsOTPRpM86m0B20aPTIZCO/R959ChOdKjzmnsPn6fR12NbobGrav3h34NIj2swt5Ci/xT86SjtYYO6R6HYoTgQvSrAZVf+Tr+garNRkWbeyzIH9QmQx55OheY8lcvfa55jXlswU0giEEOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zaE1rBIp2DZihweJxLXWAnuQWI2kxjO/Tc+hzRwetw0=;
 b=fzYWxG5yQLrjBZEA1Qfv1rWMUZCZ9nJiE3Na6QYPjeeglImL9O+PMjJ5urgoNoqKtrk4+LEbuBOPYau+piTbtUyOUP/61t7mQmJCevUqDqFcZYgwaUUIZjDlV6MxHE+aeaap2xkw9RoaNdNxvb+gHkZSwVquD8wo/lRI2Vp10Y7HIoya/x8wTCf/WAVYKgGr9mcJs/y1GgQYvaxZWqBbayn56/cquPe42yWXJn/MvRsf9WtMC/3E90OWr0d7fBh/w8LVZ0Ea+AB92MJV9WX48Yy71so7GXnH855mV7UQGbl7JgT+cKbQ8BofJuB8Z1zdE5ZvjAeEWoMFVch8wtLlTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.6.100) smtp.rcpttodomain=apple.com smtp.mailfrom=nokia-bell-labs.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nokia-bell-labs.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zaE1rBIp2DZihweJxLXWAnuQWI2kxjO/Tc+hzRwetw0=;
 b=EFYLuQFunHinLXg9wo0yCoYBd7I1VaTqqDJeIopl5VQnDI+NOSlKOhV4f8xzaJcXqDXmyGZ0klyZ8BCa4CBkk+4fo5NhOwAi1oXsVsp7OpEUMHOy8O3PabIOsA9HSjuv540lIzA7p6EcpVg8gNgqBkEs34PZDl39roVW0It5vDgcrrwqSNkh3gscszGG1Qo+BtchQttU5+pt6o8eNmUHfvNarCdV69SonQZJF9O1xlGr6HQ/7yDkqujv5xg6kpA5OfE8t+Im6QxGBuZrZJMfG8JM/3gDOk2x0B8PxVGdWQkU3/f1xPZ9Ru/XhucBMy+mwngBut7ykiFW6hRAe02ccQ==
Received: from DUZPR01CA0206.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::21) by DB9PR07MB7881.eurprd07.prod.outlook.com
 (2603:10a6:10:2a9::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 23 Jun
 2025 08:18:57 +0000
Received: from DU2PEPF00028D06.eurprd03.prod.outlook.com
 (2603:10a6:10:4b6:cafe::e9) by DUZPR01CA0206.outlook.office365.com
 (2603:10a6:10:4b6::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.29 via Frontend Transport; Mon,
 23 Jun 2025 08:18:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.6.100)
 smtp.mailfrom=nokia-bell-labs.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nokia-bell-labs.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia-bell-labs.com
 designates 131.228.6.100 as permitted sender)
 receiver=protection.outlook.com; client-ip=131.228.6.100;
 helo=fr711usmtp2.zeu.alcatel-lucent.com; pr=C
Received: from fr711usmtp2.zeu.alcatel-lucent.com (131.228.6.100) by
 DU2PEPF00028D06.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Mon, 23 Jun 2025 08:18:57 +0000
Received: from sarah.nbl.nsn-rdnet.net (sarah.nbl.nsn-rdnet.net [10.0.73.150])
	by fr711usmtp2.zeu.alcatel-lucent.com (Postfix) with ESMTP id 1FB27680034;
	Mon, 23 Jun 2025 11:18:56 +0300 (EEST)
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
Subject: [PATCH v9 RESEND 1/2] virtio-net: Fix ECN feature descriptions
Date: Mon, 23 Jun 2025 10:18:46 +0200
Message-Id: <20250623081847.21264-2-chia-yu.chang@nokia-bell-labs.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250623081847.21264-1-chia-yu.chang@nokia-bell-labs.com>
References: <20250623081847.21264-1-chia-yu.chang@nokia-bell-labs.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D06:EE_|DB9PR07MB7881:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 72d4b12b-613a-434e-79b1-08ddb22e99a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700013|921020|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?inmdEYCc6kDt/rsaob0yatV2Bt7n1rAlfDjBnzY3zaK8S9n3hexiYZYaKd+q?=
 =?us-ascii?Q?9+Y+eiExHuHaQ4Rdlx106KoD2ZVK75DlC3hk23pWP68NhvBoEmTmkHvvzGmS?=
 =?us-ascii?Q?89EIY2LynpH9puMAxX3lLNaZU+uzmRP3OM1El2GME8OeWVfnKfEeLQ+dllVl?=
 =?us-ascii?Q?03mbOGKgp681D+oPanqeq4v3/YymqyWq09sWEUBjdJsDoAFmc3FRcnD83c+Q?=
 =?us-ascii?Q?U95fc3O5JuhPTPGSslRl0pxrBZaaJ8fO0EPj3Ohnxd36X/BtIP5izo3IGbC8?=
 =?us-ascii?Q?SDkkZOskG3CiGO1GAY+zE5XRG58CHgqh9+Krenw2UoTA1xecIwSc1ez8soKA?=
 =?us-ascii?Q?cR0zLKSaodB94v65YV3fkBhxKSz5TJWk2JdnjHtLnnABaQJKKiFNK3Koo487?=
 =?us-ascii?Q?IClCX9dVYOnzctvcoPms7luNcR2YYjmWbPnsKtbaE1NNHXFUgdr3dJIOkOV9?=
 =?us-ascii?Q?RSG6Ow/T3FleOqmy6Sd24ENAGOXdgrd4BGMawqHXEYcISC+yeiMiHWHU22p8?=
 =?us-ascii?Q?9HUNXdYKAZ/+MKAWBp5XEbdHGeOFu4alrE49E6T6EcMdzCwBof0G2vpQmWgq?=
 =?us-ascii?Q?k12SUjiKLMiVA2JMNgW174F/oNGwSdhoeGWkhzKCIDEmQPHJkIf1JtpGPvLD?=
 =?us-ascii?Q?tuBpfe7f36sMBrOxWCDN42ROVnKBJGhyCN+9G40JAjZ1oxTY4j3G2zFUTI/y?=
 =?us-ascii?Q?aetSp6N0+VEWJz06mBCfQnG4VjPOTzGTGs4G1Mrjwa+wRCnquEAezfpuuuAF?=
 =?us-ascii?Q?tv6sptuBK1IbnPQZ2wB9BDgN1J56zHAUXAcP8frbyXKuDG7VEM2j9zxOP3bz?=
 =?us-ascii?Q?hlV4FoaavYHOBcFaNR61EW6zhRpgG0fZAF23mloC4Mfedt0XY6Wc3HftgT7/?=
 =?us-ascii?Q?MdPzxcM0QxGpnYQqJ6NTlb3/ZpucUpqbNAFg2/ECTPwZna9Fdh1/P8Ldi3Kk?=
 =?us-ascii?Q?g92krT3VmjFBr3XdlnbiMdjyhzvoL08HSiMoM8an3/HCJJeWCn7X7HRe/ep3?=
 =?us-ascii?Q?khYHjwkktLP/qOK2TS08Ijzx/GfkppPKsKK1PFAlYcVe7GBC+vz7Q2L7DSoy?=
 =?us-ascii?Q?2gdulW8RryAQjDJI08epQGBXZ319cjQxMPzWh5DywXJa/YrWDFZEETveEwfD?=
 =?us-ascii?Q?pFaU0kcPYRj/QHvPFxWDE2/WQN6FFY2O/LyFePTFlwuw5kjExNETufi/jSu0?=
 =?us-ascii?Q?Wod+z5SRXn8MD96YS56LCxD9NrYknMyIV0YiGnEYQYR8SB+RKQVFQPXmbEDp?=
 =?us-ascii?Q?IfWum++b9Rh/HMGevMMWtpwSe6sJQS1F8+K6X6qOyZkA2FUU9mKpaQ00C56f?=
 =?us-ascii?Q?OaHnMHRLFkVBdH69wRSA/Cf2+eWT98Fgr/ixlrcgXB2Va4IBeRj2xDuiC4PV?=
 =?us-ascii?Q?QVL3BdTTTJTy8hw2nmSaHALvkNPbGm2s1IUQpe83A5nQE5wyzQki8h4kJ+/1?=
 =?us-ascii?Q?IUecckzCF+IoICHNK5Hy7sGbAYcdq9uzJLoHZzxCTUynfLOg6cWEPvCTGhY3?=
 =?us-ascii?Q?oBy2df4w0wL4NZtg7evcM+goUS3UThpWTCvWvmLk8qoOsML6PDEqKW1UHQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:131.228.6.100;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fr711usmtp2.zeu.alcatel-lucent.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013)(921020)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 08:18:57.1486
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72d4b12b-613a-434e-79b1-08ddb22e99a6
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.6.100];Helo=[fr711usmtp2.zeu.alcatel-lucent.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D06.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR07MB7881

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
index 415c7fd..bba50ff 100644
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
 
@@ -729,9 +733,10 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
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
@@ -828,10 +833,9 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
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
@@ -1168,9 +1172,9 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
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
@@ -1273,10 +1277,9 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in \field{flags}.
 
 The device SHOULD NOT send to the driver TCP packets requiring segmentation offload
-which have the Explicit Congestion Notification bit set, unless the
-VIRTIO_NET_F_GUEST_ECN feature is negotiated, in which case the
-device MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
-\field{gso_type}.
+which need to follow the CWR flag requirements described in ``Section 6.1.2. The TCP Sender''
+of \hyperref[intro:rfc3168]{[RFC3168]}, unless the VIRTIO_NET_F_GUEST_ECN feature is
+negotiated, in which case the device MUST set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
 
 If VIRTIO_NET_F_OUT_NET_HEADER has been negotiated, the device MAY
 set the \field{outer_nh_offset} to nonzero value to indicate outer network header offset,
diff --git a/introduction.tex b/introduction.tex
index 80aa67a..1c4cb33 100644
--- a/introduction.tex
+++ b/introduction.tex
@@ -180,6 +180,9 @@ \section{Normative References}\label{sec:Normative References}
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

