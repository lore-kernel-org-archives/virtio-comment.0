Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2072.outbound.protection.outlook.com [40.107.94.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3255915219A
	for <virtio-comment@lists.linux.dev>; Sat,  1 Jun 2024 14:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717253501; cv=fail; b=eJlJ10HOhCqN+VaUjy1voBfuafIUp1elxg7E7QJzAJFuITppXyGVJD90Y2Sx3ITCv+HGpLAJ36brebf8eLG+mNkmSnGjaczPai0RZ2k7VDIaBNz57kgx26tQjJxtiRiQs2SRq6OLEKpNR0J05b1fJPJ57q4y9tkS+mmV+MlNUJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717253501; c=relaxed/simple;
	bh=gFqL/kzzMcraC9SBneDg4ecf+rWQm6zhRLUg/H26CvU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tajCHiEiNoku9v5nyspnACbBNhrRMVQyYq04s0qhczBStc+Y/DgqCSP/TfsNc0WxKcAihwcTWz2ZNhdKaS2CpuihfqOScusVRTlpOjneOh1x168nlPN+la2X5XgqZK8S5ERtcnNUew++1DEzTig/kglAGTGWmEDTWU9jsUiZRt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WqGIllzM; arc=fail smtp.client-ip=40.107.94.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WqGIllzM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OkGkiGOuQVKDPJ0G+Uj1QtA6f59VfbeZB8veeVRoaG41iGurahK0LGfkvIcumcI5riBDyfSMgitD9aJ4K1HRZjUwSt1OsNT/biWcLTLprtlLpVwQVLHr4VcXHwoqCAmgRXeVC0+lKa6Aovv2kEeMKT1KSjSlroEr8cXhQjaB6lB+2lofkuUyD2fp6sD3rXGOc0pmIAEaHegTkh6KBqBFrMaBB+VyrQB5YqUTo07YFsBSjhKpp1UUeGVYRh4yuJ0BiGghNDBeXQnNvw+aruLngEaL2edwWOgFFsyuShSfvww8w7OX2sdiba1OEl0tPqw4qw/Z/E4Rh5uDDfm7mWx1XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eeotzPg6I4t+n8FCYoH2YVuw7/xiRufpBO2kSDMQxbM=;
 b=i5H9KLIhaW+QNqQzNrsJxn6m+U+ii4IkU38/JDtN1PveXSybUogt7gn58URPaRjEH2LJVwrOTZW+gnXO2NLzAjyS2LDJjTERU30m/9L+C+Ym7zbvLJwCeKo0Gwzc+IVusJd9qq83dymrkMqQaV7AoFr6RQJtTrWS+UL2dM6fKq2D9HHDB6c9UEvmvwtTEyfeSUB4IjQAl59RWQE25+MzzT/z8MdJCRWaQ1yRXvr4sbSmeBtjpPCJF9q5hwt3QtVUc8G2nfrgeY9h27XfYhlBbboPdXPkWrPij/K7tRwiYmGk2P0MGnHgFgKm1LtWvlxUJmkY8OGAEO+yNKF4vBx4gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eeotzPg6I4t+n8FCYoH2YVuw7/xiRufpBO2kSDMQxbM=;
 b=WqGIllzMHmJ41RY+1RYkZx/uGgLXiCtDjY6yJsrOyUa3PP5OLM47Sg47QkBwuNnl7sHOdfvBOujDLS/sgzxiYbmAGYlMP6n9PFwCWnmNth9xodVDpDPCnrsEF0IqRkHjZSWAt4c4BgzupMxK6VkIq/btO4KLGS5GTQysp+xP6pkbNgiA0vFaLgWFCrzI8giTk7Tm+ewYP/ZuM0SoIlZKsfiT/Y4DBWSkwJ9u6MW+HbMN8EjHNreFWHxahTZn9Uy3joy99J6s1KpHCKTwShlmo6dwspuhhikmwmX23yZf2dGyT7/1yyqM4+CrFfCacZJrNX5u+YzKJA4wrIEAcQ67Dg==
Received: from CH0P220CA0006.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::27)
 by MW4PR12MB7429.namprd12.prod.outlook.com (2603:10b6:303:21b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.17; Sat, 1 Jun
 2024 14:51:34 +0000
Received: from DS3PEPF000099DC.namprd04.prod.outlook.com
 (2603:10b6:610:ef:cafe::d5) by CH0P220CA0006.outlook.office365.com
 (2603:10b6:610:ef::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27 via Frontend
 Transport; Sat, 1 Jun 2024 14:51:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS3PEPF000099DC.mail.protection.outlook.com (10.167.17.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Sat, 1 Jun 2024 14:51:34 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sat, 1 Jun 2024
 07:51:23 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sat, 1 Jun 2024 07:51:19 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <jasowang@redhat.com>, <sburla@marvell.com>, <shahafs@nvidia.com>,
	<maorg@nvidia.com>, <yishaih@nvidia.com>, <lingshan.zhu@intel.com>, "Parav
 Pandit" <parav@nvidia.com>
Subject: [PATCH v5 5/5] admin: Add requirements of device parts commands
Date: Sat, 1 Jun 2024 17:50:42 +0300
Message-ID: <20240601145042.2074739-6-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240601145042.2074739-1-parav@nvidia.com>
References: <20240601145042.2074739-1-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DC:EE_|MW4PR12MB7429:EE_
X-MS-Office365-Filtering-Correlation-Id: 6644203c-d289-46c6-482f-08dc824a5506
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|36860700004|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3bEB2wmejzJecGVK33V3zOXoxYcKoEkNyxY+8lfjgzTEwKiPXkw0UO0P6V/B?=
 =?us-ascii?Q?4fPGBU1Gb+JXB5PBEpxvHYDDH095EDmYcZLdIqv6lgNDrcPdi6TfDCzaGvQ9?=
 =?us-ascii?Q?7/jDgfRjcn4oVQovaYK8UheQpiSGV2X6+Wy3CC0MgU/Iy/tbFX6/XMxe+eBm?=
 =?us-ascii?Q?rHj7LplNAqG19WQV3/cHhmv8G/m862cPP5AYiHKP2umPPj7dbL01KOIL3Kso?=
 =?us-ascii?Q?0Ks2bsfIRpHv+2Cl5ps13qKug+u4E0UaZA/8jKV93gUe+qiZC45RhF3vkBFa?=
 =?us-ascii?Q?qIC07xch44IEJEDxvWsLskQYYcAb3ECeLdL488FRBc7/a0lA8aq948vagdof?=
 =?us-ascii?Q?jole/6llTSDYkAk+H7S1ezCOIg2amUCga8WuNRnyX9ofj1K/5f7KaCiziWNu?=
 =?us-ascii?Q?Hhz1B4mqdMIA2hOyuLs4E51HDVZQjFmNrpmwOl35tMLRrwvGazNz3ns4PJ//?=
 =?us-ascii?Q?hopuGmTs7q+XVUWqWXuuTe+E5rQXPC4FhsPrWFDUUy8TazlMDoA2NuTNqk/t?=
 =?us-ascii?Q?kQnXzUGNYTDFtFW0DOukXdOdrusUTqRqZ3JeOINIbOogkIVM5yIvGKtzHY1q?=
 =?us-ascii?Q?z5BFXAfeE8/mvm8iyxTvCgE5a3S3uGCqzf4mB2iAVad0pmqrCsVLZTbZup4G?=
 =?us-ascii?Q?ifBGGKaD1cU7HFU/w0RCdnq49UrR8CG4pKk1ylMIbp3fyWYTeY9f89sHMgb2?=
 =?us-ascii?Q?Wb89Hp7v31TrVwhGqoOoNBmPd4sr6UEUL/bw0FfqqdaFZkLT4XxcPPqXZd1P?=
 =?us-ascii?Q?BIef0GNvTuXSVVg0ZA2PM/QH+hABm/B5sRiOwOR4cil8IgttXsuf+NvS212H?=
 =?us-ascii?Q?C///i9MfQe++n0PJcHiMEMSN0WQax1u+LZJPgn+yAswGmX/ClJMEOkNEMkOw?=
 =?us-ascii?Q?U9qSdXCv39Qslyo0j0sLp3+FMmcJ+AuLey5JcR3VUFUHBJjE6Tie8LqhkEpA?=
 =?us-ascii?Q?JhpeRRGOpg4uk4tgdof1JEvN9tTder/O9E0zg7J9A7w3ULwZ0JllrU0den2v?=
 =?us-ascii?Q?G0ews1rU+VwTJ78V19qFWnNiWHHs5/mRJThfdJFfzTssrFwFQw0qXVEv5/s7?=
 =?us-ascii?Q?ZgE0hqfL5X/7BX2/PpsHy+EZsfADKv/VrmqOreoJ5l2z2enRWbuEk5mCfZUG?=
 =?us-ascii?Q?UXwvc+8FkapXm4bEoaZdSW639vSHrZHbwqt9xbOQvicRyh97Ootc1Urt6Yxe?=
 =?us-ascii?Q?RDM0A165A4+7qv3+qIQu2eRcRrWn2OXxPHfAcgZq+sOOCAvUK2ZOcbRxhyLZ?=
 =?us-ascii?Q?Ym/w61/XTV7Yx2GxC75pRaUDy4Hr+07J4SMdvWUxbeSVCo9k1EJSS+x06937?=
 =?us-ascii?Q?rRa8BF+nwHnr56Bln108R6DTAslj3fKTV3ZHDZ04s/vOGDTw2yWcvxIOjN8F?=
 =?us-ascii?Q?JScfDXDXuLFGi87xJ6nRWmaY6cJw?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(376005)(36860700004)(1800799015)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2024 14:51:34.4027
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6644203c-d289-46c6-482f-08dc824a5506
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7429

Add device and driver side requirements for the device parts
related commands.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/176
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 admin-cmds-device-parts.tex | 148 ++++++++++++++++++++++++++++++++++++
 conformance.tex             |   2 +
 2 files changed, 150 insertions(+)

diff --git a/admin-cmds-device-parts.tex b/admin-cmds-device-parts.tex
index 05d2477..ab6e83b 100644
--- a/admin-cmds-device-parts.tex
+++ b/admin-cmds-device-parts.tex
@@ -319,3 +319,151 @@ \subsubsection{Device parts}\label{sec:Basic Facilities of a Virtio Device / Dev
 \hline
 \end{xltabular}
 \end{table}
+
+\devicenormative{\subparagraph}{Device parts}{Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts}
+
+A device MUST either support all of, or none of
+VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_GET,
+VIRTIO_ADMIN_CMD_DEV_PARTS_GET, VIRTIO_ADMIN_CMD_DEV_PARTS_SET,
+VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE,
+VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY, VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY
+VIRTIO_ADMIN_CMD_RESOURCE_OBJ_QUERY, and
+VIRTIO_ADMIN_CMD_DEV_MODE_SET commands, where resource commands apply to
+the resource object VIRTIO_RESOURCE_OBJ_DEV_PARTS.
+
+The device MUST support getting the device parts multiple times
+with the command VIRTIO_ADMIN_CMD_DEV_PARTS_GET.
+
+When there are multiple device parts in the command
+VIRTIO_ADMIN_CMD_DEV_PARTS_GET, the device MUST respond the device parts in the
+same order as listed in the table
+\hyperref[table:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / Device parts order/ Device parts order]{device parts order}.
+
+The device SHOULD respond with an error status for the command
+VIRTIO_ADMIN_CMD_DEV_PARTS_SET if the device is not stopped.
+
+The device MUST support the command VIRTIO_ADMIN_CMD_DEV_PARTS_SET,
+allowing the same or different device parts to be set multiple times.
+
+The device MUST respond with an error for the command
+VIRTIO_ADMIN_CMD_DEV_PARTS_SET, if there is a mismatch between the
+device part length supplied in the VIRTIO_ADMIN_CMD_DEV_PARTS_SET
+and the device part length in the device.
+
+The device MUST NOT set the device part VIRTIO_DEV_PART_DEV_FEATURES in
+the command VIRTIO_ADMIN_CMD_DEV_PARTS_SET; instead,
+it must verify that the device features supplied in
+VIRTIO_DEV_PART_DEV_FEATURES match those the device has.
+
+The device may ignore the setting of a device part that has the
+VIRTIO_DEV_PART_F_OPTIONAL bit set.
+
+For the SR-IOV group type, when the device is stopped using the command
+VIRTIO_ADMIN_CMD_DEV_MODE_SET,
+\begin{itemize}
+\item the device MUST not initiate any PCI transaction,
+\item the device MUST finish all the outstanding PCI transactions before completing
+      the command VIRTIO_ADMIN_CMD_DEV_MODE_SET,
+\item the device MUST write any associated descriptors to the driver memory for
+      all the observed buffers,
+\item the device MUST accept driver notifications and the device MAY update any
+      device parts,
+\item the device MUST respond with valid values for PCI read requests,
+\item the device MUST operate in the same way for the PCI architected interfaces
+      regardless of the device mode.
+\item the device MUST not generate any PCI PME.
+\end{itemize}
+
+When the device is stopped,
+\begin{itemize}
+\item the device MUST not access any virtqueue memory or any memory referred
+      by the virtqueue.
+\item the device MUST not generate any configuration change notification
+      or any virtqueue notification.
+\end{itemize}
+
+For the SR-IOV group type,
+\begin{itemize}
+\item the device MUST respond to the commands
+VIRTIO_ADMIN_CMD_DEV_MODE_SET, VIRTIO_ADMIN_CMD_DEV_PARTS_SET
+after the member device completes FLR, if the FLR is in progress on the device
+when the device receives any of these commands.
+
+\item the member device MUST respond to the commands
+VIRTIO_ADMIN_CMD_DEV_MODE_SET and VIRTIO_ADMIN_CMD_DEV_PARTS_SET
+after the device reset completes in the device, if the
+device reset is in progress when the device receives any of these commands.
+
+\item the member device MUST respond to commands
+VIRTIO_ADMIN_CMD_DEV_MODE_SET and VIRTIO_ADMIN_CMD_DEV_PARTS_SET
+after the device power management state
+transition completes on the device, if the power management state transition
+is in progress when the device receives any of these commands.
+\end{itemize}
+
+When the \field{flags} is set to VIRTIO_ADMIN_CMD_DEV_MODE_FLAGS_STOPPED
+in the command VIRTIO_ADMIN_CMD_DEV_MODE_SET, and if the device is already
+stopped before, the device MUST complete the command successfully.
+
+When the VIRTIO_ADMIN_CMD_DEV_MODE_FLAGS_STOPPED \field{flags} clear,
+in the command VIRTIO_ADMIN_CMD_DEV_MODE_SET, and if the device is
+not stopped before, the device MUST complete the command successfully.
+
+For the SR-IOV group type, the device MUST clear all the device parts to
+the default value when the member device is reset or undergo an PCI FLR.
+
+The device MAY NOT respond to the selected device part in \field{hdr_list}
+in the command VIRTIO_ADMIN_CMD_DEV_PARTS_GET if the device part is invalid
+in the device.
+
+For the commands VIRTIO_ADMIN_CMD_DEV_PARTS_GET and
+VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_GET, when the device responds with:
+\begin{itemize}
+\item
+VIRTIO_DEV_PART_DRV_FEATURES or VIRTIO_DEV_PART_PCI_COMMON_CFG, it MUST be
+preceded by VIRTIO_DEV_PART_DEV_FEATURES.
+
+\item VIRTIO_DEV_PART_PCI_COMMON_CFG, it MUST be preceded by
+VIRTIO_DEV_PART_DEV_FEATURES.
+
+\item VIRTIO_DEV_PART_PCI_COMMON_CFG, it MUST be preceded by
+VIRTIO_DEV_PART_DEV_FEATURES and VIRTIO_DEV_PART_DRV_FEATURES.
+
+\item VIRTIO_DEV_PART_DEV_CFG, it MUST be preceded by VIRTIO_DEV_PART_DEV_FEATURES.
+
+\item VIRTIO_DEV_PART_DRV_CFG, it be preceded by VIRTIO_DEV_PART_DEV_FEATURES,
+VIRTIO_DEV_PART_DRV_FEATURES and VIRTIO_DEV_PART_DEV_CFG.
+
+\item VIRTIO_DEV_PART_DEVICE_STAtUS, it is preceded by VIRTIO_DEV_PART_DEV_FEATURES,
+VIRTIO_DEV_PART_DRV_FEATURES, and VIRTIO_DEV_PART_DEV_CFG.
+\end{itemize}
+
+When the device receives a VIRTIO_ADMIN_CMD_DEV_PARTS_SET command containing the
+parts VIRTIO_DEV_PART_DEV_FEATURES, VIRTIO_DEV_PART_PCI_COMMON_CFG and
+VIRTIO_DEV_PART_DEV_CFG, the device SHOULD only verify that the provided configuration is
+correct but SHOULD NOT apply it, especially for the fields that are designated
+as read-only and invariant. This ensures that the device respects the
+immutability of certain configuration aspects while still performing necessary
+validation checks.
+
+\drivernormative{\subparagraph}{Device parts}{Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts}
+
+The driver MUST set the mode to VIRTIO_ADMIN_CMD_DEV_MODE_F_STOPPED in
+the command VIRTIO_ADMIN_CMD_DEV_MODE_SET before setting parts using the command
+VIRTIO_ADMIN_CMD_DEV_PARTS_SET.
+
+When there are multiple device parts in the command
+VIRTIO_ADMIN_CMD_DEV_PARTS_SET, the driver MUST set the device parts in the same
+order as listed in the table
+\hyperref[table:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / Device parts order/ Device parts order]{device parts order}.
+
+For the SR-IOV group type, the driver SHOULD NOT access the device configuration
+space described in section
+\ref{sec:Basic Facilities of a Virtio Device / Device Configuration Space}
+when the device is stopped.
+
+The driver SHOULD allocate sufficient response buffer to receive all the device
+parts metadata in the command VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_GET.
+
+The driver SHOULD allocate sufficient response buffer to receive all the device
+parts in the command VIRTIO_ADMIN_CMD_DEV_PARTS_GET.
diff --git a/conformance.tex b/conformance.tex
index 297b78a..d92a236 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -101,6 +101,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \item \ref{drivernormative:Reserved Feature Bits}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects}
+\item \ref{drivernormative:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts}
 \end{itemize}
 
 \conformance{\subsection}{PCI Driver Conformance}\label{sec:Conformance / Driver Conformance / PCI Driver Conformance}
@@ -185,6 +186,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \item \ref{devicenormative:Reserved Feature Bits}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects}
+\item \ref{devicenormative:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts}
 \end{itemize}
 
 \conformance{\subsection}{PCI Device Conformance}\label{sec:Conformance / Device Conformance / PCI Device Conformance}
-- 
2.34.1

