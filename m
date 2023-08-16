Return-Path: <virtio-comment-return-7170-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F0B4C04A94
	for <virtio-comment@archiver.kernel.org>; Wed, 16 Aug 2023 06:27:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7529D747CE
	for <virtio-comment@archiver.kernel.org>; Wed, 16 Aug 2023 06:27:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 53B1398640C
	for <virtio-comment@archiver.kernel.org>; Wed, 16 Aug 2023 06:27:38 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3A069983EB2; Wed, 16 Aug 2023 06:27:38 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 294A59863D1;
	Wed, 16 Aug 2023 06:27:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X8NZ+tm56A24VwHhuxxSMbCZeLQORRf1pADrpg4IsigbbsyZVPHz2Si52sQexpkSTjDzxpURU9HajkWftQwi9DQihXFV4ET6eoMDFJFZLFQvEwvQvPkwsbcg2+chKiyY0u6qOHo990nAXjqOBfplSxZdeU8y97rRTsKpts5n4U+aKpRhp5t5OUHS5sHkY3+MCg7fiB5PUKnqu/WuCjPjAQLSuUX0PLfQbQ8yExcbVLimwm9ZME1c51ZEq6U0nvjtSugep4MxP39lBm3vWdfehvQBcoNm5DvtYapveL0iJgxRkDLnyiPUlQxKdG4OFT02/PPmdb5hrg6eF49W7pSAsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9UIcqtjzrdDv+dohq4GmCZqreCbrzQ9aFGhZ89ArWJ4=;
 b=LLfhCbhgTNAivhL+u/feTfbpfPTQvVZvgzlF00kH4sAmGyzfnd6tkHXaxJP+D+zTyqCL8Oq8hsJiVf/9/WisHSPfEdQJx6g2U3vYBHILJiJ9g30uQDrt3mBN8dIOXOgiJR3fqrsscQhs8mbc2Y5YGIXSFG81Z3RH9JPs+2U1reVibYDQBSbqq21ApI+64CUReFwIrZ7xfxBdhnnKzdjubxMnLffICMuLiSkWzmYJqA/CU6kzANPAuUAO/zi3IZ7nPo8iBZRuHtWWOZ0OlKjDVi2TyoN7l+7gsVZ0Mwn/ZPdSM56B9/nJhQ9l1eA0qWySpuskYAdDpfmPkR/xdzPAag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "hengqi@linux.alibaba.com"
	<hengqi@linux.alibaba.com>, "david.edmondson@oracle.com"
	<david.edmondson@oracle.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, "sburla@marvell.com" <sburla@marvell.com>
CC: Shahaf Shuler <shahafs@nvidia.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>
Thread-Topic: [PATCH requirements v4 5/7] net-features: Add n-tuple receive
 flow filters requirements
Thread-Index: AQHZz0ybAp2BVBRKNECVQ04dzfRGH6/sdGHw
Date: Wed, 16 Aug 2023 06:27:34 +0000
Message-ID:
 <PH0PR12MB54819624183D0A74599C14A1DC15A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230815074600.473933-1-parav@nvidia.com>
 <20230815074600.473933-6-parav@nvidia.com>
