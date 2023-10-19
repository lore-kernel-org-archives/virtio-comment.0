Return-Path: <virtio-comment-return-7850-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC36CDB465
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 09:14:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4C189750A8
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 09:14:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 409559868D8
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 09:14:49 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 371C59868CE; Thu, 19 Oct 2023 09:14:49 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 293799868CF
	for <virtio-comment@lists.oasis-open.org>; Thu, 19 Oct 2023 09:14:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eIrUuZGCEfptQgf7yBihRAX+I1NCaeQQMk4NSoWpoP9xR3GVPfVNFDKAGbTeS6l5DVa6+qDw/mfHsX0ww1IlevgqqZdZO+zdmAaUQtnbS6MqKsI+od9EP2zs/JIpRahWW3wliHn6AOdSYuUPu8RMZn6BRXyaa6OuADImlb214YFEFa7ncZ1ObOXq2m8EkIjoyl1Trebq7uWhtDYIuV2fuf7WaoHYSM3HHAXwgzqGR4CufqMNiXI6JPTMfMp974x98KmH2ytBTYko7r0qWzGpZA5Ol1WvlnXzTMg010uzL6YtaKQlOLlysExmWsWUTAtcO0HKF3zbPbNshNG8yzPfRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AlcrXnmN6FLjWq+gsCBQYTM1EHl8+3z/wjPS4P2nDFU=;
 b=noGESVgeD3qsju/qF3QEQvTPBEg10uERJ0RARUmmvasfwVdoRFGumc1kJoPi0e3H+qmYGFQSueXyHCsqXtkW4AemvN4HTfdaYBMcswGHtjCfOibM5GnjHtwtX8JP1RxgAZTlDoix1lAUbzf2dSfisPOXiZ6NavQaYGJm0mBoMQKAR8d2eboroRO6hUjEip7QklMclCjwFB62UoVs5yYQQk+qkHminDc4T9ErzFiIEL7zS61XG3GMGZQqA8yKrfjjuoRYl+N8c7c3l6M2asf3ZGemN14GNNShssn8Z5ePi6s+QvX4RT40We04WXqPmVz06N5pitwYCAyaQZrtVEojLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Heng Qi <hengqi@linux.alibaba.com>
CC: "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, "si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>
Thread-Topic: [virtio-comment] [PATCH v1 1/7] virtio-net: Add theory of
 operation for flow filter
Thread-Index: AQHZ+N1HxWxRChq0PUKSXEDSkhNG0rBQxM4AgAAinfA=
Date: Thu, 19 Oct 2023 09:14:46 +0000
Message-ID:
 <PH0PR12MB5481A049ADCB87339C364116DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231007051443.460148-1-parav@nvidia.com>
 <20231007051443.460148-2-parav@nvidia.com>
 <42ef3788-8cd0-47a7-b246-ad997dcf2ac3@linux.alibaba.com>
