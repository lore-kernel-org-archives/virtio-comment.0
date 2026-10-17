Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013026.outbound.protection.outlook.com [40.107.201.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B37A47F2F9
	for <virtio-comment@lists.linux.dev>; Sat, 17 Oct 2026 11:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792237623; cv=fail; b=QI4KAFBLC2rkeVp4zGUv7EGbOs01KAWiJ1jC3bbKPhxibza9zJoc4xYxnm1FbrtugNmydklDn36cL/ZLCXS0xH4pRSERf/GeUPp4XKcriSe2z2T5O25h4LmWRwzg2yHm3I6z+dopa+hla87HL9uGlxMbYEG/Yy/3jQVj3PUtg7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792237623; c=relaxed/simple;
	bh=LtTQLJOHWXbhTfz6IccjtbKRYQPZU/T1Cjr8atZ+57A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LKiD3C7xvmiKs4ykUcSmnc7fEOoiNObHq6XveaFRXLArgE3on9yPBPzJoZAXiGJ8mjz4kfV9KnleRITgiAIHGXpXz4RA4VP+JruGNDTYTowk4GpZkA5hHCtW0AvwK0ygYfykwxseGNzLuHqofwq4OBj9oiAW8VhkvWZ6sdOCgB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VMQeBRf8; arc=fail smtp.client-ip=40.107.201.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VMQeBRf8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sbcH2VtiEzK3ogkEKXtvYWQsLI4iTjvZYR7lQe4GnD57YBwNPQIMUSl6tS84x+1c9m+m2LTixc4NKw7efDGWb6efHFToA0cmM2RvspkEkCPBIzT4ZJfbaRqwEkSDHn75iggpb2/ulBrgnp8Did4r0F7PDwY1IwD/Mto9ysCUXogVX6ttMk3XvrpOJRhI9IGkd5oB76HA7g+1UfBITymihp5R13zjRMqoMzqvbi4LWUKFuMGdXeUNAu1JZ5srXlOtxTbpwbY86wrIHQIO/T1zUgaYlg37EpN+a9tqLnbCFeR2M93yBkXDhDXy2li4dovmuFwjX5N/VBUaPDiFbrVDfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T6jGdzMxceGcAJsQSTp6GKdOzvop1oEvzCrLhiQI7Ng=;
 b=IO1UBKnShPD4jCtJJLJ3K7rGPrZHU4R7vnHGFIf4rfFrPIT3cuE5ccqrNmg3v6rQp7iF+5x+7ujp18Tt2420AfQKzgWBj7Yvkq+feoRzNr5kpiBNmAmC5eN2DAqlAWhPRIiKvzBqcBTO3pDBiqetxYGYjJ0U3lcIgGIJ2EoD1HsCOTPXhRP0LKB+Vdy7PTiuwdlWizUSpJyd5dYSswHghj9vPnSPgfEvhjc4dC6JfIYv1ERjqFLJ95fItV+sSvjSQS6LWCjJP0/o3WLJ6wIBdYn4lyRF6GFGOQ0W57kOefTjo31PK/hzCZibvR2BSimmTAObBz6E46XAjN3tLlRK2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T6jGdzMxceGcAJsQSTp6GKdOzvop1oEvzCrLhiQI7Ng=;
 b=VMQeBRf8e8iGUKFgvt3O2f7Q5UFYdL0sUdixs5lw1tdLMQiSBx0wOQnkiWa1h5aKT5Wgkvl+5qmbb+7c9iT3qm6z4YL2SJPsNZvl/+AIpLqCqjC1S+BOcghG34ZZgXI1d6BNRd8ADsOJ18gGuSdFb0RzxhSVPIeqQWvhyXK4XhpJBt+iKDlzwCz0hvYMgJjp0xAQW4rgu6H7ARQWz4zrlRU5YKsqgjA6cFd6kBuwGSv08xLpL5NB6lQyfH485x0m5ecJfyRahjwchZXe31jOvVYInjwnblHYfg9axd1crZIXd79bd3jfFZmfYLkvp2I3AHDq2zoEDzLAAKNycvHw6w==
Received: from SJ0PR03CA0182.namprd03.prod.outlook.com (2603:10b6:a03:2ef::7)
 by IA1PR12MB6329.namprd12.prod.outlook.com (2603:10b6:208:3e5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.18; Sat, 17 Oct
 2026 11:46:53 +0000
Received: from CO1PEPF00018869.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::8a) by SJ0PR03CA0182.outlook.office365.com
 (2603:10b6:a03:2ef::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.17 via Frontend Transport; Sat,
 17 Oct 2026 11:46:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF00018869.mail.protection.outlook.com (10.167.249.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Sat, 17 Oct 2026 11:46:52 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Sat, 17 Oct
 2026 04:46:36 -0700
Received: from mec-arch-host11.tlv01.nbulabs.nvidia.com (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 17 Oct 2026 04:46:34 -0700
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, virtio-comment
	<virtio-comment@lists.linux.dev>, Cornelia Huck <cohuck@redhat.com>
CC: Max Gurtovoy <mgurtovoy@nvidia.com>, Linlin Zhang
	<linlin.zhang@oss.qualcomm.com>, <neeraj.soni@oss.qualcomm.com>, "Stefan
 Hajnoczi" <stefanha@redhat.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH 5/6] transport-pci: Add missing driver requirement for admin queue fields
Date: Sat, 17 Oct 2026 14:45:55 +0300
Message-ID: <20261017114556.1701355-6-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00018869:EE_|IA1PR12MB6329:EE_
X-MS-Office365-Filtering-Correlation-Id: 00ef8fc6-8879-4b97-95ed-08df2c445680
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|6133799003|10067099003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	dhDf3I9yfn99WDL7kuBjjoaP4VmctCLS2ueLLx0kUmzM1lcxRcBwkJ7zHSwS9OkiN19ptJP6uzZiWKfVXoLWp/knaEXTGtPx9xmGe7UoovYP54AJMn8Ct6XHWSK7hdAjhfZryidRXzgMsRbHugwok0rw0ikNXueUcSgcQimHYNRtVUJMpHid4kHRxIBr2LjTxS9m1ZT6RKdVymG3qOY51aBs/k/0uY6t7oEkqYlqybwAp1qVbnSbyvWC1pG0tmgqYtsN9RYORrdYY8wslHx9vMqpQtModN2b2xivYkj21xJm4CKMyEu/XSUqiWocyx7z3l1vAyPtbPo3l8ewo5t0qZuC4Z5dIFJpp6bCdAHw4GCGaFgYauSR5fCg6wJ46qBDy87LyMv02+UanU2n2mZDiDfm9ZP983M27K3qAGWpYm3baTtgweyTLwW8xSlCAyx9yIchBRaM4h7hdWbB5LOiMXiZkt/rUCP3hOUmxKTekL1+iO/l4xMESa4UxATPj3l1iWkeb/GeGWi2jaIUsHxokIkp47EN1pLb9rEHfLjSfVotcNs/Dvp6CL0GINMqwThjr4IzFpcG+PE1xQSnZxvOKiBtJQ1DfmpRGFp7cXde8ClgleHud3Z2xmijYGn54kJAZnxfOmeAtlkHw+uFnUGOIDlVZ7mYENTphXbirDrJ/ub7AMh1hTKrEBIqKauGWYEdCz+tb1a+Hv+YqF6Bvk9Onw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(6133799003)(10067099003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	X7jKdQjOB1ylfuV9Wu6OXcZvIlIMYEbCskpQfObI6l+13DiJ1LDXyQqVMd1QvWxClgZ+KcBJVyizi7+RBDsM2/Vvu2zptAal2EqA7ZecVmU+gCwSn9PeLZpqVaQIiMAsYf6j3wUJO+S7hogrCW2oMW/q6EiXWi2hSPu9rj1TfA/dE6Yj0DrJhv4I0EaEadwUeOYC3zS5t80N+PvKu9ycMafSqnm94KjL9OKdeD7Mx9QAnJbIdnt9wdLCo9+RGlMkF4K11samy2zET2P1PPwooUSru7vXl0bcc5VXaTP7C9yNr4FFuYJS1zQVuIqOpRtIctBmrGOISsF3eBOTzdXWQ+yAIo0MXvVSri6JqX1bqWm8mZR3+liGxKxJ/VYJcpSj3FJSzrOd56tcznDmyu3uKJOZktGGxgvE3+6dXZBpzRq7iMKFu2eI3YyE8A5zjYDp
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2026 11:46:52.8636
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00ef8fc6-8879-4b97-95ed-08df2c445680
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00018869.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6329

The description of admin_queue_index and admin_queue_num in the common
configuration structure already states that these fields are valid
only if VIRTIO_F_ADMIN_VQ has been negotiated. However, the
corresponding driver requirement was missing from the normative
statements.

Add this missing requirement: the driver must not access
admin_queue_index and admin_queue_num unless VIRTIO_F_ADMIN_VQ has
been negotiated. This does not change the existing behaviour; it only
captures what was already part of the specification as a normative
statement, and aligns the PCI transport with the equivalent MMIO
transport requirement for AdminQueueIndex and AdminQueueNum.

Fixes: 677aeaebf6a7 ("pci: add admin vq registers to virtio over pci")
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 transport-pci.tex | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/transport-pci.tex b/transport-pci.tex
index 95b08b8..0cd9eab 100644
--- a/transport-pci.tex
+++ b/transport-pci.tex
@@ -523,6 +523,9 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
 were used before the queue reset.
 (see \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset}).
 
+The driver MUST NOT access \field{admin_queue_index} and
+\field{admin_queue_num} unless VIRTIO_F_ADMIN_VQ has been negotiated.
+
 If VIRTIO_F_ADMIN_VQ has been negotiated, and if the driver
 configures any administration virtqueues, the driver MUST
 configure the administration virtqueues using the index
-- 
2.43.0

