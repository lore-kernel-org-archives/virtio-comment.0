Return-Path: <virtio-comment-return-7938-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25394C25B48
	for <virtio-comment@archiver.kernel.org>; Tue, 24 Oct 2023 10:37:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9094C7C929
	for <virtio-comment@archiver.kernel.org>; Tue, 24 Oct 2023 10:37:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 73CF69869A9
	for <virtio-comment@archiver.kernel.org>; Tue, 24 Oct 2023 10:37:56 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 66F5698699F; Tue, 24 Oct 2023 10:37:56 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 581D69869A0
	for <virtio-comment@lists.oasis-open.org>; Tue, 24 Oct 2023 10:37:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N9eZzpV5+s5LmVQadMb6Yd7vx7P8GAmnKluRxcvlYMnMuqyrYJLimDwvQRnZa0wZ0Qo82WuXqWSwIiq4p3ESzC7Fhzyw3+LCoKy5ODcwKLdRAlBoeM2LPJu5Dr6jGtGuC/tjkXA2SIU7H0MyjUi6SMXgaWoOWzkMaLYfdCVVu6EzLmfDeRWDKzt+9ltgAl/H/TOn6Cyfz59BGA0WuAzKalHfydaZiPKcrHttVCyWGTQDlwpXkVlrCeH7ocIIzcCwAzehBkSWXyYN3ap5WpHsmfJC8lMLSchPspEjrLUrbc75A/1XqOa1aLzMlJmlvTqlbSzL6HOQAnB8mH2bjceyYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZVcSWRpTdsULNX95dgQHOB6TEiOQGLoZWma6Mls8xfU=;
 b=fqoirABrAx649Lu5sp2rrpMp8MJmxEwznNGHoTNBsOdB0BOcaJgv4EzNzdRhlNJRY5/ZC/WMt5wGs7lpTK0jJ4Q//AJ//02rDaI7xtMP+1Ex7Pn6+6MD4ef9KMBrRZsBEiTveUVN6EL8eMeeMdZYWQ6t9Op+2FwrWZYHojeEuDt3ygBGZTQF8FpP3wfYj2Scg/NMVOwFw1ERj0QNuXvPgDIyAB5ZgfsxF+ikf7xU7+9HZlT5GQqlUDPxaUmHSO15Xc4JSjwjdWn+ZxSEpNAaEG+ER9GI2KfiXS+VUGiYFpgsg+4+eti3kjZ1CstdQzlsbfhpkAhjje8OSrmdc30oxQ==
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
 AQHZ+dpHSUrTyyDEA0quapQP8C0hdbA/xRkAgAF/hoCAACxh4IABSWcAgAANqrCAAZnYAIAACyKAgAGFBICAAACFkIAAEwWAgAAD8yCAAXZ1gIAAIYLAgASWeYCAAtRh8IAAGoeAgAAAUKCAAARLAIAAB5cQgAAXYICAAABqYIABiiSAgAAMdcCAAALCgIAAADWggAABTwCAAAD9AIAAAmrwgAGTbICAADeVYIAEiiUAgAAAXICAAZfSAIAAAE8w
Date: Tue, 24 Oct 2023 10:37:52 +0000
Message-ID:
 <PH0PR12MB54815B589B8F5489FB493465DCDFA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <829d27f8-1d9b-4a1e-93a8-a14da626f4a7@intel.com>
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
 <PH0PR12MB5481033BB7C0BCABAE329B13DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f9a604b2-7bc9-49ce-bd28-59909f0a5fec@intel.com>
