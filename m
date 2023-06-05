Return-Path: <virtio-comment-return-6133-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C79C7EE23
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Jun 2023 13:12:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 8BC8160351
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Jun 2023 13:12:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7723798644A
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Jun 2023 13:12:18 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 646749863AC; Mon,  5 Jun 2023 13:12:18 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 51F4F9863AD
	for <virtio-comment@lists.oasis-open.org>; Mon,  5 Jun 2023 13:12:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CavGU/6XxYGlQ7Q7F+hXGbXx8pXJ7iCsJfqAvLTBelu1vN+wZbcT0E5qjCRIrwCwnraKFfTyiEcCT0fDNR/iDoBLJ1g1o+q1IWpVLcGS/dkYWsyyq+jJm17yLLGBmAqONhz+ktm5taKyhvHzjE5R1q2lRj+zANx84R/kW0vl5sL3Pvdd/w93tYGMcrcUYyZ+HB5REJBEw3Zq22sQQdGbvXTSuWu/X3Q60LyXhWqmmw8wLDKEP/JSBxQUZfbmA+QcExYyVIuGXSpEbbjjhDCHIirthiAahT1KMqyfdeoDrIDTBnoQ9CmcGbAkr+TYUXUXyZJUPZadedyhHftjEQKefQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BF0cisnkg+DzzPiRyYsABanDzBMeFBfW2fJqMm1qt90=;
 b=AHTxmsr6mPE0IenEW5/71teo0NVl4Y4wAZQ2hDuUYdkT7riNa7RpG+hiyK361ErXKEV7Pf638S/SckXXvfkCk842xgkCYUYkXK/35o5LHkxs+HCznVJJ0Knd9t5R1iSHIbqQSdfne7/t29b/hiVgwiISRyPpPNyye5ren2vxvfbhLOb1xy+s8tikSRWrh7ybCmast6zgRowIxmxG113e3NTXlWxPJ3RBsO8D+pZJjDLLS+/+TYLjQcTaTgq/pgks+DEUx6mizAf2rGFvVPX4OKv5o9OgnCcyv7GOls5tvKgVShN7rubyHopk7+zm6ogJboIfqHVMrPHIgAt6mRkO1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: zhenwei pi <pizhenwei@bytedance.com>, "stefanha@redhat.com"
	<stefanha@redhat.com>
CC: "mst@redhat.com" <mst@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "houp@yusur.tech" <houp@yusur.tech>,
	"helei.sig11@bytedance.com" <helei.sig11@bytedance.com>,
	"xinhao.kong@duke.edu" <xinhao.kong@duke.edu>, "jasowang@redhat.com"
	<jasowang@redhat.com>
Thread-Topic: RE: [virtio-comment] Re: [PATCH v2 05/11] transport-fabrics:
 introduce Keyed Transmission
Thread-Index: AQHZfmF1GW/9A6xOmEWve+UarUKjXK97sZuAgABkmYCAADKgAIAAEwGAgAAD3SA=
Date: Mon, 5 Jun 2023 13:12:15 +0000
Message-ID:
 <PH0PR12MB54817ED91B804F55FDC99EC5DC4DA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-6-pizhenwei@bytedance.com>
 <6b653208-ca45-4674-4568-9cb003e14d02@nvidia.com>
 <5c3600cd-4c9f-9d1f-a807-13ed54f6b11f@bytedance.com>
 <PH0PR12MB548194DBF9A205173DFE8042DC4DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fe6a7f09-6ee5-25d0-ea7e-ef4d77a37263@bytedance.com>
