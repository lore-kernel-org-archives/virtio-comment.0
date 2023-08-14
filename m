Return-Path: <virtio-comment-return-7084-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2127FC04A6A
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 11:55:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7F48C2AC49
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 11:55:23 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 70A2398638E
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 11:55:23 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 66BF0983F78; Mon, 14 Aug 2023 11:55:23 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 57A7C98633D;
	Mon, 14 Aug 2023 11:55:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gDLa7eBEWDe+9Bcvrpe98d4WNKwoywfF0C/lHvqxcoMLLDaS+8tNHH3Uw/8zufuqJVyVD9RLxxa4W+RwKFa499UVuDFux2CGX63/ZjCb3M4OtsBUfOW7z/HOW2zbfR9A68kDOGXc02Wcm2s7oQ0GejTKWAHGYK0vzFjsCDjl8O54KvHPvwbH0plBpkbAgZtHXWQypjNiyqOFK3qDYacAi/oHma9Y6dWJ0bkNY7+jbORGWZ8lCP9HIpOXdqkIpCWv4mTFLyaU4DT6c8Jk8dNPybOtQPEx2W2c5s6OLvcWXNcyHH4Z465EJXEa4WA2A7TdQNEt0jWxX7j7ovt4V9VOlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pjW6BuUbSWoEZ1Yi/Mm8o1cyx25oGMFZZKhsOaPgEBo=;
 b=C4AQonfmKtX4NTvoGbxlwoEumwNI2813jp5dSZflf9ReuWYcGrgddHQZuKfNvmuoqY9dXXY68HlM+JA9qXSMogDTsZKFO2owgTA3of3qFWPI4mg/i/EqJB2sQm71PlO0NrUg/5DswNDQoaxMtQcK+7sF1Pj3lytNlqrJ6bJl9KmCFOpsfm35F+MMvirix6uqN5H08HDmkVeHecWrNNcNJ3W3PUkCkrsR5lzsA31lEB6/CT0FsIaWuplBaUizQvvURQFBaP4CBRKcaqJNBt44uS5MC8rdtQZh+cNKKC+kmzurk60RacOdeUXfoRZ2OU41oxFcW1hiyOY2896FEvdsfQ==
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
Date: Mon, 14 Aug 2023 12:54:47 +0100
In-reply-to: <20230724033421.249893-4-parav@nvidia.com>
Message-ID: <m25y5h96ud.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0033.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::6) To DS7PR10MB4926.namprd10.prod.outlook.com
 (2603:10b6:5:3ac::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB4926:EE_|CH3PR10MB7742:EE_
X-MS-Office365-Filtering-Correlation-Id: 845b540f-01d3-483a-93c9-08db9cbd5075
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	am8Jryf7Mr661l0SbeX/x+LkH8upapj5x3S9m3ZF8v03dw+exWa3TxbBlLKoDNqwM0cPJJs7DX+YzLXz6KS1/yWauP4ZO2+qNgtYrMHKtecfYh89lXRNZIjSu6JNibP6rzPRooNppVmUuO6dx4K+AaORK16PeHxcaMTyEmkmpkgb4Txozckm31WFIFqa2jQ4+8Ycuq7gOQLuMC5Y/R+yTHKRGDNOoTdERRwGfmSxO4QNebW1Uz/kDJOlQw79dTkl93mvY6ZaibseFbZhaLPPZG9G2bhU76lQYlgHcIPjGSaXfnMbFebZWj2u6LD+ff0SQo/351I63wRpFtiWlvUA9wwCjhVjuHcx/ma9hggaF22nePlcff5TUJ+w/b3xeC3nHlHjyaJSuUz5WZU+roiLTNCnYkUPXgTelaFdxeTA9zt2K1cTbIg+M9o/pcOKz746jJ/+38ZEWzZRFkbSzVudtzTMmWgpwqty492s8H/AqZbNwxjZHSUhTgaVluApWL//nzPbB/tf9PlXBmJQHVTIGVhZT3QAYHQ+gqoQP6bszgO5WbmY0V2IpPk6xMM1W1O+
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB4926.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(396003)(136003)(39860400002)(376002)(1800799006)(186006)(451199021)(38100700002)(36756003)(86362001)(6512007)(6506007)(6486002)(6666004)(478600001)(44832011)(2906002)(2616005)(26005)(83380400001)(316002)(41300700001)(66946007)(66556008)(66476007)(6916009)(5660300002)(8676002)(8936002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?h/IQA+QXVIJQZpdQKPUzb2zyWMKcsqt0f3E1nQaACAkW8zzUbV2KjspYeIkC?=
 =?us-ascii?Q?3lWnlgItnDSIXJPq1LKtRMa4HOgPMc2MhYqqRPFYvtCIhVIrJ3PQ3zjaiV4/?=
 =?us-ascii?Q?6wjUtwNxOYVdEsfdWjkQuO1MS8ykAygVtvnAbvZIU91flm0jGnRWO2QXQ2On?=
 =?us-ascii?Q?wQwnC/sqQW6wp02hJR7Y9jeaRy9t6xzEHHg2dPqbV+GeoRkTkfNH7GtKEjm/?=
 =?us-ascii?Q?fgT8ih0s4PrHINg4OvPav3EQJNUYoxDl1f+nmoW9D7P3LOEYLRc82fC6TkFV?=
 =?us-ascii?Q?IMgZzdPXQiEhNxCkf5AJrJBJ01Ux9lnGE7GvwE3VfyJiwdXNJC+QGc6DXdBv?=
 =?us-ascii?Q?+kVDCjvDRcnsMpOBQgGq5UgT2FA4dSF6CQgu87gh4COP9Nw4vp+V+dpmkhVr?=
 =?us-ascii?Q?qLwummkDWfpVEeQRWWKy75VobuuI+BAn8LpIQwT28GkhqgybkSvw8lAhl7yG?=
 =?us-ascii?Q?3cKxulmpYQrUWgGuoCaQJcCrNgOjqc/T5/cCz2OaQEDjoWmlmEwTX98LpXd2?=
 =?us-ascii?Q?079Hs+qBX9quiy6p6OhF+Rf7irLkTH24GjnXShYIkGep6774VteC7puVIFZL?=
 =?us-ascii?Q?hdEMTyMSR9IAjFMBgsjwPyiqrWcJzVwApQa52yINXJ+dBSsNE/5YcC9A1nW+?=
 =?us-ascii?Q?RhP7MNRMEDD9UC1/mLZpiZl/8Uaa2Mz7wvniqZMJZ1OeqUgHZH2L68mc+z8+?=
 =?us-ascii?Q?zb9HQVddaDok7R4tv3wTUDenszCakNysir1QauVGRCxNcpyNXP8nca3EtrwS?=
 =?us-ascii?Q?2pQ1RQF0gnKsf6ST/DtoTiYlal1n7MaBKloSf49gcnpf75nBg6EQu3qvW5UM?=
 =?us-ascii?Q?x5BZxuKt9HqQK5QRQ/QFG6xHB2mDyY1L0uk5XpGYZrmImutSkc1M+PhfqCkA?=
 =?us-ascii?Q?5VgnEEI1QxoB6GbWQLF5hu5o1z/vLZ/3HE/43hZVu+zMnrRyjAOdv2riQvow?=
 =?us-ascii?Q?zOR+QumSDbYFDCm3OnkcQ7k9xyW2qO8g3fdDydgImGfnTYS2AJ0aLCk8A2ip?=
 =?us-ascii?Q?Er6cl3YzXFe7xwNiRI4O57wS9rl53Do6Uat0VtdXFjuz09DUM8/iC2/f/mQs?=
 =?us-ascii?Q?JwFwGIuCSoi0tVqG1qR0LpbDNsnVKXLnvfIK+osbkx2dwxhT2Mn+MaxtsBtB?=
 =?us-ascii?Q?RBQ/SpWFdTeb1aDwIzdLrxPgdWgNsoVxK5gwBiCr5zkkK8xOgZ6GbQxvxgZ+?=
 =?us-ascii?Q?dgXlZI4r62T/zEjr0q5dTa6hU53wE5AQZvA2ujz+5rCqaw8d3MHBHWlyVx9+?=
 =?us-ascii?Q?nmMCSSzix7PxGBoUMD6G9jOfjWKUkBvec5HK+S5DWVAjNGNnsS8t0+7umVrV?=
 =?us-ascii?Q?rQNgZOB6J8nlqKHZfopLxmLmlShqCeWz3PPB3ns1mCr42phVR61ruVNTurKx?=
 =?us-ascii?Q?sXU5xMR0RMxAeWCIIZUCELXNa8mO1Sn9DroKiy12QgxGQhSBlPySobNpTEoL?=
 =?us-ascii?Q?FSqbfa2wiIVakFxZdOx0Evx59ANRgV+t6jecnB1n9RWe/3LveQvGDCL+MwVm?=
 =?us-ascii?Q?OMNYIpyBMKc+LnkGCYuyVOSMiclO8IL50wODI9ZGavFxnHW8OiozvVZczeIl?=
 =?us-ascii?Q?blKtfsRituwQBRB/gwdpiDwMY5H8zGuN2IiI8VkMgzAhzSjmcR2lq1PF7mRS?=
 =?us-ascii?Q?fg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	VAxu2BC6szLEK9c5TXzvIpVKtfOlJP7yu00HD+gP4QV2tytjnbb79cUZKTuaonYSt1ndT+aZeJIzfngqQpLrxwP3pLc9bSEhADf7TXJXwCCFmGkfka1chfSgxxNZH5hzHmUIIy9Hs4Bs6BrRghTlkEz8pNL6nuswg+f/taqWS3fhucoe6orIlceGWYZYzjRRZmhzbpijr03psXaN0UxzzFVxJlq3gGwfBfsx+j5DhrB4LxNfcGGaPIoNjp5IzHaYguCOz10rWUnwMz2L6xIJDznF02BLw0XdDTaM4E9/G6egtsZstJzwuBTgKMwwuirAWFDHWRO7Efe7Wk+ka1bQAzl/Tx21RLWIHh2jz4b9PqSjJgwnqg6Rq+i8b0WE3CPNGVju1lgrj72Qv1z2y+e2v3c50LQmTcfwWFTPj6EERFVFPF0BS/aiUSbR/mIJjVlBhot0mR1Tr0X6n6kY5Ydd/O6DVcVUrZSI5r75jW4mCpGkHYxi4fm19gLWJI5HeqjTwXQjRznoLV4kzoTxWPpyCNUVkZ3hxkRhFHm7nrXkd+3JkKEv0W3tc8WrWqw4Bk4j1HAwrDyBIsFwhj7gcA1MH/WfBEJhkfCK+wwFPVyp7jYnI8nSdYg56yaqKB6STOVHlP3BXh/QgZx70ba+GN3mvC1Y1/DYH4MqvKxjmqjwNdca6xZp5IQMcqmM2Nn7YZBoB/uNP+/s3yrlqXm9uVCk9THgFbQvjbzN+EwY2EI1IKQnsLKEzWBf0pUqMWTR7coUgqC31U2TZ2bKNMJLS9wIicE//5nk0+MivWOuZpsQG8ix5KaQHYW6ioHiMdZ+7K+N8ZquaasdoWE1jV1ODRomXkSoMKs9/ssQgC4zgw+FmtM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 845b540f-01d3-483a-93c9-08db9cbd5075
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4926.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 11:55:11.7525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zSeZOi6a1N3pgdovQX5aEWbV6lxrEqQjcWKEc8mBzG87ZYzpaZQICkyB1D0Bm/yKG+s+b72AUwzkx2wN1qfuBhX7v0dwhczssK0o9el9/Vo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7742
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-14_07,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308140109
X-Proofpoint-ORIG-GUID: 3hTdQ2ti7pytskrKRF3JzfzfOReVaW1U
X-Proofpoint-GUID: 3hTdQ2ti7pytskrKRF3JzfzfOReVaW1U
Subject: Re: [virtio-comment] [PATCH requirements 3/7] net-features: Add low
 latency receive queue requirements


On Monday, 2023-07-24 at 06:34:17 +03, Parav Pandit wrote:
> Add requirements for the low latency receive queue.
>
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
> changelog:
> v0->v1:
> - clarified the requirements further
> - added line for the gro case
> - added design goals as the motivation for the requirements
> ---
>  net-workstream/features-1.4.md | 45 +++++++++++++++++++++++++++++++++-
>  1 file changed, 44 insertions(+), 1 deletion(-)
>
> diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
> index eb95592..e04727a 100644
> --- a/net-workstream/features-1.4.md
> +++ b/net-workstream/features-1.4.md
> @@ -7,7 +7,7 @@ together is desired while updating the virtio net interface.
>
>  # 2. Summary
>  1. Device counters visible to the driver
> -2. Low latency tx virtqueue for PCI transport
> +2. Low latency tx and rx virtqueues for PCI transport
>
>  # 3. Requirements
>  ## 3.1 Device counters
> @@ -121,3 +121,46 @@ struct vnet_data_desc desc[2];
>
>  9. A flow filter virtqueue also similarly need the ability to inline the short flow
>     command header.
> +
> +### 3.2.2 Low latency rx virtqueue
> +0. Design goal:
> +   a. Keep packet metadata and buffer data together which is consumed by driver
> +      layer and make it available in a single cache line of cpu
> +   b. Instead of having per packet descriptors which is complex to scale for
> +      the device, supply the page directly to the device to consume it based
> +      on packet size

Really "per packet descriptor buffers"?

> +1. The device should be able to write a packet receive completion that consists
> +   of struct virtio_net_hdr (or similar) and a buffer id using a single DMA write
> +   PCIe TLP.
> +2. The device should be able to perform DMA writes of multiple packets
> +   completions in a single DMA transaction up to the PCIe maximum write limit
> +   in a transaction.
> +3. The device should be able to zero pad packet write completion to align it to
> +   64B or CPU cache line size whenever possible.
> +4. An example of the above DMA completion structure:
> +
> +```
> +/* Constant size receive packet completion */
> +struct vnet_rx_completion {
> +   u16 flags;
> +   u16 id; /* buffer id */
> +   u8 gso_type;
> +   u8 reserved[3];
> +   le16 gso_hdr_len;
> +   le16 gso_size;
> +   le16 csum_start;
> +   le16 csum_offset;
> +   u16 reserved2;
> +   u64 timestamp; /* explained later */
> +   u8 padding[];
> +};
> +```
> +5. The driver should be able to post constant-size buffer pages on a receive
> +   queue which can be consumed by the device for an incoming packet of any size
> +   from 64B to 9K bytes.
> +6. The device should be able to know the constant buffer size at receive
> +   virtqueue level instead of per buffer level.
> +7. The device should be able to indicate when a full page buffer is consumed,
> +   which can be recycled by the driver when the packets from the completed
> +   page is fully consumed.

s/is full consumed/are fully consumed/

> +8. The device should be able to consume multiple pages for a receive GSO stream.
-- 
So tap at my window, maybe I might let you in.

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

