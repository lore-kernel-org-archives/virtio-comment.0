Return-Path: <virtio-comment-return-8631-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97315C07D5A
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 10:20:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B3C1C429DC
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 10:20:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 26BC6986669
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 10:20:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D3198986906; Mon, 27 Nov 2023 10:20:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E186298639C
	for <virtio-comment@lists.oasis-open.org>; Mon, 27 Nov 2023 10:19:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dATdh+TWsqUGA7B+MggUWF8P7oQ6y1q/Vghq4jc9FLoUdX/NZa2F48Lc5tuVy0EFoosXqcVie9DOOk7hEhdEQAHySFyLvNCTnsopru5Xgq8wxptuf63tuqZWu7dX8YDUmHqm81CcLqeyA7p5Vr4QfVc3TQIXA7eugq3/BOvcHTO0S39AlcGJCKSjBCBAppiGS9aW/8nzM1pHuWbUrNYYRO9CgICtvChPoCNcyTm8uHxMywj6ibUjFcJgcj9yYIHDHiKm8aGmjDvu8edaZSSht8uCh0djyKiWWprVLvhoWNjRs8xaZiYu4y4kI6h3lQClSYrJCTxNcaaYbSrmQkSznQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jyzGooRPqMucsmoSQUYKYfLQ9jSY89PloSM+fsHcKzY=;
 b=BrYb/o3Ox2r50x71oXRlie5gc3Jy5U7/wN97xwnc2NyTgPx5JOuWrfund5lxd3Of/1AWMEysS5m3hUSfwwADFwXrr5KuM3W9oq2bLruhCynHvnOcQtDzeElEst5Tc/XfTZB0PNOk/2J7g2C5P/YzVPPq6+yMQzXoWjn9tSq0daUUkzKdgWsKGUX1LMfHF7bZShkCeSS8r9wcYxIFeiF4e3+bVJjR6VRcqDi1zPi4/lNYH64WcUd1YrLDWi1b/y3jpXNh00sxB4e+YlK5awdSOiYEiv1w4IioKG2hfJJ6ut//RifowhwCuvoOVOIkomKkqOemPskqkHxpMIeTIgLiLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, "si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>, Heng Qi
	<hengqi@linux.alibaba.com>
Thread-Topic: [virtio-comment] Re: [PATCH v6 2/5] virtio-net: Add flow filter
 capabilities read commands
Thread-Index:
 AQHaE9L2DjdkCoB6dUewtbJsrpd4HbCGcWKAgAAAe3CAAA00AIACb1eAgAAArBCAABgnAIAAAHbggAAMmwCAAALhQIAAVVgAgASgprA=
Date: Mon, 27 Nov 2023 10:19:49 +0000
Message-ID:
 <PH0PR12MB548179FEF8CEFA3D509FF471DCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231110123853.2093309-3-parav@nvidia.com>
 <20231122084105-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481FF2A00B58060D9D69812DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231122094431-mutt-send-email-mst@kernel.org>
 <CACGkMEuEFsByRwTf_hAAZ+7-UuyYz-1wCP4vTpMAW6DbHQzVag@mail.gmail.com>
 <PH0PR12MB5481592754EE68E6F6A79EEEDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124002357-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54812482A68AC708A4E0764BDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124011125-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481437B4AA6C4CD4F1CED5BDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124062907-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231124062907-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DM6PR12MB4044:EE_
