Return-Path: <virtio-comment-return-8474-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E056C197A0
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 14:50:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E34E426A3C
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 14:50:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AAF86986E31
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 14:50:34 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 986B1986E25; Fri, 17 Nov 2023 14:50:34 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A5ACE986E26
	for <virtio-comment@lists.oasis-open.org>; Fri, 17 Nov 2023 14:49:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Us89j4vjIJbeszOgCjfRKJvU8yfRhqzVCFgaXMsZ3njAB8cnx/PkbnHccg/6etdz9oO/Ok/5XiM95X+QchUmMRTGaeLhWhUvB2mwC0bfARgRb4hwwOGbTP3P9L/E5h4qsOwh1argSHkFeZYPIlsb1xfrkGaXEZZeLH2/5NuRsckKg8J2MdwoIWNcEk5G5V+41mXpkuIen7or+vteOuR7M7njZfK11lYql8GvSjbfcqZioFbySMo5qWN7d0h0k9ZGGvKuCHjQ4ZPRAi+kFbB3oOGDgNoRWfDBWiOuuHyo9kLoiOLvyNSRVkqA0lQnjH1qgIxtUUduWqZig9WQSGWcKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LwsD6V7w4TFKsNJ9pj25Kq5UoVQ+C/CI3z7oypinR0U=;
 b=JmqeYFTCGE8+SSWCxvtjt2uW46k49ErgNlly7HwI1FLZoXY5qKk5MvNQE68vcEqvR77kD9+3/x3xdxrmBRnzgTQTU6FqIRiMNOQunK9pyqcuU9isQHbkTnhdUyDWQeVnlWQjW9bg2K5m9diHaD+VXGhULhPDrN//uL5WKqt2wmxJgSvGob94thT3L1MpkxovmGW7v2mfxPJkHYFsPCbYLo9rNxCzn++/sSW8Cov/KWVv4mUMcIUJRfkBIbGPn08xiXNrW9tjz8dq5tUOLdfKmGx9UvK9M4u96OTn+5q051t3Hn+gFNpCkoMI1XJJLyRW1s47Muc/64nCq8T3s97gMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>, "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Thread-Topic: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands
Thread-Index:
 AQHaEfwUGl0o9tnLPEOcv64rj4RwurBwFAEAgAFCeICAAEregIAF/oGAgAPhNHCAAtkIAIAAAl/AgAAPhQCAAACmgIAAB8mAgAAD0iCAAAlyAIAAAp7ggAAUAoCAAAztEA==
Date: Fri, 17 Nov 2023 14:49:03 +0000
Message-ID:
 <PH0PR12MB5481F53F5B5C932C874498FBDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <CACGkMEuSpZ0Y8kxXv26b38pvX--OCdvWm5KvMniqo=W10ruBTA@mail.gmail.com>
 <PH0PR12MB5481170EBDD5A8EBFF6C84C7DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117050838-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481101F980800BDAB4EB24CDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117061122-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54819ACE638B70505B131B28DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117064344-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481BEBAA57399B3A9CF2795DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117073250-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481473DCF72D2CB13AC61C6DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117085422-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231117085422-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SJ0PR12MB8115:EE_
