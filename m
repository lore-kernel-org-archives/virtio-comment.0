Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E67C42076
	for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 12:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716294239; cv=fail; b=L3auCDz7Qw69iDejJiusEvhKdC97ntFTq+PpxhxHEf6wQSTcGvdleeZdxUwnJhMQz3q/rflmCBTS9h8haEQhZ8C424ZEnWDCbQdb7XceLKUww/7j882iO7+IB0c2nTar9kkX+JnYQl20t+eVxw3H+2pOOCN/Yyls40SPDoQW6w8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716294239; c=relaxed/simple;
	bh=x/s0jRo+jUvNQv3OEbappIhl/9veGjwS/JggY3wey1g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RI15CyZssDcnbG4PX0J/sb9fGAyMt7gPJuMV050QKNkkvGfNS9pssS3kpc6FFH/Uouwke5K+jCmyXSSlSH3AMtY+x+sINvxy/PNM3RIFAlqwpw80Sd7pLNhMep/4t/5td+4HjIV3TGZpXpGcOaHwOWjKPPPV7V9Hvcoj2gg/2Zg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cOtRPJn1; arc=fail smtp.client-ip=40.107.236.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cOtRPJn1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RaZfifV81GCuJ4fvaS9xoyMC3hXedn1Hokgc1AXQYga133cZ22Eq3+NPl6Tane3z7FGXnQelHHQWscIzBnE6ZzIlA6tx9kz/W2evvA8LwncP51xKzFISN5mRZU7KhHj1ZHCwnRvMSzFak10XJFEh3bllb67K3nZnIbCDXq6y8pWEHncgGNjYfEejK+f+66QldpJYlxwyRLgDrJFfGWfvZ838EtHt5Pt+oQKl0vx6z/vGLHHYRPQf51HlECUhQ2KBBbjVtMFWjhdx9xhydmlXJMNI6vY+U5uL898oFs5ImvWYlxrU/4d1YxgvOI7gH0N8GZBQ0RT6vVUWT9VY3Zgkfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=916x9akOnAd81US/fzGSBA4ZFRspZN4RRIiqz6bkweE=;
 b=hp6PaFc2r7OrgUMrplPcu92e/pO4N5Aah56BUpSiKwyJL8+b2JQ5v1Z59VTmWUW3ithf7cLV4vK+/z1gxcv1BJsWa3qGhIavA0iAYlRlnQhmAGwOwXm228oTWst4eXJolaCcBJf3Z+8ZjSw80Y/Ik64jbAt5ZzSjnaN1J0dr/4kv51FYDCORbJ6w0eskXRvI0ButOtkWC2ieUyNdURhKbLYUQZ3o2OhCSugI6rcZjtlu5TISwOAM8acMziNI7MvbluZ6zIGb6t3o0ZF37LIFQGHyDzkQrcLD4ToAMmIynb9obstrw/Luj3Y9k63NzDysuZyWdb6O4l/3R8ZvIFfQMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=916x9akOnAd81US/fzGSBA4ZFRspZN4RRIiqz6bkweE=;
 b=cOtRPJn1sBrbwvQoD2CvOm9Ty1torheYE2wTiEm9UxxcfgUop26ck+8A3/VpazWe5GRVnkvHVUnbXgX4Gf0ILROiQiFecCmUW7iDQgGdJESW3/iuQFJmgi4HbP7VjbU879RDuvhCekDppPjK05ywx1vX4WkL5b3NdNc7ps0czh2i83vYsv1gLSbNurNpvlKIhoO4nqqeFXJQrEGd/pDKmzRnRCU+1Sh4pVMvjlOP6/59BfyefZoPeE8PBj+kCVX7jZAmHcvonD7aAnmJmH6Kskn+vHKXbFmFk/UBt55Un/AnbIm31YPbNckgub/NBlpR7u9piEto3z4TdmJRKP6jAQ==
