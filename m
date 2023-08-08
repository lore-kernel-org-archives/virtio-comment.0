Return-Path: <virtio-comment-return-7056-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA973C001DB
	for <virtio-comment@archiver.kernel.org>; Tue,  8 Aug 2023 07:13:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0C6A22B016
	for <virtio-comment@archiver.kernel.org>; Tue,  8 Aug 2023 07:13:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DE019986466
	for <virtio-comment@archiver.kernel.org>; Tue,  8 Aug 2023 07:13:20 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C095B98403A; Tue,  8 Aug 2023 07:13:20 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AC704986460;
	Tue,  8 Aug 2023 07:13:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bHWke25V2xUFUYP6XBbUOo5ztJmiTmkXKdVs3MTvBT9t7mlDZPcxiQ/aC42VnsSlZqbXzL4e2zjRYbveh0M7sZDmH6doq4cCWg6fEdIPA37KhDijIEg7GZ0I3dHwqI0gF4NkmmSKWSUi9HUxszUEQUocoZuAePW1dBZI+fQ4MKsayipfGQ0aq5CuaNBPL5oAFL8oXQPTDBB+Ebsk/rSod/uGWMtfwkiLJ/U4SI2NgzwWCWer74dcJpNtO1ShJGg/+VgoA0LnAvBuAPm9XViUSJ4kXVExSfSqQ4PMBOrS6kBmjkF9MuA1CawcsE1vg35TchvrjGgLW/ySOFVDiSdAJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VevdxHFJzqh3rcm7Fl/aVGoKYeoC1mgG0grR2Sj1p4k=;
 b=GsspJqdLu9LFgjKJfQpxzORQMf0GkIUryMaYNGgdj05zf/nmQmwZ2SLcCqHUtc8ZkEkR3FtDdHepbM/7vehO4Spn5wbBBB4g0enDoW0YVm0pYtTt+EaWts19JkAbrhdacMRHUwPMfTA3MRyxhx+4MwM6fCqUqZyqZw9DXAWuqhUwCrT2rk7xbe8m0Y1f96B/FWOIFsxMPVxJ1P9lSsN9r1S7qyEtirY8iacqeRgpj2PITlspiNIF9tS6jiYfmPcEhemhye6haW/r63pwVTNQGR3tUghRSQys73GTPLeOB/r9WjjVX4j8o9jsytt1Bfwr6yNI9z0ub/Y92X/Mdm+qMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Heng Qi <hengqi@linux.alibaba.com>
CC: Satananda Burla <sburla@marvell.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>
Thread-Topic: [virtio-comment] Re: [virtio] RE: [PATCH requirements 5/7]
 net-features: Add n-tuple receive flow filters requirements
Thread-Index:
 AQHZvd/S1zVkOCRsJ0eCMof906XE7a/XL16AgAEzr4CAADgYgIABHAlAgAAUhQCAAAKv8IAABsMAgASvAwCAAYwjwA==
Date: Tue, 8 Aug 2023 07:13:13 +0000
Message-ID:
 <PH0PR12MB54812105643D9771FF4C8EDEDC0DA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230724033421.249893-1-parav@nvidia.com>
 <20230724033421.249893-6-parav@nvidia.com>
 <20230802152525.GA13690@h68b04307.sqa.eu95>
 <PH0PR12MB5481538EEC183EBE3FF16234DC08A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230803130725.GA47086@h68b04307.sqa.eu95>
 <PH0PR12MB54811B738594B741F8F8D723DC09A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230804071728.GA7515@h68b04307.sqa.eu95>
 <PH0PR12MB54814571128E5D313192D4EFDC09A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <47dd90a2-3be6-5bab-a423-08d8d5a63be9@linux.alibaba.com>
 <20230807072242.GA11361@h68b04307.sqa.eu95>
