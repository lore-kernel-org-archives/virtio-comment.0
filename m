Return-Path: <virtio-comment-return-7134-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CB6C001DE
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 08:48:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 55A1A2AC49
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 08:48:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 37C0998638E
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 08:48:21 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 261B2984035; Tue, 15 Aug 2023 08:48:21 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1484D98633F;
	Tue, 15 Aug 2023 08:48:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fTjWDMdxrtRnZ/P0kXFe78/PNoy701Pq1H7/0ImlOnk72vp7m1ERZcypHObM/Y0/GdMF7Nryncfh8gLzQLLBcFdrwbqLuDOY1Rxc+XnMYfrw9y+3+ally2NewGO61bKgOZYDQFPgrj4ZV2Wml0o963OBOJZSL1/uk1ad2mc5odFLbet6hSBoImVA/05zQelOGbcW/aaG1EH23MoP77ofnIiApETTbXuZjq0AGLaycJcm2lcH2gxMHCoHjkslCFyQonHXYIYw3qYZSN5CYxKNqWP3rSOwWa9YxoyQqWlMVp0Bo91q/Nhs9n4YsCG9eT6yyqrKTecI/t2KfPVJosFO5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13ry7Z+YUfTkMtQCqUzSc2HHY/4rJrHgS9oJKBmPYq0=;
 b=I5Avkdl0pAYZ9K5q3UpxFFJuhGkJ+ocNQdLy3+p7Zf8AMryjXnOkBW/lQWdF8amW9krtJicFywIxfCs+4TbAuHsRLj3BvkkJna0boM/byxJ/dI97Z6uy1zMvHniSzi9PVvprNjqTj4BOy4uer5QLawMMzzRT//XlGYNv9uK2NCZAFcMr6KE+d60enexmj6FEoLsrR3d/BU/FCw/sjUT9pUyvIoKEQKFBG5v3WybBBFJ4vIleju/3oHUmZVNP08Uk7DjZ1hjm+uFICMuCppHooh+07f3ql40LoDTu9ALmXy4u6jmFjGllSvT78Om19T3luAdpnxr9uCiW5ndeWClcfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
References: <20230815074600.473933-1-parav@nvidia.com>
 <20230815074600.473933-3-parav@nvidia.com>
User-agent: mu4e 1.10.3; emacs 30.0.50
From: David Edmondson <david.edmondson@oracle.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, hengqi@linux.alibaba.com,
        xuanzhuo@linux.alibaba.com, sburla@marvell.com, shahafs@nvidia.com,
        virtio@lists.oasis-open.org
