Return-Path: <virtio-comment-return-8130-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA3EC4332F
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 14:41:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3701A2AC6C
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 14:41:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 12283986C0D
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 14:41:02 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id F2436986C03; Thu,  2 Nov 2023 14:41:01 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E2D86986C04
	for <virtio-comment@lists.oasis-open.org>; Thu,  2 Nov 2023 14:41:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AkM0DFtV7lPjNcpVC7FzMns1R9xM6gGhbYKOkB1OyGF8TjLfmU2hs7H3pcHmvCWZzcs5GvJDtXKTq2INEi5vvwb7wlYDmwAPZa5qjOAzz21yJDGMZQoMxTgDUB/xoLqarj2o1mD+klRHlAHwiuyI+WLl2f25Hv7eshwxytH+OLUwAbVp+1DjAVHW7tTBLXozK3DFbKLGkmdRHiPa9cbc6UYJlRAZ7u5QrQY6tOKg7O3+XT2a0dpLe2kpWr+cDqhzPiLL2g7nEnao67rKcLnqG4nxYxfH9KDgBssjuf6rZhRl0tetapiRBW24sp5NcG5HH9ln5p1cvgy7101dgErCiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cmi6O8JG3R78XdFFwBODtThGUQJQqecSnoWYei7QhbQ=;
 b=X/cYCEth5fjN8M4zhN+chfdhREidZl0PWnddsCORaYXaqnvv950uhG5kiTybzvLcih/lCc/qfxgwhv0tkMK529i8g+NWeGdcjfUxUXXhFOzEcU6AFL6y3JqkK6mdMrWhHz3QzUXX4A3Ss/i6YMkJhcgxCBpUFgCc+5UhWbfK8uvqibETlGAcbchc9xLklDhWRFxQc//KJBRaa8wpgh/OQ4evP/H5WhINSfe6kLHPw+MRsXtSE0G1eyvrgt7GSPzF5yu4YxnA/E3CD3WYOnrOb1egewpqpoHnOzOGtIY465vOZTKLoWmB4RKqqaKZemdrWLEzt4cKbetTNZRcJpa0Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [PATCH v1 3/8] device-context: Define the device context fields
 for device migration
Thread-Index: AQHZ+dpHSUrTyyDEA0quapQP8C0hdbBnPBgAgAAAWhA=
Date: Thu, 2 Nov 2023 14:40:57 +0000
Message-ID:
 <PH0PR12MB5481021BC87009ED7D8F5C6DDCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231008112555.473895-1-parav@nvidia.com>
 <20231008112555.473895-4-parav@nvidia.com>
 <20231102101727-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231102101727-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH0PR12MB8488:EE_
