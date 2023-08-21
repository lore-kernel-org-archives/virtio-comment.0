Return-Path: <virtio-comment-return-7211-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83C3EE4996
	for <virtio-comment@archiver.kernel.org>; Mon, 21 Aug 2023 10:44:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1D62433097
	for <virtio-comment@archiver.kernel.org>; Mon, 21 Aug 2023 10:44:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0E262986259
	for <virtio-comment@archiver.kernel.org>; Mon, 21 Aug 2023 10:44:51 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id EE79E983FE9; Mon, 21 Aug 2023 10:44:50 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DDD1098622C;
	Mon, 21 Aug 2023 10:44:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H7Euz9HOlyF8jrUBFLTKGcfRhd/B3qUPLAlL9xftORZLFh+Zh99AUdrxAK/veLxHvJhWBE9emadllHDxx++XuEI5sbeXjwk5xohrfQIZMscPh9IJ9qU2F2EsoE+ULMDpVN9ee9R7etcq+BeyLxN+EGqmQ5I6V0MDN2uoMojTvwy4IVCFFxyXuZ+iK4y017IymFyKuJ6jBWVVZoi2ddvUr2sJjOqRsZXwn2ikjNssGaewUqJkHMgUov4YHh6ft5AZPikN4bRpVbTqG57hg+MnOXTl/5gq2vjICw/B+k+9NrPmVqYyFJy0gKY8kQATaNxpNpcBdD9YEbKIhl1TU76AsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uysTQNWYeZ+wvpy2ikLs21Oae2DH2sCv6yZXVqcfJ90=;
 b=mjIXQNr2IQq3lvh+H9Tbj0F4QyLJT6/qB2dWdemcXBUcxccWqXeGIqaMkEnAErAPzUs1orQUyXk3wc0S5XJix3/JOUwgrDMvFSgq6arB7hypAcACGAQugOj9x23KQ0gHNbhwf+xTJCHrifyo+HhT19fNflTIjV727jpD5DpJ/+Nt0QoVtG9y6brXtA96wuZ0wke2ZmmkjCVjgnugqJM8eOQNMBZVkbOr9BmMohlLBM+yEgjkKE4mzI/lyAWRwcAhXT3FNqe/o7732RY/2rw6q4Lp2qqolerVFN7C/hMkczdZ98X5xVbWL3TVYS4GdV8Gp+iEU4i2VO9WnEmz7uSDyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
References: <20230818043557.496964-1-parav@nvidia.com>
 <20230818043557.496964-2-parav@nvidia.com>
User-agent: mu4e 1.10.3; emacs 30.0.50
From: David Edmondson <david.edmondson@oracle.com>
To: Parav Pandit <parav@nvidia.com>
Cc: hengqi@linux.alibaba.com, xuanzhuo@linux.alibaba.com, sburla@marvell.com,
        shahafs@nvidia.com, virtio@lists.oasis-open.org,
        virtio-comment@lists.oasis-open.org
