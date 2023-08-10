Return-Path: <virtio-comment-return-7068-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF4EC001E0
	for <virtio-comment@archiver.kernel.org>; Thu, 10 Aug 2023 19:05:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E9D172B138
	for <virtio-comment@archiver.kernel.org>; Thu, 10 Aug 2023 19:05:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A5F149865CA
	for <virtio-comment@archiver.kernel.org>; Thu, 10 Aug 2023 19:05:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 90EC698658D; Thu, 10 Aug 2023 19:05:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CCE159865AB;
	Thu, 10 Aug 2023 19:05:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GwCDWAeejqwC1w6ewnn62XYkUf6oxo1xbdLftUS56HY7kxGmqbtg/zGLiaiNs/Ltf/05tAN3ms1LJqYgFP4kx26lvomEEInPtt0b8D9Wc2JFV9u1UWMpfLdqCK+hVHYaw9Iuzy6d/8IjkfiqPrgoH7gonLRuNm00aebzp+UevSGAXjspX/E3/E3DeS0XeugQ77Jh6u6CMs8uKeZoCGIb4rmJULaODkTcXXhtOhDkcSGDD5GrNto2QXNPEDXYDIqEh2pLYa26iSGscPVoDcQOGqMfwDyMnMmUmWrpRGbjuaz5rRg4ziE7aR+JaKkB2GmeYCTbqDUOCBH1lcD/PvdfQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ijaELLuFUnO3nyg6JvfF3PxhQSgK4ON4ciRrQW03III=;
 b=kum7xQszsoNYOPQSwz2dQYQ1hqNJN1KIDR5zN+B9pFGJG5SGO+7JL5GfkpqnXLNiO3sqGSiZQePbbemaO7vXQSKnBr4+N/5eESsFczpNVgjia0UhxaSDYsOXRL+zb9zcIDNjk8kvBzEYuwvoiiSuoC5pTkNkgsysiBRAmb7lBDAZH9FnYjIGk56GozvDDeTjQBX3E0QK6+goUnBVwhc8PK1pGp7Ccq2OOxan1bLT3zcwcrsw/hqzAtDKS6B5QjTuKtvDekU8BJoFZFjKvMa2TEOE3oV0RzslQH2Cz2b68fbwgCb5bdTLgAfHErF6UsHQAOPqcZhQpcXnhCDKY6Ka5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
From: Satananda Burla <sburla@marvell.com>
To: Parav Pandit <parav@nvidia.com>,
        "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
CC: "shahafs@nvidia.com" <shahafs@nvidia.com>,
        "hengqi@linux.alibaba.com"
	<hengqi@linux.alibaba.com>,
        "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>
Thread-Topic: [EXT] [virtio] [PATCH requirements 2/7] net-features: Add low
 latency transmit queue requirements
Thread-Index: AQHZvd/56OrBGR1U3U2Zm3x7N5i7Wq/j/deQ
Date: Thu, 10 Aug 2023 19:05:05 +0000
Message-ID: 
 <SJ0PR18MB44774F4AAFCABB7F4D21B20DC313A@SJ0PR18MB4477.namprd18.prod.outlook.com>
References: <20230724033421.249893-1-parav@nvidia.com>
 <20230724033421.249893-3-parav@nvidia.com>
