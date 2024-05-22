Received: from repost01.tmes.trendmicro.eu (repost01.tmes.trendmicro.eu [18.185.115.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCDD13DBA0
	for <virtio-comment@lists.linux.dev>; Wed, 22 May 2024 17:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716399924; cv=fail; b=pmvecQjBJv9V7mv+yYBfObmzLv0+veERv9JalTPukZQWf29ATBXvVl28ilEy+PdRpUmKBxOYzHR3wlW5/VaViVZdqnPyVoR/R6wTIVgb8sNtCLJMoFb6ICJBUXVyBGAiHbPGEPwSbmdezubFnzQCPmm5OrmBeQBjoJ9QLHTJ/Xw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716399924; c=relaxed/simple;
	bh=FCikXFpEliz8HtQAQ9jmnXmsX0zp+sX+GS4irGWR80s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jjpcSQX/GlffmD7EGEa57n3CKmq98aJ3t3k5Ni0VMZvJXLQfG3n3oDuN4LZjWvpftKrfrZQbDPOF1GZXshqb9AYFJODX+t7b9QphU1J5qpFXbwbKOpRnG/wYYDsI9zYfzNXE+ZVIrXQQiItPJB5KTAjcy+kJPruF/y2CWIFKD7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=L3yGM2ph; arc=fail smtp.client-ip=18.185.115.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="L3yGM2ph"
Received: from 104.47.7.169_.trendmicro.com (unknown [172.21.192.213])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id 49CD410000E04;
	Wed, 22 May 2024 17:45:20 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1716399919.944000
X-TM-MAIL-UUID: b8e28d8d-6c52-406a-adde-e0d88f8b2233
Received: from DEU01-BE0-obe.outbound.protection.outlook.com (unknown [104.47.7.169])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id E6B5B100010A1;
	Wed, 22 May 2024 17:45:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sf4SvYk6sXAB9hrjNs6uMryU/gX7NDZhBnKQorHJoXJnXZFEs7OPPGH5jkNcdwKc0cL1cbZvcIn1QNdwhuVo+4Pr+qR5uS5iPdz9OZA520JkhvgQfz4TDLvZQY1ji0UoKax5AxPUS0eblpsANeJHXLnMM77j1+GDjY+YOYcNijzx05Bo8VPkr8Oi/A0mqqsGWYnYLxbKzr0+g428yHlYdWhhGcpxB9833Zu8ShpO+8KtRXP7GapZxCeGvMuxZ1FDUpK0v1ccNJGRDT1v3FqcWTWck7oqePq9DskuicGJtMN0r9ybd012DC3tyXU43lJk/5fFd9vig3VOaqtjdjIuFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HLdJtUmzJnyFRHvpETJ77HrYPijS4xnLvK6yi3Abjq0=;
 b=A/HLxVvU40oRw0od4+0xPntNhABYECkXFDiAdqw/66QzHT+JC8o5Vx5w83Q6vGHyG6Q5huCeC2R/PopP/mgMq59zmXYXcQyXkrW8Pv/gNCd09wkeQgccWhr8imMjB0vgkQtpEUUJvGpmfl8rSU9vzwvG15K9ttpYCUy8EVMj1GDkZAO03Q3QCcjR5U8/v+8DqgtlpedrjRJYnz/lmJdc+/GzKD07VFwnx1FIZAfmE95K+/ulxskTtY1G6iLL1J9iXgj3Fi7fGRLC7TqHF7M3d+CaQbfLtiTNz2w5fnkSNJVdbflWNvpeF15ttFiUkepu6nEE+rkIXuFVN4CC6qLLTw==
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
Subject: [PATCH v2 1/2] admin: Refer to "no order constraints" only for different queues
Date: Wed, 22 May 2024 19:45:03 +0200
Message-ID: <20240522174505.57675-2-peter.hilber@opensynergy.com>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019A:EE_|BE0P281MB0273:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 057401ca-6c0f-4f7c-1144-08dc7a86f1db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|36860700004|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dEStjLhyb3LLzAkZMSl0mj1+DR5amaqbWkc84yobmx5w5FM4LVODAT7yXY5L?=
 =?us-ascii?Q?GJgGzGJPwBcisg/B2q/hbXBmA/mqlVMkqt6MiBHXa2KPkmwp2bVg5EcAvZ4B?=
 =?us-ascii?Q?+EP8TEw6rqBJ9LPrwtUW60ZMchhKr943R8WCwqu0KMMNGSE0i/m6B5gykEPT?=
 =?us-ascii?Q?V94xfZnaN/jzL1/nNe2wdB2F5yPkPG0UTz1rOR7oKp8z3gk3KD9IVRGO8qsN?=
 =?us-ascii?Q?obPMkeB86yRFmqYsFnBr85Hfeu+94QRIdnXbTfDR0eoH/Mb96/HS04crisI1?=
 =?us-ascii?Q?OAxzjb1eElmf0CgtEPy4DEnSZsmlLqIgTxpQJSlcoQ8Fx0g8SMebiB6N0TzT?=
 =?us-ascii?Q?yl94sUYu7XDffp+j7c0IvDLIUk23KOFGLFyhr4l3CFZh8LrhPIYAOpIHdui3?=
 =?us-ascii?Q?RgVeghkE04iGsG5QXfuWWv6xYx+gqUaoWzB5j1kHpxuNM3Hl/lDFkPymQXuO?=
 =?us-ascii?Q?kGjiFA2fB3krlqqAtjJi2VsbCE13DSxv/Vrm2k+xTkveLrrmAM3fgd3NvT9n?=
 =?us-ascii?Q?JeQBs5LtU6BxRVqhgHWgEHTvdrCPe33HUoYnTCnT7S9vMwh/m5ZiiUI5d2Gr?=
 =?us-ascii?Q?nOvc7DWYCY3FouM5yj6PviWlk3pJ4TgcX7JEM7yZPJS6RImpNq2qWYb2LlYG?=
 =?us-ascii?Q?bxDwk38+7jrGYT+sJgOXZ2yn9aTatby+TSIb4vSpCr+TDiPJGdA3vV7lVonl?=
 =?us-ascii?Q?Zu/sqq13wf01aBe7UoE85bj5Fi7Q/gTBFr1pOoW1J+qBKrxuYigd0rxnqL2N?=
 =?us-ascii?Q?kVpr1WZzLkANt2HMd5vIfURvcT+mmvqDK8U2Rumfk18GF5/phOdmHSyK9sVD?=
 =?us-ascii?Q?hRWlAkt0Ye+h+WcYYQLHul3GpVouI5iMr2Pz/NvqnerqOzaJnhhg4zrQwWM3?=
 =?us-ascii?Q?O7tHyztpDNrgZ0ogsC6IZ9N8EOKM82LKgBUpTgP5uVf9G/gJmk9VylArSf5E?=
 =?us-ascii?Q?4S5wqHK9CHx8Qm28Dnl3r2r8SxHIqxPnVIqDcel/LYWwf5LwfghxT8aulWbS?=
 =?us-ascii?Q?mFAoNS9JCk42u2rJV/oKS7LuagwfxDKrKxENq5t26bikYgmt34B9Xxa9IpFf?=
 =?us-ascii?Q?7Db2fwu+NuT7iQFRKkDZ7bEXENBjb8y/FNQON3TguJFEcVt3ncSvkxk+0Vvf?=
 =?us-ascii?Q?S7+Hagq7TniNssPILov+V+PW6/WGLoSC7LMatPZVDVaeWmz6lOkdPb8O7amj?=
 =?us-ascii?Q?+vyzXoJL43mZ63cWiLLCg6/ckAwA9xJfqe/qTJBXBZ9VGMNLhVpqDBmGGR57?=
 =?us-ascii?Q?kbgKd69Dj/pCEtFDzuRSxlK5LYCvVua+L0PYPfXL9EwWnvJEsSIXLT9kP2pJ?=
 =?us-ascii?Q?0LSpCuVpiD2hfNyGTJfH4ImCg4v+tbxSZn0Gt/irSV2hp5CGTNdnJUADiZ8l?=
 =?us-ascii?Q?v467sCflcUtKXTqqPVQWZSgS9E06?=
X-Forefront-Antispam-Report:
	CIP:213.61.166.92;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SR-MAIL-03.open-synergy.com;PTR:exchangeconnector.opensynergy.com;CAT:NONE;SFS:(13230031)(376005)(36860700004)(1800799015)(82310400017);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 17:45:18.0858
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 057401ca-6c0f-4f7c-1144-08dc7a86f1db
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=800fae25-9b1b-4edc-993d-c939c4e84a64;Ip=[213.61.166.92];Helo=[SR-MAIL-03.open-synergy.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE0P281MB0273
X-TM-AS-ERS: 104.47.7.169-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1023-28404.001
X-TMASE-Result: 10--0.357100-4.000000
X-TMASE-MatchedRID: g+4mrP/+kvhHh0q2DwAXLuz7sT3z+1wghi9GR48RQB7AYsa7JwqXV4ba
	F6RQTZz9QWrwTQcQ3Z3/aUWAnMYE96o4G0VKdf1fC+mr+2Lx3Hx+rvFZ7FWrXAsPNAkPeS3QMnz
	YHHThMiBVwq3aldsC4plGnAC3gM+P/Y5aTtdrip0ZD7bjq+6lMGzY00haS8Qo2ubnxCjreJ+y3k
	dtFI7dBeMZ+gHJICghjJ4g9QEm1pDSXOJlAKRpIlo/1P3BDpl/jh4sOI1Ut5vw+KWqDQjsmYXrN
	S+xKlbqvcQWezP8mntcjo/oxcevNHtXApm0iq5BW8gh3wzbqBMkSH+8HIF4DSJUNkNrt5r93+6k
	97GsyDhATUc6/6IXMmHErKXRQXWLB54aslEby9++3nnmPc2fGIDJJ95Lkr1d
X-TMASE-XGENCLOUD: dc0f7e2b-9e44-4f0f-a4d8-66c4b34b9f47-0-0-200-0
X-TM-Deliver-Signature: 7A1BA4603B59F6C77EA4AF02FAB01EBA
X-TM-Addin-Auth: aia4zK8A+qeC8JWNI8hR33pnIuULApVE8+3pM9SSw7ALcgVCWPpn/cdbIYd
	zMKenT2UmLlDtf79I08SfnEPSuIgFvPW3UEtFe4EA35LuuEwlYWdGrNaO0L0BedCO/NCvWN2r/s
	67WMwD23KoHMTdZBhYw2KfAwbDP6VF3nSOu6MyXIn6eUCi73vQ3uQ00r10sFotSP7gvEUEbK/a2
	Y7kgH7tjNpxPDUuAK2oyK4PcIG19JruJ/nx5shD5+ZEPvIj+fS7b/Y3eiJ9BbqpVIfDPLJVYi6N
	99F2ACP3LpsOjpI=.xb0vugSMWkK7v1gO2Gzr04kOXWHezvkvZNVfFzidqnQwbRRTA+pEz87lNa
	t9RfSUmRfR0ayHWa0xQamPxVC8eAeM4qPNZf+V5i8ksNfDBgvTkBiy8D6INxeuI7vnxJi1Nsm7D
	a9/781lqD1wSKcvCFSnscbq3y+XTmXT3R8Arqg8emi9DaH2aDC6EudBtRQXc2WDJO9eCIGMjkGy
	ye33YZEdYIBc2CnPTGhrBTyr0CkMdzSpObzGqXQ6cWXMxxqsZ+SfIn9hKC49kLf0J7BNTZ2HU5K
	815oO/+8uhPTDYQsiZxS4fSjNGfszfjetVtefmk0D9PyL3zC/Hr9jkdQ2VQ==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1716399920;
	bh=FCikXFpEliz8HtQAQ9jmnXmsX0zp+sX+GS4irGWR80s=; l=1615;
	h=From:To:Date;
	b=L3yGM2phe6RKgcy+frbf0xfeJ5ZcQYTN7+pqgQSyvoDPfuLxvgl4zZDrCSftQmkHG
	 rBm5KTRpLnLhh9wNlteW6BK46udYaFoHtakdIpbtidnyTsDMVqEEngBuuVu9NRSf0N
	 D7RnFscNSUrvd+AmADHsIX8/1NhUBAVSkiaERsY1qO+hmmldpM3D8VkzrLMu3ucwH1
	 731X1BgaRcWgN2OXzTvi4pYY+RJJJkJZy35vNEeGBC+sET1Wgecyr7a/m819x7AISM
	 VIfohtAwqo7g+T01ZCs5iZxsUJ8PHKGMxyOtKeQUz/3bnO5ucgPxnJ3mN5i0Zu9rPA
	 tSaJ32QemHh4Q==

The non-normative section says that administration virtqueue commands
"will be consumed with no order constraints". But actually, the
requirements stipulate a total order for all commands in the same
virtqueue:

	The device MUST process commands on a given administration virtqueue
	in the order in which they are queued.

	If multiple administration virtqueues have been configured,
	device MAY process commands on distinct virtqueues with
	no order constraints.

Fix this by narrowing down the scope of the sentence to "commands placed
on different queues".

Fixes: bf1d6b0d24ae8 ("admin: conformance clauses")
Signed-off-by: Peter Hilber <peter.hilber@opensynergy.com>
---

Notes:
    v2:
    
    Be specific about case without order constraints (Parav Pandit).

 admin.tex | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/admin.tex b/admin.tex
index 0803c269e5c4..fdbf2ac5a93b 100644
--- a/admin.tex
+++ b/admin.tex
@@ -457,7 +457,8 @@ \section{Administration Virtqueues}\label{sec:Basic Facilities of a Virtio Devic
 The driver enqueues requests to an arbitrary administration
 virtqueue, and they are used by the device on that same
 virtqueue. It is the responsibility of the driver to ensure
-strict request ordering for commands, because they will be
+strict request ordering for commands placed on different
+queues, because they will be
 consumed with no order constraints.  For example, if consistency
 is required then the driver can wait for the processing of a
 first command by the device to be completed before submitting
-- 
2.43.0

