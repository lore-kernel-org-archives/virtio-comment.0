Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013012.outbound.protection.outlook.com [52.101.72.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3872EAB9D
	for <virtio-comment@lists.linux.dev>; Thu, 14 Aug 2025 12:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755172889; cv=fail; b=n0wKvR0F5QicYVtDgw2W16u6fGMDp1bQD5iRD+bXiqIv5OG5MRGdBzVwab4dmnmxNXG32Sju811p0C+aFCM2BMv099NFUk0URkJAEVmNgkdyt9SOqtx+gItERWrZu2B6TRLcjVn2GMzSYEZjgvwnVGZ1P0uuhD26ZDrF03jd0Yk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755172889; c=relaxed/simple;
	bh=aDhtrwBqCTqHwK5C5N4XeL+bn3F79Zvo9xB+hi6ffFo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=J2YK7zO/FBdkxwknQfwFslmH/FT58fNkQ8SmbtxOX/i5CJ4dVDtBquACz4mS1WisnFcJX6XOVNPGNd8iWN5g507iDF+KMdQlCeqn6wdth6GM4AUu9J/+J/HAd1qETD4bFPRE6X6SEE58WF7i9s+gnA85kl/0HC3sSkNAIGsRPSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=hxi55MJT; arc=fail smtp.client-ip=52.101.72.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="hxi55MJT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Whp+hJxzm32fRp/Oxxyl8bKui6nE/OyvkjicsiVSJyO7qVbmC3jqx6BJhqr+rtlQKKfuAbIRiX1jGpWmCTghWu97oWOfyLuzokrTI+wek3saflFc+jp9c0auEwBYFTvp6MLzHwXm3+ccAFSU8/x9hEwEwfAcm/8dpxiTweApRp85Gc/9y+1CJCiSM5TAs9ejtFePN+tirglk4VWb16JY0U5b8rqm21snsmuAyfuzq0D+KA168DePkkgoN1eVfKUV3SHQ+9j1ThXFGVvNn6cljehpN7yzkA0QecYLD6/i3VNx6S4upxoA9BUv83CaN7rvnlrjnn7QJ9b2ipeYOgpkmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=po1zkfUcWgkydk4mhIacMqQflanp7y/Q8/SANX//Sag=;
 b=UUW8xbPt4INBAzx5rbCz+I5DN+ZCnjB0qFCT4LefjFnO6x1+IhGV/WCQWwPuSVPjTJ4JVp04aKM8fikpvwfgTsfzSFtJbrSQgQd0xxi2M7QO4EJarzuGB61+AN3HGfRZy7vurRxzs67nM6/8stcSHEFe1GTWHIexQNNscS/aqfdlcawrc6GqSK5vVHxNRYH6tTcNSXHaF5saV5GyhHlxFlfIF00u739IRUjZv1g6zEZN/jYcsajOEqe7vBrw6Q4z7Ejx7AY5xvA42A23ZP1/AM17NCfz9xIMfNL0AGXxc4bBQFcbomSJoo1J50uLQxUsgoTTSK3FS5D4E0239+Pj/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.6.101) smtp.rcpttodomain=apple.com smtp.mailfrom=nokia-bell-labs.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nokia-bell-labs.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=po1zkfUcWgkydk4mhIacMqQflanp7y/Q8/SANX//Sag=;
 b=hxi55MJTHTGwn4RG9PR+TyTNYVOAuTom3pEiFeWECgsrMe9AWH/L3m6MZzMqKVulPgs8RnRA5T18YMQgbvb+0igGM8WR7Q3ZtNZVwg6diV3d2CpK/HXjRaWWCZIoD9mrRwuozMmY5tdxSMoP11oW436+m1H/0KiFbLOlMtZPD/o6fSy1wDF8BCcUQwNZESG/e0JHbu73DzkfDtxa8T4FwcLpx4gfPBZJ2SUExbibHOP6YBX9pxX8uapWNz52gGlaLfG8A8zIg48Lz3Do6U+Aze9s5AfqI7peOHq/X/ED6dzU+yw/XRJhundxLwFQV/v+Zwo6mXX/kgi1V6H0L+61Kg==
