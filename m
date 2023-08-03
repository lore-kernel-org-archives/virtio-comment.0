Return-Path: <virtio-comment-return-6984-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEEBCC0015E
	for <virtio-comment@archiver.kernel.org>; Thu,  3 Aug 2023 09:59:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E7E4342B45
	for <virtio-comment@archiver.kernel.org>; Thu,  3 Aug 2023 09:59:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D6AD69866D7
	for <virtio-comment@archiver.kernel.org>; Thu,  3 Aug 2023 09:59:57 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C76979866AE; Thu,  3 Aug 2023 09:59:57 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B0BD29866B1;
	Thu,  3 Aug 2023 09:59:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bMZYI1bx6e53V/wce8FYtsmGXhOC+WQ/ysy7JS06ybZnydwFxp/A49vTK3JDNtk/b4qnk17uI/o5zatdDKs1fa+Moat6Nyms0T9D/+X8ZKxkmTOY2lAg8n4Gf9xiB7d1jqn1vb2wrgbo9/jJrcrZK9oNYHgHpKNg+tlP4WQ0CSxotxcBNQBlOEq7V4azDTa3lFyVAvapGO4QGKgDbNRWnIOOPxae9BMdA29yH54JpvMYKXfmtWwgmSq7Crih4HDJUvId8QHQj1xEZWX+H9D2QGOFYSI3aFUWi7/C0LIlWpQm5HmKK0vTM0YzxK8RpfSjd2yJZOPJOO1tWq/NOt3v5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jXRqJikkyaZoocMVXQSRjehxi76gkpGH2bbpXqzuXQM=;
 b=fazFqpmCzTRj0wRnzgXWYYI7zCIdhyxlGyd9r3baaglXpdCVK4lVEUZyG8rgeYpuqmr0DwxSBEYu2T+N30D+37cCLlSi8/C2nHAAaUpXSr+UDrbedVjfe6Vz5iaVs8qZlYAHoIrbB9pm07BikecIQSH+th10I1mlZ1z/6KQ3CAib2qtUCTnOmx+K1Nu2vd5tC0TYIFxsTt9HhzRLjCFe3lFvYb+j70U4aeDuavThpD581id5UbsE8FqIoF/9CgL/ajFx0uuRTffFh3l6mUSbDI/gCGP070E45iWfkjDS1yfvJ/QnirykdGaNy8fOlBZ+u8tWp99PFQ196tqhD+UC6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Heng Qi <hengqi@linux.alibaba.com>
CC: Satananda Burla <sburla@marvell.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>
Thread-Topic: [PATCH requirements 5/7] net-features: Add n-tuple receive flow
 filters requirements
Thread-Index: AQHZvd/S1zVkOCRsJ0eCMof906XE7a/XL16AgAEzr4A=
Date: Thu, 3 Aug 2023 09:59:54 +0000
Message-ID:
 <PH0PR12MB5481538EEC183EBE3FF16234DC08A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230724033421.249893-1-parav@nvidia.com>
 <20230724033421.249893-6-parav@nvidia.com>
 <20230802152525.GA13690@h68b04307.sqa.eu95>
