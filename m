Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3E5652
	for <virtio-comment@lists.linux.dev>; Tue,  4 Jun 2024 09:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717491858; cv=fail; b=RFik2PD6QipwfZunBYRRbUhCdHjGVJooNsuGtJ339sf0w28KWlkotkpALJEE67Up3qG+lYDYQdV42iLbUIVW1D5rTOOF0xW1DKHkXLEzWcu/u5WYdZzTNFmX3rE0tOkeBhwbZVETq0P/EY1VLpOO4Ff5IxugnJvJ60TNS90pAYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717491858; c=relaxed/simple;
	bh=a/kUr34sDhT10pmndJALhiAQzjt4Bv+fNgQTtB3Wj/A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FPe8XEkMwQHvYKsTbNkS1ZVIyZoTod2+88VsKC4xhxMb7iQEuxJ/YtzifwWwjSE/Wc12iasgd9L6wE76kvDUbYZOGKKyeVaLtObW5OkDyJVl8+gqCt+L6jywKMTaq3FyTVkgY47oefctaR7vHNWO1KIoMeOYPj/5ZWJ+kkevRxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BkA65oHR; arc=fail smtp.client-ip=40.107.92.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BkA65oHR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l0LF3eI0MqwYu6ryS3y8CqZX8lPyYGWfzCls5Va2AThaEnAGUAcKBEpLk7d4V7C0+AMkbREa++k1PCqaf+dkQUYOgbBPap2QprKcREd6gMvateB5vZRUWBn/4JtGtmatyl0ojLXD0sBSLDEJcsGcDgewEUSzLozQDkQqE4/cYiS1gGVPK21YQR4De1WMKBFW162scqNRQHCHxkiPYKgNVUrKurOTnlk5YElC0orA2Z2zl3mvjAKhJYN/S/ZCnY6pDvmUZYkVfGlTEHVfLig1JTb6E2YSdy9MLQ8okyk2PscP1OCKPaxRNMeRVjaVP5MRA14PD1NmYkSnirm32F9fAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WtYzGwAFI0iL1MJk+vzW68MTPiiSNXi8y5BtMwOoUho=;
 b=RQtB0z3pT7uwM5iHgW3IkhGOM17RUjmQeJ+kgizwAbTuZgjqM8hXfwglQf1VEIBgVU/HPC9TeWMDQbKlDynnFMwKG8SUWc7Vw1al2XakH+kABD7MHjmfDxu3eCBY0/5pMhTYpu7L/AAf7up9M4HGRpgozVTf+zY7FXIVTS62AU9N3nWyni2GZ0KzZyM7y5tXQaoZSv4xP/BC+4iRm7aqn2Wk+G00gCrfPnusUkmJKJWTgF4uFBHLuyCXUlcjZhgh/Yi7UTAFpTqmCzHd+zVo2SwAEj1Lkfm0WXADClHBx4JpV/eHj2bzV//QI+at1S9k4146/3B2ThNvpilUDJvTSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtYzGwAFI0iL1MJk+vzW68MTPiiSNXi8y5BtMwOoUho=;
 b=BkA65oHR2XWuXJ7c+gtkd60m5S+YUR7VgYCxAqjpqfXwl95W84BKrLBdxhMc867XNWWlZjSlj/yXQXj9Xj3gMNtVHrcaUN+e36xwzCchZiUl2OOQ6IwgKjDSksOW3L3Kh222Ctb+7fsuG/wHeQvhPlM6ZO8gJzEo6VGyp6ECD3E=
