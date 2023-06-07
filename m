Return-Path: <virtio-comment-return-6200-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE4EC77B7A
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 03:22:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0C2A442906
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 03:22:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EF3BC986641
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 03:22:17 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DC3AC9840BF; Wed,  7 Jun 2023 03:22:17 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C994A986603;
	Wed,  7 Jun 2023 03:22:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DBVuZgpYROai3NcrhSJj1phBTfK2Iz04IGhr/MkigIXaT8fYhiCkMScRJr76BIj/MfgQlZgnxfTPvIEzOzHab9OIzP8BI/QsLTRefQR9SRV9ppsLbAhxT63ICrWeLh57vp2tgg2rnutdZMSGERxUAuSYCx8YL7ZdtSSnIColLj1hLvjFn7PFg5UzCVHDcCiQtQALbDNO1FXpKsmZgvH1LqrtRYcXdxKuvb1eagEY5kcFy6Nbvm9pa0rYatdKO+F3Wam7fAyTUYftkN2tHR5blGgGmLqPo8yix23u5xmayVo/cmzJCq/QHbYAwkugMwY7Yex/ADTuGWr+zl/glnc4Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VhWFops2ilfj7/6jAms2dlZxhX9zj1gfuEWWeXAKtuo=;
 b=R4uAxBIg08Zc5v2oddxHt8IuUxFYG9OYE39h/LnfqhN35AqhWfR5ochBVL868iYbPWdng0IottX0woenJh96xvSDMffHOvgGXwxKUXYhvvvy3vKbLA/nSwFm6nhu3e1sauEGpuQYhRVnLuY3OHabCG9SxaMvUTx95/cnfBKtrvGLs3ZRDbYhSJJ6UUWzi0cOnFCTJ9RFpzz329/kE1zV0THvus3HPnsMb7idfQ3atVYzZQY9HI8cDyBT+Ys5UbkUzaD/d94Rz5gssMQ8/qTecrdB5PjV2IOGq9i/JVr0Jz4utUm3dsji8dtT6KM+AgGWgNcIKRsEKywD4Pf+15+blQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Jason Wang <jasowang@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>
Thread-Topic: [virtio-comment] [PATCH requirements 5/7] net-features: Add
 n-tuple receive flow steering requirements
Thread-Index: AQHZlNTpsDXVjHsOf0G4vfVcY0pgc69+q0IAgAAI/qA=
Date: Wed, 7 Jun 2023 03:22:13 +0000
Message-ID:
 <PH0PR12MB54811815AC44CAC9533B7CCFDC53A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230601220305.587034-1-parav@nvidia.com>
 <20230601220305.587034-6-parav@nvidia.com>
 <CACGkMEu9AMZ8_WWxSWYEMBak3LJZVmRJGWHr2jqwEaoQb-U=Ow@mail.gmail.com>
In-Reply-To:
 <CACGkMEu9AMZ8_WWxSWYEMBak3LJZVmRJGWHr2jqwEaoQb-U=Ow@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|MW6PR12MB8959:EE_
