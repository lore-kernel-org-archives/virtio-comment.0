Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2048.outbound.protection.outlook.com [40.107.92.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7FE21B905
	for <virtio-comment@lists.linux.dev>; Thu, 29 May 2025 08:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748507058; cv=fail; b=YfxfiYsEoAjN3QL4U4Mr8o0/7CK0JNeFKdVjJeMERyVsor9VltD9L6Td2lkZxhWGi7DPI9QJe5qbsOttAyZSlAwquSZPPu0cLHFxaqeAGAmwC5kM5eaHyunCcsf17j8q5N0m3UKzL2SA44p1RddRx3CjwqWIGPk3nuTcd97nBGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748507058; c=relaxed/simple;
	bh=TnPhWad4Hx2GqtOpbZNL7RqOlcndPcRIlNT0ovvy6DY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=u2yRm69Wf4FgIdpN7EJ0R2v/EfJKvMmaJaNYUAt5hRIbvpGQNCaYDlgOOuK4O6VyrdA9E0sIEA28DMZ223nR+QM7Q0he/LaMugWY9LdeP0CXifsNox7NVlfAXP6vZ67UxSnQgqqRvzkRKlW0iIbI6FUOSFjHVBx0WhitjddEY78=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=aw7oa6D0; arc=fail smtp.client-ip=40.107.92.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="aw7oa6D0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tTDW0+wY/LbDQZb9E9ulGmp56tefEG4UPt65vRCrsNbaXpGubQ7riaVaclFKsZZ0a9y6RfwOieGMkDF4GRQjN8h6WP9suN/m3x8QFR2wL4jKi+MnEuCXaUH8z0PnUyXdwaQGhLMurMsbw5nhXbio/fkCkWrjyQRIwVNp1bIzbBctYxGKw7T5cSFvbVXThgja8W998y9Ou9lcOU0ROYP+I1f8aNmzLfuNEzmi1iCP/n1UUTiUrrG4Ma6ufoAqtyDvwEdKkGOpcDQXluQBkPtGJF66/t9fLG9UoQz07lAuvJkRzF+9ZSgDxo0QBrwBYss4V5E0Zuz9XDmnAYH/oy5FvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9LzzWP5s9GfwLWmnxgMWdixesEB0iCuZSnv/wKIne/g=;
 b=vbdz4rJIPp3ksrGksrvcjdUIsg6ahtGufl+KUs6Y/Lpz/15me3YInOVI8X7Nb3PGHmcpArOfxhkzu66qvyeRcYOW1yRwylEvfB7KQINIHvDGhAgun6JcbZqE9mcMxilLvm3PLuDkKIF08g8sKL53izqsbcrifqTIx7NccNnTfHioBu/wcKZnh9nxZ/MgBLET08c2qMr3hd4s45j/PZfaRboYVy1bLkFFpY9KUpGSDqjHYvX2HaypWyyKCVSSqUVR+NMPh2cU28PThfldqn2fs5f22ZwaEzgAUQf7pxdLGiDF/SwrfiHLzy0ZGsy4EInGmIgt+JyOvdyqSChunrFJeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9LzzWP5s9GfwLWmnxgMWdixesEB0iCuZSnv/wKIne/g=;
 b=aw7oa6D0/1WOo1RqK+o7bGrok4WjF7A8JRYhcO8XRWNhoLeqQNPzmt1O+CXMueKIyjv1+PvZvXFtXGrfNdh2updUmUVWzWMtnw4AlsBHKkHad92K/U5FKVmRglRMDF8+tpiWl6YkVI6gn420+I8aSV5lc7mVhYEpAvB4SOFazj0=
Received: from BN8PR04CA0028.namprd04.prod.outlook.com (2603:10b6:408:70::41)
 by SJ2PR12MB9116.namprd12.prod.outlook.com (2603:10b6:a03:557::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Thu, 29 May
 2025 08:24:10 +0000
Received: from BN2PEPF0000449D.namprd02.prod.outlook.com
 (2603:10b6:408:70:cafe::e8) by BN8PR04CA0028.outlook.office365.com
 (2603:10b6:408:70::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Thu,
 29 May 2025 08:24:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF0000449D.mail.protection.outlook.com (10.167.243.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Thu, 29 May 2025 08:24:09 +0000
Received: from fedora.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 29 May
 2025 03:24:07 -0500
From: Zhu Lingshan <lingshan.zhu@amd.com>
To: <mst@redhat.com>, <cohuck@redhat.com>, <jasowang@redhat.com>
CC: <virtio-comment@lists.linux.dev>, <Ray.Huang@amd.com>, Zhu Lingshan
	<lingshan.zhu@amd.com>
Subject: [PATCH v2] virtio: introduce SUSPEND and RESUME feature
Date: Thu, 29 May 2025 16:23:55 +0800
Message-ID: <20250529082355.86884-1-lingshan.zhu@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449D:EE_|SJ2PR12MB9116:EE_
X-MS-Office365-Filtering-Correlation-Id: a967dce6-1aba-47cf-605b-08dd9e8a2fc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ib95KOjHdV7JiACaY1tZQ/4pP9oxGF/nZIdYx82n/jO/rKhNoFK03MgjuvYu?=
 =?us-ascii?Q?MX1aIBp8g6YI9d0ujZy/SttvL3tkWhw2dFOVUgk2Vzj3Vk0NwtzIMkf9+4KC?=
 =?us-ascii?Q?sjowUpnJYRWsrdJxDv8b70OuHJ51N0d95QtxNrKLaNkBi7PERA2sIc02Dxlm?=
 =?us-ascii?Q?CgbHucdEA6fT/PqEYXvU1hmGS0mZ0UGmCajlNtIq2uTIvGQrBeN0lwyLcjX6?=
 =?us-ascii?Q?+9vjT7piqNgQeem7U9J1OafO9a34rfuqpZKDh8Z3mWBvqj983D8OpuBuImaE?=
 =?us-ascii?Q?SJvJzkyxGfi2XSEM8jx+voGcF8HAomWRS8GQpQj+VpHdobxhC995ZjQsyPfW?=
 =?us-ascii?Q?OplqstJQ5xLriy/YryE4UVuNXm6nknEema6jdFIBxV/lP+yFehgsF1Z9+RTu?=
 =?us-ascii?Q?ZSPFSE9EZoD2wJA8wi7TFAWVEqskH4P5CkRwgTk5rq9HRCkHFTJplE0bQCLZ?=
 =?us-ascii?Q?rVstOL8BtaO8bM63sNlUuo9jWFX+JLGBRqSw3eSPcakSpbuBa3ihLIvNGtxi?=
 =?us-ascii?Q?/VwWXwUah1fpAD0WWcAn98laG8Sw8bfWPzs1+tzTMekJOTcH6/5RrX9WaKyp?=
 =?us-ascii?Q?0mA3RDslbcuENEG3z5r8BVyG6DzXKo1DKCaCDRUEu7o7c8XfEojiI+m4gdkZ?=
 =?us-ascii?Q?W3vvz2PJhZA+k8SlZMRRr7/tnqZH5qA2NyRXpoSAvFXTN3UpDryWUHkTkPdk?=
 =?us-ascii?Q?AxDfEm2F8PO9HYdB4VM7sK989erkQFgCKctO/AX4qZDSGVvyNlRRFbJQRx3R?=
 =?us-ascii?Q?9Ccir3j0WyuoMSgin8CleWiLBgKGoWNmPOTI51+frJbUViKp+VkfW4M6DyJD?=
 =?us-ascii?Q?xCurkVv83QLZCApI2X6fEtP/OSqz/DigZOChS4iuOr+btyqAHQhFpWVIyU/h?=
 =?us-ascii?Q?fFy0EYTGXK0kmbFnv8jwTFhl0Qpd84vi3hcKdFbUEYDHjkmTCwP6tBpwVJuT?=
 =?us-ascii?Q?/6l81Dc7PQ8fmdr/f0Il95Lwusi6gyMQ1gHs0VWlN1zfJfOEKht9YDL81Jfx?=
 =?us-ascii?Q?sEMb1IVnqpeS3o/vwZgaZQB30xT+eGNfyGah98NkfKiK3NOaRg69PILkpP9j?=
 =?us-ascii?Q?UFvGiSCYnHJ2JRNPMsg6XTnN880N43DwDFTsXJ6X4y7yVWP546JpFcj9ntEq?=
 =?us-ascii?Q?dIN2BOJNNNFcCeq/GMQ6pDzj4Ri35fPPnegemyALjY8kW7Kwo/5dyT7yKyOt?=
 =?us-ascii?Q?rMFWpThbzphVwPfTIH/SbcGZQIYwV34I65066Nl4b0E2dTAnuIGMLGoW1W8A?=
 =?us-ascii?Q?8X9tcNUm8l8XcNCjXLAJMYm5ncQzcWfMWnjXqNKjNSk5LmsTDPmCyOG4C/JQ?=
 =?us-ascii?Q?gKW/VJfZaajMCohNbARhilSHLU7gZOFRahhIvu2uYPX+s4HrhwDBSy4c3IL/?=
 =?us-ascii?Q?oHFBxV5rnzC5MCtCKEsSYJPMQPBo5VK+QQ1IwyYOFW4W3AJvjbfrEtzV/B58?=
 =?us-ascii?Q?ZwljresOaClBmrVK8R+9qP/L01gPamanKbJsMpK/d7aKCCPzuo/UsQkZgf6U?=
 =?us-ascii?Q?lmlE4bdwOsqQCjkN3CcwUkDFYSBfLwUVgQ4a?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 08:24:09.9930
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a967dce6-1aba-47cf-605b-08dd9e8a2fc1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9116

This commit allows the driver to suspend the
device through a new device status bit SUSPEND
and resume the device running by re-setting
DRIVER_OK bit in device status.

This commit re-orders the device status bits.

Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 content.tex | 74 ++++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 65 insertions(+), 9 deletions(-)

diff --git a/content.tex b/content.tex
index d3fc6a4..caef5d0 100644
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
@@ -872,6 +923,11 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
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

