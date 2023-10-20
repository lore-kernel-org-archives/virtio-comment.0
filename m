Return-Path: <virtio-comment-return-7884-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9911CC001DF
	for <virtio-comment@archiver.kernel.org>; Fri, 20 Oct 2023 12:35:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 11D012AC46
	for <virtio-comment@archiver.kernel.org>; Fri, 20 Oct 2023 12:35:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0875898693B
	for <virtio-comment@archiver.kernel.org>; Fri, 20 Oct 2023 12:35:52 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id F3D7698692F; Fri, 20 Oct 2023 12:35:51 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F37D0986930
	for <virtio-comment@lists.oasis-open.org>; Fri, 20 Oct 2023 12:35:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GfutbNtJOVdJYq//1r1kQ6+xJnW6oH+gQiG5XUPZsQqEQbnH6ewAv9CO/KAACd5qhzD1TxD5Ccwajtkrq8l5EMw8jKMd0/fia/lxH6gW3oDyRXIMrhxBEY9unfKiEXImlkxak54OAPNM+dUHzj18D70MLTGeq8kUGxUCLKhnYRwTauWUNC9UleKzeJVJa2cR0/GCFCIqkEQN94OGCgw45UkvwS84e5CvdKjoMzBg5CSYsbk4wSRLMpYkJYRafdS9zAqHqmvNAIPv6o/D21F7tw5tKRL50nYJIr7TZGjfcRx8JyR05VXllHdxZPu6l6gVvQRn5HSioBLhVZc11BmWpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBF32rjHEgF/OiQrLuAppwXai9UbnWO98in8hTdl95o=;
 b=AYOBDeZ8GzswTkXLEs3dSAtjalCLs4jaMQKfR6x8nyA6ZA44vHBoKljpEhtiz2qr5Wq2cmHRmy1Q3vXmahUluLFJswsZC5VYAkYbKAzBBMbKKUX1etuoA5kXcdmt3JqewrRLARuehusm0b/IB3HaSFw9aONy5gBCcJG3gj+qzdq2M5VGOKRjldLy+WnXJj4oKik+X7a6DQJyceIUk4t6+cRN/GgAAs54AYBSab2Eoxw8mRjDUGLre9wucbQEdPrrtFXjKGNDC1QYLCdsYv055RB11e6LcR1w/cDMlCkgo7rnEJhPfGW2hRPoxncaY5IofL0eqUKB4CxIaeSh3WYMvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Satananda Burla <sburla@marvell.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>
CC: Shahaf Shuler <shahafs@nvidia.com>, "si-wei.liu@oracle.com"
	<si-wei.liu@oracle.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, Heng Qi <hengqi@linux.alibaba.com>
Thread-Topic: [EXT] [PATCH v1 6/7] virtio-net: Add flow filter requests
Thread-Index: AQHZ+N1MZ+YnnYPgx0+DSL5JpcNf4rBLkDGAgAchrZA=
Date: Fri, 20 Oct 2023 12:35:24 +0000
Message-ID:
 <PH0PR12MB5481AB87022D65EFE390CB8FDCDBA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231007051443.460148-1-parav@nvidia.com>
 <20231007051443.460148-7-parav@nvidia.com>
 <SJ0PR18MB447766D1AD4EB868AFAB4F60C3D0A@SJ0PR18MB4477.namprd18.prod.outlook.com>
In-Reply-To:
 <SJ0PR18MB447766D1AD4EB868AFAB4F60C3D0A@SJ0PR18MB4477.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DS7PR12MB5885:EE_
