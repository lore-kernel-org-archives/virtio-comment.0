Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2068.outbound.protection.outlook.com [40.107.220.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D922A22E3F7
	for <virtio-comment@lists.linux.dev>; Mon, 23 Jun 2025 08:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750667817; cv=fail; b=GDhrW35fOcLgB9JDfnGwPs3xc1b5JBH1lE0JYvCLJQC5fvbZi3Vndzu11AMa7fHAdG9ebzErgRwZyuvp7po9MKRXvVhEiL9LOXEAG6MY+Rr29iyNx9uTZsZddM6nnzKGaAmQfNtrYoCXabWl1nBYJzoaf77ArmEYYQPaoCXvWSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750667817; c=relaxed/simple;
	bh=dAGL5uXyEAyCUzhdo0O9R13zhHLkKFTOxMmPUeQNVCw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=q7Dth5PTQX1rolHyZDoYWEqvB6p4UpvqXIGJRh97LWQNkLhZY7/gC561GZ6Zip4Mnx7YVnn0hBpKQDNrzr1LADFFB+Krwu5VinCEujfy2tMCh9NBPWAeMMzaSU995rrytCmqO/vsJYffuTuC/VyQatDhCtWc/cFbbg9fzzqlgXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=N49W3SGP; arc=fail smtp.client-ip=40.107.220.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="N49W3SGP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AMB9QEZa6IlFHajw6K8Ac6ZZB2dotmaMpuipu4nQzZ+NaQyBo/9wUU0PpdzPNqH+F/RfrfwjLTf8ofKVQX3GFN3oWPdXqok2Zen46fkxwyN+7QYgNYVY/brGy/6QzUaTxBuN/AIjjZcFZNqR9KJyGPz8nbT/7x6OOFk/ydv7ei4DWoJfygcB75ismQAeQwQyTX3IbTejWMboSm54hJXyhc+TONjJqr8tv/5Rr/PGJ/RDRGOi74qOifDhhFqJkfeY/Ul1GyBwv43eImLjS46fwt+o0Q2JmTIztlzNIPYExFa8dnRPq4hvgH85e2O7YXESHDqDHzbzTTHiQeeDCvbT8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FwI5MrUNoBstNTu0TDkXWcJc9+vJnPVDBjej6hoR72A=;
 b=xn8hDQzDm84MHMnBllDGs3o2CYApOQGc/vQ1Q2nmx3y/PLdyaK6xQKftHUOE765exc+iGP1C5J0dzW7gkE9n/whT6k7F84bjJ6X8EpToC1hXKOVHk7IhXqMOB3da2/FSQ79Gwsoo+7LUnJkQuM/KadG7j6Oe/pNTsVq0CAB+984i8KA7lXqVMNdRzgLeKsGZGZ6ytQoSjfMo0baGWpI3qSSZMTsYwdX7l6CVXIw4bUN2U6PyaT/FiwJyEBqAoOkQFeRdfbSQQ9dUKQFytaqh2yaCGJqvXZjpR/meVUx85L69sdWlufmXSjJO1NGTIceJzloQ1zpDtQvSo8LOp1Quqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FwI5MrUNoBstNTu0TDkXWcJc9+vJnPVDBjej6hoR72A=;
 b=N49W3SGPJYWw9XPr/o5GdfTu2KGw8YaRTDNVDImMJOCQrVaNUcp9yoUX+yuv4bNRgngT9aLO/vAvHqyG46wbHNtbVmXplXEh4MMo2sFEWa8fWBUhxRtUkNiNOTZ4WrQMRd8k7USkT3MKYD0z8qweLvsJg9igpNq96vtS+WIboaI=
Received: from PH7PR03CA0018.namprd03.prod.outlook.com (2603:10b6:510:339::15)
 by CYYPR12MB8655.namprd12.prod.outlook.com (2603:10b6:930:c4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Mon, 23 Jun
 2025 08:36:53 +0000
Received: from CY4PEPF0000E9D1.namprd03.prod.outlook.com
 (2603:10b6:510:339:cafe::69) by PH7PR03CA0018.outlook.office365.com
 (2603:10b6:510:339::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.29 via Frontend Transport; Mon,
 23 Jun 2025 08:36:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D1.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Mon, 23 Jun 2025 08:36:52 +0000
Received: from fedora.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Jun
 2025 03:36:50 -0500
From: Zhu Lingshan <lingshan.zhu@amd.com>
To: <mst@redhat.com>, <cohuck@redhat.com>, <jasowang@redhat.com>
CC: <virtio-comment@lists.linux.dev>, <Ray.Huang@amd.com>, Zhu Lingshan
	<lingshan.zhu@amd.com>
Subject: [PATCH v3 0/3] Implement virtio SUSPEND and RESUME feature
Date: Mon, 23 Jun 2025 16:36:34 +0800
Message-ID: <20250623083637.296041-1-lingshan.zhu@amd.com>
X-Mailer: git-send-email 2.49.0
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D1:EE_|CYYPR12MB8655:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d9a0a37-f447-4669-4af0-08ddb2311aa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?t+fo926jiUrbLPdivVNNklFrY8aRRndMZ9b1qZeM4fSZdVRgczmh1KH7Shwv?=
 =?us-ascii?Q?aKekQJAHSV5eF89+07O67ELzmTG1PXHawK4+cOby1Kax6Gi2VqvTC486V3aQ?=
 =?us-ascii?Q?RO5PMJUN29aQrZZoMwS6T0Ba7P/28G2ijr6WxGrssZliM/kpoFyrRXFdKoRl?=
 =?us-ascii?Q?2DII0gnJpC5WyMaMIGfuoXjl6zS1hanFGBgfgey5wHxK3g0GYO0Pbxjm261a?=
 =?us-ascii?Q?xrSx/ZvYQKNxUZNTTKaEfoGbeLoV1Uznz9XpBHg7n1/7gKTWDdZNubrywpi9?=
 =?us-ascii?Q?NqaS1zH3gwOGVDZXq57V3EOCoCY6ZoIqxHCqn0Brvc/7IEKEHUxHwnfknkl0?=
 =?us-ascii?Q?Qlqwl0pcFzrKw4C9LRMKmMAOTj6XLpHYkp84zxrfQOYzTrES15i7cpxTpcVa?=
 =?us-ascii?Q?28GGCIWFn7jNo02pyWixxLtmtLoSe3+AFJ0YDocS4e3GMetTlaFCHADdF/x1?=
 =?us-ascii?Q?XEFpaUyHvqiuQ3rrCw1lrtp+40X95Y+x2bGVHr4HPB1alHppp6f+ov7Vof7A?=
 =?us-ascii?Q?vnSheWI5fMYsnRoEwP7YFM5iirkEhZhhv9+aROhqjNLZokX9GBuzWqjJ1k5F?=
 =?us-ascii?Q?YkAozbnrL49GXHAvjcL6SQPX8ePKSw/gGry8q3hY3kPKKPMEpzG6XBqRHiyK?=
 =?us-ascii?Q?p733jrrSxZXPZHrZx0Ka09JmFP6QQxSW5lhObAHCxci+HnSd73yMYZDVhVyo?=
 =?us-ascii?Q?JIF6GnpE4bpGwaDZP+MV6PmmYWuW75fCictG2+ffEGC2tXl5MtHTaSwBzQYq?=
 =?us-ascii?Q?M9PvExP9y8vmQcaO29Yty/7UcJMnXWkmaIClfJu4lsO9+KgP9a+ix37H8vVV?=
 =?us-ascii?Q?MXRoY7O/NJrwn0HYOl/8W/vBiEP0VcISS2NCGRmt3rfdPqQ36/AEZdxN4kdv?=
 =?us-ascii?Q?nmcLHsYG6g620dboGTnwF6e24QMMClx84m/2okrthhFJCZFG///5GeMn/PKi?=
 =?us-ascii?Q?iGJSmAZzW7FsnOGnEdbDOgQ1+GqPeMviPfqlM06eaZZ4ZxYdisEV9kcyhs6j?=
 =?us-ascii?Q?IaUPJc5fwYFhz6gRgNkfq3sjk9nTnIDyw1YT+Y8Ve3K88lJ1+7UQq9fZ1VOi?=
 =?us-ascii?Q?e+zrrzCP3ChvQhNtGH5tVgp+6Or7pONCNMW9vueEnONjCUqYmJ2y2N0braGk?=
 =?us-ascii?Q?Tl+6zRMgLXTe/oHiZNZhnbP3r0GKCwbvtaGkuP2Pq40+oL+dHPzaETta1ARG?=
 =?us-ascii?Q?oERw+/7LtnBa4aafOMBmmkp3D0ILe6azWqawe7PN9/sXmedT01e9dRl/uUMj?=
 =?us-ascii?Q?8/nV0qf4TSVLGWmAlCcc9BmRKsUZT8AB1YN20b0doviQLQj1RVZBXYX6jH0H?=
 =?us-ascii?Q?Sx53A9k9bngsf7HyKfcGgqC0WXjIQyPlGujhq5YSTkCgc7jJ1/fi/oWYgXuf?=
 =?us-ascii?Q?2RZZxxlpzWco3ChMMA24Xu8yHaDsuyTKba8jgyPJ/GQzU+0UGNtwPEkwamQl?=
 =?us-ascii?Q?me2cG3qZxZsCU665ZDgDf7tOQinMiXcxOoq3xqsdTCvkFcTAW8Yx3H7lIbLi?=
 =?us-ascii?Q?YHgWlP11asRlPKk6aeLvyi9NArS4N3EScEHm?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 08:36:52.5780
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d9a0a37-f447-4669-4af0-08ddb2311aa5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8655

This series implements SUSPEND and RESUME feature
for virtio devices. This feature could be used
to perform live migration or take snapshots
of the devices.

This series re-orders the device status
bits, and documents feature bit 42.

Github issue link:
https://github.com/oasis-tcs/virtio-spec/issues/229

Zhu Lingshan (3):
  virtio: re-order device status bits
  virtio: document feature bit 42
  virtio: introduce SUSPEND and RESUME feature

 content.tex | 71 +++++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 63 insertions(+), 8 deletions(-)

-- 
2.49.0

