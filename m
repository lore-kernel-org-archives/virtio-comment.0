Return-Path: <virtio-comment-return-7217-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3120AEE4993
	for <virtio-comment@archiver.kernel.org>; Tue, 22 Aug 2023 07:41:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5F9063309D
	for <virtio-comment@archiver.kernel.org>; Tue, 22 Aug 2023 07:41:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 449F9986378
	for <virtio-comment@archiver.kernel.org>; Tue, 22 Aug 2023 07:41:50 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 31920983FE6; Tue, 22 Aug 2023 07:41:50 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2021C986351;
	Tue, 22 Aug 2023 07:41:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OR/uAJ3hmeulwinWwg5zHY1YWIP+yYJOzCDbeZcZKgcXEQ0uKhxg6M7eljx/dA7p4eYsVuH2VPaOvq3eZSYk1JeUzdBnXsBrjAOpAlVDj5jeyS5/xa8lcuTBdQer1NtUL/Sc1rQvs70HSf+L1aidMBaYbD8dZBIS5B+1FzNVtxhryhlQkiRnrMpM67X1as4X50lPCrIqjf3l0I2z3vmooRTBcOjFHT4i2dMhq8x3O+WpxCCgrKJkKJwmyywIr+tLFwl1i12X5kVLdPolRTgW0JEDlkce0yNQGFKlSxeP7kCW9rG1JOSxyKQo5kP6JjfPh+sTnEwkqo2XmJZusegh4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=56Ds4I8u+g8lvKuvrWIFbne6M5lcR6GZqHpXqLaBbRo=;
 b=N1tW77+DFGO9176XrXU3tEallGlld+Mutkpk2XamZ4KpuB0Z55SubE1TGuldtIhx7cVnLcuqWJvMQhj1o9UJlrQVGFW3qryA4jIg2M3fOmy079Nee/dUSPYX1/cCrjxkI+5fPa8mTNIJ+b20Rzsz6HqiHW8MvUfz9WuCrz++v8kTcevtskicfrYFUWROcEe7ANeHlmz0OjqMHMfHJt+ITZgQ7jm1YRzGkNVaMy5cv8i70N7OCWi92dneISMwzctXYFEQvSzLloxDP+CznjCoyKhZ7AJWPRqLFX1lBUWsepK0PSSlIx489WT5rZBzMATfHgJtGdOgiJItgmwUjB9mVQ==
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
Thread-Topic: [PATCH requirements v5 5/7] net-features: Add n-tuple receive
 flow filters requirements
Thread-Index: AQHZ0Y2Q89x8De6abk+ghYyGBDRkkq/19FYQ
Date: Tue, 22 Aug 2023 07:41:46 +0000
Message-ID:
 <PH0PR12MB5481D08DC898413FD54BD2F0DC1FA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230818043557.496964-1-parav@nvidia.com>
 <20230818043557.496964-6-parav@nvidia.com>
