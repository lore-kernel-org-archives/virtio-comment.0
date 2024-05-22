Received: from repost01.tmes.trendmicro.eu (repost01.tmes.trendmicro.eu [18.185.115.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C769F1422D8
	for <virtio-comment@lists.linux.dev>; Wed, 22 May 2024 17:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716399924; cv=fail; b=qx2vK4z1Z/OxUcUDGc3KFMHBfEQp5KrUreucqwPgtpF2YARuz/AnbWhyuAdPZJQq3nBWccJuj0iDjI+UYmC52HJvuKDf+E7ZMvS6+ozUGztPuTl87CaRL0zns5GJREtFA4DqAredHP9eTC8/zdfgOi3OE/e8lNxiDwwoqygDZjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716399924; c=relaxed/simple;
	bh=8RuI2BlDY9TsfDblzXetGai3dFFKtOAvbVTUb5I43Kc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i2ytd22Vev5muMDT60ufE7qrLgRFwSGLfL2Qbl8/2T4jHGq2sS8B/ERRjuN5FM3DRWi1MFrE2KDUB0wT2xubRhTU4uCO+zyViPc5cMegDWLDM53ZHn7O9eEkBmUSMDyb0crOErEKKNyKc9u1kGYJ2I3N5OjLpw3DS6JVUYc2PjI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=RkTQg0/2; arc=fail smtp.client-ip=18.185.115.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="RkTQg0/2"
Received: from 104.47.7.169_.trendmicro.com (unknown [172.21.191.80])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id 312A11000095D;
	Wed, 22 May 2024 17:45:20 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1716399919.819000
X-TM-MAIL-UUID: 3ef97294-d9a6-431a-8bad-ce300f009dc4
Received: from DEU01-BE0-obe.outbound.protection.outlook.com (unknown [104.47.7.169])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id C815710000411;
	Wed, 22 May 2024 17:45:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jn2BI3oub4HA89q4gDWXjhTEZLBgh5CGA9xMDrvHwaCwTpt6jfjolnk0JIKNDFKJUBOf4Mv1AkGNjF409bZrhXEgUzpOkPXmurW00COf4UhM8MoVtzBjFfbBG7Q47uUws8t0t3VAern2frsix3+WSSuP4iI+W5L3F0z0t0wOmPXBB5PtxzdNhUA67XZJc1Ey92G62P5+/Bo0x5v/BFHUlg4odZZBIs7c/dsfMk3oQ0OJmTwlVJSPQWWU10Eys16hvgWyMsKXKMC8xvrwU6p2ItEXrb6ZG2on0jD8qrXreRJWYIjSyPRtMqpexgq0fZyUOLGekv80gQNo9Pu7ln51yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zk21wrBvZJLXBY0XhLNEqNd0ldHgoExgrwCubi16HDU=;
 b=ho0Gnarp7LtcSppUnziMyGk7sVTUfRRDwfpUopRRKOdRMVx4wq76Ua5+xNqZ5M1sc93uSQz446wxLDv4I3VA/QbDyXLrFod+/NesF3X5imKqzXFrxO5CZayzFrMprpkn8/cu7QInyeDqoAo9NZ5IfjEzopdk8C3sGolwoPslqu5VOmbJg5YR2sKRJiS8N/XACrpEmxWZxElKKKzFdr7JQ64Xre/Atf9iKB8BMjf2ClKdEiOW+FJLDl2BwXYuJkA9/X6lKjbiIH3XAmtr27pfn0+b4h7L7NTZ6hdCTZTeVEvG9NdWaOCPtuIMOTlkRDleG47XVDBTFsasMrPaS/eHXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 213.61.166.92) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=opensynergy.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensynergy.com; dkim=none (message not signed);
 arc=none (0)
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 213.61.166.92)
 smtp.mailfrom=opensynergy.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensynergy.com;
Received-SPF: Fail (protection.outlook.com: domain of opensynergy.com does not
 designate 213.61.166.92 as permitted sender) receiver=protection.outlook.com;
 client-ip=213.61.166.92; helo=SR-MAIL-03.open-synergy.com;
From: Peter Hilber <peter.hilber@opensynergy.com>
To: virtio-comment@lists.linux.dev
Cc: Parav Pandit <parav@nvidia.com>,
	Peter Hilber <peter.hilber@opensynergy.com>
