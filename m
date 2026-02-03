Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012063.outbound.protection.outlook.com [52.101.48.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A23BA21
	for <virtio-comment@lists.linux.dev>; Tue,  3 Feb 2026 19:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770147805; cv=fail; b=PuqS2lOFgVG9KzNdRxcN1vRjcYk638NfN6+WT5j+LwPZZt4yPsJ6qILvYEAgsIrv5Bzg56bwIJ3308CVGAAC0m5JO46xFQwbrGO6hikZG0CTmaVrjXaKSz6+17jOpxZD6Z7iCI7+t0WYxstqRNLFDwDBUspVfEK1F2L5dzPRlsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770147805; c=relaxed/simple;
	bh=ioNW2ecSdOhOnfODc4c2fztQYw8ZfUt8qnJIRrJ7G+U=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=smRLFY56NOqL0j1ctiKZ/cBCPkaSsbNgTi3mXfHyGP/0y8qkB5LCKhBNcMzJwiDRz6qY4uYOhzT3dzv28UxRJ8XSwWhVDQlnwVRYaLR47UvvPhACyCkMHbQtAeAtjZJe2HFo3/3mfn//2vBl7h3YMAvHbghd5kqjpL46PEWXHsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0ddJCLea; arc=fail smtp.client-ip=52.101.48.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0ddJCLea"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZdQkhmCAKRPSL/8W3A6/mjaLX3hee/XDUuH8aCEa++o5j0Q/ziHvAmwQsag9hhrYNh4E7vzIu2eJU7MnL1G+dryWNt3jL47abXyi4p3xBNWHQPAsyAzeM7A8qplQ44TcD3P7e4HVbospxSi1qoiiDkAK1hzs3j1VCwG74UkyWvKQpSnnUUEKmbuWho93XE+otkvw8SwqH2k/z1l8hKw8MRi3nq/BYqjBbJmtX5aLmbah/zR+nm59ILEW3zq2+USNKD68F7vIyDTL5N9DxM1iSgkQ8SGT/D1eiIp3AqRlKG+zOjHVTRX/cUcfKvjQN4N7CMIyemXUD7LdqAq71A1jGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VVOnI6sreTbTYZNx7FS982jpsBTLSZGoCpjyjx2QL64=;
 b=BcdMpGKDfaIgmubYfXSsXui5hV7u6brNb/gnGSuksVC4g2Q5mkk2rYcoT1YEt+KVD0U85d4cdG1o6GmR4+3ALqqoUvMsnyOOGCIex4BQN9D309GwL6BDTmQc+aAMQK3LT6AOzgXnPZ+8HL9o3LprBItGukupvuhzhpM4kzlGWG/Iu3kKVhPHmWX2zMWdf6/RRRQJBSNHDswJuHKWMvTchhptmRzSA+EOEanELgohaFvsFMj/vwAADer7Ab6n73mBRtZAoUfi9tSDib/rF+4AB6Mq0yWNPZOXMSU+fIeu5KYwbdJ/zQvO/Di4tTVe1zMajieE4qWN3HNFRxoh6Kj/Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VVOnI6sreTbTYZNx7FS982jpsBTLSZGoCpjyjx2QL64=;
 b=0ddJCLeauWocDhFbpZ02swbCdF2uxKvdOoN4vZcglYZgyut1R79cfRJ1ZRRBFc01Az7SMn6xbPdEA+AQyp6F7pncRbky21NJ4/tTDHHZx3VYreCxasOJIsJ1YrtCwBGV7n/jN2FXu+zOO5ZRzRxyK/e+YLEjZTjo6Q5X15a6Sck=
Received: from SJ0PR03CA0100.namprd03.prod.outlook.com (2603:10b6:a03:333::15)
 by IA0PR12MB7506.namprd12.prod.outlook.com (2603:10b6:208:442::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 19:43:18 +0000
Received: from SJ1PEPF000023D6.namprd21.prod.outlook.com
 (2603:10b6:a03:333:cafe::e9) by SJ0PR03CA0100.outlook.office365.com
 (2603:10b6:a03:333::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 19:43:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023D6.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.0 via Frontend Transport; Tue, 3 Feb 2026 19:43:17 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 3 Feb
 2026 13:43:17 -0600
Date: Tue, 3 Feb 2026 20:43:15 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
To: Bill Mills <bill.mills@linaro.org>
CC: <virtio-comment@lists.linux.dev>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Viresh Kumar <viresh.kumar@linaro.org>, Alex Bennee <alex.bennee@linaro.org>,
	Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 3/4] virtio-msg: link virtio-msg content
Message-ID: <aYJP0zUojOdQ-Imx@zapote>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <20260126163230.1122685-4-bill.mills@linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260126163230.1122685-4-bill.mills@linaro.org>
User-Agent: Mutt/2.2.14+84 (2efcabc4) (2026-01-25)
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D6:EE_|IA0PR12MB7506:EE_
X-MS-Office365-Filtering-Correlation-Id: 76330980-572b-4330-0739-08de635c7ab1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OtToZOQgrqDZK6Cj6mD7kHYJat2Rycm1Q7RoWwURl7YS6W+g/E2ria+Ax7CI?=
 =?us-ascii?Q?2VQm6d3D8KpAEyqDhbzuDKjNmlC0WhVIHVGX0qiGQeS4zOjbFu6gxsuIy7yU?=
 =?us-ascii?Q?L/RK7R3av2Aj3J+Fqlb5H0ijucUr81cLQgsc1lb2dQ27kYZfZa5RxNQjhjMz?=
 =?us-ascii?Q?kD6y9EJ6vVkun+RxETGXT7iCKBZ1ogY0rDIsXLIzcXwMVkKTDK3tF8DAO4zi?=
 =?us-ascii?Q?anj2gfrkQ22fGOWUZJkz1IR0WkSnAhb+G5yrT+kdWJ9iH5cXL70EIlEPc4Ze?=
 =?us-ascii?Q?nsH7A3JbAEdLiCgIqZFzGJxvoo32ccz4i/Wny3Ca6P2Enu5rdh2ULZmD02J4?=
 =?us-ascii?Q?ApLQbh+yO+r1Huto2bwsuhhn/jxhzXpiEJLlIPRXSGB85Gta1gaFtMHhWkQB?=
 =?us-ascii?Q?lGRekm96JfB2C6kIUD+KV5RC+u+YiSJjo+MN5tmeLqFsAMdP7bc4rc3Zn3xZ?=
 =?us-ascii?Q?EV+qrRRXfyi4F/8f09vARaXYV6Hyc2tQLLu1K+bozx9Sz9c7CbfHP//Rj3Pe?=
 =?us-ascii?Q?BiFYacLORQBKRiR9nRLFzDCLPOrK8fKZj6yTlygpS2cjf6BYUClBjPx7yQH7?=
 =?us-ascii?Q?wH2nuIcxtMGLjZ4UqWdzUzFJ705j4WHxOiJ5dYkLerxdrH2Yn4h22v/nfuUq?=
 =?us-ascii?Q?LT7UNhe6+8h3Y+DGuKqWbhSQO+aoF5F4rxk9NRoec6WLIKMbx14rv6pwYdHT?=
 =?us-ascii?Q?nFtTL0mIR+rPzScajiaYw8Xucuk44OB0VZservP3DqwsfaBWBRvlCJFQKrEt?=
 =?us-ascii?Q?gnunvSNRgyw1RhzGyJxiR2AgnUQchR6RBzJLnzkzVs3Zmysj98cb3LDNYcYv?=
 =?us-ascii?Q?t0BDPEb3g9aCOpVquRA6KPm3uFl/JmEVLEB6w1+U06zB8eCRWBm5P3RlhWyV?=
 =?us-ascii?Q?+wzg0QN7cRkf89yyZwHkbnC92t7m9Tb3otE/aqjZgrtsCEjAWPJm58dGPOty?=
 =?us-ascii?Q?xALzFoX+wcMpvbZUSCAAAAC9AGgzJpDGZhmGLV8Fsyh3Qpep1AKQxTyZaubX?=
 =?us-ascii?Q?nNHi3yMP6NGoVu1uG0N24+J73Org62eFn6T4iqz3RTVtdCDRvnzcP04khhaQ?=
 =?us-ascii?Q?QLtStRMnrmr7DHkXQKnA4intt7pYDISc+Fh048539pqxte+vOpZq72HLSPKK?=
 =?us-ascii?Q?8kLCvGtiyBlDwTnqzevKBlQxEGvaOw0DZTluYRH0C9B9ZjdSIRZdnMWTL8lo?=
 =?us-ascii?Q?QgULmyH3BXtC8B4k5ocVOg4paEBiTY9X0JaRx1C8reVxezyDizP07hJvf/uQ?=
 =?us-ascii?Q?5DHIYRP8lPA54nCGwR7GlfeBxtFSKkGZxZmIU8iN6fdNe8nP+JnaHeOklTO1?=
 =?us-ascii?Q?YYnXOUhp8CifRBnYjm13RmNO28i++8rR327VJgARtNmM4NBmg5NHBhb5Uild?=
 =?us-ascii?Q?TJMnC+tY4zAoR8qM05r8EWpK1NJWiOZ1JbOgjzGtAXiX2lZNJpgJbSnnDHBx?=
 =?us-ascii?Q?+OyDSDRFFs886sGQ2Ncaeo/0yMBovK4p6WjoME6R9BXH6t4+LFRYtbw7/x/F?=
 =?us-ascii?Q?1JjRWf5Ad5SvmgwjIBS9f9DLAhb+yfbLkT6Ek1HWR1oC2KRjW/QO3ynV748q?=
 =?us-ascii?Q?tOOLIkSADHW4Qrc/tzMnbi1Pulq2g4xejFtzY/0+XWYVUbj9Gb6Kvs2LQWRg?=
 =?us-ascii?Q?P2kdMy+nqbJm43rcrCOE/29Vyg01uyouRyVLZYneqz+I1dsixccKDDVeG7Vd?=
 =?us-ascii?Q?/l2k3Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WOLmZoLAFpk0nZbGLTGcstg0KHuZnSUcmFIJTyRZQQ8qBZKbXBpAEGYPyqjLXg3irBBFzS5yazZ8UJSUs5hDZikXCvhpSyq1+XxaUxc9wXvI7PBckbqoIRq/uvjGyYcnDw3IdEe9IidxJsR+ABlI0ilfojoypVwzHXUw5eTwfMGwnrBNEdMbkO+HPEeEwiRNQoazIFF7/iMO2YAia4YpvctidmTURw12JStbIvWl80BU39RRfKqIjkAtNN9U9rZT4IQuCQ56gN8tjxtqf3LSeKA6dKkGNZpnxYhMRHovwC7D5jCu7NXsjiuAoqcnCYoUn3y0QG8Gx5pQMtZdJEYg8wPsTcxhaX19u6Y6lzXuUZzbaNF5HaTDxhE3wvBcxqkzUNaqwqFgwwZhaDJYEZxIxKDoG62ByfNWsLEg3sC10V7ZZYJrSzZGlzv4o+TQzdfY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 19:43:17.8671
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76330980-572b-4330-0739-08de635c7ab1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D6.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7506

On Mon, Jan 26, 2026 at 11:32:29AM -0500, Bill Mills wrote:
> Add the new transport layer into the content table
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> Signed-off-by: Bill Mills <bill.mills@linaro.org>

Acked-by: Edgar E. Iglesias <edgar.iglesias@amd.com>



> ---
>  content.tex | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/content.tex b/content.tex
> index 5de811f..c785c5c 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -693,6 +693,7 @@ \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
>  \input{transport-pci.tex}
>  \input{transport-mmio.tex}
>  \input{transport-ccw.tex}
> +\input{transport-msg.tex}
>  
>  \chapter{Device Types}\label{sec:Device Types}
>  
> -- 
> 2.34.1
> 
