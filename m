Return-Path: <virtio-comment-return-8087-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC8C2C4332F
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 07:03:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 178CA2B151
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 07:03:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F23D2986BB6
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 07:03:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DDA43986BB1; Wed,  1 Nov 2023 07:03:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CB2B5986BB2
	for <virtio-comment@lists.oasis-open.org>; Wed,  1 Nov 2023 07:03:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VqmDuVRbezdiB7AltbXZNKi6yHasw5QuRtHtbyEU8XKp9Uwjc6APbdHBtAN7VaNtd3nXpASh3w8qo2ac7nYUncfAKizETGIZwqzxDja2N84FyfczPeCZVf/nATjVEp/cDG2GFQ+N6ebuFSkE8uXK72BOPMV+0a8qNw0Yb9naImwmbJey2nAwAXIQfqV4WQQsDaORQJeyAXOEJx5oDRVfDKFlcxYQIcz0yb3PUBJAJkm5NxXS6JZVgOBZhdoCLEPyjU/H46YQVjfyGp/jHVHn6OXxtIzeecBT5kRInsxJprJl2drEhk/zlc7qIQqBNKXZzcSOzRPtUsSBgAMZ1YN3Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/zoW+DyGXgvUrvVI+iBpYMLQxGvb7K+Qonv158wvUE=;
 b=aTmjx7UDQZ0TQI2otAod/JJvFzT2+TrM6in4NQiHXXdyCVMx/EfjBeeM7mi6YjtjezM+sC+qV/NuXhsayRjDiaLA7OKQrrYjDOfRlyc6wcPcT1LGt642K0MyElhsm+LokiJ0ojRiHDZABEDo3oPVEnpbcTkqqWtPyRY2E/E5O8G42pMOq79BzgfGvevvhE3lgfcRZSn1JiqP4zoj6LZjk1eTGME6KFcJdhkSQY0MiLr2YsuBS+s/FuA9/vabysjMtifTHCg07ulbvDJbw7omlP90Kd+BmemRAW8o+yIhWMaTinMQ6T45gvTSm2m50WV8MFQz0kJoU667KtBvuHagYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "Michael S. Tsirkin"
	<mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration
Thread-Index:
 AQHZ+dpHSUrTyyDEA0quapQP8C0hdbA/xRkAgAF/hoCAACxh4IABSWcAgAANqrCAAZnYAIAACyKAgAGFBICAAACFkIAAEwWAgAAD8yCAAXZ1gIAAIYLAgASWeYCAAtRh8IAAGoeAgAAAUKCAAARLAIAAB5cQgAAXYICAAABqYIABiiSAgAAMdcCAAALCgIAAADWggAABTwCAAAD9AIAAAmrwgAGTbICAADeVYIAEiiUAgAAAXICAAZfSAIAAAE8wgALlIwCAAAFh0IAGFdwAgAAAUgCAAGlTgIAAAOdQgAGLtoCAAAjegIABFlmAgAAs44CAAAKEcIAAD/uAgAAAm4CAAAJmQIAAAjuAgAAAiKA=
Date: Wed, 1 Nov 2023 07:03:31 +0000
Message-ID:
 <PH0PR12MB54810FE590680689D3140911DCA7A@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <PH0PR12MB5481E6F72E2F15AC88E6E24ADCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <09996f68-2831-49b0-a403-1ea061bea6eb@intel.com>
 <PH0PR12MB548147B94D76EF02EF42A9B1DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <341b7a16-6927-412e-8a22-4841cd419314@intel.com>
 <PH0PR12MB54813BF8D0F6282A1932EF99DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <640cc639-6065-4828-ac81-0cc809aff293@intel.com>
 <20231031054617-mutt-send-email-mst@kernel.org>
 <DM8PR12MB54806512D1395AB39C59B821DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231101012540-mutt-send-email-mst@kernel.org>
 <DM8PR12MB54802C006C5ADE546783E610DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231101023257-mutt-send-email-mst@kernel.org>
 <0bc21f96-486d-481f-8676-5144225e43bc@intel.com>
 <PH0PR12MB5481DCAAFA84932C9D826C4ADCA7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <7b130c22-3c07-4f3d-80bc-7ee4fb7dea70@intel.com>
