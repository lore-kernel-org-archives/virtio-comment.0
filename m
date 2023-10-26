Return-Path: <virtio-comment-return-7970-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F622C25B48
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 06:02:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 95E9C2AD54
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 06:02:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 77162986A4E
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 06:02:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5FDD5986A44; Thu, 26 Oct 2023 06:02:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4EAB0986A45
	for <virtio-comment@lists.oasis-open.org>; Thu, 26 Oct 2023 06:02:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V02pmpgZYrtCpCekAmKiuVFMpzBYkCsKIoFYfQ+KmbXMTa110nmUnbjyVVC/VSYRNTvbk3Ihmz1w1yRtqM0IH4GYH4rl7PgQbnAOb/HrAZhIu/0QGwFRJ8Ga456v/7f0vTxL4O+98FjaXl1Ak7EzwDVmstLrXsMnKONnCf/gq1kQmsAgBSIrD1W6RL4fYyJ/d46F54BFIEBjHH+NCRvZkAhu2kb/H64tqlxNA8voSoq0Rsp9cUHc+3sOLgcFVD0H+N7Cu8ZFUYYUKxLt1/Qu7Svh28XX2Etv9lXA8cNpHbLuYodfNgCURIRXl+qJbSUbyxLV5kXTYuHszwx7A/3myA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pX89xisovFm0lqyRtfQeihfyhVZ2/i+DVmYgqFcPC6Y=;
 b=BEhdfQtEnCvsQvFhJa6eN9BWBVnavzBBVuuaBjrv2poNbFJEafsA6Q84OwBlzuF2wR5CUcFM389xblmTay4vnxEQoxK46vD9gtjsjfmvsMZP+qcvE/1C3dRVDV6zGn3WuHIfdCC0KQGVGhvFu4W229x/uJ6ipmQe+CsHlVG/1aiUrEROEniOSXDS8DxnE5XRxcwoBdyAV5k944ygNjGhVaaOjKTHzqltrjq6YZG3PQYn3XbUrJ0jOxmn82T0RrvWcw0wv0ctgMhmXElYs2GGsRAoh+QoK1baSzeDr+Ku0IG2mo8oIJWQHyTRcUKTB+1BRrD0oJkjsyCtSO1ZcCnqDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Cornelia Huck <cohuck@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "hengqi@linux.alibaba.com"
	<hengqi@linux.alibaba.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, Shahaf Shuler <shahafs@nvidia.com>
Thread-Topic: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage
Thread-Index:
 AQHZ9O+eNF50SoOX0EKV5RZKM+E/zrBOABmAgAAC7YCAAW3ogIAAANSAgAAJ84CAAAB/0IABwd9wgAZBiUCAAAgxgIAAAJFwgAAH/ICAAAX5IIAAA0oAgAADzbCAAss+gIAACFOAgAEc2TCAACXpgIAAAYlg
Date: Thu, 26 Oct 2023 06:02:28 +0000
Message-ID:
 <PH0PR12MB54811806D9195E8611DBF7F3DCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <PH0PR12MB5481D21AD4CD4C649C4E023FDCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87zg09bfwg.fsf@redhat.com>
 <PH0PR12MB5481A3846046A484EFE20408DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87wmvdbehg.fsf@redhat.com>
 <PH0PR12MB548172C89C0213867F765012DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87ttqhbcy7.fsf@redhat.com>
 <PH0PR12MB5481723C85AF5B80689C9084DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB548149234F6B8F894387FAAADCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231025062207-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5480246A4E61D071C4C60A69DCDDA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231026013059-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231026013059-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DS0PR12MB8342:EE_
