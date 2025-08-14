Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013039.outbound.protection.outlook.com [40.107.159.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59659212575
	for <virtio-comment@lists.linux.dev>; Thu, 14 Aug 2025 12:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755172893; cv=fail; b=iS2TTQtyipaDkSpHNbgIcBEO6TO02MOcSftf+uthRo8EDM7Td2Q8obFBLR27+0Cfc2/9st9laU+lVXY4HaHm4jkjiYGOPqzeSq8QQNbqwawtFsMhCKinKleWeMf3hNI8phNMF2oBvm28+c7qBhViJqCtC70RvXVTIxzU93jQGWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755172893; c=relaxed/simple;
	bh=NPUb9Dzb8flYkWRPN3rxdKathBMd1sFY2DRapHZfti4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NmHYIuuuhORmeWccAYhdaV0ADzx6gnLSoNE+I3sYMUTtByJmYSTZ4HVoWsqepwI5UKdfbjJgczfJ2shz6LAjaxUEB2dwkvkQwi1pfjsqnvttYHT+DzZ3jqALt8TzKMXhNHvfv2frkn7Bl7Wxl/HFD58fSXbLeYmpxtO652QgIec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=KU8Qs3I0; arc=fail smtp.client-ip=40.107.159.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="KU8Qs3I0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OKMzUqh596ZT2ZIgV1Jdiugpr7Af5i3a2LbYKIPc7t2xZL6GgFiF1YkKh0ULh27jX0y27QUq9gCH27e/RqbDSVtYHtBbARSfPtgJsHo0IyLYmpnTefr7yXevieHMPAfripont3t243uLitieV1iOVIkoTs6k2Ol2jIicvlXlvFdoYz6dhgzRr/8OzsKZ8cTg+DtVXO9lAjbRYd+EDlWV9nVgxF7HJzbu51iuxFRutDoqKaNt/diM79F7gpY2tN51UDXPCuRvkoRJIa+iaix5T2W44lyAY7l7icmb+fsSdAuHY2GahB9wzD26AMzMKrzVUPshbyyp4oznEsakhe8ulA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eWCs+Z/vYjr/vHeYD+TIwDUEtHiL1B3SPy19Vs3/sC4=;
 b=v3QB6VFkWfqTSq9h+kBvmhSxfiyaCa5ydY4jy6MWzt9c94BrxN/ZyCpjm3M14hat2LQ3bOs00bm5m6qK4e3fcVhZTA8UNXB523FByxQG2OZ0tirZBhSijURNJY9zXhOBqJLyz1vRtsDiE0VGGA3fFpnOgvG0/KtT1Y5OQr/+XA1fgnE9KpVfcsNP4K4H9C8lfE51sO/S9fIyNMZT3rLVMqA/46d0eYmuaF19a5UyWsu+FIlwi+zFV75PCwMVf5yzLdzGFr04rUTR0hz4MlPVq6Iowa9waBMqxSJX7pKmoIEq9hvnOc7eqxA153p3a/pRrK9R766dx+ze1xB4ntuUVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.6.101) smtp.rcpttodomain=apple.com smtp.mailfrom=nokia-bell-labs.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nokia-bell-labs.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eWCs+Z/vYjr/vHeYD+TIwDUEtHiL1B3SPy19Vs3/sC4=;
 b=KU8Qs3I07cbu5herTmrG8urVgw79uBy9lly8qb7+gmlZyFQZNxBQHc5aMQG3L7mM3vOjcajHkHS7LavJLzTYGnbakp2P/lnmS1Xzgs+mL5wcyYImHom9WUJKJzkZwBOpsYuw0mLvXMEw2qIZz6jLm/ghZJ6jB/Oq48spnm9/mri7MsxcOgapNEDBdpl0+jNRLyQwAsYWan5Pq9R+2kR1OMLVhopU11dl771X4E/etcR/dm1q5MDqmo45W6hNi63ofnsp9UAPrloAPzEKQDb9qyuwfhSmyCJSD3AM6y6znUGHoT+cmk23y7NFt0Z+F7kcYVrZWLqqfnT9K/In9IzZ9Q==
Received: from AS4P190CA0045.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d1::16)
 by AM8PR07MB7617.eurprd07.prod.outlook.com (2603:10a6:20b:236::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Thu, 14 Aug
 2025 12:01:26 +0000
Received: from AMS1EPF00000049.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d1:cafe::11) by AS4P190CA0045.outlook.office365.com
 (2603:10a6:20b:5d1::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.17 via Frontend Transport; Thu,
 14 Aug 2025 12:01:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.6.101)
 smtp.mailfrom=nokia-bell-labs.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nokia-bell-labs.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia-bell-labs.com
 designates 131.228.6.101 as permitted sender)
 receiver=protection.outlook.com; client-ip=131.228.6.101;
 helo=fr712usmtp1.zeu.alcatel-lucent.com; pr=C
