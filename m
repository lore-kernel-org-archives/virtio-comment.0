Return-Path: <virtio-comment-return-7137-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E82C0015E
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 08:59:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9C78E60346
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 08:59:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 844639863A5
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 08:59:21 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6AC89984035; Tue, 15 Aug 2023 08:59:21 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5A70098633F;
	Tue, 15 Aug 2023 08:59:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dp4A/9Bfdf+xe+MJZKkiZrkdQqUfdS7eHVtmoHAUwZFrwgyZiUXBVcVTMy2lPtOnRueNe3lDOiTiou9CiKuR6zTwxcDKcucUVFohqV6C5CVtT3qEaCakDn5ESVdprozAtHkEUM0012dVO9ilBPvWqFG7+oFTKVWeQ0dKckf1MLzKglQjfQ8AtD+y1vrw8UjPQy4UwmfN8FDWrq6yrOR5ruHyx4alqikGsYP6ryY9k3RBfPML6vGqGR4z8MIJ6qfPPNtIywhqQrO8eDcfEYMhR9WyEcfN5nKznBYoPUIOH6cB+5tt/rMmOgVrVnHDrVFDAAboDsy7tukFzU4jMrYa2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oytgJrYpHh5+ENQC9j/7uSX7lTUCMCqF1M5VgKwBsJA=;
 b=ZsdALK3ed9z5G3U6w0oZqO3+KadKjZQw3tAATXPfmfKUGX8ViLzxY7sQqlDZlOJnSKH3AF7z0hIyvdBSgPmGsStQaXdrSYu3gpPsDiklFQ+nLESEdPatLqGTAYSXSLYlvR8CFkbpjdxnUzEmUPxxacTKRyE47XqphhvEn5Xe/Br2zXxjdUpFxkSUGL7/XCFts1II1rlQ7eyNS67AhXfCzhiiIifL15c/yb4LXuPpXOSUAHu/3L39a7btQhn7xkl/Z+jxmfAULnE1fZDMked+hYmdhc7IOVtP+SlkH2c21dM7dhAI5OY+RTBMUttllVS/cSsWc2k5d1SNS2jXu7JyVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
References: <20230815074600.473933-1-parav@nvidia.com>
 <20230815074600.473933-2-parav@nvidia.com>
User-agent: mu4e 1.10.3; emacs 30.0.50
From: David Edmondson <david.edmondson@oracle.com>
To: Parav Pandit <parav@nvidia.com>
Cc: hengqi@linux.alibaba.com, xuanzhuo@linux.alibaba.com, sburla@marvell.com,
        shahafs@nvidia.com, virtio@lists.oasis-open.org,
        virtio-comment@lists.oasis-open.org
