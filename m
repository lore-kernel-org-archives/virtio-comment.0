Return-Path: <virtio-comment-return-8648-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5804EC4167B
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 12:50:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A8D3AEEA17
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 12:50:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 78A7F9863AD
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 12:50:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 50E5398639C; Mon, 27 Nov 2023 12:50:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8ED679863A1
	for <virtio-comment@lists.oasis-open.org>; Mon, 27 Nov 2023 12:49:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QG4wHQxzKTekaRCmMsIi3VUhEf1MVUECN9FjMPfv6qm+ha7npo3zP/fdikYsw4oPlhPC23FFW53bv/5TSFYwn85HNfCJObEwoSXuyZkVCuPV7v0D1f8F6NIV9Is73rGh3bzm+rjck1PBHSwfU8xl52s0MZ42+X9sSXOBPjWbisOYWVbe2uVt62UsRibw3y/VkYmqCr4tPuDOtFB20S2nEHG4pctVWXgXarue29tB23GkhdLKaGbUpZOCMtT/X20TbAJM+caE85Wm3R1OQlcrih2MrNWxLQTpPXSYipBVYz6lkBr7k9Blu5w2zpi0a/700VeBhE58ojiZv4DPYyOtVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aD4lhZS6EhF56mvYW9qBE0KQGuMW6lFCm2yDjGfBUzo=;
 b=kMgPxwPWR0CwQaMozCNvXlRnIaMb03pkA1UakRpQ9vSbCgpftYKPqX9Dh9FkvotOKsOueQVny883WKuk/j36iD5C6xg6wvdeTau4pjeyHSJ1+HJxIdfQA4lI9rzCkkmKuFdD7IT0hyAjsPNuyIUU6qvzJgxM5+HY77PfoUT/yNQW2kqYR1QNYEYY96cVJchC7UkhPcqezo/C4Xe3jmDWIy6N68Q/2cYmU5AHOcy51emBCqvEe1ehLfaxtjr1db1GXRJesNwi+5Q+r5YGl5Yn+a0nvyMOv0ldw/+/wjPg3OCaHzWb9u6XF0CMQzsrTCu/bok1Fqfk6B9yzyVjDi/Txg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, "si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>, Heng Qi
	<hengqi@linux.alibaba.com>
Thread-Topic: [PATCH v7 2/5] virtio-net: Add flow filter capabilities read
 commands
Thread-Index:
 AQHaHe6IXCl5jgtp9E+7xZjgBxzICbCH8raAgABJqFCAAEiugIAAQZKwgAA0KACAAATDEIAAQqGAgASfUpCAACqxgIAAAEkggAAEngCAAAJGkIAADJ2AgAADL5A=
Date: Mon, 27 Nov 2023 12:49:35 +0000
Message-ID:
 <PH0PR12MB5481EDA1A7373B3C4DF71E26DCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231123174947-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481A6DFAEBD321707E31BDDDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124004105-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54818AFAE1E2B943C9104B59DCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124042824-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548126B6C07BFA6271020982DCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231127061203-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481E1567D7D27A9BF18D9ACDCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231127063810-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481FD7F68E535A99F51D36ADCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231127073045-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231127073045-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CY5PR12MB6297:EE_
