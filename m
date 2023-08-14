Return-Path: <virtio-comment-return-7087-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80788C41513
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 11:57:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E731841A12
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 11:57:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D82279863A7
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 11:57:52 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id CEC1A98633E; Mon, 14 Aug 2023 11:57:52 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BD12898633D;
	Mon, 14 Aug 2023 11:57:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cYxRREzKhcYTsX0qTlvjIZV4qgiAlm2rNVw+o29EdO50CnvGuvOMD1r911uUGLTrQYSv1WrTcoRqDpZ7EKSxF7TUzNfyuwzqt9hvbrpuCj8hu7RFr3Vai7vgt9gPTiqAFEd2dWrGk9hNsYj2DRNvVnisnNUlJldU4RGZ7QyB9P+/d8EKXeVj+AI5dYhoywgXPXLzfUPfK+84ZeIWcvpBH6wIPESSFQELet9KfHweY0VF7Q1Uy6D2+ULSqZA4jmSdEWXdR8nahZxibL408y+yYMBM83uqG41Lrvv/Si7gBPVTKPCFR+MvBKVFG0yqKHWQYfo14N/BkSUfVTkPSUDL8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hb+iiSEZwbEB7uluNnHd9Ygg4g5Erh19o1Bvm6H3SLs=;
 b=eISJ5OAQSbpME4odCJza2c7GNOtfKMN2MhDJf/9JuMf/eqDfceBMNZibDnmo1MCvgiv7aQsEyYujalKPLShFsWlBpvKqgpGONU6iIdLMlwVTLew3EnYmmZhZ5iJUlEdviCnAta6ab9jjLg8Qfgxl7EZoE0KdKXYNzG6oaVfXspWXxNa9j9qlHro3GatqDLVDvNZkzSsdBdah2rgIAtwQZAF+uUqsutIaQq4oOBj6wJOFdsF27svjnlCKqUl65AhDYenLTgZS03+1Xgm/aaTwAj4cL5vB2CUoyfgRg9QYp5czl18ACShZHPz/o9ubwMM8pn7P4IPagwMvCEmnWKCRdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
References: <20230724033421.249893-1-parav@nvidia.com>
 <20230724033421.249893-5-parav@nvidia.com>
User-agent: mu4e 1.10.3; emacs 30.0.50
From: David Edmondson <david.edmondson@oracle.com>
To: Parav Pandit <parav@nvidia.com>
Cc: shahafs@nvidia.com, hengqi@linux.alibaba.com, virtio@lists.oasis-open.org,
        virtio-comment@lists.oasis-open.org