In-Reply-To: <20230802152525.GA13690@h68b04307.sqa.eu95>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA1PR12MB6329:EE_
x-ms-office365-filtering-correlation-id: 0110d91f-787a-4a05-ac24-08db940862c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 CozB+QqKbfkAbwE8VKPmsl0RtdKRp5QV9JGTCEu6riKjqmO2hOn9J1W8CPaqJSXEaPzFs6NvVlXnRchqfG4pj9xN4OGIln+4yaXgksfDq9nbPxF2p5vKp+bxP4U7hyE+eyrBqMj4QbGTpezP1bbW0xTDLqV2C0OxYu4Uq49Uen4BikjDtzR416/diY+dLAEX4cH+EKKxRmj3f3aj8gh0taHza+UlpHIfuDNChvpYcTVo3YtV6ri9KbZuyHBI5rBKkBmzZmpZUmp4QEOsgk0vPfbLrU6qPxxlECZwD0c1Jo8TW4XDntMOXT4Np9IdpCEXZ5puE+qAohrJPBTadWJ/cjn7Zqws2VWCfZNuRMQAGbI5kTUEr3B5UfDXGc5OeDB3iDl7CrrKUKSxpKocEgwzh96rdgLVNPBGnWd4rHQXO+FDP7YwS21A2NQ6PHmABV7Gw6/9CIXSrG8fR1z4/ZMWGrRKHeY6L6Neit7BKU2XYxe2IFld+UgbwI3v4v4APm+Op3A2698yL3BIFfYwoElIaajPCQDpPlbT3C2ZQVEq9PXQwoLaCYKxF0JLHEV94X7ONVYfckWZCbUpo8tO7T7g6CYUsukx4KVYcB/9fLlqj2TQrPUyFJNJ08V0Z2d1LUkM
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(376002)(346002)(39860400002)(451199021)(6506007)(83380400001)(26005)(186003)(316002)(76116006)(2906002)(66946007)(4326008)(64756008)(66446008)(66476007)(66556008)(5660300002)(6916009)(41300700001)(8676002)(8936002)(7696005)(71200400001)(52536014)(9686003)(54906003)(478600001)(55016003)(38100700002)(122000001)(33656002)(86362001)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?SWrIEN06nvEzVcjFXs4Bmytj108XSqMkVruycuahESZT6Bvm3guSopdJIKi9?=
 =?us-ascii?Q?LuXhgvXHZ+4HCr0DccMd3nHYtrrQfKby245C2slYfqOS3s/x/kB0KqpZMywq?=
 =?us-ascii?Q?Q2g6Mwi4/DA0GLi5h0coHtFByAGBZ6vwJrsIq2i3m1eIsCmeVc8UYSc/sswG?=
 =?us-ascii?Q?lVB7gpFqnd4C67KCVvbKUqVciUFF43GTVcDeJ03wda+NhVOJdTCJitgJ7y/R?=
 =?us-ascii?Q?O5va9tM4TaB97um4EjP6UV1WT5OG60MC6OgQ3weFHC5YdT/2SjRKQdiOspE8?=
 =?us-ascii?Q?EuGWETXA609LYNigEjKWcTMp1mWD647APzm4CDEVVdwrTOTl9bz8nUuHJLXf?=
 =?us-ascii?Q?RpODPzxgxUUqDvPY9Bxp5R4zIq+sQEDWHpANscchs/igE2CRyfpFf+fvubzJ?=
 =?us-ascii?Q?NXAp0WwRf0zpoifrXBr77Qevdh5vByYZwLuRy/YWelXv0I8hBqH5yEvIi8tT?=
 =?us-ascii?Q?B/Xap+A+HqRD4BHMTrDrlMIsxlrdyDTVVfgnRY33GDTjMhiJM+aojcG1toT2?=
 =?us-ascii?Q?wz5ICZP6KLJiH+Rbr71/R31Jc9Zxpzj0yyzn8YyQ4hjF7qiWZPnP8klCQ0rZ?=
 =?us-ascii?Q?7dTgC3J+bEphMUis0FeoxSAveAxYVKdPxWSXJF53PTt1riwInIxkMVzuF5F4?=
 =?us-ascii?Q?HdHo1AL1WTBTldNDyMbAXyVjMmy9oVbNaATiFEWwP5P3oJYBGx7V4wFXYY4I?=
 =?us-ascii?Q?c7qExXJysZEGhCMOmD3eqh9nxJsyG8IT5C1sUUOiwrmCF7OsI/VHQN4f6S1N?=
 =?us-ascii?Q?oNIckkv039ADcXa6Sjlp2JQx/ZlTTnaefDwMQtXUo3Zr8Zv1akKEvB+w7GOf?=
 =?us-ascii?Q?ZGQa2Wblm/nvyTcRj8zC8AZ28BjdN/J5lIAUkjztfW2XhUhy9kAGacwcs5Nx?=
 =?us-ascii?Q?HplS2UKcoQjqb2qERxemGQ/VdaWOrLyMgeLYtBFX2CiSWFXQ397HZi8rnGKF?=
 =?us-ascii?Q?PKY7roskMBHXeFKWR8g7neY3nQvv33X/I6+kj0f7SkwabY6jKkRfnouKq8+N?=
 =?us-ascii?Q?TkADKGilfGspdZGS4DCKgCxNfqgI3kV5mHu14NG8r+Q+CUdVWr2yGGOvagrT?=
 =?us-ascii?Q?caaTqkvBP/aTjs1EOAZRVe+Ze1+VYelShHd84EdkSEtLOUzzyeGc2P88KEng?=
 =?us-ascii?Q?3PZihxPBBIDmMeHmQiETFNt/X3nfiLyE2U9hRn6EyUyJmKPsMtsTyPm+wbjd?=
 =?us-ascii?Q?dNXVmz5ebkoKyEtIETSKFKBPOQHEXbRJnwuAIm48WdS29CQE9KMnU8XMwYBE?=
 =?us-ascii?Q?H9g2KyY0tghddcubSCnB9iUWMflXBEzCasbsKvqKBYz7mJP67e2znC+ogq5H?=
 =?us-ascii?Q?ZUd5/J2Iusg2kHGGdOboGetyOCA1upIQZW/xReIDe111WL3Q+hYa4Ky85Ppi?=
 =?us-ascii?Q?H6vm9CHgQ+CgUuiFdzn+hQs9oeHOF/K8fgUAtkRxnX+rQNwilUBwDMB2AE/+?=
 =?us-ascii?Q?RibrFASDV9gkwz5xF71igEoB+D2FVj8MhRgIk3/IR8YShKx1punW2JjhuQ8R?=
 =?us-ascii?Q?USmPQBkovpWEmbr4RvfiVx6KRGLHVsd7LswAIuDbPuwdFHykIMNFYVbwyr2T?=
 =?us-ascii?Q?GuQu+kTTKmlxv2kdcXg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0110d91f-787a-4a05-ac24-08db940862c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2023 09:59:54.0198
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kblet4bJurHlTMM/BA0Pe4nUvybAtRtmbVNk3bqCl+n2YMKz+gXjT9Ly7CYZ1o5Lt2DrgayrifytBHfdQJYirg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6329
Subject: [virtio-comment] RE: [PATCH requirements 5/7] net-features: Add n-tuple receive flow
 filters requirements


