Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2054.outbound.protection.outlook.com [40.107.243.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFA722DC3C
	for <virtio-comment@lists.linux.dev>; Tue, 14 Jan 2025 10:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736849993; cv=fail; b=uP1eoBV+uuDoeQ2QKR/CdBuRw4R8q68LYytkvsSlH0hxIRGMd9fpgLL4OCz78pasnMlscJQXrUJ4/5RYMfBsitB38mHNV3+Z9MpWV76TExYFA0oIS3hQXCnGX8lf3byEvq+26EAZ20QBfkfA8ArXBT+2Lr068GdE0n/7FfmhhNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736849993; c=relaxed/simple;
	bh=yA+yGHdUwKzlYGO4mFy2SL/VE+B/KWebExtZbBmbUIE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ayi0wiPmhAlU+VquXvCKyKaczy6l3Ayxrio6l86gsCVdKjYMRchjtcrQ0CTms4ngoWSPksH30JNzalC2UL2VBCoJItpjE6qvZsLrmoRF4hcqZbQ+XLuNNoHJBYu8cltHzG4bR6TP7ropExufXGaMaKsCp2Xfv/JIctAv3nUNqew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GSa5ZeZE; arc=fail smtp.client-ip=40.107.243.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GSa5ZeZE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qsBMqBN1fbXgRFOrClTA39taA63wUf3mhxw4ITu8fylu2he9neTdHvUKThPIqWQTa+ddZ1RLKqj78ZzII1OEcGk8v5uoCZWSIV8V2cl6sDENDefwSZneCBV0P0H36RkdTqD/LhbyR5V2SS9er0bfeneY4sxOlcuoqu+4wOzWvJWoobiIH7KlpWc83Vr7ErISdcX+DUMJc746PA3/+c9zk1BKkTccDXl5CPAt4RzB44k+GBEXNs73CZM+sBnT1i7t1e7OnMlLULWso2iVsh9war2HmCaUJijVgkyfacavLF2GEu/Jla2q6Oj6JdCDlnjIqyqJSze4el/LbVs1UFlFxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D+d5BPt0dbPXp97j3CGvEZ4baMrQu4TupFly6bQbZlg=;
 b=iPoFmQP985y/20B5CU+ks65carxjyy1q35kFUzU5FNy8hZmzkKyQ0nRTdQKzs+we86LPD4Hg1Tqo/N2C+64sjdgt94e+pgM2dKuiphVBf4DMvRSbmY6GGdKxtrbW8Ouqrp5zOk9RDTwsMh4kiC0Z1v+TGE70TUZAwgewBbUK76Va7xBuDYjGDbJCiBie6gPL1M7gnAPa6qerFUF8cEimVUMrk8UiyuokTzqa0ChTsNp617GyVC208M4uEUXi1jd+zZ1YdHPW0ycGWitAQGRzckB54IYV7D+1b12cf/64wQR0q63NPkhSXRtXb/4/z+Pgujdz0KYFhbkjnNkJIBWfRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D+d5BPt0dbPXp97j3CGvEZ4baMrQu4TupFly6bQbZlg=;
 b=GSa5ZeZEeA59TOEXYk8xpU95fdsetdUEKfS7X+YLUI+jR3HPpciAXcbVIye30w0ODMZXPWOtGwv2cpK8YgLm4ZICD6RKNHO5Vo27GyWX55ficrLI5lQmaq/W/gdyDKI6kySNN5sTA0MswTYwl4Lp8rCWg+7fQ/Q7F32ZQ8sYtb0=
Received: from BN9PR03CA0861.namprd03.prod.outlook.com (2603:10b6:408:13d::26)
 by CYXPR12MB9425.namprd12.prod.outlook.com (2603:10b6:930:dc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 10:19:47 +0000
Received: from BL6PEPF00022570.namprd02.prod.outlook.com
 (2603:10b6:408:13d:cafe::f) by BN9PR03CA0861.outlook.office365.com
 (2603:10b6:408:13d::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.17 via Frontend Transport; Tue,
 14 Jan 2025 10:19:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00022570.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8356.11 via Frontend Transport; Tue, 14 Jan 2025 10:19:46 +0000
Received: from jenkins-julia.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 14 Jan
 2025 04:19:44 -0600
From: Julia Zhang <julia.zhang@amd.com>
To: <virtio-comment@lists.linux.dev>
CC: "Michael S . Tsirkin" <mst@redhat.com>, Chen Jiqian <Jiqian.Chen@amd.com>,
	Zhu Lingshan <lingshan.zhu@amd.com>, Huang Rui <ray.huang@amd.com>, "Julia
 Zhang" <julia.zhang@amd.com>
Subject: [PATCH] virtio-gpu: get p2pdma distance
Date: Tue, 14 Jan 2025 18:16:13 +0800
Message-ID: <20250114101612.88304-1-julia.zhang@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022570:EE_|CYXPR12MB9425:EE_
X-MS-Office365-Filtering-Correlation-Id: 0521bc0f-8daa-4017-b224-08dd3484f8c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bmniTepGhPZSa/YaRLRqsppgrctTAIW6ytfzGKEsfKgU7jNLe3rc8hBvrgKC?=
 =?us-ascii?Q?Xug8PlnlxS4BtcMqGrErwgw7FA63i9NHaSIMVM5H9eI8FjFuwQKeOGlNQFZO?=
 =?us-ascii?Q?NLojNbR06uH1w78auu9Y5iJOB6WSGX5uZ6ZGmlqbgwi9zBwt23aCeONvrtRf?=
 =?us-ascii?Q?ersfaqR1+q+PfU8apLwje6gj3O3KG4SDyi9NhdikUMM1XN9SVSsEvae/mjI1?=
 =?us-ascii?Q?RQC+a6HdqG7iqFDrm5gCmZz/e0VmRoE2KYPcWjgA421qBYALqd0ZtsoYh3QC?=
 =?us-ascii?Q?RsaCcu7fpZk/Kl2UY6Uxqt87q+3DVFBN5zvjXNLDMf+w57snQ5PdUkkDE9H4?=
 =?us-ascii?Q?VLL3nS/DaLP1SMVdkeDoRuCWHR1uKSy3r8K6M3/Qy9A1M88198+q5kI1DVnh?=
 =?us-ascii?Q?w11ZKTxlEkZeWsDvp/hWwVDFow4xMfsjpnrDZsdIGxtxb/C8UAfDiWNy+D4j?=
 =?us-ascii?Q?RVNywopB7lYhXNe4ErJ1BGVv61cXk9F+exIHtpaQ1boRx+WhXpnmQC1dNPV9?=
 =?us-ascii?Q?pbdfbTTOrGQBjm99kO7TVy17agAlEKEUG3kQ7seC+nMnQ1qXDc/iI+yg6HHF?=
 =?us-ascii?Q?oRYrr7gbQC5xhOJPYP6RwsWctr/POM0FAlIupWcUrxooKKupEEKPP7GqqEbd?=
 =?us-ascii?Q?aclaWTotpCCdIw38bafJzUGSdzOY1sqxh+YfwTSv14dVpgyjiMmfyG/lBOk6?=
 =?us-ascii?Q?T8yzEQgHcSyjJUChfhuQcdj6Jr3NxO1rhtIfuR9okRECi++QPXQArn04rGBm?=
 =?us-ascii?Q?o0/3+smaH+8Gu0lsLyU32XP1/jkbzkodFeq2PIgg8rS218N5+kNxtaFVakEC?=
 =?us-ascii?Q?92n3JXjT3uevo9Y/xrLMvhJ/gYmtis40NgRYaxbfgFCX79WhprwGYWdXbyp8?=
 =?us-ascii?Q?ewtFou8BCXsFqM1KjLaFceNVL2XHR3E+u6x+Wi0OfAoa2dj1PWnjz1mHhfi4?=
 =?us-ascii?Q?EYk3+vGSaLdsoCUoVxa/4/tKHC/+IAivkVK6+NkRf069vd49nC8Bf3cqNEor?=
 =?us-ascii?Q?wj3xQmxl+JaLGSfrpmzH6L+IKpBOas6mBC6tyWwmN0MRxHA3uzVFae3WqBYr?=
 =?us-ascii?Q?bGCRxJcxKt1qNQtHTEIDlurUQkm4osvbhJjMVFJuHQrZLvQnkWk8TgztjVhJ?=
 =?us-ascii?Q?t5KFV/6G1648TsLYm8zBsN/7wCv54eLJrwS1XT+jJugOw06nduh5Ust+z/Is?=
 =?us-ascii?Q?qINfv/JX33iN9jMgsH75xYF/UsaMWspHL738GR+8+rQWMEWDAJViAxYLss2Z?=
 =?us-ascii?Q?h2TafEQdEoKJvvAqrI+IjJTWZC7c3ep3gsV/pLgZtoLnzD8R9HWG9CcAbRqU?=
 =?us-ascii?Q?i/FeguJP5nR88+6ffTpmy4FL3ff/jqEUz54AW7d6H0DiLKcso4snW3lsm7J/?=
 =?us-ascii?Q?4leJ889zgPMhEA4xKGClLhv4PQQeVBPHEdp1vTYGFnEn8AkS6KwsqQ8e4dvw?=
 =?us-ascii?Q?uwxh7Wyld/jgm5eUxJGX4evaMh1HTLOkHPKquIp+DTsktCj/6f4exJtKeZJb?=
 =?us-ascii?Q?WvGSnUUR5CeQoYc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 10:19:46.9468
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0521bc0f-8daa-4017-b224-08dd3484f8c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022570.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9425

PCI peer-to-peer DMA transaction may be used in guest for some scenes.
For example, dGPU prime feature will let virtio-iGPU access to
passthrough dGPU buffer.

To support P2P DMA transaction in guest, virtio-gpu needs to check the
compatibility which is represented by p2pdma_distance. This defines a
command VIRTIO_GPU_CMD_P2PDMA_DISTANCE to allow guest send virtual pci
notation of two devices to host and get host physical p2pdma_distance
of these two PCI devices.

Signed-off-by: Julia Zhang <julia.zhang@amd.com>
---
Hi all,

We are trying to implement dGPU prime feature in guest which will let
virtio-iGPU read rendered data of passthrough dGPU. Before that,
virtio gpu driver needs to get p2pdma_distance to check if P2P DMA
transaction is possible or not.

To implement getting p2pdma_distance, QEMU needs to handle the command
from guest with virtual pci notations of two PCI devices and send it to
host kernel and return host physical distance back to guest.

So this defines the new command follow the suggestion in
https://lore.kernel.org/all/20241207105537.542441-4-julia.zhang@amd.com/

Regards,
Julia
---
 device-types/gpu/description.tex | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/device-types/gpu/description.tex b/device-types/gpu/description.tex
index 4435248..9d0f30b 100644
--- a/device-types/gpu/description.tex
+++ b/device-types/gpu/description.tex
@@ -223,6 +223,7 @@ \subsubsection{Device Operation: Request header}\label{sec:Device Types / GPU De
         VIRTIO_GPU_CMD_SUBMIT_3D,
         VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB,
         VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB,
+        VIRTIO_GPU_CMD_P2PDMA_DISTANCE,
 
         /* cursor commands */
         VIRTIO_GPU_CMD_UPDATE_CURSOR = 0x0300,
@@ -236,6 +237,7 @@ \subsubsection{Device Operation: Request header}\label{sec:Device Types / GPU De
         VIRTIO_GPU_RESP_OK_EDID,
         VIRTIO_GPU_RESP_OK_RESOURCE_UUID,
         VIRTIO_GPU_RESP_OK_MAP_INFO,
+        VIRTIO_GPU_RESP_OK_P2PDMA_DISTANCE,
 
         /* error responses */
         VIRTIO_GPU_RESP_ERR_UNSPEC = 0x1200,
@@ -791,6 +793,33 @@ \subsubsection{Device Operation: controlq (3d)}\label{sec:Device Types / GPU Dev
 };
 \end{lstlisting}
 
+\item[VIRTIO_GPU_CMD_P2PDMA_DISTANCE] calculates the cumulative distance
+  between two devices before Peer-to-Peer(P2P) transaction. Request data
+  is \field{struct virtio_gpu_device_p2pdma_distance}. Response type is
+  VIRTIO_GPU_RESP_OK_P2PDMA_DISTANCE. Response data is
+  \field{virtio_gpu_resp_distance}.
+
+\begin{lstlisting}
+struct virtio_gpu_device_p2pdma_distance {
+        struct virtio_gpu_ctrl_hdr hdr;
+        le32 provider_bus;
+        le32 provider_slot;
+        le32 provider_func;
+        le32 client_bus;
+        le32 client_slot;
+        le32 client_func;
+};
+
+struct virtio_gpu_resp_distance {
+        struct virtio_gpu_ctrl_hdr hdr;
+        le32 distance;
+}
+\end{lstlisting}
+
+The request data contains guest virtual pci notations of p2pdma provider
+and client. The response contains the distance between provider and client,
+which represents the compatibility of these two PCI devices.
+
 \end{description}
 
 \subsubsection{Device Operation: cursorq}\label{sec:Device Types / GPU Device / Device Operation / Device Operation: cursorq}
-- 
2.34.1

