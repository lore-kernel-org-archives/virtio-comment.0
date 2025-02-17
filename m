Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2072.outbound.protection.outlook.com [40.107.241.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052F1229B1F
	for <virtio-comment@lists.linux.dev>; Mon, 17 Feb 2025 17:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739813408; cv=fail; b=haD0voB1rZbs5agXnkhlZQNjdWu2s5NeT3R0oNOPOqi2J7ZYIXoXrJhFZ0qvyW8OoGFMQnluNoFZoAk8ijh/wxOhPJFX1qOjO2byTKV5gFuoAnwYGMGTikMdjwE9/0EYqnNeacWZbJKAA+xonkSCfPRyCa8SPCu8wYvwNG2tSU0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739813408; c=relaxed/simple;
	bh=0fpY8JiDAMCLD75naaVHGxEQowkbJTii7Dw8+YULjAc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UxXvkQJ0sKxAw6HuMLuosNVBwezDA6L36dfKNFPdTdv2UpCnch0xZDMSSD7k2YxU9dcVSHBUYu8MKTU9PIoG+8GkQXtL1huyH9Wn+JDCbXBbH1uVS4LkdAS1LOt9MSloVNYa8J6I7OOsmVE5xQM3Qyq7FksFhlLA3jxZGBUB9f0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=sT06Find; arc=fail smtp.client-ip=40.107.241.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="sT06Find"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sQFd441va02Gx2pCtXyvtvYDWbFKRalOmuZJFu+IY1yNhLrHiZUeOQXkpgZSHqXWSHljqLvLy3aY9RAfvZXz0pg7IX/bGBNm5uzMpDyRHDzwDcpwZmwlGE9dMhsODO6TwenSAxL/3yHAkWoBvX1dWHA7Uaj+ynmxgiUadW3EjyGiWeWvgx4zD6xYES6kF598erZIJEY4ua9lzlD+yAWc+uGZjBEBsarlwIMjzPVDvhT+w+JHj/8BtUo74BDq0n0JcKwEUcxsYO05EPnzjPaKFhniDq9dDSiqBd0r5QxcFqomYvz800w/yjgd1xBj/sBSzwBjmZpAIQahmGxrTCdPKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WZ+Hr6xsB5LtNTF0gYDP75PoUiczt/ID+EmJLzBtI68=;
 b=uDZsL/QIMpdJad7o9oqRlF/IIFjhUMN/oilqbCyD15QeevqxXupJao3WTMvkcKMMgv4MH5nMov7ZHkJgfaJNAMuWg8/0g1zmXqWar9PAcQsR0Q8abf/tE6zL9wR0esnPUJcq0eE1hEwJArHghBlaR/kLZcsENhHVV9LbNK67js5TaFETKGsArNXXhxgoU3lAQyVVcrzOJHUckAkkKBZbFk4AKTC1HdnikZWV58c1K82z+nyLCJXgYtVLyJJLpnuTOMGKEjj79b3HvQZSVPmUbD+yq/pDKGANlyX48czhQzrnut2iO0UDzIg+TZcTMKPgZ08wlUHA4tv9RYA1GdVAug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.20) smtp.rcpttodomain=apple.com smtp.mailfrom=nokia-bell-labs.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nokia-bell-labs.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WZ+Hr6xsB5LtNTF0gYDP75PoUiczt/ID+EmJLzBtI68=;
 b=sT06Find0ioUgBvGC+J5Qj5Q5I24HsobfmZbAEGI7EcaDDFMZFhrLau5WP8mcuZqlM0LdEtnhbEu+++fex67Y7eY6DtUot+sthS2inOSlUz/XQNCQT0f1srtPIQHaIlQ240IX7OUCu2ELVWws9poAQFXXyk5eSVNOqmdRjOmJYLKidQdHS7JI6uLUden2PU99bCHxk598gLmTj07pkbVXZ4sghcEq5QDtN34mVScN/3fYTPzvX0WW8sp2MOychu71Yt3XourwG3i4KayNvwS40DGPW2sGTPyHrBpqcsDsof7FJ7iZ0NGhwnpUDNCWI9bshdQ6H/Z4g8UXLYoz7iEbQ==
