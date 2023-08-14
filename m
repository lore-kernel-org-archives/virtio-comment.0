Return-Path: <virtio-comment-return-7086-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358B6C001B0
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 11:56:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 8B8EB33586
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 11:56:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 83B7B98638E
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 11:56:48 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7AEF6983F78; Mon, 14 Aug 2023 11:56:48 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6BECC98633D;
	Mon, 14 Aug 2023 11:56:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rg4bwkOnJEcMmtXnklAbE2NakHm7KFh6j8zkr4Oya22yJTGCI46x4iMdMiOv7A4dOOAJjK/B9Skhvodp5bgP2MlTcSXkXkD3lvvesv29UDVH91EFmbzDS77uE8uLqnEdsRA2QM4FKRhPOiz+pwB6hCDHxyuppWqFkX1ahgmEyN+rQ7pp1epRjGJkxhpT3go3UKDyGVPNj8Z1jfUeEK1qEc+wypMTaRwQ7BTcbP+ecVClMXMNl/6xqkhsIHAH9IQUwEXXbXlJK2tIs6iIY41qLGYlzbkIpxo2OT14mjJLPXiHepeV3+V2Gkah4DDRDPDivT6G8LOhOPwrPYL7CirMfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a8YrVup8OBfB/eVIX5IxwjO7Ml2ZfoPHYYx5BwSIpWw=;
 b=LSEZSehYRQgP0UDgspwSoA78qbnuCnuHkEHyWSMXB1k/OMd4pHAhU9W+S8AEYPCz34s4q9Ns7zLJTaiu1xT+jhXmNtafG5pT/KsTd7as8uXN0/z42v02/x7uFuGmXd/EhiJYwJyZFZ6w5yeo3RCZesYdGgnozH9sumUCx4+FYpY2XYJISRCVRln4x9/0CNLMwKpHlU95rs+FsQmPKftWlxalh1rAtlZxVZN7DoI34mtGYOhcYgnkYdbucjyv/0DPr2zuBmTno9gFcCsxsTw+M4dqYknTGelgpMD7Het8eq0faAVgnOJgtsoXC3/+DFSrbjIM/Jusf4S5uXiR4Aamsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
References: <20230724033421.249893-1-parav@nvidia.com>
 <20230724033421.249893-2-parav@nvidia.com>
User-agent: mu4e 1.10.3; emacs 30.0.50
From: David Edmondson <david.edmondson@oracle.com>
To: Parav Pandit <parav@nvidia.com>
Cc: shahafs@nvidia.com, hengqi@linux.alibaba.com, virtio@lists.oasis-open.org,
        virtio-comment@lists.oasis-open.org
