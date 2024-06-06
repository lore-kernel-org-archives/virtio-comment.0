Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2068.outbound.protection.outlook.com [40.107.92.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51779158848
	for <virtio-comment@lists.linux.dev>; Thu,  6 Jun 2024 10:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717669258; cv=fail; b=HOvwYLw4X7VBNnda8xtWlJBVg588yLVbBPcr+dSB/nzmY2pNqvlOBNPg2yC2W6ft4zgUqharaRqudAO18UysVB/3EBg6V71ZS0k9BXsMmzdLrE4dJUZ9UWroT1dFOAOEUv/w16b2GGsXTVPW0d+qT1ohwH5t9l9jrRgOYj+2EnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717669258; c=relaxed/simple;
	bh=wgX+WE+byYJuc0CQGFXr3WRPc4ZJPc0xm20zvWcc8L8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bu3ITzF60xddIdyXhmcge5m4aZFX7omirWzN4oJWiBJ61vIypWMUZNK9Qex5lRE2HCYXaNkqYj3glKt6igvpDEBDW3h4bXLFY7AXy9mu0RaLf3i+J26TzxSL8rVcnEXRpH76XYWW8GSSui9Uwq5ytvuseOj+rCO9yx1uiZ8ketU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YDPVDPCA; arc=fail smtp.client-ip=40.107.92.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YDPVDPCA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jSbjTFaNkARGoGWnScoHUc3UxrrH39A+Zjs9GeOwBxyMKUvid9nEv2kov9SOH6EDYzIxTwo1byOE1K8KFH8/qThq4f9YyYpeBYS/rmyFW0TWpfV+BeFFloGrffGDT/9au14PFPG01Q1Z1uNXRXTRqzmyy0fwaCTLGEBiYXAa85/h/L3lPrc0ZrYIOwrmtqtQyHfoOxARDQkrjjnMm6rC/5JPfSOfTwShpP+yU66xdUUoMcRTuSnIKEGbz/Df7tNdysUYrulCa5mKj0YBhSD+YJdnb6l+crpACHEXPP6Ace1/cgoGa61nv8FpEBbF4bsQKrvyn1SN8y1NIJJWROz+AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kxJqk/CtFbjw3Q5dGakMQVlIs8cKenwOEHcvqJOSkHY=;
 b=nEssxKvDanGEyEGgQqL7BPh79IZH0SZXsWnWiZPFOWNq1lkVwhbIMkQYPtaWtlZl3New18ltXRszy1AHVA3Qh+aFbBFT9TiqmPTycg/w4DipZ4CIvrUBqMmXpYGc9tyWXjFG0ATIqXImdi920dDxRFc0QjChDvnexTgLnEm6AZa3u8a2nNPHGNN05SuEb2dmatBOh/UuVk8nOQ1V1Zc2IU5JIR2VU/3NYDnZjeX9tNAvr9dwCZo9oOE1FGDFC+yEmMx7Fst9UEDRrxxky7RgB/6/Vh12n3bA5F2noryHsVEaBpIoIyzMfZ+1xInK1BxJ1mzypWMIH3HOuahNPdaIVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kxJqk/CtFbjw3Q5dGakMQVlIs8cKenwOEHcvqJOSkHY=;
 b=YDPVDPCA+jyvEDtc/oA8k5ESQBxFErcUQaE5CkiclYrlsrSNki/4G7yjJR0SBFApOo729VrKQV+alCGL6BT7Q4GzGgz5n+aWHVMhwnoSkwDSafm8AUalAQ6AMp4oY36/mkX5wG0HctKqxhpxoDnIH5wPu6TbTKptu65uksbT55EuPL1pFnRLcaM2dqrRj6evto2Fc9ofOlZhzCmL3qh2MhXUbvbnOOd+mzY0fiXxmghZXUyqJk7zleFbFgKswgaLXsSaH3v9DxtoRRyt0NT3JfQ1YeMKOSHgakSnwxVPcUy+U9/+MfDQMlI1gIdnerDqQAbD6HzrYJplRlgmEImhgg==
Received: from DS7P222CA0001.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::7) by
 IA0PR12MB8225.namprd12.prod.outlook.com (2603:10b6:208:408::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.32; Thu, 6 Jun 2024 10:20:52 +0000
Received: from DS3PEPF000099DC.namprd04.prod.outlook.com
 (2603:10b6:8:2e:cafe::86) by DS7P222CA0001.outlook.office365.com
 (2603:10b6:8:2e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.18 via Frontend
 Transport; Thu, 6 Jun 2024 10:20:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS3PEPF000099DC.mail.protection.outlook.com (10.167.17.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Thu, 6 Jun 2024 10:20:51 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 6 Jun 2024
 03:20:37 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 6 Jun 2024 03:20:35 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <shahafs@nvidia.com>, <xuanzhuo@linux.alibaba.com>,
	<yuri.benditovich@daynix.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH v6 3/3] virtio-net: Annotate virtio_net_hdr as field
Date: Thu, 6 Jun 2024 13:20:14 +0300
Message-ID: <20240606102014.2103986-4-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DC:EE_|IA0PR12MB8225:EE_
X-MS-Office365-Filtering-Correlation-Id: 419c53d5-60e3-428c-b1dd-08dc861257bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|1800799015|82310400017|376005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?m45/qSttsjS0PjqJsN7pTBcLPk0+Vp8AlqfjjaQJqTvnB/r+ubSrqGS4nXbI?=
 =?us-ascii?Q?c2fSiSGPFRpqA9Q+7Y0DqvgSzR7H6gDdKQKWyNjt0u9ocmT3GpZsOTalXLOI?=
 =?us-ascii?Q?1BI2iqTi5hZe8ApIo5zqU4gtFRrRFkvvC+Tj93eppjdcKqKvAn4YeFOPgiFb?=
 =?us-ascii?Q?Ogw/2dMv69H82P/yDR208GglN6JwALI8EiVtbnVn8m80UzV5anZCcaNOKP/S?=
 =?us-ascii?Q?S+Vj4t6hq3mybUUgel+djszaouhOl15g5TriXdmp+gBrRcHPJdV5YSUToNrI?=
 =?us-ascii?Q?JdTYqTobju0guQujjoiXh3aWiwrNctGnOzH6+pvdQDIHTVxmbk9mt4O55cMm?=
 =?us-ascii?Q?Ta+QCpt4kP2eArIWaOIJAi6feG69R3llL31IWCS7zU2Ful+5/oiQuxHQwHex?=
 =?us-ascii?Q?sJgVmsoJoRtZDXPYBmgJjO1dFhj3f6h4tueLfahPdz6Gy3PxJ7VWrZDOAFub?=
 =?us-ascii?Q?7klRb++iqU24s7lFCoSd3NFf786YtqYwErGkf2uyXQ2n0Xfk0ZI/w1iio0a8?=
 =?us-ascii?Q?7i5o0qy1HNjI7dcvTGztaPfu6/dxJKHzPAeSX9Tc15FoqGYhaA76suXVezp/?=
 =?us-ascii?Q?9JxbXCGsWn0mDPbDizZNlY6NoXrIDBuQUyV+DpRHcDTtffh3W0VIwC7jf9ot?=
 =?us-ascii?Q?c13p8u5WEFjzgYidryjXFk2h7mhY/JSlrGY+Wv2nqHlRaHAHksweL2yoBi3d?=
 =?us-ascii?Q?eMKfnEQJwcnxoHKsojHZnQ0/wfb5aRDXE1aTbv0ZBfxjDd6unGNk6vQVh5SK?=
 =?us-ascii?Q?TpLHEHl2DBwBRGWh4nqJEs7lTejORoUkoRWZyQkyNRj/TkaSmIzdUSZZofrB?=
 =?us-ascii?Q?BzR9UVtdDNX1Pi1k9HigK9aHjj/F3r+aCXqzZOB989Z2Lx2RP0mFrI/3eqIQ?=
 =?us-ascii?Q?1u0HqGxAQxjO3gzhbUK0HVEW4XVAbMofzzod4k94rQd2UM8eLg3icB9PDfqV?=
 =?us-ascii?Q?rU+5HB1N/NcSKR5CxTpPOctTbx066E6kdDF5p6Va7v47OlZ3tYHODcnWcrAY?=
 =?us-ascii?Q?NwbW+ktbYlAmcU5QMkZBAx0BoLMVu+QSao2dglhC/8gL0NJzlKJhlNcZE9Js?=
 =?us-ascii?Q?gTA+9K67TxnUAd4xbMzGnZlT8MGOE6p7aF7scSpDNWLLFLGQxiX3ETuR+nVM?=
 =?us-ascii?Q?JUjg5ghL3wdnzHu7Kf+GrCofJuORNAquiOnTLGw5KUr4Y/tVfJbf4iohYcuU?=
 =?us-ascii?Q?k/9G37nvROnsu9C03+gT4DL3zQJ2aiwgMLbTKcmzopT8LouLo5juQJ7x5nhY?=
 =?us-ascii?Q?lK6LNCbUGZHUrUnyEqiqmpGSyzO2CtxCcr+RnBCUV/FP73cGN5WI4CAfz0yU?=
 =?us-ascii?Q?NnvCbiG05PP2BlFvev/46UdOIeeHbOsAcc3opTGx2JpZjZmNslZj3z84lYy1?=
 =?us-ascii?Q?aQpDHRP1j5QLsKBSH0zNlaNSSVnOcIoD/SMjopqbHBBf4fi2kA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(82310400017)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 10:20:51.8075
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 419c53d5-60e3-428c-b1dd-08dc861257bf
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8225

At several places struct virtio_net_hdr missed out the field
annotation. Add it.

Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 device-types/net/description.tex | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index d24ffb7..a66d6b0 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -437,11 +437,11 @@ \subsection{Device Operation}\label{sec:Device Types / Network Device / Device O
 
 \subsubsection{Legacy Interface: Device Operation}\label{sec:Device Types / Network Device / Device Operation / Legacy Interface: Device Operation}
 When using the legacy interface, transitional devices and drivers
-MUST format the fields in struct virtio_net_hdr
+MUST format the fields in \field{struct virtio_net_hdr}
 according to the native endian of the guest rather than
 (necessarily when not using the legacy interface) little-endian.
 
-The legacy driver only presented \field{num_buffers} in the struct virtio_net_hdr
+The legacy driver only presented \field{num_buffers} in the \field{struct virtio_net_hdr}
 when VIRTIO_NET_F_MRG_RXBUF was negotiated; without that feature the
 structure was 2 bytes shorter.
 
@@ -735,7 +735,7 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
   chains them together to form a single packet in a way similar to
   how it would store it in a single buffer spread over multiple
   descriptors.
-  The other buffers will not begin with a struct virtio_net_hdr.
+  The other buffers will not begin with a \field{struct virtio_net_hdr}.
 
 \item If
   \field{num_buffers} is one, then the entire packet will be
@@ -2416,7 +2416,7 @@ \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
 
 When using legacy interfaces, transitional drivers which have not
 negotiated VIRTIO_F_ANY_LAYOUT MUST use a single descriptor for the
-struct virtio_net_hdr on both transmit and receive, with the
+\field{struct virtio_net_hdr} on both transmit and receive, with the
 network data in the following descriptors.
 
 Additionally, when using the control virtqueue (see \ref{sec:Device
-- 
2.34.1

