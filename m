Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012069.outbound.protection.outlook.com [52.101.71.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517AE1B87D1
	for <virtio-comment@lists.linux.dev>; Mon, 10 Mar 2025 05:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741583896; cv=fail; b=hGUKxIj9Pg5oXXfEMo3s8iXERgZ55LkDuDTnnzhE0J5yWGNmjWY4dA0CBn2YZs9ARxVcK7xGdEeBsQPRgLeD+mRea6gMKNOqVYc4vgANKe7+S1jrcb+soqaVed5Uc6cxMKCF9vEqJLs9TLt3QIqLwHHmoLnwkWwUSPUm0lmcdDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741583896; c=relaxed/simple;
	bh=OQ5f2GKc/s+i3gKmzFPha1+PdbBchh+4F6fSia4V89U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d2hb+WNqsKx4d0NtWkhHgWM/mEgid+NCUObcwsdOB8K7wTfGxLiQ15uwPkIgLEt5RsSCuvLjLwuKweSY8ymU1EbRBzDnMhfRw50VF/cmhpZoooSOsZnHdp1Gy1RI6At0tvalbhEXpcf7C0d+p+N9JiRh654PrS46/AnKv4oKfSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=I+DXQCJn; arc=fail smtp.client-ip=52.101.71.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="I+DXQCJn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ITHY/BLOBhAPHkxpNhbjd+//3EmkJtevrpazahdxadQXVJQjeIb6JdH2pWslJ6zvg6nXMo1neC6tDDR5hNFAODwD6h0xSoZOcYsopESUxpOp4dteKMu7NFm71aSG9JeiJgxBjx3ABPG4GGS0BX+YZZtGWiqFkVeQHp8grQoWY7/se9kSaJjZsvs7WoWEQIKVKZmGsH1MLuwSzVWBKD/pDXI4JteNUh5v9Yw9fz0SRmq3jAGchKUyJ+BY9RCUvFqUe6db39DJopYHZihDbw02AqKIsi50rr3XyCW9b+j1nfxORkRKR6n7lJQbtIAw9wyBSGVzMgHjXEeDz8i+dxtncg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FAgboqN1w3WHy6O+h1YU55M/QFbm4vRBjHljaIJcb34=;
 b=tyYycHol4f4DPle/jBerFB3b5jXE3BO2KoKK9x01AbYtrZnwZwLet7g0wk0k/Y4RYpEwHIn9BivDtZpAsB5PWpsr5Rmd8FkY2TJ3AAFOKvOdtGXHWZ4DhePWu9yuONXssEO/lIVg89bEAeB7fAkFPyOSn6WalyFNWY5vIxFhoAEyFyQIBDbpJGj6/Q7H1xdk/3v3hP19MDkAVIbRdSdLlBLyFJBZIh+1ezuf0QTqWiugFhrVeOCM9AsQW/Y2DxYeyVmABLsy3mRjz4EURhuESRNUbb6MGWTM5IG/6IBMkzSBgSAcY1C95N4ZjkA9rwh9Bk/0uFwXpdHgKjoDg83Eow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.20) smtp.rcpttodomain=apple.com smtp.mailfrom=nokia-bell-labs.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nokia-bell-labs.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FAgboqN1w3WHy6O+h1YU55M/QFbm4vRBjHljaIJcb34=;
 b=I+DXQCJnjLfUaybhChvhU97XbOA1dJfG1Bam6S+bGemEEu6+TYrdbgFgLJdHpY9hIZdmmZR94huIYA3SkvQjn/wBzZstZ0Wdo7fljbRtY9UE0U0ZFSssC6PFcVnD1kdEwToMR9QMhuxSP4yFjjEdbEOhOgP6OPA90bqaQ0JGWoHEdJNIrAKZdyLxltC9hl/ugEVKIIZO+LyF1NM44s26Pz2J3voXufshBKUqZiRhDjzhwbbA17wcHcuuinrvPW86BxHyTeuCsf8w/OnNQVjYcm14vOmh+dXEZ7I7L3NLhvsZcjHg0tHj3o8M14sIRxhmZyPfDQ+ktCTxnQzgRdwLjA==
