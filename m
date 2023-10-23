Return-Path: <virtio-comment-return-7902-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C5ABC001E0
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 10:14:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 94C0DEEA0A
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 10:14:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8D476986678
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 10:14:42 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 81F7C986669; Mon, 23 Oct 2023 10:14:42 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7341998666A
	for <virtio-comment@lists.oasis-open.org>; Mon, 23 Oct 2023 10:14:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JEAYzn4ev0A4UfDoTa5QXoj5CPmKxWGFbO42za3plF7zgQyqmItRsLcYBBS/Ix3CQAdDdS7kJutTbGkqxwoXc0OiU/ykh+SkUgeUQ4MMqUF7EYJ7xoAQOzg8/nM246O5lisUli84X7XG2ooSgcyWthLVcw/rK8uW7vOee0szDOncJA4VSbPWhSaMhpXZaRbkpuyCuQxDPhf8S8k/h9NPl7ETFp498uEMmVybdDIJQKlW459njz4Dast4WYgh6JyonK8NXMm2cwAA/HN1nhjjLjC9jSmdpTqCwxHQh6keQFlVu/uG4xP9tY93rDUpBjEe4eO8qSuhT5rUu7VSTktiMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yN/N0PgMiA8vBf6zlNrpC+V5Ge8M8zrzJXa+DHfxQBE=;
 b=EfjEon5MzKW9ZqkmWGD+grOxA/SE9Zg5tG7H0GG9CZeCZIeHKBnkm5jovuRrWHdXqy8ag7qpavtawf1ypoDzkMcsa3+ghYaOY3bvfrlqBZcq3vyjoJv/kbUNWr2JTqYQyr53mjpYZigWPauvA2RX/SzGNzIA9AwONXHHqD74mHxRRNxWMM5MM1zJmzGB4YkSVQ/InGANFY7TUzirSOnPA139hMzN/XCyMmSGvBNm0JXKTdE46UszvQ9dQtjjSs3pWmn8ZXj1ShcDXTEyluvmOyhzzdESAYKoc4U3Qw2jAkErno9DdikNr7v4mZ4Ftgk/4n2+MGkfA6SNLvMXMI2yrQ==
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
 AQHZ+dpHSUrTyyDEA0quapQP8C0hdbA/xRkAgAF/hoCAACxh4IABSWcAgAANqrCAAZnYAIAACyKAgAGFBICAAACFkIAAEwWAgAAD8yCAAXZ1gIAAIYLAgASWeYCAAtRh8IAAGoeAgAAAUKCAAARLAIAAB5cQgAAXYICAAABqYIABiiSAgAAMdcCAAALCgIAAADWggAABTwCAAAD9AIAAAmrwgAGTbICAADeVYIAEiiUAgAAAXIA=
Date: Mon, 23 Oct 2023 10:14:38 +0000
Message-ID:
 <PH0PR12MB5481033BB7C0BCABAE329B13DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <829d27f8-1d9b-4a1e-93a8-a14da626f4a7@intel.com>
 <PH0PR12MB54819FC5A77A46C649CD5B6DDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <0948cfa4-da02-43d5-a099-424f209f814f@intel.com>
 <PH0PR12MB5481546E859578DE97D9E152DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <860e52ef-8cfc-408a-b3cc-2551ef6118d1@intel.com>
 <PH0PR12MB5481F6F9BC5158481EC36AE9DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <cd9431cc-a5ed-4b11-a341-dc129e8ea630@intel.com>
 <PH0PR12MB54819087A0B542F587A4BEC2DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <7bc82c01-19ad-4180-914b-9304e10ef7c3@intel.com>
 <PH0PR12MB5481E858791CA8FD97C7F35EDCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019051406-mutt-send-email-mst@kernel.org>
 <daea1f54-1c85-4a4a-ac3a-c5ae97180e03@intel.com>
 <PH0PR12MB5481BE51210D429FA12EAB45DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fb012148-a71e-4856-95fe-6e75f011f3fb@intel.com>
 <PH0PR12MB54819C3A4BC9BB419715AB73DCDBA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f2707430-bb1e-4dcd-b0b3-2b9a705e555a@intel.com>
