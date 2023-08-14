Return-Path: <virtio-comment-return-7088-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3C7C001B0
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 11:59:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C110D42C27
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 11:59:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B0F9D98638A
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 11:59:53 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A428A983F78; Mon, 14 Aug 2023 11:59:53 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 951CC98633D;
	Mon, 14 Aug 2023 11:59:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=INvOavNrqaHEW3YlItQlNhxUS5vkWBVBykoBhazK8bbixWfwt/Y7NcfE36d2NpGtqzSZVEcVDRsBJzhapf2T+MUQvJWOJchoKtgZ2BSsdv0wYn0HdCJme1qwLcNivchDC9vGFnB+IlHIjt9GwDNskPil+EGnMyvxZXTT0i/5E4NBNbKOg/GaBM/RH7FCDy02e0jfagxgHRiIJdVjazWHti6sqzZzk9e+D77U0aKZFE8agOvsjv+vNIP14Wj3K+/11BAQm13v63NcHhCXeHG2cN0dlVNgl4JawKAZLMDK+BowYnnmrY8Krv5qTZtsyoKVUPdoSrVn+LQjwF4W+QaY4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d9tBOK8e3M1fkhFcJTQ1ZpAqIwIJZPEOEcWhEH33v4E=;
 b=ChMBoEftuzxmR+i1DbxTWf2WKMYwt82DSklDz4qtyF4N/KDtRDa4VQ+rwO4eld9q+BVV+fOs6wF24AsjcUCRrHXgLPHaVV6vRudI3Hd0ALeZkWhU6RCrye4T//rIYNZrZILFrYb86Jup2lGpNEh5mp8ly8+IFDsjwhVBu6ikLVTfggH+ShLT+MKuV3CiVrqbc3jt2tQVP3qr84r+bkIIiuPipd4cuGmupu6QpDD+AmLj2IJb4BmcxpSzXOaMXVndDr0kbTbZWO5UhbXrKJzO3S1FZK0dvg8DPue9noYwjYR+YoHy/HX1KUYYWwnVyZGRGHWRcZYRaw9y50C/BPyQcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
References: <20230724033421.249893-1-parav@nvidia.com>
 <20230724033421.249893-7-parav@nvidia.com>
User-agent: mu4e 1.10.3; emacs 30.0.50
From: David Edmondson <david.edmondson@oracle.com>
To: Parav Pandit <parav@nvidia.com>
Cc: shahafs@nvidia.com, hengqi@linux.alibaba.com, virtio@lists.oasis-open.org,
        virtio-comment@lists.oasis-open.org