Date: Mon, 14 Aug 2023 12:57:21 +0100
In-reply-to: <20230724033421.249893-5-parav@nvidia.com>
Message-ID: <m2sf8l7s5w.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0244.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::10) To DS7PR10MB4926.namprd10.prod.outlook.com
 (2603:10b6:5:3ac::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB4926:EE_|CH3PR10MB7742:EE_
X-MS-Office365-Filtering-Correlation-Id: 389310a4-dabe-46b0-992b-08db9cbda686
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Vv9o/m65iPrS8F5hbzrHusGd7rEyqvDqVaBiwfhkhZOKeA0avTSHTJbPGa6kJ4whmBmB4h/n06xxNRigU4iTzARF2LGhLVKxlftLbQscGeZZ5+AxkEzmMVNLaYznN22ypg9tDl9mLTgAMxrVZkfE+Bes/7ff6QXrGpwpK6vCGiQZWZvBMSEh77kSltcCaryvsVu/rUez5KykekPaFViMwjfuVsx20mNGqKE6zIKeYkxibQiefNc5/hFzA8KcAV17p6W6nB70BVjOgoD906vqmDHp3kBEpZMjdUYKyLfg7wz3ClmUbFTFYDWDs0fGeDpSGDWI5LAwOGXFpRxM6i42H5AJSZrMFBMhGT9AjbzxP8iya2sU3sNz7nSwIJqPf5a/USEquCrQSJ9DUmxtoCU+3DHRS+rp28iMA59beaWblXAIQjTOX2xXIhfkmDj4M31e7JegttDVLCTasGN9M0mhBrlZc+KuPoMhw7a2hVbc/eQnnA+p+r5l9EJ74Zk3qon9ux8KLkCVTwx/+dHPP/UsKLF3fVUe9ip4+cGdNK+3gL//noSgDnhz0e1gBV06B30O
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB4926.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(396003)(136003)(39860400002)(376002)(1800799006)(186006)(451199021)(38100700002)(36756003)(86362001)(15650500001)(6512007)(6506007)(6486002)(6666004)(478600001)(44832011)(2906002)(2616005)(26005)(83380400001)(316002)(41300700001)(66946007)(66556008)(66476007)(6916009)(5660300002)(8676002)(8936002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?srxtpj9XjwQlxtmq+NI+6VruSzey8c6YmZLh1qRSksblHM4E3daRFAzxN2xT?=
 =?us-ascii?Q?k2rEWmfxlMMabmtwCgHpPJhMXuEkyAPkOb3A+ejN5ixy6rquKnlrEavAvrYu?=
 =?us-ascii?Q?6cGOKFQnbx74eXgXfv+J4SyogTO5sBJf+XBDd1uTzD31B9sC39QGWfd8R+IN?=
 =?us-ascii?Q?yVpsL1QScO6fhVhmXeVkmvjg1nUC85e24ScTgiIbsT3IOrLnKFwgF1ho1ROh?=
 =?us-ascii?Q?hekXe/dDlqNAeqMn+H0SUI47X7G/It+/h6PVwsnWBzvpvpTSsHlZdOZzlKHf?=
 =?us-ascii?Q?oFEDywBhwjTvBcOMXROYZQrBTF5WEGJhIyKccUf5YLr7zYPF1kQKp7PHssBP?=
 =?us-ascii?Q?BZpvYXOJ/F+RiJkRuNhOSd6oDsOsCc6yLC/Rw8cm9+bCKw/FyVUstovfIMfJ?=
 =?us-ascii?Q?hICqGxL9aKCyMSQt1zSOaRipwbjlZCjbDwnVcWbPkcG9B2p+M+vorm4jyhUs?=
 =?us-ascii?Q?MHm+0q/5A513s30y5CdQwCE5dy2QasYCeUxeaP1L7/VGvOudI+l0+f6k9B9N?=
 =?us-ascii?Q?u7NMYAKU4RavuPd9lYVsw6W0YrhviFupoj9399CH8/udoy2MnU+cQhN6wcWg?=
 =?us-ascii?Q?jOZUc1uEzH3jSkSRHHubDwlyaIth2R1PXs7HyF+dJ46aIMuF4QpOL+MTREzS?=
 =?us-ascii?Q?I+mzBkqs0vdeQn6vlaf01P52eTvptHY4ItrNpo943ZsX8+7UCs6f2VtI79uB?=
 =?us-ascii?Q?pTcBbrjnVVrZvszZLlXpenwakjJDV+HCwpRz+5Y4TAK/63bLDvAIr6gNqBLp?=
 =?us-ascii?Q?RQvetjEzqBXTJ+zBS/fjDox3i2PPWAhOPLsoIxLp8ENQeuNqYsnfi/GV6U+N?=
 =?us-ascii?Q?r+Aqt45PHDCJFe/b7xqu484swul//fTDpEZ4AAn2kZ39MVDARON5SSQRHFJt?=
 =?us-ascii?Q?n0b+VP92meihsi3C+k/jYbDg2zZcu9pir8cW3h9zQIwV1u1xCqgKC4LDbnw1?=
 =?us-ascii?Q?JefYR8Yd5m7Wo7vN/jnEESAkeUdBpATh5PxC0tTB6VWcqnZn28ckoWD6xpSy?=
 =?us-ascii?Q?q7zdnKxSb51pBUBK4XKPiPS95cWh7uInTVz4cWMx7qY/Of15jrDypTIipCp7?=
 =?us-ascii?Q?2ORgFoP8QWPi0MjNMk2ANLnZjzskGitMHf2jWdPI05M4FeIx06kvHQbuHTyt?=
 =?us-ascii?Q?9c2jwDDdIp9LL0bAaf/1TWAviTr6A5ecHA4K3BfO/UiYjB+4ZSxa1M4o3NT9?=
 =?us-ascii?Q?QcyW1YxfBK/hCZe03Wd1ABMDXLvxlL74IuVZc4C0grBBtLjBnI/P7rulIjYG?=
 =?us-ascii?Q?+h3FdRNuDwPqIVL3jlaH5DeYO7mmVZh5WP5Adc7QoDTdw8QYLY8oyI1ILrZ3?=
 =?us-ascii?Q?bwR+FfsY/9GRN7VOA5XGOnVuU8Us6W3TucbSRXvpaaHDl9EcQydiry4eaenA?=
 =?us-ascii?Q?AeP/4ghweSgLCX8zTIvhjfvaGLwty20keG1ehbcPsT52kYjBJiPVAfjdbSwu?=
 =?us-ascii?Q?bHYim2aFkTSousThHFYzamGViwiIRAsE+dHBS7AuBXbwoEKm1vQXFcgnOz3T?=
 =?us-ascii?Q?d8zEV9ECJqqyTsp6gC5RnyKLz0KfRxefQTGRFmAFNWQ6wUVPNuhKZGg8p3J4?=
 =?us-ascii?Q?xkuftJEfNpbPVkSWapvQuzawvHuhq/dWTVtD5R6TUoUSjQ2WtyLF7ZAoz4Ux?=
 =?us-ascii?Q?SQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	7NVruuC67pA4dVUHJ/YmpyENzacdJUqouN6OHkrzbg1VYnfL8homl8vyd2c+CcHXT3/2vgUWTMcAnz4ha5TzGO+hKKhYyfzPyQ2Auim8iBM7IbrnaBYwTTMiZ8n2wNVNRmxhNtnkb35xfg5/Dw+lv3VfwYfCjhU0Nsfpe+DysRuNlalgXcpb3ziQItBOINyCq3R4vuO/ZHBtERdhAwatKdmbS1i2Hr7bg5k164bRx3htAfGb0RxJRBY0DMYhMFR3SVHG/Q6yTACop7D33wr2TCqZ5Bjvk0JsU6o8yWAvopySZnR+qlpSes9mTOjE0PS5/SiilCKbhtSZyJ7lW/DXR7jTZZHSLi+IarxJV2vPWRc5LTiRdvmPJXisC72j0GhEmAz+FekxpHCL+7XcQnD8byIF4RQDrAsFZQUG91z9tjJYeg9qdFAWHPrXtfiSgtFxwuooc7et8t+a+vJy58yXLWQAv/D7bgHqSSW6/HFQj0Pn8AyNY3gpA5zuxYmZnvul0YOP3W8KqArSp9WHdso2OSRZBWD0qZY6OvMDtiwZklYjLRExk2BeK0brXVFyCdw27/uMeiT3ht/GTZbdSIrhBz3ycAMTC0sYUNKtcy5bwTctJCZkj0SfGrudXY50jcKg5brLlQimrPETLA69XiiR8zYufKnWiHufPqPcm7xACgqA0uIfjs8u+mh43rwqo94nUHJB7HO+B44BEOmkSsymXLuapyHIwaHCs/7xUBJ6D4XITe+yNw+x9UFjKIYLaSdf7w1q3NHFOi1cUk3rvNqDKov8AYDDZEiUxmX/eyWGg8FUsdxt4b3+jTxTkXbbZ9yQrpze60CjAnKPZFCqwQ4N2+++CezU3Dka64mFljIlyuQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 389310a4-dabe-46b0-992b-08db9cbda686
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4926.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 11:57:36.0557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YujYn4YwDsKRydwNIav640WmG0f2jnbyuzjRo0pIwQvFoD/b1j8LYGsQEARAteEUtvxyGObgpfdMsImuxpTS2G1vvCAe/StBEMSeE17rAf0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7742
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-14_07,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=999 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308140109
X-Proofpoint-GUID: -Fj6dzO-t4xE8cRfT3iz5LfoDC8r-on3
X-Proofpoint-ORIG-GUID: -Fj6dzO-t4xE8cRfT3iz5LfoDC8r-on3
Subject: Re: [virtio-comment] [PATCH requirements 4/7] net-features: Add
 notification coalescing requirements


On Monday, 2023-07-24 at 06:34:18 +03, Parav Pandit wrote:
> Add virtio net device notification coalescing improvements requirements.
>
> Signed-off-by: Parav Pandit <parav@nvidia.com>

Acked-by: David Edmondson <david.edmondson@oracle.com>

> ---
> changelog:
> v1->v2:
> - addressed comments from Stefan
> - redrafted the requirements to use rearm term and avoid queue enable
>   confusion
> v0->v1:
> - updated the description
> ---
>  net-workstream/features-1.4.md | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
> index e04727a..27a7886 100644
> --- a/net-workstream/features-1.4.md
> +++ b/net-workstream/features-1.4.md
> @@ -8,6 +8,7 @@ together is desired while updating the virtio net interface.
>  # 2. Summary
>  1. Device counters visible to the driver
>  2. Low latency tx and rx virtqueues for PCI transport
> +3. Virtqueue notification coalescing re-arming support
>  
>  # 3. Requirements
>  ## 3.1 Device counters
> @@ -164,3 +165,13 @@ struct vnet_rx_completion {
>     which can be recycled by the driver when the packets from the completed
>     page is fully consumed.
>  8. The device should be able to consume multiple pages for a receive GSO stream.
> +
> +## 3.3 Virtqueue notification coalescing re-arming support
> +0. Design goal:
> +   a. Avoid constant notifications from the device even in conditions when
> +      the driver may not have acted on the previous pending notification.
> +1. When Tx and Rx virtqueue notification coalescing is enabled, and when such
> +   a notification is reported by the device, the device stops sending further
> +   notifications until the driver rearms the notifications of the virtqueue.
> +2. When the driver rearms the notification of the virtqueue, the device
> +   to notify again if notification coalescing conditions are met.
-- 
You know your green from your red.

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