Received: from AM0PR03CA0065.eurprd03.prod.outlook.com (2603:10a6:208::42) by
 AS8PR07MB9353.eurprd07.prod.outlook.com (2603:10a6:20b:61b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 17:29:59 +0000
Received: from AM4PEPF00027A67.eurprd04.prod.outlook.com
 (2603:10a6:208:0:cafe::65) by AM0PR03CA0065.outlook.office365.com
 (2603:10a6:208::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.18 via Frontend Transport; Mon,
 17 Feb 2025 17:29:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.2.20)
 smtp.mailfrom=nokia-bell-labs.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nokia-bell-labs.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia-bell-labs.com
 designates 131.228.2.20 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.2.20; helo=fihe3nok0734.emea.nsn-net.net; pr=C
Received: from fihe3nok0734.emea.nsn-net.net (131.228.2.20) by
 AM4PEPF00027A67.mail.protection.outlook.com (10.167.16.84) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.11
 via Frontend Transport; Mon, 17 Feb 2025 17:29:59 +0000
Received: from sarah.nbl.nsn-rdnet.net (sarah.nbl.nsn-rdnet.net [10.0.73.150])
	by fihe3nok0734.emea.nsn-net.net (Postfix) with ESMTP id B9C5424F90;
	Mon, 17 Feb 2025 19:29:58 +0200 (EET)
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
Subject: [PATCH v2 1/1] net/description.tex: New Accurate ECN and fixed ECN in virtio-spec
Date: Mon, 17 Feb 2025 18:29:55 +0100
Message-Id: <20250217172955.9271-2-chia-yu.chang@nokia-bell-labs.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250217172955.9271-1-chia-yu.chang@nokia-bell-labs.com>
References: <20250217172955.9271-1-chia-yu.chang@nokia-bell-labs.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A67:EE_|AS8PR07MB9353:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0619f727-41b7-4d2f-3ca2-08dd4f78b464
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700013|921020|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2UBGA1vZazwVcKuR56cjG+41U+JCTdeTaGyXcTNLXgTjJUYJR0+ebvv33S5b?=
 =?us-ascii?Q?JsuRq0CCi0oIyftb/jInKjVqBAp4K4tHs17guKe6YRCfV4xsvn2LW/JDvQV/?=
 =?us-ascii?Q?hpvc4hYHJHBc25XKuBitleItYObObE4lAVwHztj98jag6/3pgWCNnB5ZLs69?=
 =?us-ascii?Q?XlU1Jm3fn5TwypRbIxl1VPuQ48wBoJzKykI4LtMhssU6qGjebFsmEO6dBJhX?=
 =?us-ascii?Q?w22vXeotx2slYmvdzjCaWnE9qXnslJ8Ddc+WBFffBCax+9P5gK7f4ErgDfhS?=
 =?us-ascii?Q?qyS4XNy97Ls+yNfClknFLz4r9e7KwVQXV82axbp1DFsriRSlrM7pxaMlWQ80?=
 =?us-ascii?Q?H5pD75Mben/xYwIUHxiBW0fG8PVjc6gNzjQg29mKDyeLUaIcKyqhYGMcvKTl?=
 =?us-ascii?Q?YqTahWB4DOtEBMaqNwrBIrtBdNt4fK0g22dOcVK9NhQtjsQBmisbf+V3p+lm?=
 =?us-ascii?Q?xsXbN19Xe/0kdDX8hdqjPF2Fz8ykEPkzA5h1/1MttcJO+GsZcbEw5pOCSS/O?=
 =?us-ascii?Q?U8T5VdjARFDvXU5vTdqWdxQGfH4fsV3QwNiPoKnLhFS4fiOOeIQ4Jz9kr9AJ?=
 =?us-ascii?Q?vAn+O/wvUqkoSooBYvvBQdh37ZN1TwdTsenq/owc2DVDHrgcEGLkLkM3Vz17?=
 =?us-ascii?Q?3Q6xOeWRNp7GRtB1wsD2/aMjJiYPD0e3nDlA/cbFoz+lhaaSVz2+dC79VA4N?=
 =?us-ascii?Q?qKnSmzpFivWYxEkjdPkN1FmfzeGnbA8VuiYaOTVxzw+EzaJdcsDIfMKM05uz?=
 =?us-ascii?Q?Xa9/Kc5gEJdIOKMewoD2HBYFSpWBIFSPCfFGoS5HcDEYqO9Alt6QJ4a22xY+?=
 =?us-ascii?Q?0iGYaRERUWNKrK/XjGzyOZ7DKl6MqDK1wR5n2Niu2NXFkKdp+RZv0B7baJwp?=
 =?us-ascii?Q?jZfXnXeicjy0iPjKTgGComqcb5osOBYCycAPAdCLDdgiULbcb3ivhs3GMMIT?=
 =?us-ascii?Q?az+zUtcv1ZZg4RjxjNntZ/tAbhPjepv23moOTOxNaq3zfW6DMkuYzvhw9Smm?=
 =?us-ascii?Q?0C6HpM84LOZETF/GxmHWBA6Vv13XEjRIKHv0W2Gl04kDVY7QGFXBX2aAJvXC?=
 =?us-ascii?Q?+QdyfuFdLHrtgNuRpL9XzAVPsqjwgkOrZgjyfxKtS0jWiuhmBNT7HKlnYZij?=
 =?us-ascii?Q?Otcwj1rEeH38WX3CgjaAEuuL1PXQhVHn428619PGYXXneOFRUESn0KFauI7G?=
 =?us-ascii?Q?QbAyCKRgSa4HvJTmEOTxQU1FEJ3tVATk8eXORmqU15z6rYiRrHS6Mhz2SPoK?=
 =?us-ascii?Q?v4ObpUDg1T3pYdxwn6QleBt/31BxFxnFMdFHoVJQsDDIjy4fBM9g53bk7Nnn?=
 =?us-ascii?Q?FLqn1meD9mnmOAAbrSZvfTWbkdbAHqkJxAhWbQZO4Sw73GpJjDoSSzC0hoxs?=
 =?us-ascii?Q?vF1z+Sa+5g+uVFpPhQKN/W4xxZH6YjJprgxRfOVQm4KwBKhZ/IyLbIm/vX7k?=
 =?us-ascii?Q?q1O83VQxBOQX7uA637NIVDkb0+Zp0KTs8FksHiHGkPbT9KB3CTCao0z68lLv?=
 =?us-ascii?Q?esxRJ69XTykAbO56h8xOJ9FDPJdAU8wPbScw?=
X-Forefront-Antispam-Report:
	CIP:131.228.2.20;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe3nok0734.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013)(921020)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 17:29:59.6835
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0619f727-41b7-4d2f-3ca2-08dd4f78b464
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.20];Helo=[fihe3nok0734.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A67.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB9353

From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

This change implements Accurate ECN based on AccECN specifications:
  https://tools.ietf.org/id/draft-ietf-tcpm-accurate-ecn-28.txt

Unlike RFC 3168 ECN, Accurate ECN uses the CWR flag as part of the ACE
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
 device-types/net/description.tex | 75 +++++++++++++++++++++++++-------
 1 file changed, 60 insertions(+), 15 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index b546cd7..5ba7acc 100644
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
+    which will be applied to all segments in a super-skb.
+
+\item[VIRTIO_NET_F_GUEST_ACCECN (26)] Driver can receive TSO with CWR flag set,
+    which will be applied to all segments in a super-skb.
+
 \item[VIRTIO_NET_F_DEVICE_STATS(50)] Device can provide device-level statistics
     to the driver through the control virtqueue.
 
@@ -147,6 +155,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
 \item[VIRTIO_NET_F_GUEST_TSO4] Requires VIRTIO_NET_F_GUEST_CSUM.
 \item[VIRTIO_NET_F_GUEST_TSO6] Requires VIRTIO_NET_F_GUEST_CSUM.
 \item[VIRTIO_NET_F_GUEST_ECN] Requires VIRTIO_NET_F_GUEST_TSO4 or VIRTIO_NET_F_GUEST_TSO6.
+\item[VIRTIO_NET_F_GUEST_ACCECN] Requires VIRTIO_NET_F_GUEST_TSO4 or VIRTIO_NET_F_GUEST_TSO6.
 \item[VIRTIO_NET_F_GUEST_UFO] Requires VIRTIO_NET_F_GUEST_CSUM.
 \item[VIRTIO_NET_F_GUEST_USO4] Requires VIRTIO_NET_F_GUEST_CSUM.
 \item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM.
@@ -157,6 +166,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
 \item[VIRTIO_NET_F_HOST_TSO4] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_TSO6] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_ECN] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_NET_F_HOST_TSO6.
