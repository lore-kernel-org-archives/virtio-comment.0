Return-Path: <virtio-comment-return-8542-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82115C072A2
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 07:33:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D211733579
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 07:33:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AE6E79868A2
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 07:33:44 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7E222986894; Wed, 22 Nov 2023 07:33:44 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6860B986895
	for <virtio-comment@lists.oasis-open.org>; Wed, 22 Nov 2023 07:33:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eS438XPq9+KCN9tfhH8y1IyLr5x3mc+k+QpVOVczHRVMClnANU/DWJs3frgoqDkkb+U8D0pa3QPxNwZmpTYj9s8x16dWBo6RWJWF874qUEBIkkWHuP6pT+PrKfKV0MKJyl5hC4bGi11Ty8LCwQ6XCaQg+jxzkb/3KlUpgH20wBjtRbS08CdVRi8jNdZXg2yFfFJavCW5JHjUCoEUBAZAb3w7Z7VUdlGmtSaFScC9uLgsgt0lLKVleW/D8DTPDMsfpzYI9shPcY90k22RLXHyVbB4hNjYYmqewoCa9z1kILZIwZqIqwhM4RzNlRACUcm+tR7jsg99ivSbHY3pdcuPYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1L32VgZk7IIN7EelB1raAND9kga6/yTIjtbFR6S9Ua4=;
 b=HwqapoPABYbuA3Gx3HhlBq5pDHPp7FG6fcHXWpdbBPv2mjVqx8VFwYXxRiTf7Z744ZCe2stC9vbbIVAkqx7bgYPvoj0AcZ96exzrbnW3tbNmLLhQzKBdvJfq5G2ic45FJw5i/TrcThlUbVyPxn2kIKsdNv1+LJ10MICaqCD4j9rVvvU+x965mYAMR7Ow3zOEOQghaOA/+0JyaimjocWJLWD8hUsfCE3kmalvW9cZVRgrUvQyp/WdWYbU3iZQJokoQK8w89r7ZI+m2RTnjqM3FJciLVm4cbh5Q5fUNE4thNt7sN3RtHo9cFf452q0uw49Gh7OQEc9Yqe7Evd3cKWpCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
CC: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "eperezma@redhat.com"
	<eperezma@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Thread-Topic: [virtio-comment] Re: [PATCH V2 4/6] virtio-pci: implement
 VIRTIO_F_QUEUE_STATE
Thread-Index:
 AQHaDkFl1Izi1X/8PEWVlDiafyu5VrBocsSwgAA8x4CAAA4dEIAD6TMAgAAKLuCAAFlegIAAFMUAgAF+uwCAAt3j8IAAUVeAgAACYaCAAWmSAIAAKc6ggASnTQCAA6yHIIABGDaAgAABczCAAY1lAIAAAJcggAXsHICAALIGYIAA3B8AgAAyLYCAAARj4A==
Date: Wed, 22 Nov 2023 07:33:41 +0000
Message-ID:
 <PH0PR12MB5481939D87A1E28C35D718B1DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <PH0PR12MB548189E49C97E91374B3F514DCAEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <4201d1df-100d-495c-97ba-7efbe73d9137@intel.com>
 <PH0PR12MB54810113B095063A5B875A03DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <166b43a5-b301-486f-9cc4-01a1cc80eed4@intel.com>
 <PH0PR12MB5481F872AE828217D6CC8FEEDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <d96aed6b-6194-41f6-9f4a-e20fe29797e4@intel.com>
 <PH0PR12MB5481501A7771A21583B905B1DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvNoLny_VPaQ5Ooob3cEystgdc6xi24G5wScT5FUdVz_Q@mail.gmail.com>
 <PH0PR12MB54815513853CC3299D2DBC7EDCBBA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtBbDS91gKf1pGiWNBLXatS0PjPJDEU4JtC6=uAjrOBzA@mail.gmail.com>
 <20231122015435-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231122015435-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|MN2PR12MB4287:EE_