In-Reply-To: <20230818043557.496964-6-parav@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|MW3PR12MB4523:EE_
x-ms-office365-filtering-correlation-id: 99ceb39c-cc2b-4d93-b015-08dba2e33d2a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 EDdZRZj7xEuZRck0zgrpJNZ0oYpi9KgobBsnCTSgW4SC7tUYle/CAykytvtyYKvgeRY/UVlhoEkyzoQyepJjcHGjSaKJufVXnaX1tmP3c4QTSJMTM6rgdsP7z7vkAQ7muhfunI9LSvwRVIlKTeBvFlujY18ZiIpKZQyUdieVzBuec8paV1E9isswZfTCCvYnlzECO0CrAig5i9j9pqkMOjWIcBwn5nbPupn/wSB+x3IGFfATq0+HuvoyeNNQa3Gw4QVdAAuutTZWDUeIq1r+hxqWBxXo5T2rkRSAGnAr4wf/Z0mx2ISv4LWGPipDzoGOfnWFIqK2v2eA0hwKromVa6tatBaLOcGA6VQ7wuli+nxRcayQBL8Smk29VV6M95p+NGRJiwUQO6F4nKIlppKegWLOv/angPcjdXZ6kcR2I7zk9xPYZKo922gC8oybOw8KYgGdgIhD50GVNys3Cjz7FC7yDfjYV+13+chY13gQ+ZmS5Bwpoq4xBTc6iH1z/OTva21os/vuOrLB14a6YHkeg7hrkAq8DHRyADZZBhtNYu/QYikbQukY10FGbi/QK33tAFFArzh4KKV8S4BBXaY+MlxWViWQBJehMrv9E0V093ZeQYNTEQ7YTcenCUFWIYG7
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(39860400002)(346002)(376002)(366004)(1800799009)(186009)(451199024)(54906003)(66446008)(76116006)(66476007)(66556008)(64756008)(316002)(66946007)(9686003)(110136005)(8676002)(8936002)(4326008)(41300700001)(122000001)(478600001)(55016003)(71200400001)(38070700005)(38100700002)(55236004)(6506007)(83380400001)(2906002)(86362001)(7696005)(5660300002)(33656002)(26005)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?m2HCkGQpqdt0MlaIbe0JLc8SP1mxDljkhgcHm6FzjzAYGrbQrTit4IvIFop6?=
 =?us-ascii?Q?qBuT+o45Pih2+f5T1oLQ/vFOU8j3wD9aQc52pX9wf775qvKPH8q4DExL7eqR?=
 =?us-ascii?Q?+gnawjJ2BeWuSmCimbwU7begZC5kOM4jN1j+M5nV40eVMrV8q2Hlw27CxjUj?=
 =?us-ascii?Q?J3q8VBK/HYXgshLJMtRP/breeYkygr96yGqCNH5aqBm4g7SfsUJT/0tYegbg?=
 =?us-ascii?Q?ZFBX+a8sF41QdKRBLjomaX2PtpemJ5/9rNQmO9N6rWnpZBV7SJaBF1MV6RCQ?=
 =?us-ascii?Q?0UkTXhVKbh7Pk7v3+IgMpFH9/FU7/2e7xvO56DK2iN0e2dzH7sQbFqXoVGum?=
 =?us-ascii?Q?neL/UTKe3LbXshXsaYvkogVvFt/7rad4liqarQZWWZpKG/FaIAm4mxDym54E?=
 =?us-ascii?Q?ABK/keiZV7ueo3LRl1ZNUADaj4nAe9jHZf/XTrAuJHM7RPNoVSJs9rFuySx4?=
 =?us-ascii?Q?vzcQe83JQh5uP2mkFDt9qd7qlNDuzIE2VeK14+3vJPetxf9sDQjzlRK+rPhr?=
 =?us-ascii?Q?fv+h5+3AA7kVAfBJDB12LdaMFua+GKyRpl760zHs8RWFpxcSg6pUleBNmZVx?=
 =?us-ascii?Q?kUOOtKWf3fmO6kzhtQ+BC7SDVDRZW+inneUd/WgRviPANAIMqDsJB1AGkF7u?=
 =?us-ascii?Q?+uiR5BYAVWSCr1AuOK9f2DL/OOs0piqlsWEFi+jrsZZh3U4h5D7DLgkRCWON?=
 =?us-ascii?Q?BBe2/I6a9n6EP6IyIUgM6vHY7tW5++CijY4dY4wTpD0CnE6DH/CFgM2yrMB+?=
 =?us-ascii?Q?R8+Xmt6dZ0i4xOKS7N+TLlgjy0IXmQKsGYmSo3XM6jsIK6Lvbk78iklJOUn+?=
 =?us-ascii?Q?Qi7Yo6KFAWBQ3ZhTbn2+/FrvboIWXP/o/4N3fQqfTLnWiKFd1j4/VWGEK1N1?=
 =?us-ascii?Q?mza/pO1ruTuqw3xeguOIZTqxd7rnAaQ8qB5XKTsSn2OUxtyl5Kbltjn0g3np?=
 =?us-ascii?Q?NxNcrXT9c8UTYIhga9g19njEI+LhUwGDRgRCdOjjfRSkqdqNIEIau8ohU7ym?=
 =?us-ascii?Q?TG9aBuVYaaJdxMjek88QzPauxsuUxfzDlXodRNwUwqB+Gtkkk66v3lKvTo19?=
 =?us-ascii?Q?L4mdEsKMZGH6f07EBUXUvAWILHuEgkKKHLbQ37rOyaqW3ztYuSWZlezJiggX?=
 =?us-ascii?Q?RsSHjFyTe7YP9voy4vUSacHlMvK1ceQf14A/l6hl2in1oYPsiG51nvAwIZ01?=
 =?us-ascii?Q?fKzg+Q6XE7EKxxBnRasPJiXVVTAxMWXQOzeOFRjWqJvPUg2tHI8yBq2+aP6m?=
 =?us-ascii?Q?FI9RQ7qaOeSbZtodGYUdXRcSm5A4Z01GItHV34V/e9h/yoZNw3WrroV0zMPk?=
 =?us-ascii?Q?aCJCyO3jZZ2hL/x2MITsE4EhDZFvzr7F5P5mf195SWKxKAW8bqZun+eeEa9+?=
 =?us-ascii?Q?RrMjj3CBY33pnkYF5GjLCVns12KazoxLS9mBJPUhFcLsw/IRzgryogIC8ZG4?=
 =?us-ascii?Q?LknYIsYiS6V1nlh2qi0tvesPjNouPb1jCHbOTAPdNJozePItRr9q0A4TcMn6?=
 =?us-ascii?Q?XEQ/4WrvOrGjEYT75EFARSQ0+mLuOPd6Nsf7ipPVcz3nRJXAdsllGfVijEVv?=
 =?us-ascii?Q?wqhzF/acuiDnRHMLFsg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99ceb39c-cc2b-4d93-b015-08dba2e33d2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2023 07:41:46.9998
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kx32xFeaEwmIhhFAIUfX/1aSm6zbKxvJzfgBeTw7M+TvE1UzTCtGl41n8pfa4p3oQDSMbPGEFmmNohCibHLG4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4523
Subject: [virtio-comment] RE: [PATCH requirements v5 5/7] net-features: Add n-tuple receive
 flow filters requirements

