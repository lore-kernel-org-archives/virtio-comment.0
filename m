Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2066.outbound.protection.outlook.com [40.107.94.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F1E29413
	for <virtio-comment@lists.linux.dev>; Wed, 12 Jun 2024 07:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718177761; cv=fail; b=scxBtgBjd0ME1aKPxMlzCyibFTJK0gwjzuVxEpVE9kFXncCStWLMO056LaUlTcuEtmGtnSgt7rWVUU9bktBuGfVdWzjbLgYInwdVoUl/7qkgnnqSOHh78C2zCiflfxqmfwMFpqd/nbNmPZr9hm3JOnKbti7vz/xi+NU1VNYzMqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718177761; c=relaxed/simple;
	bh=seQ9bcvczx+vZI92GVY9O/j/1jgrOHeuOxxYfQpiYE4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Dxmj36twKnbLUEIX67oWCJHYtP/96Ud6sLo5CtS//2EJ8CD/g2pufK+PT0KVBzAxk4iZ1GAHn3iI4wuAvUnFZfDQTemej3MT3+m3u9TtUAb11Oc0bjU6pZWqVbBouE63ZAyBlmv/ZYasZhpWhBlQrOiE41D9rwSSBnGSZk12ZYU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YRpVTm2g; arc=fail smtp.client-ip=40.107.94.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YRpVTm2g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kpbjLhruUqQqOda709Md68m8LGN38zE9M28NnnHuOxilnAAvDglPHSWU0ZDQ8Wxmik0DQnNbmy5edAUJZVYCcFZg9noe8bcww7Oj97hD+eN1+B5kMuIhIpnjcj6rJstc4Cnol063F12DH9n6toy8QCli+ux/srzUXxTQa7mdeYsI6OdMVnuHXhifGHGrB6w3ka8IYndnnC6nGhqjFffSvYxwBsi8Riz0De3tZqfTrlVBjj7AepsHEpkVvNFaF4r9GjGAKPXLx9Q0zMBVhLGbr7gjr1e1n2clvMrUdMcf9HeftkrK8vpLaSw6B6WdCtXXwmATkLuTyVGNKhKW2Mb8Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4VXGkzNO4zDfnjJ6r/xP8guChpXXmWC8J6FcXJDn3Dg=;
 b=ErkBbtvcKJ4m39RVKydVhEeLeS5lI3y2PFPz1/9+qo7zhI98VMh/j2bJQP753Iqa1BpUdrDMBq2ohN7lqZhy8KQfuAE1Waha7WtF5PJp8ieaUaEK5NpX08Wy/QWMcX+RNw5BDuOrB7LwczOi3ycUpFbGWCKHizOy7nRhUdeE41fnPrU1b0dfPRU+HLQ0HjSlL2hD8m3p32q56mUhn7pf8EdfmzdtAt93ZL1pvJ+/sy+GpFmHQDdSrnRlLW0aF9ZLR8m04Hx2iWm6S+gVyJ15O+7hzPXJEYpucrMjrA0eT1LqQzqUUvXEw9ZVz2AFraDT0enWq6+ILBBylhjioSHIQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4VXGkzNO4zDfnjJ6r/xP8guChpXXmWC8J6FcXJDn3Dg=;
 b=YRpVTm2g1pkJN9tNOXWI4mGKDLr0NZfodTu1vXL6CS62qo2lx9ghLg6h7fj7GxAPpqCRQeqLNu/eumQo2nOEdxnXOutG6cqpuG0nUqF5N4BnZjbL0k/wxH9AktYRFzGYEQlKXqGsLpEsTWVg7pT/Y92MSguJttrRK0LHMwmGQI6Q9V2R4XMsLf8eRDYiRYQvxjS6C728cxSkLXX+nlf73KidjRp844dZANJBvbU+XQxe4DymRP+vQAynq8VB8PNngQTmT6fPIm67TuJYdsKG6Ltk1HXSjLXcMksi9tgOdBbrO5hgw0p6BOG3J3iDVjmoE5JRS/fKguYnXd2b835/Zw==
Received: from BY3PR03CA0014.namprd03.prod.outlook.com (2603:10b6:a03:39a::19)
 by CH3PR12MB7546.namprd12.prod.outlook.com (2603:10b6:610:149::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Wed, 12 Jun
 2024 07:35:57 +0000
Received: from CO1PEPF000075F4.namprd03.prod.outlook.com
 (2603:10b6:a03:39a:cafe::9c) by BY3PR03CA0014.outlook.office365.com
 (2603:10b6:a03:39a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.20 via Frontend
 Transport; Wed, 12 Jun 2024 07:35:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000075F4.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Wed, 12 Jun 2024 07:35:56 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 12 Jun
 2024 00:35:40 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Wed, 12 Jun 2024 00:35:38 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: Parav Pandit <parav@nvidia.com>
Subject: [PATCH v1] Add link for the feature bits section
Date: Wed, 12 Jun 2024 10:35:22 +0300
Message-ID: <20240612073522.2571082-1-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F4:EE_|CH3PR12MB7546:EE_
X-MS-Office365-Filtering-Correlation-Id: e8c20411-fe88-4f4d-a2fe-08dc8ab24c13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230032|82310400018|36860700005|376006|1800799016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?J9V5f7C57XePCT0qxKkkIp3DffVXYbV/yWiKA0lEF1Ewra9DYrJh1Y4wY41L?=
 =?us-ascii?Q?s+UQEWZ5Bqk3GgHtc3mLcAAdU9k6GoRDzA8Bl++ThX71Zoxnd2HAlw+sSwQX?=
 =?us-ascii?Q?onoCNN80FwOsr38OpRZCvjcFRjPHyprcRFECyZTg+a97gBItP4Nxla66Vwgw?=
 =?us-ascii?Q?wvkY2bo7DatB9o1HISmt72lHlBc8Gfe1SLQJt3Kv3lDuhqq/amFfbZnIUkh7?=
 =?us-ascii?Q?p3/z6meFrTSFoQTbFb/cNS/LE+L/LSTni3Ok7MmxwkAaai9UFdDWGSPSnkQC?=
 =?us-ascii?Q?CDjHP0AUUIHdaaag3h5htsiKxQBSYlQ/3/8C+qw7oWrSravQnSq15LKgqNuN?=
 =?us-ascii?Q?vD3q5ry8Y3mXOemnraZQ5BEWLBbx1i79uOBcZbhXhyYnWyMhNSiTlH7InIuA?=
 =?us-ascii?Q?QT+OjJKQQZJ2lkiUF0nuxu0VuBXfnlKFoaXkf9qICSQuo7Vv3lzpc6sCu4or?=
 =?us-ascii?Q?pDpJopKRpQ84jWfXHpm4n1/Bfl+EyIla3aYg+t8oGERA3xCfT1ZtoBfkpNBE?=
 =?us-ascii?Q?8CvukjVa/mxI+g510N4sPj+6CdEUxigTWZCDYVWscV0I53ixvDtyeFrNubfZ?=
 =?us-ascii?Q?c7UJqlGr3b1Vg9brocZucdkfgpiYwJ14JGysD0k+EushoWOosd0LW5ngmbX3?=
 =?us-ascii?Q?28UyzyPlK5bXo419oFOCyzaeM7RGxWmnneh6Cxi9QEkVcbRGSBSnAFVwml7a?=
 =?us-ascii?Q?kN+LpFpLQonR9joFaOpZM6gFUkSEK0t/bY6B0IY/rTRrOPgtvWbUjmxGR70c?=
 =?us-ascii?Q?NvYU5PatFuqe4H/EZa3kaNsfVLwHuUMl7ZvxhPm5hxhnCuz9MbOQ3bzupRlf?=
 =?us-ascii?Q?7L/Z2TGFJAIxHi8OMKEHlqMjpPEBvxlfaA0QdSU3isTWcgkE6Ji1yV8HUu+c?=
 =?us-ascii?Q?eWW56ZIoShe9WKNKxLnRvO02gbPYyldlnf7EukjfCxXU/g16oxGC/qhei5lK?=
 =?us-ascii?Q?mHB2ZO9dxZv9Y+utSpucv8opfQVXfzDRy5H3yR0jMtoP6bs1zerea7GeeqEk?=
 =?us-ascii?Q?PEAkd5c6VojYFkUzc5XpyMUtEoI8WPjjp+GWetMI9GdP/5OQAWrjdtzip07o?=
 =?us-ascii?Q?UplkgxTvKEFZ++XE95KyKZT+YRZGBscR2Em/xw1sUh00GRWnwn6ynGBjlFm2?=
 =?us-ascii?Q?74mMJnwheCq14+qj20ea3qPWRxPTHWbR1ULGF5aY3gy0q7njyaIfQjwomAf3?=
 =?us-ascii?Q?HuXxUCl8qrIITK9ACbYcIhL6OuKVGUabD3bqrKzLk7Rd2DnE8JyP8oZxXNGo?=
 =?us-ascii?Q?rm+qitRSbfsqY/OMAD6WQ0Pw+3zwX2ozp4vzOXT2qBGyG4yDLNhbOM8S8rnj?=
 =?us-ascii?Q?6YUgBlQxbid9LROL6mJD5TZdrOzq6qv35wXCtByZE2Rla8AoQ3bh8GDDU5j9?=
 =?us-ascii?Q?fUwUEnbZl4+KrgWAQWM5DvNEvzI2ibwtWBFfGqjJ7S1zlFQRSw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230032)(82310400018)(36860700005)(376006)(1800799016);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 07:35:56.3997
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8c20411-fe88-4f4d-a2fe-08dc8ab24c13
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7546

Device common feature bits overview in the basic facilities and
their actual description are apart by 24 chapters.

Help reader to directly reach out to feature bits definitions from
the basic chapter.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
changelog:
v0->v1:
- adddress comments from Michael to use '\ref' instead of '\hyperref'
---
 content.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/content.tex b/content.tex
index d73c845..d6b9803 100644
--- a/content.tex
+++ b/content.tex
@@ -100,7 +100,7 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
 \item[0 to 23, and 50 to 127] Feature bits for the specific device type
 
 \item[24 to 41] Feature bits reserved for extensions to the queue and
-  feature negotiation mechanisms
+  feature negotiation mechanisms, see \ref{sec:Reserved Feature Bits}
 
 \item[42 to 49, and 128 and above] Feature bits reserved for future extensions.
 \end{description}
-- 
2.34.1

