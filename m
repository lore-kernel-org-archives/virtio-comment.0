Return-Path: <virtio-comment-return-8031-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C248CC4332F
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 04:50:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1887C2B039
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 04:50:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E082E986B1F
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 04:50:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BECED98636F; Mon, 30 Oct 2023 04:50:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 18AF8986A82
	for <virtio-comment@lists.oasis-open.org>; Mon, 30 Oct 2023 04:49:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E4k9TaUYA4c6Sj5hl3bflUoZl5NUDAbrgwXJpUmSeTa/0UfjOnkfRzpyxMZOQNdd0ZazLzos6SUDZ9q+n3JmSmKBACFwiQyhLVAjjZ9oQekOL6LVKIpukqTnaza6M70/apNz8n/TzwbOZtOxP9SQ6hzdzBA6FKDXqGvj94d5/LCmXAaYDZCKlRhw32/+3f/qklcjhVBS5z9Sz2pmE4/mLm20+F+RaN8Whtgocxx6hhInjm1L68E7djLqNdDxiZ8LJKycDqpLoU5DDPWA9tYqHswK7psaYXuQ9nnmAUv/IIjrQ1+snoOQqqARTmI/mYPIISqbwHy+OKd5mReB+/XHmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G6ZDs3o+dOvz4QZQ6TMniTn/dwiJN/xJx/dUf3gxz34=;
 b=K7YR3V2gzJM48Hlc63hUHIEwGI0K3ATgdRFvW/kTLbnnOktwmj7/vCe+UlVQfv3q9ML70H9l0R658CF0rrpCTCXXtwuZXoBkBQGszHihKyNGDbcsH0MeLYHPf1J0pCgcwDss+JVaZT8o4BMj0x8eAYA73GU9Vi7sowXHC3TK4on50Od+T7na5RdFnyun+AxMgNvafM0D9VfPbG907ohlnh/sAD8e1/zVLm/9oN0XtViOxifkWeaMhHhH+n383TT3I4si/BYW8W02Dp2F2IBrRTMbUfms4iPQveBPfySlqQINlvblAB/yKGshg5W14ugBsJvjmiuy/YkhF27RTEx/fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
CC: "Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com"
	<sburla@marvell.com>, Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb
	<maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Thread-Topic: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration
Thread-Index:
 AQHZ+dpHSUrTyyDEA0quapQP8C0hdbA/xRkAgAF/hoCAACxh4IABSWcAgAANqrCAAZnYAIAACyKAgAGFBICAAACFkIAAEwWAgAAD8yCAAXZ1gIAAIYLAgASWeYCAAtRh8IAAGoeAgAAAUKCAAARLAIAAB5cQgAAXYICAAABqYIABiiSAgAAMdcCAAALCgIAAADWggAABTwCAAAD9AIAAAmrwgAGTbICAAALdAIAAGU2AgAHbxICAAsgMAIAAGOUAgAGAHQCAAXKpAIABEquAgAAxULCABksVAIAADW1A
Date: Mon, 30 Oct 2023 04:49:36 +0000
Message-ID:
 <PH0PR12MB54818D4FC7F5C80FD9E76251DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231019051406-mutt-send-email-mst@kernel.org>
 <daea1f54-1c85-4a4a-ac3a-c5ae97180e03@intel.com>
 <PH0PR12MB5481BE51210D429FA12EAB45DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fb012148-a71e-4856-95fe-6e75f011f3fb@intel.com>
 <20231020053534-mutt-send-email-mst@kernel.org>
 <3932dd54-f43a-40b6-8dba-962f997f7122@intel.com>
 <20231021112420-mutt-send-email-mst@kernel.org>
 <2cc0d8fc-8ed5-4b98-b5e7-3a86d3da80b0@intel.com>
 <20231023072519-mutt-send-email-mst@kernel.org>
 <8d601578-2083-4f45-a700-6b67d0c5b789@intel.com>
 <20231025042512-mutt-send-email-mst@kernel.org>
 <CACGkMEtaw-DKy7vwWj8wgG8-_9Kg4SV3=pS1djntOEYM62Dg-g@mail.gmail.com>
 <PH0PR12MB5481E50E25268163CD85751DDCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <629f2434-03b8-1fa2-e217-97a00cd94c2f@redhat.com>
