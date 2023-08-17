Return-Path: <virtio-comment-return-7184-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 288D3C2FC14
	for <virtio-comment@archiver.kernel.org>; Thu, 17 Aug 2023 04:52:06 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 63A4D79087
	for <virtio-comment@archiver.kernel.org>; Thu, 17 Aug 2023 04:52:05 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 467039863FE
	for <virtio-comment@archiver.kernel.org>; Thu, 17 Aug 2023 04:52:05 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 31E02984043; Thu, 17 Aug 2023 04:52:05 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1A15C9863F0;
	Thu, 17 Aug 2023 04:52:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nzzy36+ZUL8l2+LryHR7BGMrgiNJh7HJcQiabt/pvs6r2g9SEMGhUZ6hrY8JFSCBgcq/wPYhHVv9Yxk5xhlzPIStGmuLo3FtT73izSzqrTZHVIKEKEgPEDMXw2OeNOkVq+73WiH7En8RNeNlh4OFAXKcA3qWvx0ZcV2FqhMtLj5CKTuWylCh+fmkj+Jx+1aDzeXaGtlPyUqbioZYOwWhf6cNoIqSiMKfAZzIvoEwf38KKBSZsvMDT7kk5+pQpAPvKRxaV+1cVr94NwYH+LreJQiNggQn6lM3dl1pwBe6ACzIqf8LJFhkAUxYI7bStYiGvIBEr5tph0k9BSSLMF1qpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6fppQTvAq3qLdKLH+XxhgW78+NGeh0saszyZqXu8yi4=;
 b=KIEYxADDLRFOtPVWVuXQWtjSKxuX+mCtVgYYVWLaVRVNQHp2Fnb3UjY0SHInfU8GMKQBT/KbiLiki/uBbY3oRmv4TO5EMDu20Lfajp1Ft4tDza642LZd1AdLxYbgNIlwgvJsZAXdNqzD5D7Nauhr2pw5S/Qdtg2+w6PuivP+k1rJqVp6zSn6Zy8HAXqXAakZL4ibB2JkP1rPjdSVk58c5B21ahTCnGxDUlqeqCuO427mVB/BPiU6FB4pHPbSdhihS1ReyZMeNKwjpOU3yjjwh+FQ2T2/Z76iqF4C2IjDUVHgleuvjlChOkj9xottXRvtCHNPrSIpt6ifuhY68IoFMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Heng Qi <hengqi@linux.alibaba.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "david.edmondson@oracle.com"
	<david.edmondson@oracle.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, "sburla@marvell.com" <sburla@marvell.com>
CC: Shahaf Shuler <shahafs@nvidia.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>
Thread-Topic: [PATCH requirements v4 5/7] net-features: Add n-tuple receive
 flow filters requirements
Thread-Index: AQHZz0ybAp2BVBRKNECVQ04dzfRGH6/sztiAgAEeu5A=
Date: Thu, 17 Aug 2023 04:52:02 +0000
Message-ID:
 <PH0PR12MB54812AD79BF20B024DB1F63CDC1AA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230815074600.473933-1-parav@nvidia.com>
 <20230815074600.473933-6-parav@nvidia.com>
 <131c210d-dced-454c-b60b-950442308dcf@linux.alibaba.com>
