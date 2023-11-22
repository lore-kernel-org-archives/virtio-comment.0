Return-Path: <virtio-comment-return-8537-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB7EC072A2
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 06:47:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 86BEE2A898
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 06:47:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5BE1B9868A4
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 06:47:47 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 41E379843C0; Wed, 22 Nov 2023 06:47:47 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 31F78986894
	for <virtio-comment@lists.oasis-open.org>; Wed, 22 Nov 2023 06:47:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ut5hIrQqunqJXbe2iSvcUhOSKYbtjFcyzzUlR2pZ8YcSxd04JbizEKagUmfHS2YaHlwk3oUB5MPrX4XZdmII5a9QLh2S8FZpjR4DihdwE6rU7610RJS+QXCWlPiSepulgyCN05ti69UYJ738lBRztnbxP8GhIB4sV9IOf9DaCdPI/jJ9tKDTqrrDsW0NDnVjx+BQ8KNhjwDEP4fr+K8X8vfalvTgf6C55p2TpaSxGe9dNO/GOV17tPnF6pY4+64453AG/dkgeMc+CWNS/JSTei5A6TXv5n35uuI4Tbwy+TA5rJcoP1AfqpFnXFsVwXjWyhP23DsTGvCFiPJnqXdb8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xlDdbg++Ywn2IbGAQ4HYfU8ZktIqGqCBclFA5UIlO1k=;
 b=kwWTSf3kxMSmQPyUxXqlNEHpD3c6sNpBLGxNJjdUhoF/hxBn/5sarVRqgj1Q1OSMgYcsRpUhaBndlyzDhpBSEnJc40hQ919ajDK8x0Zn/z74LSqEE0SxtHpxPPBQFo7j8Z0oQxdICjHHvNEo5+EzRBWz3NtcZc/BBug9GVgReWSUiLVPGt/N2Vzne0HMtF8DCHaVnaRCBT8azMNinYLycwjuDZifV/bQbRxp5NeJsJzgdxVghFfQkHIOwDzAX1XMfffHsNucXrxuoJonEmCeTLVdi/UsRlRu0V0yZ+GC7MmNwuLl3jnXFVfSMFndijWxVEP8uuiR9L1JONFIgxj8Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, Jason Wang <jasowang@redhat.com>
CC: "eperezma@redhat.com" <eperezma@redhat.com>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "stefanha@redhat.com" <stefanha@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Thread-Topic: [virtio-comment] RE: [PATCH V2 3/6] virtio: dont reset vqs when
 SUSPEND
Thread-Index:
 AQHaDkFjDoKRbBsYgkWQI+N8LeuYiLBtEIiAgAGML4CAAh3lAIABD20AgAADyiCABdpcAIAD/JZggADHAYCAAANsQIAIDjuAgADmeQCAAEx8gIAAUcaQ
Date: Wed, 22 Nov 2023 06:47:44 +0000
Message-ID:
 <PH0PR12MB548163E7EA30AFE2BAF7A937DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231106044836-mutt-send-email-mst@kernel.org>
 <c6cb6e6b-fd2b-43ac-9be5-c4a8cda1ac13@intel.com>
 <20231108124625-mutt-send-email-mst@kernel.org>
 <b125da70-a769-4662-876b-43664e39c976@intel.com>
 <PH0PR12MB5481577C0492D45C20CF9C62DCAFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvLYgnLtSqx_G=-KMuANEZ=xtAzJjV3pYqAZhA0qqW0sQ@mail.gmail.com>
 <PH0PR12MB54819A6E470D3ABE4BC1F450DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtxm8M5vKfOPOAS347JAJNeRDyPe+nif1LszuRWS0vShQ@mail.gmail.com>
 <PH0PR12MB54810EF71D0BF925F4F81A65DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtsMi9+MgDb=tTH=LrkReb3aZdB4wv-MJkxLmLhNmTDAg@mail.gmail.com>
 <20231121161218-mutt-send-email-mst@kernel.org>
 <7e440ddc-1765-406c-80b4-6a486ec2a232@intel.com>
