Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C67E56A
	for <virtio-comment@lists.linux.dev>; Mon, 16 Sep 2024 03:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726456142; cv=fail; b=qzEDhx4yBkLyC74pyh/SYSxJ7LKyz4MJ25qhsMMP82a52AetJLnUc5OyfIEM21x3qfsa5WfbZAHQqMesjG9WjmMDKff6xcDa4UgSQq5zj2r4WRsniBEPPh+0hqcPj//Z2B6AZvUSkEKqRFYbUaJwuYarss7XSamdiAIBA3IVcl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726456142; c=relaxed/simple;
	bh=E5OWkTA0dDa6CVbYpeMPCybO+1g0Ni8/SRpgf5PltKU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FIooniR7Mg6kWVKznAByJtpUVgSDmHF0H/HJb63EuhySSdNAHOuKxUmshiPSeYDvbNTMirFXBnBdtfo0Z+D+Jg86qqAqTnPTeEAWMT8S9qRSVwCvsInQENTgaVbdkl+I4as+tkzuRv8UlcETjrx8Pwc59olnA03OYIRVFP+UfD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LrI8a2hY; arc=fail smtp.client-ip=40.107.223.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LrI8a2hY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ppMXtSSJ43n6cfqT/NNvcaF3jLE4A7JYYUUVISryHCpXL74fpo2OI3YXpss8Mrh5osjJaasxZOFJcuHl8OWXmAPadN+egetd6FhB1LejbkHfl03zriqZDJaMCs8B1vGdaCZFzVoqWcbhywrfDLKn3EixQqkun4zo98F+Qhysynbzd+vJpru/WN2yMZwmHKWMpw0Qsyxrj3+DH9Aa8gixepBQe+5ZwliOQXHfJNOA3IMzPlLYl7xcuUvT1yJCNJo8ZG8vjih6lw27rSlHPFMzOQ3w5x87YIg6sh/owkvyps2tU1AgdiLcKZG80oD5P4QTKLRoS9P39wtL6sT+aElu8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9MF69L2oilWFUB8HPs9d1C/kTamulX0ur3tlRg8gsJ8=;
 b=jxhgIXMoN+6aS5VsZ4pF6+IEeIOFXa0o6+g71EqMtBUW6Mnwp2+6ErN6Zzn1n2tsyv/LOaxLsGE18yOQoayG2Tjpu4pltVv4T8nM60OSpEMQzOu/QBoAWUISHKS8nj1KzekD8VKm7VCsZIGb0y05dBNI23OdFmxw15wY5l2u6N23bmy6uIROTMLROvGZyDKPz3sdFrLE/WRnYmiEnDye45whwZZL++h+SevlRv9YM2OHGZd6L/5lHNq4AeqJRlmpjXbgt/ScbOiqf6InLDeEpN7mcu9zCQQtE/XsCVPK0T2+/6G+HJGJ+kL9PBsDjQMYp9YAaLPMfkfdCei+GIAxHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9MF69L2oilWFUB8HPs9d1C/kTamulX0ur3tlRg8gsJ8=;
 b=LrI8a2hYHojT5f8zFNwAIAT5WexENGFMCC7HO6GTB0bkxOnHQFKZXIhP07vvQOGpVEBHISFpydpjJW3cBeoMW1EAZW4Ld+gGNxDuGJIpG6EC25+A33zboKYZ3L63JongeKWkLQSB9OwT0WwGeKJG0eyctG09tqe/DaXavYNAKpR1k/R46UHeamJvQagLJav0316UGxEWPL0cETAHRtZ1OGjwL9hwgfIJmN3bb6U7pnIdQWozDQ+RRddsQJsLsIoydYRhLlo0zT5XNkmNaQvMmq5ejqurQlTBpG8K05nfCC3uRXeLLci6LsiB8iABh+IzZ2C3MH70YJbFKrLkTXeF5Q==