x-ms-office365-filtering-correlation-id: 4544f1d8-c7a6-47da-cc0f-08dbdbb1b9f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 zYImOcDcMnhcidrS3JI/fqoYa8H7O7OClC50p4mwanLe8kdEqTcV0cn0DqItykoQ26gCTt3bvNc2UMRuGEAQp83geWz2fySKpbd3rNcYRAPq1vQUGcz/hPICQRkJv+fcNi4tI+UB9CVH4mf4Lb4lrG0Wpkr/VwQXvqpIvY6HTLg9byO2zNSaUHafXvNMryMflfgEJET6iJnrAhcp+iW8pgBnUGWbZD4VIm5h+heCj1iWpMaHRu9pewozameNPPeCNubvO1lwvxhnWcRA1yQFP1tNpMt+90XxDJ6WvJ+DFRKzo1Om6bcfMLd1UHClh+dMZ77j5CBUaawtQt5Kdmgup5+jKVHX3WJIycHZiatjxIpnEovqFWzz2SWpbzyNS0bRs+OUkSL1CHyVpZti2i/aGmH0dK7wx5yw5hro4P41sfXzulcXiIAeadgwhJvq/OSgkvuO9CM1bsuIUAnvKDvFgAy3BkyRqff1gOiTA1UQYI8n3cyzxTYe/OYxrPSWsu8gauLfuC2UA1Ld6BmPFfrz/dnch/EY0QIFFro0Mv/3PqDBZCxRj3UBylcOW6VtIdrKcT97OiGZhCevbtVsKJIvL98r+KASO8j/KV9Qw6IKpqYQ+2N+k/Zsy2YLs4jyfYfU
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(136003)(366004)(39860400002)(376002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(55016003)(26005)(9686003)(71200400001)(7696005)(66446008)(2906002)(83380400001)(6506007)(64756008)(8936002)(478600001)(76116006)(66946007)(41300700001)(107886003)(66476007)(8676002)(54906003)(6916009)(52536014)(316002)(5660300002)(66556008)(4326008)(38100700002)(122000001)(33656002)(86362001)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L0JVc0t4blJBU3laQUFjMTJiUHlsQ1lvd0tvZ3lpazhHekZvdWdZSk4yZ01W?=
 =?utf-8?B?dlhncXJjRHFMMVpRaUZVZkhwcTcyVDVoeUR6Z2JtQksyNTQ2N1ZtNCtsclVT?=
 =?utf-8?B?UFJNNHZ3VlVmVlIvcmtQWmN0Nk1JNTZDL0lOdVljRUwrNHUrdWJhSlZKNk1R?=
 =?utf-8?B?VVBoUktPc21SVHZOL2Q3aFZlenh3TkdtNmlLdmtpVTIzeldNc1BzUStCMDJt?=
 =?utf-8?B?cHFvSDVOcjVDNTB3T2llOURHSm1MeGxURUpMcFVOcGlyMFk4UWliajlrbTcw?=
 =?utf-8?B?akdPdmJpZHg1Q0NJWkdEV3FnM3VSNGNyQ3J1SmhBeXltYi9ySGYvMEtkOC8x?=
 =?utf-8?B?b0tyOGZKOWpvelJXL0NRb2VSbUxYcUtueDRiU1VKUEFaQ0JrN1dNdndrYmo5?=
 =?utf-8?B?RisvTk5NSVJPbXZKdk9XZTVaM3N6bUJZWnBjVDVaS1ZtVnZOUTErTk16bTJp?=
 =?utf-8?B?RzRRUzFscXdrTnRHaHBGNlpVNVlMNVAvUmtZRU1ZM2duNHVXWEVTOTJabVhy?=
 =?utf-8?B?QklWczJtL3dBNnk1dXZ0Q1Z5czZqSWE5QXZwMVdSSVFHNm9mdm96MWdJTDQ5?=
 =?utf-8?B?K2dFUWhhWk1zZzRlUlpiYnluc05ZejcxN3BWNXNxdGw4RVJxeWhScXB5eDNh?=
 =?utf-8?B?dW1TVnA1NmU0akpDYStLWnBtWTVYK3pRTklLbHZGZnE0OWMwRzh2SGs3aW0x?=
 =?utf-8?B?VWNGQkFQOGJWSnNZVWxRRUtES29oZDhqS0R6RzdjVHZ2RjIvRHVRNmdsQnZ1?=
 =?utf-8?B?L1h5NHRROGsxM3JYV0Q0R0haS24zRUcyUE9aMnB4THFMRVI2WllZeFc0WnI3?=
 =?utf-8?B?cWNYcDhiWUtBY2NUbkNScSt0NUZqelJWS3VUdVN6KzNCTERRcHJ4YklXaWp3?=
 =?utf-8?B?cmZkdDhZWXNLTU1RbVRXQUNoZVZaRjVjUDBkVCs0ZC9LUko4c1QrODdwTkN5?=
 =?utf-8?B?OHh5OGJiYm91Z04xa20rNXRnQWV5QzB1c2hyRUJDbC9QaE9wNGdFSDRSL1FW?=
 =?utf-8?B?SDVGeEtWZjh1TWRUVjROZUZjYWNaczJtdzQwSWJEUWdNK2pzczNMbXc4N2k0?=
 =?utf-8?B?TDEvbk1Sbm1sM0hnUHBkVWZkN3N4TCt1SitIUmZZUlZVZnJ4cE8vM3ZXbVFV?=
 =?utf-8?B?S3p2bjZLNGszR3U3UjZucm5vV2pocnJDWVFqR29NblhpMmhoYUh3QnVwU0J3?=
 =?utf-8?B?azNoN1R6Y2w5Q0FCL3ZmVkJQV0pmV2xVbW1Ha3lJdE5tTThNVStqL3lINEM5?=
 =?utf-8?B?M1pNZFZkeVdFRFptcHFVcXJjMG0vcytUb0dpR0tTczhrdTN6SnpPZ0tkYklM?=
 =?utf-8?B?VGErZ3VFcG1IZlp1VEFhd0diREZXcm9NYVpPY0ZFZDZ2N3pkelN2UWJQVVhs?=
 =?utf-8?B?czFrSXBaZ2ZBQW95d0lveWpTVzNuT2lKRmJLQUZ2enpvN3NFdHh5dHkxcnhl?=
 =?utf-8?B?NnBvZldXUmhneDlxVlc4aU5ONmRobU05UTJ1QWo2dGxJaDhQKzg1ODVhQlps?=
 =?utf-8?B?UUl5U1FlRy9UYXczMm9YRVQxTUx0WUZZS1pzRDBHNitnMmkxMnMwcUJFUUJt?=
 =?utf-8?B?cWJNRmFnZjhlb29IekdmSEs3dnJEWUVTMUhDSkkyTVAycGVOdDhCeWdDRDFB?=
 =?utf-8?B?UHQ4TmRiVGNWTDBBY3Y5V2FWdW1HRUlYU1F4eVRDUkhGa0FERXJQaTBlS0tT?=
 =?utf-8?B?dzUrTm5BMlQ5OFlhOStJdjJnLzRuSUljL3BEcndYaVB6aHVkWnpIZGZic3FH?=
 =?utf-8?B?V3NZUmdsVERnemJTQmFNQ1hyMkUxUnF6VjgwbTRaNzNXMSswODhQRXI0b1Vr?=
 =?utf-8?B?cjRWWnN0N2V6T0ZidXNyall6djgraXBCNkRQRXRWZmZSR2VsNldTSDNzN0pl?=
 =?utf-8?B?UGNFdWsyUXBGOFRHbmcxeWllZ3ZxQmx3Uk5hL2IrVHhKRVpIN1UvR0hMMThL?=
 =?utf-8?B?N3J2SEdMWjRzQ1hEeHE4OWduMHZrdUJTcVVpdkZmOW9TVHlmYVE0YzNOM3pn?=
 =?utf-8?B?VW5wL2plQXJwVjVoa0xMVzRTOERVeG0xNGhsS2gyREgrSnh3M2tEbjI2YmNR?=
 =?utf-8?B?ZU5QWWVtY2RsVWp0TkJmb3IwOXBLbHJaZzdNelFWMGJUd05QdmYvV0J2ZkJR?=
 =?utf-8?Q?F1Ro=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4544f1d8-c7a6-47da-cc0f-08dbdbb1b9f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2023 14:40:57.8414
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FSnr30jsaRzGlv+vSr+iWm0dr7THNXubsLAf9rsXLy1mWaTx9DqKig6ih92pFZ+2s8/64bPlYt52mTfW0BO+8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8488
Subject: [virtio-comment] RE: [PATCH v1 3/8] device-context: Define the device context fields
 for device migration

PiBGcm9tOiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPg0KPiBTZW50OiBUaHVy
c2RheSwgTm92ZW1iZXIgMiwgMjAyMyA3OjUyIFBNDQo+IA0KPiBPbiBTdW4sIE9jdCAwOCwgMjAy
MyBhdCAwMjoyNTo1MFBNICswMzAwLCBQYXJhdiBQYW5kaXQgd3JvdGU6DQo+ID4gK1xiZWdpbnts
c3RsaXN0aW5nfQ0KPiA+ICtzdHJ1Y3QgdmlydGlvX2Rldl9jdHhfcGNpX3ZxX2NmZyB7DQo+ID4g
KyAgICAgICAgbGUxNiB2cV9pbmRleDsNCj4gPiArICAgICAgICBsZTE2IHF1ZXVlX3NpemU7DQo+
ID4gKyAgICAgICAgbGUxNiBxdWV1ZV9tc2l4X3ZlY3RvcjsNCj4gPiArICAgICAgICBsZTY0IHF1
ZXVlX2Rlc2PNvg0KPiA+ICsgICAgICAgIGxlNjQgcXVldWVfZHJpdmVyzb4NCj4gPiArICAgICAg
ICBsZTY0IHF1ZXVlX2RldmljZc2+DQo+ID4gK307DQo+ID4gK1xlbmR7bHN0bGlzdGluZ30NCj4g
PiArDQo+ID4gK09uZSBvciBtdWx0aXBsZSBlbnRyaWVzIG9mIFBDSSBWaXJ0cXVldWUgQ29uZmln
dXJhdGlvbiBDb250ZXh0IG1heQ0KPiA+ICtleGlzdCwgZWFjaCBzdWNoIGVudHJ5IGNvcnJlc3Bv
bmRzIHRvIGEgdW5pcXVlIHZpcnRxdWV1ZSBpZGVudGlmaWVkIGJ5IHRoZQ0KPiBcZmllbGR7dnFf
aW5kZXh9Lg0KPiANCj4gU28gY29uc2lkZXIgdGhpcyBleGFtcGxlLiBJbiBwcmFjdGljZSBpdCBp
cyBxdWl0ZSBwb3NzaWJsZSB0aGF0IGRyaXZlciBpcyBpbiB0aGUNCj4gcHJvY2VzcyBvZiBzcGVj
aWZ5aW5nIGUuZy4gcXVldWVfZGVzYywgYW5kIGl0IHNldCBxdWV1ZV9kZXNjX2hpIGJ1dCBub3QN
Cj4gcXVldWVfZGVzY19sby4gVGhlbiB3aGF0IGlzIHF1ZXVlX2Rlc2M/DQo+IEp1c3QgYSBjb21i
aW5hdGlvbiBvZiBhIGxlZ2FsIHZhbHVlIG9mIHF1ZXVlX2Rlc2NfaGkgYW5kIGlsbGVnYWwgb25l
IG9mDQo+IHF1ZXVlX2Rlc2NfbG8/IFRoaXMgbWFrZXMgbm8gc2Vuc2UuDQo+IHF1ZXVlX2Rlc2Mg
aXMgZnVuZGFtZW50YWxseSB1bmRlZmluZWQgdW50aWwgcXVldWUgaXMgZW5hYmxlZC4NCg0KU3Vy
ZSwgaW4gbmV4dCByZWFkIG9mIHRoZSBkZXZpY2UgY29udGV4dCB0aGUgdXBkYXRlZCB2YWx1ZSB3
aWxsIHJlZmxlY3QuDQpUaGUgZGVzdGluYXRpb24gd2lsbCBub3Qgd29yayBvbiB0aGlzIHZxIGFu
eXdheSBhcyB0aGUgZGV2aWNlIG1vZGUgaXMgZnJlZXplLg0KVGhlIHdob2xlIGRldmljZSBjb250
ZXh0IGlzIG5vdCBhdG9taWMsIHNvIGhhdmluZyBvbmUgZmllbGQgbGlrZSB0aGlzIGFzIG5vbmF0
b21pYyBzaW1pbGFyIHRvIG90aGVycyBpcyBvay4NCg0KSW4gdGhpcyBleGFtcGxlIHF1ZXVlX2Vu
YWJsZWQgd2l0aCB0aGUgcGFydGlhbCB3cml0ZSBzaG91bGQgYmUgc3RpbGwgc2V0IHRvIDAuDQoN
Cj4gDQo+IFRoaXMgaXMgd2h5IEkgc3VnZ2VzdCB0aGF0IHdlIGhhdmUgcmVjb3JkcyB0aGF0IG1h
dGNoIHRoZSB0cmFuc3BvcnQuIE9mZnNldCBpbg0KPiBzdHJ1Y3R1cmUgY2FuIHRoZW4gd2UgdXNl
ZCBhcyBhIHRhZyBhbmQgc28gd2UgZG8gbm90IG5lZWQgdG8gY29tZSB1cCB3aXRoDQo+IG5ldyBk
ZWZpbml0aW9ucyBmb3IgZWFjaCBzaW5nbGUgdGhpbmcuDQo+IA0KSWYgSSB1bmRlcnN0b29kIHlv
dSBjb3JyZWN0bHksIHlvdSBwcmVmZXIgdG8gdHJhbnNmZXIgdmlydGlvIGNvbmZpZyBzcGFjZSBh
cyBvZmZzZXQgYW5kIHZhbHVlIGFzIHRhZz8NCklmIHNvLCBob3cgdGFnIGhlbHBzIGlmIGl0IHN0
aWxsIHRyYW5zZmVycyBwYXJ0aWFsIHZhbHVlPw0KDQo+IEFuZCwgdGhpcyBpcyBvbmx5IGFuIGlu
c3RhbmNlIG9mIHRoZSBnZW5lcmFsIHByaW5jaXBsZTogZG8gbm90IGhhdmUgdHdvIGRlZmluaXRp
b25zDQo+IG9mIHRoZSBzYW1lIHRoaW5nLiBJbiBmYWN0IEknZCBhcmd1ZSBvdXIgdHJhbnNwb3J0
IHN0cnVjdHVyZXMgYXJlIGFuIGV4YW1wbGUgb2YgYQ0KPiBiYWQgZGVzaWduIGFuZCB0aGUgY29z
dCBpcyB0aGF0IGxlc3MgdXNlZCBvbmVzIGxpa2UgbW1pbyBhbmQgY2N3IHNvbWV0aW1lcyBsYWcN
Cj4gYmVoaW5kIG9uIGZlYXR1cmVzLg0KDQpJIHRvdGFsbHkgYWdyZWUgb24gbm90IGR1cGxpY2F0
aW5nIGl0Lg0KDQpGb3IgNjQgVlFzIHRoZWlyIGNvbnRlbnQgb2Ygc3RydWN0IHZpcnRpb19kZXZf
Y3R4X3BjaV92cV9jZmcgaXMgYmVoaW5kIDggcmVnaXN0ZXJzLg0KU28gZm9yIHRoZW0gdGhlcmUg
aGFzIGNvbnRhaW5lZCBpbiB0aGVpciBvd24gc3RydWN0IHN1Y2ggYXMgc3RydWN0IHZpcnRpb19k
ZXZfY3R4X3BjaV92cV9jZmcsIHJpZ2h0Pw0KDQpBbmQgY3VycmVudCBzdHJ1Y3QgdmlydGlvX3Bj
aV9jb21tb25fY2ZnIGlzIGdpdmluZyB0aGUgY3VycmVudCBzbmFwIHNob3Qgb2YgcmVnaXN0ZXIg
ZmlsZS4NCg0KVGhpcyBpcyB3aHkgdGhlcmUgaXMgc29tZSBkdXBsaWNhdGlvbi4NClRvIGF2b2lk
IGR1cGxpY2F0aW9uIG9mIHRoaXMgcmVnaXN0ZXJzLCB3ZSB3aWxsIGhhdmUgdG8gYmlzZWN0IGVh
Y2ggZmllbGQgb2YgaXQgYW5kIG9taXQgdGhlc2UgMyBhZGRyZXNzIHJlZ2lzdGVycy4NCg0KTm90
IGFibGUgdG8gc2VlIHRoZSBnYWluIG9mIHRoYXQgb3ZlcmhlYWQuIERvIHlvdT8NCg==