Date: Mon, 14 Aug 2023 12:59:37 +0100
In-reply-to: <20230724033421.249893-7-parav@nvidia.com>
Message-ID: <m2o7j97s28.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0001.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::6) To DS7PR10MB4926.namprd10.prod.outlook.com
 (2603:10b6:5:3ac::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB4926:EE_|IA1PR10MB7199:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ed34dec-4588-480d-2db4-08db9cbdf50f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bdWdRr8UJkj0pcgE8kXaaebRmb7WKmXL4+VnB0tMVM3bvt1p1AjsU//zreOgPY+2epdzVR+30E+TjCpkj5XrjVlZhxNR7XaD04HGKbWjUw71HaSC53ecGurBBm7W/Qe6c5gQkD1um8cJ2fmgLwaMcfc/npxt4QfbMMWY2blNrEOzU0J6jJReng0Tw9IOBlBFiiXTUfAFgHxjv8FTZuqjGRN/1sbsL+yf7K9wd9w+H6rnPbYCSYeHM57SjCv/Mw3h7auDMFaxdl0Onkg1nIbsZzZ0SxcGGCK58Tb9H+QGnMndqM3YOWrH83JCHEhgMJ2Xj2RtQ86P32sRPYTwpRuN85jYRs2BW8qdPDRb+acep0T9KLqO8BIRjRqu7/UvVxV3RsjBj5rfcDKXnJSaCgDKtx+JRI0ZGmjhlMMq0yF7kR3XmH5wLH/xBezBCheI17yDelfvWIDS//oTo5+BtdebGNeMlE6w6qunmraOIa412e+zWQhX77YgJ5+0KhnScX7Nk2KVwVJnrjJz8wvmwljL5hMGzDW6ggbOXk23tGQRYu83DjX4uVs4Jhzzl/9IqKVW
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB4926.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(396003)(376002)(39860400002)(136003)(186006)(451199021)(1800799006)(4326008)(8936002)(6512007)(86362001)(478600001)(8676002)(6486002)(6506007)(66946007)(6666004)(66476007)(66556008)(6916009)(316002)(41300700001)(26005)(5660300002)(44832011)(2616005)(36756003)(2906002)(83380400001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?J7ip0jTE60OkluzEjuNfjI/b/bfUOgKxobjivTWY0oY8KJEsUohKLijx48OV?=
 =?us-ascii?Q?1MGXdD6UwoGh8PoBAg9wyAAJ0ZgHBx01NbukUTf4usDpZ+2yEeeiuarnNEBo?=
 =?us-ascii?Q?nAxvAHYQ/w54rVzpUSKvLYc24sNANlYOpTGuHrKa5G8l8SvNhmwdvT8XOvdh?=
 =?us-ascii?Q?sX2+BjaCL+BopQjINRTfn2XwFZwGpkeH89wNpEnCi6tzUY11+jiaYE82g/Fn?=
 =?us-ascii?Q?bwxrs0TQmqDLx0+/sZr6m1w56BXvKmMYOJmdIUgdvjPwnWplJS5nyaBqPTYh?=
 =?us-ascii?Q?Pqza376iBHurfJwRnRXQt9KD6lvzNgUpje69blw7YlpIExwSoEc5d+wSpwf9?=
 =?us-ascii?Q?Se6qKQD2QF2Vp5sg3Unv2wBHL/1m7Xc6NW0z6QEy7G9jT+mXGHXB2y8JQNTY?=
 =?us-ascii?Q?puEUyEPTbR5db4xc6DeI/ZfhPd57F5Ms4jax0mD8+utaOUIgO0x0mAj8H+kA?=
 =?us-ascii?Q?bhjFQSzWGFHIw2Zw38aubajW8XGBbpJgA08FIOkAXZGKvwYocERuFVw2krIE?=
 =?us-ascii?Q?+x6OnLs8RPKIYFrAcpuGceKS+WTbazXJ0AyM6ABzwU3lqhnj5pnr2gtZmT2P?=
 =?us-ascii?Q?8gKc2Ez8w5IcGeOWtHte9/rSYkASi0ddAP/4AJKLT5nMgRTbYBhFAQ3F4ziE?=
 =?us-ascii?Q?pBruisNXEcPyrFyC+BjEcVegMwnLNe2pghekC6REdK7udDCH9Cx2iIgFz1j/?=
 =?us-ascii?Q?dO1d0Y/KzfDSBnTUiB6gHE4ijoqmo8X0DDIshm7fhNTqYzovY4xn0Qy3xKX6?=
 =?us-ascii?Q?ZmdluqN4jM7kJv6SFU4gIjBmC070MkUMVfTAihV07yrEncPEcw81XkmF2LCO?=
 =?us-ascii?Q?kxoDkCAK0+tpV1JTJ/EfHB9y+nBNkuugueVIWBaHfkm9o2YrKXAI1XXvRimE?=
 =?us-ascii?Q?FB/9MFScue1PY6rWdk4GhaiS9ZelHADPLlcj3pzZJFwJyxDBYAURspjbmybp?=
 =?us-ascii?Q?fGtpwbsSCRUqv75zV/2y1Z8+jUNidRoCrZ2Dym13WPrJxOOu3vVtrmzRP2QX?=
 =?us-ascii?Q?CFDASZwDy0Ooul+FcJ+RHLtQRc6RF2X73gQYV0C2ky3HVIQHvU2hHJt1jZJe?=
 =?us-ascii?Q?8oJQ5YB89vVMR+Zm+eY8/8k9NqWIvKG+87n/MZmWCX5ugC0qO9IUSaNkmaaX?=
 =?us-ascii?Q?U8+HbJtoR1wHaVDb2C+uh42QMEs6cV9J2qjayUDjdT89F0gb9k3CTb5NZPzr?=
 =?us-ascii?Q?i5DPSHgGodNfCMJh5XvaYZBkp9UZJw3ZqDaSc+Hw8oNMfDj+ebJj/JMh6870?=
 =?us-ascii?Q?Z49GWS8emecbT+I6e4hJnZzqEgez/A3sZncPr2rmH2HNvcalYYsTWRXzF94T?=
 =?us-ascii?Q?vmF0qyLyq97snGcS81sw0L0lJBoh2bexwrrmHekqYDMJfzdazMCbj1m2qjeX?=
 =?us-ascii?Q?1A1Voo1J+UbvVJuDGDMgsmWgc30U3zB9ZCLUF2tOXjYmMaYlhl1bLWBh8M0b?=
 =?us-ascii?Q?CUyG/wMNGoGR516+suTiKmWkr35ALkml92KEOPWk1ltA1z5x27iEKyKSCXpn?=
 =?us-ascii?Q?g1SG3LLO9Iq+WzMIBcckjwq0DOhqV0lpvrg0f40FuQ2IZuP4zVZ11kix1XcN?=
 =?us-ascii?Q?+qzJYTGbygROMBHP/3YEbSyUQOvY5esFjuR8j98Xf8Jy1OiNtDePyS9Pi2tw?=
 =?us-ascii?Q?jA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Wpvap+7LRZVwRRRLH2AWdsEZss01i/sreTqo68d3F6hSqB0Iw4CG1ix7mPOdjy7mGRlIR8kATgEf42rZkdPkFvRjlVcAa9rA9CdvTzxCnCuZ21xzZgaPAEOApxSF2zKGpu/khnILLkCmQfw1VsNpTx0peGNpukgx5jhv7B6iQ2y2NVj4DOUYDhWWcKCTmK5DzCxdXeJ3chn9hGi/A50TGLmwmrDbjVJn68diviIKRLC2U/g2UDGO/04maLCMpeeEsvPckBtSuDTgI/5AEphx6OBKq11FqTHVnLE+eSd7KYtQ1pp5pkOYif9MsgUUfPHnaJTRbcDJubto28tdb+btFQFyjpaKP1C0O8tQt/Hfy0Y6fRqqvMSGWXhGB9hTPdop8d3OheAKB4htE9L+T0CHXg9UjB3njWMPei8mUHYi2KnF6Sqh9Hn+EZTZAEAWxHXtcXTbUd7i6omUhUEL6GB/XbBtNIc1lbtRT1lBcyyuo0CRj9L52uq8Pir4L7hYc941QzN43BQbBMmJ9oyG6tiB3SRA1faL5hDt/1JQ2UKVzh7Wx70I5lg/sJs/swB++6BdR4vnvG76G/DvjRmlfJYqfA1WNX5qvNIi/H/9zwmiHdm3cE83ETaDN0ytz4nEGEVp3QxSHwrTVB3qBR8FjhRd3ZSq8mg08BlR2Uxbj+/ObDw91dToAZm8LXL2jhvbwvE4N77kD2HeJxonA5m9enjpfsZiFkK0jdc2I4SD9vDdKgrPKxpRYZCA7MO4BehLbFTpEucDOIYznFRPAV8Fz5sCdkYkovlU3wvO8KhNq2e0k/+H7hoZ8HOmQz5VyER6jXahd0C29oUzmDO2DwbU/uKJRaBd2iMCweAHacMBm1NHcxU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ed34dec-4588-480d-2db4-08db9cbdf50f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4926.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 11:59:47.9069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8tU2k4RIE3ChyTYGD0APm7xTVVN4BUyZvD1rRX0/5O0MwGvfHWGhUTRAE97Uib3r9XBbgHGFvaJPfHUAG+fM+XFCUt/W4+CDwGF5rLWpYz8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7199
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-14_07,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308140110
X-Proofpoint-ORIG-GUID: yDub_wm_OnFEjHchgPuBO1Oq6LohdGbr
X-Proofpoint-GUID: yDub_wm_OnFEjHchgPuBO1Oq6LohdGbr
Subject: Re: [virtio-comment] [PATCH requirements 6/7] net-features: Add
 packet timestamp requirements


On Monday, 2023-07-24 at 06:34:20 +03, Parav Pandit wrote:
> Add tx and rx packet timestamp requirements.
>
> Signed-off-by: Parav Pandit <parav@nvidia.com>

Acked-by: David Edmondson <david.edmondson@oracle.com>

> ---
>  net-workstream/features-1.4.md | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
> index d228462..37820b6 100644
> --- a/net-workstream/features-1.4.md
> +++ b/net-workstream/features-1.4.md
> @@ -10,6 +10,7 @@ together is desired while updating the virtio net interface.
>  2. Low latency tx and rx virtqueues for PCI transport
>  3. Virtqueue notification coalescing re-arming support
>  4  Virtqueue receive flow filters (RFF)
> +5. Device timestamp for tx and rx packets
>  
>  # 3. Requirements
>  ## 3.1 Device counters
> @@ -280,3 +281,28 @@ struct virtio_net_rff_delete {
>  	u8 padding[2];
>  	le32 flow_id;
>  };
> +
> +## 3.5 Packet timestamp
> +1. Device should provide transmit timestamp and receive timestamp of the packets
> +   at per packet level when the device is enabled.
> +2. Device should provide the current free running clock in the least latency
> +   possible using an MMIO register read of 64-bit to have the least jitter.
> +3. Device should provide the current frequency and the frequency unit for the
> +   software to synchronize the reference point of software and the device using
> +   a control vq command.
> +
> +### 3.5.1 Transmit timestamp
> +1. Transmit completion must contain a packet transmission timestamp when the
> +   device is enabled for it.
> +2. The device should record the packet transmit timestamp in the completion at
> +   the farthest egress point towards the network.
> +3. The device must provide a transmit packet timestamp in a single DMA
> +   transaction along with the rest of the transmit completion fields.
> +
> +### 3.5.2 Receive timestamp
> +1. Receive completion must contain a packet reception timestamp when the device
> +   is enabled for it.
> +2. The device should record the received packet timestamp at the closet ingress
> +   point of reception from the network.
> +3. The device should provide a receive packet timestamp in a single DMA
> +   transaction along with the rest of the receive completion fields.
-- 
Do not leave the building.

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

