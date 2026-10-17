Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011069.outbound.protection.outlook.com [52.101.52.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770684848A9
	for <virtio-comment@lists.linux.dev>; Sat, 17 Oct 2026 11:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792237611; cv=fail; b=BXuaNeX80QhhqtcxGKzJ8UQjQB7i36S3/r9Mq4c8flyxbQmw4iqR+8RRE1YuG00YPMbyE9LQaYXDHU/rL5dMU3NO0L6UxLFE5ddco/VabhLF/RDC+rVJ6DTD3Gu7gThYCijzLgHhbBOWkPaIMRfe+A//rsrSjeAlX7uLRBbiF+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792237611; c=relaxed/simple;
	bh=Sg1m8S7vKl1HrX9dYfmre6YkyZptVjjG/JdxMOqPUQ8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oHSLUchAnStTbqpiXWR/aNlOklZQrRWpZ5zR0e1RrUpbE722RfoNCMSXZAa0tGElJCY9krYwYryUJe8Lb2QxRV92ObpRRfbSam6CEuHt16PBy3OBHJDhE2rm9TnnosHzwYvXoLy2+iFV6lUtYXZMl5TaQFdLx9oF6TTqQxQnT/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rHLUeesF; arc=fail smtp.client-ip=52.101.52.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rHLUeesF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dZwNrD05m6s76DiArSmBsYN/pG8vM/WABDB3G5qil5t8SSn+jBxpj5sRe8WMWl6ulD4rYHFV0DRFZmU7dVnWp9hsBTlc7oovqEqLE1avYuHDicAD3hTUlZOeiEn9qw+LuiRy//cIFMLPhSD/ImEZRyJv85Le/tcgvzLEDdQyXTYLksy/GxW3oXHhhzgzzBJ2lw54uJ9abIR1lD6cyt7SKx4PiELnUQotr71CkMrmAsW0HxdDP1ebQPXHObzxII+5dS3j1EV9Zwa9aHYh/vwS25HHqVGhNWaCA0DiU4SfYEqpDxw/TZoovtPOMR+zCe4ReYvrXrV3UEKRsdAEgYuWgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zTFSthbs1Wq2p1KTHZzKLySeSbkpVnS7q/6bP4gP+D4=;
 b=ZtN+dnJ4EQ1qq8HFJCKuClUuV7VS3jYl68qMKJZ+bMt8mYrhyTBlPXgyK5ar08zF+8D8spQrEoj33AIZV8VyEV3KaArvsVoMUlD+itd1uhEdL8Jjm8T0aRL+t0Y6X8v8T+up9ULUEYZmn/I8L7/ZXfR4vkaliADOFMivL8u5kQh7pm2lYCPMm6uYEyw+2qNjoG1EI3j9hgnHSXgl4JT2YGydM6T/reMOYy8K4rDh8c5LpAmb5XC5EkIHfgZMKdPUOo7JULdwyQeblz679IAIFHmceoxPGCQQ2r0QkmhFI3gmP+Uz6vF+1sNaEKrwRFDezeHMUqzXNHpZiQIGPJPtCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zTFSthbs1Wq2p1KTHZzKLySeSbkpVnS7q/6bP4gP+D4=;
 b=rHLUeesFW6YIVdEH6mYrYZXCfAM+LX1vgHaWQq+SMPq96NkMjhjMCX158jdxGwUS2O7lsK0BbXX8Q4HqBG5ldAdK41R4ji2tVVYssYijpkIyqJm9gCt7rqEwpUvN5SVdLc4MX5kfOdAUc9LkGfMESDfTzNbLwcBw4sn1hFwpFASaa0uPOGwyp0JBaejRSYUYol9d9FK+sS52JytU8B85Kqwx9DzQmGla9rktHv1ix2uim951/XCAuIf5ka3xnge4f7gVnQlZu9w7HvSL4AZwOzFOPeMNYbEKX3SHGJZ+3yufM8Nxk6QA84WZRVq7vjx3kv7v4+HVVie6vtrdCntpyQ==
Received: from SJ0PR03CA0186.namprd03.prod.outlook.com (2603:10b6:a03:2ef::11)
 by DM3PR12MB9351.namprd12.prod.outlook.com (2603:10b6:8:1ac::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Sat, 17 Oct
 2026 11:46:42 +0000
Received: from CO1PEPF00018869.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::3) by SJ0PR03CA0186.outlook.office365.com
 (2603:10b6:a03:2ef::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.17 via Frontend Transport; Sat,
 17 Oct 2026 11:46:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF00018869.mail.protection.outlook.com (10.167.249.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Sat, 17 Oct 2026 11:46:42 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Sat, 17 Oct
 2026 04:46:28 -0700
Received: from mec-arch-host11.tlv01.nbulabs.nvidia.com (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 17 Oct 2026 04:46:26 -0700
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, virtio-comment
	<virtio-comment@lists.linux.dev>, Cornelia Huck <cohuck@redhat.com>
CC: Max Gurtovoy <mgurtovoy@nvidia.com>, Linlin Zhang
	<linlin.zhang@oss.qualcomm.com>, <neeraj.soni@oss.qualcomm.com>, "Stefan
 Hajnoczi" <stefanha@redhat.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH 2/6] transport-mmio: Add administration virtqueue registers
Date: Sat, 17 Oct 2026 14:45:52 +0300
Message-ID: <20261017114556.1701355-3-parav@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017114556.1701355-1-parav@nvidia.com>
References: <20261017114556.1701355-1-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00018869:EE_|DM3PR12MB9351:EE_
X-MS-Office365-Filtering-Correlation-Id: cb31fa1d-76f8-40b3-f7d9-08df2c445017
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|1800799024|36860700016|261009223027099003|6133799003|18002099003|22082099003|3023799007|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	OSAHZn4c6qKDQxfuYGgf3ZsFOuMLXdqMSV4PMqxq37VtY6G9FIXqsw5kK71Pr3AZD94dVl3Zg/BPk9Yl/UQsgVxBdbF/Q/UJxHsZaKaFEI/fgg0ELDRyLTeIgFeulva9P0lBnsHqX+C5rzWqHq6dsom16UykyfL89CxAOT5ntZhMqbjsvbVXzx8TUn59m9v6uENrAOoIlKr8xwNdl4acBRw7xRuYU0UwS1s3SjAbUIgce4NdbE3uh2PBAiM1h8fzbQm5lr2Pq8b8G9q15pTT0v3KWgOiZCtdG+IjDLc+4+wsMRZUTyLwvF4mSQmMLvl1iH185ZZnXwFTkKun2t3gF/t4+o5F/h/LIL2w7o6ABDKOZl1TwojsBWg0NhpnYvR9euCc9sctNHAy0VpzQizMXGybICVAJ9P2LNFV/Gntkj0luoaLdO6m5/cDyHxS0YtHECgvCr6zzve+wpSdygMQPxot2Qp8wc8+ludDL+sl1xpZwEkJ8RMa1mFrxwAgXakSLiA7/iuCtK2ofK3KXAaYKBcdemxyj/5eJrBwD29E/uSpXquNRB8Vi8GwCg1/F/AezSVf8JnuzBFi6OFpSNWdPHG4/OhigIZ1FmqVZRYxHh9xahxqIkDXqPZjKdqQIenp+r6gs1eC7PWNfup40ph9c11B5SAbPPavcKr+x4/AjwMNvgV2l54+pYzr8rMSfaFgfvsI9QpPfVrEl+Th14I2ng==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(1800799024)(36860700016)(261009223027099003)(6133799003)(18002099003)(22082099003)(3023799007)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	37BszJNghDiAFrOd8Z2bh15JwmxWllNapZcOVrjdTl0RZtctIeu/12aIeeLB+UKv/su2BgDi6nwVZwd/J4eO01f7NOQ76BQQfVFDX3zPAO08Iyy6MYDfNrsWYi4qP3WtkAOp0qYsQeyf3NaaBdbdvRiax2hCxrtzkmejaOEb4bBeMR0e33U7AJD/iT7VqXaPMm7rmVlXTw6OFF74ZAO3qDZTkSwVgCtHxbM6uPUhp8Nilgf94LjTaY+5zNro3grCS5UFiaqk3BtX2koDXvXRIqKT/5BG6tcesMDbSZfXJ9LGZWl/e0EyIWU/ogKz1L54Itr3nBJ8S/crcHzCLlYyhca9wuJf49Ly7lsGgG/0EE4mPNBMb5H+CY/xraEu/s3vvO6SWqb2fe/PYK/IqGB1Jjax/ObFncMRlUBKYHNmhCSAY8VxokWa7nO461WRSVpB
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2026 11:46:42.1263
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb31fa1d-76f8-40b3-f7d9-08df2c445017
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00018869.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9351

Add two read-only registers to the MMIO device register layout which
let the driver discover the administration virtqueues of the device,
mirroring admin_queue_index and admin_queue_num of the PCI
common configuration structure:

AdminQueueIndex (0x0c4): index of the first administration virtqueue.
AdminQueueNum (0x0c8): number of administration virtqueues.

Both registers are valid only if VIRTIO_F_ADMIN_VQ has been
negotiated. The offsets are taken from the unused range between
QueueReset and ConfigGeneration, so the layout of existing registers
is unchanged and no new MMIO Version is needed: the presence of the
registers is indicated by VIRTIO_F_ADMIN_VQ.

Also mention in QueueSel that administration virtqueues are selected
like any other virtqueue, and describe the typical driver flow for
discovering and initializing administration virtqueues.

VIRTIO_F_ADMIN_VQ is still listed as reserved for MMIO; this is
addressed in the following patch.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 transport-mmio.tex | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/transport-mmio.tex b/transport-mmio.tex
index e015bd7..3c5aa6b 100644
--- a/transport-mmio.tex
+++ b/transport-mmio.tex
@@ -116,6 +116,8 @@ \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport Options / Vi
     \field{QueueSize}, \field{QueueReady},
     \field{QueueDescLow}, \field{QueueDescHigh}, \field{QueueDriverlLow}, \field{QueueDriverHigh},
     \field{QueueDeviceLow}, \field{QueueDeviceHigh} and \field{QueueReset} apply to.
+    The selected virtqueue can also be an administration virtqueue,
+    see \field{AdminQueueIndex} and \field{AdminQueueNum}.
   }
   \hline
   \mmioreg{QueueSizeMax}{Maximum virtqueue size}{0x034}{R}{%
@@ -248,6 +250,24 @@ \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport Options / Vi
     apply to the queue selected by writing to \field{QueueSel}.
   }
   \hline
+  \mmioreg{AdminQueueIndex}{Index of the first administration virtqueue}{0x0c4}{R}{%
+    Reading from this register returns the virtqueue index of the first
+    administration virtqueue of the device.
+    This register is valid only if VIRTIO_F_ADMIN_VQ has been negotiated.
+    See \ref{sec:Virtio Transport Options / Virtio Over MMIO / MMIO-specific Initialization And Device Operation / Administration Virtqueues}.
+  }
+  \hline
+  \mmioreg{AdminQueueNum}{Number of administration virtqueues}{0x0c8}{R}{%
+    Reading from this register returns the number of administration
+    virtqueues supported by the device.
+    Virtqueues with index between \field{AdminQueueIndex} and
+    (\field{AdminQueueIndex} + \field{AdminQueueNum} - 1) inclusive serve
+    as administration virtqueues.
+    The value 0 indicates no supported administration virtqueues.
+    This register is valid only if VIRTIO_F_ADMIN_VQ has been negotiated.
+    See \ref{sec:Virtio Transport Options / Virtio Over MMIO / MMIO-specific Initialization And Device Operation / Administration Virtqueues}.
+  }
+  \hline
   \mmioreg{ConfigGeneration}{Configuration atomicity value}{0x0fc}{R}{
     Reading from this register returns a value describing a version of the device-specific configuration space (see \field{Config}).
     The driver can then access the configuration space and, when finished, read \field{ConfigGeneration} again.
@@ -467,6 +487,29 @@ \subsubsection{Administration Virtqueues}\label{sec:Virtio Transport Options / V
 This range is located beyond the indices of all other virtqueues of
 the device.
 
+A device that supports administration virtqueues offers the
+VIRTIO_F_ADMIN_VQ feature bit. If VIRTIO_F_ADMIN_VQ has been
+negotiated, the device reports the index of the first administration
+virtqueue in \field{AdminQueueIndex} and the number of administration
+virtqueues in \field{AdminQueueNum}.
+
+The driver typically discovers and initializes the administration
+virtqueues in the following way:
+
+\begin{enumerate}
+\item Negotiate VIRTIO_F_ADMIN_VQ as part of the feature negotiation.
+
+\item Read \field{AdminQueueIndex} and \field{AdminQueueNum}.
+   If \field{AdminQueueNum} is zero (0x0), the device does not support
+   any administration virtqueues.
+
+\item For each administration virtqueue the driver intends to use,
+   select a virtqueue index in the range \field{AdminQueueIndex} to
+   \field{AdminQueueIndex} + \field{AdminQueueNum} - 1 inclusive, and
+   configure the virtqueue as described in
+   \ref{sec:Virtio Transport Options / Virtio Over MMIO / MMIO-specific Initialization And Device Operation / Virtqueue Configuration}~\nameref{sec:Virtio Transport Options / Virtio Over MMIO / MMIO-specific Initialization And Device Operation / Virtqueue Configuration}.
+\end{enumerate}
+
 \subsection{Legacy interface}\label{sec:Virtio Transport Options / Virtio Over MMIO / Legacy interface}
 
 The legacy MMIO transport used page-based addressing, resulting
-- 
2.43.0

