Return-Path: <virtio-comment-return-8368-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A6A0C2BB3F
	for <virtio-comment@archiver.kernel.org>; Wed, 15 Nov 2023 17:37:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 8BD1041F25
	for <virtio-comment@archiver.kernel.org>; Wed, 15 Nov 2023 17:37:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 761DC986DB7
	for <virtio-comment@archiver.kernel.org>; Wed, 15 Nov 2023 17:37:49 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6A5C3986DB5; Wed, 15 Nov 2023 17:37:49 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5C8BB986DB6
	for <virtio-comment@lists.oasis-open.org>; Wed, 15 Nov 2023 17:37:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kEr2eDrJzZS843YJ+2TL1BUEOaadFavpZiyURvHsHzcR++PbmfzIqviAffd87H3w7dMH2fjN6ETKkAdIUX/OeFgPOfni7g9+DbJbBGSF2OMA89WG/x8NwNj/RXmy9yJLg3NsQ3i8wiP1lm31nFFjbflCKCGIOReBR+ePI0KuOWQanLG4dfx5iRABrR8KGN2/lWOBsbAg/eXCB6fVHSfzOmxJkFmrXtp5DKmotBvBrq0MZbzH1JxBG6m4wLVAUGsVJyT6rL2Hmaz8QtKX1VqZPCkA519QFmrykbMaQqIXlHPhaYRZy9qZqy5WcdSmd8NNlIc1lpR/w+xLlhVXORJHLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+nk7erEX1jVAv0iad2GyYuw3MiJzRcNef1YvlEK251g=;
 b=igQMhbQwj3FItnIt9kznigG9jqsCmEr6CF70PjPP+6DTe8dIDGbGfn0DjG9II9dzrlBrL7UpSGbupC+j1yMH6W1jYsPheKOKT9kuXpp0WmHQ12VDCURgs1DaGRooajx49YYplVclXNz+wqzlFzdv9pRaz2MJvjYaaTx/GIHiowoEbor04YA1z2en51S/d4tlyOUUzKetDOwodQXFa0hJFNENNfNTjIKJGdFVXRLLl4wje3TE6QIvC577qB7nu4jsj+NrUsbXVTVaVvPSONNeWlv0EjqU23IlpM4l7bZ2CeSo2+2GpulXnV4doLzk5PDLg1doLRef6bddrH7O3hmJyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Jason Wang <jasowang@redhat.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com"
	<sburla@marvell.com>, Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb
	<maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
	"lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Thread-Topic: [PATCH v3 6/8] admin: Add theory of operation for write
 recording commands
Thread-Index:
 AQHaEfwUGl0o9tnLPEOcv64rj4RwurBwFAEAgAFCeICAAEregIABfKLQgASEhoCABAQNMA==
Date: Wed, 15 Nov 2023 17:37:46 +0000
Message-ID:
 <PH0PR12MB54810DA3AAA7631319B2C1BFDCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <DM8PR12MB54809F8316720CE5C1BCFF33DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEtFyH_wJAqTz=jwosVM-=SRuO+wpT7NM=Eod8ExsxfTsg@mail.gmail.com>
 <PH0PR12MB54814420718AB387C0C84C07DCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtGvDxF1Dnb6FJDK8XEAUcast-7OnuzTyfAr7m0LURWMw@mail.gmail.com>
 <PH0PR12MB548152A30021BEBFFCA62AA9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEv8mccZfcA4n+KVwdkaWAqhM94Qhq8H5Rvw2CocCmt9UA@mail.gmail.com>
 <20231107015412-mutt-send-email-mst@kernel.org>
 <CACGkMEv+jir2+f_vHmi_KjFXf0yz+EQmEbvzX0pheHKsVJkWZw@mail.gmail.com>
 <20231108025854-mutt-send-email-mst@kernel.org>
 <CACGkMEvkQawXWCvu7rZHnZk8YsNunS_B-fcQmEHEe_N87Q6y6g@mail.gmail.com>
 <20231109022647-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54813C84CFA5601DB1B47885DCAEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu-Zs-dxcYRjtV+hLBVy5Tv9JzgT2c83Zjzt7A-a1QR2A@mail.gmail.com>