x-ms-office365-filtering-correlation-id: 72b037ad-10e0-49e9-f5a2-08dbeb2d59d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 y6weqi4Wj5EkjGnb7kJdwIZG9cnz/oJUN3vyUKgAOLOogI0/UjcUoyVZ7K2BEYOxoVMabJVkH1qj53de0OJv+Dx643tvqywO6GLPw8RLWGY/SvS+XF5u3l8UPlVZ4RuZxTYthrap2424EZDqhKHEhsE5DeVhJJIUB+jmtcAQPK36tU5mDKjxTB586U9pjk8aQPwl6/igvmLP3u27vgKli0cQ9YxqAA3WrB675J7ZD1ihEbTeQBk3Jucjzfl3wL40RAo3Dv6vdlqK3DM5xHEUfIiUP77trme7VZRWHFYniv8Itrh1yVRq+xrveDVFRRlv9hrleaPwmvC5Xhj//EIEUINf0OqEPDxJc7Sts4kGEA54VdT/ZSlQsrwvWuUtvZVs0CkLfdrXYyypx4Wpj9FbNwNixPx8C3ubN2jwhu/fiBWlbpkF8dzkVJLF17NcSTK4cgm1onrmWY/EbROas7YRr3GtV1KL3I/uBGJulTnr/jmC8C1UO/6+LZTmltX1W46txeTA3jci7Bdrj3Pr38MeKriVYHpoK6GIRs9EU2aCGpZCvmatEbn+o1XZpHGKPkNUQbMYHuf3opj5akU3lMoQ2MVz3OSw2lPd7mHEgkmbH4P7PF4IkDH0YyMzwY67P8mj
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(366004)(136003)(39860400002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(52536014)(41300700001)(2906002)(33656002)(86362001)(38070700009)(26005)(53546011)(7696005)(9686003)(6506007)(55016003)(71200400001)(478600001)(83380400001)(38100700002)(122000001)(5660300002)(66556008)(4326008)(76116006)(54906003)(66946007)(66446008)(66476007)(110136005)(8936002)(316002)(8676002)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Yno0MHdKRFo4V0tBSGIvV21SS2toOThKY3hFYTVHdFhLbjdzVS9nTkZ3WDJF?=
 =?utf-8?B?Uy83bUF3dWRKQ01FVnpKQm1meHNtQzRkZHh4STRNTWphV1RoaS9PenhuQjZM?=
 =?utf-8?B?ODdpZnl2YWFULzZaNDBaMEtHOHN2UFNVUng4RVJYR1pDNDdzRmRHckJ1VlQ5?=
 =?utf-8?B?eEovS0FPS0kwR09mMDEwbU15L2dITEc3b0hFSkR2VkFYWWdaTTFwTnR5eGYr?=
 =?utf-8?B?cG9naUJjNXJJNUt6Mjl4ZndPLzlmRGsxZ3lLMThLUHdneXZnemNyNlp2SVJj?=
 =?utf-8?B?U1RwMFJWNUhrclFVRldVWW1JUjlmeEJkWTBDbjMvaFNhWGpRT3E2YTZUR2hO?=
 =?utf-8?B?djgwa2RpZnhFSDlqMHAybjJGb3dpRjU2Wmc2UENoRHhEcU1SdnpsbmdmVGN0?=
 =?utf-8?B?dnhJZlBtL3FSbXdjN0l0NHBES0g1Q3pFTXRxaXhzaFhvV1kwc0F1eXA3M2tS?=
 =?utf-8?B?MWZUTEtESStZSmYxazF3Q3FKT0ZTaVM2K1NhdnFJK0hscmhDVS9WSGVYUzVY?=
 =?utf-8?B?VldCUXJYb2hNcFZ4aHVSblFXT1FIdzkxSDBrNmF0NVFmOHc1LzQrWDNnL2VC?=
 =?utf-8?B?cW9Ibk1JUmZWRlA5cHlMNE4rcC9Fa2k1TGZ5MGpGN2haWlBVekZ6eGdWUitq?=
 =?utf-8?B?Ykd5aGpET1JBWTk0cldIaU5WTmlKcWFTQ1BJbC9sblN4Y0JRUjhsSklZdjZT?=
 =?utf-8?B?Ynp1WS94bzRTWUVwcG1DZTFnTk9nczVjOTcvMGRWY3NKWURvWVRkTnhNSVVt?=
 =?utf-8?B?VWV3ZG8wbTMwVE1Qekd2bStVa25CemhEUG95bWlVOStHZE1uVDdGWHJMN3Q2?=
 =?utf-8?B?MjhrYlJuc2pGRE1FUktvR3hMRzdBVVFpOUxOUlBra1diVEdkK1dRcTlTQnln?=
 =?utf-8?B?WjRuV3RhTGJGek5JbDU1VkxyT0xuQXMxOEJUTjZYNVE5QXdKUTE4T2p6aVBk?=
 =?utf-8?B?MmIwY1ZVeklEdTh2ZWtWdUt4R29JTDlVdHlXd1ZHMzJPZExZeFUrYWdERmtk?=
 =?utf-8?B?TTc5NUFnRXRwbXl0KzlhVmFGNkRrWXgvNURDNEc3T29oNXhCYytXY3lDTWY0?=
 =?utf-8?B?TkRaekxLL0dIWGhUWGxpSVVRT3p2WGxGaTduek5TSEFva0t5ZkhSMmVLaUNU?=
 =?utf-8?B?ZlI2NHF3SkJDSjZaeTFGRkpwb0ZCL3RUeW00SVZFdllGVjdPeS9SaDFyTlVF?=
 =?utf-8?B?cTFWYWF6Q2s0ME5lNldEUE8vUmkyWTViVXBRejJ1SkVhTTAxWTNuaVRZMTBH?=
 =?utf-8?B?R0ZXeWFGM2ZKdmFOcU9hZlZsb1E0dTErWnR6L1R6cmtLa1BQMytVZE5qUmJQ?=
 =?utf-8?B?cmhjMEJNMWdrU2ZCYXpTUUY1NkV1VTZyVFFwaTdyb0ZXakNxdnJHdUxIOVVZ?=
 =?utf-8?B?VXc5NFVwK25wMVBNN0pGV0xzRWU3byt0SUFJSlhua2NwTDdMRUYwdTJZaTN6?=
 =?utf-8?B?Z2NHUzNDRGxtYVp3WC9xSnRlU3B5ODY4aXJwdVpudEZBcFZhanQxR0xHYXRL?=
 =?utf-8?B?aFQxb2JFMjhSalJYMUZtbnpyaGRxeDdWU3ZpOTBudWhVUEh6cmM0MVJkcFJ1?=
 =?utf-8?B?cmxqM1pPVmJtNVMzREZRUTBUZ2xTTi9xTlNrWVMxZFBlelZOdTRRdjhVMWYx?=
 =?utf-8?B?Nkt1dGhPUGJmSXpaT1JYZ2lrdDN1cStkdGxWTlhHcTMyQTZuUzFjaXNIVy84?=
 =?utf-8?B?NTlEdnNpbGVROW5YRXRIYWNVNXQ4MTZzaXdmaWhOeW1taXRlbXdhTk9BdlJl?=
 =?utf-8?B?WVNTK2pqNkZ5VUw2aHZVcy9xNyszUHRFb1Z3dGNsR0xNWXhBNWFDQW43cTR6?=
 =?utf-8?B?N2Z2Y2JMS0JrNGM0UG9Idkd1STJ4Mi9hbmNIcXhBeU5XMWtVWTQwYWNaeVc0?=
 =?utf-8?B?SUJqTk02MHppUVZVS3RacHFRUmIvZ1IwY09tTVduVW5UYzZmdC80eFR1NUh1?=
 =?utf-8?B?VnpHQlBXc1dNSWlwQkNTK2RSV1lHVjltb2xXMW5mdW5ybEtYVVh0cW9KNnM3?=
 =?utf-8?B?V0dVNTluQU8yYmpCSlUraGtRelJjbERhSTdCRjc2eVIzMHVsQ3BZMngyaXRU?=
 =?utf-8?B?dE9CYnhra3Z5K0huNEJudk4xNmRkSFVTK2ZLYWZoeVRaaGFhaVphVzBsMlNV?=
 =?utf-8?Q?5IUA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72b037ad-10e0-49e9-f5a2-08dbeb2d59d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2023 07:33:41.6044
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lluugehPOLmJVlfyOKmc6PNoAQ6bm7+VoYpx3PvFH9hra79v/yAyl8RwJj8aLYlNp2T2NHDFu3+qwSFDLtPenQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4287
Subject: RE: [virtio-comment] Re: [PATCH V2 4/6] virtio-pci: implement
 VIRTIO_F_QUEUE_STATE

DQo+IEZyb206IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+DQo+IFNlbnQ6IFdl
ZG5lc2RheSwgTm92ZW1iZXIgMjIsIDIwMjMgMTI6NDUgUE0NCj4gDQo+IE9uIFdlZCwgTm92IDIy
LCAyMDIzIGF0IDEyOjE1OjQ0UE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6DQo+ID4gT24gV2Vk
LCBOb3YgMjIsIDIwMjMgYXQgMTI6MjbigK9BTSBQYXJhdiBQYW5kaXQgPHBhcmF2QG52aWRpYS5j
b20+DQo+IHdyb3RlOg0KPiA+ID4NCj4gPiA+DQo+ID4gPiA+IEZyb206IEphc29uIFdhbmcgPGph
c293YW5nQHJlZGhhdC5jb20+DQo+ID4gPiA+IFNlbnQ6IFR1ZXNkYXksIE5vdmVtYmVyIDIxLCAy
MDIzIDEwOjAxIEFNDQo+ID4gPiA+DQo+ID4gPiA+IE9uIEZyaSwgTm92IDE3LCAyMDIzIGF0IDY6
MDbigK9QTSBQYXJhdiBQYW5kaXQgPHBhcmF2QG52aWRpYS5jb20+DQo+IHdyb3RlOg0KPiA+ID4g
PiA+DQo+ID4gPiA+ID4NCj4gPg0KPiA+IFsuLi5dDQo+ID4NCj4gPiA+ID4gPiBTb3JyeSwgbm8g
dmlydGlvIHNwZWNpZmljYXRpb24gZG9lcyBub3Qgc3VwcG9ydCBkZXZpY2UgbWlncmF0aW9uIHRv
ZGF5Lg0KPiA+ID4gPiA+IE5vdGhpbmcgaXMgYnJva2VuIGJ5IGFkZGluZyBuZXcgZmVhdHVyZXMu
DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBBYm92ZSBbMV0gaGFzIHRoZSByaWdodCBwcm9wb3NhbCB0
aGF0IEphc29uJ3MgcGFwZXIgcG9pbnRlZCBvdXQuDQo+ID4gPiA+ID4gUGxlYXNlIHVzZQ0KPiA+
ID4gPiBpdC4NCj4gPiA+ID4NCj4gPiA+ID4gSSB3YXMgaW52b2x2ZWQgaW4gdGhlIGRlc2lnbiBp
biBbMV0uIEFuZCBJIGRvbid0IHNlZSBhIGNvbm5lY3Rpb24NCj4gPiA+ID4gdG8gdGhlIGRpY3Vz
c2lvbiBoZXJlDQo+ID4gPiA+DQo+ID4gPiA+IDEpIEl0IGlzIGJhc2VkIG9uIHZEUEEgaW4gTDAN
Cj4gPiA+ID4gMikgSXQgZG9lc24ndCBhZGRyZXNzIHRoZSBuZXN0aW5nIGlzc3VlLCBpdCByZXF1
aXJlcyBhIHByb3Blcg0KPiA+ID4gPiBkZXNpZ24gaW4gdGhlIHZpcnRpbyBzcGVjIHRvIHN1cHBv
cnQgbWlncmF0aW9uIGluIHRoZSBuZXN0aW5nIGxheWVyLg0KPiA+ID4NCj4gPiA+IE5vdGhpbmcg
cHJldmVudHMgWzFdIHRvIGJlIGRvbmUgd2l0aG91dCB2ZHBhLg0KPiA+DQo+ID4gV2VsbCwgUWVt
dSBoYXMgU1ItSU9WIGVtdWxhdGlvbiBmb3IgSUdCLiBXaGF0J3MgdGhlIHBvaW50IG9mIHRoZSBh
Ym92ZQ0KPiA+IHJlcGx5PyBJZiBhIGh5cGVydmlzb3Igd2lzaGVzLCBpdCBjYW4gYmUgZG9uZSB3
aXRoIGFueSBkZXZpY2Ugb24gTDAuDQo+ID4NCj4gPiBXZSBkaXNjdXNzIHRoZSBwb3NzaWJpbGl0
eSBvZiBtaWdyYXRpbmcgbmVzdGVkIFZNcywgbm90IHRoZQ0KPiA+IHBvc3NpYmlsaXR5IG9mIGVt
dWxhdGluZyBTUi1JT1YsIG5vPw0KPiA+DQo+ID4gVGhhbmtzDQo+IA0KPiBJdCBkZXBlbmRzIHJl
YWxseS4gSWYgdGhlIHdheSB0byBzdXBwb3J0IG5lc3RpbmcgaXMgdG8gZW11bGF0ZSBzci1pb3Yg
dGhlbiB0aGUNCj4gcXVlc3Rpb24gYmVjb21lcyBob3cgaGFyZCBpdCBpcyB0byBlbXVsYXRlIHNy
aW92IHRvIHRoZSBwb2ludCB3aGVyZSBuZXN0aW5nDQo+IHdvcmtzLg0KPiANCj4gVGhlIGZhY3Qg
dGhhdCBjdXJyZW50IGh5cGVydmlzb3JzIHByZXRlbmQgdGhhdCBhIFZGIGlzIGEgUEYgd2hlbiBw
YXNzaW5nIHRoaW5ncw0KPiBvbiB0byBndWVzdCBhbmQgdGhpbmdzIHN0aWxsIHNlZW0gdG8gd29y
ayBpcyBuaWNlIGJ1dCBpdCdzIG5vdCBhIGh1Z2VseSBpbXBvcnRhbnQNCj4gZGVzaWduIHBvaW50
IElNSE8uDQoNCk5lc3RpbmcgaXMgbm90IGEgdmlydGlvIHByb2JsZW0gYXMgaWYgbmVzdGVkIFBD
SSBkZXZpY2VzIG5lZWRlZCwgaW5kdXN0cnkgd2lsbCB3b3JrIG9uIGl0IGFueXdheSB0aGF0IHZp
cnRpbyB3aWxsIGJlIGFibGUgdG8gbGV2ZXJhZ2UuDQpXZSBzaG91bGQgZm9jdXMgb24gdHdvIHBy
YWN0aWNhbCBhbmQgaW1tZWRpYXRlIGNhc2VzIG9mIHZmaW8gYW5kIHZkcGEgdGhhdCBmb3IgZmly
c3QgbGV2ZWwgZ3Vlc3QuDQpBbmQgYWRtaW4gY29tbWFuZCArIGFkbWluIHF1ZXVlIG9uIHRoZSBv
d25lciBkZXZpY2Ugc2VlbXMgdG8gc3VmZmljZSBib3RoIHRoZSB1c2UgY2FzZXMuDQpXZSBzaG91
bGQgcHJvZ3Jlc3MgdG93YXJkcyB0aGlzIGFuZCB1bmJsb2NrIHVzZXJzIHRvIHN0YXJ0IHVzaW5n
IGl0Lg0K

