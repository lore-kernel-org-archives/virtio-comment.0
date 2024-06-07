Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2057.outbound.protection.outlook.com [40.107.101.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C223156F38
	for <virtio-comment@lists.linux.dev>; Fri,  7 Jun 2024 07:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717746193; cv=fail; b=I/gUDxqlMNxUcVtMSYZZCv/PUUTwCzrsmENWhsjOQNnz91W9az3Z9hcSLfb65ep5gybAIkcc/K9/EbOKIzfihoTpamZ7A/6IU6r//cABcdv7i+1gLOXb3RaYHFhTq/jL1vBOadFXp1gcyKcAw92FPBN9kG0+KgIawkestCFV8g4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717746193; c=relaxed/simple;
	bh=3kM3aR8pf8ghsrIIlWEl1D3w5aY2xTGJraYBgh+nxbQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JzjjcWJzFX7ZlxDS3B6Gasnsc+t5UiomKP9KOzHOLfLkRGSjV+YxpB3IGuignRAwGnL8I4sIRjKYT6Lrksk/CiiESOdsit2BZxAklGYoDmpmk8jHMOPsLOt9eDO9ZCBvV1d/VmQmasAi2r7xl8IWUpooSL66M/HrCbXj4RqTfOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2F+I45td; arc=fail smtp.client-ip=40.107.101.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2F+I45td"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WZwpeRaPRz00FNlGdvIil0fs4EUXA1/5RU+UGNNNQwcmfWcThhLixwuSWvvhW9JvCTe/ijq/6IgrD8lMn8IHkQKN13s+zL9mj5BJFfvxDP5/nD/ZuecUk7NcO1juT/MUQRtcJzn6xrK8t3ldP8Yqg3p/oi3SzIr14NUXSFreY3BjW4FWSbM7tBuQTTI8SThDg5nvIDS84i96sgkHangOzroOxjY6LrywOG2DUBx9vjdkDrKdO34zliBsd6puFoMz9ELCngJQ0rXw2Xjh3up32a1ZQb7Ng1g97t0afvDaj5BXttFumd5rETnp13o0dcXJYk+rub6lrJqD1PDdi5Iqlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8l3tT6nGzrmZ/PZZdfYeARJqer0JiCCnzlnU9S0HzGA=;
 b=BMRyM/RzD0htRitlclUpSy8vm3oLfinSLzy5ogtq52ymOcuLDXQ/bhEJuBi8lq313h5/CgL2hL4bvYFJwtwKMjB3kgWk1Czyw1ed6x4JQf2W1asYv9yp31IrVuqO7phN/XYi8xbRl/+YkBSA/tmaNrb5Srz8JgKuJuSb7YpXM0+VDCMKzXFlKCEuDZLzLomHFUVPwiK7YNZsevrTQI5YmmGGZ/1S+Z1IsK2Xg9udTlLApvQZWXM/tQybv8p4IAEy6ceRUDiGRLX5bFcHfkEFu55kFy2W1yT2y9KKJ/bCmWQs8g+yRjvkWxq9QKQEkkVOViOrROVbGYbbjmDmD+Blwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8l3tT6nGzrmZ/PZZdfYeARJqer0JiCCnzlnU9S0HzGA=;
 b=2F+I45tdAjday6VkNbeSxIEoiTJu6xZ0MLhZXXdGHWQRgwl9LNlgipf1y0Z0ETWrPVxewFMymUAIbofm6ZRbpM04cXCUE5s5mxCQvqr8R6Ortr+d+FpOxWEmdeu66pGkx09Qhc+nDLaafW6rjfPT1L2ACMAGwEbnvj7MoCM52zg=
Received: from BN0PR02CA0051.namprd02.prod.outlook.com (2603:10b6:408:e5::26)
 by LV3PR12MB9166.namprd12.prod.outlook.com (2603:10b6:408:19c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Fri, 7 Jun
 2024 07:43:04 +0000
Received: from BL02EPF00021F6B.namprd02.prod.outlook.com
 (2603:10b6:408:e5:cafe::3c) by BN0PR02CA0051.outlook.office365.com
 (2603:10b6:408:e5::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.22 via Frontend
 Transport; Fri, 7 Jun 2024 07:43:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00021F6B.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Fri, 7 Jun 2024 07:43:04 +0000
Received: from fedora.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 7 Jun
 2024 02:43:01 -0500
From: Zhu Lingshan <lingshan.zhu@amd.com>
To: <mst@redhat.com>, <cohuck@redhat.com>, <jasowang@redhat.com>
CC: <virtio-comment@lists.linux.dev>, Zhu Lingshan <lingshan.zhu@amd.com>,
	"Zhu Lingshan" <lingshan.zhu@intel.com>, =?UTF-8?q?Eugenio=20P=C3=A9rez?=
	<eperezma@redhat.com>, David Stevens <stevensd@chromium.org>
Subject: [PATCH v5] virtio: introduce SUSPEND bit in device status
Date: Fri, 7 Jun 2024 15:42:46 +0800
Message-ID: <20240607074246.7647-1-lingshan.zhu@amd.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6B:EE_|LV3PR12MB9166:EE_
X-MS-Office365-Filtering-Correlation-Id: f5b7b266-3775-48dd-1e4f-08dc86c576fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|1800799015|376005|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bWhtSDRJNnZ6VEZqSHVYakV6SGgwTFNNQmh3aG16UnVCN3MwYWZXK2hNdlFr?=
 =?utf-8?B?cTVIakQ1RTFkTW9yc0ZMamhZb0pNcFRTVHFPMU1uYmdwd1h1ZXQ5ZHVYM2Zp?=
 =?utf-8?B?YU9PQkhpWWIyMjgrbjVvMVlQbVI3d1hJM2NrSnFaNFZkUFQ2WjkzakFxWEYr?=
 =?utf-8?B?TE1oQTFVazZneHo4a3NSeU96OVorRUFQNEVuOG9RK2tuWlZWanFVam8rUG13?=
 =?utf-8?B?U2twSkZMT21EaGcwK0lFbTJUTSs5QmhDRU5HdG4zVmRUZDVRSGlRK0ZBVi8x?=
 =?utf-8?B?U3hzODZFTjNha01ONlhIMlBiaHk3WGJCakNVdTRQVDUrUENCdHUvWnUyMXdx?=
 =?utf-8?B?WnROUCtuWGNIYy9FNjgrZUk5cFNGVnNwM0QrVWFhekdxaG5ta05UaXRWZ0t5?=
 =?utf-8?B?SElOMVNtSnFGVmpDR2pPRDN4ZloyODNwZ3JxNG8wU2hYakZzL1RwTGJ2M1Fs?=
 =?utf-8?B?ODRiZFYyNHN1cWU3b0U2NHdXRG5YWjdMVFNndVFWZnhaUjJMRXhlNGk4NU03?=
 =?utf-8?B?bDl3aU5Vd3IzVlorTnUwRGtZSlJ0bGcwOG8xVmZZZUF2ckVNUEJ0d240RVhF?=
 =?utf-8?B?NHZzLzVJdVB4NlcxZE51amZTVFVyYkZHb0lOVXhTNTI5dlh1clpyR1FGUyt5?=
 =?utf-8?B?aXhHTTIrVkQ0UEFOY0g1ZVNrK2RtNVBqUlZXc0lpQml3OXdocFk2QVUvb2Jq?=
 =?utf-8?B?UDl0UnN2T1Vzc28yY2Z3MGRFRW9ySDVMbVpib1dyQ2lEQ25VMTUvR1QyTE9r?=
 =?utf-8?B?a0Znejl1SmZtd2dTWlp3ZG53ZFQwa0lXWFpxdzFtNHZCSXhBZ1o0aC9lMEN4?=
 =?utf-8?B?b05UR3FJTnBBbUk3b3hlMERYTlRoVE9GVHM3bHplUjVwM2RybmR3cjZyeWIw?=
 =?utf-8?B?dUJMcFRxT09sR1N5RGtMSklyT0Rsc21VT2FPRzgzSnh0Ly91SmMvWGEyaS84?=
 =?utf-8?B?T3JEUllWeis2WTBHQXBSei95SXBQSTVtNjhQV3IwRkg4ZUx0a01hZUJ1UjRy?=
 =?utf-8?B?RGhnNHRZcHg2OHFEQjY3bGM4VmpTVDFiTTBYUDBsMGpiTUxmRFlwOUVBamJ6?=
 =?utf-8?B?bFJ3VUVlWGUyclh4WEJWSnpsKzBzaldFdFVJK0tnN2c5RjIzd29Ebjc1SzlU?=
 =?utf-8?B?b09CUnhTMnRvSGlYbW1hamNhN1pCek92V0NjN0g5aGZ3VmRXbXVlY3B2UkM2?=
 =?utf-8?B?ckhHRHVxOTcvNkFNV3NScTZsd0pBNkY2ZnE4eis0TVViWjR4azZ0cFB2ejN2?=
 =?utf-8?B?MDJja2FlVGtTamE5SnhnYXBhY3RYMUN1Z1F1bDM0L1FmRW5OMWpRZ0FjQlRL?=
 =?utf-8?B?TmEwWDFod0Z3YTBjT0ozTk1SWVpBNDlaait1Y09SbVVuOWh2TndzRjFoeTZl?=
 =?utf-8?B?TjkzWDNKZDNvUER6UW10UDhFZC85K3dBUW90YTlUT2xONHhNVnlFa21BLzRV?=
 =?utf-8?B?TVFWMXA0NHhQSkUySXFKZjJXaVdqTTVQcHRLeXhRSXV2TFNPSlVBV0NQNkti?=
 =?utf-8?B?YUcrTU1tMndsVi9UYktaUGswN0o0VUxIRWFkUXZCcmIvTnd3V0NIc0FvaUcw?=
 =?utf-8?B?UDVLZjBUV3BqdVZBbUJVeTZwNHUwOGFEcnBMSTBMd0N3TzNWUDYxS095Ukln?=
 =?utf-8?B?RURyQzlGNk5ZL0xkcHpHd21NWGhBeHRuWHRYV1duVjc5SEdCdm5Yc2UvWmJO?=
 =?utf-8?B?U29MT2RwNXB6b1hTMjJyOGNjZVhxSWdzU1lsRzdZRnlQWS9TaGZ1TFJZdWNG?=
 =?utf-8?B?WUtzZzJ0WE5nSnJKaVFTZElSZFg5WVltams2MTJEcVd6cUNha1o5bTZKUDgw?=
 =?utf-8?B?VE9KZ2kyTlBoNStGT1FJV3B5cG1TRUlzZHQzUHc4MXZuNUYva1NLYTlOeWVY?=
 =?utf-8?B?dUMrN1orM2tiUy9SbzNPNk9qSWdZTzhuRlozYlVlUi9IYmc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(376005)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 07:43:04.2031
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5b7b266-3775-48dd-1e4f-08dc86c576fe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9166

This commit allows the driver to suspend the device by
introducing a new status bit SUSPEND in device_status.

This commit also introduce a new feature bit VIRTIO_F_SUSPEND
which indicating whether the device support SUSPEND.

Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Signed-off-by: David Stevens <stevensd@chromium.org>
---
 content.tex | 69 +++++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 59 insertions(+), 10 deletions(-)

diff --git a/content.tex b/content.tex
index 0a62dce..350b815 100644
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
@@ -629,6 +633,47 @@ \section{Device Cleanup}\label{sec:General Initialization And Device Operation /
 
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
+If not, the device does not support the SUSPEND feature.
+\item The driver MUST NOT make any more buffers available to the device.
+\item The driver MUST NOT access any fields of any virtqueues or notify any virtqueues.
+\item The driver MUST NOT access Device Configuration Space.
+\end{itemize}
+
+\devicenormative{\subsection}{Device Suspend}{General Initialization And Device Operation / Device Suspend}
+
+The device MUST ignore SUSPEND if FEATURES_OK is not set or VIRTIO_F_SUSPEND is not negotiated.
+
+The device MUST ignore all access to its Configuration Space while
+suspended, except for \field{device status}.
+
+A device MUST NOT send any notifications, access any virtqueues, or modify
+any fields in its configuration space while suspended.
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
@@ -872,6 +917,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits} for
 	handling features reserved for future use.
 
+  \item[VIRTIO_F_SUSPEND(42)] This feature indicates that the driver can
+   set SUSPEND to the device.
+   See \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}.
+
 \end{description}
 
 \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
-- 
2.45.1

