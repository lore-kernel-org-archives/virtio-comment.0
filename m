Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2057.outbound.protection.outlook.com [40.107.20.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBD617B50F
	for <virtio-comment@lists.linux.dev>; Wed, 16 Apr 2025 15:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744818756; cv=fail; b=f4h0ZdDxdGFLSn/5dgdQQUbnksC08zeCaXryACG07rbHvzTkoAOUVD8oRj3ZemA5Wy9igm4JExLZb1cjcNipjpUzJreXLqWXUTZthSWkiH6c1+h5sDUxdsIkDF/q013kJzA3uqRnA+FUfSO8i6NCIzlz7WzgeEjtB/0vnsvNULI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744818756; c=relaxed/simple;
	bh=XVrcCCegYykI0zHHKZnlP0PYA1qae4PM87C1aydiTfg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=QkTx2S7kZX0oBehL6drWIuW6A+ZssYKbdcYyuKG3HCPc+FptdJzqAEdm1O5FqD3kJljrVsvydkl+L759Gy2mNMiphfdI/YsO+zavutDS5RMB0TdSUJQICeZc6738jejbslxbBdjnRZphLcXlCdCh0G8wN/ONK75JYllwwc7L4u0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=RZn1Ao0h; arc=fail smtp.client-ip=40.107.20.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="RZn1Ao0h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k6VocHVgQskrV6imTC8cL4+9PzjreC+8Kg0jI0scR5Wds7YQbd6LhANrwBsnsE7B51DS2UxS9B1LvRsuyqEUPXtjRmUxsJOGEbY26bUMp9WH2186cDaqwCHUBSnp5OoKcbRTYE7n3+Ribqf2Srpezp4/qgDmWG5f+v0PXKY2bh9g82ooPqqtfc+3EEURI4cTG1Pkip8twX7FjZyFTn+D5g0XHeVxnzVf0GO5OSm1RQtcaSrkCMCGZsfJouaYzBoQ0QnolsGT5yUMF5M7MMEIfg2XMVwn+LiJiUOD6qwN+GTHnIEABJ6tuws7TtwZBDR75yVtP2fnyjMMuuJSQT6v2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t3szJGmQ+I+u0qWi1WDrTcbXQKBFLKF7sBXcmOBUUzc=;
 b=QucOxuVljFnVunU7j3KEVm6j4funaWMWv+mWOKjvpz4dOgVkQD99ahXeSJlOzwxPhoe0sIFyqeYBU13Oi0+LGbluf1xJKUjM71Axvg2Y5z/UgyNST6bc2rsI6AVawuKlRB+A4di62q65o+H5Y2XIWLAkrOKdKYMob0ONW3zCt3LzCpSI6kYg5Ig6jJziqHXoF2L6moNsYBn8RD9Vcx8CKzX4Jm/mmTQFNOA1lEFB38Sig+0hCCFPBV0osXmojYr1xEWDSf6c+6jtIzcqiwREROv9FMNUaEr5qQ90PDVOszpeH+REJprT/rIhCSfIjTnZkmZIKRn/CuaKTL9zxzgLzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.29) smtp.rcpttodomain=apple.com smtp.mailfrom=nokia-bell-labs.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nokia-bell-labs.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t3szJGmQ+I+u0qWi1WDrTcbXQKBFLKF7sBXcmOBUUzc=;
 b=RZn1Ao0hStJ8FgiG/oq/T7fFOiXrlFAcLFDX1Qfn1JjNOqajYTsnKlU6EfA15T+v0Z1eCeMv86ny8e2AS6BbcFh2jAjKJDB6u73b6kfmOa2E3E05sk/5KhJTQ/NpHqPG8YXg3zv+ldg83/lgDQlnrCA8DYLmAl3o8O/AQCn/dPd9DFAjhuMLc5RqrJE371amPeOJXV2kCu0O2t3WggGm7nihiZn9zsZ7XPWeK+EAhpA6fGqBPJQLsn4tQnwodesiRIMucLJT4ws+mPueAGdh/qsSvzPHirwoqm7CEfwTl5mNxIzmBCYLN4StkGrHpDzGvVZtuvkgZ9mSm0LHf4aCuw==
