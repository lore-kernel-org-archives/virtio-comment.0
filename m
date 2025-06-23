Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011004.outbound.protection.outlook.com [40.107.130.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DB64409
	for <virtio-comment@lists.linux.dev>; Mon, 23 Jun 2025 08:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750666741; cv=fail; b=WFL/2Xok8zW6LCKSwUEMqrOokApNEB54IwPhAph2zptcmjfjAR/NBX7ZGDqaj23I6X7z8P9BDUrIkOMY7Kiov5F9yBn0jCJYhKfwfkRrI6SEpxbCNoekSIOswp2vZ/uPA0vXHMF1Pd+vu3yvaqK6k3dFrAja+rG4Yy5irjebJqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750666741; c=relaxed/simple;
	bh=h/0TS8l6RPOgFCz6SJrwC/5oZ4nlCD8O5hPCgh5QGpI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=rXyfWgFKqZdgDJnwNOiDTpyP6AyPIYu0giQtkoOaRTjgt3UU28RCKZl/GTwPpd9i4XLssFKgUoAKmOwgE5RKiR7EIy4FRF5/S44jMw0K4z724H4AFWDvk2JviSAmjMnGHLVaZNCk0arq/A9KAOOGLZOVWq5IaxHgXV6bdhPX/U8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=bD1tECML; arc=fail smtp.client-ip=40.107.130.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="bD1tECML"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BEKgw/9OxVK4JYgbZkS9FVtSHFxypCOChNCTez2PpDDmvd8TmJUANFEuq2xh8NiudoZYGjP6n5m5lusj+eJp3v8Vx9ETmiHGtb6ai7RBR4UGW5s5bSXoTO7TMqSXejIH6/yj6zOoHRq9VJQvg9utufvFz/7PVbAMOhbJ8cWOvATVRGQmJ9SJawEn4tnGhkf6qj79lLvRcTf8rSPmf6wiyzxPm5vLzVvDc4XPOUvQSL5YpsQfI2NM7xd9FevQhhOTUbqJ9sjtbuAazW37klcD6B+/LlZHriJNNWhvWPY5P9GY3ekxyxEzP0QAfF7T0+n3VclMps370bx1kiiVVsg8Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQE98I8nfcms5hnZen2Zp4jyaXGMUHUnGxmJPAPIgYo=;
 b=WvIyNu+oMxd/XZkk0P+av5w/pHFtFbLoVvoidMdaIjVIwRakZ0aP3PDHXq15MQpjM0TF+W6RNOTLfUL7yRBTlfj26+EceECSC04Yy9+EnG9h/IkE+MSO4DbziVjRJNRG9t+DFGcOBklQCeJUKn5k53kdYgq9dge9v53oe5qHlXG0P2m1WGmYGshl/0D/13ZCv9zLnR1DX1TD5MWdWGf7Hz14HtRmTEyfJed8eWKGw85FwcvyC61eIblCrIfGwvALQOp0PVbxY2VDDV8aOpnJP+b7c/cfh7QqPEsKtCI7WZ/mQN7uLBd66/SDnqTB1MHMLsyYKvvUuhmJYHPA7+oI2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.6.100) smtp.rcpttodomain=apple.com smtp.mailfrom=nokia-bell-labs.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nokia-bell-labs.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQE98I8nfcms5hnZen2Zp4jyaXGMUHUnGxmJPAPIgYo=;
 b=bD1tECMLVAmvfNS0DO7Hcawr+p8XO9rdOm3MgoQwBfXWpq1AcWD12XUyoW4KbWK0RTm/+DVXfpNteUGR173iPFd0y3eBTWuRV4BNWpJH4xvo1et4tKf9yt210bMEMpgiOt2mOkdvvRzDsOa7mtpkpYna/RodSlqDnS3Q1ziXzgKHbvdLQdFDTIHf8mFyEeaRn4Kq0e7NjUtwVnxplgNXJmA1eO5sHO2IHIhR7ZNfaSBCY43eQhYMWvd40W/RHQA4oet6t1Z/w7KUcg815h1MCmeZxjxxL1iLeQZMUD9n7HCbM6KIaciYyTsbxI4FOfvgvu3Q38V/NmHx/wkWl4gflg==
Received: from PA7P264CA0178.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:36f::10)
 by DBAPR07MB7000.eurprd07.prod.outlook.com (2603:10a6:10:17d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 08:18:56 +0000
Received: from AMS0EPF000001B1.eurprd05.prod.outlook.com
 (2603:10a6:102:36f:cafe::45) by PA7P264CA0178.outlook.office365.com
 (2603:10a6:102:36f::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.30 via Frontend Transport; Mon,
 23 Jun 2025 08:18:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.6.100)
 smtp.mailfrom=nokia-bell-labs.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nokia-bell-labs.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia-bell-labs.com
 designates 131.228.6.100 as permitted sender)
 receiver=protection.outlook.com; client-ip=131.228.6.100;
 helo=fr711usmtp2.zeu.alcatel-lucent.com; pr=C
Received: from fr711usmtp2.zeu.alcatel-lucent.com (131.228.6.100) by
 AMS0EPF000001B1.mail.protection.outlook.com (10.167.16.165) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Mon, 23 Jun 2025 08:18:55 +0000
