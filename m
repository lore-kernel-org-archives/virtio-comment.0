Return-Path: <virtio-comment-return-7782-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49AD1CDB47E
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 05:36:06 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A3B3533088
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 05:36:05 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 90175986891
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 05:36:05 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7AB20986889; Wed, 18 Oct 2023 05:36:05 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 688C798688A
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Oct 2023 05:36:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=baMfBeBtnbacjuzC3mmnge0R5VvHFoMPnDgnjh1Q69nu7BAy5yLJ+k3cVocC/i9/4fJXQEQgbnx04ZemcUvAPTLawNNxGaH0xnop6+hF64ElrXXtHw3g1Xinzy7Fk4pMpI9ISkkm70YWLdrUrX7efpSMy5E6jdhsP3yQ+xzqNO1rNJm8QqsH+y7CGHvsU1Fqt99oxCpivJ8NAh1q9ZxQKf7068s1L+NzfwphI/1uss87E1DJYq/AUHfvWGrNYilppvBirNGMuedbIRKSoUScoifVMvkihNzro6soTNSNBwIxq8MxUqRB/yCXVebNLMenezNEICIky1zHCIC5W9Rg/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ffK9JNJopgAjfsp3N8hFMrrcXCLj+fTTCfKU3QzueQ=;
 b=VvmtYhd6zEDgJrB8fmYQrLageHrwhi9Qk3m7LRHtGnK6JBWszrexhiLjCo4TZd9NZ6IqOxKLmRPg0xtV1iBa/zOD7g14fb+4yb8M4lNpGtVjX8ysQ2TT+rTDNNHT32agghLuliw3lzV6m5MhvPHp5f+PBQm8EjcToBh/fMEX9UxtPhb1x39gYidNUTclsfoCZzh5XQ+dhUrhGQnVY1ij8aoAA335kG4MsJhN/oefjIJQd/BQJdZpS5lKDO9YkQwlKt3dgYC6DL/2ehZIA1kek/YSCEXWyrLOsqWbsndNYtlsPHoFMc4iZaBMNHq8mNSVUDsN4Q6/PRo9WmXDXBwJWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Peter Hilber <peter.hilber@opensynergy.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
CC: Cornelia Huck <cohuck@redhat.com>
Thread-Topic: [virtio-comment] [RFC PATCH v2] virtio-rtc: Add device
 specification.
Thread-Index:
 AQHZqzWn01mUtnPGCUaCuESJ+zAzFa+nCBEQgCaJjICABcqYEIAHKR+AgBoD7sCAJGLqgIAS3pNwgAbnOwCAApCdYIARXF8AgAFYInCAAIbcgIAFiSGwgADKLQCAAOEKgA==
Date: Wed, 18 Oct 2023 05:36:00 +0000
Message-ID:
 <PH0PR12MB54816E8AEE2AE89148076542DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230630092959.392381-1-peter.hilber@opensynergy.com>
 <PH0PR12MB548182C0D5EB0C6273F30E9CDC28A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fb5b1603-68eb-3301-9e5c-6bb81e9bc594@opensynergy.com>
 <PH0PR12MB5481CA116DBB424005B0B5D1DC05A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <766e94a2-2592-d3ca-2ddf-164022df05da@opensynergy.com>
 <PH0PR12MB5481F7AD21A871DE5660A948DC1EA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <b59a7dda-06fe-cff9-df61-b90aa4e50836@opensynergy.com>
 <PH0PR12MB5481BA022FC2CA834264CC47DCFCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <9da5f426-0099-8b58-bb24-fdbfeb02b4fc@opensynergy.com>
 <PH0PR12MB5481DDD6D022617D6F615429DCC6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <026c8242-7dae-4ee9-b9e9-bb52af07c063@opensynergy.com>
 <PH0PR12MB54815BDBEA7E4DE1074B167DDCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <0c7bec47-8a21-4a1e-80e9-43740a72d427@opensynergy.com>
 <PH0PR12MB54812437DFD91F0F3E3CFBFFDCD6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <5fd2682c-6479-4750-b0e1-d74070453b31@opensynergy.com>
