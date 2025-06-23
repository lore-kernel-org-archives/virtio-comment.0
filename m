Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2061.outbound.protection.outlook.com [40.107.96.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6491B22F74E
	for <virtio-comment@lists.linux.dev>; Mon, 23 Jun 2025 08:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750667825; cv=fail; b=bxHsqvu9jqxUMvVuswKOcWeA0tdbkxedhPbavPj+nlw380fKRm03ABU3nfhpCqwXYc/MGQzI8PlfIdQ2FAv6QaefvistFQ7hS9rFv0ffXz4JET+WDMzbWyybTfde6qaUU5MeJz57qyQA3OGz9BNeDRlZtaS0NtqOrikNM1sAG/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750667825; c=relaxed/simple;
	bh=j47KWe+2izTf2mFjOBeXBazfMbOzkPnow1M+XqLzu3k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EMyc5y4Fsw4l1GCGrUwsOn0mbkDbm+9OaSjVytSl+185gS3EytrMO0ldeeN232JIQbMBtm+Uutg6ALpq3MeQWk5bgt9vup3+H57hba0hV3R8h0rkFVOdg+KFxjenKDT36nx5jn+GL8B/GAci413c/Kjl74d7gHU5yNSGIc+dJPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TVAMxFBv; arc=fail smtp.client-ip=40.107.96.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TVAMxFBv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WXgLPmgn3PVSBLLRKlC/wS8/YW1qpaYUFXflHT3cW9r9xKAz0mLp2CVt6Hja1AnH9Q9DQMuU6/24Lxm6xufB4U6F2cSaRVrn/Doh/5meDJEo8HFcso48eC0ZSeEr6vVr8THDmeQtQct0D8LWa0HVMF09Tdgo3wDmHZjU7a/34/VpmLC4QgU6V1fHz2SQZfRVZfBVVslmvdofibP9rVl8s65R8AcBq381QH9WzLY8AYeDNVwKAnckJeWGfbx1rX5W32s5ceS+3pEYdrom1tnGDThvthqMWrbpBw5NaQ3aEcRhDa6uaNDEbYMG/yivzcqyXz8S2LKCbZt4AkmsCXFjDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+1T+/pqO8Y1NZ5lXKmZAB8BGRDthJqPjmp7cKOnrlwM=;
 b=kLMrUJ46W2zmQguPGFXHoSEqBPlF6yGmNLdcPtc/Ij7v8VMlSicws+7jovtZSa9+ozEFScBfl4E5/kVQjApD/GAjbUOoF10/xHvdFU8Wxz1VUZYdAnBgc92RH8SSFUmgfEIgVJRx4bOhcT5ssfg6JkL93fYOXpJZk+U0OQQwcrKCmiOE1ImUkUTtZYVtt/y1RTCLGaantBAHPEA6vcGyOKUHwp/EuLnSk/7Z8Lsmnx/V7Z+iHs9i7cPSnMOljtMcmXB45ka/dYaSRRfV8/Pf6M7o0LxtQM2lH8M2huud/jjKc2WGhnJY2GlpVUeeagNDRYaMDQMtwCJrFfzkjsr5Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+1T+/pqO8Y1NZ5lXKmZAB8BGRDthJqPjmp7cKOnrlwM=;
 b=TVAMxFBva0x/+ka/p0w2WUTdXwGzHNEPbJmqLwOxH1Y6Ax1BtVykg93n15oYZ35Lfou58Idfzrk7MRQLZ/JSvloTqapjbYNgAaUHV7HD7wRqC+7r9cPOHEzsHFao5LG4nP2PR+wyXy9FLJI2WxVqydTqE637zAZdZuHiOyCF5dM=
Received: from PH7PR03CA0008.namprd03.prod.outlook.com (2603:10b6:510:339::34)
 by CY5PR12MB6574.namprd12.prod.outlook.com (2603:10b6:930:42::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 08:36:59 +0000
Received: from CY4PEPF0000E9D1.namprd03.prod.outlook.com
 (2603:10b6:510:339:cafe::7) by PH7PR03CA0008.outlook.office365.com
 (2603:10b6:510:339::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.29 via Frontend Transport; Mon,
 23 Jun 2025 08:36:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D1.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Mon, 23 Jun 2025 08:36:58 +0000
Received: from fedora.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Jun
 2025 03:36:56 -0500
From: Zhu Lingshan <lingshan.zhu@amd.com>
To: <mst@redhat.com>, <cohuck@redhat.com>, <jasowang@redhat.com>
CC: <virtio-comment@lists.linux.dev>, <Ray.Huang@amd.com>, Zhu Lingshan
	<lingshan.zhu@amd.com>
Subject: [PATCH v3 3/3] virtio: introduce SUSPEND and RESUME feature
Date: Mon, 23 Jun 2025 16:36:37 +0800
Message-ID: <20250623083637.296041-4-lingshan.zhu@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623083637.296041-1-lingshan.zhu@amd.com>
References: <20250623083637.296041-1-lingshan.zhu@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D1:EE_|CY5PR12MB6574:EE_
X-MS-Office365-Filtering-Correlation-Id: 533907d2-4842-401d-44b2-08ddb2311e6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uD6PN3noXZ7JpVzBzKx8byqxmrI0+SwJ8Auy9janyCpkm2OrT/tsorTEIRCe?=
 =?us-ascii?Q?sYLf6fn2Eg/3U1edmTyT0R4QyWE1vKLckuy6cb7lQiWpChX0cE9ohdrriaMr?=
 =?us-ascii?Q?jE4vh5hXJwoFufKq9fbIE9WgTtAMNFG0iu3YQIrYpMvCCMwCaNAZ6oQzpA6/?=
 =?us-ascii?Q?LYmzsftmEpV+51d0D2fGuTh0gLW+RQ4GiD/2Wh8umPn/Xr4PVih4WbwUgqny?=
 =?us-ascii?Q?A6smR4vWrmXBN3DQro45uikkupHTvuG89iKFAsPC7t9bqZtvZuKB8PlrCGwx?=
 =?us-ascii?Q?DJjUojhvehRhcuRIv6+3NaFlTqa4gv87FEu93SyAQKCz8E3sZtHkkVv/a3Hm?=
 =?us-ascii?Q?Mo+FjzAh9hsbPeAjIiikgWOemnKxzYhZU8XDKKcbxboq+kMZ2AwCuyXCgNkc?=
 =?us-ascii?Q?YhLpwQ0U09a/MiX93PXMYV3PtCRylWBTdpRt4UwBJlhCdb8PjYYIaL3QAPp4?=
 =?us-ascii?Q?eaBR9qjwVVVKMn32gSOT4AOeaWyO1JjgdXEotJDgzwVJ71O3rem3GQVCHiRU?=
 =?us-ascii?Q?pl3twgjMjPCuEcZJ020W2Y8RzEhNgQQ5Fh7VdS4c0W4wueAb6M50UUCtW8RF?=
 =?us-ascii?Q?eHRH3pbgIJkKaWZe+8VnQau5ROvnN/wj6qEByis22bXXHu/AGMIXpbOt/LK6?=
 =?us-ascii?Q?yEXaA9l5eRn98SQpCIuj73ct23z9DTVTPFIIV2N7EcenXFIqwIPaL9r7ic8m?=
 =?us-ascii?Q?n1NsZbRXHcZ+1RO/uD45T0eWIklnKtjK5C83fjV1GHuEHKESkQhAZcMDn+S5?=
 =?us-ascii?Q?9uFUWt22kroaUov+tMMAw/RPoK/mPAec6lrFL7gJVl/Rv1uCBSbPdDA9TcaR?=
 =?us-ascii?Q?cgpHAQJVPSTH/ksnw+yi/kC/fW4/tho1wbqpTuDHSyGVZO2ZuPVzax7eh+2p?=
 =?us-ascii?Q?Q82DxMaqw18bLkryH+PHoI0TBg2Xv7o4WsKIjgYXFOF5ttyKeZ+/CIx613te?=
 =?us-ascii?Q?JmogdUw9Mk+3kSD/NsLmwOG/MeFObk6E3b3SR05By1xVHaWlJUY3SDPuXvhO?=
 =?us-ascii?Q?kkFK5OHjq8gpUISD5o2dYdIzPdH04XCakm2dO2B9wVHAVxAJtsUbGP2TEmfx?=
 =?us-ascii?Q?arjDgQNmp3llhPwmi7ksepB7R/X6BDaBDlWOBI28XJR8xJjhP53pG9z+46uS?=
 =?us-ascii?Q?rTCll6HYnHczQ5/OelK/MuBAqhqfKZllDPQahdd0T2mDpk8n0FH2dUxecFRp?=
 =?us-ascii?Q?7IONZgPQ/R7HBUwqpqDIUrV8xg8n5BCbcuc92Hp7k7l7yz+18fBwk3JtsdTO?=
 =?us-ascii?Q?OERp4gn5xL9sOC/6ZKZele++WPbM4+PzZPkHb8anlXRp1T0W3lDOHsMmMWN4?=
 =?us-ascii?Q?DVy8pkwGcP93OxBUcuqXWMuXNVLPl216rzsc9MJOQy/xWv8K0vvw8ZOsjzOb?=
 =?us-ascii?Q?E9C/7ew/bLDDZhqeP8lWLS0j/aaEbwD1YxQ61J4O7eerkDDGuoxx77XX+yDL?=
 =?us-ascii?Q?LHK03d9UXbtHn1Qgf2rsdmxd3YL1X+mHuA/F/EE2rmofVhxAJ3CEX+U90Fmp?=
 =?us-ascii?Q?dJCR9uohdfhoiSxSsRmz2lB8ezfJinan4+d7?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 08:36:58.9095
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 533907d2-4842-401d-44b2-08ddb2311e6b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6574

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
index 2e8da46..c987334c 100644
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
 \item[0 to 23, and 50 to 127] Feature bits for the specific device type
 
-\item[24 to 42] Feature bits reserved for extensions to the queue and
+\item[24 to 43] Feature bits reserved for extensions to the queue and
   feature negotiation mechanisms, see \ref{sec:Reserved Feature Bits}
 
-\item[43 to 49, and 128 and above] Feature bits reserved for future extensions.
+\item[44 to 49, and 128 and above] Feature bits reserved for future extensions.
 \end{description}
 
 \begin{note}
@@ -629,6 +632,54 @@ \section{Device Cleanup}\label{sec:General Initialization And Device Operation /
 
 Thus a driver MUST ensure a virtqueue isn't live (by device reset) before removing exposed buffers.
 
+\section{Device Suspend}\label{sec:General Initialization And Device Operation / Device Suspend}
+
+If VIRTIO_F_SUSPEND is negotiated, the driver is eligible to suspend the device by setting the SUSPEND bit in \field{device status} to 1, and the device SHOULD set the DRIVER_OK bit to 0 once it has been suspended.
+
+If the device has been suspended, the driver can resume the device running by setting the DRIVER_OK bit in \field{device status} to 1, and the device should set the SUSPEND bit to 0 once it resumes running.
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