Received: from DS7PR03CA0210.namprd03.prod.outlook.com (2603:10b6:5:3b6::35)
 by SJ2PR12MB8157.namprd12.prod.outlook.com (2603:10b6:a03:4fa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Tue, 4 Jun
 2024 09:04:13 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:5:3b6:cafe::4c) by DS7PR03CA0210.outlook.office365.com
 (2603:10b6:5:3b6::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.31 via Frontend
 Transport; Tue, 4 Jun 2024 09:04:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Tue, 4 Jun 2024 09:04:13 +0000
Received: from fedora.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 4 Jun
 2024 04:04:08 -0500
From: Zhu Lingshan <lingshan.zhu@amd.com>
To: <mst@redhat.com>, <cohuck@redhat.com>, <jasowang@redhat.com>
CC: <virtio-comment@lists.linux.dev>, Zhu Lingshan <lingshan.zhu@amd.com>,
	"Zhu Lingshan" <lingshan.zhu@intel.com>, =?UTF-8?q?Eugenio=20P=C3=A9rez?=
	<eperezma@redhat.com>
Subject: [V4] virtio: introduce SUSPEND bit in device status
Date: Tue, 4 Jun 2024 17:03:44 +0800
Message-ID: <20240604090344.225934-1-lingshan.zhu@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|SJ2PR12MB8157:EE_
X-MS-Office365-Filtering-Correlation-Id: b0673261-26ea-4c70-f93d-08dc84754ded
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|36860700004|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dHByeHcvbFNRUFpVMzJFR1I2Rmc2b05Xbm1Pd0NrOFBjaVpvWC9vMmIra3BC?=
 =?utf-8?B?RkI2Vm5USk5paFB1KzZWM0hYSFRUajAyelNNZnZuN1JIN1BuaXJjWDRPcXFt?=
 =?utf-8?B?TWk1VE5JUUJ2RTY5dUFxMzN2Y3FKNVdKazlVN0NRM0xBZ2hQR1hlcU8wSUpp?=
 =?utf-8?B?TEU2U0JnYkhMcy8vL25pSFVESVRleXIzdUdkbGc3dTZXL1BEWkUrM2R1TGhL?=
 =?utf-8?B?ZFRmNm1nU2czNFZwcHlSeGpBcnhCWTQ5NDVkRlNWTm15NmpCS0dMdFIrN1Bn?=
 =?utf-8?B?MWIzcUhRdlR5TkgyRndiSTFuRVBMcDBqNEVKc2F4NWRvNUpoczUxSVB6YUU3?=
 =?utf-8?B?Y0oxMFNLMVA4NGpVTlZpaWlYanhFazVjUGRvRUN2TTZHZUp6ZmhXZ2NNOXRD?=
 =?utf-8?B?RkNyR2s4amVlWFVsTEY2d1FtWmNTejFqUDNFVXNMekZmYkVkTDhHcUEwbXUr?=
 =?utf-8?B?bEpNNFBoSHdUbTZFbjc3TmQ5Y1NIbStLVHg0VXB6SzRQV3JGTkwyMS9GVmo2?=
 =?utf-8?B?SUVvOWRvQ2JVOEdUNkR0MEVpQ3FTeEw3Y1VnN3g2L1JrVXR3eVppYnREYity?=
 =?utf-8?B?U1N3bUVKVC9sRy8zZzVMZUFkdXpGdnF5aU9uZWEzLy95aU02dzVnVGpMTWRH?=
 =?utf-8?B?VFFZUjdxdHZEV1N0VHJXRXV3em50elQ5SFlQbVROQnNNbDc2K3hQNllVZmtZ?=
 =?utf-8?B?VnZ4eVcrNTFRNndjYkJKdWNCKzEreVFYcmNWcXhRRmFyek5OcjdydmFBRThK?=
 =?utf-8?B?ODRCelcvclhpeVFOcytUdTZXbmFlc0d0WHpOemg5TEM0eGprZXE5OUR1cmky?=
 =?utf-8?B?ZnBpSXhjRnlUcktBRzZValpFTThDVzFTaFpVWnltQUFlUktuSEhkM2dFUUZY?=
 =?utf-8?B?SWpNTityRG55Nzh6SzN1c0NUM1dISGZiVEpPQmZIOENnL1Z4cEUzZEFKUGEz?=
 =?utf-8?B?N0RVSE5UV2NRNUFsQm9aSXpKTkhGWXc5YnFZbDZkT0U2T2F0cTJOY0cwc3pU?=
 =?utf-8?B?UjhlMXdnYW43SktjZk55SXNta3M0aEUyb2JPeHJMVDA1ZWVXSFVYdGV6RzFn?=
 =?utf-8?B?elZOMWdSeGs2OS9pN1hqbUJNejlLUDNOTjlKR2htT0lNalVxREtXNEh2aXc0?=
 =?utf-8?B?MG5ZQWRSWm05cUNKUmhlODJOSDVjdVV5a2grMDdDRHdrYS83VVZrbkVYbDZ0?=
 =?utf-8?B?VUVoUEI4UGZVTytoeExkRjZ0Q2NlT01xRjMvcmdLeldqK0tGWGVSNW1hcWJE?=
 =?utf-8?B?UW40eXovSGdwWnJlY1pMMCthZjFpdnAwRHZjQzB6R0tHOStWd0pWa0hBUTR5?=
 =?utf-8?B?MUFERmcrYlkrWTdZTzE3Tm1sa2RnZ0hscDFKVVVoNlJyREdSTGQxTytqMEw3?=
 =?utf-8?B?MVVYaVJhRXJCRENhNEtwczVFaWo0Q1pZSERETUhxUGcrMjFoRzAzaXR2Lzd1?=
 =?utf-8?B?SlR4am1KQ2x3NEhVSHNtQUt2U2Voa3hWdG5FUFdaUDhjTXpiYlFDdk1DTXBX?=
 =?utf-8?B?QS94aStIcGUxVmNDSVJxU1RmRDV3VGl3b0kzNFZudFpqMUd2SVNwOTVzNzlN?=
 =?utf-8?B?WGlQOFowYWxRbDVYODMyVE1vUVNHRW1SRlRkVThkcGtUMGppWk5QajROaWhO?=
 =?utf-8?B?VFBOMDRmbHB5WnVicjNBdkpHdzdITmxUZWdHWEF4ejhWUnJEZnFtMFhZOTdL?=
 =?utf-8?B?MUdGT21zeVAxZzZTcFpKLzZ0d2Z6L3IvNnZ6NEtxVHRhRDZDZVFtdTJabXRt?=
 =?utf-8?B?amxTNTVqMUxmRzF0ZW9Ic25kd3IrYWRSRlFSblNtZ1VYbUhuSC9oMHhhMWN3?=
 =?utf-8?Q?GRSY5NZ8KXudB5lly+rjgP4Bge8U4wV0XON0Q=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(36860700004)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 09:04:13.2311
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0673261-26ea-4c70-f93d-08dc84754ded
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8157

This commit allows the driver to suspend the device by
introducing a new status bit SUSPEND in device_status.

This commit also introduce a new feature bit VIRTIO_F_SUSPEND
which indicating whether the device support SUSPEND.

This SUSPEND bit is transport-independent.

Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
---
 content.tex | 69 +++++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 59 insertions(+), 10 deletions(-)

diff --git a/content.tex b/content.tex
index 0a62dce..a47e077 100644
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
+\item The driver MUST NOT access any fields of any virtqueues or kick any virtqueues.
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