Hi Michael, Jason,

> From: Parav Pandit <parav@nvidia.com>
> Sent: Friday, August 18, 2023 10:06 AM
>=20
> Add virtio net device requirements for receive flow filters.
>=20
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> Signed-off-by: Satananda Burla <sburla@marvell.com>
> Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> ---
> changelog:
> v4->v5:
> - Rewrote cvq and flow filter vq mutual exclusive text
> - added cvq command to enable flow filters on cvq
> - made commands more refined for priority, opcode and more
> - Addressed comments from Heng
> - restructured interface commands

[..]

We will be drafting the spec part for this patch which is far mature than o=
ther requirements.
It has undergone many rounds of reviews and discussions.
Do you have any more comments?
We do not want to discuss the requirements again during the spec review.
So if you have comments, please ask now.


> ---
>  net-workstream/features-1.4.md | 163
> +++++++++++++++++++++++++++++++++
>  1 file changed, 163 insertions(+)
>=20
> diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4=
.md
> index 72b4132..330949c 100644
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
> @@ -181,3 +182,165 @@ struct vnet_rx_completion {
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
> +   purpose built queues (similar to transmit and receive queue). Some de=
vices
> +   may not support flow filter queues and may want to support flow filte=
r
> operations
> +   over existing cvq, this gives the ability to utilize an existing cvq.
> +   Therefore,
> +   a. Flow filter queues and flow filter commands on cvq are mutually ex=
clusive.
> +   b. When flow filter queues are supported, the driver should use the f=
low
> filter
> +      queues flow filter operations.
> +      (Since cvq is not enabled for flow filters, any flow filter comman=
d coming
> +      on cvq must fail).
> +   c. If driver wants to use flow filters over cvq, driver must explicit=
ly
> +      enable flow filters on cvq via a command, when it is enabled on th=
e cvq
> +      driver cannot use flow filter queues. This eliminates any synchron=
ization
> +      needed by the device among different types of queues.
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
> +9. Query the flow filter capabilities of the member device by the owner =
device
> +   using administrative command.
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
> +4. Action includes (a) dropping or (b) forwarding the packet.
> +5. Destination is a receive virtqueue index.
> +6. Receive packet processing chain is:
> +   a. filters programmed using cvq commands VIRTIO_NET_CTRL_RX,
> +      VIRTIO_NET_CTRL_MAC and VIRTIO_NET_CTRL_VLAN.
> +   b. filters programmed using RFF functiionality.
> +   c. filters programmed using RSS VIRTIO_NET_CTRL_MQ_RSS_CONFIG
> command.
> +   Whichever filtering and steering functionality is enabled, they are a=
pplied
> +   in the above order.
> +7. If multiple entries are programmed which has overlapping filtering at=
tributes
> +   for a received packet, the driver to define the location/priority of =
the entry.
> +8. The filter entries are usually short in size of few tens of bytes,
> +   for example IPv6 + TCP tuple would be 36 bytes, and ops/sec rate is
> +   high, hence supplying fields inside the queue descriptor is preferred=
 for
> +   up to a certain fixed size, say 96 bytes.
> +9. A flow filter entry consists of (a) match criteria, (b) action,
> +    (c) destination and (d) a unique 32 bit flow id, all supplied by the
> +    driver.
> +10. The driver should be able to query and delete flow filter entry
> +    by the flow id.
> +
> +### 3.4.3 interface example
> +
> +1. Flow filter capabilities to query using a DMA interface such as cvq
> +using two different commands.
> +
> +```
> +struct virtio_net_rff_cmd {
> +	u8 class; /* RFF class */
> +	u8 commands; /* 0 =3D query cap
> +		      * 1 =3D query packet fields mask
> +		      * 2 =3D enable flow filter operations over cvq
> +		      * 3 =3D add flow group
> +		      * 4 =3D del flow group
> +		      * 5 =3D flow filter op.
> +		      */
> +	u8 command-specific-data[];
> +};
> +
> +/* command 1 (query) */
> +struct flow_filter_capabilities {
> +	le16 start_vq_index;
> +	le16 num_flow_filter_vqs;
> +	le16 max_flow_groups; /* valid group id =3D max_flow_groups - 1 */
> +	le16 max_group_priorities; /* max priorities of the group */
> +	le32 max_flow_filters_per_group;
> +	le32 max_flow_filters; /* max flow_id in add/del
> +				* is equal =3D max_flow_filters - 1.
> +				*/
> +	u8 max_priorities_per_group;
> +	u8 cvq_supports_flow_filters_ops;
> +};
> +
> +/* command 2 (query packet field masks) */ struct
> +flow_filter_fields_support_mask {
> +	le64 supported_packet_field_mask_bmap[1];
> +};
> +
> +```
> +
> +2. Group add/delete cvq commands:
> +
> +```
> +/* command 3 */
> +struct virtio_net_rff_group_add {
> +	le16 priority;	/* higher the value, higher priority */
> +	le16 group_id;
> +};
> +
> +
> +/* command 4 */
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
> +	u8 priority;	/* higher the value, higher priority */
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

