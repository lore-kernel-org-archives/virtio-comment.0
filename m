Return-Path: <virtio-comment-return-6952-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B26AFC001DF
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 07:17:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0F2ACF3F47
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 07:17:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E7086986636
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 07:17:55 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id CF33E9865EC; Wed,  2 Aug 2023 07:17:55 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BA1649865F1;
	Wed,  2 Aug 2023 07:17:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IF+59+gFwC1gsNrnx9n1XV5zneZNwr2N5tVd35a93fqzshzSB67KtKc+wRo5p4XlXBfns1zlHuAjIBnAmyiwuoI/wxjFM3K7lzdUhtr55rZVClxg8vu9vkYClbOmuESWK3fAHD9CLKckTlEC3bAgwMC4BFnziSsLm9SYuB3Dt2HETqlCDYWFJWhpSR9TxH6vmU0cNtfGcZ7T80wBQzicH2dnl8DqcG0U39DZw6zsHVq8H5++QS8HxZijKON3iqSBpiIP3JBP0lVO7xs8rRsaYE9X46smC06GRPLlc7ZXLTGi3Z+En8C+pPh3i2K9G4CejSITjYSPsqAjTYuMUCnYfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4BvJqzgr6jZyDZk6jhhM4DJuIsWpRc2bne9x0PIbTZY=;
 b=V7WLZQn80VxAOzxbFozt348Mb9mn2wvFLBr5mARiMK1FF19AnydSKKYAI4ZoOmaR1cxSCQDBATNu40Nv6r2ABNzvOHasj7uF4t0ulyTAzMfbwrUPal6J9qj4dS0vd76wW0v3vCH7fE5sUvIB6eYOpYYHJNR8OcOZ+V+UC83DefhZy9IJJsqxRlkP9S0n8U1/K2MUxTLoUlSx4sePMiEXrlhvXijGCtEWdApjUBDIQXpPuZL9/UhMXzrxRtYuZlM1xc+PMnKBFEN43F2gIRSzcTHHTh2Y0wXB4sAsLE1tMfqUMMt0k9zVM/lSSFxbfuRuN2gQx4YB9uQMAYh8HzX5Nw==
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
Thread-Topic: [EXT] [virtio] [PATCH requirements 5/7] net-features: Add
 n-tuple receive flow filters requirements
Thread-Index: AQHZvd/x+MQx6UqlikiIZTDGukwDA6/WnZ9A
Date: Wed, 2 Aug 2023 07:17:42 +0000
Message-ID: 
 <SJ0PR18MB44772855643A6348135CE8F1C30BA@SJ0PR18MB4477.namprd18.prod.outlook.com>
References: <20230724033421.249893-1-parav@nvidia.com>
 <20230724033421.249893-6-parav@nvidia.com>