In-Reply-To: <20230724033421.249893-3-parav@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR18MB4477:EE_|BN9PR18MB4249:EE_
x-ms-office365-filtering-correlation-id: 8526baed-79d0-410c-e971-08db99d4b57a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 xWHOQRHY20pIJ7Wdw8d5z8yiVQ2SphMkfpnsYdTjb0410qsLm30btRo8nRfBTlEJWaB2VkneAflBtPCC1bOfU4h5gJhCjgksxTt7ZYky0Ryv9oRlt5+JwCzLIHJEJIWBS/nWvBDsgqxVnS36vcPrBDR5Rvkx8GpIBX+BS91W0PBIkTkwBSlOMC7mcDKw6GO9As+p3ZEInOE+4RR3SxKCt9wL2rYj9Zg6jt3ZHKDQ6HgfbEZhIMTmoPxM5a/7bvYTfUEIDzHYAthH2WDLXC2xKiAav6vPZVQwtZshurTLxjBG40AnIq2ZybMuof2GKcgLZxLRHE7vrXFq7gz+I6V6ilP7chIxil4ovvlF83196+xB6omp5o54bH21J2cxrv1UoTfg28IN8nRhmYc6ydspHhlb1wc9TWARE2Val20SXbqm55Ajzcjrv6UKpqQCV9gywByLZwXTq5GxJj2UtctPyMdM5Q3Lo2LeRceGawXMJ/ID7bjUnsWjIyJJGzTBqFW4j/dDrOXvCk0+IiCqe23hyZ8eF/jYpUy3cjhbO6NCwubRhl9qvHKNtP9sVT7F+Tk+Sl59a0n/j38Wnc06ubdYOzLl9ZKdBDK9uasDXpbg5bc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR18MB4477.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(376002)(136003)(39860400002)(346002)(451199021)(186006)(1800799006)(2906002)(54906003)(966005)(9686003)(4326008)(7696005)(66556008)(66946007)(76116006)(64756008)(66446008)(110136005)(38100700002)(66476007)(83380400001)(478600001)(122000001)(86362001)(66899021)(316002)(55016003)(5660300002)(16799955002)(8676002)(71200400001)(41300700001)(8936002)(33656002)(53546011)(52536014)(38070700005)(6506007)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?zFqEjbNpALQFb14MBxBrB9Fp0Ef3iakQI76QmsD6psU7ouyGZtmyfplTgQuJ?=
 =?us-ascii?Q?hVs2sfaxuZFV8VznCxNjMBRiz6QVWiye3UNQkzRAtUTGMx6QbM003XTdun5S?=
 =?us-ascii?Q?b6SeLP2Bdjk6GWzEnn9kh0OzTDN4KZWiTjACZEH25yR0ToPjP0qxTDuN2j15?=
 =?us-ascii?Q?TT77fOr2dPCiL9opNQNqXDER5FzLm+yPxBpStDx6Z2hox+m8SWT8bGRXErLQ?=
 =?us-ascii?Q?3BtlHKnloH83swPCjAVpK4A1qlmw1YhfimbIxITuk3xNfQHW6u5LnYqVtgHZ?=
 =?us-ascii?Q?WeaDENhY7jHKimvxPdcSFZA+kwUSAQl3aUbwQXQ/RyiPKw7JyqULEV8wMS3W?=
 =?us-ascii?Q?x9Vs1jVuHNhbcBjv2H95WnvKeH4o2lL/X3z0oFkwBbYbhJaigonNsJ/gn0T/?=
 =?us-ascii?Q?JWNr5y0OKq399mY+fLuK9Jr9EkEFairnXD3Z+Bv+4cSIUTMEwiKFznxIQyym?=
 =?us-ascii?Q?w1BtA8dtfOxUj7UZTvH9IF98OXkuiDo1lqa1fCU+yr8nESFTHm3cDrrFBhXK?=
 =?us-ascii?Q?/rzj6ZSROjigsG4ftODUS3OJEKgsHA/5PNdxiMDVEeOhx32U6nMmvB6Vg+o0?=
 =?us-ascii?Q?+pfBwUAQ8QGn+vMkTgfj0Buti16VJOODts9FuVsZuCb7XGYaMCaqcz4YGKKb?=
 =?us-ascii?Q?MNi9rdlfljDXvg2a6A0nJ/BMvYLJ9XHYDfKWeznMbE81nCVFMjSIMn6TdRT2?=
 =?us-ascii?Q?4KBz91tY0EiIPHlbO4+Vu2vQd1MeyuX4jl6fFoqK5LkGQuiXJxCPba1+mwYT?=
 =?us-ascii?Q?u/lzDu1Cagu7PcA95nrRsBtBkxeyGW1XjqsIQFk2W3S4kIIjVD4YOjDyy8w4?=
 =?us-ascii?Q?oJF/4V5f93NWQo2/j19hcbKOitkfQUxFGOKHBm1kZ7ekQU6euMgvFb29rzKo?=
 =?us-ascii?Q?wHIcuP/pm+1Z89o7J788/KCV6SjTUEy1JuUqBO+/3W1MZzwsv/g59dK+6YuY?=
 =?us-ascii?Q?YGPdMvuW54mf9CJr3s0k2ZmXizpMRSllZaat7o0gdyiGX++zK0BueD/8fzyJ?=
 =?us-ascii?Q?/2eg3poYqL9kkEIUt+XoUZLZSI8i909zLvJZ2jFuxg++itWe0mxrDXBKPJE+?=
 =?us-ascii?Q?KdG/tSRaOplBJdxfh66TfE/Hd38sRs+1MdRGVir5v5xzL+4nr2ULPXPeOfUB?=
 =?us-ascii?Q?Ftt/Ia2/kc3ndbzLTznG+v5D/h+ZciMybnOqVSL+Mf5SSK0UpyqxQlBGtGYF?=
 =?us-ascii?Q?IpUcftTxSPAZwERNUtWfkt/AzX43JMRyrdRGYuK1RPneeKxRvm0n91ibuZNt?=
 =?us-ascii?Q?O9loZzIXzr301SPxrOMAfE2+EaJdWekQZ1f9/k+KX9fy2VzKf1GoEWuiRS57?=
 =?us-ascii?Q?BS0VygI5t67evcYbQzCrEkTowOVImRQES+umDTzv7RO0ocmg6+QqBuibXl3k?=
 =?us-ascii?Q?ASdsG0Hu+lXZx6PF11O4Zh2hYMxU5um+VNjtzIbBl1Bh7qmKZR4INFL0b0yG?=
 =?us-ascii?Q?bg/nPfFGR+W6oyqBP+C9hn4U8ArUBfLKCAqlk06Ip75NATHHfTyMPl80blua?=
 =?us-ascii?Q?XyEeyLY0LTatGEYAvI+CyQODrzCX+ell5XjVCBvkcW9LZYdqNZxD/l/PfmSj?=
 =?us-ascii?Q?wqbhfjfY4KugHetTrZc7QLprGt6AuGYc7TOwRGdT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR18MB4477.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8526baed-79d0-410c-e971-08db99d4b57a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2023 19:05:05.9859
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4unXb4aqiiAAOXRVu+WCt/TKQtxWmetZjV0Y2sxsUxXH7AvrqqA+HvzRB4gQDZYkWgQ5wqF+Ba4ujiUC1r2KoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR18MB4249
X-Proofpoint-ORIG-GUID: HeP_WD3xvnCGczkwEzJzbCkjUSmxoCuo
X-Proofpoint-GUID: HeP_WD3xvnCGczkwEzJzbCkjUSmxoCuo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-10_15,2023-08-10_01,2023-05-22_02
Subject: [virtio-comment] RE: [EXT] [virtio] [PATCH requirements 2/7] net-features: Add low
 latency transmit queue requirements