Received: from DUZPR01CA0308.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::19) by VI1PR07MB9801.eurprd07.prod.outlook.com
 (2603:10a6:800:1d9::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Wed, 16 Apr
 2025 15:52:30 +0000
Received: from DU6PEPF0000A7E2.eurprd02.prod.outlook.com
 (2603:10a6:10:4ba:cafe::13) by DUZPR01CA0308.outlook.office365.com
 (2603:10a6:10:4ba::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.36 via Frontend Transport; Wed,
 16 Apr 2025 15:52:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.2.29)
 smtp.mailfrom=nokia-bell-labs.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nokia-bell-labs.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia-bell-labs.com
 designates 131.228.2.29 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.2.29; helo=fihe3nok0735.emea.nsn-net.net; pr=C
Received: from fihe3nok0735.emea.nsn-net.net (131.228.2.29) by
 DU6PEPF0000A7E2.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12 via
 Frontend Transport; Wed, 16 Apr 2025 15:52:30 +0000
Received: from sarah.nbl.nsn-rdnet.net (sarah.nbl.nsn-rdnet.net [10.0.73.150])
	by fihe3nok0735.emea.nsn-net.net (Postfix) with ESMTP id 511E52080E;
	Wed, 16 Apr 2025 18:52:29 +0300 (EEST)
From: chia-yu.chang@nokia-bell-labs.com
To: virtio-comment@lists.linux.dev,
	mst@redhat.com,
	cohuck@redhat.com,
	mvaralar@redhat.com,
	jasowang@redhat.com,
	xuanzhuo@linux.alibaba.com,
	eperezma@redhat.com,
	ij@kernel.org,
	ncardwell@google.com,
	koen.de_schepper@nokia-bell-labs.com,
	g.white@cablelabs.com,
	vidhi_goel@apple.com,
	ingemar.s.johansson@ericsson.com,
	mirja.kuehlewind@ericsson.com
Cc: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
Subject: [PATCH v1 0/1] Update ECN feature
Date: Wed, 16 Apr 2025 17:52:22 +0200
Message-Id: <20250416155223.16422-1-chia-yu.chang@nokia-bell-labs.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E2:EE_|VI1PR07MB9801:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0513b1bd-a098-4269-e9e5-08dd7cfeb1dc
X-LD-Processed: 5d471751-9675-428d-917b-70f44f9630b0,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|36860700013|376014|82310400026|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?6BbZ8bsZN2BJOYS+kwabsFw4stmhx489HTdBr28m4ilJaDQdnhahiOtU9QLA?=
 =?us-ascii?Q?z5iAoHD2sIFv4d60CRJgwXsi+KOQzsg3JkA6BS6eRoftYUltT8ojxigAGfbp?=
 =?us-ascii?Q?6qSFYRKfLfeWjy/uq6OOOnuisn5Do0cqCrEqSj1LGkjqm/Sbg36ugy0QEGOX?=
 =?us-ascii?Q?RVCuAKiR9oRfwQzQdkshabxO3N9r+4fOIAFQQUV6z4YO8Op89qi5Qa+j8Bak?=
 =?us-ascii?Q?w6H6mHUjsAk9bvW8/eAWhsVpY1tIroJyBvYKT9HqhbGJEhuEC6injqSM8RUu?=
 =?us-ascii?Q?0MFPb0aGr+1A3jHPDOZbRJYm50Bp6ngKluEI9kZNs8KpaR8TmvLwP/BQS6eB?=
 =?us-ascii?Q?ap4YEs9U4SdX9AmK4pJ/KEs/tFTQdCW0SI2zlw+Wly0IjfY0ll9no5izzAGL?=
 =?us-ascii?Q?x/NCthQqI01mnVoyaXRYJgg2MnEJw+0ySKsoRy//RUyi6+h6QlZ8RJHls68A?=
 =?us-ascii?Q?76eeWvzv8Boe7d3BJ0m2F25VC/bHq6K8GZRUybESg8+KqT3tnt29jMclwQcL?=
 =?us-ascii?Q?DiJjolOV5Z0Mq0kBXK6L2jNPeT+4ECVkzWYIc4cKeWLa3005ZPwcEVw7oink?=
 =?us-ascii?Q?wsYKsL4vEjzfzUuacGN4TgROLOjacrmED3qZkrdtGqbWkm/GKDy2z7IP+Ts8?=
 =?us-ascii?Q?Qy1vfS27YhmnFlUV3YtA+Zfb8t93qCsLn7by4Un8Cffr3RJc+KqtTwVF4N4W?=
 =?us-ascii?Q?IANCoNH/SCIfAgwJKk/a4TtmrAQHYb0Lug4nYn6zMX4UjZXka/xrTnnggtaR?=
 =?us-ascii?Q?sWaf4raBYw60opIyJ33JHMzlOxPYDVhPVHQZZ3hQAsKC5Odz23Fth1kzu3LK?=
 =?us-ascii?Q?vhRc6iLImaDxJtnarWJ9Lq5vjxpfwOaeKpjY9Ta0LO3CyNs59fla4Ugk958y?=
 =?us-ascii?Q?WpRO97tucvWG70jBvEd46b+JMn0NWtN5AHs/BxGtjc+W9XRKKGOBvnGYMu4J?=
 =?us-ascii?Q?sddHvY/yvJBFm9ysUFxA+cjou7KxzwTHIHUWZCu8O6lNMKjJn+mWvvJnIpQB?=
 =?us-ascii?Q?5opS1M7S9aS+4KFCF4+3EgwIWxVMwsLaAoUTNLxLEWDxHqrAjsA/WumxohqI?=
 =?us-ascii?Q?zp4SkHKivLgRQP3Qj28/Ya9hKN87U8DBpG0gy+ZbFDoHJHG4raJrKrCH/Mfn?=
 =?us-ascii?Q?sBRIapYN8KcL+ffTh/2vlGuidEZ8XCuT9Dw/prknXdMSDW3HSoW/S8pcUIKT?=
 =?us-ascii?Q?kCn+0GgB6naVb0ws//3sH0JeAds0HtsHCFO5NJ1e2gBPr1bxf38gy4O7jORw?=
 =?us-ascii?Q?IDSr0FPLms9CylNC4XNJ6L2IOqjzDKPeWtGQPOQRtOagnxq6rFbG9Dlfnk0u?=
 =?us-ascii?Q?F330qsdCbjiXWcesrwwu0f2YjB4FFHnrFYij1D7HbM4QcfFo1zB5OVEZXXGr?=
 =?us-ascii?Q?01q7EFrn3Jzvgl+bZiTwzrnQKwCi4mNaGoL++WN/8YbFMEVR0Y/J17k0PUkS?=
 =?us-ascii?Q?T0+GJdMYWYDqtwfILkDIiQVZvmvhTLtpUkv1TbPraIRiwNiYemsb0OP1tMVo?=
 =?us-ascii?Q?mMKjcwVWGbL9BITC8Of4cZGcLVLMwYrYErsv9v+s2HaZXhxF/BZYlEjcLg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:131.228.2.29;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe3nok0735.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700013)(376014)(82310400026)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 15:52:30.3123
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0513b1bd-a098-4269-e9e5-08dd7cfeb1dc
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.29];Helo=[fihe3nok0735.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7E2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB9801

From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

Hello,

  Please find ECN feature patch v1:

v1 (16-Apr-2025)
- Backport ECN patch to master branch

Best Regards,
Chia-Yu

Chia-Yu Chang (1):
  virtio-net: Fix ECN feature descritpion

 device-types/net/description.tex | 33 +++++++++++++++++---------------
 introduction.tex                 |  3 +++
 2 files changed, 21 insertions(+), 15 deletions(-)

-- 
2.34.1