Received: from DU2PR04CA0209.eurprd04.prod.outlook.com (2603:10a6:10:28d::34)
 by VI1PR0701MB6782.eurprd07.prod.outlook.com (2603:10a6:800:17e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Thu, 14 Aug
 2025 12:01:25 +0000
Received: from DB5PEPF00014B8B.eurprd02.prod.outlook.com
 (2603:10a6:10:28d:cafe::aa) by DU2PR04CA0209.outlook.office365.com
 (2603:10a6:10:28d::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.17 via Frontend Transport; Thu,
 14 Aug 2025 12:01:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.6.101)
 smtp.mailfrom=nokia-bell-labs.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nokia-bell-labs.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia-bell-labs.com
 designates 131.228.6.101 as permitted sender)
 receiver=protection.outlook.com; client-ip=131.228.6.101;
 helo=fr712usmtp1.zeu.alcatel-lucent.com; pr=C
Received: from fr712usmtp1.zeu.alcatel-lucent.com (131.228.6.101) by
 DB5PEPF00014B8B.mail.protection.outlook.com (10.167.8.199) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.11
 via Frontend Transport; Thu, 14 Aug 2025 12:01:24 +0000
Received: from sarah.nbl.nsn-rdnet.net (sarah.nbl.nsn-rdnet.net [10.0.73.150])
	by fr712usmtp1.zeu.alcatel-lucent.com (Postfix) with ESMTP id CBED91C0043;
	Thu, 14 Aug 2025 15:01:23 +0300 (EEST)
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
Subject: [PATCH v10 0/2] Update ECN (RFC3168) and Add Accurate ECN (RFC9768-to-be) feature
Date: Thu, 14 Aug 2025 14:01:16 +0200
Message-Id: <20250814120118.81787-1-chia-yu.chang@nokia-bell-labs.com>
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
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8B:EE_|VI1PR0701MB6782:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 40fa7932-4ab7-4d2f-0dd3-08dddb2a4aff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|1800799024|376014|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?r/QQZBCanhOD663duvjCDkQ0GNlUmyMGsu3Q3En2rCQY1vpzzlI6ZNaHJ2lZ?=
 =?us-ascii?Q?0MfSN9QIdxoqaKsMrq9oQH79VXDcME4kEW672dvmKHWPmy5emIgCH34oAWx0?=
 =?us-ascii?Q?wk+hfsusormwm35APF7ygO4kNt5J4/T5t0qergLoSBrO4D6qHf5u0jAkaGQy?=
 =?us-ascii?Q?Q6c7CmroQV/dNHYaaxMR9mCBTh+axPjxKedRhWx3NMfxknY7FFJI8G3MY27f?=
 =?us-ascii?Q?8pC+poC+DQswh0gcFPKb2Ca9Rtu89TETOW1Q6O6/YAWO4KRPioPDjiAdMnFb?=
 =?us-ascii?Q?Fl7cq7CCiv9dlUa5uiF3hv8inyOhTYvqmLzen68sFqoT03OANXsHM0K/6wuc?=
 =?us-ascii?Q?hEPN4G6N52/AlyyEjTzGcL/QLhh0v6OKMy3tag590QSRMEnkt/LHiN9AktU9?=
 =?us-ascii?Q?9LEhFnIwtgNbhxp+euJotdU3Ggyo5MDCw+9KeyU75SFjc4Qr+jDFMm8FK2y6?=
 =?us-ascii?Q?APW5cY6FU6TGdTbSHR8C+T5p6FsdGxbQI55SCrAzVf7d2qkfomAFo370ntF7?=
 =?us-ascii?Q?ph1B25WcpswlAHFmsLmTPbYFdnkeGkC+MnVDUzVhzR+GmtfkTjuNMBLb42C0?=
 =?us-ascii?Q?Y2Aa03FaMl5Tf1sXBDiDX/2VYx5vMAi//LoDUgYZ0VjLBKgGBzabEkJPZwd0?=
 =?us-ascii?Q?HAfnYGGII9moGeKGm45sDlvUjTJKmvcXYcDafqYAIukU5T5NQw+4SlTyCeXB?=
 =?us-ascii?Q?jL4J1ir9Cs4S313yMMkGMQk3cFQMCdLo1mKi2n1ctlqxaRL3i4oekC1cB4ZB?=
 =?us-ascii?Q?CcB19rheLc5ejmqvgJtq8Zl/qFLunBkXo+yT/SaLNgybarikGLxqv8EuTwG1?=
 =?us-ascii?Q?LkZIxaG4lqIxChX2lUkA+by+517oqr2Sdpx1Z2E/Pn3dF+Bf9SAJZ9wZTguE?=
 =?us-ascii?Q?18EZv2XNOqCdNn8LxkwdMMl0kuuxfz/KmDgYZn0YW+kAk282KpFGDPxjmapf?=
 =?us-ascii?Q?DBhdFuyvTYATJPy1wwF8l1ahCXkt0VTpI6K8xZ8ryOePQspUMTOjM3A347O0?=
 =?us-ascii?Q?hj7SIRmilbV2FVuDM7MPdpDo+EIVWuuuZzILh1IEtgKk49LVT4eIsLubE7l/?=
 =?us-ascii?Q?IfnR3Kw2agLq68Y/38wjO0cr2f0WaA0GROJhz7SWHjMq+6Rzex1iv28fnLBN?=
 =?us-ascii?Q?vsvzysN4rJSm+VkdToLRwxX/MOZv1nu4FuPG8rGjRSTQFGqDE0Dq1hWyIKoV?=
 =?us-ascii?Q?SRnDexQSgjUgVcqAsloKDM3XJGmy4alRSUISUvh9b5yPvgWzaq5hO4suH8E9?=
 =?us-ascii?Q?4vNNHHsV14OSf+Ghjd6ca5nAptCuNqWeZ1BOz8AG+uriAQtmUzCQsE5kOWMt?=
 =?us-ascii?Q?H3smesfv2RxVZfTloecDGkTitWrFednrRD6k4hTa6cHV4nnD5zGAO7qZRLL7?=
 =?us-ascii?Q?L6hu8DNAuI81YH65fZPTj7SDKRapHQDPilmcIwbwXP/a/qIBUEXglEcGbRKg?=
 =?us-ascii?Q?W+rQBxRM964DZH7FYtMWdb60UFFs1pCJEG2U8els0xnDHF63gjtljpZZSs/N?=
 =?us-ascii?Q?HRyQedPbu9JGXaok115KwQuZwC0uojJoZyT7oyZdm+LdxoUK7y/7XDWNTg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:131.228.6.101;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fr712usmtp1.zeu.alcatel-lucent.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(1800799024)(376014)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 12:01:24.8765
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40fa7932-4ab7-4d2f-0dd3-08dddb2a4aff
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.6.101];Helo=[fr712usmtp1.zeu.alcatel-lucent.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0701MB6782

From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

Hello,

Please find ECN and AccECN patch v10, which aligns ECN functionality with
RFC3168 ECN, and adds Accurate ECN feature. The Accurate ECN draft can be
found in https://datatracker.ietf.org/doc/html/draft-ietf-tcpm-accurate-ecn-34.
And the Accurate ECN draft will become RFC9768.

Best Regards,
Chia-Yu

---
v10 (14-Aug-2025)
- Update AccECN reference and it will become RFC9768.

v9 (19-May-2025)
- Update descriptions for VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_HOST_ECN, VIRTIO_NET_F_GUEST_ACCECN, VIRTIO_NET_F_HOST_ACCECN (Michael S. Tsirkin <mst@redhat.com>)
- Add reference sections of RFC3168 ECN and AccECN (Michael S. Tsirkin <mst@redhat.com>)

v8 (17-Apr-2025)
- Further typo fixing

v7 (15-Apr-2025)
- Fix typos in AccECN patch (Michael S. Tsirkin <mst@redhat.com>)

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

---
Chia-Yu Chang (2):
  virtio-net: Fix ECN feature descriptions
  virtio-net: Define Accurate ECN feature in virtio-spec

 device-types/net/description.tex | 83 +++++++++++++++++++++++---------
 introduction.tex                 |  6 +++
 2 files changed, 65 insertions(+), 24 deletions(-)

-- 
2.34.1

