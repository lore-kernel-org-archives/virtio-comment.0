Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011028.outbound.protection.outlook.com [52.101.70.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B8D4A33
	for <virtio-comment@lists.linux.dev>; Wed,  5 Mar 2025 22:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741214171; cv=fail; b=oRhCrIxtBIdx29G2cI9+WC/MrIyeP6e9v0ZD06JCUsQKNbf07vbS+M0EU4uUVf4VerD8qk29PF5e+Z/kIWrhcEahdDRvtMuzJDMwWwljyEvxiaEUkZK4Z4ktxdVOonVnE0NgGqJivAKHo6LwNfOt/zCVkJme2rh31q5oiyd9LBA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741214171; c=relaxed/simple;
	bh=OCn0ZmptqG68VoBWnaLyBPPOxm3uCs5JLGw2idbCXxw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=QI092O0ppTGfIIbDcqNjcoRdhKJxjoT3Xpq0iM/ZHabkBkgZVpwFR7GTfo5pVuCZUVz5z5w7Tp6rKn82Am5I9vafSovbyZ8sGAOgp1Q8Ir/O+gRM7iQ0oG9Gx5kLLb5GriyXekhJTsAMCHUHGYx/5sA0+1AYlKjQOEFYofXoJhw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=B2Z3N3cS; arc=fail smtp.client-ip=52.101.70.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="B2Z3N3cS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G0+u0RgBG7rpRUBt6Zb1bSf6Kh0dUeNcrUFZzeRg3YqSX+R4LGzq5qazlLWrlcnjVPmmcB79UNFut3LFFaL/z6gC4MiMvrjSCkzFU4muOihpwktTnKgUbEi36yGbEKLM7pgtoHf+3IIXKTraKq/kaOHFAjKzrVXomYVFQb1fl4PhpCc+bCNsRGNbdBWrwjNd51JIKXvx0UijZ98Pg9SXdBKXSL8NFZFoHRHdNFx6aykSyeLVEWpsYHQx7lzyIc/VOGd0OUIJAf3rgguYQCOAGxeRlClTxUuIFdHbopaCKkAsMx1c8LG1NDw3gITqFEqoaAMkYa9P7GJn8EQw1BstLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MExeLKBkd9O6tjF0fzv9XBMAEvmq3XSBQlgMk2982dk=;
 b=IdjzfypbLZ61PZGtHomT9+N6RfswhzhHhIWVnU1VI5a8EHyALgbw1wOSfD2LzRsH8JlPIwL3yQopTyK+GNco7gZv2sRgdPtfaN7NoRcI5R0+95FjrPAkS7qKFPpbFcjtiO4OZA+YNZummZCpvN4X4Doics8c8tG0bka+L+j+k58hf+QPUQcgsgn+sqzL2g4zYW958fKAB1LN0RtAKAkV/yvNdx9YC5doRuLaZicZVBKJtPVlgqAlwNBb8eV99M8AfVsscd3Q2xI911mdlvVdA2qJBOY0fzFnNBEEXsnPqiDBAQZQnS2vuEOnN9AJESNoPfGX0ICZXeVBVB5VXQYLBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.29) smtp.rcpttodomain=apple.com smtp.mailfrom=nokia-bell-labs.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nokia-bell-labs.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MExeLKBkd9O6tjF0fzv9XBMAEvmq3XSBQlgMk2982dk=;
 b=B2Z3N3cSr7wEVCbrB16nqbHaF7B8kLNEb8gI7c3UE33T5+ExP0cXlabuna0zlw/rzQbtoPvsh4tQIOhnnCqcBD2CvImJabeT20+OK1oYDGar2IL70hnO5CdPoGQDrlWGMxIweshZHddyxE8/NJPwWMohbBdZI5/CB+GNt7pxi4YwgAxwY+HthISMz7p8++JhdL15L6ndPO/SkoT0FQYBMiTf5ehvgC3/whTFy8cv2tGvlefuwdAFyp+WMJ5LLGtyiu9/+W+q7X7uUsL6CIJ+eiKue82kyI7dsPJ8SA6UQILGcQnNnkdT68Ve6QEniDwEgG6DiZu+dmsl8j84bNQ3+A==