x-ms-office365-filtering-correlation-id: 678ef4e7-2294-469b-1bd5-08dbd5e922bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 OpGG7+gDRu7PpGTfJ1Obh6H3OmrkyPL/OD4mIqCZQ6g9zZBny4LN24xjIQqPRLYhiOWf04fLM5M2fmaJXnUGoK7isd4deDdtcGCcb+TM8TACSBs/7xyVKAEhBMOmyQEJ+ufWDLExlt1uLEhHzFyDs33ZIIH4eisPuO/Z+yw1UY1Gc/zwRps/49apofXVYjQhSomiQWEb68bZih9vuW9869vJxUzbiacwieP7e53QG9zM6TR/0Pxxw2hrncgJBj/5z5ZqbDue/fQnAIqfK0bnWMFBIORjLJF5q/Xswj6F5XF3mEEiXDvFWHf/C9cjQr7Dkf6Buzq609pXrqBSma7sc6CEyi24uT4NQu4kJIj/3klhpQHfp0Gf5ZJkmrG8qITUrkHt6jNTndmeHUA7BpXeeJggcE6saC7JOc5vTfUthRj82+VmtiHCEZH3DcBJMHVJ9g4hHIWSjyHrgwmNwjfWykJPM/Jf6SGbEL6xti05+nQpfbG+z5FkL9q3hd7XSaRSBIkgpLaow2AfPA65CT7/CnEy1+xJRHE9Qp/wN64G89zGsf5Xi05dOROozNwhh9XWThfvCwd2LZGT6Wmgkm+8HDDB6b3XbxxUoblIQ2nle+a/cw32npoiNvGBh1sJgFUF
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(39860400002)(346002)(136003)(396003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(54906003)(66556008)(66476007)(55016003)(478600001)(38070700009)(107886003)(316002)(76116006)(38100700002)(64756008)(83380400001)(26005)(66446008)(7696005)(6506007)(6916009)(41300700001)(122000001)(52536014)(66946007)(5660300002)(2906002)(33656002)(9686003)(8676002)(8936002)(71200400001)(4326008)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M2NEOXZwRmM0b0ZsNVVkTFZPZWJ6VjlWbFV4cHRDR0hQNXNDKy9BYkpmZ2d4?=
 =?utf-8?B?UStRSTQzVEhKTXcyclN3eE5rQUV5dHRUOWVZU1pWczQ0dTZLN3V4TlE5elJX?=
 =?utf-8?B?NEtKRjZpM1BSTXBGQlFCYlJkN256UEk3Q3dJTHp2Wm5qeUk2MVVyRC9xYm1Z?=
 =?utf-8?B?cyt0WUJjZVN1ejBPR2N3dWIzZzBkc0cvTEdJK3dWT201OE1lN2ZGZFV2cGZJ?=
 =?utf-8?B?M1VESnVmRldUTXFlS1MzUE9XOENyZWJlcGE5ajBZNTdoV1FWZjZqazhhczdx?=
 =?utf-8?B?cGJMT0ZtWEI0VDFWenI5Z1A1dWFrTHlRVHZUbnhkbFYzYmJ2b0NsK2FHN3Yv?=
 =?utf-8?B?dVNLMU1kKzhnUmMxVStmaitDcVBsZGJ2aC9JaW9jM2M4WkF2MTlqbCtDNTFi?=
 =?utf-8?B?MWdERHVHb0ZXTVF1eDVHc2ZTRnBKSTV3M0QzNGd1eHVseFdaT01DWkUxakdH?=
 =?utf-8?B?Sm9PNnptc2VjaXZWQUhUWGQ1d05xempES01kcnd3QzZSSTJqYmdpM25BOW9y?=
 =?utf-8?B?UHUxQlhXdnZzc2tKZzYzSmdPYlloTlB0b0dHT1prNWZGcmhaaFJwMG1oZW4v?=
 =?utf-8?B?aWU3TnBWTWFmcWlQYTVlSFVmZUZIeGY3RVJPRXhURWZPalpJek5aNWlKU1d6?=
 =?utf-8?B?Z2tKQURzOUNlZWdDK0x4R0VKcDR2L3JxVnFFMFNBSjBYbVJLdHM2dFUvSkQv?=
 =?utf-8?B?QVdiUzFKYTVPbitBV3ZxL3U3SU5Fa0xhY3Z1VFJwVGVET1RkQldvVndWVmpy?=
 =?utf-8?B?Wk1ISXdtbGw4NWhRcWg0MUgwRlQ0UmlzUTFwNEVKMHlJZ1BMNEdTSEphTytC?=
 =?utf-8?B?bHg3OHY0MHBCb05BUlI1T3hyKy9CR1ZZN1ZId0RYUC9OY25ON1NJNldqRGE4?=
 =?utf-8?B?MjNzQm51MGptTStVb3NzNVN6THZoc28xK0NaLzVOdDIva1AxaU1xb2xHRUFT?=
 =?utf-8?B?eDBjRVZJK1VEcVA4VGpYeVE1SjgrWmxHV2lXQzNJaTdHK1JqVU84a2tsbDFw?=
 =?utf-8?B?SnloSXZncWpDYkxKUHBTNEl6bTh0bHlXNnM5SzBmTFhTbDJTWGNsSjc2dk8r?=
 =?utf-8?B?ZW9FRW1YMEc0L3JCSXQ4VDEvUGU0QlhXYXl2QWhvMkhlZVRHbWZkUXVwejVP?=
 =?utf-8?B?NjRmLy9MWUhlUG8yaU05SnBwb3Fqd2NYbEVwaGpVc21jV3hibGpVditxd2t6?=
 =?utf-8?B?dTN4T2xQQzdGaDdOdHNGL0dxWVgyZ0UvellpK0lLTHpNN0xPbHA2WEE5L3Bs?=
 =?utf-8?B?UllMMzBsMkdRQjBzWklvL1M0RUx6Vk9pSkxRMHQ1Z1hWdmhwZmhHV3duZk5r?=
 =?utf-8?B?REl1Q0ExN1gzZS9KZEwwSlU0L2RiS1NKNi80VzUwVTQ4SUg0c2hyRmNwYU5p?=
 =?utf-8?B?czB3RUpXOWoxSlRlT2o5Y2hxeVgzRnVCZkJqa0UwMkRQa1dqZDEwdGw1Q2pp?=
 =?utf-8?B?cUVSN1lRa0xoaWNIQmxuU2R2SysyUE5jTVVDSlFkdnBldmJ5RDljOVRmSlNq?=
 =?utf-8?B?Q1VjdzV0a0NZMXZqRlpoOXh2VEIvRkVFTFJhS00xeXhVczNxeVlMVGpJVGU5?=
 =?utf-8?B?anUvZ3NsemI5N3gzYWNuK3BRUGYySUxSb045S3BlNnkzUjd0aFJZUWV6Z1c5?=
 =?utf-8?B?WmxJL3lJdDNnbExJRlpQdWJGaHE5a0FwbFkyTEIrSDhOaWdCczJ6YlljRFRs?=
 =?utf-8?B?TGx6RmVFTThFL3pnK0ozMkwreTI5MjZ6NG5vQTZXZVgzK1RoaGJ6Rlpjb2p0?=
 =?utf-8?B?SUlFVk9qcFphWEJHM2UyTTBmbmtIZ1ZUNFFzRS92VEdaeFRyblQvUXFXekNO?=
 =?utf-8?B?SzRXam9sZnRBOHRoTDRJaTBYeEE5akVVejhDOHV5aTRvL3I4eGxXU2FpRWVh?=
 =?utf-8?B?MkhnR0ZqSkFtaDJIK3h5V1ZVYytYUGtSc2J4WC9vOEhMWktLWGFUcDB0RVJO?=
 =?utf-8?B?U1FTNm5lQk5yY2Zacnhhc1Y5S0ZjUGJKK2w2ck1kWS9ZNlp0YnJwZUM2ZUdk?=
 =?utf-8?B?S1Q3c0JveXJaUVB0NStwYlVxU05hWnhoOWI3VXRIY0ZPS0pDRWk4Tnh6Rk0x?=
 =?utf-8?B?WkFGYnR4bjZKbEFsU0VvY1RDTnR2VmJwazZkdEo4OUwySnplc0FZeklSRFdj?=
 =?utf-8?Q?AD3o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 678ef4e7-2294-469b-1bd5-08dbd5e922bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2023 06:02:28.9728
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wq6D1VAJA7LF1UchPPWornQDP7W4f5xZ2OeTGAtDX4Dnaui7HAALwSpjytplJ1Za8LbeSTZFb3AjZI934wTjjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8342
Subject: RE: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage

DQoNCj4gRnJvbTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4NCj4gU2VudDog
VGh1cnNkYXksIE9jdG9iZXIgMjYsIDIwMjMgMTE6MTAgQU0NCg0KPiANCj4gc2hvcnRlcjogaS5l
LiBhZnRlciBGRUFUVVJFU19PSyBpcyBzZXQgYW5kIGJlZm9yZSBEUklWRVJfT0sgaXMgc2V0Lg0K
DQpPay4NCg0KPiBJZiBWSVJUSU9fRl9SSU5HX0RZTkFNSUMgaXMgbmVnb3RpYXRlZCwNCj4gdGhl
IGRyaXZlciBjYW4gY2hvb3NlIHRvIGVuYWJsZSBzb21lIHZpcnRxdWV1ZXMgYWZ0ZXIgRFJJVkVS
X09LIGlzIHNldC4NCk9rLiB3aWxsIHRha2UgdGhpcyBzaW1wbGVyIHZlcnNpb24uDQoNCj4gDQo+
IA0KPiA+DQo+ID4gPiA+ID4gK2VuYWJsZSBldmVyeSB2aXJ0cXVldWUgaXQgd2FudHMgdG8gdXNl
IGJlZm9yZSBzZXR0aW5nIHRoZQ0KPiA+ID4gPiA+ICtEUklWRVJfT0sgc3RhdHVzIGJpdDsgdGhl
IGRyaXZlciBjYW4gY2hvb3NlIHRvIGVuYWJsZSBhDQo+ID4gPiA+ID4gK3ZpcnRxdWV1ZSBldmVu
IGFmdGVyIHRoZSBkcml2ZXIgaGFzIHNldCB0aGUgRFJJVkVSX09LIHN0YXR1cyBiaXQuDQo+IA0K
PiANCj4gDQo+IA0KPiA+PiBUaGUgdmlydHF1ZXVlIGVuYWJsZQ0KPiA+ID4gPiA+ICttZWNoYW5p
c20gaXMNCj4gPiA+ID4gPiB0cmFuc3BvcnQgc3BlY2lmaWMuDQo+IA0KPiANCj4gDQo+IA0KPiBJ
IHN0aWxsIGZlZWwgdGhlcmUgaXMgbm8gcmVhbCBleHBsYW5hdGlvbiBpbiBhIHRyYW5zcG9ydCBh
Z25vc3RpYyBtYW5uZXIgd2hhdCBkb2VzDQo+IGl0IG1lYW4gdG8gImVuYWJsZSIgdmlydHF1ZXVl
LiBEbyB5b3UgbWF5YmUganVzdCBtZWFuICJjb25maWd1cmUgdmlydHF1ZXVlIj8NCj4gDQpUaGVy
ZSBpcyBleHBsYW5hdGlvbiBvZiAicmUtZW5hYmxpbmciIGEgdmlydHF1ZXVlIGluIHNlY3Rpb24g
IiBWaXJ0cXVldWUgUmUtZW5hYmxlIi4NCg0KVGhlcmUgaXMgbm8gZ29vZCBleGFtcGxlIG9mICJj
b25maWd1cmVkIiBpbiBnZW5lcmljIHNlY3Rpb24gZWl0aGVyLCBvdGhlciB0aGFuIGNsZWFudXAg
YW5kIG1taW8gc2VjdGlvbi4NCg0KPiANCj4gQ2FuIHdlIGp1c3QgYXZvaWQgdGFsa2luZyBhYm91
dCAiZW5hYmxpbmciPw0KPiBJcyBpdCB0cnVlIHRoYXQgeW91IGNhbiBiYXNpY2FsbHkgY2hhbmdl
IGFueXRoaW5nIHlvdSB3YW50IGFib3V0IHRoZSB2cSBub3QganVzdA0KPiB0aGUgZW5hYmxlIGJp
dD8gSWYgc28gdGFsa2luZyBhYm91dCBlbmFibGluZyBpcyBqdXN0IGNvbmZ1c2luZyBJIHRoaW5r
Lg0KTm90IHJlYWxseS4NCkVuYWJsaW5nIHNlcXVlbmNlIG9mIGEgdmlydHF1ZXVlIGZvciBwY2kg
YW5kIG1taW8gdHJhbnNwb3J0IGlzOg0KDQoxLiBzZWxlY3QgYSBxDQoyLiBwcm9ncmFtIHRoZSBh
ZGRyZXNzZXMNCjMuIHNldCB0aGUgZW5hYmxlIGJpdA0KDQpIb3dldmVyLCBhcyBJIHRoaW5rIG1v
cmUsIHRoaXMgb25lLXdheSBpbnRlcmZhY2Ugb2YgZHJpdmVyIGluc3RydWN0aW5nIHRoZSBkZXZp
Y2Ugd2l0aG91dCBhbnkgZXJyb3IgY29kZSBhbmQgd2l0aG91dCBhbnkgcmVzcG9uc2UgaXMganVz
dCB0b28gbGltaXRpbmcgaW50ZXJmYWNlLg0KSSB3aWxsIGJlIGRyb3BwaW5nIHRoaXMgc2VyaWVz
IHRoYXQgbWlzdXNlcyB0aGUgY29uZmlnIHJlZ2lzdGVycyBiZXlvbmQgaXRzIGludGVuZGVkIGlu
aXQgdGltZSB1c2UuDQoNCkxldCBtZSB3b3JrIG9uIG1vcmUgbWF0dXJlIGludGVyZmFjZSB0aGF0
IHNvbHZlcyBmb2xsb3dpbmcgY2hhbGxlbmdlcy4NCjEuIGFiaWxpdHkgdG8gY3JlYXRlIGEgdmly
dHF1ZXVlIGR5bmFtaWNhbGx5IGFmdGVyIGRyaXZlcl9vaw0KMi4gYWJpbGl0eSB0byBjcmVhdGUg
dmlydHF1ZXVlIHdpdGggb25lIG9yIG11bHRpcGxlIHBoeXNpY2FsIGFkZHJlc3Nlcw0KMy4gYWJp
bGl0eSBmb3IgdGhlIGRldmljZSB0byByZXR1cm4gZXJyb3IgaWYgaXQgY2Fubm90IGNyZWF0ZSBk
eW5hbWljIHZxIGNyZWF0aW9uDQoNClRoZSBxdWVzdGlvbiBpcywgZG8gd2UgbmVlZCB0aGlzIGdl
bmVyaWMgZmFjaWxpdHkgYmV5b25kIHZpcnRpby1uZXQ/DQo=

