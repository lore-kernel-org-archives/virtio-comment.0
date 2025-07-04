Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2041.outbound.protection.outlook.com [40.107.223.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED68F283FE9
	for <virtio-comment@lists.linux.dev>; Fri,  4 Jul 2025 10:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751624302; cv=fail; b=uxV2K9dMqXLQVInaWO4AHDXmk+zKjcOay8/sz+L7Ny0GRXf6FwNt1/cho22Za4AvtxKuB99aI3g/AV5bRj27qudoI/IW0NRifljuP4JMDhc8Kp1jIFVGsiiujQaGE8GL4KEW4wUkBj16BJpp/2GsBKCghIfpPLjxHLiqyUbpSuA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751624302; c=relaxed/simple;
	bh=RX33ngIwPQj1Ja7hnwmoxdeV7+ue85edxo7mP4A+8F0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WbzYwssBgJD1wMqGesihurxit0qN6gEH3juDnZxfhMiapoeNvsxjtjtcMorfyge/E2qn+wKcDQ/H4nedzEuVtQIp36oUq7FQJ92FDWpOTnX2sZcgRIbrwVYv7w6Uqc+nO56HXybaRr3/H+LJpPFdhGQMwMsZffCvkOx7FJykq7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4Iugbr3A; arc=fail smtp.client-ip=40.107.223.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4Iugbr3A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RmSPjbtA2rQ+ZxfAoMTSgxcQ0/begGT/90eQjiJzsPAfuFTHwIguDFCk01H4E7/2oIIiEIi+d8PdM6eN4X3ngh0fnJN3GZxrzHXzeQEyLm9I7nggfkk7uHwl9Qr5YekEgoyN72G5YQjzcTMLXIVsAX10w5JG/1P89MF4yq1vG9RdYgCB/NoYSmOqO5v0oh/JIG8xBRZQwODc4R/BwCO3CsbDC89x8m2ewfMubBLbIoMKOSwoerUYiwBPfamkvmf0krWNCy41dCAZbCzCW/ntCGKQAWskT7rH0pBsa4NDpckQ+RlwO8jNW6urDzPASx5LfjBOeV4JFK9jtuCIffG9/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vGxydr37lBP54BMNAIS5MMxeuLSgRFaXOI4v/PRX3ag=;
 b=kgDHXTyNm8UI+Jr1c7DGUj6VtlmNvoChiNCPjg1FM0kiViAex2WS+ZHkI1SzTM7koLUlWu3Z1m+t+jiDrIsklfcBBZa++Y9eTKprHQ5qC4A+uWrHG+PLigNZnAJ6bbJap4EIKn6nqASYUDL20lZTCWVoL4RdU/PkAHWzYd9qSya7yqL384/iIgX/FEfez4pTJ96DAhVLOHA1g28ommlGXJGsK+NqrPhLu8uVz32m/PVGqpBXGMDYoJcZWHjX2yR7yRvGe2LSWr2mzuXjZjd0JtLsyWvselpMsrkJp8CK8H83S0WLZpUz4FH8uZTHgwloVTLSKjqhPdTWJgsSmDR6Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vGxydr37lBP54BMNAIS5MMxeuLSgRFaXOI4v/PRX3ag=;
 b=4Iugbr3AJ8QySI+XqOMmPHb2ENhiddDqGHUTgGxbupU8OUfC/mmD4fbJSDv+UXDMzfkwpjNFu3bi1x35kqRwJh04ZfYWPIU2QqGJCOlq2DgfxLP4NzJDCX/VwcFWU6GHu1bAOhryPbwYWuEFXrTMSgxb4YDdW2l5ZpfJK6tbYvo=
Received: from CH0PR03CA0101.namprd03.prod.outlook.com (2603:10b6:610:cd::16)
 by PH8PR12MB7256.namprd12.prod.outlook.com (2603:10b6:510:223::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Fri, 4 Jul
 2025 10:18:16 +0000
Received: from DS3PEPF000099D3.namprd04.prod.outlook.com
 (2603:10b6:610:cd:cafe::4f) by CH0PR03CA0101.outlook.office365.com
 (2603:10b6:610:cd::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.22 via Frontend Transport; Fri,
 4 Jul 2025 10:18:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D3.mail.protection.outlook.com (10.167.17.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Fri, 4 Jul 2025 10:18:15 +0000
Received: from fedora.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 05:18:13 -0500
From: Zhu Lingshan <lingshan.zhu@amd.com>
To: <mst@redhat.com>, <cohuck@redhat.com>, <jasowang@redhat.com>
CC: <virtio-comment@lists.linux.dev>, <Ray.Huang@amd.com>, Zhu Lingshan
	<lingshan.zhu@amd.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH v5 3/3] virtio: introduce SUSPEND and RESUME feature
Date: Fri, 4 Jul 2025 18:17:39 +0800
Message-ID: <20250704101739.354522-4-lingshan.zhu@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250704101739.354522-1-lingshan.zhu@amd.com>
References: <20250704101739.354522-1-lingshan.zhu@amd.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D3:EE_|PH8PR12MB7256:EE_
X-MS-Office365-Filtering-Correlation-Id: a55daa8a-46e2-49b9-ab10-08ddbae416ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uw1PqGKMxHl6LkoCTjVQmIWKhtsq50tjBctr/oV4IvZOo+o6kKaV9BzKVmFi?=
 =?us-ascii?Q?ArqGqomVtHZ/OfkSNNdyA6Q93PensHcqbMrn6z4QY431E3Efii4L3xJno9B0?=
 =?us-ascii?Q?EZ+/t/TZPWoP3Xoi5dyH+NcrmCT+OUlAYfCc+sbxx/hkX7xlSHkbxmDti0lh?=
 =?us-ascii?Q?xiZs43flY01b/f00sXc8eF0oDcn/PfqTnzVFfoO6EcIiL4smpFlsoV5r+C2j?=
 =?us-ascii?Q?9rvNtoyx3ueTACbF0pbdfiRPZfko+Fz63bnBpwKr4+LSoBH+UrP1KLidpDSi?=
 =?us-ascii?Q?5kq0PQDKRC5c+2Rl2k+njqm6b+KSj47CqxsJfgBPnAS8Sql6/6SsRARvq35A?=
 =?us-ascii?Q?4NqzuDz8gz+u5otPn5CI1kwDcxdqBDY2GrrzdPHE6AIW78MXtt7/sE+Fue7K?=
 =?us-ascii?Q?XMkXBUxaDzKeUCji859RSbKJETqVJh3y05NMBam1yCQfc2NmIkWXGppPE77k?=
 =?us-ascii?Q?YfRTzairGNjyxiFWvNdq5VZDMq5C8iUtOL+3adWT5xVOR7VLvcTXpWqs+JJj?=
 =?us-ascii?Q?xDw3+fin66sLvkyfjYecRaRk8iQgr3H5uDwhQsW3lwNDEhX332SIn3o9K7wH?=
 =?us-ascii?Q?p+FhHm6N8XmL0tf3BZ6DGmtDEYnOirfkc8IjYAu+/DKiYNzQv8SO0repIbX3?=
 =?us-ascii?Q?evr6UflIM0GikiSXFxosxfvtEyieuD/VJ57YEtxpvobzz/hhxfScp1WYepdF?=
 =?us-ascii?Q?51kcMuIJR4g6jw+wplDg4JFI9aR3yuaiYYX56k0VHEP7LEc4IYPmyYuGYl4s?=
 =?us-ascii?Q?PYVU0DwpECllmMYQ4GFjbEe6lTTUkbu9Zgecn0E+RCzCNQFUrAfb4bgJWFTD?=
 =?us-ascii?Q?3+Qn43vaTcYupPLDTtjtJ3QPbyfU0/A3K0xVhbZNNYG3t19vsKLuu7ondjPf?=
 =?us-ascii?Q?ZBnhUMgP+IZ9LZ2ciOeMpbT+VZBCXsCue4FBer+NkVx6qirLFPnDrfb5sxcU?=
 =?us-ascii?Q?CsLTsCD763zyUh5g9fDSGObnTMBGyPLgvKhdz1UkF8Oa80Y562npRbKZnH3y?=
 =?us-ascii?Q?Qdm91hD+T6/LIEf0JpGJv84EHy1Xjo7W3IHEgPJg0YM1LyOemc3d8dzH68jg?=
 =?us-ascii?Q?lm3Uwx9eUzo5AdcyVf9ReZEfg1tIVz6nlPL5TnWAssT6Xvvf708SHAhiTpA5?=
 =?us-ascii?Q?ife7MRh1Z3FnkA8EYyizlQ8BAtNMdihfy9gtOKK76YtBpDi3tpbKI5xoE9/m?=
 =?us-ascii?Q?PpIHB/igU2opQb3A9JoxgJGAdwUIqZkEE/NjHt4lRmYt3GoyaSM+eZVWpX2N?=
 =?us-ascii?Q?xjPUcWWFhWnLrKSlS43yN+oCggh05AKh6oVHQrMz6xcrtSaE1M1wdJDacKWj?=
 =?us-ascii?Q?kKx2LdLWIJeJc63AViJ/hfvI/qDsEAp6RD4sq9ATplshUIGwBtHjAxO3+6fx?=
 =?us-ascii?Q?YaauxLGuaKnHKRFOoGoWaOIgKb2Nn5pieB1pULMYnyta6MsVXmRQBPsDCvLj?=
 =?us-ascii?Q?K6/Lg55W5gR6ZXnUtR3RCTaofzubSQkc1nBPsrHFOlujNbGAd6tKMqBZIXcC?=
 =?us-ascii?Q?xaOMHUy8hkduMLepnEYs8xLFKiQAaBeBLduOc6MdeyHJGrTWPfz7WZTUMg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 10:18:15.5613
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a55daa8a-46e2-49b9-ab10-08ddbae416ec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7256

This commit allows the driver to suspend the
device through a new device status bit SUSPEND
and resume the device running by re-setting
DRIVER_OK bit in device status.

Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Parav Pandit <parav@nvidia.com>
Fixes: https://github.com/oasis-tcs/virtio-spec/issues/229
---
 content.tex | 63 +++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 61 insertions(+), 2 deletions(-)

diff --git a/content.tex b/content.tex
index 9213dc0..57782cc 100644
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
@@ -629,6 +632,58 @@ \section{Device Cleanup}\label{sec:General Initialization And Device Operation /
 
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
+When the device has been suspended, once the driver sets DRIVER_OK bit in \field{device status} to 1,
+the driver MUST wait for the SUSPEND bit in \field{device status} to turn 0 and the DRIVER_OK bit in \field{device_status} to turn 1
+before any normal operations."
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
@@ -872,6 +927,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
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