x-ms-office365-filtering-correlation-id: 5f17292f-051e-414c-8740-08dbef474f92
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 liMWTrtMY6xmroHfWJdKeCbP9sJJ/+f1UBXWYroa6duWG4lm2F6QrcAkQo8zZpgRjMWVC3OL9PcJ5pxL2I7+x/uBaDCuLNWVXlmHkKUFy/v6tUgZZuxgmDNfegmgwlOybosw3nBcqWLuUQEtkTg602IwplIXHpkItOUvB/N3e0O/6sWKORLOZmtqrjImV7I+ijgtKs3fW2Ycf7EuriTQBQjD8xUE5G+x6/FoTXWcRlAE1ni8MQYYpymu6JRd5qbi4S0PYdJA+zB+FnxZnbPKiYVLFnWciT44cgv1cRyNA9Xv3DAAK19La9IrsYVbx42wVhMDcZNVwlpLn+ZQHT3XvxoQIR9vrREceC/Jh//JvNsJX0pIQFtaxlO0375fWvGQxGmq2/HjBgK0wuN/31Mhylg4BRBwrecUJd67M6YkViEtn6O2UnxyRX1F6hmkbwEmmJkAtF628nL24V/2NpdAym2pCmwOjVvvivNoLwgxg9A5OqHy0NZyKOhQWqkeQ4O28SJFHqj+RVxbciWA5d/ktIs9t4bTbOhxd4A9PxoREqvhO8ZfteRM6ppo5ubnzYzlDbINLtKbPAxoBuuNAYtw301cDswRVe2INBMkId7kbdb8Djkg6+2/y4GAjqDqlFpImcdumPCSWhTKCS6CuwQ1sMYvbSGz20FxDJ6qqVbFFEQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(396003)(346002)(366004)(136003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(5660300002)(2906002)(71200400001)(86362001)(7696005)(478600001)(55236004)(26005)(9686003)(316002)(66946007)(66556008)(66476007)(66446008)(54906003)(6916009)(64756008)(8676002)(4326008)(76116006)(8936002)(966005)(33656002)(6506007)(38100700002)(122000001)(83380400001)(38070700009)(52536014)(55016003)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?kWx1Jyk6MGLyJ/dqJaxG9FWhzRuDVtZjnH9C4WWlr1kwKk/J/Xzq2xgxYcpK?=
 =?us-ascii?Q?jSLtoRqm7Xm2d/9OW2SmEqrjqr5pG/RjgUok23+xy62lhcqfRcdhRsEZrWd0?=
 =?us-ascii?Q?CV8Y+J5CWLW0VQ1S1qMpNgbeuZLG/oZJ8GRRa/FvlwO1ODWKvZpejnm7H0lx?=
 =?us-ascii?Q?I2H+EQGqDqZ0p4UGcJOS6MoYHNZANBGPYvyq/nvcaQRhbKlUSdSDnpn3XbAH?=
 =?us-ascii?Q?5KQ72TkJ68evJWjXXVpOkhKMikSUssdr7dxv3NjFztTio6g4/X1053hm+gOe?=
 =?us-ascii?Q?EcU6YgRl3RVyhDONI8DWS7LWujfwL1PZiO11ZumlD2WA7Cb3FNRf3zKdc2m9?=
 =?us-ascii?Q?h5b5P+3WSrUmyAm5+LFXX5bCb/JOmp/HzST2EPWLr+fc0xjLMNwf62eYUNRq?=
 =?us-ascii?Q?C+2bXkwrvA++A5bDiaUvv89YutvCI2zxHsKUNwR1Uh0b7+8lpj2s49lrxVvT?=
 =?us-ascii?Q?qcIl5zSi+Mr/2NymWP1OMyYZCAJ3lLnsvE+NIJVGCd5e+zJrtX/yS6QUcSwM?=
 =?us-ascii?Q?VFMWy5vWKK+D65yc5nQbs6WYlJE9Z8QaUuN7nw+o206lm7by2saAEbGRTCaL?=
 =?us-ascii?Q?Ll7NTd37Gwn+NL+rapcULO+vjQX2wPU4ejni0p71ZwU7eYPJg8KjdGD/AXKn?=
 =?us-ascii?Q?tjlphO4K3wMOr/4NknSgjtSqSHi9APQviKjfpaRZljbNyk4v84Vt6q/NgpmN?=
 =?us-ascii?Q?kDX0QwJm2Wb92MFBKos8jvL9hOCvRojHbdYDZIL8oY/zT2192S1cfn2G0yC+?=
 =?us-ascii?Q?d/+owPR57bDF11CDt2+chxfKkfCNvp3eyf4obs+WX+wYIDCZsDQVULAjmoiH?=
 =?us-ascii?Q?5ROnL8vwKAY7W/Yy3QEJO/YOkP90h6G9RGEIWL1/LDkhYedkETQ7QLqQdFci?=
 =?us-ascii?Q?4eDeevnL68/fAhK74pYv0BH69wQmeW9GyrbBgBKLLaWGxy6BmjpCY32XXQ2H?=
 =?us-ascii?Q?Y9MwdzYfAO8uzM1CfYjFyya0K0ULeP9Umt2Uz7h3SrKB1KJSJTWzo95KlE7X?=
 =?us-ascii?Q?UUIVE0CentZVij5xbaZeZbsBChLRksmR3BBcjh90JHylwL79yMM2xHy/onaC?=
 =?us-ascii?Q?LbFrLGCRAK6SElShOY8i8NpZn0U1Qotoh/Yk6wPAJDyVAhPwIruWV6ZABkUU?=
 =?us-ascii?Q?hNn5FGXK4kRjRfMX37+Sby0vuOJTuCN8Mtvm0uoK+9hnWsFHoNDn5jczRSpe?=
 =?us-ascii?Q?SK3Vn/Lqi50FnuT5n7XVput4uCuxfyGr7zfx0s+yCH/Hc8dUeQfWXf1W710q?=
 =?us-ascii?Q?7Oi3F0USmt1Eqq+5SE5KHlApcB0hdNIvRJHz1YD+LLsI3NTXK77E+hA5WNC8?=
 =?us-ascii?Q?Kv08PxX85lE1c94CRfejuiuAKEYMj9LzlP5LyoNt8W/djMR4KCn4xiTE5UZG?=
 =?us-ascii?Q?I37J8cNtC+bwz7yMvAHCohEZ4brD96QQi2mFZ0n6TvGENqu4orPrsSI2NkXA?=
 =?us-ascii?Q?4OcSto5mkkQVB9HjZ1QPufVTBOOtjToFg49uVSqBhqOlY25zyrB6lea4Dls2?=
 =?us-ascii?Q?86QKf28Svwu4FtiGajFqK3fAYQW/PRy1mUfS4n8AnclqL0e3ipzb+RVsyxTR?=
 =?us-ascii?Q?A1yNRg2a7wxut3UgpW0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f17292f-051e-414c-8740-08dbef474f92
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2023 12:49:35.9517
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5f9smm8d9FBuGoDB7LfTZ7x9Ks/grP6FxS4StqTaCseW0meNQfmPsEfIBsUnufKC9Vv9sPrlRhyXhotcqFCJJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6297
Subject: [virtio-comment] RE: [PATCH v7 2/5] virtio-net: Add flow filter capabilities read
 commands


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Monday, November 27, 2023 6:03 PM
>=20
> On Mon, Nov 27, 2023 at 11:50:24AM +0000, Parav Pandit wrote:
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Monday, November 27, 2023 5:10 PM
> > >
> > > On Mon, Nov 27, 2023 at 11:33:45AM +0000, Parav Pandit wrote:
> > > >
> > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > Sent: Monday, November 27, 2023 4:53 PM
> > > > >
> > > > > On Mon, Nov 27, 2023 at 10:19:47AM +0000, Parav Pandit wrote:
> > > > > > > > > It appears that's not what you meant.
> > > > > > > > > I can try and guess what you meant but I'd rather have
> > > > > > > > > you rewrite this in a way that makes the meaning explicit=
.
> > > > > > > > >
> > > > > > > > If you insist, I can duplicate in driver requirements too.
> > > > > > > > >
> > > > > > > > > > There are many capabilities here each with a different =
use.
> > > > > > > > >
> > > > > > > > > And you are under the impression that dumping all kind
> > > > > > > > > of stuff in a single place is good somehow?
> > > > > > > > It is not dumped.
> > > > > > > > It is structured based on the functionality.
> > > > > > > > The config space proposal tends to dump everything in
> > > > > > > > unstructured way at
> > > > > > > single place that cannot extended elegantly.
> > > > > > > >
> > > > > > > > For example, Xuan's dynamic array cannot be placed next to
> > > > > > > > other dynamic
> > > > > > > array of flow filter.
> > > > > > >
> > > > > > > I don't know what "dynamic array" is exactly but generally,
> > > > > > > Any kind of a big array is not appropriate in config space -
> > > > > > > I don't see any of these
> > > > > here, though.
> > > > > > Ah, now I see the disconnect.
> > > > > >
> > > > > > There is.
> > > > > > struct virtio_net_ctrl_ff_match_types
> > > > >
> > > > > Now I think I don't understand what this array does at all.
> > > > > Why are there multiple entries with each entry also including a
> > > > > mask of multiple fields?
> > > > >
> > > > Each entry indicates a bitmask of supported fields that can be filt=
ered.
> > > > The type indicates how to interpret each fields_map.
> > > > Any new type for MPLS can be added easily by defining its type and
> mask.
> > > > And same type enums and field mask also used by the data path too.
> > >
> > > Oh wait I think I begin to remember now. There are 12 bits defined
> > > so far and you made it this huge array. Right? With code to parse
> > > and format it all. Just add a 64 bit field and it will last us long
> > > enough. No parsing and formatting just #define.
> > The infrastructure defines 12 bits only because this is first minimal v=
iable
> work.
> > There will be more fields to be added for more types.
>=20
> Maybe.  Let's see a list and see if we even get close to 32 bits.
>=20
There are many ether types to filter based on the device.
Many types of IPv4 and IPV6 header fields.

https://www.iana.org/assignments/ieee-802-numbers/ieee-802-numbers.xhtml

> > It is not good to mix up all the fields and bit definitions.
>=20
> Not good how?=20
I provided example why it will be so bad to mix up the socket options under=
 one socket option command.

>  It's definitely much simpler than what you wrote.
Simpler for spec !=3D simpler to implement in device.

> Does it matter that bits for a given transport are not all consequitive? =
I do not
> see why it matters.
>=20
It is surely not elegant to spread things around that way.=20
Actually it is not good for TLV definition in the data path flow filter com=
mands.

>=20
> > And there are per device max limits which is way more than 12 bits.
>=20
> These are just a couple of 32 bit fields.
>=20
And they can be different that cannot be de-duplicated across different mem=
ber devices.

The proposal is not based on the count or RO/RW etc.
It is based on when it needs to be accessed, as they are not init time earl=
y use to initialize the device, they are over cvq.
> --
> MST


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

