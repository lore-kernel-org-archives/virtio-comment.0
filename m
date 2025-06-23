Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011002.outbound.protection.outlook.com [52.101.70.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFD24409
	for <virtio-comment@lists.linux.dev>; Mon, 23 Jun 2025 08:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750666744; cv=fail; b=bKEvVcPMXCOx48yPfY98BHmlUrdVGl8FwBj7MNYkqBZa6Sb6Nm+1MVjXUXcZMYMjjxhr+J7e0MuQN8Q2wGVIH2GrYsUOcMVT+HCTvC/Bzi+ASEUzljMZIoKd5YyYeFR9U6+SRzERgt/TZpIiHCZX/9PgtlX1pVmuTrctSDfAr2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750666744; c=relaxed/simple;
	bh=9vjEOrmHrpm02oe+BQbfHC0tdLyDwgmocupDH4mHt98=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PNEKPUoxiXBPIMNydSRVt2mrWqrxhKn4EW0w/DKuKg00j8QX19RRXU42ioyoW+/SeCghAYlZHzHnL30nukiZFuMLBGX6ecHHpTAb2ggoyd2vxGOyG8eUZRu9XqOvX7f5nnw0oyxmuNqRPZylgHvjCUPf6d7suzcxfaGbotrZChI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=sBG8LH50; arc=fail smtp.client-ip=52.101.70.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="sBG8LH50"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HvfsTQzHmBqgsCDq7syqfSuydRw/l/3WLsAhunCRgpQ8/tyE/uC31f81HGEmZMl2K/pEN9yaa0WdHoBt6ft9ltT0c5/aY+StWpVdK3nV4WKGIpTxzhT+lbBRLxzF29uJNQUVQ1lMzf/FnsjUiMHaGu6tQyl6zClWfuiCwSagTDMZWs3lCXAYqe997CeWRHSvIswJaNjmBvieuYx0XaOspjQg1fcjJEC1FEwfuVeA62e9LLlKta/cpi/o/rYIpQeHgErJOujcja2uCE3heagxAoEZN6WbInWJd0FuJzFnyTlvdsQ9y7yyMl3wDMT328O7y9UsdQmjD2i8ToEwPTz0gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NoN0e0Q8ZXzN1C7cS8AeBdztT/dWce4opj5VNWEJu9E=;
 b=gempuKfLfTszk469SIyBk9j23yi28AkXQGB/id542iYSVnFARfqUuzAs+t08dGvdXt0jRhb4VicG1pa7MMTrJdA3PmLgYaSoJGPCRMkwieGKZRp4a2txhyRS2J5dZVWcPGkhUBAKRkUXFOtdIccn1PNcflzLIfQw8Q7fzM69OWtKCeqSOprvQanJlv3qF+UCt27aVLYXJOY+ZDsE0tAD1YcF9N7qYzjDs/AK/uUxtEA8nfS+fBP5aizsH6u0z7YJxruv6QWUzocf7UPuVQ7GiZcR7XKq+hSWoJNKDEoe9K9fdEKpBjwlBebld90P8bz2rJk8m/y5kSxAtbghS2vNdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.6.100) smtp.rcpttodomain=apple.com smtp.mailfrom=nokia-bell-labs.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nokia-bell-labs.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NoN0e0Q8ZXzN1C7cS8AeBdztT/dWce4opj5VNWEJu9E=;
 b=sBG8LH50+BF2CxM4CayiVuQNq0l/5c6Ui7LyQwbNj1noDbLllkJ6pEBaIiSTsWr/TS39gGLEu+dyE+GwGqoIJnEB6mkN1p4n/0HUzdq6Cujsq59kOyeN2MMy/ONy5TbB9CpTW0SIGE4db2reAEeTZP9u9KFxOHu3iVezylPyH6ERHmGJlgG3dk97/CE030cQ+f4EvxwbKBO82EiI+s+asZIxzDIpc4Y8aNQbAAmV18pSDBfRJZlvw53nxFskb/okdRMyojlc3uXleYDDxD33s+6/YSNK3xr1SWzPLa1NvQWRUnmc59VlbIXJVQmcFSPNQpdQAULl11207nbhHEwhqQ==
