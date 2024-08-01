Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2072.outbound.protection.outlook.com [40.107.244.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7985218DF6B
	for <virtio-comment@lists.linux.dev>; Thu,  1 Aug 2024 11:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722512144; cv=fail; b=CevVvgI1k0HZH5rSZ/l+rcrGDgvJfcK8m53yatMowmzEPzag+OzcQVetGK6hDn+1DPqn2ddtrhmEW4paAAUl+4aFpAYeKLLkPoh54Tcg9BvDXbpX1TssuapkUAhL5e6HD8jgXJH2lxSm/fG5fy0fJW15kXOCRFtmCteK0546dY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722512144; c=relaxed/simple;
	bh=2FpvxL47v34z6VW4dTyTHGpMIT/4GJKGnqIuosBB9j8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oBe6OPlQTUd3UJgJ1AcSPJrosbMBdyMUqezaMhGNyOuhIhnLcpvgSuXV9NUW+1SEaiUrdQZ1hRW+Ba/TuAG8BOlgjqeVO3cFeNoRQY8SZtsaqF6/UPglA/lgwTXpGDfW6GPjVuJF6QCjA4+L/QLrwUowJ+aGH49KJcuOMArBKro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oREdmpuE; arc=fail smtp.client-ip=40.107.244.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oREdmpuE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L3ftq2UKXd1W8xB/aNajqPgSWC2IJMFP+FnkC5SZ6sexrWIRBlHFcFZBxr1JEg3cMM613I9oDE4RTukfay5G/VP04vYCQWoloS/IZreOpwio9IKzN+7I/wEyyH14rm1ed1zrCT79Sx0R1dF/2WvkdMNCSRnFFkOhROFcRZN0H5/C8TovLfHREC6Rg9mlwONPjuPJeBr8tuvckjwh+WVM1Ai+sK8xHAzoviZeW6DUE43eSvNlJB2ON7rxZJTYeTKS59axPElIIUoHVR9kvKkq6PbmqHrndXAPrSMkyH735GrtH5qtV3hQlltgBb944f/QZ/XDiM5/E0Jl3V6nQsJjlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CLV0uOZB+cVXMpmB6qwk2DcY99MAQV/YZ+2y22Mou8=;
 b=sXbE1Du03CjP84og5MNV7N82k8yCqkiPYzOP8mch7lPD8/HxZmY3kb8nyHE7bH+KYTTTmv54e2btCna0iczux0kfZhCfv/Kn7yCxzFyA1Fu7l+hsbRu8225/kdkse4tHsHlNJ671vIXGpYsfVXWy8ig0Ul2Z+0MTyzYA8jatWtFmuaENP+ySpGsZD/9qND1j5jEZjyGiT3O17HieeYW+Zh6HWVjCERQmCsaNrYN5FMfZ6QdfG9KULtIWPeh/oQbqRqLy0JD4olwtin7sFExLb8Ct5cHpzx/Pp44742+umkFVXV94ViCqKgEuci86iijHFDPofDVi/IRbB/3CKQXYzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7CLV0uOZB+cVXMpmB6qwk2DcY99MAQV/YZ+2y22Mou8=;
 b=oREdmpuEYH4mPgHjBmRzzhJMlyjk1hAciYtUvenmETH5NDhuIryFm9/gPnx1Mzn+V6N1zm3+kg+Mdx27KxEflyB0vLbdzOog1ps4LiEyY8fMV21vnRCs6WDa3dWosyZZhg+cKoXMSBrDyTFBVD81YtgZs61eQje28Uf56Z244aQ=
Received: from BY3PR03CA0024.namprd03.prod.outlook.com (2603:10b6:a03:39a::29)
 by PH8PR12MB7206.namprd12.prod.outlook.com (2603:10b6:510:226::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.31; Thu, 1 Aug
 2024 11:35:37 +0000
Received: from SJ5PEPF00000204.namprd05.prod.outlook.com
 (2603:10b6:a03:39a:cafe::11) by BY3PR03CA0024.outlook.office365.com
 (2603:10b6:a03:39a::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.35 via Frontend
 Transport; Thu, 1 Aug 2024 11:35:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000204.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 11:35:36 +0000
Received: from fedora.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 06:35:33 -0500
From: Zhu Lingshan <lingshan.zhu@amd.com>
To: <mst@redhat.com>, <cohuck@redhat.com>, <jasowang@redhat.com>
CC: <virtio-comment@lists.linux.dev>, Zhu Lingshan <lingshan.zhu@amd.com>,
	"Zhu Lingshan" <lingshan.zhu@intel.com>, =?UTF-8?q?Eugenio=20P=C3=A9rez?=
	<eperezma@redhat.com>, David Stevens <stevensd@chromium.org>
Subject: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Date: Thu, 1 Aug 2024 19:35:16 +0800
Message-ID: <20240801113516.22155-1-lingshan.zhu@amd.com>
X-Mailer: git-send-email 2.45.2
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000204:EE_|PH8PR12MB7206:EE_
X-MS-Office365-Filtering-Correlation-Id: 455d5202-5da7-42d3-2ad1-08dcb21e100e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cnlNNzRaQkdzUDcxV0tGd3g1R3U1bWxLdVp5eVY3ckd1bjk3eThic0FUeFBQ?=
 =?utf-8?B?dVMzRVNWSkVvdjVqNzVKNm1LdWpFTk5SMzFoRHVPVmFnWDBuTUpVTGxUQ2xQ?=
 =?utf-8?B?d3Zya2h0dUkvSTBVUmdEakJNYkR1OG1oTlRCSll6MTZ6WSt6blNPN0JYbk8x?=
 =?utf-8?B?K0hobGxIM1NGTXRpRlhyeVpaNmxBUkFnb2g4ckZVVG5mbGNudW9kZzgvNkpu?=
 =?utf-8?B?MndUYzRmblpYUVBhYk1oRDRaczNwY1VaeUlDOW1wdDJIR0o3YnZ5UHpSdmU2?=
 =?utf-8?B?VGRrZ3kxMERSajVJN3EwcldFNXFMNHVHV1pJR1l0dGNCMHBDNXFEMGxwYkYz?=
 =?utf-8?B?eWtBcTBNa1E4U2RLaWZRa3c2K0w5Z0R4amVVMWxtL0p2Vy9pOHNtaUYrREx3?=
 =?utf-8?B?NGpnT2hXaWRuUEpaT3dQaGN3YWxiRGF5aTl2YklHcW1sV1AyU1U2dzhkRkJ4?=
 =?utf-8?B?cExqNjFXU29aRG13SVNWeHF0c0lQbHZpVXZ5MkFBNHdKa0NYL2hOeitBd3gr?=
 =?utf-8?B?YlRaVnJPOXdxbVkzei83MExXTlRHQUVRMTVOWGpVZUlLNWtlWUJ6WWNySzdU?=
 =?utf-8?B?M2NnOTRSNDVvamxpZ3lveFJxT1ZYQUtqTWxGRkQvN2l1QkJLbnpVbGRpemxi?=
 =?utf-8?B?ZE5jZHdCZStZcGg4cWxkSzVxWk4rSEwxRlBRNkxsRm9ZTkJNek9ZVk5teDdz?=
 =?utf-8?B?bGlraGpZWWUwMXBPNk93T0dlNXp4SWFoM3lIT0xYSjZKMFpmM3ZhUE9HMzhp?=
 =?utf-8?B?L0NZU3pyYWM3SnlRbUNJNzF4amZwdFNlcjhIaFNDeDl3RnpDRjNRUWJHTFVZ?=
 =?utf-8?B?WVRiRThBZXVBei8vakNmZXIyMFBZblY5WngrMVI2T0hzc1hsZ2JBbkV0UjZS?=
 =?utf-8?B?STY0MGlHUGVzdC9CWkdBWEVCNnhDN2JyZUFLOFU0OUlCNjRKMmp1U2RKQURO?=
 =?utf-8?B?VlYrUHJVK2MvRENMbmNVSWhZZUdiK29lelNhd3ZMaGJzWFBTTVFUYmJiV1BD?=
 =?utf-8?B?ZXVUQXRFekpsa1RCQmdLcjJ6RGNvSnVRZEhJaTJtUlRlOW1yaFhvRitNOGcr?=
 =?utf-8?B?YkZHcW8zU0FUZktCSGVDc3Nubi9hbTY2djhuWUl5eUZ6eWVvbzlhUjZSVlhS?=
 =?utf-8?B?akhKZWFsRy81VkM0bUs4UzYrNGVMeFRvMDgzMGJLNm5VVEZMUVJCWmU1aE1m?=
 =?utf-8?B?QlNNajV6dkdmNHdoRzZ0ekdVbXBtdHBjWkFLWFc4azdnVHZLUzVqL0R2SEFC?=
 =?utf-8?B?dGlNYXZRTTRzaHRnL0FESkhGNVRBRkRJdjU2a01Jbis3SGVwd3JJRWVCUGN1?=
 =?utf-8?B?Vnc1MG00bnlTTEluZ2JpeVZLbVRIeE9CRzIzd2hCdEdIY2NyL0FxZVVGUHU1?=
 =?utf-8?B?R1EwZ1NOLy93R3pISTdodmZibzRQMEhsdTlzZWNmL3NocWVqZndHaVNGRG5v?=
 =?utf-8?B?aEplQmMvTUVGTnVjUjVzZmh4ay9OcTV4QXc4TjVqVmp0dlpsRUdZNzBDWCtC?=
 =?utf-8?B?RmdKR1FxYWhMVzdVSUp4aTdhVnRMYXdZemFhR09NUkhRUG85RlIyNUljMmJ2?=
 =?utf-8?B?T2NWMGFRdWtUWDByNitjL2F0eERTZGlXRmJ4enVoZzRBclRDLzJMSDdlbHBO?=
 =?utf-8?B?Ni93UzNFa2hlbVdsYWFlcnQxY3RTY1JncFFjdHQ1ZWk2SU1GSWgwMGJldzB0?=
 =?utf-8?B?WEpSYXhKYkw3Z0F2d1FyeVhCaXkvTlBmK2RhbTFZbjRZdnovYzdKZm5HRmtY?=
 =?utf-8?B?aU1DWUZ3UkNLY3QzU0lSZ1VUWlZPNDZHZmJRemJyY3dXbFNBalhHdElOKzhT?=
 =?utf-8?B?a1FFTEdLS3ZUUURhR3ZPR1dvckFwSG55YmwyckQ1QWNXaGxCMDVjSlJOM3Rx?=
 =?utf-8?B?eHRBcTZxR2JQTTQrYkxWbGxXTGdDUWFuQ0xFM2JvV0RvekRscjBjblVnUXEx?=
 =?utf-8?Q?MGOvRFIUj//BYEujJVkVavRK2BLyRAGe?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 11:35:36.6488
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 455d5202-5da7-42d3-2ad1-08dcb21e100e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000204.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7206

This commit allows the driver to suspend the device by
introducing a new status bit SUSPEND in device_status.

This commit also introduce a new feature bit VIRTIO_F_SUSPEND
which indicating whether the device support SUSPEND.

Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
Signed-off-by: David Stevens <stevensd@chromium.org>
---
 content.tex | 75 ++++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 65 insertions(+), 10 deletions(-)

Changes from V6:
- the device should hold its config interrupt while SUSPEND,
 and send config interrupt when the SUSPEND bit is cleared.
- while SUSPEND, the driver MUST NOT access Device Configuration Space
- minor changes.

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
index 0a62dce..2d1bee8 100644
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
@@ -629,6 +633,53 @@ \section{Device Cleanup}\label{sec:General Initialization And Device Operation /
 
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
+\item The driver MUST NOT access any virtqueues or send notifications for any virtqueues.
+\item The driver MUST NOT access Device Configuration Space.
+\end{itemize}
+
+\devicenormative{\subsection}{Device Suspend}{General Initialization And Device Operation / Device Suspend}
+
+The device MUST ignore SUSPEND if FEATURES_OK is not set or VIRTIO_F_SUSPEND is not negotiated.
+
+The device MUST ignore all access to its Configuration Space while
+suspended, except for \field{device status} if it is part of the Configuration Space.
+
+A device MUST NOT send any notifications for any virtqeuues,
+access any virtqueues, or modify any fields in
+its Configuration Space while suspended.
+
+If changes occur in the Configuration Space while the SUSPEND bit is set,
+the device MUST NOT send any configuration change notifications.
+Instead, the device MUST send the notification after the SUSPEND bit has been cleared.
+
+When the driver sets SUSPEND, the device MUST either suspend itself or set DEVICE_NEEDS_RESET if failed to suspend.
+
+If SUSPEND is set in \field{device status}, when the driver clears SUSPEND,
+the device MUST either resume normal operation or set DEVICE_NEEDS_RESET.
+
+When the driver sets SUSPEND,
+the device SHOULD perform the following actions before presenting that the SUSPEND bit is set to 1 in the \field{device status}:
+
+\begin{itemize}
+\item Stop processing more buffers of any virtqueues
+\item Wait until all buffers that are being processed have been used.
+\item Send used buffer notifications to the driver.
+\end{itemize}
+
 \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
 
 Virtio can use various different buses, thus the standard is split
@@ -872,6 +923,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
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

