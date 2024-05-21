Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2079.outbound.protection.outlook.com [40.107.212.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940241CD20
	for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 12:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716294191; cv=fail; b=Z6rru4F+KkwpsYFYqE1IdnjaTEKiEdCkFdrS3ZWPxEScsYhIEZD2dhdRazs4A/K71XIOzHvraIdSNh8S2ylsrWXjvkTgp+ojTa0vc5gmhKFKhauk542lBfjFPUR4m5e9gCLD94v1bv9BEcUmUoiTrmZ5J8xwt/goEINAJPhyUzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716294191; c=relaxed/simple;
	bh=WMVmy4zMsA2jAlYVGqDfhn1J+X/wmXYneNEgiS6L/wQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QZJlWgdHK/CY5Iyqag43BZ877N23LeX7vqnUxDWcmEaynxnN+UjV2ZY1yWdA/19wz5pAYRSZeKdggLW3iSVtkgbiGhBOPDXBDTZhSjBthG+EUsm0zPFO8h2AJLGEywH6H+Ww+uH3dTpf2IiUMSUImitYrOW29ccul8r5uHd9Xo8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jUGWLzOJ; arc=fail smtp.client-ip=40.107.212.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jUGWLzOJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dZRKAWoXam1Rsxd45pY1kjSiY6V7Z8a30ddGeiDyQoP+CVGgh/i8U/jA3IITfRMh5TZZaemLvY4HTZvR4Y2F+kUj/UWm20VVKxtRwm6bwUsOowoSZPvpB9Z4WmoFvqTxK0jPrTTDcduXmc6hmk1sxDbgO2pI+Wi903MC7UtcU6KR76i4Gm7sHGquAMdsiNWTi///xXQp5+r1ZwFldx4GGNa/ewnSHDNiWjHgAj8jv3buCnoaqdjNS0Lk/tlrk2/A28S4+crYLTNddKflZWGuY3lEQV/GShgyvTUqZDH9xlo15EhrVfnnjfgkBWuGrgaCOC8szLSoOr0/g1ibNxPPrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HHDZzSGzR7T+eg94agg15JRRM4BkTkj7WblwibCaI1c=;
 b=GxjSzhxiOYriJ1ZcZYsccBYkiWzO2w+4yzDHvyZX7dG7gRegL8OZHtUpYInrm2AXkMv+PSIve7SEcru5RfjQR8wiqZ/J4VAESggrylfhNZvWW3JMWEW/U2O6fAQpfPRtsEhKb7soSOPhTHjeahYwwtIczQPXZSB7VHhwdpTRt1FEDNe2QgZH3rVDLRftIFC5icRiS/5pUEInnPsb7EGKT7BFcftAkhgDFxczDqZa2zk+sxTAlXne8u7nmZGv8+dWUKbPc1zoPqqGG621jZLUws1CtPtoCcNijtAvM98GaN7Q4Kom6grGNoRb5ACnpRQzZPSaBoytcF1xg5LI7lwOQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HHDZzSGzR7T+eg94agg15JRRM4BkTkj7WblwibCaI1c=;
 b=jUGWLzOJA6JYKqMTK1piqdZSG0HxHdbRFHw4HJ0ugfXtA7A82MczDcuKu8NkwWMV/gflGbZxRbua45zf9Zr1WvBLnfqVn1JsCXFMiKl2lNANwx83E4NbCqf/EZcrNkWBOLeC/iIRKis8i/r+2oeqf1g7+ToKphfd8XaNqAhDWeZ3RsT/m16x6i6eZAUimjQRxqui+onT1t8zSt4c2a0390JQ29YTl/bcxLtTKd7rXOtGgPViOvgthNLCKf85uj1yDmst8WKYzRJ88xKXmP2Di3altTcIXe4DuIAA8EmV4+Po6rnpXiEEoVyH4GE3QZn2IkVtC0q8QF11EqZRDsCI2Q==
Received: from MW2PR2101CA0018.namprd21.prod.outlook.com (2603:10b6:302:1::31)
 by PH0PR12MB8100.namprd12.prod.outlook.com (2603:10b6:510:29b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.30; Tue, 21 May
 2024 12:23:05 +0000
Received: from CO1PEPF000042AB.namprd03.prod.outlook.com
 (2603:10b6:302:1:cafe::bb) by MW2PR2101CA0018.outlook.office365.com
 (2603:10b6:302:1::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.5 via Frontend
 Transport; Tue, 21 May 2024 12:23:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000042AB.mail.protection.outlook.com (10.167.243.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.14 via Frontend Transport; Tue, 21 May 2024 12:23:05 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 21 May
 2024 05:22:47 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 21 May 2024 05:22:45 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH] transport-pci: Replace admin with administration
Date: Tue, 21 May 2024 15:21:57 +0300
Message-ID: <20240521122157.2004097-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AB:EE_|PH0PR12MB8100:EE_
X-MS-Office365-Filtering-Correlation-Id: c048caec-d3ec-44d3-85d9-08dc7990c46b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|36860700004|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zYlbSvGYkcwZi5od19KHku+UrXR6cijdFfwh6OjLJCVHJ9UCF4FsqjzZW6Lo?=
 =?us-ascii?Q?sZkVAhjR5JrVnTsoZlm+/jkj0BqIJDC/RbZTc0ggTyKSnc0LBIKLwrV/OQwg?=
 =?us-ascii?Q?ryF7YYlDe/iU0AVtMhCI7fIfeJwhYOAYqay4qmkrn5tJ649U2bp5NrLBFm8+?=
 =?us-ascii?Q?mQEnc2f4ZincQDUMWbqVfP1Hm1w+J4X3sXuyTQ81hTzxCkbl/+xgF5N48W6q?=
 =?us-ascii?Q?CLG4cGG352fPH3Z/sZe1H4PSYKIqUmWkIg4fzjkLrMTHTnfJ7SjxjTf0emOA?=
 =?us-ascii?Q?ILuAn+cAC47luJBwBCfAoJsWaSgTAVlM2cXniphCeDadTK5llzuewGO2vqYy?=
 =?us-ascii?Q?Ws4aDP172kEVl+5/7FdcwPiaPPUkWEH3PXOILzCKloq0WKKZkQIS0pZUhZM+?=
 =?us-ascii?Q?ZYVLzHsVj+G74UK8qpcrSK7dhwIaqUso5sGvDXbSfzOU6zNONNXaVQ9YCOUh?=
 =?us-ascii?Q?5Bu/hCRo94SyxAB6sXYE1CkrUktz580roSSZQKsEL79qdiHE0sU2MpgaO1Eo?=
 =?us-ascii?Q?ZsDKtqbOTddm/k2bVJyZvWCh9wwuguNAjnoQiJ0HdWhaT9VNHL0piNJaMXfX?=
 =?us-ascii?Q?46S3dBsb7zmWS6CNqeXx7OuMJyyFeSp3JICouq5KJCzzFOqxTtZNjbw6LXDx?=
 =?us-ascii?Q?xLHsK6H5snQ9myGHWRI0TZU0eCoHCPZf3AHB8twmk5OL740hJACXhiHgG+Ah?=
 =?us-ascii?Q?d+5BuqzoUBO+OxXiXDj4j8XLRhoHvPiXWSCpb3m7av8qTNpWnGPMA7frkFr2?=
 =?us-ascii?Q?njy9FQinfv+M42HK4MbQBqc7GbzGieqltFWpqZG3gX3aMLlfAN2SzheVVlQh?=
 =?us-ascii?Q?oiiWHdQBpUBhGHeiIisVHELKC/y/xZuNUnX0YdubumH3//bOEU2Rd6kYIsdc?=
 =?us-ascii?Q?vcf3iffJWmwcznSDt1EB34Wr6p8HILqITnHFYxj+zyBnOE1c80X7s05aDCCF?=
 =?us-ascii?Q?AK34D9SQsZPCPLJsCwpoGFLToISf4CxR7CaxcC221Bvz890YSxbAcezkyx6F?=
 =?us-ascii?Q?Ox0SLj2u9lmXiADFa385XNgL6rUzAxHhHjSLcA+C4S7NDioytjzL1YRfYch6?=
 =?us-ascii?Q?UrCmxYqlXYuTM8vfJUo+aX2j8Lg6acDHsLApPoHYjeqxVZVWJQRLcPRF1bkj?=
 =?us-ascii?Q?1qZvDcDJrGS+FuMdVbYq4cq9uFNG6T4FeTE5rBzSfz81nKzqQ6+rhtuzRyn8?=
 =?us-ascii?Q?HTKsUHScrZmPrRgcX1Eknhqh7dHtAraVZpArXmWeLgaT8fJo/KPLUZ2OYhy9?=
 =?us-ascii?Q?SrxW17XyCClxM1sT2BeQum9X156Qwwuzr4DvI3+Qdf4Ou0cqTAdmGravqK58?=
 =?us-ascii?Q?Kzc7UFu9uNfp+VuAf9Qab5VcNP9BlS0djvzKZrYxa/RJiSSrnWW+uqigXqpj?=
 =?us-ascii?Q?yZfPC+qrBHnl+Mq1w1gneaA3K9ah?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(376005)(36860700004)(1800799015)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 12:23:05.6306
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c048caec-d3ec-44d3-85d9-08dc7990c46b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8100

Like rest of the document, refer to adminstration object
(command, virtqueue) as adminstration in the description. Hence, replace
'admin' with 'administration'.

Suggested-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 transport-pci.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/transport-pci.tex b/transport-pci.tex
index a5c6719..2dfbdbc 100644
--- a/transport-pci.tex
+++ b/transport-pci.tex
@@ -492,7 +492,7 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
 \field{admin_queue_index} MUST be equal to, or bigger than
 \field{num_queues}; also, \field{admin_queue_num} MUST be
 smaller than, or equal to 0x10000 - \field{admin_queue_index},
-to ensure that indices of valid admin queues fit into
+to ensure that indices of valid administration queues fit into
 a 16 bit range beyond all other virtqueues.
 
 \drivernormative{\paragraph}{Common configuration structure layout}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout}
-- 
2.34.1