In-Reply-To: <42ef3788-8cd0-47a7-b246-ad997dcf2ac3@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA0PR12MB7650:EE_
x-ms-office365-filtering-correlation-id: da54190a-fb96-48ec-e081-08dbd083d69e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 y2Um/eI22cKtxUhRe6hH1T74t8r1wry4YzUMmpuIIKxSqwumJXIOKcTgLkwKBkEA/hMTS/vuJXz8J67BgnGA8A601oEzE4LGwbdDbpwaS/gn4aoZp+r0Er/3H03E5Y61a65lBIrhdRvYqbXXKXj/myFU2TfjEebOKIyTZMXaj5geuO4uUHOdmj2AN7xrjdh2ie2Sn7YCgwh/GCJLK3i2Wlsb3sMFwT94jIMq24u882WQ4ksl5pIf1V3TP91pmq2uNst3o2jFl9BHsaVlufFzzrbWTztQHeg8JQ6Y9s/SxHn0FAxmbWbrlkvUSDHy2pnJKiXVqDHelbwz8Irj84wXslUvXKHtDxSgDHMtUuODWdvP7UqtZAhRoPhJQY3VcwKKf1mXZh9c3vjKKB3evAFpxNLBKypiq6W3vEbA1JPNjg2XiEwVzcf+p5RjO2Zbvhm907F15i0UkGbEEsH032xv1VY22dQMvCK268fla8+jNf157uMaXFY5PkOGTSnhnvUGzgF2CHU4kbMo4wkBqFoRLcwloVP4GXH5jH76MyztLjE+h4QCmhBGFQnPLYy9wpk/yuv1uTUOzaIpfmRlviTF1Cgcw5OQMOiJrZw5irAPicRDwLBIhVaxt73j0e09ehBN
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(346002)(376002)(366004)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(9686003)(55016003)(66446008)(54906003)(316002)(76116006)(64756008)(38100700002)(86362001)(66476007)(7696005)(6916009)(33656002)(38070700005)(83380400001)(66946007)(8936002)(71200400001)(8676002)(26005)(6506007)(122000001)(2906002)(66556008)(55236004)(4744005)(478600001)(41300700001)(52536014)(5660300002)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dkNoRGxqbDhPb2dDVFlpN0pvMVZZMHhkOWdZUHlhQjk5Z3lMRVpudFA3c2hF?=
 =?utf-8?B?TWIwS3p4aS9ZUU54Skt4L0E5YlRDOS9qMmdaTDlmd1I5cG5IdHkvQTBmMzVL?=
 =?utf-8?B?Qi8vUW5DMTZKVTNqOEExWjh0bnFXQTZnODRsY2pWVkFzVHRqLzNhOFptR2VS?=
 =?utf-8?B?ZHBhd3FUY3hRSDlvRHgxRlRoMVhEdXRzbGl4WHBCeEN2MHlOS1pXN1RPb1R4?=
 =?utf-8?B?KzZqN0hqeWU3MnZJblluZjhWSWFSZ0NNanlzbU5Id29oTnFkbFBHYWR1dHpr?=
 =?utf-8?B?WW03VGpCK09NeEJuR2t3Sm5TbmFmTXFrT3IzbXlBWHdjWW9JT0RHZnFmcFR2?=
 =?utf-8?B?d1BPY2JSeS85bnkzM3owMGhheTlTc2Y3MWd0cGk5cWhoZE91dUhmQWtBZUJk?=
 =?utf-8?B?Ry85QWh1OWMvd2twd2xwWFcybWZZS0E3VGE2TTI0NmJMejEyVWJDcXBNQStF?=
 =?utf-8?B?aTY5ZDBwQmk3VVExSXYvemEyZmJkQ1pwMnlFeUZYQmVYMjZMU3JSeTdvTlkv?=
 =?utf-8?B?bjBLYVZHZDh6WXp2QkQ1MysyTW1CNUZWajIzQ2hXMnRDZXMzdXAvZi9aNHlK?=
 =?utf-8?B?dG5EdHhuRklQODBPUVZTN21LZUdMYWl6UDlibVVkdzNKbnBFT1pKUUQyQ3h1?=
 =?utf-8?B?RzQ0L0ZzdVdaZGtCQTYxYWYyZnJxWjFpMitpYUcyM0MyQnp2VGlaYlYrTG1R?=
 =?utf-8?B?eFIyV3l0UVYxZE5NazU0MG95RElaVzBxWU5hdGpScmFpTjZDaTBHS3BtRVFi?=
 =?utf-8?B?VWpnSU01MnZPSHpJQmUvM2o3WjZIMlExNHJQa2NZKzdQYVBwK2ZLQkNONVNK?=
 =?utf-8?B?aER1WTM1YkErVUF4ZDRyejBneUFkVTZjTlBtTHBVeTZiTElnVWRCQ3JDMDY0?=
 =?utf-8?B?L0VZZVlHSXlaeXoyc2NiUVVEZ0VGYTNnUUUveG9MS3lzL2F0Mm1HeEZkUDJa?=
 =?utf-8?B?MEVxKzM5Y1FZVEcyNHRqOHQrb25JMzFnVkU0T3JOMmlzSWk0Q01SaVUrWXRr?=
 =?utf-8?B?VmUvcE4wWE9peHhxcE1sMjlNWkV0NU5ScXMwM0RreVRwVnhMWHpDSUhuWmhE?=
 =?utf-8?B?VlhwTU1BZXltQjF5R2c3Q2ZjSUFnTU9NWWdoWVVQdVFUWGQ2RVVaSkhwTXpZ?=
 =?utf-8?B?ZHR4V04yL0dIMUxCbVV0K2ZRK0ZaUlRsaVdLM0pXc1FpMk1mbGtvaHpGcUJ4?=
 =?utf-8?B?elNrR3VmYVU4M0hIcGRSaXFFQnpqT3YyRDdvRlEwNWtVT0liRFpPNVJmS2po?=
 =?utf-8?B?dGtMeVVXaUp6ekp1Z2dUbXFPT01yTEhRcTZaeVBwT3dHOGYrbjdGaEFDOGFo?=
 =?utf-8?B?ZlFmZFk4RlVlWjVjc1A5UUVOMzlCVmROakp4NVdZNGxKM3l6TVYyalRzejli?=
 =?utf-8?B?OHZrWGNrQUgzMUpYanpCUkl5N1c4aVA2dmNvRHN4MG5WcUxNQ1cwRnFiakhF?=
 =?utf-8?B?b1cxSS9SREp3bmZhdWwwYWxkTXYxdGs3VDVXY3FtUWt1WEZCWXQzbDlRaGMx?=
 =?utf-8?B?SVlaTlMxeUFLM2o4cmtRR1ZvMktGOHh0Wi91MmlvVnMzaGdWV053UWlwcnZN?=
 =?utf-8?B?V1VDMitQMkF4V3VzcnpzYUN3aUN1U2R2Unp3SnVIbmZraXZad2dmZjA0Z3g0?=
 =?utf-8?B?V3JPM0Q5NjVuc0lrbnVXWm9aR2NRZ3Jpb2htMURmNWFBSU8zRitvR0hTeHZ0?=
 =?utf-8?B?TmRMTGNsVG5TQ2phNHNQcld4VUdFckdOYWdSR05nVWQrdmtOdDFoUHo5YUt0?=
 =?utf-8?B?N3l2SHF6SWVNQUR3bjdhY0N4SlNkSjBFQUpFTy91UkVyV1cvUzBxSGswbWtH?=
 =?utf-8?B?M3lKdTlJeVFSMytrYy9qeFdOR2p4MUx2bG5JMjNaWjVuNTFwYzdkSUdmakpk?=
 =?utf-8?B?SnhZVzJyVmtDOWlnN3NscXY0anR6TFJFRVNHN3hBRkV1amFzSkhCZ3JkdWlH?=
 =?utf-8?B?R21ScmdNMWZ1bmZ6d0crS1RSaDlvUFBCWUZCM0JpcmdHckFEYUpPeFpPSGRU?=
 =?utf-8?B?SFlSVE0rZTlVRXgrNDlTbEJ4VHJyM1JiOEc3cjhkTlFYQjMrdG9MQzh0RXhp?=
 =?utf-8?B?RzZiN1NuMHB3dHB5enN3R05SRkwyNG82cU1SS3lzWHh5bDdRNkFHTGxOMjgz?=
 =?utf-8?Q?JAuo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da54190a-fb96-48ec-e081-08dbd083d69e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2023 09:14:46.2741
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zS+E2T7F+uJym0SFel5ayhJzzZuR7ZF/oVYJkWSZwchXCdBITAOzReeRm9GXy44tj0BHjTFiUDwEhUmCktsMEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7650
Subject: RE: [virtio-comment] [PATCH v1 1/7] virtio-net: Add theory of
 operation for flow filter

