Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010007.outbound.protection.outlook.com [52.101.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798AB366579
	for <virtio-comment@lists.linux.dev>; Tue,  3 Feb 2026 19:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770147785; cv=fail; b=tTscK8kM6eUrSUPby7peFWLq9KfU8EzNS/awbA/uVqWsbkWzdIFozkrMc0yj7xqxTtNwkbCeUkug/2s3gTdcqAORkVIhRX5+zonV/xW7cA/8RUuRW+0HitqK1tRwwrxH+CIlXwFOMpPo7Uq7qwxUIKGreNMJjlwfD1JDZL/v/b0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770147785; c=relaxed/simple;
	bh=LCkB0vpSU2C4fSOESidof30IExUNchXrzBAr9oYlWv8=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LxEFHZEIF5dPkuAG0iEpag4lFPvP8ob5Epw0BO9G1l5hPW7pFi/aGhtRKVqRTdpf8U5OVO8eHE1agwc3f3WPZ/dPPIBRkCqNjeKN2BiLqz+2KZzfq1BEyxOjRoSex9luhn/RTJaqep9nE5633t+f5Td2b8221po3BoFfQdrQjX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZMP3nsKR; arc=fail smtp.client-ip=52.101.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZMP3nsKR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ineu9jSl+6vMb+Ce6+olEn2Rtmql0Zsw/dJT9BoEevnceO/BbRVeJavlkVah0fDWMQq2Qz7QL46ons5Jw3nfMMl9fupzVAcsEzJA3SkJQA4RCu0j7/20XtKmawCFS9ivPItZB8oAewC3eCGayVyWYMa7gGPMSSzev0ryQrYO/WbpTGWyIj1m49AI4uiHTXs20vDT52z/jq5SgY1Vdv+Cxdhp4CYMgrquSNHyp/v0LlbSYo/92ghOXp9ZdE3PSrUGFXqyWHozi0qVGOcE52VkOne4Qr3xr338C1+KPC9SNCMROuhMjVCu4JwQEQ1jjy0jlIXki7e0x2OpL53X2shORg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dk5qg1DF4x1DLkz8xUHsfYfBZhpy7l3KAu4Mr9bOzsQ=;
 b=GUdHFrVjpXRbrlaQMYOHbhjnq1oP1M/ZmzGKd0gG21Fz9v0JcmzjEtrrvp25Gi2+qHXvrMwkh2p06lvJCj3qsPJzxXdCM0MsBfVnjhAIqEkr5vn2j+m5tmqKGgco3cn6q3ORx7oxHp26dTQmHhUM+TgFfDsWun+RAPUuNP7JMXX/2qMMghxTwrUfVAT6GgOHcq066ZzHsDLOQMXTBpaxEBSZKKdMbUwNdtnTjww+f9yVfKH0PmFVaH1lM2LlUBiyA93UExhdwotwClrUxeu4hXEW2FFD9zTBYGbqTHVndWPbq861pok+lCUN8+0gfrCea4rlHD9rxzOan6UvyRdwbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dk5qg1DF4x1DLkz8xUHsfYfBZhpy7l3KAu4Mr9bOzsQ=;
 b=ZMP3nsKRr+K43MWlTrboXm7Oj4erygnbKohRvbpMpJrJHnTWpFJkoGDgvt+/LK/fQP1jSd57ndVgRAmoEpn1tIV1fwYUhY3dcS5w58fvPBaFp0CnuFtZgt4KuLmLTVwrQKPGsAjZi65GW3SDIX9gCl38bHJ8KaAWfNUGn417K8w=
Received: from SJ0PR03CA0112.namprd03.prod.outlook.com (2603:10b6:a03:333::27)
 by DM6PR12MB4402.namprd12.prod.outlook.com (2603:10b6:5:2a5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 19:43:00 +0000
Received: from SJ1PEPF000023D6.namprd21.prod.outlook.com
 (2603:10b6:a03:333:cafe::ac) by SJ0PR03CA0112.outlook.office365.com
 (2603:10b6:a03:333::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 19:43:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023D6.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.0 via Frontend Transport; Tue, 3 Feb 2026 19:43:00 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 3 Feb
 2026 13:42:57 -0600
Date: Tue, 3 Feb 2026 20:42:56 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
To: Bill Mills <bill.mills@linaro.org>
CC: <virtio-comment@lists.linux.dev>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Viresh Kumar <viresh.kumar@linaro.org>, Alex Bennee <alex.bennee@linaro.org>,
	Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 1/4] virtio-msg: add new command for bus normative
Message-ID: <aYJPwEULbzmRt9sr@zapote>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <20260126163230.1122685-2-bill.mills@linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260126163230.1122685-2-bill.mills@linaro.org>
User-Agent: Mutt/2.2.14+84 (2efcabc4) (2026-01-25)
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D6:EE_|DM6PR12MB4402:EE_
X-MS-Office365-Filtering-Correlation-Id: c738b36c-bfec-4ec4-c282-08de635c7018
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0u8iBfYJigsHivmZHB/DyWXSku+ZRPEkCvB5nBupnyrd0F/rbRgl6MPpqLYv?=
 =?us-ascii?Q?3nT6zr8hTfXtSTKYGcqSXUkzm5Vo6qSLAo07c62cdaSQnH3xIZnCqmCaU6mK?=
 =?us-ascii?Q?YJy4z4bzkwbt1WtpqTe4qPsihuGYMbrQ9dH69TLTTyk83HhOj9qofCqR3rQJ?=
 =?us-ascii?Q?tdQ6LDpcSJ+cm6noQ4c4/cKO2VTRh6xR2O9vXVikAw+qg44ShKCjNxbgJcUq?=
 =?us-ascii?Q?MSv5fCf20qfB4VnwxeZuS45AaTtnQrlhfuY8dQkhPc3tjCfjJ04tiK5q3WWh?=
 =?us-ascii?Q?wNZzgevvW+EwlpHHY9q8/yjvAK9AKVyvSsQHVOC4Jm/KijkplgGZVwRtNKbp?=
 =?us-ascii?Q?dOuMbkf5Uv8/AuCSKzEUyOnkHwXn5DaQHZdEueWB8ncaquJFFQCwIHb+ZAyC?=
 =?us-ascii?Q?TXQSNxVhXJ6ASrXQUerlra3mLssdVALnfOm7XWvKF/wnFaiFbR0Jg80UH8xU?=
 =?us-ascii?Q?E5sFf8qFgioLYdqOxTc4LYKiMNK6GS84NTFVnfzAcF+gxkWc1DpG9Bkov31I?=
 =?us-ascii?Q?FLAUtcxOy7/1Ek1PaB81r4EyuE9L/tsee8XCCHjWiPweqT4iKWgKnWB1VxMb?=
 =?us-ascii?Q?deA3lm0ylsVBNAyGoObmz9MPvwiKLkpiCy5BKXoZ226OiEoeWVwokAYroWvT?=
 =?us-ascii?Q?0mt8lRXXsrY69E22dENGP5ats3T9Oc9nLQNSXNNnCpQG9ZSoRBM/YnxWd49/?=
 =?us-ascii?Q?CVuWgB5gz9nohKmGTiOsIRQGqu7MZRT5lZoCvzYb5gABPY3ZFRGhSba5QIMq?=
 =?us-ascii?Q?dsx48UASGltPOBFDt41A+kXUARAU2cTOsOuxRc1Hbo3IDYliO5JK5gQdaHbR?=
 =?us-ascii?Q?JnIOWhd6umj/0WQ03rzYtmO/kxcKGo2Uc9khkWT80j9RtTD+i4Feli6ihg6h?=
 =?us-ascii?Q?iyGBI2Q6RQExR5dBD2knnE25aWmX1hpenbQnQafXLdmBh1rT8wi4xyNiEyg0?=
 =?us-ascii?Q?1K4n2w+IvYmK3n0aavYmXbGXfhszIEGLiGlTcXD9LkoAqlGMbLvsvzGcFJCG?=
 =?us-ascii?Q?OkKOTxHb1rWlgNcIM8wZoVlAGBVHgKs4bY5MihfwhUE3DgXA95l3cFu/9HFD?=
 =?us-ascii?Q?JyOfyBnB1U0kDoYaZ14xaDMSh+aQfIOLgQK2VoFLcEGe9JEYW3qgqkKo8ZBx?=
 =?us-ascii?Q?XPpAnDf79XlF44+3SW71Dkusyf1wMDPWeKGVRyKm8hEmuEkcYnPktCzw7XSV?=
 =?us-ascii?Q?RyrgG2OjZJ331wl2wJBMpbicP1OgnEHgQIhHunXzOR3TMmCpttvUXOabj1Ux?=
 =?us-ascii?Q?xytNwhPlHPA+usgIzzkhjGRpX8SsLZMPHOkZYQoflUH+56tbDMNiq5W2GnR/?=
 =?us-ascii?Q?Bbk7Dr8QLcVXg/Y0mmojZpkPco2+IHi2pepcU4ruBnExM707WtwvRsow9nHJ?=
 =?us-ascii?Q?/Rf0DJQSnCLfVeN24fR8n6OUDLdhkAXfOhE9kaXn+5WDMA75CeenlfhvE66v?=
 =?us-ascii?Q?ltP7ZfblrzN+eUTMTxFVo3b0PzpewwUvBBy4cPLihnAAJlxi0h+E83jBoszL?=
 =?us-ascii?Q?mD5rQwFWfJgli+QIj0MwZIqc5RM0EUB7tVuwGQ4pthy/9wbJae5FzsG6h3BB?=
 =?us-ascii?Q?1ESbz6yDyGVyHrhJaSR4LggLgUU61aQEwG9RKxyHnPIRdB6CyA4degS3oqK2?=
 =?us-ascii?Q?IP6JVUQpYmsJqhiEKSpMT5zafDX0x4GtchyedulCTud3AyqdJx5tH3Nhb0RH?=
 =?us-ascii?Q?mgINng=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7NrToudIUGyQ6Yo2Q7QiQPSdlEdAvX9UqFZEf72pBKP0P2p+/nba4Ceb01z/BGnBni29jbmwDnrbgJiSdlS5jVnOw7gsOjkExLtRtUMPecgU3iuGInwuR7lrOgkQFJv4K6GBF/ZuKdP7ESrqc9/wUZT+k+V7E+QMkVs1HygsORXMstgmTOepzSf2Mhuesh+YITNyn/TvCxeDA9qtSxD5j8vQ1Opz4sB09Er10W7vLrSnacKpPgvHXhEYJ2EJFsUgvUr0b4GBm9SAY0q8aaGK11Em40QJiUPaTAfRi+YDX3bf7UCCKhiHV86KDKNo8Zm24YMng50noBE/oa9CDoxQKCoo6/nVRq5tGGNk1CSXpIChw0WAlPlASDIFuqTbux/dSYQLRI6nchsh/rWj8z1d3FHK3y+ZrkcaQDmPfBRAgHssnFXqyZSgCmOzLUdqd8fG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 19:43:00.0611
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c738b36c-bfec-4ec4-c282-08de635c7018
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D6.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4402

On Mon, Jan 26, 2026 at 11:32:27AM -0500, Bill Mills wrote:
> From: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> Add a new command to have a standard way to define virtio-msg bus
> normative statements.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> Signed-off-by: Bill Mills <bill.mills@linaro.org>

Acked-by: Edgar E. Iglesias <edgar.iglesias@amd.com>



> ---
>  commands.tex | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/commands.tex b/commands.tex
> index 25ea8ee..122a97f 100644
> --- a/commands.tex
> +++ b/commands.tex
> @@ -7,9 +7,10 @@
>  % How we format a field name
>  \newcommand{\field}[1]{\emph{#1}}
>  
> -% Mark a normative section (driver or device)
> +% Mark a normative section (driver, device, or bus)
>  \newcommand{\drivernormative}[3]{#1{Driver Requirements: #2}\label{drivernormative:#3}}
>  \newcommand{\devicenormative}[3]{#1{Device Requirements: #2}\label{devicenormative:#3}}
> +\newcommand{\busnormative}[3]{#1{Bus Requirements: #2}\label{busnormative:#3}}
>  \newcounter{clausecounter}
>  \newcommand{\conformance}[2]{
>  	\stepcounter{clausecounter}
> -- 
> 2.34.1
> 