In-Reply-To:
 <CACGkMEu-Zs-dxcYRjtV+hLBVy5Tv9JzgT2c83Zjzt7A-a1QR2A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|PH7PR12MB9128:EE_
x-ms-office365-filtering-correlation-id: 6e2622a3-ac57-4aa3-8a41-08dbe60194bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 9WvZ4Ok0ktdgJmpjAFZ8kg/C2G2ud9Hdzf5VmDCY1UC7XnzI5fGHNqFBK0T4lNdKPEVOmQk95NYXC0BHJuD4jEdFgxIPXbcU3wNDped/NCJ9LDKCv1eVZikd+hXySjAlyGV9TkVnFnWRk860RkhCdMQdBu8IVZKJlX5rnBvlzVd2wXbrGSWxjf44iEGRXLJoJzYwrH2JBqa8H6qt2i3SuKEtB2FHN1TXEcZnO0ba0I1PszcnWcW40iXzYN9qwLwQyqMucDuzXwEjJgQi8YazGya8w8Q0dvrgfQwxn7UkF0VXkTeGpd0QTMg1TbtXB7SKp9rFSX8JfgV8eZNKrset8xiEKFd5iL6bGMCKKSHWAzpkZ21Radl2DJvwVRWeZtRCDuYIyFjoZxK1wMe86zPRDaG+3WtdodpB84sD/QqSUbkf+Xd35NmbG7RUTB3Z2oaUx0FI5IhjIzhQUi2EzjOI8jKsy6fY6Vn0db5NKdeofI2/fqFUMgnckqgtSsr3i2y9S/U29JeMz7dHq8pQ5g152Odg6J0sfobXq2x64/vZaX4yDVCj+LoGtsnrx/mhb24/1Gvo16Xa34AiETv9/wgWlswU2tdJatrb5/IUloODvfkmK6CGk4A6BHrUMuHk+/iB
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(346002)(376002)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(38070700009)(38100700002)(83380400001)(54906003)(66946007)(64756008)(8676002)(8936002)(66476007)(66446008)(66556008)(76116006)(4326008)(122000001)(55016003)(41300700001)(26005)(9686003)(6506007)(53546011)(7696005)(86362001)(478600001)(2906002)(6916009)(316002)(52536014)(33656002)(71200400001)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M0NBbkRQenZPZ0FNSE9SeU9hYTdSVytpTERpMVkrUDNyOGVEcGRFQW1lTW1G?=
 =?utf-8?B?dndTK2ZaR3llU2J3M0ZnRnZVcWIveFFNUUx0NEVtR1dLOGh0bDBrcTgyZURT?=
 =?utf-8?B?ZElUOWsxRmhCNkhDS01ONHlFNURrRWh3VEloM1FFSE8zVFVxQUNpSjY4NHFj?=
 =?utf-8?B?TFdzSk9oR3puVjJmZTBqM1h0endsRE9RQ0FyaCtnSTJqTjJSbENXWkZNTUYx?=
 =?utf-8?B?UjFHSllsSldJazdDRlJLaFRZVGl1VTdGSmVRekZuTmxUTHMrcG4rczRvWHhS?=
 =?utf-8?B?RGZGK1doZ3BweTNWUncxeVdIZGJzL1oxK0wvZ05udVBpdWtjSldRVEEwUjVz?=
 =?utf-8?B?alZpMmlWcHNWT09KTTF2MWQrVHVhc0tqS09jU041ZzJVSVkvTGhZRnZxNlJM?=
 =?utf-8?B?elhZdTVYejhpa0pLYStSUUJ6eEdsYVgrWlA4M1RyL2ttUFhWcWJjNmtmb0ZK?=
 =?utf-8?B?S0lwS3RCSkpPZEpnT1ZzL0czR05kKzhxTUMvSE5NZEw5WVZ1eTJpV2IvQnph?=
 =?utf-8?B?UlAvOENPMG8wUFo5QWtMY2svSFZTS1VYb0txbnJXVm5RR1BOc2VXbXBKZlhS?=
 =?utf-8?B?SnY0djQ1alJjWDNzLzh6TU50M05Wd2M1ZThMcHFlNEZBRkk2STBqSDJWUkpR?=
 =?utf-8?B?UWtOR3N1aHVHWXgwZG4xRWZSbG5UQ1B1RWNybHZsak5NUzdJRmRBak5zYXRB?=
 =?utf-8?B?VHBkZ1lhWmNlUmI0N21pWkY2b1FyMnZZRVJVNllKK056dTlvRmRNRGhTbEZp?=
 =?utf-8?B?bGpPbUpjM1NaYjdPL256bXc0c2NqYlZLditNVm5CcFJEcGFNZ2ZxWitsZFZV?=
 =?utf-8?B?ZjFpdXFiQnlvNFNKbjR4NDVlOUZkNnVzQ3FXaDJrREdVS2xRREd4VG9oTWdp?=
 =?utf-8?B?RkhHa3J6Q1VBanBpMVlQa1l2Y0tJUWVmM1FsWjhTcG5lUkk1MjNWdk5rNzhV?=
 =?utf-8?B?SUNWdUZ3ZDNuWHZBS1ova294UjNEaFNtR01nRmllVVFXZThDM2NhVDk0UkJR?=
 =?utf-8?B?OVBHQlFiVjFJSGVIajNDWU9SaWlER3NjU2NEdVQvTnVHbjNkY1p1VW5uRFk5?=
 =?utf-8?B?TjVKYTIveXRRTlFhK3JZTlRLUEhGOC9qSTBObVV1cTl6Qm13QjJQbEc5MFNK?=
 =?utf-8?B?d3dmQ0xmeEpPaGtXQy9zdCtndnhkR0N2dFgwMyt2WW9DTjJDU0U0UWlJSk5S?=
 =?utf-8?B?cmphK2IzTTFSYWJFNkZnTGg1amdoVkhRZ0ROWXhjSGdwR3Y5ZU5zREttbE42?=
 =?utf-8?B?UStvS1pmUzlKV2JsZ3EramZRRkJzbGJKeVZXZDZPbUtQOXNqWFRWc3hkYWtK?=
 =?utf-8?B?NnpIS0t2SmpxMER0UGh4czJsQWgxS05oRWxJWEZHeUw4dFlqQlA5RUpPZTNT?=
 =?utf-8?B?SDA2NU5oRHFnbjg5TWlsSysxK2llNmpnWUVjTk5JaHprSklhSzJMUGJ4WSsv?=
 =?utf-8?B?dThrK3k3bVZaYU1DcXlBRFNJM1htQnV3aEhFRklWVy9wK2xiVE1mWW1Pd203?=
 =?utf-8?B?SG1JdGwwS1dFRGNsN2x5RjB4WVgybUlidmZuRTlPY2g5MWNIVGVudkVhZXNC?=
 =?utf-8?B?ZHhpQmtzb1J6VHp2RFJGRWtsc1k4RnkwRjBkZFV2RW1mVnJBSmFscGNMcnJl?=
 =?utf-8?B?bHhHS3F2cERsVGd5SEg5TVI4a1VaUlBHc1lEMFFIOXFpVTFKTmlReHYvaHVx?=
 =?utf-8?B?eHEzWkdVZW1XL2EvQUxDUndNRnE4ZTNOUFk3NzdMU3c2OFhPOE1GTTV0bVU4?=
 =?utf-8?B?UGU1NGQ4RVRiVmxBdkZkTjg3cURrckZldGltWC9NWW9qc29TU3pHR1F5Nk1q?=
 =?utf-8?B?VjlZSG1vZEV0OTFRaXJFdVVkSzhYcUNRa1hsYUdqeWdXUFRYcTBmcW1jdW1k?=
 =?utf-8?B?Yll2VWdLTGY3Z2JGUlExQlNnNlVVa2JPc1k2emIrSFFpRFo2N0dISFk4K3ht?=
 =?utf-8?B?bHJHOGJJN043WUtsdWpGRFVxR0hlQXNOdVVqTEVwanpFOXNGL3NpY0hjU1Az?=
 =?utf-8?B?U2E5STRTNVgydjhWSE8wbDd5OXhGRHhMNkU1WjAvWmNlNkdjZ0JPTGFHSmdt?=
 =?utf-8?B?U3dwNHhmQlVrUUNnbTcwNXlaaHlqRkpRMzNxTXkwVGFrOFFwNTMrdlE5Z3Zp?=
 =?utf-8?Q?pjkc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e2622a3-ac57-4aa3-8a41-08dbe60194bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2023 17:37:46.7286
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VLm+Q2ETjgEE7Pz/mt3AvCGcS4Ck8W+Taz7gMpdxgbPDqeQzg9xTNZXiVn0N9aJfHWDJH7k0JwDk918VQ868Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9128
Subject: [virtio-comment] RE: [PATCH v3 6/8] admin: Add theory of operation for write recording
 commands

