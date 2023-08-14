Return-Path: <virtio-comment-return-7085-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8ED2C001B0
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 11:56:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2E8392CAD6
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 11:56:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1CCC59863A4
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 11:56:24 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1315A983F78; Mon, 14 Aug 2023 11:56:24 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0123A98633D;
	Mon, 14 Aug 2023 11:56:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kKOlKEBzER6n5BYdXdBiA9OFGjr0OOIdVBszb/vFS1Xh3Ip2U74p0XwE7aIGlHgbLTJY6qchC9xhDsmqMEQrCT1IfqGEfOZLepn2sK43N+efk6fWM4lIBV5BLvbBGl9IhCR5Q1VKk5nW5XIgyAyuIiPVkRAWcIIwaQExqOyw49f1lb2N9DbHMO7Ha6owPjUCd4YS6EMtzaFJNGIE/XkWalpK7NfUKiRONniwbZtvCIRqKjuEscap9mIk7yqQ0hJUa5HrTQ5Hkntier3OUCzG5xqPF+E08g4ZkZwHauMdw+tRwRWGM7zpH4XcbKudhqxx1VKS5uANc/5j1oEXvyiKxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IxHSLGOuxA2N1b7OVsRMav8RZ01dtsaO32i5MwWjMOM=;
 b=LrG93LJ3aDo2Nd2XTCS0HA2FNd/g9gDjo9o0aZpjYLoRtoEQVmNVWHyo3enG1KlUNaIkQzK85nCyzrwKPk4KSu00s9AoUEpnIX/5367oS4TtQHI5SjF2W0C8jk8Q/AkwRU9NlfYVYwNvfv9TdFmsFoHbmN3hiC9CY0AuwsRcet8JYKh6cgLbqLZxCpSJO/fGjmxSNMyL1qC1f4o8YVnWmo9+bWM0QEkJvwVsaAb3Zf08LgvacDfsaT5v6DBCi0+K6f58O1xIl3poOV0Kjm0v6IIsfBWbbOy2CJR/XX1fdN0rSjAbKa44bOctzO+OL62GyE+q+0qlDn2oZNCeF1w+Sg==
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
Date: Mon, 14 Aug 2023 12:55:52 +0100
In-reply-to: <20230724033421.249893-3-parav@nvidia.com>
Message-ID: <m21qg596sx.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0420.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::11) To DS7PR10MB4926.namprd10.prod.outlook.com
 (2603:10b6:5:3ac::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB4926:EE_|CH3PR10MB7742:EE_
X-MS-Office365-Filtering-Correlation-Id: 6db31e19-5a0d-4009-c7f6-08db9cbd6f66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/h2l5fV+ke6lgMqRiT+43qDJX02GMZOjHoEU9RrRXHKp9H3Dm0jdqLbxwWkZmb36ceDOCqVw2TjEUWlIb52qk33UkrdESTd4YQaE0ilWuCYT79rLOWelUyyQ6wbhIrKxH54XuF6vsD/R2WoTqPvw2r4lTBO/+FCy8OAPVE8twZApH7uIfmIb7ZLZ+QfuD0yPgRBuPcDFNHnf6ExaO2eWj+Dw2khAPaTggOLmY05Zm8sgZSIrAIcBIKjjrK131NTOHSdjvo85ZbfeXdFG9vI/xOYTZHEhs/tGHZmlSl7SW/mpu2evYJ6V/xpTDApgExajHBUSeI0jEYNPqYX8RDRF6QAyQmygegq9VRKbZWWh/ulklPSidtRfUJU8M93nmbQQrR1+EYIE53MUTsYo7GxInn45hV1syIVjOHw3eAXIpg1M3xuUeQZ5NSX2+xtNV4AQAYSf269S7YSLDlG4ZZrOODeTjdCXgnOb0jP0l6j0rJ8V46IpwJvvL/UYVKD0r3yXcZpjx+FiSnvmB5oFzs+wSgorDXLg4N0gjDMCKBc4RGq9OECBH2Jx1EuwLYj6S7wh
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB4926.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(396003)(136003)(39860400002)(376002)(1800799006)(186006)(451199021)(38100700002)(36756003)(86362001)(6512007)(6506007)(6486002)(6666004)(478600001)(44832011)(2906002)(2616005)(26005)(83380400001)(316002)(41300700001)(66946007)(66556008)(66476007)(6916009)(5660300002)(8676002)(8936002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TymTOBUMaPTgwnChxKtomyIdX4LyHxm51KqDz3W+9cyVA4d2TRzmG8QucvKr?=
 =?us-ascii?Q?9thm0aYlL5MwF64SVgU0SLVUMfC6lqBhRMeXAkMRJhs8d+XhQfKs+1Zb3g5e?=
 =?us-ascii?Q?/oF6b/Xw1rQ+2zQqSYEtgWboFuI79knnwP+zge1Df3Uqwkepw69v8l9m9aWD?=
 =?us-ascii?Q?Ma+mGev0cudBbrXvmVuqQ8GciqPPyYWJ30EinOzagzggu2hoQTpnzkzx4IW8?=
 =?us-ascii?Q?3d6J0s0a7Nl7f19U7alsAHryGrg4pHQkI/zU80Op/qDHh/3cHIAups0MImsU?=
 =?us-ascii?Q?lGb/oCEkDWlrDsjEgiLsCMbAI3V7x83GCow60uYgLLXPhZGLGvWOB6j9PKFQ?=
 =?us-ascii?Q?wl6DtSeX/9A8xnvGjNJHBBDl4c2aXLR40ICaktcIbkwIvJ1LciWjjCJh4rrw?=
 =?us-ascii?Q?A0hAq7+lCnmsbAGgKCwe5D0qVBJpBSVzu1foTURD1YYXuFCk3IfVi3nJ4/ZU?=
 =?us-ascii?Q?afGFV/1btGq7dpVDR7lXhNCF+BKdhUG83MuFfK4cV2lTjbzd6pT5yayEUPJu?=
 =?us-ascii?Q?SF2eIkzvkWKAGacRVhoweWDAThhCk//kb+Hw23QlUh+hp/A4t6F22A75Zg3v?=
 =?us-ascii?Q?RtBCUPzTz/ZOsbevh0cXWqP8QjUo1o238Xrq+A82YxnR+3suD9p++7b8/8ew?=
 =?us-ascii?Q?4oWQxTsGa/CvFWfCX/WYYDr2jesmnTheh/L3FhZ+iQ3oIvIXwVc4KAq++ZBm?=
 =?us-ascii?Q?ceGGxBOf4Purb1O7Vzz0FIIkEEX9eHVgY28uyiQzUG/uXyz90YJyouZ+aF6S?=
 =?us-ascii?Q?jLx3gRzG1i5a6CwS/UcdDVe+NJOxD734rx4NTP+Fex59PYPi3JHSyNcTf4Df?=
 =?us-ascii?Q?XAFXNu4ua2oIc8Aq7fcVdWufwrn0/gMvPqt3GEeifPKjYpiYZkzPuxZPRooP?=
 =?us-ascii?Q?jPg9yM3HFHsk5BUFX+AjzOAAIfhT9o4CR3/dtgRRxVy/dZOShISr5w/ZFjNf?=
 =?us-ascii?Q?IqQkrm+1p1tIfnUwKNc+WwK6EmExBLNkeSYmnH4GJYe5oPXZoTEjFBDbZ2z4?=
 =?us-ascii?Q?JCeOz1TSPrSSzY6FYJblMVUkzNWctN9LmXfrtv9hWxtW+vELxmnktqzswyU/?=
 =?us-ascii?Q?I899/1hbr+4SNabx41gwGZF7j1FZd561ZYFqYpp3f2gTNmHubVkOPxVZ7KKR?=
 =?us-ascii?Q?y5Nqb2XakmnzcDqFUdlXtqoDjhv+SUlzr7zdoHlrF0rQfFhII1btd1Xgifyv?=
 =?us-ascii?Q?qNMGywooQfvKVu9n+692hDoVuBeLfD85KvvGWsIxbPsCtsB2UnROnYu8cYts?=
 =?us-ascii?Q?ogAW5zGUdXegjiM8QEeeINwOoeXASSpXLAc6k5rXnQEQUSq5+u5q93tZ55+9?=
 =?us-ascii?Q?z5q75pwFdVhhHDengkomy4cTrnfTp26qMR1v/JVXfnQUhZUZSg3+MgKOBoJl?=
 =?us-ascii?Q?SeAHlnrImPHF1A0tPnMJgpSAsPN/Ys9Ne9seZkSAYt5+AkGPKq/DXCCnjKAy?=
 =?us-ascii?Q?G7uoj9kuWS4feXRzJA1bTPU8WIgavE9qGwhtnztp/ZQOkAu4EueW1L0WqGto?=
 =?us-ascii?Q?lgUugcLp7gZ5TUSjo3Rve1odFVwSl8y9dJlxyIrtoXzaODtd3qhXWtbTFwAF?=
 =?us-ascii?Q?NMa6jtgVxW5PP49vTdksOa6ZIe2IcV+sya8xYzaaLWV6B6yrBNerB4SH0eYk?=
 =?us-ascii?Q?BA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	2pvEjRjieWdL3HbJ18Ahjii8HEQ8Wco7XeAcYbHkTH/DvM/Lr69seUw/F/MUXOeQmysBXYBHz9qZczQVgtsfKhPGllMv5BdLAn7Mxv74PebAqHCWMl4rDU2f1OwancEwU3EAWT/L9i7zyvNOGXuC6LP8gxEmJWHqWehaO9UYSl+9MABWFLAtEwkfzgRxET95DZOwhQSSf0TDTBXBqIPPvYp1RrFTzeFORrnjZ7eSD7M+vEDdOhvgY1qmSkkqj16YWpuaglAIJ8VcVdpCVn69feP/FVg2Xy/La+6Bya7XH8uDBfHBae5om3bg23QzcQTID8RdHI1g7IkpX1/QGkfENgHHRYBZl9q/3TGw1kp2i0X4mHi+4yWcj2yP54dEu1Jl4Izxa/2o925etXfkuKs57vgtiN+joAldwIwB5eFsVwWV2afZCvNL6tErmffAYEFHpAexADH1B+CPZsPJYNkUnGm+MQzp3wjlEVGrBZBhFye7Tx13FXb8B2u8R8fgPgfXWk61MMOzVefqTFYVi+tUHnLYUNa+17WxGqDJ7Pckh2SItzMhRTIYNKSYlF6MAKukNOKQGBMyUSyY888ZbACYJaYrXvxh/aULoXLXR/ZUcQbyIWTVFkbeE0Wc1bk6eVNY0adbhmqQZxresmeW3LZ2qcXWQJ/KK3khvLlwhEQwyJYOMl8iasRoTmceIsFHaqlG9m4vMO3Jsuv/WpESHCJZWGcNFmV46I9PAcY5/zsBkbB29o5nnf95JcUqlL2YvmOLBM7xoMqnmvM6nDPnLK4j96Fr52irrCOkTPSFzD5PlQKAAxVtJGTh6wG93z3Waxn/Nxqoq7C6PSKDtjJc2fbpAsn4njUmhW8eJU3QAtS2T3E=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6db31e19-5a0d-4009-c7f6-08db9cbd6f66
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4926.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 11:56:03.7185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BwsSJ36DYhNWkVbwkH4o43uDurGq7MgsFwPGKP+wrykAd3/c1Mt0zPelKDwLovonuk2AM7uwJhR5aj5pWc/zl8fPT3T/8pzhf2TlcZOxH2I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7742
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-14_07,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308140109
X-Proofpoint-ORIG-GUID: 9--PSBoGbInhgVs6ftjGihK-1KvWL_EN
X-Proofpoint-GUID: 9--PSBoGbInhgVs6ftjGihK-1KvWL_EN
Subject: Re: [virtio-comment] [PATCH requirements 2/7] net-features: Add low
 latency transmit queue requirements

On Monday, 2023-07-24 at 06:34:16 +03, Parav Pandit wrote:
> Add requirements for the low latency transmit queue.
>
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
> chagelog:
> v1->v2:
> - added generic requirement to inline the request content
>   along with the descriptor for non virtio-net devices
> - added requirement to inline the request content along
>   with the descriptor for virtio flow filter queue as two
>   features are similar
> v0->v1:
> - added design goals for which requirements are added
> ---
>  net-workstream/features-1.4.md | 88 ++++++++++++++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
>
> diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
> index 4c3797b..eb95592 100644
> --- a/net-workstream/features-1.4.md
> +++ b/net-workstream/features-1.4.md
> @@ -7,6 +7,7 @@ together is desired while updating the virtio net interface.
>
>  # 2. Summary
>  1. Device counters visible to the driver
> +2. Low latency tx virtqueue for PCI transport
>
>  # 3. Requirements
>  ## 3.1 Device counters
> @@ -33,3 +34,90 @@ together is desired while updating the virtio net interface.
>  ### 3.1.2 Per transmit queue counters
>  1. le64 tx_gso_pkts: Packets send as transmit GSO sequence
>  2. le64 tx_pkts: Total packets send by the device
> +
> +## 3.2 Low PCI latency virtqueues
> +### 3.2.1 Low PCI latency tx virtqueue
> +0. Design goal
> +   a. Reduce PCI access latency in packet transmit flow
> +   b. Avoid O(N) descriptor parser to detect a packet stream to simplify device
> +      logic
> +   c. Reduce number of PCI transmit completion transactions and have unified
> +      completion flow with/without transmit timestamping
> +   d. Avoid partial cache line writes on transmit completions
> +
> +1. Packet transmit descriptor should contain data descriptors count without any
> +   indirection and without any O(N) search to find the end of a packet stream.
> +   For example, a packet transmit descriptor (called vnet_tx_hdr_desc
> +   subsequently) to contain a field num_next_desc for the packet stream
> +   indicating that a packet is located in N data descriptors.
> +
> +2. Packet transmit descriptor should contain segmentation offload-related fields
> +   without any indirection. For example, packet transmit descriptor to contain
> +   gso_type, gso_size/mss, header length, csum placement byte offset, and
> +   csum start.
> +
> +3. Packet transmit descriptor should be able to place a small size packet that
> +   does not have any L4 data after the vnet_tx_hdr_desc in the virtqueue memory.
> +   For example a TCP ack only packet can fit in a descriptor memory which
> +   otherwise consume more than 25% of metadata to describe the packet.
> +
> +4. Packet transmit descriptor should be able to place a full GSO header (L2 to
> +   L4) after header descriptor and before data descriptors. For example, the
> +   GSO header is placed after struct vnet_tx_hdr_desc in the virtqueue memory.
> +   When such a GSO header is positioned adjacent to the packet transmit
> +   descriptor, and when the GSO header is not aligned to 16B, the following
> +   data descriptor to start on the 8B aligned boundary.
> +
> +5. An example of the above requirements at high level is:
> +
> +```
> +struct vitio_packed_q_desc {

"virtio_packed_q_desc"

> +   /* current desc for reference */
> +   u64 address;
> +   u32 len;
> +   u16 id;
> +   u16 flags;
> +};
> +
> +/* Constant size header descriptor for tx packets */
> +struct vnet_tx_hdr_desc {
> +   u16 flags; /* indicate how to parse next fields */
> +   u16 id; /* desc id to come back in completion */
> +   u8 num_next_desc; /* indicates the number of the next 16B data desc for this
> +		      * buffer.
> +		      */
> +   u8 gso_type;
> +   le16 gso_hdr_len;
> +   le16 gso_size;
> +   le16 csum_start;
> +   le16 csum_offset;
> +   u8 inline_pkt_len; /* indicates the length of the inline packet after this
> +		       * desc
> +		       */
> +   u8 reserved;
> +   u8 padding[];
> +};
> +
> +/* Example of a short packet or GSO header placed in the desc section of the vq
> + */
> +struct vnet_tx_small_pkt_desc {
> +   u8 raw_pkt[128];
> +};
> +
> +/* Example of header followed by data descriptor */
> +struct vnet_tx_hdr_desc hdr_desc;
> +struct vnet_data_desc desc[2];
> +
> +```
> +
> +6. Ability to zero pad the transmit completion when the transmit completion is
> +   shorter than the CPU cache line size.
> +
> +7. Ability to place all transmit completion together with it per packet stream
> +   transmit timestamp using single PCIe transcation.

The meaning of this is unclear to me. Is it:

The ability to place all transmit completions with a per-packet stream
transmit timestamp using a single PCIe transaction.

?

> +
> +8. A generic feature of the virtqueue, to contain such header data inline for virtio
> +   devices other than virtio-net.

Given that this feature is used by this patch (for TX), the following
patch (for RX) and flow filter manipulation, perhaps pull it out as a
distinct requirement.

> +
> +9. A flow filter virtqueue also similarly need the ability to inline the short flow
> +   command header.
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