In-Reply-To: <131c210d-dced-454c-b60b-950442308dcf@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DM4PR12MB6277:EE_
x-ms-office365-filtering-correlation-id: 4a78d90f-e931-4837-ff58-08db9eddb272
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 4oB+j6Sn1qKcujgjo9b7ANWy224S+T2nfDwbYg/+e8fFuTKUN72zhQNFrTTVTJkGQnxz+XvJpmvLR6zXkxA8ZGZtR+X6rXoGHHk7Yu7TBEgA5gE5DvYJv6UwUCmqaJvbxB23dXvfAg1TMMEzxEAoLQNtWYUsWqmhAH8vx/imIJY9eMXcwWE3p6cMIEgg3bqB3Udth75i18hqMIh4tCI/uf9Ry5gdjz5IsWRng/ARjEk2Q3qgaq2yjGHaEL+RkZxr3mVZl9uBREgsKql3Kvbt0ztqYrvkZqS/fNMUoRJZ4WblSjqZPqC2MB3+W05DW2f+M6+bAZz2Zd7VV8FNeFXtjMOZXeL83sG+rY0Iqa8oZW790aCWeNbC5AiaihYDa0ApUzE/8O/mlol/x56xKZ4qpyL66TGHUMsa0EzYH2Auz3K6lrWfc33PAWCW6AFaA87BnLm3F/RL1sWTayinwJfFEfv2oC85YJaQ/pUqbZhBIxz7RNNqKaJODvpSkt9V3XQnhJyUERlzjLbntGt7L1VdKCXml5B8zdYuWAPbcA4g88qoIcoMDIkgPXqKrjP3Srv46jBr5Pa3tTkoZbiG/yj0padxzuSNH9AIx81snRlWFQgRNlLrkQ3Xa7+id9PSKZts
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(376002)(39860400002)(396003)(346002)(1800799009)(451199024)(186009)(2906002)(83380400001)(86362001)(478600001)(6506007)(7696005)(71200400001)(33656002)(9686003)(55016003)(5660300002)(52536014)(41300700001)(66446008)(122000001)(110136005)(54906003)(316002)(66556008)(66946007)(66476007)(76116006)(64756008)(8676002)(4326008)(8936002)(38100700002)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c0VzaGxJeTA2a3RPOHlzejE2T0lRUm5tZXE3c1F4dzM0RTIvYUUxcHZmMDNL?=
 =?utf-8?B?T0x6KzZ5M1ZhODRWamZES0lDZG9HUlhaeTh4RytyemZWN0lvM3pVbTQ0MU9N?=
 =?utf-8?B?cGxyT2pySG9CaVpXWGlNQjhRNnNXR1JYUjk5anlpRWZQbk1YNHo0aGxGL0xt?=
 =?utf-8?B?Zmx6aTA0QVhXZUdmazJYREsxL3Z4R2djVDlzbUlWU2dXeG1Hc1ZuWGprdXdC?=
 =?utf-8?B?cFphVFBkcXRLcTFjWElZakVsdHA2TklZVHNtU2J6c2ZodkRaRTJkc01ZSFZZ?=
 =?utf-8?B?VENiWDFrdGlvMmEwbDErMmdyWlhrK3R2d2ZSelFXUkdsMi95WkZqMnBKM1Zp?=
 =?utf-8?B?VHdvRTgvUDlZbURMTk53Y21NL1UzMEtaUFRyc00vSGJQbTR0RGNaa1hQR0Fq?=
 =?utf-8?B?Y2R6RHdFZkxnWXIwODVlOVpWeENTUENxZittbUJSK2w5clk3WlBZMkxIME5V?=
 =?utf-8?B?bGxzTUk1bWJ6aExYNHZrYXc0Q1daMHRYVHFpMUI4M1RhWnNiZGxtZTY2Ymxv?=
 =?utf-8?B?Q09JNk9TT2Z4SHNFdi9UcGxMU1pFWEIxM3A3RHZ0SWJsK0FuTnlkdUpaWGhp?=
 =?utf-8?B?ejVCUDU2WFB2VXRpSVJKdXdxR0FwOU5ReElzcmlSalZ0VmpPUUtuSEJlRFVo?=
 =?utf-8?B?dllmVzFlTDRxblRIcjcwaVEyQ2JmdnhYRHZsbTlkcTQ3aTh1akZWalYrb1oy?=
 =?utf-8?B?T21UVmFpMTQwR0VjN3U5WW5vN0MwblE1Y2dYQSs0WTY2ckpVQktkbGtxTm1Z?=
 =?utf-8?B?UG5HaUtXSVI3a1hkVXB4WFFqMUtwM2hnR2RlbklseHc5NlNoVFgxWGdMYVI3?=
 =?utf-8?B?aWgybllQWU9NTUtxcnliUUdwQ2dXdnZSOGdhNE1vRzRESWhQYWxnRW1IK1ZJ?=
 =?utf-8?B?T2Y5R1ZzSDdobkk4RTlhOVJUNjRpcFI5NzdyVmZ5aElhWG1rSHBzMWRMOTFJ?=
 =?utf-8?B?VUpnRU40UFA2RzdMcCtYKzVTdjVkVDFVakRmWVVwaHVzREJlOFR1QktoODZH?=
 =?utf-8?B?MEVBT3lJNUVrdzE0dVNMa3ZWTXU5L3NYMGkxd0lHRjBzNDA4MG42cndHcnQ1?=
 =?utf-8?B?S1A0bUNuL1Vqd0dVK2ZSQm5qVVY4NWhiekR5VVo0Y3hkQWJpNkpYQzN0VW8y?=
 =?utf-8?B?N1JXRU1BbWdlUGMwVWZzRTNzUTZhUWR5eEYyWmgzT3RUQjZ2WGx1c3BwaklX?=
 =?utf-8?B?VDVlYi8wcVA5VkgyNkRRVUpQd0ZDMUVkSGIrVTZSUnpDQmZnUU9sS3ZZRWZa?=
 =?utf-8?B?eTJjVFJWbGpaZGlXR2RubC9uL1VFaXBaSFhsay9YM29BTGdPclY5YlhaMjgy?=
 =?utf-8?B?VkZCQUxrbFFrSlU2ZlFDRGw0Q1ptalp0RFdYK3AxTUxXVSs3UTJoa2NZY3k5?=
 =?utf-8?B?d0lkWDg1VUxoY0hZdk5STWluM21wejBHUDJyWkhodElXS01uR3N5ZWZKUG00?=
 =?utf-8?B?dlVmM2J4T0RpK3YrWnpIUy82SDUzdXdKV3dWMVFQSURnMUMvMTNPaGtoSlBW?=
 =?utf-8?B?c0JYK3JUeGhBZi93WDh3VEV5cS8wREhmYnpleW9iU2U4VEowaWorUTBFMGc3?=
 =?utf-8?B?amJGUmNlSVYwOEVvSnNJdHo1VGxPb1VKdFFianVGaC9aTjJYN3V5NFd4Z3pl?=
 =?utf-8?B?UzQ4TTJESkVKOXIwUDMvakQ4TXh4eG5heGt0czYvc0JsazVZUnJXeHlyM0xQ?=
 =?utf-8?B?TEZQM1J3K0dtK2pFRlgyWG5SUStya3lWUFcyN1ZLYlIzNzZqcXQrTjlaU0xD?=
 =?utf-8?B?UzRONWZIci9DeWV0NkVxaGhoMks3THRFV1FwZWZVVTNVTEdtUVJZekpuaWMw?=
 =?utf-8?B?d0xDYWRzQzk2SFc3a3J4NXpwSkZ6K01CT2puVjBpOFdiT3Q0T3RueHRERGdX?=
 =?utf-8?B?K08ybGFZS3ZzM0pkMFpwVzBpb2ZsaWNvbVdSSzhOU2lQUnp5YkFWVzgwbkh0?=
 =?utf-8?B?cllFREpHeTNlYysxMllTRStRYXlhNW9VN0VmallheW9mTTkveS9TbnJqMDNn?=
 =?utf-8?B?UjR3czBmUHduaVBsank1QkdIT1FUbExHV3hQMzh3Zm1QbFFKMGZ1K0pHQkhW?=
 =?utf-8?B?S1lFRHBIU2lpWGx0THRrQy9OZ01JN24yckY1aVcvbjRQcDNIQVRoaTRYUVFF?=
 =?utf-8?B?WWM0cEwwelBnNjc0bSt0RU91K05oS3VtM3grVGJQZG9yTkE2ZG1oYVM3bk0v?=
 =?utf-8?Q?5A7pRrdk6892lWS5PF96Wyc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a78d90f-e931-4837-ff58-08db9eddb272
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2023 04:52:02.1592
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: imAycliCXt40DpOmJpRh1vdfiK9Ix9RW/fpJr4XXbak6TL8u67+k/m3MnvEduC7ZFj3qF1RxvCGAmrtpNZLWnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6277
Subject: [virtio-comment] RE: [PATCH requirements v4 5/7] net-features: Add n-tuple receive
 flow filters requirements

