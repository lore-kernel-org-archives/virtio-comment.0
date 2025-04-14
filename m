Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2049.outbound.protection.outlook.com [40.107.20.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5DE2749FA
	for <virtio-comment@lists.linux.dev>; Mon, 14 Apr 2025 15:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744644880; cv=fail; b=Teoz6sqFKkFodzSlCCSn2eFGZG3zsFJvOAzafr6eqg9HhMSweFyGDwhSUTfSlTjcWrsN4DGmsbv3B0JENvgTUqt9VCwg/3XxKXFPSg3Zn63iMM3+Z6JuzewAnxmQH2COsv30Rx9SaFVmcoxac90f9iEGSMSi/Ost6I2S90vWi/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744644880; c=relaxed/simple;
	bh=LbUdSq19CePJHbHjUEnY1fDNBCTVBuccwoPScZ1Jt7E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p12Jhs6wwIOK5a9BqgE+xLR7Z/zlIAjZoMb/VUPf4APWY5H77Nzk25KQLEHoKL31w0ahnTACQudUdw8JS8Q4LcfJRQ0ejqSLFq7LcLnjGlz0Rd/OdOJGQyImTrX+27QqQqtDM4pfoHPQlO4XNDdofsb7yea6aMbLWSXIFFojNdc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=BLP0VU5B; arc=fail smtp.client-ip=40.107.20.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="BLP0VU5B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J6S+gd8uGEPoY3PH2hDb1r4S2d6n4IshotG9L3aJ2jFTK7mJEKXmS6kp5VaDPnuIn50ntN/Dr7rFt6Bzd2Iln8SwAP4slhL8SWHJPGjyqMbQgfo/kiEJppCi8CMqieTX3YDN76Pj2TWF9tCyuDILU1Z3Au8YzCt5YZIjbWRI9VjrnpdojXXPNqDXzMnU1Y0gMHqFurr5TBtWLBl7o8PCefe9EtCSoFo2GwFFWOMy6YiP/ZbtdCG4mx8GIW2ljnozPpx8Tv4I/bcSOYRrMgi6opVyS+oEktwtWjxkL5RXTouZJw+4aDUoTN5VU6n7NoubMU5Klsu3ccbYWll1O41otQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yOXV3fAlWEyEh2sWnLpbSRm7O0+Z3ApAa6qC9sQPxMA=;
 b=K8FlHoer77wiypsCDFr02geSsB3e73Cp/Ey3IgY4cNMszjrVdQyENV2haZf0+Dp3o5zTrQB/h/QlOs8V/QZEc1Bej4c4ytxTeU3dqpa6IayLPAPn3rQYRggLU1QMQ0Rfie413gVPmvuh/9WPNRAHJH9cwwmF2Y24aElq0LJKjfCK3POgpoxMfbvV5WyDSrdxWk7UM7psAeA8wIPqExvRKTyjJFVHZ10CAG8fw3CZd2VygtcMBjEjbcHQnwun/PcCkNrxZU4QYmFUH5IFW2GPZTpIJzgBO5lZ+Bg3jIE6pI26/nBU04AxhweFg/ml6E5j34GvZx2EtWV87zCIcURRqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.6.101) smtp.rcpttodomain=nokia-bell-labs.com
 smtp.mailfrom=nokia-bell-labs.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=nokia-bell-labs.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOXV3fAlWEyEh2sWnLpbSRm7O0+Z3ApAa6qC9sQPxMA=;
 b=BLP0VU5B0CW/Ty0QomZdsujy5r0BBZpqMr18oS1qhcBlt7/82k0RvXtyichfI9xPVKNAftAftCVrRRYeaDmXA16EHli5BsImofic6Ak7hRzzuWSO/26hxf89CW+RNz9xJDMWJi01h6GpKNi0taYRMpMCGaOCVAMutz0UMoTD/FvWj59WrVt1HHEtFXS31H2t9bT2xFSQkWSnl94BoYacmwScdBKMXmimEsVw8mGeE4y5bbz4sdkMAnOYA6C9m6IL8rnwHfgJ+TFRo4a6Z4Snvb5SgTKP9c1q+3UJAdhWh6TuNVxqZtkcahXgiy5RGcRaCiv3aJpc8UKhCIi66J+FRQ==
