Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011054.outbound.protection.outlook.com [52.101.70.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD8B136337
	for <virtio-comment@lists.linux.dev>; Thu, 30 Jan 2025 18:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738260616; cv=fail; b=L9KBJwmzsQouUtq02/40txnHlkSdARJ/wM0Ubu7SdrLJyw2CJJeLh9eBwCAG5KxtTFzl+/E14x9Vf2be5MMTQ9ZQdejK8VkPbf+CV+WTDtKv7ucdyrTx776EV2hhQmSNVoweuVTdbCb0u/ltgflSptVhtF1MuQDP4W1ILR1h/BU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738260616; c=relaxed/simple;
	bh=GG/SeBh3q5sV+EZRL84Nxsx2Nq/UcDJJp1mlJFtfEGM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mez785TwqhxWtLUNtSleFAyhDAmhmF2MhlwGFwEeIivFi19epEezgDT0qSGX4oYPhhgsWPXwQNE6Btq4QGkSODtaTEz73KYbaCw1J99rHZhJyhw7iXYhBrOyVZByKqwPgVsOfm9qikVI2R+sl+5TX1O/hug/iBQBFhAQCk75Oec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=SL9AK0lu; arc=fail smtp.client-ip=52.101.70.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="SL9AK0lu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wA89ChqI8aNDYZYHMKXcEeji5vntq8zZT5CvzciHls3HXAvvgcVqAA6YlPlUVCaYhYJxbooBgYmVs13SiWxsko2JKx85efXKSUPx4EpkCPJ6Zyt/Y1UtQPq1WcchsHsoSK/9hRmb5GnhoWJ7mbXO+b1koGI+xxNkRsOnGTGeiV92c1/E2p79W8zesLIngmeLjzRX/nHvIS0o3CnYL/VK/OMBblDpPbtM4B4cDr4BYUp66gtqzunMkCXwPq8NpGLOgPjN4qp+CAi9zOiULSiTCUTuEolbL6bWNZeea6Lzc1dL1Gu4/hOdoZlF7u36IiiJRVJVEut1Y80slXHdRjeTBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=akcAHaOTKUva1glWeuntRF8P9taPKJE8dmK/dW/WsLw=;
 b=iBQAXbvNp+doM264pZSoBh9DoF4vSnA91bJhflMudgURstk9ZbcWfVwxKDz5YpsnPFsIj7M8gJEnhjG8qtE9tdCqZH9CnP/9BqgT8wJWqAuPuBM6Kj38iKtTT86vgOZlJDPvgMd80VJCek1nUE7RIVFRhGdecFA8V5azIbxZ1xEm3zW81B9jAkzebrfEJyevwH5gCc5u9cpuzYAnhJkG/YqrgJDrLclUKwps+H44Ok1tkdgF03+vcijzcrJDt+gHomcBCB29jw2wpcjFeOiC0R2wqcCnmjs0Mlp7fbOUm8/xrNOhyccIjFBZT93ibsApp8j00XibMxxz1mJYUxI2Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.6.100) smtp.rcpttodomain=nokia-bell-labs.com
 smtp.mailfrom=nokia-bell-labs.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=nokia-bell-labs.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=akcAHaOTKUva1glWeuntRF8P9taPKJE8dmK/dW/WsLw=;
 b=SL9AK0luh4vbqwP/QqXzV6BDtr3Cp+qFcp+ILxR6noOdM9VK5uNZUHhPC2pPkBopQFprlROs2u7eEBp43m/8CaJO/9Dlm3/BlBA7LxrcU6bIjK7MiJZY8IJfUDoToMhyGlw+asS59gEcf5NEkrwygg4GJNeL23J/1x9yyA05+PmnE3GLxTAFdzjCQOvzlfkJtOCJ7y58LZ/iiycpFgIesgpjX6TsfqBFm2jc0vWN8YMTQ/UdMNGPnxSuEYf1YaN7pF3Gd1B+fCAeB28eEIpONo2gw0aDtjcTjzU1k0NcmK6hMWlViVuvwEo4h+vlbvuDEQAMu4uopE9rHLkerCBXtw==