Received: from PA7P264CA0313.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:395::27)
 by PA4PR07MB8573.eurprd07.prod.outlook.com (2603:10a6:102:26b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Wed, 5 Mar
 2025 22:36:05 +0000
Received: from AM1PEPF000252DE.eurprd07.prod.outlook.com
 (2603:10a6:102:395:cafe::a5) by PA7P264CA0313.outlook.office365.com
 (2603:10a6:102:395::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.16 via Frontend Transport; Wed,
 5 Mar 2025 22:36:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.2.29)
 smtp.mailfrom=nokia-bell-labs.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nokia-bell-labs.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia-bell-labs.com
 designates 131.228.2.29 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.2.29; helo=fihe3nok0735.emea.nsn-net.net; pr=C
Received: from fihe3nok0735.emea.nsn-net.net (131.228.2.29) by
 AM1PEPF000252DE.mail.protection.outlook.com (10.167.16.56) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.15
 via Frontend Transport; Wed, 5 Mar 2025 22:36:04 +0000
Received: from sarah.nbl.nsn-rdnet.net (sarah.nbl.nsn-rdnet.net [10.0.73.150])
	by fihe3nok0735.emea.nsn-net.net (Postfix) with ESMTP id A2E69205D6;
	Thu,  6 Mar 2025 00:36:03 +0200 (EET)
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
Subject: [PATCH v4 0/2] Update ECN and Add ACCECN feature
Date: Wed,  5 Mar 2025 23:35:42 +0100
Message-Id: <20250305223544.85812-1-chia-yu.chang@nokia-bell-labs.com>
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
X-MS-TrafficTypeDiagnostic: AM1PEPF000252DE:EE_|PA4PR07MB8573:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: da8d2b09-4844-4acc-1bcc-08dd5c361d6e
X-LD-Processed: 5d471751-9675-428d-917b-70f44f9630b0,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|36860700013|82310400026|7416014|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?4U9xmU/gTbAe/dNLZBNyAyxQSLfsyfH0G2uBtwTfEqNscGb5Kn4Hlv1NrMgF?=
 =?us-ascii?Q?T8nKhTjfquXkASc4CLcVdpxSSHaUb8FUzY9+tYcJ7qDSFnMQowC4PTp13bvr?=
 =?us-ascii?Q?OHtAqGREGLSNRhq3pNi2pd6JrPvWazHr6lPlIfbkzfEQtugh8L/5IlUxfsQB?=
 =?us-ascii?Q?Ve/DPjM9szwSCP8HDe8iLeRd4/KoTWifMRqBDhhiS/Yfv8MbCvmnYtBF+yxZ?=
 =?us-ascii?Q?008+mQ64XqjkAkWmCTWvLKvQvD3JrkEiPVw1BkXAYK56aw57xIlouVoxrBTn?=
 =?us-ascii?Q?e7/WKRM0Az5715vEuzVMxnEBKaplghb6tMHp1snvuiwRnG8W2HzcXhYO1WKs?=
 =?us-ascii?Q?hr+lDstG9XkmmLLFsV/2uPSGM58J9dPVfqDzlNtyFX0B3CmAoTkU+ntxNB9b?=
 =?us-ascii?Q?pH51N96fzJbD4FSzTG4UYctxGNiu8T9avZVwESdbFYbp9X6huYgLW8Ghuu5G?=
 =?us-ascii?Q?8PWuv6arBmCyXhG96qYQt6OOWjd26s65xrhIWpeYHtRiZ18SISzL1iEcpEB3?=
 =?us-ascii?Q?EdQSRnOFez1xDET/uDzH0JcmGHngiJqzSAT1cXg+dFZo+lHiW2iv1D4eiu9C?=
 =?us-ascii?Q?thnvK60HLMCWlsFZtp9OV/xwN4LaB8LB0CW93d/GXm4g8I5OHAKlv3QVAaTR?=
 =?us-ascii?Q?S7pjWHsKLdvT6RYO/kfVEsxhvI81zCJVkgOl1W1HNVuooaIblokh665xs0HB?=
 =?us-ascii?Q?T4IzH5Cv7R5i5hAkXYeTd/Oy1kVroK5Zlz6kOcfgoU4lEDDdHfEXKcR1VdcX?=
 =?us-ascii?Q?REFmx43lkOnqBa//cpp/jBlTKoTdyWw71W1PdfX3yWHZzCXa4O0O0AoIzBGV?=
 =?us-ascii?Q?24vhrhcdL3y0NkFdYYVKeJy++/evidgR5RbDoN2klrPvysPIKD0X2O8WsXa4?=
 =?us-ascii?Q?pfbcHI89fIH9zkUOoLsWSasy0UVMVqAdT4KaovNmMrMgM07eWTZ2miXFLQc9?=
 =?us-ascii?Q?oQgcaDiUnIavdAk+RZ/nk6K80zgInIzgELt6BZhP6CMbR91VlRvII7pXGtyS?=
 =?us-ascii?Q?uvuRvRbQrVD2dy8l4a3e2eBuycXQHa8dMYaxUsdy0uEFYFXe7ZoWQ93V4rxZ?=
 =?us-ascii?Q?rGR92lHwXiG7i07d/AYkUvOb2tWVtB91WDNeehdtNe0JQltBUwo2JlaNiWs5?=
 =?us-ascii?Q?nFQOdU+D0tB4YyRYcj8X4jpgVIpin5NjvvUFjfT6vfCYz3MzPR35Cwxeo554?=
 =?us-ascii?Q?wv7r2fqclJJ05/NSPRe19MRCL6XKA3QK2RdGYek128IB3HUNj64PEa7ypl5F?=
 =?us-ascii?Q?xTRORjyHy02L9ONkfVbuMIlo3LhoUv3fzzPSDoJC/8jkaR3WmLTl8vvXayAh?=
 =?us-ascii?Q?egogQ7is++IBU2RYsMDOfpzYKBk4D/iglcyagYUAZlcu9CUETQ2o4AXrvRaf?=
 =?us-ascii?Q?r9UrZc5Qcu8a8+/OT3bL3Ng9oInbRVsviSgIhwEC+I4nBDVpKjm0keI8j8tA?=
 =?us-ascii?Q?KICdcML85wwOfoP9mPHj0ICGxs6XSIDW0lUCeGL8iH/A4kRTAX+yE95KVIbG?=
 =?us-ascii?Q?Hw7Vp+Kuh4FeJxbEwhz2N5xGYmiHS/TCYI3I?=
X-Forefront-Antispam-Report:
 CIP:131.228.2.29;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe3nok0735.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 22:36:04.7285
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da8d2b09-4844-4acc-1bcc-08dd5c361d6e
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.29];Helo=[fihe3nok0735.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000252DE.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR07MB8573

From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

Hello,

  Please find ECN and ACCECN feature patch v4.

v4
- Update commit message of AccECN patch
- Add reference to RFC3168 ECN and Accurate ECN
- Simplify feature bit descriptinos to avoid duplication of text

v3
- Separate the original patch into 2 different patches
- Fix several reabase issues in v2

v2
- Reabase the patch on top of v1.4 virtio-spec

Best Regards,
Chia-Yu

Chia-Yu Chang (2):
  virtio-net: Fix ECN feature descritpion
  virtio-net: define Accurate ECN feature in virtio-spec

 device-types/net/description.tex | 78 ++++++++++++++++++++++----------
 introduction.tex                 |  6 +++
 2 files changed, 61 insertions(+), 23 deletions(-)

-- 
2.34.1