Received: from AS4P190CA0052.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:656::24)
 by DBAPR07MB7030.eurprd07.prod.outlook.com (2603:10a6:10:19e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 15:34:32 +0000
Received: from AM3PEPF0000A79A.eurprd04.prod.outlook.com
 (2603:10a6:20b:656:cafe::2a) by AS4P190CA0052.outlook.office365.com
 (2603:10a6:20b:656::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.34 via Frontend Transport; Mon,
 14 Apr 2025 15:34:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.6.101)
 smtp.mailfrom=nokia-bell-labs.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nokia-bell-labs.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia-bell-labs.com
 designates 131.228.6.101 as permitted sender)
 receiver=protection.outlook.com; client-ip=131.228.6.101;
 helo=fr712usmtp1.zeu.alcatel-lucent.com; pr=C
Received: from fr712usmtp1.zeu.alcatel-lucent.com (131.228.6.101) by
 AM3PEPF0000A79A.mail.protection.outlook.com (10.167.16.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 15:34:31 +0000
Received: from sarah.nbl.nsn-rdnet.net (sarah.nbl.nsn-rdnet.net [10.0.73.150])
	by fr712usmtp1.zeu.alcatel-lucent.com (GMO) with ESMTP id 53EFYSsJ027839;
	Mon, 14 Apr 2025 15:34:30 GMT
From: chia-yu.chang@nokia-bell-labs.com
To: virtio-comment@lists.linux.dev, mst@redhat.com, cohuck@redhat.com,
        mvaralar@redhat.com, jasowang@redhat.com, xuanzhuo@linux.alibaba.com,
        eperezma@redhat.com, ij@kernel.org, ncardwell@google.com,
        koen.de_schepper@nokia-bell-labs.com, g.white@cablelabs.com,
        vidhi_goel@apple.com, ingemar.s.johansson@ericsson.com,
        mirja.kuehlewind@ericsson.com
Cc: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
Subject: [PATCH v6 1/2] virtio-net: Fix ECN feature descritpion
Date: Mon, 14 Apr 2025 17:34:24 +0200
Message-Id: <20250414153425.99726-2-chia-yu.chang@nokia-bell-labs.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250414153425.99726-1-chia-yu.chang@nokia-bell-labs.com>
References: <20250414153425.99726-1-chia-yu.chang@nokia-bell-labs.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A79A:EE_|DBAPR07MB7030:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f7dbdff1-2fbc-47ae-b3ea-08dd7b69da39
X-LD-Processed: 5d471751-9675-428d-917b-70f44f9630b0,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|36860700013|82310400026|7416014|376014|921020|13003099007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?GEKoB7Y3DwZ3yukGl7xyRwaTqq53gHXSRlXU6QdW+aUN7XxvQAfc9U0DM1lz?=
 =?us-ascii?Q?tJUpVJwd4r9kKN1P1SMHXVsNrCHSSTbdlf2yLzlGAAvkwWCsOjatXK5TnIet?=
 =?us-ascii?Q?Fl4/SQnGitp7PDFiuQqlRQqXxtS44Q83GL+Zl0MKHVqDZ0NZpEBCT55FJDv1?=
 =?us-ascii?Q?PTbxHc4jxttwmq0lCRv+EgbSrePUxOG4RDL5N1a276iIrY4VhqGO7pLYpiS1?=
 =?us-ascii?Q?OyYo9icZixYru9fXkB3SzUqIpCAbftJ5pZZG/vtyGu2a1PTu139/qMFtzFnU?=
 =?us-ascii?Q?3y10npv8bmr4xIj23sD0k5N9oHPAPYcUR9TWpntJk1pvHZgqvJIH7yp58AGV?=
 =?us-ascii?Q?pN/8XC9ClxE6kI4H9ybpDwlvfkdAmObg2yXm5mytDKIof9E9mZ2Z5namLMRb?=
 =?us-ascii?Q?SH0YdlskI1L/fyQs3dy8+Io27FjuvM5/MOkJXzBIgavQtL0Jzxvwn/0UqSk2?=
 =?us-ascii?Q?hz93sTka9v7y1Qr+q5MuN7mN0bc/CBDMWcMQUWT6D5KDTx93dnPC0DVqwvAX?=
 =?us-ascii?Q?p7AcVZvrzCw3c6BgSTy1Xzk4oCzUgQ8qusa/MTII61JWaufHZRguOx/vQvCa?=
 =?us-ascii?Q?RM5eEjlB5O0JaCYTHSJKlOlBTOd1mjdzwak1exvtZCDskYJh2aSm2p17xpGL?=
 =?us-ascii?Q?T5IES1VqtKspjjuc8uRhpJkbsY0qTdzoJbWcmv1YsO2dg3CQC6SuVHOEzROx?=
 =?us-ascii?Q?4PEUOhZuZ2eO0FFyagrqo87M43DQwq4vSZmb4S7bnCg4rAf+79/gUz8vadHV?=
 =?us-ascii?Q?GhJFnLYwrW5SWyVdPbAVKglG9ZLb5UAauXhyRnMqxdhpROqr3C9TwHXBj3No?=
 =?us-ascii?Q?ZAJq2uzE5C3gcYRmgHbZdqstt5G34x5x1E23Hl72HWRDLeO5JjI3Zdez72UV?=
 =?us-ascii?Q?jbW++j+RGAXqJFDa8rCLoLtzDv2YNESPNy0mNMsjrdkI55uSJ+ogq5CTmsuZ?=
 =?us-ascii?Q?1MZg+4NZAIqww9VZm4o+K1tOZUaB8VjhfZZIdSg3tsWVqQn8kG/veu4W7GMb?=
 =?us-ascii?Q?yN+Qhc4hkY92f2R+rUa+cbZxYtZL570Nv08S9bidvQBVBz7r74AlWW7A7W1F?=
 =?us-ascii?Q?FEji+R38mABv/Ad5U4yLt4GC4im83bu7DC33PTFwNS1ecHJlIZeld2pw5t/k?=
 =?us-ascii?Q?lLDZlOCf5G6VVJvHxAZL3bQZ9mBxQKCG9UDuLsZimi8oUOPkoaULzzwB8Gha?=
 =?us-ascii?Q?5vLBCXQ/Gdvn57cC3RDy5s+h/yO1g8VhvjsPOsRliG+eP0FF+tT9yVseJwQT?=
 =?us-ascii?Q?/X2/b8/Y4m4/qJDkOS7Bnem44RMvqmhbc4asEs6dqENAT/1CHwut+GT0pKFC?=
 =?us-ascii?Q?qlBVF/9AKplL392nj2/mpNUm0I/7ElSFxepxH7bal1ZxmnAdWuTZ0GzANlb0?=
 =?us-ascii?Q?lUB8LukM0nJdn1BlrVuLiCliR3esTN/NveYlbGNGMAdoL+Wxn65KYALbXL0P?=
 =?us-ascii?Q?CZ5su5/kxO/sDGID7bNVtONqBFOKauhmrmfvXOsBUoHOSXdo43DoC4MKwMiP?=
 =?us-ascii?Q?pFWFeJdARDdUsG857htmoVIxc9WyVRXh4G9kOWizc2wkLfL0TCSC5vN0sw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:131.228.6.101;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fr712usmtp1.zeu.alcatel-lucent.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014)(921020)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 15:34:31.8381
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7dbdff1-2fbc-47ae-b3ea-08dd7b69da39
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.6.101];Helo=[fr712usmtp1.zeu.alcatel-lucent.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A79A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR07MB7030

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