Received: from DUZPR01CA0132.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::22) by VI1PR0701MB6798.eurprd07.prod.outlook.com
 (2603:10a6:800:17e::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 18:10:09 +0000
Received: from DB3PEPF0000885D.eurprd02.prod.outlook.com
 (2603:10a6:10:4bc:cafe::40) by DUZPR01CA0132.outlook.office365.com
 (2603:10a6:10:4bc::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.20 via Frontend Transport; Thu,
 30 Jan 2025 18:10:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.6.100)
 smtp.mailfrom=nokia-bell-labs.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nokia-bell-labs.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia-bell-labs.com
 designates 131.228.6.100 as permitted sender)
 receiver=protection.outlook.com; client-ip=131.228.6.100;
 helo=fr711usmtp2.zeu.alcatel-lucent.com; pr=C
Received: from fr711usmtp2.zeu.alcatel-lucent.com (131.228.6.100) by
 DB3PEPF0000885D.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.14 via Frontend Transport; Thu, 30 Jan 2025 18:10:08 +0000
Received: from sarah.nbl.nsn-rdnet.net (sarah.nbl.nsn-rdnet.net [10.0.73.150])
	by fr711usmtp2.zeu.alcatel-lucent.com (GMO) with ESMTP id 50UIA8fQ031906;
	Thu, 30 Jan 2025 18:10:11 GMT
From: chia-yu.chang@nokia-bell-labs.com
To: virtio-comment@lists.linux.dev, jasowang@redhat.com, mst@redhat.com,
        xuanzhuo@linux.alibaba.com, eperezma@redhat.com, ij@kernel.org,
        ncardwell@google.com, koen.de_schepper@nokia-bell-labs.com,
        g.white@cablelabs.com, vidhi_goel@apple.com
Cc: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
Subject: [PATCH 1/1] net/description.tex: New accurate ECN and fixed ECN in virtio-spec
Date: Thu, 30 Jan 2025 19:10:00 +0100
Message-Id: <20250130181000.41973-2-chia-yu.chang@nokia-bell-labs.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130181000.41973-1-chia-yu.chang@nokia-bell-labs.com>
References: <20250130181000.41973-1-chia-yu.chang@nokia-bell-labs.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885D:EE_|VI1PR0701MB6798:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c47ce373-0820-4a33-7589-08dd415954c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?N/Bhy9Q/3IqSfWRzWWnCFfhAFCrKkKeOOTdPzaI/Zt/RDjqMwamHhkVxxncz?=
 =?us-ascii?Q?KR523W4jLY4CdJsOYkt8VxNlMnhJ9kz5juhP7qTNzeQof1zYKWJTB8aCncp6?=
 =?us-ascii?Q?3Jhyqwy/5PL3bFijSlHpCsONjgrnVx1iL6Xtv+GWudiTcj8nhV6XS62oT6Kr?=
 =?us-ascii?Q?qiAmDvYfFE9WtFwhDof4JKGm0QM9+vgVDLORgsH7/GDmRCG38eX99TiuB/XG?=
 =?us-ascii?Q?xeXHiJa8bSr2yZ9sm6JFkNgWr+4IzzLBopy+bg0IEQY19XT5dTttKrPl1XmF?=
 =?us-ascii?Q?dYE0xJL0i7KS5A/GfXb7Lq/lj+umNsnS99i0nKXozgf+CIOjNbYQ9qbc61CK?=
 =?us-ascii?Q?+13Fhz3TbWkVXaMpC3X6/DDRv0RPW0Fa8BMc+b30eaPHVx/Xay94GFXvB6rF?=
 =?us-ascii?Q?J4wO9nt505feuk9kG8vSWP4ZJqJo3AtmTS1zl65HB73OPWExpcBOuIRR8eIl?=
 =?us-ascii?Q?A60a3I87zL5eRqXAmsCjtBBp79rNSgGUFT15LCccapGZXfhW2barq+zW7xFJ?=
 =?us-ascii?Q?wbnforHy/zZKFPwU7cruLMwPnsUrWmB5YYBQpIbIwR8nXysoaerOfdqCIM+N?=
 =?us-ascii?Q?Tum6UAEtMpQ/6SCuQApY+L4jer2cYfMD5xcgWpXX1TiBZF1ZpSXCzNXAc5uH?=
 =?us-ascii?Q?953VzUQsy+p1HBLfjNbTAfVNkyEZMBrY1n98hbElguFyblo1u6EGv9dftjf8?=
 =?us-ascii?Q?GUCVHsl+Q0eQAqIHjc4uCTbAPMdJOMgJxzcQjBKOJHZPDwmLNnMBpKvo7IS/?=
 =?us-ascii?Q?6Yx8wCTfp0keaySw8KROSCcm9hc5CR+QzigSqrG1H8dnxkS9HdYeTKcbxkyW?=
 =?us-ascii?Q?NNPtXU+ajjoIMmWdWwq6jNT76NIfH8KGxnLbpIs7hevgelkYChYJiudApkwT?=
 =?us-ascii?Q?XaLG3B5ubuFe+FhYxornMFxx00Eju+D3jVKsvTxN1Vrq0CFe7DCatAHCpptd?=
 =?us-ascii?Q?6xZCekT6T3kQuCOSCyQassAMJKoTzupkiIzAXbh5D6c/b591Td40Q67nMISE?=
 =?us-ascii?Q?wX3bffMx8AlnqkBX3ISbUjzjpseqPCX9iORsaLtPzR0mU4tE5wHV363sb27W?=
 =?us-ascii?Q?IEx4BtjwaWfuz8sezi0Pfqw5RtPQw/Ev96HMW6G76goVxxATO8r0U6Ti+O79?=
 =?us-ascii?Q?50L/j6DPRvjcF8xK871xdrZm/L9cOMlxBfHtc9wBGiiaVBgnHzG+mwjdL8bs?=
 =?us-ascii?Q?+RzIcX1EDdbQ5fNXl8fJUK1hpqGSxb9ogh9TgwbqyZ4E/nfVzijyvi48Yct6?=
 =?us-ascii?Q?6dH5bEubAl4HtWvgdD7r70LN388cN+WXj48OQudbOQGRFoy4LhUz5CZqB1GP?=
 =?us-ascii?Q?iCjkGVkqwqRyooTrowaJfogRPDreHwhePA/CXxMU9sqqZLB6ESdEDJ/xWIH2?=
 =?us-ascii?Q?ZVv/lvLJV06PCyBAIj2WwYXBMCXwgZcK3TPuJMXHaBXoLAttiFlTxWYe2MSu?=
 =?us-ascii?Q?fCvRiBfhrI3ZuNjbfZZ9X7aWAWPeJY/zKwgeFrQHBn1xu2D7FE/wqAwKlRNh?=
 =?us-ascii?Q?IY0kqe2GfMuF+kI=3D?=