Received: from SN1PR12CA0063.namprd12.prod.outlook.com (2603:10b6:802:20::34)
 by SN7PR12MB7980.namprd12.prod.outlook.com (2603:10b6:806:341::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Mon, 16 Sep
 2024 03:08:56 +0000
Received: from SN1PEPF0002636B.namprd02.prod.outlook.com
 (2603:10b6:802:20:cafe::6d) by SN1PR12CA0063.outlook.office365.com
 (2603:10b6:802:20::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Mon, 16 Sep 2024 03:08:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF0002636B.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Mon, 16 Sep 2024 03:08:55 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 15 Sep
 2024 20:08:49 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sun, 15 Sep 2024 20:08:48 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH v1 0/5] Assorted editorial fixes
Date: Mon, 16 Sep 2024 06:08:30 +0300
Message-ID: <20240916030835.68178-1-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636B:EE_|SN7PR12MB7980:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ea44ff6-6140-48c1-a40c-08dcd5fce69c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tljyrNBU0KAPhUqABC5fExc7wLje3eenrWE0zrV/ZZoeTdmKz0cawce3LU7+?=
 =?us-ascii?Q?3uYwQZJrfaKo9PG0I3r/O+ZT6WvtkAwyYFu3ZhyJJmk+5wlhPSK6oDGfPOI7?=
 =?us-ascii?Q?i6G5vCYwGt2QyEzGMjD1+UNSwasO8Q4vSUYCnodCVhYtxOcmZ6jH0irB+Zb9?=
 =?us-ascii?Q?gWmF8x5mR3pAgIwqOyEFWuEBOoRenNDi/gNaDOoavaeFDkd7k5g++b5E+dOn?=
 =?us-ascii?Q?J2mZL5DZep1va0kSoZKI35IBbEDzHr7iEGKCvlik+0bn+wpZkluITyxzLsg4?=
 =?us-ascii?Q?BAzzjCebwjlsKioj6eAS0DE/ihm5N8UHOjfrnyaTGW/xDeibzlr1az/wvQ/S?=
 =?us-ascii?Q?XebrTvZJ21NcYmub54vjS0BAeFDiajSsgr4S1kBdhclvMyRlP03/N9k2NZJm?=
 =?us-ascii?Q?itEUIykLOR6/Pi3uHN7/W6zDjSSb4lx1iCxBcArc5+XMapqlKSUiix9V9+Vd?=
 =?us-ascii?Q?a14shXnMmYA2qrLJtKRqy006Rrrs48wFFMcHL/fGwgjD0yjtZ6zk+VpR8+Xy?=
 =?us-ascii?Q?/lo7GODweEGS9LScphVHKBNW/b1nZtzTbWdw7MMhlGov17qD70NScz4TxvF2?=
 =?us-ascii?Q?IitnxF3A4pF5urdlVDQlKvEPDerNb4DzA06o3lee/l1ifXOtU9g/Ol80Pt6s?=
 =?us-ascii?Q?wOJNZpPRXWOdwxdgYLqMqqv6+0cqpLwp+LYMeparV4Lj9RwiMUSkV9NIN1d1?=
 =?us-ascii?Q?Ud6Fbpjtv9AFuIU+pC6f2AcHK+hvHh71xQVSaEz5T8xPISOO6tssxr5Ck6vY?=
 =?us-ascii?Q?faWWhyeS7lPVXMTINTr98vqDrfhdWyyE8/r6Za3qX0pwAqKPDJ+qD5PQ6fN2?=
 =?us-ascii?Q?7o9jxJ9VFbNked4SH5ErpgbrWKBvNFbHWupWScyCIfifu43GUYlKDtl9kfTJ?=
 =?us-ascii?Q?kCh+xbK1r+DhPauMDKl+OynCtzlS2K7yL223oSD5QGT/ZaR/NOyfoYDW22c4?=
 =?us-ascii?Q?bPLho0TQGBYMynbx53KqEXA4C7iyGRbDhvKJj3mWA9uj1pHpgjJYzu/3Q7Qs?=
 =?us-ascii?Q?8QoR9cifQLuaNK7a8hp/fzFniiYveAAccQRAjLigq5q5FAD4oFjYzBiD+e7C?=
 =?us-ascii?Q?X42zbfI6cIz94HZNdn9Y2JVkzmqPZCrk4bLCmWoo61mebeElFUoS42Gsy0bh?=
 =?us-ascii?Q?J1OJncVS/HDevkqvPpnAId5OiG6BUZA40sB4QjXy0wsSoH1emL77UuKnDxWa?=
 =?us-ascii?Q?8UtuvBZi52puPqkGzSi+S+sa2Z8F+Z1lWBk6WXPJHP98Kvqz9CCsXkrk0c57?=
 =?us-ascii?Q?AJTj1cyw+O7cDiytR7s40rmgYHFKSloqUXELw6hEci0YcOEVuAbLHURPIbjT?=
 =?us-ascii?Q?/1i17QRPs3gCHSjzUr0kirMWg54yVfSf/4FKDyjYLQ6C8PKCYwinRPCPkqiI?=
 =?us-ascii?Q?9YIIKgE+1cavFmo9cZAQq2LkzIcvjmrvQ72gcMu1gnWWS2XreFdCSGbSaMna?=
 =?us-ascii?Q?wK59wTY5KSg=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 03:08:55.5861
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ea44ff6-6140-48c1-a40c-08dcd5fce69c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7980

This series covers assorted editorial fixes to fix name, adding missing struct 
and fix spelling errors.

changelog:
v0->v1:
- added Reviewed-by of Matias Ezequiel Vara Larsen
- added github issue link

Parav Pandit (5):
  device-parts: editorial: Add missing struct keyword
  device-parts: editorial: Fix metadata type name
  crypto: editorial: Fix spelling errors
  gpu: editorial: Fix spelling errors
  common: editorial: Fix spelling errors

 admin-cmds-device-parts.tex         |  6 +++---
 admin.tex                           |  2 +-
 content.tex                         |  4 ++--
 device-types/crypto/description.tex | 10 +++++-----
 device-types/gpu/description.tex    |  4 ++--
 5 files changed, 13 insertions(+), 13 deletions(-)

-- 
2.34.1

