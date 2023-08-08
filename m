Return-Path: <virtio-comment-return-7061-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65972C001B0
	for <virtio-comment@archiver.kernel.org>; Tue,  8 Aug 2023 08:32:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id ACB9BC6104
	for <virtio-comment@archiver.kernel.org>; Tue,  8 Aug 2023 08:32:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9AB2E986467
	for <virtio-comment@archiver.kernel.org>; Tue,  8 Aug 2023 08:32:26 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8AB0498403A; Tue,  8 Aug 2023 08:32:26 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 793D1986460;
	Tue,  8 Aug 2023 08:32:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hkZysysX1+AG/we/Jsqna2Flzy1zaHa09qwZYlASv3g91h8k2u7wURe2/+JNNAMVp8JKLzeW6H/etIQVMSqgFNmOVrSRydbCpdy79FwN6CiPr220nGtwoJN0RXIf92CC+/hEaPyWK10vne2xN8cXi8zcLMWV8Tnerr0FFCQQqjxnYg2hHoDT49X8N374NJCl98NY2baFc8pAuhEhVxT/H7kAb+RkroyXiGDLxlZ8SWAE9juzO/Vdy4/a1gZLmUrdO/0JZ07xxus+LmxvsuX2jLEMMDdEynD0HF4MF3PbpI06v6Cjv3krKSMivJ5PQuMGCm50LwAv2oxJQ9LuHlTEpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
 b=Uf2bMXTYJw/qH09dVm59bIfJifCZIDNbuPT4GmZgNUM+5Tm9AKSYvoGvSOwKOoFVW0c9ODE4DLpstnjSb+9LACUQohhcjgi1U/J1CDKyskWJyGYd6VvHpGQszAi31c+mskoPM7DI63JmYv0rLT87owEWEA4lKRyQvy28KFIvGvTL2I6LVfjXRMTCkHsGaRnL1kDYs3B1pgrkFIWTOKZw01YwOZk19NdcVGMYO9/QR+cuDtNpS8cleHqxlLJ0s1J/UND3WgNlxo2GVDvKQL/E+weVZtUVzec7VUdS4sP11N7UJ/+0I7LcTSnC/bEyKUoIzE+7Kco3jV2sdW+avZ+0Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
References: <20230724033421.249893-1-parav@nvidia.com>
 <20230724033421.249893-3-parav@nvidia.com>
User-agent: mu4e 1.10.3; emacs 30.0.50
From: David Edmondson <david.edmondson@oracle.com>
To: Parav Pandit <parav@nvidia.com>
Cc: shahafs@nvidia.com, hengqi@linux.alibaba.com, virtio@lists.oasis-open.org,
        virtio-comment@lists.oasis-open.org