Received: from BYAPR07CA0030.namprd07.prod.outlook.com (2603:10b6:a02:bc::43)
 by DM4PR12MB6206.namprd12.prod.outlook.com (2603:10b6:8:a7::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.18; Tue, 21 May 2024 12:23:53 +0000
Received: from CO1PEPF000042AE.namprd03.prod.outlook.com
 (2603:10b6:a02:bc:cafe::6e) by BYAPR07CA0030.outlook.office365.com
 (2603:10b6:a02:bc::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36 via Frontend
 Transport; Tue, 21 May 2024 12:23:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000042AE.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.14 via Frontend Transport; Tue, 21 May 2024 12:23:53 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 21 May
 2024 05:23:36 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 21 May 2024 05:23:34 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <shahafs@nvidia.com>, <xuanzhuo@linux.alibaba.com>,
	<yuri.benditovich@daynix.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH v5 1/3] virtio-net: Fix receive buffer size calculation text
Date: Tue, 21 May 2024 15:23:01 +0300
Message-ID: <20240521122303.2004122-2-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240521122303.2004122-1-parav@nvidia.com>
References: <20240521122303.2004122-1-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|DM4PR12MB6206:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c822818-e289-427d-7937-08dc7990e0c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|376005|36860700004|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?P+KMacf+9myFUv/9/UENdXYsp26VCsVr8zxBooS4RuNTEV5ila1tedGWOHDC?=
 =?us-ascii?Q?VDztEsVxad++0UaN0atYUfbbyPD3Uxk8ACSj5txh813vjlwPA39yfpD6pWbq?=
 =?us-ascii?Q?JWoMObW3qgfhfsiMUSkwj3eTbWM3VZAVMmT7O3QzpSALisGMoajAwRiG3LwF?=
 =?us-ascii?Q?MUVc37WkAj69LC8JKPg43eipwf/g50EG0pGJ/odS73Ln1EYS6H6eJfJ1u03f?=
 =?us-ascii?Q?Gz8E2SWWkc5hmqOJ/I75MY/GzMmV6QUSUfPuRNNaB+83GMRp4kMFHC2H9plY?=
 =?us-ascii?Q?K7KQ7FUJqwivvSNvaPC0dh+z7eI5VwIl7XsHb9/5ri6YJEpcGwKMB91fa2J8?=
 =?us-ascii?Q?chvY+1iiaoElhuB6+P8C1CA9BID8ylvDYbLt2TQE/AktfjHa4LPy/E3VkPQ5?=
 =?us-ascii?Q?47DNFzIqNicPxmGWvriUgFqMHeQOtqi1I6ZS6BbshDC7b07jkuq8Z+DIWFF0?=
 =?us-ascii?Q?YunOdAHXD9Fu7xnMnVRDV844lNkrLLKCN5FG2njYbioVO2ZB4y5rmqMNEYHO?=
 =?us-ascii?Q?6TABQgvNefyXllkUiGuVSY/1ywdZuRX+axMueeciuKVi4gbOYB4IVv1FMRDE?=
 =?us-ascii?Q?SJt57ldT6Lh6/nmvluV3a/B7woNPmnkqM3iVTdHRjHuFsOfQVqdDewfWm1Ej?=
 =?us-ascii?Q?Xs8R3m0t1Dy9xl7Cl00jA/82VeRHxG/SqwqtFCfUfbcbTK6xeIGK+SzH9CHq?=
 =?us-ascii?Q?VVEWjusrx8bhDEhpRfKrx0UpHGolMne96x3SkHT89SF4r25hCHn3Oy51aD4E?=
 =?us-ascii?Q?kS2maZD69lbtGlHV72sj1TWLQL0gt5JCUguPlcZxQ+vs7hY2lHoEzgh0KMRS?=
 =?us-ascii?Q?toMkRXQ60urh+ZaiGdW2Ed8cu7H9rSyY4IIciArUKHvPEkyTuMFk1IlUL8sE?=
 =?us-ascii?Q?KGKR9GV2rM1wU1XRwAaOkcvxH648QBL7MVBNDkh68QcWfNdWyFDWtcAH040d?=
 =?us-ascii?Q?BgrlliJ1/z3YiDOwOR3vKOJE9sSNfrDU520vAdKGdx2Uo5SxrvfvQ8iVYzWB?=
 =?us-ascii?Q?nnmkxv1EnLPWDJ2u+lP4I6+HfODH4+5Obn1iyCMNjZaAIFBgCZur44cG/3oh?=
 =?us-ascii?Q?HuZYJc8W4Q7EPUbW3oQZQJtL+/dKNb29HNeFv0WfGB/9yWcYYNJK39ExQ/WY?=
 =?us-ascii?Q?leF1GUvEPs2IHLHdFZ5DI/xfanrrlCcP1yis6BmPINrbEgVPXZk47LI18miu?=
 =?us-ascii?Q?PCJ41pJRBfmm9UvSwkw/va/goeULtisg6mLdSgTX0JEP/4vdZryTyC84joRC?=
 =?us-ascii?Q?vGjCHR/K6v08eBna2lEGb1aaQVf7YTILHf7N/vickOGFRh/HgBaguAS+aiKE?=
 =?us-ascii?Q?tzTy75k8HiC2lgWeqRkGiWOl4MnBpRpS427/DYyUGsV1x1bhDHbl2t9MB+ZT?=
 =?us-ascii?Q?sWiMWt7ELSs4N2JMoDxzi9756jjP?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(1800799015)(376005)(36860700004)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 12:23:53.2185
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c822818-e289-427d-7937-08dc7990e0c6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6206

Receive buffer size calculation is based on the following
negotiated features.

The text has wrong calculation for IPv6 and also it has missed
VIRTIO_NET_F_HASH_REPORT.

The problem of igorance of VIRTIO_NET_F_HASH_REPORT is reported
in [1], however fix for ipv6 payload length must also be
considered.

Since for the both the fixes touching same requirements, a
new issue is created as [2].

This patch brings following fixes.

1. Fix annotating struct virtio_net_hdr as field
2. Fix receive buffer calculation for guest GSO cases to consider
   ipv6 payload length
3. small grammar corrections for article
4. reword the requirement to consider the virtio_ndr_hdr which is
   depends on the negotiated feature, hence first clarify the
   struct virtio_net_hdr size

[1] https://github.com/oasis-tcs/virtio-spec/issues/170
[2] https://github.com/oasis-tcs/virtio-spec/issues/183

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/170
Fixes: https://github.com/oasis-tcs/virtio-spec/issues/183
Signed-off-by: Parav Pandit <parav@nvidia.com>

---
changelog:
v3->v4:
- addressed comments from Cornelia
- rephrase for virtio_net_hdr size calculation
v2->v3:
- addressed comments from Cornelia
- added virtio_net_hdr inclusion description in buffer size calculation text
v1->v2:
- addressed comments from Cornelia
- rephrase buffer size wording without explicit length of virtio_net_hdr
  at 3 places.
- replaced otherwise to ', otherwise'
- rephrase non normative to write as driver normative
---
 device-types/net/description.tex | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 61cce1f..0753ba8 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -660,10 +660,15 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network Devi
 If the VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6,
 VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6
 features are used, the maximum incoming packet
-will be to 65550 bytes long (the maximum size of a
-TCP or UDP packet, plus the 14 byte ethernet header), otherwise
-1514 bytes.  The 12-byte struct virtio_net_hdr is prepended to this,
-making for 65562 or 1526 bytes.
+will be 65589 bytes long (14 bytes of Ethernet header, plus 40 bytes of
+the IPv6 header, plus 65535 bytes of maximum IPv6 payload including any
+extension header), otherwise 1514 bytes.
+When VIRTIO_NET_F_HASH_REPORT is not negotiated, the required receive buffer
+size is either 65601 or 1526 bytes accounting for 20 bytes of
+\field{struct virtio_net_hdr} followed by receive packet.
+When VIRTIO_NET_F_HASH_REPORT is negotiated, the required receive buffer
+size is either 65609 or 1534 bytes accounting for 12 bytes of
+\field{struct virtio_net_hdr} followed by receive packet.
 
 \drivernormative{\paragraph}{Setting Up Receive Buffers}{Device Types / Network Device / Device Operation / Setting Up Receive Buffers}
 
@@ -672,18 +677,25 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network Devi
   \begin{itemize}
     \item If VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6, VIRTIO_NET_F_GUEST_UFO,
 	VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6 are negotiated, the driver SHOULD populate
-      the receive queue(s) with buffers of at least 65562 bytes.
+      the receive queue(s) with buffers of at least 65609 bytes if
+      VIRTIO_NET_F_HASH_REPORT is negotiated, and of at least 65601 bytes if not.
     \item Otherwise, the driver SHOULD populate the receive queue(s)
-      with buffers of at least 1526 bytes.
+      with buffers of at least 1534 bytes if VIRTIO_NET_F_HASH_REPORT
+      is negotiated, and of at least 1526 bytes if not.
   \end{itemize}
 \item If VIRTIO_NET_F_MRG_RXBUF is negotiated, each buffer MUST be at
-least the size of the struct virtio_net_hdr.
+least size of \field{struct virtio_net_hdr},
+i.e. 20 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated, and 12 bytes if not.
 \end{itemize}
 
 \begin{note}
 Obviously each buffer can be split across multiple descriptor elements.
 \end{note}
 
+When calculating the size of \field{struct virtio_net_hdr}, the driver
+must consider all the fields inclusive up to \field{padding_reserved},
+i.e. 20 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated, and 12 bytes if not.
+
 If VIRTIO_NET_F_MQ is negotiated, each of receiveq1\ldots receiveqN
 that will be used SHOULD be populated with receive buffers.
 
-- 
2.34.1

