Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2059.outbound.protection.outlook.com [40.107.93.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1111EDA12
	for <virtio-comment@lists.linux.dev>; Wed,  2 Jul 2025 08:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751446492; cv=fail; b=lW296QVyzOXVWdmnUrvv8qw1E17ffJr/gXEStYK6RMqyl+5wF5OmL8BmB2tlnHN+ro/ah9KwEF1Kn2mLXi89WVCpCYwBdLkeCihDrXzi2KKV6HtSGU29lgAwzWyLD5gdJ2e/b1aY+U80Y5t4JsRdzaZmIbNX7Xmat8X5/XwWHPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751446492; c=relaxed/simple;
	bh=bLDQ3INiqBmNMhnRDUMdZQXdWkZWmoJP9uR70g95YKk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WkAWU4ZXG89EuM1P9d4kFKKMcLeTYNisxlsnTPqJCJEvVNaPpbiFzaBCQaMkz5nDuyhvf6r6cbh4TvkdWgNhOOgjrwf9RiMicbL0+8x8kNFTFoJ8OAamZXThDbJrSLsk6sDoBE+G853x3j+/JNzZplmJXzuqdwrlPRtUOFGZg7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=fNvoVwZL; arc=fail smtp.client-ip=40.107.93.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="fNvoVwZL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IDoL6b2DF5RapyCm06VnYqOeY8H1Mjp/t4cIkC9Dl/HrF2JSpKTPmvmzUl0EDw0nr7BETOK9rxbr2a+KOkLCAYlXnhU+x8OekElMIzeOyM9k4UtWbTorlgDX7g6Qxp3FJc9SD/hS5m16XCmXimMPmov6izjeSEK/DRrTVA1i1vzywOKq7Q9qypunY2URqZygBbk7QILQzZ6mNxR3FXOx6KKQ9jtaOh88kc48EKjrJJINqzbRUnsIcRySIqe/h7DeUP5BaesfkLaLTemDqYuhdKb4VxP8qg/pcWkXJvTy4mCQaEebeJMSB41sIySR2Ls0K0tCE5FMdn81dyRWLZixgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C3n6nbsFQ/hKbhOBahUkx6XrLEuJ7iKLp3aUdEgmPj8=;
 b=FmDRljvKAoke2WbLvQT3HzEFecLCzXQm37P6saaAQPdeRsF/im5lXI87tKwoVLdRGz7ODMofPez3MZQ/fLWCECdmZCQbwQWIxzW589PKx2m+/NjKnlkAbNNCzbuVuHsKee4uhCI3Yff80CNiVKrYZMdDkeyy1Ag6f+k4sq4krZUhnptdLSNN/cUNlaqmbDa53D/nUcY7BNjuoJLPNwBOyRa4saGVaAMnzCZSIH2iTijCfP/RFak/fAhd8ELXZODODNBCvg9xOfWTw+3KMRe2/BDXYqA/jWeR2VR7hxpgNb1KdQRYCjcrjaFCEu7qVS8ZrWYP4vfU3GaldCxhfmycxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C3n6nbsFQ/hKbhOBahUkx6XrLEuJ7iKLp3aUdEgmPj8=;
 b=fNvoVwZLN7cBqTuY7MJH0EHF8jwvwlzIIKGeU4N0jZzTEPOGp56bw3yfjbE9reKYSY8avr7rHgjNpYfZXTLOo37PI6qTu2Ne92UIqqvh08X75DGLcap1rxg6MuV5zwJmXvALBGJZ0jH8MUkaFLW2+YEUOBoC3KDa8sWqoT4u8WA=
Received: from MW2PR16CA0018.namprd16.prod.outlook.com (2603:10b6:907::31) by
 BY5PR12MB4148.namprd12.prod.outlook.com (2603:10b6:a03:208::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.26; Wed, 2 Jul
 2025 08:54:47 +0000
Received: from CO1PEPF000066EC.namprd05.prod.outlook.com
 (2603:10b6:907:0:cafe::9e) by MW2PR16CA0018.outlook.office365.com
 (2603:10b6:907::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Wed,
 2 Jul 2025 08:54:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066EC.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Wed, 2 Jul 2025 08:54:47 +0000
Received: from fedora.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 03:54:45 -0500
From: Zhu Lingshan <lingshan.zhu@amd.com>
To: <mst@redhat.com>, <cohuck@redhat.com>, <jasowang@redhat.com>
CC: <virtio-comment@lists.linux.dev>, <Ray.Huang@amd.com>, Zhu Lingshan
	<lingshan.zhu@amd.com>
Subject: [PATCH v4 3/3] virtio: introduce SUSPEND and RESUME feature
Date: Wed, 2 Jul 2025 16:54:21 +0800
Message-ID: <20250702085421.342224-4-lingshan.zhu@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702085421.342224-1-lingshan.zhu@amd.com>
References: <20250702085421.342224-1-lingshan.zhu@amd.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EC:EE_|BY5PR12MB4148:EE_
X-MS-Office365-Filtering-Correlation-Id: 108a076f-dddf-4575-e05c-08ddb946193a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?frpVrNm93coWfyP8dU8zsUAHAdXAxykkAv10xtHcBSOhstJ76oxKkIxV3I0O?=
 =?us-ascii?Q?LlibY/3lXKjZgqoWV2loa/zdKPxVN8BW4nZ1eIi3Kr9dlMsD9uUerduHyYOD?=
 =?us-ascii?Q?8vxDiaPeLSy3k4hnmIKrdFRtb8kJvW3gtD9BWghCHvUSC2xBxXH3eojAEL+r?=
 =?us-ascii?Q?gkVPDBFkb+9YR6mjzuSyRS4sWZlzivlW9t5tDxI1LSBuEsujBfp2EYMPJhJy?=
 =?us-ascii?Q?b9/H3A03/skCknuqkf4cZJy4wdSYi+je7wgCOZTrhlpQUXA/MGg2n9eIQfxd?=
 =?us-ascii?Q?zTRx3x/vhvkSpgzARaB9P3gon9qej5uBT0ZrKE6HBr0IIn5tOJrcLO80N2qC?=
 =?us-ascii?Q?LykXFB+7HvAEM8bHdBHiiwx9XN9dYQHP9ljZCpMSdvpfI62+NcucyvjCNtFH?=
 =?us-ascii?Q?RCzZbo6i31c8UBbrEec+UgIseNKMnBpRy5HagjA4Hq+/MQrQxsXGLthO3xHp?=
 =?us-ascii?Q?EFoQcYuhTmDr59av64u2a8dp3aQR79Xpl0187NxXQTjlpm6AITaFxBmc3QqE?=
 =?us-ascii?Q?m1RBPCFHpSn0L0l3s76+opS+zlKU3N0pKI6Io5VF7KYscrfFpoOUdarAQQT9?=
 =?us-ascii?Q?wfHUwsdXWNFQlnqGRplFt66frSVzcSmkaTfa5CdUsdqeoiakRuI3tjDcH+Hz?=
 =?us-ascii?Q?uoRqluTVBSXiFJlOwwYr9tYQTARCzpODiAm3M+xwh9FxLjG7GUHo/daewTqY?=
 =?us-ascii?Q?+hJo8mtC2uc+0g21b2H4HMVGRG4tyFpc4Vr4MLlb5Jkms20176daeGHJSjEz?=
 =?us-ascii?Q?ChzQeU4GHmkmFzvGU/yD8XI0R3IbM6tf2U93D8O6Q/eREZsVApyL9gib930+?=
 =?us-ascii?Q?0zSESQFIWQ6Z3Mn3/vTCmOzXg2Hy6EHgPgBDfMWDt3XylCO6qcAddaiaZ9o1?=
 =?us-ascii?Q?R8LHydwfijzg5VTMwOXJGd8nOZ6Eroj2ZWrZE/XU2JLdafAM3eiwB62qytY6?=
 =?us-ascii?Q?gxbhAOZbg94JKjRGMZGVdTNC/0tYujR6vEB40MHTCTxj4v/2UAXdXlmaKbWg?=
 =?us-ascii?Q?v/tITLoZc+HAX3aMcVcT+Fkfwp0OQTk8fnUcTWI8LL+cs8UFkapAAOBEdKat?=
 =?us-ascii?Q?mIy27Nb3+D/quQrRhfQ9xmeBH1Wo4Ns+K51pGEA4fFBvbvxkAikDSdXXIWBS?=
 =?us-ascii?Q?DOQcrq4upRwTjkcRAK+8hxe8vjKjndgY7DMtW14SoU5xlnGMJSZetcN1OE2c?=
 =?us-ascii?Q?nBhi1KVZgZIqO1o5+2C+BeoCcue5i1Ss9XTtxTVm5ifj2y8I/Sc8aEjoibih?=
 =?us-ascii?Q?7q7ZfZOtdwQ/GbuG7ZmZ1u2DiXDfO4I6xEx5zmMnDnftWlam1Pu9GUMd43I7?=
 =?us-ascii?Q?1ZKsVAwmABLdOsp398auLL/WxHGVWi97sgHJH52AlDiaPj50mML9rbT2pnjU?=
 =?us-ascii?Q?0rrOz7+H+CJiw6eIj7pcHDbLqYdSPhHuDwpY9QtCHQ7uxQppHJxuMEFVYyMO?=
 =?us-ascii?Q?D3FjiKMNi6FwztZ1j/VwKX9bLcA+Id2JjXDBcgQFq1i4/ar2KAfpzkX+jT00?=
 =?us-ascii?Q?rDA3GlAomd6m+iRz7R9x4xO5dLJ8GnZgDct+5aHXbgzgjUYESdFaSE3Ssg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 08:54:47.6646
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 108a076f-dddf-4575-e05c-08ddb946193a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4148

This commit allows the driver to suspend the
device through a new device status bit SUSPEND
and resume the device running by re-setting
DRIVER_OK bit in device status.

Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
Fixes: https://github.com/oasis-tcs/virtio-spec/issues/229
---
 content.tex | 59 +++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 57 insertions(+), 2 deletions(-)

diff --git a/content.tex b/content.tex
index 9213dc0..32cabfa 100644
--- a/content.tex
+++ b/content.tex
@@ -42,6 +42,9 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
 \item[FEATURES_OK (8)] Indicates that the driver has acknowledged all the
   features it understands, and feature negotiation is complete.
 
+\item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated, indicates that the
+  device has been suspended by the driver.
+
 \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has experienced
   an error from which it can't recover.
 
@@ -99,10 +102,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
 \begin{description}
 \item[0 to 23, 41, 42 and 50 to 127] Feature bits for the specific device type
 
-\item[24 to 40] Feature bits reserved for extensions to the queue and
+\item[24 to 40, and 43] Feature bits reserved for extensions to the queue and
   feature negotiation mechanisms, see \ref{sec:Reserved Feature Bits}
 
-\item[43 to 49, and 128 and above] Feature bits reserved for future extensions.
+\item[44 to 49, and 128 and above] Feature bits reserved for future extensions.
 \end{description}
 
 \begin{note}
@@ -629,6 +632,54 @@ \section{Device Cleanup}\label{sec:General Initialization And Device Operation /
 
 Thus a driver MUST ensure a virtqueue isn't live (by device reset) before removing exposed buffers.
 
+\section{Device Suspend}\label{sec:General Initialization And Device Operation / Device Suspend}
+
+If VIRTIO_F_SUSPEND is negotiated, the driver is eligible to suspend the device by setting the SUSPEND bit in \field{device status} to 1, and the device sets the DRIVER_OK bit to 0 once it has been suspended.
+
+If the device has been suspended, the driver can resume the device running by setting the DRIVER_OK bit in \field{device status} to 1, and the device sets the SUSPEND bit to 0 once it resumes running.
+
+\drivernormative{\subsection}{Device Suspend}{General Initialization And Device Operation / Device Suspend}
+
+The driver SHOULD NOT set SUSPEND bit if DRIVER_OK is not set or VIRTIO_F_SUSPEND is not negotiated.
+
+Once the driver sets SUSPEND bit in \field{device status} to 1:
+\begin{itemize}
+\item The driver MUST verify whether the device has been suspended by re-reading \field{device status}, examining whether the SUSPEND bit is set to 1 and the DRIVER_OK bit is set to 0.
+\item The driver MUST NOT make any more buffers available to the device.
+\item The driver MUST NOT send notifications for any virtqueues.
+\item The driver MUST NOT make any changes to Device Configuration Space except for \field{device status} if it is part of the Configuration Space.
+\end{itemize}
+
+\devicenormative{\subsection}{Device Suspend}{General Initialization And Device Operation / Device Suspend}
+
+The device MUST ignore any operations on the SUSPEND bit from the driver if the device has not been completely initialized by the procedures in \ref{sec:General Initialization And Device Operation / Device Initialization}
+
+The device SHOULD ignore any write access to its Configuration Space while
+suspended, except for \field{device status} if it is part of the Configuration Space.
+
+A device MUST NOT send any notifications for any virtqueues,
+access any virtqueues, or modify any fields in
+its Configuration Space while suspended.
+
+If changes occur in the Configuration Space during suspended period,
+the device MUST NOT send any configuration change notifications.
+Instead, the device MUST send the notification when it resumes running.
+
+If the driver sets the SUSPEND bit in \field{device status} to 1,
+the device MUST either suspend itself or set the DEVICE_NEEDS_RESET bit in \field{device status} to 1 when it fails to suspend.
+
+If the device has been suspended and the driver resumes the device running by setting the DRIVER_OK bit in \field{device status} to 1,
+the device MUST either resume normal operation or set the DEVICE_NEEDS_RESET bit in \field{device status} to 1 when it fails to resume.
+
+When the driver sets the SUSPEND bit to 1,
+the device SHOULD perform the following actions before presenting the SUSPEND bit as 1 and DRIVER_OK bit as 0 in the \field{device status}:
+
+\begin{itemize}
+\item Stop consuming more buffers of any virtqueues.
+\item Wait until all buffers that are being processed have been used.
+\item Send used buffer notifications to the driver.
+\end{itemize}
+
 \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
 
 Virtio can use various different buses, thus the standard is split
@@ -872,6 +923,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits} for
 	handling features reserved for future use.
 
+  \item[VIRTIO_F_SUSPEND(43)] This feature indicates that the driver can
+   suspend the device by set the SUSPEND bit to 1.
+   See \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}.
+
 \end{description}
 
 \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
-- 
2.49.0

