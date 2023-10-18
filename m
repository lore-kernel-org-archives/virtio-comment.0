Return-Path: <virtio-comment-return-7780-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CF0CDB47E
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 05:02:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C4858190906
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 05:02:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B19D198688B
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 05:02:28 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A22A49863E0; Wed, 18 Oct 2023 05:02:28 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 92FAB986889
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Oct 2023 05:02:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iTA8qUaFs8K7yM1FeLOJRtlbB31wDGFpvxQSuGyZ9tY72RIO0x5CfkTkPxwYNXwg0ia+d/HrnZcIwaQxMz/KJW9EKa/d6tNobOtmlywzoqS9eCIXRin1ksiKlX47r+/atf/LUOtzuoBoJLvSfGNAIZ3u9dIYbtc60gIP1cZF9BGtjCyIvrF9KzaeDCH1pBW2VOZjSC7+JVWYF8nlJ96mpPRjpBdO7/EM0n7THoWHmgld2y8495+PsVZ+sxBsifCcdVSZw2rs0CxD37KxVc8X6z6eS3Dpux3JArKGRrPJnVhg9JFPEKgzjd+/0KPpNWo4bLs9uK3Ygs/VBVnFX1C4Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z/hjDP7kejUe5o2HRZwAeN1t0SFuaSKc9Y2+NWx3Sro=;
 b=C5KG0d3BuE12hFizmpVk52PEZ163Pn6DMIuQh7LTGK8k0xctAe2miHEtGvZobLXv71283X41zLJ134U4b6g4mRK+BkmU7/oo8LGWge9t5ewmOUqvsIaiMIHV5usDcOaL1+Tz2SJqwP5qToROgRaXDqaqjmW95pPVmsO36vU++bPo4hoNjgdhs6SWXzxLaMbtJONTYC1CSSSpZz+j+FSXYYlV4Nb6CyUkXfaGUoi5fjpPBabHnSdcHLggbS2xAuhDe4vMa71eOx1+GJZ6nSnsg8gtqiT3aZUpuf/WM+4Qf4Id0KzUJvqxxy2uHLGeJLa0EDrf8PdK8BEBabB4Y05abw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, Jason Wang <jasowang@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration
Thread-Index:
 AQHZ+dpHSUrTyyDEA0quapQP8C0hdbA/xRkAgAF/hoCAACxh4IABSWcAgAANqrCAAZnYAIAACyKAgAGFBICAAACFkIAAEwWAgAAD8yCAAXZ1gIAAIYLAgASWeYCAAtRh8A==
Date: Wed, 18 Oct 2023 05:02:25 +0000
Message-ID:
 <PH0PR12MB548119E2C2EDB212B56E9FACDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231008112555.473895-1-parav@nvidia.com>
 <20231008112555.473895-4-parav@nvidia.com>
 <20231008073912-mutt-send-email-mst@kernel.org>
 <2fa89e37-a097-d785-e1ee-cda151b0d872@intel.com>
 <DM8PR12MB548001B88B5FA72B403A2AC9DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <85c59856-b68e-940c-08ed-a14e5a02554d@intel.com>
 <PH0PR12MB548135EDA034FDF7AE77C5FDDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <cbf6b0b4-c49f-6809-cac8-2d8336a8cc76@intel.com>
 <PH0PR12MB5481A03DDF43FCBD4184693FDCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <e2696020-8444-0ff3-a774-0b41151a18fb@intel.com>
 <PH0PR12MB548184740ED3C1011C2A85DEDCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <6fc4af28-67d9-781b-a243-a6c2ebf0244c@intel.com>
 <PH0PR12MB548125EFC96DE6640F9F4A34DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <db0719f9-7dc2-4a96-b10b-ecc3dac1a82b@intel.com>
 <PH0PR12MB548139B50AD2D1B86AC9A127DCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f7083379-e76c-42f4-8355-ea4ae28eb52c@intel.com>