In-Reply-To: <629f2434-03b8-1fa2-e217-97a00cd94c2f@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH3PR12MB9025:EE_
x-ms-office365-filtering-correlation-id: 6028afc6-488e-4bc7-bcbe-08dbd9039df8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 KEipY5dmLce7KV17v4auLNxGhNG5+pLXQVKy0bUTt80pqQ6RFhsMHqoId7Zjul3TGhgRGs5sES/veCW8/qR04aaB8+zBk38U0NKvg+QZfiJpO2Sd/FctF5dpEYTYHvNQ3QvcfYi8NWWZSp335X+emRZyax6yyjBMUMqONHl9PWAQJtoftq/yo8EMY37GAjlxjCkUpnWGlaiGBB42rQzifh2p86f4qKHroKe8GwiUleLV8HekdlCFD5C63otGyRZbNSUw0y2Edr15wyCSPM63ljTWTk12MWxUMxm09rt54CSfO/IIYpUcFTpTZpkpZ7VbRs3b6EsGRccO0WFD4y9StoVViLL8sX99GxYc72HJUKMy7SkQO4wLz4gS28wGWMvI0SJk9gGD5gYjT6ZHVBGwQhz4AMI1pkl2g3G/aWFo49HADkAZIB1ZOODBKS0hHG11P6i1UQ2qP1A6wORniIndp2ta/hsm2Dx6OdMzhRusFxvQOISfdcLzaXKKIvc5BXVPK/repkMBqblOeCGEfG75lcfmqItG9YGVIbJRAQBa0PW3yJMCMP1JeWVq1jSXvcmmH6TOZtYnqFuFdFkzq7iyZ5pyLaw8pEIJQqXssBuYmxCHMGfh+EOR6m0KLgQvq5YL
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(39860400002)(346002)(376002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(55236004)(9686003)(26005)(107886003)(53546011)(478600001)(6506007)(7696005)(71200400001)(83380400001)(5660300002)(2906002)(41300700001)(76116006)(110136005)(8936002)(4326008)(8676002)(54906003)(64756008)(66446008)(66476007)(66946007)(66556008)(52536014)(316002)(38070700009)(38100700002)(122000001)(86362001)(33656002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WTVWcjViQUhLZkNWMXJDMXo2Q1hPT0RadXdNck5XamI4b3RXRlpPdVd6NTRm?=
 =?utf-8?B?Mlk1cThQZTA3MmpKSHloMFRsUVM5eElmT2I4MU9QMlRlemNFK3BKbDJpa1Q2?=
 =?utf-8?B?SExEaEtWNjBhNEZwZGNrODRnVWF4L0ZRZ3BxQk90Tlh6QVlwUCtmbUtjYXFH?=
 =?utf-8?B?Mzk3WDdVVVA2eTFxMVpFOU02dVJPMWZvMncrR25RQzUwdDErV2tYaTZ5bVVL?=
 =?utf-8?B?OEpmL3AyYlRmK1diTjVBT2lhaHZvbzVzd3daa0Y3N3B2YXplem9lRW1JY0RD?=
 =?utf-8?B?cjhPQ09zNitxWDNBdkRRWFc3bHdNUkVBSkFBSHYrZGFpeDVkZS9rMSt3dHMy?=
 =?utf-8?B?M1lCc1NiQmI2UVREWDQ3eDd4bjFYenFmeEM2MURtUzU0QjZUWGJJK1h4RW1Y?=
 =?utf-8?B?RWdKSEpreldMamZZakNTclh5b0R5emNTbmZOaFlVUVo1NmtGQ0swOHVSMDRu?=
 =?utf-8?B?cENjck1RWE91RW56WER5UDkxcStWVXdFaXpXUjFnMnkxd1Nxc2dLQ3NGNEZV?=
 =?utf-8?B?QVdER0ZZNlZndVNmemtoTkQ4KzNaLzA2a3lzcHNCQnhWT21hdE0ya2hNOEV3?=
 =?utf-8?B?NXFoV2dOdXlXOGFHRHdoclRnSEF4aVN2dXRwYUFPR21jZkw1aFFOd05iN3ZX?=
 =?utf-8?B?VjRweHVKakVGdUhCcWNILzVHb2hTYjc5eFZsUVBZNFRPSTJDMkNmaGNUUjlX?=
 =?utf-8?B?cVpHc1NqOGI1akZ3WE9qczRiVkNkRW5BemJMdXNDYW00NTZZYVdZMFVSQSt1?=
 =?utf-8?B?dnJ2N0ZoYm9YNHZFQjgvbWdhOU9JZDZpMndtZDdJeHcrZlUydjVFc0VJNi9a?=
 =?utf-8?B?VTVKejVUdndpdU1VTWRaNjA5SkY0NFZUUjFMVlhqa29ORk55NXdoQUREbEs5?=
 =?utf-8?B?OGVYaU82NmJ5Y3dMZU9icCtHNTJJZVpJbWhGS3QvVnZLRE1EdFkvMnpma3Ey?=
 =?utf-8?B?aGRsN0RCM000UUlqdTR4WllJSTNMM1UvZzNKdXhYMU1TMXhEcVZyalhMUUlM?=
 =?utf-8?B?djdzd2MyRlJCUlZRcm1zY1pTNmZNYXdLVEpGTVkweFB1dndtQjhzcld6RGtG?=
 =?utf-8?B?NmJHaXV3dDlwd3lDa1dFczZpV3hnODVZN2N1UXlUTm9HQlhkQjRjM0Vsb2Ry?=
 =?utf-8?B?Mnd5WDNQdzNwMFFHTlVzSlMzcUVOdGp0OUNHb29IUjRRYU5jTWdsY2FLMFdP?=
 =?utf-8?B?ZS9NeExQaVhpOVcvTW9hQnpRRVhkbE5pNEROVU1HbDAza3JBOVZhV3BQcVZt?=
 =?utf-8?B?TlBZb0Y2M3FlQ2VaTWRoaEkzUWJBU1EwZit2R3p3M1JVMC9mQVA1M3o5WmIv?=
 =?utf-8?B?b2ZFRTNZTC85TGlvckMxd1loQTJQTzRwRE1GQmdvc3VEZUpoOGdtQzcreXdD?=
 =?utf-8?B?eTgraXFnSDI1T1E1Q0Jlc0lIWS9DTmJhYyt0N05RLytNd0QzU0V1aDEzcGpm?=
 =?utf-8?B?QVV3MHVXODhib05RbWxmVENQSUJuK3o3ZzVzVUdEL29jV1dwQzJBN3V2Q1B3?=
 =?utf-8?B?TFV3Rm5tK21SUjgwRWtMRGxLV0lqUGJBTS9EczBNem55VDJOb1FwZzVxRTkz?=
 =?utf-8?B?V0hEVHBDeTRQNnpjNjdBK2grcjFnQUV0VW9kQWJXVUk4OUd1bVovd283YUdK?=
 =?utf-8?B?VGJacmdHQlVueldoZmxUZlpWYkM0aGlRaE1zbU9sWWtuaS96ejRnNE1MV2FS?=
 =?utf-8?B?QmQveVhjL2J5T29JMmtGWXdJYzRHZys4ZE8rRVZoNHg3eklPY3k1QVgrNmRW?=
 =?utf-8?B?SGpTMnFyeHJEemVGR215Mk9BVFM3UEdUZWdFNDMvNjlFc3dqcWRuSUVad1FP?=
 =?utf-8?B?Q0NUaFVlVkNqT2ZYLzFhcTlvcXNHOFNzWDVyU3d1czFpd0YrTjAxMXJHQm83?=
 =?utf-8?B?YkRpZ3FXeWxEQlRHZG0vcmRtY1I5MVNEYmllQUpKYndqSnd5aUZ0UEV0Tyt3?=
 =?utf-8?B?N0hTNVhJbnBaVU8zY3RNNHhQZjQxVXJ2L2ZUakVlT1pxQ0EzeDkyQ3Y5eWsr?=
 =?utf-8?B?NzhHdlNPQkNFR092YmxRNEpFQWpnT1dIWWJsWFAzT3h4c0Vtcmo3ajNzcWNE?=
 =?utf-8?B?Y0FPMkM0UkFBUlh1eEh1Y2FZdTJTcVdObkZsOTdWakxjTURmL0pod1ladzV1?=
 =?utf-8?Q?U43o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6028afc6-488e-4bc7-bcbe-08dbd9039df8
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2023 04:49:36.0997
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IF2r05IJedm41Umq8FiLyQyzSStp5PhVqCDM4lFj/34OL3D45Y4A93Hgkb0eAyDGrsCjvzF7WPutAM8sDj/anw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9025
Subject: RE: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

DQoNCj4gRnJvbTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4NCj4gU2VudDogTW9u
ZGF5LCBPY3RvYmVyIDMwLCAyMDIzIDk6MzAgQU0NCj4gDQo+IA0KPiDlnKggMjAyMy8xMC8yNiAx
MTo1OCwgUGFyYXYgUGFuZGl0IOWGmemBkzoNCj4gPg0KPiA+PiBGcm9tOiBKYXNvbiBXYW5nIDxq
YXNvd2FuZ0ByZWRoYXQuY29tPg0KPiA+PiBTZW50OiBUaHVyc2RheSwgT2N0b2JlciAyNiwgMjAy
MyA2OjI3IEFNDQo+ID4+DQo+ID4+IE9uIFdlZCwgT2N0IDI1LCAyMDIzIGF0IDQ6MzPigK9QTSBN
aWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPg0KPiB3cm90ZToNCj4gPj4+IE9uIFR1
ZSwgT2N0IDI0LCAyMDIzIGF0IDA2OjI3OjA0UE0gKzA4MDAsIFpodSwgTGluZ3NoYW4gd3JvdGU6
DQo+ID4+Pj4NCj4gPj4+PiBPbiAxMC8yMy8yMDIzIDc6MzIgUE0sIE1pY2hhZWwgUy4gVHNpcmtp
biB3cm90ZToNCj4gPj4+Pg0KPiA+Pj4+ICAgICAgT24gTW9uLCBPY3QgMjMsIDIwMjMgYXQgMDY6
MDM6MTBQTSArMDgwMCwgWmh1LCBMaW5nc2hhbiB3cm90ZToNCj4gPj4+Pg0KPiA+Pj4+ICAgICAg
ICAgIGNvbmZpZyBzcGFjZSwgTU1JTywgcmVnaXN0ZXJzIHdvcmsgZm9yIHllYXJzLCB3aGF0IGlz
IHdyb25nIHdpdGgNCj4gdGhlbT8NCj4gPj4+Pg0KPiA+Pj4+ICAgICAgTm90aGluZyBhcyBzdWNo
LiBUaGV5IGRvbid0IHNlZW0gdG8gYmUgYXBwcm9wcmlhdGUgZm9yIGFsbCB1c2UtY2FzZQ0KPiA+
Pj4+ICAgICAgd2hlcmUgcGVvcGxlIHdhbnQgdG8gdXRpbGl6ZSB2aXJ0aW8uIEkgdGhpbmsgYSBu
ZXcgdHJhbnNwb3J0DQo+ID4+Pj4gICAgICB3aWxsIGJlIG5lZWRlZCB0byBhZGRyZXNzIHRoZXNl
Lg0KPiA+Pj4+DQo+ID4+Pj4gTmV3IHRyYW5zcG9ydCBmb3IgbmV3IHR5cGUgb2YgZGV2aWNlcyBm
b3Igc3VyZSwgbGlrZSB0cmFuc3BvcnQgdnEgZm9yIFNJT1YuDQo+ID4+Pj4NCj4gPj4+PiBJIGFn
cmVlIGFkbWluIHZxIG9yIGFkbWluIGNtZHMgYXJlIHVzZWZ1bCBpbiBzb21lIHVzZSBjYXNlcywg
dGhhdA0KPiA+Pj4+IGlzIGFub3RoZXIgc3RvcnksIHNob3VsZCBiZSBjYXNlIGJ5IGNhc2UuDQo+
ID4+Pj4NCj4gPj4+PiBGb3Igbm93LCBsZXQncyBkb24ndCB0YWxrIGFib3V0IGFsbC11c2UgY2Fz
ZXMsIGp1c3QgZm9yIGN1cnJlbnQNCj4gPj4+PiB0YXNrLCBmb3IgbGl2ZSBtaWdyYXRpb24uDQo+
ID4+Pj4NCj4gPj4+PiBTbyBJTUhPLCBJIHN0aWxsIHRoaW5rIHdlIHNob3VsZCB1c2UgY29uZmln
IHNwYWNlIHJlZ2lzdGVycyB0bw0KPiA+Pj4+IGNvbnRyb2wgbGl2ZSBtaWdyYXRpb24gcHJvY2Vz
cy4NCj4gPj4+Pg0KPiA+Pj4+DQo+ID4+PiBObyBiZWNhdXNlIGl0IGZvcmNlcyBpbnRlZ3JhdGlu
ZyBtaWdyYXRpb24gcHJvY2VzcyB3aXRoIGRldmljZSBkcml2ZXIuDQo+ID4+PiBXaGljaCBpcyBv
ayBmb3Igc29tZSB1c2UtY2FzZXMgYnV0IG5vdCBhbGwgb2YgdGhlbS4gIEZpbmQgc29tZSBvdGhl
cg0KPiA+Pj4gY29udHJvbCBwbGFuZSBmb3IgdGhpcy4NCj4gPj4+DQo+ID4+Pg0KPiA+Pj4+ICAg
ICAgICAgICAgICAgICAgQ29uZmlnIHNwYWNlIGlzIGNvbnRyb2wgcGF0aCwgRE1BIGlzIGRhdGEt
cGF0aCwNCj4gPj4+PiBsZXQncyBiZXR0ZXIgbm90IG1peA0KPiA+PiB0aGVtLA0KPiA+Pj4+ICAg
ICAgICAgICAgICAgICAgd2UgbmV2ZXIgZXhwZWN0IHRvIHVzZSBjb25maWcgc3BhY2UgdG8gdHJh
bnNmZXIgZGF0YS4NCj4gPj4+Pg0KPiA+Pj4+ICAgICAgICAgICAgICAgICAgU28gd2UgbmVlZCBE
TUEgdG8gdHJhbnNmZXIgZGF0YSwgZm9yIGV4YW1wbGUgSQ0KPiA+Pj4+IHRha2UgYWR2YW50YWdl
cyBvZg0KPiA+PiBkZXZpY2UgRE1BDQo+ID4+Pj4gICAgICAgICAgICAgICAgICB0byBsb2dnaW5n
IGRpcnR5IHBhZ2VzLCBUaGlzIGFsc28gYXBwbGllcyB0byBpbi1mbGlnaHQgZGVzY3JpcHRvcnMu
DQo+ID4+Pj4NCj4gPj4+PiAgICAgICAgICAgICAgQXMgbG9uZyBhcyB5b3UgZG8sIEkgcGVyc29u
YWxseSBzZWUgbGl0dGxlIGJlbmVmaXQgdG8gcmV0cmlldmUgcGFydHMgb2YNCj4gPj4+PiAgICAg
ICAgICAgICAgc3RhdGUgd2l0aCBtZW1vcnkgbWFwcGVkIGFjY2Vzc2VzLg0KPiA+Pj4+DQo+ID4+
Pj4gICAgICAgICAgcmVnaXN0ZXJzIG9ubHkgY29udHJvbCwgYW5kIEkgcGVyc29uYWxseSBiZWxp
ZXZlIGEgc2luZ2xlIHJlZ2lzdGVyIGlzDQo+IG11Y2gNCj4gPj4+PiAgICAgICAgICBiZXR0ZXIN
Cj4gPj4+PiAgICAgICAgICB0aGFuIHByb2Nlc3NpbmcgYWRtaW4gY29tbWFuZHMsIG1vcmUgbGln
aHQtd2VpZ2h0LCBtb3JlDQo+ID4+Pj4gcmVsaWFibGUsDQo+ID4+IHdvcmtpbmcNCj4gPj4+PiAg
ICAgICAgICBmb3IgeWVhcnMuDQo+ID4+Pj4NCj4gPj4+PiAgICAgIFllYS4gSXQgd291bGQgYmUs
IGlmIHdlIGNvdWxkIGRvIGV2ZXJ5dGhpbmcgdGhyb3VnaCB0aGF0IHJlZ2lzdGVyLg0KPiA+Pj4+
ICAgICAgQnV0IHdlIGNhbid0IHJlYWxseS4gTWlncmF0aW9uIGhhcyB0b28gbXVjaCBkYXRhIHRv
IHBhc3MgYXJvdW5kDQo+ID4+Pj4gICAgICBmb3IgdGhhdCB0byBiZSByZWFzb25hYmxlLg0KPiA+
Pj4+DQo+ID4+Pj4gZGF0YSBhcmUgbm90IHRyYW5zZmVycmVkIGJ5IHJlZ2lzdGVycywgdGhleSBv
bmx5IGNvbnRyb2wuDQo+ID4+Pj4NCj4gPj4+PiBXZSB0cmFuc2ZlciBkYXRhIGJ5IERNQSwgdGhl
IGRldmljZSB3cml0ZXMgRE1BIGRpcnR5IHBhZ2VzDQo+ID4+Pj4gaW5mb3JtYXRpb24oYml0bWFw
KSB0byBob3N0IGlzb2xhdGVkIG1lbW9yeSByZWdpb24uDQo+ID4+Pj4NCj4gPj4+DQo+ID4+PiBJ
ZiB5b3UgZG8gdGhhdCB0aGVuIEkgZG9uJ3Qgc2VlIGFueSByZWFzb24gbm90IHRvIHVzZSBhZG1p
biBjb21tYW5kcw0KPiA+Pj4gZm9yIHRoYXQgLSBlaXRoZXIgdGhyb3VnaCBhIHZxIG9yIGEgc2lt
cGxlciBpbnRlcmZhY2UuDQo+ID4+IEkgdGhpbmsgd2UgbmVlZCB0byBhZ3JlZSB0aGF0IGFkbWlu
IGNvbW1hbmRzIGFyZSB0aGUgb25seSBpbnRlcmZhY2UNCj4gPj4gZm9yIGFueSBmdXR1cmUgZmVh
dHVyZXMgYmVmb3JlIHdlIGNhbiBoYXZlIGFuIGFncmVlbWVudCBoZXJlLg0KPiA+Pg0KPiA+IEZv
ciBwYXNzdGhyb3VnaCBtZW1iZXIgZGV2aWNlcywgdGhpcyBhZG1pbiBjb21tYW5kcyB0byBiZSB0
cmFuc3BvcnRlZCB2aWENCj4gdGhlIG93bmVyIGRldmljZSBieSB0aGUgbWlncmF0aW9uIGRyaXZl
ciB3aGljaCBzaXRzIG91dHNpZGUgb2YgdGhlIGd1ZXN0IFZNLg0KPiA+DQo+ID4gSWYgdGhpcyBi
YXNpYyByZXF1aXJlbWVudCBpcyBub3QgY2xlYXIgaXQncyBwb2ludGxlc3MgdG8gZGlzY3VzcyBm
dXJ0aGVyLg0KPiANCj4gDQo+IFNvIG15IHF1ZXN0aW9uIGlzIG5vdCBsaW1pdGVkIHRvIGRldmlj
ZXMgdGhhdCBpcyBtb2RlbGVkIGFzIGdyb3VwL293bmVyLg0KPg0KQ3VycmVudCBwcm9wb3NhbCBp
cyBmb3IgdGhlIGdyb3VwL293bmVyIG1vZGVsIGh3IGJhc2VkIGRldmljZXMgc3VwcG9ydGVkIGJ5
IHZpcnRpby1zcGVjLg0KSSB3aWxsIG5vdCBkZWJhdGUgdGhpcyBmdXJ0aGVyLg0KTW1pbyBjYW4g
aW52ZW50IHRoYXQgbW9kZWwgd2hlbiBhIHVzZXIgcmVhbGx5IG5lZWRzIGl0Lg0KDQo+IA0KPiA+
IEhvdyBpcyB0aGUgcGFzc3Rocm91Z2ggZGV2aWNlIGRlZmluZWQ/IEl0IGlzIGRlZmluZWQgYXMg
WzFdLg0KPiA+DQo+ID4gQ2FuIG5vbiBwYXNzdGhyb3VnaCBkZXZpY2UgbW9kZXMgc3VjaCBhcyB2
ZHBhIGFsc28gdXNlIHRoZXNlIGFkbWluDQo+IGNvbW1hbmRzIGZyb20gdGhlIG93bmVyIGRldmlj
ZT8NCj4gPiBTdXJlLCB3aHkgbm90Pw0KPiANCj4gDQo+IFRoYXQncyBmaW5lIGJ1dCBpdCdzIG5v
dCBteSBxdWVzdGlvbiBhZ2Fpbi4NCj4NCk9rLiBzbyBvbmUgaW50ZXJmYWNlIGlzIGFibGUgdG8g
c2VydmUgdHdvIHVzZSBjYXNlcyBub3cuDQpHb29kLg0KVGhhbmtzLg0K

