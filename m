Return-Path: <virtio-comment-return-7062-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3943C001B0
	for <virtio-comment@archiver.kernel.org>; Tue,  8 Aug 2023 08:35:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1869ACB166
	for <virtio-comment@archiver.kernel.org>; Tue,  8 Aug 2023 08:35:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 064479864A1
	for <virtio-comment@archiver.kernel.org>; Tue,  8 Aug 2023 08:35:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id F09BB986466; Tue,  8 Aug 2023 08:35:34 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 748AE986460;
	Tue,  8 Aug 2023 08:34:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i/fTKr8GWtx/i4+QdvsNFZFdxu7rWG7S8sWKB1hawivY36EjQdKLPvJjyyxL0d9H9R2AjhJJQ1b75Xa3TI/zuGY1ne6ee3So+VexQ+XXftv7nVQzhw6o77MwF6AZFkOVEcgCSdU1FMZLaFsVEpVpaJi8XGv69Wu4FPnRhGdq5KC05lgl9pNt5eQ1HWQV/K2S6/RmP+CL2JUb2+6H2VAnDaMyaiJbgwvwxFutM//6BUWmybZ+fRr11RUA/3yjVY1g2ZWenUmFZBvs9rCLa1VxS+RBlDm7LKOUJGTrswC1Ve3C049RtLUqbBwjDIpwUsa5TzWU3mUqEKRevB1AvtxEZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
 b=bqar2g5YgcsOc2p0RV1uK6x2VfKuaOUi/hjBro3auWzo34HOfcOUa8OX6VmU+dL3JAr/tQXL8WmQAzcvDfN+Gvtmt/X2xprX9luOEO96/L88CVHPV6NzLzKzjIL2yEmAvYzCcfS6odyQjxQw1CqdilKpG10UgeppPbs3Pw6tNBZ8DTuyxKD4dqOZWaJNNRlFLrNJmMyYnUxzu87AU3T5DFJJXmwyfL5RX0nDzGT5Z1x+tWhobbBlB/GK4h+x/ahtoYCloOmd8I3Qnrp2IrioxCmNXSsI39d8kaLCCvHGkHRqd8SUnfIwQ7rRQ2WDwhcqXTmYe0rlnayDAh7p0xD4Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
References: <20230724033421.249893-1-parav@nvidia.com>
 <20230724033421.249893-4-parav@nvidia.com>
User-agent: mu4e 1.10.3; emacs 30.0.50
From: David Edmondson <david.edmondson@oracle.com>
To: Parav Pandit <parav@nvidia.com>
Cc: shahafs@nvidia.com, hengqi@linux.alibaba.com, virtio@lists.oasis-open.org,
        virtio-comment@lists.oasis-open.org