In-Reply-To: <20230724033421.249893-6-parav@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR18MB4477:EE_|DM4PR18MB5528:EE_
x-ms-office365-filtering-correlation-id: acd826b8-4f41-4a47-21e8-08db93289018
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 J80bS/j/2nr9gzFrL1Tcn00xZq68bWNHCdbJZ4cewXMixDw0JhDoTur4OEuPflvZiUp0VQ+D4PQ9p71E/Oq78k3UoIyaSEV6ykKwf401NVDk9bxArGczlWBeak7R6yHqgRsQZHH5e1NwKY+gvrTLifuTKFC9wG6ZEQqx78PK0uHHC36YZ07l8dTyCI0w+MD940GLCQYhaRf4BqTshEYxCqPt+rkbFv9uQhgf/mPCYmz68z8lAq9+urfa+Fr3vmpJMVJ3IipEA/MVqDvWeNw9/VRA8oV+pXYLSB1+hQx4lqvGX0i5D1uD75bjtZknbUNQEM5pAV+1kuZGfpCsT6pe/Af723sG1HFtb8futCztaodB9uzo6F3CAIKEX7dIbK7M4zXObnVfukwJ+ECGo+ojyojfK/1ki0rsnVBNRr+oxENTeraNs9DVR6rIEGT46sJSXsKQUfsPAsHwI99WV9o4EpAJt5UV00j0Hwh+CR4PsbK1wQhiTiiVO3B98QenmV9LoVtsDNCBu7dw7SoiVYdWyW4Lr1IUSijFKJtqH8dj1A6dt7tPNuuPRKLpN/6Prqkl9O9FcB8Wk4JkNpK2aB08IYJRRj15h4cHPzLIdzPzFYg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR18MB4477.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(366004)(136003)(396003)(346002)(451199021)(55016003)(16799955002)(186003)(966005)(9686003)(316002)(86362001)(478600001)(122000001)(54906003)(110136005)(38100700002)(76116006)(71200400001)(66946007)(66556008)(66476007)(66446008)(33656002)(64756008)(7696005)(4326008)(6506007)(53546011)(41300700001)(26005)(52536014)(8676002)(5660300002)(8936002)(2906002)(66899021)(38070700005)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?DEYmQTHjqR5LdGyabvsxcJ065L7T3kv+KkTbGF43DQpFcRBHz6wZtCv3QS3k?=
 =?us-ascii?Q?umjg1VhcnbupXDWjVFy7nd09rYQh8TSeiuixUKy+oWJ8I8TSvJ6GHl9JZi/C?=
 =?us-ascii?Q?uD41NX+vLXtruu5wgBo7EhmZjO5gZ9y+oZCvTwQb0LmtQnciDH1Vgv9G+tIu?=
 =?us-ascii?Q?pSaL9MQro1j++30QQp+CF1jem1IFXUXQ+QlWkXukZIjWBQVtqlDlSF8Fyck8?=
 =?us-ascii?Q?ALRJwI04lkkJr2AXf9sA7PkzH04WgNOnGvrd1sGh0RQ4xYhpl4PYLN+dnnKA?=
 =?us-ascii?Q?Al8QRjvIXtaHLTWu0I0U4roX+nyjZPKqNp/MrT/ihKoq7hwTh/qhXYLCcOuK?=
 =?us-ascii?Q?dcFOmcNaAHgNoUvzcYn+RAuPDkeYSCNXz6M6uhc13EbwWtxQPNPERZD9U2NQ?=
 =?us-ascii?Q?qyTMXbbrB5RERuKoNBw2/bIT8vXNUgtAdP1haW1EcZF78k2xrFoPWszLxP5j?=
 =?us-ascii?Q?gGp3nFmpiPXlCQ/YqX1oGTIxEW6EYojZGOxGtmjGuTdsObQ5Yk43rGfRGaoP?=
 =?us-ascii?Q?e1haaOSRW6yjCF7lSqYchTaT7qSXpmpqLRUSAWCaaxFjxBf3J/UVHbXXmg3Y?=
 =?us-ascii?Q?RWX7DfV/uDcsFiX9rzdDeLcXqMdXRMQEUZglGncEY4l3ffb6vAP2Y53ju0z7?=
 =?us-ascii?Q?3hhiWiA8tmymRNfrqP72AWSLbefocSSscwoPjVQfhWtnenJLkg/rSq8LXjBC?=
 =?us-ascii?Q?Nzgu79Sl9S56TYtOheiekvakoWNdZrzJPEMrEGXkhGGc/VyGH3gm0SEZzrda?=
 =?us-ascii?Q?JyxpHCzURBDMkkzp7d2PsfcH/qIydqnSXaiUh3YY+srR3rkv+SZC0k+HFu2b?=
 =?us-ascii?Q?vZaOKurI50VIch+s8auv+ZwpCF6xfal4b8rtzygoP/Tu+9YhhxyEZO7Dv6mZ?=
 =?us-ascii?Q?dfJj9f5A1lp9s3qaZ1whUKowLD4C36NQvZStlErCU2ZnVtIzmvWT/yi9dfYp?=
 =?us-ascii?Q?6EpKwBWIvwlP+q7HculntxNgJRFyTDHiIFXRZiD4eiLkdEK+4Q7VS+PkwfUc?=
 =?us-ascii?Q?eprC3pgUvxrTeSSBp1u90c8BHiBua23QLaLiIlhFCeeuLqkSY2IL9b8HYz4Z?=
 =?us-ascii?Q?+jO8fVcD/KvBJJMD4kwavN5TIZXSlk9Al7mDKS2kX3S9w99GbOALBSo/Vt9c?=
 =?us-ascii?Q?e2yjTWTIeDf5xu2e50Zw2PjsevM4vNWDBQVlC1unzzYMq4SFIj7ToOI20I/O?=
 =?us-ascii?Q?Sb7oln5RFQMiTeGVICnZWTW/JpIXn1297JISJJBcbQ3+It2TqPEd77qMTMWD?=
 =?us-ascii?Q?07qEg6lqoe3x+YQq8kDk7d+4U2Kzvu1G+JA4u9PxABzXGb39wbRfpO0mf8AP?=
 =?us-ascii?Q?Ao5tzQlenoJheJ1d5nLWt+Res+M27m5jljq8BguII1gp1OVLW6kMfObNMvh4?=
 =?us-ascii?Q?HTJwJPceXqirmfsp+15RgxHEoi4+i7Z+hpwidoDcffMmtsp+ioJwd5ndyxKv?=
 =?us-ascii?Q?IxDjYPh5Sj2pfSAeOTzluBK1MTycMC7/FtWsms7qVVUvP2bK8NM4uhqsGMvy?=
 =?us-ascii?Q?HbgodRNR2pVDZm5GKwyUPLXZfJnRcZMfcg16hKHws1/PhuQFF0QiAcJs5zM5?=
 =?us-ascii?Q?nvc5XCnqSRyg1f5Mz5g=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR18MB4477.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acd826b8-4f41-4a47-21e8-08db93289018
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2023 07:17:42.7954
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rt7oV2UozxrnjpiQ1TVd0gFc5Tio8AZlqFGdCJ+8Yz7gEEGH80XQNS1OEdruq/ea0g0Tgrl/T9Nf7ZiSOfKH+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR18MB5528
X-Proofpoint-GUID: Cuita1Ak_HAmCJWiQlMpkPa3zUGdqXcA
X-Proofpoint-ORIG-GUID: Cuita1Ak_HAmCJWiQlMpkPa3zUGdqXcA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-02_03,2023-08-01_01,2023-05-22_02
Subject: [virtio-comment] RE: [EXT] [virtio] [PATCH requirements 5/7] net-features: Add n-tuple
 receive flow filters requirements