Received: from AM6P195CA0027.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::40)
 by DU0PR07MB9016.eurprd07.prod.outlook.com (2603:10a6:10:40b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Mon, 23 Jun
 2025 08:18:59 +0000
Received: from AMS0EPF000001B2.eurprd05.prod.outlook.com
 (2603:10a6:209:81:cafe::96) by AM6P195CA0027.outlook.office365.com
 (2603:10a6:209:81::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.29 via Frontend Transport; Mon,
 23 Jun 2025 08:18:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.6.100)
 smtp.mailfrom=nokia-bell-labs.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nokia-bell-labs.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia-bell-labs.com
 designates 131.228.6.100 as permitted sender)
 receiver=protection.outlook.com; client-ip=131.228.6.100;
 helo=fr711usmtp2.zeu.alcatel-lucent.com; pr=C
Received: from fr711usmtp2.zeu.alcatel-lucent.com (131.228.6.100) by
 AMS0EPF000001B2.mail.protection.outlook.com (10.167.16.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Mon, 23 Jun 2025 08:18:58 +0000
Received: from sarah.nbl.nsn-rdnet.net (sarah.nbl.nsn-rdnet.net [10.0.73.150])
	by fr711usmtp2.zeu.alcatel-lucent.com (Postfix) with ESMTP id 8E4FB680034;
	Mon, 23 Jun 2025 11:18:57 +0300 (EEST)
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
Subject: [PATCH v9 RESEND 2/2] virtio-net: Define Accurate ECN feature in virtio-spec
Date: Mon, 23 Jun 2025 10:18:47 +0200
Message-Id: <20250623081847.21264-3-chia-yu.chang@nokia-bell-labs.com>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B2:EE_|DU0PR07MB9016:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7da2e0ec-2b5f-4f3f-e5a6-08ddb22e9a76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VkiUHYtQPt4KBVgcoj35Xv9x2E8ceQQmeHOG/4TiqXu9p0r4stNpRazEUXaJ?=
 =?us-ascii?Q?zjDmQh80jRYDQ739xxiB8TF9pCthb6ruE6iOHQFNHTsAvVzpLdHOXKVpmSAY?=
 =?us-ascii?Q?k0nsTaTkrSQrLbH6Y3MJTHSYST2XG8eS5EJCUW06/j9bsByN2S7j8vROqvzw?=
 =?us-ascii?Q?zrVMAwuPkCkDMNHik1JDy32MlwqkXmWP/B81UG61i9dSF5HLd63s85GdsAez?=
 =?us-ascii?Q?gJ+8B5MtQ+jwV4nfWMa8X2o4238sBM+181jeYJHAnvx0/BVf1AgXAaLTL+lk?=
 =?us-ascii?Q?a2mBuCNc4FNnBR9XtFvLJYWlwYrqIaVCOxzVogRvLuqtXeyU4zVV0M0xj7wQ?=
 =?us-ascii?Q?mIRqtzxu9pRi3mxRBPbcQoz/3nydIGPIY41AuP5dQfdnPe3XgO16IQGr2VRX?=
 =?us-ascii?Q?XVkFJVUogDhkXuNRPDOuYgqHaxmctpI/3SdBJ5WC0QxN8zUybdddNbBCzpg3?=
 =?us-ascii?Q?t4yrFlqFMy+jziAlGa8Mhy9lEnsxCxiFRcGe9QfZ4eRSSbWQH8u4nsOVhbnZ?=
 =?us-ascii?Q?MjfOJUqM/LBWRHT4Y0gFNFrOOApU7ah3GQN7JwG/JyJLd+6UMP0MAglfIWS3?=
 =?us-ascii?Q?j+MpenITsJO1ki6ryWIg9O90NAEbkApbAvzY/c4fc+AfykE1rmXX5ee+b1Yc?=
 =?us-ascii?Q?lMRgi/Sxt0sw5/C0eJhW1Yd53OPEotvLkaVAc9SStoWL5u+w8uRIQ4+oqrjV?=
 =?us-ascii?Q?4cx2oIZxH4SAwx7OBVMAy0HRcmKt0m9Gwb29wORwo07X2o7YaRYit7+yn5z8?=
 =?us-ascii?Q?7wG3P6jxkk6NF0mG+kFHeV5zVKHoCaQTY2rUbKzAEi+X1+LW8zGilUOzZHKy?=
 =?us-ascii?Q?ei9+9mDs3x5lr+jTVMBK9U7/FMxjhsbPq9zi63Dyh9WTOzYCAgTc5sLSS7+0?=
 =?us-ascii?Q?BwTkpYyLJ+X0CoTRTeZO6BQOsO4wAQseQnmQlfY839HjWiP0qNs7TaambO7O?=
 =?us-ascii?Q?+9NKcDuQz37Td2E3tNlQSmcFSishS3qL7U9FNUkA2o3nlzOgEeafKrbvxxmn?=
 =?us-ascii?Q?hq6ZTLuHJaRtyJEyrXb9xqfmznZZggAA1qPvASDLelyUyVRS7evhfD96lHUq?=
 =?us-ascii?Q?3xT+atPjxICmg7rjxGwpZ/dETP5omban6S4BVWsfj6XtMKhvyr9MlxzlW7YN?=
 =?us-ascii?Q?mD3WyiMQoSerULM33/hNE36Fta6+zvsXZsrwdjyrNPpCLBWZ0YDGfaDoL9Zy?=
 =?us-ascii?Q?wZNIsxV2pqYN666J7ib4aAnJcJ9Ax+idv1+bPZ8qal/Bdtqcs+rOCoByyl1G?=
 =?us-ascii?Q?tovF5kgTfLbuzfy8iDkrZCTcgYV8axaork6wITaJGi+yRv4Rk+TWq/esOSqu?=
 =?us-ascii?Q?A2035Onq/FqLVr0OabPaGRznHFOibvXZcjlIVLxGZrGQMFPUaP8V3Mv9ZCia?=
 =?us-ascii?Q?OAv6nEnrMsnH/+D1sYISnhA7pgCtM7i0v5J7yM5Bt6UPEqcsy1R0DYhAcTg4?=
 =?us-ascii?Q?7wEKdtY1VkNpojcn2dm/KXVSDjhsg3ykz+amvgu/a2XRM8AnmXSgTYzcEY/N?=
 =?us-ascii?Q?bUcLXwlUPx6KWcsEI90Ba35wzMF8IkD8TY1nWOM981pnZjEueDFdqzfNxg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:131.228.6.100;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fr711usmtp2.zeu.alcatel-lucent.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 08:18:58.5271
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7da2e0ec-2b5f-4f3f-e5a6-08ddb22e9a76
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.6.100];Helo=[fr711usmtp2.zeu.alcatel-lucent.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR07MB9016

From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

This change implements Accurate ECN based on the AccECN specification:
  https://tools.ietf.org/id/draft-ietf-tcpm-accurate-ecn-28.txt

Unlike RFC3168 ECN, Accurate ECN uses the TCP CWR flag as part of the ACE
field to count new packets with CE marks in the IP-ECN field; however,
RFC 3168 ECN-aware TSO will clean the TCP CWR flag from the 2nd segment of
an aggregated segment. Therefore, fallback shall be applied by setting
NETIF_F_GSO_ACCECN to ensure that the CWR flag should not be changed within
the aggregated segment (e.g., super-skb in Linux).

To apply it in virtio-spec, new feature bits for host and guest are added
for feature negotiation between driver and device. And the translation of
the Accurate ECN GSO flag between virtio_net_hdr and skb header for
NETIF_F_GSO_ACCECN is also added to avoid CWR flag corruption due to RFC3168
ECN TSO.

Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
---
 device-types/net/description.tex | 54 +++++++++++++++++++++++++-------
 introduction.tex                 |  3 ++
 2 files changed, 46 insertions(+), 11 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index bba50ff..aa3c27c 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -150,6 +150,15 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
  when VIRTIO_NET_F_IPSEC is negotiated. When a device offers IPsec feature, it SHOULD
  also offer the VIRTIO_NET_F_OUT_NET_HEADER feature.
 
+\item[VIRTIO_NET_F_HOST_ACCECN (71)] Device can receive TSO and follow
+  the requirements of the ACE field described in
+  ``Section 3.3.4 . Requirements for TCP Segmentation Offload and Large Receive Offload''
+  of \hyperref[intro:accecn]{[AccECN]}.
+
+\item[VIRTIO_NET_F_GUEST_ACCECN (72)] Driver can receive TSO and follow
+  the requirements of the ACE field described in
+  ``Section 3.3.4 . Requirements for TCP Segmentation Offload and Large Receive Offload''
+  of \hyperref[intro:accecn]{[AccECN]}.
 \end{description}
 
 \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device / Feature bits / Feature bit requirements}
