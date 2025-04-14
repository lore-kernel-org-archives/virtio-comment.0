Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2054.outbound.protection.outlook.com [40.107.247.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19961A9B48
	for <virtio-comment@lists.linux.dev>; Mon, 14 Apr 2025 15:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744644877; cv=fail; b=c0enoGGN5l064tKxN6/jZUjHleBiK+W4QRqcCmdFAAGh+9KWLRXGrubdxV6KbYPvlOldWKH2kQreCFzkSXXyqSzb8ZqNCF7xVdjvmCNDh4cZXuRFZMIPoKAyvs7nvNV1ojbG5jcfqkgAFqnyzUQmj4tQb7+njV2gh4Mzb7mtPyU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744644877; c=relaxed/simple;
	bh=mI2+PdhZqWqZDB4Wq2pH/OghCNU4GCtQWVqypVtR3UU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=K+2Z4Roey1poMAAo5m8Rf0qp+6HA7bLCFlfDpvJ9sx4zP1/nQU32w56bZ2VsKeWZMsL0f4WzU62NulMefVgfOWZt7STIltdQPiVI9B1MXPtxJOucF4lf0Vznfp8wGUUGdAFykNstgRSZK7KDmBjvW91fu9C7xorfZ2eECIo6pQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=Qm0Q7RsA; arc=fail smtp.client-ip=40.107.247.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="Qm0Q7RsA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gqZHK6JQFNTyWDmfbW5er7Toy15FsqajIcdgZZ84QqxoLy4MF8Zb57H+QtigQPcY/xbcEmOdyOxXT56od+5wc0HWTfZHBcfn5eGC6+MzI7iOEV1GiFTlXVQBEnvs0hDnA6wcsZtnMPeyNyq9RY/td5CIvmLmWBdbGnZH9Im2cjsRupGtTd3x+qelutre7XXeIA3UhAf4LJPbGMFokFBT060oVSEC1u4DRBsx4DPk+recEIZ1PNVG5nLSkR240GPXZThl8sh0hasDpZlOfCIp9MCiy0ek/R6waPJWMj6ktyFAvV9PLEvGf0zaRmRiAWIJIvaWzOcYY46yGC3w/8KI/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BYuWOV2mSlFpUHpQ64o0Zl4revryyI9kPDBflZmxDgI=;
 b=vrppl/ciKBhukXc/82A4oJCRYZ88r95/q3i8wde6xGDxjLLOGyA5tuD9YPaWrPqn2u0fBN+Sw3Wt68vFkOeuSvwiehBfLyjAXlRvt374dmhcaYPH2zrmBBJM3qsaS+J6RF3TDyrGTF8niPYeouD8XO9sLz5bRhFBFK8PzHQcJksSEOOOrvfR/V6Okpfqmte+yFiQORfowf1KUFH2ZR30NFjr8oVC6ecWxnpZgGNz3+Qw6oz+/Zraxqu743uZHvCInj54Qm/LR6vRIAwC3sgkVs0B8WhhBUh7NnrIUxHIBic6ksslPligrkt7Rq2ovpx8sbZHf9/XXCev53NtuoxlGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.6.101) smtp.rcpttodomain=nokia-bell-labs.com
 smtp.mailfrom=nokia-bell-labs.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=nokia-bell-labs.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BYuWOV2mSlFpUHpQ64o0Zl4revryyI9kPDBflZmxDgI=;
 b=Qm0Q7RsA/Tw6qfO/52chlAtmwN1yWpyh50JXNDznD8lXF+bJrRQAg4ZLWSSWrwSrIKYRKZakaIibm1/ykOQzmvLIVBvz71ubyfR6b2RAZUiMoQDZ74e36Ms8sBafYQwbdhHL0lt6TiMGeoOM6wOThevDaZONRaUdRXkIBTGQ9dC24lz8NTSoB6w3axcYZwuAraQtmLBW9BEsbwwQoWE+AbHr8VkOen6ujNGgnJ8Dq/pKz6+rpkEkJ9zZVZc3ee4pMNqE/0TTPhs7GD5fXgPre+j97CYKFJEw3lc2/D2iNQcDXJI46i5q8DzJiXVlerskHBM/GMYvMiE6kYMsUNZJ5A==
