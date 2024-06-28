Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2079.outbound.protection.outlook.com [40.107.220.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D9A1527BA
	for <virtio-comment@lists.linux.dev>; Fri, 28 Jun 2024 09:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719566790; cv=fail; b=Lm4ejhPxtOrz1GzjeKviD9nSoSXSy3UB1kb3sf9Xjs2RBOHXc6xinzxQiHwfZyeyCPbqgwvJrFY6jt+GU3NAI64wDdwEu5TyRpOYcVtgAJBWiEct8JjkJzzkGxMuY5gXmJoVKRaR2CJ4UkvrhTFM3r72XNhz+RhNk2hzefmVkeI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719566790; c=relaxed/simple;
	bh=QA1h45SnlWcpMkvcrfgwxV/SqT0aH7YgJ/wqkWbla6g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kl3303ENBVNB/nhuJaS699gXKRWkVx1l79q5cVu2aw9+3r2TCMuzWxk3KF1od/yKuGqLzZWJZefRO4ekzsakpdalGxRuGeicplnOZNszIprP2L9/x9nJogt6DWzMxW/BYIG2KDYQGI8KVH3KOLvKX4WERlbXKXXaaJG6ay4A8jg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YVe/YvAs; arc=fail smtp.client-ip=40.107.220.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YVe/YvAs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CA2m1FmFa82xqIL9XKxPCkMoTkaBcFgA06ROByxyQeI0XA9zJO/wE5Wnu39KptpIpmzTu4TKkYDX5A2fUv/FxbxNKFCoc4AS6np/+0VlBorgcA8wodyvGNCJpToRGiQ1ee1KAwObyBaHzIvd+3rwSZ5HNgD4C7uKnbTS5tUu2YDbADk4pHUiNFrtpZ6Ugq6uHpsyVtFO1zROXlVNlUkI+JNEjlVf80qzoJxm56NEw8Dzb6TQKcLTenYaW4H/C561q8IpCJXwbpCjTr8FTrMfEj44m/vkyuAN6sHCFjxHSS/hRvN4cxt/BCRKw3NqU1iFU0VuN8IIEuI8n/egkIhixA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nwHqzmK9Q+iwjH4hIPdNOoSQQYfEC178wFQG/NGQdUc=;
 b=j52HT6orycACIrnzWKxPLutHss7fuzu+s9tLOoHZTvinJyGysMpVGCHX21Jb0x/qznT5f4rlaRj+QG+tF91EwiCzBWUzs10fZAiWDtSVXL+Cn01xTeCgCYo2HpUBducq61WJBQ3KwPOeXNstCpsMTcRBorF8Sd0Hh+4oDDMRGPriivEd5mp8ipJHuX5K+du0l4RlTInEZXJWbtrhhIzaqI+/BuXraZeZPuVYsNHMwrorfBEi6vqsxlNOrjqjbZqtV6ygZwJTMk2swgIJXy5aP8Gub5Spd787m/Edbvw2NZ51hQLfL3JMmQmEfZcbUToUq6n98nxpJ/gtA07TZY4Y/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nwHqzmK9Q+iwjH4hIPdNOoSQQYfEC178wFQG/NGQdUc=;
 b=YVe/YvAsSkIGNIPwZz07HWhtKyU1GkVJDCKPP7ASHmN67oxOEjsKV9H8Os6Nf4hZv5ds1oZ6/pGM3J7OGOHY5E1o6iORJXidNvrlP9/FQCMYDAb0TGX+WB+x8izpM9Ri2JJ6rbL0GkoFQdj2fzX1xLjMOVnlLwVu//sN4mZrfgs=
Received: from SA0PR11CA0017.namprd11.prod.outlook.com (2603:10b6:806:d3::22)
 by SA1PR12MB8946.namprd12.prod.outlook.com (2603:10b6:806:375::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Fri, 28 Jun
 2024 09:26:23 +0000
Received: from SA2PEPF00003AE7.namprd02.prod.outlook.com
 (2603:10b6:806:d3:cafe::cd) by SA0PR11CA0017.outlook.office365.com
 (2603:10b6:806:d3::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26 via Frontend
 Transport; Fri, 28 Jun 2024 09:26:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AE7.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Fri, 28 Jun 2024 09:26:23 +0000
Received: from fedora.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 28 Jun
 2024 04:26:19 -0500
From: Zhu Lingshan <lingshan.zhu@amd.com>
To: <mst@redhat.com>, <cohuck@redhat.com>, <jasowang@redhat.com>
CC: <virtio-comment@lists.linux.dev>, Zhu Lingshan <lingshan.zhu@amd.com>,
	"Zhu Lingshan" <lingshan.zhu@intel.com>, =?UTF-8?q?Eugenio=20P=C3=A9rez?=
	<eperezma@redhat.com>
Subject: [PATCH v6] virtio: introduce SUSPEND bit in device status
Date: Fri, 28 Jun 2024 17:26:00 +0800
Message-ID: <20240628092600.30365-1-lingshan.zhu@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE7:EE_|SA1PR12MB8946:EE_
X-MS-Office365-Filtering-Correlation-Id: a9886fc8-6bce-4782-c99e-08dc97546093
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NFlUN1ZWdGhRK0ZkNnkxa1ZaVklza2FTVlhDdEJGOFJEaFowdW9LQ3kycXVh?=
 =?utf-8?B?NW5lZHIvcGNXTklKblRkdEQ1Snk0TVBjdzFLN3dTUmdRTkNCRDltdnZWNytn?=
 =?utf-8?B?Y0RwY2d2VDhrNi9UdENVekUvc1hVZGRHaHFUaURBM0Q1SXZaT2pYVjVzdmE3?=
 =?utf-8?B?b3RwcXpHeWp1WWJmVUVGSVBDNEVSdEdpc21BemFicklDMjBaTVR6dzFOd0Jh?=
 =?utf-8?B?dlJxVmM3UTJYUFRndFlYeDN3dTMvZWg4aFhWVlFwdUdGZ3g4V3d6QTBUNmFG?=
 =?utf-8?B?UC91ZXo3L21XTkVPNEg3WkkwZC9KeWVJMW01MXM5Rkd2cWNuNEtnV29YM1Bl?=
 =?utf-8?B?SnZaazRqSjgvNnN3TjNGTWp2UU9PV3VpSWhYYkJhZk5iQnZNcUF1eklOaXFw?=
 =?utf-8?B?UmlmbDV5dG5KSjBtcFB4bnFiYkphcVVIUWtDanh4UG15Y1lUM3JCSGtMS1Fh?=
 =?utf-8?B?Yzd2NDA5a0QyaldGSmNXMFgwQjZtRU5PanhJME5lempnSUVMUS9HMzd1QWh2?=
 =?utf-8?B?dDRZbDlaWVhKalBsSUFRZFh1V1VxM3dUbTFheG5IRWsvQi9NcVQwTVZYaG9Y?=
 =?utf-8?B?aitZWDBra01oTGlLVXhBbGVaL3hpQXNZL1BQVmZheUpoVWlDN0lvV1pRWCt0?=
 =?utf-8?B?V1BTOTBSL0NqRFpHTDZlM2lmYVJ0TXljVUJ0TEFLbjVxbjJVS0lhaHBmS0Q0?=
 =?utf-8?B?VmJBOEVQdll6RkExMVBPeldiaDN4Z1JFVFYrQUV3U1lFOEkwKzhJd2x2R1M0?=
 =?utf-8?B?aUdQQ3R1U3JsM21keEhJWG9qWWx6Wjk0ZlJwV1BUUTZxUkxJRklQdXU2SUN0?=
 =?utf-8?B?dnZQM3QrakRpWVF1dU45NFNpWHcrOVoxQURpY05NeVJpaUJ0ZE5aN2NMaUdq?=
 =?utf-8?B?TitpeEhGbFVTTGlrc21ESDhNOG1MdVMwQVFST3RKaytKdjNwZTU2UFYxNUhM?=
 =?utf-8?B?ZFVmS1lqUVk0L0xJSDZFSDVUdFFzMUtRb20zWjNXdWtBTWtWSSswblVhamdx?=
 =?utf-8?B?TENHRUp5OUQ1aEFHVXlnUm5CNEs3RGRRSUQ4MWlQWGlvUU83RlhNVitwY1Jl?=
 =?utf-8?B?ZDVPZEgrOVVYSUpoTU5YYnZ6dUc5cG9pOVpRQW91bXQ3S2g1dzJDZFQ0MTFM?=
 =?utf-8?B?RlpDSGZtaEZTd3gzc1U4eFlLeno3dnR1Y1ZVb0t1YTFZYkluTjRGQWFMOC9o?=
 =?utf-8?B?Z3ZLeHI1Nko0Y0JBZGNydWhlOWNvcGZNaVpLeWl6SmhQekZSVWFYanNMSjFZ?=
 =?utf-8?B?Um5CelJ0NUl5WGFVQlVTTWRZMHcyU0FOR094V2Zxa29kZXAzS3doaXFuLyt2?=
 =?utf-8?B?a1R1KzdhRTgwRWtrWXFJc3EyNGkyVU1LYzBKVW5ydkNxUkZnR3NIV2R0d3Rr?=
 =?utf-8?B?Z1ZzWDRIVTJ1Rkc4VHlUazM2WC9zQmNVQjl1ZGRyOTBMcCtMTHNxcWEwSUtU?=
 =?utf-8?B?TXhlc0JIbStNcW5uMkJ6dXM1L0hQZlVmSHlWalU5eG9NZ1BQb1lKMklZV3pm?=
 =?utf-8?B?R1l1QU5DV1UwQ1MveXdCazBXUGRtZnNsQWxMZ2gxM0J5eE8xMUhOVUZBWTd3?=
 =?utf-8?B?ZVdOSGpDaGRrZGxBa1NsL2ZmMUlnSmNMNTVTelpqSWEzQUdOT2lidmFBU3No?=
 =?utf-8?B?SGtBcWZ2cUZhQnJoei9VVkhpMjdwNDl5UUVzL014Rnh0WWtGSjFNQk1hYnNa?=
 =?utf-8?B?SnRqdkNtUFRpUlJwSkR0NFI4aFpvVzJMZTQ1VkpIWXk2ZkVNdXpjWkUwK2la?=
 =?utf-8?B?TU0rUjFnQmhxZ3dZV2dNem1ZcElvd294QVY0VUJ6T0htdUxQeGJ2R2VJUGY5?=
 =?utf-8?B?Z3YybGd0b21sY3Uvb1hPcjZoa3F6Rm9rZFgrRlRnY2haVmQ3M2htYi9nSmYw?=
 =?utf-8?B?aWw1SmpmQTRUZG1icUdmYUR6TGpaUEpwODQvUCs5YmRLL25ZU21TNGx4dlVI?=
 =?utf-8?Q?s6Fksw9ZQtTzYKuHSzex8C1XbA6YZq+z?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 09:26:23.2331
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9886fc8-6bce-4782-c99e-08dc97546093
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8946

This commit allows the driver to suspend the device by
introducing a new status bit SUSPEND in device_status.

This commit also introduce a new feature bit VIRTIO_F_SUSPEND
which indicating whether the device support SUSPEND.

Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
---
 content.tex | 71 +++++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 61 insertions(+), 10 deletions(-)

Changes from V5:
- the device should present NEEDS_RESET if failed to suspend
- allow the driver access device status in the config space when
  suspended if it is implemented in config space.
- language improvements

Changes from V4:
- re-order the device status bits section
- kick vqs --> notify vqs

Changes from V3:
- allow the driver clearing the SUSPEND bit to resume the device.
- disallow access to config space while suspended.

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