In-Reply-To: <7e440ddc-1765-406c-80b4-6a486ec2a232@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SJ1PR12MB6219:EE_
x-ms-office365-filtering-correlation-id: f28925df-5a05-4777-2a6c-08dbeb26ee86
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 zdxM7c6wrKF/o+q1Kp6kuo/HgqGreCcewsRDn+/3RAtHSF/kIhSM4950FnoBWx93wdroXBOFgAaBrd8hQ+BkEChAH0RgpO+2hrh8B5NIAfs1LzH23xejsJnZLDByOn4dBMUcpWGtvVEmGGbbYs8Rkc71HkXslq2ee7+z3/vFBMh4sQgYS9eTaHS2veNpxvrQXr8i7y+2RYHMe8oimNvFPUQ9Okzr2Rp9YqvmRkfpL2XtWuTiaa6L82Cj8PW8x7bBrDw06R4sPXgrxQJymla/D6x+RqQeWfgAMDaeTEjWIWzy7UZKxchZHHHp677xEq45lCNKOK9y8QhQWCRLlCZu6QXgjeFmMU+9aXuOlUQtRQvsnLPBQSHptzg4ilDfLCUWSwB0R/wnieKZ9wwLD8gm5ZA6gEHJ9fphLX/2DtLDwZK0z0AQjhj36WHm7Ba7tgUj5u/xLzzjhd9k29O2i1o5M7fhsp5dW45iqdU3PI+fTv1chxYSEPda6JmQBwmhB2Sd8xEUGfzDD/mJ/894+izJy4H+mcg2nvCepoDbi+SmqmW1BuuZwyBXskyonrHb8JRTtq96he705cxRoFpMPt6ht/8jYm316I0VL6TUAMaaOYn4DjHF9HNhn0ChGBpwcdMPkjQqS5fK7cG8znqT6oCNQQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(366004)(39860400002)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(53546011)(9686003)(26005)(8936002)(8676002)(38100700002)(4326008)(41300700001)(15650500001)(5660300002)(2906002)(478600001)(52536014)(6506007)(110136005)(71200400001)(76116006)(7696005)(54906003)(64756008)(66476007)(66446008)(316002)(83380400001)(66946007)(33656002)(66556008)(122000001)(86362001)(38070700009)(55016003)(192303002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?THc0aW11MGhHMjhVbmg3TXQ3OXAwemFnSGp2Ym8rOWRKcTdvWC8relJMaC83?=
 =?utf-8?B?TnVtQXQ1K0cwb3BCbDQ0STI2a0YvZWZ5aStjVDRKcTBnNEF0bDljN1NCQjFn?=
 =?utf-8?B?UUoxaDBkeVJaQmMxL01qdnZJVFkvN2h1TUtmNlkwNWlQeHY3UHZhcFQ3SDJ4?=
 =?utf-8?B?NXpvM05sV1ZFL25oVkRLZW5Nb1dJQXliY09UbDVGeVdPWmlZSGs2MTlOZ1hG?=
 =?utf-8?B?Ly9SOVV0OWkxTzRPcXBYcHp6Tk9MYkpBMWNPQmUrNlFxSzF2bk94bDliUXJH?=
 =?utf-8?B?L0JiNzJDUlZURHRqMjl0M1RZd1hkMis4akJEdlBLNDNta3ZQL2Zualdrcjdq?=
 =?utf-8?B?dWlJOEw0S2wzcUdKeEE1aFRENUhxYTlLalcrMmZNdStMV2tPbm5xTEpteXdn?=
 =?utf-8?B?Z2JJK01ZUk5oYzdCdlQ3RkxEVTlFdGpXem5PdDFkc0ExMUZ5TWhCSEVyQ05B?=
 =?utf-8?B?dkxQWHBrTzE3TnpJS0hydi92OVZtM2x1aWtqOHBoQzErUVZiSGFqbFhldFhs?=
 =?utf-8?B?MERRS2tJcGJaVzZvdElCY0p6OThWK2pTNjFvSCtTVUNqWVkvRnFLVmhXYmpW?=
 =?utf-8?B?bGtGa0FFWjJLWmhjcUhHM0E3SDY1UzAycGNGcjZIWUdCZFJVczdkNXJFZnhh?=
 =?utf-8?B?TGRLMTNwSXZvb0I4SFc3SE1jcmZEZEZ2VERvMUVNVVF5R0VwUzdqaGN0QzU2?=
 =?utf-8?B?YzFIekxjN3VBWHhnc0JESGlSbk1MWW00WERKTWJpTnozVUJhOVBScS84My9u?=
 =?utf-8?B?T1lNVHFDUkJLL3JQaVlYRHZjOGx5MVVoUGRBL0puTEtPZmcveDdMdEVFeWZM?=
 =?utf-8?B?SW9TNHBSOUhPbDVsWUdrUnpLdDE4L2ZHTk00ZG9NbDhGbTFERmxXWmpua0dG?=
 =?utf-8?B?QVU3bDBGL0NjeDlDczdZZ0o2bDcvQ2l4cEZsRVRMY2F2L1B2a2YvQUFhdDlC?=
 =?utf-8?B?dGhORDdHNFBTd0lyT3lNR0Rxc3YzMlFHRTQwRXNMRHJaa0ErbHBndFBta3lD?=
 =?utf-8?B?UndMdGw3N21IV0hYSHhmbExvY3liampIMjBUSENQOFFUa1BRK2ZlYndPQ1pW?=
 =?utf-8?B?ekNTU254L1NHVlkyeEdNN2VOWGpDNGxpSkxCdUcvRlYvaENQaVE4T1RXMjZl?=
 =?utf-8?B?ZmQxMHoxODlTRUxxU3cxYTNSUlltU0lJa0FnKzF0WmZZRllOSGdsZUJlMzN2?=
 =?utf-8?B?blRVSXZZZ1hlMzNLU3d6a0RaN3Z5SG1BcTVnNStJeHh2RFYrelU1WHZBaXZi?=
 =?utf-8?B?S2dIRVpaQlNpcTl1eGtoaVozQUpScHVkNEtSRXovT28wMy9GY0x4THpWUWNp?=
 =?utf-8?B?TWlhWHVtVTdDV3ZuUEYwdTVrMlRnTnFiSkRjK2dBMXd6QU84S0xFMUIxZEtK?=
 =?utf-8?B?WWlkQXlyQVI1VlJETjZVZ0pydjJjdks1a2FBYy9xL0RNSlVyTXVvRyt0YVhF?=
 =?utf-8?B?dW5DWXJkcThNa2ZKYXVnZkhWT2RCMk0xNCtEaUxaRHZaWG0wbFFyR3pWN1NH?=
 =?utf-8?B?cElVQ1lNN2VMZEFIOFdrUitwQUF3QUxlWk8xcTdYaElWWWowSlVpWXRsL3Qr?=
 =?utf-8?B?bXdEdnR2S25wTmVSdmY4R0hoMm44OG5lSG1pam1zSmZZSzkyWDRkR0VBYVZi?=
 =?utf-8?B?SHQydVdyQ3lBOGxmWVcvVHkyMjVUbVVTRGhRNTNyWEthTXJMYnl1WFgvTWl0?=
 =?utf-8?B?WjBNZEFESElnL0dZYklkQ3NSMVY4N25RZXF1Si9pTVBXak85SWNZS2tady9o?=
 =?utf-8?B?aXVBREpjcDlKOXBXcDIzWDh2UUQ3SjRZN0tXbDVpTXFSaDdBUE5sdDlUQmVR?=
 =?utf-8?B?amV5bVdmNDNRcmM1cExCMnM1TVgxWWtXWTRoVGVJVzlDL1hlK2JsTXFjbG4r?=
 =?utf-8?B?ZWFRd3BqVW1xeHRrVnRhMGdPNVpSby9XaVNvdERZb0NuaHJ2TDRGTnpQdEh1?=
 =?utf-8?B?ckgzMlBSaDJBZEg5cHdzZ09KUExUY1l2b2hKNGYzb3FPQmxMT3gwNXRFTVpn?=
 =?utf-8?B?SUluNWIyQ1c3T3N5eGQvQUYrMVhUV29JcmlhdTFuR29BSHRDYnFkY0x1TTV4?=
 =?utf-8?B?dllNdmdpUFU0SGlGaW9BZUlmZkN0ZGsyVmQwSG45WU5pMzVCN242Q1dMOWxu?=
 =?utf-8?Q?9jRY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f28925df-5a05-4777-2a6c-08dbeb26ee86
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2023 06:47:44.5821
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P+bEXFzEAfzX60kWkYJf9P8OzRU5ReZ4egwJQvVbIYnjAei96kLx8zxKpLfrcYjpVzFfBUa0JGiMgNFND0Qylg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6219
Subject: RE: [virtio-comment] RE: [PATCH V2 3/6] virtio: dont reset vqs when
 SUSPEND

DQo+IEZyb206IFpodSwgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+DQo+IFNlbnQ6
IFdlZG5lc2RheSwgTm92ZW1iZXIgMjIsIDIwMjMgNzoyMiBBTQ0KPiANCj4gT24gMTEvMjIvMjAy
MyA1OjE4IEFNLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6DQo+ID4gT24gVHVlLCBOb3YgMjEs
IDIwMjMgYXQgMDM6MzM6MDdQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToNCj4gPj4+IExpbmdz
aGFuIGNsYWltZWQgdGhhdCBzdXNwZW5kaW5nIGRldmljZSBpcyBmb3IgbGl2ZSBtaWdyYXRpb24g
aW4gY29tbWl0IGxvZw0KPiBhbmQgaW4gZGlzY3Vzc2lvbiBoZSBwb3J0cmF5IGl0IGFzIHNvbWUg
YmFzaWMgZmFjaWxpdHkgdW5yZWxhdGVkIHRvIGRldmljZQ0KPiBtaWdyYXRpb24gc3VjaCBhcyBk
ZWJ1ZyBldGMuDQo+ID4+PiBJbnN0ZWFkIG9mIGNsYWltaW5nIGl0IGFzIHNvbWUgbm9uX2Rldmlj
ZV9taWdyYXRpb24gZmFjaWxpdHkgZG9lcyBub3QgbWFrZQ0KPiBzZW5zZS4NCj4gPj4gSXQgaXMg
dXNlZCBmb3IgbWlncmF0aW9uIGZvciBzdXJlLg0KPiA+IFdlbGwgaGF2aW5nIGEgZ2VuZXJpYyBm
YWNpbGl0eSB0byBzdG9wIGRldmljZSBzb3VuZHMgbGlrZSBhIG5pY2UgdGhpbmcuDQo+ID4gSG93
ZXZlciB0aGUgZGV2aWwgaXMgaW4gdGhlIGRldGFpbC4gQSBsb3Qgb2YgZGV0YWlsIGhlcmUgc2Vl
bXMgdmVyeQ0KPiA+IG11Y2ggdGFpbG9yZWQgdG8gYSB2ZXJ5IHNwZWNpZmljIGltcGxlbWVudGF0
aW9uIGluIG1pbmQuDQo+ID4gU28gdGhpbmtpbmcgdGhyb3VnaCBob3cgaXQgd2lsbCB3b3JrIGUu
Zy4gZm9yIHBvd2VyIG1hbmFnZW1lbnQgd291bGQNCj4gPiBiZSBhIGdvb2QgZXhjZXJjaXNlIHRv
IGZpZ3VyZSBvdXQgaG93IGl0IHNob3VsZCB3b3JrIGluIGRldGFpbC4NCj4gPiBQYXJhdiBkaWQg
eW91IGluZGljYXRlIGF0IHNvbWUgcG9pbnQgYSB2aXJ0aW8gc3BlY2lmaWMgU1VTUEVORCBiaXQg
Y2FuDQo+ID4gYmUgdXNlZnVsIGZvciBQTT8gQ291bGQgeW91IHNoYXJlIGhvdyBpdCdzIGJldHRl
ciB0aGFuIHRyYW5zcG9ydCBsZXZlbA0KPiA+IFBNIGFuZCB3aGF0IHRoZSByZXF1aXJlbWVudHMg
YXJlPw0KPiA+IFRoYW5rcyENCj4gRG8geW91IG1lYW4gbGV0dGluZyB0aGUgZGV2aWNlIGVudGVy
IGEgbmV3IHBvd2VyIHN0YXRlIHdoZW4gU1VTUEVORCwgYW5kDQo+IHN1Y2ggZGVzY3JpcHRpb24g
aW4gdHJhbnNwb3J0LXBjaS50ZXg/IFRoZW4gcmVzdW1lIG5vcm1hbCBzdGF0ZSBvbg0KPiBEUklW
RVJfT0suDQoNCk15IHByb3Bvc2FsIGlzLCANCjEuIHN1c3BlbmQgYml0IChub3Qgc3RhdGUpIHRv
IGJlIGNvbnRyb2xsZWQgYnkgdGhlIGd1ZXN0IGRyaXZlcg0KMi4gdGhpcyBiaXQgbXVzdCBiZSBi
dXN5IHBvbGwgdHlwZS4gTWVhbmluZywgDQphLiB0aGUgZHJpdmVyIG11c3QgZ2V0IGFja25vd2xl
ZGdlbWVudCBmcm9tIHRoZSBkZXZpY2UgdGhhdCB0aGUgc3VzcGVuZCBvcGVyYXRpb24gaXMgY29t
cGxldGVkIGluIHRoZSBkZXZpY2UuDQpiLiB0aGUgZHJpdmVyIG11c3QgZ2V0IGFja25vd2xlZGdl
bWVudCBmcm9tIHRoZSBkZXZpY2UgdGhhdCB0aGUgcmVzdW1lIG9wZXJhdGlvbiBpcyBjb21wbGV0
ZWQgaW4gdGhlIGRldmljZS4NCg0KMy4gTm90IHRvIGNvbmZ1c2UgdGhpcyB3aXRoIGFkbWluaXN0
cmF0aXZlIG1vZGUgYWN0aXZlL3N0b3AvZnJlZXplIHNldCBieSB0aGUgb3duZXIgZGV2aWNlIGR1
cmluZyBkZXZpY2UgbWlncmF0aW9uDQoNCjQuIFRoaXMgZmVhdHVyZSBpcyB1c2FibGUgaW4gcG93
ZXIgbWFuYWdlbWVudCB1c2UgY2FzZSBhbmQgbWF5IGJlIHNvbWUgb3RoZXIuDQo=