x-ms-office365-filtering-correlation-id: f0a9ffb3-17b0-4cf0-ea36-08dbef32634d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 7EMiKC6eQjzXWb7aX+dLIQymCBBK7sw/BrvR3+C+yhXzqweXsM88rJKjuUhYbkA7WV6ASSaWThih+HyZsupfvbBcoAQ6FhU1UM3odCGx5JDi/DhTNwACblx1TjH+K0eiaB3CSD9DkoWRUL9xYqYZi4EJTEJai86UegLTESKSBBSoLaCOtUcsOpW40s++DL8C1EmEuSMILmGqaJmVJ+WoycdGfKTSLC2njV3Z0eIyMZfKj6G54WaWstzph9ZYl4VNdl4c0+32elkVawLS5ECdeQ87/2M6P/BE4EdjAgt8Fhy47PCZOd9bNBqpAakJq3nJk4mHCmCeJmvQfy72FlzVoxj4FmqnFk/7fwuXk7DrcIZZZnt9IPnrv9Cv2s2i9Si96lmgAOAHn+1iw+lM1dTN2SBI92SDX1XD4uxh6yKU7YfyWTRyMSFEVd1aun7kCjRnhXK5yEr+C1F5xP1DkNSz3OyIXhyzCChi3vZWHok12D1MmR8axwLuK7DOmQGwfKNYDQjhZgwm7KSHR5zUOGzV/LqQq98uUTQOcLV40hJvT+auoD0PdLhe1bHdWaJJrTLKOuachxw+98yK23qK2zkT1Yiev89ZpJDWVTDSgsh44d9ClwBxE/M+J2eBEfLxJJCP
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(396003)(39860400002)(346002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(9686003)(55236004)(6506007)(478600001)(7696005)(71200400001)(83380400001)(2906002)(41300700001)(5660300002)(66946007)(76116006)(66446008)(54906003)(64756008)(66556008)(66476007)(6916009)(316002)(52536014)(4326008)(8936002)(8676002)(38100700002)(38070700009)(86362001)(122000001)(33656002)(55016003)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?32mxB0fecxNcGpiybYGp2m7y75/7NU062Bx5cIWcJeDsT5B+Qvwt+QmgPa5Z?=
 =?us-ascii?Q?s9dStGVXrxkKWgrQiZ1TiJFZJpq1MVI7jfsmrfgqpi9XIaM898TJ5vDWHo8Y?=
 =?us-ascii?Q?e/trjAIpaSrx3ztX1Tf8LT/Dlkujze0FIt+vZe81aseN+UvGgMaE5ZXCHvnL?=
 =?us-ascii?Q?qI8C26InpTua3xI31frgicMg2Yag2NcvOOYzIeYVpfEyBy32r6ZD9TvOaECR?=
 =?us-ascii?Q?l37OLRsOCkD3s93rhYummT4TtTAMtBLNhwYedd+dq5UNh9JsDtQy59yiHq4o?=
 =?us-ascii?Q?P9tEQm6b7X3+R6GZ61LTrMeC3t5nnc5LGSj2Vj0kp/QIuYY2y5Eg8kscUm4J?=
 =?us-ascii?Q?YluFMqZG6CXbVBDo0haop2Vfrlxvnae0eiM7NyGhLdByodQbHyqdotDNFN6m?=
 =?us-ascii?Q?Mc0a3zVG1LR5/drS7gF2Fl22vk4mewBkopMCjv8CQkpMNfAbeJfaq0+yHEQ/?=
 =?us-ascii?Q?Csc2ktKRWklc6P+yr6x1mOhd5jmdZ5fMRfpIk3nuc2QqLNRHuIqY0WxQ0MJ3?=
 =?us-ascii?Q?y1P6JRIYBAPmWKBr+c6i5778eAenbq2icfP5QfOW0k4Sjz19+wcDjEFyXz6c?=
 =?us-ascii?Q?k0q4CxOkZM9n4NJGZ4O/Yc/vuerjwxEtWXHNjWP4CqXGaNguO+nL7ALwLIFk?=
 =?us-ascii?Q?yj7Q6LqAfd0gexOHfvbOzDcAT/9nNs36nfLfkS3xUcJkcIsHpUcMuJORBDO+?=
 =?us-ascii?Q?BubhgZ1U/KH1VD5sa/jaLqX/kIqOUDAaCHjbrxViHQUlrJN66SV8ufGww5aO?=
 =?us-ascii?Q?98oT5p1zNXHo0dfpylyjYjcuraxiH8f0FzowGArsF6nQQsLjdPbkOWvUIH9q?=
 =?us-ascii?Q?piJJimu94LePQNj85T5pDVhAQi1bIy/NdwBCM6z+5tg4QgZH6O5NzSU+5tQL?=
 =?us-ascii?Q?wV72wmD8BgXmWH5XiOPbrCx/XyLu1Pv64eoDXdXgvsUfPPyiq9OrxfDlrivU?=
 =?us-ascii?Q?ltTiCwtwwYGUAdFQHeoKRjDpbvdGW7TOzzGAczaGGXA5JB21R/fOafCSJqj7?=
 =?us-ascii?Q?g0R7hCjJPJPQl12ZRxCNXRGYaUxuror8KUOUitL4L5KoHUGgrQj3lcgplmUo?=
 =?us-ascii?Q?ngXxFwOOkkWeh9AB/l6zukJU+slZ/kXZaN6R10F8HeobtPPdkwPQtZlUVC8Y?=
 =?us-ascii?Q?94u5RWW3hB/CRsbFWmVNN37Vn3qvW9R8q7ECsHWgsnRmIHEQ6E/3+cMfLdRr?=
 =?us-ascii?Q?oAiUGwb620jrnw99HcPNpiUjI+NF/7iQhjGTNVjFXf3R3/HGtOQVOfT7AMWq?=
 =?us-ascii?Q?AmSqBlz6WNdUWjv7y1FQj0mcQs0+U0r1q4FJjJ5i7z8W09v0Iy+9SBbpJfJj?=
 =?us-ascii?Q?W2WDEkkbNEmC9CbDlfgKH2/JgpPULZ4y+BOWClsKt7YUnd3pA9PiZvP0w1LW?=
 =?us-ascii?Q?zr/OEAezfgbl3N8gPTrj0Plq7/4uPu9EOa1b/Mef6+SgiGNo2zVy9iZTfO9T?=
 =?us-ascii?Q?Ns2VZaUMfIoyoBRobFK2wnZ7OFJzk7qkpq1ej1UPitDtd/yk+6BpDnu4J8le?=
 =?us-ascii?Q?3rC0PSQz+nQcMwhliPiIOHBmGUaQluKJGRUcz0MmE/7MrJ5KGpI6KmK95gg3?=
 =?us-ascii?Q?ac76MwBAzCKuTy1JUwc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0a9ffb3-17b0-4cf0-ea36-08dbef32634d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2023 10:19:49.6186
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PyHkrzbmXjO1F9t2svWUbtOIDy/yx+XnKuk1h3stxsiZDEgKT8xx6k8FjOX7DzxRlLpG05BNTKFWu5NGyvjGKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4044
Subject: RE: [virtio-comment] Re: [PATCH v6 2/5] virtio-net: Add flow filter
 capabilities read commands


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Friday, November 24, 2023 5:04 PM
>=20
> On Fri, Nov 24, 2023 at 06:31:03AM +0000, Parav Pandit wrote:
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Friday, November 24, 2023 11:48 AM
> > >
> > > On Fri, Nov 24, 2023 at 05:40:26AM +0000, Parav Pandit wrote:
> > > > > we
> > > > > strongly suggest that *drivers* support both old and new
> > > > > mechanism, and then *devices* will only implement what's required=
.
> > > > There are other examples in the same document that makes things
> > > > worst
> > > with old and new.
> > > >
> > > > Also there is literally no way to enforce that driver supports
> > > > both and new. It is just sounds like an excuse to force infinite
> > > > config space.
> > >
> > > There is a very simple method though.  We allow devices to expose a
> > > subset of features when DMA is not used. So drivers that want
> > > maximum features will always opt for DMA. We can also strongly
> > > recommend that all drivers support DMA if available.
> > Yeah, don't see how this is elegant at all with all mixed bits.
>=20
> It's elegant because simple low end devices can cheaply implement MMIO an=
d
> not worry about DMA.
>=20
It is not of much help in this case because any low end cheap device which =
want to support flow filter commands need to have CVQ anyway.
And hence reusing the same CVQ is more elegant that already does the DMA.

So CVQ is fulfilling all the below needs.
1. Single interface for the get/set config flow filters
2. DMA the data
3. Not have any partial issues
4. provides consistent structures that provisioning side will be able to us=
e

> > Nor do I see any enforcement, single method via cvq still holds strong.
>=20
> You don't need to enforce things, if people want to put a lot of RAM on d=
evice
> and put it in a register let them.
>=20
Not enforced. It uses the CVQ for flow group and flow filter life cycles an=
d for the sharing this config as well.
Also aligns with stats that rest also agreed on.

> >
> > >
> > >
> > >
> > > > The method proposed here is elegant and clearly promote one way to
> > > > do
> > > things for driver and device with predictability.
> > > >
> > >
> > > I don't see it as elegant at all. What is elegant is *a single tag*
> > > that describes each property of the device. And this single tag shoul=
d be
> good for everything:
> > > driver, provisioning, migration. And config space offset serves as su=
ch.
> > The single tag is the set of structures.
>=20
> I have no idea how this will work. If migration format i started reviewin=
g is
> anything to go by then there will be a huge elaborate structure nothing s=
ingle
> or simple. By comparison there's already a proposal how provisioning can
> work by supplying config space.
> it is just a clean model to grasp.
>=20
The provisioning model is simple is to supply all the configuration.
To draw parallels to some sw side,

There is per functionality socket option to set things, instead of one gian=
t structure.
There is per functionality ethtool option/cmd instead of Set ALL/get ALL en=
forcement.

> > Provisioning access them via owner device.
> > Member driver access them via CVQ or 1.2 legacy config space.
>=20


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