In-Reply-To: <5fd2682c-6479-4750-b0e1-d74070453b31@opensynergy.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DS7PR12MB5983:EE_
x-ms-office365-filtering-correlation-id: ea582a30-d891-4996-2789-08dbcf9c1cbe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 aP7qsjkKzaZxfZIz3o+9+9vOgDsUTQlSqxQfatr/pDU064eY51AFoR8HPGgQf17Ilyi7+VNRhzdnhJV7eG5Um6AQMdZlFp55vjYYQOxHJcRspd7gOnZGqFQqpZFKoATpD2R4puZ+mCQLKeexXsot0FKR8+dC8F+D3+5l+vWtdaGXbKJgj4NJf0QqMaw1gFvjA3F6Vk4TDBkYwrNGdcjRgDAcnTwUd8ouRaj9hhRLJ9hbPOchicNfzJh2ERJacPlGXITe0IZUjl4P3ZbSNndRORWRlb5v5yUiyD6947g55g0MyLqRwTGvJlNALk7LiF2BvSVU9G/LAmRiD3xqOFU1LIqOLhISP1yrGqcxWzTSVHQFNH31hRLUW+W5CRIyebfDCx5UOGO1khHS5uaz23/DgTDyEI1OBMlRVWsTREIUw4Qc6bSVpfznSK7IOlygupBMXXMeB5BYPSjrcIJlfXDwLeB1sva8t4Kjwjqd20BRI3oxgfKAqbdAyIhYIm9cn2/x9AkVKcvQthFaZlIi8gy3NBXMm1HO2QjRnXEUhkDu/cA8lTWopZFjKu7Yc3mLHtOapML+afqdCJogWLj2/p8di4HPoUM2MV5tna/prhkIcqlTtdDlNtErghmcrUMur7pG
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(39860400002)(136003)(346002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(38070700005)(26005)(2906002)(5660300002)(41300700001)(8936002)(8676002)(52536014)(4326008)(71200400001)(66899024)(76116006)(316002)(66946007)(110136005)(55016003)(478600001)(7696005)(6506007)(66476007)(83380400001)(9686003)(33656002)(66446008)(64756008)(53546011)(86362001)(66556008)(38100700002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NEg5b0MzdFFhZVBidU5JaHIxa28xNEZ1MVE0MVJXaXk3MnVmUm43RnNQMzUx?=
 =?utf-8?B?TFJXc2VlcE1CL2g3WWoyblNvQTdXS2JsNFdiRXhSN1AybkJZVHZVdi9jUmEv?=
 =?utf-8?B?NnlKeVgvbHYwa2pxdGpWK3lrSjBzMHVuZ1lpWUR6Nks1ZXk5SEdVWS81T3p5?=
 =?utf-8?B?UmNOUUVMZDZteXJmVjZSY0lPUjY2QTBPSW9oc1cxRm16UlJIZjFTeVJnZkR4?=
 =?utf-8?B?R20xMDZGdGs0SGtpUlpNcHpIbHExcHVYbHhjdHRIWGRPcm9RcnBWS0N0dzJY?=
 =?utf-8?B?UWdRV3R0RUR6SEZGMzRqTmM3Q0pIanozelNNZGVONlFlWDZQTVo0eGZrUVpO?=
 =?utf-8?B?U0pJKzFpTW5oL0F6NUVmM2xhOHdaRmVHbWttMUpHRUxlT0ZGK0FsUGJ1bnpX?=
 =?utf-8?B?Nmw4d1dvcmxUdFV0VzMyZUpteExXYjFhODA5enNqUy90eER2STIyOTBMenVs?=
 =?utf-8?B?Wm1IN2FDaDhkSWhzKzhqZDZHM0tQZGd2MzBhem9lRWZNbS8rTHhWQzZqYzZt?=
 =?utf-8?B?azVibXlLTXRwcndYT3J4Q2JTdlVqcmZUQkNXYU1kTDZBWldPaWFwUU1rdXNn?=
 =?utf-8?B?d2FZRE9LZTRMK09DamplclovUGM2Uk9EVDlDOUVjR3RWTTNSQnR6YjJ0ekFQ?=
 =?utf-8?B?QkVIYmtEcUkrenB2VVRKRytSNmlRMDc1L2w5Sys1LzR0UVA2TU5JVWlweW1x?=
 =?utf-8?B?bWh3Sm1DTjFLQS94VWtkM2xhS3ovTU5VMkhzRVEzMmVzMjFSWitHUUJiM0VX?=
 =?utf-8?B?U3IvK25oUlFjVFlsYUM0T1VFakw5VVM2YWVMTFFPT2JucVhCRXVEZkNBQ3J6?=
 =?utf-8?B?Z1lxU2tpMFFuSUYySHJESUN6ZVp3MkJ1NXNGNmRicnhteHhwdXZZT3NmUE04?=
 =?utf-8?B?Q3JPRkNTMEN4cjNsNkQrbHZVUkVoenMrbDBsVHZNc3JpMFJYRmVBaVUrRklI?=
 =?utf-8?B?d2VCUTNpMjJVaGJYR1lEUmR0OVROb2R2MFVvakg2WFYvNllCOUpNU0lueE1H?=
 =?utf-8?B?WnFhNjFLWGNkQ3FPZ0R5b0JOTnZhK1hEZ3FTb1lKMlNLTDY3K0k5alg2NGU4?=
 =?utf-8?B?Snh6OEI4L2hTZitUenlVRE8ySXJBbEpYcy96aVBpQ2hPR3FnakxIY1M2KzNM?=
 =?utf-8?B?QlN3ZXR5UytmbmJsT0ZGMHVmTkcxSm1PbURLbW0vT2JxaEFzZ2xwUjEwa2Ri?=
 =?utf-8?B?ZVVJQk0rZkxpRXp2UTdKSVFDNnhaUHI5UEN1TTBQUFU0WGVjcVpWY01BeXJU?=
 =?utf-8?B?WDRmcU5EWWZheGExeEVzL25NaTdoSGprWnRhN3kyb3dIUDRFVWplWkxUZnVW?=
 =?utf-8?B?N01neUtsczNIaU5XeFZ6cHlsT3gzSWs1T3EwMUFEbWhVdTlub2U5dytFZEkx?=
 =?utf-8?B?NnZrN2VpaFNWYm0rMFNvZEpIdXpEQzUyNzVXRG10MUVucmlUY2JJelNqNWov?=
 =?utf-8?B?d0hnYmhrNVQvdjl4N1J5MTFvdnhkTVRuZGRqMDNCQ2dUaDdPNGhGMXhHZExD?=
 =?utf-8?B?d0lCUkxJWEhmQXZSZmlwT3pHY1BPd0pWZ3NMaEJwWVhCeDRyR25sSkxhSFEy?=
 =?utf-8?B?S2kvSWM0eU9yUURKellleERUWCtqSFNCSE93TUpEZnBqSGk5eTJlRnpjTkM4?=
 =?utf-8?B?aHhqN0RLVENNdS9PdmRMR3VZWFZVS2xYN1Z0bzFoSlYvVXMrNXBLOWM0WHhh?=
 =?utf-8?B?ZEc4d3VHazZGNGlLWGpqZHNkWmtGNGxBVmNlQWJOcnZwbzNGR0U5SEdCVzRV?=
 =?utf-8?B?ODBXL1FkVkxydUt5d1k1YklYSFRncHhuQ0ZmdE1ES1Z4eGQ0MFlveVFMQmEv?=
 =?utf-8?B?Ri81RVRmd1NVMllnSjV2MHc4YnQ3a0h4ZnIvYWhDOTJ0N0xCV3c0clVOdEEy?=
 =?utf-8?B?aFNIVExCU0h2SElCVko3ME5McFRQM3lNTWswREYzR1VkQ0N6VkhHN3BGNzRU?=
 =?utf-8?B?bXJrUmcyV2NOZmxCNnFQTWFTbEJZcCtZcTRnb3NjdHZxZUtpWEw0aXk3NFJU?=
 =?utf-8?B?VHFBNDl6ekI3dmtodmxEUWU2NVROdEs4UE5jN2pWRlZXM1k0UzZYK1RHaVNL?=
 =?utf-8?B?UHRlRitNMUZXZlNiUnRSSWlNQjkvYytxMzVIN1l5c0tNMGVlWlBRVVFCbC80?=
 =?utf-8?Q?KGkI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea582a30-d891-4996-2789-08dbcf9c1cbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2023 05:36:00.6576
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vLNotogFnpsOt8RAp+RSWcvWufWcXUUs2emBEGKeWaiqgWCpjJy4tQ4T80dFY+xx9xEtsfXyHl/oaGHsfAg/eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5983
Subject: RE: [virtio-comment] [RFC PATCH v2] virtio-rtc: Add device
 specification.

DQo+IEZyb206IFBldGVyIEhpbGJlciA8cGV0ZXIuaGlsYmVyQG9wZW5zeW5lcmd5LmNvbT4NCj4g
U2VudDogVHVlc2RheSwgT2N0b2JlciAxNywgMjAyMyA5OjM2IFBNDQo+IFRvOiBQYXJhdiBQYW5k
aXQgPHBhcmF2QG52aWRpYS5jb20+OyB2aXJ0aW8tY29tbWVudEBsaXN0cy5vYXNpcy1vcGVuLm9y
Zw0KPiBDYzogQ29ybmVsaWEgSHVjayA8Y29odWNrQHJlZGhhdC5jb20+DQo+IFN1YmplY3Q6IFJl
OiBbdmlydGlvLWNvbW1lbnRdIFtSRkMgUEFUQ0ggdjJdIHZpcnRpby1ydGM6IEFkZCBkZXZpY2UN
Cj4gc3BlY2lmaWNhdGlvbi4NCj4gDQo+IE9uIDE3LjEwLjIzIDA2OjA2LCBQYXJhdiBQYW5kaXQg
d3JvdGU6DQo+ID4+IEZyb206IFBldGVyIEhpbGJlciA8cGV0ZXIuaGlsYmVyQG9wZW5zeW5lcmd5
LmNvbT4NCj4gPj4gU2VudDogRnJpZGF5LCBPY3RvYmVyIDEzLCAyMDIzIDk6MDAgUE0NCj4gPj4N
Cj4gPj4gT24gMTMuMTAuMjMgMDk6NDAsIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPj4+DQo+ID4+
Pj4gRnJvbTogUGV0ZXIgSGlsYmVyIDxwZXRlci5oaWxiZXJAb3BlbnN5bmVyZ3kuY29tDQo+ID4+
Pg0KPiA+Pj4+IFNlbnQ6IFRodXJzZGF5LCBPY3RvYmVyIDEyLCAyMDIzIDQ6MjYgUE0NCj4gPj4+
DQo+ID4+Pj4+IFNvIGFtIEkgbWlzc2luZyBzb21ldGhpbmc/DQo+ID4+Pj4+IEluIGFuIGFyYml0
cmFyeSwgaW50ZXJmYWNlLCBvbmNlIHVucGx1ZyBpcyBzdWNjZXNzZnVsLCBpLmUuIHdoZW4NCj4g
Pj4+Pj4gdGhlIGRldmljZSBleGFjdGx5IGtub3cgdGhhdCB1bnBsdWcgaXMgY29tcGxldGVkIGJ5
IHRoZSBkcml2ZXIsIEl0DQo+ID4+Pj4+IGNhbiByZS11c2UgdGhlDQo+ID4+Pj4gaWQuDQo+ID4+
Pj4NCj4gPj4+PiBCdXQgdGhpcyB3b3VsZCByZXF1aXJlIHRoZSBkZXZpY2UgdG8gcmVtZW1iZXIg
cHJldmlvdXNseSB1bnBsdWdnZWQNCj4gY2xvY2tzLg0KPiA+Pj4+DQo+ID4+PiBOb3QgYWx3YXlz
LCBpdCBjYW4gZG8gd2hlbiB0aGUgY2xvY2sgd3JhcCBhcm91bmRzLg0KPiA+Pg0KPiA+PiBTb3Jy
eSwgSSBkbyBub3QgdW5kZXJzdGFuZCB0aGUgcmVwbHkuIFdoZW4gdGhlIGNsb2NrIGlkIGlzIHdy
YXBwaW5nDQo+ID4+IGFyb3VuZCwgaW4gdGhlIGRpc2N1c3NlZCBzY2VuYXJpbyB0aGUgZGV2aWNl
IHdvdWxkIG5lZWQgdG8ga25vdyB3aGljaA0KPiA+PiBjbG9jayBoYWQgYXNzaWduZWQgaWQgMCBp
biB0aGUgcGFzdCB0byBhdm9pZCBwb3RlbnRpYWwgbWlzaW50ZXJwcmV0YXRpb24gYnkgdGhlDQo+
IGRyaXZlci4NCj4gPj4NCj4gPj4+IFNpbmNlIHRoaXMgaW50ZXJmYWNlIGRvZXMgbm90IGhhdmUg
dGhlIGNvbXBsZXhpdHkgb2YgaG90cGx1ZyBhbmQNCj4gPj4+IHVucGx1ZyBvZiB0aGUNCj4gPj4g
Y2xvY2tzLCB3ZSBzaG91bGQganVzdCBrZWVwIGl0IHNpbXBsZSB0byBhIHJlYXNvbmFibGUgbnVt
YmVyIG9mIGNsb2Nrcy4NCj4gPj4+IFRoZSA2NC1iaXQgdmFsdWUgaXMgbm90IGh1cnRpbmcgYXQg
YWxsLCBJIGp1c3QgZmVlbCBpdCBpcyBidWlsdCBmb3IgdW5rbm93bi4NCj4gPj4+DQo+ID4+PiBB
bnkgcmVhc29uIHRvIG5vdCBkbyBob3QgcGx1Zy91bnBsdWcgb2YgY2xvY2tzIG5vdz8NCj4gPj4+
DQo+ID4+DQo+ID4+IEN1cnJlbnQgdXNlIGNhc2VzIGRvIG5vdCByZXF1aXJlIGhvdHBsdWdnaW5n
LCBidXQgSSB0cmllZCB0byBtYWtlIHRoZQ0KPiA+PiBzcGVjIGZ1dHVyZS1wcm9vZi4NCj4gPj4N
Cj4gPiBJZiB0aGVyZSBpcyBubyB1c2UgY2FzZSBmb3IgaG90cGx1Z2dpbmcgYSBjbG9jaywgd2Ug
c2hvdWxkIGtlZXAgdGhpbmdzIHNpbXBsZQ0KPiB0byBhIHJlYXNvbmFibGUgd2lkdGguDQo+ID4N
Cj4gPg0KPiANCj4gSSB3aWxsIGNoYW5nZSB0aGUgd2lkdGggdG8gOCBiaXQsIGFsdGhvdWdoIEkg
ZG9uJ3QgdGhpbmsgdGhhdCBtYWtlcyB0aGluZ3Mgc2ltcGxlci4NCklmIHRoZXJlIGFyZSBubyBo
b3RwbHVnIGNsb2NrcywgdGhhbiA4LWJpdCBvciAxNi1iaXQgaXMganVzdCBlbm91Z2ggcmlnaHQg
Zm9yIHJlYXNvbmFibGUgbnVtYmVyIG9mIGNsb2Nrcy4NCkkgZG9u4oCZdCBoYXZlIHN0cm9uZyBv
cGluaW9uIGZvciBiaXQgd2lkdGguDQo2NC1iaXQgd2lkdGggd2l0aG91dCBob3QgcGx1ZyBjYXNl
IHNlZW1lZCB2ZXJ5IGxhcmdlLg0KUGxlYXNlIHRoZSBwcmFjdGljYWwgcmFuZ2UgdGhhdCB5b3Ug
ZmluZCBzdWl0YWJsZS4NCg0KPiANCj4gPj4+Pj4NCj4gPj4+Pj4gVGhpcyB3b3VsZCB3b3JrIHdp
dGggOC1iaXQgdG9vLg0KPiA+Pj4+PiBOb3QgdGhhdCBJIGhhdmUgaXNzdWUgd2l0aCA2NC1iaXRz
LCBidXQgdGhlIHVzZSBjYXNlIGZvciBsYXJnZQ0KPiA+Pj4+PiBudW1iZXIgb2YgY2xvY2tzDQo+
ID4+Pj4gdW5kZXIgc2luZ2xlIHZpcnRpby1ydGMgZGV2aWNlIGlzIHVuY2xlYXIuDQo+ID4+Pj4+
IEFuZCBpZiB0aGVyZSBpcyBubyB1c2UgY2FzZSwgd2Ugc2hvdWxkIGhhdmUgcmVhc29uYWJsZSBy
YW5nZS4NCj4gPj4+Pj4NCj4gPj4+Pg0KPiA+Pj4+IFVzaW5nIGEgbGFyZ2UgaWQgcmFuZ2UgbWln
aHQgaGVscCBpbiB0aGUgZnV0dXJlIHRvIGF2b2lkIGRlYWxpbmcNCj4gPj4+PiB3aXRoIHRoZSB3
aG9sZSBjbGFzcyBvZiBpZCBBQkEgcHJvYmxlbXMsIGNmLiB0aGUgYWJvdmUgZXhhbXBsZS4NCj4g
Pj4+IEluIG15IHZpZXcgdGhlIGNsb2NrcyBhcmUgZXhwZWN0ZWQgdG8gZ2l2ZSBwcmVjaXNpb24g
YW5kIGFjY3VyYWN5LA0KPiA+Pj4gc28gbnVtYmVyDQo+ID4+IG9mIGNsb2NrcyBpbiBhIHN5c3Rl
bSB0aGF0IG9jY3VwaWVzIDY0LWJpdCB3aWRlIHNvdW5kcyBkaXN0YW50Lg0KPiA+Pj4gSWYgaXQg
aXMgdXNlZCB0byBub3RfY2FyZSBhYm91dCBmaW5kaW5nIHRoZSBmcmVlIGlkLCBpdCBpcyBvay4N
Cj4gPj4+DQo+ID4+DQo+ID4+IE5vdCBjYXJpbmcgYWJvdXQgZmluZGluZyBhIGNvbmN1cnJlbmN5
LXNhZmUgZnJlZSBpZCB3YXMgdGhlIHJlYXNvbg0KPiA+PiBmb3IgNjQgYml0cyB3aWR0aC4NCj4g
Pj4NCj4gPj4+IElzIGhvdHBsdWcgdW5wbHVnIHRoZSBjbG9jayAoaW5zdGVhZCBvZiBkZXZpY2Up
IGlzIGNyaXRpY2FsIHRoYXQNCj4gPj4+IGRyaXZlcyB0aGUgY2xvY2sNCj4gPj4gaWQ/DQo+ID4+
Pg0KPiA+Pg0KPiA+PiBDbG9jayBpZCB3aWR0aCA+IDggYml0IHdhcyBvbmx5IGNvbnNpZGVyZWQg
dG8gYmUgYWJsZSB0byBlYXNpbHkNCj4gPj4gc3VwcG9ydCBob3RwbHVnZ2luZyBpbiB0aGUgZnV0
dXJlLg0KPiA+Pg0KPiA+Pj4+DQo+ID4+Pj4gVG8gbWUgdXNpbmcgNjQgYml0cyB0byBhdm9pZCB0
aGUgcG90ZW50aWFsIGZ1dHVyZSBBQkEgcHJvYmxlbXMNCj4gPj4+PiBsb29rcyByZWFzb25hYmxl
LCBidXQgaWYgb3RoZXJzIGRpc2FncmVlLCBJIGNhbiByZWR1Y2UgdG8gOCBiaXRzLg0KPiA+Pj4+
DQo+ID4+PiBJdCBpcyBub3QgbXVzdCwgSSBqdXN0IGZpbmQgdGhlIDY0LWJpdCBsZXZlbCBjbG9j
a3MgYSBiaXQgdG9vIG11Y2gNCj4gPj4+IHNwZWNpYWxseSBhdA0KPiA+PiBob3RwbHVnL3VucGx1
ZyBwYXJ0Lg0KPiA+Pj4NCj4gPj4NCj4gPj4NCj4gPj4+Pj4+IFdpdGggInVuY2xlYXIgcmVzcG9u
c2liaWxpdHkiIEkgbWVhbnQgdG8gcmVmZXIgdG8gdGhlDQo+ID4+Pj4+PiByZXNwb25zaWJpbGl0
eSBmb3IgZHJhZnRpbmcgYSBzcGVjIGV4dGVuc2lvbiBmb3IgdmlydGlvLW5ldCwNCj4gPj4+Pj4N
Cj4gPj4+Pj4gWW91IGNhbiBjb3VudCBtZSB0byBkcmFmdCB0aGUgdmlydGlvLW5ldCBzcGVjIGZv
ciByZXNwb25zaWJpbGl0eS4NCj4gPj4+Pj4gSSBhbSBzdXJlIG90aGVycyB3b3VsZCBqb2luIGFz
IHRoZXJlIGlzIGNvbW1vbiBpbnRlcmVzdCBhY3Jvc3MNCj4gPj4+Pj4gbXVsdGlwbGUgZGV2aWNl
DQo+ID4+Pj4gaW1wbGVtZW50b3JzIHRvIHN1cHBvcnQgaXQuDQo+ID4+Pj4+IFdlIGtub3cgYXQg
bGVhc3QgNCBzdGFrZSBob2xkZXJzIGhhdmUgaW50ZXJlc3RzIGluIGl0IGluDQo+ID4+Pj4+IHZp
cnRpby1uZXQgKEFsaWJhYmEsDQo+ID4+Pj4gZ29vZ2xlLCBtYXJ2ZWxsLCBudmlkaWEpLg0KPiA+
Pj4+Pg0KPiA+Pj4+DQo+ID4+Pj4gT0ssIHRoYW5rIHlvdSBmb3IgdGhlIGluZm9ybWF0aW9uLg0K
PiA+Pj4+DQo+ID4+Pj4gSSB0aGluayB0aGUgYXJndW1lbnRzIG9uIGhvdyB0byBoYXZlIHRoZSBS
VEMgc3BlYyBpbnRlcmFjdCB3aXRoIHRoZQ0KPiA+Pj4+IG5ldCBkZXZpY2UgYXJlIG5vdyBvbiB0
aGUgdGFibGUuIE1heWJlIHRoZSBkaXNjdXNzaW9uIGNvdWxkDQo+ID4+Pj4gY29udGludWUgb24g
YSBkcmFmdCBzcGVjIGV4dGVuc2lvbiBmb3IgdGhlIG5ldCBkZXZpY2U/DQo+ID4+Pj4NCj4gPj4+
IEkgZGlkbuKAmXQgZm9sbG93IHRoZSBjb21tZW50Lg0KPiA+Pj4gTXkgc3VnZ2VzdGlvbiBpcyBs
ZXRzIGRyYWZ0IHRoZSBzcGVjIF9ub3dfIHRoYXQgY292ZXJzIHJ0Yw0KPiA+Pj4gZnVuY3Rpb25h
bGl0eSBhcyBwYXJ0DQo+ID4+IG9mIHZpcnRpby1uZXQgZGV2aWNlIGFuZCBhcyBpbmRlcGVuZGVu
dCBydGMgZGV2aWNlLg0KPiA+Pj4gQW5kIGlmIHRoYXQgcmVxdWlyZXMgbWUgdG8gd29yayBhbmQg
ZHJhZnQgdGhlIG5ldCBwYXJ0IGZvciB5b3UsIEkgYW0NCj4gPj4+IGhlcmUgdG8NCj4gPj4gZHJh
ZnQgaXQuDQo+ID4+Pg0KPiA+Pj4gV291bGQgaXQgd29yayBmb3IgeW91Pw0KPiA+Pj4NCj4gPj4N
Cj4gPj4gT2YgY291cnNlLCB3b3JrIG9uIHRoZSBuZXQgcGFydCBjb3VsZCBhbHNvIHN0YXJ0IG5v
dy4NCj4gPj4NCj4gPj4gSSB3b3VsZCBwcmVmZXIgaWYgdGhlIG5ldCBwYXJ0IGNvdWxkIGJlIGRp
c2N1c3NlZCBhcyBhIGRlZGljYXRlZA0KPiA+PiBwYXRjaCwgb24gdG9wIG9mIHRoZSBwYXRjaChl
cykgaW50cm9kdWNpbmcgdGhlIFJUQyBkZXZpY2UgKGFuZCByZWZlcnJpbmcgdG8NCj4gdGhvc2Up
Lg0KPiA+Pg0KPiA+IEl0IHdpbGwgYmUgc2VwYXJhdGUgcGF0Y2ggKG9yIHBhdGNoZXMpIGluIGRl
dmljZS10eXBlL25ldC9kZXNjcmlwdGlvbi50ZXguDQo+ID4gSXQgc2hvdWxkIGJlIHBhcnQgb2Yg
c2FtZSBwYXRjaCBzZXJpZXMgYXMgcnRjIGFuZCBuZXQgc28gYm90aCBkZXZpY2VzIGFncmVlDQo+
IGFuZCByZXNlcnZlIG5lY2Vzc2FyeSBvcGNvZGUgcmFuZ2VzIGV0YyB0byB1dGlsaXplIHNhbWUg
aW5mcmEuDQo+ID4NCj4gDQo+IEkgcGxhbiB0byBzZW5kIG91dCBSVEMgc3BlYyBSRkMgdjMsIHdo
aWNoIHNob3VsZCBjb250YWluIGFsbCB0aGUgYWdyZWVkIGNoYW5nZXMNCj4gZnJvbSB0aGUgdjIg
ZGlzY3Vzc2lvbiwgaW4gTm92ZW1iZXIuIE1heWJlIHRoZSBuZXQgcmVsYXRlZCBjaGFuZ2VzIGNv
dWxkIHRoZW4NCj4gYmUgcHV0IG9uIHRvcCBvZiB0aGF0IChhbmQgYmVjb21lIHBhcnQgb2YgYSBj
b21tb24gUkZDIHY0KT8NCj4gDQpTdXJlLCB3ZSBjYW4gcG9zc2libHkgY29udmVyZ2UgYmVmb3Jl
IHBvc3RpbmcgdjMgaXRzZWxmIHNvIHRoYXQgdjQgZG9lcyBub3QgcmVxdWlyZSByZXdyaXRlIGR1
ZSB0byBuZXQuDQpUaGlzIGNhbiBiZSBkb25lIGJ5IGRyYWZ0aW5nIHYzIGluIHN1Y2ggYSB3YXkg
dGhhdCBpdCBmaXRzIHRoZSB2NCBzY2VuYXJpby4NCg==