X-Forefront-Antispam-Report:
	CIP:131.228.6.100;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fr711usmtp2.zeu.alcatel-lucent.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 18:10:08.4709
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c47ce373-0820-4a33-7589-08dd415954c0
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.6.100];Helo=[fr711usmtp2.zeu.alcatel-lucent.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0701MB6798

From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

Unlike RFC 3168 ECN, accurate ECN uses the CWR flag as part of the ACE
field to count new packets with CE mark; however, RFC 3168 ECN-aware TSO
will clean CWR flag from the 2nd segment of a super-skb. Therefore, fallback
shall be applied by seting NETIF_F_GSO_ACCECN to ensure that the CWR flag
should not be changed within a super-skb.

To apply it in virtio-spec, new featue bits for host and guest are added for
feature negotiation between driver and device. And the translation of
Accurate ECN GSO flag between virtio_net_hdr and skb header for
NETIF_F_GSO_ACCECN is also added to avoid CWR flag corruption due to
RFC3168 ECN TSO.

Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
---
 device-types/net/description.tex | 63 +++++++++++++++++++++++---------
 1 file changed, 45 insertions(+), 18 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 76585b0..183b7ae 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -54,7 +54,8 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
 
 \item[VIRTIO_NET_F_GUEST_TSO6 (8)] Driver can receive TSOv6.
 
-\item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with ECN.
+\item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with CWR flag set,
+    which will be cleared from the 2nd segment in a super-skb.
 
 \item[VIRTIO_NET_F_GUEST_UFO (10)] Driver can receive UFO.
 
@@ -62,7 +63,8 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
 
 \item[VIRTIO_NET_F_HOST_TSO6 (12)] Device can receive TSOv6.
 
-\item[VIRTIO_NET_F_HOST_ECN (13)] Device can receive TSO with ECN.
+\item[VIRTIO_NET_F_HOST_ECN (13)] Device can receive TSO with CWR flag set,
+    whcih will be cleared from the 2nd sedgment in a super-skb.
 
 \item[VIRTIO_NET_F_HOST_UFO (14)] Device can receive UFO.
 
@@ -88,6 +90,12 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
 \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
     channel.
 
+\item[VIRTIO_NET_F_HOST_ACCECN (25)] Device can receive TSO with CWR flag set,
+    which will not be changed in a super-skb.
+
+\item[VIRTIO_NET_F_GUEST_ACCECN (26)] Driver can receive TSO with CWR flag set,
+    which will not be changed in a super-skb.
+
 \item[VIRTIO_NET_F_HASH_TUNNEL(51)] Device supports inner header hash for encapsulated packets.
 
 \item[VIRTIO_NET_F_VQ_NOTF_COAL(52)] Device supports virtqueue notification coalescing.
@@ -130,6 +138,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
 \item[VIRTIO_NET_F_GUEST_TSO4] Requires VIRTIO_NET_F_GUEST_CSUM.
 \item[VIRTIO_NET_F_GUEST_TSO6] Requires VIRTIO_NET_F_GUEST_CSUM.
 \item[VIRTIO_NET_F_GUEST_ECN] Requires VIRTIO_NET_F_GUEST_TSO4 or VIRTIO_NET_F_GUEST_TSO6.
+\item[VIRTIO_NET_F_GUEST_ACCECN] Requires VIRTIO_NET_F_GUEST_TSO4 or VIRTIO_NET_F_GUEST_TSO6.
 \item[VIRTIO_NET_F_GUEST_UFO] Requires VIRTIO_NET_F_GUEST_CSUM.
 \item[VIRTIO_NET_F_GUEST_USO4] Requires VIRTIO_NET_F_GUEST_CSUM.
 \item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM.
@@ -137,6 +146,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
 \item[VIRTIO_NET_F_HOST_TSO4] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_TSO6] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_ECN] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_NET_F_HOST_TSO6.