In-Reply-To: <f7083379-e76c-42f4-8355-ea4ae28eb52c@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|BY5PR12MB4178:EE_
x-ms-office365-filtering-correlation-id: 692354fc-60e5-4a36-5db8-08dbcf976bd5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 T2d3owmQiap1biaQyrGClJY97PpHItsheiP2y695qn9FbceRjFxjkVr+iAzaVtGvTAeDEJGdE3vbJIqP9hCr3U20jg0Z2WQ0dTCfvTPxImXvQcgx+wcaAoxETEBIbZCg745NlTOA0sqoIwZASXg1NmXIaid+q7C5VSYnNFzZuZfXqBAg5oIQxsMoa/gXCQoIsnJ7JQuskA8fRsw+Yrd9T4KVrAhY3ZjfnfftIKJnT0hRxQIKxTbvzAX+mvMqtV5dW6L/u1GixiFC2YfGf7ziDtYniHO3MpsfbxchsqUOt8qJIvaXlNnZNxByMKj8KucVYRZAseSgfmGqVL/XrJOZmzXwT9X7s2qsFYx+bazKk1kY0yQwGl8L5uSXCKE1MUWjwz7247RZv4xDK2jU77CA/j/GRJQtaV75/gDILrQQe74zfMnMxYUkBOKTf5opcGVmMlx1cCJzdKMuHvvL32PxQfOEfJ1TwV50XL+QdcFtodfSkTp/PfW5bLiKwg+G8uAc80fDHdv/uZgChi0eH1N8z2O/0XhkhGUi79Lyd0NNdp0XsFq3Cc9YIXx8equaaXt9M4GlnzU+3UnzhCVVg7ZB5Wawjy7ZJ8gcNDCP4crweFuB7vbIIPTuzXj4F3uTQ4UkcmCTDC5OpmVYMZvoEDDwDzVCYRx1GLAP9SpAsyA8F2Gmrfbw7gSDFQl37dUV1r8pKMqHMH78Jf0nXoTBTI5e1w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(136003)(396003)(376002)(366004)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(76116006)(6506007)(7696005)(55016003)(107886003)(9686003)(53546011)(478600001)(83380400001)(71200400001)(2906002)(8936002)(41300700001)(66476007)(66556008)(66946007)(54906003)(64756008)(110136005)(52536014)(66446008)(26005)(4326008)(8676002)(5660300002)(966005)(38070700005)(38100700002)(316002)(122000001)(33656002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TFVsVVBpSzVISEhCaHFIT280YkhXWmJ1ZVRXcUJUOU81N1BrZUIwTFBxeStG?=
 =?utf-8?B?K01rNzM5cW5aVWIwcWI3MW50RTlRcWdXWTNJdUxHMjdoeFZXaHBTQWhtamwv?=
 =?utf-8?B?MGZraDZGZ1A1akQ1b3RPRWxob1EyWFlRb0tTaWFIb2w3MGYwOHpTeGgrczBj?=
 =?utf-8?B?c05GeHhkaHRQalJycEMvQkNzbUxOR0t6RGZSYWpOTzdlRzRKbk0xQ0p6amdw?=
 =?utf-8?B?Q2MxbTZ2OWRKaXJZZEdXYzZ3VEFwdlFiZEY2Z0wzTGZWME1GZXlsQ3RZemti?=
 =?utf-8?B?OVJiOFYxb296WWJKR3ZIVjJQQ1hVZzFzRmlIVkRkY2Fadmg3UTl1VEwxck5q?=
 =?utf-8?B?amxSS1Y0RlZYRU9DTEFYUFc0T1lvSWpJTndEeHRzNTlUR1Z1V2ttdy9SK1Zy?=
 =?utf-8?B?N1FCcWtkQUNmWGw1TU80dm9WUjVRdnJDekQvelZUWlBJWkVPbU9hRzM1M3NN?=
 =?utf-8?B?cFRjdWQ2ejRDZnFoNHU0NWtOc21BWDBpWFhHUlNHRkJkYmpkN29scnBwSS9I?=
 =?utf-8?B?THBFd2g3azdHZzNabmIxZjNrL1FBaUVLcUxsWDNHZmdLU2RmK2JWVHZ3TGJq?=
 =?utf-8?B?V2JyODdEcXhMMy9NR0s4WTY5ZExpRmcvTG96ZVljZG8vdnNDSHR4SkxWbzZs?=
 =?utf-8?B?R0QzNVg5bExvRlpvbmRMU09SbzZ3L3Jpa1BuSVN2eDloR3dwVC9Vd3kydm1L?=
 =?utf-8?B?cnVaUHBHRzJvd2QyemR2ZWtVcXY1UzM0UFdkcVNOYlhVaGNpTkNxSFBEdFp4?=
 =?utf-8?B?cCtOV25UbXA3QURSQ09Qb2IxeXdTeHY1NHY1TUgwQUkzYkdRT2hSUlc4eGpm?=
 =?utf-8?B?ZjNnZ2JncDFSUEpKcExrOTV6SVpzQlhzRHRmQzRMbDBDOGk1eU1Fa01SMW0r?=
 =?utf-8?B?c3RpdmFwYXY2b201cEs5WFR5UDJBVXhzU01MM2tkV2pzNEhFcXVicE9oalcz?=
 =?utf-8?B?M01uTFpQRVVIOWdlZUpkaGVxZFVoYTY2R3ZCTVhMdlN3MnhmNkdza2NuTVZz?=
 =?utf-8?B?dEc4WVphTnFabzFtdkp4dk54RllucUdNR3VPeWF4L1RxVmtUSVdoaEU5cEZz?=
 =?utf-8?B?c2ZwYXlaUkdqRFJWUUhyWTVXN1RsazVUeUxhaVhKa1BzdmJZODBpS09DNWlk?=
 =?utf-8?B?NHc3WkJ5U1ZrUmxXN3BHaVBocXBzaG9CL2RFeGtidUROMjl6VTBuTERIOFNi?=
 =?utf-8?B?aS9hb2hEMW40cFhIR0dzTGtCZmIxWFNoaHBPNVJRdUZhVXNST1JWd3N5ekxl?=
 =?utf-8?B?VHc1dGtreHlocWxuRW1xaitEaFpmMkVQQ2VaamE1dHVBZ3NpcVRTZlNITnJW?=
 =?utf-8?B?NWVIdkwyUXdvVVgwWU1zR1c4NWcrMlFsUW1vMkJjVjBTU20rMzlnVGsvbzM4?=
 =?utf-8?B?L1JLemE3WnRtWi9ZT2xaK0cwSUdsTjhoSFRJYkNnZnNwazNlaS9vT3ZoUy9Z?=
 =?utf-8?B?UFREd1BkQUJmbE1YaW9DVnp6a3BSblRFVXlGd20vYkZvVC8vMUdKWnRocGF3?=
 =?utf-8?B?Rm5TUVNNb0NOK3ZRcHlGaHNFY05mcjg3blNXRTl3alhsek9OUk5PMVhRSGVx?=
 =?utf-8?B?TnVSQk5JeXpMYkhBZUhaTHJMUUNqdXp6NXdqS2dpVzA2MTUxOElFK0RqQU5L?=
 =?utf-8?B?cE01UTJyZ0ZkemdZYXBoVVRZNDF6eVgxY1hlN1pWUXpVbTZKUWN3WGtXSjNT?=
 =?utf-8?B?L0hiOWYzMksrM3JUc2wwTEpZcFlCSkVmTGo0T081YlRGZHErblkvNzFSbFJh?=
 =?utf-8?B?YXg1d3krMGNNWk9OVEo5RFBHNnpNSWRuUnp0NVV6S2RKdFh6OENya3lBZlJl?=
 =?utf-8?B?UlNCQ3p1cjlFL2c2NUpCZFNrTXcrUXF1RnpOOSt5L0V5aHhvTTFuMVB3N0Rj?=
 =?utf-8?B?WTNGQWRVeWhzMEEzK2FwTlNEcDJLUnIwd1pnOEFrd2FxZm5IRGZhV3YydFR4?=
 =?utf-8?B?Rys5UXFqbXB1Q01hRURFMVZuc1RsOFl4MDhQYUdtaUVGOEVvOTQrOEswTGx1?=
 =?utf-8?B?T21ndEpobERra0VMY3JxZlMrTEgyMkxNdGhkY3FvdWNldzRDSnNmYVNZb29X?=
 =?utf-8?B?bWdyRGxPbks4OWdxWSs4MU84ZkliOGNCOTNWVmZDZGRCb2h3SUJwbWQ4cnht?=
 =?utf-8?Q?vzYY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 692354fc-60e5-4a36-5db8-08dbcf976bd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2023 05:02:25.8612
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RF9fl37Zt0OkBA8RrQBW5rk8h+UWcug86Qkzu0xBlnL4ePJSoDs7lLTNdvDQxcuG0XJgHX0T1mdocaTj6hB6Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4178
Subject: RE: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

DQoNCj4gRnJvbTogdmlydGlvLWNvbW1lbnRAbGlzdHMub2FzaXMtb3Blbi5vcmcgPHZpcnRpby1j
b21tZW50QGxpc3RzLm9hc2lzLQ0KPiBvcGVuLm9yZz4gT24gQmVoYWxmIE9mIFpodSwgTGluZ3No
YW4NCj4gU2VudDogTW9uZGF5LCBPY3RvYmVyIDE2LCAyMDIzIDM6MTggUE0NCj4gDQo+IE9uIDEw
LzEzLzIwMjMgNzo1NCBQTSwgUGFyYXYgUGFuZGl0IHdyb3RlOg0KPiA+PiBGcm9tOiBaaHUsIExp
bmdzaGFuIDxsaW5nc2hhbi56aHVAaW50ZWwuY29tPg0KPiA+PiBTZW50OiBGcmlkYXksIE9jdG9i
ZXIgMTMsIDIwMjMgMzoxNCBQTQ0KPiA+Pj4+Pj4gSG93IGRvIHlvdSB0cmFuc2ZlciB0aGUgb3du
ZXJzaGlwPw0KPiA+Pj4+PiBBbiBhZGRpdGlvbmFsIG93bmVyc2hpcCBkZWxldGdhdGlvbiBieSBh
IG5ldyBhZG1pbiBjb21tYW5kLg0KPiA+Pj4+IGlmIHlvdSB0aGluayB0aGlzIGNhbiB3b3JrLCBk
byB5b3Ugd2FudCB0byBjb29rIGEgcGF0Y2ggdG8NCj4gPj4+PiBpbXBsZW1lbnQgdGhpcyBiZWZv
cmUgeW91IHN1Ym1pdHRpbmcgdGhpcyBsaXZlIG1pZ3JhdGlvbiBzZXJpZXM/DQo+ID4+PiBJIGFu
c3dlcmVkIHRoaXMgYWxyZWFkeSBhYm92ZS4NCj4gPj4gdGFsayBpcyBjaGVhcCwgc2hvdyBtZSB5
b3VyIHBhdGNoDQo+ID4gSHVoLiBXZSBwcmVzZW50ZWQgdGhlIGluZnJhc3RydWN0dXJlIHRoYXQg
bWlncmF0ZXMsIDMwKyBkZXZpY2UgdHlwZXMsDQo+IGNvdmVyaW5nIGRldmljZSBjb250ZXh0IGlk
ZWFzIGZyb20gT3JhY2xlLg0KPiA+IENvdmVyaW5nIFAyUCwgc3VwcG9ydGluZyBkZXZpY2VfcmVz
ZXQsIEZMUiwgZGlydHkgcGFnZSB0cmFja2luZy4NCj4gPg0KPiA+IFBsZWFzZSBoYXZlIHNvbWUg
cmVzcGVjdCBmb3Igb3RoZXIgbWVtYmVycyB3aG8gY292ZXJlZCBtb3JlIGdyb3VuZCB0aGFuDQo+
IHlvdXIgc2VyaWVzLg0KPiA+DQo+ID4gV2hhdCBtb3JlPyBBcHBseSB0aGUgc2FtZSBuZXN0ZWQg
Y29uY2VwdCBvbiB0aGUgbWVtYmVyIGRldmljZSBhcw0KPiBNaWNoYWVsIHN1Z2dlc3RlZCwgaXQg
aXMgbmVzdGVkIHZpcnR1YWxpemF0aW9uIG1haW50YWluIGV4YWN0IHNhbWUgc2VtYW50aWNzLg0K
PiA+IFNvIGEgVkYgaXMgbWFwcGVkIGFzIFBGIHRvIHRoZSBMMSBndWVzdC4NCj4gPiBMMSBndWVz
dCBjYW4gZW5hYmxlIFNSLUlPViBvbiBpdCwgYW5kIG1hcCBvbmUgVkYgdG8gTDIgZ3Vlc3QuDQo+
ID4NCj4gPiBUaGlzIG5lc3RlZCB3b3JrIGNhbiBiZSBleHRlbmRlZCBpbiBmdXR1cmUsIG9uY2Ug
Zmlyc3QgbGV2ZWwgbmVzdGluZyBpcw0KPiBjb3ZlcmVkLg0KPiA+DQo+ID4+IEFuc3dlciBhbGwg
cXVlc3Rpb25zIGFib3ZlLCBpZiB5b3UgdGhpbmsgYSBtYW5hZ2VtZW50IFZGIGNhbiB3b3JrLA0K
PiA+PiBwbGVhc2Ugc2hvdyBtZSB5b3VyIHBhdGNoLg0KPiA+IFRoZSBpZGVhIGV2b2x2ZXMgZnJv
bSB0ZWNobmljYWwgZGViYXRlIHRoZW4gcG9pbnRpbmcgZmluZ2VycyBsaWtlIHlvdXINCj4gY29t
bWVudC4NCj4gPg0KPiA+IEkgdGhpbmsgYSBwb3NpdGl2ZSBkaXNjdXNzaW9uIHdpdGggTWljaGFl
bCBhbmQgYSBwb2ludGVyIHRvIHRoZSBwYXBlciBmcm9tDQo+IEphc29uIGdhdmUgYSBnb29kIGRp
cmVjdGlvbiBvZiBkb2luZyBfcmlnaHRfIG5lc3RpbmcgdGhhdCBmb2xsb3dzIHR3byBwcmluY2lw
bGVzLg0KPiA+IGEuIGVmZmljaWVuY3kgcHJvcGVydHkNCj4gPiBiLiBlcXVpdmFsZW5jZSBwcm9w
ZXJ0eQ0KPiA+DQo+ID4gKGMuIHJlc291cmNlIGNvbnRyb2wgaXMgbmF0dXJhbCBhbHJlYWR5KQ0K
PiA+DQo+ID4gQm90aCBhcHBseSBhdCBWTU0gYW5kIGF0IFZNIGxldmVsIGVuYWJsaW5nIHJlY3Vy
c2l2ZSB2aXJ0dWFsaXphdGlvbiwgYnkNCj4gaGF2aW5nIFZGIHRoYXQgY2FuIGFjdCBhcyBQRiBp
bnNpZGUgdGhlIGd1ZXN0Lg0KPiA+DQo+ID4gWzFdIGh0dHBzOi8vZGwuYWNtLm9yZy9kb2kvcGRm
LzEwLjExNDUvMzYxMDExLjM2MTA3Mw0KPiBQbGVhc2UganVzdCBzaG93IG1lIHlvdXIgcGF0Y2gg
cmVzb2x2aW5nIHRoZXNlIG9wZW5zLCBob3cgYWJvdXQgc3RhcnQgZnJvbQ0KPiBkZWZpbmluZyB2
aXJpdG8tZnMgZGV2aWNlIGNvbnRleHQgYW5kIHlvdXIgbWFuYWdlbWVudCBWRj8NCkFzIGFuc3dl
cmVkLCBkZXZpY2UgY29udGV4dCBpbmZyYXN0cnVjdHVyZSBpcyBkb25lLCBwZXIgZGV2aWNlIHNw
ZWNpZmljIGRldmljZS1jb250ZXh0IHdpbGwgYmUgZGVmaW5lZCBpbmNyZW1lbnRhbGx5Lg0KSSB3
aWxsIG5vdCBiZSBpbmNsdWRpbmcgdmlydGlvLWZzIGluIHRoaXMgc2VyaWVzLiBJdCB3aWxsIGJl
IGRvbmUgaW5jcmVtZW50YWxseSBpbiBmdXR1cmUgdXRpbGl6aW5nIHRoZSBpbmZyYXN0cnVjdHVy
ZSBidWlsZCBpbiB0aGlzIHNlcmllcy4NCg==