+\item[VIRTIO_NET_F_HOST_ACCECN] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_NET_F_HOST_TSO6.
 \item[VIRTIO_NET_F_HOST_UFO] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_USO] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO] Requires VIRTIO_NET_F_HOST_TSO4, VIRTIO_NET_F_HOST_TSO6
@@ -280,11 +290,11 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
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
 
@@ -334,11 +344,11 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
 
 If the driver negotiates VIRTIO_NET_F_MTU, it MUST supply enough receive
 buffers to receive at least one receive packet of size \field{mtu} (plus low
-level ethernet header length) with \field{gso_type} NONE or ECN.
+level ethernet header length) with \field{gso_type} NONE or ECN or ACCECN.
 
 If the driver negotiates VIRTIO_NET_F_MTU, it MUST NOT transmit packets of
 size exceeding the value of \field{mtu} (plus low level ethernet header length)
-with \field{gso_type} NONE or ECN.
+with \field{gso_type} NONE or ECN or ACCECN.
 
 A driver SHOULD negotiate the VIRTIO_NET_F_STANDBY feature if the device offers it.
 
@@ -429,10 +439,15 @@ \subsection{Device Initialization}\label{sec:Device Types / Network Device / Dev
    The VIRTIO_NET_F_GUEST_CSUM feature indicates that partially
   checksummed packets can be received, and if it can do that then
   the VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6,
+<<<<<<< HEAD
   VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_GUEST_USO4,
   VIRTIO_NET_F_GUEST_USO6 VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO and
   VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM are the input equivalents of
   the features described above.
+=======
+  VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_GUEST_ACCECN, VIRTIO_NET_F_GUEST_USO4
+  and VIRTIO_NET_F_GUEST_USO6 are the input equivalents of the features described above.
+>>>>>>> a412354 (net/description.tex: New accurate ECN and fixed ECN in virtio-spec)
   See \ref{sec:Device Types / Network Device / Device Operation /
 Setting Up Receive Buffers}~\nameref{sec:Device Types / Network
 Device / Device Operation / Setting Up Receive Buffers} and
@@ -585,8 +600,12 @@ \subsection{Device Operation}\label{sec:Device Types / Network Device / Device O
 #define VIRTIO_NET_HDR_GSO_UDP         3
 #define VIRTIO_NET_HDR_GSO_TCPV6       4
 #define VIRTIO_NET_HDR_GSO_UDP_L4      5
+<<<<<<< HEAD
 #define VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 0x20
 #define VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 0x40
+=======
+#define VIRTIO_NET_HDR_GSO_ACCECN   0x40
+>>>>>>> a412354 (net/description.tex: New accurate ECN and fixed ECN in virtio-spec)
 #define VIRTIO_NET_HDR_GSO_ECN      0x80
         u8 gso_type;
         le16 hdr_len;
@@ -695,8 +714,13 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 
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
 
 \item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feature and the
@@ -788,11 +812,12 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 \field{gso_type} to VIRTIO_NET_HDR_GSO_UDP_L4.
 
 The driver SHOULD NOT send to the device TCP packets requiring segmentation offload
-which have the Explicit Congestion Notification bit set, unless the
-VIRTIO_NET_F_HOST_ECN feature is negotiated, in which case the
-driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
+which have the Congestion Window Reduced flag set and require the flag be clared from
+the 2nd segment of the super-skb, unless the VIRTIO_NET_F_HOST_ECN feature is
+negotiated, in which case the driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
 \field{gso_type}.
 
+<<<<<<< HEAD
 If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, the driver MAY set
 VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit
 in \field{gso_type} according to the inner network header protocol type
@@ -829,6 +854,12 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 The driver MUST NOT set the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit \field{flags}
 without setting either the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or
 the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type}.
+=======
+The driver SHOULD NOT send to the device TCP packets requiring segmentation offload
+which have the congestion Window Reduced flag set and require the flag not be cleared
+in the super-skb, unless the VIRTIO_NET_F_HOST_ACCECN feature is negotiated, in which
+case the driver MUST set the VIRTIO_NET_HDR_GSO_ACCECN bit in \field{gso_type}.
+>>>>>>> a412354 (net/description.tex: New accurate ECN and fixed ECN in virtio-spec)
 
 If the VIRTIO_NET_F_CSUM feature has been negotiated, the
 driver MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
@@ -1104,10 +1135,15 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
   in case of tunnels) has been validated.
 \end{enumerate}
 