+\item[VIRTIO_NET_F_HOST_ACCECN] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_NET_F_HOST_TSO6.
 \item[VIRTIO_NET_F_HOST_UFO] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_USO] Requires VIRTIO_NET_F_CSUM.
 
@@ -249,11 +259,11 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
 The device MUST NOT modify \field{mtu} once it has been set.
 
 The device MUST NOT pass received packets that exceed \field{mtu} (plus low
-level ethernet header length) size with \field{gso_type} NONE or ECN
+level ethernet header length) size with \field{gso_type} NONE or ECN or ACCECN
 after VIRTIO_NET_F_MTU has been successfully negotiated.
 
 The device MUST forward transmitted packets of up to \field{mtu} (plus low
-level ethernet header length) size with \field{gso_type} NONE or ECN, and do
+level ethernet header length) size with \field{gso_type} NONE or ECN or ACCECN, and do
 so without fragmentation, after VIRTIO_NET_F_MTU has been successfully
 negotiated.
 
@@ -303,11 +313,11 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
 
 If the driver negotiates VIRTIO_NET_F_MTU, it MUST supply enough receive
 buffers to receive at least one receive packet of size \field{mtu} (plus low
-level ethernet header length) with \field{gso_type} NONE or ECN.
+level ethernet header length) with \field{gso_type} NONE or ECN or ACCECN.
 
 If the driver negotiates VIRTIO_NET_F_MTU, it MUST NOT transmit packets of
 size exceeding the value of \field{mtu} (plus low level ethernet header length)
-with \field{gso_type} NONE or ECN.
+with \field{gso_type} NONE or ECN or ACCECN.
 
 A driver SHOULD negotiate the VIRTIO_NET_F_STANDBY feature if the device offers it.
 
