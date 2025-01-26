Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2084.outbound.protection.outlook.com [40.107.243.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D8017E
	for <virtio-comment@lists.linux.dev>; Sun, 26 Jan 2025 06:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737872501; cv=fail; b=QjAyjasVmcXpLe2t0kAvP5jU99pLGAX2TTD0FM9k/na13DAucYWoVQls2vIukBIcWta8rLWtZC3gvqILqHCfQtBfqlb9YxGjj6xxaNXNBLSHcJnyaNWd32Zy/6SHeRURsL59VkZuvnByE1gbIa/9PT28R+ZlRzgiEZBKQfG6j4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737872501; c=relaxed/simple;
	bh=KwtHCdNrgoI4nioNYZYKY7up1640dxW/kS+JYR/K8HI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WJ2bfFjbRHMjd3aeqo/I05sWHFRogJTcxWbKgBj2+hFwfXVr/KhfDvtVxCFSl5PZtjsaMfqtaJSV56G5rUnl1bpH+adA3qXUpxxCDoEyWckVoJ54hjP7nWCXMq0zw+gV1JFRuuhZZq7bOuzeV1rQmvcAAVmx5cqX4O0g4G/BBdc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=i6/VHgCS; arc=fail smtp.client-ip=40.107.243.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="i6/VHgCS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TlWC/fSklqMfLLwaKSrCW66311D1qjEg50f26fUVVXEpltQd0wkNcihvAV1dA4ltV8zMKfpzRHPH8hETw4Ln09FiOp2RvWc2raZroIEpcMAEO65tRMGFIzmjNnIAT0tnVQ5HBx6Npo1GfUC8tgrJQ5zUUKNUANH62tqgUC0aoi3vWoNx55Txewg9CJm0vCSHFHWiuC+edAYiQoc9zUueDktVXrvlUIJfH6UJsv8V5jd0UBIWBk0vc9xoxhJztYyGnZv8mXG9HUblovQzwu30Gvn6/yhNFEBgBHkA3aoKYFLSylhrRF0+DFRSVv45cx323zzIIEavC0pmEUNPqxo7FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5IoFw/K/ngVLLG0qGLiiuKfGFdBgsGEwz8br2E5hOuo=;
 b=VbBgIgkp7/VgJv/CvnhcTUA3Z+rIKRLOP7a2G+RdUPxx5/1bsZ5qxr6xvJCQJGK+8lR5yT52geJ2uDN48qJdTo9QIhvhy29UewhZOHThb39tH3FRIvges2bVJ6UGfSL40ZALrb1zXpv7AwFCFPJpED/tXmpmuTeMWjQzzxyx313uwm9ZZ3lth3n9R1PuqPwog8qAZ9ejlXeeictKnhRQ6CrjywSew9GaSy3xlrGEnwKTExmRsdn+VogRRLOuiv5CkmyP32elSUmAFSD6Xcbcjb6qoL2eclq1mwZxxrjo2M9Nf8zyXgSlMw16eLaRQxLauA7Tr75FEnwITBeR3+s+Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5IoFw/K/ngVLLG0qGLiiuKfGFdBgsGEwz8br2E5hOuo=;
 b=i6/VHgCSzX1jBVrDk0QTa08akcPIiVJdlKr7PpQYK8LXgdz4ftqzlE2gHcuJaYWIFOy4PxoXfDAOT5w43jteUY2GmrJXsTa1In4jPHYc6pcuSXOur3eIkSnlZs/rIAob9LiNU6t6uhyMyOuXBmQSy+BUXtZDandf/9nQCn3eP8HVxs7UYxQRN4hX3If3H+ibFl8HMh/5kVoHbcmr4CBMOAAGJBOBUxgRtEkHjar4vf89JzUJ1FVBsqSGuH3fuLGZXDiXtlN5vkkX4hgfoUqnFry2abxzQ/Vz8vEg+v0mycM8LtNTeY0KRHUTbJx3IYlATs3AzwTz/eQgLDLhdwH6jA==
Received: from SJ0PR03CA0018.namprd03.prod.outlook.com (2603:10b6:a03:33a::23)
 by SJ2PR12MB8034.namprd12.prod.outlook.com (2603:10b6:a03:4cb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.18; Sun, 26 Jan
 2025 06:21:36 +0000
Received: from MWH0EPF000989EA.namprd02.prod.outlook.com
 (2603:10b6:a03:33a:cafe::e) by SJ0PR03CA0018.outlook.office365.com
 (2603:10b6:a03:33a::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.20 via Frontend Transport; Sun,
 26 Jan 2025 06:21:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MWH0EPF000989EA.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Sun, 26 Jan 2025 06:21:35 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sat, 25 Jan
 2025 22:21:23 -0800
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sat, 25 Jan 2025 22:21:21 -0800
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>,
	<mvaralar@redhat.com>
CC: <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH v1] virtio-net: Fix to avoid using reserved feature bits
Date: Sun, 26 Jan 2025 08:20:58 +0200
Message-ID: <20250126062058.13695-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EA:EE_|SJ2PR12MB8034:EE_
X-MS-Office365-Filtering-Correlation-Id: bb9a0eca-4fb7-42a0-9e48-08dd3dd1af89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?V+mdqFby7hrS1yH+6e1fHSan7rqDSMJgs7Al2oRQ60erIUDl9Ws9D0zXVTUk?=
 =?us-ascii?Q?rTlBWddxNxPaPZydrzNdlsl0hxe3WsfT1I3XNzJV4ECy6CD8LAWMIIqOgiPC?=
 =?us-ascii?Q?mWI5jthD2NrDdzo2tTxpB9QYVeLmw78hpeS88nSdeQqsw/5hoCUvcRJcm5dN?=
 =?us-ascii?Q?RQHzijg/vbdfgXu/unJvu3GmfncN4AS92SNqLW7oDinJbJHXUdREvuQtcZIf?=
 =?us-ascii?Q?7uss/Jr/3Uu4Ci5b80Sd5pO5KzDDqQ7z1IYNvwA3trmboYB1H56TApwG22P8?=
 =?us-ascii?Q?hbCtUqZw2TutnOQVAe6qvVrKjp/vvCwIDN27tg2EnyV+d6G+D7/1z40txPPq?=
 =?us-ascii?Q?CocjO16LCwc+rzQS/34VrQ+HLFzr4oAg1o6lCapb7tWtNSJ4YhPXym7WXwG5?=
 =?us-ascii?Q?ORhjHTzwEJybZ5dsjn4pP39Qf3YS8EHOR4wIBrQNYqghHJNWR6ZwDYnH6vL5?=
 =?us-ascii?Q?GyZV4cZAu8OHcXDA4o4P95lFMrHh7CLg7xjlwmTKlT++1LURS0rbDyCj/4LQ?=
 =?us-ascii?Q?CDAZKlwKlLQvwmMf+hbTSE0Vd4ROVpEpZih0PbQMYurblR3A02eghWCTqhfh?=
 =?us-ascii?Q?xzCLtNFYS46KE6Xog8+dN8XoAtnI19bVeZwptmfes2zsrBNw3qYtAnSqc+mH?=
 =?us-ascii?Q?D4wrfwSXmfv6MeqIexRClh+mFFHs8gJtYNSBXW3ik/zbRc7LUa+uYs4sYQsW?=
 =?us-ascii?Q?oe4Vm3u3YBpu+Gx+KI7S4IeS3+PoZWQH/GzwNAWSf05SZX1i1bBfb+NPykjq?=
 =?us-ascii?Q?vkCGSmL2OROQp1RV49BeuAeQW4nflEQsPg0fRdb4aYH/dhwtDW2IpqgBDUZY?=
 =?us-ascii?Q?bFRBdCGvuAw84VOlFSsn7GJR+6T0TQIMhJfb1Su/oxafOSyAEc0Y+ta3TN9X?=
 =?us-ascii?Q?9GMWED5IjEqz5fLKYAf80yfYM2T8nL34Ux5FYRzgAsHFUVg4W9pME+Ec2nlH?=
 =?us-ascii?Q?o/12bTvk/V57fCxpoNgkpX0HJezNLXAqgXkjrv8gECFrhdNZ2RFPJt+/JBfs?=
 =?us-ascii?Q?KON4+VB/R+Kd/6FA34124wY/D5twD7wLicS+v4CROAKX21hrOH6jA9MSP1xc?=
 =?us-ascii?Q?+nFQIucFj8+wDgeQc5/d0QhgsO6SIO4FICGVXh/mieKhWIMGbmbiA3ehqb6a?=
 =?us-ascii?Q?TC8AKo8Jra522Out2VSjppcmzB4Fsi8Y8OoAjv1vJjdKxzCGxtYQGTjiZHwU?=
 =?us-ascii?Q?Xjx5ji8L35pC3TNI0G6mpMHwfioRUIxTDTkiMuVWc+taO7/hPBMOIxjJ7oe5?=
 =?us-ascii?Q?XjQwWBD50RFyuAUmJhln8BLxd/x/FunA3WEQsSQiMg2my92DLDZL9/eC0pRK?=
 =?us-ascii?Q?v2vZEibXova1r0nl2HDMr77m1ZGFYb+AthyqtjmmTOYeynRXZxb0D+tzoJNv?=
 =?us-ascii?Q?bx0RDeynYm6WDoz6iqOJ66kLRFXMsceJHh9SdO0kaCv7ImrgJvYWQUt6aBdd?=
 =?us-ascii?Q?xAJZ9GjVT69pCRGJyIxP2iEcMTbWyuDoE6wqdJH2Yz8ZVAdA1uZEOvnTfhY5?=
 =?us-ascii?Q?lYbZEch7COeNj2o=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2025 06:21:35.7406
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb9a0eca-4fb7-42a0-9e48-08dd3dd1af89
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989EA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8034

Listed patches in the fixes tag, incorrectly used the reserved feature bits.
Fix them to use the well defined device specific range.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/212
Fixes: https://github.com/oasis-tcs/virtio-spec/issues/213
Fixes: 8cd457d8aa82 ("virtio-net: define UDP tunnel segmentation offload feature")
Fixes: 3fea589bd7c6 ("virtio-net: define UDP tunnel checksum offload feature")
Signed-off-by: Parav Pandit <parav@nvidia.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>

---
changelog:
v0->v1:
- added Cornelia's reviewed-by
- added github issue number
- skipped Paolo's suggestion to modify 'le64 offloads' as its only 64-bits
  and new feature bits are in > 64 bits range
---
 device-types/net/description.tex | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index efb543f..b546cd7 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -88,18 +88,6 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
 \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
     channel.
 
-\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO (46)] Driver can receive GSO packets
-  carried by a UDP tunnel.
-
-\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM (47)] Driver handles packets
-  carried by a UDP tunnel with partial csum for the outer header.
-
-\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO (48)] Device can receive GSO packets
-  carried by a UDP tunnel.
-
-\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM (49)] Device handles packets
-  carried by a UDP tunnel with partial csum for the outer header.
-
 \item[VIRTIO_NET_F_DEVICE_STATS(50)] Device can provide device-level statistics
     to the driver through the control virtqueue.
 
@@ -136,6 +124,18 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
 \item[VIRTIO_NET_F_SPEED_DUPLEX(63)] Device reports speed and duplex.
 
 \item[VIRTIO_NET_F_RSS_CONTEXT(64)] Device supports multiple RSS contexts.
+
+\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO (65)] Driver can receive GSO packets
+  carried by a UDP tunnel.
+
+\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM (66)] Driver handles packets
+  carried by a UDP tunnel with partial csum for the outer header.
+
+\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO (67)] Device can receive GSO packets
+  carried by a UDP tunnel.
+
+\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM (68)] Device handles packets
+  carried by a UDP tunnel with partial csum for the outer header.
 \end{description}
 
 \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device / Feature bits / Feature bit requirements}
-- 
2.34.1