Date: Tue, 08 Aug 2023 09:24:49 +0100
In-reply-to: <20230724033421.249893-3-parav@nvidia.com>
Message-ID: <m21qgendde.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0068.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::32) To DS7PR10MB4926.namprd10.prod.outlook.com
 (2603:10b6:5:3ac::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB4926:EE_|MW4PR10MB5837:EE_
X-MS-Office365-Filtering-Correlation-Id: e9ea17e6-8b84-471c-d389-08db97e9fa54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+uVqxzcEF9L1YOygxAQ6JdDjXFftw5aXAMSjuuL9jXG1LCWkCIjyKheelzK3lRHZkZ00JXefzv+3jIJ+ZtEs/z835hMe5bj8HjDS5CnE6ZqU4EIpbsvUbxYOrgWHCPkQHO/D7TrqHZ2UUQp3UwLE74X1sM3EE/VhZGjhY2FppUFo+3ypRO/dFpvJVaWqKKhSsYFQ4MAmwyTdCmupjXmCRLx+7dzNeW6rd5FrjM6XISZdM4YXyOlW9qEqgKHHWh2M7isHNq7afzDHjipoqrx5jPnGMZSHubKUDA8ejT2Iv+2UDMcS7rDR46xQ50UEYsYUGBKX9Aym8NANx6J2wHEgqrEOR/cXmlSKEK2j8Q7FMbpvUN7MEcceJPxxadgkmq/vqDvpTdYEUpa/U07L46h5eg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB4926.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(396003)(136003)(39860400002)(346002)(1800799003)(90011799007)(186006)(90021799007)(451199021)(4270600006)(6512007)(6666004)(6486002)(621065003)(86362001)(26005)(73894004)(2616005)(38100700002)(6506007)(4326008)(41300700001)(36756003)(8676002)(8936002)(66946007)(6916009)(316002)(2906002)(66556008)(478600001)(44832011)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ju/9mBms4fP1bxM5TvVo1QKoBnmyros3nPFQZOGkEYls3dUzBixtz8vDQeHB?=
 =?us-ascii?Q?aHgB/8/jK6WpwOIflUlgTHaj8LxKfbAob9lGc93aWua6v41mKXy5J/NFwfTe?=
 =?us-ascii?Q?RaA9w78dLGnpd6XDn3oghsxvEn68n7r3STzDsg2pFCs4IZohRHw49ip+fV6C?=
 =?us-ascii?Q?rpIwiyQh9zbRmKM/Nq4OA9456l+FXSa8HH+Wjv08sxPxgIeHohrblSrnLAmg?=
 =?us-ascii?Q?4OGsDb7zwjUE5pNZ/qdAIV9B5YKzGq71e4zaDdY0bMhIH+StHwZyEj6WPq69?=
 =?us-ascii?Q?FytaBAPEIbahZ0KxnkA3/3mzkN0VjTzQnjUoKj1P+wjp6x9o9YOCEJQh0iAL?=
 =?us-ascii?Q?M4wqEBsLk4uZyosnVnXjBudCFzs/Kz/YfODx6pH7tFg4YJ/3mou/y4EzjDj+?=
 =?us-ascii?Q?1Y3Lz0DJ4IkQ7q4BZz55/rFAFTac5hkvTkAXePCETPousg8+nsudxBnF2vlO?=
 =?us-ascii?Q?aUx1o4vUbgHPc9LfPMPh0HWE0LfskpRHca5jQzUBj20dvPc360OjABO361Eq?=
 =?us-ascii?Q?G+oUn5VpjroNWzcU2sgdv0aCXgZbaLC2KdgqlRfda66OoQ0NgdGc2bJuDj18?=
 =?us-ascii?Q?TJdAco39mu9sQGUvW1bYTVkcrsaZX97onUgvmvN94ZmxG6zR2stsOKBRCyUO?=
 =?us-ascii?Q?oIrdrtsvV6I4n2UCOzWte48kST5/rDrCVpAEkMDuZumRMLGs+htoFvVDBBFY?=
 =?us-ascii?Q?BeHIC+vwssfzxQ/8+1q5RjBceMp3aJfrbgvEx6cM1AQMu7lIBzFFwSHTXDn8?=
 =?us-ascii?Q?vBTuhq+9NhkqFuvSaQmz/WqCUcXcV/OTCzf3R0gflKLyZWvh9YpGjjdyYtBF?=
 =?us-ascii?Q?Fb1i30+It7TUqZ1kQmNGct7e0h1oAeJrIQYQ16J5tcC73tW4PMHcOO9P5Cgc?=
 =?us-ascii?Q?s4mqWp6uK1ZqaaXTItbeEdr/PloQEYAdiz/RgBCSRFJrCiEvik+y4phqeT2I?=
 =?us-ascii?Q?EexfF0nzUwP2ssBLmqaPtiqbc1YvDpuaDf6rnSj9fuDQMn46YTcDoGVm7O19?=
 =?us-ascii?Q?yZnFw2FVzpFxTWYO6CzAorasbsMzW2fj9U3aHNs0aCqPsGU2h5eXdRrBYtT4?=
 =?us-ascii?Q?1HZ3StQcRVfPU3JuJ3mTkaJJ/az8+nfx2pAiIPJwjivkGD35X4nWIlEv6QIK?=
 =?us-ascii?Q?fDTfjlvdUe3f9wHFu+O81d/HyRnVNjjTiEUu1Cz9OeAJlFFIo0dXKjtOMAld?=
 =?us-ascii?Q?Wlh6In+lOYr39sTIJGeWtHudDu+uRLgo3jOZwA4Y5CerzaW4Fehu1xmojV2O?=
 =?us-ascii?Q?Q2f/vMDSuSumStOBArjX9XRQ+0fr2cgfzcArtx7e0uNOtktSITvKkaI5xrqe?=
 =?us-ascii?Q?Gj6zdBRFSeHVP6QKpjSbaZh8dSQ9ZiabxEH2V2/hfjcMnbj3+j0oNiR9rrIb?=
 =?us-ascii?Q?VhTwH5Pti2kma5JWJdte8JpE6tFcMVN6jdWFryRGSQF3X3M8K5Huu8QJOoSu?=
 =?us-ascii?Q?2XOGsiN1p38dr3mzjR/nK9FR2U97mk5JejyX4HyCBkM2SCIZ37RaKzXoIXA+?=
 =?us-ascii?Q?Pz3YCXBzWtpCuO8ikjVOVjhjgZl3vtbPH3qtXNRlcj3HST/iK5WkebuRco/R?=
 =?us-ascii?Q?Tc5rFs531d0a9zXn2hqndfuoEAX4mDinFVqP6px0rBDhQ2yjm9ysJLLEc9Fi?=
 =?us-ascii?Q?mA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	uCO4Og0giZiIXuM20T+98XKt7l/LSVqSgv7sOqbBQPy5fQtDNp8E7SojOiBG3eiLFE+wKlkGvlg3praqBSu6nxGh9/M0U7LsiQZyyl+tebUEUG+wLPWi24SSZwcyIX0k0Y8opH5VSZ5L8YnNm2YiCto/9MVvKujBwebxeYb42Ptgeh09sVa/MmFENv5OK2XdwejoFAr03agmN2YG5gWqO+hMJmFigwSUkLXs9nlgbO1r7tni84K7RqehMw1ieqVauMQ7IryuQff7Hl8SxVXfl7wpTT3tYD+SPLERleAyLLR3iC0WHr9z1xf3YiPXlnnp4wQXjaEXymfgvcO4BveVjEd8TxOihR8bvmlVpZof9ufJ+L7YLrYdpz47R93T39HlDvQtDZMfup9EjeXY0m1FmmNZ1R0DN0GNaRJT38FPgzS6Mjxe8mTtbKeiFs6Q2XhKsrLaxHnTnae5lJ+L9J+WJf5ER9PEqcLoZ8MhaZPoM4N8Ppn+l/abQeKt8YP3jjLi9Zsah3VHt1OAiqK5lwUluKkQR19B2FUEQtJzMILLlmX+5hDD31TzzwHG+pJT0h91fyMTjlmkYZLQr4kyH8tG4kdJbnhMZqcZbu9lDGuuKrKlcb6UbHNZ3WVjdooETXmcINYVdGn9IvusjY+1GF8OncQs2jvJWXTpG2Wa9QivEdkUOFULrR1e3X/8ASRAP38QlB6pvUxdFmqctww5lpv31uLGRy+7qTLc5B+nHl+uNrNek6TVMJ72pQ/cz/nRA6U9H1Gwb/uj7akeczA9WdUtZSUCUmEFmtobz+vKNMDLaCAUOs7apk0J2t//sEdBFo9Zfge/N6AG2UbOgXWRD5oRJRV0xaPSCU6vom1XKKgxGsE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9ea17e6-8b84-471c-d389-08db97e9fa54
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4926.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 08:32:18.7015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 405yiBg8YnlkqiVCcW0ZG0T2Ku4lHZeAb8mNjod+K/hGawSHPs56A3thCy0gccD+G5vfT5hOVcXZ1BDvO87SNjq5bU5qa9VHJ4dlAmYhuSU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5837
X-Proofpoint-Virus-Version: 
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 bulkscore=0
 malwarescore=0 adultscore=0 phishscore=0 mlxlogscore=896 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308080076
X-Proofpoint-GUID: OOpzcDB5iIlPQDbA909QBMrCjsN6AjUs
X-Proofpoint-ORIG-GUID: OOpzcDB5iIlPQDbA909QBMrCjsN6AjUs
Subject: Re: [virtio-comment] [PATCH requirements 2/7] net-features: Add low
 latency transmit queue requirements


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