Hi Parav

> -----Original Message-----
> From: virtio@lists.oasis-open.org <virtio@lists.oasis-open.org> On
> Behalf Of Parav Pandit
> Sent: Sunday, July 23, 2023 8:34 PM
> To: virtio-comment@lists.oasis-open.org
> Cc: shahafs@nvidia.com; hengqi@linux.alibaba.com; virtio@lists.oasis-
> open.org; Parav Pandit <parav@nvidia.com>
> Subject: [EXT] [virtio] [PATCH requirements 5/7] net-features: Add n-
> tuple receive flow filters requirements
>=20
> External Email
>=20
> ----------------------------------------------------------------------
> Add virtio net device requirements for receive flow filters.
>=20
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
> changelog:
> v1->v2:
> - split setup and operations requirements
> - added design goal
> - worded requirements more precisely
> v0->v1:
> - fixed comments from Heng Li
> - renamed receive flow steering to receive flow filters
> - clarified byte offset in match criteria
> ---
>  net-workstream/features-1.4.md | 105 +++++++++++++++++++++++++++++++++
>  1 file changed, 105 insertions(+)
>=20
> diff --git a/net-workstream/features-1.4.md b/net-workstream/features-
> 1.4.md
> index 27a7886..d228462 100644
> --- a/net-workstream/features-1.4.md
> +++ b/net-workstream/features-1.4.md
> @@ -9,6 +9,7 @@ together is desired while updating the virtio net
> interface.
>  1. Device counters visible to the driver
>  2. Low latency tx and rx virtqueues for PCI transport
>  3. Virtqueue notification coalescing re-arming support
> +4  Virtqueue receive flow filters (RFF)
>=20
>  # 3. Requirements
>  ## 3.1 Device counters
> @@ -175,3 +176,107 @@ struct vnet_rx_completion {
>     notifications until the driver rearms the notifications of the
> virtqueue.
>  2. When the driver rearms the notification of the virtqueue, the device
>     to notify again if notification coalescing conditions are met.
> +
> +## 3.4 Virtqueue receive flow filters (RFF)
> +0. Design goal:
> +   To filter and/or to steer packet based on specific pattern match to
> a
> +   specific context to support application/networking stack driven
> receive
> +   processing.
> +1. Two use cases are: to support Linux netdev set_rxnfc() for
> ETHTOOL_SRXCLSRLINS
> +   and to support netdev feature NETIF_F_NTUPLE aka ARFS.
> +
> +### 3.4.1 control path
> +1. The number of flow filter operations/sec can range from 100k/sec to
> 1M/sec
> +   or even more. Hence flow filter operations must be done over a
> queueing
> +   interface using one or more queues.
> +2. The device should be able to expose one or more supported flow
> filter queue
If there is more than 1 queue, I assume there is no ordering requirement=20
between operations submitted on multiple queues.
> +   count and its start vq index to the driver.
> +3. As each device may be operating for different performance
> characteristic,
> +   start vq index and count may be different for each device. Secondly,
> it is
> +   inefficient for device to provide flow filters capabilities via a
> config space
> +   region. Hence, the device should be able to share these attributes
> using
> +   dma interface, instead of transport registers.
> +4. Since flow filters are enabled much later in the driver life cycle,
> driver
> +   will likely create these queues when flow filters are enabled.
> +5. Flow filter operations are often accelerated by device in a
> hardware. Ability
> +   to handle them on a queue other than control vq is desired. This
> achieves near
> +   zero modifications to existing implementations to add new operations
> on new
> +   purpose built queues (similar to transmit and receive queue).
> +6. The filter masks are optional; the device should be able to expose
> if it
> +   support filter masks.
> +7. The driver may want to have priority among group of flow entries; to
> facilitate
> +   the device support grouping flow filter entries by a notion of a
> group. Each
> +   group defines priority in processing flow.
> +8. The driver and group owner driver should be able to query supported
> device
> +   limits for the flow filter entries.
> +
> +### 3.4.2 flow operations path
> +1. The driver should be able to define a receive packet match criteria,
> an
> +   action and a destination for a packet. For example, an ipv4 packet
> with a
> +   multicast address to be steered to the receive vq 0. The second
> example is
> +   ipv4, tcp packet matching a specified IP address and tcp port tuple
> to
> +   be steered to receive vq 10.
> +2. The match criteria should include exact tuple fields well-defined
> such as mac
> +   address, IP addresses, tcp/udp ports, etc.
> +3. The match criteria should also optionally include the field mask.
> +4. The match criteria may optionally also include specific packet byte
> offset
> +   pattern, match length, mask instead of RFC defined fields.
> +   length, and matching pattern, which may not be defined in the
> standard RFC.
> +5. Action includes (a) dropping or (b) forwarding the packet.
> +6. Destination is a receive virtqueue index.
> +7. The device should process packet receive filters programmed via
> control vq
> +   commands first in the processing chain.
> +7. The device should process RFF entries before RSS configuration,
> i.e.,
> +   when there is a miss on the RFF entry, RSS configuration applies if
> it exists.
> +8. To summarize the processing chain on a rx packet is:
> +   {mac,vlan,promisc rx filters} -> {receive flow filters} -> {rss/hash
> config}.
Shouldn't this be
                                                         |-match-> {RFF pro=
cessing}
{mac,vlan,promisc rx filters} -> {receive flow filters} -|
                                                         |-no match-> {rss/=
hash config}.
The above looks like RSS processing will always happen.
> +9. If multiple entries are programmed which has overlapping attributes
> for a
> +   received packet, the driver to define the location/priority of the
> entry.
If driver does not provide group or provides same group with 2 rules that
have a same match part, does the new entry overwrite the old one for exact
matches(no mask) ? and for rules with masks, does the rule with longest mat=
ch take=20
precedence? or the latest added rule takes precedence?=20
> +10. The filter entries are usually short in size of few tens of bytes,
> +   for example IPv6 + TCP tuple would be 36 bytes, and ops/sec rate is
> +   high, hence supplying fields inside the queue descriptor is
> preferred for
> +   up to a certain fixed size, say 56 bytes.
> +11. A flow filter entry consists of (a) match criteria, (b) action,
> +    (c) destination and (d) a unique 32 bit flow id, all supplied by
> the
> +    driver.
> +12. The driver should be able to query and delete flow filter entry by
> the
> +    the device by the flow id.
The flowid here seems to be used for rule index. Can this be returned by
the device instead of being sent by driver? A 32 bit value to store might
impose undue restrictions on devices that have lesser capacity. Or could
there be a restriction that flowid cannot exceed the value returned by=20
device as the capacity.=20
> +
> +### 3.4.3 interface example
> +
> +Flow filter capabilities to query using a DMA interface:
> +
> +```
> +struct flow_filter_capabilities {
> +	u8 flow_groups;
> +	u16 num_flow_filter_vqs;
> +	u16 start_vq_index;
> +	u32 max_flow_filters_per_group;
> +	u32 max_flow_filters;
> +	u64 supported_packet_field_mask_bmap[4];
> +};
> +
> +
> +```
> +
> +1. Flow filter entry add/modify, delete:
> +
> +struct virtio_net_rff_add_modify {
> +	u8 flow_op;
> +	u8 group_id;
> +	u8 padding[2];
> +	le32 flow_id;
> +	struct match_criteria mc;
> +	struct destination dest;
> +	struct action action;
> +
> +	struct match_criteria mask;	/* optional */
> +};
> +
> +2. Flow filter entry delete:
> +struct virtio_net_rff_delete {
> +	u8 flow_op;
> +	u8 group_id;
> +	u8 padding[2];
> +	le32 flow_id;
> +};
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
> NXHHG4WB09qqS0voo_nf6_kGS625A&m=3Ds4DkD0yyl9BvPMHr6DMuYpiRlBf_vmBXRWinZK_=
m
> NRho9Fue9HuTbs35i1zY6NeO&s=3DVS8X60QpRfg49zJm_fZGhwms1_R4J-
> MDPPhlu0nMG2w&e=3D


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