@@ -161,6 +170,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
 \item[VIRTIO_NET_F_GUEST_TSO4] Requires VIRTIO_NET_F_GUEST_CSUM.
 \item[VIRTIO_NET_F_GUEST_TSO6] Requires VIRTIO_NET_F_GUEST_CSUM.
 \item[VIRTIO_NET_F_GUEST_ECN] Requires VIRTIO_NET_F_GUEST_TSO4 or VIRTIO_NET_F_GUEST_TSO6.
+\item[VIRTIO_NET_F_GUEST_ACCECN] Requires VIRTIO_NET_F_GUEST_TSO4 or VIRTIO_NET_F_GUEST_TSO6.
 \item[VIRTIO_NET_F_GUEST_UFO] Requires VIRTIO_NET_F_GUEST_CSUM.
 \item[VIRTIO_NET_F_GUEST_USO4] Requires VIRTIO_NET_F_GUEST_CSUM.
 \item[VIRTIO_NET_F_GUEST_USO6] Requires VIRTIO_NET_F_GUEST_CSUM.
@@ -171,6 +181,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
 \item[VIRTIO_NET_F_HOST_TSO4] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_TSO6] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_ECN] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_NET_F_HOST_TSO6.
+\item[VIRTIO_NET_F_HOST_ACCECN] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_NET_F_HOST_TSO6.
 \item[VIRTIO_NET_F_HOST_UFO] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_USO] Requires VIRTIO_NET_F_CSUM.
 \item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO] Requires VIRTIO_NET_F_HOST_TSO4, VIRTIO_NET_F_HOST_TSO6