In-Reply-To: <f2707430-bb1e-4dcd-b0b3-2b9a705e555a@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SN7PR12MB7912:EE_
x-ms-office365-filtering-correlation-id: 059c3fbc-186d-4f7b-b561-08dbd3b0dd7d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 t9VsvfEDN55CgoTTcoBj42TO9RL6pGT606EYqSW130kMbTS6fg6jKHLIkmzpUWJC+Rjt1B4WPzZU1+H1oyNSZE0S41ZhNt0GWYzz+kGFbL0DdArS9ItVDn9wDB1f+3Okl8ceNQzxM+75I8LZpLtdizIcY8KjilaH9QfmQIaxYpnXrgXDJNs9WBtlVMwo12QYnSDrzj4dvFK3IPt7umRl/Woqt/WusdrTbhMMJjGo7AfsPpTph+Eg6Ts1tf7XI7PzpEcSE2eFT9jamUNMeAR26QbjlpRBwaHNrVyhNnwMlmvh2xTEgvEDfDcjk0BU9Zc479fjkNFB+ss5LXvZ0KC6nsvHdg/j230NUWW45qa9vLi5KLytmBUnM3KE5iierrooE+JdvxE54KSsMh3uHtSeGFpM3HYgwxYDRYs8dS9DIDhV54ZCxMAg3VUoO/ymUsDHbeO915r5GK2oPKAgPnp4Dkug2/lp7QZ2rD9LfM5vpnGzpzbCssB2tK6kkNbpEKdZOT8+syNx83binDdGPfx8c3qZtdg42zDbTUGdgMQzXEwudxE7LDEI+9w1+94YrrVr/1mj2GDprxt1CeooLkRlaM4L3qMW/B9fMacfMFJNTTwlx04I67rmuXJlK06Ruc6aKXXLLXAnY1/R0nuz6NPCNtm9YM/kbtSiI5wf9gt5lwY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(396003)(136003)(366004)(39860400002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(107886003)(110136005)(76116006)(66556008)(316002)(66946007)(55016003)(64756008)(54906003)(66476007)(66446008)(122000001)(26005)(71200400001)(478600001)(9686003)(966005)(6506007)(7696005)(53546011)(55236004)(38100700002)(5660300002)(52536014)(86362001)(2906002)(41300700001)(33656002)(38070700009)(83380400001)(8936002)(8676002)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RlpvMnhDQW9uUVdZNkhaNXJLV0pHMzlMalJSaWtmd2dkSTRqSVV3M2xUTTlo?=
 =?utf-8?B?Tndic1R6a2toT2ZrM0d4QjA2RGFHTm1MSWpFcldyUm5Nd2UzeHgvMEFpS29i?=
 =?utf-8?B?U2c2UFpzMWFuMTBuUmZQY2NLTnc3aDVyZTd6U3VmYmhWc2NodnJmdUJsZVhx?=
 =?utf-8?B?NnFEaWhHbW8wQTBmVE5ycFoyMHVlWmFQZlE0REVxSXllWDVhRXpkWmN3MjdT?=
 =?utf-8?B?MXJ3R211WXFjV21uZHVtQlVDVEZKcWZPR3dvQUwyZ3p3Y0huSGRKTkh6QTgv?=
 =?utf-8?B?YzRCWmtZclJsQkpuOW9LOWVyR09FWElmbjl5VWQ0SWIzRVlYSTMzU1pkdFZF?=
 =?utf-8?B?MEZjcUJET0hkTU1lUTRuK2c2YStwdnRENUJWUk1OV3djQi96Z1F2d2NobnQ1?=
 =?utf-8?B?aDhMY3VWWHplTk9zYWZ6MkVzQklUcXA4Z2l2K1AxcG9MdUNEWXNDcmhXcDNZ?=
 =?utf-8?B?Y0JBd2dkTTZ5M0JPNCtOZFYvak1iUUJ3RmQ5SGZmVnUvQXZ2ZXZJSUQ5RzZZ?=
 =?utf-8?B?R3B3LzBWaHlybWw2SHo0MDMyVnRubUd4MlFFQTdJUVlmQzI3T0ZEclpXUWpt?=
 =?utf-8?B?SkJnSndhZlpESUlXVVo0b2w4WHJCSEI3MG5lL2pFRzJWYTk0UEtGNjFxRUJ5?=
 =?utf-8?B?akVuOG0zTUxZQWR1Zk5yalRKT294bHlZTXBpTU4wcTN2WlpYYjFFa0dZS01W?=
 =?utf-8?B?NzdrNGRaQnhRWHpqd2V0bG9MRVFTWmNmY2h3d09zd0plZWxKSWhPSHpwZU5Q?=
 =?utf-8?B?UHIxV1A2UnVXWkNYbXh1UzRRaVVPbGZlNWFJWEhBTDV2OWxWZ3QrblE2OWRz?=
 =?utf-8?B?Q3owcXZPMXQyd0djT214TjBmNGtpTDdudG4xR2o3emhnK01ocVI2VUtnZ1o3?=
 =?utf-8?B?WEg3Y3dvUkJNOTZJaWEyQ3pCVmNEMVFnOWFBd2xjb2toTzNJTDVMd0d3RzNj?=
 =?utf-8?B?dTRaZXUrVVcvbGVHaFhPQnVoNW55VW1UNDJNbkJ0c011UUcyODhJWHozU2tm?=
 =?utf-8?B?U2dYYXZiRHdKeExReHlOdWZ3OTZvcEZ2QjQ3ZEZuUnNzbUVUdGdDVVBjT0Zn?=
 =?utf-8?B?eHBwN3ppV2xOM1NzZnBiUHRrNnhBMnVpWVVwb3lZZWlUOEthdnoyZ0JyVXVo?=
 =?utf-8?B?TGo4Tmo0UlljK01SdDlyTGtkN1BrbGo2N1czU2hZNFFyNk1mUU5pVXdZRXNq?=
 =?utf-8?B?NjZYN2xDSlFpUzRGUStBSHB1bGVWR3Z0V1VFYXlFWUViQVA0VFliNGlDRVpH?=
 =?utf-8?B?SnZkRHJ4RWsrandxenRTRWxsQlJveGhuOUV2VDViYXRoSE9hUExQTnA5U1hn?=
 =?utf-8?B?WGU3UjdVYXNJbjBoTlFsUVcvS3hpMFNCQTArVUJsbGJNMGhDclBTc25vdzhB?=
 =?utf-8?B?WUhicTBZUGx1MXcrV1Y4YnVJUUQ1SFV0c0NQQm9oM0Qwd2xjTngxMVFYdVVX?=
 =?utf-8?B?YVdPcTQyYytpRHhWK0x1VnFBKzZka0swdmswNmdOb2JsUGlqdEhYQnVEcXNO?=
 =?utf-8?B?S0IxaTU5SSt3YjhxcTJmRXQ2VEt1clo0V2xqOEJJQ1RJRndHL0lVSUhhZnZn?=
 =?utf-8?B?a0FvaDNKVDdrbU9BN090M1ZEMmVqVmlTYTAxZW5pbVQvdVNVVERnajFZNEF0?=
 =?utf-8?B?SStYR2dNdHhVTTJIRDJOZWpDNFBWWUhnOTdMTGIyclhub3RZZGpBOHJYWURr?=
 =?utf-8?B?TTFxcjBWdHJTeG9FOFBhOWhPZGY1aVBxVVl1bGpNSHNBM2dPOVBiQ3FlUkpv?=
 =?utf-8?B?Sk0vTXIzUnNqTi9wbm5TdE9rT2pBWnZKQUR5aEZ0aXhVVDNUeDRYMk9RNlBD?=
 =?utf-8?B?WCs5a0o3c0ZwMWlNbTVPTXNiV1M1ZmpZUzlmQ01tQ29BbWdSSFk4eXBSa0c3?=
 =?utf-8?B?c05JdkM2Uk9Zdk12ckxweHpsZ3JMb2tLWW9sc2VtOGI4aHMzWkQrbmF0Q29K?=
 =?utf-8?B?SW84YlE2QVV5OFM1TW91SExUMzRwb3NYQ24vdW8rVzYyV3NrY1QrdGFYT3VU?=
 =?utf-8?B?N256UEV6enM3TTFtU2luZGpKd09kd1RBazJFTGhDbG51RUFqUmMwRDhuYzZv?=
 =?utf-8?B?MnNRZXFVZDQrdS9MVUMxUUdieFIyeVBPVWVnTVYvbjcybXVqT01MTmJDdTlq?=
 =?utf-8?Q?CofI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 059c3fbc-186d-4f7b-b561-08dbd3b0dd7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2023 10:14:38.6588
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZuV5Eh9EhZvFA8mQqh6Xps2m/FArHU/7qSQaa+oICoEoLwirs59KY9sMimnUVco9QD/UIrBJsKjX4+3yDfaCiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7912
Subject: RE: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

DQo+IEZyb206IFpodSwgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+DQo+IFNlbnQ6
IE1vbmRheSwgT2N0b2JlciAyMywgMjAyMyAzOjM5IFBNDQo+IA0KPiBPbiAxMC8yMC8yMDIzIDg6
NTQgUE0sIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPj4gRnJvbTogWmh1LCBMaW5nc2hhbiA8bGlu
Z3NoYW4uemh1QGludGVsLmNvbT4NCj4gPj4gU2VudDogRnJpZGF5LCBPY3RvYmVyIDIwLCAyMDIz
IDM6MDEgUE0NCj4gPj4NCj4gPj4gT24gMTAvMTkvMjAyMyA2OjMzIFBNLCBQYXJhdiBQYW5kaXQg
d3JvdGU6DQo+ID4+Pj4gRnJvbTogWmh1LCBMaW5nc2hhbiA8bGluZ3NoYW4uemh1QGludGVsLmNv
bT4NCj4gPj4+PiBTZW50OiBUaHVyc2RheSwgT2N0b2JlciAxOSwgMjAyMyAyOjQ4IFBNDQo+ID4+
Pj4NCj4gPj4+PiBPbiAxMC8xOS8yMDIzIDU6MTQgUE0sIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90
ZToNCj4gPj4+Pj4gT24gVGh1LCBPY3QgMTksIDIwMjMgYXQgMDk6MTM6MTZBTSArMDAwMCwgUGFy
YXYgUGFuZGl0IHdyb3RlOg0KPiA+Pj4+Pj4+IE9oLCByZWFsbHk/IFF1aXRlIGludGVyZXN0aW5n
LCBkbyB5b3Ugd2FudCB0byBtb3ZlIGFsbCBjb25maWcNCj4gPj4+Pj4+PiBzcGFjZSBmaWVsZHMg
aW4gVkYgdG8gYWRtaW4gdnE/IEhhdmUgYSBwbGFuPw0KPiA+Pj4+Pj4gTm90IGluIG15IHBsYW4g
Zm9yIHNwZWMgMS40IHRpbWUgZnJhbWUuDQo+ID4+Pj4+PiBJIGRvIG5vdCB3YW50IHRvIGRpdmVy
dCB0aGUgZGlzY3Vzc2lvbiwgd291bGQgbGlrZSB0byBmb2N1cyBvbg0KPiA+Pj4+Pj4gZGV2aWNl
DQo+ID4+Pj4gbWlncmF0aW9uIHBoYXNlcy4NCj4gPj4+Pj4+IExldHMgcGxlYXNlIGRpc2N1c3Mg
aW4gc29tZSBvdGhlciBkZWRpY2F0ZWQgdGhyZWFkLg0KPiA+Pj4+PiBQb3NzaWJseSwgaWYgdGhl
cmUncyBhIHdheSB0byBzZW5kIGFkbWluIGNvbW1hbmRzIHRvIHZmIGl0c2VsZg0KPiA+Pj4+PiB0
aGVuIExpbmdzaGFuIHdpbGwgYmUgaGFwcHk/DQo+ID4+Pj4gc3RpbGwgbmVlZCB0byBwcm92ZSB3
aHkgYWRtaW4gY29tbWFuZHMgYXJlIGJldHRlciB0aGFuIHJlZ2lzdGVycy4NCj4gPj4+IFZpcnRp
byBzcGVjIGRldmVsb3BtZW50IGlzIG5vdCBwcm9vZiBiYXNlZCBhcHByb2FjaC4gUGxlYXNlIHN0
b3AgYXNraW5nIGZvcg0KPiBpdC4NCj4gPj4+DQo+ID4+PiBJIHRyaWVkIG15IGJlc3QgdG8gaGF2
ZSB0ZWNobmljYWwgYW5zd2VyIGluIFsxXS4NCj4gPj4+IEkgZXhwbGFpbmVkIHRoYXQgcmVnaXN0
ZXJzIHNpbXBseSBkbyBub3Qgd29yayBmb3IgcGFzc3Rocm91Z2ggbW9kZQ0KPiA+Pj4gKGlmIHRo
aXMgaXMgd2hhdCB5b3UgYXJlIGFza2luZyB3aGVuIHlvdSBhcmUgYXNraW5nIHByb3ZlIGl0cyBi
ZXR0ZXIpLg0KPiA+Pj4gVGhleSBjYW4gd29yayBmb3Igbm9uX3Bhc3N0aHJvdWdoIG1lZGlhdGVk
IG1vZGUuDQo+ID4+Pg0KPiA+Pj4gQSBtZW1iZXIgZGV2aWNlIG1heSBkbyBhZG1pbiBjb21tYW5k
cyB1c2luZyByZWdpc3RlcnMuIE1pY2hhZWwgYW5kIEkNCj4gPj4+IGFyZQ0KPiA+PiBkaXNjdXNz
aW5nIHByZXNlbnRseSBpbiB0aGUgc2FtZSB0aHJlYWQuDQo+ID4+PiBTaW5jZSB0aGVyZSBhcmUg
bXVsdGlwbGUgdGhpbmdzIHRvIGJlIGRvbmUgZm9yIGRldmljZSBtaWdyYXRpb24sDQo+ID4+PiBk
ZWRpY2F0ZWQNCj4gPj4gcmVnaXN0ZXIgc2V0IGZvciBlYWNoIGZ1bmN0aW9uYWxpdHkgZG8gbm90
IHNjYWxlIHdlbGwsIGhhcmQgdG8NCj4gPj4gbWFpbnRhaW4gYW5kIGV4dGVuZC4NCj4gPj4+IEEg
cmVnaXN0ZXIgaG9sZGluZyBhIGNvbW1hbmQgY29udGVudCBtYWtlIHNlbnNlLg0KPiA+Pj4NCj4g
Pj4+IE5vdywgd2l0aCB0aGF0LCBpZiB0aGlzIGNhbiBiZSB1c2VmdWwgb25seSBmb3Igbm9uX3Bh
c3N0aHJvdWdoLCBJDQo+ID4+PiBtYWRlIGh1bWJsZQ0KPiA+PiByZXF1ZXN0IHRvIHRyYW5zcG9y
dCB0aGVtIHVzaW5nIEFRLCB0aGlzIHdheSwgeW91IGdldCBhbGwgYmVuZWZpdHMgb2YgQVEuDQo+
ID4+PiBBbmQgdHJ5aW5nIHRvIHVuZGVyc3RhbmQsIHdoeSBBUSBjYW5ub3QgcG9zc2libGUgb3Ig
aW5mZXJpb3I/DQo+ID4+Pg0KPiA+Pj4gSWYgeW91IGhhdmUgY29tbWFuZHMgbGlrZSBzdXNwZW5k
L3Jlc3VtZSBkZXZpY2UsIHJlZ2lzdGVyIG9yIHF1ZXVlDQo+ID4+IHRyYW5zcG9ydCBzaW1wbHkg
ZG9u4oCZdCB3b3JrLCBiZWNhdXNlIGl0J3Mgd3JvbmcgdG8gYmlmdXJjYXRlIHRoZQ0KPiA+PiBk
ZXZpY2Ugd2l0aCBzdWNoIHdlaXJkIEFQSS4NCj4gPj4+IElmIHlvdSB3YW50IHRvIGJpZmVyYWNh
dGUgZm9yIG1lZGlhdGlvbiBzb2Z0d2FyZSwgaXQgcHJvYmFibHkgbWFrZXMNCj4gPj4+IHNlbnNl
IHRvDQo+ID4+IG9wZXJhdGUgYXQgZWFjaCBWUSBsZXZlbCwgY29uZmlnIHNwYWNlIGxldmVsLiBT
dWNoIGFyZSB2ZXJ5IGRpZmZlcmVudA0KPiA+PiBjb21tYW5kcyB0aGFuIHBhc3N0aHJvdWdoLg0K
PiA+Pj4gSSB0aGluayB2ZHBhIGhhcyBkZW1vbnN0cmF0ZWQgdGhhdCB2ZXJ5IHdlbGwgb24gaG93
IHRvIGRvIHNwZWNpZmljDQo+ID4+PiB3b3JrIGZvcg0KPiA+PiBzcGVjaWZpYyBkZXZpY2UgdHlw
ZS4gU28gc29tZSBvZiB0aG9zZSB3b3JrIGNhbiBiZSBkb25lIHVzaW5nIEFRLg0KPiA+Pj4gWzFd
DQo+ID4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy92aXJ0aW8tY29tbWVudC84NzBhY2UwMi1m
OTljLTQ1ODItOTMyZi1iZDEwMw0KPiA+Pj4gMzYNCj4gPj4+IDJkYWU5QGludGVsLmNvbS9ULyNt
Mzc3NDNhYTkyNDUzNmQwMjU2ZDZiM2I4ZTgzYTExYzc1MGYyODc5NA0KPiA+PiBXZSBoYXZlIGJl
ZW4gdGhyb3VnaCB5b3VyIHN0YXRlbWVudCBmb3IgbWFueSB0aW1lcy4NCj4gPj4gVGhpcyBpcyBu
b3QgYWJvdXQgaG93IG1hbnkgdGltZXMgeW91IHJlcGVhdGVkLCBpZiB5b3UgdGhpbmsgdGhpcyBp
cw0KPiA+PiB0cnVlLCB5b3UgbmVlZCB0byBwcm92ZSB0aGF0IHdpdGggc29saWQgZXZpZGVuY2Uu
DQo+ID4+DQo+ID4gSSB3aWxsIG5vdCByZXNwb25kIHRvIHRoaXMgY29tbWVudCBhbnltb3JlLg0K
PiBPayBpZiB5b3UgY2hvb3NlIG5vdCB0byByZXNwb25kLg0KPiA+DQo+ID4+IEZvciBwYXNzLXRo
cm91Z2gsIEkgc3RpbGwgcmVjb21tZW5kIHlvdSB0byB0YWtlIGEgcmVmZXJlbmNlIG9mDQo+ID4+
IGN1cnJlbnQgdmlyaXRvLXBjaSBpbXBsZW1lbnRhdGlvbiwgaXQgd29ya3MgZm9yIHBhc3MtdGhy
b3VnaCwgcmlnaHQ/DQo+ID4gV2hhdCBkbyB5b3UgbWVhbiBieSBjdXJyZW50IHZpcnRpby1wY2kg
aW1wbGVtZW50YXRpb24/DQo+IGN1cnJlbnQgdmlyaXRvLXBjaSB3b3JrcyBmb3IgcGFzcy10aHJv
dWdoDQpJIHN0aWxsIGRvbuKAmXQgdW5kZXJzdGFuZCB3aGF0IGlzICJjdXJyZW50IHZpcnRpby1w
Y2kiLg0KRG8geW91IG1lYW4gcWVtdSBpbXBsZW1lbnRhdGlvbiBvZiBlbXVsYXRlZCB2aXJ0aW8t
cGNpIG9yIHlvdSBtZWFuIHZpcnRpby1wY2kgc3BlY2lmaWNhdGlvbiBmb3IgcGFzc3Rocm91Z2g/
DQpXaGF0IGRvIHlvdSB3YW50IG1lIHRvIHJlZmVyIHRvIGZvciBwYXNzdGhyb3VnaD8gUGxlYXNl
IGNsYXJpZnkuDQoNCj4gPg0KPiA+PiBGb3Igc2NhbGUsIEkgYWxyZWFkeSB0b2xkIHlvdSBmb3Ig
bWFueSB0aW1lcyB0aGF0IHRoZXkgYXJlIHBlci1kZXZpY2UNCj4gPj4gZmFjaWxpdGllcy4gSG93
IGNhbiBhIHBlci1kZXZpY2UgZmFjaWxpdHkgbm90IHNjYWxlPw0KPiA+IEVhY2ggVkYgZGV2aWNl
IG11c3QgaW1wbGVtZW50IG5ldyBzZXQgb2Ygb24tY2hpcCBtZW1vcnktYmFzZWQgcmVnaXN0ZXJz
DQo+IHdoaWNoIGRlbWFuZHMgbW9yZSBwb3dlciwgZGllIGFyZWEgd2hpY2ggZG9lcyBub3Qgc2Nh
bGUgZWZmaWNpZW50bHkgdG8NCj4gdGhvdXNhbmRzIG9mIFZGcy4NCj4gdGhhdCBjYW4gYmUgZnBn
YSBnYXRlcyBvciBTT0MgaW1wbGVtZW50aW5nIG5ldyBmZWF0dXJlcywgeW91IHRoaW5rIHRoYXQg
aXMgYQ0KPiB3YXN0ZT8NCkl0IGlzIHdhc3RlIGluIGh3LCBpZiB0aGVyZSBpcyBhIGJldHRlciBh
cHByb2FjaCBwb3NzaWJsZSB0byBub3QgYnVybiB0aGVtIGFzIGdhdGVzIGFuZCBzYXZlIG9uIHJl
c291cmNlcyBmb3IgcmFyZWx5IHVzZWQgaXRlbXMuDQoNCg0KPiA+DQo+ID4+IHZEUEEgd29ya3Mg
ZmluZSBvbiBjb25maWcgc3BhY2UuDQo+ID4+DQo+ID4+IFNvLCBpZiB5b3Ugc3RpbGwgaW5zaXN0
IGFkbWluIHZxIGlzIGJldHRlciB0aGFuIGNvbmZpZyBzcGFjZSBsaWtlIGluDQo+ID4+IG90aGVy
IHRocmVhZCB5b3UgaGF2ZSBjb25jbHVkZWQsIHlvdSBtYXkgaW1wbHkgdGhhdCBjb25maWcgc3Bh
Y2UNCj4gPj4gaW50ZXJmYWNlcyBzaG91bGQgYmUgcmUtZmFjdG9yZWQgdG8gYWRtaW4gdnEuDQo+
ID4gV2hhdGV2ZXIgaXMgZG9uZSBpbiBwYXN0IGlzIGRvbmUsIHRoZXJlIGlzIG5vIHdheSB0byBj
aGFuZ2UgaGlzdG9yeS4NCj4gPiBBbiBuZXcgbm9uIGluaXQgdGltZSByZWdpc3RlcnMgc2hvdWxk
IG5vdCBiZSBwbGFjZWQgaW4gZGV2aWNlIHNwZWNpZmljIGNvbmZpZw0KPiBzcGFjZSBhcyB2aXJ0
aW8gc3BlYyBoYXMgY2xlYXIgZ3VpZGVsaW5lIG9uIGl0IGZvciBnb29kLg0KPiA+IERldmljZSBj
b250ZXh0IHJlYWRpbmcsIGRpcnR5IHBhZ2UgYWRkcmVzcyByZWFkaW5nLCBjaGFuZ2luZyB2ZiBk
ZXZpY2UgbW9kZXMsDQo+IGFsbCBvZiB0aGVzZSBhcmUgY2xlYXJseSBub3QgYSBpbml0IHRpbWUg
c2V0dGluZ3MuDQo+ID4gSGVuY2UsIHRoZXkgZG8gbm90IGJlbG9uZyB0byB0aGUgcmVnaXN0ZXJz
Lg0KPiByZXNldCB2cT8gYW5kIHlvdSBnZXQgaXQgZnJvbSBBcHBlbmRpeCBCLiBDcmVhdGluZyBO
ZXcgRGV2aWNlIFR5cGVzLCBhcmUgd2UNCj4gaW1wbGVtZW50aW5nIGEgbmV3IHR5cGUgb2YgZGV2
aWNlPz8/DQpJIGRvbuKAmXQgdW5kZXJzdGFuZCB5b3VyIHF1ZXN0aW9uLg0KSSByZXBsaWVkIHRo
ZSBoaXN0b3J5IG9mIHJlc2V0X3ZxLg0KVGFrZSBnb29kIGV4YW1wbGVzIHRvIGZvbGxvdywgcmVz
ZXRfdnEgY2xlYXJseSBpcyBub3QgdGhlIG9uZS4NCg==

