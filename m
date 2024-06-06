Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DB4194AE1
	for <virtio-comment@lists.linux.dev>; Thu,  6 Jun 2024 10:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717669249; cv=fail; b=jJoutXun1z6TmeFwm9GpYqyXFAINS3y3YZg1TBRXuA01j2yk1cPJkMuM0HGUDW6wIKZDpF+uzrUhFCgvKs7xyyyaoIePsbgOslTsNc92aYYAN44BeKQHYJ+ZnBa8v8UPvyMYqZ4B8KjUJfp59PDaRuQK4i2+2QvJ2EI7Bs2E8Uk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717669249; c=relaxed/simple;
	bh=fNhiHZVaqdr/9YAlv7JbBcfWFLI2NpVCggSxhc3HOmI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=E9ia2eU1A6TqVE3WydBIH4pz5/nfDRPJNcH0a7vUMZYpIWYsV23XFlflIR/EcKgjmHAHSG2pCfgI0ANS/D+O81X77t0VOq0WIa+wGZgAjnhkdMFpJQjg/rwZX+7vCTT7PC8KDxcLdSEsX/IHuEyLRSBzdh2QL1UAClgteJoZJuI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=l3JSW2Y3; arc=fail smtp.client-ip=40.107.243.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="l3JSW2Y3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YQ2084JGZsmSnnk1LmN4D1UoyxWZmOiynKw9oNxRpoVEloyFo/LGA8O7ShWcyhw3sEI8nANxM5IbccDp0JBTyB0F+7AHrUiUocDstvBB/BXWQyeSTUM/A0uzlXNIiwMvz2RciyTYDOEnOX+Foi6Kk4Sc5+TnurZM1TDsb3FkO1ORAJP9VohgUaxuWoO9ERHg8Tzj98Jwqzj80lpzarLS77Opx7sm6ND2Rlc1vzrbBy7p5iRWEdiKTzWLFX6IypQJ8JcPVud4X9RFY4E39/l1ZgL5xuz1lQiUsmwYmUXsawKrcB2K94Sw5PdQqr0lrK3Y11rel52u/j6EGA/+RZSMfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQQUeR7qvBmU1zAGU5NFUCvFeNhQhRncFVsgzcGUpBo=;
 b=KHZe92N0N1UDLI6lhBmL7dFG9YHwOucFpbsZ6zMOefHJ4TS57ZU/i8p5a9FGU3Shs9/AWOhjioLmkOHqbLfEP+KdJs3eKCv5QTXn32+QqqtEtC6QTUcpLAM4TVzfH+w28jh+D6UvpAkTYEVSnPl5pSL/voY/Gz4GyZf3KH0QYWUZ51j/wBvAQa9BY/ymmIFtzUnZcD3KXhdKOCxmRWf9kEamDVsdloew8i1+M0M0gem3fqjpEi7s/ezCFCx1SCrYgXO3RgRzEhvc5AkStooQKS78fZHsKgeWfKsHhx3kYhn4FSWMYRisIFaF9ohfzqkWNMGDXJyNNnaPXiPdhhBrYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQQUeR7qvBmU1zAGU5NFUCvFeNhQhRncFVsgzcGUpBo=;
 b=l3JSW2Y39wQXHw0a6+SRxk59Ug1q193+jQLKfZSuiH/7IW90Is3fHteXE/sgB5M4TUYfrKU2d6hTXscznYW7zDLnRJHPq/Gvih5XOJWWcoOrwVuPpojayvWdkLYfS2wfQuUS8Y+I3rr+uQrtpnJtF3NjoQzIrxJ5+DyoqtA7lLd6x1iouAObPuFNe+Z1KNC7L90nc9bKK1vrdPBU4VfJmgQno/Kq+ZhED0ID/CHEApZHsrCkD9nWkCqya5rL0hpbpLW8UlxELYRyEr8t74/F6ipgEb8BeO3ZFCu/75qCPPd4AvtiOz+aevlkuM4ekTaS4q0TBXQYPWSXFnchs3XP/w==