Date: Mon, 21 Aug 2023 11:44:31 +0100
In-reply-to: <20230818043557.496964-2-parav@nvidia.com>
Message-ID: <m28ra465ey.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0524.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::9) To DS7PR10MB4926.namprd10.prod.outlook.com
 (2603:10b6:5:3ac::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB4926:EE_|DS7PR10MB5167:EE_
X-MS-Office365-Filtering-Correlation-Id: 4be5826a-fd50-4b21-44a8-08dba233a0a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ERa6Z93l3jQVdc5p4q6pvXvnJIdwyh40AJxhVzCP78qQV7zRvcXHN3pc418awXf7YVP6S4E6EOHRj7R4/54C4J+2pw/uiZGIny18fmI9BBpCjCiPzc5QP96n9X1nAbFheI04F8k8sYWr+U9UwYMcKtkqeMgzl+zW+vs7gnQaK2kpS3McYNldPwrsfctG+Db5fLETYnKwzBpMFou1typy6X1bTindyxySl0FjkJ2QY/TAbjh/W7KDcSZbIxEo3jxrmg29wLuUqky7IROeK2eKJUsgvVOsmCVgyeP5a9l+8vOaYUUHMm8GMYmOvH5kJSXBHmX3x3pIzjfE/TsRyhS4HpziPMOSUMJKzm2/4kG5cZAaiDZCKLVw6T6bTqiVBk++imdFlIemI0eu55Miedix0qN7P7tPe9oO0gDfsnBq6cpTuW2jmgsxI8Dws6jKVfLuWtFCYrzJsE/r4E5TneHs6MRN+onTVD9vMXyQT1uVNbojgqAUCNovTtFZedksaqzD7ldtoUbB1lL7GLWOVurmrC2e7pgXHSGUhibwKBnXpTQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB4926.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(346002)(136003)(39860400002)(396003)(451199024)(186009)(1800799009)(2906002)(83380400001)(38100700002)(6506007)(6486002)(5660300002)(44832011)(26005)(86362001)(8676002)(2616005)(8936002)(4326008)(316002)(66946007)(6512007)(6916009)(66556008)(66476007)(966005)(478600001)(6666004)(41300700001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IIujKa5Tmc+QzBnneiEbXSgF2kKPdTinebhoR5DUnr+XjYBl4sBl5abM0YaO?=
 =?us-ascii?Q?gaoJqW6PSxcLXt7Eq5+gkOfGEmNj/sUssvxCZ7+F4soTMQIFPlrHYwAN89RA?=
 =?us-ascii?Q?O64PIdgyy3Bf+CV3DFsZsbupXNLVVeyVx7r5PgtwwCHVElTexxwBktjWnkWE?=
 =?us-ascii?Q?JhnHgumbKcSmMeM/XGsYpcNuCl4ZK0hk319ee1v5aKeO9q//RuQmcoIv6qg7?=
 =?us-ascii?Q?YIIzye57xsR5wv3yFvi4dGPg82CS43G2WLMA70yqq6dkNxr0lmppLSut875C?=
 =?us-ascii?Q?+TTmaXUlacFF+EkYyDZBSzzp+c7+FKSxJnpv9VAZ9p/W8I/slfYMOrWUtHKY?=
 =?us-ascii?Q?xu9PKTOepOshk7WdGhoY7RuNsQVVmMItE+weZOgkCgnfiq9Qr2dMsGrCtDGy?=
 =?us-ascii?Q?6IU4P2wIWueROcAuNjt/8MFjRkRNm2dsCZo0+SlB8dDyRmUtr1HddDZh6lhl?=
 =?us-ascii?Q?jov8mdn77CbTGCHTIjWaSP+2tglAKefHEUTifvDw+MWmandfbbd5kho1/Gmx?=
 =?us-ascii?Q?4cJD6TGFve1mrWO72V2EGd0r4ZrR/gInH4owpmS6FOo4uKP5iBhULwS+6TiA?=
 =?us-ascii?Q?W1uTMHDNlF6zC6IkiS/hbmoDIG/kX9KaCb1lNCWydYaqcvImHM5SuvwajuZ2?=
 =?us-ascii?Q?bIovmAtWf28bcj3UA2mR4Ix9qL6YUgqhHWjZxNZkU0/SJushdnOjDb3vdKcm?=
 =?us-ascii?Q?9n+e0r4ppRUFb2pKkOJZQxM1Yl5Uk4VzTuDQprrVZXlos4J/eDkUFTyR+dlb?=
 =?us-ascii?Q?V3WHRTGFCLWJyTYfe1Lyf5+vGYXTK4T2WPkRYl4oczJtJLG4USmedSfPtPlq?=
 =?us-ascii?Q?XE9t/I62JhHCVOzS+dlYWyZcLVRpYxj1vxdtrDiy5OfWSqzOHJ4HxWCxaVxQ?=
 =?us-ascii?Q?PfNHs/HAz0AhKclRDy3O7E96YZqRDJvbBX2cEIx+NzCEdQPlMqJk/omuxeBM?=
 =?us-ascii?Q?e8Bgm77VhP6OqTgvaay7ZacTgfIPtTAJuFaCq7ZE0vODeuDIkKsHv08YktGN?=
 =?us-ascii?Q?O5+l9NDj0ANe/OHvyIa8k2a3AbMDAS6kDIpydU2L46BlGjPx4WMHNV+1ANhJ?=
 =?us-ascii?Q?ITYKOtorERYMXL6O22QxLSEateKGzv23nWWsKW038NuttkMtn/GKf3PRtbVi?=
 =?us-ascii?Q?zlc1NJQkQ7yQXW/83266Xp8VL8/5Th7dw8hFHtd9sgTf25j4ZegM9KiaP3uo?=
 =?us-ascii?Q?lpF+YhDHim7w/+cr56pDyWMoLhaPsFobeYXXwy7amkzTuSTtI65pehKhM0UP?=
 =?us-ascii?Q?12JmII378iwmlV8PBSsev5jw8shFx8hsN3gWfH67Ifo6IHnRIYz8YSxMf8ck?=
 =?us-ascii?Q?+mUaa/D0uuheVSnW31iEgtZz2MIYEghGDrV8vtyz6e6cxq7KCybzDhZhTQyO?=
 =?us-ascii?Q?yqxx9hB4y94yyS+Bch/JA6snaNx3oDdF6m78xKMydi1aKlMgRTMy4lV7GgHg?=
 =?us-ascii?Q?o3HO3K3P/eh4jVMbB5DqixhVj+r03dM+cB9vZ0cdvacWHMYHAaPcwbY2pdtv?=
 =?us-ascii?Q?eTWXiAQYXKzRyFDFMQQbSwOnrEF5Ffsj17eww+qe/6/hiOh/JcHT42+BTC3U?=
 =?us-ascii?Q?78PdxGgppcTzTYPcowQuLNK6g/PQVKLH30QubbsBqaH1Cd1AKoio8Kcrp0zT?=
 =?us-ascii?Q?NA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	4o1zZKPYhxYi3vX4sgByi6DsccU25H0kEiMGwO/stn39D5f+ms8JyJhWBeDeiTHLzdIliPEv5SWCBWuxJnhnPSpXFblS+6K7a0Zre1V23gDYpPHtxABjPemoTMbnxgtg0c3BYWDNOA8htYim/FJRJ/l7otsSx5qhPnAk8SoazzjVfnL7UVJulO7UeHWGRamBvmUqwaqMCbovXouELaKAaHM2zj7cYidr23UAJlDy2o3KLXwRmvVuKtFVW4TgrwqPxsBfd+qh0A4GaO+dsfJUPpjf1nRZhuzOq0IPQvDTsixw9YnosQBrBEvinBMI0xspAZFn31dzMbUb+kR2ffspTrqi4+IE9hKHYzX36eFHxXz0qtbz6l5vkXW0kDpABCY34p+PHf/mES66moOSiYMm7QaPI/JX1kxrrVl+CZsIVihpBjO5SEx7FIuV+VZtzqBzsuazEzhKMe2gu2b9ATcNCEwI4g2bPjwAxe7rdnzvf4m2y4T/eShW8ndLNiDTWL7GBEk0/9HUXir4Pcit+KOwKsUnknhX8GR3lmATdaXNETA4DM0dvHmnvfQC+jzrfaIOzDiFwsAwkU8ELOOrxrpSRsS0gwuFeEH05jLJEld4YRjD6bHPix6Ck+Uo5oqpXeW8rvxLMy4rWlzVJ4Vl8nmodFlzkrKSO47di4J8HY1VYTOTyFLaKmQQ5fvpMB/IsZ4+LpUyoZO+psNBp/s58o36iJbW/pg7TzYnCGv5/5U4HwSotJ1eJeOmB8bgS2mc/ZrVw2ZehtCHnphM5p7dxId1E/wNQUFrASiDmXbQ6oF2JG5ITWZ54F/olFc0d+h1krx0yOAbmRqWF4dGrfwyGQIhCa4YrkJsr/sxoSQMMI3Bc9Tk6QNHTgTZ9+2Oisn3eigF
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4be5826a-fd50-4b21-44a8-08dba233a0a8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4926.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 10:44:42.7502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X69OrZSj3g6l2vlsgFW1T12TmcNK+U8SV8eLhxdHGK5z91jCZUYi5hhkyiWHXHxPzJJHCiBkb6MbNgxRJk7oH3FbJ/hCeU/Zca2jzCXHlP4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5167
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-21_01,2023-08-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308210099
X-Proofpoint-GUID: vjWvyFjWSCR9p7cX5mqysfoDOfQGHrVk
X-Proofpoint-ORIG-GUID: vjWvyFjWSCR9p7cX5mqysfoDOfQGHrVk
Subject: Re: [virtio-comment] [PATCH requirements v5 1/7] net-features: Add
 requirements document for release 1.4


On Friday, 2023-08-18 at 07:35:51 +03, Parav Pandit wrote:
> Add requirements document template for the virtio net features.
>
> Add virtio net device counters visible to driver.
>
> Signed-off-by: Parav Pandit <parav@nvidia.com>

Acked-by: David Edmondson <david.edmondson@oracle.com>

> ---
> changelog:
> v4->v5:
> - Fixed attributes query and counters query
> v3->v4:
> - Addressed comment from David
> - Added link to more counters that we are already discussing
> v0->v1:
> - removed tx dropped counter
> - updated requirements to mention about virtqueue interface for counters
>   query
> ---
>  net-workstream/features-1.4.md | 41 ++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 net-workstream/features-1.4.md
>
> diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
> new file mode 100644
> index 0000000..ea36f09
> --- /dev/null
> +++ b/net-workstream/features-1.4.md
> @@ -0,0 +1,41 @@
> +# 1. Introduction
> +
> +This document describes the overall requirements for virtio net device
> +improvements for upcoming release 1.4. Some of these requirements are
> +interrelated and influence the interface design, hence reviewing them
> +together is desired while updating the virtio net interface.
> +
> +# 2. Summary
> +1. Device counters visible to the driver
> +
> +# 3. Requirements
> +## 3.1 Device counters
> +1. The driver should be able to query the device and/or per vq counters for
> +   debugging purpose using a virtqueue directly from driver to device for
> +   example using a control vq.
> +2. The driver should be able to query which counters are supported using a
> +   virtqueue command, for example using an existing control vq.
> +3. If this device is migrated between two hosts, the driver should be able
> +   get the counter values in the destination host from where it was left
> +   off in the source host.
> +4. If a virtio device is a group member device, it must be possible to query
> +   all of the group member counters via the group owner device.
> +5. If a virtio device is a group member device, it must be possible to query
> +   all of the group member counter attributes via the group owner device.
> +
> +### 3.1.1 Per receive queue counters
> +1. le64 rx_oversize_pkt_errors: Packet dropped due to receive packet being
> +    oversize than the buffer size
> +2. le64 rx_no_buffer_pkt_errors: Packet dropped due to unavailability of the
> +    buffer in the receive queue
> +3. le64 rx_gso_pkts: Packets treated as receive GSO sequence by the device
> +4. le64 rx_pkts: Total packets received by the device
> +
> +### 3.1.2 Per transmit queue counters
> +1. le64 tx_gso_pkts: Packets send as transmit GSO sequence
> +2. le64 tx_pkts: Total packets send by the device
> +
> +### 3.1.3 More counters
> +More counters discussed in [1].
> +
> +[1] https://lists.oasis-open.org/archives/virtio-comment/202308/msg00176.html
-- 
I know a man called Sylvester, him have to wear a bullet proof vest y'all.

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

