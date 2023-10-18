Return-Path: <virtio-comment-return-7797-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 376A9CDB47E
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 07:21:04 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 73D93120D4D
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 07:21:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5545F986891
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 07:21:03 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3B3F198688E; Wed, 18 Oct 2023 07:21:03 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2B27698688F
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Oct 2023 07:21:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EKMWrwA/ItVZtzGX8g08/D7kFcEwSkew3fOKMclGWau4ZhAS14uKMaZVrnyvJqJYyxq2tm9Uw0HgO1dbQvI6+apJ7b0LDZYv8q1YoDoK55pD6phGAia/QsClMo1j7b7gWlkqx/u+tmvUwv4gAtxFUGiINGGE5bG/79m7SHaEU7dDAMGMiIb++TGmgkx7qtxnniSAEPaFwjOR7oOfyl2fbO87Rc94Qe3pQ+r4ay5CIZzv6neda2WGk2jnAQsc9jCGIJKH0s7McJoph6FACV9upbG/UVSciEaxXelmasHKM8YKjcMy3Q8bW59nFAqv6BHBWW1/T1CK53O3buvTo722rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nVO4UD0VMPhewH/KUwEIXXdFWRNspRxCKWrpSdGhVfU=;
 b=kWVC6K64LPaorCKK4RJuWOXuH8zNp/CsXYODP+1GembPUwKCIjDVms7+WabyWCx83Z313Wo3U+bGwx0R1NgISJFXDYWNNytDwVctaTYCaFSC1kSvNEIBoKU2Tf6qaz8Koiv8aWe7rYKedtkAoMMjWn/Au87UykHRXI3CC2OGqT/oH/jf9wLYNBggtDbU4aRUAmHiVqsqotTtv2yeTuIyUwSmEfRxXlRAyHXp7irYIQprr+x0qVYHPNl59nrCSs2eNnPe0Ayu4axvg9tf0fHetYzLm0Fjm9JgImmCGZ2uZ9zEzRP1t0lGKgvkY4my25cxdk7szILVgBs4tGDmr+HuIQ==
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
 AQHZ+dpHSUrTyyDEA0quapQP8C0hdbA/xRkAgAF/hoCAACxh4IABSWcAgAANqrCAAZnYAIAACyKAgAGFBICAAACFkIAAEwWAgAAD8yCAAXZ1gIAAIYLAgASWeYCAAtRh8IAAGoeAgAAAUKCAAARLAIAAB5cQ
Date: Wed, 18 Oct 2023 07:20:59 +0000
Message-ID:
 <PH0PR12MB5481546E859578DE97D9E152DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231008112555.473895-1-parav@nvidia.com>
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
 <PH0PR12MB548119E2C2EDB212B56E9FACDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <829d27f8-1d9b-4a1e-93a8-a14da626f4a7@intel.com>
 <PH0PR12MB54819FC5A77A46C649CD5B6DDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <0948cfa4-da02-43d5-a099-424f209f814f@intel.com>
