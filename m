Return-Path: <virtio-comment-return-7737-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB72CDB465
	for <virtio-comment@archiver.kernel.org>; Mon, 16 Oct 2023 16:35:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 61478749E6
	for <virtio-comment@archiver.kernel.org>; Mon, 16 Oct 2023 16:35:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 42C6B9865F0
	for <virtio-comment@archiver.kernel.org>; Mon, 16 Oct 2023 16:35:31 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 26B509865CE; Mon, 16 Oct 2023 16:35:31 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E42C29865D4
	for <virtio-comment@lists.oasis-open.org>; Mon, 16 Oct 2023 16:35:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fRlZg7qRxlkeMoKPrKpC8f4RHmQefNeg4exV0DXc4SJ6nIqpT6yv7ItTsaNd6iDywCb6w+bFxwFIb6myxi5IKO98SLLA3PGFH80UeU7UL0r+MjtVM/gihroelBHCzWwOKTBJmTBDqIuATv9v4CaggTN1RWz9onhBitnCdCZ9bYl+ANaSZ5vXpR0QYknv7cNJ8VgTPXbM074iVI839zjDU/yRY56Dv6oPp4qoOXY+jMYTYMhicQ18vqFZEfx+H1uIhavMFKIQTSNhQ9fnaLs2K6PI4ix4u2usIVt5kniY+7drceghf+QP6RCz1PcHgjpieM6S09wupDguBpHFAWw5jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sVweEhJ/rMiZGHbGkdFNaB4uftnsU1UYPueCiQFQSUg=;
 b=FSX2S4SmgnkAgeVRKKvh2e0uMu+uXEkJh+2fAbMTsPzBvmsZMHvtlDh0DOtyQGaSVm4ECL4S8KBoIFYF3k79+dc72i8pP4vDdNAa9wkF9X2xBO+JJ9skesfGa2uyNFbyoijZuZ785IsWBgyX9nvwjHGZBY/VjOTvL2LowwIf89X/tLAHT9JHfhdlWxmeZ86vU7oIisTtKpgdRcHimNOf3kVVLighFYwzJHaxD5Oa+F1OW2fV01n9eESXzd40Xi1JrFrhl0509P60vhnsEvf8mSF1YFoYOao+r98VXlRTjD31VBVtNsCdSy1Q481PqTWmUCvMT75vh8DAOjq+4aF1Gw==
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
Thread-Topic: [EXT] [PATCH v1 2/7] virtio-net: Add flow filter capabilities
 read commands
Thread-Index: AQHZ+N1EYjifVY5LmEKrNq2IBc4sN7BLkCqAgAEbAVA=
Date: Mon, 16 Oct 2023 16:35:24 +0000
Message-ID:
 <PH0PR12MB54812CAA944A5F3EA750A590DCD7A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231007051443.460148-1-parav@nvidia.com>
 <20231007051443.460148-3-parav@nvidia.com>
 <SJ0PR18MB447755CDD327B238B8013B11C3D0A@SJ0PR18MB4477.namprd18.prod.outlook.com>
In-Reply-To:
 <SJ0PR18MB447755CDD327B238B8013B11C3D0A@SJ0PR18MB4477.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SN7PR12MB8001:EE_
