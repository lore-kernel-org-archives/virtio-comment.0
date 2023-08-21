Return-Path: <virtio-comment-return-7213-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C94AEE4996
	for <virtio-comment@archiver.kernel.org>; Mon, 21 Aug 2023 10:48:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 05ECE42C24
	for <virtio-comment@archiver.kernel.org>; Mon, 21 Aug 2023 10:48:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EBE2298624D
	for <virtio-comment@archiver.kernel.org>; Mon, 21 Aug 2023 10:48:27 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DDCA2983FE9; Mon, 21 Aug 2023 10:48:27 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CDD1D98622C;
	Mon, 21 Aug 2023 10:48:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WyCnmtH/EqfoRAh+yTkJUy5jQrbQK2TJxJTpP+Neo+70t+DCPcm4GoUYR/TwIqsK3h2Mlbt+TjtoPk6e6LTABtgIgv3CU7M08X8nI6fcug9C3hsdXWY8d5r2IOkXm6kWMwpW5DptRaj6u6VtrXr+VsCgVqVb/JHG7HsSzQ818VSvI1spbecv1erO5XXRmkN9l4nh31Uc0kYqw8Omr+fFbSaQk8/tdHOViI85mYFOMj+Yac5Zv+lmYBeJyuKRK+t9zV42avOGhSAOZM5Yxk4Rc0Yq5pjUvee4wDkRUq1inLgtETiJMnNlGMKcy5zgOZOsN7cQibOJeSzGlhr3PUIEVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aAzuWYzdt1UxGMpT7d2KA9ezExDd8XUcWaVewClHvqA=;
 b=juFc4I7/ERk7bHw3ja3ggcmGv8sEE1r3/kVp3hNimo2MV9aqTpeWA39Qy7B1bdpXKKiMkFDJRyCzzRZf0ATiFX3oj3QudubeuXAk955vRi+U35Z9CyLe3dIpZBnKlO0lLhIKhWF9eCIopBkdghbRNMwc/ph3d9+JVKqcVlE8EfIcPJiJ8TpX66T76mEObBUl/BJruyEj375lucop4cj5SgoDQqgMp0/dUVd2rWNR/CHyAzh6wFgKWKp4Egci1ZwGPhVZSMP261YYBPwQO9kM5azPzd9lE31O1gN+0U69kifoOCtokFn//hmif7ZctL3qvRkt8gSyD8OiLQ/cs6V0rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
References: <20230818043557.496964-1-parav@nvidia.com>
 <20230818043557.496964-4-parav@nvidia.com>
User-agent: mu4e 1.10.3; emacs 30.0.50
From: David Edmondson <david.edmondson@oracle.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, hengqi@linux.alibaba.com,
        xuanzhuo@linux.alibaba.com, sburla@marvell.com, shahafs@nvidia.com,
        virtio@lists.oasis-open.org
