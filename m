Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2069.outbound.protection.outlook.com [40.107.244.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7808922F770
	for <virtio-comment@lists.linux.dev>; Wed, 21 May 2025 10:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747822879; cv=fail; b=Qt9H3aMo95jZRjaMg8Yr1OzTWosPqShd7qH8HYqcjqPBmro6xeFgb8ClrKwdAfaGqRS/5g27ynQwy2wObF/0vSZYN2PKeslM7YHbw2btw/ASf046Mc/cDlkP8cyu5HBl8bBeA5vs523fh6M+LldiQfiU/nH0qPugNADH/vozOfk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747822879; c=relaxed/simple;
	bh=KwdZ1RlI4ZouFcobcSh83AhChVtK2Ck0DZ/IQMuZYiM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SpDYNt252Wl+psBYFFdJC8oT7RI2IZXD7E1aVBNx/K3VKqaS8iAgISIgwEtnAlxnB02vGSBstqDqKwZmJxVZTAZU3iW7a8StgtgI439INqNBJWugAoZSZ+4blnlXLhsvDeAQTLiIerL4naiQIMpRhPC/wC/p7DEYbhsMEu3IoZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Mj6bCp6H; arc=fail smtp.client-ip=40.107.244.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Mj6bCp6H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uolrgJpaArt92bVAqtAomO3Fktb0bNAokZrLWFREcDmcXQCgh+Cm+zOyepMUaLAJzZBjU1hFlJHWl1xnQJKTxIYJCOalkWMoafEsaO1gX0o5iE2Ou1cVzKIE7Y3JlBxd5rCLegV5ZXVRVGky7KyXjjMim5DJMOq8rcOJ9rjXCHdNozmlZEMjvDZLRvAs4RZgyfRiarcCh4ypm4DEmPBZONi/uWS1ogRsT2mc7xmt49ANiStB3z/Z4spfIXD0y9tIfAXL7ux7ho/ERsdMLbGBqLqIPp869nJ1G0C7/26x7ZjYQqph9BICgqBddF+OayuQeN0HVFNYS3VOusmUQFJ4NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eorP41GJrIQMiJLNEDSq1uYkSHLnmOCwxQatvi1Dl9k=;
 b=vQEtC2/2QTh/LqTfSON4Y4wwNNbjjnN9hkiLUgdO2xtqQZpYqiu9cT5VFa/YM60WKkHLNgwERTUyCb9OD9V2v8Kh1iFXQ9aIOHQg5OvjM2jfGGr9wLYElTk+sUjUCjDKmBeJVWHLae5ZpA3Vl4ErFzcd9ljm834NT62HViuvyw7+wvxDQTp+2rOXOylUyI4bZFLGxBcPOTFOXA7tdLiENOQm1pkvPpPJYawuOORd0mZq5bbtQ5/hVvv7Pcma6kaJKNplCqyEK/BBKc4nMyG8B9jmdTm3CsE9x6yPuqKIiNlOsbsxcHhQJf5PcmwLOIhTWUby04uLMmp3wXGNgqz1sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eorP41GJrIQMiJLNEDSq1uYkSHLnmOCwxQatvi1Dl9k=;
 b=Mj6bCp6HI2TwI6aMpHJ2kbVb9+7RcftFcvAQMCarUmxrUB8i6KzMD17HHEJwbF8o10kWJjKI6LrznB9R4Ti7F3rUdNO/V01rPHjC9FwTKvn1AXb+dbK+yTFEeZ4Qp5hGz3MwADSNT6biCoXF1z6QAeIfZkB7ucolMT4JuwPQNYY=
Received: from DM6PR06CA0078.namprd06.prod.outlook.com (2603:10b6:5:336::11)
 by BL1PR12MB5972.namprd12.prod.outlook.com (2603:10b6:208:39b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Wed, 21 May
 2025 10:21:11 +0000
Received: from CY4PEPF0000EE33.namprd05.prod.outlook.com
 (2603:10b6:5:336:cafe::3b) by DM6PR06CA0078.outlook.office365.com
 (2603:10b6:5:336::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Wed,
 21 May 2025 10:21:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE33.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 21 May 2025 10:21:10 +0000
Received: from fedora.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 05:21:07 -0500
From: Zhu Lingshan <lingshan.zhu@amd.com>
To: <mst@redhat.com>, <cohuck@redhat.com>, <jasowang@redhat.com>
CC: <virtio-comment@lists.linux.dev>, <Ray.Huang@amd.com>, Zhu Lingshan
	<lingshan.zhu@amd.com>
Subject: [PATCH v1] virtio: introduce SUSPEND and RESUME feature
Date: Wed, 21 May 2025 18:20:49 +0800
Message-ID: <20250521102049.68666-1-lingshan.zhu@amd.com>
X-Mailer: git-send-email 2.49.0
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE33:EE_|BL1PR12MB5972:EE_
X-MS-Office365-Filtering-Correlation-Id: f0e7ae4b-40ab-4c41-9f5d-08dd9851350e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BnFAh+T1k2xW5q/o4Hq2sNRZ99mbcNtnsI21nfyKH6FndJC1bPuIWEjUgUKd?=
 =?us-ascii?Q?HlX2+Gf7C1oop+tWiIEsBOCr48Mr2NP9XO9hbC1mtvmhDfjLbWCxVv0vNCur?=
 =?us-ascii?Q?7ePzFVeyXnLedDmvUfJQQX9dH+YKxMzsa0ngV705Iz8lJAYQlHLMVSdqryKW?=
 =?us-ascii?Q?bNb/xbZTyk9djPIMbTklMEZZREbkuHWlt1ljylX7syogkc+KOLc0g2eL7rpO?=
 =?us-ascii?Q?r8Gk0DWkAeHo5Q3WhCZol9KARLFa/kagyAUol9VQiA/gW6tAipN+gZwPl2lz?=
 =?us-ascii?Q?jnd1KoDZHCMHwiqNwld4P59Zt7hOyx0ToLdeT9g5dTH2/ufEEvHhhrMAtsD3?=
 =?us-ascii?Q?Ghy9jdXzxHoWyp0QMkpxd9nW9iWeSiTun4hhGMZnrVJghcsTcIGDQQZhYZS/?=
 =?us-ascii?Q?BEH7VWXh10tM1kqdZKEgFEUu4nXRS/lEKfkHt2UAlCfbMqiB0x8HUIxbg177?=
 =?us-ascii?Q?fYtCtdOr7Dwe5GYRYEIjCgX4C35Qy03qBSQYTzRNRMVNQ7dLNt8NnOhzBg2Y?=
 =?us-ascii?Q?QNoN7q8jPGSxSTWQ6vKkgqo/yKhFZrvDmj8e3fNecqZYjlq8Y9cDCFCinFID?=
 =?us-ascii?Q?0Rf+rdctEt/eITT7Sjhe9fZ+dTaGMB77s1cPxhS56iR5SwI3uWD7Em9qU6rJ?=
 =?us-ascii?Q?QhXMKihVKzg0gqmBjgetAO13aaXyW70I1/O1N8vkWX3JB9TOjb0DQdsjKIu8?=
 =?us-ascii?Q?mLp1ekOXJ74iIf/+VB4Dy0ctweLy3xlpCu2XAalY69V5d1+OaiOnlJVxJhU7?=
 =?us-ascii?Q?bBeyc31PpD4ZK/rG6YBl2r6Qvy9eZ4oiOU/skLtAG6ifYa/seJ5CNIXANlVA?=
 =?us-ascii?Q?OECumrTKnJaWuNLnyyhXPrkoXFljsnucEdGqXB454zp3nysL3B/R3p3bW0NI?=
 =?us-ascii?Q?tXr0lTAKuTzrUVtvFiP+RRdtSPE2ArKEDE2XI1T/+uS2HTTpTQkTFMI8zYpQ?=
 =?us-ascii?Q?0iAtVXQiicFEXkxEqwtgfulBWv1A7qJDe9uqAd16/7J6/QnbNe+q7IGUcoHv?=
 =?us-ascii?Q?JRGow8mpiQRBzm6wGqcrtUHqnUDmH4rMh7kY9DdtO8N0mnFRwrpIl15NaXfq?=
 =?us-ascii?Q?eZAQKJIP8woLGNxFJrbdQVB928p8UTi3uPUDO5plHO5ocgRFtbjj3Uhy8Afl?=
 =?us-ascii?Q?SrU59q26yNKJ52DMzuuq1gQgHxRtWmOi8EOQ5IVeJr/FC3Tu2iDEwYtMW+sE?=
 =?us-ascii?Q?sV5hTc6x9ml4Gtbx5LQIya4/4nlt/qROLuqxZpJt7MG5UKLgkTTEaq/BsquY?=
 =?us-ascii?Q?3LC+5fiWw9IUQlGVl75euRA5ShgvZmLj/D9cq9WP5bCriQK3cJaHPFDwHgIQ?=
 =?us-ascii?Q?tEsouYWL3SUiI4E/hYimwRoD/CI4OfjvZrOQSx4si/UzbjT19Tl7ICvkK8Fk?=
 =?us-ascii?Q?ATRJczxHtwJmVS8SDR4WgPXI60hCMM9kYg24VjzsBaW0raOt8NIZHdJfRV90?=
 =?us-ascii?Q?3XvVFI1OfmD1Y+yhjFHEYvpYhQXba0OQHEmkpIWukwbSnwgnFGR0rMmVpvOW?=
 =?us-ascii?Q?qD5FHmzb2x1VZ6v/kj4OIPfwbNqTFMxBhGH9?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 10:21:10.5394
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0e7ae4b-40ab-4c41-9f5d-08dd9851350e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE33.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5972

This commit allows the driver to suspend the
device through a new device status bit SUSPEND
and resume the device running by re-setting
DRIVER_OK bit in device status.

This commit re-orders the device status bits.

Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
---
 content.tex | 72 ++++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 63 insertions(+), 9 deletions(-)

diff --git a/content.tex b/content.tex
index d3fc6a4..38b4529 100644
--- a/content.tex
+++ b/content.tex
@@ -36,19 +36,22 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
     this bit.  For example, under Linux, drivers can be loadable modules.
   \end{note}
 
-\item[FAILED (128)] Indicates that something went wrong in the guest,
-  and it has given up on the device. This could be an internal
-  error, or the driver didn't like the device for some reason, or
-  even a fatal error during device operation.
+\item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
+  drive the device.
+
+\item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated, indicates that the
+  device has been suspended by the driver.
 
 \item[FEATURES_OK (8)] Indicates that the driver has acknowledged all the
   features it understands, and feature negotiation is complete.
 
-\item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
-  drive the device.
-
 \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has experienced
   an error from which it can't recover.
+
+\item[FAILED (128)] Indicates that something went wrong in the guest,
+  and it has given up on the device. This could be an internal
+  error, or the driver didn't like the device for some reason, or
+  even a fatal error during device operation.
 \end{description}
 
 The \field{device status} field starts out as 0, and is reinitialized to 0 by
@@ -99,10 +102,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
 \begin{description}
 \item[0 to 23, and 50 to 127] Feature bits for the specific device type
 
-\item[24 to 41] Feature bits reserved for extensions to the queue and
+\item[24 to 43] Feature bits reserved for extensions to the queue and
   feature negotiation mechanisms, see \ref{sec:Reserved Feature Bits}
 
-\item[42 to 49, and 128 and above] Feature bits reserved for future extensions.
+\item[44 to 49, and 128 and above] Feature bits reserved for future extensions.
 \end{description}
 
 \begin{note}
@@ -629,6 +632,52 @@ \section{Device Cleanup}\label{sec:General Initialization And Device Operation /
 
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
+The device MUST ignore any write access to its Configuration Space while
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
+When the driver sets SUSPEND, the device MUST either suspend itself or sets DEVICE_NEEDS_RESET if failed to suspend.
+
+If the device has been suspended and the driver resumes the device running by setting DRIVER_OK to 1, the device MUST either resume normal operation or sets DEVICE_NEEDS_RESET if it fails to resume.
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
@@ -872,6 +921,11 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits} for
 	handling features reserved for future use.
 
+  \item[VIRTIO_F_SUSPEND(43)] This feature indicates that the driver can
+   suspend the device by set the SUSPEND bit to 1.
+   See \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}.
+
+
 \end{description}
 
 \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
-- 
2.49.0