In-Reply-To: <20230815074600.473933-6-parav@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DM6PR12MB4268:EE_
x-ms-office365-filtering-correlation-id: 68b4aa0b-b6a0-4195-47d8-08db9e21e0fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 i6BFOG7yPAzQXIHTdhsK9dEBPjsxSTtHZfx3ARxYepjgmAZiss5VCFRjatWXCuTyxK4L+tBJt6uiO4iX4hyWdJo1OzTtZeg+Jkn0nOzv7FSID4+JdIYwmSg42z+jhmz4M7lYGC63erdvXKElD5wV/t9R86Hoyf35cXBGX8EV2SUjTR1LGRqnwZPHfq7tkDkpx1dzTDHvr2a3Q8nApg71EvzLYKizpDZoZNNX+AGS+oLwrCuXE5QlS7ShV/6mOgrPIXMR9wk8tY8TtG3+M3Ac2P7jGzmKNznWKPrhXDkGZbdzHH7fO4lgSSPRZAWHGxWPUWT3j/2f4C53G7sbb1gprSLGHsHuH/Z+RJc8XibqsAdAep3PH28ybkt7I1HqSbzn9e/ntXVn4d/q5OTzYdh5TiRdxFLyFqCnV8l1ev2nhKLAIKyqBJRUveekV5zAGwzZEjx6PXJggLES+1NpmCwEnOUo00cGct9ApLoM6/PiaP0a6xH2HMiCX1Ut75qFeRLH8LBycQUjn8wxOaLWftR0qdnoJw9YLwoCJUXR18CAHFsV47WsmWFLhQunzLbz/os/NiXl6LbuZ7rtQ1IjcBW1YJ/JSQFaeUrPrvEUg56KU8GPUgbWKBxXbCMnx19cQ98t
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(39860400002)(396003)(346002)(136003)(1800799009)(451199024)(186009)(71200400001)(64756008)(54906003)(66446008)(76116006)(66476007)(66556008)(66946007)(7696005)(6506007)(2906002)(478600001)(9686003)(26005)(110136005)(5660300002)(83380400001)(52536014)(41300700001)(316002)(8936002)(4326008)(8676002)(122000001)(38100700002)(38070700005)(33656002)(86362001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?96LcZQhSWHremfkz2tSZlYwuefEfGm7opoqbahaxsWzHIGpEbf5lfCM/dLjV?=
 =?us-ascii?Q?aufihsxNvSWBUEEPYJHmqVyRCwVEbTf9c5Nn4e+NKO4+28CNndPNH8rFkad+?=
 =?us-ascii?Q?ZFc8EIRIP96lV4s4hWrYCWvdiKufEhrsaBNl0p7suBsQ8mogfQHnIbBfiIjA?=
 =?us-ascii?Q?ZghTX2Yk2RlGAmFExz/4Cx67nr/e+mUm3GUa7VJ2tHrk9D7Jm5LrWh6bcBM0?=
 =?us-ascii?Q?MnhmxTae99Fc+XXMqLmzWAIqFOP4D/pC4WRH7BwoUMuPACv8R5GDJEvZWKtU?=
 =?us-ascii?Q?r1M8sT+OAc5K1U1F8oPNzftm24Ybm1RKQ1NvLq12/IOqjBvp7GrZICVH2bRE?=
 =?us-ascii?Q?Y1XiDYMKhNkzCnFlg1eQbHVj8WUt/ctyZ2y3jX+C05B0jpTDGv/w/kHAyBZi?=
 =?us-ascii?Q?+2Errk0t6ruHPMuawON6cz5xmt8XfFYWLzOUqe555V2RH2OdzT+2oIHPstf9?=
 =?us-ascii?Q?TBU/om6a1YEZ4XdfrlKewkgDletSXNadkl9Hpc32Cm9u1evdjxz8grTfhYQU?=
 =?us-ascii?Q?54RLC30CCaHAQtlvSGmYedW39Cv0HK5FTJO1ubCtkquAoALaxrPXadAIRCqa?=
 =?us-ascii?Q?nWwKPpLUfWoeB/cXKZn/R7u/E8nkcjhnnJQjAC9Hh+UmRi8apRVvS9orf9Bd?=
 =?us-ascii?Q?4OYZvr/4IilW1qb9q9cSd4BVsrbBsbe8RPrxl1yBuP1wc+yN7OU59w7xCKWd?=
 =?us-ascii?Q?y44qGGHpfy//2NsPEtbINZTorspBtdG57LgAQu943kpLogCXOMrLvAlgs8Az?=
 =?us-ascii?Q?XtZMQkhmQzijvb/nLBYAQobKtAdGSuj/kW66uoe4QLdgkqiG9wEBS+pMA95Q?=
 =?us-ascii?Q?dIk/FtYnxznRS4iLYLpvKLUdtlaM62qoi89i2Nm+9RI84uAu26oRfFWbaKvw?=
 =?us-ascii?Q?dc2ZyFW7RIt0r0FY31r1nFPLF8oA4MfkxOT4EkNnHlp5XAEVWmYhOYw3ep10?=
 =?us-ascii?Q?+Et6JJJsIBTc72lydRDn2dbMNMBP92MzA7elkxP0g7Br6fVbNvdnxEGAP/cI?=
 =?us-ascii?Q?MPiWp5/NTVugSwyg4Pzp69DeNMG4hNqssdI8pq2I8tfSNsankwDamWkferab?=
 =?us-ascii?Q?2pOIHPnYMa4ulJIN87k58ZkrchhtGTwXbRw+y1GedoGZHqnr0+oOuIGnt73C?=
 =?us-ascii?Q?ed+rscu/MVLF4MKpJPIaicNKS7e7FxLh7G/k1KiGLH6HF3JYz1Xh9Y+npVR1?=
 =?us-ascii?Q?rQtxQrthkAaQMsWd1aj1yRuj5TBYGqGczPOzGf4fW8Es++p1/CeiChnfkixA?=
 =?us-ascii?Q?YQ8UF15O/DurzbifHLU7d9DUmymUAbQVseaRC5+GEobxwR+P1A70CaRAWoQP?=
 =?us-ascii?Q?U3zPW4gT7axUoCqbodzr5peX0ve3UfxQ5MOgnqoKN8H1B6gwVDBjow2FLOEe?=
 =?us-ascii?Q?OhPSsvAp2wnvc6T+crq+b4dKlxaLmY3TMw6nZuBKY2PcSoBIm/Ch18pCC44U?=
 =?us-ascii?Q?FsU8EzoOQ3b9DXrlWkFWEymLgipB3208gusXrRWqOxpqSC8tdij+ggA3h7fs?=
 =?us-ascii?Q?mHeONsl77Qq4Nn9W8H76Uh5kt4/3VcJcETtJmidOAHo9w0LEe41oeR8hnlal?=
 =?us-ascii?Q?Y/iqmtiifaVcUB5gL9k=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68b4aa0b-b6a0-4195-47d8-08db9e21e0fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2023 06:27:34.8644
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gNlDQW3M2tanuAhdy9MRHbb63Try7NOpcwJYBfFeA7GWKAcWfQMdmScAeoeM5rciNeW8B8LJtBRxxp4E1va+EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4268
Subject: [virtio-comment] RE: [PATCH requirements v4 5/7] net-features: Add n-tuple receive
 flow filters requirements

Comments below from today's bi-weekly meeting to address in v5.


> From: Parav Pandit <parav@nvidia.com>
> Sent: Tuesday, August 15, 2023 1:16 PM
>=20
> Add virtio net device requirements for receive flow filters.
>=20
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
> changelog:
> v3->v4:
> - Addressed comments from Satananda, Heng, David
> - removed context specific wording, replaced with destination
> - added group create/delete examples and updated requirements
> - added optional support to use cvq for flor filter commands
> - added example of transporting flow filter commands over cvq
> - made group size to be 16-bit
> - added concept of 0->n max flow filter entries based on max count
> - added concept of 0->n max flow group based on max count
> - split field bitmask to separate command from other filter capabilities
> - rewrote rx filter processing chain order with respect to existing
>   filter commands and rss
> - made flow_id flat across all groups
> v1->v2:
> - split setup and operations requirements
> - added design goal
> - worded requirements more precisely
> v0->v1:
> - fixed comments from Heng Li
> - renamed receive flow steering to receive flow filters
> - clarified byte offset in match criteria
> ---
>  net-workstream/features-1.4.md | 151
> +++++++++++++++++++++++++++++++++
>  1 file changed, 151 insertions(+)
>=20
> diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4=
.md
> index cb72442..78bb3d2 100644
> --- a/net-workstream/features-1.4.md
> +++ b/net-workstream/features-1.4.md
> @@ -9,6 +9,7 @@ together is desired while updating the virtio net interfa=
ce.
>  1. Device counters visible to the driver  2. Low latency tx and rx virtq=
ueues for
> PCI transport  3. Virtqueue notification coalescing re-arming support
> +4  Virtqueue receive flow filters (RFF)
>=20
>  # 3. Requirements
>  ## 3.1 Device counters
> @@ -183,3 +184,153 @@ struct vnet_rx_completion {
>     notifications until the driver rearms the notifications of the virtqu=
eue.
>  2. When the driver rearms the notification of the virtqueue, the device
>     to notify again if notification coalescing conditions are met.
> +
> +## 3.4 Virtqueue receive flow filters (RFF) 0. Design goal:
> +   To filter and/or to steer packet based on specific pattern match to a
> +   specific destination to support application/networking stack driven r=
eceive
> +   processing.
> +1. Two use cases are: to support Linux netdev set_rxnfc() for
> ETHTOOL_SRXCLSRLINS
> +   and to support netdev feature NETIF_F_NTUPLE aka ARFS.
> +
> +### 3.4.1 control path
> +1. The number of flow filter operations/sec can range from 100k/sec to
> 1M/sec
> +   or even more. Hence flow filter operations must be done over a queuei=
ng
> +   interface using one or more queues.
> +2. The device should be able to expose one or more supported flow filter
> queue
> +   count and its start vq index to the driver.
> +3. As each device may be operating for different performance characteris=
tic,
> +   start vq index and count may be different for each device. Secondly, =
it is
> +   inefficient for device to provide flow filters capabilities via a con=
fig space
> +   region. Hence, the device should be able to share these attributes us=
ing
> +   dma interface, instead of transport registers.
> +4. Since flow filters are enabled much later in the driver life cycle, d=
river
> +   will likely create these queues when flow filters are enabled.
> +5. Flow filter operations are often accelerated by device in a hardware.=
 Ability
> +   to handle them on a queue other than control vq is desired. This achi=
eves
> near
> +   zero modifications to existing implementations to add new operations =
on
> new
> +   purpose built queues (similar to transmit and receive queue).
> +   Therefore, when flow filter queues are supported, it is strongly
> recommended
> +   to use it, when flow filter queues are not supported, if the device s=
upport
> +   it using cvq, driver should be able to use over cvq.

Rephase is like below.
0. Flow filter queues and flow filter commands on cvq are mutually exclusiv=
e.

1. When flow queues are supported, driver should create flow filter queues =
and use it.=20
(Since cvq is not enabled for flow filters, any flow filter command coming =
on cvq must fail).

2. If driver wants to use flow filters over cvq, driver must explicitly ena=
ble flow filters on cvq via a command, when it is enabled on the cvq driver=
 cannot use flow filter queues.
This eliminates any synchronization needed by the device among different ty=
pes of queues.


> +6. The filter masks are optional; the device should be able to expose if=
 it
> +   support filter masks.
> +7. The driver may want to have priority among group of flow entries; to
> facilitate
> +   the device support grouping flow filter entries by a notion of a flow=
 group.
> +   Each flow group defines priority in processing flow.
> +8. The driver and group owner driver should be able to query supported
> device
> +   limits for the receive flow filters.
> +
> +### 3.4.2 flow operations path
> +1. The driver should be able to define a receive packet match criteria, =
an
> +   action and a destination for a packet. For example, an ipv4 packet wi=
th a
> +   multicast address to be steered to the receive vq 0. The second examp=
le is
> +   ipv4, tcp packet matching a specified IP address and tcp port tuple t=
o
> +   be steered to receive vq 10.
> +2. The match criteria should include exact tuple fields well-defined suc=
h as
> mac
> +   address, IP addresses, tcp/udp ports, etc.
> +3. The match criteria should also optionally include the field mask.
> +5. Action includes (a) dropping or (b) forwarding the packet.
> +6. Destination is a receive virtqueue index.
> +7. Receive packet processing chain is:
> +   a. filters programmed using cvq commands VIRTIO_NET_CTRL_RX,
> +      VIRTIO_NET_CTRL_MAC and VIRTIO_NET_CTRL_VLAN.
> +   b. filters programmed using RFF functiionality.
> +   c. filters programmed using RSS VIRTIO_NET_CTRL_MQ_RSS_CONFIG
> command.
> +   Whichever filtering and steering functionality is enabled, they are a=
pplied
> +   in the above order.
> +9. If multiple entries are programmed which has overlapping filtering at=
tributes
> +   for a received packet, the driver to define the location/priority of =
the entry.
> +10. The filter entries are usually short in size of few tens of bytes,
> +   for example IPv6 + TCP tuple would be 36 bytes, and ops/sec rate is
> +   high, hence supplying fields inside the queue descriptor is preferred=
 for
> +   up to a certain fixed size, say 96 bytes.
> +11. A flow filter entry consists of (a) match criteria, (b) action,
> +    (c) destination and (d) a unique 32 bit flow id, all supplied by the
> +    driver.
> +12. The driver should be able to query and delete flow filter entry by t=
he
> +    the device by the flow id.
> +
> +### 3.4.3 interface example
> +
> +1. Flow filter capabilities to query using a DMA interface such as cvq
> +using two different commands.
> +
> +```
> +/* command 1 */
> +struct flow_filter_capabilities {
> +	le16 start_vq_index;
> +	le16 num_flow_filter_vqs;
> +	le16 max_flow_groups;
> +	le16 max_group_priorities; /* max priorities of the group */
> +	le32 max_flow_filters_per_group;
> +	le32 max_flow_filters; /* max flow_id in add/del
> +				* is equal =3D max_flow_filters - 1.
> +				*/
> +	u8 max_priorities_per_group;
> +};
> +
> +/* command 2 */
> +struct flow_filter_fields_support_mask {
> +	le64 supported_packet_field_mask_bmap[1];
> +};
Explain this bitmap that it indicates well known packet field such as src m=
ac, dest ip, etc.

Also expose it on AQ command so that live migration flow/provision flow can=
 decide which device to use.

> +
> +```
> +
> +2. Group add/delete cvq commands:
> +```
> +
> +struct virtio_net_rff_group_add {
> +	le16 priority;
> +	le16 group_id;
> +};
> +
> +
> +struct virtio_net_rff_group_delete {
> +	le16 group_id;
> +
> +```
> +
> +3. Flow filter entry add/modify, delete over flow vq:
> +
> +```
> +struct virtio_net_rff_add_modify {
> +	u8 flow_op;
> +	u8 padding;
> +	u16 group_id;
> +	le32 flow_id;
> +	struct match_criteria mc;
> +	struct destination dest;
> +	struct action action;
> +
> +	struct match_criteria mask;	/* optional */
> +};
> +
> +struct virtio_net_rff_delete {
> +	u8 flow_op;
> +	u8 padding[3];
> +	le32 flow_id;
> +};
> +
> +```
> +
> +4. Flow filter commands over cvq:
> +
> +```
> +
> +struct virtio_net_rff_cmd {
> +	u8 class; /* RFF class */
> +	u8 commands; /* RFF cmd =3D A */
> +	u8 command-specific-data[]; /* contains struct
> virtio_net_rff_add_modify or
> +				     * struct virtio_net_rff_delete
> +                                     */ };
> +
> +```
> +
> +### 3.4.4 For incremental future
> +a. Driver should be able to specify a specific packet byte offset, numbe=
r
> +   of bytes and mask as math criteria.
> +b. Support RSS context, in addition to a specific RQ.
> +c. If/when virtio switch object is implemented, support ingress/egress f=
low
> +   filters at the switch port level.
> --
> 2.26.2


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