Date: Tue, 15 Aug 2023 09:45:12 +0100
In-reply-to: <20230815074600.473933-3-parav@nvidia.com>
Message-ID: <m2350k7ku1.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0352.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::15) To DS7PR10MB4926.namprd10.prod.outlook.com
 (2603:10b6:5:3ac::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB4926:EE_|SA1PR10MB6496:EE_
X-MS-Office365-Filtering-Correlation-Id: ce23104a-6b61-437b-489b-08db9d6c5a88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SgzGXl5Yl9IoAUJreTeUaS4iA09p+cCh3t0vgdy8GRyN+v21N1y5eQuWO+oTcKVZBTmaioF84zlbjLNBZyELNjb9F5fATLmJ9nKnTPpScsMkldmJxO72+AhM0xSlT32hzUIQgb0FSmDbDcCcqkqNdQbDws57I7vtCcdlfxEO5qSh62TURG+k5fOqb/JjoLMe/SQUhKm2iBp2mbpRh6fxPR1sZeBifmGMn4vbvI0wlaNPTItvTWQJ1qJa3IHHH44+wDorGAX+6TLNFwqvZrR5XsfVY1JfR6MFzaD2QrZhLLDqFQXUz2J8d9P8t/kPSNCHlmRYSBd/UVsYxDxXCHnsh5Fe+IFcUmO9h44Fd9bbx1dtvTA/S9Waees8ymmqW8huFw9PFHWSxCvRF4xRt0dPkEo/L2AktopxcHcR6Ri7Vt/pfQTT15RH4Mc0eaFRinNcEg97snE0IlkcBJ0dg7TVtVEQ05y8xNhtk+X/j6hnOFGwqPiWt+ZnXAKz5Beru8gPMSS5AwY4fFvm8IzD4iTQxujlrbaeMmIm4YNEVDxREfo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB4926.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39860400002)(366004)(346002)(396003)(376002)(451199021)(186006)(1800799006)(26005)(6512007)(2616005)(83380400001)(6506007)(41300700001)(66476007)(66556008)(66946007)(6916009)(2906002)(316002)(5660300002)(44832011)(8936002)(8676002)(4326008)(478600001)(6486002)(966005)(86362001)(36756003)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?I0vY/q/IceVM5Xuzwm5yTarFOyFTy9HjcolhxmSjuDN7PODbXBLo+crfXc/C?=
 =?us-ascii?Q?+r/yv93+3LEOPZ1N7BMYNt8RalYaR3MW41xBtaUU5Z7GHfxKrkhDeoQPhZvf?=
 =?us-ascii?Q?04hQ5FFBSh3WCEBBG4zjjHQ+7t5ph8hGJu7XpyOqbXw09qtfysTQmKyDXRjL?=
 =?us-ascii?Q?amw53Mhe59oXnuD7aBeWWV53xQeTrupDnYwIlhCF2L5cGSjhmDkOWutsTwAz?=
 =?us-ascii?Q?i9ly7geYczhAAg4/lfkAUdFRQbJo2UoxgMHf/pZ/uN2tCNlgowWyAejofQc3?=
 =?us-ascii?Q?4HL2q43c4qYmnFUeXNLzDUL6o26gUx58cW50GZXm2kf5i5Ga90GELr2cq8wY?=
 =?us-ascii?Q?gnuWExxHL3EKdjXP/FyN/ehIxYOjCdikNuKaGiqruCJscyTYG6VoMoCNoCHO?=
 =?us-ascii?Q?Uotbamm3rLigs8sMu1rJcY1IWO5y69Fdce58bG6fYPwtuxPZTffnJNRqq6UX?=
 =?us-ascii?Q?1mZOuh3lB+q59U42MCdKhissOMn9l3cofDFVLujdR7l8CilMiA2xSMd2HF3Z?=
 =?us-ascii?Q?O/hJ8Ng19Ct5vqfmfDBPREg7BWda6rRJit040//DqBE5sNxaqtCf44zCBIGR?=
 =?us-ascii?Q?lCDdRHxPoIdpGxp/52XTvoFQxPz82okHjYorYB3IpQ7P29TqqJq5uo+3j6U2?=
 =?us-ascii?Q?kc1pMSUt8sFn366opnDL47hRVJy8VRuzEeAztL+HPFkhWMnDXIg6Ow3tcOd4?=
 =?us-ascii?Q?0lI5VKElEGmzjhy1t2tCnF1bHu6NGhjABSU1t/xhq1L1Sig9NpqhK0FlwRAG?=
 =?us-ascii?Q?tcLtgP2bZYkVEhMxeTTJDHB478CcuuLOlRJ2gis/H1F2VokroZDkJOMrRVgw?=
 =?us-ascii?Q?TOoCmUm1ln5qvMpwEfiyiK7lxbu/85/E4Y5+VPX8Cs2lKGHS6iPLU8toFPem?=
 =?us-ascii?Q?KjIaEiemRvFcUFvIGnUr7/wtFInFcIQgKzvWMRPUyUWcwgN11UcLs/jHfcX5?=
 =?us-ascii?Q?RF52jRiPwMhxlsXbo5mX9pmJYtS/rFQ/a1yL6Yuu3H91L6P8oQPuKHg7NeR2?=
 =?us-ascii?Q?x0QM59+6EUDCaRQht6AO7cR3tYSCIOVatjB+RqZyEkmhq3JlJyDtBDQ3qJLJ?=
 =?us-ascii?Q?K8AXEFnQJkR602yiijUGVirIwc+sRJ5Gl9lCWymn2JT12WFlWjDHt5fKEkju?=
 =?us-ascii?Q?zce1+vUF4eYDxFEAWJHpv0v3KAslr9cMuQgfyL2mK+/qwYd7v5ebhuPvCggT?=
 =?us-ascii?Q?RP1eew0ACaYN/aHvWDx03CjezN5Nwosl6wHZsddT0O3eZopZEJMVjgTz8Vb2?=
 =?us-ascii?Q?VgBFp3ct9VtUMlOVoSGqMo9wFbeYLvKnJnOZ4C/yZQov5jV+h/iP7sEaY5JA?=
 =?us-ascii?Q?NYLs820T1FSlHXRaPmlneKcpBeX2SvylDBzRl8qkQUHMRhOIvxztY2pVSSGW?=
 =?us-ascii?Q?6NoVsSngCRdeai8lQhkzmTDWC0ABm61CeFTacxGJxD8D8Tutt+PKPaeG4SGt?=
 =?us-ascii?Q?6g4y3bj5v/g/Hw6a86j25IUfGMVqdjiUkMVSJssrCyM/8cOJ08Y7EtrYtiDU?=
 =?us-ascii?Q?ykl+GoKZKEHxXDPxnjXMVEaE1cgdHoxHvR60vduTLlkSurANyxbS31P7MB0S?=
 =?us-ascii?Q?NRm+1Bv0pGZieXe3Mlm6koHNxF/hl47hqwzOB0ZAqjOzbsff0icFo/2EWY+U?=
 =?us-ascii?Q?Sg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	xkti5Ca6vJsDY9uyFZif/0WTC8zZ82VvLzeLFzZo2hsDc3G5tA8Roe9shJh9uTBOxAg/+P06mPsKRROoeH0oFTVhoeqNyPGvYs697O6JeHeiw0xfPMLujWvd73eDGG5jyHMcnNeEsnoswBHkQpqR2TR3TnpXZmbssPnTfCBOqVjSqOTkcE8d3E9CSbdUWNNyk93sf8O9RbcCEMYYQDq/9UDO5eZxnxpaZ01dXYFWSBF4pPDDMxNz9fcK5qzOmV+2hA57UqG7fyconSzOui+oFw8D2AshjMNruV9nlOA1t7Pzr6qcjSG+wB/N2E8qLf/imdtXAUwASXl9UDHr1UDl9VxeIKqw4ny6YmXpALWMOrnkGxD150PdC3gGgcfABY8657ip0/0cpHfrtI2nRaxJ0o32PFS/SISkC3FQVdEQZ3Uvls6X4fzZf1FZ6oHMV/vAZHFiI20VPzk+8KzSvGMHjh5DRpfuyy+Oh7+nxzuwRLmU8hJPZdhTJU+OSDcEQmMEGt1q5HnL/6OWgX0zgAmVUl0dhOg80Z4wrDTzlWS+miL6Sb11lRiT2mSGm+9zIHp4FqJ8QqfVyMUnept3nisX+TOxGMYGU1ltemUT4sE1N1/JDt+0DnWhWYHhXzi+pcQGas1VKBR9IQyrsejIwOhvk+kd64zFunLhN4loV3Gh8vZbWZ1BeEU39XW3ERXWfobiLGbGOO/JUF8goACw4/a2GETH1E/g//8ij64+Kve1GV6D+MrCtpvwRwE4/oyywJATRo8VCOKVcV6klKBfjygqCW68EGToUCdtHVVGEi9P96ekm8AJHKXGYqEIfWLw2B9BGKb4OyGzarE/UDgK7TOVJJvV+h8UlfyccoeImNI/rQjr5u99HMNsbVbBKigzoQZE
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce23104a-6b61-437b-489b-08db9d6c5a88
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4926.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 08:48:10.5033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8421HupWBAhl70nkewku3cQcaLlWN/JKY5EOwGYMHB19hFo7G5L6pZ/JMBu9J3VITmS0SWNnCcWiFNpigM2YFql5+JXysIPAJBv54baxtpQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6496
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-15_08,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=999 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308150078
X-Proofpoint-ORIG-GUID: 8ScXsn5YQN1Jh6V__u6mZSYpwJFm7Qei
X-Proofpoint-GUID: 8ScXsn5YQN1Jh6V__u6mZSYpwJFm7Qei
Subject: [virtio-comment] Re: [PATCH requirements v4 2/7] net-features: Add low latency
 transmit queue requirements