In-Reply-To: <fe6a7f09-6ee5-25d0-ea7e-ef4d77a37263@bytedance.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CYYPR12MB8921:EE_
x-ms-office365-filtering-correlation-id: 7d3a7d93-a301-4a00-7992-08db65c67b75
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 UXoXRpWW8pAX1lJBRTU3J9s9O0iZy2iOAXUZOV0Rw8eTG0hOUOuLVr9G3kKCXZ7liBtpCsm27S0VAHrnqdLa2xVY3ymXAOMYXWcJa5oHtAgT2ZqMIRAvt/1mbxpeyNuSRSgBu9/8Lsc2pY5+rr6Rv7wzgR+66SX3lXp+sAlO1kRJyeHBGuIsNY9v4Bpa2XFHzE4kJigp8FlZOuzp4lu8gkUlbBYRlv/V7A5umHcyUOGPrZ0fqypTnPTGvgF53qTM0FZh4ALNKEVCzMbSaHiyXWyyi/bnDeZgt7FL0DcWvZhhk+c9CGp8l3gk9nuCpPXDQns/7beCzIwUWvQ3Qs0nRwSbW36E/PusjHQEJ8ndNrAWIYYuqzUhKqVFDevszRYkfjPNyEB6fI2oPEDV/rOfbnqwnzo6ayarRIg6nmrW4ycrR8RR0DuZWb3Eo612qjQfBC3qh31YbGwoqA7iCP7w7ZaopTG5YFfqKV50pSr7sFCFncfAeSY/1EZmO6UADM0KQ7DWP1XbNubKOacC3+Exj9zHLz1GReBepTc1XE5FTeEYhz1PAnpIcIzWhrjUiVLi4ScwC8Y/sHexLb6Q1YF0byDKWf7ZsJZCGXE9PiCIw9/T5DMhEHWpgnPH5COsoXhs
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(376002)(366004)(396003)(451199021)(2906002)(86362001)(33656002)(38070700005)(122000001)(38100700002)(55016003)(7696005)(316002)(41300700001)(52536014)(5660300002)(8676002)(8936002)(110136005)(54906003)(478600001)(64756008)(66446008)(66556008)(66946007)(66476007)(71200400001)(4326008)(76116006)(6506007)(9686003)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d0Jya3JMZi96a3A0a0xOektTUEpEOVgrNDd0cXdpWnp3a1AxeGZFczZybjJZ?=
 =?utf-8?B?VUhHcVo5UTM4TXRZNEtzWVdIcTFEa1BFVUhIbCtPeFlrcGVZRnhWb0JQUEIx?=
 =?utf-8?B?a3hncGdjamFvK0dsNHJBYzBma1lqT0NUcmRKeUlYRm14TkJRRTB2OUk5RklK?=
 =?utf-8?B?UHpNamVaN2tYaE9mMURaL3lSQzFTVEhaM0FhRDhQaE1rTHUySVdYSE4xaEVC?=
 =?utf-8?B?UUc5YnluTGdCQVovYVpMNTA1WVQyM09SSk9kT3Y2OUZ5c2tVb2Jna1JtT0oz?=
 =?utf-8?B?WEIrOEdnZFV0TTlhWTIwcS8yREgveEFXVHdLWk1BbkVFdmt4M2ptRlp4ZVV4?=
 =?utf-8?B?SHdYVy9XUUlmZnUzWElrTTdhNlRsSEZ1a24vM2pSeEY2VTQ4cWJlSmZ4b3li?=
 =?utf-8?B?SG1FamtuTGs3bUcxZDNseGZmVHY0NnVuTXZFOWFrTjIvZy9QYzFUMllqVURF?=
 =?utf-8?B?aW5QazR4bllHZ2drMnZvVHRVbEl2OXlkV2NMNEUzTGM2Z0dOdE1Ed21NN0l3?=
 =?utf-8?B?VkhSTG1oVlo3Z0hMQ0FBem1JR2V3OFZaM2JTZkwrbU9nTFRpYVJtL0lyMFJu?=
 =?utf-8?B?OXA5R2VXUXJqc2hXZjlHbzhJWDdDczBEZHA2aWtQcjBpZ2tvNUdsZlFwcjNP?=
 =?utf-8?B?TlYvWlRpaFYxcGFnY0V0MXBBSHVVSHhjUWZVUW9GQ2pURGc0M2FiRXZwZlFq?=
 =?utf-8?B?T1llYjFxZjNONm9pc2J3bWtKVm01SU4xbDdYZEJqcHlFTFhuL1BEK2VqTjc1?=
 =?utf-8?B?ZG0wdzFHWWFFU0oxdm1xMFBCTEQ1N0RVT1FWQ2J4S3RCQkFFNDQyZWIxc3lJ?=
 =?utf-8?B?Z2plSUMrcVExS0NNVWQxa21XQUtzRTNqUU1JV0dQOW8rZVZsM3BrRzZQcDJa?=
 =?utf-8?B?Q1ZITnFnWHBLcGg2OWpEcS9wU0tUbmZVTmN1VmdKVGNmeW1ZdHlsc1BOQnho?=
 =?utf-8?B?TjRQTlhJTFo5MForS1ZZR3JDb0JkcWxvUUNIWFpleDFTS3IyZVpPaStFMU9U?=
 =?utf-8?B?d0J5WXVnVVJ3eVltR2RaNkgwOWN1YlZIOFlFN1NwSlptM2ZwRlRNQkRkWFZr?=
 =?utf-8?B?YnRkdlozYXZTbEFxZTZQZmhJRWtlYlZiR3dWSFBpaUdWRllmWVJwaWM2MVdH?=
 =?utf-8?B?MEhSSkxhQyt3bGZpWHVIN3ZwRlBMWC8zN2JreTR3S1RIN1ZqY3NRU3VkWFJR?=
 =?utf-8?B?b0JyS0hvNmpnNWhuTmFjdnVMSndLb3lrY2JhL202a3lsaXJkVVE5c2taaTI1?=
 =?utf-8?B?dVFxdGZvRyt1KzBBSURwcDAyNll6VEhIaFZmcjdYMjc0Mk85M1dOb2dDa2dU?=
 =?utf-8?B?Y1M0K0IvMlRFajlweUh4OVA2aVFHNFg4cGlHV3ZHQ2Y1M0d3NDNwbkk0ZEF3?=
 =?utf-8?B?K2RieG9YZkk0aHBweHVVRS9HYkdCVHh6VWwvL2RZMHFVdHR2RFIwRXBjSjNv?=
 =?utf-8?B?VStUQlIybEhhUFpKdER0T0dBTUFFTUxoUU5JM05IWEo2VzFJWUZOdVowakZj?=
 =?utf-8?B?Mno4NFVmRmJHWmhYMzNYQTFIN1pVeVpQNFpSSk1LZCtaS2VnVG81RXRucEl1?=
 =?utf-8?B?eUd1RGJYazBGbTkwQkZ1SUdCdGJ0RWliaU16Y0NacituYUdYY1Zrb1Y0MG90?=
 =?utf-8?B?L0xTK0JQdzdPVFQ1a0ZRczVJRHRvSDRheHdWUGM4cGNFZnMzVitRc0NwcGtW?=
 =?utf-8?B?cDk1b1puc21mMlUzTHUvbWlKK3hSUHc0WVNIaWsyQ29kRXN5OHJMdXpzalht?=
 =?utf-8?B?cWhxVElpSzlpbDNDV3EzRjFyRnJMdXpsM2gvTWxJS0NwU1d2MUxMK242TUsv?=
 =?utf-8?B?Z1RkRitUSjhEQiswdEg2Qk5PQ0Fob0lJajd6NFEwR2tPYjlrTlZPY2cvZDV1?=
 =?utf-8?B?RWRWcG8wWGNaWUVlVCttK2Y5MTFRMmNNQXZTaFk3Qm1uMXBkRk1rYlV6V1Rj?=
 =?utf-8?B?ZTUxR0JHVkFsSDFjdi9maEkzVGRyNDJyK09hd0dnYmxiN1BMYnV2K2RvSWs4?=
 =?utf-8?B?QkpCTlg4OEJZVFMxREVjMURoaHNLNk9QeXpJaEplYlhsN0x1bWRic3U1V2xa?=
 =?utf-8?B?bi9hUnhKc3FpUmt5SGlFQUdadnZTTFB0MzE2bmRRMXhUY25CczVuT0c4UWdU?=
 =?utf-8?B?aGpqSk9lUzhjU3ZielVmaTRMTXhNNlhvaVZleEVaUnNCQUt0VmZXVE0rYnh5?=
 =?utf-8?Q?WYCadwM9zSvbiMwJUxuoHXQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d3a7d93-a301-4a00-7992-08db65c67b75
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2023 13:12:15.2047
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wWSza2sfOBqzroIDIEIN3ltDCfFgymarNYlGhqcrKKgRU6X7ETW2Z2JbxLeahoyTt2ByjDKOcQsFSiuNwSU0GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8921
Subject: RE: RE: [virtio-comment] Re: [PATCH v2 05/11] transport-fabrics:
 introduce Keyed Transmission