In-Reply-To: <20230807072242.GA11361@h68b04307.sqa.eu95>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH2PR12MB4087:EE_
x-ms-office365-filtering-correlation-id: d7b08e34-3cab-49eb-86f7-08db97deee54
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 IyPjPTRRhc9wyeFUM036fpIKviZLifdlATavmrfQbGbOPZcSvsS+6o1lCv42K9qFgbAgfXY/BqtPsYkBZN4/nkT3gGWYq64vu2ZpEcuN/NQuuO9kgDlsx/7tV3vOk1AYdEG11oVQQwUaeasb2W4IerBTGuEQFv+oV6skLPgsJgXP9YOZvG6u1CFkOnbc9zfjGosWagcY+aTTyBd7aRK+Tt2pMDcD7ZSDoAhMyOEuLnwnUj5nG/PwO0cIX1N0c0f1gKKhlAkxo9x3FRhBwiSbZYh/5DQouwShRMXqY0IQAnpuzW5qzrDWdeK6ul4OnRfeLbyjG5U6eZEiWL6hSw1f5taygxxxjdP/7PAdgQlCOgapkRTExSnwA5iL4GvT0WtosSFSvcGk/LydyyhWMluUpRNz6aa8GxoPFGwaYrvQNoJIpMwZ7lPwqjjt6Q07/Q0WVryZIa1yXGDH/Ou4PTjhb8ESqESaUkQJgAtbrE3lDU52xyAARlNoAyVhDAewLDUp1AzZB/uqmSJmR/mKx/LtosHc7L9feFazzcARTek0/MrtNAoVdJG2wadSO6yWMqndDBLZBR0BQFkt5dO9tkLXPhyrLDHEkqWBGP84iXFXIq6KXUWMkdfyesIT4b3FfB4JvjkRSmZ3x/usA8aEfhxlMbxItmule+f2qaBBlg9+u++MS6O/fIL5nmllzgSaU587
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(136003)(346002)(396003)(366004)(186006)(1800799003)(90011799007)(90021799007)(451199021)(122000001)(478600001)(9686003)(38100700002)(86362001)(54906003)(4326008)(66446008)(6916009)(64756008)(76116006)(66946007)(66556008)(66476007)(316002)(6506007)(7696005)(26005)(71200400001)(41300700001)(2906002)(55016003)(83380400001)(38070700005)(52536014)(8936002)(8676002)(5660300002)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TVY0bFg0TkZZQUxOWWlDL0lyTm5McEswQUhJaVN5UDkwWlBzVERTQzI0VVpr?=
 =?utf-8?B?K0hGalhmZk0vOWRUcUFBcDhWMXNBUVpET2FNRmtCek5FYUgrVkU5OEx1ZzhS?=
 =?utf-8?B?aWlMK1l0MUNKYm1Nd0dHTlM2R0Z3T2tGMTFTWmRkVWd3YmxtQjNBNlczaVhl?=
 =?utf-8?B?bmpZNjd1bTFUUEFMOFR6UGVQU0M2SDZpamhTMU1xZ1MrUCtJVzZTUTVjMnRT?=
 =?utf-8?B?TWFpcHZaNjZ1R3FGUFJqZzJIQS9hVTNtNThYaDEvbElhMElQQjZ3UTNhVmNF?=
 =?utf-8?B?d2JwNEV1OE42MVRLRXFCUlZsSFVDZHAxd3FBNTJORk1qRXo3Rm1JZmJlNE9L?=
 =?utf-8?B?VXovbWxTdGdTc2F4Z1dQKzRYQkdyUCs5QStFWW82Ym16M2VERVFpREJIRlho?=
 =?utf-8?B?SWw5SkVPYW5mL0lYMG4yQmthYS9YOVBYVEVaZ3EwR1VTOG95cHROMVBLVUNS?=
 =?utf-8?B?K1JseGJSekVKMGxSdTVEaG1Yekp4UVlUbXJkK1RkME1OTGNDRWlUSE9HQ2NN?=
 =?utf-8?B?YnkrZGNOZFRyVE1oZjI5RUdrMEFSaUFqR1JIZmVyZnVFMFpCMkJzQVMwaEJx?=
 =?utf-8?B?WjRxSk85WUhtOVozWndHWWxWdmtZNmRlelVMdFNFZG1iRmxkMnlaS3o1YW0v?=
 =?utf-8?B?RE9VMlptS3R3OHFDd1NVVVFFZmo4aTBLbmErNmxHWkhqQmlsa2tveFdKTGxN?=
 =?utf-8?B?ZmZRTUkyaU9jeExQWnF1Wk9ySjg0OXlYVHZ1YzM2QkV4M3ZWQ1FyaDZBRE9W?=
 =?utf-8?B?NitTejJDallWTDVteXZLaWp6L2ZhTVhPWnQyMjM2eURXM09ScmtGdkJxWXZT?=
 =?utf-8?B?c3pRMEJDYk9wcDlNMmJrYUZVanNVNThhK0R6NEVWNk1Vc1NWNUdBTW9Uc3da?=
 =?utf-8?B?SXZ6aUlCZHUwZi95cE9zdjU0U3JZVHdobHFhZXpEMWFRTXR4RW5hbnBoc0xU?=
 =?utf-8?B?WTVWekpCNmpTYk4xWHVxdDhDVzhjdkhZbVNDaHNNYTI2b0VrTnhDa2VSOHJN?=
 =?utf-8?B?QnB4UzRKMUJZeHZJbjEzQS8wcUR4MXZHM25kMjNIVGxRM1lZTkhCa2Vac2dr?=
 =?utf-8?B?QUlVSzNFVnBNM2pTd2RIUkV1ekRsRlAyNDZuTzJvdll0L1FSaVR3ZEtaS2xq?=
 =?utf-8?B?dVJtSHIrRFdxMmcrNi81SHBIQjR2dGtwcnlwc1M2ZlZCQTk3TlJPcHdDRENC?=
 =?utf-8?B?dU51V1RnQkZtYkliNm04UDVZUW9DTWg1OEJKOXYrTng4dG1XUVRmTXc2YTBl?=
 =?utf-8?B?em1IRWFTRWpXWVh0QlAzb0kwZzVOQUNhd0pnZDNsK05jODZZWjNSL0NtTThT?=
 =?utf-8?B?Vkd3OGY4NTVCSm02cVg2QklxaUp5Nm1kTWc3TU1lZlBuem50dmhlcG5hWWZs?=
 =?utf-8?B?RVdUYmZZTVpnTDhoSWp1OXRYZGFVWVVET2VCRDFjbE85SEkydSt3ZHNXNHAx?=
 =?utf-8?B?a25QLzdiVXhiSk1RVUN5ZmNnMW5OZGlIOHdxYWdWeVBaZHk3VEx4RTJXbDYx?=
 =?utf-8?B?SEF1eU1mc2pxK3pkajF3b002OHhUaWZlaHdzNGxFczNPNnp6WUpQNVorWEdZ?=
 =?utf-8?B?S0VZZGlDc0Z6WHZiUG1oZnAvWVVnSzF2WmFDVUpLdmdmRTUyKzF3TU54TytE?=
 =?utf-8?B?YVFqMjFnMUdXNjJnTXpURk91YkphMTZVd0dCT2srUDdZOVBOaFdDSzEwS3lY?=
 =?utf-8?B?emRMSUdkZ3o2Nk93Smt6WHM5QTlKT2d2dFBrcUJXUXBkUGo4dERMdlRJZm01?=
 =?utf-8?B?WVBhNzRockJNQlNnSlV0QkF6YmltNjJPUVlIdlROdWFLY3hMRkRlVm10ZVM2?=
 =?utf-8?B?NFphMk1mcG5ybDFYUEVyS1dKWUJhdk9PY2ZPQm5YQmt4VlBqMzVyYzVIaWVZ?=
 =?utf-8?B?U0ZOYUd0dm9jMzY2alQ1RGJGSjdKdVU0TWVoMVhQL1RXNnhOdnYxM1FSdUlm?=
 =?utf-8?B?SXNmU0w5eTkwanVyYjdzZ0ZkTCtscGlBOXZYMkFrODZzdlMyM0t3OG5NSDZw?=
 =?utf-8?B?REZuZWlCbTJuV3NsQm5VYXhSL05leTFMNUJYdnhQWDFWR0trTTlRYUZDY1hV?=
 =?utf-8?B?SFdZL01VeHdaMllmRG9qSmlpSTFpenY5bE5ROXUyUkczLys0N29QR1lvMEhj?=
 =?utf-8?Q?UUnM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7b08e34-3cab-49eb-86f7-08db97deee54
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2023 07:13:13.9848
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8Jz3lsTk40CPwYSXfdF2DBrMgtIzG+ccjHQyXuFyOczVfpHVL491jzR8Ns0y0zcZMRq2+pU5/GrBJdVzrrXzmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4087
Subject: RE: [virtio-comment] Re: [virtio] RE: [PATCH requirements 5/7]
 net-features: Add n-tuple receive flow filters requirements