DQo+IEZyb206IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+DQo+IFNlbnQ6IE1vbmRh
eSwgTm92ZW1iZXIgMTMsIDIwMjMgOToxMSBBTQ0KPiANCj4gT24gRnJpLCBOb3YgMTAsIDIwMjMg
YXQgMjo0NuKAr1BNIFBhcmF2IFBhbmRpdCA8cGFyYXZAbnZpZGlhLmNvbT4gd3JvdGU6DQo+ID4N
Cj4gPiBIaSBNaWNoYWVsLA0KPiA+DQo+ID4gPiBGcm9tOiBNaWNoYWVsIFMuIFRzaXJraW4gPG1z
dEByZWRoYXQuY29tPg0KPiA+ID4gU2VudDogVGh1cnNkYXksIE5vdmVtYmVyIDksIDIwMjMgMToy
OSBQTQ0KPiA+DQo+ID4gWy4uXQ0KPiA+ID4gPiBCZXNpZGVzIHRoZSBpc3N1ZSBvZiBwZXJmb3Jt
YW5jZSwgaXQncyBhbHNvIHJhY3ksIGFzc3VtaW5nIHdlIGFyZQ0KPiA+ID4gPiBsb2dnaW5nDQo+
ID4gPiBJT1ZBLg0KPiA+ID4gPg0KPiA+ID4gPiAwKSBkZXZpY2UgbG9nIElPVkENCj4gPiA+ID4g
MSkgaHlwZXJ2aXNvciBmZXRjaGVzIElPVkEgZnJvbSBsb2cgYnVmZmVyDQo+ID4gPiA+IDIpIGd1
ZXN0IG1hcCBJT1ZBIHRvIGEgbmV3IEdQQQ0KPiA+ID4gPiAzKSBoeXBlcnZpc29yIHRyYXZlcnNl
IGd1ZXN0IHRhYmxlIHRvIGdldCBJT1ZBIHRvIG5ldyBHUEENCj4gPiA+ID4NCj4gPiA+ID4gVGhl
biB3ZSBsb3N0IHRoZSBvbGQgR1BBLg0KPiA+ID4NCj4gPiA+IEludGVyZXN0aW5nIGFuZCBhIGdv
b2QgcG9pbnQuIEFuZCBieSB0aGUgd2F5IGUuZy4gdmhvc3QgaGFzIHRoZSBzYW1lDQo+ID4gPiBp
c3N1ZS4gIFlvdSBuZWVkIHRvIGZsdXNoIGRpcnR5IHRyYWNraW5nIGluZm8gd2hlbiBjaGFuZ2lu
ZyB0aGUNCj4gPiA+IG1hcHBpbmdzIHNvbWVob3cuICBQYXJhdiB3aGF0J3MgdGhlIHBsYW4gZm9y
IHRoaXM/IFNob3VsZCBiZSBhZGRyZXNzZWQgaW4NCj4gdGhlIHNwZWMgdG9vLg0KPiA+ID4NCj4g
PiBBcyB5b3UgbGlzdGVkIHRoZSBmbHVzaCBpcyBuZWVkZWQgZm9yIHZob3N0IG9yIGRldmljZS1i
YXNlZCBEUFQuDQo+IA0KPiBXaGF0IGRvZXMgRFBUIG1lYW4/IERldmljZSBQYWdlIFRhYmxlPyBM
ZXQncyBub3QgaW52ZW50IHRlcm1pbm9sb2d5IHdoaWNoIGlzDQo+IG5vdCBrbm93biBieSBvdGhl
cnMgcGxlYXNlLg0KPg0KU29ycnkgZm9yIHVzaW5nIHRoZSBhY3JvbnltLiBJIG1lYW50IGRpcnR5
IHBhZ2UgdHJhY2tpbmcuDQogDQo+IFdlIGhhdmUgZGlzY3Vzc2VkIGl0IG1hbnkgdGltZXMuIFlv
dSBjYW4ndCBqdXN0IGRlcGVuZCBvbiBBVFMgb3IgcmVpbnZlbnRpbmcNCj4gd2hlZWxzIGluIHZp
cnRpby4NClRoZSBkZXBlbmRlbmN5IGlzIG9uIHRoZSBpb21tdSB3aGljaCB3b3VsZCBoYXZlIHRo
ZSBtYXBwaW5nIG9mIEdJT1ZBIHRvIEdQQSBsaWtlIGFueSBzdyBpbXBsZW1lbnRhdGlvbi4NCk5v
IGRlcGVuZGVuY3kgb24gQVRTLg0KDQo+IA0KPiBXaGF0J3MgbW9yZSwgcGxlYXNlIHRyeSBub3Qg
dG8gZ2l2ZSBtZSB0aGUgaW1wcmVzc2lvbiB0aGF0IHRoZSBwcm9wb3NhbCBpcw0KPiBvcHRpbWl6
ZWQgZm9yIGEgc3BlY2lmaWMgdmVuZG9yIChsaWtlIGRldmljZSBJT01NVSBzdHVmZnMpLg0KPg0K
WW91IHNob3VsZCBzdG9wIGNhbGxpbmcgdGhpcyBzcGVjaWZpYyB2ZW5kb3IgdGhpbmcuDQpPbmUg
Y2FuIGVxdWFsbHkgc2F5IHRoYXQgc3VzcGVuZCBiaXQgcHJvcG9zYWwgaXMgZm9yIHRoZSBzd192
ZW5kb3IgZGV2aWNlIHdobyBpcyBmb3JjaW5nIHZpcnRpbyBodyBkZXZpY2UgdG8gb25seSBpbXBs
ZW1lbnQgaW9xdWV1ZXMgKyBQQVNJRCArIG5vbl91bmlmaWVkIGludGVyZmFjZSBmb3IgUEYsIFZG
LCBTSU9WcyArIG5vbl9URElTUCBiYXNlZCBkZXZpY2VzLg0KIA0KPiA+IFRoZSBuZWNlc3Nhcnkg
cGx1bWJpbmcgaXMgYWxyZWFkeSBjb3ZlcmVkIGZvciB0aGlzIGluIHRoZSBxdWVyeSAocmVhZCBh
bmQNCj4gY2xlYXIpIGNvbW1hbmQgb2YgdGhpcyB2MyBwcm9wb3NhbC4NCj4gDQo+IFRoZSBpc3N1
ZSBpcyBsb2dnaW5nIHZpYSBJT1ZBIC4uLiBJIGRvbid0IHNlZSBob3cgInJlYWQgYW5kIGNsZWFy
IiBjYW4gaGVscC4NCj4gDQpSZWFkIGFuZCBjbGVhciBoZWxwcyB0aGF0IGVuc3VyZXMgdGhhdCBh
bGwgdGhlIGRpcnR5IHBhZ2VzIGFyZSByZXBvcnRlZCwgaGVuY2UgdGhlcmUgaXMgbm8gbWFwcGlu
Zy91bm1hcHBpbmcgcmFjZS4NCkFzIGV2ZXJ5dGhpbmcgaXMgcmVwb3J0ZWQuDQoNCj4gPiBJdCBp
cyBsaXN0ZWQgaW4gRGV2aWNlIFdyaXRlIFJlY29yZHMgUmVhZCBDb21tYW5kLg0KPiANCj4gUGxl
YXNlIGV4cGxhaW4gaG93IHlvdXIgcHJvcG9zYWwgY2FuIHNvbHZlIHRoZSBhYm92ZSByYWNlLg0K
PiANCkluIGJlbG93IG1hbm5lci4NCjEuIGd1ZXN0IGhhcyBHSU9WQSB0byBHUEFfMSBtYXBwaW5n
DQoyLiBSWCBwYWNrZXRzIG9jY3VycmVkIHRvIEdJT1ZBDQozLiBkZXZpY2UgcmVwb3J0ZWQgZGly
dHkgcGFnZSBsb2cgZm9yIEdJT1ZBIChoeXBlcnZpc29yIGlzIHlldCB0byByZWFkKQ0KNC4gZ3Vl
c3QgcmVxdWVzdGVkIG1hcHBpbmcgY2hhbmdlIGZyb20gR0lPVkEgdG8gR1BBXzINCjQuMSBEdXJp
bmcgdGhpcyBJT1RMQiBpcyBpbnZhbGlkYXRlZCBhbmQgZGlydHkgcGFnZSByZXBvcnQgaXMgcXVl
cmllZCBlbnN1cmluZywgaXQgY2FuIGNoYW5nZSB0aGUgbWFwcGluZw0KDQo+ID4NCj4gPiBXaGVu
IHRoZSBwYWdlIHdyaXRlIHJlY29yZCBpcyBmdWxseSByZWFkLCBpdCBpcyBmbHVzaGVkLg0KPiA+
IEhvdy93aGVuIHRvIHVzZSwgSSB0aGluayBpdHMgaHlwZXJ2aXNvciBzcGVjaWZpYywgc28gd2Ug
cHJvYmFibHkgYmV0dGVyIG9mZiBub3QNCj4gZG9jdW1lbnRpbmcgdGhvc2UgZGV0YWlscy4NCj4g
DQo+IFdlbGwsIGFzIHRoZSBhdXRob3Igb2YgdGhpcyBwcm9wb3NhbCwgYXQgbGVhc3QgeW91IG5l
ZWQgdG8ga25vdyBob3cgYSBoeXBlcnZpc29yDQo+IGNhbiB3b3JrIHdpdGggeW91ciBwcm9wb3Nh
bCwgbm8/DQo+DQpMaWtlbHkgeWVzLCBidXQgaXQgaXMgbm90IHRoZSBzY29wZSBvZiB0aGUgc3Bl
YyB0byBsaXN0IHRob3NlIHBhdGhzIGV0Yy4NCg0KPiA+IE1heSBiZSBzdWNoIHJlYWQgaXMgbmVl
ZGVkIGluIHNvbWUgb3RoZXIgcGF0aCB0b28gZGVwZW5kaW5nIG9uIGhvdw0KPiBoeXBlcnZpc29y
IGltcGxlbWVudGVkLg0KPiANCj4gV2hhdCBkbyB5b3UgbWVhbiBieSAiTWF5IGJlIC4uLiBzb21l
IG90aGVyIHBhdGgiIGhlcmU/IFlvdSdyZSBpbnZlbnRpbmcgYQ0KPiBtZWNoYW5pc20gdGhhdCB5
b3UgZG9uJ3Qga25vdyBob3cgYSBoeXBlcnZpc29yIGNhbiB1c2U/DQoNCk5vLiBJIG1lYW50IGh5
cGVydmlzb3IgbWF5IGhhdmUgbW9yZSBvcGVyYXRpb25zIHRoYXQgbWFwL3VubWFwL2ZsdXNoIHdo
ZXJlIGl0IG1heSBuZWVkIHRvIGltcGxlbWVudCBpdC4NClNvbWUgb25lIG1heSBjYWxsIGl0IHNl
dF9tYXAoKSwgc29tZSBtYXkgc2F5IGRtYV9tYXAoKS4uLg0K