Received: from DB9PR02CA0029.eurprd02.prod.outlook.com (2603:10a6:10:1d9::34)
 by PAXPR07MB7839.eurprd07.prod.outlook.com (2603:10a6:102:13b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 14 Apr
 2025 15:34:30 +0000
Received: from DB1PEPF000509ED.eurprd03.prod.outlook.com
 (2603:10a6:10:1d9:cafe::9f) by DB9PR02CA0029.outlook.office365.com
 (2603:10a6:10:1d9::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.34 via Frontend Transport; Mon,
 14 Apr 2025 15:34:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.6.101)
 smtp.mailfrom=nokia-bell-labs.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nokia-bell-labs.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia-bell-labs.com
 designates 131.228.6.101 as permitted sender)
 receiver=protection.outlook.com; client-ip=131.228.6.101;
 helo=fr712usmtp1.zeu.alcatel-lucent.com; pr=C
Received: from fr712usmtp1.zeu.alcatel-lucent.com (131.228.6.101) by
 DB1PEPF000509ED.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 15:34:30 +0000
Received: from sarah.nbl.nsn-rdnet.net (sarah.nbl.nsn-rdnet.net [10.0.73.150])
	by fr712usmtp1.zeu.alcatel-lucent.com (GMO) with ESMTP id 53EFYSsI027839;
	Mon, 14 Apr 2025 15:34:28 GMT
From: chia-yu.chang@nokia-bell-labs.com
To: virtio-comment@lists.linux.dev, mst@redhat.com, cohuck@redhat.com,
        mvaralar@redhat.com, jasowang@redhat.com, xuanzhuo@linux.alibaba.com,
        eperezma@redhat.com, ij@kernel.org, ncardwell@google.com,
        koen.de_schepper@nokia-bell-labs.com, g.white@cablelabs.com,
        vidhi_goel@apple.com, ingemar.s.johansson@ericsson.com,
        mirja.kuehlewind@ericsson.com