@@ -294,11 +305,11 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
 The device MUST NOT modify \field{mtu} once it has been set.
 
 The device MUST NOT pass received packets that exceed \field{mtu} (plus low
-level ethernet header length) size with \field{gso_type} NONE or ECN
+level ethernet header length) size with \field{gso_type} NONE, ECN or ACCECN
 after VIRTIO_NET_F_MTU has been successfully negotiated.
 
 The device MUST forward transmitted packets of up to \field{mtu} (plus low
-level ethernet header length) size with \field{gso_type} NONE or ECN, and do
+level ethernet header length) size with \field{gso_type} NONE, ECN or ACCECN, and do
 so without fragmentation, after VIRTIO_NET_F_MTU has been successfully
 negotiated.
 
@@ -348,11 +359,11 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
 
 If the driver negotiates VIRTIO_NET_F_MTU, it MUST supply enough receive
 buffers to receive at least one receive packet of size \field{mtu} (plus low
-level ethernet header length) with \field{gso_type} NONE or ECN.
+level ethernet header length) with \field{gso_type} NONE, ECN or ACCECN.
 
 If the driver negotiates VIRTIO_NET_F_MTU, it MUST NOT transmit packets of
 size exceeding the value of \field{mtu} (plus low level ethernet header length)
-with \field{gso_type} NONE or ECN.
+with \field{gso_type} NONE, ECN or ACCECN.
 
 A driver SHOULD negotiate the VIRTIO_NET_F_STANDBY feature if the device offers it.
 
