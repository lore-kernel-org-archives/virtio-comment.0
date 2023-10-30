Return-Path: <virtio-comment-return-8029-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F96C4332F
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 04:28:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4457B2AECE
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 04:28:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1A214986B21
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 04:28:01 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id EE3E4986A7E; Mon, 30 Oct 2023 04:28:00 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DE709986A81
	for <virtio-comment@lists.oasis-open.org>; Mon, 30 Oct 2023 04:28:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JcSQNtlQo4kx+X0xcCuI0qXRBpJUa4ltKjO9qul2C2nt+PE7SlpNlqll3Ckl9vALmEbYlKgONL5g4A8sr+kagxinH7YGjaAB9e5eW4Z/XBWPh0bXrVkjGiB4spsVIWu/iYcUReLDShY8V9LXdCf29pwcYry8gQWXrfoBxneOVUv7g1vLkUB2e3ibVwiXhDLdFjDMN0tNUKQREFOBvbOnv0nYcyU8JzLz/FHSEi5fhwUbShjbqJgjvOsWjV5gaCpcR/Rno6RV0OhHY45+bgb7N6H6UYiyJ9aMwwjHDC+lUClCiWk/zwnFX/ROYZ72poiNosdl8N8M6wvxrrsavVAP9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sdrtSNwZoH9DOTKDiSydTYYCtM2SDVomkRFduQIp/Ow=;
 b=FS0WTVab3GuE4TvLNwQWT9dJK1d1VoG4brD1oiFIMKzDCqJPJRYCenoXQek63kd0wu0utniXZMQEdB71p6QLO0JTP/uUS8uFoBVW3m8WWJBJrUh6lnvExLXyCkwepTVMSWLo/Tuymgy5D47R+2W5pGAzALXkftNQMO3PhBeqa0Q9iywe85wlomSEYMRMDyweN2kA64e+6CbW5hZUDi3T/yCsyx0y042dTLjOhI6qaYgRvo04AAchf0vL62gaPJ8m+dI/Bwj/+U9lXWfvrh7QCQHGhFd/mpRl5rByBdSNb0i8E+zDavejfH6sS5GJxoVICrcE4hK8qsXGvN6gh/urgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Jason Wang <jasowang@redhat.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>, "Zhu, Lingshan"
	<lingshan.zhu@intel.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration
Thread-Index:
 AQHZ+dpHSUrTyyDEA0quapQP8C0hdbA/xRkAgAF/hoCAACxh4IABSWcAgAANqrCAAZnYAIAACyKAgAGFBICAAACFkIAAEwWAgAAD8yCAAXZ1gIAAIYLAgASWeYCAAtRh8IAAGoeAgAAAUKCAAARLAIAAB5cQgAAXYICAAABqYIAAFBIAgAABIMCAB3K1AIAADNZggAGZtoCAAFHP0IABBk6AgABdlBCAASjtgIAAM0kQgAZNdoCAAAPWsA==
Date: Mon, 30 Oct 2023 04:27:58 +0000
Message-ID:
 <PH0PR12MB5481CE2BD779F1D96914FB6EDCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <db0719f9-7dc2-4a96-b10b-ecc3dac1a82b@intel.com>
 <860e52ef-8cfc-408a-b3cc-2551ef6118d1@intel.com>
 <PH0PR12MB5481F6F9BC5158481EC36AE9DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231018055422-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548106B7225BAF351241EA8ADCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsJVxPuxCGjKs3R-kaVGfDMNjtAovM7PpBt3TVd8HON0g@mail.gmail.com>
 <PH0PR12MB5481DD16B25251BAC25AA908DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEthURdu4UNYXPseA-5g6mci2CFDP_UKKC1qFy+n7NHAKg@mail.gmail.com>
 <PH0PR12MB5481BBC4E48145A02C8963ABDCDFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu3nC8G3Xo2EaunQ4k4rnB27UQMUvruXaf81_sZF7w-cQ@mail.gmail.com>
 <PH0PR12MB548120210DC4AC23382D8A99DCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvwFno6ynKzi1WPAj=fF2xmzRS_kUKfL8UJU8sTcjDHbA@mail.gmail.com>
 <PH0PR12MB548140823FA205FA06597692DCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <d3b029a0-5a50-c697-066a-e4f8e85b807c@redhat.com>