Date: Mon, 21 Aug 2023 11:47:04 +0100
In-reply-to: <20230818043557.496964-4-parav@nvidia.com>
Message-ID: <m2zg2k4qog.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: AM0PR02CA0157.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::24) To DS7PR10MB4926.namprd10.prod.outlook.com
 (2603:10b6:5:3ac::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB4926:EE_|DS7PR10MB5167:EE_
X-MS-Office365-Filtering-Correlation-Id: d9a0112d-8398-4ba1-3939-08dba2342259
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YFHI8/vugSIWGjK6mb6W2i4e3wRfHKu/EJQ9br4XHJlcPgbYqeXsNGykMKevQPQjdHW8Wcr0bGLg9vlZpASAnElZuOn/BngRq3redtVsjqSS7wCvIDJ8CoSy3sjQAnGe8to8BXJR+p1LOGsMlX3wI2gFG2WCt0e/3952Zr3nB+LlfD0OKsrk6VuCUeoZ1NZgHW/9HxQuItoIvgcmjzqTYlumocHmShGp/Womn1CimOgJ+Er5Z3eYzYyVxkBZHlwmXQ+SpHSgzK6sVtd05zYgyzh0NroQIwquL85TZYQVoeMTGZ/feAVaJtb5e/cUNsXS3q7FTOELZyKGiwQSRHqOv23lrtVaC8w+c7YfuB/ICPzjOoVZxcXp9SXyWSVqB+iE13UGTmsrvDMHuFsGvQ3C0jxqH6Mon+jUr/Du7tUb1kmciXF2Rh22p+hOaYnDu5W/9lpUz0scBtRjVuYdaqFgnZ/uIk5zrJfiEA92gQmeWoPekViBC+kawIjCmQ2eeuF5Lxg+YrMySxgRyo3VEX4xwvkpR8E56sHzfwZT8nNZtW/sEUH7tQyi48GK5KIzx7o+
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB4926.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(346002)(136003)(39860400002)(396003)(451199024)(186009)(1800799009)(2906002)(83380400001)(38100700002)(6506007)(6486002)(5660300002)(44832011)(26005)(86362001)(8676002)(2616005)(8936002)(4326008)(316002)(66946007)(6512007)(6916009)(66556008)(66476007)(478600001)(6666004)(41300700001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1vAJJTz6MroV1TiR2/5XGnkRPe1VFBpCYLm5yJlM14+wudgdqtQfygqQlFs/?=
 =?us-ascii?Q?FHyzXy/3pWJvTdqvek8VhTVL1VxdL7BEv5R1PWflnYfCJA8dNTv9RntwJZVC?=
 =?us-ascii?Q?R86yMpu78dProUYsRD//0cFCdx1f0BeYcpZxJt1BlOOtA863V++r4jJJ2FAP?=
 =?us-ascii?Q?bBiWAYtPL1LPZwSd0f2SFyPEvio8GrQhwwBXsB2/z1a2FawOlK/EOECuSKbN?=
 =?us-ascii?Q?maDd/XoFP58OO6gHXHxk7bdjbJPTwa3Kd39WTEV2lFQfeob9BoKLZXNeSwZv?=
 =?us-ascii?Q?AgxDBGG9+tn2R2LzW3ITn1Dp+I1eYRCDs6Bp/HbE1pSkC+VLKl99M6/hpsJe?=
 =?us-ascii?Q?/xbreIqCMI2Wvo3+x7MT12C47pC7bWMK+Yn4RYXTRyhajQIr6+4VbjsvGjLJ?=
 =?us-ascii?Q?mWbpmyk5qcZaRlTgHtl8c0l0dGtu+JC30t1uL06IZ7b37QtgWbnvikwVhuHF?=
 =?us-ascii?Q?+cGrtQwQR/Rh8n5z4jmWSNmLXc9gi6w3oVM+bSQeUy3tPY9Wu0/DHjFYJ77C?=
 =?us-ascii?Q?cmlJo/OnhfnF6wS0itXM2LrYMazEk+0t+fTqezqcKMPdlSZJOTtuXIu59T9k?=
 =?us-ascii?Q?kUUXxGqdd7xtGSk0hQSvZdFI4rTTBi49T0i+AjZRrS+xZdmRJ1mKUpOkDERm?=
 =?us-ascii?Q?WgCvvqwQ/kLe4mPq/Eb7zKsu/XwTsY5ZnPomEWckuEi2QFLwSi9Z+xXOfkVv?=
 =?us-ascii?Q?RldG/G1Cl6dgoKNdqiBspxsghqkndccllq9HOXxAZ+CMbokAU8M/VV2HBgUN?=
 =?us-ascii?Q?aLEe7b2ldQhmDTOkj0QsTixJER3HoSF7nTgSHNF2rZ6MOqtbXFHMBf3RFCx1?=
 =?us-ascii?Q?VOT6KqzA5Y3+nTQ3MELFqAAiVO/hZ6JdOg3oF453BKjzP7TJwqLsZLKc2LVN?=
 =?us-ascii?Q?pN81If8IQ7G+6qU8daK5K8BzL5NUyt8BAEasbHdnfqd9NJ0nC30vbexjauhj?=
 =?us-ascii?Q?BIxWRi1tkUkw4HyR3T5IlTKDZHEGVTjZMZjPJkjdCk+v8/Pe7tUBZGyWmLrM?=
 =?us-ascii?Q?oWUFfngwYqX1EhuMcxq6TmjkFfD/DWm3tcWZqbieDq2/0Z8EwIGxEjnp0z9z?=
 =?us-ascii?Q?7UKBcMgixRgYjguhN6mbdc0Z2MaJt8LeCycCxlLkQEqnfsTzHlOuO1ZSZ2Wo?=
 =?us-ascii?Q?w5chm43DvtlWyUeU86eLhdDqOyNUZFRRV/A+yzfd0P4Ats7HXRrrfzk97vhy?=
 =?us-ascii?Q?3vjI0cBP+88yYgNPPvW2Sq14XU4O7OtvlW8PuZrzg/BNAefm7W7OQ7KD/79H?=
 =?us-ascii?Q?gkHccM4k4QmWPGBD5d03vOHclYFlmGbsRXcwYoeaxbyWh6uJldhxpnuqvfX+?=
 =?us-ascii?Q?Vj0CGcBxpTiBW6uuNC0lV7VePw+gjMrWrbKaQZSroMy41n4GW809ecPRVvZM?=
 =?us-ascii?Q?/guxvQaFe1b8vehLC5nmIfsrCPNzv5SUM2nuTUR1f72/8NzHOrnKVBER9JJw?=
 =?us-ascii?Q?N6OIAYTHB0t2OPOdRVeWo6H+UVAnvvVZqNJgKV8VkYftTALCzUI+o76Fl9Tv?=
 =?us-ascii?Q?qcCpBwWuhArkU+sra3v4oQQADNb5j94wqYSFcFpmipRlFASYfy8rKfHGIhCI?=
 =?us-ascii?Q?MfRGwAg45x1ZGM60mXXmMCQg8bw3SEUh9VDwvvdPEMkIxq59fdWWnVwRQrEp?=
 =?us-ascii?Q?iA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	8svT5iCsszXDmCyXr0ENpWenGmKw1sZxZx2jC8U2lHHCdBpDMfMk/suwiOwWU3urY7vJVp9sc8Mry91v5ELYtdSsfVyUFSgsArFGpLkaaRllmy7A1Fe7vqo0gm2Dkht9AyLrEVb7IWoVtfYVc3ZHmraT2qETJTEuicZIuakMw6esuJ20H6JL3P6idG2tyBWDTXVdOUWclJVIJ0z2t2ddQioWwZfnGE+/0CRzZTNfnJxf9Tat0388tStaZ22ssDEZVrXKJVuZTcOMUUo13IpzzQQwf8eTEFalGc9bvDab6t1PgfyGZw+iDyuxqELRnfRSOyNt8Qt2ayb5FcqquEk/wLfsd3/Z1eWwfxLg8E5+nFddeKErw75ZlJm7966kHC+uvdEBELwx0QVQ1u5ins50SdPx5vde7jpMK5ABSWpeLmDLg/xIVR+A3MydsvwLKj7pJSMRkdaFqa7ugBsyZC3g/Kx/b7dEMriSlnU6cKvN6d4WY4rfamufPRBGnoKY+YLqU7etoHCq4KZSJe7DdM7W7BIGVe1c8dHu/usviYG37jAByFBCVSpfzVJ6jMt4NGulUOrYP9/w9cnIDxDjHSDuTXkUoOs+n8xSNOeOcy9IumuyCDgdEzv1j5zicE1zdNusNJnmAuq5rYux/Tekx0r0iXKqd3VtN/dUcIFdgZ2CjhcbBQlMSVBKRB0YLXNCGoRLWkPnrb18MAj9g3A470SvcL23FAJUgeVDbREc+jQahu6CBs+3dwoe1vAaGx96jvRLwM5XMUjA9QYchtoTCEEJ9PM3Bk3j7eONyAfB66F3veA7mKVn7T8dpwHGSABlecamez/YToomTwGxwVvsWhuPgpw82Ux2RLCfXcTrKg5eyJmS0DSSrk3kyO5NP/e+bp/i
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9a0112d-8398-4ba1-3939-08dba2342259
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4926.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 10:48:20.2234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PexaDJECs3EMbjqwddhjGiACFHzyfC4nSUp7NByu2XbzWnexDtCkYP/AcnWMtyJDkS/MnV5pM1LS8iQeuGBquIgsJBEAQ14aG8qfJISvRyw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5167
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-21_01,2023-08-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308210099
X-Proofpoint-GUID: 8Je1GhdODd2sEuzZtNIFoEyZT9BvQ-4P
X-Proofpoint-ORIG-GUID: 8Je1GhdODd2sEuzZtNIFoEyZT9BvQ-4P
Subject: [virtio-comment] Re: [PATCH requirements v5 3/7] net-features: Add low latency
 receive queue requirements


On Friday, 2023-08-18 at 07:35:53 +03, Parav Pandit wrote:
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
> index 1167ce2..bc9e971 100644
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
> @@ -127,3 +127,46 @@ struct vnet_data_desc desc[2];
>  
>  9. A flow filter virtqueue also similarly need the ability to inline the short flow
>     command header.
> +
> +### 3.2.2 Low latency rx virtqueue
> +0. Design goal:
> +   a. Keep packet metadata and buffer data together which is consumed by driver
> +      layer and make it available in a single cache line of cpu

Phrased like this, it seems to run counter to the "header data split"
requirement.

Is there an implicit guard that this only applies for very small payloads?

> +   b. Instead of having per packet descriptors which is complex to scale for
> +      the device, supply the page directly to the device to consume it based
> +      on packet size
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
> +8. The device should be able to consume multiple pages for a receive GSO stream.
-- 
Modern people tend to dance.

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

