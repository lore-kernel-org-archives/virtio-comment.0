Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2083.outbound.protection.outlook.com [40.107.94.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A7D1581E0
	for <virtio-comment@lists.linux.dev>; Thu,  6 Jun 2024 10:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717669253; cv=fail; b=sXXyO9okRf251+clZ7nNT4nlSAcPSqDsrtaFYeJZQsW6MZB0NjAl88cyGqJvZQpDUp0vG5NlhB4JhPZX/5XdtFnr91H3wS+qYyC5bUCaXpuNpUyWxZQYIQMLDDDeDDw4W9HR+RBZKOYOiAxm3qB7jRZkiW2aBnWlnR2qmtd/vM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717669253; c=relaxed/simple;
	bh=znMl5llEnCjzw1tPcN/DPcuw0TsYX5oIPdz57uWTo3g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DjxaW8x5YNe9rkBgt/r7if5XxsywBWhp9VLymmYg4yzR421yasIIWoRisqmYeIFgtL7z/WlnFDdRfIHFh2WB9VB/vNXaDrL0gOU/9jUOSMmot4ahnHhJyOut+Zy+cvrzysPREECy3thaPtOxVWRN6A8RuftN2V5hqp+BC3NJAn4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sdb6xpEY; arc=fail smtp.client-ip=40.107.94.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sdb6xpEY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iHwjXui5UL3PDQcZd1X4lqSGAmUWX+1bWEFyEiwH34KwnItc7ew0VwNng6KCV26EES/F/EzjKcAxtCbr70WjWGsg8+uFZyePL8z02vWXP+AHYd+ailwz8pfEiF1R7qiPusn6Ks4hhPls79POtIobqubXjutIT7TJpUdjWJ8PNfp5v815F7sMJOQ/Ybc+jU5Akh7ENy0ocdia+zwdtsaCRrue6R/muCIdgeSFwYnUll5LF04/TkkjC0H2y11v7XhS4kAsM6f5ddsIeBHzOfLz/O8U7sLXxB9qfNSDXCrDBlLu6S1HWW6GtAUi8M6RjWqNCDq+j8seKUF/yOOfjOq6aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K0aRSUpHeKIHfk72upIfNz/Ji38E4s8UaxsSndVDrp0=;
 b=hmH9F/Z+eILSOUGO6DKT3iPWcLBB8QzaeZWiAtiDy/1xZRFL+xBxsEofu4H6SnJBse4MUZyhixtT0Cwln3/Htue6o3EtkucSKkjTfk4ItHvKkpArtoI6QRptbf21EltGD5xf18uGaRfhwUKbHZZBao0Jx9CGpzdgS0mzWxqE4hKSgevhCMxSHpkh7yU/saOIHaDct7K1DOzWY8Q2ddsdy+fqBJnQuuUPm5r/BSOMdrluCbU3ahpp0KRBtZmJBWUlWjhEg2EE2ICM+rlu76E5Vh2Ct2CrZSX2APPe1K0bXlLaZZee8FGnfwWxeYpioIzfp1/YXFFjwjUPn08Zf5mGrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K0aRSUpHeKIHfk72upIfNz/Ji38E4s8UaxsSndVDrp0=;
 b=sdb6xpEYvpdypGLoGzxJQo7XQOoqu3TpKqKSp97NfoOhDpozpTEQ+Bns5qF5wSRlPp1BlIeDDrrh5z3gOnAZTOdXw6eNq1hoKjxVTwgB6YTB2LDI02ZStF1LUDA6DP7iijy5+ovnFFAMMMEycYkf+zUFOhBmFnVHvzpzLICILqIgnnAHI/VbXYusuEwweU2QL4IJYX2cf3Xj2UD2uyIYdWYJlXlYNmNOD9MGhXninF7AvGOSJW4Vk0VrhBelepupdDynHXsx7pDr27GDUSv9z8C49jLcGMFXkF+kABiSdyHdJl6DjoApCSsdDnw45j2LG9DE7feo0MMr0pHjfh0p7A==
Received: from DM6PR06CA0012.namprd06.prod.outlook.com (2603:10b6:5:120::25)
 by LV8PR12MB9420.namprd12.prod.outlook.com (2603:10b6:408:200::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Thu, 6 Jun
 2024 10:20:48 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:5:120:cafe::f2) by DM6PR06CA0012.outlook.office365.com
 (2603:10b6:5:120::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.21 via Frontend
 Transport; Thu, 6 Jun 2024 10:20:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Thu, 6 Jun 2024 10:20:48 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 6 Jun 2024
 03:20:33 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 6 Jun 2024 03:20:30 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <shahafs@nvidia.com>, <xuanzhuo@linux.alibaba.com>,
	<yuri.benditovich@daynix.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH v6 1/3] virtio-net: Fix receive buffer size calculation text
Date: Thu, 6 Jun 2024 13:20:12 +0300
Message-ID: <20240606102014.2103986-2-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240606102014.2103986-1-parav@nvidia.com>
References: <20240606102014.2103986-1-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|LV8PR12MB9420:EE_
X-MS-Office365-Filtering-Correlation-Id: df55496f-b088-4c2c-0fd4-08dc861255a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|36860700004|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jrOGTaJjT0sfgwS9dxT0RkqwVcrXpohzSUqPGh9lXxGodsX4snuTGP8VC6s1?=
 =?us-ascii?Q?SEfsHw7ueFQwWuI4SHstK5y2cgVTgzWHWoix6K5YC4j9ZF/N4YrfLODDoPSL?=
 =?us-ascii?Q?dgFr9WKxM0hGnF0oyaWDQIqLwcGRcxiyShMq0s/OIUMpdhIvhFHQ02gs03bc?=
 =?us-ascii?Q?0CwRmywo3/B2pCqLVvmuBUBu5WBe9K//JyHxcnBN+e+EvIxsEPrgflWsmOI3?=
 =?us-ascii?Q?y0dZHdIZPZNG4pHxy0mr2HGP7jkkp8eCB7uA/esxr0BAQiShuKrp7XQ5MGmn?=
 =?us-ascii?Q?vHWwe29E8pauCNnHozSRvNmIGAhpjZ5K49QvQFCgT+1Snn1egzX8T1aQUBXS?=
 =?us-ascii?Q?+MxBt2YktC9oA8pitvPnbr94Y8eCjwkpUdSU8fB/mliLGy0A6aj4bsLvJfX1?=
 =?us-ascii?Q?3Lpze+/T0z2L+ofOQj7gBaZlJz63Fn2Eo/CyJ+ZD6NyjjUnl4UCgT1BGKzep?=
 =?us-ascii?Q?SHP0kwA36fVJq9lcJV/kfNKs9SnwIGSTmH7eHS1vh3o9IUKof3Qkgg4dOm5T?=
 =?us-ascii?Q?P6rjyCNQMNjd82SaTRCrxBxsMgw1suQseGbBvSD5a2giOER7SU0AUO17kSKB?=
 =?us-ascii?Q?Ag9HRli7fQs2LiZ59MN1B/Ls3hmQE9F9+1yzWPdguC5IEwJFsvRIHZCFVzTd?=
 =?us-ascii?Q?rWDR7DhwlMUKLdkTcpqd5pxAZPAVGZ8sD6a18mWm7N71nKCWf7ZYWqAr8Hxb?=
 =?us-ascii?Q?AKLTjSDQAr8NdGWr+zrw2Ml1kuPMjWHPsZGaEBaafXD6hRao3OMQwAnvkbz2?=
 =?us-ascii?Q?JTRReprFyoq2QS8CBYujx35g8JFpbixATD2mqKafjjUQK6R+S7kpC44hMvq0?=
 =?us-ascii?Q?YoFcQtip04cBhS6+EvsQ/1HhgDx58Of3KLgkiaG3MyFFV+sElOCB2grg77oj?=
 =?us-ascii?Q?JxRHIytgsgLfT5ei6cm4YHM5RYj4SqMrPxJet+jXszOnVOYFG3NnKtmdYUoZ?=
 =?us-ascii?Q?TnfG52KPJvhc/hMcm9HICte6tXqOyvMD3Wg2EFfkDpw2bFII4H7QzQwSWXF1?=
 =?us-ascii?Q?R2jlNjeTHknKF/Ewk81JKcIbDrnCh+Y65WCvQoQYjAH804zv4vN6d+MFWBvU?=
 =?us-ascii?Q?eM3UG2pgnu5hlNERy6HMXmyCtqRwdQnAm8Bydt5CSg8jhoGDS7sqkCKvhZwF?=
 =?us-ascii?Q?iAJEmxmZQo1aRFkVMMhbxXtnUqgZcKFf3ZWALg09Ckxy9oDJf09yUAInfWlW?=
 =?us-ascii?Q?3v/QE4QgDjbXMCeCX47h96JVmNHqZ92JYGH1ksG5/1xI0MQDXfnmY17A5lWs?=
 =?us-ascii?Q?U7aT7lr45Up6HqfAltrP1NDpoRrpuu+6bW/gyVYoZaKpXU0s7dvHWyvHlyxl?=
 =?us-ascii?Q?FHZ9rdns4Z9Ve7o7yyOz8fI1hBo9AJBGXoe7zLbROEva2A9onNxhFMJuIf/j?=
 =?us-ascii?Q?PVmTdEaTt+39K+7rvMMl4Ejlkz9mZNuiuyX+ecbdyWUv0/4WFW7I+X7cMokU?=
 =?us-ascii?Q?BopULNypPdc=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(376005)(36860700004)(1800799015)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 10:20:48.2972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df55496f-b088-4c2c-0fd4-08dc861255a8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9420

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
Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Signed-off-by: Parav Pandit <parav@nvidia.com>

---
changelog:
v5->v6:
- Fixed 'must' to 'MUST'
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
index 61cce1f..d8271fc 100644
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
+MUST consider all the fields inclusive up to \field{padding_reserved},
+i.e. 20 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated, and 12 bytes if not.
+
 If VIRTIO_NET_F_MQ is negotiated, each of receiveq1\ldots receiveqN
 that will be used SHOULD be populated with receive buffers.
 
-- 
2.34.1

