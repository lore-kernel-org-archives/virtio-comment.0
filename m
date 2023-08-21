Return-Path: <virtio-comment-return-7212-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82230EE49AA
	for <virtio-comment@archiver.kernel.org>; Mon, 21 Aug 2023 10:46:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D70862168A
	for <virtio-comment@archiver.kernel.org>; Mon, 21 Aug 2023 10:46:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CBD8C986262
	for <virtio-comment@archiver.kernel.org>; Mon, 21 Aug 2023 10:46:02 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C1E82983FE9; Mon, 21 Aug 2023 10:46:02 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B1AF998622C;
	Mon, 21 Aug 2023 10:45:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ATVIh7VcgXpD/YGQHu2iGPCR40Ag7ho+ZSzOo7GRphiyzDOeHP+Vv5qj8Ftz7jXdSsStA05GZoKkp9CYWXqAXam7+bgF0/Ip+rHS1hA8nykvllC0+VkSgZVG26/CmBnLPGKDFaSgFCFYx1XPWq6btZrJeRkMj6wtiCnX85N8loFfWyzpj8F+ZHZPwHwUlk1GP/Az418GLyv3OlRG75/cdBg/ej+QObiUlpHidm4KraT7M4XkPDz6Cv7na157syDP3BKfjbivtjPgibS4sX3BiYB3u1UacNhcPqj4lT/UVllkMQ6K5W/ZR/vWv8Bf6Rdzl3YeO1O4MfLydFyUzL3JYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fn3K9GN6MHxfzQ3viZtvmYJMh0zXPABuUFf8U8b/dKY=;
 b=CFNJI9ngorsfScwkviLAkW3tdgLQbDx+wl5VaMOcXGCQaJFAqoCWUbKCt1afXtinuRE3iYY/Tz34gQQBAdCApr8PRt4YFW+LdmBlSzwcWl9CvAF06Qy0/fpALJ61jQa9JK5va3S0L5O6CfVgDS6w0KNohYCyEfTazvigdn8CjuIEAVoLF+kIVh6o4ln39hewwUmDoBkSc1ZjWnpHV/olbToTcnGjiTX1ssLQY4iXZgo3qgQkO8WeQzoGLhDHsNDjQVHd3ZcG7TKnFROf7g81lOmbPlfhdPGVEIbzHviqdm+653/UIyRmxbvwVx0gb+Bs+LeEjk/uQq3WnlZbWfDu6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
References: <20230818043557.496964-1-parav@nvidia.com>
 <20230818043557.496964-8-parav@nvidia.com>
User-agent: mu4e 1.10.3; emacs 30.0.50
From: David Edmondson <david.edmondson@oracle.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, hengqi@linux.alibaba.com,
        xuanzhuo@linux.alibaba.com, sburla@marvell.com, shahafs@nvidia.com,
        virtio@lists.oasis-open.org