DQoNCj4gRnJvbTogSGVuZyBRaSA8aGVuZ3FpQGxpbnV4LmFsaWJhYmEuY29tPg0KPiBTZW50OiBN
b25kYXksIEF1Z3VzdCA3LCAyMDIzIDEyOjUzIFBNDQoNCj4gPiA+T25jZSBSU1MgY29udGV4dCBp
cyBkb25lLCBhdCB0aGF0IHBvaW50IGluIGZ1dHVyZSB0byBlbmhhbmNlIFJGRi4NCj4gSGksIFBh
cmF2Lg0KPiANCj4gV2UgbmVlZCB0aGUgUlNTIGNvbnRleHQsIHdoaWNoIGNhbiBiZSBjb21iaW5l
ZCB3aXRoICdldGh0b29sIC1YIC4uIGVxdWFsJw0KPiB0byBhY2hpZXZlIHRoZSBwdXJwb3NlIG9m
IHRyYWZmaWMgaXNvbGF0aW9uLCBzbyBwbGVhc2Uga2VlcCB0aGUgUlNTIGNvbnRleHQuIFRvDQo+
IGFsbGF5IHlvdXIgY29uY2VybnMgdGhhdCBhbiBSU1MgY29udGV4dCBtaWdodCBiZSBibG9ja2lu
ZyB0aGUgd29yayBvZiBuLXR1cGxlcywNCj4gSSdsbCBiZSBpc3N1aW5nIGEgc3BlYyB0aGlzIHdl
ZWsgKG9yIG5leHQNCj4gd2VlaykgZm9yIHZpcnRpbyBzdXBwb3J0IGZvciB0aGUgUlNTIGNvbnRl
eHQuIEZvciBuLXR1cGxlIFJGRiBjb250ZXh0LCB3ZSBjYW4NCj4gc3VwcG9ydCBpdCBhZnRlciBS
RkYsIGFzIGEgcG9pbnQgdG8gZW5oYW5jZSBSRkYuDQo+DQpPay4gc291bmRzIGdvb2QuDQogDQo+
ID4gPlsuLl0NCj4gDQo+ID4gKzkuIFRoZSBmaWx0ZXIgcnVsZSBhZGQvZGVsZXRlIGVudHJpZXMg
YXJlIHVzdWFsbHkgc2hvcnQgaW4gc2l6ZSBvZiBmZXcgdGVucyBvZg0KPiA+ICsgICBieXRlcywg
Zm9yIGV4YW1wbGUgSVB2NiArIFRDUCB0dXBsZSB3b3VsZCBiZSAzNiBieXRlcywgYW5kIG9wcy9z
ZWMgcmF0ZSBpcw0KPiA+ICsgICBoaWdoLCBoZW5jZSBzdXBwbHlpbmcgZmllbGRzIGluc2lkZSB0
aGUgcXVldWUgZGVzY3JpcHRvciBpcyBwcmVmZXJyZWQgZm9yDQo+ID4gKyAgIHVwIHRvIGEgY2Vy
dGFpbiBmaXhlZCBzaXplLCBzYXkgNTYgYnl0ZXMuDQo+IA0KPiAnNTZCJyBkb2VzIG5vdCBzZWVt
IHRvIGJlIGVub3VnaC4gRm9yIGV4YW1wbGUsIHNyYyBtYWMgKyBkc3QgbWFjICsgc3JjLWlwNiAr
DQo+IGRzdC1pcDYgKyBzcmMtcG9ydCArIGRzdC1wb3J0ICsgdXNlci1kZWZpbmUgKHBhY2tldCBi
eXRlIG9mZnNldCBwYXR0ZXJuLCBsZW5ndGgNCj4gYW5kIG1hc2spICsgZmxvdyBpZCArIHJ1bGUg
cHJpb3JpdHkgKyBkZXN0aW5hdGlvbiArIGFjdGlvbiA9DQo+IDYgKyA2ICsgMTYgKyAxNiArIDIg
KyAyICsgOCArIDQgKyAxICsgMiArIDEgPSA2NCBCLCB3ZSBhbHNvIGhhdmUgc3RydWN0dXJlIGFs
aWdubWVudA0KPiBhbmQgcXVpbnR1cGxlIG1hc2ssIGV0Yy4NCj4gDQpZZXMsIDY0QiBhbHNvIG5l
ZWQgdG8gYWRkIGdyb3VwIGlkIHRvIGl0Lg0KQSBwcmFjdGljYWwgZmluaXRlIGxpbWl0IHdvdWxk
IGJlIGZpbmUsIEkgdG9vayA1NkIgZXhhbXBsZSBiYXNlZCBvbiBpcHY0IGNhc2UuDQpJIHRoaW5r
IDk2QiBhdCBoaWdoZXIgdXBwZXIgbGltaXQgbG9va3MgcmVhc29uYWJsZSB3aXRob3V0IGNvbnNp
ZGVyaW5nIG1hc2suDQpBcyBBUkZTIGtpbmQgb2YgdXNlIGNhc2VzIHVzdWFsbHkgYXJlIGV4YWN0
IG1hdGNoLCBoZW5jZSBtYXNrIGlzIG9wdGlvbmFsIHRoYXQgZG9lc3QgbmVlZCB0byBiZSBpbmxp
bmUuDQoNCj4gPiBbLi5dDQo+ID4gKzUuIFRoZSBkZXZpY2Ugc2hvdWxkIGJlIGFibGUgdG8gZXhw
b3NlIGlmIGl0IHN1cHBvcnQgZmlsdGVyIG1hc2tzLg0KPiA+IFsuLl0NCj4gPiArNy4gRmxvdyBm
aWx0ZXIgY2FwYWJpbGl0aWVzIHRvIHF1ZXJ5IHVzaW5nIGEgRE1BIGludGVyZmFjZToNCj4gPiAr
DQo+ID4gK2BgYA0KPiA+ICtzdHJ1Y3QgZmxvd19maWx0ZXJfY2FwYWJpbGl0aWVzIHsNCj4gPiAr
CXU4IGZsb3dfZ3JvdXBzOw0KPiA+ICsJdTE2IG51bV9mbG93X2ZpbHRlcl92cXM7DQo+ID4gKwl1
MTYgc3RhcnRfdnFfaW5kZXg7DQo+ID4gKwl1MzIgbWF4X2Zsb3dfZmlsdGVyc19wZXJfZ3JvdXA7
DQo+ID4gKwl1MzIgbWF4X2Zsb3dfZmlsdGVyczsNCj4gPiArCXU2NCBzdXBwb3J0ZWRfcGFja2V0
X2ZpZWxkX21hc2tfYm1hcFs0XTsNCj4gDQo+IEkgdGhpbmsgdGhlIGZ1bmN0aW9uIGhlcmUgaXMg
dGhhdCBhZnRlciB0aGUgdXNlciBzZW5kcyB0aGUgbWFzaywgdGhlIGRyaXZlciBzaG91bGQNCj4g
ZG8gYW4gJ0FORCcgb3BlcmF0aW9uIHdpdGggdGhlIG1hc2sgc3VwcG9ydGVkIGJ5IHRoZSBkZXZp
Y2UgZmlyc3Q/DQo+IE1lYW53aGlsZSwgaXMgMzJCIGVub3VnaDopIDoNCj4gICBzcmMtcG9ydCAr
IGRzdC1wb3J0ICsgc3JjIG1hYyArIGRzdCBtYWMgKyBzcmMtaXA2ICsgZHN0LWlwNiA9DQo+ICAg
ICAyICsgMiArIDYgKyA2ICsgMTYgKyAxNiA9IDQ4Qg0KPiANCk9oIEkgZGlkbuKAmXQgZG9jdW1l
bnQgd2VsbC4NClRoZSBmaWVsZCBzdXBwb3J0ZWRfcGFja2V0X2ZpZWxkX21hc2tfYm1hcCBpcyBi
aXRtYXAgb2Ygd2VsbCBkZWZpbmVkIGZpZWxkcywgb25lIGJpdCBmb3IgZWFjaCBmaWVsZC4NClN1
Y2ggYXMsDQpCaXRfMCA9IGRzdF9tYWMNCkJpdF8xID0gc3JjX21hYw0KQml0XzIgPSBldGhfdHlw
ZQ0KQml0XzMgPSB2bGFuX3RhZw0KQml0XzQgPSBkc3RfaXAgDQpBbmQgc28gb24uDQoNClNvIHll
cywgdGhlIGFjdHVhbCBjb250ZW50IGxpa2Ugc3JjLXBvcnQgZG9lcyBub3QgbmVlZCB0byBtYXNr
LCBidXQgeWVzLCANCndoZW4gdGhlIGZpbHRlciBydWxlIGFycml2ZXMgZnJvbSBBUkZTIG9yIEZD
IHNpZGUsIHRoYXQgbWV0ZGF0YSBpbmZvIGNvbWluZyBpbiBldGh0b29sX3J4X2Zsb3dfc3BlYyB0
byBiZSBtYXNrZWQuDQoNCkl0IHdvdWxkIG1ha2UgbW9yZSBzZW5zZSB0byBoYXZlIGEgZGVkaWNh
dGVkIGNvbW1hbmQgZm9yIHRoZSBiaXRtYXAgZm9yIHR3byByZWFzb25zLg0KMS4gSXQgZG9lc24n
dCBnZXQgc2FuZHdpY2hlZCBpbiB0aGUgZnV0dXJlIHdoZW4gbmV3IGZpZWxkcyBhcmUgYWRkZWQg
YWZ0ZXIgdGhlIGJpdG1hcC4NCjIuIFdoZW4gYml0bWFwIG5lZWRzIHRvIGV4dGVuZCwgaXQgaXMg
bm90IGZyYWdtZW50ZWQgYXQgdHdvIG9yIG1vcmUgcGxhY2VzLg0K

