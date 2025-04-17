Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011048.outbound.protection.outlook.com [52.101.70.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117711FFC59
	for <virtio-comment@lists.linux.dev>; Thu, 17 Apr 2025 21:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744927066; cv=fail; b=l0nqWaNe02Vw/bHckmxDLto8foKpcEheT+REACk/z4twudbw5cBFcSPvUfST+O1NgvknRB6RnKZCnZWMbF844DzqgYo4AvMW/2NKi7Y1GPUGbD0Gt8TfNjmm0yEThKYUO8mkaldfaxzAkVdvhbw8O+qFQ5O6H51VnN+iZ66jMqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744927066; c=relaxed/simple;
	bh=rPTQke1LEr3DDgF0JESbvveaQFJTHBzyLlv59vjpzlg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=sdjTV4P8MiOy/GuYCosn3gKP9BPf5v1QETkoI7RRxFbVjcUyG/MHNujkWJ6HXphxOuH0Nw1HPjB0Faq8CoACraSVMVxb5IJ8oTRPWB8vIuFv9DchUTePPbqePhxhPZ6YctLQWQBWi0sm4k88wC2QYP60Msnlj2jXb0xhnMNsFv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=JvlZbDZ1; arc=fail smtp.client-ip=52.101.70.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="JvlZbDZ1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cKjdZ/4Ka/0VUv0Z6T2eycojXcSS/HISzxrVI0uGqMV+LSPbhEI5VSmBvCeltPP2HWn1+MtiKILa3rBuYWz8CMttxkAzeqkyM0eejrEBW2fRVi5ojFlWvTZhPzfwRo0ELFV9GtzutsROtEXWKUrRN/3JAxqd2GIIrTVrzp296MZxF1Y5LpbkWK+HExnKBn9EMy1iuJP1M5Y4LEfmHWNUMTZuA7zR33ALcAawukfn4xZjalu2VppI5tGxbzRRvSib3Mv2J5dwGfYONov1TT3strwwKjSKw7NA2Fa68nKzBe1rAlXOD5SHfKPBmyOXlmAHazymFeJ0NNvhSaekKkrqkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RIJZODD/adPFLcwUUlPku9xlMvOVW6qaS3KRl6qJSQU=;
 b=j6NZxzvnno/CkRFEPnTdbxygC+Aejw6/D/6p4WzzOWzQ1knarhZ/oprCKw0+uR7uvpOwNXqWWe27Vbvqm/KEqInRu4oCGUKJPrUdW919cMjnTuoCi8QbK+3qNPnwheXrakRDn5YhwJ6+chKotzyzMwfagaIbq7nO95ghMAE3p+RQ5a9QPy4fARFClKyAPIB7SyqTyHJEB9sf2mn3P0Vnqj4xPSglVqEfFHO5pAJpsR1UQLOX3xblJCt+e/0b4WgIpvEa2Md8nS6KF923LkhzVyDI0sZizFsbMfxzvrDPvyxlg1Ot6mQl8RBVo9/Ym+zK+D6OIwab6gMGsTchpkzlfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.20) smtp.rcpttodomain=apple.com smtp.mailfrom=nokia-bell-labs.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nokia-bell-labs.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RIJZODD/adPFLcwUUlPku9xlMvOVW6qaS3KRl6qJSQU=;
 b=JvlZbDZ1HHfsJrJIhzBAtEO3K0P3byppppJBF9bRmsZvzTSO2Hv3w+bvZnmu++A9dhRQJbWt7R9o3XrpE3ze/MjxqTQlBB8cH7kyWyoxbArwnPlOnw1Uo1XVRTaADj0Msztg+jvmRmCRBIIxZKdrcNWAKYrc4NeCNLV59Z/VQ4IVIhTEzRRtN6R905obAC3cbo3jrwNI/gROw6NeENPUEVJz+1rg1wDYqfst1CJI0S6oQRx5nAjFEZ6AGYPfmwzLNnNncxJwhE4UiD1vdkC2JPNOz5qq0+sMXBLIALAneI7ozejEX6ttuZSl5dlS+jz9m+M4vYBH3WtDg92KOf+D8A==