In-Reply-To: <d3b029a0-5a50-c697-066a-e4f8e85b807c@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DM3PR12MB9327:EE_
x-ms-office365-filtering-correlation-id: 574dd784-ff91-49a5-f610-08dbd900987e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 b1owT217wqe91s6klZR6feqtUMWr243iZPwKZe1pBeBAJt+XYixe/tNsCBsEvkRUWVV1l6qz6pkWcIOJ7KIdxC49brX1MOPjHmVxe1jcE37xQuilnTU1R6XVseW0Rmhp62NHcyZqndGwUfpneC5fmbGhtnZAfzolquRBAVLXSAS2TKLqsMVadLkkuLx7ul/rXrtpaYKZOJVQzH/XkVAab7EKHSFFnRR7TaaEUB2mOPJbQBMmOA5mzCIeZk/58Gz9XBvQxRgXV855GM/phqVIRGpxVpYjERJrB4deLzdkY2SK0ODMEGn8GuAWKOIt8nRZmkQYFDDSLyTTOP/WL+f8EsEmhIpSiRnPKfe8sft9lJAmsMvziAC2LwjspwsP5r1Jhnog0kaufcok2K/WINRkH+Kaary2STa2Az68MhqKVWHD6vXfMgmv2PBTD4X0EltjxRZYJfrVHImmWaJ4z6W9dcc/dH96YztpRjTMtu1N99HWg9NUvy3u/8JllA5+WFR+RXK+/ARZZ7Um/swtuGZXmvQJx1nmzN0GsFHDE1TDfVmfCQ+R8CUvAOSvyuYlW7mdyaH1YncUm8umpIMFbX0rZz8zd8VoQM9cOKxEBsnQL6t50oXgpHdI5wWn0pRU0FZpWTk8Lt8eXzKoYvni5mY6kDpgm8osSgjev7MtwYx4iNp/mG3uv98nNeT9M1u35ICF9LQ5k9y1/9+OiUjRouAJ0w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(136003)(39860400002)(376002)(396003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(55236004)(9686003)(26005)(107886003)(45080400002)(478600001)(6506007)(71200400001)(7696005)(5660300002)(2906002)(52536014)(41300700001)(76116006)(66946007)(4326008)(6916009)(8676002)(8936002)(64756008)(66446008)(66476007)(66556008)(316002)(54906003)(966005)(38070700009)(38100700002)(122000001)(86362001)(33656002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a3VYYzhXcTFqaTFJNFdUL0oxQk5tTUVwWDRRcnBPUEJQVGdSS3Q3dkhtSCtX?=
 =?utf-8?B?R1crdXN0TXVKSjBQTmFOR3p1NXlIZExtelROWUEzVXBRSStJWmpNeHlTMzZL?=
 =?utf-8?B?RTAzWlgxOEZnNzFjb3dJQSt6SkR6U0tRN3RLbWNIamxTdnFNUWUrYVhjZ1Fj?=
 =?utf-8?B?c3dqTUVTaitaQ2xMWE4yZytKcUVGWmh1SDNac1ZGbWJlMENMM2lwdk01U05i?=
 =?utf-8?B?Nm9YVUx3bjR3YndjMFNvRG9VN0l3bmpEeHN6ZHpJVEZjcTlZV3kzcTE3ZGQ1?=
 =?utf-8?B?UlB0SUN2MHJSUFlvajg3N2t2ZnRVdDBLQ20yakt5M2hTcUVHU3RQQVhSTkpV?=
 =?utf-8?B?bFFPRy9KU0ErWnlPUEtnVTloWHNaYUNDUHJ0SE45TVBaYUUvUnVXVE83bklB?=
 =?utf-8?B?aEkwbGhZNW1CMnFjTlRBblVTMzhrZ1F4Z2dHZTh0cFpzUjVKT3ZDNkZMVVlr?=
 =?utf-8?B?UkgrUXExTzVpRHFZWWY4RWJZeEVWTEtSVlN3N3NoZEZ0Mk81QWJGbVU4MVEz?=
 =?utf-8?B?TTZYN0twZkpRMjVtbncweFBRcmJNZ2sybkRNTnBiWWV4cXVrN0JLRndGcGkx?=
 =?utf-8?B?SlZqSVAzeXhxd1JlZzlsVHA3N0VKNlNqQWJsVFBhVzE0VGhWbFNBYTFkQ3RV?=
 =?utf-8?B?N3JDVm5lanNUZHlDWms5bmtuV1A1aEZMRUlvbWh2d2RJTG1jdWwwc2prZkZj?=
 =?utf-8?B?L3pOUExBY01zU2cxQk85V0JPVy9oNnowM0gxQ0dSRVFmYktxUVJ6RjRyelor?=
 =?utf-8?B?alk4NjBNMm9OMTVXdlZ4NEx6clYwQWZ5YUp4NTNVUjJnQlkrL3B4MnpicTUy?=
 =?utf-8?B?ZUY3bVFFUitHamg5YkpwaHpEaHRBZEs0QmNyekc5MktFdVluVmNYRDBFQjJF?=
 =?utf-8?B?T1FhZzRVZDNGaEtVMk5vV0EzeDRYSjhpaXkzdkV3cmo5VzhsQmplNUpaaGdR?=
 =?utf-8?B?dVgyRjZQbm5CTEkvRmRpL1VKdTBSUW1hWHlqYm9OeWRib2o1aEJrU1JRWlhR?=
 =?utf-8?B?T0xIUzF1Y3huR2tqVnhyY051elFxZ0oxNFZ0S0xoNzR0elZmeGFDSDhRK25u?=
 =?utf-8?B?OWZGazJEUzJicGRISlZkUXJtRHRzTGhJeS9nbi9qRkFMWjUrSGp2WGZ5VUx1?=
 =?utf-8?B?R1RnaHBOR2ZwU3hnR1ZTeXVYUWJwR1ZkYWZTTE02K2pmTEczSi9Ra0NmM1V6?=
 =?utf-8?B?ZktlVTdKTndzSlVHTU15UVM0T0czYXhDa09ZcGVKUVFUWTFURGwyU0JvYTd5?=
 =?utf-8?B?bFJxVW04cVNRSU81N1RYSWpIY1BOU1VUWklqM3NrZGUxdVkxWENCSUZoaVc3?=
 =?utf-8?B?cUVpclBtNjJtTEpBS1RHTk8vS09jZ2U4a2hHMGZRUEN4Ym5LWlVxMzVOVjFQ?=
 =?utf-8?B?ODJINTNPVTUvQVF3NnJEUFhSMzJsakxjWW5TNnFUd0xUbXJWVUlvTVZXRmJw?=
 =?utf-8?B?SkVNRmg3b09OUlRkVzQ5SUxrWGszeFlWckN2R1JlZ0dTZVAxdGxpOGZiNngv?=
 =?utf-8?B?Z25NbUhNRkFxN2ltWjVvWXFvS2w1M1hMdGV1NDA2V2YrNGxRYTBaSW5KVVNs?=
 =?utf-8?B?WFVIN1RIZ1JZN20vcGhnMWk2MUVzbHpHRno4Q3JUNGhUSjNpRk1KYWFnOC9n?=
 =?utf-8?B?Vm1WVkVHUGtHb05iOXp2aEFGc252V2sydmlzckVrS25LclEvdC9aVVlKUnQ4?=
 =?utf-8?B?WlV0bzNNZjJkeS9DL3M0Ukt3YmRUVTE3WG40MGlQcUlkNXpIeXQ1L0hYM1Zo?=
 =?utf-8?B?R2dmaVhVa2ZScTJHZDJWQTY1Q2I4UWRHOVdscHF5YnN6b0dUUDA1Q3dRUi9H?=
 =?utf-8?B?M0ZXQTNVY0pxZktrTlJiQW1CTDFpSVZ3RFZXdDhkT2M2QjZSbmZxczVtV1RV?=
 =?utf-8?B?dXl5S1BOZHhMbnNQWlNjSlNLZWU3ZkZKdCt3dnVjbmVqRXhUQWcvK21iZHN0?=
 =?utf-8?B?clYrVFh3TGNnMGpUOFVuaDlmZ2c4bFh5UFNSbldWUWU4eWJCOVJoUHlKazQ1?=
 =?utf-8?B?R0NnaEVEYkFlVFV5MzM2Rm15WWQzZlk1MjhVWGE5U0ZEcFhQNFdIWGo5bjNO?=
 =?utf-8?B?cWMxQ0hkNTRtTE5HTll1a1hLMGkrejF0ME5mdFJoT0I3SXRXNWg2MUxGZU9n?=
 =?utf-8?Q?lIRE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 574dd784-ff91-49a5-f610-08dbd900987e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2023 04:27:58.4349
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: inXmrbpLozZ10MX3v79o1mzhlyBQ5kjL7HhfK8op0hr4dh4mkgVHRTRkyqHwM3jSvQCDcplLXB0nIJrjFln45Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9327
Subject: RE: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

DQo+IEZyb206IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+DQo+IFNlbnQ6IE1vbmRh
eSwgT2N0b2JlciAzMCwgMjAyMyA5OjM1IEFNDQo+IA0KPiDlnKggMjAyMy8xMC8yNiAxMTo1MCwg
UGFyYXYgUGFuZGl0IOWGmemBkzoNCj4gPj4gRnJvbTogdmlydGlvLWNvbW1lbnRAbGlzdHMub2Fz
aXMtb3Blbi5vcmcNCj4gPj4gPHZpcnRpby1jb21tZW50QGxpc3RzLm9hc2lzLSBvcGVuLm9yZz4g
T24gQmVoYWxmIE9mIEphc29uIFdhbmcgRm9yDQo+ID4+IGV4YW1wbGUsIHlvdSBzdGlsbCBoYXZl
bid0IHN1Y2NlZWRlZCBpbiBkZWZpbmluZyBwYXNzdGhyb3VnaC4NCj4gPiBJdCB3YXMgZGVmaW5l
ZCBvbiAxOXRoIE9jdCBpbiBbMV0uDQo+ID4gV2hhdCBwYXJ0IGlzIG5vdCBjbGVhciB0byB5b3Ug
aW4gZGVmaW5pdGlvbiBvZiBwYXNzdGhyb3VnaCBkZXZpY2U/DQo+ID4NCj4gPiBbMV0NCj4gPiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy92aXJ0aW8tDQo+IGNvbW1lbnQvUEgwUFIxMk1CNTQ4MUVB
NkE0RDBDNjRDNUFGNkQzQQ0KPiA+IDU3RENENEFAUEgwUFIxMk1CNTQ4MS5uYW1wcmQxMi5wcm9k
Lm91dGxvb2suY29tLw0KPiANCj4gDQo+IExldCBtZSBjb3B5LXBhc3RlIGl0IGFnYWluOg0KPiAN
Cj4gRm9yIGV4YW1wbGUsIGFzc3VtaW5nIHlvdSBhcmUgY29ycmVjdCwgeW91IHN0aWxsIGZhaWwg
dG8gZXhwbGFpbg0KPiANCj4gMSkgd2hhdCBpcyB0cmFwcGVkIGFuZCB3aGF0J3Mgbm90LCBvciB3
aGF0J3MgdGhlIGJvdW5kYXJ5DQpQYXNzdGhyb3VnaCBkZWZpbml0aW9uIHdhcyByZXBsaWVkIGZl
dyB0aW1lcy4NCk9uZSBvZiB0aGVtIGlzIGhlcmUsIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3Zp
cnRpby1jb21tZW50L1BIMFBSMTJNQjU0ODFFQTZBNEQwQzY0QzVBRjZEM0E1N0RDRDRBQFBIMFBS
MTJNQjU0ODEubmFtcHJkMTIucHJvZC5vdXRsb29rLmNvbS8NCkkgZG9u4oCZdCBrbm93IHdoYXQg
eW91IG1lYW4gYnkgJ2V4cGxhaW4nLiBXaGF0IGRvIHlvdSB3YW50IHRvIGJlIGV4cGxhaW5lZD8N
CldoYXQgaXMgdHJhcHBlZCBpcyBsaXN0ZWQgaW4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvdmly
dGlvLWNvbW1lbnQvUEgwUFIxMk1CNTQ4MUVBNkE0RDBDNjRDNUFGNkQzQTU3RENENEFAUEgwUFIx
Mk1CNTQ4MS5uYW1wcmQxMi5wcm9kLm91dGxvb2suY29tLw0KV2hhdCBpcyBub3QgdHJhcHBlZCBp
cyBhbHNvIGxpc3RlZCBpbiBodHRwczovL2xvcmUua2VybmVsLm9yZy92aXJ0aW8tY29tbWVudC9Q
SDBQUjEyTUI1NDgxRUE2QTREMEM2NEM1QUY2RDNBNTdEQ0Q0QUBQSDBQUjEyTUI1NDgxLm5hbXBy
ZDEyLnByb2Qub3V0bG9vay5jb20vDQpTbyB3aGF0IG1vcmUgZG8geW91IHdhbnQgdG8gZXhwbGFp
biBpbiB0aGVyZT8NCg0KPiAyKSBpZiB0aGUgaHlwZXJ2aXNvciBpcyBub3QgZGV2ZWxvcGVkIHdp
dGggdGhvc2UgYXNzdW1wdGlvbnMsIHRoaW5ncyBjYW4gd29yaw0KV2hhdCB0byBleHBsYWluIGlu
ICMyLiA6KQ0KVGhpbmdzIGNhbiBleHBhbmQgd2hlbiBzdWNoIGh5cGVydmlzb3IgaXMgYm9ybi4N
Cg==