@@ -443,7 +454,7 @@ \subsection{Device Initialization}\label{sec:Device Types / Network Device / Dev
    The VIRTIO_NET_F_GUEST_CSUM feature indicates that partially
   checksummed packets can be received, and if it can do that then
   the VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6,
-  VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_GUEST_USO4,
+  VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_GUEST_ACCECN, VIRTIO_NET_F_GUEST_USO4,
   VIRTIO_NET_F_GUEST_USO6 VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO and
   VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM are the input equivalents of
   the features described above.
@@ -613,6 +624,7 @@ \subsection{Device Operation}\label{sec:Device Types / Network Device / Device O
 #define VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 0x20
 #define VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 0x40
 #define VIRTIO_NET_HDR_GSO_ECN      0x80
+#define VIRTIO_NET_HDR_GSO_ACCECN   0x10
         u8 gso_type;
         le16 hdr_len;
         le16 gso_size;
@@ -737,6 +749,13 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
     has the CWR flag set and follows the requirements of the CWR flag described in
     ``Section 6.1.2. The TCP Sender'' of \hyperref[intro:rfc3168]{[RFC3168]}.
     \footnote{This case is not handled by some older hardware, so is called out specifically in the protocol.}.
+
+  \item If the driver negotiated the VIRTIO_NET_F_HOST_ACCECN feature,
+    the VIRTIO_NET_HDR_GSO_ACCECN bit in \field{gso_type} indicates that the TCP packet
+    follows the requirements of the ACE field described in
+    ``Section 3.3.4 . Requirements for TCP Segmentation Offload and Large Receive Offload''
+    of \hyperref[intro:accecn]{[AccECN]}.
+    \footnote{This case is not handled by some older hardware, so is called out specifically in the protocol.}.
    \end{itemize}
 
 \item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feature and the
@@ -837,6 +856,12 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 of \hyperref[intro:rfc3168]{[RFC3168]}, unless the VIRTIO_NET_F_HOST_ECN feature is
 negotiated, in which case the driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
 
+The driver SHOULD NOT send to the device TCP packets requiring segmentation offload
+which need to follow the ACE field requirements described in
+``Section 3.3.4 . Requirements for TCP Segmentation Offload and Large Receive Offload''
+of \hyperref[intro:accecn]{[AccECN]}, unless the VIRTIO_NET_F_HOST_ACCECN feature is
+negotiated, in which case the driver MUST set the VIRTIO_NET_HDR_GSO_ACCECN bit in \field{gso_type}.
+
 If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, the driver MAY set
 VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit
 in \field{gso_type} according to the inner network header protocol type
@@ -1171,12 +1196,12 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
   value to indicate the outer network header offset in packet.
 \end{enumerate}
 
-Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, UDP_TUNNEL
-and ECN features enable receive checksum, large receive offload and RFC3168
-ECN support which are the input equivalents of the transmit checksum,
-transmit segmentation offloading and RFC3168 ECN features, as described
-in \ref{sec:Device Types / Network Device / Device Operation /
-Packet Transmission}:
+Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, UDP_TUNNEL, ECN and
+ACCECN features enable receive checksum, large receive offload, RFC3168 ECN
+and Accurate ECN support which are the input equivalents of the transmit
+checksum, transmit segmentation offloading, RFC3168 ECN and Accurate ECN
+features, as described in \ref{sec:Device Types / Network Device /
+Device Operation / Packet Transmission}:
 \begin{enumerate}
 \item If the VIRTIO_NET_F_GUEST_TSO4, TSO6, UFO, USO4 or USO6 options were
   negotiated, then \field{gso_type} MAY be something other than
@@ -1286,6 +1311,12 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 if packet contains a valid network header. Otherwise, the device MUST not
 use \field{outer_nh_offset}.
 
+The device SHOULD NOT send to the driver TCP packets requiring segmentation offload
+which need to follow the ACE field requirements described in
+``Section 3.3.4 . Requirements for TCP Segmentation Offload and Large Receive Offload''
+of \hyperref[intro:accecn]{[AccECN]}, unless the VIRTIO_NET_F_GUEST_ACCECN feature is
+negotiated, in which case the device MUST set the VIRTIO_NET_HDR_GSO_ACCECN bit in \field{gso_type}.
+
 If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the
 device MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
 \field{flags}, if so:
@@ -2286,6 +2317,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 #define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM 47
 #define VIRTIO_NET_F_GUEST_USO4       54
 #define VIRTIO_NET_F_GUEST_USO6       55
+#define VIRTIO_NET_F_GUEST_ACCECN     70
 
 #define VIRTIO_NET_CTRL_GUEST_OFFLOADS       5
  #define VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET   0
diff --git a/introduction.tex b/introduction.tex
index 1c4cb33..6afe635 100644
--- a/introduction.tex
+++ b/introduction.tex
@@ -183,6 +183,9 @@ \section{Normative References}\label{sec:Normative References}
 	\phantomsection\label{intro:rfc3168}\textbf{[RFC3168]} &
     S. Floyd., ``The Addition of Explicit Congestion Notification (ECN) to IP'', September 2001.
 	\newline\url{http://www.ietf.org/rfc/rfc3168.txt}\\
+        \phantomsection\label{intro:accecn}\textbf{[AccECN]} &
+    B. Briscoe., ``More Accurate Explicit Congestion Notification (AccECN) Feedback in TCP'', February 2025.
+        \newline\url{https://www.ietf.org/archive/id/draft-ietf-tcpm-accurate-ecn-33.txt}\\
 \end{longtable}
 
 \section{Non-Normative References}
-- 
2.34.1