@@ -382,7 +392,7 @@ \subsection{Device Initialization}\label{sec:Device Types / Network Device / Dev
    The VIRTIO_NET_F_GUEST_CSUM feature indicates that partially
   checksummed packets can be received, and if it can do that then
   the VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6,
-  VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_GUEST_USO4
+  VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_GUEST_ACCECN, VIRTIO_NET_F_GUEST_USO4
   and VIRTIO_NET_F_GUEST_USO6 are the input equivalents of the features described above.
   See \ref{sec:Device Types / Network Device / Device Operation /
 Setting Up Receive Buffers}~\nameref{sec:Device Types / Network
@@ -413,6 +423,7 @@ \subsection{Device Operation}\label{sec:Device Types / Network Device / Device O
 #define VIRTIO_NET_HDR_GSO_UDP         3
 #define VIRTIO_NET_HDR_GSO_TCPV6       4
 #define VIRTIO_NET_HDR_GSO_UDP_L4      5
+#define VIRTIO_NET_HDR_GSO_ACCECN   0x40
 #define VIRTIO_NET_HDR_GSO_ECN      0x80
         u8 gso_type;
         le16 hdr_len;
@@ -512,8 +523,13 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 
   \item If the driver negotiated the VIRTIO_NET_F_HOST_ECN feature,
     the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}
-    indicates that the TCP packet has the ECN bit set\footnote{This case is not handled by some older hardware, so is called out
-specifically in the protocol.}.
+    indicates that the TCP packet has the CWR flag set and the flag will be cleared from the 2nd segment in a
+    super-skb\footnote{This case is not handled by some older hardware, so is called out specifically in the protocol.}.
+
+  \item If the driver negotiated the VIRTIO_NET_F_HOST_ACCECN feature,
+    the VIRTIO_NET_HDR_GSO_ACCECN bit in \field{gso_type}
+    indicates that the TCP packet has the CWR flag set and the flag will not be cleared in a super-skb\footnote{This
+    case is not handled by some older hardware, so is called out specifically in the protocol.}.
    \end{itemize}
 
 \item \field{num_buffers} is set to zero.  This field is unused on transmitted packets.
@@ -552,11 +568,16 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 \field{gso_type} to VIRTIO_NET_HDR_GSO_UDP_L4.
 
 The driver SHOULD NOT send to the device TCP packets requiring segmentation offload
-which have the Explicit Congestion Notification bit set, unless the
-VIRTIO_NET_F_HOST_ECN feature is negotiated, in which case the
-driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
+which have the Congestion Window Reduced flag set and require the flag be clared from
+the 2nd segment of the super-skb, unless the VIRTIO_NET_F_HOST_ECN feature is
+negotiated, in which case the driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
 \field{gso_type}.
 
+The driver SHOULD NOT send to the device TCP packets requiring segmentation offload
+which have the congestion Window Reduced flag set and require the flag not be cleared
+in the super-skb, unless the VIRTIO_NET_F_HOST_ACCECN feature is negotiated, in which
+case the driver MUST set the VIRTIO_NET_HDR_GSO_ACCECN bit in \field{gso_type}.
+
 If the VIRTIO_NET_F_CSUM feature has been negotiated, the
 driver MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
 \field{flags}, if so:
@@ -727,10 +748,10 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
   has been validated.
 \end{enumerate}
 
-Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP and ECN
-features enable receive checksum, large receive offload and ECN
+Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, ECN, ACCECN
+features enable receive checksum, large receive offload, ECN and ACCECN
 support which are the input equivalents of the transmit checksum,
-transmit segmentation offloading and ECN features, as described
+transmit segmentation offloading, ECN and ACCECN features, as described
 in \ref{sec:Device Types / Network Device / Device Operation /
 Packet Transmission}:
 \begin{enumerate}
@@ -797,11 +818,16 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 the device MUST NOT set \field{gso_type} to VIRTIO_NET_HDR_GSO_UDP_L4.
 
 The device SHOULD NOT send to the driver TCP packets requiring segmentation offload
-which have the Explicit Congestion Notification bit set, unless the
-VIRTIO_NET_F_GUEST_ECN feature is negotiated, in which case the
-device MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
+which have the Congestion Window Reduced flag set and require the flag be cleared from
+the 2nd segment of the super-skb, unless the VIRTIO_NET_F_GUEST_ECN feature is
+negotiated, in which case the device MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
 \field{gso_type}.
 
+The device SHOULD NOT send to the driver TCP packets requiring segmentation offload
+which have the Congestion Window Reduced flag set and require the flag not be cleared
+in the super-skb, unless the VIRTIO_NET_F_GUEST_ACCECN feature is negotiated, in which
+case the device MUST set the VIRTIO_NET_HDR_GSO_ACCECN bit in \field{gso_type}.
+
 If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the
 device MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
 \field{flags}, if so:
@@ -1624,6 +1650,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 #define VIRTIO_NET_F_GUEST_TSO6       8
 #define VIRTIO_NET_F_GUEST_ECN        9
 #define VIRTIO_NET_F_GUEST_UFO        10
+#define VIRTIO_NET_F_GUEST_ACCECN     26
 #define VIRTIO_NET_F_GUEST_USO4       54
 #define VIRTIO_NET_F_GUEST_USO6       55
 
-- 
2.34.1

