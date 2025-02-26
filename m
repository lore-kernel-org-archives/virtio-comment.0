Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2079.outbound.protection.outlook.com [40.107.93.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F39224259
	for <virtio-comment@lists.linux.dev>; Wed, 26 Feb 2025 09:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740562162; cv=fail; b=TakrN1A/EKH2ZDg79LBsygVsofc+r0RlG9SrCmIyF0MBN0otRSHdtqsem9h32gTukvHehWPt+ywe/pB7kY0IfWD0LE1zL1Tg+lUFEEPPkdS/4T12NSgzRFwQ+35/OTtbr8CuUtQqHkPad8ImkJcnyKCErER4YbDy5Kx0nZsDkDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740562162; c=relaxed/simple;
	bh=scJKzbznWbKKc2faq67JAoHE7Avy+M+lownQcitA9LM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sYgI456uPGFTPN7iRyM7KuUv/wa/n7PoIhbIo4Wo+lsrtxek/0WGKWiGf1/9To97LG2S+VSB0SQPWmMszG1PKS4Ta5gbK8AdeHrUu7r9Hp7+Vxrn6FJVpJES4X8p5oKYQefC+5KR8goCbyCh9CQKHgb1/vyZnjTc0Ure+xFO+XA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=aSjp8EmK; arc=fail smtp.client-ip=40.107.93.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="aSjp8EmK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K9MY/LrzkmDCzOa4FnBjhn6Ju3chq2uhyAJUOsagGNIFuBVtJWV+COBYZB3R9CKZu7d9QanrwVopXEKY6vVRUOzEIte67pJ0zeHbantSCH5Qj+2VF+JmXM9aQPH2TgXAvjqtCVRozPY1GHBjm6vWoDN9Yctl2Yg0thAMvGvOGtWqAbw8sdkAO9nZnm5Kp2m9+tYl57T5pg7A5Bu5cCzcdaEB5NZo0pSNt0riT43QvETgYOgXiXFWXczAtU7ml5sb1Y9wj6ajgkgMXKiI86xR8D9rZPMql7lqZKUHRBbrkoAtwOjad3cYa1rnKbqvkut4uxq/5T3Vy1+q2z+I+smKpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=io09UXpX4fEa1CHRqZa2vjHzFOKqaoUmWfz0Imc58yI=;
 b=h8wZdzYBKjeLEWrkWOkRgnW19W7QqkR3ZkIHSBMNPnNkLsYn04sKrKxpmf/IWqOBALx2ya1JB/gwGOeTTILxPZFJtlHTbiXjzKRWTMPTS5peAzfysiyPeVaEhfrm4qUstnTJcV42y4AOMMXENhG3o0tYHQfoSoh+up+etSoxLqT+c50vsNYo/7Tppq9uTg/a4/Be1U7AXpUH8Pa9IllG73a2SQ5Aafh6s0XMfctmuWOmlVZG/cwdxamzt+fSHqu6yQwFG/qN8WN4XuEx8oEAQk4FJV4Ip8pc8ANC7Sx9UOtcgSiu13eXdEujlNHkA9o0lK9nGe0fzgKWF/qC047vKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=io09UXpX4fEa1CHRqZa2vjHzFOKqaoUmWfz0Imc58yI=;
 b=aSjp8EmKs1ERgyHLDn1ORiyqRc3ieJzBocngu1Ygd2SZhVrlADOT4xzETBei/mssYhmxWCE1q7E+RZGRijfEFrdvjJCnpGtwAOukJXo4yqIwptG8glZoCDTHlpLNZbhioiho+spUVahREAxa7F+HvWPCSJNnKm7AlTmMezyjnbM=
Received: from PH7PR10CA0022.namprd10.prod.outlook.com (2603:10b6:510:23d::6)
 by BL1PR12MB5801.namprd12.prod.outlook.com (2603:10b6:208:391::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 09:29:17 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:510:23d:cafe::64) by PH7PR10CA0022.outlook.office365.com
 (2603:10b6:510:23d::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.18 via Frontend Transport; Wed,
 26 Feb 2025 09:29:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Wed, 26 Feb 2025 09:29:16 +0000
Received: from jenkins-julia.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 03:29:13 -0600
From: Julia Zhang <julia.zhang@amd.com>
To: <virtio-comment@lists.linux.dev>
CC: "Michael S . Tsirkin" <mst@redhat.com>, Chen Jiqian <Jiqian.Chen@amd.com>,
	Zhu Lingshan <lingshan.zhu@amd.com>, Huang Rui <ray.huang@amd.com>, "Julia
 Zhang" <julia.zhang@amd.com>, Matias Ezequiel Vara Larsen
	<mvaralar@redhat.com>
Subject: [PATCH v2 1/1] virtio-gpu: get p2pdma distance
Date: Wed, 26 Feb 2025 17:27:54 +0800
Message-ID: <20250226092753.1082042-1-julia.zhang@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD6:EE_|BL1PR12MB5801:EE_
X-MS-Office365-Filtering-Correlation-Id: ffe7f192-cd29-49f8-5de9-08dd56480a53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?P1PYXPgVrXunGgWLlZ7k26gdo90fLcMJnkDGnRfZU8twNZxuDP2EA867iipy?=
 =?us-ascii?Q?AnEFo0PBCAmsKs4x50RGim+04hO631QAMut+D1zvqda6kVVhtU2yxHhiG8IC?=
 =?us-ascii?Q?QHPSQzx4kolF1sGpMHoF6c2OHhVn6Xo0s713KPgsXxJGxJjsPfi7gUVCkwYO?=
 =?us-ascii?Q?sZJvrQpqeFNnRE2JJa/8QSEi0oNzDebWb0FEUvfs0CnS97yXUQJcJ/0+++La?=
 =?us-ascii?Q?1vd1bYEpqQ3Ai71u1wuhxcfyGyp5Q6qLpeTTLsRLLno4vu7vQcfibPlTaDFC?=
 =?us-ascii?Q?/nw4NCEQO/nOXxITF79K1q/j0z6rVxcL9PaTwh92P4LKMkDxflnLpR3ZvLGh?=
 =?us-ascii?Q?rk18kvmWgyO/nrltebQLx9iLNFmWBQQV7EBLooFZQGpKSdpOcDRhahylptAL?=
 =?us-ascii?Q?OsAq2ALUMIdaUhf+FIntg4ZZWFmp6uYPtyB12iQ5fSxGErBVUXUy8H9nL0QV?=
 =?us-ascii?Q?fMoKi+r5UFDJV75n/OHa2PW2cGSiwvybJ9TIxM3iDwUWoWdj6ELgRULD37nb?=
 =?us-ascii?Q?VN7FSWSTFTfKe0ToN2IPdlpy1k30SFO4LNqnG0RBUn75S/suGHo1iZi5SKj3?=
 =?us-ascii?Q?tweSYPWDcu/ir8UemIPGxsZlS9FYQkYEF1me/3JSkt/U2lYIkXW1VaOkv+Gj?=
 =?us-ascii?Q?3fb46rw/EVpk/P1YjwJv9Co3aKFRpPVFmGrq/WgfBfxMzh9mC/A0ERY6iKIK?=
 =?us-ascii?Q?DPP9HwMap9WXMXNKvFpd2fCuQS3q9kWaKI4ZcmoFLMeHYeg7yxS8fD05CH43?=
 =?us-ascii?Q?hWXHKwmHN7LWUWBhpWc3UOcalktpYiqGpIrzmULtXmLwR1PENdWBpwAqKHv/?=
 =?us-ascii?Q?Z6WlPvSx+g/cUzq6rUUzaRcwsA2hMrtxUj2YHMJaKlmY5E0LxYaJxNz8Gi3q?=
 =?us-ascii?Q?21FqkrUuE+Md383oMN8SaoUowTK9rziHAIsWYPTYJS3jBu6e/Yy5OGHDk/+x?=
 =?us-ascii?Q?E3Hl9Z7NcQZufutDDMf9PtjcNLNPwGBpJ4uqXeI7+FRthJWgyJnvLwL+U/bk?=
 =?us-ascii?Q?8ZyQPf2o6eOfVeCxr/f+s1ClsmJHXzgr5TXoDAHcgVxrqk+Lw4si6661Wibw?=
 =?us-ascii?Q?xF67VrfjN4D4WujPQgFUaqPiDvkODVFirIrHzWtfcX9l7yId8qiEs3Kz6Tay?=
 =?us-ascii?Q?eU2HpuzzqZ+bdJLMpPkgPtnb2IQut7BrpxKqPsSEcllhiHuxxXaDQTBMWn8n?=
 =?us-ascii?Q?Lkrq6RlS1OGLzvQgddhu0DmqooCCXBRXP0VsrWAskHXdsOzcSbYFzSm6HELZ?=
 =?us-ascii?Q?6pkbYFaxtXewfaXNGB9jjrqvVng5iKHjMwT97ehaVt/bP054JOcPqMZx3eOB?=
 =?us-ascii?Q?jlUwhR/o6gY4JMpjI+DqFP1WkfeGWIggIYXABtw20l8wHPJ3Ny/89nqdauJd?=
 =?us-ascii?Q?aNvHkMUE8WmK6s9o5k+VekZ3getkuR3YrOTpNEcQ3a2qIAKggoZAZIb44K/R?=
 =?us-ascii?Q?p5Bn296vkmATccWVkOS7S5X/AupoxPsbCuTyoTK3OtyaXo2Yr9C8EnnpqFfI?=
 =?us-ascii?Q?LaJnfkhRuPZhaUA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 09:29:16.6098
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffe7f192-cd29-49f8-5de9-08dd56480a53
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5801

PCI peer-to-peer DMA transaction may be used in guest for some scenes.
For example, dGPU prime feature will let virtio-iGPU access to
passthrough dGPU buffer.

To support P2P DMA transaction in guest, virtio-gpu needs to check the
compatibility which is represented by p2pdma_distance. This defines a
command VIRTIO_GPU_CMD_P2PDMA_DISTANCE to allow guest send virtual pci
notation of two devices to host and get host physical p2pdma_distance
of these two PCI devices.

Fixes:https://github.com/oasis-tcs/virtio-spec/issues/217
Signed-off-by: Julia Zhang <julia.zhang@amd.com>
Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
---
Hi all,

We are trying to implement dGPU prime feature in guest which will let
virtio-iGPU read rendered data of passthrough dGPU. Before that, virtio gpu
driver needs to get p2pdma_distance to check if P2P DMA transaction is
possible or not.

To implement getting p2pdma_distance, QEMU needs to handle the command from
guest with virtual pci notations of two PCI devices and send it to host
kernel and return host physical distance back to guest.

So this defines the new command follow the suggestion in https:
//lore.kernel.org/all/20241207105537.542441-4-julia.zhang@amd.com/

changes from v1:
 - add issue link to commit msg

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