PiBGcm9tOiBIZW5nIFFpIDxoZW5ncWlAbGludXguYWxpYmFiYS5jb20+DQo+IFNlbnQ6IFRodXJz
ZGF5LCBPY3RvYmVyIDE5LCAyMDIzIDEyOjQwIFBNDQo+IA0KPiDlnKggMjAyMy8xMC83IOS4i+WN
iDE6MTQsIFBhcmF2IFBhbmRpdCDlhpnpgZM6DQo+ID4gQ3VycmVudGx5IHBhY2tldCBhbGxvdy9k
cm9wIGludGVyZmFjZSBoYXMgZmV3IGxpbWl0YXRpb25zLg0KPiANCj4gcy9mZXcgbGltaXRhdGlv
bnMvYSBmZXcgbGltaXRhdGlvbnMNCj4gDQo+ID4NCj4gPiAxLiBEcml2ZXIgY2FuIGVpdGhlciBz
ZWxlY3Qgd2hpY2ggTUFDIGFuZCBWTEFOcyB0byBjb25zaWRlciBmb3INCj4gPiBhbGxvd2luZy9k
cm9wcGluZyBwYWNrZXRzLCBoZXJlLCB0aGUgZHJpdmVyIGhhcyBhIGxpbWl0YXRpb24gdGhhdA0K
PiA+IGRyaXZlciBuZWVkcyB0byBzdXBwbHkgZnVsbCBtYWMgdGFibGUgZm9yIGVhY2ggdHlwZS4g
RHJpdmVyIGNhbm5vdCBhZGQNCj4gPiBvciBkZWxldGUgYW4gaW5kaXZpZHVhbCBlbnRyeS4NCj4g
Pg0KPiA+IDIuIERyaXZlciBjYW5ub3Qgc2VsZWN0IG1hYyt2bGFuIGNvbWJpbmF0aW9uIGZvciB3
aGljaCB0byBhbGxvdy9kcm9wDQo+ID4gcGFja2V0Lg0KPiA+DQo+ID4gMy4gRHJpdmVyIGNhbm5v
dCBub3Qgc2V0IG90aGVyIGNvbW1vbmx5IHVzZWQgcGFja2V0IG1hdGNoIGZpZWxkcw0KPiANCj4g
UmVtb3ZlICdub3QnLg0KSSB0aGluayAnbm90JyBpcyBmaW5lLCBhcyBkcml2ZXIgY2Fubm90IHNl
dCBpdCB0b2RheS4gQWJvdmUgbGlzdHMgb3VyIGN1cnJlbnQgbGltaXRhdGlvbnMuDQoNCkZvciBy
ZXN0IG9mIHRoZSBjb21tZW50cyBiZWxvdy4gSSB3aWxsIGZpeCB0aGVtLg0K