+<<<<<<< HEAD
 Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, UDP_TUNNEL
 and ECN features enable receive checksum, large receive offload and ECN
+=======
+Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, ECN, ACCECN
+features enable receive checksum, large receive offload, ECN and ACCECN
+>>>>>>> a412354 (net/description.tex: New accurate ECN and fixed ECN in virtio-spec)
 support which are the input equivalents of the transmit checksum,
-transmit segmentation offloading and ECN features, as described
+transmit segmentation offloading, ECN and ACCECN features, as described
 in \ref{sec:Device Types / Network Device / Device Operation /
 Packet Transmission}:
 \begin{enumerate}
@@ -1210,11 +1246,16 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in \field{flags}.
 
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
@@ -2186,8 +2227,12 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 #define VIRTIO_NET_F_GUEST_TSO6       8
 #define VIRTIO_NET_F_GUEST_ECN        9
 #define VIRTIO_NET_F_GUEST_UFO        10
+<<<<<<< HEAD
 #define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO  46
 #define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM 47
+=======
+#define VIRTIO_NET_F_GUEST_ACCECN     26
+>>>>>>> a412354 (net/description.tex: New accurate ECN and fixed ECN in virtio-spec)
 #define VIRTIO_NET_F_GUEST_USO4       54
 #define VIRTIO_NET_F_GUEST_USO6       55
 
-- 
2.34.1