Received: from fr712usmtp1.zeu.alcatel-lucent.com (131.228.6.101) by
 AMS1EPF00000049.mail.protection.outlook.com (10.167.16.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.11
 via Frontend Transport; Thu, 14 Aug 2025 12:01:26 +0000
Received: from sarah.nbl.nsn-rdnet.net (sarah.nbl.nsn-rdnet.net [10.0.73.150])
	by fr712usmtp1.zeu.alcatel-lucent.com (Postfix) with ESMTP id 2D5941C0010;
	Thu, 14 Aug 2025 15:01:25 +0300 (EEST)
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
Subject: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
Date: Thu, 14 Aug 2025 14:01:17 +0200
Message-Id: <20250814120118.81787-2-chia-yu.chang@nokia-bell-labs.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250814120118.81787-1-chia-yu.chang@nokia-bell-labs.com>
References: <20250814120118.81787-1-chia-yu.chang@nokia-bell-labs.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000049:EE_|AM8PR07MB7617:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 67bdac90-75d5-4d59-8216-08dddb2a4bc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700013|82310400026|376014|1800799024|921020|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Eb0AtJYi67MJQVVjRhyuaQkvRet1MhvKg3wxbewKc0SjP84PsyL2mx9+3z6q?=
 =?us-ascii?Q?o9KERoMGe7aTRgGAIWX9QvCx3HQzz1JvoABr9EExS3C9T5IvwKibcztu0BKf?=
 =?us-ascii?Q?057KU0C0gLs7pcenp+B+4GYiz0RHmObfsByj8EbLtsgs3HCo9VgV78cOhkOo?=
 =?us-ascii?Q?P1f3LugmUW1ai8LU/KcY0q+OV3zErhi8tsDzIQJ+/b/BibKJSPTTKHoNZXL8?=
 =?us-ascii?Q?JizKxn0lrCYo7z9MFYmxDIUEgiz/aveCqEbIb9IXBSyO2cpfxNuyB2AGK2Qy?=
 =?us-ascii?Q?x/rkbGAYNRzmooRr77UWE4/Gba18TyYw4YvP1qD2WInQc07xqn/w2RcGGa5W?=
 =?us-ascii?Q?Oi0HH+54xpqVTHXvOity7JakM25UU+YpVutS6KRb/fD2IWK9M9PbGpAxQlPO?=
 =?us-ascii?Q?Vw85z2DWhQNDvdju7ZYwl4Ya3CC+xDAfM3ne69y/6AVJWxppEntZZ4XKkE/4?=
 =?us-ascii?Q?NRPgvXsRnDts/ND/zH0HwXi+s8DCvBbq4eAFNgRUQYNtGqGEDvitGGPwwgkP?=
 =?us-ascii?Q?7lbgReje5AUIDEnQoHeve6dm7UaIp1K5+uxY01Ss4sZeMYESOAv6iK5URpYB?=
 =?us-ascii?Q?D4EM4EcY4FPZlpaaeaBpuApghRuy2lbA2T0PWhjaovvPNQtAprBKMw7V+cOJ?=
 =?us-ascii?Q?9JrPGqohlzHLT62K1EcEd1spKpmnacXgxtrB2SSOP3XvD4+CBygnZ2WkqU86?=
 =?us-ascii?Q?D6qrAKFvbH5TjHlVohfhq4Nua6+vycvoiicYpidU0nARoBejBkTLy4/rgqjY?=
 =?us-ascii?Q?1+Go0UW2bWun0PvznWVX48JzE/egL5t01b5OMr4KokJEfk7/Q6nQRZdEYuFi?=
 =?us-ascii?Q?VIuCtM2kl/MFfV2wgczIgrQ5Ivp8yiKDgu4wJbRylwshhIzDMkgWg5BLhWA/?=
 =?us-ascii?Q?1EucuDWcakWPMdtt2+pZYrBu0aUz5iSQzAfYnXtQzpn93bBaSQU3izaANPZL?=
 =?us-ascii?Q?3Tg/666KdOsKSoXlURHmJrpfCcVQt30TzgWmBIZFFlHweD+JdCd9WEjQKxc7?=
 =?us-ascii?Q?/B7qxN0pObXeqkIKBWPZnwje1vgZUmBwdgDSGryPx+8IikmKRLBGNrYc7zbo?=
 =?us-ascii?Q?8cve3YBH7f5qiIkcWObUnBzBP8FOuNGXxQmtbdeFSwB/qRNIN6V58yKhh1iY?=
 =?us-ascii?Q?m2Y5UloXAC8G5Z7yQ/2LCiJoNJPTqVrOFyGrL8kQj0yGKSbzFSU/5GQAQ5Oy?=
 =?us-ascii?Q?bxfI1/blIPKw99ZsCYelO3uMYwj7U186vVlXVNTc416FtzKwrAc0HU5ToE9n?=
 =?us-ascii?Q?6b2iR/9pe/PaSu1A556dcMS0SMYs3xAdw/gqz/cIUuUK7bgCNib0+eOGP2Qa?=
 =?us-ascii?Q?HbEKmu3J1ZicmFrLH4Rr8bSmgm7R1UEHiXt+kLVYZhr2KXnB7eHbbsPnlH8X?=
 =?us-ascii?Q?oMwaw7K1u4uskmsMBSRml/d+e1ibj5+70e+AruNUwlGM+vlaS6Ht9Y0vg6cF?=
 =?us-ascii?Q?aYnSmgCRJc6xI+qbNvO4vg39YPnoAgESGqH7PhQ1Ab1/ePylah++RwVWjPo2?=
 =?us-ascii?Q?QwJ1V+ZzOnPGKp+qEXqf2HXk2zpqmtLSUGvmo3qHiDActvRHRu/GawMTvA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:131.228.6.101;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fr712usmtp1.zeu.alcatel-lucent.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700013)(82310400026)(376014)(1800799024)(921020)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 12:01:26.1981
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67bdac90-75d5-4d59-8216-08dddb2a4bc8
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.6.101];Helo=[fr712usmtp1.zeu.alcatel-lucent.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000049.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR07MB7617

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
index da9ff17..0da8f9f 100644
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