> From: Heng Qi <hengqi@linux.alibaba.com>
> Sent: Wednesday, August 2, 2023 8:55 PM

> Hi, Parav. Sorry for not responding to this in time due to other things r=
ecently.
>=20
> Yes, RFF has two scenarios, set_rxnfc and ARFS, both of which will affect=
 the
> packet steering on the device side.
> I think manually configured rules should have higher priority than ARFS
> automatic configuration.
> This behavior is intuitive and consistent with other drivers. Therefore, =
the
> processing chain on a rx packet is:
> {mac,vlan,promisc rx filters} -> {set_rxnfc} -> {ARFS} -> {rss/hash confi=
g}.
>
Correct.
Within the RFF context, the priority among multiple RFF entries is governed=
 by the concept of group.
So above two users of the RFF will create two groups and assign priority to=
 it and achieve the desired processing order.
=20
> There are also priorities within set_rxnfc and ARFS respectively.
> 1. For set_rxnfc, which has the exact match and the mask match. Exact
> matches should have higher priority.
> Suppose there are two rules,
> 	rule1: {"tcpv4", "src-ip: 1.1.1.1"} -> rxq1
> 	rule2: {"tcpv4", "src-ip: 1.1.1.1", "dst-port: 8989"} -> rxq2 .For recie=
ved
> rx packets whose src-ip is 1.1.1.1, should match rule2 instead of rule1.
>=20
Yes. Driver should be able to set the priority within the group as well for=
 above scenario.

> The rules of set_rxnfc come from manual configuration, the number of thes=
e
> rules is small and we may not need group grouping for this. And ctrlq can=
 meet
> the configuration rate,
>=20
Yes, but having single interface for two use cases enables the device imple=
mentation to not build driver interface specific infra.
Both can be handled by unified interface.

> 2. For ARFS, which only has the exact match.
> For ARFS, since there is only one matching rule for a certain flow, so th=
ere is no
> need for group?
Groups are defining the priority between two types of rules.
Within ARFS domain we don't need group.

However instead of starting with only two limiting groups, it is better to =
have some flexibility for supporting multiple groups.
A device can device one/two or more groups.
So in future if a use case arise, interface wont be limiting to it.

> We may need different types of tables, such as UDPv4 flow table, TCPv4 fl=
ow
> table to speed up the lookup for differect flow types.
> Besides, the high rate and large number of configuration rules means that=
 we
> need flow vq.
>=20
Yes, I am not sure if those tables should be exposed to the driver.
Thinking that a device may be able to decide on table count which it may be=
 able to create.

> Therefore, although set_rxnfc and ARFS share a set of infrastructure, the=
re are
> still some differences, such as configuration rate and quantity. So do we=
 need
> add two features (VIRTIO_NET_F_RXNFC and VIRTIO_NET_F_ARFS) for
> set_rxnfc and ARFS respectively, and ARFS can choose flow vq?
Not really, as one interface can fullfil both the needs without attaching i=
t to a specific OS interface.