Date: Tue, 15 Aug 2023 09:56:17 +0100
In-reply-to: <20230815074600.473933-2-parav@nvidia.com>
Message-ID: <m2pm3o65rb.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0443.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::16) To DS7PR10MB4926.namprd10.prod.outlook.com
 (2603:10b6:5:3ac::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB4926:EE_|CH0PR10MB7484:EE_
X-MS-Office365-Filtering-Correlation-Id: a141ec8e-acdf-4c05-4079-08db9d6de2fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CkmJqYxCdNovoajr1feQwi10hClNWungZ9DYoomlIfG68gjFoiNyB0EvXAaNs6NyguDYjhI299HuCWVVzoTy4Y+YCkL9u4Hll8PBUFJF8sM1XoEcXUMI5Ei09zY2/cdRAUHGBeH+KwXuunCHzPSZSFMaJXqTshOV1LdFWjB+SROesV0Bdws8+wywDhyw9NxLEFpUoprjYpuflKS/AaXyiZm2gL32oCfOx2pzY25hfnfBAcKmVxBt7UhCIFOhZsJWfY07Wk4VfH47Ng0TPOX7z+IJqnPBCXEy5/ol3mTSlozUSLsnfc6jIcPG77/ba2KK/nIIpl02bj6LMNVORM6o/jVgeSOBm90F5nJTPIFpApQJqCQHDb9iSJSbln8jVIqVxWlggczHmjlPDUrlHEBcpylf9yecAAUk48PFIvphaifVm8bZXdBY6S4tvou0y+QwFkuXz7WMZABrQY8DdDWLjRYuyjO1wZxUnLkNdgEaVswq6mjk7xEBhU9veRBKmeaRpIqcSxL7v0lPxqs6lX8KaeFdTR/PbRv/aE+13J4kad0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB4926.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(136003)(366004)(376002)(346002)(186006)(1800799006)(451199021)(38100700002)(36756003)(86362001)(6512007)(6506007)(966005)(44832011)(478600001)(6666004)(6486002)(2906002)(2616005)(26005)(83380400001)(316002)(41300700001)(66556008)(66946007)(66476007)(6916009)(5660300002)(8676002)(8936002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HrqiD2fGNUFuhjoW+AAj6srJx8HKhkxhV8S+6Rsy38aEdgl2+ylL59LFnN8A?=
 =?us-ascii?Q?X0bSTUMCf/ONVEuw/aI7Klr/jydyTukZ7hvOTUzccFX7rPju62CXP+ksyn7q?=
 =?us-ascii?Q?kW67DhHuGYH2K9o45Ciquj8rRB0znnwbvfUl+4Q7kAypf+22EsyFsiG5hnRa?=
 =?us-ascii?Q?3a9AtsdBUcBJ+S5GOOOWd/UQRT7/HHEmcObERdX9XUkJwu3asSMKuWxmgIG+?=
 =?us-ascii?Q?j7vPqsJJvjm3jjY0puNnqeDrdxOSCWWT8fxiSR1TYtGkWEGbJ1rTqUImIHQw?=
 =?us-ascii?Q?YFYgYE2jvtXd9C4g0djUQquMISL5fMOT+piN+idbz7ZdZxSFLNcEiFrH351s?=
 =?us-ascii?Q?6occsG7XrBXl7sCfLZxog/jd9q6iJllKbq0Y8iH0bG4uTCq8ybeBxBD2t2dz?=
 =?us-ascii?Q?mI9RBBFm7AFflD5kBcnzzc/eToLBrz+/WGyLheCzKD6c0EoiUe3Brr5KJs5C?=
 =?us-ascii?Q?OC6FQifBozGK3pJBGtGxATkUiXn2o++tzhMV/OPB7KrLo1ryij3Q2pQKdXlZ?=
 =?us-ascii?Q?EVH/YBsDMp9dcVjou85bfcGKw5kmP8fV6+SGOaEPXCbajhq7tyALyY4tNc4m?=
 =?us-ascii?Q?yHV0BVFt+Woy54H8BLLKrbWvVeGEZdV7avc5jLoBxqpIYsRJPt21GiPfPWI7?=
 =?us-ascii?Q?JgdfqjiavCpv/NfI/XUGudc64apfaE9c8wtfwWyl8OvMRCus4OgprKanF7tw?=
 =?us-ascii?Q?pv9OyslZ/cW5b0qRkB240pvZeAnfDqDoQWK/i/XMenIJTkNun8o455+3h9UC?=
 =?us-ascii?Q?2j5sSUtxGJPDNgYTxD/pKoPRZl87HS0FL059JSvyi14+pnDh0h+1kz1FVPso?=
 =?us-ascii?Q?xnjnHFY/522cHb7SeqNKLnA6OyzREgxbb1g4dGj1mukboF9MEdWzcfkZY9Dq?=
 =?us-ascii?Q?tCv+NNWOPP2c46XhnVUdWO1M4sO0dxsChyo6VZ7z/hYGCxbHAJvw48a/6Odx?=
 =?us-ascii?Q?eBYTJ//WdLlaRF+gXkYcjpi5uMpd1veqcVjJzXpkBg3DoiQu4jqkEUWcI/WG?=
 =?us-ascii?Q?ML2p3ZGr1mwecM23VqS8exh68OhKMcmAIYmjpzObI0D8SILDM5SRpVDg2VKo?=
 =?us-ascii?Q?EnUp4Y4SjikWuDlPsNakdirhokZdtCeMh6upcR8U0CVTNrRNCZNpoWLY8Lem?=
 =?us-ascii?Q?KPxYpL0JMwIW3E1IsGhwRFq/h5hpob5Fn8IeXo0Pags9vQzUBmqYhlgX9eZ5?=
 =?us-ascii?Q?XV1zMEXzk+1j+lfK3kdPu2KyUo2LxZb4Pi+CpR9kjcVw7GN9q7YUSnQH5yMZ?=
 =?us-ascii?Q?xGsDXxIgh2x6XeHuyOsIEtw6LBC87olUkYJawylkjISKS5Kb7oOz+acP02Iu?=
 =?us-ascii?Q?4TyIOL/CznXLtUFwu0jCENPF4o9xXVHoafDNMKx1yi1ku0VmSjILTyAMGzeY?=
 =?us-ascii?Q?YcsNOPk3/ka3bgZBmz4+3+lJt0hh8o5AYPAoc2hJPZn7jfIWLul6fxxHwn7K?=
 =?us-ascii?Q?IwZTc0Kcp8EzTgFW5Qw6j4qxA3qvyr7FXfuYhF5AozQn7OnC8r0bAV8Lpx/N?=
 =?us-ascii?Q?pqS7b03ha67UbpUykBHfXrvYSKpjq7rkMrgqViB5B96w5ScbS82SfKcm2W68?=
 =?us-ascii?Q?aP9ItBH64nZeib6O+BqaPe1qEAnaWRvQlZad32/WSUA9cz4pRcQM2tijSZwy?=
 =?us-ascii?Q?Iw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	PqkyR5Dyc4wTkItIPu5dEPjhfIGFlPOmfDbO32L1jkAbk451Hzv5kzpLxl2I7tZutHREycI38xh3WRedx8bdHIRvbjLX224MNID+9H/9Cq0Zf/NyohPX2plcrIsq0odRj8rrPhZpY+8PNZchkM3nZKZRcCg4S1w0c+QwQ0t8a20a6lkoaVKGqD8e08iC06cF4TSSXYpKkXfN+kyN0Hb2OQNDC+kGzOz5JAraZoK8PP4YvNhakKes3oIvNYVkOAKAXTn4Cu29KpSsfmKErYccX58+yF+wQ+cuuYxYrim1W4/yDmnw/Thd4O8WgckEIdY3lxrmAe1uTzUk810kidmeaajKp1/rgO3jqy3Dro9kC8PZ4GOjXcCFwgFLHzCn9/M9o32V3Yn4aQDSb/hIE9J8xf7ld3BD0XNcIVYeaX1kzpq62d0Ki7+rr4+S08Yl3nltPUCtRM8UOpnL/a/N3zhFiIddAVSWmuF78R36/Uods1XbFgao55oLmQBVsoHXLi6IRcHJOCs/JrW2e7yDRHWPDmEsufrp0gj62sf12tQj5D6rh3IkM8SEUdVXcx35NS5LJu1xa/IWfTn8bvZUCi+bqgO/MwZjuvnyUDEk70vuZ1CfWYL4hBcNKnFKS93qvoG7d35YthMIzwzC/EhfJtTy022GQ27ZIOUfAXY086rJ1HykWcdFUD7JtWJYg+zecFq2Xyng0yRVOL5HtwoRhMqdayaIuIQNGBQ2ldUXPbbDI1kn+WFhhUH4BuI0lYuUWe21bJaG4WTJLJuMiztfodYTl+yh/G5fbqLPLJaeAPsDC14JuNpRBjtrCUSNstovKLgIebIqSnxsxd6V09J32PE8yuovA7tBuQVM9tz6OP4gMNoajXv6dYMMKjmYwOjR6UAi
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a141ec8e-acdf-4c05-4079-08db9d6de2fc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4926.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 08:59:09.0010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IsB1ODGd2Tkhor6aImzR9RpZRD8gYdQnuRMIm1hS0dVJ5qSCLQb2neTJc4541qQPPgcGWo9WHDWMJ0HAH6bkWk4wVwhMiShH2qTqNhuKs2I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7484
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-15_08,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 mlxscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308150080
X-Proofpoint-GUID: p5UOIuS-kPh1usbGaOUl-6svHYeWZs9i
X-Proofpoint-ORIG-GUID: p5UOIuS-kPh1usbGaOUl-6svHYeWZs9i
Subject: Re: [virtio-comment] [PATCH requirements v4 1/7] net-features: Add
 requirements document for release 1.4


On Tuesday, 2023-08-15 at 10:45:54 +03, Parav Pandit wrote:
> Add requirements document template for the virtio net features.
>
> Add virtio net device counters visible to driver.
>
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
> changelog:
> v3->v4:
> - Addressed comment from David
> - Added link to more counters that we are already discussing
> v0->v1:
> - removed tx dropped counter
> - updated requirements to mention about virtqueue interface for counters
>   query
> ---
>  net-workstream/features-1.4.md | 43 ++++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 net-workstream/features-1.4.md
>
> diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
> new file mode 100644
> index 0000000..c2b1cc8
> --- /dev/null
> +++ b/net-workstream/features-1.4.md
> @@ -0,0 +1,43 @@
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
> +4. If a virtio device is group member device, a group owner should be able
> +   to query all the counter attributes using the administration command which
> +   a virtio member device will expose via a virtqueue to the driver.

The language seems confusing here. How about:

If a virtio device is a group member device, it must be possible to
query all of the group member counter attributes via the group owner
device.

> +4. If a virtio device is a group member device, a group owner should be able
> +   to query all of the member device counter attributes and counters via the
> +   group owner device.

Similarly:

If a virtio device is a group member device, it must be possible to
query all of the group member counters via the group owner device.

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
It's gettin', it's gettin', it's gettin' kinda hectic.

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