Received: from AS4P189CA0057.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:659::6)
 by DUZPR07MB9720.eurprd07.prod.outlook.com (2603:10a6:10:4dc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Thu, 17 Apr
 2025 21:57:39 +0000
Received: from AM3PEPF00009BA2.eurprd04.prod.outlook.com
 (2603:10a6:20b:659:cafe::4d) by AS4P189CA0057.outlook.office365.com
 (2603:10a6:20b:659::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.22 via Frontend Transport; Thu,
 17 Apr 2025 21:57:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.2.20)
 smtp.mailfrom=nokia-bell-labs.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nokia-bell-labs.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia-bell-labs.com
 designates 131.228.2.20 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.2.20; helo=fihe3nok0734.emea.nsn-net.net; pr=C
Received: from fihe3nok0734.emea.nsn-net.net (131.228.2.20) by
 AM3PEPF00009BA2.mail.protection.outlook.com (10.167.16.27) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Thu, 17 Apr 2025 21:57:38 +0000
Received: from sarah.nbl.nsn-rdnet.net (sarah.nbl.nsn-rdnet.net [10.0.73.150])
	by fihe3nok0734.emea.nsn-net.net (Postfix) with ESMTP id D6C092004B;
	Fri, 18 Apr 2025 00:57:37 +0300 (EEST)
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
Subject: [PATCH v7 0/2] Update ECN and Add AccECN feature
Date: Thu, 17 Apr 2025 23:57:33 +0200
Message-Id: <20250417215735.20982-1-chia-yu.chang@nokia-bell-labs.com>
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
X-MS-TrafficTypeDiagnostic: AM3PEPF00009BA2:EE_|DUZPR07MB9720:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d931ab28-a0ae-4649-a83d-08dd7dfadec2
X-LD-Processed: 5d471751-9675-428d-917b-70f44f9630b0,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|36860700013|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?0m01OYgNIJdkaEuKOmCL6L+cgxgWn+4ilkm8TncDWywAaZi6bwQXu7a8DDCN?=
 =?us-ascii?Q?s91CTngmvb2A25pJpr81+Hi2KvVP9SeYwFQaNqAxxSkeJsnd3UmMcFwtb3Io?=
 =?us-ascii?Q?3fNY/yNi4HOK7wPxqtrUBcXYytrPtr8Q3jVIuGlJ5waGCAYbvQ6ZJGKoYK9Z?=
 =?us-ascii?Q?+yc06mZzBRG1hEjFfRcGyNliLXOVdFozl9kNjNjSSm9P0ZziYiSQ+cM5OAhp?=
 =?us-ascii?Q?qKp5gy6cpMU0P27wiWgf7cSk8pS32vpUuLPDueSJ54JeXrrO7MnoxwMmVaR2?=
 =?us-ascii?Q?B+eZiQ81WFNVsy1zP9kyl0QSvAWzOYWjKebUvl30vx4NV77fecas8F21ISUb?=
 =?us-ascii?Q?Q9LUmJRAZvDiQBvNyFb/GvEgiXpmfdSJUG5lIAdt+34oovHftRHqRU8eBwFg?=
 =?us-ascii?Q?uRpx3fOT+pjrG6p9gf3j13OvOVPj8CGdWzMtw1ljK4OfIfLUBMKIfEgz5wqt?=
 =?us-ascii?Q?d4pdETKhhU/ZG4MtKOoHW2vMH5HdnY7F6m0SVCPOaTXHqW9D44/rNXPvTaUb?=
 =?us-ascii?Q?c9TAvKvb+u6s8Yaa7GFQ+w+c2LUe6c5GoaaaWpnyZiDwFZzuAFTTimDID4J+?=
 =?us-ascii?Q?GzYc7Y5pNHGJtDGJ6CBGKQ6l/FHe3EVXQMWHG9hyWv37L6CjOI0Hi8qLx9mb?=
 =?us-ascii?Q?Uu5bIWyTsA8/JMwRy6m0pQhSHxjbBstureOWUxX0Pzs3Dk44DxqfVBjM0zUP?=
 =?us-ascii?Q?uw0p06b+Lk/maj3zI1gqostL2JNOp1bUcJCCvNd9qgBn86xCcAsVlgPTpccc?=
 =?us-ascii?Q?E0Dv5MnhnXNhGMlOmPv8CCAOYj7PeWiKU2kNoNGzPZiTkwv8EjcFxxIQnRR/?=
 =?us-ascii?Q?6HtpFE4yAT0ZjEnXM1yIYihwgL2YJPDNSDnh3SqM+Wi5oYqWVNI7RskTqGSC?=
 =?us-ascii?Q?uAMiQF0sGOfZ5xwXBwJAKWJlPRx3PhRspCzkz08vOXIO4YWogOr3EDsHVWpn?=
 =?us-ascii?Q?eTfFg0w6Ik2I5PeCMIKwC8oRCz0dUcVjc2XHPZYCtQhrSsoqy9yUtPk4EbfH?=
 =?us-ascii?Q?YJwCDRLHqgeg8xGP90vcwiNdK4rsprjAy8WRlr8KoiZ5azSJRzZlC89tPrjZ?=
 =?us-ascii?Q?qtustp4JB62sFxX/R9UT9c94myJgA8dfCm9OuDpc7sjHpw4xFhOADiA3FUTs?=
 =?us-ascii?Q?3GZL//4onamDJzsP5otr7j+6C2BW3VkOTW14YPkhjJH36O26L/sH5Nma8K5u?=
 =?us-ascii?Q?7+KxKUDrHxg/Yvqv0q9DV+DJzMww1oOoRDtPyZa83g3ShqaVR0mEfSdoiwAb?=
 =?us-ascii?Q?1ViY8fKedh1So72afdSZa9jwvudWKIn+X8XN1uvvKqMSl5jiBbYp7QNmsIzi?=
 =?us-ascii?Q?t4zSDEDsgQOB1LyMIkk3Ruhh+e49P+TPwotcommXA2m92MPpaA3BiUV/G0BR?=
 =?us-ascii?Q?FJFjs0Uh8cwUYVhYoz55+j8Gr9ws1mQJ9qUzV0Z3bbg3cAlrTdK5rl+3FNrY?=
 =?us-ascii?Q?dK2cGuFqbGB/WPP+PpTXZsOIukqM6RLYi1/s3QHb2MisJ1+5YszRCu7UyZrx?=
 =?us-ascii?Q?FnP0jH0JIZGxi7FWcdhVQ0nCVJHkOmUUPOW2DUO426eH4n6EaN+CGULXFw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:131.228.2.20;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe3nok0734.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 21:57:38.8135
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d931ab28-a0ae-4649-a83d-08dd7dfadec2
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.20];Helo=[fihe3nok0734.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009BA2.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR07MB9720

From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

Hello,

  Please find ECN and AccECN feature patch v7:

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