> In this way, is it more conducive to advancing the work of RFF (such as
> accelerating the advancement of set_rxnfc)?
>=20
Both the use cases are equally immediately usable so we can advance it easi=
ly using single interface now.

> > +
> > +### 3.4.1 control path
> > +1. The number of flow filter operations/sec can range from 100k/sec to
> 1M/sec
> > +   or even more. Hence flow filter operations must be done over a queu=
eing
> > +   interface using one or more queues.
>=20
> This is only for ARFS, for devices that only want to support set_rxnfc, t=
hey don't
> provide VIRTIO_NET_F_ARFS and consider implementing flow vq.
>=20
Well once the device implements flow vq, it will service both cases.
A simple device implementation who only case for RXNFC, can implement flowv=
q in semi-software serving very small number of req/sec.

> > +2. The device should be able to expose one or more supported flow filt=
er
> queue
> > +   count and its start vq index to the driver.
> > +3. As each device may be operating for different performance character=
istic,
> > +   start vq index and count may be different for each device. Secondly=
, it is
> > +   inefficient for device to provide flow filters capabilities via a c=
onfig space
> > +   region. Hence, the device should be able to share these attributes =
using
> > +   dma interface, instead of transport registers.
> > +4. Since flow filters are enabled much later in the driver life cycle,=
 driver
> > +   will likely create these queues when flow filters are enabled.
>=20
> I understand that the number of flow vqs is not reflected in
> max_virtqueue_pairs. And a new vq is created at runtime, is this supporte=
d in
> the existing virtio spec?
>=20
We are extending the virtio-spec now if it is not supported.
But yes, it is supported because max_virtqueue_pairs will not expose the co=
unt of flow_vq.
(similar to how we did the AQ).
And flowvq anyway is not _pair_ so we cannot expose there anyway.

> > +5. Flow filter operations are often accelerated by device in a hardwar=
e.
> Ability
> > +   to handle them on a queue other than control vq is desired. This ac=
hieves
> near
> > +   zero modifications to existing implementations to add new operation=
s on
> new
> > +   purpose built queues (similar to transmit and receive queue).
> > +6. The filter masks are optional; the device should be able to expose =
if it
> > +   support filter masks.
> > +7. The driver may want to have priority among group of flow entries; t=
o
> facilitate
> > +   the device support grouping flow filter entries by a notion of a gr=
oup. Each
> > +   group defines priority in processing flow.
> > +8. The driver and group owner driver should be able to query supported
> device
> > +   limits for the flow filter entries.
> > +
> > +### 3.4.2 flow operations path
> > +1. The driver should be able to define a receive packet match criteria=
, an
> > +   action and a destination for a packet.
>=20
> When the user does not specify a destination when configuring a rule, do =
we
> need a default destination?
>=20
I think we should not give such option to driver.
A human/end user may not have the destination, but driver should be able to=
 decide a predictable destination.

> > For example, an ipv4 packet with a
> > +   multicast address to be steered to the receive vq 0. The second exa=
mple is
> > +   ipv4, tcp packet matching a specified IP address and tcp port tuple=
 to
> > +   be steered to receive vq 10.
> > +2. The match criteria should include exact tuple fields well-defined s=
uch as
> mac
> > +   address, IP addresses, tcp/udp ports, etc.
> > +3. The match criteria should also optionally include the field mask.
> > +4. The match criteria may optionally also include specific packet byte=
 offset
> > +   pattern, match length, mask instead of RFC defined fields.
> > +   length, and matching pattern, which may not be defined in the stand=
ard
> RFC.
>=20
> Is there a description error here?
>=20
Didn't follow your comment. Do you mean there is an error in above descript=
ion?

> > +5. Action includes (a) dropping or (b) forwarding the packet.
> > +6. Destination is a receive virtqueue index.
>=20
> Since the concept of RSS context does not yet exist in the virtio spec.
> Did we say that we also support carrying RSS context information when
> negotiating the RFF feature? For example, RSS context configuration comma=
nds
> and structures, etc.
>=20
> Or support RSS context functionality as a separate feature in another thr=
ead?
>=20
Support RSS context as separate feature.

> A related point to consider is that when a user inserts a rule with an rs=
s context,
> the RSS context cannot be deleted, otherwise the device will cause undefi=
ned
> behavior.
>=20
Yes, for now we can keep rss context as separate feature.

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

