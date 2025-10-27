Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010011.outbound.protection.outlook.com [52.101.85.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C78313520
	for <virtio-comment@lists.linux.dev>; Mon, 27 Oct 2025 17:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761587384; cv=fail; b=aKvzFF5ntq69uku1CxgtY9GD+M5MvM2Z4v2jDy78hphKUtVAzaYnU9UFzwCYpHnWxDw9Sr1L1l59kGTNd3pnDDQbdWcuC71aUCRqmRuTDgGtM/qdXHrFpRUlIZdP6DvYiO1YokcIjQT930USgu5i4OA6JC4mmcKQ/rg3C1tOz+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761587384; c=relaxed/simple;
	bh=il4gRhd27ut00qInOjSO6yj3yyOssW4RFdQ++mQEqV0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZGpzxOtHA1anaunSyPAWOgkPfGpliV3IRJ4dfxgdmlhiKMX2+/hqqORg1IlL0TP/+F0/DU5hr89ATJSrXKoRqmkE3G1NL+TRxKmlzQFbN+WfJW8g0KqF+eHvJWt+ifxNqCWuT2NNAJdoFb8Y3Y3wb59jE/idBxXXQteomMLHkuw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oMglDFk9; arc=fail smtp.client-ip=52.101.85.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oMglDFk9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V7h9Wc9to7Glu5iV421QVj6NQYICx5SCCAM6akEH2HYgjawyvNVqoJikdPXmRlQm3sd/mQLbBIii/y6QDU1q5bwUC/MOxMNMsjH43zKx+rgp+mf6PELGEtzw0eLnvXFEoGXe6wX0n+gFehT9SHLdNTID+FOt8tdHLM41GCpGr83dorG3gJJPu2rdpkVMSZp2Hu7c0TB39ZQ5VsPAzhpcrPU8vZVp2raiLdDsyowbzKW5EokF0QbbfUPUAAAnN4cu+ahfdGbRVbWvC0SdYOyb+xJf9UhqiQoduoAB0DzxgLmr53UAlLlV+rhnLbXdUSorLWU/tDpwAibkV+e+jhnaxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/8nprds+bPioKCOmIcz8QPoo1JvZclIVr7L8DQDTss=;
 b=x3RWkGwrTAcjKueXyD6FI814tLezM1E17mjRSBJ3xIkHEl/Je93/cMJvhdSaofx+xZTNLXbwm1NTMuSegZ+dzDLCQr+k+0Dp0xO2zttEZku7fUWzJ+OaAVJd3ASwTAQi+ZanPkpOdhGY09EHJ6rVhgezndJuQ4WPb9e2qjqpzIo65jpDESy/zo0lN+oRWHE33QGukW+l+VsTVQ1Of5vtDB0x15G4fTx9B4IMjFDAPCqosp2OjheHxV9C1C3ILrjcdqBirPyQxyGhc+dHvWHsqUPAViO+O0Wy6J26B6cDIx6hCmPU2d/ZMun0Md7oLdD9g5sNfrOvDhSaVqkfsuCfSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/8nprds+bPioKCOmIcz8QPoo1JvZclIVr7L8DQDTss=;
 b=oMglDFk96NgUlHc/Ojky+8cK9bO8Cgl/2ujNICeLc8dnJfYKBHehcm29+GLoX91c7fN7xHki0x2TVArefWBzylcn3P5pYOxGX2OpBEFT9bPdQinnc4TWXquWC2N/N64QXcwu0hR3gx9ZUyg4YfS+7c5NtVjAFUXFvqncTSKDUB1oGLkQTYistmZTYEWZIMu8ZCshSQZmPr0u2jUfwjSyxVn3Xzjp+1XNEiKUJX87KR1KM5YEHoN8TPp2RX8rYzwW23lY35CBEh0N5y8rm9659gSxBpkaFmYYHBE8SFWhNhviikBTH8wZbDcvz/PvXDIwlIzveiICXS13t1/mHUV2xQ==
Received: from CH2PR15CA0030.namprd15.prod.outlook.com (2603:10b6:610:51::40)
 by DM6PR12MB4338.namprd12.prod.outlook.com (2603:10b6:5:2a2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Mon, 27 Oct
 2025 17:49:38 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:51:cafe::8f) by CH2PR15CA0030.outlook.office365.com
 (2603:10b6:610:51::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Mon,
 27 Oct 2025 17:49:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Mon, 27 Oct 2025 17:49:38 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 27 Oct
 2025 10:49:20 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 27 Oct 2025 10:49:18 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>,
	<mvaralar@redhat.com>
CC: <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH 0/4] editorial: Prepare master branch for 1.4 spec release
Date: Mon, 27 Oct 2025 19:47:52 +0200
Message-ID: <20251027174756.56284-1-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|DM6PR12MB4338:EE_
X-MS-Office365-Filtering-Correlation-Id: 79288bb2-aaf2-4302-7656-08de15813332
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dQC+eioDSM2NL33gdvOtlsscSGbKROUnT6Ou9eZYAFxtTkMtxVd2elSUv20a?=
 =?us-ascii?Q?eB+8Vx45whx5wLZTuMuX07koOdfvK1xivexRvWGUjbLoRp2Ezg6irJ+k8KP5?=
 =?us-ascii?Q?ccMH6AwNToj9qfyBd0+yWifOLY06yfOLjdxBCl5sSpJzw+xMW/paa5lSCjF2?=
 =?us-ascii?Q?9CEW1Q3iBwn0DBovOiLerlxT5FHERW4m/W4SUCHOahzJ7KH+xVvwC5S93pkq?=
 =?us-ascii?Q?6htN+mJjEJXMweS8Vd/IkJ7tHEfzykQJwkmuxuHViBDnm9QmQ9lLWYtvHzFr?=
 =?us-ascii?Q?ubLifUy9YU+7Lrb527lzR0yj4Y+Rwca2szkVSWeOluhnb97Hxg0fZyu9jyPp?=
 =?us-ascii?Q?5g5XhAGRZyYslM0GthG1/9mymWAfXjxotCFjN6/jilTIDCr+9DmjwpCvpQcu?=
 =?us-ascii?Q?bECik2fpzXOpQHDvgJoC3zthWrPeqiAk0/stpYl+ibrwiyHwlqefz+iVHHnK?=
 =?us-ascii?Q?nBbzsBZZK64LR/Qb75UZA9N9Pt+CpWqtxj28as6Tjp4Yd9WUE77hyAX3HlEU?=
 =?us-ascii?Q?e8av6Kh5xl9xb1ygQ7RiW0Bz+iXKkG7k8NX2K3QmWXe0SnXOag7/fad7xp3i?=
 =?us-ascii?Q?2DGEUHabt7kDEAX6KCXh2VrkAdR/MTyMynePrDgo2LvsRiztH+pdBsOi8/Xq?=
 =?us-ascii?Q?/nMRtTeT8FdctWkqqtdP0GY46RUhkGzAQMUBAsUrwiSXqb+0i5Pa0pfLMQ5k?=
 =?us-ascii?Q?RjVZ/vTebOWsHBNXIOAonGNo9SG5sSaVAFQApybzRZJ5stBERykjBFiUHved?=
 =?us-ascii?Q?DQFi8bb/SsCuXhCCWSwGpNCLBf8rE2O69racpCn3xsXfxX9oIqWKS10kWoZG?=
 =?us-ascii?Q?Cn3KFMUQXu0F4pJo/wDoRv3+SIC7NdBrkEzo90tDrhM9D456AIbLtO8NlBHZ?=
 =?us-ascii?Q?xx5RocZIKDrhOJ8O0I6yVve9bUkFoUQCAskHcVDkqBfa2+DD75YXExypHGby?=
 =?us-ascii?Q?bJvd0kmdGQL7L1anBrPVDfR4rp88OyCj8Q4pNF5jDQBOk3V1rV6hm1P4W+9d?=
 =?us-ascii?Q?DUfO0aBoVipYZMXJpKcoKV0YQqi3kEqsS1WsGcKWK88qLQvHBr+3QPMXdD+v?=
 =?us-ascii?Q?4Ff0adPh9m2TzgjrFndqqEAJw7CyINg9pE7DzUZHQUTsnMfqbGHbHs+jKhC9?=
 =?us-ascii?Q?DoTnShwgeZIgAKuhxaXEOMuR5Yy2PMhrhF81BRP/U/6LKt7pJor9r3ojaEy/?=
 =?us-ascii?Q?nD89Uq6QtpYtclAkc/O/5tWOvyLTJcsmWBMV4u5Udw2RvosJ5zprCUzch1r/?=
 =?us-ascii?Q?wpMyuWxMy5UwjndiOg8djlllL8TI4ew8eQcOLxQ4QdCT2DT4XdGW14TOV3pC?=
 =?us-ascii?Q?duP9Kptr3JZeah0yDsF53oZgS6FCYhADVWQUp+O2TAb/s4OGxTf1UL2pHl03?=
 =?us-ascii?Q?FmATBHVa74clHQkB/aqBgjGwMLdZx4JSFDEfmF7AaQgAFz9iqU4dCF0OmSmw?=
 =?us-ascii?Q?b84Dh2j7s/6mD+TCqYFpKKEmHAe3rXavcs24/rgngVXgJO+ZErrQk4Iq89Tj?=
 =?us-ascii?Q?KNqN3AeENbN8Bs9iqpYJDYueYMBJqmUWdCCwjBRdVMtPj+2Dbwy6nRzMq9iu?=
 =?us-ascii?Q?m9pDW9a3SqNRMDChZTw=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 17:49:38.5403
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79288bb2-aaf2-4302-7656-08de15813332
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4338

Hi All,

This short series prepares the specification for release 1.4 version
from the master branch.

note:
makediffpdf.sh still have fails and needs resolution. WIP.

Parav Pandit (4):
  edit: remove old changelog
  edit: add changelog for 1.4
  edit: Remove annotation of special character
  REVISION: update to 1.4

 REVISION      |    2 +-
 REVISION-DATE |    2 +-
 cl-cs05.tex   | 2120 ++++++++++++++++++++++++++++++++++++++++
 cl-os.tex     | 2605 ++++++++++++++++++++++++-------------------------
 4 files changed, 3407 insertions(+), 1322 deletions(-)
 create mode 100644 cl-cs05.tex

-- 
2.34.1

