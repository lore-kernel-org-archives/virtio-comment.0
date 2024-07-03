Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2068.outbound.protection.outlook.com [40.107.236.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D2B1754B
	for <virtio-comment@lists.linux.dev>; Wed,  3 Jul 2024 03:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719976282; cv=fail; b=Z5Zn2+dFTYO2smnXSprLV6y3PKAmneV2CKI6MgRoJBPKxJjIv6atptO1PXD/zZ8VFMZ/Agig/vsLgYNMumCyfXRmhvhk2HY3oRpx9fhJVoRX6VaNz3bp+zluQ06oDBPf5jyTaYUrSPrlScf5YIE2/1Jthg8vkfs5xpeKOzRjl9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719976282; c=relaxed/simple;
	bh=JyE8a1rcqHsGGE2+B6y69EjX09TmDDM0avPzkPXX68w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=unoY4+x7ETUe+gTeulEyw2Zx0FN3lDSA82iev2cgMFj5JkZwoh2ige9JzdoMd/etN/8sF9Ch713MqPFlNVrwFUqSo5XbdnION7sTInTQc+IWyu+MH3YVbGE5pMol4pQdba5MCZ2dNRo8OlMu2eUdos1AXKdrO+YGqbMeV+3XJn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LPPgEyFl; arc=fail smtp.client-ip=40.107.236.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LPPgEyFl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iY3lDc9soyXdMhxGZ0sSk2iiAGlewIRnunRvptVWBJ772zPpeEaeJoLBLC74QcS6cU9k2+v8PJQt9EH7YaaBARY5a6jGqNCjZnrlgySHzAE/kyxeoqo6e9dvABV51mJ96HaS7reZGHvQ7fRY0P1A3dzXxkapegTqfncCmVHOQLinV9gGoQqbXEW67jvfT6ZVlSC9gSTiDKo+1shykwk6vjQXNxm+XYRyTPp5086yUCGcVZu5okjWy2oYHpY681TYp/Jr0RI7AGgc8cqMhKbygYRiD5TwZpLEXHpq4MLggEvfCsabAqxMfS9QzZDmtnpxygJqXT6hvMquSwokat2AIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=avBXOiYdxl9ksC4LB5rEpmwNbMRlIJnZLGt7lP+AxNE=;
 b=LLa0kCELLgfVyd6yqyBLdaCOMdX/eoK7C2gN4RpQStN199xNL8ggeeH0/GjwTSWcd/N8zdPXYaJb0v8yxb22ldT/ETMFne4q/CrWDXmXQmLCb5vXEzNOYZZ3QeQcO1VBH/ItTbwveKCI/I+HD/bk0pacLwJg6w4GP9fIkgTChqDxMG3IiZEVH0/tXyjkx/a2lcc11mwYjhyZasiO70svLWiVO8I6t5GDt6pcsbT4KsXEFqbGQXHD/uITXpbivEVBfSHv9hdH+OqWK0bsHYOdKxsAQVuWMZW6hyhGC/YSgPzYeNM7pIgCanU3rZarrQaRC0hmZuPIyHQFDdV8/zktWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avBXOiYdxl9ksC4LB5rEpmwNbMRlIJnZLGt7lP+AxNE=;
 b=LPPgEyFlsapPYfODSLFAjUaJB+NL418uMrdBREvKNRQe/uTLl9LiywWSQ+XUF6yS8GwyAw1OTeObOvFqbWB54i1/Fxk9wnsgjDYfUFPwdKZ1QFkQsW9tK0l6oiP5Aro+SdlEaDjr06hIJqkd6WLC6Mc/dLz1+NA4H3jmLEpsN1E=
Received: from MW4PR03CA0284.namprd03.prod.outlook.com (2603:10b6:303:b5::19)
 by CY5PR12MB6454.namprd12.prod.outlook.com (2603:10b6:930:36::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Wed, 3 Jul
 2024 03:11:16 +0000
Received: from CO1PEPF000044F8.namprd21.prod.outlook.com
 (2603:10b6:303:b5:cafe::6e) by MW4PR03CA0284.outlook.office365.com
 (2603:10b6:303:b5::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33 via Frontend
 Transport; Wed, 3 Jul 2024 03:11:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.1 via Frontend Transport; Wed, 3 Jul 2024 03:11:15 +0000
Received: from fedora.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 2 Jul
 2024 22:11:13 -0500
From: Zhu Lingshan <lingshan.zhu@amd.com>
To: <mst@redhat.com>, <cohuck@redhat.com>, <jasowang@redhat.com>
CC: <virtio-comment@lists.linux.dev>, Zhu Lingshan <lingshan.zhu@amd.com>,
	"Zhu Lingshan" <lingshan.zhu@intel.com>, =?UTF-8?q?Eugenio=20P=C3=A9rez?=
	<eperezma@redhat.com>, David Stevens <stevensd@chromium.org>
Subject: [RESEND PATCH v6] virtio: introduce SUSPEND bit in device status
Date: Wed, 3 Jul 2024 11:10:57 +0800
Message-ID: <20240703031057.37565-1-lingshan.zhu@amd.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F8:EE_|CY5PR12MB6454:EE_
X-MS-Office365-Filtering-Correlation-Id: d777829f-0b9b-4938-7dc8-08dc9b0dcd43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cGRrc25SeDBqbnNzN2h2dUIyL09tYzYyL29NVC83S3FKdVphVk43V0JYZTV1?=
 =?utf-8?B?WDY2Z3Zyb012QTJPM3ltUkJnTmV5ZWhRTExGb2U3Y2wzdFZoL2hldHI0bHVP?=
 =?utf-8?B?V1BZYWNUREN4WDkraFBML1FFcnpjMXY2cjR3WVNVVEtieDNiWXFrKy9BODVJ?=
 =?utf-8?B?NzBCWUh0bGQyMjE2ZmtuVDlZWDJUK3N6bE5XcHRLSmdiTVFKZk9YbkFrL2lt?=
 =?utf-8?B?SkJTbEQ3VnlsNEhzUTNhQVVCM1ZoQ2dZVHR4RytXZG1MVWVoakM1WUQ2YUFR?=
 =?utf-8?B?SkhJcFRkb1RMVFRnZnB1M3l1ckZFYUFxNGRodW4ycEx1czZwTW02UUxLOW5D?=
 =?utf-8?B?WngzcmtmQXdNN3liVTdGcjFBL2lkOW5WWFQ3UGxLNDRSSG9zeEpNMnd5Q0JG?=
 =?utf-8?B?eHIzdDViVzl1eXRjSFMxVVY2THUxUmRWNmZJWFlsdGhCYzdMNTlPbU13UjUx?=
 =?utf-8?B?RGNMTjlLUUJacDRzY29raGlIMGxEa0xSNHNPYlNRR1JUWVJxQlVsTjJ0Y2J2?=
 =?utf-8?B?dFdnZWcyOHl0WisyZmVRd1RNTmdHekJ0SjRQbGpkMHRBMWdBblBBKzBvQWhT?=
 =?utf-8?B?bnVkSVdhZ3JwWUc0NWhUTUc3Y3NBOUFCVkFQWkt3RUh5UGluTTlOdnpDN2t3?=
 =?utf-8?B?aTFkRnZTZVI0bGRQbFczaG83Ui9VOGdtRk5aeEFpalE5WkhpWVJrVnV2UGds?=
 =?utf-8?B?aVNocklycXRGOUQyM3R6aGVjRWVmSWZEY01JQ3EycDBpb1ZDajhGa1prWVpN?=
 =?utf-8?B?OS9GVWpPTk1UMWdhZUwxK3Q4aXJtdmQydWhrM1AzaHhXQllid3BWUVZaVVgx?=
 =?utf-8?B?eitrdU9YRFlGY2h4ZjJ0ZURIN0R6KzBoWWdNbmltSkhxdXN0UlFFNTQwdjBX?=
 =?utf-8?B?ZkNDQlQwdU9RRjFaY2lLakE0VUlJaVgzb2U2aHJBckdrT0dRdHZpL1JyWElD?=
 =?utf-8?B?QWdyVUFONVJCYVhSZ0V3a1orRVdVWEVZbWJxbkMwUVBFdDlLdFRNa0VmaDY1?=
 =?utf-8?B?Kzl0VmM0WUpYMFpBT3dYWWZmMHFXQm5wbC9jOFJVRUxVU1lKVTVjVDJYeU1O?=
 =?utf-8?B?RURBelZ2dHppc0YvZ0xpWFJRV2k4SXNCSWo4MlBhZ3RSZGhHN3NTRWhGTGdv?=
 =?utf-8?B?V3VBZ0xhV1NOaldIL3ZuVmhGQlBtZWsyMlZCY2NiOG5JS2lOVlE5T2JUSEI0?=
 =?utf-8?B?QUl1a29ZeXhrR3d0elFNMFRSS2xYZXdrU0NKYlNLQ09sbFNrdno2VzdSdjVU?=
 =?utf-8?B?OGswL3BueUt2bDZwUDcwb1c3OUxSQUcvczFnZ3FCZXkrajdsMng1YVZxWkFp?=
 =?utf-8?B?eDZuOEdYeW16cEdIekFYaHVxRktKZHUvbVJaZU1HTEVTU3JWbGo4dTRvZDdi?=
 =?utf-8?B?RjdVVmZ1T24zMk1hRnE1SjloSVZLWTRiano0cUs4eWo3YkRmU3VqT2x4aVZu?=
 =?utf-8?B?MEhaMVYrdXdCeUV0c3pQK2lEcU10UTdjWlhWVVp6ck5aRHIyOFhndExYSFc5?=
 =?utf-8?B?WGQ5WUhEaGV4R1hIQUJtRmpuQXpMc3VmRFRDbVpqT2l2ZE1XelA1R21FeHQ5?=
 =?utf-8?B?alVGMGExM3I1T09CRG96VVF6S2JKMXhGVHpCS0lxVFUzRzFYZWRwc21WbXlo?=
 =?utf-8?B?dUxMclNaY1UxektzQmxwU1FvRE9jYk94cWpySk1OalJLZWVSM1BHUXBjZEJo?=
 =?utf-8?B?NXltbUNNekhrM2ROaStFZzlDa3Yvd0VIY2loMjdSeEZoSWtVNENMcWQxdW1I?=
 =?utf-8?B?L3NPUXJ3dTB4RVRLR3V0MEFvV1ljUnJCZkJvbzEvMk5kUE4ybHRZMUttMEl1?=
 =?utf-8?B?T0hEU0pMU0VicjltVy9xQVhCemp1MGp1MzRRSEJvQk9kKy9BSy9uL2tBdUZw?=
 =?utf-8?B?WWJpcjFJckVxakNmZzM1THBOK1BtaG5oTFYrY00vZHY2Rll2eCtlbjlWOW94?=
 =?utf-8?Q?61tSH0Qez7uuPzgsfHxm51rbgSzHEMhv?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 03:11:15.8681
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d777829f-0b9b-4938-7dc8-08dc9b0dcd43
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6454

This commit allows the driver to suspend the device by
introducing a new status bit SUSPEND in device_status.

This commit also introduce a new feature bit VIRTIO_F_SUSPEND
which indicating whether the device support SUSPEND.

Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
Signed-off-by: David Stevens <stevensd@chromium.org>
---
 content.tex | 71 +++++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 61 insertions(+), 10 deletions(-)

diff --git a/content.tex b/content.tex
index 0a62dce..8c974d3 100644
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
 
 \item[FEATURES_OK (8)] Indicates that the driver has acknowledged all the
   features it understands, and feature negotiation is complete.
 
-\item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
-  drive the device.
+\item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated, indicates that the
+  device has been suspended by the driver.
 
 \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has experienced
   an error from which it can't recover.
+
+\item[FAILED (128)] Indicates that something went wrong in the guest,
+  and it has given up on the device. This could be an internal
+  error, or the driver didn't like the device for some reason, or
+  even a fatal error during device operation.
 \end{description}
 
 The \field{device status} field starts out as 0, and is reinitialized to 0 by
@@ -60,8 +63,9 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
 initialization sequence specified in
 \ref{sec:General Initialization And Device Operation / Device
 Initialization}.
-The driver MUST NOT clear a
-\field{device status} bit.  If the driver sets the FAILED bit,
+The driver MUST NOT clear a \field{device status} bit other than SUSPEND
+except when setting \field{device status} to 0 as a transport-specific way to
+initiate a reset. If the driver sets the FAILED bit,
 the driver MUST later reset the device before attempting to re-initialize.
 
 The driver SHOULD NOT rely on completion of operations of a
@@ -99,10 +103,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
 \begin{description}
 \item[0 to 23, and 50 to 127] Feature bits for the specific device type
 
-\item[24 to 41] Feature bits reserved for extensions to the queue and
+\item[24 to 42] Feature bits reserved for extensions to the queue and
   feature negotiation mechanisms
 
-\item[42 to 49, and 128 and above] Feature bits reserved for future extensions.
+\item[43 to 49, and 128 and above] Feature bits reserved for future extensions.
 \end{description}
 
 \begin{note}
@@ -629,6 +633,49 @@ \section{Device Cleanup}\label{sec:General Initialization And Device Operation /
 
 Thus a driver MUST ensure a virtqueue isn't live (by device reset) before removing exposed buffers.
 
+\section{Device Suspend}\label{sec:General Initialization And Device Operation / Device Suspend}
+
+When VIRTIO_F_SUSPEND is negotiated, the driver can set the
+SUSPEND bit in \field{device status} to suspend a device, and can
+clear the SUSPEND bit to resume a suspended device.
+
+\drivernormative{\subsection}{Device Suspend}{General Initialization And Device Operation / Device Suspend}
+
+The driver MUST NOT set SUSPEND if FEATURES_OK is not set or VIRTIO_F_SUSPEND is not negotiated.
+
+Once the driver sets SUSPEND to \field{device status} of the device:
+\begin{itemize}
+\item The driver MUST re-read \field{device status} to verify whether the SUSPEND bit is set.
+\item The driver MUST NOT make any more buffers available to the device.
+\item The driver MUST NOT access any fields of any virtqueues or send notifications for any virtqueues.
+\item The driver MUST NOT access Device Configuration Space except for the field \field {device status},
+if it is implemented in the Config Space.
+\end{itemize}
+
+\devicenormative{\subsection}{Device Suspend}{General Initialization And Device Operation / Device Suspend}
+
+The device MUST ignore SUSPEND if FEATURES_OK is not set or VIRTIO_F_SUSPEND is not negotiated.
+
+The device MUST ignore all access to its Configuration Space while
+suspended, except for \field{device status} if it is part of the Configuration Space.
+
+A device MUST NOT send any notifications, access any virtqueues, or modify
+any fields in its Configuration Space while suspended.
+
+When the driver sets SUSPEND, the device MUST either suspend itself or set DEVICE_NEEDS_RESET if failed to suspend.
+
+If SUSPEND is set in \field{device status}, when the driver clears SUSPEND,
+the device MUST either resume normal operation or set DEVICE_NEEDS_RESET.
+
+When the driver sets SUSPEND,
+the device SHOULD perform the following actions before presenting SUSPEND bit in the \field{device status}:
+
+\begin{itemize}
+\item Stop processing more buffers of any virtqueues
+\item Wait until all buffers that are being processed have been used.
+\item Send used buffer notifications to the driver.
+\end{itemize}
+
 \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
 
 Virtio can use various different buses, thus the standard is split
@@ -872,6 +919,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits} for
 	handling features reserved for future use.
 
+  \item[VIRTIO_F_SUSPEND(42)] This feature indicates that the driver can
+   trigger suspending the device via the SUSPEND flag
+   See \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}.
+
 \end{description}
 
 \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
-- 
2.45.2