Received: from DM6PR06CA0031.namprd06.prod.outlook.com (2603:10b6:5:120::44)
 by SN7PR12MB7251.namprd12.prod.outlook.com (2603:10b6:806:2ab::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Thu, 6 Jun
 2024 10:20:45 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:5:120:cafe::66) by DM6PR06CA0031.outlook.office365.com
 (2603:10b6:5:120::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.20 via Frontend
 Transport; Thu, 6 Jun 2024 10:20:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Thu, 6 Jun 2024 10:20:44 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 6 Jun 2024
 03:20:30 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 6 Jun 2024 03:20:28 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <shahafs@nvidia.com>, <xuanzhuo@linux.alibaba.com>,
	<yuri.benditovich@daynix.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH v6 0/3] virtio-net: Clarify virtio_net_hdr size and rx buffer size
Date: Thu, 6 Jun 2024 13:20:11 +0300
Message-ID: <20240606102014.2103986-1-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|SN7PR12MB7251:EE_
X-MS-Office365-Filtering-Correlation-Id: 89986387-a213-434d-74f5-08dc861253a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|376005|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/fryJ/e3bSOYmcKicWqKvV0PlJoDB4DEV9YP59GUfhlgu1PmZfVtwhDBvF43?=
 =?us-ascii?Q?EIllh/R230RWg0UMqJO4nfC1XOeY97ifZEULQcdb88aCcE0wHiAufyqSt7+9?=
 =?us-ascii?Q?/7ZNHSuTV5mKffZAALS5kho/izd59q5Xz8mUhVWsNF2IykyHwk8lxYeNOmOL?=
 =?us-ascii?Q?wVjNnXGECk0PmsDVumeQ3+7aDUUIo1U8OoUNqdovyFmNgQUjXxa/VV8VD1vx?=
 =?us-ascii?Q?7n/et1J3kD6Mmd2+2mWPRPhs0oAhMMnxOvWVC3OykvONnxstXGFMjTcb1G9I?=
 =?us-ascii?Q?NVN15bt3RQpCpQJIDjRCTpDvmC26lOS3cSvao2OOjE1yV1ldDLo3q2U4qRnl?=
 =?us-ascii?Q?STSR2uKh++mszl6i2dPyLDzA7/i3d8LGTYiy26yk2GpqFzttFRU11+rXACiU?=
 =?us-ascii?Q?HCXQjbgcZUqc0OZoWXq39wAR4caW1HCyKP06XGWd5unDOtqOlttXer3biY0V?=
 =?us-ascii?Q?oSu2PwAV2W6/m6M9442n4F9hexjO22AKHp92wai6Vee24z0T2CqZio4HQ4HL?=
 =?us-ascii?Q?9XyRt/GUYnV2U9hYYsJ56c9Iz5X7AJVH48m3yxWAme7jazD72R2xPRg84xyB?=
 =?us-ascii?Q?ZeVF2EWTgzqzJ7Ld9XN2ktfVV0/jFADV6eOcaSmLEf3/HM+MkYqhwRlR11OB?=
 =?us-ascii?Q?+s10GXzbAcSQqHKtiFBH8PNcCxka04pQLfqTR1zd4BJfaeov8cdJTdIu2E/X?=
 =?us-ascii?Q?uZ1wHa6Gtcy4bkSp5xrl6Zw7Ou0WL0xyviGUNiNnkhOPwXa5h3ifnlamLgpp?=
 =?us-ascii?Q?YqHXjsKCN5Vda3W+Rkw61vjd/pvuAbmxARqB4At2avNPMR0a1FZokqR294wP?=
 =?us-ascii?Q?W5wEB+KT+sSWDfTkku7gUDqTqngZqj2bN3xNXQNuTSaFxgbODlYrQ4zn0fnK?=
 =?us-ascii?Q?LzRbxR9BFtfLTtSIl1rsHzJogfnN3iacf3gvCrfkW9DAD2on/YuG7Csq8DdO?=
 =?us-ascii?Q?1en6P/L4JqZl9H+bABRIr29x79NK0owol8daxR6YKQYcp13fb3kfieFNMPuf?=
 =?us-ascii?Q?HFwGCVlSp0f2obxl1NtW5tVffifgdK42mb7U6XwoHAppm+LeBMxHtLp3VEQ5?=
 =?us-ascii?Q?r86uDnBbAUhEISI5myenF6Lj4VZxil1gV1K2oQrYtEVjcWf/crm+BTBatURL?=
 =?us-ascii?Q?gCysLYN1fCUSRagt+S0Sg1g27xMch+kluY4hHG2o6rd9vma9fZD0lQGQAmUP?=
 =?us-ascii?Q?aMFQFp31jNaeyD8fpEH7xD/YG5DIRWJGrz72Nvv65LQ7i5mgTwCdDuhVgwx4?=
 =?us-ascii?Q?7pn+aGBZD1kZKEt+w6TJYj/argFa5KwMS1G4AdGfVe7s23qlTn0OyFB0aKzh?=
 =?us-ascii?Q?qqW9j2ljL5GYhThKtDj4d76fUBLOG3vXHAn/f81PpFBiZeATsBXTX76HAVyv?=
 =?us-ascii?Q?a/zafKY/ocVG0ZZc8abisbYNjVPq+uKuOdMwLc7yAIFzDpBlFA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(36860700004)(376005)(1800799015)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 10:20:44.9378
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89986387-a213-434d-74f5-08dc861253a7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7251