Date: Tue, 08 Aug 2023 09:32:47 +0100
In-reply-to: <20230724033421.249893-4-parav@nvidia.com>
Message-ID: <m2tttalyoq.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0150.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::10) To DS7PR10MB4926.namprd10.prod.outlook.com
 (2603:10b6:5:3ac::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB4926:EE_|MW4PR10MB5837:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c7e02ad-71da-4d9e-cb32-08db97ea557d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vndJCBx4GoeVMxtCp1Eakkr0yrGIQ7LFAvGsIQuUb0l0YwZx5nkQsAnCEPos0LYSnIRp3RICwIAa7g1w4dcPMyOwC4VYxYzpTS7bKjM4hWwioDlTu2inI5JJjszQiBLami0WrgYIakdhIQkhD43XTSm38dym47iXW9ER9Fsyt4HB0XTfz+q2EQiz1+vxxhPNO6LVbD0U9AZbutaJ/yEGySNTKH5ZR5ueK1Q+HHb5mQEJJD4gQKafzqjpE5vtKObUQnxwHswqk74X1yWAyiMWnybSWelh8Y8dTFgu91cT7EHlzdG6QPhvLp6OYwF1ErbexOCc84UAMO5yTfrjV8n6o2+DR+vSuTQXWw4aJm03BEYdoZ9GtoyMk2V3gUeFwFlPD/RWttLABkxcp5T+GVFGWw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB4926.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(396003)(136003)(39860400002)(346002)(1800799003)(90011799007)(186006)(90021799007)(451199021)(4270600006)(6512007)(6666004)(6486002)(621065003)(86362001)(26005)(73894004)(2616005)(38100700002)(6506007)(4326008)(41300700001)(36756003)(8676002)(8936002)(66946007)(6916009)(316002)(2906002)(66556008)(478600001)(44832011)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xZC1POgtr0+ski0m5l0LOEAQL9hM030MrFp7AP7nVSHyvBw5AyLCLBsxoU2H?=
 =?us-ascii?Q?xgIPMAzZ8tDJAHYtFwK7ezhM8eLcFOdWEoIw72bbq4LjpW+TAy6AcCG/BjN5?=
 =?us-ascii?Q?yLOFdtepAHEQ4maYHH/58ELlm1swd035fgiD4mU3nSkk/2qloVy83PZ8Zf2+?=
 =?us-ascii?Q?IOaZTnbxYAcb6v1WhhZVoJL58auEw9xrkyuiCTaK2Ciwd7NTjiGMdhGTSwBW?=
 =?us-ascii?Q?+jHuqi7DU9ZWy2cRQWkkGG+YJ30SrnvVGuFi9QJfGmYjglTYvxFJDF6njiMK?=
 =?us-ascii?Q?nYfA6Inl81+PjRcZoX4KcpMxayBQhx6iuxQCcBiHkXexlkRDUmq8rWQHyGhp?=
 =?us-ascii?Q?B5HR4JvwTzfGaMd5tKNJ/8GnvR3s05hgnsqW2Cu+6HR4vgYaGsL1eu3oEcmD?=
 =?us-ascii?Q?Ot9+wM62c3188lj6Oz5r21ZCFGce6vLHp+hSODsaQWp834h2fQlz7e6aEZZm?=
 =?us-ascii?Q?TVlUxpWnnEjGTIEkrC2RJq0r472LRfQOwqPs7LPnlZZMS6SXzNM94wLrciur?=
 =?us-ascii?Q?PlgewMVc9LwuD26cOuPxsqIjDUl03Prsc1B6l6N27kM4l2n6abEHabwTHtZW?=
 =?us-ascii?Q?xhvXqM4fWOsd4e7U9PVO99BOruyVH3I01n8/q8+mLH+v3zRddAQth1MRd0/k?=
 =?us-ascii?Q?0oKHti9ArD7LDXX+rk3i1p2PbmDq2ElbcZDRasnI0/3IbejFcWROHKOP82nM?=
 =?us-ascii?Q?JuNfWbsAkN2g4AdFA7qN5+QhqFbq6hEzOrSP53xJiU+jcK5w7qxPjxsy5YRz?=
 =?us-ascii?Q?oP1LLyYdG/MWecYqtzLN3OPabjryYf3gUBVEvJAK9KjQwv9gR5QP/5MA/fsV?=
 =?us-ascii?Q?/ZBT6BttnQDoIS5RX3YOTBhcVyqFYaC0K0Ikp5cz9De6L/rLcCpaAlELnEmt?=
 =?us-ascii?Q?KMSK/3CXCbUzBl38S5aZgIVIdASEIZSkslJAka7Mu0nX8s2yb2adxda2jjOU?=
 =?us-ascii?Q?ybmrAik52zzxFZpV4BcbJx1ZTCYHLTYUj1gRBliA1hWTt0aa++2dyX230ogu?=
 =?us-ascii?Q?zkSsWuiMYnHsp4nXQ1BIMBI3pOdTGzPvykO7Fv96upp07Fs/r3kR2sJK9UJx?=
 =?us-ascii?Q?psUBUsLoFvH0uyIWuLBQTbL0QEK/nLvX9C/cJ5/J4lKxP92IXoaCm2EONfqJ?=
 =?us-ascii?Q?8Vht0nI0wttX8cZP1bVNFk4cToIu27j+UjaD4tfUxhYXJpcPQgNrVt9lwF8A?=
 =?us-ascii?Q?t7EkCZ6t87WUNuOmzzuST5zVxmtE/UDjrX4tiiAGgFHCK1TNBQaFu/2pPfyR?=
 =?us-ascii?Q?+pL2f2m6dA0NYAr83hN1U5E42wW53fzDzdhGpb5j+YZQzHoVmaT5e2Vp5fke?=
 =?us-ascii?Q?z9BkTjrfWClePJExU32p69cQh2oeMQr7XmIpuw+SWP7jSqAkpbV11yluigvH?=
 =?us-ascii?Q?oRG44LbU9on4wrdR8e3a805bBZNdUl/BXr+wWqic1Pw5XIf2tzv0hHZ+EZSM?=
 =?us-ascii?Q?LH5+yPYLwyKoeTnoaWdB9bWf1PTyspAWmJNfNS6Tczehalm6kC7hg0mKkMRr?=
 =?us-ascii?Q?V7zNIV/vtTIb4JcIh75qVCz6HUJjF5ACgaaaflCbD8tEBKQWq8/DPdTMVach?=
 =?us-ascii?Q?Ga2OewcC77ygyShv8JoS77jyNvml4NL2xdVyy5xwFj7aW1mqafOSt+2w+Pad?=
 =?us-ascii?Q?/A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	AYTWw7ffq5AW3p2ewG1NEgtjX+iuiy48OpeAumipKrk/kkIC40WrdQgQTUmTFva9uxpcTxfVk4+RkotJld81OISiy3a+geOdmPIqcoFnk1ndluA9lKrboLgxK7n97Rtj1XzPv8pdiNtHMeRGzJ0MXqgbYyT/uMwmQoaV840s0Srclo3Ev9lk4dMXO30iAYHcJyUNkW32YCAaK0YRpifT41gc0z72bwh2IW6gvxVQSDUpIgXc8CICHMFIO2c7+3CSbmY2wV8cqcwElmNpDLix9qiYaZzeqCIuXWp+DkKj4Ftt+AcledtxImp00wQKuvLNefeV8ECWrxGT8gjUz9LD3rtO5GacvsjbBsKJyHkC99lOV6xcyyB55jSSCtVPx5NOjnfJjXgwTmE1gXyIp62WepqSfjoXX0GxQJhuJFsgKV5RJjhJeNlwZl5gdljZ6URKU2M8z10UbSxRxTltFZ39HoWbGqyOK2TNAGN5BCzTi+zPDDgW4BV3hjWgckChbqsehrgFWY+T8+SnN7V4HykY1hZMod2uxbBlEHZdYDkrLB5Nw6sHDtuNdp35K8BJN9VhXUKwUC4WeCbBbPFn5+eWEIyUF0vSEaZYyt9MWlzSOH3AI0BYQ+bRpN5LwapqDILbJ8WxsC7PzJtPeKv0Hsa8Jm5Ay1sBvZtHoyR4yW+XE2uji1jpuxSbCcWeHVQYbTRqc6miBv9fZyN6N3bfpNlrM/FMoM4F0iW9awo+0p8lCuTRNpwL1ZcHurile4Yl3c1T2QEJ6X1FmK9hNnodtmnLM4n3w8oRHgRhku/z8io6DQXIDymxlQ5sdIfLRijqLOcdEZBZi6H7D1P1s4SAAZbwwjB8m+Yoz7/vDNFKcwvanMs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c7e02ad-71da-4d9e-cb32-08db97ea557d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4926.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 08:34:51.6411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WuW7AGztgQvPKTgme29LovVdvRrKl7n/MC2G/xWEcJZ3PM8vIWmZ4l1byT70sHm1VarTB69P/+quQVMoZghKkgXH/8pzwiJ156JUPydSlZI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5837
X-Proofpoint-Virus-Version: 
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 bulkscore=0
 malwarescore=0 adultscore=0 phishscore=0 mlxlogscore=804 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308080077
X-Proofpoint-GUID: NjAnMpJ11SHqEFBx1VzQ19YsyiWh4xCy
X-Proofpoint-ORIG-GUID: NjAnMpJ11SHqEFBx1VzQ19YsyiWh4xCy
Subject: Re: [virtio-comment] [PATCH requirements 3/7] net-features: Add low
 latency receive queue requirements


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

