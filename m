Received: from refb02.tmes.trendmicro.eu (refb02.tmes.trendmicro.eu [18.185.115.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20021373
	for <virtio-comment@lists.linux.dev>; Wed,  5 Jun 2024 11:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717585356; cv=fail; b=WK+dSKSWwgXSJJazXrpM+1He6fXVZclgh27dar+hskIGKpDVhfLnEYYUBjk0cbVM+43Y+T2gJAnOXj/e8/FdOemLlnf3koWB3PsJZH87xW9l6gUaBi+NPIVjqyu+stOMeCTNsbJyEgVSjfn58WfDoA3qc9o4Ak4gtOThc60KGiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717585356; c=relaxed/simple;
	bh=yAWtrRyrhgg0amz6U5EaPT09sllHUECs9LeHpQPjPVA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hSXzKUTq5YNTkIG0V7awI7B8MWhBPJyltGv4I4cxwCmMjBfR/NKkvKmvWkh2VPL7YFJt+1ZzL0442/9BkFseXDlDTQnn5AUv356Ovz9pFJ3SzULm1pIxLjMMWR4Ayq9y0mEPD6nXXNiuK9/kdWI39oedGe6YWbaVpmdjFhCdzaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=EPoxA2Q3; arc=fail smtp.client-ip=18.185.115.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="EPoxA2Q3"
Received: from 104.47.11.168_.trendmicro.com (unknown [172.21.10.134])
	by refb02.tmes.trendmicro.eu (Postfix) with ESMTPS id 54C0510000A34
	for <virtio-comment@lists.linux.dev>; Wed,  5 Jun 2024 11:01:52 +0000 (UTC)
Received: from 104.47.11.168_.trendmicro.com (unknown [172.21.163.121])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id C1FE11000177D;
	Wed,  5 Jun 2024 11:01:44 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1717585304.422000
X-TM-MAIL-UUID: c18cd92f-cb59-4070-867c-e6fd586d7527
Received: from DEU01-FR2-obe.outbound.protection.outlook.com (unknown [104.47.11.168])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 6735D1000040E;
	Wed,  5 Jun 2024 11:01:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TZ2/ytaUPO/g7xsBLzM2DkIKBm8ft6od5nVUXBlKqSwWsYmmVlq4E9VMUiLMmFXMYW8A+ft1dSL/gIuQwvUAIwSLFfQeSNT/EuBcCnDnLCXYEH9RdajkX4D2mkjT6Hoocef+YkvxxT29A2iuzz7xQE+OGWY2Il++Hi/vcb7rXyXEBPnn4ECa1IONLGh7Tu5EtbyoSEDKp467alO1TQRblQJiMzysZRROQ90yNKsNgWvVJnJHvrkDD45hiKKn1n5InG3ak6x8G1OAB9iWy7EWCBiWJu+Ch9e2Rz64Q2lNdf4tkH9qbXg3AYEBD9j2QAdhyrMIuuySQzSAtihbVavWcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twPA+zyukf3dvet8SEACJefSX8Wi8AgiOLmlBBSx8m4=;
 b=mA4TW1FAyeXETVC527t/9GVuf7Q/T/4/Mp613SUuUXG4qaJhvoc8A0ySuhoDXsM8MiWg0XsDSHZx2d0938NbfMikDRfuskgYV01h1Qmld0WSo2CIezmrwyq6AU2wk3LcdwyuS7muIkCvSxJiyfrczQyd0cc/D2ogsgQDKaxSbgbT71hKYsL6FAyoRyneck+l76qsBjXqbDbyvPaAFYcxyjk2+DvDBbvatUR5cNaO+6RE7fqmOHdeYDcN8GrdRE7yzWq2athmeDW9eJo3aBSpPRrPk5kDrwSrywwmuBuw1A+DZlGJy7ufjq15VGnk01u0K3dPSS1h7ZGcgd5XEp6gkA==
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
	Stefano Garzarella <sgarzare@redhat.com>,
	Peter Hilber <peter.hilber@opensynergy.com>
Subject: [PATCH v3 0/2] admin: Fix requirements wording inconsistencies
Date: Wed,  5 Jun 2024 13:01:31 +0200
Message-ID: <20240605110133.31568-1-peter.hilber@opensynergy.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61D:EE_|BEXP281MB0183:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d67594bd-9f72-486d-d082-08dc854ee226
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|1800799015|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XtT3uX+/oN3Knxjps//JvH9ub+Meu6E2MdB/ztV0WAUTnnMeaSyTWckwFbYh?=
 =?us-ascii?Q?hokq53Jrg/nz/XG9ZwLzp1C0P+7MZnZ1+qvJgrAzHeVfRDTPZZhhu8JpBeT7?=
 =?us-ascii?Q?RCX+J0htprPg26GTeyvKtqEpp3Eco2M3ygfSpJmW+xWXBiDrDXa/RVDFyq0T?=
 =?us-ascii?Q?h2BdtYUQWUW7C5AwYSbZM45uJm6cfWTQfm6+Co5LCUl0GhnnTvwxQmBhGB1V?=
 =?us-ascii?Q?ItaV/AvgykMf89f6gXYedGTkp45Bx9gektGFzyeZY8ZTlYL6fM4/ETKIxSU6?=
 =?us-ascii?Q?NbDfdxEvLPxc2v3g6z86nlKrvFDDkSnFs5lO1rBKcHXKzdsdSeW8oFxz69PR?=
 =?us-ascii?Q?xcEufItoFjAjQELLQg5q90ilOCWLUZ6J03lAlFw5E6B1wwCnz4qPEzlKIWFQ?=
 =?us-ascii?Q?Xx75vfAyPUlHFJIc/t2JOi3oRYJX3wiOsb84tYC2z3iv1V6SGCnITUXqAUbA?=
 =?us-ascii?Q?QsYaUthhMjMFz5E5sirdfjGlrAGDqFKGGQG41Npws7+C+Gt3SOgwaT9TFDIC?=
 =?us-ascii?Q?zW3i9j5RmLPGJ0w6mCHAawMQr6+0qJodqbX2lUtGNOHRMLbz5M5pT7UhxjFs?=
 =?us-ascii?Q?BoROCvlKOPotNke9GA6wRshnx2dtbTh63WRi5A3vBbDzP8Vm3DIiahYxmQKj?=
 =?us-ascii?Q?8N8BjRBM51Dw7Wxba1coeak3GIoatRoD32VipqHiTJPx7mMOznfu4ib+ZGkj?=
 =?us-ascii?Q?2kcet8aQFaA/UNWkRWQp4IGTqMi0USt1V040qw18PaDnjQ3SRcLckRsFJ86l?=
 =?us-ascii?Q?NLSdk+SxA1BXB0Ug3ubM+w/JD7HQ+QUHlx0c+OXVBePqE+ys5XWEn8CrtvTR?=
 =?us-ascii?Q?x3Zo9Di/UMgDAJo56OBrtf1x0QoaHI0uxG806xKbehBadydQGQ75rSB/VS6L?=
 =?us-ascii?Q?QOGtvu4+rj1Mg50XA4rG4X7fpS15JfPV85Hin9dZueRzr5fgjK0tjGkzlxpz?=
 =?us-ascii?Q?KcAnoLvG+/bzgDkatnNM7Yl6vecW05NTkrlxbcOiQQpBWfVSbAepUFNn16oq?=
 =?us-ascii?Q?Cj3jEEbTkHC4yZWmIftnoE2XHyvpAlx05Oxt2H9AgdLdN4gfkkinxL9/PQ+6?=
 =?us-ascii?Q?LaR3BSrZJdqnp7k0qBl1xJNcpva2ZKwL/pBnoX8Kd4DYfbYcVW36NjqeyGgw?=
 =?us-ascii?Q?fDgqBwhIL3nTITzqWdWglcFO9LQA7ZlS1k6DrkIiwzLPiacyeeev9gXBfEKA?=
 =?us-ascii?Q?S8s/ypTvd8ZEybS9/G5f+uoKHGT2fxXffUMZCHtuOWeB0lm4MkuBn6la9qXn?=
 =?us-ascii?Q?IdLz6W7zwj+ybM8lMJDKPaTLtjQc0zadtz3pIyY0/Gc8FRfYiaBSvURs85+S?=
 =?us-ascii?Q?mrxZkmJOU8aV6Py/TT4lGZHL790JgWyJpNHlKmVRdXgIeqIPGcQV7tp5KVOk?=
 =?us-ascii?Q?9i8JFkQdtBtZsblCFvnGy8aN6jjFzWKFzzc7TPrm+nMyQQoegg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:213.61.166.92;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SR-MAIL-03.open-synergy.com;PTR:exchangeconnector.opensynergy.com;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(376005)(36860700004);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 11:01:42.6811
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d67594bd-9f72-486d-d082-08dc854ee226
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=800fae25-9b1b-4edc-993d-c939c4e84a64;Ip=[213.61.166.92];Helo=[SR-MAIL-03.open-synergy.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEXP281MB0183
X-TM-AS-ERS: 104.47.11.168-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1023-28432.007
X-TMASE-Result: 10-3.202400-4.000000
X-TMASE-MatchedRID: rnHtMJHWtX/MuRev46IJiJtnlFv6A7oh7gd5SqHIhjLGhmdxjnivFj4z
	WkJArHvIKij8XYxyJTd47M8LMng65QJdikbdsraSsZIjJc0QK/a3BJFtyO5uJFIzPHeqXZhDzJ/
	FCco/WS26miiB19Ur4l3jHUhSUqcUe1cCmbSKrkFbyCHfDNuoE48QyQ3JBScciZHHs5XulrPcIf
	Zk2P1epUiQSPZ/ZWuhWjsaYI4lh3ULH2qjGZLbHXe3zYmbXQ023ioPTmQl+Dd/MXEW/MXrvd3TL
	40mQHPK
X-TMASE-XGENCLOUD: baf3dfff-88e9-44fc-9232-cead3cd7cdcf-0-0-200-0
X-TM-Deliver-Signature: 60D59225E19D81D17133EF0670CDFECB
X-TM-Addin-Auth: KCJlTHqz8o2PjgwBuxcrPg5CXfWkWFQeOl1UUFPVSPzp9xwXt+UNYpp4fmw
	uY2MuKHEHDzvTL7/q/sQzLMmSECx0I0ejFbxpGPl+X6MEYKGU0vP+gJt9J8szQNIV0US5VDN7FZ
	j2KkCoHZzOzSck2yJEK6Uu4xVKIERcXg9M28/JAMmnM81MByd9y0uNM/UTk+8JLom6aIQ25Rt0B
	1B7DRfjYDxyCIo1oyPCNWtewsaSUS55S3UqlsgWZfTycKGJ6Y6PAqSH6GooaGwyWOxGXR+qCT20
	5ok32y+aabCGQ10=.Ib9UREfUfHKz0XFtievvoiuM9uVdzA87HqNX1kSy5UcNIc4p2lO851TRly
	mU8LDveBBEt9oJoXUK+yrCqlLx6Gh5yRVJOnYxww3y2F+oSlf+0LU+v8r6g0aFNLAZl8AWXjHZz
	isW+Xy84V5wJ50BfkQDDLBSY6d/8Pu+xcqsTEUgzqs+IWwGTf4fhN5ipA2wHR/G5k5xFOB0a1bX
	5PVyV6vwJ/DA5i7gv6AUcOrnrAPIeTeoX5gtlr0IDNRy1kelHHRWB/Qn5Ie1A4AGsxe2ekRWC3+
	U3kBv8maFph3nTjlZB57dMASDI+O+9qyHLCkQCnTEMTRHC/6kdwu8jyCHmQ==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1717585304;
	bh=yAWtrRyrhgg0amz6U5EaPT09sllHUECs9LeHpQPjPVA=; l=676;
	h=From:To:Date;
	b=EPoxA2Q3SZpyZ+oVzmMzqZq54BycoHfI3JV16daYwqLTsjQ0TZu0d6LyyKpPDxL9V
	 5CztQ5fyQ1VjDBlEYMtOjh/oDFMlhHKVnIsdxD3LFUn7lw2wqos0rs+bNAkbkhUDKe
	 EhuB5Hkug2aTm97LOJgTCUVVCkQRBpuQwYZHXeobj78oyGoOK+lPQ6SCma61kzLRAu
	 BiIyXG3xXAp9FmQ5qBpOCwGy0WasYbBedph+AC+H6ngDRqE4L0aKvatMoIcppLbL/4
	 SUCSCNVDznVLeFkYcI4vnsPtAEcv1rOpzEfwYj+yGdE2x6HV6m2JWpeRtq2rCfGEu9
	 SvXNOqfk9R/zg==

I stumbled over some inconsistencies in the administration virtqueue
requirements wording. These patches should fix them.

I think they could be considered editorial fixes.

v3:

- Refer to "virtqueue" as such (Stefano Garzarella).

- Narrow down example to have different virtqueues (Stefano Garzarella).

v2:

- Be specific about case without order constraints (Parav Pandit).

Peter Hilber (2):
  admin: Refer to "no order constraints" only for different queues
  admin: Fix driver requirement subject

 admin.tex | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)


base-commit: 71fe8e907c9d20c53e8327bea99360cb3c529ade
-- 
2.43.0