There are few small issues around size of receive buffer and size of the
struct virtio_net_hdr as following.

1. VIRTIO_NET_F_HASH_REPORT is only applicable on the rx side processing.
   However it changes the size of the struct virtio_net_hdr for the tx side
   as well. This was not clarified when VIRTIO_NET_F_HASH_REPORT feature was
   introduced.

2. Receive buffer size calculation description and requirements did not
   reflect negotiation of VIRTIO_NET_F_HASH_REPORT.

3. Receive buffer size calculation was incorrect for ipv6 guest gso feature.

Above issue 2 was reported in [1].
Since issue 2 and 3 both touches the same set of requirements and description,
they are updated under a new issue along with tx side fix as well touching the
clarification needed for VIRTIO_NET_F_HASH_REPORT.

Hence above three issues are fixed under issue of [2].

Patch summary:
patch-1 fixes receive side description and requirement
patch-2 adds transmit side clarification for VIRTIO_NET_F_HASH_REPORT
patch-3 to fix virtio_net_hdr annotation

changelog:
v5->v6:
- addressed comments from Michael and Xuan to change 'must' to 'MUST'
v4->v5:
- added vnet hdr structure annotation patch
v3->v4:
- addressed comments from Cornelia
- rephrase for virtio_net_hdr size calculation
v2->v3:
- addressed comments from Cornelia and Xuan
- added virtio_net_hdr inclusion description in buffer size calculation text
- rephrase tx to refer to the rx side virtio_net_hdr consideration
- addressed comments from Xuan
- replaced 'field' with 'structure'
v1->v2:
- addressed comments from Cornelia
- rephrase buffer size wording without explicit length of virtio_net_hdr
  at 3 places.
- replaced otherwise to ', otherwise'
- rephrase non normative to write as driver normative
v0->v1:
- addressed comments from Xuan to rewrite tx normative

Parav Pandit (3):
  virtio-net: Fix receive buffer size calculation text
  virtio-net: Clarify the size of the struct virtio_net_hdr for tx
  virtio-net: Annotate virtio_net_hdr as field

 device-types/net/description.tex | 37 ++++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 11 deletions(-)

-- 
2.34.1