In-Reply-To: <7b130c22-3c07-4f3d-80bc-7ee4fb7dea70@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH2PR12MB5017:EE_
x-ms-office365-filtering-correlation-id: 70dd7492-d5b2-453e-3458-08dbdaa8a82c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 +f2mRWZM2v7RmyloNreru4j+TemQwNoSxSYjy1/lP/37Sv3T6fEaVQuxJdeKXyiAGMIFN3hKu33wBF7T6KGba497YnQiPBpSUz6ikqMGDEAwgy9LAjniPVoHcA32G98wEK1BPR1VdHyAWgecnO/jMuEmO5N8xhwswaQ38zagbfpRhhY1LVzKErx2X2M6oTU3WOWQLy1wW3ArFqEg+FiLTV0ZEh8G9gJSYtkjWX5oiE4E5mOr4PCkteSKDR1bA+ZkfS1Njvo7F8py4yjguwto+BMgh8VFoD0XefqifSb2dKaxEk+0Xh0RWTL1aJZKqM9OJfkyAvp/qOywP74ij+4ax5LHg8lSXi9qhN/tVJGmnZ162BKDiAGe1CMZ0U3jgGdo1pcHPXe1CX951yZZB5L2CaY4ialHY1vkcQOgR3HcJ5lKQC4uG2LOPfEAZ+HtDaVaaNc0oYp45fpPAtt7NNKNkgCtEWl5MIqQ1v/xOtTPWpa3oyKT1NMgWcOLzsLkWGg9ffAFHPEEYZlOEZT/aIUa6hC1ga0w45n0arHTf10L51KnGQ2GfU6VlVtlLUXt+voauW3PcZ19nHTNnOJYdhLbvr/av9nYCduA7DFRvKpMttMNIXxNNMvMNl9yfKbT86Vg
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(396003)(346002)(366004)(376002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(52536014)(5660300002)(66946007)(76116006)(316002)(66446008)(2906002)(66476007)(54906003)(64756008)(66556008)(110136005)(8676002)(55016003)(478600001)(41300700001)(8936002)(4326008)(71200400001)(53546011)(9686003)(7696005)(107886003)(6506007)(26005)(83380400001)(38070700009)(122000001)(86362001)(33656002)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WUU0blkvOXc1NkQwdFVPNmdFTXQ0clp3V0lWd3I2d2lDem5NNWNabVR3UU10?=
 =?utf-8?B?eklnQmtuWWZUVEFpcFE3cFdVOWRIWGQwL2NoUkNxRVBNYm84bVF1Ty9LcUYv?=
 =?utf-8?B?VTE0UU04MWdzWUdzbHM5b0lhVlMzV201b0EybnV4MUN6bEhNQUZ4aWlpS2N4?=
 =?utf-8?B?ZDBDQWQ1U3RTcFJtaHpuQmo2UFZYQ04wdWNzUTBuZW5PQm13N1dVWlV3V1Zn?=
 =?utf-8?B?L1kreWptUENpQjhpVDJsOGVDbk9zUFd6MXJYSDRlaFFFb3hpZW5Sa0hpVHV1?=
 =?utf-8?B?WTVlREp6SFpmZTdMb2ZoMy9IVmVvTURhWHhsVXpPcHg5Zm8zbGJpODB3K2k5?=
 =?utf-8?B?Q3VPZDFTNDlRUUFIUjhTcUY2MUhMMG4rTkZiclhoOGtSbSttREs2OXpkeWVX?=
 =?utf-8?B?NVh6bmJFRDBMQTZVSFcrU0Y2ZHBiR0VQcEF6R3RtVVVqajNOOUNRczlFMXk2?=
 =?utf-8?B?amROVmZxbzcvbmZyRm53VGZhNW1SVkdDdjRPcnEzV0wwS215enViMXNDSHVP?=
 =?utf-8?B?YThGRitwYTdiWERuSVpuYTZnZFpIVnQwanJVeWw0MTdHeCtmZ2drbU9WZ0pT?=
 =?utf-8?B?aEVvY1NCL2lSR3JmamM0eGJwM2h0TkZxcnYxZDE1cUdJNnpFU1UvOWZwcXFD?=
 =?utf-8?B?SXBBanVrRzRyQ1NtUG0xNS9VSTNXcDVRaGNnTjM0U2tQdk1Td3RONkZaRzg0?=
 =?utf-8?B?enJyL012U3NNYTQxOSsyczd2TjhGeitGWlYzaUJKVUY1NGdnWG5UV3k1T2to?=
 =?utf-8?B?cUFvUC85eVFnZHhHTEJVdjFoZmRvbjNDUjBpNWRoVTcyR3FrVjQ4UnNvSTlR?=
 =?utf-8?B?UGNJVVQ3SkFrUGxibVVQTGRjTkFMMnphOFN6RFdwblJBbWdQaHRraDlVWmxn?=
 =?utf-8?B?Nyt0VE1EYnlBeXNINThBZGVnTjFFd2RtRHlmMW4yb2JQc2MvNjJwcS9PUkVw?=
 =?utf-8?B?ZDhDbXZJWUJxVEhGTmpkVW90eFRJWHFVS1JFMDB4Wnl2UlpJZ2ZGaXN0QVkr?=
 =?utf-8?B?R1JCTUVtWXZRVi9WSUNaZ3JSMVczb1NhNFVQeDM5NDdnTXMydmRhT3VML2pj?=
 =?utf-8?B?WkFmZGNRMFBBcXJCVDZzVHM3RkdTTUtHODY5Q2VBdE9FcFN0b3V1ekxRSXJp?=
 =?utf-8?B?UmY0QmdCTjdvTEJUMXhBUnRtS3RTV1dDK3ZpYWpxVmJwREhnZjZPd0lmT2Vs?=
 =?utf-8?B?TW1ld1NPOVoxQ1p6bTQrem5vZEZVckQ3MlRLTnFvNEptUlZNMlNIdlU4OExz?=
 =?utf-8?B?OXFRNzBOSnh5aWkxQ21ycE9xTHhCMi95YzNUaTFBdW1weXJDWVZRT3JmUzhX?=
 =?utf-8?B?clhxMmkyUStGQWhINEM1SmVlU1d4eWI4Wi80ZFBBdy9NQkxVQ1RUTDF4eW5l?=
 =?utf-8?B?dlJHc3luczBNbjZZcUZVenN1M0x1d29XVW9EcHdsa3BOZjJidllHTG1uNHZj?=
 =?utf-8?B?a0EyanlkWVBGdFJqaExLbnhMa0k0d2cvNU9lZWIxN3NHaWY1Rlp6VFM1ZXJ1?=
 =?utf-8?B?a3hxbG5PQ0hlU2U4Mlp5c2l0U05hN3JSTEx5anF2RHFDTHhYTWxmWEJWSHRo?=
 =?utf-8?B?YkVIMExTVWFEYnNWUHp1MVcyVVdZQWhXT2NneG1pMjMxRkN5bEpjTmF5QllR?=
 =?utf-8?B?K2duZERpdU5tQWVHNHBRR3ZOWklSMTM2TTFra0JpNHR2Mk0rbjRRU1ZvQVFp?=
 =?utf-8?B?VmU1U3FyNkt5OUhSWVJKTWVzVkxKYnFnQUdTOG10R1poWGs2TlRiZDFUcW5U?=
 =?utf-8?B?VjZhUTNVY0lBOUlCR3I4KzlaRThKR2g2M0R5Vit2M1AxbG1WTndvemwvL0lD?=
 =?utf-8?B?Um5FTDREbGJDL2tkMjNjalorWVNqTFpZSHpZVmZsSTJKWGJUclcxbUpNbzNw?=
 =?utf-8?B?Z29RTWhHbGhNVzExYk92VFZmWHdxcU9xKzhhNjB1c3l0VEx3RmIzZFZiMzdl?=
 =?utf-8?B?QXJKZE1RQVhsdHRWN08vU1B3UU55YnFMeUs1TmJtTkZDUXhyR0ZyT1NCd3hk?=
 =?utf-8?B?WllCVFV4OVlOUjJFOW9uZXhXeitkZUJBSWJhTnV6RUVRTFBQNytobk5VY0x4?=
 =?utf-8?B?TUJJbjdUNWw3UlpGeXgwaVptTysvTjVBOURLeFV4Ukx3ZUlXeE1XdlY2QjNE?=
 =?utf-8?Q?m3c4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70dd7492-d5b2-453e-3458-08dbdaa8a82c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2023 07:03:31.3447
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WyK3PM0hxnVH9ADllR29ogxF49qITNO4T/NnEChm806pHlBSSpEJtKYtZ8zYWhRNlGQ9Tu0soGw/b5bl0XL1Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB5017
Subject: RE: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

DQoNCj4gRnJvbTogWmh1LCBMaW5nc2hhbiA8bGluZ3NoYW4uemh1QGludGVsLmNvbT4NCj4gU2Vu
dDogV2VkbmVzZGF5LCBOb3ZlbWJlciAxLCAyMDIzIDEyOjI2IFBNDQo+IA0KPiBPbiAxMS8xLzIw
MjMgMjo1MCBQTSwgUGFyYXYgUGFuZGl0IHdyb3RlOg0KPiA+DQo+ID4+IEZyb206IFpodSwgTGlu
Z3NoYW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+DQo+ID4+IFNlbnQ6IFdlZG5lc2RheSwgTm92
ZW1iZXIgMSwgMjAyMyAxMjowOSBQTQ0KPiA+Pg0KPiA+PiBPbiAxMS8xLzIwMjMgMjozNyBQTSwg
TWljaGFlbCBTLiBUc2lya2luIHdyb3RlOg0KPiA+Pj4gT24gV2VkLCBOb3YgMDEsIDIwMjMgYXQg
MDU6NDI6NTZBTSArMDAwMCwgUGFyYXYgUGFuZGl0IHdyb3RlOg0KPiA+Pj4+PiBGcm9tOiBNaWNo
YWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPg0KPiA+Pj4+PiBTZW50OiBXZWRuZXNkYXks
IE5vdmVtYmVyIDEsIDIwMjMgMTE6MDEgQU0NCj4gPj4+Pj4NCj4gPj4+Pj4gT24gV2VkLCBOb3Yg
MDEsIDIwMjMgYXQgMDI6NTQ6NDdBTSArMDAwMCwgUGFyYXYgUGFuZGl0IHdyb3RlOg0KPiA+Pj4+
Pj4+IEZyb206IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+DQo+ID4+Pj4+Pj4g
U2VudDogVHVlc2RheSwgT2N0b2JlciAzMSwgMjAyMyAzOjQ0IFBNDQo+ID4+Pj4+Pj4NCj4gPj4+
Pj4+PiBPbiBUdWUsIE9jdCAzMSwgMjAyMyBhdCAwNTo0MjoyOVBNICswODAwLCBaaHUsIExpbmdz
aGFuIHdyb3RlOg0KPiA+Pj4+Pj4+Pj4gWW91ciBhbnN3ZXIgaXMgbm90IHJlbGV2YW50IHRvIHRo
aXMgZGlzY3Vzc2lvbiBhdCBhbGwuDQo+ID4+Pj4+Pj4+PiBXaHk/DQo+ID4+Pj4+Pj4+PiBCZWNh
dXNlIHdlIHdlcmUgZGlzY3Vzc2luZyB0aGUgc2NoZW1lcyB3aGVyZSByZWdpc3RlcnMgYXJlIG5v
dA0KPiB1c2VkLg0KPiA+Pj4+Pj4+Pj4gT25lIGV4YW1wbGUgb2YgdGhhdCB3YXMgSU1TLiBJdCBk
b2VzIG5vdCBtYXR0ZXIgTVNJIG9yIE1TSVguDQo+ID4+Pj4+Pj4+PiBBcyBleHBsYWluZWQgaW4g
SW50ZWwncyBjb21taXQgbWVzc2FnZSwgdGhlIGtleSB0byBmb2N1cyBmb3INCj4gPj4+Pj4+Pj4+
IElNUyBpcyAicXVldWUNCj4gPj4+Pj4+PiBtZW1vcnkiIG5vdCBzb21lIGh3IHJlZ2lzdGVyIGxp
a2UgTVNJIG9yIE1TSS1YLg0KPiA+Pj4+Pj4+PiB5b3Uga25vdyB0aGUgZGV2aWNlIGFsd2F5cyBu
ZWVkIHRvIGtub3cgYSBhZGRyZXNzIGFuZCB0aGUgZGF0YQ0KPiA+Pj4+Pj4+PiB0byBzZW5kIGEg
TVNJLCByaWdodD8NCj4gPj4+Pj4+PiBTbyBpZiB2aXJ0aW8gaXMgdG8gdXNlIElNUyB0aGVuIHdl
J2xsIG5lZWQgdG8gYWRkIGludGVyZmFjZXMgdG8NCj4gPj4+Pj4+PiBwcm9ncmFtIElNUywgSSB0
aGluay4gQXMgcGFydCBvZiB0aGF0IHBhdGNoIC0gaXQncyByZWFzb25hYmxlIHRvDQo+ID4+Pj4+
Pj4gYXNzdW1lIC0gd2Ugd2lsbCBhbHNvIG5lZWQgdG8gYWRkIGEgd2F5IHRvIHJldHJpZXZlIElN
UyBzbyBpdA0KPiA+Pj4+Pj4+IGNhbiBiZQ0KPiA+Pj4+PiBtaWdyYXRlZC4NCj4gPj4+Pj4+PiBI
b3dldmVyLCB3aGF0IHRoaXMgZXhhbXBsZSBkZW1vbnN0cmF0ZXMgaXMgdGhhdCB0aGUgYXBwcm9h
Y2gNCj4gPj4+Pj4+PiB0YWtlbiBieSB0aGlzIHByb3Bvc2FsIHRvIG1pZ3JhdGUgY29udHJvbCBw
YXRoIHN0cnVjdHVyZXMgLQ0KPiA+Pj4+Pj4+IG5hbWVseSwgYnkgZGVmaW5pbmcgYSBzdHJ1Y3R1
cmUgdXNlZCBqdXN0IGZvciBtaWdyYXRpb24gLSBtZWFucw0KPiA+Pj4+Pj4+IHRoYXQgd2Ugd2ls
bCBuZWVkIHRvIGNvbWUgdXAgd2l0aCBhIG1pZ3JhdGlvbiBpbnRlcmZhY2UgZWFjaCB0aW1lLg0K
PiA+Pj4+Pj4+IEFuZCB0aGF0IGlzIHVuZm9ydHVuYXRlLg0KPiA+Pj4+Pj4+DQo+ID4+Pj4+PiBX
aGVuIHRoZSBkZXZpY2Ugc3VwcG9ydHMgYSBuZXcgZmVhdHVyZSBpdCBoYXMgc3VwcG9ydGVkIG5l
dw0KPiA+PiBmdW5jdGlvbmFsaXR5Lg0KPiA+Pj4+Pj4gSGVuY2UgdGhlIGxpdmUgbWlncmF0aW9u
IHNpZGUgYWxzbyBnb3QgdXBkYXRlZC4NCj4gPj4+Pj4+IEhvd2V2ZXIsIHRoZSBsaXZlIG1pZ3Jh
dGlvbiBkcml2ZXIgZG9lcyBub3QgaGF2ZSB0byB1bmRlcnN0YW5kDQo+ID4+Pj4+PiB3aGF0IGlz
IGluc2lkZQ0KPiA+Pj4+PiB0aGUgY29udHJvbCBwYXRoIHN0cnVjdHVyZXMuDQo+ID4+Pj4+PiBJ
dCBpcyBqdXN0IGJ5dGUgc3RyZWFtLg0KPiA+Pj4+Pj4gT25seSBpZiB0aGUgaHlwZXJ2aXNvciBs
aXZlIG1pZ3JhdGlvbiBkcml2ZSBpbnZvbHZlZCBpbg0KPiA+Pj4+Pj4gZW11bGF0aW5nLCBpdCB3
aWxsIHBhcnNlDQo+ID4+Pj4+IGFuZCB0aGF0IGlzIGZpbmUgYXMgbGlrZSBvdGhlciBjb250cm9s
IHN0cnVjdHVyZXMuDQo+ID4+Pj4+DQo+ID4+Pj4+IFRoZSBwb2ludCBpcyB0aGF0IGFueSBuZXcg
ZmllbGQgbmVlZHMgdG8gYmUgYWRkZWQgaW4gdHdvIHBsYWNlcw0KPiA+Pj4+PiBub3cgYW5kIHRo
YXQgaXMgbm90IGdyZWF0IGF0IGFsbC4NCj4gPj4+Pj4NCj4gPj4+PiBNb3N0IGNvbnRyb2wgc3Ry
dWN0cyBhcmUgd2VsbCBkZWZpbmVkLiBTbyBvbmx5IGl0cyB0eXBlIGZpZWxkIGlzDQo+ID4+Pj4g
YWRkZWQgdG8NCj4gPj4gbWlncmF0aW5nIGRyaXZlciBzaWRlLg0KPiA+Pj4+IFRoaXMgaXMgdmVy
eSBsb3cgb3ZlcmhlYWQgZmllbGQgYW5kIGhhbmRsZWQgaW4gZ2VuZXJpYyB3YXkgZm9yIGFsbA0K
PiA+Pj4+IGRldmljZQ0KPiA+PiB0eXBlcyBhbmQgZm9yIGFsbCBjb21tb24gdHlwZXMuDQo+ID4+
PiBXZWlyZCwgbm90IHdoYXQgSSBzZWUuICBFLmcuIHlvdSBzZWVtIHRvIGhhdmUgYSBzdHJ1Y3R1
cmUNCj4gPj4+IGR1cGxpY2F0aW5nIHF1ZXVlIGZpZWxkcy4gRWFjaCBuZXcgZmllbGQgd2lsbCBo
YXZlIHRvIGJlIGFkZGVkIHRoZXJlDQo+ID4+PiBpbiBhZGRpdGlvbiB0byB0aGUgdHJhbnNwb3J0
Lg0KPiA+Pj4NCj4gPj4+Pj4gV2UgbmVlZCBhIHN0cm9uZ2VyIGNvbXBhdGlibGl0eSBzdG9yeSBo
ZXJlIEkgdGhpbmsuDQo+ID4+Pj4+DQo+ID4+Pj4+IE9uZSB3YXkgdG8gc2hvdyBob3cgaXQncyBk
ZXNpZ25lZCB0byB3b3JrIHdvdWxkIGJlIHRvIHNwbGl0IHRoZQ0KPiA+Pj4+PiBwYXRjaGVzLiBG
b3IgZXhhbXBsZSwgYWRkIHF1ZXVlIG5vdGlmeSBkYXRhIGFuZCBxdWV1ZSByZXNldCBzZXBhcmF0
ZWx5Lg0KPiA+Pj4+IEkgZGlkbid0IGZvbGxvdyB0aGUgc3VnZ2VzdGlvbi4gQ2FuIHlvdSBleHBs
YWluIHNwbGl0dGluZyBwYXRjaGVzDQo+ID4+Pj4gYW5kIGl0cw0KPiA+PiByZWxhdGlvbiB0byB0
aGUgc3RydWN0dXJlPw0KPiA+Pj4+PiBBbm90aGVyIGlzIHRvIGFkZCBNU0lYIHRhYmxlIG1pZ3Jh
dGlvbiBvcHRpb24gZm9yIHdoZW4gTVNJWCB0YWJsZQ0KPiA+Pj4+PiBpcyBwYXNzZWQgdGhyb3Vn
aCB0byBndWVzdC4NCj4gPj4+PiBZZXMsIHRoaXMgd2lsbCBiZSBhZGRlZCBpbiBmdXR1cmUgd2hl
biB0aGVyZSBpcyBhY3R1YWwgaHlwZXJ2aXNvciBmb3IgaXQuDQo+ID4+PiBZb3UgYXJlIHR5aW5n
IHRoZSBhcmNoaXRlY3R1cmUgdG8gYW4gZXh0cmVtZWx5IGltcGxlbWVudGF0aW9uDQo+ID4+PiBz
cGVjaWZpYyBkZXRhaWwuDQo+ID4+Pg0KPiA+Pj4gSHlwZXJ2aXNvcnMgKmFscmVhZHkqIGhhdmUg
bWlncmF0ZSB0aGUgTVNJWCB0YWJsZS4gSnVzdCBpbiBhDQo+ID4+PiBoeXBlcnZpc29yIHNwZWNp
ZmljIHdheS4gcXVldWUgdmVjdG9yIGlzIGFuIGluZGV4IGludG8gdGhpcyB0YWJsZS4NCj4gPj4+
IFNvIHRoZSBpbmRleCBpcyBtaWdyYXRlZCB0aHJvdWdoIHRoZSBkZXZpY2UgYnV0IHRoZSB0YWJs
ZSBpdHNlbGYgaGFzDQo+ID4+PiB0byBiZSB0cmFwcGVkIGFuZCBlbXVsYXRlZCBieSBoeXBlcnZp
c29yPyBHaXZlIG1lIGEgYnJlYWsuDQo+ID4+IEkgYWdyZWUsIHRoZSBNU0kgdGFibGUgY291bGQg
YmUgUi9XIGFueXdheS4NCj4gPiBQbGVhc2UgZXhwbGFpbiB0aGUgbW90aXZhdGlvbiwgd2h5IGl0
IGNhbm5vdCBiZSBhZGRlZCB3aGVuIHRoZXJlIGlzIF9yZWFsXyBzdw0KPiB3aGljaCB3aWxsIHVz
ZSBpdD8NCj4gPiBJIGFza2VkIHRvIGFkZCBpdCB3aGVuIGl0IGlzIG5lZWRlZC4NCj4gPiBXaHkg
aXQgaXMgbXVzdCByaWdodCBub3csIGlmIGl0IGlzLg0KPiA+IElmIHRoZXJlIGlzIGFueSBzb2Z0
d2FyZSBsaWtlIHRvIHVzZSBpdCwgcGxlYXNlIGV4cGxhaW4gd2hpY2ggaXMgaXQgYW5kIGhvdyB3
aWxsIGl0DQo+IHVzZSBpdC4NCj4gYXMgTVNUIGhhcyBldmVyIHBvaW50ZWQgb3V0LCBoeXBlcnZp
c29ycyBhbHJlYWR5IGhhdmUgbWlncmF0ZSBNU0kgdGFibGUuDQo+IFNvIEkgc3VnZ2VzdCB5b3Ug
dG8gcmVhZCBRRU1VIGNvZGUgdG8gZmluZCB0aGUgYW5zd2VyLg0KSHVoLCB0aGlzIGlzIG5vdCB0
aGUgYW5zd2VyLg0KDQpNaWNoYWVsIGFza2VkIC0gIiBhZGQgTVNJWCB0YWJsZSBtaWdyYXRpb24g
b3B0aW9uIGZvciB3aGVuIE1TSVggdGFibGUgaXMgcGFzc2VkIHRocm91Z2ggdG8gZ3Vlc3QuIg0K
Q3VycmVudGx5IGl0IGlzIG5vdC4gV2hlbiBpbiBmdXR1cmUgaHlwZXJ2aXNvciBhZGRzIGl0LCBp
dCBjYW4gYmUgYWRkZWQuIFdoYXQgcHJldmVudHMgdGhpcyBhZGRpdGlvbiBpbiBmdXR1cmU/DQoN
CkkgYXNrZWQgdmVyeSBzaW1wbGUgcXVlc3Rpb24gdG8gZXhwbGFpbiB0aGUgdXNlIGNhc2UgYW5k
IGh5cGVydmlzb3Igd2hvIHdhbnRzIHRvIHRyYW5zZmVyIE1TSVggdGFibGUgYnkgdXNpbmcgZGV2
aWNlIGNvbnRleHQ/DQpZb3UgZG9u4oCZdCBhbnN3ZXIgaXQuLi4NCkkgYXNzdW1lIHRoZXJlIGlz
IG5vIHVzZXIgc29mdHdhcmUgb2YgaXQuDQoNCklmIHRoZXJlIGlzIG9uZSwgcGxlYXNlIHNoYXJl
IGFuZCBpdCBzaG91bGQgYmUgYWRkZWQuDQoNCj4gDQo+IFdlIGRvbid0IHdhbnQgYW5vdGhlciBs
b25nIGxvbmcgdGhyZWFkIGJ1dCBub2JvZHkgZGV2ZWxvcCB0aGVpciBrbm93bGVkZ2UNCj4gdGhl
cmUuDQo+IA0KRXhhY3RseS4gU28gZXhwbGFpbiB1c2UgY2FzZSBvZiB3aGljaCBzb2Z0d2FyZSB3
aWxsIHVzZSBpdD8gSSBkb27igJl0IHNlZSBhbnkgaHlwZXJ2aXNvciB1c2luZyBpdCB0b2RheSBf
ZnJvbV8gdGhlIGRldmljZSBjb250ZXh0Lg0KDQo+IEFuZCBpZiB0aGlzIGlzIGEgdmVuZG9yIHNw
ZWNpZmljIGlzc3VlLCB0aGVuIHNob3VsZCBub3QgYmUgcmVsZXZhbnQgdG8gdGhlIHNwZWMuDQpX
aGF0IHZlbmRvciBzcGVjaWZpYyBpc3N1ZSBhcmUgeW91IHRhbGtpbmcgYWJvdXQ/IEJ5IHNvbWUg
bWVhbnMgYXJlIHlvdSBfaW1wbHlpbmdfIG5vdCB0cmFuc2ZlcnJpbmcgbXNpeCB0YWJsZSBpcyBw
cm9wb3NlcnMgdmVuZG9ycyBsaW1pdGF0aW9uPw0KSGVsbCBuby4NCg==

