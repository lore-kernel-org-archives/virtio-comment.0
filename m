Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2081.outbound.protection.outlook.com [40.107.95.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670E36BB33
	for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 12:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716294629; cv=fail; b=pCHgV5DSw6fJv3uFGDnvWuZxdV42RxIrIFC/E9cYBGMnpwrq/ZFP306+v+25ILI5r/K/VjqsnBO8Aqauafmfuvl0DkYJdhxReeUeams9H1q8F53GlKtUnTKs46eTpaIHU0hKJoRBs+zWR0n81bhnH69ddhayz46LHMuM9M9ZvWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716294629; c=relaxed/simple;
	bh=Y74onfaJiCvOl26gcyFuJFcxmEOrgj87/jWbvQJKTLQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m5cph//3jsfS4KzJuV32YQROFub5/R1D/2euiWQAL3C382Nez4Lc9vaF8DwjtVE5h9/Ee0YUMv7ElGkAOhvSDuwh1JYUWzb/vN19mzHJk9g7owwoP7Wg3HAfpZV/SfbUvDpt4DydxF4268vTV8uBEN/Jsen21QKV4GG3VHYAjC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cYKzeBRV; arc=fail smtp.client-ip=40.107.95.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cYKzeBRV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jPO13A0HLGPVuI+zW9my06vqkkcw/53nmwFsReMJvXWuxpxmeZEMzlwzwHcU9ghautI3g3wUF5GZKI0Nr9DiRDvC3vZ9UVbLJbCFFmyUu9JiO+M7GUx80ZYBJflpVERbZV5HmMJuuwLOQBGbnNgQd4Z0DRXLndAEdJfJ753mkSaYRvaLcQOeNK0K8CMiSZnW/4TmB3vuE2GWWJvUNTH43/g6xjRrWwZgWt0A+J1RJQv4CMzvDDNicWsLK7mJWJRzNitGO6fkRmgJZdUhe5qqeReMMomSCynE6o+oeg4bibwkqMcaSWQQ5n/lNJ4UKhfWgcdcMdMfQXIbzeWt+j6bMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XocmiK3w52OUNMkGGqADa8JGSNcj/qj745uhGbeBWck=;
 b=em6VxS1CObfbItRZ6yPTKU7h2g2Xb09sQSkjI4nwwurI+ls3p6nhXHVspc1y3+sM46gm009275j10vGWlr02RRdazb6DFKksrFKYnIONGiFBPjom6uK3CAnV/0idyzPm+XI2pIDVlb/jUAFNvdVJOMvBrGHLW31T1YJvdRi+8yjS3v+rHRNUUb3VpXHb+B/qFKSMoB/n0B7pQ0lC/kvfLetsUL0pNHd+iWMTU0QoPdi5XUSykkFyZNoYtQJygq8MzngxIcUAaIPg/cL9KJWPkvSXmYDTj2ZRBm1FEKknPB70KHBSEgeDDa/RuHMijSg7JA5uKspI1Tdlnyhxi8KDqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XocmiK3w52OUNMkGGqADa8JGSNcj/qj745uhGbeBWck=;
 b=cYKzeBRVwroedm/vGiCkEFUMwW9oJxq1QoeUoIiwfeXV+9aG3cQgs7KojR6yrqsGQ2XcyDz2Db1tt+/dHut3EsDl8Ge0KplA0pbPuOuu37rVU+eYfeT9GhI28i4NCjRZkb6TQjRKg3rc/l8O+Z0eIYjg0wZGmywQypyLMIJRvYfvsrlUiRJilsSAG7ABz2HHSwG0bmgb5i+OZi9sHawH6l7y3/9auXmiV8OUlmQ1h8fhpF9XAbu2DfcennYh6eYSfKMLeJ73bHbiL4WsWbgOaC4Qzn+tJ/itAhEKhUzE8lYlq4CGnG6DPnEv43T+GIIRWsAECSKrG2BWBMFh6g9A6Q==
Received: from SA9PR13CA0065.namprd13.prod.outlook.com (2603:10b6:806:23::10)
 by DM6PR12MB4313.namprd12.prod.outlook.com (2603:10b6:5:21e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.31; Tue, 21 May
 2024 12:30:25 +0000
Received: from SN1PEPF000252A2.namprd05.prod.outlook.com
 (2603:10b6:806:23:cafe::3f) by SA9PR13CA0065.outlook.office365.com
 (2603:10b6:806:23::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.18 via Frontend
 Transport; Tue, 21 May 2024 12:30:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF000252A2.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.14 via Frontend Transport; Tue, 21 May 2024 12:30:24 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 21 May
 2024 05:30:08 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 21 May 2024 05:30:05 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <hengqi@linux.alibaba.com>, <sburla@marvell.com>, <shahafs@nvidia.com>,
	<si-wei.liu@oracle.com>, <peter.hilber@opensynergy.com>,
	<jasowang@redhat.com>, <xuanzhuo@linux.alibaba.com>, Parav Pandit
	<parav@nvidia.com>
Subject: [PATCH v10 04/13] admin: Prepare table for multipage listing
Date: Tue, 21 May 2024 15:29:28 +0300
Message-ID: <20240521122937.2004180-5-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240521122937.2004180-1-parav@nvidia.com>
References: <20240521122937.2004180-1-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A2:EE_|DM6PR12MB4313:EE_
X-MS-Office365-Filtering-Correlation-Id: 568f4213-ba55-4c16-18f5-08dc7991ca37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|36860700004|376005|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?K17RZFdVv+h72Lz7ifzNK/a0zk4cQvqh3q0PM3YLgvpfOjc2GkJqK+e3oVmm?=
 =?us-ascii?Q?zj/OSwlFfChWKhEbS8kG37XXeAf+JfDG8e9uy+muybjB6gyYwVERfjPe+Fk8?=
 =?us-ascii?Q?ydA1ADhedkXp42d8W//GaLW00wP9Yk0lX5aeKBhfzXZ4pq7JTkY042XTM/cA?=
 =?us-ascii?Q?wboqNZWmdQVqm1b9ajIqw/nAsTVvUnXMFa9WX7OswvY8Vd1evytba1B1VPNj?=
 =?us-ascii?Q?Owm3dqRrY3PNRKLO0al0YGLa0dD9vyFWNTw+gzreGjx9DywkncphvHK/DVuJ?=
 =?us-ascii?Q?vWACrWcqafHydF+XqH5brnFSXsyLr38kP1MRAZqJ0pTRr7FS68fnExRJ/ttF?=
 =?us-ascii?Q?T7hyNS1rmPSMXYw00QVFB7Lr963NBFVnpLhWIAr0IKAMFzVjXCVk6cfGiGwY?=
 =?us-ascii?Q?vcDgPuCmrlEq5JCnZjHuAXjRBxrunWDahsTzRwZiVDODFWR4p1sBZ9ivAYDA?=
 =?us-ascii?Q?/erxy1jbLYR7trOl77OZzpCmHFldnojSfNsKcUqYkfdGQYI/0yL9g975bZNZ?=
 =?us-ascii?Q?q/qS3eTTECai4/8A0C7dsjNRms2a3CV9xMICCVrxv4X2nzegmvBcAHU1aeK0?=
 =?us-ascii?Q?085XDxOcr2tOF7f4yV1LlUdt4BrjjHIcfPrCH2IHU/lr4w76FtwXqL2FGb/3?=
 =?us-ascii?Q?pqoQ1hx2ES2MMosjlDYwFqGeRI5nkmBTTx4eqY4xGl+pCbCZYZWzes+oWng/?=
 =?us-ascii?Q?g+XwW8ZEMA9KW3389Rya51DXv+3yGSqtiCLHOCOzaSMCmUBQIHIuKEeS3ysY?=
 =?us-ascii?Q?uU/PQLMX8Rx8JE9IJVAHnK3uPG+YuCZZvAm50JHlLehrllX5kuCUZiA3pFZg?=
 =?us-ascii?Q?lF6KWSLq+CbN4kLgx5NxFpaneznBjgC7+vrALNdAtnZkhY9Uc+WHlVXz45Bx?=
 =?us-ascii?Q?zanbmGZm73Pi+KiUh+2uSwZMJ4Gh0APntYpkz/j12qnblDebA9ejLnJol+mL?=
 =?us-ascii?Q?RIsYRzSTgKyNh+XCcVWzU3YThKrzMmFv4ezO3B20ni6GkUepD1oyHoIDpBdD?=
 =?us-ascii?Q?/cyaJKRjynUt6dINRLT+Yr1VKw23MCh//lQ/8lNUZK/7GQXPfeoKujdULrhq?=
 =?us-ascii?Q?ivWPXM2uFdGCGhdFimqWZ4aE1KrFC4Mi7aayx8LO0I0e3ofF+jxvFThfL92Q?=
 =?us-ascii?Q?nUaomm/N5saxOB9GqZXZ1jwbL33iS/CL6RwuZSkygw8QUngIdbdzDAxfaMiY?=
 =?us-ascii?Q?pRHfKkS8mfVNj50Jz1rNhX3extJXQAQ3x8JRIFEn3xz/zfq+XSCZ4MuoGPHe?=
 =?us-ascii?Q?5Rj6AavHW18r0SYRcezjRfxhOF6kR/p8KjzMJty20UPTkPhekFBzarYbyWCh?=
 =?us-ascii?Q?yHvOGJDjjh77bDwqaR/G+ay49t3l8lDq+qwGXicZXS9k3FgDN6bGOFfPOFYT?=
 =?us-ascii?Q?LH2Nks7OO5NAJ+1UEEhl90CrYXlB?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(82310400017)(36860700004)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 12:30:24.8188
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 568f4213-ba55-4c16-18f5-08dc7991ca37
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4313

If the table spans across two pages, it is not readable.
Make use of xltabular package that supports table spanning
across multiple pages.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 admin.tex  | 4 ++--
 virtio.tex | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/admin.tex b/admin.tex
index 56c92a6..c93c74c 100644
--- a/admin.tex
+++ b/admin.tex
@@ -118,7 +118,7 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
 \field{opcode} specifies the command. The valid
 values for \field{opcode} can be found in the following table:
 
-\begin{tabularx}{\textwidth}{ |l||l|X| }
+\begin{xltabular}{\textwidth}{ |l||l|X| }
 \hline
 opcode & Name & Command Description \\
 \hline \hline
@@ -140,7 +140,7 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
 \hline
 0x8000 - 0xFFFF & - & Reserved for future commands (possibly using a different structure)    \\
 \hline
-\end{tabularx}
+\end{xltabular}
 
 The \field{group_type} specifies the group type identifier.
 The \field{group_member_id} specifies the member identifier within the group.
diff --git a/virtio.tex b/virtio.tex
index 37e49b1..7c52a40 100644
--- a/virtio.tex
+++ b/virtio.tex
@@ -35,6 +35,7 @@
 \usepackage{xltxtra}
 \usepackage{etoolbox}
 \usepackage{tabularx}
+\usepackage{xltabular}
 \usepackage{underscore}
 \usepackage{xstring}
 \usepackage{enumitem}
-- 
2.34.1