Received: from sarah.nbl.nsn-rdnet.net (sarah.nbl.nsn-rdnet.net [10.0.73.150])
	by fr711usmtp2.zeu.alcatel-lucent.com (Postfix) with ESMTP id C8F8768004B;
	Mon, 23 Jun 2025 11:18:54 +0300 (EEST)
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
Subject: [PATCH v9 RESEND 0/2] Update ECN and Add Accurate ECN feature
Date: Mon, 23 Jun 2025 10:18:45 +0200
Message-Id: <20250623081847.21264-1-chia-yu.chang@nokia-bell-labs.com>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B1:EE_|DBAPR07MB7000:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4959c3b5-9553-42f2-4e8a-08ddb22e98d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fxTmW2Z7NAASTYSuldbVaXMgkOIgNcURLzJoeYF6vCJAlRg7kodX0Rg7oZKk?=
 =?us-ascii?Q?lxoGUEYJNHI7s1ckfhcVg7IG8A02ozkdRzK+Stzka2d/EKL5DM44KJK/YQup?=
 =?us-ascii?Q?sU4L4yn6X4ul8dHk1k2hz1oDS3V/frHVugjZQTRFsH9ONvA1gXg2q44rhzyj?=
 =?us-ascii?Q?ex1PjEkA+7Tqh6yLT5uH5pEpOHuNszvJfogeFWfXELfo/XZjqEPyRUn0CqaF?=
 =?us-ascii?Q?eqnkq/l9cvnGnSb/nIRZaLibwgGCt3NMXsOUFKf2SsKewEalPw3642FKwByQ?=
 =?us-ascii?Q?KDF5Xc9GEe2SUBO2lM54z3tz2Ysh4KkcWkD3Zk4QEBMMqPYJjcAHb5VoIosv?=
 =?us-ascii?Q?CcL5yCaFRzX1MlOHsknG1tfRQfgMyyzemW9fII1rr2r2F1BtTN23ylM8WMWn?=
 =?us-ascii?Q?4rP9Tun53HPM8A32DiYVTCRXOv/JPhFJdUtxqKrIQjqXIB44Mwb0FGBQeqPm?=
 =?us-ascii?Q?CTfIDy5xsuKiwD3wfrqK35Qm7ryOST28ZllyMAjK/svzPvUJ8JMaiSoXkfmn?=
 =?us-ascii?Q?+8hVTsZk7W45wzX/tXv0SSJUSqtSBhC8xWhbSLncabEP8flAggfro/sA62h4?=
 =?us-ascii?Q?q4VS3M4JO4IyAqdbgN6dIeSCk1F7XbL3HpADwNDhnd998B9I1zTkhdeGoLAc?=
 =?us-ascii?Q?WWmaP0+DrQjGcc490EqUrFfoAJARGWhnpUDK9P8YvxDbbzPCKm76kdfjXzXY?=
 =?us-ascii?Q?++4uowhoC1xGcbriACdVobzVyocSDUN/qjlJOZpYBMjDTHpAwd9bJIc2xys5?=
 =?us-ascii?Q?ftMSKfRaQwpFmi2hUyhPLp/rardBz4rFYkMG75M64gK2jQPuBQxG6AUvAlGj?=
 =?us-ascii?Q?LxwDxl71e59Wj8gB4SQtk+hrOGLutCnHJ/WI2Qs716I8U2vBkRYL0uD3iXGK?=
 =?us-ascii?Q?URoJ55Xik6vs4p83anBf2kvnqvjwNmtmfS7yQzfXr5KxLQQdPtmyaWHOUtlQ?=
 =?us-ascii?Q?FVmvF/NS1Dmr1dp6IfYRc3YXCJ2Qcz2pi/lDjQPo8yrPh3h7dlWQ5QR563Cg?=
 =?us-ascii?Q?x7YoWc3r10l0IGkhnK21oDihGMLmS54Jtow7XXgYxM0nn8EUN/UCG27R9R9A?=
 =?us-ascii?Q?A6jhBBkoWN075Pim2QLddSmOZWqW4NF8UZnuuKxsclBqITOqtMjkM4qqNwAD?=
 =?us-ascii?Q?MmY0CF1Nb6K/+se9Ck3fTNGZlANM+ueqmoSiwy0OEYUMQYNhHy/Asv082lOT?=
 =?us-ascii?Q?ebUZmBam4/NXRgelozUxzSN2oh6sR06qXyu55ItI04hjP6+ffmyEHkNpZypq?=
 =?us-ascii?Q?YQZy2fJdZ7Aix7YvT7PV/dFLoXYUbW5PNVPO+pkBL0SdSroJKpzIsQHLLiwj?=
 =?us-ascii?Q?noImqFIWL3lLZOgR/7qVc29X9sEOo6/emn5QZblLH0jY9NpnjyYWbiYX3Hby?=
 =?us-ascii?Q?qlawSp8rXTIGeGPRDpjCulvhz0crJaG49M1Clm1cnsZAV0yQjNig8EysxLvD?=
 =?us-ascii?Q?6laJzC0zzoOb8TFiA/ujAUz0xORs/or0HJTieW5uWAFBGHFx9ejtwOrFKEjo?=
 =?us-ascii?Q?ryJjYX+qBKEW4GW4XPINEykA+H0w9sxpt//PKzBGL0JBloN9YzD2Znp7Mw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:131.228.6.100;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fr711usmtp2.zeu.alcatel-lucent.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 08:18:55.7928
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4959c3b5-9553-42f2-4e8a-08ddb22e98d6
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.6.100];Helo=[fr711usmtp2.zeu.alcatel-lucent.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B1.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR07MB7000

From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

Hello,

Please find ECN and AccECN patch v9, which aligns ECN functionality with
RFC3168 ECN, and adds Accurate ECN feature. The Accurate ECN draft can be
found in https://datatracker.ietf.org/doc/html/draft-ietf-tcpm-accurate-ecn-28

Best Regards,
Chia-Yu

---
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