Date: Mon, 21 Aug 2023 11:45:39 +0100
In-reply-to: <20230818043557.496964-8-parav@nvidia.com>
Message-ID: <m24jks65d3.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0038.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::7) To DS7PR10MB4926.namprd10.prod.outlook.com
 (2603:10b6:5:3ac::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB4926:EE_|DS7PR10MB5167:EE_
X-MS-Office365-Filtering-Correlation-Id: 99cbe54b-a874-4cae-0c50-08dba233c891
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GKBalty335nz9WwOwyxjpS35+hQQLZOZXOSMwhSJCT8PfwOdGRafgJorZPgT1SiT5SbXCiLtRIox06gSvW34Pfu7WJ0byOQeMPdEsYhGB5Mg2N7txei3S6TJD1OzRVx8qEyYuPL/irgFKyPKKlvXyuCGVOJKmcBS/QsXWyBLYmbS9I9BeI7MYYxEH0LNQfANu1H6V9xpgfJhz8UjSMqBNSmx5NRnDo8IiQSXT/FyOc6IunRUV5TLErG57LVtZAkwI7YAdbtnVB7xO0N+oavhLb61vuzqQmRvupHwpZMm9aN1fEcqwnuzM6tq0ExGQAwzC1SwhSSo4Hcf75QRzr+jLkos1Gd0aQA+/CLS5jlmZ3ZmsiYvqEe4nZc+mmGYeeb19rVzR7FgRj1KTuTAaqeLlw0S4EXCqSskEZ5PUzMPoUNzEEW/sD4y8Krcy4FVA5lHm9ItdWoRDy0NwPmA6sOY0Q1NFd/L2Wb9jPMJ0kT4NZ+kyFkBQB2rFLON0Z5qsJvem8aXmx7ePP55z/tXgngrimrB7brYv+od3z3ifdRDjuQKjH4PBCJ4bZ5ZhNBPfTT7
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB4926.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(346002)(136003)(39860400002)(396003)(451199024)(186009)(1800799009)(2906002)(83380400001)(38100700002)(6506007)(6486002)(5660300002)(44832011)(26005)(86362001)(8676002)(2616005)(8936002)(4326008)(316002)(66946007)(6512007)(6916009)(66556008)(66476007)(478600001)(6666004)(41300700001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tJqA5WZLmKeGB5cb6IqnCmbAe9GaX5bBcebqlNZZRStZKnGWVihEhLBfxTaG?=
 =?us-ascii?Q?mk3B+tGjPADFcE0uT2k/8n+O01khmPHSLonoXFAGoBbvnpm3Z2SAt6cV55R1?=
 =?us-ascii?Q?cd7GnWQdP0yWeNVQ8P8OgyzvKojRkGTYQNeSzKbTSJc0ToQclyXprdF0czEj?=
 =?us-ascii?Q?Jsm+T+6xRTjBpjj/2SW91O4WQ3/Uz4ER7/mxVvOi9V5G+j3FsHJBKIbJqDXs?=
 =?us-ascii?Q?pfT5V9sPOlwt+N/5gVtupgAfplva0L2UTC6Iprid5FTW/XwHYOb5V7dh3Idv?=
 =?us-ascii?Q?4ezjZ2JUdWE6AiUeBLkFnJSt5NwzPlVaQVcWOGKY2lbGmpitjkL0RdilbYcr?=
 =?us-ascii?Q?KYh1MrwSbxhdlaeDYZaEcYgIRrbKcpt0It3sMCc+9PuSWqbO90lYgUUjNfNz?=
 =?us-ascii?Q?8vZpnHp/mVMAAwFRdNxW16Lqsou0Uq1MZqPT/7DN2Cv7UnRC2B+JMQrcbNh5?=
 =?us-ascii?Q?mxh/aSfbBOml+6u/BdY6cR0EJd1PfuAm/+9Ue9rPRwDAP/k0u7jxBIpCihKC?=
 =?us-ascii?Q?t6Qj/4sy19zEvwcS9XJ23xp0JJvEQrB2SY+I4UwB29ho/ve/AhP6PLUYRZXk?=
 =?us-ascii?Q?JPA02CnLds12hDsXWazmLN22jpopbsye8qPWgc7/w7um6hVfoWAVFM2UGkBv?=
 =?us-ascii?Q?e71mIq+t9tkmyHXdX03saqK4esoxiRBmqx1Pj76Ni92gDuYzo0K0gkeeOTFc?=
 =?us-ascii?Q?+4exX2eWYMcpGwlrT1vtfvrhwkFf89HV9A62aAZxRMWiTGwU2XGgyUw/ZEFE?=
 =?us-ascii?Q?OvX32o9VktEQlx89cEsuLZlMYswZrPigEstVOAi4e060iC5dwcn2zu75VuRv?=
 =?us-ascii?Q?7DSD2PnFW7zLxRtcJeikeGYXuH5mQFnG1TZ179qDG/PylIwTMYpijRgIQfYL?=
 =?us-ascii?Q?ZdtF+p2cdV3CttlhXDlMYx1sIhl/5KCJvcWh4fWPYtWig/fllgBzfqovcEHZ?=
 =?us-ascii?Q?M7+gZUqXWx61+bvGFLw3quvQ2GxWlkuaaf3dojQ3xqC28eOFEI3hqXtkORUm?=
 =?us-ascii?Q?jSw65eSGBvoSCrB9axagQsyXcUP93fwFH3UVJ9huvccgX45hSg47FELWPUaV?=
 =?us-ascii?Q?t5WMcUwdMrv1NSM8XDd7Cy2llGdnMxXLEmxm9/TWBbQRAHRsabokUBmFQQE4?=
 =?us-ascii?Q?+oU9XmX69neGZNhiDJVKsM84m+IexY+MhASC1qJonGUMB+Ydf4qP9i8PpsgV?=
 =?us-ascii?Q?TfOyKfXNA0mTcYBtrTNxTnCqrrfIdUU9LvBbebYj+YuuTPCS/pV0ryHbkdKJ?=
 =?us-ascii?Q?LhOfKmaztXjPL8gvtatWmWIWRaBCltlN+aayeq7+5Q4blTTbCXJYUDBQjKNF?=
 =?us-ascii?Q?2IDksmxGJARJpt9HFBOJwDIrt6dnnwTZ5tiVVH55DyuNutWARDkZhRWcIoyp?=
 =?us-ascii?Q?XaL3Jus0ezqldcNK2NLk+xs0weQHsx5upzqmZFLgiU7WejeZgTY6aBfacgag?=
 =?us-ascii?Q?e24gN2i6SV0lmfCzJMNL/aH9g7fJ7ht8wlAzae7kSR7S5VJlourygJvMTqb7?=
 =?us-ascii?Q?m8SQRV8FBCqcovr+X8wtgZjw7JctSMhYSlkkwPKF61jArzgyvpvYsC6h5dLj?=
 =?us-ascii?Q?GSz3ZqAUt8JlWXX+5t90/7+7Rx/AwJOET/2fkMQJ8mi87900OVfsPuNnmZnC?=
 =?us-ascii?Q?Xg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	QKFGU9gj6ft+j7425004zF4YL/z8V9o5S9ZT3Wm10/gXaplN18YvvHQ3bG2i/Uo9jlwIfZJpsjTEIxoN3ctny2xB2YBPx/LW6+khRe/EKQZ28cgx7oaHPE+1zpKWAEAZX+DEsWLFr/yYyhlra6U/XVLteetQTN9RDAN29CsWxDpwFUSIigX4/ylV8qYwbakWPaoQhtxfT9VF49ctMrToPYnUty70lJiauzVj/POo2/0P1FjSH5LFT7PbkT0BJ23+Vq9VqKKhqlUoSsyvou9nWTWx1RRrRNT5zraKDaWfXQaKUYeD8l+4jkSoBiyNwLVUyd9eEb+/V8vqOqT/+xtPJF0lRgyRjKkbIYv7KdPPxfwLC51584Q85X07nPKLcGr8HLM0hcaHD2EchyTRXAwiDCP4nK22Fi6INmfdAEdI5wSOmiav/aZqvWcLi8ESQFGrk8fAL+Z5eMie66OP1YmVdqKazvvGNctJnoSAMN9sucGZnBUYlTShU9N6IOLVz0eyYX9kOn2Lf0Yf95XDQyaRC1HWdRJxumzcdh/OVLAfDi/dxO9ojV0T0bNkoO9gX7u8hlxEVyfsGEpJ7eoH9Y+L3t+19DXbQv1CHhu/uTh4wfaQElAFnskoZM1FaQYGQD/eFezNce8QJWz57+wIKEe5t+dLOrmvEUtfmLCvwKmxgym+FaGGtbe2nlx8pEC+qDWsbIX2UM67UKkqk+PbbB5AwMo5Gt1z2cfXR3h82EKsWJ8Y5R2JdKoAJ4opzbwKQRUVbGi2u+oOnMMTunjQtD1pBWmmcoLZXyelC0O6WoeyrrzwpS6Ag7Sz4cxfgem9vTozLYO1yIxebr8SnXCd4wC6dZT3xHyPEarEUj/0ghQIRFRGzmZgUvTnqT36oy+0wQ7J
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99cbe54b-a874-4cae-0c50-08dba233c891
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4926.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 10:45:49.7119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: apWbInoJfeO/Fc1AVoDt2unbukfgFxQ8Bc/x7XIqHJjp4F0c8WL8KmdGAphJ8smdTwP85NbG87dhGree8KcvmW/D5Skppx+wTEPvd7u4Q7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5167
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-21_01,2023-08-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308210099
X-Proofpoint-ORIG-GUID: iN5pAI8jTbsyRDh8i_t1DGzGAVEUFQ04
X-Proofpoint-GUID: iN5pAI8jTbsyRDh8i_t1DGzGAVEUFQ04
Subject: [virtio-comment] Re: [PATCH requirements v5 7/7] net-features: Add header data split
 requirements


On Friday, 2023-08-18 at 07:35:57 +03, Parav Pandit wrote:
> Add header data split requirements for the receive packets.
>
> Signed-off-by: Parav Pandit <parav@nvidia.com>

Acked-by: David Edmondson <david.edmondson@oracle.com>

> ---
>  net-workstream/features-1.4.md | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
> index 31aa587..7a56fa8 100644
> --- a/net-workstream/features-1.4.md
> +++ b/net-workstream/features-1.4.md
> @@ -11,6 +11,7 @@ together is desired while updating the virtio net interface.
>  3. Virtqueue notification coalescing re-arming support
>  4  Virtqueue receive flow filters (RFF)
>  5. Device timestamp for tx and rx packets
> +6. Header data split for the receive virtqueue
>  
>  # 3. Requirements
>  ## 3.1 Device counters
> @@ -368,3 +369,15 @@ c. If/when virtio switch object is implemented, support ingress/egress flow
>     point of reception from the network.
>  3. The device should provide a receive packet timestamp in a single DMA
>     transaction along with the rest of the receive completion fields.
> +
> +## 3.6 Header data split for the receive virtqueue
> +1. The device should be able to DMA the packet header and data to two different
> +   memory locations, this enables driver and networking stack to perform zero
> +   copy to application buffer(s).
> +2. The driver should be able to configure maximum header buffer size per
> +   virtqueue.
> +3. The header buffer to be in a physically contiguous memory per virtqueue
> +4. The device should be able to indicate header data split in the receive
> +   completion.
> +5. The device should be able to zero pad the header buffer when the received
> +   header is shorter than cpu cache line size.
-- 
Do I have to tell the story, of a thousand rainy days since we first met?

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