Subject: [PATCH v2 2/2] admin: Fix driver requirement subject
Date: Wed, 22 May 2024 19:45:04 +0200
Message-ID: <20240522174505.57675-3-peter.hilber@opensynergy.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240522174505.57675-1-peter.hilber@opensynergy.com>
References: <20240522174505.57675-1-peter.hilber@opensynergy.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9C:EE_|BEZP281MB2948:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6bba03be-538a-4950-7652-08dc7a86f1eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|82310400017|36860700004|376005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pYyxGIqhCrQaJwpP1Jha4OmJoeARclgjpWCU/36cEMfBDunAzdYY6F25QbT8?=
 =?us-ascii?Q?ZMJd3LtdFvhH1R8oBIPJMpWzBmDopGGFKx7r2Yn6EhbFsBq0tKEmiOQPiF1W?=
 =?us-ascii?Q?lbDiyAddx2JYU+iX2QAsoByb05Q8k6/ZBK/lzv/EFQz1VbR6To1YNbfx57mq?=
 =?us-ascii?Q?pIhSB1LRKNLoCkOOeUjG+0oLWuzh1QrNQNJtEXeGjcEaYYRV8JNd+eu8pkiV?=
 =?us-ascii?Q?lXkf+2/3y0vXakCiKbdiypRVBzHLnrZTvlN3Xb3wFJ3iLw2UyV5Ug5hPgJI3?=
 =?us-ascii?Q?Gc4v/PCLU61zhhER+NfTbVVRC75PxQbiY/XE+FWwRbMv8zZrDwVjuSXx3Zao?=
 =?us-ascii?Q?htQmI/qCxVqIsCs7WpgwSeBNq3S/Rqx9xLY1uVGtu69RFQE3BojPFYAG/X6l?=
 =?us-ascii?Q?4nWaiqOB3v5xC0SLwITCOYR0X7zsQeEL7yVxKDg4YFqnO3/U1fThz9VFV24T?=
 =?us-ascii?Q?HbOf6n3p7PGSeC/XdroeMorTxwTOlHwC8EhfJSiP4NcTi1l51HfIuSf/GjFG?=
 =?us-ascii?Q?ydRLvkO9nHdyoYteTh8YILuwH6/NRBKametQrdn071JxsmdKonZLyOTuBRVI?=
 =?us-ascii?Q?znFKzqGeUbADq6CGMpEW43rMS+zXnKRIq5DfBrElCjInYxcuPLwIP3WJGnel?=
 =?us-ascii?Q?ZZDrjJT8/MYy7Sa17Ux0nlVeI51Re1NCjzaIY+33j3aUBjXf26b63cUVHfaT?=
 =?us-ascii?Q?lUPgFAqIHwAcB96hUy2wD+1Uqbzam7jAXUDTA1/686jIPuMceBB/dc9iYUqA?=
 =?us-ascii?Q?l0yVrupOuuBNmma5OtV55w8X7yWufJpo2BMdnxXx9dW0/UUGrr5c6kM54VG8?=
 =?us-ascii?Q?6rh9qf9KuZcvnKPoNjQh+sWN5qMuolAxr4CwmgDlRJcKiSX0GkSf+Shol8R7?=
 =?us-ascii?Q?m6Qrh2qdQcNEKiQlT8lf1qJ7RWthA7HWufq6I/3+Z+bSE4XFtWPtLT9P4N7G?=
 =?us-ascii?Q?gxM3j444ZfhPdxxtaH90ShRGkUZQw5wCHjDQlrjjARbtKwupEIntbfhWMek7?=
 =?us-ascii?Q?ldHe5VmXlaLgPh5Rujig3NlHNJBC0vIdRMGwaIioXymV3FmT4kiYPG+ybkLs?=
 =?us-ascii?Q?gq2kvy83S98pw+W+w9MmfKFCH9XRTiYtId5pQfzZv2PE04eJA80sjCNhmmH0?=
 =?us-ascii?Q?HtoIWDC2bVg/I55Zb7uuhl1MCPlGIlFm9CUEsuDwmxZ7RRW1V8ba5D6YtLtB?=
 =?us-ascii?Q?b8tSuGUwVAXgNen6DvueHM7WD6GCSE2X/81PCwxSDlCOwTkiTU88Xz8LRx4e?=
 =?us-ascii?Q?lTfsQk+YIVeAnZj1xIbjQfRgz/cqDYWPfOak1/ibt7YyBe6GN9Ei7ddjdgRP?=
 =?us-ascii?Q?MWVOmnBgwc49wF+udTxRq06NjagVF6dDTHic3JoszOI4pHRIYE7OVcV0FQuq?=
 =?us-ascii?Q?4rqJa13p3aUG5S1XcPn5Z4N7lZPS?=
