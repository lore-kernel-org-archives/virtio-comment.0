Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2040.outbound.protection.outlook.com [40.107.243.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41831183CA5
	for <virtio-comment@lists.linux.dev>; Sun, 20 Oct 2024 11:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729424537; cv=fail; b=qSMB040JDlING59R+PwuzQjvqkG2hZbnm68LHgwEA5hLJ9v1EhKyTilLIGrYObu6Nsf6aLBBa3+3gNwZQYgtBIG628A8fhSgnGGHuf1ZTaJhDSnTOWysY5iV0PMKkhCcd5sgP51JjFypvybsY/2VjY5dBRfACmv161iPlHavCio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729424537; c=relaxed/simple;
	bh=L+UGlRX7XixbEJ3gSbU74Y+tGTffUjKnEI4dpI8sZfE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XtGGZZNI6up0FzqE7nRk4tAJSW+mhtkOPwrBu+wGKG/35XRhrdpTzFK4QtoricdOBuPgAGfdqVlyx6gRN1Z20JAmbb9o5I84rtTuxz25XW1b1pO89BkpKsrv5U4u94Ypiv3qeo0JR+Zch0ZeDu/gmbufrl0ai/W5fzORaNXjLqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SRocCkXV; arc=fail smtp.client-ip=40.107.243.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SRocCkXV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uGnzHKQa3rb1hBuXZzZUUyhqSgc1ACy7IT2KkfIEJ701fq0VRO74aLqxB7H5eRBGmftn44nEp3Rk5aEQlhGMyc1UFubJSxvKfrqw7VJdDhpbaJsQ/4w2TGUs0fhL2XR8ePwW8ql17sLSY8uGGWqRCQaQUJtJbLlBk7ThhAYov5FCUHrG34UK2KRSNT7ngUg7Od7oT4ConeBtqI+nL4IpwyTH1UtriZhQrDtueKaU1nCgcKzOD17D7kNvWwMbLTU+AeOU+8EfxJ7MobjUCrCoOjweQUHhKrB5nlwhj50DC81muCMVnHWu1FHh1TFFbWWedLsJhBcbVKJd6IrNUemXgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SmvOglhDKk/0QGZDBDEeOf43v9evSkk4rA4vbT1EmnM=;
 b=Rn8GCZ3/9Ie6xuidP0L5tdrdJhjEDo3Y5gS3qJq+KpxVn83QX52XQsEOuMF1fWkjK06x9wc0Rspz0DwIFsNTxPJIn9AOHqzAejvNG8HmiVrmf/gFrRnJSKhK6jhLpganG8mzVVsKSEK/U/2rjxsXYOae5gyT62wZ4HyITz+c0aeQSL9Cdk2iXeb+a8eBYZDNZzSKpzIdi80KkHVNSrDv2L99aWny4jOQlItnOyXAxOqhvnifaQ21X97lPRLyIg1hVrHvDZko2494cp0/QuZd0uuaRM9u5xND75H5ueQa1rcPtQ0ukUfoGJXgn02wtXkMwPvVd6+J29ijlEepKN6UiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SmvOglhDKk/0QGZDBDEeOf43v9evSkk4rA4vbT1EmnM=;
 b=SRocCkXVdFX8skZrLArfmHsXbL1wX1Fg4WDcRrfJZPemnQUj3+1J7xNbjBU93q6rmt75GxEKL//7WYfYilU3ra9aXYINL7VkKoJ5zMZ2/4HhE6wfxhbH6pvLw+3dCBYmlv0IRJ+IB1hjagC0KR6FejqJy4/tsSF4koFXq8/Xz9l9BRHcELE8kqSI6mzdZJP+QAk79iCyCB3rtNaIOBdfoUJDZLEAyBgNQ5BAYmKaiRs4IZgKW6tQMUOKxRdOg63OpDMlLUghJe8LCI0PLtWcK+3dq4j5eGMy7g0wv10QSrU0Pfj9EoPl1ojH4M82sGt1IcgJ2+xLrf1wHFOQV9NLOg==
Received: from MN2PR16CA0046.namprd16.prod.outlook.com (2603:10b6:208:234::15)
 by CH3PR12MB8969.namprd12.prod.outlook.com (2603:10b6:610:17c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Sun, 20 Oct
 2024 11:42:09 +0000
Received: from MN1PEPF0000ECD4.namprd02.prod.outlook.com
 (2603:10b6:208:234:cafe::21) by MN2PR16CA0046.outlook.office365.com
 (2603:10b6:208:234::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28 via Frontend
 Transport; Sun, 20 Oct 2024 11:42:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MN1PEPF0000ECD4.mail.protection.outlook.com (10.167.242.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.14 via Frontend Transport; Sun, 20 Oct 2024 11:42:08 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 20 Oct
 2024 04:41:57 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sun, 20 Oct 2024 04:41:55 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>,
	<mvaralar@redhat.com>
CC: <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH v1 0/3] virtio-net: Define cvq configuration related device parts
Date: Sun, 20 Oct 2024 14:41:38 +0300
Message-ID: <20241020114141.451478-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD4:EE_|CH3PR12MB8969:EE_
X-MS-Office365-Filtering-Correlation-Id: fefba3ae-de80-411d-c3a3-08dcf0fc3af4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?92zcg4tmJ5ETGrRTCslczE7MgnidVeFaEv86EuyStlTVdlV9XNVGosOw91P9?=
 =?us-ascii?Q?7LxFJg71A3y1RsdZ9AHKaIDvmtNrDpZbuqBMeIUfd4EdiMk+Z4p0EAcz9l7n?=
 =?us-ascii?Q?a+jO7BL7yHiR8kYh43X/OCIsDmizEk/EQj8v7EO1A+hiRCyuW7RmWHKqqOkF?=
 =?us-ascii?Q?PhBxwOYaSUAi45IWrBaLe3gJVUx0VXKUPhYvy9EzJu+IOiyJ0a8TRarf2Xtp?=
 =?us-ascii?Q?/90AQCQbNjf5CpzQtACy9yFozysKt8TKpcFNjSDDM2L4ihBMShyPwgVHl6SK?=
 =?us-ascii?Q?xiUtn/sPo/7nbxxTljwTQ4Zfzh9EPcZQd9RML8QtrXsvbXCFvrNVXzbmGESg?=
 =?us-ascii?Q?goqhHfslGHUEMZL/iMTkigsx3ENfMh0PIGfg5dWPl5yXkSBU930x+QwW2FG8?=
 =?us-ascii?Q?tMRCsGrHJA6vnK3aAmZRpH+abOfL85Hxu4yV7oQRJXH3IJ2HMMQpDjFsZAK8?=
 =?us-ascii?Q?5o5yOuIA+26ykC8YtzVAz+CfWD5vC23wJViYCpgVKfGBOm6QrfQYL1mxCUhg?=
 =?us-ascii?Q?Y0DOrXXar+FqytOADKrJe2Luz5DuHwwC9+mCs3AmYG7ZjsR7iLdwSMiyoF3n?=
 =?us-ascii?Q?Yp7W2xWP8h1thg1pOEwlZnz7MVWG2RiojL4WcQo0mdDQXWFLafrc0B0B3XKD?=
 =?us-ascii?Q?FfNdeYPOVhzs8j80YSG2/u5FHn4MvThlDHdf95Enni/8emelZWYqM2bR44Nr?=
 =?us-ascii?Q?tFHTKOQ7BZ7v65lT0Eu2u1sQB1i27fRmYbyeAiqWgLpwbghaP20h48pfXa4m?=
 =?us-ascii?Q?BbImD5nVmWiPsYn2aW1HgzuU5O9uqwd9Ebk9JzzbCUT3e2UMSf7tPW9wYgLU?=
 =?us-ascii?Q?aocOhrukTTRZfrFYtzViFfQA5XOWhXWax6HuJWxQ/pvgOtvJSQ5HJJQaWaLi?=
 =?us-ascii?Q?x9UTSh/pSeIhUREEQgsHK9t5/aCqkW0X8wWdeGmAut2EXU9B70xapQm2Rv2c?=
 =?us-ascii?Q?wKB0BugmAbSnYJOgyfKolhTOp2BG1/AV6rav8zhNdEeuSFv1f6fH7SqvSMf7?=
 =?us-ascii?Q?erRHgAJ9MvLDvr2l4yNzL4NVoJr1b/oEyT0H4blRtRKLT0wGhTt3smS1PnAn?=
 =?us-ascii?Q?GBDuSYdi6qufLNeQkpybhHCrM8+/uAGmK8sZ/gcr4ZWAnq87aksk/3C8nUqt?=
 =?us-ascii?Q?Sxc5Jo3h+QRj0v1QorVgwmhd7169AAv5tbIXVf3G8ehAxa5sS3uxSyJj2Wiv?=
 =?us-ascii?Q?SyIQLRgC8QGAxjf3w28RSgRa4N+7IR6hvHte/84u94syGpOH/odOGE10lSn8?=
 =?us-ascii?Q?FcFEwg2Im3U6mQPVQ93m5ZwgycBp1PNwNC4RhmZTwy/Sa2fBVSm/uuFdPOIj?=
 =?us-ascii?Q?EFlxk8SDCqMx0VgQCvm508QoZAZzMTorKzoBfDhqxvUssUV7x8qU/7o96Wtb?=
 =?us-ascii?Q?sW+Adc0wZu3dXzkCedCrDZtsA6YdwFzBDkUpwV4ogBgr6FJOKQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2024 11:42:08.9280
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fefba3ae-de80-411d-c3a3-08dcf0fc3af4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8969

virtio net driver sends the control virtqueue commands for
device configuration. Such driver configuration is currently
not captured in the device parts.

This series adds several of such device parts which represents
the network device specific configuration.

It is done by utilizing the existing device parts structure.
A new generic selector format is added to enable device type
specific device parts.

This series also reuses the existing control virtqueue command
structures, fields, and values to define the network device parts.

Patch summary:
patch-1 fixes a duplicate part name
patch-2 adds device type specific raw selector
patch-3 defines several cvq command related device parts

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/209

---
changelog:
v0->v1:
- fixed comments from Matias
- fixed spelling of selectors
- rewrote description of selector without writing the actual
  part_type range along with description that it is device type
  specific

Parav Pandit (3):
  device-parts: editorial: Replace duplicated part type
  device-parts: Add device type specific raw selector
  virtio-net: Define cvq configuration related device parts

 device-parts.tex                 |  7 ++-
 device-types/net/description.tex | 90 ++++++++++++++++++++++++++++++++
 2 files changed, 96 insertions(+), 1 deletion(-)

-- 
2.34.1