Received: from DUZP191CA0060.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::10)
 by DBAPR07MB6918.eurprd07.prod.outlook.com (2603:10a6:10:19e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 05:18:09 +0000
Received: from DB5PEPF00014B94.eurprd02.prod.outlook.com
 (2603:10a6:10:4fa:cafe::2b) by DUZP191CA0060.outlook.office365.com
 (2603:10a6:10:4fa::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.26 via Frontend Transport; Mon,
 10 Mar 2025 05:18:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.2.20)
 smtp.mailfrom=nokia-bell-labs.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nokia-bell-labs.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia-bell-labs.com
 designates 131.228.2.20 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.2.20; helo=fihe3nok0734.emea.nsn-net.net; pr=C
Received: from fihe3nok0734.emea.nsn-net.net (131.228.2.20) by
 DB5PEPF00014B94.mail.protection.outlook.com (10.167.8.232) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Mon, 10 Mar 2025 05:18:08 +0000
Received: from sarah.nbl.nsn-rdnet.net (sarah.nbl.nsn-rdnet.net [10.0.73.150])
	by fihe3nok0734.emea.nsn-net.net (Postfix) with ESMTP id D400A23DD8;
	Thu,  6 Mar 2025 12:15:26 +0200 (EET)
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
Subject: [PATCH v5 1/2] virtio-net: Fix ECN feature descritpion
Date: Thu,  6 Mar 2025 11:15:22 +0100
Message-Id: <20250306101523.88798-2-chia-yu.chang@nokia-bell-labs.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306101523.88798-1-chia-yu.chang@nokia-bell-labs.com>
References: <20250306101523.88798-1-chia-yu.chang@nokia-bell-labs.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B94:EE_|DBAPR07MB6918:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: db03b3d5-16dd-403d-0ccd-08dd5f92f246
X-LD-Processed: 5d471751-9675-428d-917b-70f44f9630b0,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|36860700013|82310400026|7416014|376014|921020|13003099007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?pH68aq9Tqd2mpWIEuc6+63GFD/DhKWktGj5RJt3L0V+6m49i5+JooODq2CA1?=
 =?us-ascii?Q?OjycW+Iqf8XCwbFm74QpoPBnP3KsG6dFfFIS4tRWlDcP/zQQRvDZ4zr2kJJm?=
 =?us-ascii?Q?T4XQpWMmqfuoXDI0ZkEp9VY63WKgRGfPzQJmGjAWWigSLzbyiK+ur9qmx4BI?=
 =?us-ascii?Q?K5GftQRy/BdZinQSohkKT4q8jGoYfTSpljc18pJW3Njcd5ZzYNofHrNPGH/5?=
 =?us-ascii?Q?buELDnLRVuwGc63VkuUwpSO5LLN4KAWB//DxFY01Y4xm/IzMIiwCW24A46Jl?=
 =?us-ascii?Q?p7syjqF4kNIp4lA4F9T/x9tvojC2b8oe9toPmDaLZpJ4Df/UMT5j+m78H1M7?=
 =?us-ascii?Q?WPGPGARWpnyY5y0WSkoi95EZDwCzGtypJzw1rBbY2X1FN7559Pm6xLkz2Vij?=
 =?us-ascii?Q?3hm+nronrFiMfyd03avZOSoZlvN3FElNMGXdZTJtdiJLwIncHcT/oJaxWIMC?=
 =?us-ascii?Q?/By9Z95UVaSL1EdxyM2hHgXjG2xl1rDSNsRehdTBYF9mXXZfECp71F8RWUaU?=
 =?us-ascii?Q?FbmOxR2acTkpxBSV62muGe1peI4nSBOpGX9Fhpj0NEEO1RP9yt1GRWOW4lUx?=
 =?us-ascii?Q?1bWUgz6jXLn3Lk4ugp9lsA03sKEoe6LlWFrmzlx5/7scq3QyxHCBAZPQgCcS?=
 =?us-ascii?Q?na7RVmA4hFLBNzd4gMLKQhY9bTWDn+oHh1zBIhQNMDbokQre/Er/AGR8c/F8?=
 =?us-ascii?Q?seheMix9cnhwEJ11dhLCtWzCLlJ9L1S1vJfSyl6JWgh3orIJCU8nJXJEO94v?=
 =?us-ascii?Q?ZhHLCnYo+sNLP/6eJlkTMo3fbjx/niADG7zLbmQReSmDf1/nV6PZArtTVZaJ?=
 =?us-ascii?Q?CsMVhj0swlDH11hRdFhTKLMycfY8Q5lqkMDpZ/5x6RayR0eqy4TYR+jnUDig?=
 =?us-ascii?Q?VHzrnD+vglch0cHmN8EWHnPnB1ycskivOV1zmdh6G1Zpq70cKlldgkatqJh2?=
 =?us-ascii?Q?zFRbQFapGhdlwrmdoyXLEqLA3uO05+Pi4LCUCXgX+6GwHY6yIgWR4e9IGBh6?=
 =?us-ascii?Q?LZ2MfDnWkChwwjvUXyfTElnzlc8gFlZtiqPBc7uMhRVOPi9YNJNE0JYjLEc0?=
 =?us-ascii?Q?5kqqXB44iyrVs+6BITvZGF+pOSEv0uGeRxtu6Kr23DJLKFFkfZQkkLQHQgOI?=
 =?us-ascii?Q?IVmbLItQnJj6PcZnACj+k6IxPtxDfnXrSSRif3Xha+wYni2aCgIJIzZM+Qr0?=
 =?us-ascii?Q?9sj+P+sc2zo1t9qKz5haN1aY/eFgRTFy53B/Zxqw5CDy8sxKMzxD1mD9wGUi?=
 =?us-ascii?Q?ncjgKVJY/4Yw0KXdFRGlxpH7zWChESfVAQk3TjxO9BhMQo+Gv/U8AFIq0ekW?=
 =?us-ascii?Q?2Wikc7NnvmK5mUbftDk6+Gx0wAUo7C2iR061pjJfqckj5RyZbo9n/JnpCiMZ?=
 =?us-ascii?Q?suQ7IxEZ4KPLiLcyyb3+wJVhPRdFNQ3n9+2esJduhViQo2cYeM4TEoRU4rzL?=
 =?us-ascii?Q?jgVRjNVopVOtE+0CTSAZZD7by+VGGcUVEsFCnRFVemONAWhkW9rtV6lfTZ8A?=
 =?us-ascii?Q?vBSz9z88x1JuW1BqZ6YD7HZ2KyBGYhUr9fOB?=
X-Forefront-Antispam-Report:
 CIP:131.228.2.20;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe3nok0734.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014)(921020)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 05:18:08.9925
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db03b3d5-16dd-403d-0ccd-08dd5f92f246
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.20];Helo=[fihe3nok0734.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B94.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR07MB6918

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