x-ms-office365-filtering-correlation-id: 07104e57-9230-466d-66f0-08db67066353
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 FhZjIuullOBhXefwiZG8UpxpgQ4j5ZYaWhobgH3DnhnIbXrrET4H3vEPy5LiXmV8iSzxItWBmSEPB22aMmIwgC++O6a5UkeNfIxQiQYmaMeQJrbgkzn/xPWE2T6ErQZHVLqs+S2xXFacpFFq1nGgkInv5cdE2wi+5H59b3nfyv08hIItMh0dnCc0pFvbpw343DHzsDoIx6+gt5l7HkA8JkINWxf8BkCOYxLEIMro6RB/JR0oairBcUIFwfBgfln2YW0NCcHooyxzJfN+SXiBjunRIn+SAYZlFg1dXQstbKd0tn6gD8DPfsHp9rieXgo4AnK+lTTBG3h3lAgJDsnYqcE2ivPZGD4OKI/aGFn2V7ICvmov44hQ0lsjogSFcN8rtU6o67jzqiI0dNFtroB3lH7bmuylHEyGKeV4FyqPgMlpFONftheuMr04+WBFc658jsBxPt+pEdzE5RGhKXDowaT3L/mjqrdHj/AWzfvsgCiVvbcQmwPDkdbsE1gifv6dk5mmX2puqPemhLAx3phCvWl3NPUUp9z7c9AMSL0a8Jw2/AyB5BHASpREBJgR9VI614dY5hSScbos7l8Q75/f5Yx1pbVubpkWHJV65c0L+s72LnXR1qNca7iZs77Qd2y/yjJJKcnVo08mMWe4VqrkaCWG5SU6W3w6qEBkQWGWqPc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(366004)(376002)(346002)(451199021)(71200400001)(66899021)(478600001)(66556008)(8936002)(52536014)(8676002)(5660300002)(38070700005)(33656002)(86362001)(2906002)(54906003)(76116006)(66946007)(6916009)(66446008)(66476007)(122000001)(64756008)(316002)(55016003)(4326008)(38100700002)(41300700001)(53546011)(9686003)(6506007)(26005)(83380400001)(966005)(7696005)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TjhvNXNOMjhVWUszZEhKc2xvNDkrTFVSVmQzOTJRcjNOeW04WlJJb2pZZE1u?=
 =?utf-8?B?SjRGRFQ5eTRFR2E2MUttMUZMRGtlbkorSmRTTzRXN01kcVlGQ3VBRHZ0aUZ6?=
 =?utf-8?B?MU9qbVJnTG8wT2RxSTFMTlFqRWkwK2gyMnc0c0VTZ3N4d21kVk8zMUlkL00y?=
 =?utf-8?B?Ky9EN3dQd1RLQ3kwSVc0Y2JHT2hZdkkxMEN5ZFgybGxBRnJ1V1ZPN2hHd3hP?=
 =?utf-8?B?bG9KMWJxc2k2em13cFo0YWFJaG5mejRlSWd5UWZBYzJWOTNlN1ZyZHpiZGRq?=
 =?utf-8?B?YlRlbDE1VVJtSXBKR1NZK2NmL2xmT1hCVnl6MzVybUJwSUNvOUl4dFhwZjBD?=
 =?utf-8?B?MG1yRlVJNzhwRmEzUld6emR6SFZJUGp6TS9WZ1JyOGN2TzliaU5xbHR0ZDg2?=
 =?utf-8?B?dTM0aktQVGtEa1BCTlc4VG1mc3hQb2U3ajg4ay9nNmdUZEFQQ1J4cGlwaklH?=
 =?utf-8?B?SWdXR2tQSVpLWGk4VTRUTDF1bHhsSElUVzMvSlJOYXlRZE1XU2E0dGh1TWN4?=
 =?utf-8?B?MUs4UlBGRHZaUG5uQzQ4YkFyMUtTRlNqcVR3bjRLWEdiZTQxczAwMEhma2hL?=
 =?utf-8?B?RVF4a0pxOTVabXI2SHBuRnpFNHM1WHRkRG54UlF6M0crd3RNbUJGV2VGRkFz?=
 =?utf-8?B?UVM0c0EyUkdDeGhoK2hwbEdEb211RVAxV0VRMG9wMDZSbzVtY0gzdGhwakd3?=
 =?utf-8?B?MFluaGtISGZuL1BPVjBSTjRETGM2dUhGSnJ1aDl0dnR3eGFqZWx6VDVKWkNk?=
 =?utf-8?B?TmlOc1NOYUxoa3lrQ0lkQXlTU1R3UTRTMDBORWhVMURSWXFiU2Y0WndaQjQ0?=
 =?utf-8?B?Z0J4M3RaV0hVb0RpK2trdUF5YXJINnRzQWF4ZFErdGRPOHcya1pucmNJTkc5?=
 =?utf-8?B?cVlXWndWbHo3dzNDUnVZK0xpeTI5MmFocUJiVDFHL3NqdE1RYzUwZlRpM3pl?=
 =?utf-8?B?d09HRFJLZ0hxR3RVVjN4RENUM3hlby80eWtWRi9BRllMelQ1N1BDbHZERlpT?=
 =?utf-8?B?Y0krZXBqd0ZxSHF1UmpYTkZBbmpGSkxnVHYrN1JyOHVnRkhWVGJRSlNzdjVW?=
 =?utf-8?B?WkkvZGVZencyS1dVeGI1YUlCK28ydXl4SytheWg3MWx2TGNaK1JJNEpvUm5p?=
 =?utf-8?B?WWY5dzZrWENzU3F5WlBwbzZ2VEZHRW9LcjAyS3dmQ0xaSGZPWW02MEZOeUtO?=
 =?utf-8?B?Zi9hOEVudUd0SGRXYXBUUDYvQjJCNEtma0NUN2M2emN0aG11MWNnL1FOSm1s?=
 =?utf-8?B?ZlFLK2F3QmR0WHRIL05yaWx0bnZFak9sZFNiazM0NERJMzYwZnl2bGYzUUNZ?=
 =?utf-8?B?WVROakRmdGd6MmQrcGxxYTJPNkxHSnh2eXJMTVNSVDRkYkpTR0tjOWg5MTQx?=
 =?utf-8?B?SUpHZ0t5dzlSUS90YjhsZE9FNUtmYWdNK041d1RGSStuclBNd2tBbEpBdW4x?=
 =?utf-8?B?SDRzUUhDVTlTb291dnFBNzZRbFhTMVpGRWd2VDRZZGRnUzl4Q2JNWVJXOGRL?=
 =?utf-8?B?blJDMmtkZFB3WEU4UG9xNC95NEt6YzhwZXhHME4wRWtpOHJqUUJwcUltaFpC?=
 =?utf-8?B?enNYRkRXTzhPMnI2QWllVVd4SEkwYmhtT3Bxb213Z0JTaUpLb1FsS2xaemZF?=
 =?utf-8?B?TE1Oam80ZUxhZXRqeW1JeFhXbm95Wk1qV1ZpZkZIeXpNaldQQ1RWQ0I1SWNi?=
 =?utf-8?B?WDlMTFhXbENKcTIzTjQxd1RNTit4Y1ZoUXprZVZEcXZ3TmpscW51Qk9sR2hN?=
 =?utf-8?B?aFU5WlpyRC91SkJHRW00NUVyby9rVEhvdjN4RjRWeHorUnFJUk82UkFWbFRI?=
 =?utf-8?B?WTRpUFpkRk5rWEd2NGRJbGdSazVnN3MxV0pNeVlTZ2VwTENnZzBpTWYvdzJo?=
 =?utf-8?B?ZS9NRExBUEZrd3J6UkpwM3VIaW5HR2VXVzNBbGQ2Y2MxSzVzZFFYcVprZ3VK?=
 =?utf-8?B?bHpwYVpYN1hrTm5oTUJGbmJhQW16UmFJZitmaG5OaTJJR1VmNGcwZldqcVZp?=
 =?utf-8?B?VlhLeFowQVFROEEvNmNiRnlDZ3R6S2hxQzRRN3krMXlLNVJGT2NjZ2RqZVlO?=
 =?utf-8?B?T25PZm5qRkJKMzBJSGVKR3NEUHJBeWxYZ0VkcEd6NGRqR2EvVnYxVzFRd20r?=
 =?utf-8?Q?0jBc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07104e57-9230-466d-66f0-08db67066353
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2023 03:22:13.6493
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T2BahT4u7pYefP7ROdjfx5bSJwtRuya5qk2E7Vi7h3VQtQ6hx2uaf/eEfTebv1GpVczJb3WqinZRul4qVe9nWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8959
Subject: RE: [virtio-comment] [PATCH requirements 5/7] net-features: Add
 n-tuple receive flow steering requirements