Date: Mon, 14 Aug 2023 12:56:26 +0100
In-reply-to: <20230724033421.249893-2-parav@nvidia.com>
Message-ID: <m2wmxx7s7k.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0123.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::20) To DS7PR10MB4926.namprd10.prod.outlook.com
 (2603:10b6:5:3ac::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB4926:EE_|CH3PR10MB7742:EE_
X-MS-Office365-Filtering-Correlation-Id: 74e00d1a-ebe0-4593-5986-08db9cbd8305
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	w5wuJfCdT39hYShBQHnZkdoIBB3TFNUtfOdMDdEtnEwb6Z5s/ctZyuRzeqUtjx2gG4Kyx6nO4YK08uhHOZ6DTP/R5TdLtOHeh7OXZNhI3qRO4PQYIWNOeMyMLOC2LYwixawpMV0n4mnF0nosgXY3yquwHXyDbzmKciYKXXeDU9lQTLEoM8eDyMRusYf3RL6r4nrEwA3Zhy7YtAjTQcCaYah7iUssjgSTbvVLzM5eoZ20wGQKV0w8l0rQJnY+zub6sB8GKjJ/1CVPh03YllLxbyN8t4g0UYfxlzqwmu/S7QrBRl1JgHKsZN6jd4FWCa0zUz9O9dhWhEb/IFdgSl/Lr5EH+lHWybShNX35cu8RboKdQtINDBt5jn7zG0qua/o86eqnGpOyB+vPUS8zoiAbEhzmres5nrGBWMA3lPqZes9kCeiH6wZkeqtV7rZzzV5I25hUTLL0RV+oSc/dVIPmpeMTTvQOz5k4c9K+8UusVSJa+e3Vuf0I4gnEIjq/Qr/ZODJDjZMbmzXFvyZtxZ8rwvT0TwALoEPyJHgqsY+iYqfbqnRw2c4WtWuu2T1D0oyi
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB4926.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(396003)(136003)(39860400002)(376002)(1800799006)(186006)(451199021)(38100700002)(36756003)(86362001)(6512007)(6506007)(6486002)(6666004)(478600001)(44832011)(2906002)(2616005)(26005)(83380400001)(316002)(41300700001)(66946007)(66556008)(66476007)(6916009)(5660300002)(8676002)(8936002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oJWjXetjfJqZxBJwnxzxchaM8a+dwn42IuZDKYzrHPjXdK2t2OM0bYUZmY3Y?=
 =?us-ascii?Q?YxNZJrLH7anKBw2VrPbL5ShNOH0h6cGpFKja1fOwkA3trTDVuttH5SZqRO/8?=
 =?us-ascii?Q?u2zAouNzsqU2aC8SCXQtoKD8xW//qXUoMSojRELwbepMdRHlbxIraqsXFSpK?=
 =?us-ascii?Q?aPiBC29TtJuZKWNz7BJWBzBKLrTATwZTpbYYPG7DaDpFzoP1TwubXSyF7c/+?=
 =?us-ascii?Q?p+U8gIGyC1LUTi7fexmsrVmCq7lsnNwbVN5L4Z0bZGBSa/yRmz1TZzj1b3E7?=
 =?us-ascii?Q?55k9+fWjeeBDTovRhnAKQkpw9nX6HTIyGiT0VVlKcqTgX7R/jZ6DeJoxYHbI?=
 =?us-ascii?Q?3annKFo+Q4bDQsmHgdfa55/5JJGNelnGqjsQ/QTP1my3ci9csxGmO5125AD7?=
 =?us-ascii?Q?SGlmG/ryKvIJPNLShH0yYZtA91Xil1cp7ObQ6tBaDD0ikSQoM3f+Knbtb2JD?=
 =?us-ascii?Q?TgokC7cv4aM8foEaSpYyFZy3QeLS3gZgW/AMf2EUUtxLBp+Hho8Xdc1rbb6K?=
 =?us-ascii?Q?vQ3M9T6DWvGTPdNjwbKFokwg7zuw5ReouAmomdj3C5D/7C2+EK1hLt5HdJfb?=
 =?us-ascii?Q?Hoc+fWzPEX3x9Zm0gEeaasWLo2+gQqeSD/26URb9ZuHaZddYppyp6bN8nZD+?=
 =?us-ascii?Q?MbFUF+CDdV/94eAWbvsjpChbots1lnhzM/bGxed9fc/XfHDxN5Btwwas969O?=
 =?us-ascii?Q?yQ5p81NaTG04jgHDIiY0GK1jSfc2wIGrop5oFF/ztqbEWhV2GZ6NoGzQP0vs?=
 =?us-ascii?Q?Bjuy6cN8yhKgnJpbiXGsMlBmFnLKgJe0YSgco8W4JH4jvgzy89YThoIsJowk?=
 =?us-ascii?Q?24vaN7q+hQlrVC8u8Y9Xr3j1E9n7d6c23yy8MaRyslVCsWFHbIv6EZyPVIQz?=
 =?us-ascii?Q?qPVGghVpI+9i67D63RQR4oqDbximPby2SaFhB9mIE/BuvJysU79vnjNJH68F?=
 =?us-ascii?Q?YH1ex0heKwpiuTBzG2Z5uWMz2idxGe7JFJbM0zR9b24DutPrpe8ZYSCqKGHj?=
 =?us-ascii?Q?ZlW6Ei52LWqffd42OQhdGbL0owmt4fHiKRENzRV7gAcFoWpMxzDlLTlLGq6z?=
 =?us-ascii?Q?eOMURUNSFosTOgBqAH/L4Fe3CgZCTIUaRwYvFU+1sK34Y0VesVvPCTJXuPPh?=
 =?us-ascii?Q?C6XBZfBdAqxXTOaNURsJk+mMqzJ1fq0Z5KxpYb21VZOBXdgqTqpCV8smmbgf?=
 =?us-ascii?Q?IS6/M1y66K00kpgbseFaIp2OVJsdEEEfJ1KD4Depo/ldJCDNyntg3TyN75ui?=
 =?us-ascii?Q?H1pcVdQ8cyKbEq7KRCe/ty01Mg9reW+GdrjF0cZ3HRrL33Oq8BUccbtc8+yY?=
 =?us-ascii?Q?xS3nyCqfhuheHMF/wrlDrvVxUR2DoiYPtVDo+moebAsxrljrfxLyKPqcPtFn?=
 =?us-ascii?Q?lC/Nz95RRYvDlbV8zXLJ4Qaq7PRThSf6VHmp1URgTp82ZVFYSCLOFFlhCylB?=
 =?us-ascii?Q?euyl+T8acZLoEqOoEoC0DjU0RFzJ8x0C6ZfQFL5BNi6ddEXhGHUMG2fAYGuE?=
 =?us-ascii?Q?bFg43ots8rHGGQPNA/WkZprQ1KV5aRMqagXsy+EvL+KvUMH+Q310Vn5km9vI?=
 =?us-ascii?Q?cwBEKLR61yjSz6B8A0BPB4Cx4dQ+dpS4fAtPozURdL1n+eVMXcLRACHnoCMl?=
 =?us-ascii?Q?7w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	aZrPN0ydm7w7/CsYgwPTBuKX0e4YhgbQlzMB03+6yDK34b4LbYl/WtKV/30Mg4T2IQp9qeXyFu6gVydSXGT+FfzMXNK1RAhvZs3zX6I0l7UxkRAiApNkJYhN7j5LKphZFUOERhFK76EMAlxfJCBlMuzK0vit94MevbfI24EULDaTcgkz3SbykBybaKx8rG1CiKAcltpgH7Kgbkug+ZfBE97trT6FRYhsizcYUvPn0hvCiy3wfptTsLvVFBM/s3l9aL4OIN9AB3z9Qf9GE7Q80ZcSlKKD4o3gqF2SUW02oyzRxualIfo++k2Qq5K8pYGqA4vRc7sXqG5i5f0IMsRRujMQ0EUhdINRQ1d7tHNdzfYpI4bNud2/Sr+w2E8RXi5oL3f1YBxBPNErUBlpm+vO3QrlGnL2Al7TmLffhAnPJ4MRgptg12PQH+SRRD8H2UT65I51PjBVQXu0Q3dqMrNi0uXsW4x1KSOjcqFQDUgJGPfbmIB8WG4631QEhCT9cTfH0pwYOSTKVbfurflKg8rDDYuJ72szqlf8Ug1hvx/CpE9shgpJ2IZFhMJCPMdX/q6JbTrgIWr17KhBe9ICHVJu58zSlctcWYZp/q0PH7/VS/kfINu/W6mm1po+w5hnDm8HUOF8/zLF7bm9c+up04tqKL32OCTFT8yvSOcMevdxxl4CUnUTntgbou73sfOvelVf0pLz2eIhWX9YwQzu76FoGccCFvWYYjWSxNoJts69Toi5vJytb8rBuPxfy+zfYVDTPDMgXSpgkPJ/DKbOQSfuvgxrNHg64qSF2Ux1LbzaG2YknnTuk0y6DhUmQjXbI19cvmIXhqC/UZa8zqOnr7n3bYjt5PZ4t4JJmCKgf4HvLmM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74e00d1a-ebe0-4593-5986-08db9cbd8305
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4926.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 11:56:36.5794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GluwH0xOAMIie5iUJFiB3gA1ge7eajjeBajcBemfGeHJNI01Q2+z270UZkQriv0Wqy4I/SpPe66k0BQx+VsNVbLnB/euILNcKTHTQmyGbB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7742
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-14_07,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 mlxscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308140109
X-Proofpoint-ORIG-GUID: YqxQ2P4Ge-E8GERcgOLn4nsw7zNKT-6D
X-Proofpoint-GUID: YqxQ2P4Ge-E8GERcgOLn4nsw7zNKT-6D
Subject: Re: [virtio-comment] [PATCH requirements 1/7] net-features: Add
 requirements document for release 1.4

On Monday, 2023-07-24 at 06:34:15 +03, Parav Pandit wrote:
> Add requirements document template for the virtio net features.
>
> Add virtio net device counters visible to driver.

Minor, but perhaps separate the introduction and the statistics into
distinct changes.

> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
> changelog:
> v0->v1:
> - removed tx dropped counter
> - updated requirements to mention about virtqueue interface for counters
>   query
> ---
>  net-workstream/features-1.4.md | 35 ++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 net-workstream/features-1.4.md
>
> diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
> new file mode 100644
> index 0000000..4c3797b
> --- /dev/null
> +++ b/net-workstream/features-1.4.md
> @@ -0,0 +1,35 @@
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

Isn't this really "if the driver is migrated"?

I'm not sure of an obvious term for "the abstracted device that
represents an actual device to which this driver is attached".

> +4. If a virtio device is group member device, a group owner should be able
> +   to query all the counter attributes using the administration command which
> +   a virtio member device will expose via a virtqueue to the driver.

Suggest:

If a virtio device is a group member device, a group owner should be
able to query all of the member device counter attributes and counters
via the group owner device.

> +
> +### 3.1.1 Per receive queue counters
> +1. le64 rx_oversize_pkt_errors: Packet dropped due to receive packet being
> +    oversize than the buffer size
> +2. le64 rx_no_buffer_pkt_errors: Packet dropped due to unavailability of the
> +    buffer in the receive queue
> +3. le64 rx_gro_pkts: Packets treated as receive GSO sequence by the device
> +4. le64 rx_pkts: Total packets received by the device
> +
> +### 3.1.2 Per transmit queue counters
> +1. le64 tx_gso_pkts: Packets send as transmit GSO sequence
> +2. le64 tx_pkts: Total packets send by the device

The patch from Xuan includes more than this - perhaps include them here
so that we can debate the specifics?
-- 
Walking upside down in the sky, between the satellites passing by, I'm looking.

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