x-ms-office365-filtering-correlation-id: b15cce7b-ab2f-40b3-69b4-08dbe77c57b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 voA6Fb+IgTiUJy8r71Jwgg48CTJSpnjNGu2VSrY5uyUFQUS5zv7B1MmKpuWqAV5/RdWQv7ixw4Xl6oNRoE0jIuR6XW4djHbJ9rixrkr0bTWjj67YA0HgJGYjfAjmxrnS+ETyCgFYks4MpRdDXCnxaxb3IVf15g4hDEM86XWzg3euVB399EG2zfsNmwwSggE9HrpDFOg8pj5DZzbSQ4Zqy+lKMP5m/TRNtA1/xWw6MJV5qGsJIbowEw9yRJXT79aXo6dUIFhvyBqlZVs6Jc+XfSZasbtlOrWB7EWbebA/KHEDDaF3+Bu4+Nh+kKRfsf4wKb/NigN4XxdkIQn3n5Qsm3QVOSYr2Th6/1UqAWVixtGXEnZ5/pYh43x6Gk8gKhvbuqGQUxf0Fsc8+2T0hRh8a70FWpeN3td7zHrtxK3z3HlZOouTUBIO1iCU4U1ny2NhNlGFCm/DwBd1/QcECKRrIX37K3QjOgx5Litz860CjPHy6yUPnGg/Ji6r1PL2mHRKuUvcQMkE+8h1YCrht9d0vCYJKbEjQOTGvVEwTzG4gRuMQPE3mrAgQ9j7aT0/mbn2juAhbZ8UMGVU+fKE4otEsiK3xxgVDAbG4ds6dyQqY9Rfk6KI9Ok5hy0AVZxw6iVg
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(346002)(376002)(396003)(366004)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(6506007)(7696005)(8676002)(53546011)(8936002)(55236004)(4326008)(66446008)(66476007)(76116006)(6916009)(64756008)(55016003)(316002)(86362001)(66946007)(83380400001)(66556008)(478600001)(71200400001)(33656002)(52536014)(9686003)(26005)(54906003)(2906002)(5660300002)(38100700002)(122000001)(38070700009)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WkZDK0pZeWhjVGZNdG8zN1lNYWxyejN4YlJEbjJ5VGY1U1V4ZzRmMXE2NHpM?=
 =?utf-8?B?dHlvZlhGQ3pRL2lFVEVjQTVxdmRYaGdNY2lMMXZKM2RWYTV3R29LR3VDZFJY?=
 =?utf-8?B?VTlqUmVkbEROTDBwZXh0T1FaaEE5SXlmTjNoOGVKU25zb2JVbk9aSjJZRTRT?=
 =?utf-8?B?YXQ4emRpUW9DaFhkOWZIazBiRTV3cWxIWXhicmpNaUt4V1kvZnlqdjVGVVJo?=
 =?utf-8?B?ajg2UVYxRUplMFVUSDFSSUhKYUFkSUd0UElzV2tiZGFoYWdVQnJPNlRLcGVS?=
 =?utf-8?B?UEtMVm9hL0QwdUl6YzRLb1pxSG03S3VvMVB2YXYvTWd6ZGJJYXkzS2phVDR4?=
 =?utf-8?B?RDV5VUpFYmFZZHZyMTRib08vOWZOUmsvYXZyZmJmKzF4MStWVGNSbjFkY0tz?=
 =?utf-8?B?RDB3a2EwUlJTbE9QeXJ1VHVDTk9LRDVkamtrYTVSem04ZUQ5U3A5dDEwZlQ5?=
 =?utf-8?B?dU8zMi9pTlVYZFU0Ri8zWks4OWpvM1FoM0V1bitkcTRzcStVQ0huWkR3R3kw?=
 =?utf-8?B?RDUwRk0vNkFHaElZZkM5ZmZXSUp0ZEhhdGtzNlJWWlhWTy9EM1RZSlZIK3Ev?=
 =?utf-8?B?MXdSOUhLWVlELzkvSmhaMmV0a2hpa1hZS2FQMmZVUGZhaUU4My9LVk5SLzlw?=
 =?utf-8?B?WTg5Tzc0OGhRVFV0djJpM2JtUHRLbTdGTlhLNy9rdVdvcHF0MEswOGdzOVBm?=
 =?utf-8?B?ZVkxd2EzZDIwZnUzekFKM1IvemV3UjJSc095c24xWVF0WkJyazBIZUhHdlhJ?=
 =?utf-8?B?T05sRndFOGdhdUZESXJ5cGZEeTY3czdITWhKcVFyY0R1eG1wK1plWmEzRW1U?=
 =?utf-8?B?L2ExeGU4UlBLb3lyTnZmUG1mcUErM0dPa0RKUnlaMUwxU1NiMW1QVDZBci9M?=
 =?utf-8?B?VWpVeW9wRXE2Ukh2Y1o1RUZONEZVcmJ3N3VBYUFXNDJjRkJoQldUWjZZV291?=
 =?utf-8?B?NlQ5aHM3R2J0YkZ6aXZYSGtmUjJsd2FOcXBsWEpud3Q3dlpkYk1rMW9wL2Ny?=
 =?utf-8?B?MlQvZkYwTjFHYm1VMEpzZkZrejJUZ3hzdi8wVjhJcWFJTG4vODl0VlAzb1Jj?=
 =?utf-8?B?TUovQU1XOUhYWlhsb1RJOGxjUVZKY2F5NEsyeXVaRWgvTndLZTNiZFMzSUNF?=
 =?utf-8?B?U1hTQVFXMU5mQUlsblR6OGRoMTIvbGlPUzAxOU02WDdCSDBUTDk1aSt0VGw0?=
 =?utf-8?B?dHFIdDRaZjAzRUhHU1IxVHh2V2FzTktFSnQ5Uzh3cnQ5b1ZOUnZjRzMzR0kr?=
 =?utf-8?B?RzhPYWFCRFNJZ29HbXhEVnVtc1A2dnRVUzk0OXkwYnY0MmZRSlIxZGsyeGFN?=
 =?utf-8?B?d2VXVFRTb3kyZnpEZDBvRmt6YUFRY1VwektyT21ZaS9VMjZvQTZPMkNsWmpv?=
 =?utf-8?B?L0lOV3hoaGcvNDZFTjFrT2RXcE0zakZYQjEzTTBXalp3WUhzTGFkMlJ3UEdK?=
 =?utf-8?B?emdPNUNob3FUdXdZYWRPM29qQUQ1YjlpaFNzUW5mRk15Z0hKb0tzWlN5RzJE?=
 =?utf-8?B?a1NXMVNwTC9rRnk0S2doSWhxRGkxN3pXWTBhUGZpM3NQLzI0VEQvUnJvbWMv?=
 =?utf-8?B?VWs5Nks0ak13d2E2YWdKMGxwNS8zSTZvQWZnRDI0ZFJlQ2FkaXR4Z1RwbTZ5?=
 =?utf-8?B?dTJjU2lGNkNDYXZqS3FIVTUzeVV4MExmbENlOEkyOFdNVlRNb1BRdk1PeUs4?=
 =?utf-8?B?NExIT3UyYkx6YXFnM05sWjBjLzNXbCtWcVczVVJYSTA5Q1AyTUlKRm5QN0ZZ?=
 =?utf-8?B?eFVFdFMzOVcxb0cwNHdNR2duQXR6MmNUb3VRY3dOT2dxMUJLMGtaQzhzWFdE?=
 =?utf-8?B?Zy9LRUUzb1BOT25RUHdxeEpLRFJNOEpJbllVb3Z4eC9vT3lHc2FmQ1VLZW5F?=
 =?utf-8?B?ZlFXZVhYWkxMVGVra05pSVV4MzlncXdPYit3akhQdFI3S2xoWG9zVC9teVpo?=
 =?utf-8?B?dSswZjFLTnNlRXMzNitZTnpkNHJOaEhyaDdoNEpqdU1MKy9MU3NjRG1OVXVO?=
 =?utf-8?B?T3Bqak4rc0ZxMmdJY055WnJ4QXE4eDJnY2g4MC9mUTNLVk1PRHU5ZWpuSUZj?=
 =?utf-8?B?UGI4dW1MaXllU3lLeVBPaTZ2QWxnd3RnUDVDcXFmbU9weWVWaWtZQ0h3elBQ?=
 =?utf-8?Q?UBCA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b15cce7b-ab2f-40b3-69b4-08dbe77c57b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2023 14:49:03.6297
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HEZv+Dcxnw+jaAqop0bHcrlp4LfGlG/OkgmvkT7haQqkXpYcdpxfdTkd7G1baeAF0fpO/j6Ir4aZPk7RDVH0Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8115
Subject: RE: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands

DQo+IEZyb206IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+DQo+IFNlbnQ6IEZy
aWRheSwgTm92ZW1iZXIgMTcsIDIwMjMgNzoyOCBQTQ0KPiANCj4gT24gRnJpLCBOb3YgMTcsIDIw
MjMgYXQgMTI6NDk6MzZQTSArMDAwMCwgUGFyYXYgUGFuZGl0IHdyb3RlOg0KPiA+DQo+ID4NCj4g
PiA+IEZyb206IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+DQo+ID4gPiBTZW50
OiBGcmlkYXksIE5vdmVtYmVyIDE3LCAyMDIzIDY6MDcgUE0NCj4gPiA+IFRvOiBQYXJhdiBQYW5k
aXQgPHBhcmF2QG52aWRpYS5jb20+DQo+ID4gPg0KPiA+ID4gT24gRnJpLCBOb3YgMTcsIDIwMjMg
YXQgMTI6MTU6NTRQTSArMDAwMCwgUGFyYXYgUGFuZGl0IHdyb3RlOg0KPiA+ID4gPiBIaSBBbGV4
LCBKYXNvbiwNCj4gPiA+ID4NCj4gPiA+ID4gPiBGcm9tOiBNaWNoYWVsIFMuIFRzaXJraW4gPG1z
dEByZWRoYXQuY29tPg0KPiA+ID4gPiA+IFNlbnQ6IEZyaWRheSwgTm92ZW1iZXIgMTcsIDIwMjMg
NToyMCBQTQ0KPiA+ID4gPiA+IFRvOiBQYXJhdiBQYW5kaXQgPHBhcmF2QG52aWRpYS5jb20+DQo+
ID4gPiA+DQo+ID4gPiA+ID4gPiA+IEFsbG9jYXRpbmcgcmVzb3VyY2VzIG9uIG91dGdvaW5nIG1p
Z3JhdGlvbiBpcyBhIHZlcnkgYmFkIGlkZWEuDQo+ID4gPiA+ID4gPiA+IEl0IGlzIGNvbW1vbiB0
byBtaWdyYXRlIHByY2lzZWx5IGJlY2F1c2UgeW91IGFyZSBvdXQgb2YgcmVzb3VyY2VzLg0KPiA+
ID4gPiA+ID4gPiBJbmNvbWluZyBpcyBhIGRpZmZlcmVudCBzdG9yeSwgbGVzcyBvZiBhIHByb2Js
ZW0uDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBUaGUgcmVzb3VyY2UgYWxsb2NhdGVkIG1h
eSBub3QgYmUgb24gc2FtZSBzeXN0ZW0uDQo+ID4gPiA+ID4gPiBBbHNvIHRoZSByZXNvdXJjZSBh
bGxvY2F0ZWQgd2hpbGUgdGhlIFZNIGlzIHJ1bm5pbmcsIHNvIEkNCj4gPiA+ID4gPiA+IGRvbuKA
mXQgc2VlIGENCj4gPiA+IHByb2JsZW0uDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IEFkZGl0aW9u
YWxseSwgdGhpcyBpcyBub3Qgd2hhdCB0aGUgTGludXgga2VybmVsIG1haW50YWluZXJzIG9mDQo+
ID4gPiA+ID4gPiBpb21tdSBzdWJzeXN0ZW0NCj4gPiA+ID4gPiB0b2xkIHVzIGVpdGhlci4NCj4g
PiA+ID4gPiA+IExldCBtZSBrbm93IGlmIHlvdSBjaGVjayB3aXRoIEFsZXggVyBhbmQgSmFzb24g
d2hvIGJ1aWxkIHRoaXMNCj4gaW50ZXJmYWNlLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gVkZJTyBn
dXlzIGhhdmUgdGhlaXIgb3duIGlkZWFzLCBpZiB0aGV5IHdhbnQgdG8gdGFsayB0byB2aXJ0aW8N
Cj4gPiA+ID4gPiBndXlzIHRoZXkgY2FuIGNvbWUgaGVyZSBhbmQgZG8gdGhhdC4NCj4gPiA+ID4N
Cj4gPiA+ID4gU2luY2Ugb25lIG9mIHRoZSB1c2UgY2FzZXMgd291bGQgaGF2ZSBhY2NlcHRlZCB0
byBsZXQgZGlydHkNCj4gPiA+ID4gdHJhY2tpbmcgdG8gZmFpbCwgSQ0KPiA+ID4gZG9udCBzZWUg
YSBwcm9ibGVtLg0KPiA+ID4gPiBUaGlzIGlzIG5vdCB0aGUgb25seSBjb21tYW5kIG9uIHNvdXJj
ZSB0aGF0IGZhaWxzLg0KPiA+ID4gPiBTbyBJIGFudGljaXBhdGUgdGhhdCBRRU1VIGFuZCBsaWJ2
aXJ0IG9yIGFueSB2ZmlvIHVzZXIgd291bGQgYnVpbGQNCj4gPiA+ID4gdGhlDQo+ID4gPiBvcmNo
ZXN0cmF0aW9uIGFyb3VuZCB0aGUgcG9zc2libGUgZmFpbHVyZSBiZWNhdXNlIHRoZSBVQVBJIGlz
IHdlbGwgZGVmaW5lZC4NCj4gPiA+ID4NCj4gPiA+ID4gV2hlbiB0aGVyZSBpcyBoeXBlcnZpc29y
LCB0aGF0IG11c3QgaGF2ZSB6ZXJvIGZhaWx1cmVzIG9uIHNyYw0KPiA+ID4gPiBzaWRlLCBzdWNo
IGtlcm5lbA0KPiA+ID4gKyBkZXZpY2UgY2FuIGJ1aWxkIGV2ZXJ5dGhpbmcgcmVzZXJ2ZWQgdXBm
cm9udC4NCj4gPiA+ID4NCj4gPiA+ID4gRG8geW91IHNheSwgUUVNVSBoYXMgemVybyBtZW1vcnkg
YWxsb2NhdGlvbnMgb24gc291cmNlIHNpZGUgZm9yDQo+IG1pZ3JhdGlvbj8NCj4gPiA+ID4gVGhh
dCB3b3VsZCBiZSBpbnRlcmVzdGluZyB0byBrbm93Lg0KPiA+ID4NCj4gPiA+IE1vcmUgb3IgbGVz
cyB5ZXMuIE1vcmUgcHJlY2lzZWx5IHdoaWxlIGluIHRoZW9yeSBhbGxvY2F0aW9ucyBpdCdzDQo+
ID4gPiBkb2luZyBjYW4gZmFpbCBpbiBwcmFjdGljZSBpdCBoYXBwZW5zIHJhcmVseSBlbm91Z2gg
dGhhdCBRRU1VIGRvZXMNCj4gPiA+IG5vdCBldmVuIGJvdGhlciBjaGVja2luZyBhbmQgd2lsbCBp
bW1lZGlhdGVseSBjcmFzaCBpZiB0aGV5IGRvLiBUaGUNCj4gPiA+IHJlYXNvbiBpcyB0aGF0IGl0
J3MgdXNpbmcgdmlydHVhbCBtZW1vcnksIHNvIGl0IHNjYWxlcyB0byBhIGh1Z2UgbnVtYmVyIG9m
DQo+IFZNcy4NCj4gPiA+IE1pZ3JhdGluZyBhIHNpbmdsZSBWTSBhdCBhIHRpbWUgaXMgbm90IGV2
ZW4gd29ydGggZGlzY3Vzc2luZy4NCj4gPg0KPiA+IFdvdyB0aGF0IGlzIGV2ZW4gbXVjaCB3b3Jz
ZSB0byBjcmFzaCB0aGUgcnVubmluZyBWTSwgaW5zdGVhZCBvZiBmYWlsaW5nIHRoZQ0KPiBtaWdy
YXRpb24uDQo+IA0KPiBJIGFtIHRlbGxpbmcgeW91LiAgSXQgZG9lcyBub3QgcHJhY3RpY2FsbHkg
Y3Jhc2ggYmVjYXVzZSBpdCBkb2VzIG5vdCBhbGxvY2F0ZQ0KPiBwaHlzaWNhbCBtZW1vcnkuDQo+
IA0KT25jZSB5b3UgcnVuIHRocm91Z2ggdGhlIG1lbW9yeSBjZ3JvdXAsIGl0IGNhbiBmYWlsLg0K
DQo+ID4gSSBoYXZlIGxpdmUgbWlncmF0ZWQgVk1zIG9uZSBieSBvbmUgYW5kIGhhdmUgc2VlbiBj
dXN0b21lcnMgbWlncmF0ZSBvbg0KPiBoeXBlcmNvbnZlcmdlZCBzeXN0ZW1zLiBPZmNvdXJzZSBp
dCB3YXMgbm90IFFFTVUuDQo+ID4gU2luZ2xlIFZNIG1pZ3JhdGlvbiBpcyByZWFsIGFuZCB1c2Vk
IGJ5IGNsb3VkIG9wZXJhdG9ycy4NCj4gPiBXaHkgd291bGQgeW91IGlnbm9yZSBpdD8NCj4gDQo+
IEkgZ3Vlc3MgdGhleSBvbmx5IGhhdmUgc2luZ2xlIHRlbmFudCBob3N0cyB0aGVuPyBCZWNhdXNl
IGVhY2ggdGVuYW50IG1pZ2h0DQo+IHJlcXVlc3QgbWlncmF0aW9uIGF0IGFueSB0aW1lLg0KVHlw
aWNhbGx5LCB0ZW5hbnQgZG8gbm90IGluaXRpYXRlIHRoZSBtaWdyYXRpb24uIFRoZSBjbG91ZCBv
cGVyYXRvciBpbml0aWF0ZXMgdGhlIG1pZ3JhdGlvbi4NCkFuZCB0aGVyZSBpcyBzb21lIGFnZW50
IGluLWJldHdlZW4gdG8gdGhyb3R0bGUgdGhlIG51bWJlciBvZiBWTXMgbWlncmF0aW5nLiBJdCBh
bHNvIG5lZWRzIHRvIGNhcnZlIHNvbWUgYncgb24gcGh5c2ljYWwgbmV0d29yayBhbmQgbW9yZS4N
Cg0K