In-Reply-To: <f9a604b2-7bc9-49ce-bd28-59909f0a5fec@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|MN6PR12MB8592:EE_
x-ms-office365-filtering-correlation-id: 0c309476-765a-4049-8388-08dbd47d469d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 wwWgO1DREl02XZfsQeo0EINjd9Q2/U4MymYukCdqstJCJPJkvuzAWlXWdShKihd8fHZneEnEcSfmqW6KibXbivuP2T1Yu4kqHBNLqzQYtTA9oLbtcV60T4w2MsLPWITyxQdvU25EYOHrD/fWCXtwS9BbSyQPTXL8LGK9KQihlrdO1E84S4wFyo8HaovVkVzoITWIKMGVyh2Q1v2wtDZSbQXxia/b6qawVqB3ZDlecPaYScihUwO8YEwQcKjLcBoWvfANWd4gIqZC219flex8tqDrO90KPAtAj6SWDKG4JixBrhnFekwBGUXKaRRMXWwSDj/FtB/yHWQele9k18fzbmWsItI1u4turUQmZIfhCXR3m7U76LrNpVdmcCga4d8/Z31HvNznY5kBOZdTMyAk5ZYyZzqBbnxF0Zul/xjUYLVjCnpzl/4AEDV12w+O55yn5acjbLYTqm8Cch6j1AzF84XRZMuwXOAnrXzq/0d7hkSCYgNlnuqbZppVdrAFc5GSoiLk7erpArPjqgtv7Ki6jKLOcb5PS23QIq9QjcYrLeDPR6ra7OJaaF6FYZjG+hiEUKQ5XmRA0K+UJnBsMGT+aUCsYvUqphoHzXOig+hWWabv1msieNWKjtbLBPmHOqFg30NI0s2mveoiZsXpaMP5w9wwZJmpr5Ae7RFqQDFW35g=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(39860400002)(136003)(376002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(2906002)(55016003)(38100700002)(122000001)(66476007)(110136005)(66446008)(66556008)(316002)(64756008)(76116006)(66946007)(6506007)(107886003)(54906003)(71200400001)(478600001)(7696005)(9686003)(966005)(53546011)(83380400001)(52536014)(86362001)(5660300002)(4326008)(33656002)(8936002)(8676002)(41300700001)(38070700009)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z0FtbFR3b2E1eGJ5SzNkYjd0bGNBVGc3VE1HZ0tqQXNveDlURld2N2ozM3No?=
 =?utf-8?B?U0czTXFjMEprSDRVT2hHZ1BuU01MTi9MQWdiS3FzeHIvQkM1MnlFWkFBd01q?=
 =?utf-8?B?cjcvQ0ovTGIza0ZXYm1mQlRBNWloUUx5dGNkR3AvbXloNCt4NCtmS2Y3ZGpz?=
 =?utf-8?B?TEllMkgzeXFLWkFGcHk1elR2dko4R05qOUttTEVWV3ZwRUh3RS9zMWNnYzNu?=
 =?utf-8?B?ZElOUjdEREpWNlNla2VodVE2YUxGSlA5TFc4VWgreVQxZm5pRHR1emhadm82?=
 =?utf-8?B?V2kxUnJZTC9mWUdQNmFmbG0wdjFXYTI5eHc2VldpZFZVNnBvSmRobTBOL2ND?=
 =?utf-8?B?UFMvZWxjaEZ3d1hHNzJVamZJdTM5QkNzTmxRSzZ4aGU3bFJWMHZ0UTUzRWVp?=
 =?utf-8?B?L1NoQllReHIySDBwTHgwejJvMGxYZ3IwVHBseDdESE04MUQrVDBXZlpRRUdG?=
 =?utf-8?B?aldUa2szbGRFcHplK2VrMlNGUnNqbThtcGZTM2dCejVRUWtWYSt2MlArSlFB?=
 =?utf-8?B?RTA5dFpSNVl4a2ZyRktFdEJpdUg5Q3ZIcXdxUm82dXljTk9MQnl1eU42MnRt?=
 =?utf-8?B?MUlpMGtiTGhabm90MXo2VGIxOHZwK2dQRTl1T0ZZdzVCdXBkeUFMREhhaTNm?=
 =?utf-8?B?NGZ1THBoRElsemdtZ1BYN2ZXSTl2N0dON3I3UlRVVlN4ZkNPVTR6U1dMRHVZ?=
 =?utf-8?B?ODh5OW9JTk1ReCt2bTZEN05seFYyUzBSODV6bXhBalBuN01wdFE1ZW1iUlFH?=
 =?utf-8?B?VlRPdHFpMG82OGlhQVE2YXc0bCsxSUwzRVh0b20xZlZrTFFwYWhSTkJSd09L?=
 =?utf-8?B?Wlg3L1c5UXB4UzZGS0hUY0lhendiRFVQam9kY0tuMVl6WGRoS1poaXFQOTJW?=
 =?utf-8?B?R3MzMEdTaWpGSnFrQ3dGSy9YV2NVNGlRb24yTlI5bi93TWdwaWZZZ3pKcGRr?=
 =?utf-8?B?TGdNQitPVm93bXcwcHdsWmdIMWRZNHR4NlJ0UjdDWkZOUVR1Q09VZ3loWFV5?=
 =?utf-8?B?OW1WYzQwbkZEY1ptZ3ZwNEVPd0duRHRSVWFQQzAybEU3R21YZWsySmFDbXE2?=
 =?utf-8?B?QUV2STVWVStQWkpjRkRFMEV0OWIzS0ZuWTRuRmZqUENwTDRsc0ZhbXg5L0JH?=
 =?utf-8?B?ejFqTmgwY1U1S0xhQWlkTGFmYzJWSm1iWXIvSVdlS3FEV05ldHZ5TTBVZ1Z6?=
 =?utf-8?B?R0lWL2JwVEF6WHRxQlJDdHVqVmhGQUYyQWsySGlxdENMcnJWaVZmWE9RUGdh?=
 =?utf-8?B?L3pXdnVldzkrUnc3K0JzVEVCd2l0c0lwVENNWk45OHFBYzAwRGxEZzZjamln?=
 =?utf-8?B?YXZ2TmFJay9FTkkybTVRQndRdm5UaWx2U2NIS3YrZWgwZlluZ2k1WXVLUnBo?=
 =?utf-8?B?MDRWWWdlR2FsaUwwUXBib2Y4U05OOUtpUlNtL1Q0aDBiSklzOFpQVk9YTjFM?=
 =?utf-8?B?TGUzK2hsR0w4NEZ4RGJMZWtMUGlIaWNEeVkxcHFPaWFZaU9XS0lBQ1pNbzBx?=
 =?utf-8?B?L3FjWFFGemFaWDhZVU9idUNMbTZlOGFMZ3p5SHFZNStLeThzWk5kRzlGWDM5?=
 =?utf-8?B?eUpxQkx6UlZZb0t6NW9YS0pJUmlsZzdBek9NNGZaRE9zeVNabEhDL2lFRGRZ?=
 =?utf-8?B?aCt3aysyRWxnamNsNEJRYXY1NjJVZytYWGRRTGFhMVd4dS9YR2JKcDBDRTM0?=
 =?utf-8?B?UlFGUnFKSFF2cEVrdmVuNVZ1bmRHbmd0TUlXSGRmdG13LzJ3QmltWnJCMXJF?=
 =?utf-8?B?bmRtb3psUWcyUE11alVxdHBhVzN0dW1aUFQ5K0JqQWVxcnFLRldiZC9JT1JR?=
 =?utf-8?B?WFVyYlJLQnZtbmN0U3had0VRbXd2SWFKbmVLQjlJNGlLMkU4cjVEZ2xVbTlu?=
 =?utf-8?B?VVN6aVNzUWFVY2xoNnhNd1ZlVDIxTi9NUW9XcktPUTlxN0FYYy91TkwybGt3?=
 =?utf-8?B?VWNXMG5HVy9PVnVTQUpUQWE5anZqdHY0RUQzT20xcXBXaDRQRWpPZmJBSU05?=
 =?utf-8?B?Q1ZsdCsxNDYvWEVsalNmMFBDTW51b1ovd1pYaURyamk5WFNUVnpOTmk5TkZV?=
 =?utf-8?B?MUtYbWpsN0NGSTlrcSs0SUg5bGJmOGhtK2ZCaThuOEdGK2JUR3lFYVovQXZt?=
 =?utf-8?Q?AH4U=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c309476-765a-4049-8388-08dbd47d469d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2023 10:37:52.3766
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MsAdukTor5jDFsIe08OjfMZ5YsuAnIuBNKldNhR4QBPbT2xHYIA3rjxV27Qw8DVHmYkb1Pcqh5lIuOidRqbyJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8592
Subject: RE: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

DQo+IEZyb206IFpodSwgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+DQo+IFNlbnQ6
IFR1ZXNkYXksIE9jdG9iZXIgMjQsIDIwMjMgNDowMCBQTQ0KPiANCj4gT24gMTAvMjMvMjAyMyA2
OjE0IFBNLCBQYXJhdiBQYW5kaXQgd3JvdGU6DQo+ID4+IEZyb206IFpodSwgTGluZ3NoYW4gPGxp
bmdzaGFuLnpodUBpbnRlbC5jb20+DQo+ID4+IFNlbnQ6IE1vbmRheSwgT2N0b2JlciAyMywgMjAy
MyAzOjM5IFBNDQo+ID4+DQo+ID4+IE9uIDEwLzIwLzIwMjMgODo1NCBQTSwgUGFyYXYgUGFuZGl0
IHdyb3RlOg0KPiA+Pj4+IEZyb206IFpodSwgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBpbnRlbC5j
b20+DQo+ID4+Pj4gU2VudDogRnJpZGF5LCBPY3RvYmVyIDIwLCAyMDIzIDM6MDEgUE0NCj4gPj4+
Pg0KPiA+Pj4+IE9uIDEwLzE5LzIwMjMgNjozMyBQTSwgUGFyYXYgUGFuZGl0IHdyb3RlOg0KPiA+
Pj4+Pj4gRnJvbTogWmh1LCBMaW5nc2hhbiA8bGluZ3NoYW4uemh1QGludGVsLmNvbT4NCj4gPj4+
Pj4+IFNlbnQ6IFRodXJzZGF5LCBPY3RvYmVyIDE5LCAyMDIzIDI6NDggUE0NCj4gPj4+Pj4+DQo+
ID4+Pj4+PiBPbiAxMC8xOS8yMDIzIDU6MTQgUE0sIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToN
Cj4gPj4+Pj4+PiBPbiBUaHUsIE9jdCAxOSwgMjAyMyBhdCAwOToxMzoxNkFNICswMDAwLCBQYXJh
diBQYW5kaXQgd3JvdGU6DQo+ID4+Pj4+Pj4+PiBPaCwgcmVhbGx5PyBRdWl0ZSBpbnRlcmVzdGlu
ZywgZG8geW91IHdhbnQgdG8gbW92ZSBhbGwgY29uZmlnDQo+ID4+Pj4+Pj4+PiBzcGFjZSBmaWVs
ZHMgaW4gVkYgdG8gYWRtaW4gdnE/IEhhdmUgYSBwbGFuPw0KPiA+Pj4+Pj4+PiBOb3QgaW4gbXkg
cGxhbiBmb3Igc3BlYyAxLjQgdGltZSBmcmFtZS4NCj4gPj4+Pj4+Pj4gSSBkbyBub3Qgd2FudCB0
byBkaXZlcnQgdGhlIGRpc2N1c3Npb24sIHdvdWxkIGxpa2UgdG8gZm9jdXMgb24NCj4gPj4+Pj4+
Pj4gZGV2aWNlDQo+ID4+Pj4+PiBtaWdyYXRpb24gcGhhc2VzLg0KPiA+Pj4+Pj4+PiBMZXRzIHBs
ZWFzZSBkaXNjdXNzIGluIHNvbWUgb3RoZXIgZGVkaWNhdGVkIHRocmVhZC4NCj4gPj4+Pj4+PiBQ
b3NzaWJseSwgaWYgdGhlcmUncyBhIHdheSB0byBzZW5kIGFkbWluIGNvbW1hbmRzIHRvIHZmIGl0
c2VsZg0KPiA+Pj4+Pj4+IHRoZW4gTGluZ3NoYW4gd2lsbCBiZSBoYXBweT8NCj4gPj4+Pj4+IHN0
aWxsIG5lZWQgdG8gcHJvdmUgd2h5IGFkbWluIGNvbW1hbmRzIGFyZSBiZXR0ZXIgdGhhbiByZWdp
c3RlcnMuDQo+ID4+Pj4+IFZpcnRpbyBzcGVjIGRldmVsb3BtZW50IGlzIG5vdCBwcm9vZiBiYXNl
ZCBhcHByb2FjaC4gUGxlYXNlIHN0b3ANCj4gPj4+Pj4gYXNraW5nIGZvcg0KPiA+PiBpdC4NCj4g
Pj4+Pj4gSSB0cmllZCBteSBiZXN0IHRvIGhhdmUgdGVjaG5pY2FsIGFuc3dlciBpbiBbMV0uDQo+
ID4+Pj4+IEkgZXhwbGFpbmVkIHRoYXQgcmVnaXN0ZXJzIHNpbXBseSBkbyBub3Qgd29yayBmb3Ig
cGFzc3Rocm91Z2ggbW9kZQ0KPiA+Pj4+PiAoaWYgdGhpcyBpcyB3aGF0IHlvdSBhcmUgYXNraW5n
IHdoZW4geW91IGFyZSBhc2tpbmcgcHJvdmUgaXRzIGJldHRlcikuDQo+ID4+Pj4+IFRoZXkgY2Fu
IHdvcmsgZm9yIG5vbl9wYXNzdGhyb3VnaCBtZWRpYXRlZCBtb2RlLg0KPiA+Pj4+Pg0KPiA+Pj4+
PiBBIG1lbWJlciBkZXZpY2UgbWF5IGRvIGFkbWluIGNvbW1hbmRzIHVzaW5nIHJlZ2lzdGVycy4g
TWljaGFlbCBhbmQNCj4gPj4+Pj4gSSBhcmUNCj4gPj4+PiBkaXNjdXNzaW5nIHByZXNlbnRseSBp
biB0aGUgc2FtZSB0aHJlYWQuDQo+ID4+Pj4+IFNpbmNlIHRoZXJlIGFyZSBtdWx0aXBsZSB0aGlu
Z3MgdG8gYmUgZG9uZSBmb3IgZGV2aWNlIG1pZ3JhdGlvbiwNCj4gPj4+Pj4gZGVkaWNhdGVkDQo+
ID4+Pj4gcmVnaXN0ZXIgc2V0IGZvciBlYWNoIGZ1bmN0aW9uYWxpdHkgZG8gbm90IHNjYWxlIHdl
bGwsIGhhcmQgdG8NCj4gPj4+PiBtYWludGFpbiBhbmQgZXh0ZW5kLg0KPiA+Pj4+PiBBIHJlZ2lz
dGVyIGhvbGRpbmcgYSBjb21tYW5kIGNvbnRlbnQgbWFrZSBzZW5zZS4NCj4gPj4+Pj4NCj4gPj4+
Pj4gTm93LCB3aXRoIHRoYXQsIGlmIHRoaXMgY2FuIGJlIHVzZWZ1bCBvbmx5IGZvciBub25fcGFz
c3Rocm91Z2gsIEkNCj4gPj4+Pj4gbWFkZSBodW1ibGUNCj4gPj4+PiByZXF1ZXN0IHRvIHRyYW5z
cG9ydCB0aGVtIHVzaW5nIEFRLCB0aGlzIHdheSwgeW91IGdldCBhbGwgYmVuZWZpdHMgb2YgQVEu
DQo+ID4+Pj4+IEFuZCB0cnlpbmcgdG8gdW5kZXJzdGFuZCwgd2h5IEFRIGNhbm5vdCBwb3NzaWJs
ZSBvciBpbmZlcmlvcj8NCj4gPj4+Pj4NCj4gPj4+Pj4gSWYgeW91IGhhdmUgY29tbWFuZHMgbGlr
ZSBzdXNwZW5kL3Jlc3VtZSBkZXZpY2UsIHJlZ2lzdGVyIG9yIHF1ZXVlDQo+ID4+Pj4gdHJhbnNw
b3J0IHNpbXBseSBkb27igJl0IHdvcmssIGJlY2F1c2UgaXQncyB3cm9uZyB0byBiaWZ1cmNhdGUg
dGhlDQo+ID4+Pj4gZGV2aWNlIHdpdGggc3VjaCB3ZWlyZCBBUEkuDQo+ID4+Pj4+IElmIHlvdSB3
YW50IHRvIGJpZmVyYWNhdGUgZm9yIG1lZGlhdGlvbiBzb2Z0d2FyZSwgaXQgcHJvYmFibHkNCj4g
Pj4+Pj4gbWFrZXMgc2Vuc2UgdG8NCj4gPj4+PiBvcGVyYXRlIGF0IGVhY2ggVlEgbGV2ZWwsIGNv
bmZpZyBzcGFjZSBsZXZlbC4gU3VjaCBhcmUgdmVyeQ0KPiA+Pj4+IGRpZmZlcmVudCBjb21tYW5k
cyB0aGFuIHBhc3N0aHJvdWdoLg0KPiA+Pj4+PiBJIHRoaW5rIHZkcGEgaGFzIGRlbW9uc3RyYXRl
ZCB0aGF0IHZlcnkgd2VsbCBvbiBob3cgdG8gZG8gc3BlY2lmaWMNCj4gPj4+Pj4gd29yayBmb3IN
Cj4gPj4+PiBzcGVjaWZpYyBkZXZpY2UgdHlwZS4gU28gc29tZSBvZiB0aG9zZSB3b3JrIGNhbiBi
ZSBkb25lIHVzaW5nIEFRLg0KPiA+Pj4+PiBbMV0NCj4gPj4+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvdmlydGlvLWNvbW1lbnQvODcwYWNlMDItZjk5Yy00NTgyLTkzMmYtYmQxDQo+ID4+Pj4+
IDAzDQo+ID4+Pj4+IDM2DQo+ID4+Pj4+IDJkYWU5QGludGVsLmNvbS9ULyNtMzc3NDNhYTkyNDUz
NmQwMjU2ZDZiM2I4ZTgzYTExYzc1MGYyODc5NA0KPiA+Pj4+IFdlIGhhdmUgYmVlbiB0aHJvdWdo
IHlvdXIgc3RhdGVtZW50IGZvciBtYW55IHRpbWVzLg0KPiA+Pj4+IFRoaXMgaXMgbm90IGFib3V0
IGhvdyBtYW55IHRpbWVzIHlvdSByZXBlYXRlZCwgaWYgeW91IHRoaW5rIHRoaXMgaXMNCj4gPj4+
PiB0cnVlLCB5b3UgbmVlZCB0byBwcm92ZSB0aGF0IHdpdGggc29saWQgZXZpZGVuY2UuDQo+ID4+
Pj4NCj4gPj4+IEkgd2lsbCBub3QgcmVzcG9uZCB0byB0aGlzIGNvbW1lbnQgYW55bW9yZS4NCj4g
Pj4gT2sgaWYgeW91IGNob29zZSBub3QgdG8gcmVzcG9uZC4NCj4gPj4+PiBGb3IgcGFzcy10aHJv
dWdoLCBJIHN0aWxsIHJlY29tbWVuZCB5b3UgdG8gdGFrZSBhIHJlZmVyZW5jZSBvZg0KPiA+Pj4+
IGN1cnJlbnQgdmlyaXRvLXBjaSBpbXBsZW1lbnRhdGlvbiwgaXQgd29ya3MgZm9yIHBhc3MtdGhy
b3VnaCwgcmlnaHQ/DQo+ID4+PiBXaGF0IGRvIHlvdSBtZWFuIGJ5IGN1cnJlbnQgdmlydGlvLXBj
aSBpbXBsZW1lbnRhdGlvbj8NCj4gPj4gY3VycmVudCB2aXJpdG8tcGNpIHdvcmtzIGZvciBwYXNz
LXRocm91Z2gNCj4gPiBJIHN0aWxsIGRvbuKAmXQgdW5kZXJzdGFuZCB3aGF0IGlzICJjdXJyZW50
IHZpcnRpby1wY2kiLg0KPiA+IERvIHlvdSBtZWFuIHFlbXUgaW1wbGVtZW50YXRpb24gb2YgZW11
bGF0ZWQgdmlydGlvLXBjaSBvciB5b3UgbWVhbg0KPiB2aXJ0aW8tcGNpIHNwZWNpZmljYXRpb24g
Zm9yIHBhc3N0aHJvdWdoPw0KPiA+IFdoYXQgZG8geW91IHdhbnQgbWUgdG8gcmVmZXIgdG8gZm9y
IHBhc3N0aHJvdWdoPyBQbGVhc2UgY2xhcmlmeS4NCj4geW91IGtub3cgZ3Vlc3QgdmNwdSBhbmQg
aXRzIHZSQyBjYW4gbm90IGFjY2VzcyBob3N0IHNpZGUgZGV2aWNlcywgYW5kIHRoZXJlDQo+IG11
c3QgYmUgYSBkcml2ZXIgaGVscGluZyB0aGUgcGFzcy10aHJvdWdoIHVzZSBjYXNlcywgbGlrZSB2
RFBBIGFuZCB2ZmlvDQpJIGFtIG5vdCBzdXJlIGhvdyB0byBjb3JlbGF0ZSB0aGlzIGFuc3dlciB0
byB0aGUgcXVlc3Rpb24gb2YgInZpcnRpby1wY2kgZm9yIHBhc3N0aHJvdWdoIi4NCjooDQoNClRv
ZGF5IHdoZW4gYSB2aXJ0aW8tcGNpIG1lbWJlciBkZXZpY2UgaXMgcGFzc3Rocm91Z2ggdG8gdGhl
IGd1ZXN0IFZNLCBoeXBlcnZpc29yIGlzIG5vdCBpbnZvbHZlZCBpbiB2aXJ0aW8gaW50ZXJmYWNl
IHN1Y2ggYXMgY29uZmlnIHNwYWNlLCBjdnEsIGRhdGEgdnEgZXRjLg0KRG8geW91IGFncmVlPw0K
DQo+ID4+Pj4gRm9yIHNjYWxlLCBJIGFscmVhZHkgdG9sZCB5b3UgZm9yIG1hbnkgdGltZXMgdGhh
dCB0aGV5IGFyZQ0KPiA+Pj4+IHBlci1kZXZpY2UgZmFjaWxpdGllcy4gSG93IGNhbiBhIHBlci1k
ZXZpY2UgZmFjaWxpdHkgbm90IHNjYWxlPw0KPiA+Pj4gRWFjaCBWRiBkZXZpY2UgbXVzdCBpbXBs
ZW1lbnQgbmV3IHNldCBvZiBvbi1jaGlwIG1lbW9yeS1iYXNlZA0KPiA+Pj4gcmVnaXN0ZXJzDQo+
ID4+IHdoaWNoIGRlbWFuZHMgbW9yZSBwb3dlciwgZGllIGFyZWEgd2hpY2ggZG9lcyBub3Qgc2Nh
bGUgZWZmaWNpZW50bHkNCj4gPj4gdG8gdGhvdXNhbmRzIG9mIFZGcy4NCj4gPj4gdGhhdCBjYW4g
YmUgZnBnYSBnYXRlcyBvciBTT0MgaW1wbGVtZW50aW5nIG5ldyBmZWF0dXJlcywgeW91IHRoaW5r
DQo+ID4+IHRoYXQgaXMgYSB3YXN0ZT8NCj4gPiBJdCBpcyB3YXN0ZSBpbiBodywgaWYgdGhlcmUg
aXMgYSBiZXR0ZXIgYXBwcm9hY2ggcG9zc2libGUgdG8gbm90IGJ1cm4gdGhlbSBhcw0KPiBnYXRl
cyBhbmQgc2F2ZSBvbiByZXNvdXJjZXMgZm9yIHJhcmVseSB1c2VkIGl0ZW1zLg0KPiBJcyBhIG5l
dyBlbnRyeSBpbiBNU0lYIHRhYmxlIGEgd2FzdGUgb2YgSFc/DQpOb3QgYXMgbXVzdCBhcyBleGlz
dGluZyBNU0ktWCB0YWJsZSBlbnRyaWVzIHdoaWNoIHJlcXVpcmVzIGxpbmVhciBhbW91bnQgb2Yg
b24tY2hpcCBtZW1vcnkuDQoNCj4gQ2FuIEkgc2F5IGltcGxlbWVudGluZyBhZG1pbiB2cSBpbiBT
T0MgaXMgYSB3YXN0ZSBvZiBjb3Jlcz8NCldoaWNoIGNvcmVzIGluIHRoZSBTb0M/DQpJZiBpdCBp
cyBvbiB0aGUgUEYsIHRoZXJlIGlzIG9ubHkgaGFuZGZ1bCBvZiBBUXMgZm9yIHNjYWxlIG9mIE4g
VkZzLg0KDQo+ID4NCj4gPg0KPiA+Pj4+IHZEUEEgd29ya3MgZmluZSBvbiBjb25maWcgc3BhY2Uu
DQo+ID4+Pj4NCj4gPj4+PiBTbywgaWYgeW91IHN0aWxsIGluc2lzdCBhZG1pbiB2cSBpcyBiZXR0
ZXIgdGhhbiBjb25maWcgc3BhY2UgbGlrZQ0KPiA+Pj4+IGluIG90aGVyIHRocmVhZCB5b3UgaGF2
ZSBjb25jbHVkZWQsIHlvdSBtYXkgaW1wbHkgdGhhdCBjb25maWcgc3BhY2UNCj4gPj4+PiBpbnRl
cmZhY2VzIHNob3VsZCBiZSByZS1mYWN0b3JlZCB0byBhZG1pbiB2cS4NCj4gPj4+IFdoYXRldmVy
IGlzIGRvbmUgaW4gcGFzdCBpcyBkb25lLCB0aGVyZSBpcyBubyB3YXkgdG8gY2hhbmdlIGhpc3Rv
cnkuDQo+ID4+PiBBbiBuZXcgbm9uIGluaXQgdGltZSByZWdpc3RlcnMgc2hvdWxkIG5vdCBiZSBw
bGFjZWQgaW4gZGV2aWNlDQo+ID4+PiBzcGVjaWZpYyBjb25maWcNCj4gPj4gc3BhY2UgYXMgdmly
dGlvIHNwZWMgaGFzIGNsZWFyIGd1aWRlbGluZSBvbiBpdCBmb3IgZ29vZC4NCj4gPj4+IERldmlj
ZSBjb250ZXh0IHJlYWRpbmcsIGRpcnR5IHBhZ2UgYWRkcmVzcyByZWFkaW5nLCBjaGFuZ2luZyB2
Zg0KPiA+Pj4gZGV2aWNlIG1vZGVzLA0KPiA+PiBhbGwgb2YgdGhlc2UgYXJlIGNsZWFybHkgbm90
IGEgaW5pdCB0aW1lIHNldHRpbmdzLg0KPiA+Pj4gSGVuY2UsIHRoZXkgZG8gbm90IGJlbG9uZyB0
byB0aGUgcmVnaXN0ZXJzLg0KPiA+PiByZXNldCB2cT8gYW5kIHlvdSBnZXQgaXQgZnJvbSBBcHBl
bmRpeCBCLiBDcmVhdGluZyBOZXcgRGV2aWNlIFR5cGVzLA0KPiA+PiBhcmUgd2UgaW1wbGVtZW50
aW5nIGEgbmV3IHR5cGUgb2YgZGV2aWNlPz8/DQo+ID4gSSBkb27igJl0IHVuZGVyc3RhbmQgeW91
ciBxdWVzdGlvbi4NCj4gPiBJIHJlcGxpZWQgdGhlIGhpc3Rvcnkgb2YgcmVzZXRfdnEuDQo+ID4g
VGFrZSBnb29kIGV4YW1wbGVzIHRvIGZvbGxvdywgcmVzZXRfdnEgY2xlYXJseSBpcyBub3QgdGhl
IG9uZS4NCj4gc28gYWdhaW4sIHdlIGFyZSBub3QgaW1wbGVtZW50aW5nIG5ldyBkZXZpY2UgdHlw
ZSwgc28geW91ciBjaXRhdGlvbiBkb2Vzbid0DQo+IGFwcGx5Lg0KSSBkaXNhZ3JlZS4NCkkgYW0g
ZW5naW5lZXIgdG8gYnVpbGQgcHJhY3RpY2FsIHN5c3RlbXMgY29uc2lkZXJpbmcgbGltaXRhdGlv
bnMgYW5kIGFsc28gYWR2YW5jZW1lbnRzIG9mIHRoZSB0cmFuc3BvcnQ7IHdoaWxlIGxpc3Rlbmlu
ZyB0byBvdGhlciBpbmR1c3RyeSBlZmZvcnRzLA0KSSBhbSBubyBmcm9tIGxlZ2FsIGRlcGFydG1l
bnQuDQpIZW5jZSwgQXBwZW5kaXggQiBtYWtlcyBhIHNlbnNlIHRvIG1lIHRvIGFwcGx5IHRvIHRo
ZSBleGlzdGluZyBkZXZpY2Ugd2hpY2ggYWxzbyBoYXMgdGhlIHNlY3Rpb24gZm9yICJkZXZpY2Ug
aW1wcm92ZW1lbnRzIi4NCg==