In-Reply-To: <0948cfa4-da02-43d5-a099-424f209f814f@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|BN9PR12MB5244:EE_
x-ms-office365-filtering-correlation-id: 31b5aad8-4f61-49cb-872b-08dbcfaac76d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 P4rJVNgb9w6/IRrKpK1aFU2BVsYMaep95jrfrFhYnLHRtIT01uwpr66UoskEID6N2mGD06ofGfD7yFs+NZfJVUNyjBAz293w7laNMiZQfn4m3xqlAjIlvU/XfmwNF2TkrJ+EqR53EYRNIlOy58i/407QgzkIJWjqwZu3KM5yFvy+9rXB9f4SnCLiJuGIBUW3Zq+i9Gooe7GV+0JmK0K1tlCtVuidydUVlXZyokuNjLelDapPkwf/GqM0qcqM+5g0skt/f5dtH71YJVdfQ3rjV2BijvQbdweFx+4DirfLPFVISVJY6F9GxTTh0EkYHKqLEBmIVcO4DWbUMkKT6W+ub13lwjpYnZ33CfSgSCFNJhmUwYjy1UYX70zmindi5L1jBDdfFxou+6GLXQlb6SW+vik60gBb5OSr5NuL54nyP6DUIs4OHPIKOViQBUHjfMbsGc/VRoc0OteboGM8hDMuESC/GUOI6RWgZ5eDmfZYqp10As/e0MdE/dMwq0QnQhio2BsmFppdrOemD8Jw3Cnl6mI7hq+MiXMHoHLM4tv/BtNHXPsLUNro+Fd+8LGTa2vcRivuwz7OB4sfvK/Dol/7dl3bmWLndhQ6IvC+By2HSMwzAg5Cqt4bcp7zrdL0JUn1aZykcQpxx5v+Ve2dW3tLEysXvcCFjZloeqkiB+FKNvA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(366004)(136003)(346002)(376002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(6506007)(2906002)(5660300002)(52536014)(8676002)(8936002)(4326008)(41300700001)(66476007)(66446008)(54906003)(76116006)(66946007)(66556008)(7696005)(316002)(110136005)(966005)(55016003)(9686003)(478600001)(64756008)(53546011)(71200400001)(107886003)(38100700002)(26005)(83380400001)(38070700005)(33656002)(122000001)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eWFHbVp6UW9WSDZ2ajFoT2QzM05uekxlZzFhOFVuZEFjMFdvTnBoSUFUV0Vs?=
 =?utf-8?B?aTFUdXlYZ29NeXV3QlJhMk0yNUVzaHFkR25HTDRHckJZenJ2ZzYrUzVLRWlu?=
 =?utf-8?B?ZlpDU2NEVnM1MktJcENtMG40RjArbTFqTGJIaER5R2lJME4vbDM1TEkvYzc4?=
 =?utf-8?B?dXRMaVFPbnUwcFBCelpOMnRGWGlpRlo0dFhtS1N1YlMrekVPaVJnQzRhYkpL?=
 =?utf-8?B?SVcvWXVoODVJMDQ0b1MrRDhlVUZpOWRQWGxxVWlGVWFudmd1amlSTDFJbGxw?=
 =?utf-8?B?dU9lSElhRCtQNzQ5WHVTQmIzcjlGb0tINDhSWlFtMHdHLys5MkIwcXF3UHdi?=
 =?utf-8?B?S0pTZ3Ezdmc2cXBsbnJiMTFTMk9qd2kxWGdZZ3hPNDVvaVh5Z01HVmkyaDN6?=
 =?utf-8?B?NVZRMFZrK0E0dEhMNlBoYVNBdnhGRm05dHFHWG9mYzhvMlBQTXprUmdBQWx1?=
 =?utf-8?B?ZEU4TERvci80NVYrM0NINDhVRTF3M2tHZDBSQ3lMTVdXQ0FNTzBNUUQwdXhD?=
 =?utf-8?B?by9veVJ5M0dYdE9mZkY5ZFFLTmZRcGxibmlOK29MUnlsN3BoR1JWVkU1OUV5?=
 =?utf-8?B?dWZya3o5VHNlRnJJSlJkM1BVU0ZvdG9wZXBPV1c4bi9NOVVzNThleEhaclp4?=
 =?utf-8?B?elF2UWdxUDduMVpYZnZWV0l2dFZCT2FiTDI0UU1MVkVKODZDSkFUZkNpQjVZ?=
 =?utf-8?B?SkRtdzNlRjNhSlM2QisrUFoxdit6WXNrMkRRMEtuRlJJOGVjSy9ta0R5QjJ2?=
 =?utf-8?B?MDhNUUYvdGZjWHJFV0NjNWRLeWd4amxyVjA4R2hTdy9IY3BzN1ZlempoUXdT?=
 =?utf-8?B?UVVLY2NMbmgxb2M5VFgxS0tiWkVyeGcxVjZEMWdEbVlrRXVUYXhJMWN4dmFX?=
 =?utf-8?B?OEgwZmdZQUpLY1BVcFUwZDFZeklWTVBQYjY2UHBOOWpudFRycWRTdHRIMHJa?=
 =?utf-8?B?M0I2ZGRud1lPOTNodHhoUWhIMTFWdzIvaUxNbjA2MjhBQXlYVHNFaytJbkFz?=
 =?utf-8?B?bGpOU1FOQ2V2eERzYnRtb082UkZhdGJ4LzhubzJZam1rc3lHSm1pUU1obkZj?=
 =?utf-8?B?NkV6bTBmZWpqbklqaU9mN3JldStqOU1HamlrWFJKU0ozemRWMmVvOE9WanFr?=
 =?utf-8?B?WHZNREFuNDFOSXhzL0poeGt5T0lGZEowd3V5ZnUwYW1MVCtTb2tDaUt6NlpP?=
 =?utf-8?B?KzRqNGhTZmJoWDNLZzl2TE5GKzVSMWV4MzlFSmR5RkdrZnhidFlqWWhaUXhp?=
 =?utf-8?B?SW90RndRM1g0UnZvTWp0S2ozL0wwY3lOalB5RjJPR3A1TVdnS2M2YXlGY2hY?=
 =?utf-8?B?TVhqSHlpcXZHeE1jRWI3eXVWU3ptV0ZMMThVcjNEU1JwbWtJT3dubFRBZ011?=
 =?utf-8?B?dmxmYWxkZWZPWVFNTjdaU2dkcnRGWTFNWndhN1dpV1lxc2xrMzJ0aWZtZXFj?=
 =?utf-8?B?ckV2eUJJdlVLWk5GOHRDdEZOSFBWNGR4MmJsUStxM0RodFdXay9TWDlZODVP?=
 =?utf-8?B?SFJGMFFrZjFGZGF2dVBEVHFiZ0hmSGs2cnh2Q0pGemw2Wnpwa1B1SXc4MFpm?=
 =?utf-8?B?QmpOT2EyVUowdGxHQk0xVjY3SFJwbGRxSHBPdldNN2ZNSFVFb3l5dDZpeEZE?=
 =?utf-8?B?QUxIWGg4SExETno3aXVsMjlxSGRiS3hJTjVPZGsxTEh6NFpQT3hNdndwYk5M?=
 =?utf-8?B?K2lKQ3NCM0pwU0xiOHBlWDQzaU1namFmdE5iYlIyNE11T1ZJcmpia2hPZDlh?=
 =?utf-8?B?dGdkN1hoR0Z5N3J6SHplZk11OWNUVjlzRjdHcElVbXpBYmtYN1B0dHlTelJE?=
 =?utf-8?B?VHlwbWpCUm5LSlAxc0ZlNU1Sbm5LM1lDN3kzRS9BUmo0YW1LZjNPUFVqa1BB?=
 =?utf-8?B?WUE1WUpHMHh4cXBOODVyamJDdEMwb3FOenlnY3BDQjV1K0xOZUxRTWczYm1s?=
 =?utf-8?B?UzNSU2N5SHVKaWdDM09uLzJTZmhRTDhFYm1IV1pvTFFNZ2ZPTHQ0aE40enpS?=
 =?utf-8?B?OGkvSzMxaVN3Rm9mN2w0U3NQQjhPd3dicnRMYkR3c1BLbFFUK2xSV0MzanFW?=
 =?utf-8?B?a0lzVnN2M2FBdXV6NHQvZWt6NUErQkIvS3ByMzh5L2o2d2Mrdm1oVzFyYlRw?=
 =?utf-8?Q?WIOs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31b5aad8-4f61-49cb-872b-08dbcfaac76d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2023 07:21:00.0146
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jrw9gOeNDc8k26WA84pxLPqV7/IhMcqvvWs7Xpu3WBR0SWgfyNvtQbh4BuMQv3OjRU86rAnlEalkCdH6i9yyVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5244
Subject: RE: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

DQo+IEZyb206IFpodSwgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+DQo+IFNlbnQ6
IFdlZG5lc2RheSwgT2N0b2JlciAxOCwgMjAyMyAxMjoyMiBQTQ0KPiANCj4gT24gMTAvMTgvMjAy
MyAyOjQxIFBNLCBQYXJhdiBQYW5kaXQgd3JvdGU6DQo+ID4NCj4gPj4gRnJvbTogWmh1LCBMaW5n
c2hhbiA8bGluZ3NoYW4uemh1QGludGVsLmNvbT4NCj4gPj4gU2VudDogV2VkbmVzZGF5LCBPY3Rv
YmVyIDE4LCAyMDIzIDEyOjA2IFBNDQo+ID4+DQo+ID4+IE9uIDEwLzE4LzIwMjMgMTowMiBQTSwg
UGFyYXYgUGFuZGl0IHdyb3RlOg0KPiA+Pj4+IEZyb206IHZpcnRpby1jb21tZW50QGxpc3RzLm9h
c2lzLW9wZW4ub3JnDQo+ID4+Pj4gPHZpcnRpby1jb21tZW50QGxpc3RzLm9hc2lzLSBvcGVuLm9y
Zz4gT24gQmVoYWxmIE9mIFpodSwgTGluZ3NoYW4NCj4gPj4+PiBTZW50OiBNb25kYXksIE9jdG9i
ZXIgMTYsIDIwMjMgMzoxOCBQTQ0KPiA+Pj4+DQo+ID4+Pj4gT24gMTAvMTMvMjAyMyA3OjU0IFBN
LCBQYXJhdiBQYW5kaXQgd3JvdGU6DQo+ID4+Pj4+PiBGcm9tOiBaaHUsIExpbmdzaGFuIDxsaW5n
c2hhbi56aHVAaW50ZWwuY29tPg0KPiA+Pj4+Pj4gU2VudDogRnJpZGF5LCBPY3RvYmVyIDEzLCAy
MDIzIDM6MTQgUE0NCj4gPj4+Pj4+Pj4+PiBIb3cgZG8geW91IHRyYW5zZmVyIHRoZSBvd25lcnNo
aXA/DQo+ID4+Pj4+Pj4+PiBBbiBhZGRpdGlvbmFsIG93bmVyc2hpcCBkZWxldGdhdGlvbiBieSBh
IG5ldyBhZG1pbiBjb21tYW5kLg0KPiA+Pj4+Pj4+PiBpZiB5b3UgdGhpbmsgdGhpcyBjYW4gd29y
aywgZG8geW91IHdhbnQgdG8gY29vayBhIHBhdGNoIHRvDQo+ID4+Pj4+Pj4+IGltcGxlbWVudCB0
aGlzIGJlZm9yZSB5b3Ugc3VibWl0dGluZyB0aGlzIGxpdmUgbWlncmF0aW9uIHNlcmllcz8NCj4g
Pj4+Pj4+PiBJIGFuc3dlcmVkIHRoaXMgYWxyZWFkeSBhYm92ZS4NCj4gPj4+Pj4+IHRhbGsgaXMg
Y2hlYXAsIHNob3cgbWUgeW91ciBwYXRjaA0KPiA+Pj4+PiBIdWguIFdlIHByZXNlbnRlZCB0aGUg
aW5mcmFzdHJ1Y3R1cmUgdGhhdCBtaWdyYXRlcywgMzArIGRldmljZQ0KPiA+Pj4+PiB0eXBlcywN
Cj4gPj4+PiBjb3ZlcmluZyBkZXZpY2UgY29udGV4dCBpZGVhcyBmcm9tIE9yYWNsZS4NCj4gPj4+
Pj4gQ292ZXJpbmcgUDJQLCBzdXBwb3J0aW5nIGRldmljZV9yZXNldCwgRkxSLCBkaXJ0eSBwYWdl
IHRyYWNraW5nLg0KPiA+Pj4+Pg0KPiA+Pj4+PiBQbGVhc2UgaGF2ZSBzb21lIHJlc3BlY3QgZm9y
IG90aGVyIG1lbWJlcnMgd2hvIGNvdmVyZWQgbW9yZSBncm91bmQNCj4gPj4+Pj4gdGhhbg0KPiA+
Pj4+IHlvdXIgc2VyaWVzLg0KPiA+Pj4+PiBXaGF0IG1vcmU/IEFwcGx5IHRoZSBzYW1lIG5lc3Rl
ZCBjb25jZXB0IG9uIHRoZSBtZW1iZXIgZGV2aWNlIGFzDQo+ID4+Pj4gTWljaGFlbCBzdWdnZXN0
ZWQsIGl0IGlzIG5lc3RlZCB2aXJ0dWFsaXphdGlvbiBtYWludGFpbiBleGFjdCBzYW1lDQo+IHNl
bWFudGljcy4NCj4gPj4+Pj4gU28gYSBWRiBpcyBtYXBwZWQgYXMgUEYgdG8gdGhlIEwxIGd1ZXN0
Lg0KPiA+Pj4+PiBMMSBndWVzdCBjYW4gZW5hYmxlIFNSLUlPViBvbiBpdCwgYW5kIG1hcCBvbmUg
VkYgdG8gTDIgZ3Vlc3QuDQo+ID4+Pj4+DQo+ID4+Pj4+IFRoaXMgbmVzdGVkIHdvcmsgY2FuIGJl
IGV4dGVuZGVkIGluIGZ1dHVyZSwgb25jZSBmaXJzdCBsZXZlbA0KPiA+Pj4+PiBuZXN0aW5nIGlz
DQo+ID4+Pj4gY292ZXJlZC4NCj4gPj4+Pj4+IEFuc3dlciBhbGwgcXVlc3Rpb25zIGFib3ZlLCBp
ZiB5b3UgdGhpbmsgYSBtYW5hZ2VtZW50IFZGIGNhbg0KPiA+Pj4+Pj4gd29yaywgcGxlYXNlIHNo
b3cgbWUgeW91ciBwYXRjaC4NCj4gPj4+Pj4gVGhlIGlkZWEgZXZvbHZlcyBmcm9tIHRlY2huaWNh
bCBkZWJhdGUgdGhlbiBwb2ludGluZyBmaW5nZXJzIGxpa2UNCj4gPj4+Pj4geW91cg0KPiA+Pj4+
IGNvbW1lbnQuDQo+ID4+Pj4+IEkgdGhpbmsgYSBwb3NpdGl2ZSBkaXNjdXNzaW9uIHdpdGggTWlj
aGFlbCBhbmQgYSBwb2ludGVyIHRvIHRoZQ0KPiA+Pj4+PiBwYXBlciBmcm9tDQo+ID4+Pj4gSmFz
b24gZ2F2ZSBhIGdvb2QgZGlyZWN0aW9uIG9mIGRvaW5nIF9yaWdodF8gbmVzdGluZyB0aGF0IGZv
bGxvd3MNCj4gPj4+PiB0d28NCj4gPj4gcHJpbmNpcGxlcy4NCj4gPj4+Pj4gYS4gZWZmaWNpZW5j
eSBwcm9wZXJ0eQ0KPiA+Pj4+PiBiLiBlcXVpdmFsZW5jZSBwcm9wZXJ0eQ0KPiA+Pj4+Pg0KPiA+
Pj4+PiAoYy4gcmVzb3VyY2UgY29udHJvbCBpcyBuYXR1cmFsIGFscmVhZHkpDQo+ID4+Pj4+DQo+
ID4+Pj4+IEJvdGggYXBwbHkgYXQgVk1NIGFuZCBhdCBWTSBsZXZlbCBlbmFibGluZyByZWN1cnNp
dmUNCj4gPj4+Pj4gdmlydHVhbGl6YXRpb24sIGJ5DQo+ID4+Pj4gaGF2aW5nIFZGIHRoYXQgY2Fu
IGFjdCBhcyBQRiBpbnNpZGUgdGhlIGd1ZXN0Lg0KPiA+Pj4+PiBbMV0gaHR0cHM6Ly9kbC5hY20u
b3JnL2RvaS9wZGYvMTAuMTE0NS8zNjEwMTEuMzYxMDczDQo+ID4+Pj4gUGxlYXNlIGp1c3Qgc2hv
dyBtZSB5b3VyIHBhdGNoIHJlc29sdmluZyB0aGVzZSBvcGVucywgaG93IGFib3V0DQo+ID4+Pj4g
c3RhcnQgZnJvbSBkZWZpbmluZyB2aXJpdG8tZnMgZGV2aWNlIGNvbnRleHQgYW5kIHlvdXIgbWFu
YWdlbWVudCBWRj8NCj4gPj4+IEFzIGFuc3dlcmVkLCBkZXZpY2UgY29udGV4dCBpbmZyYXN0cnVj
dHVyZSBpcyBkb25lLCBwZXIgZGV2aWNlDQo+ID4+PiBzcGVjaWZpYyBkZXZpY2UtDQo+ID4+IGNv
bnRleHQgd2lsbCBiZSBkZWZpbmVkIGluY3JlbWVudGFsbHkuDQo+ID4+PiBJIHdpbGwgbm90IGJl
IGluY2x1ZGluZyB2aXJ0aW8tZnMgaW4gdGhpcyBzZXJpZXMuIEl0IHdpbGwgYmUgZG9uZQ0KPiA+
Pj4gaW5jcmVtZW50YWxseSBpbg0KPiA+PiBmdXR1cmUgdXRpbGl6aW5nIHRoZSBpbmZyYXN0cnVj
dHVyZSBidWlsZCBpbiB0aGlzIHNlcmllcy4NCj4gPj4gRG9uZT8gSG93IGRvIHlvdSBjb25jbHVk
ZSB0aGlzPyBZb3UganVzdCB0ZWxsIG1lIHdoYXQgaXMgdGhlIGZ1bGwgc2V0DQo+ID4+IG9mIHZp
cml0by1mcyBkZXZpY2UgY29udGV4dCBub3cgYW5kIGhvdyB0byBtaWdyYXRlIHRoZW0uDQo+ID4+
DQo+ID4+IFlvdSBjYW50PyB5b3UgcmVmdXNlIG9yIHlvdSBkb24ndD8gRG8geW91IGV4cGVjdCB0
aGUgSFcgZGVzaWduZXIgdG8NCj4gPj4gZmlndXJlIG91dCBieSB0aGVtc2VsZj8NCj4gPiBJIHdv
bnQgYmUgYWJsZSB0byB0ZWxsIG5vdyBhcyBJIGRvbuKAmXQgdGhpbmsgaXQgaXMgbmVjZXNzYXJ5
IGZvciB0aGlzIHNlcmllcy4NCj4gPiBJZiBvbmUgb3V0IG9mIDMwIGRldmljZXMgY2Fubm90IG1p
Z3JhdGUgYmVjYXVzZSBvZiB1bmltYWdpbmFibGUgYW1vdW50IG9mDQo+IGNvbXBsZXhpdHkgaGFz
IGJlZW4gcGxhY2VkIHRoZXJlLCBtYXkgYmUgb25lIHdpbGwgbm90IGltcGxlbWVudCBpdCBhcyBt
ZW1iZXINCj4gZGV2aWNlLg0KPiA+DQo+ID4gIEZyb20gZXhwZXJpZW5jZSBvZiBtaWdyYXRhYmxl
IGNvbXBsZXggZ3B1IGRldmljZXMsIHJkbWEgZGV2aWNlcyAoc3RhdGVmdWwNCj4gaGF2aW5nIGh1
bmRyZWQgdGhvdXNhbmQgb2Ygc3RhdGVmdWwgUVBzKSwgbXkgdW5kZXJzdGFuZGluZyBpcyBjb21w
bGV4IHN0YXRlIG9mDQo+IHZpcnRpby1mcyBjYW4gYmUgZGVmaW5lZCBhbmQgbWlncmF0YWJsZS4N
Cj4gPiBNbHg1IGRyaXZlciBjb25zaXN0IG9mIDE1MCwwMDAgbGluZXMgb2YgY29kZSBhbmQgdGhh
dCBkZXZpY2UgaXMgbWlncmF0YWJsZQ0KPiB3aXRoIGNvbXBsZXggc3RhdGUuDQo+ID4gU28gSSBh
bSBvcHRpbWlzdGljIHRoYXQgdmlydGlvLWZzIGNhbiBiZSBtaWdyYXRhYmxlIHRvby4NCj4gPiBJ
dCBkb2VzIG5vdCBoYXZlIHRvIGxpbWl0ZWQgYnkgbXkgbGltaXRlZCBjcmVhdGl2aXR5IG9mIDIw
MjMuDQo+ID4gTWF5IGJlIEkgYW0gd3JvbmcsIGluIHRoYXQgY2FzZSBvbmUgd2lsbCBub3QgaW1w
bGVtZW50IHBhc3N0aHJvdWdoIHZpcnRpby1mcw0KPiBkZXZpY2UuDQo+IHlvdXIgc2VyaWVzIHdh
bnRzIHRvIG1pZ3JhdGUgZGV2aWNlIGNvbnRleHQsIGJ1dCBkb2Vzbid0IGRlZmluZSBkZXZpY2Ug
Y29udGV4dCwNCj4gZG9lcyB0aGlzIHNvdW5kcyByZWFzb25hYmxlPw0KDQpEZXZpY2UgZ2VuZXJp
YyBjb250ZXh0IGlzIGRlZmluZWQgYXQgWzFdIGFuZCBhbHNvIHRoZSBpbmZyYXN0cnVjdHVyZSBm
b3IgZGVmaW5pbmcgdGhlIGRldmljZSBjb250ZXh0IGluIHBhcmFsbGVsIGJ5IG11bHRpcGxlIHBl
b3BsZSBjYW4gYmUgZG9uZSBwb3N0IHRoZSB3b3JrIG9mIFsxXS4NCg0KUGVyIGVhY2ggZGV2aWNl
IHR5cGUgY29udGV4dCB3aWxsIGJlIGRlZmluZWQgaW5jcmVtZW50YWxseSBwb3N0IHRoaXMgd29y
ay4NCg0KWzFdIGh0dHBzOi8vbGlzdHMub2FzaXMtb3Blbi5vcmcvYXJjaGl2ZXMvdmlydGlvLWNv
bW1lbnQvMjAyMzEwL21zZzAwMTkwLmh0bWwNCg==