X-Forefront-Antispam-Report:
	CIP:213.61.166.92;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SR-MAIL-03.open-synergy.com;PTR:exchangeconnector.opensynergy.com;CAT:NONE;SFS:(13230031)(1800799015)(82310400017)(36860700004)(376005);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 17:45:18.2089
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bba03be-538a-4950-7652-08dc7a86f1eb
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=800fae25-9b1b-4edc-993d-c939c4e84a64;Ip=[213.61.166.92];Helo=[SR-MAIL-03.open-synergy.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009B9C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEZP281MB2948
X-TM-AS-ERS: 104.47.7.169-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1023-28404.001
X-TMASE-Result: 10-2.814700-4.000000
X-TMASE-MatchedRID: y64C6oV0e4emk9Ke6CN7uZgVeq7CYXzT59KGlOljPvuOspAJM82OXQk4
	3PZ4fPrqlplw1dcdxwbvoLs4q3Jyra3XYtsOH2/QRYNhzuZZjRDZ/IoKYBoUVqloHyDFpaEst5O
	JHXe84WQAer1XvHjjzusQNAL2u95wXDp6qYMvm6sRLjqoJJt/9QR5+QyMmGZgC1uKFU3yK1Pif8
	ERQoqh9SaSuBfcJyImOwBXM346/+zG2YTRZz5KA8vY2b1fdy87pbbHfBJ9DafxC4DP2oDT4A2q8
	nOT2E23
X-TMASE-XGENCLOUD: dcb17a0e-8ccb-4360-ace3-1e1ed5ffcf11-0-0-200-0
X-TM-Deliver-Signature: 132AEF11E0440C05DFC0F51538B5532E
X-TM-Addin-Auth: Mg6nbVZT6JUYk7RIktGAyvWeXBQApifzWGbZgOZPzsVvAaKdwsTpNgLCDPb
	4ugbJD9WJE4Fe1lNTWExO8C4SKUMAozB3UUt2CDCmgFWurrOm5pakfozMLfhhOjGwVv0tzdke83
	u1Sqx4HxEL2NKaUdiInH0Ec7rnuxV4d2ertWydf+n8GVZOGxuRn5/wm34UPBGuY8Js+Og+7dbx6
	yJvMRrtniLGpuI/BFNCqKDfAqbywGERT1LgoCNZPgNgqYMFmPrmqidblf12oGWfRqePWZD2ZfY5
	LDrc/vNfSXlG7gs=.3yZdmcxZMO+Znf9bdfqUgcx1o/0BHBiQ7eKHeegClu6pVIX5Hqaopoi0co
	B1P8Sy15pkioQrgjHw2fijah8Sd9Wu8evSGca0Z5Y3W0YAqc7IdtV8mztVPkoWdlxAqtW+2xyQl
	NoRccaG4/zQOdd2gZf/9R+e/9BHv1UcB6mbkxLLCP+omh4PDXwbhrHAvVrVRZjFmoddlN8FYXrq
	VsfmXOufkt+FniDGUvodSrBahujRxwi3+a+iDM53zuRXWeJlb6dlBiJbnSkm6N4zUeoTt5pJxUh
	5N6gUe9IRwaF9WVVG9qNn811Q0l6kdoaRmF4nuHzlMD6gRy60HB4ZSKfmnA==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1716399920;
	bh=8RuI2BlDY9TsfDblzXetGai3dFFKtOAvbVTUb5I43Kc=; l=1101;
	h=From:To:Date;
	b=RkTQg0/2BPx+EzaV8y46ZwLAPeG2cEoh+d3xXPqr7JHnqYuNvxikdhomhJXI7Qvg0
	 gEO143yfTIpKsnYcj7UAzfhNzE6X5+vtgGzQncBxfcU+1dRZ/6NcjVnXjYlnKQ5vNb
	 Wk/kenRu+dTSUPgSJhBJQynwd7h5MnHzgayQJK0+VO2eSRPkFeJDQhlrlr1IaYrS/h
	 m/ARpv9Pd+aw580H4dtvhj9/dBi8X1nR6AtsC1x1ddrDe75oDkTQMLJiWmsSixBYEk
	 J+KDUU62p7zLHMTa6haI8hpsJxtiJkZzo+jL7fgefTR+NuQvgesGo1Jz8eX+5oQA3T
	 wddrY6nkwiDWQ==

The driver-normative section for Group administration commands contains
a requirement on the *device*. This requirement only makes sense as a
requirement on the driver.

Fix this by making the driver the requirement subject.

Fixes: bf1d6b0d24ae8 ("admin: conformance clauses")
Signed-off-by: Peter Hilber <peter.hilber@opensynergy.com>
Reviewed-by: Parav Pandit <parav@nvidia.com>
---
 admin.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/admin.tex b/admin.tex
index fdbf2ac5a93b..3fc732b153e0 100644
--- a/admin.tex
+++ b/admin.tex
@@ -583,7 +583,7 @@ \section{Administration Virtqueues}\label{sec:Basic Facilities of a Virtio Devic
 of \field{struct virtio_admin_cmd} that are a multiple of 64 bit
 in length.
 
-The device MUST supply both device-readable or device-writeable parts
+The driver MUST supply both device-readable or device-writeable parts
 of \field{struct virtio_admin_cmd} that are larger than zero in
 length. However, \field{command_specific_data} and
 \field{command_specific_result} MAY be zero in length, unless
-- 
2.43.0