DQoNCj4gRnJvbTogSGVuZyBRaSA8aGVuZ3FpQGxpbnV4LmFsaWJhYmEuY29tPg0KPiBTZW50OiBX
ZWRuZXNkYXksIEF1Z3VzdCAxNiwgMjAyMyA1OjEyIFBNDQo+ID4gKy8qIGNvbW1hbmQgMSAqLw0K
PiA+ICtzdHJ1Y3QgZmxvd19maWx0ZXJfY2FwYWJpbGl0aWVzIHsNCj4gPiArCWxlMTYgc3RhcnRf
dnFfaW5kZXg7DQo+ID4gKwlsZTE2IG51bV9mbG93X2ZpbHRlcl92cXM7DQo+ID4gKwlsZTE2IG1h
eF9mbG93X2dyb3VwczsNCj4gPiArCWxlMTYgbWF4X2dyb3VwX3ByaW9yaXRpZXM7IC8qIG1heCBw
cmlvcml0aWVzIG9mIHRoZSBncm91cCAqLw0KPiA+ICsJbGUzMiBtYXhfZmxvd19maWx0ZXJzX3Bl
cl9ncm91cDsNCj4gPiArCWxlMzIgbWF4X2Zsb3dfZmlsdGVyczsgLyogbWF4IGZsb3dfaWQgaW4g
YWRkL2RlbA0KPiA+ICsJCQkJKiBpcyBlcXVhbCA9IG1heF9mbG93X2ZpbHRlcnMgLSAxLg0KPiA+
ICsJCQkJKi8NCj4gPiArCXU4IG1heF9wcmlvcml0aWVzX3Blcl9ncm91cDsNCj4gDQo+ICsgdTgg
cGFkZGluZ1szXTsNCj4NCkFjay4NCg0KPiA+ICtzdHJ1Y3QgdmlydGlvX25ldF9yZmZfZ3JvdXBf
YWRkIHsNCj4gPiArCWxlMTYgcHJpb3JpdHk7DQo+IA0KPiBQbGVhc2UgZXhwbGljaXRseSBleHBs
YWluIHRoZSByZWxhdGlvbnNoaXAgYmV0d2VlbiB0aGUgbnVtYmVyIGFuZCB0aGUgcHJpb3JpdHks
DQo+IGZvciBleGFtcGxlLCB0aGUgc21hbGxlciB0aGUgbnVtYmVyLCB0aGUgaGlnaGVyIHRoZSBw
cmlvcml0eSA6KQ0KPg0KUmlnaHQuIFdpbGwgZG8uDQpJIHdhcyB0aGlua2luZyBvZiBoaWdoZXIg
dGhlIHZhbHVlIGhpZ2hlciB0aGUgcHJpb3JpdHksIHNvIHRoYXQgb25lIGRvZXNudCBuZWVkIHRv
IGludmVydCB0aGlzIGluIGJyYWluIGV2ZXJ5IHRpbWUgc2VlaW5nIHRoZSBwcmlvcml0eSBmaWVs
ZC4gOikNCiANCj4gPiArCWxlMTYgZ3JvdXBfaWQ7DQo+ID4gK307DQo+ID4gKw0KPiA+ICsNCj4g
PiArc3RydWN0IHZpcnRpb19uZXRfcmZmX2dyb3VwX2RlbGV0ZSB7DQo+ID4gKwlsZTE2IGdyb3Vw
X2lkOw0KPiA+ICsNCj4gPiArYGBgDQo+ID4gKw0KPiA+ICszLiBGbG93IGZpbHRlciBlbnRyeSBh
ZGQvbW9kaWZ5LCBkZWxldGUgb3ZlciBmbG93IHZxOg0KPiA+ICsNCj4gPiArYGBgDQo+ID4gK3N0
cnVjdCB2aXJ0aW9fbmV0X3JmZl9hZGRfbW9kaWZ5IHsNCj4gPiArCXU4IGZsb3dfb3A7DQo+ID4g
Kwl1OCBwYWRkaW5nOw0KPiANCj4gcy9wYWRkaW5nL3ByaW9yaXR5DQo+IA0KQWNrLg0KDQo+IEVh
Y2ggcnVsZSBuZWVkcyBhIHByaW9yaXR5Lg0KPiANCj4gPiArCXUxNiBncm91cF9pZDsNCj4gPiAr
CWxlMzIgZmxvd19pZDsNCj4gPiArCXN0cnVjdCBtYXRjaF9jcml0ZXJpYSBtYzsNCj4gPiArCXN0
cnVjdCBkZXN0aW5hdGlvbiBkZXN0Ow0KPiA+ICsJc3RydWN0IGFjdGlvbiBhY3Rpb247DQo+ID4g
Kw0KPiA+ICsJc3RydWN0IG1hdGNoX2NyaXRlcmlhIG1hc2s7CS8qIG9wdGlvbmFsICovDQo+ID4g
K307DQo+ID4gKw0KPiA+ICtzdHJ1Y3QgdmlydGlvX25ldF9yZmZfZGVsZXRlIHsNCj4gPiArCXU4
IGZsb3dfb3A7DQo+ID4gKwl1OCBwYWRkaW5nWzNdOw0KPiA+ICsJbGUzMiBmbG93X2lkOw0KPiA+
ICt9Ow0KPiA+ICsNCj4gPiArYGBgDQo+ID4gKw0KPiA+ICs0LiBGbG93IGZpbHRlciBjb21tYW5k
cyBvdmVyIGN2cToNCj4gPiArDQo+ID4gK2BgYA0KPiA+ICsNCj4gPiArc3RydWN0IHZpcnRpb19u
ZXRfcmZmX2NtZCB7DQo+ID4gKwl1OCBjbGFzczsgLyogUkZGIGNsYXNzICovDQo+ID4gKwl1OCBj
b21tYW5kczsgLyogUkZGIGNtZCA9IEEgKi8NCj4gPiArCXU4IGNvbW1hbmQtc3BlY2lmaWMtZGF0
YVtdOyAvKiBjb250YWlucyBzdHJ1Y3QNCj4gdmlydGlvX25ldF9yZmZfYWRkX21vZGlmeSBvcg0K
PiA+ICsJCQkJICAgICAqIHN0cnVjdCB2aXJ0aW9fbmV0X3JmZl9kZWxldGUNCj4gDQo+IEZvciBm
bG93IHZxLCB3ZSBubyBsb25nZXIgZGlzdGluZ3Vpc2ggb3BlcmF0aW9ucyBieSBjb21tYW5kLCBi
dXQgYnkgZmxvd19vcC4NCj4gQnV0IGZvciBjdHJscSwgdGhpcyBmaWVsZCB3aWxsIGJlIGNhcnJp
ZWQuIFdlIHNob3VsZCBtYWtlIGl0IGNsZWFyIHRoYXQgd2hlbiBjdHJscSBpcw0KPiBkZWxpdmVy
ZWQgYmFzZWQgb24gY21kLCB0aGUgZmxvd19vcCBmaWVsZCBpcyBpZ25vcmVkLg0KPg0KU2luY2Ug
Y3ZxIGlzIG9ubHkgdGhlIGNvbW11bmljYXRpb24gbWVkaXVtIGZvciBkZWxpdmVyaW5nIG9mIGNv
bW1hbmQsIGl0IGlzIGJldHRlciB1c2UgdGhlIGZsb3dfb3AgYXMgaXMsIGFuZCBjdnEgY29tbWFu
ZHMgZmllbGQgdG8gYmUgaWdub3JlZC4NClRoaXMgd2F5LCBzb2Z0d2FyZSBsYXllcnMgYXJlIG1v
cmUgb3JnYW5pemVkIGN2cSBvciBmbG93IHZxLg0KDQo=