x-ms-office365-filtering-correlation-id: 2cf414d2-9e96-4c9a-61a3-08dbce65e5d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 CKY0W5K4DiaI1HA9EzxkXwzFko4O/0BVea/lnQzNoMR9QHkfwTOho1ze5B5PjbhZRHGp2jXZuzdXwEhznE3M1xTV+BzuUSNIwdVQd7greN0eA5geyYRd8Ugsa5cNUsbP6FDRzQDi4sQ/d8gVGMEj81eErvxUoBUiCKQRR1L0j1rt1du3Obxs174/or7dyNzz7M5b9rTdBe49+FNy1BBdwzB3CUa5qbRF2O540YcpBLGMNXNkFqI6dZ+23UxSVqkgqkmumQP9kADyFVwn9nJyZP2/NM3OE5o5icJd3tBbUS4EoIDFboEU9RX4Fy77e7XrU4930sWTeMQZ9AncpBpNgi+9enujpLkwmjV1v2gU2hCFRurBguzRQDvfIWBheLvmcz53Ib/CvRvx6extiRiy0MBKwj2AvS/nVZnzZq+u5UXA/gwSgGMSkkF7MSC4wuOxtm8NOBHBL+GO9OJ+KqDCF9uqeMgyDXfwTfcheA+LQzmqXXV3mZ2O3Hp2OVKcpzRzGpaIbdo/WWx8nUCGI6Q+1j01/EvM91iZ01nZ4/0ttN169HTVdxuKO1rTOz/9bvcE+HsVHj97qqmNsx0cPkD96zhDreYwyCu/QSAYdXlaKl09DbAAabFi/dQM6bKViYfy
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(366004)(396003)(136003)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(55016003)(26005)(38070700005)(9686003)(38100700002)(122000001)(66476007)(66446008)(64756008)(41300700001)(76116006)(66946007)(54906003)(66556008)(8676002)(4326008)(110136005)(316002)(8936002)(5660300002)(86362001)(33656002)(7696005)(52536014)(6506007)(4744005)(2906002)(478600001)(71200400001)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?yiehQe30jzLKTF8bQ2RfBuRHtYnssKvqZ76CutZHJcFC9foJiSV2GrfXkUb9?=
 =?us-ascii?Q?5ovE5jj5eNLZ8dfUkm3NQYU9aA22WUsh4s4wCoHbQRhp51fSj0iIIYWznM2v?=
 =?us-ascii?Q?V0Xq04oJ0wLWcB8Eq66y8PnmybW3Rq6eakh3Fbsnyx87vwxml5EMLayUEZyK?=
 =?us-ascii?Q?rwi9m0KQdBDHPEGbTUL5rrDll6WiKj1BHbqqf5Kc7qFr2w4N7gdyL3j+yOiz?=
 =?us-ascii?Q?inqL0pxdRk3tXzTdnF3O17kQYq6F9L2VwoHw9VVUhkPwxp3OEAkkk4bViDO5?=
 =?us-ascii?Q?uumVkZ0xnzD2+FizIjf6i+4yVkscFMECjufJTGg9lISr7SWLrLhLwFOnGY19?=
 =?us-ascii?Q?PeTNi/Wj2/ZqvzzPfGwZU7RxqFC7a+jP2Vutke44FN1gDbCNov+TdA+/gRI+?=
 =?us-ascii?Q?tNHLD5KnqeSmBcY+URJm3ltIl54HSRbJGMVaLLyal+BzlG4k+VV8f8OQNDCW?=
 =?us-ascii?Q?YIHLomMps1+LeS6Y6dfombx8YsS9SbnPbgTADlAx9Twd3kAsGdIGYQK5cF9e?=
 =?us-ascii?Q?8TZ+1YK+HGTKKJEUv/IRIVJyykGsER4PO8CN4nNd1arKq2GbBcMyyoOaZfT5?=
 =?us-ascii?Q?PY6GaO502Ux9YcaWJF0wDyOXEUj/8571V05gZzFUPHKbkx+kqiDM2KWR0hpA?=
 =?us-ascii?Q?CeCyflUBn4Go77eUMmfy8b35pVVn/vHRp1c4HGj6ARrtjMSA8K3kWwZSqk5b?=
 =?us-ascii?Q?js4MwEtWFF94KyOvEIDWO0hruKzAm7tQQY7mQ4+N07r57FfxqKPIsekl1vo4?=
 =?us-ascii?Q?FoYVwXD73mGcKo73398TEk5y7lFMOBy64OmCxMYrRypGE6+hBvC4lGJWzoHU?=
 =?us-ascii?Q?ggLMCRB9HW+Ex240he3vf6II4EsTeuP/q7XSoXb13aIb0fO3HToMte5HFCwj?=
 =?us-ascii?Q?1EGmeN73kG6OuzqCBsQ7pcoNPQspptQucIg3kV0NwD8Uw25WHCyBqWQu5ah6?=
 =?us-ascii?Q?RA6oNaXLcV1ZIgrjoA5vdLN8UuPkB4efUhC3jCzcNqnwhGWG3PzYXZxDEEON?=
 =?us-ascii?Q?JvU07QB4dBofQH1+lr1A509Sh1HscT9gVn+WSBRdhdVX3lGWLOWIZTE/ccll?=
 =?us-ascii?Q?t9SdOkxtxd95jBjIC5aYnyCmT22huqfMQNOob0NBF0KJL5DAn9wNhMffHto0?=
 =?us-ascii?Q?i0taX++r9Y0/6rKhcpb7T9XS6mt59NbmlZRBHYOVDSGrx7XlX0E2XWuISZql?=
 =?us-ascii?Q?XGB3el9GXY4k4EJ4jWKusLsEWnw1SkFItqo3AYEQRPHLzmGunRCRFv7qL1RL?=
 =?us-ascii?Q?0cjHpnEM0bOEA1TrszDvQOzeB1MjvMzUxaYBdrHNKCltNL3EFgXjWzxxZ4vU?=
 =?us-ascii?Q?NwaiUjOWFLDjFmhmvxw8zsZFkr0y8z5Ann98Qzxxxmld7MKYn5uOUj+bSj6e?=
 =?us-ascii?Q?u+gG7gZlMCaYdYWiZkRqmUCeXc3MUo5TZbCCG88S5MTqm95wVRMv6AWsSC4B?=
 =?us-ascii?Q?RLCG4La8E1nRS/qwviFWXTCrqWxq1iB7YCSLGftIJlauOJvxBB9G+vyNVswx?=
 =?us-ascii?Q?MMNQIjgJLLgztnmlVSAFYqtI1AYE9aPm745pMjM80Nfw6fTZYmZ9qBesVipe?=
 =?us-ascii?Q?IGPfBx4T+fnKiUrCxcQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cf414d2-9e96-4c9a-61a3-08dbce65e5d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2023 16:35:24.6031
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bHIOgfHKkPO35cjBx7qR6tJjMXxDoiIrfUt5T7O3zDY+Vtc9/TOaUpJx1FIZaPO8ORtzhIfDgb3StnwLKMmIiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8001
Subject: [virtio-comment] RE: [EXT] [PATCH v1 2/7] virtio-net: Add flow filter capabilities
 read commands



> From: Satananda Burla <sburla@marvell.com>
> Sent: Monday, October 16, 2023 5:10 AM
>=20
> Hi Parav
>=20
> > +For the \field{type} of VIRTIO_NET_FF_ETH_HDR, header fields are
> > +represented by a bitmap in \field{fields_bmap} are following:
> > +
> > +\begin{tabular}{|l|l|l|}
> > +\hline
> > +Bit & Name & Description \\
> > +\hline \hline
> > +0   & VIRTIO_NET_FF_DST_MAC & Destination MAC address in the packet  \=
\
> > +\hline
> > +1   & VIRTIO_NET_FF_SRC_MAC & Source MAC address in the packet \\
> > +\hline
> > +2   & VIRTIO_NET_FF_ETHER_TYPE & Ether type in the packet \\
> > +\hline
> > +\end{tabular}
> How about vlan ? if a filter selects ETHER_TYPE as vlan (0x8100), How to =
then
> match the vlanid ? I believe I mentioned this in last series as well.

I am sorry, I noticed now that I missed this comment in v0.
For VLAN, we need to add a new filter as FF_ETH_VLAN, that has implicit typ=
e of 0x8100, and match field, mask to have the value.
Shall we can do incrementally as new type?

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