Cc: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
Subject: [PATCH v6 0/2] Update ECN and Add AccECN feature
Date: Mon, 14 Apr 2025 17:34:23 +0200
Message-Id: <20250414153425.99726-1-chia-yu.chang@nokia-bell-labs.com>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509ED:EE_|PAXPR07MB7839:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 10b38784-25a3-4fdb-e3d6-08dd7b69d955
X-LD-Processed: 5d471751-9675-428d-917b-70f44f9630b0,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|82310400026|7416014|376014|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?d5RL0qxI8SfttWQqvZK0PI9McI1rGqN6nI6C5QB5C3t9ZZ3xVapZKtsoXzvl?=
 =?us-ascii?Q?bevS8iAyo+Eu5uiEECVkfjdxxiDBM+KWc6euoefNp9r1PCMn3fitiSg8O8pq?=
 =?us-ascii?Q?Q5N+cViufGHZ1ZmtIh/KaIz/YYPIBiXxDswxFZ+V3y5xxEdYyslKWLbDajqz?=
 =?us-ascii?Q?Vio4bMB+/9axKjda7JO7eCNifqnC4x6VbX/YkkrUV95OUZeBdj3Up02mwfdg?=
 =?us-ascii?Q?vgC6bWig+DR3WIvuHgd0vxiB9wiUnq2n+XXFdDc85XTj+tNa+aGISl4dj/hx?=
 =?us-ascii?Q?caWSF3AvglQp/3V6rCGVrH1xllFmbrgmShA2kogf2ih9GM4GzssO4Jgk9/N8?=
 =?us-ascii?Q?2BBwlpwWkyquFgS2NNGwAGLuswNAQ92jfgBbbaBUMYpUU7vNjY04AtaWzhIC?=
 =?us-ascii?Q?9AVpJDDdSbaqe8bWB/zTp1yNvk6jicLu2mc3N4Nv6vJC4K2tDyQ7y+9JZufa?=
 =?us-ascii?Q?UPxPj2oc33yyhAkBjZlvR3GL0TEfVIVKqIPTmxkHurvG+5ABm6dw+LAuWrM9?=
 =?us-ascii?Q?bvIO6OcSmqg5IZRv/ClWyOiKZ9NeSgsIV/YiVr/Vh2IIF5p/WAZrUBX5pDx6?=
 =?us-ascii?Q?YY7RBFHSYKt7bmqGVn7lNb6bMQ1fhy1pWr9mE2zMRf0Ww/m9ls9mO0Ttpin6?=
 =?us-ascii?Q?mxnAICaBdHJXmOHrLNHSOKhG9Wcvcf/8aifufWPJRZAaKUviYoEpDh4bhk3x?=
 =?us-ascii?Q?xXbDPdKoS2dKMkKCKEXZN0Hf43nNY4Tci811vpqxvi4crtjXlG3icvT8DkEj?=
 =?us-ascii?Q?fYFrCCHuuEet74+iu0K4Wuf8p4TUQ03pn9oxtd7MtSV8hmEUEBqLOVCvmou/?=
 =?us-ascii?Q?JCLKlOKbgNImt749TphOUC8tGFuf/LfklkkeeAHX5PGuBF0IYKabDtGMAzCr?=
 =?us-ascii?Q?JylZcz0dC2hxOAJTqYYJcjZ2qS0SVHaHKSE7z1V8CZ5rvyNQ5sHuj6wnm9mi?=
 =?us-ascii?Q?nBYgo3nP8AlOayVOggned8CUCQvtZg0nSm+/1FzVcKA+pN11XeA2iXpdkQeT?=
 =?us-ascii?Q?Q56RWB7fi0EfsuWoWMrPYRj01F/Ld+fZocInj27008W9k96kTBY/W0aNn94v?=
 =?us-ascii?Q?BiGc5qNEVdIAncB0TS68W/0+MvyxoydyhGhyprhMRoAVQ+cKtcMqV6phtnGu?=
 =?us-ascii?Q?uy1GzIKphdG4/4+xbBMf9KLDc43VJD1FgmHIjSuSw0AmNkagsKOjDrJ+0ruT?=
 =?us-ascii?Q?IfoXzn8WNEHmB+6jqYuBcJ475UnJf7+A+c6YeQtZMNesDKyk4xth3+qsySoP?=
 =?us-ascii?Q?YhODD91vyup6PhSN/NyUs8Fr2CvcrLk/57YAiNHcqapjiZNa+i5iRcPlXmLV?=
 =?us-ascii?Q?JIsV6l7nA6mj+6mXPcuRgBL6ZOd0GUa9X9cPH0yo958t6C+zWB0CEnnege5f?=
 =?us-ascii?Q?gA/1oc4V3Lbwx9Rk4vhcxykBZYbL51ZMFgMOWbI/8g9ZkY2eFjGHbfNpMAf0?=
 =?us-ascii?Q?fpLFjwJJ8nxCA/Ezs1oVX2C//vxxFXW0wAW7cr0aNMlTDV/s5+7yUXh1ixva?=
 =?us-ascii?Q?wxI7/AzZ7pT3+But+1OwhIt9FasxDgoZPsjUJK+Z6lcOgEv1HBY/Z+Fa+w?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:131.228.6.101;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fr712usmtp1.zeu.alcatel-lucent.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 15:34:30.3139
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10b38784-25a3-4fdb-e3d6-08dd7b69d955
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.6.101];Helo=[fr712usmtp1.zeu.alcatel-lucent.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509ED.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR07MB7839

From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

Hello,

  Please find ECN and AccECN feature patch v6:

v6 (14-Apr-2025)
- Shrink descriptions and make more reference to RFC3168 ECN and AccECN

v5 (06-Mar-2025)
- Update feature bits of VIRTIO_NET_F_HOST_ACCECN(69) and VIRTIO_NET_F_GUEST_ACCECN(70)

v4 (05-Mar-2025)
- Update commit message of AccECN patch
- Add reference to RFC3168 ECN and Accurate ECN
- Simplify feature bit descriptinos to avoid duplication of text

v3 (21-Feb-2025)
- Separate the original patch into 2 different patches
- Fix several reabase issues in v2

v2 (17-Feb-2025)
- Rebase the patch on top of v1.4 virtio-spec

Best Regards,
Chia-Yu

Chia-Yu Chang (2):
  virtio-net: Fix ECN feature descritpion
  virtio-net: define Accurate ECN feature in virtio-spec

 device-types/net/description.tex | 77 ++++++++++++++++++++++----------
 introduction.tex                 |  6 +++
 2 files changed, 60 insertions(+), 23 deletions(-)

-- 
2.34.1