DQoNCj4gRnJvbTogemhlbndlaSBwaSA8cGl6aGVud2VpQGJ5dGVkYW5jZS5jb20+DQo+IFNlbnQ6
IE1vbmRheSwgSnVuZSA1LCAyMDIzIDg6NTAgQU0NCg0KDQo+ID4+PiBpZiB3ZSB0YWxrIGJsayBh
cyBhbiBleGFtcGxlLCBhYm92ZSBjb21tYW5kIGRlc2NyaXB0b3IgY2FuIGJlIG9mIDMyDQo+ID4+
PiBieXRlcywgc3VjaCBhcyBzdHJ1Y3QgdmlydGlvX29mX2NtZCB7DQo+ID4+PiAgIMKgwqDCoMKg
dTggb3Bjb2RlOw0KPiA+Pj4gICDCoMKgwqDCoHU4IHJzdmQ7DQo+ID4+PiAgIMKgwqDCoMKgbGUx
NiBjbWRfaWQ7DQo+ID4+PiAgIMKgwqDCoMKgdTggaW5saW5lX2Rlc2NfY250Ow0KPiA+Pj4gICDC
oMKgwqDCoHU4IHJzdmRbM107DQo+ID4+PiAgIMKgwqDCoMKgLyogc29tZSBwYWRkaW5nL21ldGFk
YXRhIGZvciBsb25nIGRlc2MgbGlzdCBpZiBhbnkgKi8gfTsNCj4gPj4+DQo+ID4+PiBzdHJ1Y3Qg
dmlydGlvX29mX3JkbWFfZGVzYyB7DQo+ID4+PiAgIMKgwqDCoMKgbGU2NCBhZGRyOw0KPiA+Pj4g
ICDCoMKgwqDCoGxlMzIgbGVuZ3RoOw0KPiA+Pj4gICDCoMKgwqDCoGxlMzIgcmRtYV9rZXk7DQo+
ID4+PiB9Ow0KPiA+Pj4NCj4gPj4+IHN0cnVjdCB2aXJ0aW9fcmRtYV9vcCB7DQo+ID4+PiAgIMKg
wqDCoMKgc3RydWN0IHZpcnRpb19vZl9jbWQgY21kOw0KPiA+Pj4gICDCoMKgwqDCoHN0cnVjdCB2
aXJ0aW9fb2ZfcmRtYV9kZXNjIGRlc2NbMSBvciAzXTsgLyogY291bnQgY2FuIGJlDQo+ID4+PiBu
ZWdvdGlhdGVkICovIH07DQo+ID4+Pg0KPiA+Pj4gV2l0aCB0aGlzIGEgc2VuZCBhbmQgcmVjZWl2
ZSBxdWV1ZSBvbiBpbml0aWF0b3IgYW5kIHRhcmdldCBjYW4NCj4gPj4+IGV4Y2hhbmdlLCBjbWQg
ZGVzY3JpcHRvciBmb3IgcmVhZC93cml0ZXMuDQo+ID4+Pg0KPiA+Pg0KPiA+PiBIaSwNCj4gPj4N
Cj4gPj4gRG8geW91IG1lYW4gdGhhdCBzZXBhcmF0aW5nIGEgVmlydGlvIE92ZXIgUkRNQSBxdWV1
ZSBpbnRvIDIgUVAsIG9uZQ0KPiA+PiBmb3Igc2VuZGluZywgYW5vdGhlciBvbmUgZm9yIHJlY2Vp
dmluZz8NCj4gPj4NCj4gPiBOby4ganVzdCBvbmUgUVAuDQo+ID4NCj4gPiBJbml0aWF0b3JfUVBf
QSAtPiB0YXJnZXRfUVBfQi4NCj4gPg0KPiA+IFdoZW4gaW5pdGlhdG9yIFFQIEEgc2VuZHMgMzJC
IGNtZCwgaXQgbGFuZHMgaW4gdGhlIHRhcmdldCBRUCBCJ3MgcmVjZWl2ZQ0KPiBxdWV1ZS4NCj4g
Pg0KPiA+IEFmdGVyIHRoaXMgdGFyZ2V0IGNhbiBkbyBvbmUgb3IgbW9yZSByZWFkL3dyaXRlIERN
QSB1c2luZyBSRE1BIHJlYWQvd3JpdGUNCj4gZnJvbSB0aGUgaW5pdGlhdG9yJ3MgbWVtb3J5Lg0K
PiA+DQo+IA0KPiBIaSwgSSBoYXZlIHNldmVyYWwgcXVlc3Rpb25zOg0KPiAxLCBob3cgdG8gdGVs
bCB0aGUgdGFyZ2V0IHRvIHJlYWQvd3JpdGUgRE1BIHVzaW5nIFJETUEgcmVhZC93cml0ZT8gaXMN
Cj4gdmlydGlvX29mX3JkbWFfZGVzYyBtaXNzaW5nPw0KPiANClZpcnRpb19vZl9yZG1hX2Rlc2Mg
aXMgcGFydCBvZiB0aGUgMzJCIHN0cnVjdCB2aXJ0aW9fcmRtYV9vcCBpbiBhYm92ZSBleGFtcGxl
Lg0KDQo+IDIsIGlmIHNldmVyYWwgdmlydGlvX29mX3JkbWFfZGVzYyBhcnJpdmVzLCB0aGUgdGFy
Z2V0IG5lZWQgdG8gZGlzdGluZ3Vpc2ggUkVBRCAqDQo+IG0gKyBXUklURSAqIG4gZGVzY3JpcHRv
cnMuIGJ1dCAqZmxhZ3MqIGZpZWxkIGhhcyBiZWVuIHJlbW92ZWQgLi4uDQo+IA0KVGhlIGlkZWEg
aXMgdG8gbm90IGhhdmUgbXVsdGlwbGUgdmlydGlvX29mX3JkbWFfZGVzYy4NCkFuIGluaXRpYXRv
ciBjYW4gcmVwcmVzZW50IDFCIHRvIDRHQiBvZiBub25jb250aWd1b3VzIGJ1ZmZlciB1c2luZyBh
IHNpbmdsZSByZG1hIG1rZXkuDQpIZW5jZSwgb25seSBvbmUgdmlydGlvX29mX3JkbWFfZGVzYyBp
cyBlbm91Z2ggZnJvbSBpbml0aWF0b3IgdG8gdGFyZ2V0Lg0KDQo+IDMsIGlmIEkgdW5kZXJzdGFu
ZCBjb3JyZWN0bHksIEluaXRpYXRvcl9RUF9BIC0+IFRhcmdldF9RUF9CKENNRCksDQo+IFRhcmdl
dF9RUF9CKFJETUEgUkVBRCksIFRhcmdldF9RUF9CKFJETUEgV1JJVEUpLCBUYXJnZXRfUVBfQiAt
Pg0KPiBJbml0aWF0b3JfUVBfQShDT01QKS4gdGhpcyB1c2VzIDQgUlRULg0KPiANClJETUEgcmVh
ZCBhbmQgd3JpdGVzIGFyZSBmb3IgdGhlIGFjdHVhbCB2YXJpYWJsZSBzaXplIGRhdGEgb2YgNTEy
QiwgNEssIDFNQiBldGMuDQoNCk9wdGlvbmFsbHksIGEgdGFyZ2V0IGNhbiBleHBvc2UgYSBjb25z
dGFudCBzaXplIGJ1ZmZlciB3aGVyZSBpbml0aWF0b3IgY2FuIGRpcmVjdGx5IHdyaXRlIHRoZSBk
YXRhIG9mIDUxMkIsIDRLQiBhcyB3ZWxsLg0KSG93ZXZlciwgdGhpcyBkb2Vzbid0IHNjYWxlIHZl
cnkgd2VsbCBhbHdheXMsIGJ1dCBzdXJlIGl0IGlzIHBvc3NpYmxlLCBhbmQgaXQgb25seSB3b3Jr
cyBmb3IgYmxrIHdyaXRlIGNvbW1hbmRzLg0KDQpJbiBhIG1vcmUgYWR2YW5jZWQgc2NoZW1lIHRh
cmdldCBjYW4gZHluYW1pY2FsbHkgYWRkIHN1Y2ggYnVmZmVycyBhbmQgYWR2ZXJ0aXNlIGl0IHRv
IHRoZSBpbml0aWF0b3IuDQpJIHdvdWxkIHRoaW5rIHRvIG1ha2UgaXQgaW5jcmVtZW50YWwgb25j
ZSB0aGUgYmFzaWMgZGF0YSBmbG93IG1vZGVsIGlzIGVzdGFibGlzaGVkLg0KDQo+ID4gRmluYWxs
eSB0YXJnZXRfUVBfQiBzZW5kcyA4QiBjb21wbGV0aW9uLCBpdCBhcnJpdmVzIGluIHRoZSBRUF9B
J3MgcmVjZWl2ZQ0KPiBxdWV1ZS4NCj4gDQo+IC0tDQo+IHpoZW53ZWkgcGkNCg==

