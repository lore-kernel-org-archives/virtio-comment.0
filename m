Return-Path: <virtio-comment-return-7898-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972CFCDB474
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 10:02:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E5A387DD6A
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 10:02:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CA31898666C
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 10:02:02 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id AED73986669; Mon, 23 Oct 2023 10:02:02 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9CCD098666A
	for <virtio-comment@lists.oasis-open.org>; Mon, 23 Oct 2023 10:02:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xl170Y3ZHBtSmJaumOcqTc6oKaeDzpxiFWb02UlQvLVWPOTVl0ysmeAVg3odQNaK8rpq6R6lWcYhp5+bQJdXR6gW1tOf+pMq0yaVX8uvOfXuc8IAwOQDpi1hMp2BwwbEwgbNWH4q7EKam2jv1WhG8FaJEo5altD4aWjXSUx3IdzLxSL/mU1wvdUnFn2zv6Eow8uyChhlXjmXQy8zvxSzaVPFUbPZvJV0sKBV7n90EWKjowrOdBz5p+c7FfDQ2htu8z8nW1o9La22fH8ubPHFaWLlyRp6ojfcCfNAnKtWkDuS1W0/gWQwfkGVsX4P5Q0xpzwsFfj/LZHupMeyVUX6mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gfxPEKiL9NetEfnKHEYkV+Jp6/0SS+To5qU1LbpM3mo=;
 b=oUTYA9/Nnjrdwroewc2ZDGwwtQwQD8WJbAzGkEx83EtO+tQxUvgptwl5E46i8Oef172YGKqsGNjU5ndHawgmItV4sGgNpKZnUP8g9z8VN3E8pdnPLzwgwQHkRUUY58q3H5WNnterjhZ0VrMb5ye3uOMJZmPRmHtLTngMUWDV2UT1rE5JshN+atRPEfTYR9k+UpVp60xu5TGiaO3+byV3oJnxvTw/aUoXrD5TpBXvdnFzVak7d8L1NNwuoLbZl0WjLwHmaehEt//8kikviKeoD/WfUVVR48j5nxKmJppzGOG7abGseRV4Rfoq7xqdMKOuiDWms0weCVsird27J0xuSg==
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
 AQHZ+dpHSUrTyyDEA0quapQP8C0hdbA/xRkAgAF/hoCAACxh4IABSWcAgAANqrCAAZnYAIAACyKAgAGFBICAAACFkIAAEwWAgAAD8yCAAXZ1gIAAIYLAgASWeYCAAtRh8IAAGoeAgAAAUKCAAARLAIAAB5cQgAAXYICAAABqYIABiiSAgAAMdcCAAALCgIAAADWggAABTwCAAAD9AIAAAmrwgAGTbICAAALdAIAAGU2AgAAZUrCABIZTgIAAAScQ
Date: Mon, 23 Oct 2023 10:01:59 +0000
Message-ID:
 <PH0PR12MB5481735CC313D32DBAA054E6DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <860e52ef-8cfc-408a-b3cc-2551ef6118d1@intel.com>
 <PH0PR12MB5481F6F9BC5158481EC36AE9DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <cd9431cc-a5ed-4b11-a341-dc129e8ea630@intel.com>
 <PH0PR12MB54819087A0B542F587A4BEC2DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <7bc82c01-19ad-4180-914b-9304e10ef7c3@intel.com>
 <PH0PR12MB5481E858791CA8FD97C7F35EDCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019051406-mutt-send-email-mst@kernel.org>
 <daea1f54-1c85-4a4a-ac3a-c5ae97180e03@intel.com>
 <PH0PR12MB5481BE51210D429FA12EAB45DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fb012148-a71e-4856-95fe-6e75f011f3fb@intel.com>
 <20231020053534-mutt-send-email-mst@kernel.org>
 <3932dd54-f43a-40b6-8dba-962f997f7122@intel.com>
 <PH0PR12MB54813F96D29B2D2ACEADD62ADCDBA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <b9ac0893-be30-41d9-8898-2a60e8e909aa@intel.com>
