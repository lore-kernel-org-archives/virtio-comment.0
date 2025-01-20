Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2050.outbound.protection.outlook.com [40.107.96.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78DA1E2847
	for <virtio-comment@lists.linux.dev>; Mon, 20 Jan 2025 14:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737382288; cv=fail; b=XoOxM0CXMq56SQZUpCsdxsZQ/wosSH+x3khFsfT1D7vnwx64jfyziutfDGIGhObPLhewDVb42OVF1LfrJCn1JeQrXV2H32kVShYYLWO+yWLxtDvmgOlZrgVqrX2Rz1NQ2OFhhz3j94ySlCjnW9mUzcMsNBxQkqDGeDY46SsJCXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737382288; c=relaxed/simple;
	bh=uHzxNTiYIZKTo+WEa8PRxb0f7UyhGZJICaEvKe8K9UU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WgDvRFhWXP1w9oJiXiLbVKQL9FCm8y8PuXHzfVVGLWIZ6Cm294BSxsfrFSCSlj+kbg3XiPxfI5zgp5AuM60exu0BBfcTlQG0SMBaK6b3yJB/7LfZOmuOV2cUZDiljdrAQPQtjBt9XDv6zVGEASWQJwOB7dK56tCk6WJNLOqJBr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pTvuNAkb; arc=fail smtp.client-ip=40.107.96.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pTvuNAkb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lr8O53u+iiziA5e0Ta/Ex5Wp/d4E4Y+dtecnlCIxL1Azh0NwirA8ljGMB6OqsKsS4iFt4TLazRRidFKdAGn7wHW1qzsJtOkJKTShWUlIeFtJYhUezsIrkBsEDdqRU11X8aoE+xKBhuT5d0QvSRkRESf8A1Xw+76YWd25JeadC15ps84+9iTm64inJUsKpYGMfe9IJWMSowxooQWrckj1inimYXKZ4nkpsV83NjSdnUjuY+NyyBa89tQtYEgN89rvRySimAku1hBS9R5TIlgPYzigQYuJFbUCR2TPCnnZQWnBKhdVsohvJo3UihkJHdYFHEZxdJJ/tCXDHveUu3Sbbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wT9vc2+XgwJUPGxObMPur+C4yEy3vgKb8N2hdTV33uI=;
 b=rHOWp6QH9qMI/RlJCuLKmRxzALTISf+/BRmaeaLKu5Q6uBBsfChjWfkeAfciku9YVMJvTCL+e2XD/GALraFVqL+EGE/uc2A3yyCkxfqD0pvNdSf4xAnk7sEIfm/GjbjAtCm3P8ji+x9F+EK2OxiWT5O6FDWFjf7cJS4n4ddTt3UKmFuWYtLlTT2q9hXrK7CMFzZrKb4TySi+tjkvFIsl6xpbLw56iit2ZXRnEpsPXqn1t7IJxoGm5nCNu2Vl+8eKqwp6ftVsgFFaA8pnq7UObiLlVXCn1LyS0eO3w2NH9RDw7IpFsXTHQgx74S21XqgA95u6K0dSMH7Fo8UqrsfMbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wT9vc2+XgwJUPGxObMPur+C4yEy3vgKb8N2hdTV33uI=;
 b=pTvuNAkb4e45kwlYdlxW6SBnllcHYLunQx697wlCLckRwUFkH9FwiAJWPVbLkn9da0UlqIUtZbDpDSOEzI+Qv4VzoGGt1wHPHAPWsIcNZf263jUCO5tGeKXG0f4TIymLcKwfKoI5kic/UMOw0cdDifsHBoET7G0/QR3jkaHnjk3hjLiuVENWaCmSQa64x3DKBqGy9K4eaEwm2vI8PYYP4y1uGEu1+X380NipaW8GaxxX+dkGFsnWv//K+PLfG4V8eS6NS4c3FiGa0GjN8VX7hVW6qc4z8kB5N2MNrxT0OdX1/RIT//oq3OGYSpJy8vlGVQDkrmR/oO5zeGFZ97qgGA==
Received: from CH5P221CA0014.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::7)
 by SA3PR12MB9092.namprd12.prod.outlook.com (2603:10b6:806:37f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 14:11:22 +0000
Received: from DS3PEPF000099E0.namprd04.prod.outlook.com
 (2603:10b6:610:1f2:cafe::c6) by CH5P221CA0014.outlook.office365.com
 (2603:10b6:610:1f2::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Mon,
 20 Jan 2025 14:11:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS3PEPF000099E0.mail.protection.outlook.com (10.167.17.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Mon, 20 Jan 2025 14:11:21 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 20 Jan
 2025 06:11:07 -0800
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 20 Jan 2025 06:11:05 -0800
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>,
	<mvaralar@redhat.com>
CC: <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH] virtio-net: Fix to avoid using reserved feature bits
Date: Mon, 20 Jan 2025 16:10:52 +0200
Message-ID: <20250120141052.877355-1-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E0:EE_|SA3PR12MB9092:EE_
X-MS-Office365-Filtering-Correlation-Id: 8674332b-37c7-4957-54e6-08dd395c515a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?X9JTD4PaZ/GgjrdvvW5K7DEWY0b1zpfwD/hmJsmTcKO8cp6nprOrK7koMcdF?=
 =?us-ascii?Q?fWigyx5jZTuKjSTGc9SSptWGMF2NQl4J/Fl7DnsjXhQhHBhaF2KKZSuziVYF?=
 =?us-ascii?Q?MGGi++609tV4q9u0LrWn9cVwiAuICozQjSqymSnGNycJCaSphzDWFF+YjbZb?=
 =?us-ascii?Q?506bkhn+8k1hIKgiW+1jO3wZFgngj+owICgjgF3HmwsxbubMekXCBQGMl6cn?=
 =?us-ascii?Q?uN8gBqtI0S1wPRhxZPui4vxylgkteB47ujWrbN9lvsoIkHCWKPUABy+E8Sce?=
 =?us-ascii?Q?0AGOM7NruFONqyYxWc3lHH0MoW97uUrrEMij/fGDWeIwOq31rpuspHL+7RcY?=
 =?us-ascii?Q?WBTqrzNrfUMexe2A1eVE2BvEZzmWWVuTeMHHQs6qQAHt1XLK0ynm7MQwpvS2?=
 =?us-ascii?Q?Hydrae0DRfNUMqAss/8CexX//7Ew1jBCvQgLReSDEfCJqzTWUdL9I41GiSAa?=
 =?us-ascii?Q?drknEmS+DBTV/NwUTN2lwL+a0fXTn2UbOB6M98TvpAzpJ0XmIk5vaTEaBG/8?=
 =?us-ascii?Q?RaTls9F12RqCsHNYoYL9Oc0Sc055avBXnIqHsPTtWJU6OO95fRYXfhz2Hk6+?=
 =?us-ascii?Q?KJxvBBheq5tXOMT9xk62SjVNSupqFpewDkEiezqEJTR1VDeWvh70XnmOxp9r?=
 =?us-ascii?Q?HKJmhPR66PB4ziDg2/ZhhKGB7KYCozjCwqUG8HdxTkhL5U34q7SkEZcor6lU?=
 =?us-ascii?Q?dMBuxDwB1dwx6oRPcK4c1IGqZi/ZFcv1ViIgOHhHsQXh2+PMzJgC7cGFWxCd?=
 =?us-ascii?Q?UcrXCWyfr5WdvV5Mv31w/SqnT2LbSVmtIuwsUlCVxhFrG5LD0/XdjgkDI8wA?=
 =?us-ascii?Q?7flNaLIDGVB8xd/29HloiabC4c9v5LwBJykOstPwsP8eHdF/KH1yvcdyEA17?=
 =?us-ascii?Q?myUx1ZbSPGpjjrrSm/DekGtKcjxs7akItykbXpZBGdsjpR7WsAWF/jEpOveD?=
 =?us-ascii?Q?QWaxbbC25cNGuGqK8oqX+qqyWYW0PPEzvX6NQjOz48nSwjM9EPgmy2t/j4eI?=
 =?us-ascii?Q?L+40aZHrSPVR88Wo7a6tibm8UGoGh+0bNlGEY0NjUC3czLGPfQXiVqpt1+qi?=
 =?us-ascii?Q?eLR5maAUeP7Z/bWEj7L8afBznaCy9gKLdBd6OvsmJJPuyIAcnM+Exsu9oDMD?=
 =?us-ascii?Q?uiePxw3QUsIxtNhJ4oAPrgCwoZGzl+pH/1Bz5wPZA2hgJyyd3v3lJy1Ig4aB?=
 =?us-ascii?Q?J/rScCW+OLNYdyLxF8eyt+Id7peQ4DRwURXlz6NSEeTsbS9AaAV9z13GNh6A?=
 =?us-ascii?Q?7VE2seoGozZqZD+8gqxT9zh7rbN1f75Q5dcPUzUdD9Yn/hVipeU9HksDGuwC?=
 =?us-ascii?Q?wThOXlbCUAGiqLCvDwZJ6KiBb7JGdqxNK0srem5+k41kVhmu53d8xnaZaXbc?=
 =?us-ascii?Q?oxOk1dtpB0kdEPcuzUSfTbifq1RoWIhW3Qu77sNnBjdG9kV7H4O8lLKvc4up?=
 =?us-ascii?Q?0F7IyWiugHCrerMpC+cvAUKbL4JcHuV/QRdZA2pSB8wxSt7MQwf3Hw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 14:11:21.9096
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8674332b-37c7-4957-54e6-08dd395c515a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9092

Listed patches in the fixes tag, incorrectly used the reserved feature bits.
Fix them to use the well defined device specific range.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/212
Fixes: 8cd457d8aa82 ("virtio-net: define UDP tunnel segmentation offload feature")
Fixes: 3fea589bd7c6 ("virtio-net: define UDP tunnel checksum offload feature")
Signed-off-by: Parav Pandit <parav@nvidia.com>
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