Hi Parav

> -----Original Message-----
> From: virtio@lists.oasis-open.org <virtio@lists.oasis-open.org> On
> Behalf Of Parav Pandit
> Sent: Sunday, July 23, 2023 8:34 PM
> To: virtio-comment@lists.oasis-open.org
> Cc: shahafs@nvidia.com; hengqi@linux.alibaba.com; virtio@lists.oasis-
> open.org; Parav Pandit <parav@nvidia.com>
> Subject: [EXT] [virtio] [PATCH requirements 2/7] net-features: Add low
> latency transmit queue requirements
>=20
> External Email
>=20
> ----------------------------------------------------------------------
> Add requirements for the low latency transmit queue.
>=20
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
>=20
> diff --git a/net-workstream/features-1.4.md b/net-workstream/features-
> 1.4.md
> index 4c3797b..eb95592 100644
> --- a/net-workstream/features-1.4.md
> +++ b/net-workstream/features-1.4.md
> @@ -7,6 +7,7 @@ together is desired while updating the virtio net
> interface.
>=20
>  # 2. Summary
>  1. Device counters visible to the driver
> +2. Low latency tx virtqueue for PCI transport
>=20
>  # 3. Requirements
>  ## 3.1 Device counters
> @@ -33,3 +34,90 @@ together is desired while updating the virtio net
> interface.
>  ### 3.1.2 Per transmit queue counters
>  1. le64 tx_gso_pkts: Packets send as transmit GSO sequence
>  2. le64 tx_pkts: Total packets send by the device
> +
> +## 3.2 Low PCI latency virtqueues
> +### 3.2.1 Low PCI latency tx virtqueue
> +0. Design goal
> +   a. Reduce PCI access latency in packet transmit flow
> +   b. Avoid O(N) descriptor parser to detect a packet stream to
> simplify device
> +      logic
> +   c. Reduce number of PCI transmit completion transactions and have
> unified
> +      completion flow with/without transmit timestamping
> +   d. Avoid partial cache line writes on transmit completions
> +
> +1. Packet transmit descriptor should contain data descriptors count
> without any
> +   indirection and without any O(N) search to find the end of a packet
> stream.
> +   For example, a packet transmit descriptor (called vnet_tx_hdr_desc
> +   subsequently) to contain a field num_next_desc for the packet stream
> +   indicating that a packet is located in N data descriptors.
> +
> +2. Packet transmit descriptor should contain segmentation offload-
> related fields
> +   without any indirection. For example, packet transmit descriptor to
> contain
> +   gso_type, gso_size/mss, header length, csum placement byte offset,
> and
> +   csum start.
> +
> +3. Packet transmit descriptor should be able to place a small size
> packet that
> +   does not have any L4 data after the vnet_tx_hdr_desc in the
> virtqueue memory.
> +   For example a TCP ack only packet can fit in a descriptor memory
> which
> +   otherwise consume more than 25% of metadata to describe the packet.
> +
> +4. Packet transmit descriptor should be able to place a full GSO header
> (L2 to
> +   L4) after header descriptor and before data descriptors. For
> example, the
> +   GSO header is placed after struct vnet_tx_hdr_desc in the virtqueue
> memory.
> +   When such a GSO header is positioned adjacent to the packet transmit
> +   descriptor, and when the GSO header is not aligned to 16B, the
> following
> +   data descriptor to start on the 8B aligned boundary.
> +
> +5. An example of the above requirements at high level is:
> +
> +```
> +struct vitio_packed_q_desc {
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
> +   u8 num_next_desc; /* indicates the number of the next 16B data desc
> for this
> +		      * buffer.
> +		      */
> +   u8 gso_type;
> +   le16 gso_hdr_len;
> +   le16 gso_size;
> +   le16 csum_start;
> +   le16 csum_offset;
> +   u8 inline_pkt_len; /* indicates the length of the inline packet
> after this
> +		       * desc
> +		       */
> +   u8 reserved;
> +   u8 padding[];
> +};
> +
> +/* Example of a short packet or GSO header placed in the desc section
> of the vq
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
> +6. Ability to zero pad the transmit completion when the transmit
> completion is
> +   shorter than the CPU cache line size.
Did you mean that the last completion in a cache line will be padded ?
For ex if a transmit completion is 16 byte, you could fit 4 of them into
a cacheline. But if device has got only 3 completions to post, it would pos=
t
3 and pad the last 16 bytes. I hope you did not mean that every transmit
completion is padded to cacheline size.=20
> +
> +7. Ability to place all transmit completion together with it per packet
> stream
> +   transmit timestamp using single PCIe transcation.
> +
> +8. A generic feature of the virtqueue, to contain such header data
> inline for virtio
> +   devices other than virtio-net.
> +
> +9. A flow filter virtqueue also similarly need the ability to inline
> the short flow
> +   command header.
> --
> 2.26.2
>=20
>=20
> ---------------------------------------------------------------------
> To unsubscribe from this mail list, you must leave the OASIS TC that
> generates this mail.  Follow this link to all your TCs in OASIS at:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasis-
> 2Dopen.org_apps_org_workgroup_portal_my-
> 5Fworkgroups.php&d=3DDwIDAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DNHDPsfcAYlN2z-
> NXHHG4WB09qqS0voo_nf6_kGS625A&m=3DtvyHiYG_HE5F75ytZ2r2VlJuL4SVMmHF1elkPvW=
b
> byeYrTpljeSms0FoFoRXZR4g&s=3DNadfoNGGIuFl6YXYFu0njgTXjGISJgOdW-
> AVVvvK2Ms&e=3D


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