In-Reply-To: <b9ac0893-be30-41d9-8898-2a60e8e909aa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DS0PR12MB8270:EE_
x-ms-office365-filtering-correlation-id: d7ee9859-bbcc-4b58-c59e-08dbd3af191d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 9NXNzi6HADTmvAzn0vrdkRLN8Aix9IUiywxt8wCnYxEdHs0EOAhcpu4GEYdCqFV6BJ9Ju8DPiTbWqCrJslhwu5mOZlDVabx4Vvz1yEVHp5c6Mitnsjeqnuujf/823q2T5FUB4K/ecFZ2ti9uZunsd2skjbvhytsAzFXae7DqD+RuVdrMoqb9Beuh/x9oAS4+sYQ6U/fDvrpTSnzjyWrwpezg8qEoCt3BSq4ph2V8n1jsdX/PViK+Qa1jNQqhC2Qw+sZd0HdJGsiHNTpycardAqofdM4jEReFHpOLf0yVlhyiUgoo2pQ06Sr8FSXdw9v6sj1oRYdOxjxrsVQpYcw5sfzzJ1X124zkc/2JMetcM/9hPj3T5Tbn73EKTxRVKxDV6yEDhNwUKNMkwnRq4qGhi8iwRpPYnY/OmsN12nQyN34g8b4qUcRa/I0aCGDbXLZ/mlu9UNJo1yjy0R+azF9uBBLORuKTTgFg46+LCAO115LwunlDGiNqSvMg9IguSgtEOtT2bo3HHLjE7jhfhqe1mjm/pT1X6bMKgiI+QzoDcA2OSNEhQyH7ooaCyAtvefDMrUxSizCNdV7yo/rRhCDhTPil7ZhuqZXPMakaC6wmVpdFdtjpKIOrhhEoYHwtySoU
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(346002)(396003)(376002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(52536014)(86362001)(2906002)(55236004)(5660300002)(38100700002)(6506007)(7696005)(8676002)(8936002)(83380400001)(38070700009)(4326008)(41300700001)(33656002)(55016003)(66946007)(66556008)(316002)(76116006)(110136005)(66446008)(122000001)(66476007)(54906003)(64756008)(107886003)(9686003)(26005)(71200400001)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UjcvZHJvMk10M2tnTTlRVHdsUjBNU3d1Mk1xZDhWSnJUOXdjajF5TndXRGlU?=
 =?utf-8?B?cDRTeGtvS2tuQncyVmpPV3ppK3kyRU5DMHRTU09ZQ0liNUlhZm43SHZGTlZo?=
 =?utf-8?B?bUpkTTRiOU5jYzE4d0FMMFhyN0Naa3NhMzVaZnZZK25GaVU3dHBXcit4SjNQ?=
 =?utf-8?B?R0JhTjNlc0hwWVV4SXpwYm50L0pnOXQ1cjdJeXJsUWxlOEV0MzgvQTJPejl0?=
 =?utf-8?B?WUd4eGZpekRkcG8zaHNRczhEWmJCM3ZiVnZnaHNCNmFDd3hrQ0tQQkg4MC9p?=
 =?utf-8?B?MnBNQ25aOE15cC9jbHdXY2svRjRNN0dGbDZmK3dwczIxUHhCcURnMmRHWW90?=
 =?utf-8?B?U0NLOEgyUXRQNVFJYmE1OUQrMWJDK2FkOUVGaW8zUDNjVlVaeGhKZWQ0TkEw?=
 =?utf-8?B?ZmY2R0NwaVRqWXhUNTVnc2xxdDFNUE1VWkRMUmdlZE1TSlV2alJleW1oVWFr?=
 =?utf-8?B?RlJldXVTL21QdUJUb1lWWE1xcHBCenFGRjdHcTRhanJCOUV5OHJuR29uMVFq?=
 =?utf-8?B?UUJ2bmhWOWcxQTFQRGcvcUx0M3BRKzVlL0hESnZzVEoyU2tsSW9xSVJtRHlr?=
 =?utf-8?B?cG9zVlVVaUw2a3VxMHUvRW5qTHpWbStVcC94UUkrd3dqMVQ5YnRNa1JyWkRk?=
 =?utf-8?B?ZHJGanc5aFN6WnBWTWRRUTdFQVZLam5mRER1azdRdjhCYXlJSjl6aHhMWVZ2?=
 =?utf-8?B?Y0FBYnJtY3F4SlNzL2FlV2UyU2x4VjdSUHpCR0p6eVV0L2dxSGloaElyYys0?=
 =?utf-8?B?bGtLcXMyT05hMkVNZThYblZkYUkzczZicnZ2R0F5aVZmdktGTkhOenBDWkJi?=
 =?utf-8?B?eWtSTFowa3ZMU2cwL1JiemZZelIxWGN4ZEYyQTdFdDRMYUlkZThSZEtITE96?=
 =?utf-8?B?T2JKbmxndUdxWmRNTFM5WG1va1d5OHlxTzFMWDZXWW1BTnJGQlpuZkRndXhr?=
 =?utf-8?B?YlVVQ3gxc29uK0VVSUlsbDhqT1lCaHo5S0JyYzNlYlBLVFBYV3dpNFBDN3VB?=
 =?utf-8?B?d2xpckQ4a0RJaEllalp1NExJdnN5UXd6OXFyeU9OWHRyNkVSOVJzSkZESGwy?=
 =?utf-8?B?OGhlSW1saDZuYndnZ3loYVh2bVlVNHVqc1hva05IVHJ1YUlvMFdLOUE0T1Ew?=
 =?utf-8?B?MzM3V3RrakFyR3FOb29OOWU1dXVKc1JKWWJSdDZMS1EwcHczcGc0eE91cm40?=
 =?utf-8?B?a3F3eHp3OG5abTd0SW9JZ1psTDVEeTZOWFd5eUhkUHdQSHl6UkNBTTNjQnRu?=
 =?utf-8?B?MXBNcy9VREZ3OUpZU2JIRkRObncxQ2VvdXZCNmo4ZjlsODE1cWU5dVhvalBJ?=
 =?utf-8?B?T0NUTW10Qjk3aU90ZlRqYWhOVTZLYkYzY1NkQURJNzgwNFllS1UyLzl0UXoz?=
 =?utf-8?B?UFdOYVN2UFFjVE5mMzA4YjdwVE9SMUVabDJuT0w5ZXJQSGJWU3d3NmE2MlNm?=
 =?utf-8?B?SWs1TDBmam5GNU5lR3VtamhoRjU1MURxQkhoWHRPaVZwK3JLYndqN1VPbWYr?=
 =?utf-8?B?Sy9sL20vZzYxRWpXTzB5ejZMSHhpNDk1SGJVN2traFl4SWEzSDN3ZU16Z3JJ?=
 =?utf-8?B?aWxoT3p2TGxSeUxPS1lScTRyQ2p0Q24yV3o3bWludzIrbU9zMzRvWDRsLzdZ?=
 =?utf-8?B?MDJVMSttOTFLWmpVZGZQNTg2dzZMNGl2aUNscEpja1B4YW9rcmY5bEJUT2Nx?=
 =?utf-8?B?TDhYZmp4R0tJbTNUbU81Vlhrd010MUdqUmxUcjlKTEpyakRKdXcrUFdpeTdE?=
 =?utf-8?B?R25tblowbU1Sc3ZKaG5udWlZSHdvVzRGbElCcGZ6VThudFlUNUhDbjR2aHhZ?=
 =?utf-8?B?T2FhV0R6bkJJTjl2ZWZZRkFoUU8rRFpEVWljdzgyTEtZZ1RYN2NENHVTcEdG?=
 =?utf-8?B?QlZTNWRLUlh2dGVjRlBsS1dkb3Z2eFFPaU1EaUZVaUhFcTNnV0hQaFZLTUQ0?=
 =?utf-8?B?dVQ1cnFWYlRoSFZJQnZZN3YxY3RaeGFPeGkrR1U3NGtDWmxrVHhheXRLcmZF?=
 =?utf-8?B?QjM4N245b3d3QWp5MS9SRGFjWk1tTEYzb21Bd3JvS1R2UkljWDcwdU55MXRi?=
 =?utf-8?B?ZnQxODcvOW00dUIxalgxODRyajA2cWlkYXRvQ1V3ajJTSkZlMVR0WWxhckwy?=
 =?utf-8?Q?oKjA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7ee9859-bbcc-4b58-c59e-08dbd3af191d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2023 10:01:59.6621
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0eY7HQfycBJd1IPn9xvTzxC61MFI/c7rQ0Ifmrkbu2BBOFkhiH0nqvEpK+aaLmfaHLOuyoyOjeAGGxbTTzsxVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8270
Subject: RE: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

DQoNCj4gRnJvbTogWmh1LCBMaW5nc2hhbiA8bGluZ3NoYW4uemh1QGludGVsLmNvbT4NCj4gU2Vu
dDogTW9uZGF5LCBPY3RvYmVyIDIzLCAyMDIzIDM6MTggUE0NCg0KDQo+ID4gTm8uIFBsZWFzZSBy
ZWFkIHRoZSByZXNwb25zZSBjYXJlZnVsbHkuDQo+ID4gSSBzYWlkICdGb3Igbm9uLWJhY2t3YXJk
IGNvbXBhdGlibGUgU0lPViBkZXZpY2Ugb2YgdGhlIGZ1dHVyZSwgeWVzLCB2aXJ0aW8tcGNpDQo+
IGNvbW1vbiBjb25maWcgKG5vbiBpbml0IHJlZ2lzdGVycykgc2hvdWxkIGJlIG1vdmVkIHRvIGEg
dnEsIGxvY2F0ZWQgb24gdGhlDQo+IG1lbWJlciBkZXZpY2UgZGlyZWN0bHkuJw0KPiA+IE5vdGlj
ZSB0aGUgJ21lbWJlciBkZXZpY2UgZGlyZWN0bHknLg0KPiA+IE5vdCB0aGUgUEYgYWRtaW4gdnEu
DQo+IEkgdGhpbmsgdGhpcyBpcyBhIHF1ZXN0aW9uIHRvIE1pY2hhZWwgYW5kIGhlIGFuc3dlcmVk
Lg0KPiANCj4gV2UgYXJlIHRhbGtpbmcgYWJvdXQgUENJLCBub3QgU0lPViwgZm9yIFNJT1Ygd2Ug
bmVlZCB0cmFuc3BvcnQgdnEuDQo+DQpIeXBlcnZpc29yIGZvciBmdXR1cmUgZGV2aWNlIGFuZCBm
dXR1cmUgZnVuY3Rpb25hbGl0eSBtdXN0IG5vdCBnZXQgaW52b2x2ZWQgaW4gbG9va2luZyB0aGUg
ZGV2aWNlIGNvbmZpZ3VyYXRpb24uDQpIZW5jZSwgYXMgbG9uZyBhcyB0cmFuc3BvcnQgdnEgaXMg
bG9jYXRlZCBvbiB0aGUgU0lPViBkZXZpY2UgaXRzZWxmIGZvciBub24tYmFja3dhcmQgaXRlbXMs
IGl0IGlzIGZpbmUgdG8gdHJhbnNwb3J0IFNJT1YgY29uZmlndXJhdGlvbi4NCkZvciBiYWNrd2Fy
ZCBjb21wYXRpYmlsaXR5IHB1cnBvc2UsIG9uZSB3aWxsIGJlIGFibGUgdG8gdXNlIHRoZSBhcSBv
ZiB0aGUgb3duZXIgZGV2aWNlLiBObyBuZWVkIHRvIGNyZWF0ZSBhIG5ldyB0cmFuc3BvcnQgVlEu
DQpUbyBjcmVhdGUgYSBhbm90aGVyIHRyYW5zcG9ydCB2cSwgbmVlZCB0byBjbGFyaWZ5IHRoZSBs
aW1pdGF0aW9ucyBvZiBhcSB0aGF0IHRyYW5zcG9ydCB2cSBjYW4gb3ZlcmNvbWUsIGFuZCB3aHkg
YXEgY2Fubm90IGJlIGV4dGVuZGVkIHRvIG92ZXJjb21lIGl0Lg0KIA0KPiBIZXJlIGFnYWluLCB3
ZSBhcmUgaW50cm9kdWNpbmcgYmFzaWMgZmFjaWxpdGllcyBmb3IgbGl2ZSBtaWdyYXRpb24sIGFu
ZCB0aGUNCj4gaW1wbGVtZW50YXRpb24gaXMgdHJhbnNwb3J0LXNwZWNpZmljLg0KTm90IHJlbGV2
YW50IGNvbW1lbnQuDQoNCj4gPg0KPiA+PiBDb25maWcgc3BhY2UgaXMgY29udHJvbCBwYXRoLCBE
TUEgaXMgZGF0YS1wYXRoLCBsZXQncyBiZXR0ZXIgbm90IG1peA0KPiA+PiB0aGVtLCB3ZSBuZXZl
ciBleHBlY3QgdG8gdXNlIGNvbmZpZyBzcGFjZSB0byB0cmFuc2ZlciBkYXRhLg0KPiA+Pg0KPiA+
IEFuZCB0aGF0IGNvbnRyb2wgcGF0aCBpcyBvbmx5IGZvciB0aGUgaW5pdCB0aW1lIGNvbmZpZ3Vy
YXRpb24gYXMNCj4gPiBjb3JyZWN0bHkgbGlzdGVkIGluIHRoZSB2aXJ0aW8gc3BlYyBhcywNCj4g
Pg0KPiA+ICIgRGV2aWNlIGNvbmZpZ3VyYXRpb24gc3BhY2Ugc2hvdWxkIG9ubHkgYmUgdXNlZCBm
b3IgaW5pdGlhbGl6YXRpb24tdGltZQ0KPiBwYXJhbWV0ZXJzLiIuDQo+IGRvbid0IHlvdSBrbm93
IG5ldyBmaWVsZCByZXNldF92cSBpcyBpbnRyb2R1Y2VkIHRvIHZpcnRpbyBjb21tb24gY2ZnPw0K
PiBUaGlzIGlzIG5vdCBvbmx5IGZvciBpbml0aWFsaXphdGlvbiwgcmlnaHQ/DQpSaWdodC4gSXQg
d2FzIHVuZm9ydHVuYXRlIGFuZCBhbHNvIGl0IHdhcyBsYXN0IG1vbWVudCBlbnRyeSB0aGF0IHdl
IGhhZCBmaXhlZCBpbiByZXNldCByZWdpc3RlciBwb2xhcml0eS4NCg0KPiANCj4gYW5kIHlvdXIg
Y2l0YXRpb24gaXMgZnJvbSBBcHBlbmRpeCBCLiBDcmVhdGluZyBOZXcgRGV2aWNlIFR5cGVzLCBh
cmUgd2UNCj4gY3JlYXRpbmcgYSBuZXcgZGV2aWNlIHR5cGU/DQpUaGF0IGlzIGd1aWRhbmNlIGZv
ciB0aGUgbmV3IGRldmljZSBjcmVhdGlvbiBvbiAiaG93IHRvIHVzZSBjb25maWcgc3BhY2U/Ig0K
SXQgZXF1YWxseSBhcHBsaWVkIHRvIGV4aXN0aW5nIGRldmljZXMgdG9vIHRvIG5vdCBncm93Lg0K
VGhlIHNlY3Rpb24gaXMgZXF1YWxseSBoZWxwZnVsIGZvciBuZXcgY3JlYXRvcnMgYW5kIGZvciBl
eHRlbmRpbmcgZGV2aWNlcyBsaWtlIHlvdSBhbmQgbWUgdG8gdW5kZXJzdGFuZCB3aGF0IG5vdCB0
byBwdXQgaW4gY29uZmlnIHNwYWNlLg0KDQo+ID4NCj4gPj4gU28gd2UgbmVlZCBETUEgdG8gdHJh
bnNmZXIgZGF0YSwgZm9yIGV4YW1wbGUgSSB0YWtlIGFkdmFudGFnZXMgb2YNCj4gPj4gZGV2aWNl
IERNQSB0byBsb2dnaW5nIGRpcnR5IHBhZ2VzLCBUaGlzIGFsc28gYXBwbGllcyB0byBpbi1mbGln
aHQgZGVzY3JpcHRvcnMuDQo+ID4+DQo+ID4gQ2FuIHlvdSBwbGVhc2UgZXhwbGFpbiB2aWEgdmly
dHF1ZXVlIGNhbm5vdCBiZSB1c2VkIGZvciBETUEgYnVsayBkYXRhDQo+IHRyYW5zZmVyIGFzIGxp
c3RlZCBpbiB2aXJ0aW8gc3BlYy4NCj4gPg0KPiA+ICIgVGhlIG1lY2hhbmlzbSBmb3IgYnVsayBk
YXRhIHRyYW5zcG9ydCBvbiB2aXJ0aW8gZGV2aWNlcyBpcyBwcmV0ZW50aW91c2x5DQo+IGNhbGxl
ZCBhIHZpcnRxdWV1ZSINCj4gd2hhdCBpcyB5b3VyIHBvaW50PyB2cSBjYW4gZG8gRE1BLCBzbyB3
aGF0Pw0KSSBhbSBhc2tpbmcsDQpJZiB0aGVyZSBpcyBBUSBvbiB0aGUgbWVtYmVyIGRldmljZSwg
Y2FuIHlvdSB1c2UgaXQ/IElmIG5vdCwgd2hhdCBpcyB0aGUgdGVjaG5pY2FsIHJlYXNvbihzKSB0
byBub3QgdXNlIGl0Lg0K