DQoNCj4gRnJvbTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4NCj4gU2VudDogVHVl
c2RheSwgSnVuZSA2LCAyMDIzIDEwOjQ4IFBNDQo+IA0KPiBPbiBGcmksIEp1biAyLCAyMDIzIGF0
IDY6MDPigK9BTSBQYXJhdiBQYW5kaXQgPHBhcmF2QG52aWRpYS5jb20+IHdyb3RlOg0KPiA+DQo+
ID4gQWRkIHZpcnRpbyBuZXQgZGV2aWNlIHJlcXVpcmVtZW50cyBmb3IgcmVjZWl2ZSBmbG93IHN0
ZWVyaW5nLg0KPiANCj4gV2hpbGUgYXQgdGhpcywgSSB3b3VsZCBnbyB3aXRoIGEgd2VsbCBkZWZp
bmVkIFJYIGZyYW1lIHByb2Nlc3NpbmcgcGlwZWxpbmUgbGlrZSBhDQo+IG1vZGVybiBOSUMgaW5z
dGVhZCBvZiBhZGRpbmcgaW5kaXZpZHVhbCBmZWF0dXJlcyBsaWtlOg0KPiANCj4gLSBmaWx0ZXIN
Cj4gLSBoYXNoaW5nDQo+IC0gcXVldWUgc2VsZWN0aW9uDQo+DQoNCkNhbiB5b3UgZXhwbGFpbiB0
aGlzIGZyb20gcmVxdWlyZW1lbnRzIHBvaW50IG9mIHZpZXc/DQpJbmRpdmlkdWFsIGZlYXR1cmVz
IGFyZSBzb21ldGhpbmcgdGhhdCBhbHJlYWR5IGV4aXN0cyBzdWNoIGFzIHF1ZXVlIGFuZCBoYXNo
aW5nLg0KDQpXZSBhcmUgaW5zZXJ0aW5nIGZpbHRlcmluZyB0byB0aGlzIHBpcGUuDQpEbyB5b3Ug
bWVhbiB0byBkZWZpbmUgdGhlIG9yZGVyIGluIHRoZSBzcGVjPyBpZiBzbywgeWVzLCB2ZXJ5IGxp
Z2h0bHkgSSBkZXNjcmliZWQgdGhlIHJlbGF0aW9uIG9mIGZpbHRlcmluZyB3aXRoIFJTUy4NCg0K
SWYgbW9yZSwgcGxlYXNlIGV4cGxhaW4uDQoNCiANCj4gZXRjLg0KPiANCj4gVGhhbmtzDQo+IA0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGFyYXYgUGFuZGl0IDxwYXJhdkBudmlkaWEuY29tPg0K
PiA+IC0tLQ0KPiA+ICBuZXQtd29ya3N0cmVhbS9mZWF0dXJlcy0xLjQubWQgfCAzMw0KPiArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMzIGlu
c2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9uZXQtd29ya3N0cmVhbS9mZWF0dXJl
cy0xLjQubWQNCj4gPiBiL25ldC13b3Jrc3RyZWFtL2ZlYXR1cmVzLTEuNC5tZCBpbmRleCBmYzM2
ZjMxLi40MTI0MmI0IDEwMDY0NA0KPiA+IC0tLSBhL25ldC13b3Jrc3RyZWFtL2ZlYXR1cmVzLTEu
NC5tZA0KPiA+ICsrKyBiL25ldC13b3Jrc3RyZWFtL2ZlYXR1cmVzLTEuNC5tZA0KPiA+IEBAIC05
LDYgKzksNyBAQCB0b2dldGhlciBpcyBkZXNpcmVkIHdoaWxlIHVwZGF0aW5nIHRoZSB2aXJ0aW8g
bmV0IGludGVyZmFjZS4NCj4gPiAgMS4gRGV2aWNlIGNvdW50ZXJzIHZpc2libGUgdG8gdGhlIGRy
aXZlciAgMi4gTG93IGxhdGVuY3kgdHggYW5kIHJ4DQo+ID4gdmlydHF1ZXVlcyBmb3IgUENJIHRy
YW5zcG9ydCAgMy4gVmlydHF1ZXVlIG5vdGlmaWNhdGlvbiBjb2FsZXNjaW5nDQo+ID4gcmUtYXJt
aW5nIHN1cHBvcnQNCj4gPiArNC4gUmVjZWl2ZSB2aXJ0cXVldWUgbi10dXBsZSBzdGVlcmluZw0K
PiA+DQo+ID4gICMgMy4gUmVxdWlyZW1lbnRzDQo+ID4gICMjIDMuMSBEZXZpY2UgY291bnRlcnMN
Cj4gPiBAQCAtMTUxLDMgKzE1MiwzNSBAQCBzdHJ1Y3Qgdm5ldF9yeF9jb21wbGV0aW9uIHsNCj4g
PiAgICAgY29hbGVzY2luZyBhZnRlciBwcm9jZXNzaW5nIHRoZSBwYWNrZXRzIHBlciBWUS4gVGhp
cyBlbnN1cmVzIHRoYXQgd2hlbg0KPiA+ICAgICBuZXR3b3JraW5nIHN0YWNrIGRlY2lkZXMgdG8g
cG9sbCwgbm8gbmV3IG5vdGlmaWNhdGlvbnMgYXJlIGdlbmVyYXRlZCB3aGVuDQo+ID4gICAgIHBl
ciBWUSBub3RpZmljYXRpb24gY29hbGVzY2luZyBpcyB1c2VkLg0KPiA+ICsNCj4gPiArIyMgMy40
IFJlY2VpdmUgdmlydHF1ZXVlIG4tdHVwbGUgZmxvdyBzdGVlcmluZyAoUkZTKSAxLiBUaGUgZHJp
dmVyDQo+ID4gK3Nob3VsZCBiZSBhYmxlIHRvIGRlZmluZSBhIHJlY2VpdmUgcGFja2V0IG1hdGNo
IGNyaXRlcmlhLCBhbg0KPiA+ICsgICBhY3Rpb24gYW5kIGEgZGVzdGluYXRpb24gZm9yIGEgcGFj
a2V0LiBGb3IgZXhhbXBsZSwgYW4gaXB2NCBwYWNrZXQgd2l0aCBhDQo+ID4gKyAgIG11bHRpY2Fz
dCBhZGRyZXNzIHRvIGJlIHN0ZWVyZWQgdG8gdGhlIHJlY2VpdmUgdnEgMC4gVGhlIHNlY29uZCBl
eGFtcGxlIGlzDQo+ID4gKyAgIGlwdjQsIHRjcCBwYWNrZXQgbWF0Y2hpbmcgYSBzcGVjaWZpZWQg
SVAgYWRkcmVzcyBhbmQgdGNwIHBvcnQgdHVwbGUgdG8NCj4gPiArICAgc3RlZXJlZCB0byByZWNl
aXZlIHZxIDEwLg0KPiA+ICsyLiBUaGUgbWF0Y2ggY3JpdGVyaWEgc2hvdWxkIGluY2x1ZGUgZXhh
Y3QgdHVwbGUgZmllbGRzIHdlbGwtZGVmaW5lZCBzdWNoIGFzDQo+IG1hYw0KPiA+ICsgICBhZGRy
ZXNzLCBJUCBhZGRyZXNzZXMsIHRjcC91ZHAgcG9ydHMsIGV0Yy4NCj4gPiArMy4gVGhlIG1hdGNo
IGNyaXRlcmlhIHNob3VsZCBhbHNvIGluY2x1ZGUgdGhlIGZpZWxkIG1hc2suDQo+ID4gKzQuIFRo
ZSBtYXRjaCBjcml0ZXJpYSBtYXkgb3B0aW9uYWxseSBhbHNvIGluY2x1ZGUgc3BlY2lmaWMgcGFj
a2V0IGRhdGEgb2Zmc2V0LA0KPiA+ICsgICBsZW5ndGgsIGFuZCBtYXRjaGluZyBwYXR0ZXJuLCB3
aGljaCBtYXkgbm90IGJlIGRlZmluZWQgaW4gdGhlIHN0YW5kYXJkDQo+IFJGQy4NCj4gPiArNS4g
QWN0aW9uIGluY2x1ZGVzIChhKSBkcm9wcGluZyBvciAoYikgZm9yd2FyZGluZyB0aGUgcGFja2V0
Lg0KPiA+ICs2LiBEZXN0aW5hdGlvbiBsb2NhdGlvbiBpcyBhIHJlY2VpdmUgdmlydHF1ZXVlIGlu
ZGV4IG9yIHJzcyBjb250ZXh0Lg0KPiA+ICs3LiBUaGUgZGV2aWNlIHNob3VsZCBwcm9jZXNzIFJG
UyBydWxlcyBiZWZvcmUgUlNTIHJ1bGVzLCBpLmUuLCB3aGVuIHRoZXJlIGlzIGENCj4gPiArICAg
bWlzcyBvbiB0aGUgUkZTIHJ1bGUgUlNTIHJ1bGUgYXBwbGllcy4NCj4gPiArOC4gVGhlIGRldmlj
ZSBzaG91bGQgYmUgYWJsZSB0byBhZGQvcmVtb3ZlIHRoZXNlIHJ1bGVzIGF0IGEgcmF0ZSBvZiAx
MDBLDQo+ID4gKyAgIHJ1bGVzL3NlYy4NCj4gPiArOS4gSWYgbXVsdGlwbGUgcnVsZXMgYXJlIHBy
b2dyYW1tZWQgd2hpY2ggaGFzIG92ZXJsYXBwaW5nIGF0dHJpYnV0ZXMgZm9yIGENCj4gPiArICAg
cmVjZWl2ZWQgcGFja2V0LCB0aGUgZHJpdmVyIHRvIGRlZmluZSB0aGUgbG9jYXRpb24vcHJpb3Jp
dHkgb2YgdGhlIHJ1bGUuDQo+ID4gKzEwLiBUaGUgZHJpdmVyIHNob3VsZCBiZSBhYmxlIHRvIHF1
ZXJ5IGZsb3cgc3RlZXJpbmcgdGFibGUgZW50cmllcw0KPiBwcm9ncmFtbWVkIGluDQo+ID4gKyAg
ICB0aGUgZGV2aWNlIGJ5IHRoZSBmbG93IGlkLg0KPiA+ICsxMS4gVGhlIGRyaXZlciBzaG91bGQg
YmUgYWJsZSB0byBhZGQgdGhlIGVudHJ5IGZvciBhdHRyaWJ1dGVzIChhKSBtYXRjaA0KPiA+ICsg
ICAgY3JpdGVyaWEsIChiKSBhY3Rpb24sIChjKSBkZXN0aW5hdGlvbiBhbmQgKGQpIGFzc2lnbiBh
IHVuaXF1ZSBpZCBvZiAzMiBiaXRzLg0KPiA+ICsxMi4gVGhlIGRyaXZlciBzaG91bGQgYmUgYWJs
ZSB0byBkZWxldGUgdGhlIHN0ZWVyaW5nIHJ1bGUgZW50cnkgdmlhIGEgdW5pcXVlDQo+IGlkLg0K
PiA+ICsxMy4gVGhlIGRyaXZlciBzaG91bGQgYmUgYWJsZSB0byBhZGQgYW5kIGRlbGV0ZSB0aGUg
c3RlZXJpbmcgcnVsZXMgaW4gb3V0IG9mDQo+ID4gKyAgICBvcmRlciBtYW5uZXIgd2l0aG91dCBk
ZXBlbmRpbmcgb24gcHJldmlvdXMgY29tbWFuZHMuDQo+ID4gKzE0LiBBIGdyb3VwIG1lbWJlciBk
ZXZpY2Ugc2hvdWxkIGJlIGFibGUgdG8gcXVlcnkgdGhlIGF0dHJpYnV0ZXMgb2YgdGhlDQo+IGZs
b3cNCj4gPiArICAgIHN0ZWVyaW5nIHRoYXQgZGV2aWNlIHN1cHBvcnRzLg0KPiA+ICsxNS4gVGhl
IGRyaXZlciBhbmQgZ3JvdXAgb3duZXIgZHJpdmVyIHNob3VsZCBiZSBhYmxlIHRvIHF1ZXJ5IHN1
cHBvcnRlZA0KPiBkZXZpY2UNCj4gPiArICAgIGxpbWl0cyBmb3IgdGhlIHN0ZWVyaW5nIGVudHJp
ZXMuDQo+ID4gKw0KPiA+IC0tDQo+ID4gMi4yNi4yDQo+ID4NCj4gPg0KPiA+IFRoaXMgcHVibGlj
bHkgYXJjaGl2ZWQgbGlzdCBvZmZlcnMgYSBtZWFucyB0byBwcm92aWRlIGlucHV0IHRvIHRoZQ0K
PiA+IE9BU0lTIFZpcnR1YWwgSS9PIERldmljZSAoVklSVElPKSBUQy4NCj4gPg0KPiA+IEluIG9y
ZGVyIHRvIHZlcmlmeSB1c2VyIGNvbnNlbnQgdG8gdGhlIEZlZWRiYWNrIExpY2Vuc2UgdGVybXMg
YW5kIHRvDQo+ID4gbWluaW1pemUgc3BhbSBpbiB0aGUgbGlzdCBhcmNoaXZlLCBzdWJzY3JpcHRp
b24gaXMgcmVxdWlyZWQgYmVmb3JlDQo+ID4gcG9zdGluZy4NCj4gPg0KPiA+IFN1YnNjcmliZTog
dmlydGlvLWNvbW1lbnQtc3Vic2NyaWJlQGxpc3RzLm9hc2lzLW9wZW4ub3JnDQo+ID4gVW5zdWJz
Y3JpYmU6IHZpcnRpby1jb21tZW50LXVuc3Vic2NyaWJlQGxpc3RzLm9hc2lzLW9wZW4ub3JnDQo+
ID4gTGlzdCBoZWxwOiB2aXJ0aW8tY29tbWVudC1oZWxwQGxpc3RzLm9hc2lzLW9wZW4ub3JnDQo+
ID4gTGlzdCBhcmNoaXZlOiBodHRwczovL2xpc3RzLm9hc2lzLW9wZW4ub3JnL2FyY2hpdmVzL3Zp
cnRpby1jb21tZW50Lw0KPiA+IEZlZWRiYWNrIExpY2Vuc2U6DQo+ID4gaHR0cHM6Ly93d3cub2Fz
aXMtb3Blbi5vcmcvd2hvL2lwci9mZWVkYmFja19saWNlbnNlLnBkZg0KPiA+IExpc3QgR3VpZGVs
aW5lczoNCj4gPiBodHRwczovL3d3dy5vYXNpcy1vcGVuLm9yZy9wb2xpY2llcy1ndWlkZWxpbmVz
L21haWxpbmctbGlzdHMNCj4gPiBDb21taXR0ZWU6IGh0dHBzOi8vd3d3Lm9hc2lzLW9wZW4ub3Jn
L2NvbW1pdHRlZXMvdmlydGlvLw0KPiA+IEpvaW4gT0FTSVM6IGh0dHBzOi8vd3d3Lm9hc2lzLW9w
ZW4ub3JnL2pvaW4vDQo+ID4NCg0K