On Tuesday, 2023-08-15 at 10:45:55 +03, Parav Pandit wrote:
> Add requirements for the low latency transmit queue.
>
> Signed-off-by: Parav Pandit <parav@nvidia.com>

Acked-by: David Edmondson <david.edmondson@oracle.com>

> ---
> chagelog:
> v3->v4:
> - Addressed comments from David
> - rewrote timestamp and completions pcie transcation requirement
> v1->v2:
> - added generic requirement to inline the request content
>   along with the descriptor for non virtio-net devices
> - added requirement to inline the header content along
>   with the descriptor for virtio flow filter queue as two
>   features are similar
> v0->v1:
> - added design goals for which requirements are added
> ---
>  net-workstream/features-1.4.md | 88 ++++++++++++++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
>
> diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
> index c2b1cc8..40fa07f 100644
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
> @@ -41,3 +42,90 @@ together is desired while updating the virtio net interface.
>  More counters discussed in [1].
>  
>  [1] https://lists.oasis-open.org/archives/virtio-comment/202308/msg00176.html
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

The presence of "L4 data" seems like a distraction - just give an
indication of size ranges being considered.

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
> +struct virtio_packed_q_desc {
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
> +7. Ability to write per packet timestamp and also write multiple
> +   transmit completions using single PCIe transcation.
> +
> +8. A generic feature of the virtqueue, to contain such header data inline for virtio
> +   devices other than virtio-net.
> +
> +9. A flow filter virtqueue also similarly need the ability to inline the short flow
> +   command header.
-- 
And you're standing here beside me, I love the passing of time.

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