x-ms-office365-filtering-correlation-id: 4f593c71-c9eb-400a-aa58-08dbd1690858
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 kv49rVN7x94fl/I3Cf46l9B/nk7tshmsu/y9Q5CCDoT0hBGvWFvYx5VrqZatctNx6WJ2x3E7M6t9ARdBCdlJaz6dv5AXB5AsE9hCQ3zOuSWiejW6NLcdJO9rXVI3gynmiSTw1NKzo6ZIw00L/jhY9wWxvkjXpNGDVgIsOQqqh2jdd2vx+63BRWBnHSX3e+6xtYYYz27q3eAkRpat+7pRs/H2LpxR9KEX3FSkXjiafwx1AgplPlcn54i263ZQzhUKdID+2bqkosQlMVt8/x4IGUZaeG+GYKcLsKFeWv93jCzCu1dCLHPVk2z+lLLZMPCctQk+vQtXH6nAnT+6C0TuNizOTUpc+pb6I+BRWfXRTyg7U5HCbHHQmxA5lFeH5Z6lGFNmcQKhrjuTQbUIgTDMyvPYATqCw9bGj63hjlZixqRQNSmb0G7ti2huyOHFvbF0dlnPUl73s4eu6N5t8UPXs1cbCpySuT0Usie7Rr1MzLWDNtUHvPJEDy0qplRNaLyaGNKUizEQQpZeB6RFW/7ORAZ5t70kFxlzBCe69FPcyGSIQhmpCNLqN7bPukHkHzCQMZKGqBGlO+QhGybLpf/KUjP7uNE1s266gzFYlG6Kgw3M07FWRIlZPyFQZSO3nQeid1WX2QbJP8bJ8dY4hS7euA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(346002)(136003)(366004)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(6506007)(71200400001)(966005)(7696005)(478600001)(26005)(110136005)(4744005)(66476007)(316002)(8676002)(66446008)(66946007)(54906003)(5660300002)(8936002)(4326008)(66556008)(52536014)(41300700001)(38100700002)(122000001)(2906002)(76116006)(9686003)(33656002)(86362001)(38070700009)(64756008)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?RxqvANvZ2oXDWnWwwYsU6quIqCBjTpKlqWRYhsYSER+U17Y/spn5VgS0Mq07?=
 =?us-ascii?Q?dj2+eVHucQ3IDzTl8aIwponU6oSGzfVsP7M0FCb8RTfJluXbbDIqJlzxo/Ck?=
 =?us-ascii?Q?0I6Ccpr6ankT7+ryIM2/3CpargS1/axuFEfXIa9Pj6RFiXyzfoLrE4eo52F3?=
 =?us-ascii?Q?zOrn0IG/OVZHFG86w4FBXfTBLeIUfzz7/jpvszSdumgILRa1Qt57hR0N+UPC?=
 =?us-ascii?Q?qBPk8OaPEZftrowyiGUU4i2DzZt754GepWTTaepnCSOn+mL/VmlEeK+CWU5t?=
 =?us-ascii?Q?VlrCkXibUrc4PyO39uKn/6e+BG9889QTR9Y1UGz5fkC06+JUoupyC8OCBdia?=
 =?us-ascii?Q?0ay3nHchumt/PFhATosIN+abL+FuySIufb8Y7iaT4YooDvFCFpmCruEYjCI6?=
 =?us-ascii?Q?eIha/4TdyiGV1k111fD9rozmiZP7BFScCXsCAVnJgrbQNPqVeDPY/yMFx9VB?=
 =?us-ascii?Q?V6MjB2kCXiG0jPN7kYbOBD7HnAN0dIusXg9EISTRXLEswJLu8AnLFS1m0dqk?=
 =?us-ascii?Q?GCovX0T1QXx1Y4pGw5WwOr3rfG9jh9GEWEC2I546lMs5Fe4KzL0UfH20J8yZ?=
 =?us-ascii?Q?7oaW7FVCKIU9pVVFmu3EAdDlU9OTO93bwlZ4PwzcTjs9vQUVdTL/9YeJ1cA8?=
 =?us-ascii?Q?c+fWI68YDdqfRAei3pnTIaPcEP53HQPcV4BTAyfUd116OvhvRMRfZ/YWXN3+?=
 =?us-ascii?Q?QDlsLXcs/WIAqAm5QcH/QOs0XvyZohJF4ly9W4eXKpE00WgtUJrntVmB254C?=
 =?us-ascii?Q?Q/LaW1J4ePCdfwSPuIH0DX+UopfNbAr0ShQP6OQnnULkmTLYKctuRnGDTdby?=
 =?us-ascii?Q?ZtZW0k5Qdz6KkkU6fy1KONTXiEfJIGcnWEBbvjxm2BENU3BYg5UCtuE68PMd?=
 =?us-ascii?Q?ZKKUDtCO9gMUgYW83Xpc6LXEfl5+DNjl7mP+dCXRbTUOKUTdhxqLzvPRmBBz?=
 =?us-ascii?Q?3CIgscPKfWdlvbCE/6BteAj/G/SXAfVHN0tUgpvEYx+cUEbB0uVXciCdQUji?=
 =?us-ascii?Q?X0uObUtylfsXyOBQduiNa87Zd7ipzEecE4eu7aWgaAGL1gJRQ7MUQdKW5LyR?=
 =?us-ascii?Q?FwPZrY+QmmRnYSlpzwZPZdU0r74i7fGdFFGSPzyukTIA8GCMQNiwRrGcY3VH?=
 =?us-ascii?Q?T3Z+XeZmOIpzXoRgJCdidElVpWI9qiw53VuF5Vd9WQ70dQrTLGwuV89iMnjL?=
 =?us-ascii?Q?xhsYsEPnfqRzrLxM64Gg6JYAJ29JtuxeYRsSKPy4Z0zRsrmNPxysqM81Brum?=
 =?us-ascii?Q?BIEimTdOIkbAZh2inTNLeqycuNmWQTEt2UVMOYJHlqR/383VPtewH9iE/JCU?=
 =?us-ascii?Q?pUx1SpPpKrnzELK8qpDrLXtK74zjnox9amT7+EHTdmT+hU55lRblyc7N9OVf?=
 =?us-ascii?Q?vFiBtalHseaj1RFUKdRVvsfIzkfIO3eFvJgvVe17pl/aWzirA9gCb70a8RDW?=
 =?us-ascii?Q?SXf/uFzuKnUI0f+F2AFseIDp1+RxYOCcqpdx7LwbPTT/GaeEZlB81UKw8EZC?=
 =?us-ascii?Q?/CtPbU3csXzys3tX6sAVBbbilDazvAn2CFNLvxlbCv0MWysqtfZ7RQewNO32?=
 =?us-ascii?Q?DBEMv4YVK/OA1geXIfQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f593c71-c9eb-400a-aa58-08dbd1690858
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2023 12:35:24.4650
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9cnfFKNSb4IpTrjzhv7+nceMVo9LUqY2g0pTGziD1L49btXRYxRwccrnHxQXnrguZh2cik4KpkbkCDee1maSig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5885
Subject: [virtio-comment] RE: [EXT] [PATCH v1 6/7] virtio-net: Add flow filter requests


> From: Satananda Burla <sburla@marvell.com>
> Sent: Monday, October 16, 2023 5:10 AM

> I think virtio_net_ff_dest and virtio_net_ff_action can be combined.
Done in v2.
> In fact, dest is only valid if action is forward. So, the additional fiel=
ds in
> virtio_net_ff_dest can be added to virtio_net_ff_action in a union and on=
ly
> interpreted if action type is forward.
> Also we would need support for multiple actions in future(tc flower) so w=
e may
> need to have an array of actions. Similar to
> https://elixir.bootlin.com/linux/latest/source/include/net/flow_offload.h=
#L328
Also done in v2.

Thanks, this was useful addition to future proof the tc filters.

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

